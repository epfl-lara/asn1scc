; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25514 () Bool)

(assert start!25514)

(declare-fun b!129521 () Bool)

(declare-fun res!107287 () Bool)

(declare-fun e!85845 () Bool)

(assert (=> b!129521 (=> (not res!107287) (not e!85845))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5999 0))(
  ( (array!6000 (arr!3332 (Array (_ BitVec 32) (_ BitVec 8))) (size!2715 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4694 0))(
  ( (BitStream!4695 (buf!3073 array!5999) (currentByte!5834 (_ BitVec 32)) (currentBit!5829 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4694)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129521 (= res!107287 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2715 (buf!3073 thiss!1634))) ((_ sign_extend 32) (currentByte!5834 thiss!1634)) ((_ sign_extend 32) (currentBit!5829 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129522 () Bool)

(declare-fun res!107274 () Bool)

(declare-fun e!85843 () Bool)

(assert (=> b!129522 (=> (not res!107274) (not e!85843))))

(declare-datatypes ((Unit!8035 0))(
  ( (Unit!8036) )
))
(declare-datatypes ((tuple2!11078 0))(
  ( (tuple2!11079 (_1!5836 Unit!8035) (_2!5836 BitStream!4694)) )
))
(declare-fun lt!200120 () tuple2!11078)

(declare-fun isPrefixOf!0 (BitStream!4694 BitStream!4694) Bool)

(assert (=> b!129522 (= res!107274 (isPrefixOf!0 thiss!1634 (_2!5836 lt!200120)))))

(declare-fun res!107280 () Bool)

(assert (=> start!25514 (=> (not res!107280) (not e!85845))))

(declare-fun arr!237 () array!5999)

(assert (=> start!25514 (= res!107280 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2715 arr!237))))))

(assert (=> start!25514 e!85845))

(assert (=> start!25514 true))

(declare-fun array_inv!2504 (array!5999) Bool)

(assert (=> start!25514 (array_inv!2504 arr!237)))

(declare-fun e!85842 () Bool)

(declare-fun inv!12 (BitStream!4694) Bool)

(assert (=> start!25514 (and (inv!12 thiss!1634) e!85842)))

(declare-fun b!129523 () Bool)

(declare-fun res!107284 () Bool)

(declare-fun e!85850 () Bool)

(assert (=> b!129523 (=> (not res!107284) (not e!85850))))

(declare-fun lt!200127 () tuple2!11078)

(assert (=> b!129523 (= res!107284 (isPrefixOf!0 (_2!5836 lt!200120) (_2!5836 lt!200127)))))

(declare-fun b!129524 () Bool)

(declare-fun e!85847 () Bool)

(assert (=> b!129524 (= e!85847 e!85850)))

(declare-fun res!107286 () Bool)

(assert (=> b!129524 (=> (not res!107286) (not e!85850))))

(declare-fun lt!200132 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129524 (= res!107286 (= (bitIndex!0 (size!2715 (buf!3073 (_2!5836 lt!200127))) (currentByte!5834 (_2!5836 lt!200127)) (currentBit!5829 (_2!5836 lt!200127))) (bvadd (bitIndex!0 (size!2715 (buf!3073 (_2!5836 lt!200120))) (currentByte!5834 (_2!5836 lt!200120)) (currentBit!5829 (_2!5836 lt!200120))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200132))))))

(assert (=> b!129524 (= lt!200132 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129525 () Bool)

(declare-fun e!85844 () Bool)

(assert (=> b!129525 (= e!85845 (not e!85844))))

(declare-fun res!107276 () Bool)

(assert (=> b!129525 (=> res!107276 e!85844)))

(declare-fun lt!200130 () (_ BitVec 64))

(assert (=> b!129525 (= res!107276 (bvsgt lt!200130 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2715 (buf!3073 (_2!5836 lt!200120)))))))))

(assert (=> b!129525 (= lt!200130 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2715 (buf!3073 (_2!5836 lt!200120))) (currentByte!5834 thiss!1634) (currentBit!5829 thiss!1634))))))

(declare-fun e!85849 () Bool)

