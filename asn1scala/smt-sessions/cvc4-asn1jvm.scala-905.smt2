; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25508 () Bool)

(assert start!25508)

(declare-fun b!129377 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!85752 () Bool)

(declare-datatypes ((array!5993 0))(
  ( (array!5994 (arr!3329 (Array (_ BitVec 32) (_ BitVec 8))) (size!2712 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5993)

(declare-datatypes ((BitStream!4688 0))(
  ( (BitStream!4689 (buf!3070 array!5993) (currentByte!5831 (_ BitVec 32)) (currentBit!5826 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11054 0))(
  ( (tuple2!11055 (_1!5824 BitStream!4688) (_2!5824 array!5993)) )
))
(declare-fun lt!200011 () tuple2!11054)

(declare-fun arrayRangesEq!115 (array!5993 array!5993 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129377 (= e!85752 (not (arrayRangesEq!115 arr!237 (_2!5824 lt!200011) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129378 () Bool)

(declare-fun e!85753 () Bool)

(declare-fun e!85754 () Bool)

(assert (=> b!129378 (= e!85753 (not e!85754))))

(declare-fun res!107138 () Bool)

(assert (=> b!129378 (=> res!107138 e!85754)))

(declare-fun lt!200010 () (_ BitVec 64))

(declare-datatypes ((Unit!8029 0))(
  ( (Unit!8030) )
))
(declare-datatypes ((tuple2!11056 0))(
  ( (tuple2!11057 (_1!5825 Unit!8029) (_2!5825 BitStream!4688)) )
))
(declare-fun lt!200013 () tuple2!11056)

(assert (=> b!129378 (= res!107138 (bvsgt lt!200010 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2712 (buf!3070 (_2!5825 lt!200013)))))))))

(declare-fun thiss!1634 () BitStream!4688)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129378 (= lt!200010 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2712 (buf!3070 (_2!5825 lt!200013))) (currentByte!5831 thiss!1634) (currentBit!5826 thiss!1634))))))

(declare-fun e!85758 () Bool)

(assert (=> b!129378 e!85758))

(declare-fun res!107149 () Bool)

(assert (=> b!129378 (=> (not res!107149) (not e!85758))))

(declare-fun lt!200012 () tuple2!11056)

(declare-fun isPrefixOf!0 (BitStream!4688 BitStream!4688) Bool)

(assert (=> b!129378 (= res!107149 (isPrefixOf!0 thiss!1634 (_2!5825 lt!200012)))))

(declare-fun lt!200009 () Unit!8029)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4688 BitStream!4688 BitStream!4688) Unit!8029)

(assert (=> b!129378 (= lt!200009 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5825 lt!200013) (_2!5825 lt!200012)))))

(declare-fun e!85757 () Bool)

(assert (=> b!129378 e!85757))

(declare-fun res!107140 () Bool)

(assert (=> b!129378 (=> (not res!107140) (not e!85757))))

(assert (=> b!129378 (= res!107140 (= (size!2712 (buf!3070 (_2!5825 lt!200013))) (size!2712 (buf!3070 (_2!5825 lt!200012)))))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!4688 array!5993 (_ BitVec 32) (_ BitVec 32)) tuple2!11056)

(assert (=> b!129378 (= lt!200012 (appendByteArrayLoop!0 (_2!5825 lt!200013) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129378 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2712 (buf!3070 (_2!5825 lt!200013)))) ((_ sign_extend 32) (currentByte!5831 (_2!5825 lt!200013))) ((_ sign_extend 32) (currentBit!5826 (_2!5825 lt!200013))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200004 () Unit!8029)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4688 BitStream!4688 (_ BitVec 64) (_ BitVec 32)) Unit!8029)

