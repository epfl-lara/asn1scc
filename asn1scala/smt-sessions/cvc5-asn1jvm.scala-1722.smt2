; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47552 () Bool)

(assert start!47552)

(declare-fun b!226543 () Bool)

(declare-fun res!190085 () Bool)

(declare-fun e!154873 () Bool)

(assert (=> b!226543 (=> (not res!190085) (not e!154873))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226543 (= res!190085 (bvslt i!761 to!496))))

(declare-fun b!226542 () Bool)

(declare-fun res!190086 () Bool)

(assert (=> b!226542 (=> (not res!190086) (not e!154873))))

(declare-datatypes ((array!11336 0))(
  ( (array!11337 (arr!5938 (Array (_ BitVec 32) (_ BitVec 8))) (size!4972 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9040 0))(
  ( (BitStream!9041 (buf!5513 array!11336) (currentByte!10333 (_ BitVec 32)) (currentBit!10328 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9040)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226542 (= res!190086 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4972 (buf!5513 thiss!1870))) ((_ sign_extend 32) (currentByte!10333 thiss!1870)) ((_ sign_extend 32) (currentBit!10328 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226545 () Bool)

(declare-fun e!154875 () Bool)

(declare-fun array_inv!4713 (array!11336) Bool)

(assert (=> b!226545 (= e!154875 (array_inv!4713 (buf!5513 thiss!1870)))))

(declare-fun res!190087 () Bool)

(assert (=> start!47552 (=> (not res!190087) (not e!154873))))

(declare-fun arr!308 () array!11336)

(assert (=> start!47552 (= res!190087 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4972 arr!308))))))

(assert (=> start!47552 e!154873))

(assert (=> start!47552 true))

(assert (=> start!47552 (array_inv!4713 arr!308)))

(declare-fun inv!12 (BitStream!9040) Bool)

(assert (=> start!47552 (and (inv!12 thiss!1870) e!154875)))

(declare-datatypes ((Unit!16788 0))(
  ( (Unit!16789) )
))
(declare-datatypes ((tuple3!1326 0))(
  ( (tuple3!1327 (_1!10520 Unit!16788) (_2!10520 BitStream!9040) (_3!805 array!11336)) )
))
(declare-fun lt!360850 () tuple3!1326)

(declare-fun lt!360847 () (_ BitVec 64))

(declare-fun lt!360852 () (_ BitVec 32))

(declare-fun b!226544 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226544 (= e!154873 (not (= (bvadd lt!360847 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!360852))) (bitIndex!0 (size!4972 (buf!5513 (_2!10520 lt!360850))) (currentByte!10333 (_2!10520 lt!360850)) (currentBit!10328 (_2!10520 lt!360850))))))))

(declare-fun lt!360849 () (_ BitVec 64))

(assert (=> b!226544 (= lt!360847 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!360849))))

(declare-datatypes ((tuple2!19430 0))(
  ( (tuple2!19431 (_1!10521 (_ BitVec 8)) (_2!10521 BitStream!9040)) )
))
(declare-fun lt!360851 () tuple2!19430)

(assert (=> b!226544 (= lt!360847 (bitIndex!0 (size!4972 (buf!5513 (_2!10521 lt!360851))) (currentByte!10333 (_2!10521 lt!360851)) (currentBit!10328 (_2!10521 lt!360851))))))

