; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14086 () Bool)

(assert start!14086)

(declare-fun lt!117316 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!117308 () Bool)

(declare-fun e!47488 () Bool)

(declare-fun b!72787 () Bool)

(assert (=> b!72787 (= e!47488 (or (not (= lt!117308 lt!117316)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!72788 () Bool)

(declare-fun e!47496 () Bool)

(declare-fun e!47483 () Bool)

(assert (=> b!72788 (= e!47496 (not e!47483))))

(declare-fun res!60119 () Bool)

(assert (=> b!72788 (=> res!60119 e!47483)))

(assert (=> b!72788 (= res!60119 (bvsge i!635 to!314))))

(declare-datatypes ((array!2969 0))(
  ( (array!2970 (arr!1978 (Array (_ BitVec 32) (_ BitVec 8))) (size!1387 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2354 0))(
  ( (BitStream!2355 (buf!1768 array!2969) (currentByte!3494 (_ BitVec 32)) (currentBit!3489 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2354)

(declare-fun isPrefixOf!0 (BitStream!2354 BitStream!2354) Bool)

(assert (=> b!72788 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4827 0))(
  ( (Unit!4828) )
))
(declare-fun lt!117324 () Unit!4827)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2354) Unit!4827)

(assert (=> b!72788 (= lt!117324 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!117315 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!72788 (= lt!117315 (bitIndex!0 (size!1387 (buf!1768 thiss!1379)) (currentByte!3494 thiss!1379) (currentBit!3489 thiss!1379)))))

(declare-fun b!72789 () Bool)

(declare-fun e!47493 () Bool)

(assert (=> b!72789 (= e!47483 e!47493)))

(declare-fun res!60112 () Bool)

(assert (=> b!72789 (=> res!60112 e!47493)))

(declare-datatypes ((tuple2!6294 0))(
  ( (tuple2!6295 (_1!3261 Unit!4827) (_2!3261 BitStream!2354)) )
))
(declare-fun lt!117311 () tuple2!6294)

(assert (=> b!72789 (= res!60112 (not (isPrefixOf!0 thiss!1379 (_2!3261 lt!117311))))))

(declare-fun lt!117321 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!72789 (validate_offset_bits!1 ((_ sign_extend 32) (size!1387 (buf!1768 (_2!3261 lt!117311)))) ((_ sign_extend 32) (currentByte!3494 (_2!3261 lt!117311))) ((_ sign_extend 32) (currentBit!3489 (_2!3261 lt!117311))) lt!117321)))

(assert (=> b!72789 (= lt!117321 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117306 () Unit!4827)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2354 BitStream!2354 (_ BitVec 64) (_ BitVec 64)) Unit!4827)

(assert (=> b!72789 (= lt!117306 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3261 lt!117311) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2969)

(declare-fun appendBitFromByte!0 (BitStream!2354 (_ BitVec 8) (_ BitVec 32)) tuple2!6294)

(assert (=> b!72789 (= lt!117311 (appendBitFromByte!0 thiss!1379 (select (arr!1978 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!72790 () Bool)

(declare-fun e!47492 () Bool)

(declare-fun e!47491 () Bool)

(assert (=> b!72790 (= e!47492 e!47491)))

(declare-fun res!60123 () Bool)

(assert (=> b!72790 (=> res!60123 e!47491)))

(declare-datatypes ((List!752 0))(
  ( (Nil!749) (Cons!748 (h!867 Bool) (t!1502 List!752)) )
))
(declare-fun lt!117313 () List!752)

(declare-fun lt!117319 () List!752)

(assert (=> b!72790 (= res!60123 (not (= lt!117313 lt!117319)))))

(assert (=> b!72790 (= lt!117319 lt!117313)))

(declare-fun lt!117318 () List!752)

(declare-fun tail!356 (List!752) List!752)

(assert (=> b!72790 (= lt!117313 (tail!356 lt!117318))))

(declare-fun lt!117331 () Unit!4827)

(declare-datatypes ((tuple2!6296 0))(
  ( (tuple2!6297 (_1!3262 BitStream!2354) (_2!3262 BitStream!2354)) )
))
(declare-fun lt!117312 () tuple2!6296)

(declare-fun lt!117330 () tuple2!6296)

(declare-fun lt!117320 () tuple2!6294)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2354 BitStream!2354 BitStream!2354 BitStream!2354 (_ BitVec 64) List!752) Unit!4827)

(assert (=> b!72790 (= lt!117331 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3261 lt!117320) (_2!3261 lt!117320) (_1!3262 lt!117312) (_1!3262 lt!117330) (bvsub to!314 i!635) lt!117318))))

(declare-fun b!72791 () Bool)

(declare-fun e!47490 () Bool)

(declare-fun e!47482 () Bool)

(assert (=> b!72791 (= e!47490 e!47482)))

(declare-fun res!60117 () Bool)

(assert (=> b!72791 (=> res!60117 e!47482)))

(declare-fun lt!117307 () Bool)

(assert (=> b!72791 (= res!60117 (not (= lt!117308 lt!117307)))))

(declare-fun head!571 (List!752) Bool)

(assert (=> b!72791 (= lt!117308 (head!571 lt!117318))))

(declare-fun b!72792 () Bool)

(declare-fun e!47487 () Bool)

(declare-fun e!47495 () Bool)

(assert (=> b!72792 (= e!47487 e!47495)))

(declare-fun res!60106 () Bool)

(assert (=> b!72792 (=> res!60106 e!47495)))

(declare-fun lt!117323 () Bool)

(declare-fun lt!117329 () Bool)

(assert (=> b!72792 (= res!60106 (not (= lt!117323 lt!117329)))))

(declare-fun bitAt!0 (array!2969 (_ BitVec 64)) Bool)

(assert (=> b!72792 (= lt!117323 (bitAt!0 (buf!1768 (_2!3261 lt!117311)) lt!117315))))

(declare-fun b!72793 () Bool)

(declare-fun res!60125 () Bool)

(declare-fun e!47497 () Bool)

(assert (=> b!72793 (=> res!60125 e!47497)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!72793 (= res!60125 (not (invariant!0 (currentBit!3489 (_2!3261 lt!117320)) (currentByte!3494 (_2!3261 lt!117320)) (size!1387 (buf!1768 (_2!3261 lt!117320))))))))

(declare-fun b!72794 () Bool)

(declare-fun res!60110 () Bool)

(assert (=> b!72794 (=> res!60110 e!47492)))

(declare-fun length!380 (List!752) Int)

(assert (=> b!72794 (= res!60110 (<= (length!380 lt!117318) 0))))

(declare-fun b!72795 () Bool)

(declare-fun e!47486 () Bool)

(assert (=> b!72795 (= e!47486 e!47497)))

(declare-fun res!60121 () Bool)

(assert (=> b!72795 (=> res!60121 e!47497)))

(declare-fun lt!117317 () (_ BitVec 64))

(assert (=> b!72795 (= res!60121 (not (= lt!117317 (bvsub (bvadd lt!117315 to!314) i!635))))))

(assert (=> b!72795 (= lt!117317 (bitIndex!0 (size!1387 (buf!1768 (_2!3261 lt!117320))) (currentByte!3494 (_2!3261 lt!117320)) (currentBit!3489 (_2!3261 lt!117320))))))

(declare-fun b!72796 () Bool)

(assert (=> b!72796 (= e!47495 e!47488)))

(declare-fun res!60122 () Bool)

(assert (=> b!72796 (=> res!60122 e!47488)))

(declare-fun lt!117328 () Bool)

(assert (=> b!72796 (= res!60122 (not (= lt!117328 lt!117329)))))

(assert (=> b!72796 (= lt!117323 lt!117328)))

(assert (=> b!72796 (= lt!117328 (bitAt!0 (buf!1768 (_2!3261 lt!117320)) lt!117315))))

(declare-fun lt!117314 () (_ BitVec 64))

(declare-fun lt!117326 () Unit!4827)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2969 array!2969 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4827)

(assert (=> b!72796 (= lt!117326 (arrayBitRangesEqImpliesEq!0 (buf!1768 (_2!3261 lt!117311)) (buf!1768 (_2!3261 lt!117320)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!117315 lt!117314))))

(declare-fun b!72797 () Bool)

(declare-fun res!60120 () Bool)

(assert (=> b!72797 (=> res!60120 e!47497)))

(assert (=> b!72797 (= res!60120 (not (= (size!1387 (buf!1768 thiss!1379)) (size!1387 (buf!1768 (_2!3261 lt!117320))))))))

(declare-fun b!72798 () Bool)

(declare-fun res!60126 () Bool)

(declare-fun e!47494 () Bool)

(assert (=> b!72798 (=> res!60126 e!47494)))

(assert (=> b!72798 (= res!60126 (not (invariant!0 (currentBit!3489 (_2!3261 lt!117311)) (currentByte!3494 (_2!3261 lt!117311)) (size!1387 (buf!1768 (_2!3261 lt!117320))))))))

(declare-fun lt!117325 () tuple2!6296)

(declare-fun b!72799 () Bool)

(declare-fun e!47498 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2354 array!2969 (_ BitVec 64) (_ BitVec 64)) List!752)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2354 BitStream!2354 (_ BitVec 64)) List!752)

(assert (=> b!72799 (= e!47498 (= (head!571 (byteArrayBitContentToList!0 (_2!3261 lt!117311) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!571 (bitStreamReadBitsIntoList!0 (_2!3261 lt!117311) (_1!3262 lt!117325) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!72800 () Bool)

(declare-fun res!60116 () Bool)

(assert (=> b!72800 (=> res!60116 e!47488)))

(declare-datatypes ((tuple2!6298 0))(
  ( (tuple2!6299 (_1!3263 BitStream!2354) (_2!3263 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2354) tuple2!6298)

(assert (=> b!72800 (= res!60116 (not (= (_2!3263 (readBitPure!0 (_1!3262 lt!117312))) lt!117329)))))

(declare-fun b!72801 () Bool)

(assert (=> b!72801 (= e!47493 e!47486)))

(declare-fun res!60115 () Bool)

(assert (=> b!72801 (=> res!60115 e!47486)))

(assert (=> b!72801 (= res!60115 (not (isPrefixOf!0 (_2!3261 lt!117311) (_2!3261 lt!117320))))))

(assert (=> b!72801 (isPrefixOf!0 thiss!1379 (_2!3261 lt!117320))))

(declare-fun lt!117327 () Unit!4827)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2354 BitStream!2354 BitStream!2354) Unit!4827)

(assert (=> b!72801 (= lt!117327 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3261 lt!117311) (_2!3261 lt!117320)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2354 array!2969 (_ BitVec 64) (_ BitVec 64)) tuple2!6294)

(assert (=> b!72801 (= lt!117320 (appendBitsMSBFirstLoop!0 (_2!3261 lt!117311) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!72801 e!47498))

(declare-fun res!60109 () Bool)

(assert (=> b!72801 (=> (not res!60109) (not e!47498))))

(assert (=> b!72801 (= res!60109 (validate_offset_bits!1 ((_ sign_extend 32) (size!1387 (buf!1768 (_2!3261 lt!117311)))) ((_ sign_extend 32) (currentByte!3494 thiss!1379)) ((_ sign_extend 32) (currentBit!3489 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117310 () Unit!4827)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2354 array!2969 (_ BitVec 64)) Unit!4827)

(assert (=> b!72801 (= lt!117310 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1768 (_2!3261 lt!117311)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2354 BitStream!2354) tuple2!6296)

(assert (=> b!72801 (= lt!117325 (reader!0 thiss!1379 (_2!3261 lt!117311)))))

(declare-fun res!60124 () Bool)

(assert (=> start!14086 (=> (not res!60124) (not e!47496))))

(assert (=> start!14086 (= res!60124 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1387 srcBuffer!2))))))))

(assert (=> start!14086 e!47496))

(assert (=> start!14086 true))

(declare-fun array_inv!1236 (array!2969) Bool)

(assert (=> start!14086 (array_inv!1236 srcBuffer!2)))

(declare-fun e!47489 () Bool)

(declare-fun inv!12 (BitStream!2354) Bool)

(assert (=> start!14086 (and (inv!12 thiss!1379) e!47489)))

(declare-fun b!72802 () Bool)

(assert (=> b!72802 (= e!47494 e!47492)))

(declare-fun res!60108 () Bool)

(assert (=> b!72802 (=> res!60108 e!47492)))

(assert (=> b!72802 (= res!60108 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!72802 (= lt!117319 (bitStreamReadBitsIntoList!0 (_2!3261 lt!117320) (_1!3262 lt!117330) lt!117321))))

(assert (=> b!72802 (= lt!117318 (bitStreamReadBitsIntoList!0 (_2!3261 lt!117320) (_1!3262 lt!117312) (bvsub to!314 i!635)))))

(assert (=> b!72802 (validate_offset_bits!1 ((_ sign_extend 32) (size!1387 (buf!1768 (_2!3261 lt!117320)))) ((_ sign_extend 32) (currentByte!3494 (_2!3261 lt!117311))) ((_ sign_extend 32) (currentBit!3489 (_2!3261 lt!117311))) lt!117321)))

(declare-fun lt!117309 () Unit!4827)

(assert (=> b!72802 (= lt!117309 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3261 lt!117311) (buf!1768 (_2!3261 lt!117320)) lt!117321))))

(assert (=> b!72802 (= lt!117330 (reader!0 (_2!3261 lt!117311) (_2!3261 lt!117320)))))

(assert (=> b!72802 (validate_offset_bits!1 ((_ sign_extend 32) (size!1387 (buf!1768 (_2!3261 lt!117320)))) ((_ sign_extend 32) (currentByte!3494 thiss!1379)) ((_ sign_extend 32) (currentBit!3489 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!117322 () Unit!4827)

(assert (=> b!72802 (= lt!117322 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1768 (_2!3261 lt!117320)) (bvsub to!314 i!635)))))

(assert (=> b!72802 (= lt!117312 (reader!0 thiss!1379 (_2!3261 lt!117320)))))

(declare-fun b!72803 () Bool)

(assert (=> b!72803 (= e!47482 e!47487)))

(declare-fun res!60114 () Bool)

(assert (=> b!72803 (=> res!60114 e!47487)))

(assert (=> b!72803 (= res!60114 (not (= lt!117316 lt!117329)))))

(assert (=> b!72803 (= lt!117329 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!72803 (= lt!117316 (head!571 (byteArrayBitContentToList!0 (_2!3261 lt!117320) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!72804 () Bool)

(declare-fun res!60107 () Bool)

(assert (=> b!72804 (=> res!60107 e!47494)))

(assert (=> b!72804 (= res!60107 (not (invariant!0 (currentBit!3489 (_2!3261 lt!117311)) (currentByte!3494 (_2!3261 lt!117311)) (size!1387 (buf!1768 (_2!3261 lt!117311))))))))

(declare-fun b!72805 () Bool)

(assert (=> b!72805 (= e!47491 e!47490)))

(declare-fun res!60111 () Bool)

(assert (=> b!72805 (=> res!60111 e!47490)))

(assert (=> b!72805 (= res!60111 (not (= lt!117307 (bitAt!0 (buf!1768 (_1!3262 lt!117330)) lt!117315))))))

(assert (=> b!72805 (= lt!117307 (bitAt!0 (buf!1768 (_1!3262 lt!117312)) lt!117315))))

(declare-fun b!72806 () Bool)

(assert (=> b!72806 (= e!47489 (array_inv!1236 (buf!1768 thiss!1379)))))

(declare-fun b!72807 () Bool)

(assert (=> b!72807 (= e!47497 e!47494)))

(declare-fun res!60113 () Bool)

(assert (=> b!72807 (=> res!60113 e!47494)))

(assert (=> b!72807 (= res!60113 (not (= (size!1387 (buf!1768 (_2!3261 lt!117311))) (size!1387 (buf!1768 (_2!3261 lt!117320))))))))

(assert (=> b!72807 (= lt!117317 (bvsub (bvsub (bvadd lt!117314 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!72807 (= lt!117314 (bitIndex!0 (size!1387 (buf!1768 (_2!3261 lt!117311))) (currentByte!3494 (_2!3261 lt!117311)) (currentBit!3489 (_2!3261 lt!117311))))))

(assert (=> b!72807 (= (size!1387 (buf!1768 (_2!3261 lt!117320))) (size!1387 (buf!1768 thiss!1379)))))

(declare-fun b!72808 () Bool)

(declare-fun res!60118 () Bool)

(assert (=> b!72808 (=> (not res!60118) (not e!47496))))

(assert (=> b!72808 (= res!60118 (validate_offset_bits!1 ((_ sign_extend 32) (size!1387 (buf!1768 thiss!1379))) ((_ sign_extend 32) (currentByte!3494 thiss!1379)) ((_ sign_extend 32) (currentBit!3489 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14086 res!60124) b!72808))

(assert (= (and b!72808 res!60118) b!72788))

(assert (= (and b!72788 (not res!60119)) b!72789))

(assert (= (and b!72789 (not res!60112)) b!72801))

(assert (= (and b!72801 res!60109) b!72799))

(assert (= (and b!72801 (not res!60115)) b!72795))

(assert (= (and b!72795 (not res!60121)) b!72793))

(assert (= (and b!72793 (not res!60125)) b!72797))

(assert (= (and b!72797 (not res!60120)) b!72807))

(assert (= (and b!72807 (not res!60113)) b!72804))

(assert (= (and b!72804 (not res!60107)) b!72798))

(assert (= (and b!72798 (not res!60126)) b!72802))

(assert (= (and b!72802 (not res!60108)) b!72794))

(assert (= (and b!72794 (not res!60110)) b!72790))

(assert (= (and b!72790 (not res!60123)) b!72805))

(assert (= (and b!72805 (not res!60111)) b!72791))

(assert (= (and b!72791 (not res!60117)) b!72803))

(assert (= (and b!72803 (not res!60114)) b!72792))

(assert (= (and b!72792 (not res!60106)) b!72796))

(assert (= (and b!72796 (not res!60122)) b!72800))

(assert (= (and b!72800 (not res!60116)) b!72787))

(assert (= start!14086 b!72806))

(declare-fun m!116753 () Bool)

(assert (=> b!72789 m!116753))

(declare-fun m!116755 () Bool)

(assert (=> b!72789 m!116755))

(declare-fun m!116757 () Bool)

(assert (=> b!72789 m!116757))

(declare-fun m!116759 () Bool)

(assert (=> b!72789 m!116759))

(assert (=> b!72789 m!116755))

(declare-fun m!116761 () Bool)

(assert (=> b!72789 m!116761))

(declare-fun m!116763 () Bool)

(assert (=> b!72795 m!116763))

(declare-fun m!116765 () Bool)

(assert (=> b!72798 m!116765))

(declare-fun m!116767 () Bool)

(assert (=> b!72804 m!116767))

(declare-fun m!116769 () Bool)

(assert (=> b!72796 m!116769))

(declare-fun m!116771 () Bool)

(assert (=> b!72796 m!116771))

(declare-fun m!116773 () Bool)

(assert (=> b!72801 m!116773))

(declare-fun m!116775 () Bool)

(assert (=> b!72801 m!116775))

(declare-fun m!116777 () Bool)

(assert (=> b!72801 m!116777))

(declare-fun m!116779 () Bool)

(assert (=> b!72801 m!116779))

(declare-fun m!116781 () Bool)

(assert (=> b!72801 m!116781))

(declare-fun m!116783 () Bool)

(assert (=> b!72801 m!116783))

(declare-fun m!116785 () Bool)

(assert (=> b!72801 m!116785))

(declare-fun m!116787 () Bool)

(assert (=> b!72790 m!116787))

(declare-fun m!116789 () Bool)

(assert (=> b!72790 m!116789))

(declare-fun m!116791 () Bool)

(assert (=> b!72807 m!116791))

(declare-fun m!116793 () Bool)

(assert (=> start!14086 m!116793))

(declare-fun m!116795 () Bool)

(assert (=> start!14086 m!116795))

(declare-fun m!116797 () Bool)

(assert (=> b!72792 m!116797))

(declare-fun m!116799 () Bool)

(assert (=> b!72793 m!116799))

(declare-fun m!116801 () Bool)

(assert (=> b!72794 m!116801))

(declare-fun m!116803 () Bool)

(assert (=> b!72802 m!116803))

(declare-fun m!116805 () Bool)

(assert (=> b!72802 m!116805))

(declare-fun m!116807 () Bool)

(assert (=> b!72802 m!116807))

(declare-fun m!116809 () Bool)

(assert (=> b!72802 m!116809))

(declare-fun m!116811 () Bool)

(assert (=> b!72802 m!116811))

(declare-fun m!116813 () Bool)

(assert (=> b!72802 m!116813))

(declare-fun m!116815 () Bool)

(assert (=> b!72802 m!116815))

(declare-fun m!116817 () Bool)

(assert (=> b!72802 m!116817))

(declare-fun m!116819 () Bool)

(assert (=> b!72799 m!116819))

(assert (=> b!72799 m!116819))

(declare-fun m!116821 () Bool)

(assert (=> b!72799 m!116821))

(declare-fun m!116823 () Bool)

(assert (=> b!72799 m!116823))

(assert (=> b!72799 m!116823))

(declare-fun m!116825 () Bool)

(assert (=> b!72799 m!116825))

(declare-fun m!116827 () Bool)

(assert (=> b!72808 m!116827))

(declare-fun m!116829 () Bool)

(assert (=> b!72791 m!116829))

(declare-fun m!116831 () Bool)

(assert (=> b!72800 m!116831))

(declare-fun m!116833 () Bool)

(assert (=> b!72805 m!116833))

(declare-fun m!116835 () Bool)

(assert (=> b!72805 m!116835))

(declare-fun m!116837 () Bool)

(assert (=> b!72806 m!116837))

(declare-fun m!116839 () Bool)

(assert (=> b!72803 m!116839))

(declare-fun m!116841 () Bool)

(assert (=> b!72803 m!116841))

(assert (=> b!72803 m!116841))

(declare-fun m!116843 () Bool)

(assert (=> b!72803 m!116843))

(declare-fun m!116845 () Bool)

(assert (=> b!72788 m!116845))

(declare-fun m!116847 () Bool)

(assert (=> b!72788 m!116847))

(declare-fun m!116849 () Bool)

(assert (=> b!72788 m!116849))

(push 1)

(assert (not b!72801))

(assert (not b!72798))

(assert (not b!72799))

(assert (not b!72789))

(assert (not b!72805))

(assert (not b!72790))

(assert (not b!72793))

(assert (not b!72806))

(assert (not b!72803))

(assert (not b!72788))

(assert (not b!72804))

(assert (not b!72802))

(assert (not b!72808))

(assert (not b!72800))

(assert (not b!72807))

(assert (not b!72795))

(assert (not b!72796))

(assert (not b!72791))

(assert (not start!14086))

(assert (not b!72792))

(assert (not b!72794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

