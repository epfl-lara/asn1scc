; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28752 () Bool)

(assert start!28752)

(declare-fun b!148838 () Bool)

(declare-fun e!99327 () Bool)

(declare-datatypes ((array!6674 0))(
  ( (array!6675 (arr!3803 (Array (_ BitVec 32) (_ BitVec 8))) (size!3019 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5296 0))(
  ( (BitStream!5297 (buf!3494 array!6674) (currentByte!6408 (_ BitVec 32)) (currentBit!6403 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5296)

(declare-datatypes ((Unit!9429 0))(
  ( (Unit!9430) )
))
(declare-datatypes ((tuple2!13230 0))(
  ( (tuple2!13231 (_1!6979 Unit!9429) (_2!6979 BitStream!5296)) )
))
(declare-fun lt!232128 () tuple2!13230)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148838 (= e!99327 (invariant!0 (currentBit!6403 thiss!1634) (currentByte!6408 thiss!1634) (size!3019 (buf!3494 (_2!6979 lt!232128)))))))

(declare-fun b!148839 () Bool)

(declare-datatypes ((tuple2!13232 0))(
  ( (tuple2!13233 (_1!6980 BitStream!5296) (_2!6980 BitStream!5296)) )
))
(declare-fun lt!232126 () tuple2!13232)

(declare-datatypes ((tuple2!13234 0))(
  ( (tuple2!13235 (_1!6981 BitStream!5296) (_2!6981 (_ BitVec 8))) )
))
(declare-fun lt!232122 () tuple2!13234)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun e!99326 () Bool)

(declare-fun arr!237 () array!6674)

(assert (=> b!148839 (= e!99326 (and (= (_2!6981 lt!232122) (select (arr!3803 arr!237) from!447)) (= (_1!6981 lt!232122) (_2!6980 lt!232126))))))

(declare-fun readBytePure!0 (BitStream!5296) tuple2!13234)

(assert (=> b!148839 (= lt!232122 (readBytePure!0 (_1!6980 lt!232126)))))

(declare-fun reader!0 (BitStream!5296 BitStream!5296) tuple2!13232)

(assert (=> b!148839 (= lt!232126 (reader!0 thiss!1634 (_2!6979 lt!232128)))))

(declare-fun b!148840 () Bool)

(declare-fun e!99318 () Bool)

(declare-fun e!99321 () Bool)

(assert (=> b!148840 (= e!99318 e!99321)))

(declare-fun res!124618 () Bool)

(assert (=> b!148840 (=> (not res!124618) (not e!99321))))

(declare-fun lt!232124 () tuple2!13230)

(declare-fun lt!232108 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!148840 (= res!124618 (= (bitIndex!0 (size!3019 (buf!3494 (_2!6979 lt!232124))) (currentByte!6408 (_2!6979 lt!232124)) (currentBit!6403 (_2!6979 lt!232124))) (bvadd (bitIndex!0 (size!3019 (buf!3494 (_2!6979 lt!232128))) (currentByte!6408 (_2!6979 lt!232128)) (currentBit!6403 (_2!6979 lt!232128))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!232108))))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!148840 (= lt!232108 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!148841 () Bool)

(declare-fun e!99324 () Bool)

(assert (=> b!148841 (= e!99321 (not e!99324))))

(declare-fun res!124608 () Bool)

(assert (=> b!148841 (=> res!124608 e!99324)))

(declare-fun lt!232129 () tuple2!13232)

(declare-datatypes ((tuple2!13236 0))(
  ( (tuple2!13237 (_1!6982 BitStream!5296) (_2!6982 array!6674)) )
))
(declare-fun lt!232125 () tuple2!13236)

(assert (=> b!148841 (= res!124608 (or (not (= (size!3019 (_2!6982 lt!232125)) (size!3019 arr!237))) (not (= (_1!6982 lt!232125) (_2!6980 lt!232129)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5296 array!6674 (_ BitVec 32) (_ BitVec 32)) tuple2!13236)

(assert (=> b!148841 (= lt!232125 (readByteArrayLoopPure!0 (_1!6980 lt!232129) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!148841 (validate_offset_bits!1 ((_ sign_extend 32) (size!3019 (buf!3494 (_2!6979 lt!232124)))) ((_ sign_extend 32) (currentByte!6408 (_2!6979 lt!232128))) ((_ sign_extend 32) (currentBit!6403 (_2!6979 lt!232128))) lt!232108)))

(declare-fun lt!232119 () Unit!9429)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5296 array!6674 (_ BitVec 64)) Unit!9429)

(assert (=> b!148841 (= lt!232119 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6979 lt!232128) (buf!3494 (_2!6979 lt!232124)) lt!232108))))

(assert (=> b!148841 (= lt!232129 (reader!0 (_2!6979 lt!232128) (_2!6979 lt!232124)))))

(declare-fun b!148842 () Bool)

(declare-fun res!124610 () Bool)

(declare-fun e!99325 () Bool)

(assert (=> b!148842 (=> (not res!124610) (not e!99325))))

(assert (=> b!148842 (= res!124610 (invariant!0 (currentBit!6403 thiss!1634) (currentByte!6408 thiss!1634) (size!3019 (buf!3494 thiss!1634))))))

(declare-fun b!148843 () Bool)

(declare-fun res!124617 () Bool)

(assert (=> b!148843 (=> (not res!124617) (not e!99326))))

(declare-fun isPrefixOf!0 (BitStream!5296 BitStream!5296) Bool)

(assert (=> b!148843 (= res!124617 (isPrefixOf!0 thiss!1634 (_2!6979 lt!232128)))))

(declare-fun b!148845 () Bool)

(declare-fun e!99323 () Bool)

(declare-fun e!99322 () Bool)

(assert (=> b!148845 (= e!99323 e!99322)))

(declare-fun res!124620 () Bool)

(assert (=> b!148845 (=> res!124620 e!99322)))

(declare-fun lt!232112 () tuple2!13236)

(declare-fun lt!232107 () tuple2!13236)

(assert (=> b!148845 (= res!124620 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt (size!3019 arr!237) (size!3019 (_2!6982 lt!232107))) (bvsgt (size!3019 (_2!6982 lt!232107)) (size!3019 (_2!6982 lt!232112))) (bvsgt to!404 (size!3019 (_2!6982 lt!232107)))))))

(declare-fun arrayRangesEq!335 (array!6674 array!6674 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148845 (arrayRangesEq!335 (_2!6982 lt!232107) (_2!6982 lt!232112) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232131 () Unit!9429)

(declare-fun arrayRangesEqSymmetricLemma!67 (array!6674 array!6674 (_ BitVec 32) (_ BitVec 32)) Unit!9429)

(assert (=> b!148845 (= lt!232131 (arrayRangesEqSymmetricLemma!67 (_2!6982 lt!232112) (_2!6982 lt!232107) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148846 () Bool)

(declare-fun res!124621 () Bool)

(assert (=> b!148846 (=> (not res!124621) (not e!99325))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!148846 (= res!124621 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3019 (buf!3494 thiss!1634))) ((_ sign_extend 32) (currentByte!6408 thiss!1634)) ((_ sign_extend 32) (currentBit!6403 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!148847 () Bool)

(declare-fun e!99328 () Bool)

(declare-fun array_inv!2808 (array!6674) Bool)

(assert (=> b!148847 (= e!99328 (array_inv!2808 (buf!3494 thiss!1634)))))

(declare-fun b!148848 () Bool)

(assert (=> b!148848 (= e!99325 (not e!99323))))

(declare-fun res!124619 () Bool)

(assert (=> b!148848 (=> res!124619 e!99323)))

(assert (=> b!148848 (= res!124619 (not (arrayRangesEq!335 (_2!6982 lt!232112) (_2!6982 lt!232107) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!232110 () tuple2!13236)

(assert (=> b!148848 (arrayRangesEq!335 (_2!6982 lt!232112) (_2!6982 lt!232110) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232106 () tuple2!13232)

(declare-fun lt!232113 () Unit!9429)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5296 array!6674 (_ BitVec 32) (_ BitVec 32)) Unit!9429)

(assert (=> b!148848 (= lt!232113 (readByteArrayLoopArrayPrefixLemma!0 (_1!6980 lt!232106) arr!237 from!447 to!404))))

(declare-fun lt!232130 () array!6674)

(declare-fun withMovedByteIndex!0 (BitStream!5296 (_ BitVec 32)) BitStream!5296)

(assert (=> b!148848 (= lt!232110 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6980 lt!232106) #b00000000000000000000000000000001) lt!232130 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232109 () tuple2!13232)

(assert (=> b!148848 (= lt!232107 (readByteArrayLoopPure!0 (_1!6980 lt!232109) lt!232130 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232111 () tuple2!13234)

(assert (=> b!148848 (= lt!232130 (array!6675 (store (arr!3803 arr!237) from!447 (_2!6981 lt!232111)) (size!3019 arr!237)))))

(declare-fun lt!232127 () (_ BitVec 32))

(assert (=> b!148848 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3019 (buf!3494 (_2!6979 lt!232124)))) ((_ sign_extend 32) (currentByte!6408 (_2!6979 lt!232128))) ((_ sign_extend 32) (currentBit!6403 (_2!6979 lt!232128))) lt!232127)))

(declare-fun lt!232123 () Unit!9429)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5296 array!6674 (_ BitVec 32)) Unit!9429)

(assert (=> b!148848 (= lt!232123 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6979 lt!232128) (buf!3494 (_2!6979 lt!232124)) lt!232127))))

(assert (=> b!148848 (= (_1!6982 lt!232112) (_2!6980 lt!232106))))

(assert (=> b!148848 (= lt!232112 (readByteArrayLoopPure!0 (_1!6980 lt!232106) arr!237 from!447 to!404))))

(assert (=> b!148848 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3019 (buf!3494 (_2!6979 lt!232124)))) ((_ sign_extend 32) (currentByte!6408 thiss!1634)) ((_ sign_extend 32) (currentBit!6403 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!232114 () Unit!9429)

(assert (=> b!148848 (= lt!232114 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3494 (_2!6979 lt!232124)) (bvsub to!404 from!447)))))

(assert (=> b!148848 (= (_2!6981 lt!232111) (select (arr!3803 arr!237) from!447))))

(assert (=> b!148848 (= lt!232111 (readBytePure!0 (_1!6980 lt!232106)))))

(assert (=> b!148848 (= lt!232109 (reader!0 (_2!6979 lt!232128) (_2!6979 lt!232124)))))

(assert (=> b!148848 (= lt!232106 (reader!0 thiss!1634 (_2!6979 lt!232124)))))

(declare-fun e!99317 () Bool)

(assert (=> b!148848 e!99317))

(declare-fun res!124611 () Bool)

(assert (=> b!148848 (=> (not res!124611) (not e!99317))))

(declare-fun lt!232118 () tuple2!13234)

(declare-fun lt!232115 () tuple2!13234)

(assert (=> b!148848 (= res!124611 (= (bitIndex!0 (size!3019 (buf!3494 (_1!6981 lt!232118))) (currentByte!6408 (_1!6981 lt!232118)) (currentBit!6403 (_1!6981 lt!232118))) (bitIndex!0 (size!3019 (buf!3494 (_1!6981 lt!232115))) (currentByte!6408 (_1!6981 lt!232115)) (currentBit!6403 (_1!6981 lt!232115)))))))

(declare-fun lt!232121 () Unit!9429)

(declare-fun lt!232116 () BitStream!5296)

(declare-fun readBytePrefixLemma!0 (BitStream!5296 BitStream!5296) Unit!9429)

(assert (=> b!148848 (= lt!232121 (readBytePrefixLemma!0 lt!232116 (_2!6979 lt!232124)))))

(assert (=> b!148848 (= lt!232115 (readBytePure!0 (BitStream!5297 (buf!3494 (_2!6979 lt!232124)) (currentByte!6408 thiss!1634) (currentBit!6403 thiss!1634))))))

(assert (=> b!148848 (= lt!232118 (readBytePure!0 lt!232116))))

(assert (=> b!148848 (= lt!232116 (BitStream!5297 (buf!3494 (_2!6979 lt!232128)) (currentByte!6408 thiss!1634) (currentBit!6403 thiss!1634)))))

(assert (=> b!148848 e!99327))

(declare-fun res!124622 () Bool)

(assert (=> b!148848 (=> (not res!124622) (not e!99327))))

(assert (=> b!148848 (= res!124622 (isPrefixOf!0 thiss!1634 (_2!6979 lt!232124)))))

(declare-fun lt!232120 () Unit!9429)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5296 BitStream!5296 BitStream!5296) Unit!9429)

(assert (=> b!148848 (= lt!232120 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6979 lt!232128) (_2!6979 lt!232124)))))

(assert (=> b!148848 e!99318))

(declare-fun res!124615 () Bool)

(assert (=> b!148848 (=> (not res!124615) (not e!99318))))

(assert (=> b!148848 (= res!124615 (= (size!3019 (buf!3494 (_2!6979 lt!232128))) (size!3019 (buf!3494 (_2!6979 lt!232124)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5296 array!6674 (_ BitVec 32) (_ BitVec 32)) tuple2!13230)

(assert (=> b!148848 (= lt!232124 (appendByteArrayLoop!0 (_2!6979 lt!232128) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!148848 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3019 (buf!3494 (_2!6979 lt!232128)))) ((_ sign_extend 32) (currentByte!6408 (_2!6979 lt!232128))) ((_ sign_extend 32) (currentBit!6403 (_2!6979 lt!232128))) lt!232127)))

(assert (=> b!148848 (= lt!232127 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!232117 () Unit!9429)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5296 BitStream!5296 (_ BitVec 64) (_ BitVec 32)) Unit!9429)

(assert (=> b!148848 (= lt!232117 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6979 lt!232128) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!148848 e!99326))

(declare-fun res!124616 () Bool)

(assert (=> b!148848 (=> (not res!124616) (not e!99326))))

(assert (=> b!148848 (= res!124616 (= (size!3019 (buf!3494 thiss!1634)) (size!3019 (buf!3494 (_2!6979 lt!232128)))))))

(declare-fun appendByte!0 (BitStream!5296 (_ BitVec 8)) tuple2!13230)

(assert (=> b!148848 (= lt!232128 (appendByte!0 thiss!1634 (select (arr!3803 arr!237) from!447)))))

(declare-fun b!148849 () Bool)

(assert (=> b!148849 (= e!99324 (not (arrayRangesEq!335 arr!237 (_2!6982 lt!232125) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!148850 () Bool)

(declare-fun res!124613 () Bool)

(assert (=> b!148850 (=> (not res!124613) (not e!99321))))

(assert (=> b!148850 (= res!124613 (isPrefixOf!0 (_2!6979 lt!232128) (_2!6979 lt!232124)))))

(declare-fun b!148851 () Bool)

(assert (=> b!148851 (= e!99322 (arrayRangesEq!335 arr!237 (_2!6982 lt!232107) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148844 () Bool)

(declare-fun res!124612 () Bool)

(assert (=> b!148844 (=> (not res!124612) (not e!99326))))

(assert (=> b!148844 (= res!124612 (= (bitIndex!0 (size!3019 (buf!3494 (_2!6979 lt!232128))) (currentByte!6408 (_2!6979 lt!232128)) (currentBit!6403 (_2!6979 lt!232128))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3019 (buf!3494 thiss!1634)) (currentByte!6408 thiss!1634) (currentBit!6403 thiss!1634)))))))

(declare-fun res!124609 () Bool)

(assert (=> start!28752 (=> (not res!124609) (not e!99325))))

(assert (=> start!28752 (= res!124609 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3019 arr!237))))))

(assert (=> start!28752 e!99325))

(assert (=> start!28752 true))

(assert (=> start!28752 (array_inv!2808 arr!237)))

(declare-fun inv!12 (BitStream!5296) Bool)

(assert (=> start!28752 (and (inv!12 thiss!1634) e!99328)))

(declare-fun b!148852 () Bool)

(assert (=> b!148852 (= e!99317 (= (_2!6981 lt!232118) (_2!6981 lt!232115)))))

(declare-fun b!148853 () Bool)

(declare-fun res!124614 () Bool)

(assert (=> b!148853 (=> (not res!124614) (not e!99325))))

(assert (=> b!148853 (= res!124614 (bvslt from!447 to!404))))

(assert (= (and start!28752 res!124609) b!148846))

(assert (= (and b!148846 res!124621) b!148853))

(assert (= (and b!148853 res!124614) b!148842))

(assert (= (and b!148842 res!124610) b!148848))

(assert (= (and b!148848 res!124616) b!148844))

(assert (= (and b!148844 res!124612) b!148843))

(assert (= (and b!148843 res!124617) b!148839))

(assert (= (and b!148848 res!124615) b!148840))

(assert (= (and b!148840 res!124618) b!148850))

(assert (= (and b!148850 res!124613) b!148841))

(assert (= (and b!148841 (not res!124608)) b!148849))

(assert (= (and b!148848 res!124622) b!148838))

(assert (= (and b!148848 res!124611) b!148852))

(assert (= (and b!148848 (not res!124619)) b!148845))

(assert (= (and b!148845 (not res!124620)) b!148851))

(assert (= start!28752 b!148847))

(declare-fun m!231297 () Bool)

(assert (=> start!28752 m!231297))

(declare-fun m!231299 () Bool)

(assert (=> start!28752 m!231299))

(declare-fun m!231301 () Bool)

(assert (=> b!148846 m!231301))

(declare-fun m!231303 () Bool)

(assert (=> b!148839 m!231303))

(declare-fun m!231305 () Bool)

(assert (=> b!148839 m!231305))

(declare-fun m!231307 () Bool)

(assert (=> b!148839 m!231307))

(declare-fun m!231309 () Bool)

(assert (=> b!148848 m!231309))

(declare-fun m!231311 () Bool)

(assert (=> b!148848 m!231311))

(declare-fun m!231313 () Bool)

(assert (=> b!148848 m!231313))

(declare-fun m!231315 () Bool)

(assert (=> b!148848 m!231315))

(declare-fun m!231317 () Bool)

(assert (=> b!148848 m!231317))

(declare-fun m!231319 () Bool)

(assert (=> b!148848 m!231319))

(declare-fun m!231321 () Bool)

(assert (=> b!148848 m!231321))

(declare-fun m!231323 () Bool)

(assert (=> b!148848 m!231323))

(declare-fun m!231325 () Bool)

(assert (=> b!148848 m!231325))

(assert (=> b!148848 m!231303))

(declare-fun m!231327 () Bool)

(assert (=> b!148848 m!231327))

(assert (=> b!148848 m!231303))

(declare-fun m!231329 () Bool)

(assert (=> b!148848 m!231329))

(declare-fun m!231331 () Bool)

(assert (=> b!148848 m!231331))

(declare-fun m!231333 () Bool)

(assert (=> b!148848 m!231333))

(declare-fun m!231335 () Bool)

(assert (=> b!148848 m!231335))

(declare-fun m!231337 () Bool)

(assert (=> b!148848 m!231337))

(declare-fun m!231339 () Bool)

(assert (=> b!148848 m!231339))

(assert (=> b!148848 m!231333))

(declare-fun m!231341 () Bool)

(assert (=> b!148848 m!231341))

(declare-fun m!231343 () Bool)

(assert (=> b!148848 m!231343))

(declare-fun m!231345 () Bool)

(assert (=> b!148848 m!231345))

(declare-fun m!231347 () Bool)

(assert (=> b!148848 m!231347))

(declare-fun m!231349 () Bool)

(assert (=> b!148848 m!231349))

(declare-fun m!231351 () Bool)

(assert (=> b!148848 m!231351))

(declare-fun m!231353 () Bool)

(assert (=> b!148848 m!231353))

(declare-fun m!231355 () Bool)

(assert (=> b!148848 m!231355))

(declare-fun m!231357 () Bool)

(assert (=> b!148848 m!231357))

(declare-fun m!231359 () Bool)

(assert (=> b!148848 m!231359))

(declare-fun m!231361 () Bool)

(assert (=> b!148840 m!231361))

(declare-fun m!231363 () Bool)

(assert (=> b!148840 m!231363))

(declare-fun m!231365 () Bool)

(assert (=> b!148850 m!231365))

(declare-fun m!231367 () Bool)

(assert (=> b!148842 m!231367))

(declare-fun m!231369 () Bool)

(assert (=> b!148843 m!231369))

(declare-fun m!231371 () Bool)

(assert (=> b!148847 m!231371))

(declare-fun m!231373 () Bool)

(assert (=> b!148838 m!231373))

(declare-fun m!231375 () Bool)

(assert (=> b!148841 m!231375))

(declare-fun m!231377 () Bool)

(assert (=> b!148841 m!231377))

(declare-fun m!231379 () Bool)

(assert (=> b!148841 m!231379))

(assert (=> b!148841 m!231339))

(declare-fun m!231381 () Bool)

(assert (=> b!148849 m!231381))

(declare-fun m!231383 () Bool)

(assert (=> b!148845 m!231383))

(declare-fun m!231385 () Bool)

(assert (=> b!148845 m!231385))

(assert (=> b!148844 m!231363))

(declare-fun m!231387 () Bool)

(assert (=> b!148844 m!231387))

(declare-fun m!231389 () Bool)

(assert (=> b!148851 m!231389))

(push 1)

(assert (not b!148842))

(assert (not b!148846))

(assert (not b!148840))

(assert (not b!148851))

(assert (not b!148845))

(assert (not b!148849))

(assert (not b!148847))

(assert (not start!28752))

(assert (not b!148843))

(assert (not b!148850))

(assert (not b!148848))

(assert (not b!148841))

(assert (not b!148844))

(assert (not b!148838))

(assert (not b!148839))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