(assert (=> b!226544 (= lt!360849 (bitIndex!0 (size!4972 (buf!5513 thiss!1870)) (currentByte!10333 thiss!1870) (currentBit!10328 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9040 array!11336 (_ BitVec 32) (_ BitVec 32)) tuple3!1326)

(assert (=> b!226544 (= lt!360850 (readByteArrayLoop!0 (_2!10521 lt!360851) (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226544 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10521 lt!360851)))) ((_ sign_extend 32) (currentByte!10333 (_2!10521 lt!360851))) ((_ sign_extend 32) (currentBit!10328 (_2!10521 lt!360851))) lt!360852)))

(assert (=> b!226544 (= lt!360852 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360848 () Unit!16788)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9040 BitStream!9040 (_ BitVec 64) (_ BitVec 32)) Unit!16788)

(assert (=> b!226544 (= lt!360848 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10521 lt!360851) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9040) tuple2!19430)

(assert (=> b!226544 (= lt!360851 (readByte!0 thiss!1870))))

(assert (= (and start!47552 res!190087) b!226542))

(assert (= (and b!226542 res!190086) b!226543))

(assert (= (and b!226543 res!190085) b!226544))

(assert (= start!47552 b!226545))

(declare-fun m!348037 () Bool)

(assert (=> b!226542 m!348037))

(declare-fun m!348039 () Bool)

(assert (=> b!226545 m!348039))

(declare-fun m!348041 () Bool)

(assert (=> start!47552 m!348041))

(declare-fun m!348043 () Bool)

(assert (=> start!47552 m!348043))

(declare-fun m!348045 () Bool)

(assert (=> b!226544 m!348045))

(declare-fun m!348047 () Bool)

(assert (=> b!226544 m!348047))

(declare-fun m!348049 () Bool)

(assert (=> b!226544 m!348049))

(declare-fun m!348051 () Bool)

(assert (=> b!226544 m!348051))

(declare-fun m!348053 () Bool)

(assert (=> b!226544 m!348053))

(declare-fun m!348055 () Bool)

(assert (=> b!226544 m!348055))

(declare-fun m!348057 () Bool)

(assert (=> b!226544 m!348057))

(declare-fun m!348059 () Bool)

(assert (=> b!226544 m!348059))

(push 1)

(assert (not b!226544))

(assert (not b!226545))

(assert (not b!226542))

(assert (not start!47552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76905 () Bool)

(declare-fun e!154903 () Bool)

(assert (=> d!76905 e!154903))

(declare-fun res!190112 () Bool)

(assert (=> d!76905 (=> (not res!190112) (not e!154903))))

(declare-fun lt!360905 () (_ BitVec 64))

(declare-fun lt!360903 () (_ BitVec 64))

(declare-fun lt!360904 () (_ BitVec 64))

(assert (=> d!76905 (= res!190112 (= lt!360905 (bvsub lt!360903 lt!360904)))))

(assert (=> d!76905 (or (= (bvand lt!360903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360903 lt!360904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76905 (= lt!360904 (remainingBits!0 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10521 lt!360851)))) ((_ sign_extend 32) (currentByte!10333 (_2!10521 lt!360851))) ((_ sign_extend 32) (currentBit!10328 (_2!10521 lt!360851)))))))

(declare-fun lt!360906 () (_ BitVec 64))

(declare-fun lt!360902 () (_ BitVec 64))

(assert (=> d!76905 (= lt!360903 (bvmul lt!360906 lt!360902))))

(assert (=> d!76905 (or (= lt!360906 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360902 (bvsdiv (bvmul lt!360906 lt!360902) lt!360906)))))

(assert (=> d!76905 (= lt!360902 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76905 (= lt!360906 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10521 lt!360851)))))))

(assert (=> d!76905 (= lt!360905 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10333 (_2!10521 lt!360851))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10328 (_2!10521 lt!360851)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76905 (invariant!0 (currentBit!10328 (_2!10521 lt!360851)) (currentByte!10333 (_2!10521 lt!360851)) (size!4972 (buf!5513 (_2!10521 lt!360851))))))

(assert (=> d!76905 (= (bitIndex!0 (size!4972 (buf!5513 (_2!10521 lt!360851))) (currentByte!10333 (_2!10521 lt!360851)) (currentBit!10328 (_2!10521 lt!360851))) lt!360905)))

(declare-fun b!226574 () Bool)

(declare-fun res!190111 () Bool)

(assert (=> b!226574 (=> (not res!190111) (not e!154903))))

(assert (=> b!226574 (= res!190111 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360905))))

(declare-fun b!226575 () Bool)

(declare-fun lt!360901 () (_ BitVec 64))

(assert (=> b!226575 (= e!154903 (bvsle lt!360905 (bvmul lt!360901 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226575 (or (= lt!360901 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360901 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360901)))))

(assert (=> b!226575 (= lt!360901 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10521 lt!360851)))))))

(assert (= (and d!76905 res!190112) b!226574))

(assert (= (and b!226574 res!190111) b!226575))

(declare-fun m!348113 () Bool)

(assert (=> d!76905 m!348113))

(declare-fun m!348115 () Bool)

(assert (=> d!76905 m!348115))

(assert (=> b!226544 d!76905))

(declare-fun d!76909 () Bool)

(declare-fun e!154904 () Bool)

(assert (=> d!76909 e!154904))

(declare-fun res!190114 () Bool)

(assert (=> d!76909 (=> (not res!190114) (not e!154904))))

(declare-fun lt!360910 () (_ BitVec 64))

(declare-fun lt!360911 () (_ BitVec 64))

(declare-fun lt!360909 () (_ BitVec 64))

(assert (=> d!76909 (= res!190114 (= lt!360911 (bvsub lt!360909 lt!360910)))))

(assert (=> d!76909 (or (= (bvand lt!360909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360910 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360909 lt!360910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76909 (= lt!360910 (remainingBits!0 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10520 lt!360850)))) ((_ sign_extend 32) (currentByte!10333 (_2!10520 lt!360850))) ((_ sign_extend 32) (currentBit!10328 (_2!10520 lt!360850)))))))

(declare-fun lt!360912 () (_ BitVec 64))

(declare-fun lt!360908 () (_ BitVec 64))

