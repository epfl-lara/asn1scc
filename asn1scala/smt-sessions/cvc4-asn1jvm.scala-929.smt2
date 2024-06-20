; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26352 () Bool)

(assert start!26352)

(declare-fun b!134797 () Bool)

(declare-fun e!89446 () Bool)

(assert (=> b!134797 (= e!89446 (not true))))

(declare-datatypes ((array!6152 0))(
  ( (array!6153 (arr!3449 (Array (_ BitVec 32) (_ BitVec 8))) (size!2784 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4832 0))(
  ( (BitStream!4833 (buf!3177 array!6152) (currentByte!5974 (_ BitVec 32)) (currentBit!5969 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11668 0))(
  ( (tuple2!11669 (_1!6150 BitStream!4832) (_2!6150 array!6152)) )
))
(declare-fun lt!209135 () tuple2!11668)

(declare-fun lt!209120 () tuple2!11668)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arrayRangesEq!187 (array!6152 array!6152 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134797 (arrayRangesEq!187 (_2!6150 lt!209135) (_2!6150 lt!209120) #b00000000000000000000000000000000 to!404)))

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((Unit!8406 0))(
  ( (Unit!8407) )
))
(declare-fun lt!209119 () Unit!8406)

(declare-datatypes ((tuple2!11670 0))(
  ( (tuple2!11671 (_1!6151 BitStream!4832) (_2!6151 BitStream!4832)) )
))
(declare-fun lt!209131 () tuple2!11670)

(declare-fun arr!237 () array!6152)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4832 array!6152 (_ BitVec 32) (_ BitVec 32)) Unit!8406)

(assert (=> b!134797 (= lt!209119 (readByteArrayLoopArrayPrefixLemma!0 (_1!6151 lt!209131) arr!237 from!447 to!404))))

(declare-fun lt!209128 () array!6152)

(declare-fun readByteArrayLoopPure!0 (BitStream!4832 array!6152 (_ BitVec 32) (_ BitVec 32)) tuple2!11668)

(declare-fun withMovedByteIndex!0 (BitStream!4832 (_ BitVec 32)) BitStream!4832)

(assert (=> b!134797 (= lt!209120 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6151 lt!209131) #b00000000000000000000000000000001) lt!209128 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209129 () tuple2!11670)

(declare-fun lt!209137 () tuple2!11668)

(assert (=> b!134797 (= lt!209137 (readByteArrayLoopPure!0 (_1!6151 lt!209129) lt!209128 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11672 0))(
  ( (tuple2!11673 (_1!6152 BitStream!4832) (_2!6152 (_ BitVec 8))) )
))
(declare-fun lt!209130 () tuple2!11672)

(assert (=> b!134797 (= lt!209128 (array!6153 (store (arr!3449 arr!237) from!447 (_2!6152 lt!209130)) (size!2784 arr!237)))))

(declare-datatypes ((tuple2!11674 0))(
  ( (tuple2!11675 (_1!6153 Unit!8406) (_2!6153 BitStream!4832)) )
))
(declare-fun lt!209136 () tuple2!11674)

(declare-fun lt!209117 () tuple2!11674)

(declare-fun lt!209123 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134797 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2784 (buf!3177 (_2!6153 lt!209136)))) ((_ sign_extend 32) (currentByte!5974 (_2!6153 lt!209117))) ((_ sign_extend 32) (currentBit!5969 (_2!6153 lt!209117))) lt!209123)))

(declare-fun lt!209122 () Unit!8406)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4832 array!6152 (_ BitVec 32)) Unit!8406)

(assert (=> b!134797 (= lt!209122 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6153 lt!209117) (buf!3177 (_2!6153 lt!209136)) lt!209123))))

(assert (=> b!134797 (= (_1!6150 lt!209135) (_2!6151 lt!209131))))

(assert (=> b!134797 (= lt!209135 (readByteArrayLoopPure!0 (_1!6151 lt!209131) arr!237 from!447 to!404))))

(declare-fun thiss!1634 () BitStream!4832)

