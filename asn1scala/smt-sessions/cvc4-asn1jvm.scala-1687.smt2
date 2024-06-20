; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46848 () Bool)

(assert start!46848)

(declare-fun b!224572 () Bool)

(declare-fun e!153078 () Bool)

(declare-datatypes ((array!11095 0))(
  ( (array!11096 (arr!5820 (Array (_ BitVec 32) (_ BitVec 8))) (size!4869 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8840 0))(
  ( (BitStream!8841 (buf!5413 array!11095) (currentByte!10150 (_ BitVec 32)) (currentBit!10145 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16440 0))(
  ( (Unit!16441) )
))
(declare-datatypes ((tuple3!1264 0))(
  ( (tuple3!1265 (_1!10393 Unit!16440) (_2!10393 BitStream!8840) (_3!774 array!11095)) )
))
(declare-fun lt!356835 () tuple3!1264)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224572 (= e!153078 (not (invariant!0 (currentBit!10145 (_2!10393 lt!356835)) (currentByte!10150 (_2!10393 lt!356835)) (size!4869 (buf!5413 (_2!10393 lt!356835))))))))

(declare-datatypes ((tuple2!19238 0))(
  ( (tuple2!19239 (_1!10394 (_ BitVec 8)) (_2!10394 BitStream!8840)) )
))
(declare-fun lt!356828 () tuple2!19238)

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!224572 (and (= (_1!10394 lt!356828) (select (arr!5820 (_3!774 lt!356835)) i!761)) (= (select (arr!5820 (_3!774 lt!356835)) i!761) (_1!10394 lt!356828)))))

(declare-fun lt!356830 () Unit!16440)

(declare-fun lt!356827 () array!11095)

