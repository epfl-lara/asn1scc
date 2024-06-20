; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46482 () Bool)

(assert start!46482)

(declare-fun b!223395 () Bool)

(declare-fun res!187533 () Bool)

(declare-fun e!152045 () Bool)

(assert (=> b!223395 (=> (not res!187533) (not e!152045))))

(declare-datatypes ((array!10973 0))(
  ( (array!10974 (arr!5753 (Array (_ BitVec 32) (_ BitVec 8))) (size!4814 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8730 0))(
  ( (BitStream!8731 (buf!5358 array!10973) (currentByte!10055 (_ BitVec 32)) (currentBit!10050 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8730)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223395 (= res!187533 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))) ((_ sign_extend 32) (currentByte!10055 thiss!1870)) ((_ sign_extend 32) (currentBit!10050 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!187534 () Bool)

(assert (=> start!46482 (=> (not res!187534) (not e!152045))))

(declare-fun arr!308 () array!10973)

(assert (=> start!46482 (= res!187534 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4814 arr!308))))))

(assert (=> start!46482 e!152045))

(assert (=> start!46482 true))

(declare-fun array_inv!4555 (array!10973) Bool)

(assert (=> start!46482 (array_inv!4555 arr!308)))

(declare-fun e!152043 () Bool)

(declare-fun inv!12 (BitStream!8730) Bool)

(assert (=> start!46482 (and (inv!12 thiss!1870) e!152043)))

(declare-fun b!223396 () Bool)

(declare-fun res!187535 () Bool)

(assert (=> b!223396 (=> (not res!187535) (not e!152045))))

(assert (=> b!223396 (= res!187535 (bvslt i!761 to!496))))

(declare-fun b!223398 () Bool)

(assert (=> b!223398 (= e!152043 (array_inv!4555 (buf!5358 thiss!1870)))))

(declare-fun b!223397 () Bool)

(declare-datatypes ((Unit!16176 0))(
  ( (Unit!16177) )
))
(declare-datatypes ((tuple3!1154 0))(
  ( (tuple3!1155 (_1!10259 Unit!16176) (_2!10259 BitStream!8730) (_3!719 array!10973)) )
))
(declare-fun lt!353129 () tuple3!1154)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223397 (= e!152045 (not (invariant!0 (currentBit!10050 (_2!10259 lt!353129)) (currentByte!10055 (_2!10259 lt!353129)) (size!4814 (buf!5358 (_2!10259 lt!353129))))))))

(declare-datatypes ((tuple2!19080 0))(
  ( (tuple2!19081 (_1!10260 (_ BitVec 8)) (_2!10260 BitStream!8730)) )
))
(declare-fun lt!353131 () tuple2!19080)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223397 (= (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353131))) (currentByte!10055 (_2!10260 lt!353131)) (currentBit!10050 (_2!10260 lt!353131))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4814 (buf!5358 thiss!1870)) (currentByte!10055 thiss!1870) (currentBit!10050 thiss!1870))))))

(declare-fun readByteArrayLoop!0 (BitStream!8730 array!10973 (_ BitVec 32) (_ BitVec 32)) tuple3!1154)

(assert (=> b!223397 (= lt!353129 (readByteArrayLoop!0 (_2!10260 lt!353131) (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!223397 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!353130 () Unit!16176)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8730 BitStream!8730 (_ BitVec 64) (_ BitVec 32)) Unit!16176)

(assert (=> b!223397 (= lt!353130 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10260 lt!353131) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8730) tuple2!19080)

(assert (=> b!223397 (= lt!353131 (readByte!0 thiss!1870))))

(assert (= (and start!46482 res!187534) b!223395))

(assert (= (and b!223395 res!187533) b!223396))

(assert (= (and b!223396 res!187535) b!223397))

(assert (= start!46482 b!223398))

(declare-fun m!342215 () Bool)

(assert (=> b!223395 m!342215))

(declare-fun m!342217 () Bool)

(assert (=> start!46482 m!342217))

(declare-fun m!342219 () Bool)

(assert (=> start!46482 m!342219))

(declare-fun m!342221 () Bool)

(assert (=> b!223398 m!342221))

(declare-fun m!342223 () Bool)

(assert (=> b!223397 m!342223))

(declare-fun m!342225 () Bool)

(assert (=> b!223397 m!342225))

(declare-fun m!342227 () Bool)

(assert (=> b!223397 m!342227))

(declare-fun m!342229 () Bool)

(assert (=> b!223397 m!342229))

(declare-fun m!342231 () Bool)

(assert (=> b!223397 m!342231))

(declare-fun m!342233 () Bool)

(assert (=> b!223397 m!342233))

(declare-fun m!342235 () Bool)

(assert (=> b!223397 m!342235))

(declare-fun m!342237 () Bool)

(assert (=> b!223397 m!342237))

(check-sat (not b!223397) (not b!223398) (not start!46482) (not b!223395))
(check-sat)
(get-model)

(declare-fun bm!3520 () Bool)

(declare-fun call!3525 () (_ BitVec 64))

(assert (=> bm!3520 (= call!3525 (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353131))) (currentByte!10055 (_2!10260 lt!353131)) (currentBit!10050 (_2!10260 lt!353131))))))

(declare-fun e!152094 () Bool)

(declare-fun lt!353507 () tuple3!1154)

(declare-fun b!223465 () Bool)