(assert (=> b!134797 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2784 (buf!3177 (_2!6153 lt!209136)))) ((_ sign_extend 32) (currentByte!5974 thiss!1634)) ((_ sign_extend 32) (currentBit!5969 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209113 () Unit!8406)

(assert (=> b!134797 (= lt!209113 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3177 (_2!6153 lt!209136)) (bvsub to!404 from!447)))))

(assert (=> b!134797 (= (_2!6152 lt!209130) (select (arr!3449 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4832) tuple2!11672)

(assert (=> b!134797 (= lt!209130 (readBytePure!0 (_1!6151 lt!209131)))))

(declare-fun reader!0 (BitStream!4832 BitStream!4832) tuple2!11670)

(assert (=> b!134797 (= lt!209129 (reader!0 (_2!6153 lt!209117) (_2!6153 lt!209136)))))

(assert (=> b!134797 (= lt!209131 (reader!0 thiss!1634 (_2!6153 lt!209136)))))

(declare-fun e!89447 () Bool)

(assert (=> b!134797 e!89447))

(declare-fun res!112047 () Bool)

(assert (=> b!134797 (=> (not res!112047) (not e!89447))))

(declare-fun lt!209121 () tuple2!11672)

(declare-fun lt!209133 () tuple2!11672)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134797 (= res!112047 (= (bitIndex!0 (size!2784 (buf!3177 (_1!6152 lt!209121))) (currentByte!5974 (_1!6152 lt!209121)) (currentBit!5969 (_1!6152 lt!209121))) (bitIndex!0 (size!2784 (buf!3177 (_1!6152 lt!209133))) (currentByte!5974 (_1!6152 lt!209133)) (currentBit!5969 (_1!6152 lt!209133)))))))

(declare-fun lt!209118 () Unit!8406)

(declare-fun lt!209124 () BitStream!4832)

(declare-fun readBytePrefixLemma!0 (BitStream!4832 BitStream!4832) Unit!8406)

(assert (=> b!134797 (= lt!209118 (readBytePrefixLemma!0 lt!209124 (_2!6153 lt!209136)))))

(assert (=> b!134797 (= lt!209133 (readBytePure!0 (BitStream!4833 (buf!3177 (_2!6153 lt!209136)) (currentByte!5974 thiss!1634) (currentBit!5969 thiss!1634))))))

(assert (=> b!134797 (= lt!209121 (readBytePure!0 lt!209124))))

(assert (=> b!134797 (= lt!209124 (BitStream!4833 (buf!3177 (_2!6153 lt!209117)) (currentByte!5974 thiss!1634) (currentBit!5969 thiss!1634)))))

(declare-fun e!89444 () Bool)

(assert (=> b!134797 e!89444))

(declare-fun res!112056 () Bool)

(assert (=> b!134797 (=> (not res!112056) (not e!89444))))

(declare-fun isPrefixOf!0 (BitStream!4832 BitStream!4832) Bool)

(assert (=> b!134797 (= res!112056 (isPrefixOf!0 thiss!1634 (_2!6153 lt!209136)))))

(declare-fun lt!209115 () Unit!8406)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4832 BitStream!4832 BitStream!4832) Unit!8406)

(assert (=> b!134797 (= lt!209115 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6153 lt!209117) (_2!6153 lt!209136)))))

(declare-fun e!89450 () Bool)

(assert (=> b!134797 e!89450))

(declare-fun res!112049 () Bool)

(assert (=> b!134797 (=> (not res!112049) (not e!89450))))