(assert (=> b!129378 (= lt!200004 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5825 lt!200013) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!85751 () Bool)

(assert (=> b!129378 e!85751))

(declare-fun res!107139 () Bool)

(assert (=> b!129378 (=> (not res!107139) (not e!85751))))

(assert (=> b!129378 (= res!107139 (= (size!2712 (buf!3070 thiss!1634)) (size!2712 (buf!3070 (_2!5825 lt!200013)))))))

(declare-fun appendByte!0 (BitStream!4688 (_ BitVec 8)) tuple2!11056)

(assert (=> b!129378 (= lt!200013 (appendByte!0 thiss!1634 (select (arr!3329 arr!237) from!447)))))

(declare-fun b!129379 () Bool)

(declare-fun res!107144 () Bool)

(assert (=> b!129379 (=> (not res!107144) (not e!85753))))

(assert (=> b!129379 (= res!107144 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2712 (buf!3070 thiss!1634))) ((_ sign_extend 32) (currentByte!5831 thiss!1634)) ((_ sign_extend 32) (currentBit!5826 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129380 () Bool)

(declare-fun res!107147 () Bool)

(declare-fun e!85759 () Bool)

(assert (=> b!129380 (=> (not res!107147) (not e!85759))))

(assert (=> b!129380 (= res!107147 (isPrefixOf!0 (_2!5825 lt!200013) (_2!5825 lt!200012)))))

(declare-fun b!129381 () Bool)

(assert (=> b!129381 (= e!85757 e!85759)))

(declare-fun res!107151 () Bool)

(assert (=> b!129381 (=> (not res!107151) (not e!85759))))

(declare-fun lt!200003 () (_ BitVec 64))

(assert (=> b!129381 (= res!107151 (= (bitIndex!0 (size!2712 (buf!3070 (_2!5825 lt!200012))) (currentByte!5831 (_2!5825 lt!200012)) (currentBit!5826 (_2!5825 lt!200012))) (bvadd (bitIndex!0 (size!2712 (buf!3070 (_2!5825 lt!200013))) (currentByte!5831 (_2!5825 lt!200013)) (currentBit!5826 (_2!5825 lt!200013))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200003))))))

(assert (=> b!129381 (= lt!200003 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!107142 () Bool)

(assert (=> start!25508 (=> (not res!107142) (not e!85753))))

(assert (=> start!25508 (= res!107142 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2712 arr!237))))))

(assert (=> start!25508 e!85753))

(assert (=> start!25508 true))

(declare-fun array_inv!2501 (array!5993) Bool)

(assert (=> start!25508 (array_inv!2501 arr!237)))

(declare-fun e!85756 () Bool)

(declare-fun inv!12 (BitStream!4688) Bool)

(assert (=> start!25508 (and (inv!12 thiss!1634) e!85756)))

(declare-fun b!129382 () Bool)

(assert (=> b!129382 (= e!85754 true)))

(declare-datatypes ((tuple2!11058 0))(
  ( (tuple2!11059 (_1!5826 BitStream!4688) (_2!5826 (_ BitVec 8))) )
))
(declare-fun lt!200005 () tuple2!11058)

(declare-fun readBytePure!0 (BitStream!4688) tuple2!11058)

(assert (=> b!129382 (= lt!200005 (readBytePure!0 (BitStream!4689 (buf!3070 (_2!5825 lt!200012)) (currentByte!5831 thiss!1634) (currentBit!5826 thiss!1634))))))

(declare-fun lt!200008 () tuple2!11058)

(assert (=> b!129382 (= lt!200008 (readBytePure!0 (BitStream!4689 (buf!3070 (_2!5825 lt!200013)) (currentByte!5831 thiss!1634) (currentBit!5826 thiss!1634))))))

(declare-fun b!129383 () Bool)

(assert (=> b!129383 (= e!85756 (array_inv!2501 (buf!3070 thiss!1634)))))

(declare-fun b!129384 () Bool)

(assert (=> b!129384 (= e!85759 (not e!85752))))

(declare-fun res!107143 () Bool)

(assert (=> b!129384 (=> res!107143 e!85752)))

(declare-datatypes ((tuple2!11060 0))(
  ( (tuple2!11061 (_1!5827 BitStream!4688) (_2!5827 BitStream!4688)) )
))
(declare-fun lt!200015 () tuple2!11060)

(assert (=> b!129384 (= res!107143 (or (not (= (size!2712 (_2!5824 lt!200011)) (size!2712 arr!237))) (not (= (_1!5824 lt!200011) (_2!5827 lt!200015)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4688 array!5993 (_ BitVec 32) (_ BitVec 32)) tuple2!11054)

(assert (=> b!129384 (= lt!200011 (readByteArrayLoopPure!0 (_1!5827 lt!200015) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129384 (validate_offset_bits!1 ((_ sign_extend 32) (size!2712 (buf!3070 (_2!5825 lt!200012)))) ((_ sign_extend 32) (currentByte!5831 (_2!5825 lt!200013))) ((_ sign_extend 32) (currentBit!5826 (_2!5825 lt!200013))) lt!200003)))

(declare-fun lt!200014 () Unit!8029)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4688 array!5993 (_ BitVec 64)) Unit!8029)

(assert (=> b!129384 (= lt!200014 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5825 lt!200013) (buf!3070 (_2!5825 lt!200012)) lt!200003))))

(declare-fun reader!0 (BitStream!4688 BitStream!4688) tuple2!11060)

(assert (=> b!129384 (= lt!200015 (reader!0 (_2!5825 lt!200013) (_2!5825 lt!200012)))))

(declare-fun b!129385 () Bool)

(declare-fun res!107150 () Bool)

(assert (=> b!129385 (=> (not res!107150) (not e!85753))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129385 (= res!107150 (invariant!0 (currentBit!5826 thiss!1634) (currentByte!5831 thiss!1634) (size!2712 (buf!3070 thiss!1634))))))

(declare-fun b!129386 () Bool)

(declare-fun res!107146 () Bool)

(assert (=> b!129386 (=> (not res!107146) (not e!85753))))

(assert (=> b!129386 (= res!107146 (bvslt from!447 to!404))))

(declare-fun lt!200006 () tuple2!11058)

(declare-fun lt!200007 () tuple2!11060)

(declare-fun b!129387 () Bool)

(assert (=> b!129387 (= e!85751 (and (= (_2!5826 lt!200006) (select (arr!3329 arr!237) from!447)) (= (_1!5826 lt!200006) (_2!5827 lt!200007))))))

(assert (=> b!129387 (= lt!200006 (readBytePure!0 (_1!5827 lt!200007)))))

(assert (=> b!129387 (= lt!200007 (reader!0 thiss!1634 (_2!5825 lt!200013)))))

(declare-fun b!129388 () Bool)

(declare-fun res!107145 () Bool)

(assert (=> b!129388 (=> (not res!107145) (not e!85751))))

(assert (=> b!129388 (= res!107145 (= (bitIndex!0 (size!2712 (buf!3070 (_2!5825 lt!200013))) (currentByte!5831 (_2!5825 lt!200013)) (currentBit!5826 (_2!5825 lt!200013))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2712 (buf!3070 thiss!1634)) (currentByte!5831 thiss!1634) (currentBit!5826 thiss!1634)))))))

(declare-fun b!129389 () Bool)

(assert (=> b!129389 (= e!85758 (invariant!0 (currentBit!5826 thiss!1634) (currentByte!5831 thiss!1634) (size!2712 (buf!3070 (_2!5825 lt!200013)))))))

(declare-fun b!129390 () Bool)

(declare-fun res!107148 () Bool)

(assert (=> b!129390 (=> (not res!107148) (not e!85751))))

(assert (=> b!129390 (= res!107148 (isPrefixOf!0 thiss!1634 (_2!5825 lt!200013)))))

(declare-fun b!129391 () Bool)

(declare-fun res!107141 () Bool)

(assert (=> b!129391 (=> res!107141 e!85754)))

(assert (=> b!129391 (= res!107141 (bvsgt lt!200010 (bitIndex!0 (size!2712 (buf!3070 (_2!5825 lt!200012))) (currentByte!5831 (_2!5825 lt!200012)) (currentBit!5826 (_2!5825 lt!200012)))))))

(declare-fun b!129392 () Bool)

(declare-fun res!107152 () Bool)

(assert (=> b!129392 (=> res!107152 e!85754)))

(declare-fun arrayBitRangesEq!0 (array!5993 array!5993 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129392 (= res!107152 (not (arrayBitRangesEq!0 (buf!3070 (_2!5825 lt!200013)) (buf!3070 (_2!5825 lt!200012)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!200010)))))

(assert (= (and start!25508 res!107142) b!129379))

(assert (= (and b!129379 res!107144) b!129386))

(assert (= (and b!129386 res!107146) b!129385))

(assert (= (and b!129385 res!107150) b!129378))

(assert (= (and b!129378 res!107139) b!129388))

(assert (= (and b!129388 res!107145) b!129390))

(assert (= (and b!129390 res!107148) b!129387))

(assert (= (and b!129378 res!107140) b!129381))

(assert (= (and b!129381 res!107151) b!129380))

(assert (= (and b!129380 res!107147) b!129384))

(assert (= (and b!129384 (not res!107143)) b!129377))

(assert (= (and b!129378 res!107149) b!129389))

(assert (= (and b!129378 (not res!107138)) b!129391))

(assert (= (and b!129391 (not res!107141)) b!129392))

(assert (= (and b!129392 (not res!107152)) b!129382))

(assert (= start!25508 b!129383))

(declare-fun m!195201 () Bool)

(assert (=> b!129392 m!195201))

(declare-fun m!195203 () Bool)

(assert (=> b!129385 m!195203))

(declare-fun m!195205 () Bool)

(assert (=> b!129388 m!195205))

(declare-fun m!195207 () Bool)

(assert (=> b!129388 m!195207))

(declare-fun m!195209 () Bool)

(assert (=> b!129384 m!195209))

(declare-fun m!195211 () Bool)

(assert (=> b!129384 m!195211))

(declare-fun m!195213 () Bool)

(assert (=> b!129384 m!195213))

(declare-fun m!195215 () Bool)

(assert (=> b!129384 m!195215))

(declare-fun m!195217 () Bool)

(assert (=> b!129389 m!195217))

(declare-fun m!195219 () Bool)

(assert (=> b!129391 m!195219))

(declare-fun m!195221 () Bool)

(assert (=> b!129378 m!195221))

(declare-fun m!195223 () Bool)

(assert (=> b!129378 m!195223))

(declare-fun m!195225 () Bool)

(assert (=> b!129378 m!195225))

(declare-fun m!195227 () Bool)

(assert (=> b!129378 m!195227))

(declare-fun m!195229 () Bool)

(assert (=> b!129378 m!195229))

(declare-fun m!195231 () Bool)

(assert (=> b!129378 m!195231))

(declare-fun m!195233 () Bool)

(assert (=> b!129378 m!195233))

(assert (=> b!129378 m!195231))

(declare-fun m!195235 () Bool)

(assert (=> b!129378 m!195235))

(declare-fun m!195237 () Bool)

(assert (=> b!129380 m!195237))

(declare-fun m!195239 () Bool)

(assert (=> start!25508 m!195239))

(declare-fun m!195241 () Bool)

(assert (=> start!25508 m!195241))

(declare-fun m!195243 () Bool)

(assert (=> b!129379 m!195243))

(assert (=> b!129381 m!195219))

(assert (=> b!129381 m!195205))

(declare-fun m!195245 () Bool)

(assert (=> b!129382 m!195245))

(declare-fun m!195247 () Bool)

(assert (=> b!129382 m!195247))

(declare-fun m!195249 () Bool)

(assert (=> b!129383 m!195249))

(assert (=> b!129387 m!195231))

(declare-fun m!195251 () Bool)

(assert (=> b!129387 m!195251))

(declare-fun m!195253 () Bool)

(assert (=> b!129387 m!195253))

(declare-fun m!195255 () Bool)

(assert (=> b!129377 m!195255))

(declare-fun m!195257 () Bool)

(assert (=> b!129390 m!195257))

(push 1)

(assert (not b!129382))

(assert (not b!129378))

(assert (not b!129380))

(assert (not b!129392))

(assert (not b!129379))

(assert (not b!129385))

(assert (not b!129384))

(assert (not b!129391))

(assert (not b!129377))

(assert (not start!25508))

(assert (not b!129387))

(assert (not b!129390))

(assert (not b!129388))

(assert (not b!129381))

(assert (not b!129389))

(assert (not b!129383))

(check-sat)

