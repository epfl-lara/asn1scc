; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2800 () Bool)

(assert start!2800)

(declare-fun b!13182 () Bool)

(declare-fun e!8059 () Bool)

(declare-fun e!8057 () Bool)

(assert (=> b!13182 (= e!8059 e!8057)))

(declare-fun res!12507 () Bool)

(assert (=> b!13182 (=> (not res!12507) (not e!8057))))

(declare-datatypes ((array!743 0))(
  ( (array!744 (arr!752 (Array (_ BitVec 32) (_ BitVec 8))) (size!323 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!606 0))(
  ( (BitStream!607 (buf!674 array!743) (currentByte!1764 (_ BitVec 32)) (currentBit!1759 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1568 0))(
  ( (tuple2!1569 (_1!839 BitStream!606) (_2!839 Bool)) )
))
(declare-fun lt!20855 () tuple2!1568)

(declare-datatypes ((Unit!1111 0))(
  ( (Unit!1112) )
))
(declare-datatypes ((tuple2!1570 0))(
  ( (tuple2!1571 (_1!840 Unit!1111) (_2!840 BitStream!606)) )
))
(declare-fun lt!20857 () tuple2!1570)

(assert (=> b!13182 (= res!12507 (and (not (_2!839 lt!20855)) (= (_1!839 lt!20855) (_2!840 lt!20857))))))

(declare-fun thiss!957 () BitStream!606)

(declare-fun readBitPure!0 (BitStream!606) tuple2!1568)

(declare-fun readerFrom!0 (BitStream!606 (_ BitVec 32) (_ BitVec 32)) BitStream!606)

(assert (=> b!13182 (= lt!20855 (readBitPure!0 (readerFrom!0 (_2!840 lt!20857) (currentBit!1759 thiss!957) (currentByte!1764 thiss!957))))))

(declare-fun b!13183 () Bool)

(declare-fun e!8058 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13183 (= e!8058 (invariant!0 (currentBit!1759 (_2!840 lt!20857)) (currentByte!1764 (_2!840 lt!20857)) (size!323 (buf!674 (_2!840 lt!20857)))))))

(declare-fun b!13185 () Bool)

(declare-fun e!8060 () Bool)

(assert (=> b!13185 (= e!8060 (not e!8058))))

(declare-fun res!12508 () Bool)

(assert (=> b!13185 (=> res!12508 e!8058)))

(assert (=> b!13185 (= res!12508 (not (= (size!323 (buf!674 (_2!840 lt!20857))) (size!323 (buf!674 thiss!957)))))))

(declare-fun e!8055 () Bool)

(assert (=> b!13185 e!8055))

(declare-fun res!12506 () Bool)

(assert (=> b!13185 (=> (not res!12506) (not e!8055))))

(assert (=> b!13185 (= res!12506 (= (size!323 (buf!674 thiss!957)) (size!323 (buf!674 (_2!840 lt!20857)))))))

(declare-fun appendBit!0 (BitStream!606 Bool) tuple2!1570)

(assert (=> b!13185 (= lt!20857 (appendBit!0 thiss!957 false))))

(declare-fun b!13186 () Bool)

(declare-fun res!12504 () Bool)

(assert (=> b!13186 (=> (not res!12504) (not e!8059))))

(declare-fun isPrefixOf!0 (BitStream!606 BitStream!606) Bool)

(assert (=> b!13186 (= res!12504 (isPrefixOf!0 thiss!957 (_2!840 lt!20857)))))

(declare-fun b!13187 () Bool)

(declare-fun lt!20858 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13187 (= e!8057 (= (bitIndex!0 (size!323 (buf!674 (_1!839 lt!20855))) (currentByte!1764 (_1!839 lt!20855)) (currentBit!1759 (_1!839 lt!20855))) lt!20858))))

(declare-fun b!13188 () Bool)

(assert (=> b!13188 (= e!8055 e!8059)))

(declare-fun res!12505 () Bool)

(assert (=> b!13188 (=> (not res!12505) (not e!8059))))

(declare-fun lt!20856 () (_ BitVec 64))

(assert (=> b!13188 (= res!12505 (= lt!20858 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!20856)))))

(assert (=> b!13188 (= lt!20858 (bitIndex!0 (size!323 (buf!674 (_2!840 lt!20857))) (currentByte!1764 (_2!840 lt!20857)) (currentBit!1759 (_2!840 lt!20857))))))

(assert (=> b!13188 (= lt!20856 (bitIndex!0 (size!323 (buf!674 thiss!957)) (currentByte!1764 thiss!957) (currentBit!1759 thiss!957)))))

(declare-fun res!12503 () Bool)

(assert (=> start!2800 (=> (not res!12503) (not e!8060))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2800 (= res!12503 (validate_offset_bit!0 ((_ sign_extend 32) (size!323 (buf!674 thiss!957))) ((_ sign_extend 32) (currentByte!1764 thiss!957)) ((_ sign_extend 32) (currentBit!1759 thiss!957))))))

(assert (=> start!2800 e!8060))

(declare-fun e!8054 () Bool)

(declare-fun inv!12 (BitStream!606) Bool)

(assert (=> start!2800 (and (inv!12 thiss!957) e!8054)))

(declare-fun b!13184 () Bool)

(declare-fun array_inv!312 (array!743) Bool)

(assert (=> b!13184 (= e!8054 (array_inv!312 (buf!674 thiss!957)))))

(assert (= (and start!2800 res!12503) b!13185))

(assert (= (and b!13185 res!12506) b!13188))

(assert (= (and b!13188 res!12505) b!13186))

(assert (= (and b!13186 res!12504) b!13182))

(assert (= (and b!13182 res!12507) b!13187))

(assert (= (and b!13185 (not res!12508)) b!13183))

(assert (= start!2800 b!13184))

(declare-fun m!19837 () Bool)

(assert (=> b!13184 m!19837))

(declare-fun m!19839 () Bool)

(assert (=> b!13185 m!19839))

(declare-fun m!19841 () Bool)

(assert (=> b!13188 m!19841))

(declare-fun m!19843 () Bool)

(assert (=> b!13188 m!19843))

(declare-fun m!19845 () Bool)

(assert (=> b!13186 m!19845))

(declare-fun m!19847 () Bool)

(assert (=> start!2800 m!19847))

(declare-fun m!19849 () Bool)

(assert (=> start!2800 m!19849))

(declare-fun m!19851 () Bool)

(assert (=> b!13182 m!19851))

(assert (=> b!13182 m!19851))

(declare-fun m!19853 () Bool)

(assert (=> b!13182 m!19853))

(declare-fun m!19855 () Bool)

(assert (=> b!13183 m!19855))

(declare-fun m!19857 () Bool)

(assert (=> b!13187 m!19857))

(check-sat (not b!13183) (not b!13186) (not b!13187) (not b!13188) (not b!13185) (not start!2800) (not b!13184) (not b!13182))
(check-sat)
(get-model)

(declare-fun d!4228 () Bool)

(assert (=> d!4228 (= (array_inv!312 (buf!674 thiss!957)) (bvsge (size!323 (buf!674 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13184 d!4228))

(declare-fun d!4230 () Bool)

(declare-fun res!12533 () Bool)

(declare-fun e!8086 () Bool)

(assert (=> d!4230 (=> (not res!12533) (not e!8086))))

(assert (=> d!4230 (= res!12533 (= (size!323 (buf!674 thiss!957)) (size!323 (buf!674 (_2!840 lt!20857)))))))

(assert (=> d!4230 (= (isPrefixOf!0 thiss!957 (_2!840 lt!20857)) e!8086)))

(declare-fun b!13216 () Bool)

(declare-fun res!12535 () Bool)

(assert (=> b!13216 (=> (not res!12535) (not e!8086))))

(assert (=> b!13216 (= res!12535 (bvsle (bitIndex!0 (size!323 (buf!674 thiss!957)) (currentByte!1764 thiss!957) (currentBit!1759 thiss!957)) (bitIndex!0 (size!323 (buf!674 (_2!840 lt!20857))) (currentByte!1764 (_2!840 lt!20857)) (currentBit!1759 (_2!840 lt!20857)))))))

(declare-fun b!13217 () Bool)

(declare-fun e!8087 () Bool)

(assert (=> b!13217 (= e!8086 e!8087)))

(declare-fun res!12534 () Bool)

(assert (=> b!13217 (=> res!12534 e!8087)))

(assert (=> b!13217 (= res!12534 (= (size!323 (buf!674 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13218 () Bool)

(declare-fun arrayBitRangesEq!0 (array!743 array!743 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13218 (= e!8087 (arrayBitRangesEq!0 (buf!674 thiss!957) (buf!674 (_2!840 lt!20857)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!323 (buf!674 thiss!957)) (currentByte!1764 thiss!957) (currentBit!1759 thiss!957))))))

(assert (= (and d!4230 res!12533) b!13216))

(assert (= (and b!13216 res!12535) b!13217))

(assert (= (and b!13217 (not res!12534)) b!13218))

(assert (=> b!13216 m!19843))

(assert (=> b!13216 m!19841))

(assert (=> b!13218 m!19843))

(assert (=> b!13218 m!19843))

(declare-fun m!19881 () Bool)

(assert (=> b!13218 m!19881))

(assert (=> b!13186 d!4230))

(declare-fun d!4232 () Bool)

(declare-fun e!8093 () Bool)

(assert (=> d!4232 e!8093))

(declare-fun res!12544 () Bool)

(assert (=> d!4232 (=> (not res!12544) (not e!8093))))

(declare-fun lt!20880 () tuple2!1570)

(assert (=> d!4232 (= res!12544 (= (size!323 (buf!674 thiss!957)) (size!323 (buf!674 (_2!840 lt!20880)))))))

(declare-fun choose!16 (BitStream!606 Bool) tuple2!1570)

(assert (=> d!4232 (= lt!20880 (choose!16 thiss!957 false))))

(assert (=> d!4232 (validate_offset_bit!0 ((_ sign_extend 32) (size!323 (buf!674 thiss!957))) ((_ sign_extend 32) (currentByte!1764 thiss!957)) ((_ sign_extend 32) (currentBit!1759 thiss!957)))))

(assert (=> d!4232 (= (appendBit!0 thiss!957 false) lt!20880)))

(declare-fun b!13229 () Bool)

(declare-fun res!12545 () Bool)

(assert (=> b!13229 (=> (not res!12545) (not e!8093))))

(assert (=> b!13229 (= res!12545 (isPrefixOf!0 thiss!957 (_2!840 lt!20880)))))

(declare-fun b!13230 () Bool)

(declare-fun e!8092 () Bool)

(assert (=> b!13230 (= e!8093 e!8092)))

(declare-fun res!12546 () Bool)

(assert (=> b!13230 (=> (not res!12546) (not e!8092))))

(declare-fun lt!20882 () tuple2!1568)

(assert (=> b!13230 (= res!12546 (and (= (_2!839 lt!20882) false) (= (_1!839 lt!20882) (_2!840 lt!20880))))))

(assert (=> b!13230 (= lt!20882 (readBitPure!0 (readerFrom!0 (_2!840 lt!20880) (currentBit!1759 thiss!957) (currentByte!1764 thiss!957))))))

(declare-fun b!13231 () Bool)

(assert (=> b!13231 (= e!8092 (= (bitIndex!0 (size!323 (buf!674 (_1!839 lt!20882))) (currentByte!1764 (_1!839 lt!20882)) (currentBit!1759 (_1!839 lt!20882))) (bitIndex!0 (size!323 (buf!674 (_2!840 lt!20880))) (currentByte!1764 (_2!840 lt!20880)) (currentBit!1759 (_2!840 lt!20880)))))))

(declare-fun b!13228 () Bool)

(declare-fun res!12547 () Bool)

(assert (=> b!13228 (=> (not res!12547) (not e!8093))))

(declare-fun lt!20879 () (_ BitVec 64))

(declare-fun lt!20881 () (_ BitVec 64))

(assert (=> b!13228 (= res!12547 (= (bitIndex!0 (size!323 (buf!674 (_2!840 lt!20880))) (currentByte!1764 (_2!840 lt!20880)) (currentBit!1759 (_2!840 lt!20880))) (bvadd lt!20881 lt!20879)))))

(assert (=> b!13228 (or (not (= (bvand lt!20881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20879 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!20881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!20881 lt!20879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13228 (= lt!20879 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13228 (= lt!20881 (bitIndex!0 (size!323 (buf!674 thiss!957)) (currentByte!1764 thiss!957) (currentBit!1759 thiss!957)))))

(assert (= (and d!4232 res!12544) b!13228))

(assert (= (and b!13228 res!12547) b!13229))

(assert (= (and b!13229 res!12545) b!13230))

(assert (= (and b!13230 res!12546) b!13231))

(declare-fun m!19883 () Bool)

(assert (=> d!4232 m!19883))

(assert (=> d!4232 m!19847))

(declare-fun m!19885 () Bool)

(assert (=> b!13229 m!19885))

(declare-fun m!19887 () Bool)

(assert (=> b!13228 m!19887))

(assert (=> b!13228 m!19843))

(declare-fun m!19889 () Bool)

(assert (=> b!13230 m!19889))

(assert (=> b!13230 m!19889))

(declare-fun m!19891 () Bool)

(assert (=> b!13230 m!19891))

(declare-fun m!19893 () Bool)

(assert (=> b!13231 m!19893))

(assert (=> b!13231 m!19887))

(assert (=> b!13185 d!4232))

(declare-fun d!4240 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4240 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!323 (buf!674 thiss!957))) ((_ sign_extend 32) (currentByte!1764 thiss!957)) ((_ sign_extend 32) (currentBit!1759 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!323 (buf!674 thiss!957))) ((_ sign_extend 32) (currentByte!1764 thiss!957)) ((_ sign_extend 32) (currentBit!1759 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1192 () Bool)

(assert (= bs!1192 d!4240))

(declare-fun m!19895 () Bool)

(assert (=> bs!1192 m!19895))

(assert (=> start!2800 d!4240))

(declare-fun d!4242 () Bool)

(assert (=> d!4242 (= (inv!12 thiss!957) (invariant!0 (currentBit!1759 thiss!957) (currentByte!1764 thiss!957) (size!323 (buf!674 thiss!957))))))

(declare-fun bs!1193 () Bool)

(assert (= bs!1193 d!4242))

(declare-fun m!19897 () Bool)

(assert (=> bs!1193 m!19897))

(assert (=> start!2800 d!4242))

(declare-fun d!4246 () Bool)

(declare-fun e!8101 () Bool)

(assert (=> d!4246 e!8101))

(declare-fun res!12563 () Bool)

(assert (=> d!4246 (=> (not res!12563) (not e!8101))))

(declare-fun lt!20930 () (_ BitVec 64))

(declare-fun lt!20929 () (_ BitVec 64))

(declare-fun lt!20925 () (_ BitVec 64))

(assert (=> d!4246 (= res!12563 (= lt!20929 (bvsub lt!20930 lt!20925)))))

(assert (=> d!4246 (or (= (bvand lt!20930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20925 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20930 lt!20925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4246 (= lt!20925 (remainingBits!0 ((_ sign_extend 32) (size!323 (buf!674 (_1!839 lt!20855)))) ((_ sign_extend 32) (currentByte!1764 (_1!839 lt!20855))) ((_ sign_extend 32) (currentBit!1759 (_1!839 lt!20855)))))))

(declare-fun lt!20928 () (_ BitVec 64))

(declare-fun lt!20926 () (_ BitVec 64))

(assert (=> d!4246 (= lt!20930 (bvmul lt!20928 lt!20926))))

(assert (=> d!4246 (or (= lt!20928 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!20926 (bvsdiv (bvmul lt!20928 lt!20926) lt!20928)))))

(assert (=> d!4246 (= lt!20926 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4246 (= lt!20928 ((_ sign_extend 32) (size!323 (buf!674 (_1!839 lt!20855)))))))

(assert (=> d!4246 (= lt!20929 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1764 (_1!839 lt!20855))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1759 (_1!839 lt!20855)))))))

(assert (=> d!4246 (invariant!0 (currentBit!1759 (_1!839 lt!20855)) (currentByte!1764 (_1!839 lt!20855)) (size!323 (buf!674 (_1!839 lt!20855))))))

(assert (=> d!4246 (= (bitIndex!0 (size!323 (buf!674 (_1!839 lt!20855))) (currentByte!1764 (_1!839 lt!20855)) (currentBit!1759 (_1!839 lt!20855))) lt!20929)))

(declare-fun b!13246 () Bool)

(declare-fun res!12562 () Bool)

(assert (=> b!13246 (=> (not res!12562) (not e!8101))))

(assert (=> b!13246 (= res!12562 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!20929))))

(declare-fun b!13247 () Bool)

(declare-fun lt!20927 () (_ BitVec 64))

(assert (=> b!13247 (= e!8101 (bvsle lt!20929 (bvmul lt!20927 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13247 (or (= lt!20927 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!20927 #b0000000000000000000000000000000000000000000000000000000000001000) lt!20927)))))

(assert (=> b!13247 (= lt!20927 ((_ sign_extend 32) (size!323 (buf!674 (_1!839 lt!20855)))))))

(assert (= (and d!4246 res!12563) b!13246))

(assert (= (and b!13246 res!12562) b!13247))

(declare-fun m!19909 () Bool)

(assert (=> d!4246 m!19909))

(declare-fun m!19911 () Bool)

(assert (=> d!4246 m!19911))

(assert (=> b!13187 d!4246))

(declare-fun d!4256 () Bool)

(declare-datatypes ((tuple2!1576 0))(
  ( (tuple2!1577 (_1!843 Bool) (_2!843 BitStream!606)) )
))
(declare-fun lt!20933 () tuple2!1576)

(declare-fun readBit!0 (BitStream!606) tuple2!1576)

(assert (=> d!4256 (= lt!20933 (readBit!0 (readerFrom!0 (_2!840 lt!20857) (currentBit!1759 thiss!957) (currentByte!1764 thiss!957))))))

(assert (=> d!4256 (= (readBitPure!0 (readerFrom!0 (_2!840 lt!20857) (currentBit!1759 thiss!957) (currentByte!1764 thiss!957))) (tuple2!1569 (_2!843 lt!20933) (_1!843 lt!20933)))))

(declare-fun bs!1194 () Bool)

(assert (= bs!1194 d!4256))

(assert (=> bs!1194 m!19851))

(declare-fun m!19913 () Bool)

(assert (=> bs!1194 m!19913))

(assert (=> b!13182 d!4256))

(declare-fun d!4258 () Bool)

(declare-fun e!8106 () Bool)

(assert (=> d!4258 e!8106))

(declare-fun res!12571 () Bool)

(assert (=> d!4258 (=> (not res!12571) (not e!8106))))

(assert (=> d!4258 (= res!12571 (invariant!0 (currentBit!1759 (_2!840 lt!20857)) (currentByte!1764 (_2!840 lt!20857)) (size!323 (buf!674 (_2!840 lt!20857)))))))

(assert (=> d!4258 (= (readerFrom!0 (_2!840 lt!20857) (currentBit!1759 thiss!957) (currentByte!1764 thiss!957)) (BitStream!607 (buf!674 (_2!840 lt!20857)) (currentByte!1764 thiss!957) (currentBit!1759 thiss!957)))))

(declare-fun b!13254 () Bool)

(assert (=> b!13254 (= e!8106 (invariant!0 (currentBit!1759 thiss!957) (currentByte!1764 thiss!957) (size!323 (buf!674 (_2!840 lt!20857)))))))

(assert (= (and d!4258 res!12571) b!13254))

(assert (=> d!4258 m!19855))

(declare-fun m!19915 () Bool)

(assert (=> b!13254 m!19915))

(assert (=> b!13182 d!4258))

(declare-fun d!4260 () Bool)

(assert (=> d!4260 (= (invariant!0 (currentBit!1759 (_2!840 lt!20857)) (currentByte!1764 (_2!840 lt!20857)) (size!323 (buf!674 (_2!840 lt!20857)))) (and (bvsge (currentBit!1759 (_2!840 lt!20857)) #b00000000000000000000000000000000) (bvslt (currentBit!1759 (_2!840 lt!20857)) #b00000000000000000000000000001000) (bvsge (currentByte!1764 (_2!840 lt!20857)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1764 (_2!840 lt!20857)) (size!323 (buf!674 (_2!840 lt!20857)))) (and (= (currentBit!1759 (_2!840 lt!20857)) #b00000000000000000000000000000000) (= (currentByte!1764 (_2!840 lt!20857)) (size!323 (buf!674 (_2!840 lt!20857))))))))))

(assert (=> b!13183 d!4260))

(declare-fun d!4262 () Bool)

(declare-fun e!8110 () Bool)

(assert (=> d!4262 e!8110))

(declare-fun res!12581 () Bool)

(assert (=> d!4262 (=> (not res!12581) (not e!8110))))

(declare-fun lt!20962 () (_ BitVec 64))

(declare-fun lt!20958 () (_ BitVec 64))

(declare-fun lt!20963 () (_ BitVec 64))

(assert (=> d!4262 (= res!12581 (= lt!20962 (bvsub lt!20963 lt!20958)))))

(assert (=> d!4262 (or (= (bvand lt!20963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20958 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20963 lt!20958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4262 (= lt!20958 (remainingBits!0 ((_ sign_extend 32) (size!323 (buf!674 (_2!840 lt!20857)))) ((_ sign_extend 32) (currentByte!1764 (_2!840 lt!20857))) ((_ sign_extend 32) (currentBit!1759 (_2!840 lt!20857)))))))

(declare-fun lt!20961 () (_ BitVec 64))

(declare-fun lt!20959 () (_ BitVec 64))

(assert (=> d!4262 (= lt!20963 (bvmul lt!20961 lt!20959))))

(assert (=> d!4262 (or (= lt!20961 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!20959 (bvsdiv (bvmul lt!20961 lt!20959) lt!20961)))))

(assert (=> d!4262 (= lt!20959 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4262 (= lt!20961 ((_ sign_extend 32) (size!323 (buf!674 (_2!840 lt!20857)))))))

(assert (=> d!4262 (= lt!20962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1764 (_2!840 lt!20857))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1759 (_2!840 lt!20857)))))))

(assert (=> d!4262 (invariant!0 (currentBit!1759 (_2!840 lt!20857)) (currentByte!1764 (_2!840 lt!20857)) (size!323 (buf!674 (_2!840 lt!20857))))))

(assert (=> d!4262 (= (bitIndex!0 (size!323 (buf!674 (_2!840 lt!20857))) (currentByte!1764 (_2!840 lt!20857)) (currentBit!1759 (_2!840 lt!20857))) lt!20962)))

(declare-fun b!13262 () Bool)

(declare-fun res!12580 () Bool)

(assert (=> b!13262 (=> (not res!12580) (not e!8110))))

(assert (=> b!13262 (= res!12580 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!20962))))

(declare-fun b!13263 () Bool)

(declare-fun lt!20960 () (_ BitVec 64))

(assert (=> b!13263 (= e!8110 (bvsle lt!20962 (bvmul lt!20960 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13263 (or (= lt!20960 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!20960 #b0000000000000000000000000000000000000000000000000000000000001000) lt!20960)))))

(assert (=> b!13263 (= lt!20960 ((_ sign_extend 32) (size!323 (buf!674 (_2!840 lt!20857)))))))

(assert (= (and d!4262 res!12581) b!13262))

(assert (= (and b!13262 res!12580) b!13263))

(declare-fun m!19921 () Bool)

(assert (=> d!4262 m!19921))

(assert (=> d!4262 m!19855))

(assert (=> b!13188 d!4262))

(declare-fun d!4266 () Bool)

(declare-fun e!8113 () Bool)

(assert (=> d!4266 e!8113))

(declare-fun res!12585 () Bool)

(assert (=> d!4266 (=> (not res!12585) (not e!8113))))

(declare-fun lt!20970 () (_ BitVec 64))

(declare-fun lt!20971 () (_ BitVec 64))

(declare-fun lt!20966 () (_ BitVec 64))

(assert (=> d!4266 (= res!12585 (= lt!20970 (bvsub lt!20971 lt!20966)))))

(assert (=> d!4266 (or (= (bvand lt!20971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20966 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20971 lt!20966) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4266 (= lt!20966 (remainingBits!0 ((_ sign_extend 32) (size!323 (buf!674 thiss!957))) ((_ sign_extend 32) (currentByte!1764 thiss!957)) ((_ sign_extend 32) (currentBit!1759 thiss!957))))))

(declare-fun lt!20969 () (_ BitVec 64))

(declare-fun lt!20967 () (_ BitVec 64))

(assert (=> d!4266 (= lt!20971 (bvmul lt!20969 lt!20967))))

(assert (=> d!4266 (or (= lt!20969 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!20967 (bvsdiv (bvmul lt!20969 lt!20967) lt!20969)))))

(assert (=> d!4266 (= lt!20967 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4266 (= lt!20969 ((_ sign_extend 32) (size!323 (buf!674 thiss!957))))))

(assert (=> d!4266 (= lt!20970 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1764 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1759 thiss!957))))))

(assert (=> d!4266 (invariant!0 (currentBit!1759 thiss!957) (currentByte!1764 thiss!957) (size!323 (buf!674 thiss!957)))))

(assert (=> d!4266 (= (bitIndex!0 (size!323 (buf!674 thiss!957)) (currentByte!1764 thiss!957) (currentBit!1759 thiss!957)) lt!20970)))

(declare-fun b!13268 () Bool)

(declare-fun res!12584 () Bool)

(assert (=> b!13268 (=> (not res!12584) (not e!8113))))

(assert (=> b!13268 (= res!12584 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!20970))))

(declare-fun b!13269 () Bool)

(declare-fun lt!20968 () (_ BitVec 64))

(assert (=> b!13269 (= e!8113 (bvsle lt!20970 (bvmul lt!20968 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13269 (or (= lt!20968 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!20968 #b0000000000000000000000000000000000000000000000000000000000001000) lt!20968)))))

(assert (=> b!13269 (= lt!20968 ((_ sign_extend 32) (size!323 (buf!674 thiss!957))))))

(assert (= (and d!4266 res!12585) b!13268))

(assert (= (and b!13268 res!12584) b!13269))

(assert (=> d!4266 m!19895))

(assert (=> d!4266 m!19897))

(assert (=> b!13188 d!4266))

(check-sat (not d!4240) (not d!4258) (not d!4242) (not d!4256) (not b!13229) (not b!13216) (not b!13230) (not b!13218) (not d!4262) (not d!4246) (not b!13228) (not d!4266) (not b!13254) (not d!4232) (not b!13231))