(assert (=> b!134797 (= res!112049 (= (size!2784 (buf!3177 (_2!6153 lt!209117))) (size!2784 (buf!3177 (_2!6153 lt!209136)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4832 array!6152 (_ BitVec 32) (_ BitVec 32)) tuple2!11674)

(assert (=> b!134797 (= lt!209136 (appendByteArrayLoop!0 (_2!6153 lt!209117) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134797 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2784 (buf!3177 (_2!6153 lt!209117)))) ((_ sign_extend 32) (currentByte!5974 (_2!6153 lt!209117))) ((_ sign_extend 32) (currentBit!5969 (_2!6153 lt!209117))) lt!209123)))

(assert (=> b!134797 (= lt!209123 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209116 () Unit!8406)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4832 BitStream!4832 (_ BitVec 64) (_ BitVec 32)) Unit!8406)

(assert (=> b!134797 (= lt!209116 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6153 lt!209117) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!89449 () Bool)

(assert (=> b!134797 e!89449))

(declare-fun res!112050 () Bool)

(assert (=> b!134797 (=> (not res!112050) (not e!89449))))

(assert (=> b!134797 (= res!112050 (= (size!2784 (buf!3177 thiss!1634)) (size!2784 (buf!3177 (_2!6153 lt!209117)))))))

(declare-fun appendByte!0 (BitStream!4832 (_ BitVec 8)) tuple2!11674)

(assert (=> b!134797 (= lt!209117 (appendByte!0 thiss!1634 (select (arr!3449 arr!237) from!447)))))

(declare-fun res!112055 () Bool)

(assert (=> start!26352 (=> (not res!112055) (not e!89446))))

(assert (=> start!26352 (= res!112055 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2784 arr!237))))))

(assert (=> start!26352 e!89446))

(assert (=> start!26352 true))

(declare-fun array_inv!2573 (array!6152) Bool)

(assert (=> start!26352 (array_inv!2573 arr!237)))

(declare-fun e!89443 () Bool)

(declare-fun inv!12 (BitStream!4832) Bool)

(assert (=> start!26352 (and (inv!12 thiss!1634) e!89443)))

(declare-fun b!134798 () Bool)

(declare-fun res!112051 () Bool)

(assert (=> b!134798 (=> (not res!112051) (not e!89449))))

(assert (=> b!134798 (= res!112051 (isPrefixOf!0 thiss!1634 (_2!6153 lt!209117)))))

(declare-fun b!134799 () Bool)

(declare-fun e!89448 () Bool)

(declare-fun e!89451 () Bool)

(assert (=> b!134799 (= e!89448 (not e!89451))))

(declare-fun res!112054 () Bool)

(assert (=> b!134799 (=> res!112054 e!89451)))

(declare-fun lt!209127 () tuple2!11670)

(declare-fun lt!209114 () tuple2!11668)

(assert (=> b!134799 (= res!112054 (or (not (= (size!2784 (_2!6150 lt!209114)) (size!2784 arr!237))) (not (= (_1!6150 lt!209114) (_2!6151 lt!209127)))))))

(assert (=> b!134799 (= lt!209114 (readByteArrayLoopPure!0 (_1!6151 lt!209127) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209134 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134799 (validate_offset_bits!1 ((_ sign_extend 32) (size!2784 (buf!3177 (_2!6153 lt!209136)))) ((_ sign_extend 32) (currentByte!5974 (_2!6153 lt!209117))) ((_ sign_extend 32) (currentBit!5969 (_2!6153 lt!209117))) lt!209134)))

(declare-fun lt!209132 () Unit!8406)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4832 array!6152 (_ BitVec 64)) Unit!8406)

(assert (=> b!134799 (= lt!209132 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6153 lt!209117) (buf!3177 (_2!6153 lt!209136)) lt!209134))))

(assert (=> b!134799 (= lt!209127 (reader!0 (_2!6153 lt!209117) (_2!6153 lt!209136)))))

(declare-fun b!134800 () Bool)

