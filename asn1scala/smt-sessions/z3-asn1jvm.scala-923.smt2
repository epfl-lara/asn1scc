; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25938 () Bool)

(assert start!25938)

(declare-fun b!132551 () Bool)

(declare-fun e!87883 () Bool)

(declare-datatypes ((array!6108 0))(
  ( (array!6109 (arr!3400 (Array (_ BitVec 32) (_ BitVec 8))) (size!2765 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4794 0))(
  ( (BitStream!4795 (buf!3138 array!6108) (currentByte!5923 (_ BitVec 32)) (currentBit!5918 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11496 0))(
  ( (tuple2!11497 (_1!6054 BitStream!4794) (_2!6054 (_ BitVec 8))) )
))
(declare-fun lt!204645 () tuple2!11496)

(declare-fun lt!204641 () tuple2!11496)

(assert (=> b!132551 (= e!87883 (= (_2!6054 lt!204645) (_2!6054 lt!204641)))))

(declare-fun b!132552 () Bool)

(declare-fun res!110075 () Bool)

(declare-fun e!87893 () Bool)

(assert (=> b!132552 (=> (not res!110075) (not e!87893))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!132552 (= res!110075 (bvslt from!447 to!404))))

(declare-fun b!132553 () Bool)

(declare-fun res!110077 () Bool)

(declare-fun e!87886 () Bool)

(assert (=> b!132553 (=> (not res!110077) (not e!87886))))

(declare-fun thiss!1634 () BitStream!4794)

(declare-datatypes ((Unit!8162 0))(
  ( (Unit!8163) )
))
(declare-datatypes ((tuple2!11498 0))(
  ( (tuple2!11499 (_1!6055 Unit!8162) (_2!6055 BitStream!4794)) )
))
(declare-fun lt!204650 () tuple2!11498)

(declare-fun isPrefixOf!0 (BitStream!4794 BitStream!4794) Bool)

(assert (=> b!132553 (= res!110077 (isPrefixOf!0 thiss!1634 (_2!6055 lt!204650)))))

(declare-fun b!132554 () Bool)

(declare-fun e!87887 () Bool)

(declare-fun array_inv!2554 (array!6108) Bool)

(assert (=> b!132554 (= e!87887 (array_inv!2554 (buf!3138 thiss!1634)))))

(declare-fun b!132555 () Bool)

(declare-fun res!110069 () Bool)

(declare-fun e!87892 () Bool)

(assert (=> b!132555 (=> (not res!110069) (not e!87892))))

(declare-fun lt!204652 () tuple2!11498)

(assert (=> b!132555 (= res!110069 (isPrefixOf!0 (_2!6055 lt!204650) (_2!6055 lt!204652)))))

(declare-fun b!132556 () Bool)

(declare-fun res!110065 () Bool)

(assert (=> b!132556 (=> (not res!110065) (not e!87886))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132556 (= res!110065 (= (bitIndex!0 (size!2765 (buf!3138 (_2!6055 lt!204650))) (currentByte!5923 (_2!6055 lt!204650)) (currentBit!5918 (_2!6055 lt!204650))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2765 (buf!3138 thiss!1634)) (currentByte!5923 thiss!1634) (currentBit!5918 thiss!1634)))))))

(declare-fun b!132557 () Bool)

(declare-fun e!87891 () Bool)

(assert (=> b!132557 (= e!87891 e!87892)))

(declare-fun res!110074 () Bool)

(assert (=> b!132557 (=> (not res!110074) (not e!87892))))

(declare-fun lt!204646 () (_ BitVec 64))

(assert (=> b!132557 (= res!110074 (= (bitIndex!0 (size!2765 (buf!3138 (_2!6055 lt!204652))) (currentByte!5923 (_2!6055 lt!204652)) (currentBit!5918 (_2!6055 lt!204652))) (bvadd (bitIndex!0 (size!2765 (buf!3138 (_2!6055 lt!204650))) (currentByte!5923 (_2!6055 lt!204650)) (currentBit!5918 (_2!6055 lt!204650))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!204646))))))

(assert (=> b!132557 (= lt!204646 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun arr!237 () array!6108)

(declare-fun b!132558 () Bool)

(declare-fun e!87882 () Bool)

(declare-datatypes ((tuple2!11500 0))(
  ( (tuple2!11501 (_1!6056 BitStream!4794) (_2!6056 array!6108)) )
))
(declare-fun lt!204656 () tuple2!11500)

(declare-fun arrayRangesEq!168 (array!6108 array!6108 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132558 (= e!87882 (not (arrayRangesEq!168 arr!237 (_2!6056 lt!204656) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132559 () Bool)

(declare-fun e!87889 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132559 (= e!87889 (invariant!0 (currentBit!5918 thiss!1634) (currentByte!5923 thiss!1634) (size!2765 (buf!3138 (_2!6055 lt!204650)))))))

(declare-fun b!132560 () Bool)

(declare-fun e!87890 () Bool)

(declare-datatypes ((tuple2!11502 0))(
  ( (tuple2!11503 (_1!6057 BitStream!4794) (_2!6057 BitStream!4794)) )
))
(declare-fun lt!204635 () tuple2!11502)

(declare-fun readByteArrayLoopPure!0 (BitStream!4794 array!6108 (_ BitVec 32) (_ BitVec 32)) tuple2!11500)

(assert (=> b!132560 (= e!87890 (= (_1!6056 (readByteArrayLoopPure!0 (_1!6057 lt!204635) arr!237 from!447 to!404)) (_2!6057 lt!204635)))))

(declare-fun res!110064 () Bool)

(assert (=> start!25938 (=> (not res!110064) (not e!87893))))

(assert (=> start!25938 (= res!110064 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2765 arr!237))))))

(assert (=> start!25938 e!87893))

(assert (=> start!25938 true))

(assert (=> start!25938 (array_inv!2554 arr!237)))

(declare-fun inv!12 (BitStream!4794) Bool)

(assert (=> start!25938 (and (inv!12 thiss!1634) e!87887)))

(declare-fun b!132561 () Bool)

(declare-fun e!87885 () Bool)

(assert (=> b!132561 (= e!87893 (not e!87885))))

(declare-fun res!110073 () Bool)

(assert (=> b!132561 (=> res!110073 e!87885)))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132561 (= res!110073 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2765 (buf!3138 (_1!6057 lt!204635)))) ((_ sign_extend 32) (currentByte!5923 (_1!6057 lt!204635))) ((_ sign_extend 32) (currentBit!5918 (_1!6057 lt!204635))) (bvsub to!404 from!447))))))