(assert (=> d!76909 (= lt!360909 (bvmul lt!360912 lt!360908))))

(assert (=> d!76909 (or (= lt!360912 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360908 (bvsdiv (bvmul lt!360912 lt!360908) lt!360912)))))

(assert (=> d!76909 (= lt!360908 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76909 (= lt!360912 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10520 lt!360850)))))))

(assert (=> d!76909 (= lt!360911 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10333 (_2!10520 lt!360850))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10328 (_2!10520 lt!360850)))))))

(assert (=> d!76909 (invariant!0 (currentBit!10328 (_2!10520 lt!360850)) (currentByte!10333 (_2!10520 lt!360850)) (size!4972 (buf!5513 (_2!10520 lt!360850))))))

(assert (=> d!76909 (= (bitIndex!0 (size!4972 (buf!5513 (_2!10520 lt!360850))) (currentByte!10333 (_2!10520 lt!360850)) (currentBit!10328 (_2!10520 lt!360850))) lt!360911)))

(declare-fun b!226576 () Bool)

(declare-fun res!190113 () Bool)

(assert (=> b!226576 (=> (not res!190113) (not e!154904))))

(assert (=> b!226576 (= res!190113 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360911))))

(declare-fun b!226577 () Bool)

(declare-fun lt!360907 () (_ BitVec 64))

(assert (=> b!226577 (= e!154904 (bvsle lt!360911 (bvmul lt!360907 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226577 (or (= lt!360907 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360907 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360907)))))

(assert (=> b!226577 (= lt!360907 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10520 lt!360850)))))))

(assert (= (and d!76909 res!190114) b!226576))

(assert (= (and b!226576 res!190113) b!226577))

(declare-fun m!348117 () Bool)

(assert (=> d!76909 m!348117))

(declare-fun m!348119 () Bool)

(assert (=> d!76909 m!348119))

(assert (=> b!226544 d!76909))

(declare-fun b!226656 () Bool)

(declare-fun res!190178 () Bool)

(declare-fun e!154959 () Bool)

(assert (=> b!226656 (=> (not res!190178) (not e!154959))))

(declare-fun lt!361349 () tuple3!1326)

(assert (=> b!226656 (= res!190178 (and (= (buf!5513 (_2!10521 lt!360851)) (buf!5513 (_2!10520 lt!361349))) (= (size!4972 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308))) (size!4972 (_3!805 lt!361349)))))))

(declare-fun d!76911 () Bool)

(declare-fun e!154958 () Bool)

(assert (=> d!76911 e!154958))

(declare-fun res!190179 () Bool)

(assert (=> d!76911 (=> res!190179 e!154958)))

(assert (=> d!76911 (= res!190179 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!361337 () Bool)

(assert (=> d!76911 (= lt!361337 e!154959)))

(declare-fun res!190180 () Bool)

(assert (=> d!76911 (=> (not res!190180) (not e!154959))))

(declare-fun lt!361321 () (_ BitVec 64))

(declare-fun lt!361334 () (_ BitVec 64))

(assert (=> d!76911 (= res!190180 (= (bvadd lt!361321 lt!361334) (bitIndex!0 (size!4972 (buf!5513 (_2!10520 lt!361349))) (currentByte!10333 (_2!10520 lt!361349)) (currentBit!10328 (_2!10520 lt!361349)))))))

(assert (=> d!76911 (or (not (= (bvand lt!361321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361334 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!361321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!361321 lt!361334) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!361325 () (_ BitVec 64))

(assert (=> d!76911 (= lt!361334 (bvmul lt!361325 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76911 (or (= lt!361325 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361325 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361325)))))

(assert (=> d!76911 (= lt!361325 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76911 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76911 (= lt!361321 (bitIndex!0 (size!4972 (buf!5513 (_2!10521 lt!360851))) (currentByte!10333 (_2!10521 lt!360851)) (currentBit!10328 (_2!10521 lt!360851))))))

(declare-fun e!154957 () tuple3!1326)

(assert (=> d!76911 (= lt!361349 e!154957)))

(declare-fun c!11185 () Bool)

(assert (=> d!76911 (= c!11185 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76911 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4972 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)))))))

(assert (=> d!76911 (= (readByteArrayLoop!0 (_2!10521 lt!360851) (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!361349)))

(declare-fun b!226657 () Bool)

(declare-fun arrayRangesEq!822 (array!11336 array!11336 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226657 (= e!154959 (arrayRangesEq!822 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)) (_3!805 lt!361349) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361354 () Unit!16788)

(declare-fun b!226658 () Bool)

(assert (=> b!226658 (= e!154957 (tuple3!1327 lt!361354 (_2!10521 lt!360851) (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308))))))

(declare-fun call!3774 () (_ BitVec 64))

(assert (=> b!226658 (= call!3774 call!3774)))

(declare-fun lt!361322 () Unit!16788)

(declare-fun Unit!16816 () Unit!16788)

(assert (=> b!226658 (= lt!361322 Unit!16816)))

(declare-fun lt!361335 () Unit!16788)

(declare-fun arrayRangesEqReflexiveLemma!126 (array!11336) Unit!16788)

(assert (=> b!226658 (= lt!361335 (arrayRangesEqReflexiveLemma!126 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308))))))

(declare-fun call!3772 () Bool)

(assert (=> b!226658 call!3772))

(declare-fun lt!361326 () Unit!16788)

(assert (=> b!226658 (= lt!361326 lt!361335)))

(declare-fun lt!361345 () array!11336)

(assert (=> b!226658 (= lt!361345 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)))))

(declare-fun lt!361331 () array!11336)

(assert (=> b!226658 (= lt!361331 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)))))