(assert (=> b!134800 (= e!89451 (not (arrayRangesEq!187 arr!237 (_2!6150 lt!209114) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134801 () Bool)

(declare-fun res!112052 () Bool)

(assert (=> b!134801 (=> (not res!112052) (not e!89448))))

(assert (=> b!134801 (= res!112052 (isPrefixOf!0 (_2!6153 lt!209117) (_2!6153 lt!209136)))))

(declare-fun b!134802 () Bool)

(assert (=> b!134802 (= e!89443 (array_inv!2573 (buf!3177 thiss!1634)))))

(declare-fun b!134803 () Bool)

(declare-fun res!112048 () Bool)

(assert (=> b!134803 (=> (not res!112048) (not e!89446))))

(assert (=> b!134803 (= res!112048 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2784 (buf!3177 thiss!1634))) ((_ sign_extend 32) (currentByte!5974 thiss!1634)) ((_ sign_extend 32) (currentBit!5969 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134804 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134804 (= e!89444 (invariant!0 (currentBit!5969 thiss!1634) (currentByte!5974 thiss!1634) (size!2784 (buf!3177 (_2!6153 lt!209117)))))))

(declare-fun b!134805 () Bool)

(declare-fun res!112046 () Bool)

(assert (=> b!134805 (=> (not res!112046) (not e!89446))))

(assert (=> b!134805 (= res!112046 (bvslt from!447 to!404))))

(declare-fun lt!209126 () tuple2!11670)

(declare-fun b!134806 () Bool)

(declare-fun lt!209125 () tuple2!11672)

(assert (=> b!134806 (= e!89449 (and (= (_2!6152 lt!209125) (select (arr!3449 arr!237) from!447)) (= (_1!6152 lt!209125) (_2!6151 lt!209126))))))

(assert (=> b!134806 (= lt!209125 (readBytePure!0 (_1!6151 lt!209126)))))

(assert (=> b!134806 (= lt!209126 (reader!0 thiss!1634 (_2!6153 lt!209117)))))

(declare-fun b!134807 () Bool)

(declare-fun res!112053 () Bool)

(assert (=> b!134807 (=> (not res!112053) (not e!89449))))

(assert (=> b!134807 (= res!112053 (= (bitIndex!0 (size!2784 (buf!3177 (_2!6153 lt!209117))) (currentByte!5974 (_2!6153 lt!209117)) (currentBit!5969 (_2!6153 lt!209117))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2784 (buf!3177 thiss!1634)) (currentByte!5974 thiss!1634) (currentBit!5969 thiss!1634)))))))

(declare-fun b!134808 () Bool)

(assert (=> b!134808 (= e!89447 (= (_2!6152 lt!209121) (_2!6152 lt!209133)))))

(declare-fun b!134809 () Bool)

(assert (=> b!134809 (= e!89450 e!89448)))

(declare-fun res!112045 () Bool)

(assert (=> b!134809 (=> (not res!112045) (not e!89448))))

(assert (=> b!134809 (= res!112045 (= (bitIndex!0 (size!2784 (buf!3177 (_2!6153 lt!209136))) (currentByte!5974 (_2!6153 lt!209136)) (currentBit!5969 (_2!6153 lt!209136))) (bvadd (bitIndex!0 (size!2784 (buf!3177 (_2!6153 lt!209117))) (currentByte!5974 (_2!6153 lt!209117)) (currentBit!5969 (_2!6153 lt!209117))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209134))))))

(assert (=> b!134809 (= lt!209134 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!134810 () Bool)

(declare-fun res!112044 () Bool)

(assert (=> b!134810 (=> (not res!112044) (not e!89446))))

(assert (=> b!134810 (= res!112044 (invariant!0 (currentBit!5969 thiss!1634) (currentByte!5974 thiss!1634) (size!2784 (buf!3177 thiss!1634))))))

(assert (= (and start!26352 res!112055) b!134803))

(assert (= (and b!134803 res!112048) b!134805))

(assert (= (and b!134805 res!112046) b!134810))

(assert (= (and b!134810 res!112044) b!134797))

(assert (= (and b!134797 res!112050) b!134807))

(assert (= (and b!134807 res!112053) b!134798))

(assert (= (and b!134798 res!112051) b!134806))

(assert (= (and b!134797 res!112049) b!134809))

(assert (= (and b!134809 res!112045) b!134801))

(assert (= (and b!134801 res!112052) b!134799))

(assert (= (and b!134799 (not res!112054)) b!134800))

(assert (= (and b!134797 res!112056) b!134804))

(assert (= (and b!134797 res!112047) b!134808))

(assert (= start!26352 b!134802))

(declare-fun m!205313 () Bool)

(assert (=> start!26352 m!205313))

(declare-fun m!205315 () Bool)

(assert (=> start!26352 m!205315))

(declare-fun m!205317 () Bool)

(assert (=> b!134809 m!205317))

(declare-fun m!205319 () Bool)

(assert (=> b!134809 m!205319))

(declare-fun m!205321 () Bool)

(assert (=> b!134802 m!205321))

(declare-fun m!205323 () Bool)

(assert (=> b!134801 m!205323))

(declare-fun m!205325 () Bool)

(assert (=> b!134804 m!205325))

(declare-fun m!205327 () Bool)

(assert (=> b!134798 m!205327))

(declare-fun m!205329 () Bool)

(assert (=> b!134810 m!205329))

(assert (=> b!134807 m!205319))

(declare-fun m!205331 () Bool)

(assert (=> b!134807 m!205331))

(declare-fun m!205333 () Bool)

(assert (=> b!134800 m!205333))

(declare-fun m!205335 () Bool)

(assert (=> b!134797 m!205335))

(declare-fun m!205337 () Bool)

(assert (=> b!134797 m!205337))

(declare-fun m!205339 () Bool)

(assert (=> b!134797 m!205339))

(declare-fun m!205341 () Bool)

(assert (=> b!134797 m!205341))

(declare-fun m!205343 () Bool)

(assert (=> b!134797 m!205343))

(declare-fun m!205345 () Bool)

(assert (=> b!134797 m!205345))

(declare-fun m!205347 () Bool)

(assert (=> b!134797 m!205347))

(declare-fun m!205349 () Bool)

(assert (=> b!134797 m!205349))

(declare-fun m!205351 () Bool)

(assert (=> b!134797 m!205351))

(declare-fun m!205353 () Bool)

(assert (=> b!134797 m!205353))

(declare-fun m!205355 () Bool)

(assert (=> b!134797 m!205355))

(declare-fun m!205357 () Bool)

(assert (=> b!134797 m!205357))

(declare-fun m!205359 () Bool)

(assert (=> b!134797 m!205359))

(declare-fun m!205361 () Bool)

(assert (=> b!134797 m!205361))

(declare-fun m!205363 () Bool)

(assert (=> b!134797 m!205363))

(declare-fun m!205365 () Bool)

(assert (=> b!134797 m!205365))

(assert (=> b!134797 m!205335))

(declare-fun m!205367 () Bool)

(assert (=> b!134797 m!205367))

(declare-fun m!205369 () Bool)

(assert (=> b!134797 m!205369))

(declare-fun m!205371 () Bool)

(assert (=> b!134797 m!205371))

(declare-fun m!205373 () Bool)

(assert (=> b!134797 m!205373))

(declare-fun m!205375 () Bool)

(assert (=> b!134797 m!205375))

(declare-fun m!205377 () Bool)

(assert (=> b!134797 m!205377))

(declare-fun m!205379 () Bool)

(assert (=> b!134797 m!205379))

(declare-fun m!205381 () Bool)

(assert (=> b!134797 m!205381))

(declare-fun m!205383 () Bool)

(assert (=> b!134797 m!205383))

(declare-fun m!205385 () Bool)

(assert (=> b!134797 m!205385))

(assert (=> b!134797 m!205379))

(assert (=> b!134806 m!205379))

(declare-fun m!205387 () Bool)

(assert (=> b!134806 m!205387))

(declare-fun m!205389 () Bool)

(assert (=> b!134806 m!205389))

(declare-fun m!205391 () Bool)

(assert (=> b!134803 m!205391))

(declare-fun m!205393 () Bool)

(assert (=> b!134799 m!205393))

(declare-fun m!205395 () Bool)

(assert (=> b!134799 m!205395))

(declare-fun m!205397 () Bool)

(assert (=> b!134799 m!205397))

(assert (=> b!134799 m!205375))

(push 1)

(assert (not b!134801))

(assert (not b!134798))

(assert (not b!134806))

(assert (not start!26352))

(assert (not b!134810))

(assert (not b!134803))

(assert (not b!134807))

(assert (not b!134797))

(assert (not b!134799))

(assert (not b!134809))

(assert (not b!134802))

(assert (not b!134804))

(assert (not b!134800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