(declare-fun lt!204642 () array!6108)

(declare-fun lt!204637 () tuple2!11500)

(declare-fun lt!204636 () tuple2!11502)

(assert (=> b!132561 (= lt!204637 (readByteArrayLoopPure!0 (_1!6057 lt!204636) lt!204642 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204651 () tuple2!11496)

(assert (=> b!132561 (= lt!204642 (array!6109 (store (arr!3400 arr!237) from!447 (_2!6054 lt!204651)) (size!2765 arr!237)))))

(declare-fun lt!204647 () (_ BitVec 32))

(assert (=> b!132561 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2765 (buf!3138 (_2!6055 lt!204652)))) ((_ sign_extend 32) (currentByte!5923 (_2!6055 lt!204650))) ((_ sign_extend 32) (currentBit!5918 (_2!6055 lt!204650))) lt!204647)))

(declare-fun lt!204648 () Unit!8162)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4794 array!6108 (_ BitVec 32)) Unit!8162)

(assert (=> b!132561 (= lt!204648 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6055 lt!204650) (buf!3138 (_2!6055 lt!204652)) lt!204647))))

(assert (=> b!132561 e!87890))

(declare-fun res!110071 () Bool)

(assert (=> b!132561 (=> (not res!110071) (not e!87890))))

(assert (=> b!132561 (= res!110071 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2765 (buf!3138 (_2!6055 lt!204652)))) ((_ sign_extend 32) (currentByte!5923 thiss!1634)) ((_ sign_extend 32) (currentBit!5918 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!204654 () Unit!8162)

(assert (=> b!132561 (= lt!204654 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3138 (_2!6055 lt!204652)) (bvsub to!404 from!447)))))