(assert (=> b!129525 e!85849))

(declare-fun res!107277 () Bool)

(assert (=> b!129525 (=> (not res!107277) (not e!85849))))

(assert (=> b!129525 (= res!107277 (isPrefixOf!0 thiss!1634 (_2!5836 lt!200127)))))

(declare-fun lt!200131 () Unit!8035)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4694 BitStream!4694 BitStream!4694) Unit!8035)

(assert (=> b!129525 (= lt!200131 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5836 lt!200120) (_2!5836 lt!200127)))))

(assert (=> b!129525 e!85847))

(declare-fun res!107273 () Bool)

(assert (=> b!129525 (=> (not res!107273) (not e!85847))))

(assert (=> b!129525 (= res!107273 (= (size!2715 (buf!3073 (_2!5836 lt!200120))) (size!2715 (buf!3073 (_2!5836 lt!200127)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4694 array!5999 (_ BitVec 32) (_ BitVec 32)) tuple2!11078)

(assert (=> b!129525 (= lt!200127 (appendByteArrayLoop!0 (_2!5836 lt!200120) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129525 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2715 (buf!3073 (_2!5836 lt!200120)))) ((_ sign_extend 32) (currentByte!5834 (_2!5836 lt!200120))) ((_ sign_extend 32) (currentBit!5829 (_2!5836 lt!200120))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200129 () Unit!8035)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4694 BitStream!4694 (_ BitVec 64) (_ BitVec 32)) Unit!8035)

(assert (=> b!129525 (= lt!200129 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5836 lt!200120) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129525 e!85843))

(declare-fun res!107275 () Bool)

(assert (=> b!129525 (=> (not res!107275) (not e!85843))))

(assert (=> b!129525 (= res!107275 (= (size!2715 (buf!3073 thiss!1634)) (size!2715 (buf!3073 (_2!5836 lt!200120)))))))

(declare-fun appendByte!0 (BitStream!4694 (_ BitVec 8)) tuple2!11078)

(assert (=> b!129525 (= lt!200120 (appendByte!0 thiss!1634 (select (arr!3332 arr!237) from!447)))))

(declare-fun b!129526 () Bool)

(declare-fun res!107281 () Bool)

(assert (=> b!129526 (=> (not res!107281) (not e!85845))))

(assert (=> b!129526 (= res!107281 (bvslt from!447 to!404))))

(declare-fun b!129527 () Bool)

(assert (=> b!129527 (= e!85842 (array_inv!2504 (buf!3073 thiss!1634)))))

(declare-fun b!129528 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129528 (= e!85849 (invariant!0 (currentBit!5829 thiss!1634) (currentByte!5834 thiss!1634) (size!2715 (buf!3073 (_2!5836 lt!200120)))))))

(declare-datatypes ((tuple2!11080 0))(
  ( (tuple2!11081 (_1!5837 BitStream!4694) (_2!5837 BitStream!4694)) )
))
(declare-fun lt!200125 () tuple2!11080)

(declare-datatypes ((tuple2!11082 0))(
  ( (tuple2!11083 (_1!5838 BitStream!4694) (_2!5838 (_ BitVec 8))) )
))
(declare-fun lt!200128 () tuple2!11082)

(declare-fun b!129529 () Bool)

(assert (=> b!129529 (= e!85843 (and (= (_2!5838 lt!200128) (select (arr!3332 arr!237) from!447)) (= (_1!5838 lt!200128) (_2!5837 lt!200125))))))

(declare-fun readBytePure!0 (BitStream!4694) tuple2!11082)

(assert (=> b!129529 (= lt!200128 (readBytePure!0 (_1!5837 lt!200125)))))

(declare-fun reader!0 (BitStream!4694 BitStream!4694) tuple2!11080)

(assert (=> b!129529 (= lt!200125 (reader!0 thiss!1634 (_2!5836 lt!200120)))))

(declare-fun b!129530 () Bool)

(declare-fun res!107279 () Bool)

(assert (=> b!129530 (=> (not res!107279) (not e!85843))))

(assert (=> b!129530 (= res!107279 (= (bitIndex!0 (size!2715 (buf!3073 (_2!5836 lt!200120))) (currentByte!5834 (_2!5836 lt!200120)) (currentBit!5829 (_2!5836 lt!200120))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2715 (buf!3073 thiss!1634)) (currentByte!5834 thiss!1634) (currentBit!5829 thiss!1634)))))))

(declare-fun b!129531 () Bool)

(assert (=> b!129531 (= e!85844 true)))

(declare-fun lt!200124 () tuple2!11082)

(assert (=> b!129531 (= lt!200124 (readBytePure!0 (BitStream!4695 (buf!3073 (_2!5836 lt!200127)) (currentByte!5834 thiss!1634) (currentBit!5829 thiss!1634))))))

(declare-fun lt!200126 () tuple2!11082)

(assert (=> b!129531 (= lt!200126 (readBytePure!0 (BitStream!4695 (buf!3073 (_2!5836 lt!200120)) (currentByte!5834 thiss!1634) (currentBit!5829 thiss!1634))))))

(declare-fun b!129532 () Bool)

(declare-fun res!107283 () Bool)

(assert (=> b!129532 (=> res!107283 e!85844)))

(assert (=> b!129532 (= res!107283 (bvsgt lt!200130 (bitIndex!0 (size!2715 (buf!3073 (_2!5836 lt!200127))) (currentByte!5834 (_2!5836 lt!200127)) (currentBit!5829 (_2!5836 lt!200127)))))))

(declare-fun e!85848 () Bool)

(declare-fun b!129533 () Bool)

(declare-datatypes ((tuple2!11084 0))(
  ( (tuple2!11085 (_1!5839 BitStream!4694) (_2!5839 array!5999)) )
))
(declare-fun lt!200123 () tuple2!11084)

(declare-fun arrayRangesEq!118 (array!5999 array!5999 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129533 (= e!85848 (not (arrayRangesEq!118 arr!237 (_2!5839 lt!200123) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129534 () Bool)

(assert (=> b!129534 (= e!85850 (not e!85848))))

(declare-fun res!107285 () Bool)

(assert (=> b!129534 (=> res!107285 e!85848)))

(declare-fun lt!200121 () tuple2!11080)

(assert (=> b!129534 (= res!107285 (or (not (= (size!2715 (_2!5839 lt!200123)) (size!2715 arr!237))) (not (= (_1!5839 lt!200123) (_2!5837 lt!200121)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4694 array!5999 (_ BitVec 32) (_ BitVec 32)) tuple2!11084)

(assert (=> b!129534 (= lt!200123 (readByteArrayLoopPure!0 (_1!5837 lt!200121) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129534 (validate_offset_bits!1 ((_ sign_extend 32) (size!2715 (buf!3073 (_2!5836 lt!200127)))) ((_ sign_extend 32) (currentByte!5834 (_2!5836 lt!200120))) ((_ sign_extend 32) (currentBit!5829 (_2!5836 lt!200120))) lt!200132)))

(declare-fun lt!200122 () Unit!8035)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4694 array!5999 (_ BitVec 64)) Unit!8035)

(assert (=> b!129534 (= lt!200122 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5836 lt!200120) (buf!3073 (_2!5836 lt!200127)) lt!200132))))

(assert (=> b!129534 (= lt!200121 (reader!0 (_2!5836 lt!200120) (_2!5836 lt!200127)))))

(declare-fun b!129535 () Bool)

(declare-fun res!107282 () Bool)

(assert (=> b!129535 (=> res!107282 e!85844)))

(declare-fun arrayBitRangesEq!0 (array!5999 array!5999 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129535 (= res!107282 (not (arrayBitRangesEq!0 (buf!3073 (_2!5836 lt!200120)) (buf!3073 (_2!5836 lt!200127)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!200130)))))

(declare-fun b!129536 () Bool)

(declare-fun res!107278 () Bool)

(assert (=> b!129536 (=> (not res!107278) (not e!85845))))

(assert (=> b!129536 (= res!107278 (invariant!0 (currentBit!5829 thiss!1634) (currentByte!5834 thiss!1634) (size!2715 (buf!3073 thiss!1634))))))

(assert (= (and start!25514 res!107280) b!129521))

(assert (= (and b!129521 res!107287) b!129526))

(assert (= (and b!129526 res!107281) b!129536))

(assert (= (and b!129536 res!107278) b!129525))

(assert (= (and b!129525 res!107275) b!129530))

(assert (= (and b!129530 res!107279) b!129522))

(assert (= (and b!129522 res!107274) b!129529))

(assert (= (and b!129525 res!107273) b!129524))

(assert (= (and b!129524 res!107286) b!129523))

(assert (= (and b!129523 res!107284) b!129534))

(assert (= (and b!129534 (not res!107285)) b!129533))

(assert (= (and b!129525 res!107277) b!129528))

(assert (= (and b!129525 (not res!107276)) b!129532))

(assert (= (and b!129532 (not res!107283)) b!129535))

(assert (= (and b!129535 (not res!107282)) b!129531))

(assert (= start!25514 b!129527))

(declare-fun m!195375 () Bool)

(assert (=> b!129532 m!195375))

(declare-fun m!195377 () Bool)

(assert (=> b!129523 m!195377))

(declare-fun m!195379 () Bool)

(assert (=> b!129525 m!195379))

(declare-fun m!195381 () Bool)

(assert (=> b!129525 m!195381))

(declare-fun m!195383 () Bool)

(assert (=> b!129525 m!195383))

(declare-fun m!195385 () Bool)

(assert (=> b!129525 m!195385))

(declare-fun m!195387 () Bool)

(assert (=> b!129525 m!195387))

(declare-fun m!195389 () Bool)

(assert (=> b!129525 m!195389))

(declare-fun m!195391 () Bool)

(assert (=> b!129525 m!195391))

(declare-fun m!195393 () Bool)

(assert (=> b!129525 m!195393))

(assert (=> b!129525 m!195391))

(declare-fun m!195395 () Bool)

(assert (=> b!129534 m!195395))

(declare-fun m!195397 () Bool)

(assert (=> b!129534 m!195397))

(declare-fun m!195399 () Bool)

(assert (=> b!129534 m!195399))

(declare-fun m!195401 () Bool)

(assert (=> b!129534 m!195401))

(declare-fun m!195403 () Bool)

(assert (=> b!129528 m!195403))

(declare-fun m!195405 () Bool)

(assert (=> start!25514 m!195405))

(declare-fun m!195407 () Bool)

(assert (=> start!25514 m!195407))

(declare-fun m!195409 () Bool)

(assert (=> b!129531 m!195409))

(declare-fun m!195411 () Bool)

(assert (=> b!129531 m!195411))

(declare-fun m!195413 () Bool)

(assert (=> b!129535 m!195413))

(declare-fun m!195415 () Bool)

(assert (=> b!129521 m!195415))

(declare-fun m!195417 () Bool)

(assert (=> b!129522 m!195417))

(declare-fun m!195419 () Bool)

(assert (=> b!129536 m!195419))

(declare-fun m!195421 () Bool)

(assert (=> b!129527 m!195421))

(assert (=> b!129524 m!195375))

(declare-fun m!195423 () Bool)

(assert (=> b!129524 m!195423))

(assert (=> b!129529 m!195391))

(declare-fun m!195425 () Bool)

(assert (=> b!129529 m!195425))

(declare-fun m!195427 () Bool)

(assert (=> b!129529 m!195427))

(declare-fun m!195429 () Bool)

(assert (=> b!129533 m!195429))

(assert (=> b!129530 m!195423))

(declare-fun m!195431 () Bool)

(assert (=> b!129530 m!195431))

(push 1)

(assert (not b!129529))

(assert (not b!129534))

(assert (not b!129535))

(assert (not b!129522))

(assert (not b!129532))

(assert (not b!129523))

(assert (not b!129524))

(assert (not b!129530))

(assert (not b!129536))

(assert (not b!129525))

(assert (not start!25514))

(assert (not b!129521))

(assert (not b!129527))

(assert (not b!129533))

(assert (not b!129528))

(assert (not b!129531))

(check-sat)

