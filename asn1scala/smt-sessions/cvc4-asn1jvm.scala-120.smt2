; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2802 () Bool)

(assert start!2802)

(declare-fun b!13203 () Bool)

(declare-fun e!8079 () Bool)

(declare-fun e!8078 () Bool)

(assert (=> b!13203 (= e!8079 (not e!8078))))

(declare-fun res!12525 () Bool)

(assert (=> b!13203 (=> res!12525 e!8078)))

(declare-datatypes ((array!745 0))(
  ( (array!746 (arr!753 (Array (_ BitVec 32) (_ BitVec 8))) (size!324 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!608 0))(
  ( (BitStream!609 (buf!675 array!745) (currentByte!1765 (_ BitVec 32)) (currentBit!1760 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1113 0))(
  ( (Unit!1114) )
))
(declare-datatypes ((tuple2!1572 0))(
  ( (tuple2!1573 (_1!841 Unit!1113) (_2!841 BitStream!608)) )
))
(declare-fun lt!20868 () tuple2!1572)

(declare-fun thiss!957 () BitStream!608)

(assert (=> b!13203 (= res!12525 (not (= (size!324 (buf!675 (_2!841 lt!20868))) (size!324 (buf!675 thiss!957)))))))

(declare-fun e!8081 () Bool)

(assert (=> b!13203 e!8081))

(declare-fun res!12521 () Bool)

(assert (=> b!13203 (=> (not res!12521) (not e!8081))))

(assert (=> b!13203 (= res!12521 (= (size!324 (buf!675 thiss!957)) (size!324 (buf!675 (_2!841 lt!20868)))))))

(declare-fun appendBit!0 (BitStream!608 Bool) tuple2!1572)

(assert (=> b!13203 (= lt!20868 (appendBit!0 thiss!957 false))))

(declare-fun b!13204 () Bool)

(declare-fun e!8076 () Bool)

(assert (=> b!13204 (= e!8081 e!8076)))

(declare-fun res!12523 () Bool)

(assert (=> b!13204 (=> (not res!12523) (not e!8076))))

(declare-fun lt!20867 () (_ BitVec 64))

(declare-fun lt!20870 () (_ BitVec 64))

(assert (=> b!13204 (= res!12523 (= lt!20867 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!20870)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13204 (= lt!20867 (bitIndex!0 (size!324 (buf!675 (_2!841 lt!20868))) (currentByte!1765 (_2!841 lt!20868)) (currentBit!1760 (_2!841 lt!20868))))))

(assert (=> b!13204 (= lt!20870 (bitIndex!0 (size!324 (buf!675 thiss!957)) (currentByte!1765 thiss!957) (currentBit!1760 thiss!957)))))

(declare-fun res!12526 () Bool)

(assert (=> start!2802 (=> (not res!12526) (not e!8079))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2802 (= res!12526 (validate_offset_bit!0 ((_ sign_extend 32) (size!324 (buf!675 thiss!957))) ((_ sign_extend 32) (currentByte!1765 thiss!957)) ((_ sign_extend 32) (currentBit!1760 thiss!957))))))

(assert (=> start!2802 e!8079))

(declare-fun e!8077 () Bool)

(declare-fun inv!12 (BitStream!608) Bool)

(assert (=> start!2802 (and (inv!12 thiss!957) e!8077)))

(declare-fun b!13205 () Bool)

(declare-fun e!8075 () Bool)

(assert (=> b!13205 (= e!8076 e!8075)))

(declare-fun res!12524 () Bool)

(assert (=> b!13205 (=> (not res!12524) (not e!8075))))

(declare-datatypes ((tuple2!1574 0))(
  ( (tuple2!1575 (_1!842 BitStream!608) (_2!842 Bool)) )
))
(declare-fun lt!20869 () tuple2!1574)

(assert (=> b!13205 (= res!12524 (and (not (_2!842 lt!20869)) (= (_1!842 lt!20869) (_2!841 lt!20868))))))

(declare-fun readBitPure!0 (BitStream!608) tuple2!1574)

(declare-fun readerFrom!0 (BitStream!608 (_ BitVec 32) (_ BitVec 32)) BitStream!608)

(assert (=> b!13205 (= lt!20869 (readBitPure!0 (readerFrom!0 (_2!841 lt!20868) (currentBit!1760 thiss!957) (currentByte!1765 thiss!957))))))

(declare-fun b!13206 () Bool)

(assert (=> b!13206 (= e!8075 (= (bitIndex!0 (size!324 (buf!675 (_1!842 lt!20869))) (currentByte!1765 (_1!842 lt!20869)) (currentBit!1760 (_1!842 lt!20869))) lt!20867))))

(declare-fun b!13207 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13207 (= e!8078 (invariant!0 (currentBit!1760 (_2!841 lt!20868)) (currentByte!1765 (_2!841 lt!20868)) (size!324 (buf!675 (_2!841 lt!20868)))))))

(declare-fun b!13208 () Bool)

(declare-fun res!12522 () Bool)

(assert (=> b!13208 (=> (not res!12522) (not e!8076))))

(declare-fun isPrefixOf!0 (BitStream!608 BitStream!608) Bool)

(assert (=> b!13208 (= res!12522 (isPrefixOf!0 thiss!957 (_2!841 lt!20868)))))

(declare-fun b!13209 () Bool)

(declare-fun array_inv!313 (array!745) Bool)

(assert (=> b!13209 (= e!8077 (array_inv!313 (buf!675 thiss!957)))))

(assert (= (and start!2802 res!12526) b!13203))

(assert (= (and b!13203 res!12521) b!13204))

(assert (= (and b!13204 res!12523) b!13208))

(assert (= (and b!13208 res!12522) b!13205))

(assert (= (and b!13205 res!12524) b!13206))

(assert (= (and b!13203 (not res!12525)) b!13207))

(assert (= start!2802 b!13209))

(declare-fun m!19859 () Bool)

(assert (=> b!13208 m!19859))

(declare-fun m!19861 () Bool)

(assert (=> b!13207 m!19861))

(declare-fun m!19863 () Bool)

(assert (=> start!2802 m!19863))

(declare-fun m!19865 () Bool)

(assert (=> start!2802 m!19865))

(declare-fun m!19867 () Bool)

(assert (=> b!13209 m!19867))

(declare-fun m!19869 () Bool)

(assert (=> b!13205 m!19869))

(assert (=> b!13205 m!19869))

(declare-fun m!19871 () Bool)

(assert (=> b!13205 m!19871))

(declare-fun m!19873 () Bool)

(assert (=> b!13206 m!19873))

(declare-fun m!19875 () Bool)

(assert (=> b!13204 m!19875))

(declare-fun m!19877 () Bool)

(assert (=> b!13204 m!19877))

(declare-fun m!19879 () Bool)

(assert (=> b!13203 m!19879))

(push 1)

(assert (not b!13205))

(assert (not b!13207))

(assert (not b!13203))

(assert (not b!13208))

(assert (not b!13206))

(assert (not b!13209))

(assert (not b!13204))

(assert (not start!2802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4244 () Bool)

(assert (=> d!4244 (= (invariant!0 (currentBit!1760 (_2!841 lt!20868)) (currentByte!1765 (_2!841 lt!20868)) (size!324 (buf!675 (_2!841 lt!20868)))) (and (bvsge (currentBit!1760 (_2!841 lt!20868)) #b00000000000000000000000000000000) (bvslt (currentBit!1760 (_2!841 lt!20868)) #b00000000000000000000000000001000) (bvsge (currentByte!1765 (_2!841 lt!20868)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1765 (_2!841 lt!20868)) (size!324 (buf!675 (_2!841 lt!20868)))) (and (= (currentBit!1760 (_2!841 lt!20868)) #b00000000000000000000000000000000) (= (currentByte!1765 (_2!841 lt!20868)) (size!324 (buf!675 (_2!841 lt!20868))))))))))

(assert (=> b!13207 d!4244))

(declare-fun d!4254 () Bool)

(declare-fun e!8107 () Bool)

(assert (=> d!4254 e!8107))

(declare-fun res!12573 () Bool)

(assert (=> d!4254 (=> (not res!12573) (not e!8107))))

(declare-fun lt!20953 () (_ BitVec 64))

(declare-fun lt!20950 () (_ BitVec 64))

(declare-fun lt!20948 () (_ BitVec 64))

(assert (=> d!4254 (= res!12573 (= lt!20950 (bvsub lt!20953 lt!20948)))))

(assert (=> d!4254 (or (= (bvand lt!20953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20948 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20953 lt!20948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4254 (= lt!20948 (remainingBits!0 ((_ sign_extend 32) (size!324 (buf!675 (_1!842 lt!20869)))) ((_ sign_extend 32) (currentByte!1765 (_1!842 lt!20869))) ((_ sign_extend 32) (currentBit!1760 (_1!842 lt!20869)))))))

(declare-fun lt!20951 () (_ BitVec 64))

(declare-fun lt!20952 () (_ BitVec 64))

(assert (=> d!4254 (= lt!20953 (bvmul lt!20951 lt!20952))))

(assert (=> d!4254 (or (= lt!20951 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!20952 (bvsdiv (bvmul lt!20951 lt!20952) lt!20951)))))

(assert (=> d!4254 (= lt!20952 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4254 (= lt!20951 ((_ sign_extend 32) (size!324 (buf!675 (_1!842 lt!20869)))))))

(assert (=> d!4254 (= lt!20950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1765 (_1!842 lt!20869))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1760 (_1!842 lt!20869)))))))

(assert (=> d!4254 (invariant!0 (currentBit!1760 (_1!842 lt!20869)) (currentByte!1765 (_1!842 lt!20869)) (size!324 (buf!675 (_1!842 lt!20869))))))

(assert (=> d!4254 (= (bitIndex!0 (size!324 (buf!675 (_1!842 lt!20869))) (currentByte!1765 (_1!842 lt!20869)) (currentBit!1760 (_1!842 lt!20869))) lt!20950)))

(declare-fun b!13256 () Bool)

(declare-fun res!12572 () Bool)

(assert (=> b!13256 (=> (not res!12572) (not e!8107))))

(assert (=> b!13256 (= res!12572 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!20950))))

(declare-fun b!13257 () Bool)

(declare-fun lt!20949 () (_ BitVec 64))

(assert (=> b!13257 (= e!8107 (bvsle lt!20950 (bvmul lt!20949 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13257 (or (= lt!20949 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!20949 #b0000000000000000000000000000000000000000000000000000000000001000) lt!20949)))))

(assert (=> b!13257 (= lt!20949 ((_ sign_extend 32) (size!324 (buf!675 (_1!842 lt!20869)))))))

(assert (= (and d!4254 res!12573) b!13256))

(assert (= (and b!13256 res!12572) b!13257))

(declare-fun m!19917 () Bool)

(assert (=> d!4254 m!19917))

(declare-fun m!19919 () Bool)

(assert (=> d!4254 m!19919))

(assert (=> b!13206 d!4254))

(declare-fun d!4264 () Bool)

(assert (=> d!4264 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!324 (buf!675 thiss!957))) ((_ sign_extend 32) (currentByte!1765 thiss!957)) ((_ sign_extend 32) (currentBit!1760 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!324 (buf!675 thiss!957))) ((_ sign_extend 32) (currentByte!1765 thiss!957)) ((_ sign_extend 32) (currentBit!1760 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1195 () Bool)

(assert (= bs!1195 d!4264))

(declare-fun m!19923 () Bool)

(assert (=> bs!1195 m!19923))

(assert (=> start!2802 d!4264))

(declare-fun d!4268 () Bool)

(assert (=> d!4268 (= (inv!12 thiss!957) (invariant!0 (currentBit!1760 thiss!957) (currentByte!1765 thiss!957) (size!324 (buf!675 thiss!957))))))

(declare-fun bs!1196 () Bool)

(assert (= bs!1196 d!4268))

(declare-fun m!19925 () Bool)

(assert (=> bs!1196 m!19925))

(assert (=> start!2802 d!4268))

(declare-fun d!4270 () Bool)

(declare-fun res!12598 () Bool)

(declare-fun e!8121 () Bool)

(assert (=> d!4270 (=> (not res!12598) (not e!8121))))

(assert (=> d!4270 (= res!12598 (= (size!324 (buf!675 thiss!957)) (size!324 (buf!675 (_2!841 lt!20868)))))))

(assert (=> d!4270 (= (isPrefixOf!0 thiss!957 (_2!841 lt!20868)) e!8121)))

(declare-fun b!13280 () Bool)

(declare-fun res!12596 () Bool)

(assert (=> b!13280 (=> (not res!12596) (not e!8121))))

(assert (=> b!13280 (= res!12596 (bvsle (bitIndex!0 (size!324 (buf!675 thiss!957)) (currentByte!1765 thiss!957) (currentBit!1760 thiss!957)) (bitIndex!0 (size!324 (buf!675 (_2!841 lt!20868))) (currentByte!1765 (_2!841 lt!20868)) (currentBit!1760 (_2!841 lt!20868)))))))

(declare-fun b!13281 () Bool)

(declare-fun e!8120 () Bool)

(assert (=> b!13281 (= e!8121 e!8120)))

(declare-fun res!12597 () Bool)

(assert (=> b!13281 (=> res!12597 e!8120)))

(assert (=> b!13281 (= res!12597 (= (size!324 (buf!675 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13282 () Bool)

(declare-fun arrayBitRangesEq!0 (array!745 array!745 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13282 (= e!8120 (arrayBitRangesEq!0 (buf!675 thiss!957) (buf!675 (_2!841 lt!20868)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!324 (buf!675 thiss!957)) (currentByte!1765 thiss!957) (currentBit!1760 thiss!957))))))

(assert (= (and d!4270 res!12598) b!13280))

(assert (= (and b!13280 res!12596) b!13281))

(assert (= (and b!13281 (not res!12597)) b!13282))

(assert (=> b!13280 m!19877))

(assert (=> b!13280 m!19875))

(assert (=> b!13282 m!19877))

(assert (=> b!13282 m!19877))

(declare-fun m!19939 () Bool)

(assert (=> b!13282 m!19939))

(assert (=> b!13208 d!4270))

(declare-fun b!13306 () Bool)

(declare-fun e!8136 () Bool)

(declare-fun e!8135 () Bool)

(assert (=> b!13306 (= e!8136 e!8135)))

(declare-fun res!12623 () Bool)

(assert (=> b!13306 (=> (not res!12623) (not e!8135))))

(declare-fun lt!20990 () tuple2!1574)

(declare-fun lt!20988 () tuple2!1572)

(assert (=> b!13306 (= res!12623 (and (= (_2!842 lt!20990) false) (= (_1!842 lt!20990) (_2!841 lt!20988))))))

(assert (=> b!13306 (= lt!20990 (readBitPure!0 (readerFrom!0 (_2!841 lt!20988) (currentBit!1760 thiss!957) (currentByte!1765 thiss!957))))))

(declare-fun b!13304 () Bool)

(declare-fun res!12620 () Bool)

(assert (=> b!13304 (=> (not res!12620) (not e!8136))))

(declare-fun lt!20987 () (_ BitVec 64))

(declare-fun lt!20989 () (_ BitVec 64))

(assert (=> b!13304 (= res!12620 (= (bitIndex!0 (size!324 (buf!675 (_2!841 lt!20988))) (currentByte!1765 (_2!841 lt!20988)) (currentBit!1760 (_2!841 lt!20988))) (bvadd lt!20987 lt!20989)))))

(assert (=> b!13304 (or (not (= (bvand lt!20987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20989 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!20987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!20987 lt!20989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13304 (= lt!20989 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13304 (= lt!20987 (bitIndex!0 (size!324 (buf!675 thiss!957)) (currentByte!1765 thiss!957) (currentBit!1760 thiss!957)))))

(declare-fun b!13307 () Bool)

(assert (=> b!13307 (= e!8135 (= (bitIndex!0 (size!324 (buf!675 (_1!842 lt!20990))) (currentByte!1765 (_1!842 lt!20990)) (currentBit!1760 (_1!842 lt!20990))) (bitIndex!0 (size!324 (buf!675 (_2!841 lt!20988))) (currentByte!1765 (_2!841 lt!20988)) (currentBit!1760 (_2!841 lt!20988)))))))

(declare-fun b!13305 () Bool)

(declare-fun res!12622 () Bool)

(assert (=> b!13305 (=> (not res!12622) (not e!8136))))

(assert (=> b!13305 (= res!12622 (isPrefixOf!0 thiss!957 (_2!841 lt!20988)))))

(declare-fun d!4278 () Bool)

(assert (=> d!4278 e!8136))

(declare-fun res!12621 () Bool)

(assert (=> d!4278 (=> (not res!12621) (not e!8136))))

(assert (=> d!4278 (= res!12621 (= (size!324 (buf!675 thiss!957)) (size!324 (buf!675 (_2!841 lt!20988)))))))

(declare-fun choose!16 (BitStream!608 Bool) tuple2!1572)

(assert (=> d!4278 (= lt!20988 (choose!16 thiss!957 false))))

(assert (=> d!4278 (validate_offset_bit!0 ((_ sign_extend 32) (size!324 (buf!675 thiss!957))) ((_ sign_extend 32) (currentByte!1765 thiss!957)) ((_ sign_extend 32) (currentBit!1760 thiss!957)))))

(assert (=> d!4278 (= (appendBit!0 thiss!957 false) lt!20988)))

(assert (= (and d!4278 res!12621) b!13304))

(assert (= (and b!13304 res!12620) b!13305))

(assert (= (and b!13305 res!12622) b!13306))

(assert (= (and b!13306 res!12623) b!13307))

(declare-fun m!19947 () Bool)

(assert (=> b!13307 m!19947))

(declare-fun m!19949 () Bool)

(assert (=> b!13307 m!19949))

(declare-fun m!19951 () Bool)

(assert (=> b!13305 m!19951))

(declare-fun m!19953 () Bool)

(assert (=> b!13306 m!19953))

(assert (=> b!13306 m!19953))

(declare-fun m!19955 () Bool)

(assert (=> b!13306 m!19955))

(assert (=> b!13304 m!19949))

(assert (=> b!13304 m!19877))

(declare-fun m!19957 () Bool)

(assert (=> d!4278 m!19957))

(assert (=> d!4278 m!19863))

(assert (=> b!13203 d!4278))

(declare-fun d!4284 () Bool)

(declare-fun e!8137 () Bool)

(assert (=> d!4284 e!8137))

(declare-fun res!12625 () Bool)

(assert (=> d!4284 (=> (not res!12625) (not e!8137))))

(declare-fun lt!20991 () (_ BitVec 64))

(declare-fun lt!20996 () (_ BitVec 64))

(declare-fun lt!20993 () (_ BitVec 64))

(assert (=> d!4284 (= res!12625 (= lt!20993 (bvsub lt!20996 lt!20991)))))

(assert (=> d!4284 (or (= (bvand lt!20996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20991 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20996 lt!20991) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4284 (= lt!20991 (remainingBits!0 ((_ sign_extend 32) (size!324 (buf!675 (_2!841 lt!20868)))) ((_ sign_extend 32) (currentByte!1765 (_2!841 lt!20868))) ((_ sign_extend 32) (currentBit!1760 (_2!841 lt!20868)))))))

(declare-fun lt!20994 () (_ BitVec 64))

(declare-fun lt!20995 () (_ BitVec 64))

(assert (=> d!4284 (= lt!20996 (bvmul lt!20994 lt!20995))))

(assert (=> d!4284 (or (= lt!20994 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!20995 (bvsdiv (bvmul lt!20994 lt!20995) lt!20994)))))

(assert (=> d!4284 (= lt!20995 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4284 (= lt!20994 ((_ sign_extend 32) (size!324 (buf!675 (_2!841 lt!20868)))))))

(assert (=> d!4284 (= lt!20993 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1765 (_2!841 lt!20868))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1760 (_2!841 lt!20868)))))))

(assert (=> d!4284 (invariant!0 (currentBit!1760 (_2!841 lt!20868)) (currentByte!1765 (_2!841 lt!20868)) (size!324 (buf!675 (_2!841 lt!20868))))))

(assert (=> d!4284 (= (bitIndex!0 (size!324 (buf!675 (_2!841 lt!20868))) (currentByte!1765 (_2!841 lt!20868)) (currentBit!1760 (_2!841 lt!20868))) lt!20993)))

(declare-fun b!13308 () Bool)

(declare-fun res!12624 () Bool)

(assert (=> b!13308 (=> (not res!12624) (not e!8137))))

(assert (=> b!13308 (= res!12624 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!20993))))

(declare-fun b!13309 () Bool)

(declare-fun lt!20992 () (_ BitVec 64))

(assert (=> b!13309 (= e!8137 (bvsle lt!20993 (bvmul lt!20992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13309 (or (= lt!20992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!20992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!20992)))))

(assert (=> b!13309 (= lt!20992 ((_ sign_extend 32) (size!324 (buf!675 (_2!841 lt!20868)))))))

(assert (= (and d!4284 res!12625) b!13308))

(assert (= (and b!13308 res!12624) b!13309))

(declare-fun m!19959 () Bool)

(assert (=> d!4284 m!19959))

(assert (=> d!4284 m!19861))

(assert (=> b!13204 d!4284))

(declare-fun d!4286 () Bool)

(declare-fun e!8138 () Bool)

(assert (=> d!4286 e!8138))