(assert (=> b!132561 (= (_2!6054 lt!204651) (select (arr!3400 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4794) tuple2!11496)

(assert (=> b!132561 (= lt!204651 (readBytePure!0 (_1!6057 lt!204635)))))

(declare-fun reader!0 (BitStream!4794 BitStream!4794) tuple2!11502)

(assert (=> b!132561 (= lt!204636 (reader!0 (_2!6055 lt!204650) (_2!6055 lt!204652)))))

(assert (=> b!132561 (= lt!204635 (reader!0 thiss!1634 (_2!6055 lt!204652)))))

(assert (=> b!132561 e!87883))

(declare-fun res!110063 () Bool)

(assert (=> b!132561 (=> (not res!110063) (not e!87883))))

(assert (=> b!132561 (= res!110063 (= (bitIndex!0 (size!2765 (buf!3138 (_1!6054 lt!204645))) (currentByte!5923 (_1!6054 lt!204645)) (currentBit!5918 (_1!6054 lt!204645))) (bitIndex!0 (size!2765 (buf!3138 (_1!6054 lt!204641))) (currentByte!5923 (_1!6054 lt!204641)) (currentBit!5918 (_1!6054 lt!204641)))))))

(declare-fun lt!204653 () Unit!8162)

(declare-fun lt!204649 () BitStream!4794)

(declare-fun readBytePrefixLemma!0 (BitStream!4794 BitStream!4794) Unit!8162)

(assert (=> b!132561 (= lt!204653 (readBytePrefixLemma!0 lt!204649 (_2!6055 lt!204652)))))

(assert (=> b!132561 (= lt!204641 (readBytePure!0 (BitStream!4795 (buf!3138 (_2!6055 lt!204652)) (currentByte!5923 thiss!1634) (currentBit!5918 thiss!1634))))))

(assert (=> b!132561 (= lt!204645 (readBytePure!0 lt!204649))))

(assert (=> b!132561 (= lt!204649 (BitStream!4795 (buf!3138 (_2!6055 lt!204650)) (currentByte!5923 thiss!1634) (currentBit!5918 thiss!1634)))))

(assert (=> b!132561 e!87889))

(declare-fun res!110070 () Bool)

(assert (=> b!132561 (=> (not res!110070) (not e!87889))))

(assert (=> b!132561 (= res!110070 (isPrefixOf!0 thiss!1634 (_2!6055 lt!204652)))))

(declare-fun lt!204640 () Unit!8162)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4794 BitStream!4794 BitStream!4794) Unit!8162)

(assert (=> b!132561 (= lt!204640 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6055 lt!204650) (_2!6055 lt!204652)))))

(assert (=> b!132561 e!87891))

(declare-fun res!110067 () Bool)

(assert (=> b!132561 (=> (not res!110067) (not e!87891))))