(declare-fun lt!361324 () (_ BitVec 32))

(assert (=> b!226658 (= lt!361324 #b00000000000000000000000000000000)))

(declare-fun lt!361344 () (_ BitVec 32))

(assert (=> b!226658 (= lt!361344 (size!4972 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308))))))

(declare-fun lt!361351 () (_ BitVec 32))

(assert (=> b!226658 (= lt!361351 #b00000000000000000000000000000000)))

(declare-fun lt!361327 () (_ BitVec 32))

(assert (=> b!226658 (= lt!361327 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!111 (array!11336 array!11336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16788)

(assert (=> b!226658 (= lt!361354 (arrayRangesEqSlicedLemma!111 lt!361345 lt!361331 lt!361324 lt!361344 lt!361351 lt!361327))))

(declare-fun call!3773 () Bool)

(assert (=> b!226658 call!3773))

(declare-fun lt!361346 () tuple2!19430)

(declare-fun bm!3769 () Bool)

(assert (=> bm!3769 (= call!3774 (bitIndex!0 (ite c!11185 (size!4972 (buf!5513 (_2!10521 lt!361346))) (size!4972 (buf!5513 (_2!10521 lt!360851)))) (ite c!11185 (currentByte!10333 (_2!10521 lt!361346)) (currentByte!10333 (_2!10521 lt!360851))) (ite c!11185 (currentBit!10328 (_2!10521 lt!361346)) (currentBit!10328 (_2!10521 lt!360851)))))))

(declare-fun bm!3770 () Bool)

(assert (=> bm!3770 (= call!3772 (arrayRangesEq!822 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)) (ite c!11185 (array!11337 (store (arr!5938 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10521 lt!361346)) (size!4972 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)))) (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308))) #b00000000000000000000000000000000 (ite c!11185 (bvadd #b00000000000000000000000000000001 i!761) (size!4972 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308))))))))

(declare-fun lt!361340 () tuple3!1326)

(declare-fun bm!3771 () Bool)

(declare-fun lt!361338 () (_ BitVec 32))

(assert (=> bm!3771 (= call!3773 (arrayRangesEq!822 (ite c!11185 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)) lt!361345) (ite c!11185 (_3!805 lt!361340) lt!361331) (ite c!11185 lt!361338 lt!361351) (ite c!11185 (bvadd #b00000000000000000000000000000001 i!761) lt!361327)))))

(declare-fun b!226659 () Bool)

(declare-datatypes ((tuple2!19444 0))(
  ( (tuple2!19445 (_1!10530 BitStream!9040) (_2!10530 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9040) tuple2!19444)

(assert (=> b!226659 (= e!154958 (= (select (arr!5938 (_3!805 lt!361349)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10530 (readBytePure!0 (_2!10521 lt!360851)))))))

(assert (=> b!226659 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4972 (_3!805 lt!361349))))))

(declare-fun b!226660 () Bool)

(declare-fun lt!361355 () Unit!16788)

(assert (=> b!226660 (= e!154957 (tuple3!1327 lt!361355 (_2!10520 lt!361340) (_3!805 lt!361340)))))

(assert (=> b!226660 (= lt!361346 (readByte!0 (_2!10521 lt!360851)))))

(declare-fun lt!361328 () array!11336)

(assert (=> b!226660 (= lt!361328 (array!11337 (store (arr!5938 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10521 lt!361346)) (size!4972 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)))))))

(declare-fun lt!361330 () (_ BitVec 64))

(assert (=> b!226660 (= lt!361330 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!361347 () (_ BitVec 32))

(assert (=> b!226660 (= lt!361347 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361352 () Unit!16788)

(assert (=> b!226660 (= lt!361352 (validateOffsetBytesFromBitIndexLemma!0 (_2!10521 lt!360851) (_2!10521 lt!361346) lt!361330 lt!361347))))

(assert (=> b!226660 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10521 lt!361346)))) ((_ sign_extend 32) (currentByte!10333 (_2!10521 lt!361346))) ((_ sign_extend 32) (currentBit!10328 (_2!10521 lt!361346))) (bvsub lt!361347 ((_ extract 31 0) (bvsdiv (bvadd lt!361330 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!361348 () Unit!16788)

(assert (=> b!226660 (= lt!361348 lt!361352)))

(assert (=> b!226660 (= lt!361340 (readByteArrayLoop!0 (_2!10521 lt!361346) lt!361328 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226660 (= call!3774 (bvadd (bitIndex!0 (size!4972 (buf!5513 (_2!10521 lt!360851))) (currentByte!10333 (_2!10521 lt!360851)) (currentBit!10328 (_2!10521 lt!360851))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!361332 () Unit!16788)

(declare-fun Unit!16817 () Unit!16788)

(assert (=> b!226660 (= lt!361332 Unit!16817)))

(assert (=> b!226660 (= (bvadd call!3774 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4972 (buf!5513 (_2!10520 lt!361340))) (currentByte!10333 (_2!10520 lt!361340)) (currentBit!10328 (_2!10520 lt!361340))))))

(declare-fun lt!361329 () Unit!16788)

(declare-fun Unit!16818 () Unit!16788)

(assert (=> b!226660 (= lt!361329 Unit!16818)))

(assert (=> b!226660 (= (bvadd (bitIndex!0 (size!4972 (buf!5513 (_2!10521 lt!360851))) (currentByte!10333 (_2!10521 lt!360851)) (currentBit!10328 (_2!10521 lt!360851))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4972 (buf!5513 (_2!10520 lt!361340))) (currentByte!10333 (_2!10520 lt!361340)) (currentBit!10328 (_2!10520 lt!361340))))))

(declare-fun lt!361333 () Unit!16788)

(declare-fun Unit!16819 () Unit!16788)

(assert (=> b!226660 (= lt!361333 Unit!16819)))

(assert (=> b!226660 (and (= (buf!5513 (_2!10521 lt!360851)) (buf!5513 (_2!10520 lt!361340))) (= (size!4972 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308))) (size!4972 (_3!805 lt!361340))))))

(declare-fun lt!361323 () Unit!16788)

(declare-fun Unit!16820 () Unit!16788)

(assert (=> b!226660 (= lt!361323 Unit!16820)))

(declare-fun lt!361353 () Unit!16788)

(declare-fun arrayUpdatedAtPrefixLemma!381 (array!11336 (_ BitVec 32) (_ BitVec 8)) Unit!16788)

(assert (=> b!226660 (= lt!361353 (arrayUpdatedAtPrefixLemma!381 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10521 lt!361346)))))

(assert (=> b!226660 call!3772))

(declare-fun lt!361341 () Unit!16788)

(assert (=> b!226660 (= lt!361341 lt!361353)))

(assert (=> b!226660 (= lt!361338 #b00000000000000000000000000000000)))

(declare-fun lt!361343 () Unit!16788)

(declare-fun arrayRangesEqTransitive!260 (array!11336 array!11336 array!11336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16788)

(assert (=> b!226660 (= lt!361343 (arrayRangesEqTransitive!260 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)) lt!361328 (_3!805 lt!361340) lt!361338 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226660 call!3773))

(declare-fun lt!361350 () Unit!16788)

(assert (=> b!226660 (= lt!361350 lt!361343)))

(assert (=> b!226660 (arrayRangesEq!822 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308)) (_3!805 lt!361340) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!361336 () Unit!16788)

(declare-fun Unit!16821 () Unit!16788)

(assert (=> b!226660 (= lt!361336 Unit!16821)))

(declare-fun lt!361342 () Unit!16788)

(declare-fun arrayRangesEqImpliesEq!111 (array!11336 array!11336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16788)

(assert (=> b!226660 (= lt!361342 (arrayRangesEqImpliesEq!111 lt!361328 (_3!805 lt!361340) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226660 (= (select (store (arr!5938 (array!11337 (store (arr!5938 arr!308) i!761 (_1!10521 lt!360851)) (size!4972 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10521 lt!361346)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5938 (_3!805 lt!361340)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361356 () Unit!16788)

(assert (=> b!226660 (= lt!361356 lt!361342)))

(declare-fun lt!361339 () Bool)

(assert (=> b!226660 (= lt!361339 (= (select (arr!5938 (_3!805 lt!361340)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10521 lt!361346)))))

(declare-fun Unit!16822 () Unit!16788)

(assert (=> b!226660 (= lt!361355 Unit!16822)))

(assert (=> b!226660 lt!361339))

(assert (= (and d!76911 c!11185) b!226660))

(assert (= (and d!76911 (not c!11185)) b!226658))

(assert (= (or b!226660 b!226658) bm!3771))

(assert (= (or b!226660 b!226658) bm!3770))

(assert (= (or b!226660 b!226658) bm!3769))

(assert (= (and d!76911 res!190180) b!226656))

(assert (= (and b!226656 res!190178) b!226657))

(assert (= (and d!76911 (not res!190179)) b!226659))

(declare-fun m!348249 () Bool)

(assert (=> b!226658 m!348249))

(declare-fun m!348251 () Bool)

(assert (=> b!226658 m!348251))

(declare-fun m!348253 () Bool)

(assert (=> bm!3769 m!348253))

(declare-fun m!348255 () Bool)

(assert (=> d!76911 m!348255))

(assert (=> d!76911 m!348051))

(declare-fun m!348257 () Bool)

(assert (=> bm!3771 m!348257))

(declare-fun m!348259 () Bool)

(assert (=> b!226660 m!348259))

(declare-fun m!348261 () Bool)

(assert (=> b!226660 m!348261))

(declare-fun m!348263 () Bool)

(assert (=> b!226660 m!348263))

(declare-fun m!348265 () Bool)

(assert (=> b!226660 m!348265))

(declare-fun m!348267 () Bool)

(assert (=> b!226660 m!348267))

(declare-fun m!348269 () Bool)

(assert (=> b!226660 m!348269))

(declare-fun m!348271 () Bool)

(assert (=> b!226660 m!348271))

(assert (=> b!226660 m!348051))

(declare-fun m!348273 () Bool)

(assert (=> b!226660 m!348273))

(declare-fun m!348275 () Bool)

(assert (=> b!226660 m!348275))

(declare-fun m!348277 () Bool)

(assert (=> b!226660 m!348277))

(declare-fun m!348279 () Bool)

(assert (=> b!226660 m!348279))

(declare-fun m!348281 () Bool)

(assert (=> b!226660 m!348281))

(declare-fun m!348283 () Bool)

(assert (=> b!226659 m!348283))

(declare-fun m!348285 () Bool)

(assert (=> b!226659 m!348285))

(declare-fun m!348287 () Bool)

(assert (=> b!226657 m!348287))

(assert (=> bm!3770 m!348269))

(declare-fun m!348289 () Bool)

(assert (=> bm!3770 m!348289))

(assert (=> b!226544 d!76911))

(declare-fun d!76947 () Bool)

(declare-fun lt!361373 () (_ BitVec 8))

(declare-fun lt!361374 () (_ BitVec 8))

(assert (=> d!76947 (= lt!361373 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5938 (buf!5513 thiss!1870)) (currentByte!10333 thiss!1870))) ((_ sign_extend 24) lt!361374))))))

(assert (=> d!76947 (= lt!361374 ((_ extract 7 0) (currentBit!10328 thiss!1870)))))

(declare-fun e!154964 () Bool)

(assert (=> d!76947 e!154964))

(declare-fun res!190186 () Bool)

(assert (=> d!76947 (=> (not res!190186) (not e!154964))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76947 (= res!190186 (validate_offset_bits!1 ((_ sign_extend 32) (size!4972 (buf!5513 thiss!1870))) ((_ sign_extend 32) (currentByte!10333 thiss!1870)) ((_ sign_extend 32) (currentBit!10328 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19446 0))(
  ( (tuple2!19447 (_1!10531 Unit!16788) (_2!10531 (_ BitVec 8))) )
))
(declare-fun Unit!16823 () Unit!16788)

(declare-fun Unit!16824 () Unit!16788)

(assert (=> d!76947 (= (readByte!0 thiss!1870) (tuple2!19431 (_2!10531 (ite (bvsgt ((_ sign_extend 24) lt!361374) #b00000000000000000000000000000000) (tuple2!19447 Unit!16823 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!361373) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5938 (buf!5513 thiss!1870)) (bvadd (currentByte!10333 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!361374)))))))) (tuple2!19447 Unit!16824 lt!361373))) (BitStream!9041 (buf!5513 thiss!1870) (bvadd (currentByte!10333 thiss!1870) #b00000000000000000000000000000001) (currentBit!10328 thiss!1870))))))

(declare-fun b!226665 () Bool)

(declare-fun e!154965 () Bool)

(assert (=> b!226665 (= e!154964 e!154965)))

(declare-fun res!190187 () Bool)

(assert (=> b!226665 (=> (not res!190187) (not e!154965))))

(declare-fun lt!361371 () tuple2!19430)

(assert (=> b!226665 (= res!190187 (= (buf!5513 (_2!10521 lt!361371)) (buf!5513 thiss!1870)))))

(declare-fun lt!361376 () (_ BitVec 8))

(declare-fun lt!361377 () (_ BitVec 8))

(declare-fun Unit!16825 () Unit!16788)

(declare-fun Unit!16826 () Unit!16788)

(assert (=> b!226665 (= lt!361371 (tuple2!19431 (_2!10531 (ite (bvsgt ((_ sign_extend 24) lt!361376) #b00000000000000000000000000000000) (tuple2!19447 Unit!16825 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!361377) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5938 (buf!5513 thiss!1870)) (bvadd (currentByte!10333 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!361376)))))))) (tuple2!19447 Unit!16826 lt!361377))) (BitStream!9041 (buf!5513 thiss!1870) (bvadd (currentByte!10333 thiss!1870) #b00000000000000000000000000000001) (currentBit!10328 thiss!1870))))))

(assert (=> b!226665 (= lt!361377 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5938 (buf!5513 thiss!1870)) (currentByte!10333 thiss!1870))) ((_ sign_extend 24) lt!361376))))))

(assert (=> b!226665 (= lt!361376 ((_ extract 7 0) (currentBit!10328 thiss!1870)))))

(declare-fun b!226666 () Bool)

(declare-fun lt!361375 () (_ BitVec 64))

(declare-fun lt!361372 () (_ BitVec 64))

(assert (=> b!226666 (= e!154965 (= (bitIndex!0 (size!4972 (buf!5513 (_2!10521 lt!361371))) (currentByte!10333 (_2!10521 lt!361371)) (currentBit!10328 (_2!10521 lt!361371))) (bvadd lt!361372 lt!361375)))))

(assert (=> b!226666 (or (not (= (bvand lt!361372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361375 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!361372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!361372 lt!361375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226666 (= lt!361375 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226666 (= lt!361372 (bitIndex!0 (size!4972 (buf!5513 thiss!1870)) (currentByte!10333 thiss!1870) (currentBit!10328 thiss!1870)))))

(assert (= (and d!76947 res!190186) b!226665))

(assert (= (and b!226665 res!190187) b!226666))

(declare-fun m!348291 () Bool)

(assert (=> d!76947 m!348291))

(declare-fun m!348293 () Bool)

(assert (=> d!76947 m!348293))

(declare-fun m!348295 () Bool)

(assert (=> d!76947 m!348295))

(assert (=> b!226665 m!348295))

(assert (=> b!226665 m!348291))

(declare-fun m!348297 () Bool)

(assert (=> b!226666 m!348297))

(assert (=> b!226666 m!348057))

(assert (=> b!226544 d!76947))

(declare-fun d!76949 () Bool)

(assert (=> d!76949 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10521 lt!360851)))) ((_ sign_extend 32) (currentByte!10333 (_2!10521 lt!360851))) ((_ sign_extend 32) (currentBit!10328 (_2!10521 lt!360851))) lt!360852) (bvsle ((_ sign_extend 32) lt!360852) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10521 lt!360851)))) ((_ sign_extend 32) (currentByte!10333 (_2!10521 lt!360851))) ((_ sign_extend 32) (currentBit!10328 (_2!10521 lt!360851)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18804 () Bool)

(assert (= bs!18804 d!76949))

(assert (=> bs!18804 m!348113))

(assert (=> b!226544 d!76949))

(declare-fun d!76951 () Bool)

(declare-fun e!154968 () Bool)

(assert (=> d!76951 e!154968))

(declare-fun res!190190 () Bool)

(assert (=> d!76951 (=> (not res!190190) (not e!154968))))

(assert (=> d!76951 (= res!190190 (and (or (let ((rhs!3908 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3908 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3908) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76952 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76952 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76952 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3907 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3907 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3907) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!361386 () Unit!16788)

(declare-fun choose!57 (BitStream!9040 BitStream!9040 (_ BitVec 64) (_ BitVec 32)) Unit!16788)

(assert (=> d!76951 (= lt!361386 (choose!57 thiss!1870 (_2!10521 lt!360851) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76951 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10521 lt!360851) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!361386)))

(declare-fun lt!361385 () (_ BitVec 32))

(declare-fun b!226669 () Bool)

(assert (=> b!226669 (= e!154968 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4972 (buf!5513 (_2!10521 lt!360851)))) ((_ sign_extend 32) (currentByte!10333 (_2!10521 lt!360851))) ((_ sign_extend 32) (currentBit!10328 (_2!10521 lt!360851))) (bvsub (bvsub to!496 i!761) lt!361385)))))

(assert (=> b!226669 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!361385 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!361385) #b10000000000000000000000000000000)))))

(declare-fun lt!361384 () (_ BitVec 64))

(assert (=> b!226669 (= lt!361385 ((_ extract 31 0) lt!361384))))

(assert (=> b!226669 (and (bvslt lt!361384 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!361384 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226669 (= lt!361384 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76951 res!190190) b!226669))

(declare-fun m!348299 () Bool)

(assert (=> d!76951 m!348299))

(declare-fun m!348301 () Bool)

(assert (=> b!226669 m!348301))

(assert (=> b!226544 d!76951))

(declare-fun d!76954 () Bool)

(declare-fun e!154969 () Bool)

(assert (=> d!76954 e!154969))

(declare-fun res!190192 () Bool)

(assert (=> d!76954 (=> (not res!190192) (not e!154969))))

(declare-fun lt!361390 () (_ BitVec 64))

(declare-fun lt!361391 () (_ BitVec 64))

(declare-fun lt!361389 () (_ BitVec 64))

(assert (=> d!76954 (= res!190192 (= lt!361391 (bvsub lt!361389 lt!361390)))))

(assert (=> d!76954 (or (= (bvand lt!361389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361390 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!361389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!361389 lt!361390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76954 (= lt!361390 (remainingBits!0 ((_ sign_extend 32) (size!4972 (buf!5513 thiss!1870))) ((_ sign_extend 32) (currentByte!10333 thiss!1870)) ((_ sign_extend 32) (currentBit!10328 thiss!1870))))))

(declare-fun lt!361392 () (_ BitVec 64))

(declare-fun lt!361388 () (_ BitVec 64))

(assert (=> d!76954 (= lt!361389 (bvmul lt!361392 lt!361388))))

(assert (=> d!76954 (or (= lt!361392 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!361388 (bvsdiv (bvmul lt!361392 lt!361388) lt!361392)))))

(assert (=> d!76954 (= lt!361388 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76954 (= lt!361392 ((_ sign_extend 32) (size!4972 (buf!5513 thiss!1870))))))

(assert (=> d!76954 (= lt!361391 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10333 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10328 thiss!1870))))))

(assert (=> d!76954 (invariant!0 (currentBit!10328 thiss!1870) (currentByte!10333 thiss!1870) (size!4972 (buf!5513 thiss!1870)))))

(assert (=> d!76954 (= (bitIndex!0 (size!4972 (buf!5513 thiss!1870)) (currentByte!10333 thiss!1870) (currentBit!10328 thiss!1870)) lt!361391)))

(declare-fun b!226670 () Bool)

(declare-fun res!190191 () Bool)

(assert (=> b!226670 (=> (not res!190191) (not e!154969))))

(assert (=> b!226670 (= res!190191 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!361391))))

(declare-fun b!226671 () Bool)

(declare-fun lt!361387 () (_ BitVec 64))

(assert (=> b!226671 (= e!154969 (bvsle lt!361391 (bvmul lt!361387 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226671 (or (= lt!361387 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361387 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361387)))))

(assert (=> b!226671 (= lt!361387 ((_ sign_extend 32) (size!4972 (buf!5513 thiss!1870))))))

(assert (= (and d!76954 res!190192) b!226670))

(assert (= (and b!226670 res!190191) b!226671))

(declare-fun m!348303 () Bool)

(assert (=> d!76954 m!348303))

(declare-fun m!348305 () Bool)

(assert (=> d!76954 m!348305))

(assert (=> b!226544 d!76954))

(declare-fun d!76956 () Bool)

(assert (=> d!76956 (= (array_inv!4713 (buf!5513 thiss!1870)) (bvsge (size!4972 (buf!5513 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226545 d!76956))

(declare-fun d!76958 () Bool)

(assert (=> d!76958 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4972 (buf!5513 thiss!1870))) ((_ sign_extend 32) (currentByte!10333 thiss!1870)) ((_ sign_extend 32) (currentBit!10328 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4972 (buf!5513 thiss!1870))) ((_ sign_extend 32) (currentByte!10333 thiss!1870)) ((_ sign_extend 32) (currentBit!10328 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18805 () Bool)

(assert (= bs!18805 d!76958))

(assert (=> bs!18805 m!348303))

(assert (=> b!226542 d!76958))

(declare-fun d!76960 () Bool)

(assert (=> d!76960 (= (array_inv!4713 arr!308) (bvsge (size!4972 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47552 d!76960))

(declare-fun d!76962 () Bool)

(assert (=> d!76962 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10328 thiss!1870) (currentByte!10333 thiss!1870) (size!4972 (buf!5513 thiss!1870))))))

(declare-fun bs!18806 () Bool)

(assert (= bs!18806 d!76962))

(assert (=> bs!18806 m!348305))

(assert (=> start!47552 d!76962))

(push 1)

(assert (not bm!3769))

(assert (not b!226658))

(assert (not b!226660))

(assert (not b!226669))

(assert (not d!76909))

(assert (not b!226666))

(assert (not bm!3771))

(assert (not b!226659))

(assert (not d!76949))

(assert (not d!76962))

(assert (not bm!3770))

(assert (not b!226657))

(assert (not d!76958))

(assert (not d!76911))

(assert (not d!76951))

(assert (not d!76947))

(assert (not d!76954))

(assert (not d!76905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