(declare-datatypes ((tuple2!19090 0))(
  ( (tuple2!19091 (_1!10266 BitStream!8730) (_2!10266 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8730) tuple2!19090)

(assert (=> b!223465 (= e!152094 (= (select (arr!5753 (_3!719 lt!353507)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10266 (readBytePure!0 (_2!10260 lt!353131)))))))

(assert (=> b!223465 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4814 (_3!719 lt!353507))))))

(declare-fun b!223466 () Bool)

(declare-fun e!152093 () Bool)

(declare-fun arrayRangesEq!714 (array!10973 array!10973 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223466 (= e!152093 (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (_3!719 lt!353507) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun c!11102 () Bool)

(declare-fun call!3524 () Bool)

(declare-fun lt!353495 () tuple2!19080)

(declare-fun lt!353478 () array!10973)

(declare-fun bm!3521 () Bool)

(declare-fun lt!353498 () (_ BitVec 32))

(declare-fun lt!353489 () array!10973)

(declare-fun lt!353475 () (_ BitVec 32))

(assert (=> bm!3521 (= call!3524 (arrayRangesEq!714 (ite c!11102 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) lt!353489) (ite c!11102 (array!10974 (store (arr!5753 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10260 lt!353495)) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))) lt!353478) (ite c!11102 #b00000000000000000000000000000000 lt!353498) (ite c!11102 (bvadd #b00000000000000000000000000000001 i!761) lt!353475)))))

(declare-fun b!223467 () Bool)

(declare-fun res!187585 () Bool)

(assert (=> b!223467 (=> (not res!187585) (not e!152093))))

(assert (=> b!223467 (= res!187585 (and (= (buf!5358 (_2!10260 lt!353131)) (buf!5358 (_2!10259 lt!353507))) (= (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) (size!4814 (_3!719 lt!353507)))))))

(declare-fun d!75694 () Bool)

(assert (=> d!75694 e!152094))

(declare-fun res!187586 () Bool)

(assert (=> d!75694 (=> res!187586 e!152094)))

(assert (=> d!75694 (= res!187586 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!353488 () Bool)

(assert (=> d!75694 (= lt!353488 e!152093)))

(declare-fun res!187587 () Bool)

(assert (=> d!75694 (=> (not res!187587) (not e!152093))))

(declare-fun lt!353506 () (_ BitVec 64))

(declare-fun lt!353490 () (_ BitVec 64))

(assert (=> d!75694 (= res!187587 (= (bvadd lt!353506 lt!353490) (bitIndex!0 (size!4814 (buf!5358 (_2!10259 lt!353507))) (currentByte!10055 (_2!10259 lt!353507)) (currentBit!10050 (_2!10259 lt!353507)))))))

(assert (=> d!75694 (or (not (= (bvand lt!353506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353490 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353506 lt!353490) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!353484 () (_ BitVec 64))

(assert (=> d!75694 (= lt!353490 (bvmul lt!353484 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75694 (or (= lt!353484 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353484 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353484)))))

(assert (=> d!75694 (= lt!353484 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75694 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75694 (= lt!353506 (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353131))) (currentByte!10055 (_2!10260 lt!353131)) (currentBit!10050 (_2!10260 lt!353131))))))

(declare-fun e!152095 () tuple3!1154)

(assert (=> d!75694 (= lt!353507 e!152095)))

(assert (=> d!75694 (= c!11102 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75694 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))))))

(assert (=> d!75694 (= (readByteArrayLoop!0 (_2!10260 lt!353131) (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!353507)))

(declare-fun b!223468 () Bool)

(declare-fun lt!353502 () Unit!16176)

(declare-fun lt!353485 () tuple3!1154)

(assert (=> b!223468 (= e!152095 (tuple3!1155 lt!353502 (_2!10259 lt!353485) (_3!719 lt!353485)))))

(assert (=> b!223468 (= lt!353495 (readByte!0 (_2!10260 lt!353131)))))

(declare-fun lt!353494 () array!10973)

(assert (=> b!223468 (= lt!353494 (array!10974 (store (arr!5753 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10260 lt!353495)) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))))))

(declare-fun lt!353482 () (_ BitVec 64))

(assert (=> b!223468 (= lt!353482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!353501 () (_ BitVec 32))

(assert (=> b!223468 (= lt!353501 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!353500 () Unit!16176)

(assert (=> b!223468 (= lt!353500 (validateOffsetBytesFromBitIndexLemma!0 (_2!10260 lt!353131) (_2!10260 lt!353495) lt!353482 lt!353501))))

(assert (=> b!223468 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353495)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353495))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353495))) (bvsub lt!353501 ((_ extract 31 0) (bvsdiv (bvadd lt!353482 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!353503 () Unit!16176)

(assert (=> b!223468 (= lt!353503 lt!353500)))

(assert (=> b!223468 (= lt!353485 (readByteArrayLoop!0 (_2!10260 lt!353495) lt!353494 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223468 (= (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353495))) (currentByte!10055 (_2!10260 lt!353495)) (currentBit!10050 (_2!10260 lt!353495))) (bvadd call!3525 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!353499 () Unit!16176)

(declare-fun Unit!16197 () Unit!16176)

(assert (=> b!223468 (= lt!353499 Unit!16197)))

(assert (=> b!223468 (= (bvadd (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353495))) (currentByte!10055 (_2!10260 lt!353495)) (currentBit!10050 (_2!10260 lt!353495))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4814 (buf!5358 (_2!10259 lt!353485))) (currentByte!10055 (_2!10259 lt!353485)) (currentBit!10050 (_2!10259 lt!353485))))))

(declare-fun lt!353479 () Unit!16176)

(declare-fun Unit!16198 () Unit!16176)

(assert (=> b!223468 (= lt!353479 Unit!16198)))

(assert (=> b!223468 (= (bvadd call!3525 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4814 (buf!5358 (_2!10259 lt!353485))) (currentByte!10055 (_2!10259 lt!353485)) (currentBit!10050 (_2!10259 lt!353485))))))

(declare-fun lt!353496 () Unit!16176)

(declare-fun Unit!16199 () Unit!16176)

(assert (=> b!223468 (= lt!353496 Unit!16199)))

(assert (=> b!223468 (and (= (buf!5358 (_2!10260 lt!353131)) (buf!5358 (_2!10259 lt!353485))) (= (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) (size!4814 (_3!719 lt!353485))))))

(declare-fun lt!353492 () Unit!16176)

(declare-fun Unit!16200 () Unit!16176)

(assert (=> b!223468 (= lt!353492 Unit!16200)))

(declare-fun lt!353508 () Unit!16176)

(declare-fun arrayUpdatedAtPrefixLemma!306 (array!10973 (_ BitVec 32) (_ BitVec 8)) Unit!16176)

(assert (=> b!223468 (= lt!353508 (arrayUpdatedAtPrefixLemma!306 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10260 lt!353495)))))

(assert (=> b!223468 call!3524))

(declare-fun lt!353509 () Unit!16176)

(assert (=> b!223468 (= lt!353509 lt!353508)))

(declare-fun lt!353487 () (_ BitVec 32))

(assert (=> b!223468 (= lt!353487 #b00000000000000000000000000000000)))

(declare-fun lt!353505 () Unit!16176)

(declare-fun arrayRangesEqTransitive!200 (array!10973 array!10973 array!10973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16176)

(assert (=> b!223468 (= lt!353505 (arrayRangesEqTransitive!200 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) lt!353494 (_3!719 lt!353485) lt!353487 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223468 (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (_3!719 lt!353485) lt!353487 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!353493 () Unit!16176)

(assert (=> b!223468 (= lt!353493 lt!353505)))

(declare-fun call!3523 () Bool)

(assert (=> b!223468 call!3523))

(declare-fun lt!353497 () Unit!16176)

(declare-fun Unit!16201 () Unit!16176)

(assert (=> b!223468 (= lt!353497 Unit!16201)))

(declare-fun lt!353480 () Unit!16176)

(declare-fun arrayRangesEqImpliesEq!75 (array!10973 array!10973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16176)

(assert (=> b!223468 (= lt!353480 (arrayRangesEqImpliesEq!75 lt!353494 (_3!719 lt!353485) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223468 (= (select (store (arr!5753 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10260 lt!353495)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5753 (_3!719 lt!353485)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!353481 () Unit!16176)

(assert (=> b!223468 (= lt!353481 lt!353480)))

(declare-fun lt!353504 () Bool)

(assert (=> b!223468 (= lt!353504 (= (select (arr!5753 (_3!719 lt!353485)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10260 lt!353495)))))

(declare-fun Unit!16202 () Unit!16176)

(assert (=> b!223468 (= lt!353502 Unit!16202)))

(assert (=> b!223468 lt!353504))

(declare-fun bm!3522 () Bool)

(assert (=> bm!3522 (= call!3523 (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (ite c!11102 (_3!719 lt!353485) (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) #b00000000000000000000000000000000 (ite c!11102 (bvadd #b00000000000000000000000000000001 i!761) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))))))))

(declare-fun b!223469 () Bool)

(declare-fun lt!353491 () Unit!16176)

(assert (=> b!223469 (= e!152095 (tuple3!1155 lt!353491 (_2!10260 lt!353131) (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))))))

(assert (=> b!223469 (= call!3525 call!3525)))

(declare-fun lt!353476 () Unit!16176)

(declare-fun Unit!16203 () Unit!16176)

(assert (=> b!223469 (= lt!353476 Unit!16203)))

(declare-fun lt!353486 () Unit!16176)

(declare-fun arrayRangesEqReflexiveLemma!66 (array!10973) Unit!16176)

(assert (=> b!223469 (= lt!353486 (arrayRangesEqReflexiveLemma!66 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))))))

(assert (=> b!223469 call!3523))

(declare-fun lt!353474 () Unit!16176)

(assert (=> b!223469 (= lt!353474 lt!353486)))

(assert (=> b!223469 (= lt!353489 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))))

(assert (=> b!223469 (= lt!353478 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))))

(declare-fun lt!353477 () (_ BitVec 32))

(assert (=> b!223469 (= lt!353477 #b00000000000000000000000000000000)))

(declare-fun lt!353483 () (_ BitVec 32))

(assert (=> b!223469 (= lt!353483 (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))))))

(assert (=> b!223469 (= lt!353498 #b00000000000000000000000000000000)))

(assert (=> b!223469 (= lt!353475 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!66 (array!10973 array!10973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16176)

(assert (=> b!223469 (= lt!353491 (arrayRangesEqSlicedLemma!66 lt!353489 lt!353478 lt!353477 lt!353483 lt!353498 lt!353475))))

(assert (=> b!223469 call!3524))

(assert (= (and d!75694 c!11102) b!223468))

(assert (= (and d!75694 (not c!11102)) b!223469))

(assert (= (or b!223468 b!223469) bm!3521))

(assert (= (or b!223468 b!223469) bm!3522))

(assert (= (or b!223468 b!223469) bm!3520))

(assert (= (and d!75694 res!187587) b!223467))

(assert (= (and b!223467 res!187585) b!223466))

(assert (= (and d!75694 (not res!187586)) b!223465))

(declare-fun m!342367 () Bool)

(assert (=> b!223466 m!342367))

(assert (=> bm!3520 m!342233))

(declare-fun m!342369 () Bool)

(assert (=> b!223468 m!342369))

(declare-fun m!342371 () Bool)

(assert (=> b!223468 m!342371))

(declare-fun m!342373 () Bool)

(assert (=> b!223468 m!342373))

(declare-fun m!342375 () Bool)

(assert (=> b!223468 m!342375))

(declare-fun m!342377 () Bool)

(assert (=> b!223468 m!342377))

(declare-fun m!342379 () Bool)

(assert (=> b!223468 m!342379))

(declare-fun m!342381 () Bool)

(assert (=> b!223468 m!342381))

(declare-fun m!342383 () Bool)

(assert (=> b!223468 m!342383))

(declare-fun m!342385 () Bool)

(assert (=> b!223468 m!342385))

(declare-fun m!342387 () Bool)

(assert (=> b!223468 m!342387))

(declare-fun m!342389 () Bool)

(assert (=> b!223468 m!342389))

(declare-fun m!342391 () Bool)

(assert (=> b!223468 m!342391))

(declare-fun m!342393 () Bool)

(assert (=> b!223468 m!342393))

(declare-fun m!342395 () Bool)

(assert (=> bm!3522 m!342395))

(declare-fun m!342397 () Bool)

(assert (=> b!223465 m!342397))

(declare-fun m!342399 () Bool)

(assert (=> b!223465 m!342399))

(assert (=> bm!3521 m!342383))

(declare-fun m!342401 () Bool)

(assert (=> bm!3521 m!342401))

(declare-fun m!342403 () Bool)

(assert (=> b!223469 m!342403))

(declare-fun m!342405 () Bool)

(assert (=> b!223469 m!342405))

(declare-fun m!342407 () Bool)

(assert (=> d!75694 m!342407))

(assert (=> d!75694 m!342233))

(assert (=> b!223397 d!75694))

(declare-fun d!75710 () Bool)

(declare-fun lt!353588 () (_ BitVec 8))

(declare-fun lt!353591 () (_ BitVec 8))

(assert (=> d!75710 (= lt!353588 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5753 (buf!5358 thiss!1870)) (currentByte!10055 thiss!1870))) ((_ sign_extend 24) lt!353591))))))

(assert (=> d!75710 (= lt!353591 ((_ extract 7 0) (currentBit!10050 thiss!1870)))))

(declare-fun e!152116 () Bool)

(assert (=> d!75710 e!152116))

(declare-fun res!187613 () Bool)

(assert (=> d!75710 (=> (not res!187613) (not e!152116))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75710 (= res!187613 (validate_offset_bits!1 ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))) ((_ sign_extend 32) (currentByte!10055 thiss!1870)) ((_ sign_extend 32) (currentBit!10050 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19092 0))(
  ( (tuple2!19093 (_1!10267 Unit!16176) (_2!10267 (_ BitVec 8))) )
))
(declare-fun Unit!16205 () Unit!16176)

(declare-fun Unit!16206 () Unit!16176)

(assert (=> d!75710 (= (readByte!0 thiss!1870) (tuple2!19081 (_2!10267 (ite (bvsgt ((_ sign_extend 24) lt!353591) #b00000000000000000000000000000000) (tuple2!19093 Unit!16205 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353588) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5753 (buf!5358 thiss!1870)) (bvadd (currentByte!10055 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353591)))))))) (tuple2!19093 Unit!16206 lt!353588))) (BitStream!8731 (buf!5358 thiss!1870) (bvadd (currentByte!10055 thiss!1870) #b00000000000000000000000000000001) (currentBit!10050 thiss!1870))))))

(declare-fun b!223494 () Bool)

(declare-fun e!152117 () Bool)

(assert (=> b!223494 (= e!152116 e!152117)))

(declare-fun res!187614 () Bool)

(assert (=> b!223494 (=> (not res!187614) (not e!152117))))

(declare-fun lt!353589 () tuple2!19080)

(assert (=> b!223494 (= res!187614 (= (buf!5358 (_2!10260 lt!353589)) (buf!5358 thiss!1870)))))

(declare-fun lt!353587 () (_ BitVec 8))

(declare-fun lt!353590 () (_ BitVec 8))

(declare-fun Unit!16207 () Unit!16176)

(declare-fun Unit!16208 () Unit!16176)

(assert (=> b!223494 (= lt!353589 (tuple2!19081 (_2!10267 (ite (bvsgt ((_ sign_extend 24) lt!353587) #b00000000000000000000000000000000) (tuple2!19093 Unit!16207 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353590) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5753 (buf!5358 thiss!1870)) (bvadd (currentByte!10055 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353587)))))))) (tuple2!19093 Unit!16208 lt!353590))) (BitStream!8731 (buf!5358 thiss!1870) (bvadd (currentByte!10055 thiss!1870) #b00000000000000000000000000000001) (currentBit!10050 thiss!1870))))))

(assert (=> b!223494 (= lt!353590 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5753 (buf!5358 thiss!1870)) (currentByte!10055 thiss!1870))) ((_ sign_extend 24) lt!353587))))))

(assert (=> b!223494 (= lt!353587 ((_ extract 7 0) (currentBit!10050 thiss!1870)))))

(declare-fun lt!353593 () (_ BitVec 64))

(declare-fun lt!353592 () (_ BitVec 64))

(declare-fun b!223495 () Bool)

(assert (=> b!223495 (= e!152117 (= (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353589))) (currentByte!10055 (_2!10260 lt!353589)) (currentBit!10050 (_2!10260 lt!353589))) (bvadd lt!353593 lt!353592)))))

(assert (=> b!223495 (or (not (= (bvand lt!353593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353592 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353593 lt!353592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223495 (= lt!353592 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223495 (= lt!353593 (bitIndex!0 (size!4814 (buf!5358 thiss!1870)) (currentByte!10055 thiss!1870) (currentBit!10050 thiss!1870)))))

(assert (= (and d!75710 res!187613) b!223494))

(assert (= (and b!223494 res!187614) b!223495))

(declare-fun m!342429 () Bool)

(assert (=> d!75710 m!342429))

(declare-fun m!342431 () Bool)

(assert (=> d!75710 m!342431))

(declare-fun m!342433 () Bool)

(assert (=> d!75710 m!342433))

(assert (=> b!223494 m!342433))

(assert (=> b!223494 m!342429))

(declare-fun m!342435 () Bool)

(assert (=> b!223495 m!342435))

(assert (=> b!223495 m!342237))

(assert (=> b!223397 d!75710))

(declare-fun d!75728 () Bool)

(declare-fun e!152120 () Bool)

(assert (=> d!75728 e!152120))

(declare-fun res!187617 () Bool)

(assert (=> d!75728 (=> (not res!187617) (not e!152120))))

(assert (=> d!75728 (= res!187617 (and (or (let ((rhs!3683 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3683 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3683) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75729 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75729 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75729 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3682 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3682 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3682) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!353601 () Unit!16176)

(declare-fun choose!57 (BitStream!8730 BitStream!8730 (_ BitVec 64) (_ BitVec 32)) Unit!16176)

(assert (=> d!75728 (= lt!353601 (choose!57 thiss!1870 (_2!10260 lt!353131) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75728 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10260 lt!353131) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!353601)))

(declare-fun lt!353600 () (_ BitVec 32))

(declare-fun b!223498 () Bool)

(assert (=> b!223498 (= e!152120 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131))) (bvsub (bvsub to!496 i!761) lt!353600)))))

(assert (=> b!223498 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!353600 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!353600) #b10000000000000000000000000000000)))))

(declare-fun lt!353602 () (_ BitVec 64))

(assert (=> b!223498 (= lt!353600 ((_ extract 31 0) lt!353602))))

(assert (=> b!223498 (and (bvslt lt!353602 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!353602 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223498 (= lt!353602 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75728 res!187617) b!223498))

(declare-fun m!342437 () Bool)

(assert (=> d!75728 m!342437))

(declare-fun m!342439 () Bool)

(assert (=> b!223498 m!342439))

(assert (=> b!223397 d!75728))

(declare-fun d!75731 () Bool)

(declare-fun e!152123 () Bool)

(assert (=> d!75731 e!152123))

(declare-fun res!187623 () Bool)

(assert (=> d!75731 (=> (not res!187623) (not e!152123))))

(declare-fun lt!353617 () (_ BitVec 64))

(declare-fun lt!353615 () (_ BitVec 64))

(declare-fun lt!353618 () (_ BitVec 64))

(assert (=> d!75731 (= res!187623 (= lt!353615 (bvsub lt!353617 lt!353618)))))

(assert (=> d!75731 (or (= (bvand lt!353617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353617 lt!353618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75731 (= lt!353618 (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131)))))))

(declare-fun lt!353619 () (_ BitVec 64))

(declare-fun lt!353616 () (_ BitVec 64))

(assert (=> d!75731 (= lt!353617 (bvmul lt!353619 lt!353616))))

(assert (=> d!75731 (or (= lt!353619 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353616 (bvsdiv (bvmul lt!353619 lt!353616) lt!353619)))))

(assert (=> d!75731 (= lt!353616 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75731 (= lt!353619 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))))))

(assert (=> d!75731 (= lt!353615 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131)))))))

(assert (=> d!75731 (invariant!0 (currentBit!10050 (_2!10260 lt!353131)) (currentByte!10055 (_2!10260 lt!353131)) (size!4814 (buf!5358 (_2!10260 lt!353131))))))

(assert (=> d!75731 (= (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353131))) (currentByte!10055 (_2!10260 lt!353131)) (currentBit!10050 (_2!10260 lt!353131))) lt!353615)))

(declare-fun b!223503 () Bool)

(declare-fun res!187622 () Bool)

(assert (=> b!223503 (=> (not res!187622) (not e!152123))))

(assert (=> b!223503 (= res!187622 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353615))))

(declare-fun b!223504 () Bool)

(declare-fun lt!353620 () (_ BitVec 64))

(assert (=> b!223504 (= e!152123 (bvsle lt!353615 (bvmul lt!353620 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223504 (or (= lt!353620 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353620 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353620)))))

(assert (=> b!223504 (= lt!353620 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))))))

(assert (= (and d!75731 res!187623) b!223503))

(assert (= (and b!223503 res!187622) b!223504))

(declare-fun m!342441 () Bool)

(assert (=> d!75731 m!342441))

(declare-fun m!342443 () Bool)

(assert (=> d!75731 m!342443))

(assert (=> b!223397 d!75731))

(declare-fun d!75733 () Bool)

(declare-fun e!152124 () Bool)

(assert (=> d!75733 e!152124))

(declare-fun res!187625 () Bool)

(assert (=> d!75733 (=> (not res!187625) (not e!152124))))

(declare-fun lt!353624 () (_ BitVec 64))

(declare-fun lt!353621 () (_ BitVec 64))

(declare-fun lt!353623 () (_ BitVec 64))

(assert (=> d!75733 (= res!187625 (= lt!353621 (bvsub lt!353623 lt!353624)))))

(assert (=> d!75733 (or (= (bvand lt!353623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353624 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353623 lt!353624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75733 (= lt!353624 (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))) ((_ sign_extend 32) (currentByte!10055 thiss!1870)) ((_ sign_extend 32) (currentBit!10050 thiss!1870))))))

(declare-fun lt!353625 () (_ BitVec 64))

(declare-fun lt!353622 () (_ BitVec 64))

(assert (=> d!75733 (= lt!353623 (bvmul lt!353625 lt!353622))))

(assert (=> d!75733 (or (= lt!353625 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353622 (bvsdiv (bvmul lt!353625 lt!353622) lt!353625)))))

(assert (=> d!75733 (= lt!353622 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75733 (= lt!353625 ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))))))

(assert (=> d!75733 (= lt!353621 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10055 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10050 thiss!1870))))))

(assert (=> d!75733 (invariant!0 (currentBit!10050 thiss!1870) (currentByte!10055 thiss!1870) (size!4814 (buf!5358 thiss!1870)))))

(assert (=> d!75733 (= (bitIndex!0 (size!4814 (buf!5358 thiss!1870)) (currentByte!10055 thiss!1870) (currentBit!10050 thiss!1870)) lt!353621)))

(declare-fun b!223505 () Bool)

(declare-fun res!187624 () Bool)

(assert (=> b!223505 (=> (not res!187624) (not e!152124))))

(assert (=> b!223505 (= res!187624 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353621))))

(declare-fun b!223506 () Bool)

(declare-fun lt!353626 () (_ BitVec 64))

(assert (=> b!223506 (= e!152124 (bvsle lt!353621 (bvmul lt!353626 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223506 (or (= lt!353626 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353626 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353626)))))

(assert (=> b!223506 (= lt!353626 ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))))))

(assert (= (and d!75733 res!187625) b!223505))

(assert (= (and b!223505 res!187624) b!223506))

(declare-fun m!342445 () Bool)

(assert (=> d!75733 m!342445))

(declare-fun m!342447 () Bool)

(assert (=> d!75733 m!342447))

(assert (=> b!223397 d!75733))

(declare-fun d!75735 () Bool)

(assert (=> d!75735 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18469 () Bool)

(assert (= bs!18469 d!75735))

(assert (=> bs!18469 m!342441))

(assert (=> b!223397 d!75735))

(declare-fun d!75737 () Bool)

(assert (=> d!75737 (= (invariant!0 (currentBit!10050 (_2!10259 lt!353129)) (currentByte!10055 (_2!10259 lt!353129)) (size!4814 (buf!5358 (_2!10259 lt!353129)))) (and (bvsge (currentBit!10050 (_2!10259 lt!353129)) #b00000000000000000000000000000000) (bvslt (currentBit!10050 (_2!10259 lt!353129)) #b00000000000000000000000000001000) (bvsge (currentByte!10055 (_2!10259 lt!353129)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10055 (_2!10259 lt!353129)) (size!4814 (buf!5358 (_2!10259 lt!353129)))) (and (= (currentBit!10050 (_2!10259 lt!353129)) #b00000000000000000000000000000000) (= (currentByte!10055 (_2!10259 lt!353129)) (size!4814 (buf!5358 (_2!10259 lt!353129))))))))))

(assert (=> b!223397 d!75737))

(declare-fun d!75739 () Bool)

(assert (=> d!75739 (= (array_inv!4555 (buf!5358 thiss!1870)) (bvsge (size!4814 (buf!5358 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223398 d!75739))

(declare-fun d!75741 () Bool)

(assert (=> d!75741 (= (array_inv!4555 arr!308) (bvsge (size!4814 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46482 d!75741))

(declare-fun d!75743 () Bool)

(assert (=> d!75743 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10050 thiss!1870) (currentByte!10055 thiss!1870) (size!4814 (buf!5358 thiss!1870))))))

(declare-fun bs!18470 () Bool)

(assert (= bs!18470 d!75743))

(assert (=> bs!18470 m!342447))

(assert (=> start!46482 d!75743))

(declare-fun d!75745 () Bool)

(assert (=> d!75745 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))) ((_ sign_extend 32) (currentByte!10055 thiss!1870)) ((_ sign_extend 32) (currentBit!10050 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))) ((_ sign_extend 32) (currentByte!10055 thiss!1870)) ((_ sign_extend 32) (currentBit!10050 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18471 () Bool)

(assert (= bs!18471 d!75745))

(assert (=> bs!18471 m!342445))

(assert (=> b!223395 d!75745))

(check-sat (not b!223495) (not b!223466) (not d!75733) (not d!75731) (not d!75728) (not d!75735) (not bm!3521) (not b!223498) (not d!75694) (not bm!3520) (not bm!3522) (not d!75745) (not b!223469) (not b!223468) (not b!223465) (not d!75710) (not d!75743))
(check-sat)
(get-model)

(declare-fun d!75747 () Bool)

(declare-fun res!187630 () Bool)

(declare-fun e!152129 () Bool)

(assert (=> d!75747 (=> res!187630 e!152129)))

(assert (=> d!75747 (= res!187630 (= (ite c!11102 #b00000000000000000000000000000000 lt!353498) (ite c!11102 (bvadd #b00000000000000000000000000000001 i!761) lt!353475)))))

(assert (=> d!75747 (= (arrayRangesEq!714 (ite c!11102 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) lt!353489) (ite c!11102 (array!10974 (store (arr!5753 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10260 lt!353495)) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))) lt!353478) (ite c!11102 #b00000000000000000000000000000000 lt!353498) (ite c!11102 (bvadd #b00000000000000000000000000000001 i!761) lt!353475)) e!152129)))

(declare-fun b!223511 () Bool)

(declare-fun e!152130 () Bool)

(assert (=> b!223511 (= e!152129 e!152130)))

(declare-fun res!187631 () Bool)

(assert (=> b!223511 (=> (not res!187631) (not e!152130))))

(assert (=> b!223511 (= res!187631 (= (select (arr!5753 (ite c!11102 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) lt!353489)) (ite c!11102 #b00000000000000000000000000000000 lt!353498)) (select (arr!5753 (ite c!11102 (array!10974 (store (arr!5753 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10260 lt!353495)) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))) lt!353478)) (ite c!11102 #b00000000000000000000000000000000 lt!353498))))))

(declare-fun b!223512 () Bool)

(assert (=> b!223512 (= e!152130 (arrayRangesEq!714 (ite c!11102 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) lt!353489) (ite c!11102 (array!10974 (store (arr!5753 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10260 lt!353495)) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))) lt!353478) (bvadd (ite c!11102 #b00000000000000000000000000000000 lt!353498) #b00000000000000000000000000000001) (ite c!11102 (bvadd #b00000000000000000000000000000001 i!761) lt!353475)))))

(assert (= (and d!75747 (not res!187630)) b!223511))

(assert (= (and b!223511 res!187631) b!223512))

(declare-fun m!342449 () Bool)

(assert (=> b!223511 m!342449))

(declare-fun m!342451 () Bool)

(assert (=> b!223511 m!342451))

(declare-fun m!342453 () Bool)

(assert (=> b!223512 m!342453))

(assert (=> bm!3521 d!75747))

(declare-fun d!75749 () Bool)

(assert (=> d!75749 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131))) (bvsub (bvsub to!496 i!761) lt!353600)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) lt!353600)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18472 () Bool)

(assert (= bs!18472 d!75749))

(assert (=> bs!18472 m!342441))

(assert (=> b!223498 d!75749))

(declare-fun d!75751 () Bool)

(assert (=> d!75751 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131))) (bvsub (bvsub to!496 i!761) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!75751 true))

(declare-fun _$7!130 () Unit!16176)

(assert (=> d!75751 (= (choose!57 thiss!1870 (_2!10260 lt!353131) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) _$7!130)))

(declare-fun bs!18473 () Bool)

(assert (= bs!18473 d!75751))

(declare-fun m!342455 () Bool)

(assert (=> bs!18473 m!342455))

(assert (=> d!75728 d!75751))

(declare-fun d!75753 () Bool)

(assert (=> d!75753 (= (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))) ((_ sign_extend 32) (currentByte!10055 thiss!1870)) ((_ sign_extend 32) (currentBit!10050 thiss!1870))) (bvsub (bvmul ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10055 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10050 thiss!1870)))))))

(assert (=> d!75733 d!75753))

(declare-fun d!75755 () Bool)

(assert (=> d!75755 (= (invariant!0 (currentBit!10050 thiss!1870) (currentByte!10055 thiss!1870) (size!4814 (buf!5358 thiss!1870))) (and (bvsge (currentBit!10050 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10050 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10055 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10055 thiss!1870) (size!4814 (buf!5358 thiss!1870))) (and (= (currentBit!10050 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10055 thiss!1870) (size!4814 (buf!5358 thiss!1870)))))))))

(assert (=> d!75733 d!75755))

(declare-fun bm!3523 () Bool)

(declare-fun call!3528 () (_ BitVec 64))

(assert (=> bm!3523 (= call!3528 (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353495))) (currentByte!10055 (_2!10260 lt!353495)) (currentBit!10050 (_2!10260 lt!353495))))))

(declare-fun lt!353660 () tuple3!1154)

(declare-fun e!152132 () Bool)

(declare-fun b!223513 () Bool)

(assert (=> b!223513 (= e!152132 (= (select (arr!5753 (_3!719 lt!353660)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (_2!10266 (readBytePure!0 (_2!10260 lt!353495)))))))

(assert (=> b!223513 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (size!4814 (_3!719 lt!353660))))))

(declare-fun b!223514 () Bool)

(declare-fun e!152131 () Bool)

(assert (=> b!223514 (= e!152131 (arrayRangesEq!714 lt!353494 (_3!719 lt!353660) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3527 () Bool)

(declare-fun lt!353642 () array!10973)

(declare-fun lt!353651 () (_ BitVec 32))

(declare-fun lt!353648 () tuple2!19080)

(declare-fun lt!353631 () array!10973)

(declare-fun lt!353628 () (_ BitVec 32))

(declare-fun bm!3524 () Bool)

(declare-fun c!11103 () Bool)

(assert (=> bm!3524 (= call!3527 (arrayRangesEq!714 (ite c!11103 lt!353494 lt!353642) (ite c!11103 (array!10974 (store (arr!5753 lt!353494) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10260 lt!353648)) (size!4814 lt!353494)) lt!353631) (ite c!11103 #b00000000000000000000000000000000 lt!353651) (ite c!11103 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) lt!353628)))))

(declare-fun b!223515 () Bool)

(declare-fun res!187632 () Bool)

(assert (=> b!223515 (=> (not res!187632) (not e!152131))))

(assert (=> b!223515 (= res!187632 (and (= (buf!5358 (_2!10260 lt!353495)) (buf!5358 (_2!10259 lt!353660))) (= (size!4814 lt!353494) (size!4814 (_3!719 lt!353660)))))))

(declare-fun d!75757 () Bool)

(assert (=> d!75757 e!152132))

(declare-fun res!187633 () Bool)

(assert (=> d!75757 (=> res!187633 e!152132)))

(assert (=> d!75757 (= res!187633 (bvsge (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun lt!353641 () Bool)

(assert (=> d!75757 (= lt!353641 e!152131)))

(declare-fun res!187634 () Bool)

(assert (=> d!75757 (=> (not res!187634) (not e!152131))))

(declare-fun lt!353659 () (_ BitVec 64))

(declare-fun lt!353643 () (_ BitVec 64))

(assert (=> d!75757 (= res!187634 (= (bvadd lt!353659 lt!353643) (bitIndex!0 (size!4814 (buf!5358 (_2!10259 lt!353660))) (currentByte!10055 (_2!10259 lt!353660)) (currentBit!10050 (_2!10259 lt!353660)))))))

(assert (=> d!75757 (or (not (= (bvand lt!353659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353643 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353659 lt!353643) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!353637 () (_ BitVec 64))

(assert (=> d!75757 (= lt!353643 (bvmul lt!353637 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75757 (or (= lt!353637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353637)))))

(assert (=> d!75757 (= lt!353637 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))))

(assert (=> d!75757 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> d!75757 (= lt!353659 (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353495))) (currentByte!10055 (_2!10260 lt!353495)) (currentBit!10050 (_2!10260 lt!353495))))))

(declare-fun e!152133 () tuple3!1154)

(assert (=> d!75757 (= lt!353660 e!152133)))

(assert (=> d!75757 (= c!11103 (bvslt (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> d!75757 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496) (bvsle to!496 (size!4814 lt!353494)))))

(assert (=> d!75757 (= (readByteArrayLoop!0 (_2!10260 lt!353495) lt!353494 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496) lt!353660)))

(declare-fun b!223516 () Bool)

(declare-fun lt!353655 () Unit!16176)

(declare-fun lt!353638 () tuple3!1154)

(assert (=> b!223516 (= e!152133 (tuple3!1155 lt!353655 (_2!10259 lt!353638) (_3!719 lt!353638)))))

(assert (=> b!223516 (= lt!353648 (readByte!0 (_2!10260 lt!353495)))))

(declare-fun lt!353647 () array!10973)

(assert (=> b!223516 (= lt!353647 (array!10974 (store (arr!5753 lt!353494) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10260 lt!353648)) (size!4814 lt!353494)))))

(declare-fun lt!353635 () (_ BitVec 64))

(assert (=> b!223516 (= lt!353635 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!353654 () (_ BitVec 32))

(assert (=> b!223516 (= lt!353654 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun lt!353653 () Unit!16176)

(assert (=> b!223516 (= lt!353653 (validateOffsetBytesFromBitIndexLemma!0 (_2!10260 lt!353495) (_2!10260 lt!353648) lt!353635 lt!353654))))

(assert (=> b!223516 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353648)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353648))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353648))) (bvsub lt!353654 ((_ extract 31 0) (bvsdiv (bvadd lt!353635 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!353656 () Unit!16176)

(assert (=> b!223516 (= lt!353656 lt!353653)))

(assert (=> b!223516 (= lt!353638 (readByteArrayLoop!0 (_2!10260 lt!353648) lt!353647 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223516 (= (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353648))) (currentByte!10055 (_2!10260 lt!353648)) (currentBit!10050 (_2!10260 lt!353648))) (bvadd call!3528 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!353652 () Unit!16176)

(declare-fun Unit!16213 () Unit!16176)

(assert (=> b!223516 (= lt!353652 Unit!16213)))

(assert (=> b!223516 (= (bvadd (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353648))) (currentByte!10055 (_2!10260 lt!353648)) (currentBit!10050 (_2!10260 lt!353648))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4814 (buf!5358 (_2!10259 lt!353638))) (currentByte!10055 (_2!10259 lt!353638)) (currentBit!10050 (_2!10259 lt!353638))))))

(declare-fun lt!353632 () Unit!16176)

(declare-fun Unit!16214 () Unit!16176)

(assert (=> b!223516 (= lt!353632 Unit!16214)))

(assert (=> b!223516 (= (bvadd call!3528 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4814 (buf!5358 (_2!10259 lt!353638))) (currentByte!10055 (_2!10259 lt!353638)) (currentBit!10050 (_2!10259 lt!353638))))))

(declare-fun lt!353649 () Unit!16176)

(declare-fun Unit!16215 () Unit!16176)

(assert (=> b!223516 (= lt!353649 Unit!16215)))

(assert (=> b!223516 (and (= (buf!5358 (_2!10260 lt!353495)) (buf!5358 (_2!10259 lt!353638))) (= (size!4814 lt!353494) (size!4814 (_3!719 lt!353638))))))

(declare-fun lt!353645 () Unit!16176)

(declare-fun Unit!16216 () Unit!16176)

(assert (=> b!223516 (= lt!353645 Unit!16216)))

(declare-fun lt!353661 () Unit!16176)

(assert (=> b!223516 (= lt!353661 (arrayUpdatedAtPrefixLemma!306 lt!353494 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10260 lt!353648)))))

(assert (=> b!223516 call!3527))

(declare-fun lt!353662 () Unit!16176)

(assert (=> b!223516 (= lt!353662 lt!353661)))

(declare-fun lt!353640 () (_ BitVec 32))

(assert (=> b!223516 (= lt!353640 #b00000000000000000000000000000000)))

(declare-fun lt!353658 () Unit!16176)

(assert (=> b!223516 (= lt!353658 (arrayRangesEqTransitive!200 lt!353494 lt!353647 (_3!719 lt!353638) lt!353640 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!223516 (arrayRangesEq!714 lt!353494 (_3!719 lt!353638) lt!353640 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))

(declare-fun lt!353646 () Unit!16176)

(assert (=> b!223516 (= lt!353646 lt!353658)))

(declare-fun call!3526 () Bool)

(assert (=> b!223516 call!3526))

(declare-fun lt!353650 () Unit!16176)

(declare-fun Unit!16217 () Unit!16176)

(assert (=> b!223516 (= lt!353650 Unit!16217)))

(declare-fun lt!353633 () Unit!16176)

(assert (=> b!223516 (= lt!353633 (arrayRangesEqImpliesEq!75 lt!353647 (_3!719 lt!353638) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!223516 (= (select (store (arr!5753 lt!353494) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10260 lt!353648)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (select (arr!5753 (_3!719 lt!353638)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun lt!353634 () Unit!16176)

(assert (=> b!223516 (= lt!353634 lt!353633)))

(declare-fun lt!353657 () Bool)

(assert (=> b!223516 (= lt!353657 (= (select (arr!5753 (_3!719 lt!353638)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (_1!10260 lt!353648)))))

(declare-fun Unit!16218 () Unit!16176)

(assert (=> b!223516 (= lt!353655 Unit!16218)))

(assert (=> b!223516 lt!353657))

(declare-fun bm!3525 () Bool)

(assert (=> bm!3525 (= call!3526 (arrayRangesEq!714 lt!353494 (ite c!11103 (_3!719 lt!353638) lt!353494) #b00000000000000000000000000000000 (ite c!11103 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (size!4814 lt!353494))))))

(declare-fun b!223517 () Bool)

(declare-fun lt!353644 () Unit!16176)

(assert (=> b!223517 (= e!152133 (tuple3!1155 lt!353644 (_2!10260 lt!353495) lt!353494))))

(assert (=> b!223517 (= call!3528 call!3528)))

(declare-fun lt!353629 () Unit!16176)

(declare-fun Unit!16219 () Unit!16176)

(assert (=> b!223517 (= lt!353629 Unit!16219)))

(declare-fun lt!353639 () Unit!16176)

(assert (=> b!223517 (= lt!353639 (arrayRangesEqReflexiveLemma!66 lt!353494))))

(assert (=> b!223517 call!3526))

(declare-fun lt!353627 () Unit!16176)

(assert (=> b!223517 (= lt!353627 lt!353639)))

(assert (=> b!223517 (= lt!353642 lt!353494)))

(assert (=> b!223517 (= lt!353631 lt!353494)))

(declare-fun lt!353630 () (_ BitVec 32))

(assert (=> b!223517 (= lt!353630 #b00000000000000000000000000000000)))

(declare-fun lt!353636 () (_ BitVec 32))

(assert (=> b!223517 (= lt!353636 (size!4814 lt!353494))))

(assert (=> b!223517 (= lt!353651 #b00000000000000000000000000000000)))

(assert (=> b!223517 (= lt!353628 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))

(assert (=> b!223517 (= lt!353644 (arrayRangesEqSlicedLemma!66 lt!353642 lt!353631 lt!353630 lt!353636 lt!353651 lt!353628))))

(assert (=> b!223517 call!3527))

(assert (= (and d!75757 c!11103) b!223516))

(assert (= (and d!75757 (not c!11103)) b!223517))

(assert (= (or b!223516 b!223517) bm!3524))

(assert (= (or b!223516 b!223517) bm!3525))

(assert (= (or b!223516 b!223517) bm!3523))

(assert (= (and d!75757 res!187634) b!223515))

(assert (= (and b!223515 res!187632) b!223514))

(assert (= (and d!75757 (not res!187633)) b!223513))

(declare-fun m!342457 () Bool)

(assert (=> b!223514 m!342457))

(assert (=> bm!3523 m!342385))

(declare-fun m!342459 () Bool)

(assert (=> b!223516 m!342459))

(declare-fun m!342461 () Bool)

(assert (=> b!223516 m!342461))

(declare-fun m!342463 () Bool)

(assert (=> b!223516 m!342463))

(declare-fun m!342465 () Bool)

(assert (=> b!223516 m!342465))

(declare-fun m!342467 () Bool)

(assert (=> b!223516 m!342467))

(declare-fun m!342469 () Bool)

(assert (=> b!223516 m!342469))

(declare-fun m!342471 () Bool)

(assert (=> b!223516 m!342471))

(declare-fun m!342473 () Bool)

(assert (=> b!223516 m!342473))

(declare-fun m!342475 () Bool)

(assert (=> b!223516 m!342475))

(declare-fun m!342477 () Bool)

(assert (=> b!223516 m!342477))

(declare-fun m!342479 () Bool)

(assert (=> b!223516 m!342479))

(declare-fun m!342481 () Bool)

(assert (=> b!223516 m!342481))

(declare-fun m!342483 () Bool)

(assert (=> b!223516 m!342483))

(declare-fun m!342485 () Bool)

(assert (=> bm!3525 m!342485))

(declare-fun m!342487 () Bool)

(assert (=> b!223513 m!342487))

(declare-fun m!342489 () Bool)

(assert (=> b!223513 m!342489))

(assert (=> bm!3524 m!342473))

(declare-fun m!342491 () Bool)

(assert (=> bm!3524 m!342491))

(declare-fun m!342493 () Bool)

(assert (=> b!223517 m!342493))

(declare-fun m!342495 () Bool)

(assert (=> b!223517 m!342495))

(declare-fun m!342497 () Bool)

(assert (=> d!75757 m!342497))

(assert (=> d!75757 m!342385))

(assert (=> b!223468 d!75757))

(declare-fun d!75759 () Bool)

(assert (=> d!75759 (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (_3!719 lt!353485) lt!353487 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!353665 () Unit!16176)

(declare-fun choose!271 (array!10973 array!10973 array!10973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16176)

(assert (=> d!75759 (= lt!353665 (choose!271 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) lt!353494 (_3!719 lt!353485) lt!353487 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75759 (and (bvsle #b00000000000000000000000000000000 lt!353487) (bvsle lt!353487 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75759 (= (arrayRangesEqTransitive!200 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) lt!353494 (_3!719 lt!353485) lt!353487 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) lt!353665)))

(declare-fun bs!18474 () Bool)

(assert (= bs!18474 d!75759))

(assert (=> bs!18474 m!342389))

(declare-fun m!342499 () Bool)

(assert (=> bs!18474 m!342499))

(assert (=> b!223468 d!75759))

(declare-fun d!75761 () Bool)

(assert (=> d!75761 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4814 lt!353494)) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4814 (_3!719 lt!353485))) (= (select (arr!5753 lt!353494) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5753 (_3!719 lt!353485)) (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-fun lt!353668 () Unit!16176)

(declare-fun choose!272 (array!10973 array!10973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16176)

(assert (=> d!75761 (= lt!353668 (choose!272 lt!353494 (_3!719 lt!353485) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75761 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75761 (= (arrayRangesEqImpliesEq!75 lt!353494 (_3!719 lt!353485) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) lt!353668)))

(declare-fun bs!18475 () Bool)

(assert (= bs!18475 d!75761))

(declare-fun m!342501 () Bool)

(assert (=> bs!18475 m!342501))

(assert (=> bs!18475 m!342381))

(declare-fun m!342503 () Bool)

(assert (=> bs!18475 m!342503))

(assert (=> b!223468 d!75761))

(declare-fun d!75763 () Bool)

(declare-fun e!152134 () Bool)

(assert (=> d!75763 e!152134))

(declare-fun res!187635 () Bool)

(assert (=> d!75763 (=> (not res!187635) (not e!152134))))

(assert (=> d!75763 (= res!187635 (and (or (let ((rhs!3683 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand lt!353482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3683 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!353482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353482 rhs!3683) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75729 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75729 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd lt!353482 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75729 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3682 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand lt!353482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3682 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353482 rhs!3682) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!353670 () Unit!16176)

(assert (=> d!75763 (= lt!353670 (choose!57 (_2!10260 lt!353131) (_2!10260 lt!353495) lt!353482 lt!353501))))

(assert (=> d!75763 (= (validateOffsetBytesFromBitIndexLemma!0 (_2!10260 lt!353131) (_2!10260 lt!353495) lt!353482 lt!353501) lt!353670)))

(declare-fun lt!353669 () (_ BitVec 32))

(declare-fun b!223518 () Bool)

(assert (=> b!223518 (= e!152134 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353495)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353495))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353495))) (bvsub lt!353501 lt!353669)))))

(assert (=> b!223518 (or (= (bvand lt!353501 #b10000000000000000000000000000000) (bvand lt!353669 #b10000000000000000000000000000000)) (= (bvand lt!353501 #b10000000000000000000000000000000) (bvand (bvsub lt!353501 lt!353669) #b10000000000000000000000000000000)))))

(declare-fun lt!353671 () (_ BitVec 64))

(assert (=> b!223518 (= lt!353669 ((_ extract 31 0) lt!353671))))

(assert (=> b!223518 (and (bvslt lt!353671 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!353671 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223518 (= lt!353671 (bvsdiv (bvadd lt!353482 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75763 res!187635) b!223518))

(declare-fun m!342505 () Bool)

(assert (=> d!75763 m!342505))

(declare-fun m!342507 () Bool)

(assert (=> b!223518 m!342507))

(assert (=> b!223468 d!75763))

(declare-fun d!75765 () Bool)

(assert (=> d!75765 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353495)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353495))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353495))) (bvsub lt!353501 ((_ extract 31 0) (bvsdiv (bvadd lt!353482 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))) (bvsle ((_ sign_extend 32) (bvsub lt!353501 ((_ extract 31 0) (bvsdiv (bvadd lt!353482 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353495)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353495))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353495)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18476 () Bool)

(assert (= bs!18476 d!75765))

(declare-fun m!342509 () Bool)

(assert (=> bs!18476 m!342509))

(assert (=> b!223468 d!75765))

(declare-fun d!75767 () Bool)

(declare-fun e!152135 () Bool)

(assert (=> d!75767 e!152135))

(declare-fun res!187637 () Bool)

(assert (=> d!75767 (=> (not res!187637) (not e!152135))))

(declare-fun lt!353672 () (_ BitVec 64))

(declare-fun lt!353674 () (_ BitVec 64))

(declare-fun lt!353675 () (_ BitVec 64))

(assert (=> d!75767 (= res!187637 (= lt!353672 (bvsub lt!353674 lt!353675)))))

(assert (=> d!75767 (or (= (bvand lt!353674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353675 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353674 lt!353675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75767 (= lt!353675 (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10259 lt!353485)))) ((_ sign_extend 32) (currentByte!10055 (_2!10259 lt!353485))) ((_ sign_extend 32) (currentBit!10050 (_2!10259 lt!353485)))))))

(declare-fun lt!353676 () (_ BitVec 64))

(declare-fun lt!353673 () (_ BitVec 64))

(assert (=> d!75767 (= lt!353674 (bvmul lt!353676 lt!353673))))

(assert (=> d!75767 (or (= lt!353676 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353673 (bvsdiv (bvmul lt!353676 lt!353673) lt!353676)))))

(assert (=> d!75767 (= lt!353673 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75767 (= lt!353676 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10259 lt!353485)))))))

(assert (=> d!75767 (= lt!353672 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10055 (_2!10259 lt!353485))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10050 (_2!10259 lt!353485)))))))

(assert (=> d!75767 (invariant!0 (currentBit!10050 (_2!10259 lt!353485)) (currentByte!10055 (_2!10259 lt!353485)) (size!4814 (buf!5358 (_2!10259 lt!353485))))))

(assert (=> d!75767 (= (bitIndex!0 (size!4814 (buf!5358 (_2!10259 lt!353485))) (currentByte!10055 (_2!10259 lt!353485)) (currentBit!10050 (_2!10259 lt!353485))) lt!353672)))

(declare-fun b!223519 () Bool)

(declare-fun res!187636 () Bool)

(assert (=> b!223519 (=> (not res!187636) (not e!152135))))

(assert (=> b!223519 (= res!187636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353672))))

(declare-fun b!223520 () Bool)

(declare-fun lt!353677 () (_ BitVec 64))

(assert (=> b!223520 (= e!152135 (bvsle lt!353672 (bvmul lt!353677 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223520 (or (= lt!353677 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353677 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353677)))))

(assert (=> b!223520 (= lt!353677 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10259 lt!353485)))))))

(assert (= (and d!75767 res!187637) b!223519))

(assert (= (and b!223519 res!187636) b!223520))

(declare-fun m!342511 () Bool)

(assert (=> d!75767 m!342511))

(declare-fun m!342513 () Bool)

(assert (=> d!75767 m!342513))

(assert (=> b!223468 d!75767))

(declare-fun d!75769 () Bool)

(declare-fun e!152136 () Bool)

(assert (=> d!75769 e!152136))

(declare-fun res!187639 () Bool)

(assert (=> d!75769 (=> (not res!187639) (not e!152136))))

(declare-fun lt!353681 () (_ BitVec 64))

(declare-fun lt!353678 () (_ BitVec 64))

(declare-fun lt!353680 () (_ BitVec 64))

(assert (=> d!75769 (= res!187639 (= lt!353678 (bvsub lt!353680 lt!353681)))))

(assert (=> d!75769 (or (= (bvand lt!353680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353681 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353680 lt!353681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75769 (= lt!353681 (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353495)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353495))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353495)))))))

(declare-fun lt!353682 () (_ BitVec 64))

(declare-fun lt!353679 () (_ BitVec 64))

(assert (=> d!75769 (= lt!353680 (bvmul lt!353682 lt!353679))))

(assert (=> d!75769 (or (= lt!353682 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353679 (bvsdiv (bvmul lt!353682 lt!353679) lt!353682)))))

(assert (=> d!75769 (= lt!353679 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75769 (= lt!353682 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353495)))))))

(assert (=> d!75769 (= lt!353678 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353495))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353495)))))))

(assert (=> d!75769 (invariant!0 (currentBit!10050 (_2!10260 lt!353495)) (currentByte!10055 (_2!10260 lt!353495)) (size!4814 (buf!5358 (_2!10260 lt!353495))))))

(assert (=> d!75769 (= (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353495))) (currentByte!10055 (_2!10260 lt!353495)) (currentBit!10050 (_2!10260 lt!353495))) lt!353678)))

(declare-fun b!223521 () Bool)

(declare-fun res!187638 () Bool)

(assert (=> b!223521 (=> (not res!187638) (not e!152136))))

(assert (=> b!223521 (= res!187638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353678))))

(declare-fun b!223522 () Bool)

(declare-fun lt!353683 () (_ BitVec 64))

(assert (=> b!223522 (= e!152136 (bvsle lt!353678 (bvmul lt!353683 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223522 (or (= lt!353683 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353683 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353683)))))

(assert (=> b!223522 (= lt!353683 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353495)))))))

(assert (= (and d!75769 res!187639) b!223521))

(assert (= (and b!223521 res!187638) b!223522))

(assert (=> d!75769 m!342509))

(declare-fun m!342515 () Bool)

(assert (=> d!75769 m!342515))

(assert (=> b!223468 d!75769))

(declare-fun d!75771 () Bool)

(declare-fun lt!353685 () (_ BitVec 8))

(declare-fun lt!353688 () (_ BitVec 8))

(assert (=> d!75771 (= lt!353685 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5753 (buf!5358 (_2!10260 lt!353131))) (currentByte!10055 (_2!10260 lt!353131)))) ((_ sign_extend 24) lt!353688))))))

(assert (=> d!75771 (= lt!353688 ((_ extract 7 0) (currentBit!10050 (_2!10260 lt!353131))))))

(declare-fun e!152137 () Bool)

(assert (=> d!75771 e!152137))

(declare-fun res!187640 () Bool)

(assert (=> d!75771 (=> (not res!187640) (not e!152137))))

(assert (=> d!75771 (= res!187640 (validate_offset_bits!1 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!16220 () Unit!16176)

(declare-fun Unit!16221 () Unit!16176)

(assert (=> d!75771 (= (readByte!0 (_2!10260 lt!353131)) (tuple2!19081 (_2!10267 (ite (bvsgt ((_ sign_extend 24) lt!353688) #b00000000000000000000000000000000) (tuple2!19093 Unit!16220 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353685) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5753 (buf!5358 (_2!10260 lt!353131))) (bvadd (currentByte!10055 (_2!10260 lt!353131)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353688)))))))) (tuple2!19093 Unit!16221 lt!353685))) (BitStream!8731 (buf!5358 (_2!10260 lt!353131)) (bvadd (currentByte!10055 (_2!10260 lt!353131)) #b00000000000000000000000000000001) (currentBit!10050 (_2!10260 lt!353131)))))))

(declare-fun b!223523 () Bool)

(declare-fun e!152138 () Bool)

(assert (=> b!223523 (= e!152137 e!152138)))

(declare-fun res!187641 () Bool)

(assert (=> b!223523 (=> (not res!187641) (not e!152138))))

(declare-fun lt!353686 () tuple2!19080)

(assert (=> b!223523 (= res!187641 (= (buf!5358 (_2!10260 lt!353686)) (buf!5358 (_2!10260 lt!353131))))))

(declare-fun lt!353687 () (_ BitVec 8))

(declare-fun lt!353684 () (_ BitVec 8))

(declare-fun Unit!16222 () Unit!16176)

(declare-fun Unit!16223 () Unit!16176)

(assert (=> b!223523 (= lt!353686 (tuple2!19081 (_2!10267 (ite (bvsgt ((_ sign_extend 24) lt!353684) #b00000000000000000000000000000000) (tuple2!19093 Unit!16222 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353687) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5753 (buf!5358 (_2!10260 lt!353131))) (bvadd (currentByte!10055 (_2!10260 lt!353131)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353684)))))))) (tuple2!19093 Unit!16223 lt!353687))) (BitStream!8731 (buf!5358 (_2!10260 lt!353131)) (bvadd (currentByte!10055 (_2!10260 lt!353131)) #b00000000000000000000000000000001) (currentBit!10050 (_2!10260 lt!353131)))))))

(assert (=> b!223523 (= lt!353687 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5753 (buf!5358 (_2!10260 lt!353131))) (currentByte!10055 (_2!10260 lt!353131)))) ((_ sign_extend 24) lt!353684))))))

(assert (=> b!223523 (= lt!353684 ((_ extract 7 0) (currentBit!10050 (_2!10260 lt!353131))))))

(declare-fun lt!353690 () (_ BitVec 64))

(declare-fun b!223524 () Bool)

(declare-fun lt!353689 () (_ BitVec 64))

(assert (=> b!223524 (= e!152138 (= (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353686))) (currentByte!10055 (_2!10260 lt!353686)) (currentBit!10050 (_2!10260 lt!353686))) (bvadd lt!353690 lt!353689)))))

(assert (=> b!223524 (or (not (= (bvand lt!353690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353689 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353690 lt!353689) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223524 (= lt!353689 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223524 (= lt!353690 (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353131))) (currentByte!10055 (_2!10260 lt!353131)) (currentBit!10050 (_2!10260 lt!353131))))))

(assert (= (and d!75771 res!187640) b!223523))

(assert (= (and b!223523 res!187641) b!223524))

(declare-fun m!342517 () Bool)

(assert (=> d!75771 m!342517))

(declare-fun m!342519 () Bool)

(assert (=> d!75771 m!342519))

(declare-fun m!342521 () Bool)

(assert (=> d!75771 m!342521))

(assert (=> b!223523 m!342521))

(assert (=> b!223523 m!342517))

(declare-fun m!342523 () Bool)

(assert (=> b!223524 m!342523))

(assert (=> b!223524 m!342233))

(assert (=> b!223468 d!75771))

(declare-fun d!75773 () Bool)

(declare-fun e!152141 () Bool)

(assert (=> d!75773 e!152141))

(declare-fun res!187644 () Bool)

(assert (=> d!75773 (=> (not res!187644) (not e!152141))))

(assert (=> d!75773 (= res!187644 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))))))))

(declare-fun lt!353693 () Unit!16176)

(declare-fun choose!273 (array!10973 (_ BitVec 32) (_ BitVec 8)) Unit!16176)

(assert (=> d!75773 (= lt!353693 (choose!273 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10260 lt!353495)))))

(assert (=> d!75773 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))))))

(assert (=> d!75773 (= (arrayUpdatedAtPrefixLemma!306 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10260 lt!353495)) lt!353693)))

(declare-fun b!223527 () Bool)

(assert (=> b!223527 (= e!152141 (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (array!10974 (store (arr!5753 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10260 lt!353495)) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75773 res!187644) b!223527))

(declare-fun m!342525 () Bool)

(assert (=> d!75773 m!342525))

(assert (=> b!223527 m!342383))

(declare-fun m!342527 () Bool)

(assert (=> b!223527 m!342527))

(assert (=> b!223468 d!75773))

(declare-fun d!75775 () Bool)

(declare-fun res!187645 () Bool)

(declare-fun e!152142 () Bool)

(assert (=> d!75775 (=> res!187645 e!152142)))

(assert (=> d!75775 (= res!187645 (= lt!353487 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!75775 (= (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (_3!719 lt!353485) lt!353487 (bvadd #b00000000000000000000000000000001 i!761)) e!152142)))

(declare-fun b!223528 () Bool)

(declare-fun e!152143 () Bool)

(assert (=> b!223528 (= e!152142 e!152143)))

(declare-fun res!187646 () Bool)

(assert (=> b!223528 (=> (not res!187646) (not e!152143))))

(assert (=> b!223528 (= res!187646 (= (select (arr!5753 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) lt!353487) (select (arr!5753 (_3!719 lt!353485)) lt!353487)))))

(declare-fun b!223529 () Bool)

(assert (=> b!223529 (= e!152143 (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (_3!719 lt!353485) (bvadd lt!353487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75775 (not res!187645)) b!223528))

(assert (= (and b!223528 res!187646) b!223529))

(declare-fun m!342529 () Bool)

(assert (=> b!223528 m!342529))

(declare-fun m!342531 () Bool)

(assert (=> b!223528 m!342531))

(declare-fun m!342533 () Bool)

(assert (=> b!223529 m!342533))

(assert (=> b!223468 d!75775))

(declare-fun d!75777 () Bool)

(declare-fun e!152144 () Bool)

(assert (=> d!75777 e!152144))

(declare-fun res!187648 () Bool)

(assert (=> d!75777 (=> (not res!187648) (not e!152144))))

(declare-fun lt!353696 () (_ BitVec 64))

(declare-fun lt!353697 () (_ BitVec 64))

(declare-fun lt!353694 () (_ BitVec 64))

(assert (=> d!75777 (= res!187648 (= lt!353694 (bvsub lt!353696 lt!353697)))))

(assert (=> d!75777 (or (= (bvand lt!353696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353697 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353696 lt!353697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75777 (= lt!353697 (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353589)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353589))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353589)))))))

(declare-fun lt!353698 () (_ BitVec 64))

(declare-fun lt!353695 () (_ BitVec 64))

(assert (=> d!75777 (= lt!353696 (bvmul lt!353698 lt!353695))))

(assert (=> d!75777 (or (= lt!353698 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353695 (bvsdiv (bvmul lt!353698 lt!353695) lt!353698)))))

(assert (=> d!75777 (= lt!353695 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75777 (= lt!353698 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353589)))))))

(assert (=> d!75777 (= lt!353694 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353589))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353589)))))))

(assert (=> d!75777 (invariant!0 (currentBit!10050 (_2!10260 lt!353589)) (currentByte!10055 (_2!10260 lt!353589)) (size!4814 (buf!5358 (_2!10260 lt!353589))))))

(assert (=> d!75777 (= (bitIndex!0 (size!4814 (buf!5358 (_2!10260 lt!353589))) (currentByte!10055 (_2!10260 lt!353589)) (currentBit!10050 (_2!10260 lt!353589))) lt!353694)))

(declare-fun b!223530 () Bool)

(declare-fun res!187647 () Bool)

(assert (=> b!223530 (=> (not res!187647) (not e!152144))))

(assert (=> b!223530 (= res!187647 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353694))))

(declare-fun b!223531 () Bool)

(declare-fun lt!353699 () (_ BitVec 64))

(assert (=> b!223531 (= e!152144 (bvsle lt!353694 (bvmul lt!353699 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223531 (or (= lt!353699 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353699 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353699)))))

(assert (=> b!223531 (= lt!353699 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353589)))))))

(assert (= (and d!75777 res!187648) b!223530))

(assert (= (and b!223530 res!187647) b!223531))

(declare-fun m!342535 () Bool)

(assert (=> d!75777 m!342535))

(declare-fun m!342537 () Bool)

(assert (=> d!75777 m!342537))

(assert (=> b!223495 d!75777))

(assert (=> b!223495 d!75733))

(declare-fun d!75779 () Bool)

(declare-fun res!187649 () Bool)

(declare-fun e!152145 () Bool)

(assert (=> d!75779 (=> res!187649 e!152145)))

(assert (=> d!75779 (= res!187649 (= #b00000000000000000000000000000000 (ite c!11102 (bvadd #b00000000000000000000000000000001 i!761) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))))))))

(assert (=> d!75779 (= (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (ite c!11102 (_3!719 lt!353485) (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) #b00000000000000000000000000000000 (ite c!11102 (bvadd #b00000000000000000000000000000001 i!761) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))))) e!152145)))

(declare-fun b!223532 () Bool)

(declare-fun e!152146 () Bool)

(assert (=> b!223532 (= e!152145 e!152146)))

(declare-fun res!187650 () Bool)

(assert (=> b!223532 (=> (not res!187650) (not e!152146))))

(assert (=> b!223532 (= res!187650 (= (select (arr!5753 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) #b00000000000000000000000000000000) (select (arr!5753 (ite c!11102 (_3!719 lt!353485) (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)))) #b00000000000000000000000000000000)))))

(declare-fun b!223533 () Bool)

(assert (=> b!223533 (= e!152146 (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (ite c!11102 (_3!719 lt!353485) (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11102 (bvadd #b00000000000000000000000000000001 i!761) (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))))))))

(assert (= (and d!75779 (not res!187649)) b!223532))

(assert (= (and b!223532 res!187650) b!223533))

(declare-fun m!342539 () Bool)

(assert (=> b!223532 m!342539))

(declare-fun m!342541 () Bool)

(assert (=> b!223532 m!342541))

(declare-fun m!342543 () Bool)

(assert (=> b!223533 m!342543))

(assert (=> bm!3522 d!75779))

(assert (=> d!75745 d!75753))

(declare-fun d!75781 () Bool)

(assert (=> d!75781 (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) #b00000000000000000000000000000000 (size!4814 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))))))

(declare-fun lt!353702 () Unit!16176)

(declare-fun choose!274 (array!10973) Unit!16176)

(assert (=> d!75781 (= lt!353702 (choose!274 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))))))

(assert (=> d!75781 (= (arrayRangesEqReflexiveLemma!66 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) lt!353702)))

(declare-fun bs!18477 () Bool)

(assert (= bs!18477 d!75781))

(declare-fun m!342545 () Bool)

(assert (=> bs!18477 m!342545))

(declare-fun m!342547 () Bool)

(assert (=> bs!18477 m!342547))

(assert (=> b!223469 d!75781))

(declare-fun d!75783 () Bool)

(assert (=> d!75783 (arrayRangesEq!714 lt!353489 lt!353478 lt!353498 lt!353475)))

(declare-fun lt!353705 () Unit!16176)

(declare-fun choose!275 (array!10973 array!10973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16176)

(assert (=> d!75783 (= lt!353705 (choose!275 lt!353489 lt!353478 lt!353477 lt!353483 lt!353498 lt!353475))))

(assert (=> d!75783 (and (bvsle #b00000000000000000000000000000000 lt!353477) (bvsle lt!353477 lt!353483))))

(assert (=> d!75783 (= (arrayRangesEqSlicedLemma!66 lt!353489 lt!353478 lt!353477 lt!353483 lt!353498 lt!353475) lt!353705)))

(declare-fun bs!18478 () Bool)

(assert (= bs!18478 d!75783))

(declare-fun m!342549 () Bool)

(assert (=> bs!18478 m!342549))

(declare-fun m!342551 () Bool)

(assert (=> bs!18478 m!342551))

(assert (=> b!223469 d!75783))

(declare-fun d!75785 () Bool)

(assert (=> d!75785 (= (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131)))) (bvsub (bvmul ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10260 lt!353131)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10055 (_2!10260 lt!353131))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10050 (_2!10260 lt!353131))))))))

(assert (=> d!75731 d!75785))

(declare-fun d!75787 () Bool)

(assert (=> d!75787 (= (invariant!0 (currentBit!10050 (_2!10260 lt!353131)) (currentByte!10055 (_2!10260 lt!353131)) (size!4814 (buf!5358 (_2!10260 lt!353131)))) (and (bvsge (currentBit!10050 (_2!10260 lt!353131)) #b00000000000000000000000000000000) (bvslt (currentBit!10050 (_2!10260 lt!353131)) #b00000000000000000000000000001000) (bvsge (currentByte!10055 (_2!10260 lt!353131)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10055 (_2!10260 lt!353131)) (size!4814 (buf!5358 (_2!10260 lt!353131)))) (and (= (currentBit!10050 (_2!10260 lt!353131)) #b00000000000000000000000000000000) (= (currentByte!10055 (_2!10260 lt!353131)) (size!4814 (buf!5358 (_2!10260 lt!353131))))))))))

(assert (=> d!75731 d!75787))

(declare-fun d!75789 () Bool)

(assert (=> d!75789 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))) ((_ sign_extend 32) (currentByte!10055 thiss!1870)) ((_ sign_extend 32) (currentBit!10050 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 thiss!1870))) ((_ sign_extend 32) (currentByte!10055 thiss!1870)) ((_ sign_extend 32) (currentBit!10050 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18479 () Bool)

(assert (= bs!18479 d!75789))

(assert (=> bs!18479 m!342445))

(assert (=> d!75710 d!75789))

(assert (=> d!75735 d!75785))

(assert (=> bm!3520 d!75731))

(declare-fun d!75791 () Bool)

(declare-fun lt!353708 () tuple2!19080)

(assert (=> d!75791 (= lt!353708 (readByte!0 (_2!10260 lt!353131)))))

(assert (=> d!75791 (= (readBytePure!0 (_2!10260 lt!353131)) (tuple2!19091 (_2!10260 lt!353708) (_1!10260 lt!353708)))))

(declare-fun bs!18480 () Bool)

(assert (= bs!18480 d!75791))

(assert (=> bs!18480 m!342375))

(assert (=> b!223465 d!75791))

(assert (=> d!75743 d!75755))

(declare-fun d!75793 () Bool)

(declare-fun res!187651 () Bool)

(declare-fun e!152147 () Bool)

(assert (=> d!75793 (=> res!187651 e!152147)))

(assert (=> d!75793 (= res!187651 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!75793 (= (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (_3!719 lt!353507) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) e!152147)))

(declare-fun b!223534 () Bool)

(declare-fun e!152148 () Bool)

(assert (=> b!223534 (= e!152147 e!152148)))

(declare-fun res!187652 () Bool)

(assert (=> b!223534 (=> (not res!187652) (not e!152148))))

(assert (=> b!223534 (= res!187652 (= (select (arr!5753 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308))) #b00000000000000000000000000000000) (select (arr!5753 (_3!719 lt!353507)) #b00000000000000000000000000000000)))))

(declare-fun b!223535 () Bool)

(assert (=> b!223535 (= e!152148 (arrayRangesEq!714 (array!10974 (store (arr!5753 arr!308) i!761 (_1!10260 lt!353131)) (size!4814 arr!308)) (_3!719 lt!353507) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75793 (not res!187651)) b!223534))

(assert (= (and b!223534 res!187652) b!223535))

(assert (=> b!223534 m!342539))

(declare-fun m!342553 () Bool)

(assert (=> b!223534 m!342553))

(declare-fun m!342555 () Bool)

(assert (=> b!223535 m!342555))

(assert (=> b!223466 d!75793))

(declare-fun d!75795 () Bool)

(declare-fun e!152149 () Bool)

(assert (=> d!75795 e!152149))

(declare-fun res!187654 () Bool)

(assert (=> d!75795 (=> (not res!187654) (not e!152149))))

(declare-fun lt!353711 () (_ BitVec 64))

(declare-fun lt!353709 () (_ BitVec 64))

(declare-fun lt!353712 () (_ BitVec 64))

(assert (=> d!75795 (= res!187654 (= lt!353709 (bvsub lt!353711 lt!353712)))))

(assert (=> d!75795 (or (= (bvand lt!353711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353712 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353711 lt!353712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75795 (= lt!353712 (remainingBits!0 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10259 lt!353507)))) ((_ sign_extend 32) (currentByte!10055 (_2!10259 lt!353507))) ((_ sign_extend 32) (currentBit!10050 (_2!10259 lt!353507)))))))

(declare-fun lt!353713 () (_ BitVec 64))

(declare-fun lt!353710 () (_ BitVec 64))

(assert (=> d!75795 (= lt!353711 (bvmul lt!353713 lt!353710))))

(assert (=> d!75795 (or (= lt!353713 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353710 (bvsdiv (bvmul lt!353713 lt!353710) lt!353713)))))

(assert (=> d!75795 (= lt!353710 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75795 (= lt!353713 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10259 lt!353507)))))))

(assert (=> d!75795 (= lt!353709 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10055 (_2!10259 lt!353507))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10050 (_2!10259 lt!353507)))))))

(assert (=> d!75795 (invariant!0 (currentBit!10050 (_2!10259 lt!353507)) (currentByte!10055 (_2!10259 lt!353507)) (size!4814 (buf!5358 (_2!10259 lt!353507))))))

(assert (=> d!75795 (= (bitIndex!0 (size!4814 (buf!5358 (_2!10259 lt!353507))) (currentByte!10055 (_2!10259 lt!353507)) (currentBit!10050 (_2!10259 lt!353507))) lt!353709)))

(declare-fun b!223536 () Bool)

(declare-fun res!187653 () Bool)

(assert (=> b!223536 (=> (not res!187653) (not e!152149))))

(assert (=> b!223536 (= res!187653 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353709))))

(declare-fun b!223537 () Bool)

(declare-fun lt!353714 () (_ BitVec 64))

(assert (=> b!223537 (= e!152149 (bvsle lt!353709 (bvmul lt!353714 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223537 (or (= lt!353714 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353714 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353714)))))

(assert (=> b!223537 (= lt!353714 ((_ sign_extend 32) (size!4814 (buf!5358 (_2!10259 lt!353507)))))))

(assert (= (and d!75795 res!187654) b!223536))

(assert (= (and b!223536 res!187653) b!223537))

(declare-fun m!342557 () Bool)

(assert (=> d!75795 m!342557))

(declare-fun m!342559 () Bool)

(assert (=> d!75795 m!342559))

(assert (=> d!75694 d!75795))

(assert (=> d!75694 d!75731))

(check-sat (not d!75789) (not b!223524) (not d!75749) (not d!75771) (not bm!3524) (not bm!3523) (not b!223529) (not bm!3525) (not d!75767) (not b!223516) (not b!223518) (not d!75781) (not b!223527) (not d!75769) (not d!75777) (not d!75765) (not d!75761) (not d!75783) (not b!223533) (not d!75791) (not d!75757) (not d!75759) (not b!223513) (not d!75751) (not d!75773) (not b!223517) (not b!223514) (not d!75795) (not b!223512) (not d!75763) (not b!223535))