(declare-fun arrayRangesEqImpliesEq!87 (array!11095 array!11095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16440)

(assert (=> b!224572 (= lt!356830 (arrayRangesEqImpliesEq!87 lt!356827 (_3!774 lt!356835) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11095)

(declare-fun arrayRangesEq!765 (array!11095 array!11095 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224572 (arrayRangesEq!765 arr!308 (_3!774 lt!356835) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356825 () Unit!16440)

(declare-fun arrayRangesEqTransitive!236 (array!11095 array!11095 array!11095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16440)

(assert (=> b!224572 (= lt!356825 (arrayRangesEqTransitive!236 arr!308 lt!356827 (_3!774 lt!356835) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224572 (arrayRangesEq!765 arr!308 lt!356827 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356833 () Unit!16440)

(declare-fun arrayUpdatedAtPrefixLemma!357 (array!11095 (_ BitVec 32) (_ BitVec 8)) Unit!16440)

(assert (=> b!224572 (= lt!356833 (arrayUpdatedAtPrefixLemma!357 arr!308 i!761 (_1!10394 lt!356828)))))

(declare-fun lt!356826 () (_ BitVec 64))

(declare-fun lt!356832 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!8840)

(declare-fun lt!356829 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!356831 () (_ BitVec 64))

(assert (=> b!224572 (and (= (bvadd lt!356829 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!356832))) lt!356826) (= (bvadd lt!356831 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!356826) (= (buf!5413 thiss!1870) (buf!5413 (_2!10393 lt!356835))) (= (size!4869 arr!308) (size!4869 (_3!774 lt!356835))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224572 (= lt!356826 (bitIndex!0 (size!4869 (buf!5413 (_2!10393 lt!356835))) (currentByte!10150 (_2!10393 lt!356835)) (currentBit!10145 (_2!10393 lt!356835))))))

(assert (=> b!224572 (= lt!356829 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!356831))))

(assert (=> b!224572 (= lt!356829 (bitIndex!0 (size!4869 (buf!5413 (_2!10394 lt!356828))) (currentByte!10150 (_2!10394 lt!356828)) (currentBit!10145 (_2!10394 lt!356828))))))

(assert (=> b!224572 (= lt!356831 (bitIndex!0 (size!4869 (buf!5413 thiss!1870)) (currentByte!10150 thiss!1870) (currentBit!10145 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8840 array!11095 (_ BitVec 32) (_ BitVec 32)) tuple3!1264)

(assert (=> b!224572 (= lt!356835 (readByteArrayLoop!0 (_2!10394 lt!356828) lt!356827 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224572 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4869 (buf!5413 (_2!10394 lt!356828)))) ((_ sign_extend 32) (currentByte!10150 (_2!10394 lt!356828))) ((_ sign_extend 32) (currentBit!10145 (_2!10394 lt!356828))) lt!356832)))

(assert (=> b!224572 (= lt!356832 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!356834 () Unit!16440)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8840 BitStream!8840 (_ BitVec 64) (_ BitVec 32)) Unit!16440)

(assert (=> b!224572 (= lt!356834 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10394 lt!356828) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224572 (= lt!356827 (array!11096 (store (arr!5820 arr!308) i!761 (_1!10394 lt!356828)) (size!4869 arr!308)))))

(declare-fun readByte!0 (BitStream!8840) tuple2!19238)

(assert (=> b!224572 (= lt!356828 (readByte!0 thiss!1870))))

(declare-fun res!188480 () Bool)

(assert (=> start!46848 (=> (not res!188480) (not e!153078))))

(assert (=> start!46848 (= res!188480 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4869 arr!308))))))

(assert (=> start!46848 e!153078))

(assert (=> start!46848 true))

(declare-fun array_inv!4610 (array!11095) Bool)

(assert (=> start!46848 (array_inv!4610 arr!308)))

(declare-fun e!153080 () Bool)

(declare-fun inv!12 (BitStream!8840) Bool)

(assert (=> start!46848 (and (inv!12 thiss!1870) e!153080)))

(declare-fun b!224571 () Bool)

(declare-fun res!188481 () Bool)

(assert (=> b!224571 (=> (not res!188481) (not e!153078))))

(assert (=> b!224571 (= res!188481 (bvslt i!761 to!496))))

(declare-fun b!224570 () Bool)

(declare-fun res!188479 () Bool)

(assert (=> b!224570 (=> (not res!188479) (not e!153078))))

(assert (=> b!224570 (= res!188479 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4869 (buf!5413 thiss!1870))) ((_ sign_extend 32) (currentByte!10150 thiss!1870)) ((_ sign_extend 32) (currentBit!10145 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224573 () Bool)

(assert (=> b!224573 (= e!153080 (array_inv!4610 (buf!5413 thiss!1870)))))

(assert (= (and start!46848 res!188480) b!224570))

(assert (= (and b!224570 res!188479) b!224571))

(assert (= (and b!224571 res!188481) b!224572))

(assert (= start!46848 b!224573))

(declare-fun m!344913 () Bool)

(assert (=> b!224572 m!344913))

(declare-fun m!344915 () Bool)

(assert (=> b!224572 m!344915))

(declare-fun m!344917 () Bool)

(assert (=> b!224572 m!344917))

(declare-fun m!344919 () Bool)

(assert (=> b!224572 m!344919))

(declare-fun m!344921 () Bool)

(assert (=> b!224572 m!344921))

(declare-fun m!344923 () Bool)

(assert (=> b!224572 m!344923))

(declare-fun m!344925 () Bool)

(assert (=> b!224572 m!344925))

(declare-fun m!344927 () Bool)

(assert (=> b!224572 m!344927))

(declare-fun m!344929 () Bool)

(assert (=> b!224572 m!344929))

(declare-fun m!344931 () Bool)

(assert (=> b!224572 m!344931))

(declare-fun m!344933 () Bool)

(assert (=> b!224572 m!344933))

(declare-fun m!344935 () Bool)

(assert (=> b!224572 m!344935))

(declare-fun m!344937 () Bool)

(assert (=> b!224572 m!344937))

(declare-fun m!344939 () Bool)

(assert (=> b!224572 m!344939))

(declare-fun m!344941 () Bool)

(assert (=> b!224572 m!344941))

(declare-fun m!344943 () Bool)

(assert (=> start!46848 m!344943))

(declare-fun m!344945 () Bool)

(assert (=> start!46848 m!344945))

(declare-fun m!344947 () Bool)

(assert (=> b!224570 m!344947))

(declare-fun m!344949 () Bool)

(assert (=> b!224573 m!344949))

(push 1)

(assert (not start!46848))

(assert (not b!224570))

(assert (not b!224572))

(assert (not b!224573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76171 () Bool)

(assert (=> d!76171 (= (array_inv!4610 arr!308) (bvsge (size!4869 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46848 d!76171))

(declare-fun d!76173 () Bool)

(assert (=> d!76173 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10145 thiss!1870) (currentByte!10150 thiss!1870) (size!4869 (buf!5413 thiss!1870))))))

(declare-fun bs!18581 () Bool)

(assert (= bs!18581 d!76173))

(declare-fun m!344993 () Bool)

(assert (=> bs!18581 m!344993))

(assert (=> start!46848 d!76173))

(declare-fun d!76175 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76175 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4869 (buf!5413 thiss!1870))) ((_ sign_extend 32) (currentByte!10150 thiss!1870)) ((_ sign_extend 32) (currentBit!10145 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4869 (buf!5413 thiss!1870))) ((_ sign_extend 32) (currentByte!10150 thiss!1870)) ((_ sign_extend 32) (currentBit!10145 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18582 () Bool)

(assert (= bs!18582 d!76175))

(declare-fun m!344995 () Bool)

(assert (=> bs!18582 m!344995))

(assert (=> b!224570 d!76175))

(declare-fun bm!3634 () Bool)

(declare-fun lt!357267 () tuple2!19238)

(declare-fun c!11140 () Bool)

(declare-fun lt!357277 () array!11095)

(declare-fun call!3638 () Bool)

(declare-fun lt!357297 () (_ BitVec 32))

(declare-fun lt!357285 () (_ BitVec 32))

(declare-fun lt!357292 () array!11095)

(assert (=> bm!3634 (= call!3638 (arrayRangesEq!765 (ite c!11140 lt!356827 lt!357277) (ite c!11140 (array!11096 (store (arr!5820 lt!356827) (bvadd #b00000000000000000000000000000001 i!761) (_1!10394 lt!357267)) (size!4869 lt!356827)) lt!357292) (ite c!11140 #b00000000000000000000000000000000 lt!357285) (ite c!11140 (bvadd #b00000000000000000000000000000001 i!761) lt!357297)))))

(declare-fun b!224674 () Bool)

(declare-fun e!153156 () Bool)

(declare-fun lt!357296 () tuple3!1264)

(assert (=> b!224674 (= e!153156 (arrayRangesEq!765 lt!356827 (_3!774 lt!357296) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun e!153157 () Bool)

(declare-fun b!224675 () Bool)

(declare-datatypes ((tuple2!19248 0))(
  ( (tuple2!19249 (_1!10399 BitStream!8840) (_2!10399 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8840) tuple2!19248)

(assert (=> b!224675 (= e!153157 (= (select (arr!5820 (_3!774 lt!357296)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10399 (readBytePure!0 (_2!10394 lt!356828)))))))

(assert (=> b!224675 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4869 (_3!774 lt!357296))))))

(declare-fun b!224676 () Bool)

(declare-fun e!153155 () tuple3!1264)

(declare-fun lt!357287 () Unit!16440)

(declare-fun lt!357290 () tuple3!1264)

(assert (=> b!224676 (= e!153155 (tuple3!1265 lt!357287 (_2!10393 lt!357290) (_3!774 lt!357290)))))

(assert (=> b!224676 (= lt!357267 (readByte!0 (_2!10394 lt!356828)))))

(declare-fun lt!357282 () array!11095)

(assert (=> b!224676 (= lt!357282 (array!11096 (store (arr!5820 lt!356827) (bvadd #b00000000000000000000000000000001 i!761) (_1!10394 lt!357267)) (size!4869 lt!356827)))))

(declare-fun lt!357279 () (_ BitVec 64))

(assert (=> b!224676 (= lt!357279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!357286 () (_ BitVec 32))

(assert (=> b!224676 (= lt!357286 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!357266 () Unit!16440)

(assert (=> b!224676 (= lt!357266 (validateOffsetBytesFromBitIndexLemma!0 (_2!10394 lt!356828) (_2!10394 lt!357267) lt!357279 lt!357286))))

(assert (=> b!224676 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4869 (buf!5413 (_2!10394 lt!357267)))) ((_ sign_extend 32) (currentByte!10150 (_2!10394 lt!357267))) ((_ sign_extend 32) (currentBit!10145 (_2!10394 lt!357267))) (bvsub lt!357286 ((_ extract 31 0) (bvsdiv (bvadd lt!357279 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!357295 () Unit!16440)

(assert (=> b!224676 (= lt!357295 lt!357266)))