(assert (=> b!132561 (= res!110067 (= (size!2765 (buf!3138 (_2!6055 lt!204650))) (size!2765 (buf!3138 (_2!6055 lt!204652)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4794 array!6108 (_ BitVec 32) (_ BitVec 32)) tuple2!11498)

(assert (=> b!132561 (= lt!204652 (appendByteArrayLoop!0 (_2!6055 lt!204650) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132561 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2765 (buf!3138 (_2!6055 lt!204650)))) ((_ sign_extend 32) (currentByte!5923 (_2!6055 lt!204650))) ((_ sign_extend 32) (currentBit!5918 (_2!6055 lt!204650))) lt!204647)))

(assert (=> b!132561 (= lt!204647 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!204643 () Unit!8162)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4794 BitStream!4794 (_ BitVec 64) (_ BitVec 32)) Unit!8162)

(assert (=> b!132561 (= lt!204643 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6055 lt!204650) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132561 e!87886))

(declare-fun res!110066 () Bool)

(assert (=> b!132561 (=> (not res!110066) (not e!87886))))

(assert (=> b!132561 (= res!110066 (= (size!2765 (buf!3138 thiss!1634)) (size!2765 (buf!3138 (_2!6055 lt!204650)))))))

(declare-fun appendByte!0 (BitStream!4794 (_ BitVec 8)) tuple2!11498)

(assert (=> b!132561 (= lt!204650 (appendByte!0 thiss!1634 (select (arr!3400 arr!237) from!447)))))

(declare-fun b!132562 () Bool)

(assert (=> b!132562 (= e!87885 true)))

(declare-fun lt!204639 () tuple2!11500)

(declare-fun withMovedByteIndex!0 (BitStream!4794 (_ BitVec 32)) BitStream!4794)

(assert (=> b!132562 (= lt!204639 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6057 lt!204635) #b00000000000000000000000000000001) lt!204642 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204655 () tuple2!11496)

(declare-fun lt!204644 () tuple2!11502)

(declare-fun b!132563 () Bool)

(assert (=> b!132563 (= e!87886 (and (= (_2!6054 lt!204655) (select (arr!3400 arr!237) from!447)) (= (_1!6054 lt!204655) (_2!6057 lt!204644))))))

(assert (=> b!132563 (= lt!204655 (readBytePure!0 (_1!6057 lt!204644)))))

(assert (=> b!132563 (= lt!204644 (reader!0 thiss!1634 (_2!6055 lt!204650)))))

(declare-fun b!132564 () Bool)

(declare-fun res!110068 () Bool)

(assert (=> b!132564 (=> (not res!110068) (not e!87893))))

(assert (=> b!132564 (= res!110068 (invariant!0 (currentBit!5918 thiss!1634) (currentByte!5923 thiss!1634) (size!2765 (buf!3138 thiss!1634))))))

(declare-fun b!132565 () Bool)

(declare-fun res!110076 () Bool)

(assert (=> b!132565 (=> (not res!110076) (not e!87893))))

(assert (=> b!132565 (= res!110076 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2765 (buf!3138 thiss!1634))) ((_ sign_extend 32) (currentByte!5923 thiss!1634)) ((_ sign_extend 32) (currentBit!5918 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132566 () Bool)

(assert (=> b!132566 (= e!87892 (not e!87882))))

(declare-fun res!110072 () Bool)

(assert (=> b!132566 (=> res!110072 e!87882)))

(declare-fun lt!204638 () tuple2!11502)

(assert (=> b!132566 (= res!110072 (or (not (= (size!2765 (_2!6056 lt!204656)) (size!2765 arr!237))) (not (= (_1!6056 lt!204656) (_2!6057 lt!204638)))))))

(assert (=> b!132566 (= lt!204656 (readByteArrayLoopPure!0 (_1!6057 lt!204638) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132566 (validate_offset_bits!1 ((_ sign_extend 32) (size!2765 (buf!3138 (_2!6055 lt!204652)))) ((_ sign_extend 32) (currentByte!5923 (_2!6055 lt!204650))) ((_ sign_extend 32) (currentBit!5918 (_2!6055 lt!204650))) lt!204646)))

(declare-fun lt!204634 () Unit!8162)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4794 array!6108 (_ BitVec 64)) Unit!8162)

(assert (=> b!132566 (= lt!204634 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6055 lt!204650) (buf!3138 (_2!6055 lt!204652)) lt!204646))))

(assert (=> b!132566 (= lt!204638 (reader!0 (_2!6055 lt!204650) (_2!6055 lt!204652)))))

(assert (= (and start!25938 res!110064) b!132565))

(assert (= (and b!132565 res!110076) b!132552))

(assert (= (and b!132552 res!110075) b!132564))

(assert (= (and b!132564 res!110068) b!132561))

(assert (= (and b!132561 res!110066) b!132556))

(assert (= (and b!132556 res!110065) b!132553))

(assert (= (and b!132553 res!110077) b!132563))

(assert (= (and b!132561 res!110067) b!132557))

(assert (= (and b!132557 res!110074) b!132555))

(assert (= (and b!132555 res!110069) b!132566))

(assert (= (and b!132566 (not res!110072)) b!132558))

(assert (= (and b!132561 res!110070) b!132559))

(assert (= (and b!132561 res!110063) b!132551))

(assert (= (and b!132561 res!110071) b!132560))

(assert (= (and b!132561 (not res!110073)) b!132562))

(assert (= start!25938 b!132554))

(declare-fun m!200287 () Bool)

(assert (=> b!132554 m!200287))

(declare-fun m!200289 () Bool)

(assert (=> b!132561 m!200289))

(declare-fun m!200291 () Bool)

(assert (=> b!132561 m!200291))

(declare-fun m!200293 () Bool)

(assert (=> b!132561 m!200293))

(declare-fun m!200295 () Bool)

(assert (=> b!132561 m!200295))

(declare-fun m!200297 () Bool)

(assert (=> b!132561 m!200297))

(declare-fun m!200299 () Bool)

(assert (=> b!132561 m!200299))

(declare-fun m!200301 () Bool)

(assert (=> b!132561 m!200301))

(declare-fun m!200303 () Bool)

(assert (=> b!132561 m!200303))

(declare-fun m!200305 () Bool)

(assert (=> b!132561 m!200305))

(declare-fun m!200307 () Bool)

(assert (=> b!132561 m!200307))

(declare-fun m!200309 () Bool)

(assert (=> b!132561 m!200309))

(declare-fun m!200311 () Bool)

(assert (=> b!132561 m!200311))

(declare-fun m!200313 () Bool)

(assert (=> b!132561 m!200313))

(declare-fun m!200315 () Bool)

(assert (=> b!132561 m!200315))

(declare-fun m!200317 () Bool)

(assert (=> b!132561 m!200317))

(declare-fun m!200319 () Bool)

(assert (=> b!132561 m!200319))

(declare-fun m!200321 () Bool)

(assert (=> b!132561 m!200321))

(declare-fun m!200323 () Bool)

(assert (=> b!132561 m!200323))

(declare-fun m!200325 () Bool)

(assert (=> b!132561 m!200325))

(declare-fun m!200327 () Bool)

(assert (=> b!132561 m!200327))

(declare-fun m!200329 () Bool)

(assert (=> b!132561 m!200329))

(declare-fun m!200331 () Bool)

(assert (=> b!132561 m!200331))

(assert (=> b!132561 m!200321))

(declare-fun m!200333 () Bool)

(assert (=> b!132560 m!200333))

(declare-fun m!200335 () Bool)

(assert (=> b!132566 m!200335))

(declare-fun m!200337 () Bool)

(assert (=> b!132566 m!200337))

(declare-fun m!200339 () Bool)

(assert (=> b!132566 m!200339))

(assert (=> b!132566 m!200293))

(declare-fun m!200341 () Bool)

(assert (=> b!132557 m!200341))

(declare-fun m!200343 () Bool)

(assert (=> b!132557 m!200343))

(assert (=> b!132556 m!200343))

(declare-fun m!200345 () Bool)

(assert (=> b!132556 m!200345))

(declare-fun m!200347 () Bool)

(assert (=> b!132562 m!200347))

(assert (=> b!132562 m!200347))

(declare-fun m!200349 () Bool)

(assert (=> b!132562 m!200349))

(assert (=> b!132563 m!200321))

(declare-fun m!200351 () Bool)

(assert (=> b!132563 m!200351))

(declare-fun m!200353 () Bool)

(assert (=> b!132563 m!200353))

(declare-fun m!200355 () Bool)

(assert (=> b!132555 m!200355))

(declare-fun m!200357 () Bool)

(assert (=> b!132559 m!200357))

(declare-fun m!200359 () Bool)

(assert (=> b!132565 m!200359))

(declare-fun m!200361 () Bool)

(assert (=> b!132558 m!200361))

(declare-fun m!200363 () Bool)

(assert (=> b!132553 m!200363))

(declare-fun m!200365 () Bool)

(assert (=> start!25938 m!200365))

(declare-fun m!200367 () Bool)

(assert (=> start!25938 m!200367))

(declare-fun m!200369 () Bool)

(assert (=> b!132564 m!200369))

(check-sat (not b!132564) (not b!132561) (not b!132562) (not b!132559) (not b!132553) (not b!132566) (not b!132556) (not b!132558) (not b!132554) (not start!25938) (not b!132560) (not b!132555) (not b!132557) (not b!132565) (not b!132563))
