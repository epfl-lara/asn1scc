; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47508 () Bool)

(assert start!47508)

(declare-fun res!189996 () Bool)

(declare-fun e!154795 () Bool)

(assert (=> start!47508 (=> (not res!189996) (not e!154795))))

(declare-datatypes ((array!11331 0))(
  ( (array!11332 (arr!5934 (Array (_ BitVec 32) (_ BitVec 8))) (size!4971 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11331)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47508 (= res!189996 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4971 arr!308))))))

(assert (=> start!47508 e!154795))

(assert (=> start!47508 true))

(declare-fun array_inv!4712 (array!11331) Bool)

(assert (=> start!47508 (array_inv!4712 arr!308)))

(declare-datatypes ((BitStream!9038 0))(
  ( (BitStream!9039 (buf!5512 array!11331) (currentByte!10326 (_ BitVec 32)) (currentBit!10321 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9038)

(declare-fun e!154797 () Bool)

(declare-fun inv!12 (BitStream!9038) Bool)

(assert (=> start!47508 (and (inv!12 thiss!1870) e!154797)))

(declare-fun lt!360341 () (_ BitVec 64))

(declare-fun b!226436 () Bool)

(declare-fun lt!360344 () (_ BitVec 64))

(declare-fun lt!360346 () (_ BitVec 64))

(assert (=> b!226436 (= e!154795 (not (or (not (= lt!360341 (bvand lt!360346 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!360341 (bvand (bvadd lt!360344 lt!360346) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!226436 (= lt!360341 (bvand lt!360344 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!360343 () (_ BitVec 32))

(assert (=> b!226436 (= lt!360346 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!360343)))))

(declare-fun lt!360348 () (_ BitVec 64))

(assert (=> b!226436 (= lt!360344 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!360348))))

(declare-datatypes ((tuple2!19416 0))(
  ( (tuple2!19417 (_1!10512 (_ BitVec 8)) (_2!10512 BitStream!9038)) )
))
(declare-fun lt!360345 () tuple2!19416)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226436 (= lt!360344 (bitIndex!0 (size!4971 (buf!5512 (_2!10512 lt!360345))) (currentByte!10326 (_2!10512 lt!360345)) (currentBit!10321 (_2!10512 lt!360345))))))

(assert (=> b!226436 (= lt!360348 (bitIndex!0 (size!4971 (buf!5512 thiss!1870)) (currentByte!10326 thiss!1870) (currentBit!10321 thiss!1870)))))

(declare-datatypes ((Unit!16753 0))(
  ( (Unit!16754) )
))
(declare-datatypes ((tuple3!1324 0))(
  ( (tuple3!1325 (_1!10513 Unit!16753) (_2!10513 BitStream!9038) (_3!804 array!11331)) )
))
(declare-fun lt!360347 () tuple3!1324)

(declare-fun readByteArrayLoop!0 (BitStream!9038 array!11331 (_ BitVec 32) (_ BitVec 32)) tuple3!1324)

(assert (=> b!226436 (= lt!360347 (readByteArrayLoop!0 (_2!10512 lt!360345) (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226436 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4971 (buf!5512 (_2!10512 lt!360345)))) ((_ sign_extend 32) (currentByte!10326 (_2!10512 lt!360345))) ((_ sign_extend 32) (currentBit!10321 (_2!10512 lt!360345))) lt!360343)))

(assert (=> b!226436 (= lt!360343 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360342 () Unit!16753)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9038 BitStream!9038 (_ BitVec 64) (_ BitVec 32)) Unit!16753)

(assert (=> b!226436 (= lt!360342 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10512 lt!360345) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9038) tuple2!19416)

(assert (=> b!226436 (= lt!360345 (readByte!0 thiss!1870))))

(declare-fun b!226434 () Bool)

(declare-fun res!189997 () Bool)

(assert (=> b!226434 (=> (not res!189997) (not e!154795))))

(assert (=> b!226434 (= res!189997 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4971 (buf!5512 thiss!1870))) ((_ sign_extend 32) (currentByte!10326 thiss!1870)) ((_ sign_extend 32) (currentBit!10321 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226437 () Bool)

(assert (=> b!226437 (= e!154797 (array_inv!4712 (buf!5512 thiss!1870)))))

(declare-fun b!226435 () Bool)

(declare-fun res!189995 () Bool)

(assert (=> b!226435 (=> (not res!189995) (not e!154795))))

(assert (=> b!226435 (= res!189995 (bvslt i!761 to!496))))

(assert (= (and start!47508 res!189996) b!226434))

(assert (= (and b!226434 res!189997) b!226435))

(assert (= (and b!226435 res!189995) b!226436))

(assert (= start!47508 b!226437))

(declare-fun m!347829 () Bool)

(assert (=> start!47508 m!347829))

(declare-fun m!347831 () Bool)

(assert (=> start!47508 m!347831))

(declare-fun m!347833 () Bool)

(assert (=> b!226436 m!347833))

(declare-fun m!347835 () Bool)

(assert (=> b!226436 m!347835))

(declare-fun m!347837 () Bool)

(assert (=> b!226436 m!347837))

(declare-fun m!347839 () Bool)

(assert (=> b!226436 m!347839))

(declare-fun m!347841 () Bool)

(assert (=> b!226436 m!347841))

(declare-fun m!347843 () Bool)

(assert (=> b!226436 m!347843))

(declare-fun m!347845 () Bool)

(assert (=> b!226436 m!347845))

(declare-fun m!347847 () Bool)

(assert (=> b!226434 m!347847))

(declare-fun m!347849 () Bool)

(assert (=> b!226437 m!347849))

(push 1)

(assert (not b!226434))

(assert (not start!47508))

(assert (not b!226437))

(assert (not b!226436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76844 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76844 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4971 (buf!5512 thiss!1870))) ((_ sign_extend 32) (currentByte!10326 thiss!1870)) ((_ sign_extend 32) (currentBit!10321 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4971 (buf!5512 thiss!1870))) ((_ sign_extend 32) (currentByte!10326 thiss!1870)) ((_ sign_extend 32) (currentBit!10321 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18789 () Bool)

(assert (= bs!18789 d!76844))

(declare-fun m!347865 () Bool)

(assert (=> bs!18789 m!347865))

(assert (=> b!226434 d!76844))

(declare-fun d!76850 () Bool)

(assert (=> d!76850 (= (array_inv!4712 arr!308) (bvsge (size!4971 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47508 d!76850))

(declare-fun d!76858 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76858 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10321 thiss!1870) (currentByte!10326 thiss!1870) (size!4971 (buf!5512 thiss!1870))))))

(declare-fun bs!18792 () Bool)

(assert (= bs!18792 d!76858))

(declare-fun m!347871 () Bool)

(assert (=> bs!18792 m!347871))

(assert (=> start!47508 d!76858))

(declare-fun d!76860 () Bool)

(assert (=> d!76860 (= (array_inv!4712 (buf!5512 thiss!1870)) (bvsge (size!4971 (buf!5512 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226437 d!76860))

(declare-fun d!76862 () Bool)

(declare-fun lt!360438 () (_ BitVec 8))

(declare-fun lt!360442 () (_ BitVec 8))

(assert (=> d!76862 (= lt!360438 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5934 (buf!5512 thiss!1870)) (currentByte!10326 thiss!1870))) ((_ sign_extend 24) lt!360442))))))

(assert (=> d!76862 (= lt!360442 ((_ extract 7 0) (currentBit!10321 thiss!1870)))))

(declare-fun e!154823 () Bool)

(assert (=> d!76862 e!154823))

(declare-fun res!190029 () Bool)

(assert (=> d!76862 (=> (not res!190029) (not e!154823))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76862 (= res!190029 (validate_offset_bits!1 ((_ sign_extend 32) (size!4971 (buf!5512 thiss!1870))) ((_ sign_extend 32) (currentByte!10326 thiss!1870)) ((_ sign_extend 32) (currentBit!10321 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19422 0))(
  ( (tuple2!19423 (_1!10516 Unit!16753) (_2!10516 (_ BitVec 8))) )
))
(declare-fun Unit!16763 () Unit!16753)

(declare-fun Unit!16765 () Unit!16753)

(assert (=> d!76862 (= (readByte!0 thiss!1870) (tuple2!19417 (_2!10516 (ite (bvsgt ((_ sign_extend 24) lt!360442) #b00000000000000000000000000000000) (tuple2!19423 Unit!16763 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!360438) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5934 (buf!5512 thiss!1870)) (bvadd (currentByte!10326 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!360442)))))))) (tuple2!19423 Unit!16765 lt!360438))) (BitStream!9039 (buf!5512 thiss!1870) (bvadd (currentByte!10326 thiss!1870) #b00000000000000000000000000000001) (currentBit!10321 thiss!1870))))))

(declare-fun b!226465 () Bool)

(declare-fun e!154822 () Bool)

(assert (=> b!226465 (= e!154823 e!154822)))

(declare-fun res!190028 () Bool)

(assert (=> b!226465 (=> (not res!190028) (not e!154822))))

(declare-fun lt!360439 () tuple2!19416)

(assert (=> b!226465 (= res!190028 (= (buf!5512 (_2!10512 lt!360439)) (buf!5512 thiss!1870)))))

(declare-fun lt!360441 () (_ BitVec 8))

(declare-fun lt!360444 () (_ BitVec 8))

(declare-fun Unit!16769 () Unit!16753)

(declare-fun Unit!16771 () Unit!16753)

(assert (=> b!226465 (= lt!360439 (tuple2!19417 (_2!10516 (ite (bvsgt ((_ sign_extend 24) lt!360441) #b00000000000000000000000000000000) (tuple2!19423 Unit!16769 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!360444) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5934 (buf!5512 thiss!1870)) (bvadd (currentByte!10326 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!360441)))))))) (tuple2!19423 Unit!16771 lt!360444))) (BitStream!9039 (buf!5512 thiss!1870) (bvadd (currentByte!10326 thiss!1870) #b00000000000000000000000000000001) (currentBit!10321 thiss!1870))))))

(assert (=> b!226465 (= lt!360444 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5934 (buf!5512 thiss!1870)) (currentByte!10326 thiss!1870))) ((_ sign_extend 24) lt!360441))))))

(assert (=> b!226465 (= lt!360441 ((_ extract 7 0) (currentBit!10321 thiss!1870)))))

(declare-fun lt!360440 () (_ BitVec 64))

(declare-fun lt!360443 () (_ BitVec 64))

(declare-fun b!226466 () Bool)

(assert (=> b!226466 (= e!154822 (= (bitIndex!0 (size!4971 (buf!5512 (_2!10512 lt!360439))) (currentByte!10326 (_2!10512 lt!360439)) (currentBit!10321 (_2!10512 lt!360439))) (bvadd lt!360440 lt!360443)))))

(assert (=> b!226466 (or (not (= (bvand lt!360440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360443 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!360440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!360440 lt!360443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226466 (= lt!360443 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226466 (= lt!360440 (bitIndex!0 (size!4971 (buf!5512 thiss!1870)) (currentByte!10326 thiss!1870) (currentBit!10321 thiss!1870)))))

(assert (= (and d!76862 res!190029) b!226465))

(assert (= (and b!226465 res!190028) b!226466))

(declare-fun m!347889 () Bool)

(assert (=> d!76862 m!347889))

(declare-fun m!347891 () Bool)

(assert (=> d!76862 m!347891))

(declare-fun m!347893 () Bool)

(assert (=> d!76862 m!347893))

(assert (=> b!226465 m!347893))

(assert (=> b!226465 m!347889))

(declare-fun m!347895 () Bool)

(assert (=> b!226466 m!347895))

(assert (=> b!226466 m!347841))

(assert (=> b!226436 d!76862))

(declare-fun d!76873 () Bool)

(declare-fun e!154829 () Bool)

(assert (=> d!76873 e!154829))

(declare-fun res!190041 () Bool)

(assert (=> d!76873 (=> (not res!190041) (not e!154829))))

(declare-fun lt!360478 () (_ BitVec 64))

(declare-fun lt!360480 () (_ BitVec 64))

(declare-fun lt!360475 () (_ BitVec 64))

(assert (=> d!76873 (= res!190041 (= lt!360475 (bvsub lt!360478 lt!360480)))))

(assert (=> d!76873 (or (= (bvand lt!360478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360480 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360478 lt!360480) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76873 (= lt!360480 (remainingBits!0 ((_ sign_extend 32) (size!4971 (buf!5512 thiss!1870))) ((_ sign_extend 32) (currentByte!10326 thiss!1870)) ((_ sign_extend 32) (currentBit!10321 thiss!1870))))))

(declare-fun lt!360479 () (_ BitVec 64))

(declare-fun lt!360477 () (_ BitVec 64))

(assert (=> d!76873 (= lt!360478 (bvmul lt!360479 lt!360477))))

(assert (=> d!76873 (or (= lt!360479 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360477 (bvsdiv (bvmul lt!360479 lt!360477) lt!360479)))))

(assert (=> d!76873 (= lt!360477 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76873 (= lt!360479 ((_ sign_extend 32) (size!4971 (buf!5512 thiss!1870))))))

(assert (=> d!76873 (= lt!360475 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10326 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10321 thiss!1870))))))

(assert (=> d!76873 (invariant!0 (currentBit!10321 thiss!1870) (currentByte!10326 thiss!1870) (size!4971 (buf!5512 thiss!1870)))))

(assert (=> d!76873 (= (bitIndex!0 (size!4971 (buf!5512 thiss!1870)) (currentByte!10326 thiss!1870) (currentBit!10321 thiss!1870)) lt!360475)))

(declare-fun b!226477 () Bool)

(declare-fun res!190040 () Bool)

(assert (=> b!226477 (=> (not res!190040) (not e!154829))))

(assert (=> b!226477 (= res!190040 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360475))))

(declare-fun b!226478 () Bool)

(declare-fun lt!360476 () (_ BitVec 64))

(assert (=> b!226478 (= e!154829 (bvsle lt!360475 (bvmul lt!360476 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226478 (or (= lt!360476 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360476 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360476)))))

(assert (=> b!226478 (= lt!360476 ((_ sign_extend 32) (size!4971 (buf!5512 thiss!1870))))))

(assert (= (and d!76873 res!190041) b!226477))

(assert (= (and b!226477 res!190040) b!226478))

(assert (=> d!76873 m!347865))

(assert (=> d!76873 m!347871))

(assert (=> b!226436 d!76873))

(declare-fun d!76877 () Bool)

(declare-fun e!154830 () Bool)

(assert (=> d!76877 e!154830))

(declare-fun res!190043 () Bool)

(assert (=> d!76877 (=> (not res!190043) (not e!154830))))

(declare-fun lt!360486 () (_ BitVec 64))

(declare-fun lt!360484 () (_ BitVec 64))

(declare-fun lt!360481 () (_ BitVec 64))

(assert (=> d!76877 (= res!190043 (= lt!360481 (bvsub lt!360484 lt!360486)))))

(assert (=> d!76877 (or (= (bvand lt!360484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360486 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360484 lt!360486) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76877 (= lt!360486 (remainingBits!0 ((_ sign_extend 32) (size!4971 (buf!5512 (_2!10512 lt!360345)))) ((_ sign_extend 32) (currentByte!10326 (_2!10512 lt!360345))) ((_ sign_extend 32) (currentBit!10321 (_2!10512 lt!360345)))))))

(declare-fun lt!360485 () (_ BitVec 64))

(declare-fun lt!360483 () (_ BitVec 64))

(assert (=> d!76877 (= lt!360484 (bvmul lt!360485 lt!360483))))

(assert (=> d!76877 (or (= lt!360485 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360483 (bvsdiv (bvmul lt!360485 lt!360483) lt!360485)))))

(assert (=> d!76877 (= lt!360483 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76877 (= lt!360485 ((_ sign_extend 32) (size!4971 (buf!5512 (_2!10512 lt!360345)))))))

(assert (=> d!76877 (= lt!360481 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10326 (_2!10512 lt!360345))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10321 (_2!10512 lt!360345)))))))

(assert (=> d!76877 (invariant!0 (currentBit!10321 (_2!10512 lt!360345)) (currentByte!10326 (_2!10512 lt!360345)) (size!4971 (buf!5512 (_2!10512 lt!360345))))))

(assert (=> d!76877 (= (bitIndex!0 (size!4971 (buf!5512 (_2!10512 lt!360345))) (currentByte!10326 (_2!10512 lt!360345)) (currentBit!10321 (_2!10512 lt!360345))) lt!360481)))

(declare-fun b!226479 () Bool)

(declare-fun res!190042 () Bool)

(assert (=> b!226479 (=> (not res!190042) (not e!154830))))

(assert (=> b!226479 (= res!190042 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360481))))

(declare-fun b!226480 () Bool)

(declare-fun lt!360482 () (_ BitVec 64))

(assert (=> b!226480 (= e!154830 (bvsle lt!360481 (bvmul lt!360482 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226480 (or (= lt!360482 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360482 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360482)))))

(assert (=> b!226480 (= lt!360482 ((_ sign_extend 32) (size!4971 (buf!5512 (_2!10512 lt!360345)))))))

(assert (= (and d!76877 res!190043) b!226479))

(assert (= (and b!226479 res!190042) b!226480))

(declare-fun m!347897 () Bool)

(assert (=> d!76877 m!347897))

(declare-fun m!347899 () Bool)

(assert (=> d!76877 m!347899))

(assert (=> b!226436 d!76877))

(declare-fun d!76879 () Bool)

(declare-fun e!154833 () Bool)

(assert (=> d!76879 e!154833))

(declare-fun res!190046 () Bool)

(assert (=> d!76879 (=> (not res!190046) (not e!154833))))

(assert (=> d!76879 (= res!190046 (and (or (let ((rhs!3884 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3884 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3884) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76880 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76880 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76880 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3883 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3883 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3883) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!360493 () Unit!16753)

(declare-fun choose!57 (BitStream!9038 BitStream!9038 (_ BitVec 64) (_ BitVec 32)) Unit!16753)

(assert (=> d!76879 (= lt!360493 (choose!57 thiss!1870 (_2!10512 lt!360345) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76879 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10512 lt!360345) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!360493)))

(declare-fun b!226483 () Bool)

(declare-fun lt!360495 () (_ BitVec 32))

(assert (=> b!226483 (= e!154833 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4971 (buf!5512 (_2!10512 lt!360345)))) ((_ sign_extend 32) (currentByte!10326 (_2!10512 lt!360345))) ((_ sign_extend 32) (currentBit!10321 (_2!10512 lt!360345))) (bvsub (bvsub to!496 i!761) lt!360495)))))

(assert (=> b!226483 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!360495 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!360495) #b10000000000000000000000000000000)))))

(declare-fun lt!360494 () (_ BitVec 64))

(assert (=> b!226483 (= lt!360495 ((_ extract 31 0) lt!360494))))

(assert (=> b!226483 (and (bvslt lt!360494 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!360494 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226483 (= lt!360494 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76879 res!190046) b!226483))

(declare-fun m!347901 () Bool)

(assert (=> d!76879 m!347901))

(declare-fun m!347903 () Bool)

(assert (=> b!226483 m!347903))

(assert (=> b!226436 d!76879))

(declare-fun lt!360815 () array!11331)

(declare-fun lt!360822 () array!11331)

(declare-fun lt!360797 () tuple3!1324)

(declare-fun lt!360807 () (_ BitVec 32))

(declare-fun c!11176 () Bool)

(declare-fun lt!360809 () (_ BitVec 32))

(declare-fun bm!3742 () Bool)

(declare-fun call!3746 () Bool)

(declare-fun arrayRangesEq!819 (array!11331 array!11331 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3742 (= call!3746 (arrayRangesEq!819 (ite c!11176 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)) lt!360815) (ite c!11176 (_3!804 lt!360797) lt!360822) (ite c!11176 #b00000000000000000000000000000000 lt!360809) (ite c!11176 (bvadd #b00000000000000000000000000000001 i!761) lt!360807)))))

(declare-fun bm!3743 () Bool)

(declare-fun call!3745 () (_ BitVec 64))

(assert (=> bm!3743 (= call!3745 (bitIndex!0 (size!4971 (buf!5512 (_2!10512 lt!360345))) (currentByte!10326 (_2!10512 lt!360345)) (currentBit!10321 (_2!10512 lt!360345))))))

(declare-fun b!226528 () Bool)

(declare-fun lt!360816 () Unit!16753)

(declare-fun e!154861 () tuple3!1324)

(assert (=> b!226528 (= e!154861 (tuple3!1325 lt!360816 (_2!10512 lt!360345) (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308))))))

(assert (=> b!226528 (= call!3745 call!3745)))

(declare-fun lt!360811 () Unit!16753)

(declare-fun Unit!16781 () Unit!16753)

(assert (=> b!226528 (= lt!360811 Unit!16781)))

(declare-fun lt!360825 () Unit!16753)

(declare-fun arrayRangesEqReflexiveLemma!123 (array!11331) Unit!16753)

(assert (=> b!226528 (= lt!360825 (arrayRangesEqReflexiveLemma!123 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308))))))

(declare-fun call!3747 () Bool)

(assert (=> b!226528 call!3747))

(declare-fun lt!360827 () Unit!16753)

(assert (=> b!226528 (= lt!360827 lt!360825)))

(assert (=> b!226528 (= lt!360815 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)))))

(assert (=> b!226528 (= lt!360822 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)))))

(declare-fun lt!360823 () (_ BitVec 32))

(assert (=> b!226528 (= lt!360823 #b00000000000000000000000000000000)))

(declare-fun lt!360831 () (_ BitVec 32))

(assert (=> b!226528 (= lt!360831 (size!4971 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308))))))

(assert (=> b!226528 (= lt!360809 #b00000000000000000000000000000000)))

(assert (=> b!226528 (= lt!360807 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!108 (array!11331 array!11331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16753)

(assert (=> b!226528 (= lt!360816 (arrayRangesEqSlicedLemma!108 lt!360815 lt!360822 lt!360823 lt!360831 lt!360809 lt!360807))))

(assert (=> b!226528 call!3746))

(declare-fun d!76882 () Bool)

(declare-fun e!154863 () Bool)

(assert (=> d!76882 e!154863))

(declare-fun res!190076 () Bool)

(assert (=> d!76882 (=> res!190076 e!154863)))

(assert (=> d!76882 (= res!190076 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!360806 () Bool)

(declare-fun e!154862 () Bool)

(assert (=> d!76882 (= lt!360806 e!154862)))

(declare-fun res!190077 () Bool)

(assert (=> d!76882 (=> (not res!190077) (not e!154862))))

(declare-fun lt!360817 () (_ BitVec 64))

(declare-fun lt!360801 () tuple3!1324)

(declare-fun lt!360828 () (_ BitVec 64))

(assert (=> d!76882 (= res!190077 (= (bvadd lt!360828 lt!360817) (bitIndex!0 (size!4971 (buf!5512 (_2!10513 lt!360801))) (currentByte!10326 (_2!10513 lt!360801)) (currentBit!10321 (_2!10513 lt!360801)))))))

(assert (=> d!76882 (or (not (= (bvand lt!360828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360817 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!360828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!360828 lt!360817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!360826 () (_ BitVec 64))

(assert (=> d!76882 (= lt!360817 (bvmul lt!360826 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76882 (or (= lt!360826 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360826 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360826)))))

(assert (=> d!76882 (= lt!360826 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76882 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76882 (= lt!360828 (bitIndex!0 (size!4971 (buf!5512 (_2!10512 lt!360345))) (currentByte!10326 (_2!10512 lt!360345)) (currentBit!10321 (_2!10512 lt!360345))))))

(assert (=> d!76882 (= lt!360801 e!154861)))

(assert (=> d!76882 (= c!11176 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76882 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4971 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)))))))

(assert (=> d!76882 (= (readByteArrayLoop!0 (_2!10512 lt!360345) (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!360801)))

(declare-fun b!226529 () Bool)

(declare-fun lt!360805 () Unit!16753)

(assert (=> b!226529 (= e!154861 (tuple3!1325 lt!360805 (_2!10513 lt!360797) (_3!804 lt!360797)))))

(declare-fun lt!360820 () tuple2!19416)

(assert (=> b!226529 (= lt!360820 (readByte!0 (_2!10512 lt!360345)))))

(declare-fun lt!360819 () array!11331)

(assert (=> b!226529 (= lt!360819 (array!11332 (store (arr!5934 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10512 lt!360820)) (size!4971 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)))))))

(declare-fun lt!360812 () (_ BitVec 64))

(assert (=> b!226529 (= lt!360812 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!360802 () (_ BitVec 32))

(assert (=> b!226529 (= lt!360802 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!360804 () Unit!16753)

(assert (=> b!226529 (= lt!360804 (validateOffsetBytesFromBitIndexLemma!0 (_2!10512 lt!360345) (_2!10512 lt!360820) lt!360812 lt!360802))))

(assert (=> b!226529 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4971 (buf!5512 (_2!10512 lt!360820)))) ((_ sign_extend 32) (currentByte!10326 (_2!10512 lt!360820))) ((_ sign_extend 32) (currentBit!10321 (_2!10512 lt!360820))) (bvsub lt!360802 ((_ extract 31 0) (bvsdiv (bvadd lt!360812 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!360829 () Unit!16753)

(assert (=> b!226529 (= lt!360829 lt!360804)))

(assert (=> b!226529 (= lt!360797 (readByteArrayLoop!0 (_2!10512 lt!360820) lt!360819 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226529 (= (bitIndex!0 (size!4971 (buf!5512 (_2!10512 lt!360820))) (currentByte!10326 (_2!10512 lt!360820)) (currentBit!10321 (_2!10512 lt!360820))) (bvadd call!3745 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!360800 () Unit!16753)

(declare-fun Unit!16782 () Unit!16753)

(assert (=> b!226529 (= lt!360800 Unit!16782)))

(assert (=> b!226529 (= (bvadd (bitIndex!0 (size!4971 (buf!5512 (_2!10512 lt!360820))) (currentByte!10326 (_2!10512 lt!360820)) (currentBit!10321 (_2!10512 lt!360820))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4971 (buf!5512 (_2!10513 lt!360797))) (currentByte!10326 (_2!10513 lt!360797)) (currentBit!10321 (_2!10513 lt!360797))))))

(declare-fun lt!360824 () Unit!16753)

(declare-fun Unit!16783 () Unit!16753)

(assert (=> b!226529 (= lt!360824 Unit!16783)))

(assert (=> b!226529 (= (bvadd call!3745 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4971 (buf!5512 (_2!10513 lt!360797))) (currentByte!10326 (_2!10513 lt!360797)) (currentBit!10321 (_2!10513 lt!360797))))))

(declare-fun lt!360813 () Unit!16753)

(declare-fun Unit!16784 () Unit!16753)

(assert (=> b!226529 (= lt!360813 Unit!16784)))

(assert (=> b!226529 (and (= (buf!5512 (_2!10512 lt!360345)) (buf!5512 (_2!10513 lt!360797))) (= (size!4971 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308))) (size!4971 (_3!804 lt!360797))))))

(declare-fun lt!360803 () Unit!16753)

(declare-fun Unit!16785 () Unit!16753)

(assert (=> b!226529 (= lt!360803 Unit!16785)))

(declare-fun lt!360821 () Unit!16753)

(declare-fun arrayUpdatedAtPrefixLemma!378 (array!11331 (_ BitVec 32) (_ BitVec 8)) Unit!16753)

(assert (=> b!226529 (= lt!360821 (arrayUpdatedAtPrefixLemma!378 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10512 lt!360820)))))

(assert (=> b!226529 call!3747))

(declare-fun lt!360796 () Unit!16753)

(assert (=> b!226529 (= lt!360796 lt!360821)))

(declare-fun lt!360798 () (_ BitVec 32))

(assert (=> b!226529 (= lt!360798 #b00000000000000000000000000000000)))

(declare-fun lt!360818 () Unit!16753)

(declare-fun arrayRangesEqTransitive!257 (array!11331 array!11331 array!11331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16753)

(assert (=> b!226529 (= lt!360818 (arrayRangesEqTransitive!257 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)) lt!360819 (_3!804 lt!360797) lt!360798 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226529 (arrayRangesEq!819 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)) (_3!804 lt!360797) lt!360798 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!360799 () Unit!16753)

(assert (=> b!226529 (= lt!360799 lt!360818)))

(assert (=> b!226529 call!3746))

(declare-fun lt!360830 () Unit!16753)

(declare-fun Unit!16786 () Unit!16753)

(assert (=> b!226529 (= lt!360830 Unit!16786)))

(declare-fun lt!360814 () Unit!16753)

(declare-fun arrayRangesEqImpliesEq!108 (array!11331 array!11331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16753)

(assert (=> b!226529 (= lt!360814 (arrayRangesEqImpliesEq!108 lt!360819 (_3!804 lt!360797) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226529 (= (select (store (arr!5934 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10512 lt!360820)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5934 (_3!804 lt!360797)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!360808 () Unit!16753)

(assert (=> b!226529 (= lt!360808 lt!360814)))

(declare-fun lt!360810 () Bool)

(assert (=> b!226529 (= lt!360810 (= (select (arr!5934 (_3!804 lt!360797)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10512 lt!360820)))))

(declare-fun Unit!16787 () Unit!16753)

(assert (=> b!226529 (= lt!360805 Unit!16787)))

(assert (=> b!226529 lt!360810))

(declare-fun b!226530 () Bool)

(declare-fun res!190075 () Bool)

(assert (=> b!226530 (=> (not res!190075) (not e!154862))))

(assert (=> b!226530 (= res!190075 (and (= (buf!5512 (_2!10512 lt!360345)) (buf!5512 (_2!10513 lt!360801))) (= (size!4971 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308))) (size!4971 (_3!804 lt!360801)))))))

(declare-fun b!226531 () Bool)

(assert (=> b!226531 (= e!154862 (arrayRangesEq!819 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)) (_3!804 lt!360801) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!226532 () Bool)

(declare-datatypes ((tuple2!19428 0))(
  ( (tuple2!19429 (_1!10519 BitStream!9038) (_2!10519 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9038) tuple2!19428)

(assert (=> b!226532 (= e!154863 (= (select (arr!5934 (_3!804 lt!360801)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10519 (readBytePure!0 (_2!10512 lt!360345)))))))

(assert (=> b!226532 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4971 (_3!804 lt!360801))))))

(declare-fun bm!3744 () Bool)

(assert (=> bm!3744 (= call!3747 (arrayRangesEq!819 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)) (ite c!11176 (array!11332 (store (arr!5934 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10512 lt!360820)) (size!4971 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308)))) (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308))) #b00000000000000000000000000000000 (ite c!11176 (bvadd #b00000000000000000000000000000001 i!761) (size!4971 (array!11332 (store (arr!5934 arr!308) i!761 (_1!10512 lt!360345)) (size!4971 arr!308))))))))

(assert (= (and d!76882 c!11176) b!226529))

(assert (= (and d!76882 (not c!11176)) b!226528))

(assert (= (or b!226529 b!226528) bm!3742))

(assert (= (or b!226529 b!226528) bm!3744))

(assert (= (or b!226529 b!226528) bm!3743))

(assert (= (and d!76882 res!190077) b!226530))

(assert (= (and b!226530 res!190075) b!226531))

(assert (= (and d!76882 (not res!190076)) b!226532))

(declare-fun m!347995 () Bool)

(assert (=> b!226528 m!347995))

(declare-fun m!347997 () Bool)

(assert (=> b!226528 m!347997))

(declare-fun m!347999 () Bool)

(assert (=> d!76882 m!347999))

(assert (=> d!76882 m!347839))

(declare-fun m!348001 () Bool)

(assert (=> b!226529 m!348001))

(declare-fun m!348003 () Bool)

(assert (=> b!226529 m!348003))

(declare-fun m!348005 () Bool)

(assert (=> b!226529 m!348005))

(declare-fun m!348007 () Bool)

(assert (=> b!226529 m!348007))

(declare-fun m!348009 () Bool)

(assert (=> b!226529 m!348009))

(declare-fun m!348011 () Bool)

(assert (=> b!226529 m!348011))

(declare-fun m!348013 () Bool)

(assert (=> b!226529 m!348013))

(declare-fun m!348015 () Bool)

(assert (=> b!226529 m!348015))

(declare-fun m!348017 () Bool)

(assert (=> b!226529 m!348017))

(declare-fun m!348019 () Bool)

(assert (=> b!226529 m!348019))

(declare-fun m!348021 () Bool)

(assert (=> b!226529 m!348021))

(declare-fun m!348023 () Bool)

(assert (=> b!226529 m!348023))

(declare-fun m!348025 () Bool)

(assert (=> b!226529 m!348025))

(declare-fun m!348027 () Bool)

(assert (=> b!226532 m!348027))

(declare-fun m!348029 () Bool)

(assert (=> b!226532 m!348029))

(assert (=> bm!3744 m!348017))

(declare-fun m!348031 () Bool)

(assert (=> bm!3744 m!348031))

(declare-fun m!348033 () Bool)

(assert (=> bm!3742 m!348033))

(assert (=> bm!3743 m!347839))

(declare-fun m!348035 () Bool)

(assert (=> b!226531 m!348035))

(assert (=> b!226436 d!76882))

(declare-fun d!76891 () Bool)

(assert (=> d!76891 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4971 (buf!5512 (_2!10512 lt!360345)))) ((_ sign_extend 32) (currentByte!10326 (_2!10512 lt!360345))) ((_ sign_extend 32) (currentBit!10321 (_2!10512 lt!360345))) lt!360343) (bvsle ((_ sign_extend 32) lt!360343) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4971 (buf!5512 (_2!10512 lt!360345)))) ((_ sign_extend 32) (currentByte!10326 (_2!10512 lt!360345))) ((_ sign_extend 32) (currentBit!10321 (_2!10512 lt!360345)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18794 () Bool)

(assert (= bs!18794 d!76891))

(assert (=> bs!18794 m!347897))

(assert (=> b!226436 d!76891))

(push 1)

(assert (not d!76844))

(assert (not d!76858))

(assert (not b!226529))

(assert (not b!226466))

(assert (not d!76873))

(assert (not d!76882))

(assert (not b!226531))

(assert (not b!226483))

(assert (not d!76862))

(assert (not b!226532))

(assert (not d!76879))

(assert (not bm!3742))

(assert (not d!76891))

(assert (not bm!3743))

(assert (not b!226528))

(assert (not d!76877))

(assert (not bm!3744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

