; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61632 () Bool)

(assert start!61632)

(declare-fun b!276789 () Bool)

(declare-fun e!196712 () Bool)

(declare-fun e!196711 () Bool)

(assert (=> b!276789 (= e!196712 (not e!196711))))

(declare-fun res!229934 () Bool)

(assert (=> b!276789 (=> res!229934 e!196711)))

(declare-fun lt!414911 () (_ BitVec 64))

(declare-fun lt!414910 () (_ BitVec 64))

(declare-datatypes ((array!15846 0))(
  ( (array!15847 (arr!7853 (Array (_ BitVec 32) (_ BitVec 8))) (size!6860 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12534 0))(
  ( (BitStream!12535 (buf!7328 array!15846) (currentByte!13566 (_ BitVec 32)) (currentBit!13561 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12534)

(assert (=> b!276789 (= res!229934 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414911) (bvsgt lt!414911 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6860 (buf!7328 bs1!11))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414910) (bvsge lt!414910 lt!414911)))))

(declare-datatypes ((tuple2!22574 0))(
  ( (tuple2!22575 (_1!12337 BitStream!12534) (_2!12337 Bool)) )
))
(declare-fun lt!414912 () tuple2!22574)

(declare-fun bs2!19 () BitStream!12534)

(declare-fun readBitPure!0 (BitStream!12534) tuple2!22574)

(assert (=> b!276789 (= lt!414912 (readBitPure!0 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))))

(declare-fun lt!414908 () tuple2!22574)

(assert (=> b!276789 (= lt!414908 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276789 (invariant!0 (currentBit!13561 bs1!11) (currentByte!13566 bs1!11) (size!6860 (buf!7328 bs2!19)))))

(declare-fun b!276790 () Bool)

(declare-fun res!229935 () Bool)

(declare-fun e!196715 () Bool)

(assert (=> b!276790 (=> (not res!229935) (not e!196715))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276790 (= res!229935 (validate_offset_bit!0 ((_ sign_extend 32) (size!6860 (buf!7328 bs1!11))) ((_ sign_extend 32) (currentByte!13566 bs1!11)) ((_ sign_extend 32) (currentBit!13561 bs1!11))))))

(declare-fun b!276791 () Bool)

(declare-fun e!196714 () Bool)

(declare-fun array_inv!6584 (array!15846) Bool)

(assert (=> b!276791 (= e!196714 (array_inv!6584 (buf!7328 bs2!19)))))

(declare-fun b!276792 () Bool)

(declare-fun e!196717 () Bool)

(assert (=> b!276792 (= e!196717 (= (_2!12337 lt!414908) (_2!12337 lt!414912)))))

(declare-fun b!276793 () Bool)

(declare-fun e!196718 () Bool)

(assert (=> b!276793 (= e!196718 (array_inv!6584 (buf!7328 bs1!11)))))

(declare-fun b!276795 () Bool)

(assert (=> b!276795 (= e!196711 e!196717)))

(declare-fun res!229933 () Bool)

(assert (=> b!276795 (=> (not res!229933) (not e!196717))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276795 (= res!229933 (= (bitIndex!0 (size!6860 (buf!7328 (_1!12337 lt!414908))) (currentByte!13566 (_1!12337 lt!414908)) (currentBit!13561 (_1!12337 lt!414908))) (bitIndex!0 (size!6860 (buf!7328 (_1!12337 lt!414912))) (currentByte!13566 (_1!12337 lt!414912)) (currentBit!13561 (_1!12337 lt!414912)))))))

(declare-fun bitAt!0 (array!15846 (_ BitVec 64)) Bool)

(assert (=> b!276795 (= (bitAt!0 (buf!7328 bs1!11) lt!414910) (bitAt!0 (buf!7328 bs2!19) lt!414910))))

(declare-datatypes ((Unit!19385 0))(
  ( (Unit!19386) )
))
(declare-fun lt!414909 () Unit!19385)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!15846 array!15846 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19385)

(assert (=> b!276795 (= lt!414909 (arrayBitRangesEqImpliesEq!0 (buf!7328 bs1!11) (buf!7328 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414910 lt!414911))))

(declare-fun res!229932 () Bool)

(assert (=> start!61632 (=> (not res!229932) (not e!196715))))

(assert (=> start!61632 (= res!229932 (= (size!6860 (buf!7328 bs1!11)) (size!6860 (buf!7328 bs2!19))))))

(assert (=> start!61632 e!196715))

(declare-fun inv!12 (BitStream!12534) Bool)

(assert (=> start!61632 (and (inv!12 bs1!11) e!196718)))

(assert (=> start!61632 (and (inv!12 bs2!19) e!196714)))

(declare-fun b!276794 () Bool)

(assert (=> b!276794 (= e!196715 e!196712)))

(declare-fun res!229936 () Bool)

(assert (=> b!276794 (=> (not res!229936) (not e!196712))))

(declare-fun arrayBitRangesEq!0 (array!15846 array!15846 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276794 (= res!229936 (arrayBitRangesEq!0 (buf!7328 bs1!11) (buf!7328 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414911))))

(assert (=> b!276794 (= lt!414911 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414910))))

(assert (=> b!276794 (= lt!414910 (bitIndex!0 (size!6860 (buf!7328 bs1!11)) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))

(assert (= (and start!61632 res!229932) b!276790))

(assert (= (and b!276790 res!229935) b!276794))

(assert (= (and b!276794 res!229936) b!276789))

(assert (= (and b!276789 (not res!229934)) b!276795))

(assert (= (and b!276795 res!229933) b!276792))

(assert (= start!61632 b!276793))

(assert (= start!61632 b!276791))

(declare-fun m!409853 () Bool)

(assert (=> b!276789 m!409853))

(declare-fun m!409855 () Bool)

(assert (=> b!276789 m!409855))

(declare-fun m!409857 () Bool)

(assert (=> b!276789 m!409857))

(declare-fun m!409859 () Bool)

(assert (=> b!276794 m!409859))

(declare-fun m!409861 () Bool)

(assert (=> b!276794 m!409861))

(declare-fun m!409863 () Bool)

(assert (=> b!276795 m!409863))

(declare-fun m!409865 () Bool)

(assert (=> b!276795 m!409865))

(declare-fun m!409867 () Bool)

(assert (=> b!276795 m!409867))

(declare-fun m!409869 () Bool)

(assert (=> b!276795 m!409869))

(declare-fun m!409871 () Bool)

(assert (=> b!276795 m!409871))

(declare-fun m!409873 () Bool)

(assert (=> b!276793 m!409873))

(declare-fun m!409875 () Bool)

(assert (=> b!276791 m!409875))

(declare-fun m!409877 () Bool)

(assert (=> start!61632 m!409877))

(declare-fun m!409879 () Bool)

(assert (=> start!61632 m!409879))

(declare-fun m!409881 () Bool)

(assert (=> b!276790 m!409881))

(check-sat (not b!276793) (not b!276794) (not b!276795) (not b!276790) (not start!61632) (not b!276789) (not b!276791))
(check-sat)
(get-model)

(declare-fun d!95336 () Bool)

(declare-datatypes ((tuple2!22578 0))(
  ( (tuple2!22579 (_1!12339 Bool) (_2!12339 BitStream!12534)) )
))
(declare-fun lt!414930 () tuple2!22578)

(declare-fun readBit!0 (BitStream!12534) tuple2!22578)

(assert (=> d!95336 (= lt!414930 (readBit!0 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))))

(assert (=> d!95336 (= (readBitPure!0 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))) (tuple2!22575 (_2!12339 lt!414930) (_1!12339 lt!414930)))))

(declare-fun bs!24051 () Bool)

(assert (= bs!24051 d!95336))

(declare-fun m!409913 () Bool)

(assert (=> bs!24051 m!409913))

(assert (=> b!276789 d!95336))

(declare-fun d!95338 () Bool)

(declare-fun lt!414931 () tuple2!22578)

(assert (=> d!95338 (= lt!414931 (readBit!0 bs1!11))))

(assert (=> d!95338 (= (readBitPure!0 bs1!11) (tuple2!22575 (_2!12339 lt!414931) (_1!12339 lt!414931)))))

(declare-fun bs!24052 () Bool)

(assert (= bs!24052 d!95338))

(declare-fun m!409915 () Bool)

(assert (=> bs!24052 m!409915))

(assert (=> b!276789 d!95338))

(declare-fun d!95340 () Bool)

(assert (=> d!95340 (= (invariant!0 (currentBit!13561 bs1!11) (currentByte!13566 bs1!11) (size!6860 (buf!7328 bs2!19))) (and (bvsge (currentBit!13561 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13561 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13566 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13566 bs1!11) (size!6860 (buf!7328 bs2!19))) (and (= (currentBit!13561 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13566 bs1!11) (size!6860 (buf!7328 bs2!19)))))))))

(assert (=> b!276789 d!95340))

(declare-fun b!276831 () Bool)

(declare-fun e!196757 () Bool)

(declare-fun call!4466 () Bool)

(assert (=> b!276831 (= e!196757 call!4466)))

(declare-fun b!276832 () Bool)

(declare-fun e!196756 () Bool)

(assert (=> b!276832 (= e!196756 call!4466)))

(declare-fun bm!4463 () Bool)

(declare-fun lt!414943 () (_ BitVec 32))

(declare-datatypes ((tuple4!540 0))(
  ( (tuple4!541 (_1!12340 (_ BitVec 32)) (_2!12340 (_ BitVec 32)) (_3!1050 (_ BitVec 32)) (_4!270 (_ BitVec 32))) )
))
(declare-fun lt!414942 () tuple4!540)

(declare-fun lt!414941 () (_ BitVec 32))

(declare-fun c!12651 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4463 (= call!4466 (byteRangesEq!0 (ite c!12651 (select (arr!7853 (buf!7328 bs1!11)) (_3!1050 lt!414942)) (select (arr!7853 (buf!7328 bs1!11)) (_4!270 lt!414942))) (ite c!12651 (select (arr!7853 (buf!7328 bs2!19)) (_3!1050 lt!414942)) (select (arr!7853 (buf!7328 bs2!19)) (_4!270 lt!414942))) (ite c!12651 lt!414943 #b00000000000000000000000000000000) lt!414941))))

(declare-fun e!196755 () Bool)

(declare-fun b!276834 () Bool)

(declare-fun arrayRangesEq!1163 (array!15846 array!15846 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276834 (= e!196755 (arrayRangesEq!1163 (buf!7328 bs1!11) (buf!7328 bs2!19) (_1!12340 lt!414942) (_2!12340 lt!414942)))))

(declare-fun b!276835 () Bool)

(declare-fun res!229964 () Bool)

(assert (=> b!276835 (= res!229964 (= lt!414941 #b00000000000000000000000000000000))))

(assert (=> b!276835 (=> res!229964 e!196757)))

(declare-fun e!196758 () Bool)

(assert (=> b!276835 (= e!196758 e!196757)))

(declare-fun b!276836 () Bool)

(assert (=> b!276836 (= e!196756 e!196758)))

(declare-fun res!229965 () Bool)

(assert (=> b!276836 (= res!229965 (byteRangesEq!0 (select (arr!7853 (buf!7328 bs1!11)) (_3!1050 lt!414942)) (select (arr!7853 (buf!7328 bs2!19)) (_3!1050 lt!414942)) lt!414943 #b00000000000000000000000000001000))))

(assert (=> b!276836 (=> (not res!229965) (not e!196758))))

(declare-fun b!276837 () Bool)

(declare-fun e!196759 () Bool)

(assert (=> b!276837 (= e!196759 e!196756)))

(assert (=> b!276837 (= c!12651 (= (_3!1050 lt!414942) (_4!270 lt!414942)))))

(declare-fun b!276833 () Bool)

(declare-fun e!196760 () Bool)

(assert (=> b!276833 (= e!196760 e!196759)))

(declare-fun res!229962 () Bool)

(assert (=> b!276833 (=> (not res!229962) (not e!196759))))

(assert (=> b!276833 (= res!229962 e!196755)))

(declare-fun res!229963 () Bool)

(assert (=> b!276833 (=> res!229963 e!196755)))

(assert (=> b!276833 (= res!229963 (bvsge (_1!12340 lt!414942) (_2!12340 lt!414942)))))

(assert (=> b!276833 (= lt!414941 ((_ extract 31 0) (bvsrem lt!414911 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276833 (= lt!414943 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!540)

(assert (=> b!276833 (= lt!414942 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414911))))

(declare-fun d!95342 () Bool)

(declare-fun res!229966 () Bool)

(assert (=> d!95342 (=> res!229966 e!196760)))

(assert (=> d!95342 (= res!229966 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414911))))

(assert (=> d!95342 (= (arrayBitRangesEq!0 (buf!7328 bs1!11) (buf!7328 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414911) e!196760)))

(assert (= (and d!95342 (not res!229966)) b!276833))

(assert (= (and b!276833 (not res!229963)) b!276834))

(assert (= (and b!276833 res!229962) b!276837))

(assert (= (and b!276837 c!12651) b!276832))

(assert (= (and b!276837 (not c!12651)) b!276836))

(assert (= (and b!276836 res!229965) b!276835))

(assert (= (and b!276835 (not res!229964)) b!276831))

(assert (= (or b!276832 b!276831) bm!4463))

(declare-fun m!409923 () Bool)

(assert (=> bm!4463 m!409923))

(declare-fun m!409925 () Bool)

(assert (=> bm!4463 m!409925))

(declare-fun m!409927 () Bool)

(assert (=> bm!4463 m!409927))

(declare-fun m!409929 () Bool)

(assert (=> bm!4463 m!409929))

(declare-fun m!409931 () Bool)

(assert (=> bm!4463 m!409931))

(declare-fun m!409933 () Bool)

(assert (=> b!276834 m!409933))

(assert (=> b!276836 m!409927))

(assert (=> b!276836 m!409929))

(assert (=> b!276836 m!409927))

(assert (=> b!276836 m!409929))

(declare-fun m!409935 () Bool)

(assert (=> b!276836 m!409935))

(declare-fun m!409937 () Bool)

(assert (=> b!276833 m!409937))

(assert (=> b!276794 d!95342))

(declare-fun d!95352 () Bool)

(declare-fun e!196763 () Bool)

(assert (=> d!95352 e!196763))

(declare-fun res!229971 () Bool)

(assert (=> d!95352 (=> (not res!229971) (not e!196763))))

(declare-fun lt!414961 () (_ BitVec 64))

(declare-fun lt!414960 () (_ BitVec 64))

(declare-fun lt!414958 () (_ BitVec 64))

(assert (=> d!95352 (= res!229971 (= lt!414960 (bvsub lt!414958 lt!414961)))))

(assert (=> d!95352 (or (= (bvand lt!414958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414961 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414958 lt!414961) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95352 (= lt!414961 (remainingBits!0 ((_ sign_extend 32) (size!6860 (buf!7328 bs1!11))) ((_ sign_extend 32) (currentByte!13566 bs1!11)) ((_ sign_extend 32) (currentBit!13561 bs1!11))))))

(declare-fun lt!414956 () (_ BitVec 64))

(declare-fun lt!414957 () (_ BitVec 64))

(assert (=> d!95352 (= lt!414958 (bvmul lt!414956 lt!414957))))

(assert (=> d!95352 (or (= lt!414956 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414957 (bvsdiv (bvmul lt!414956 lt!414957) lt!414956)))))

(assert (=> d!95352 (= lt!414957 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95352 (= lt!414956 ((_ sign_extend 32) (size!6860 (buf!7328 bs1!11))))))

(assert (=> d!95352 (= lt!414960 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13566 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13561 bs1!11))))))

(assert (=> d!95352 (invariant!0 (currentBit!13561 bs1!11) (currentByte!13566 bs1!11) (size!6860 (buf!7328 bs1!11)))))

(assert (=> d!95352 (= (bitIndex!0 (size!6860 (buf!7328 bs1!11)) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)) lt!414960)))

(declare-fun b!276842 () Bool)

(declare-fun res!229972 () Bool)

(assert (=> b!276842 (=> (not res!229972) (not e!196763))))

(assert (=> b!276842 (= res!229972 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414960))))

(declare-fun b!276843 () Bool)

(declare-fun lt!414959 () (_ BitVec 64))

(assert (=> b!276843 (= e!196763 (bvsle lt!414960 (bvmul lt!414959 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276843 (or (= lt!414959 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414959 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414959)))))

(assert (=> b!276843 (= lt!414959 ((_ sign_extend 32) (size!6860 (buf!7328 bs1!11))))))

(assert (= (and d!95352 res!229971) b!276842))

(assert (= (and b!276842 res!229972) b!276843))

(declare-fun m!409949 () Bool)

(assert (=> d!95352 m!409949))

(declare-fun m!409951 () Bool)

(assert (=> d!95352 m!409951))

(assert (=> b!276794 d!95352))

(declare-fun d!95364 () Bool)

(declare-fun e!196764 () Bool)

(assert (=> d!95364 e!196764))

(declare-fun res!229973 () Bool)

(assert (=> d!95364 (=> (not res!229973) (not e!196764))))

(declare-fun lt!414964 () (_ BitVec 64))

(declare-fun lt!414967 () (_ BitVec 64))

(declare-fun lt!414966 () (_ BitVec 64))

(assert (=> d!95364 (= res!229973 (= lt!414966 (bvsub lt!414964 lt!414967)))))

(assert (=> d!95364 (or (= (bvand lt!414964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414967 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414964 lt!414967) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95364 (= lt!414967 (remainingBits!0 ((_ sign_extend 32) (size!6860 (buf!7328 (_1!12337 lt!414912)))) ((_ sign_extend 32) (currentByte!13566 (_1!12337 lt!414912))) ((_ sign_extend 32) (currentBit!13561 (_1!12337 lt!414912)))))))

(declare-fun lt!414962 () (_ BitVec 64))

(declare-fun lt!414963 () (_ BitVec 64))

(assert (=> d!95364 (= lt!414964 (bvmul lt!414962 lt!414963))))

(assert (=> d!95364 (or (= lt!414962 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414963 (bvsdiv (bvmul lt!414962 lt!414963) lt!414962)))))

(assert (=> d!95364 (= lt!414963 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95364 (= lt!414962 ((_ sign_extend 32) (size!6860 (buf!7328 (_1!12337 lt!414912)))))))

(assert (=> d!95364 (= lt!414966 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13566 (_1!12337 lt!414912))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13561 (_1!12337 lt!414912)))))))

(assert (=> d!95364 (invariant!0 (currentBit!13561 (_1!12337 lt!414912)) (currentByte!13566 (_1!12337 lt!414912)) (size!6860 (buf!7328 (_1!12337 lt!414912))))))

(assert (=> d!95364 (= (bitIndex!0 (size!6860 (buf!7328 (_1!12337 lt!414912))) (currentByte!13566 (_1!12337 lt!414912)) (currentBit!13561 (_1!12337 lt!414912))) lt!414966)))

(declare-fun b!276844 () Bool)

(declare-fun res!229974 () Bool)

(assert (=> b!276844 (=> (not res!229974) (not e!196764))))

(assert (=> b!276844 (= res!229974 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414966))))

(declare-fun b!276845 () Bool)

(declare-fun lt!414965 () (_ BitVec 64))

(assert (=> b!276845 (= e!196764 (bvsle lt!414966 (bvmul lt!414965 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276845 (or (= lt!414965 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414965 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414965)))))

(assert (=> b!276845 (= lt!414965 ((_ sign_extend 32) (size!6860 (buf!7328 (_1!12337 lt!414912)))))))

(assert (= (and d!95364 res!229973) b!276844))

(assert (= (and b!276844 res!229974) b!276845))

(declare-fun m!409953 () Bool)

(assert (=> d!95364 m!409953))

(declare-fun m!409955 () Bool)

(assert (=> d!95364 m!409955))

(assert (=> b!276795 d!95364))

(declare-fun d!95366 () Bool)

(assert (=> d!95366 (= (bitAt!0 (buf!7328 bs1!11) lt!414910) (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 bs1!11)) ((_ extract 31 0) (bvsdiv lt!414910 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!414910 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!24060 () Bool)

(assert (= bs!24060 d!95366))

(declare-fun m!409957 () Bool)

(assert (=> bs!24060 m!409957))

(declare-fun m!409959 () Bool)

(assert (=> bs!24060 m!409959))

(assert (=> b!276795 d!95366))

(declare-fun d!95368 () Bool)

(declare-fun e!196765 () Bool)

(assert (=> d!95368 e!196765))

(declare-fun res!229975 () Bool)

(assert (=> d!95368 (=> (not res!229975) (not e!196765))))

(declare-fun lt!414972 () (_ BitVec 64))

(declare-fun lt!414970 () (_ BitVec 64))

(declare-fun lt!414973 () (_ BitVec 64))

(assert (=> d!95368 (= res!229975 (= lt!414972 (bvsub lt!414970 lt!414973)))))

(assert (=> d!95368 (or (= (bvand lt!414970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414973 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414970 lt!414973) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95368 (= lt!414973 (remainingBits!0 ((_ sign_extend 32) (size!6860 (buf!7328 (_1!12337 lt!414908)))) ((_ sign_extend 32) (currentByte!13566 (_1!12337 lt!414908))) ((_ sign_extend 32) (currentBit!13561 (_1!12337 lt!414908)))))))

(declare-fun lt!414968 () (_ BitVec 64))

(declare-fun lt!414969 () (_ BitVec 64))

(assert (=> d!95368 (= lt!414970 (bvmul lt!414968 lt!414969))))

(assert (=> d!95368 (or (= lt!414968 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414969 (bvsdiv (bvmul lt!414968 lt!414969) lt!414968)))))

(assert (=> d!95368 (= lt!414969 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95368 (= lt!414968 ((_ sign_extend 32) (size!6860 (buf!7328 (_1!12337 lt!414908)))))))

(assert (=> d!95368 (= lt!414972 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13566 (_1!12337 lt!414908))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13561 (_1!12337 lt!414908)))))))

(assert (=> d!95368 (invariant!0 (currentBit!13561 (_1!12337 lt!414908)) (currentByte!13566 (_1!12337 lt!414908)) (size!6860 (buf!7328 (_1!12337 lt!414908))))))

(assert (=> d!95368 (= (bitIndex!0 (size!6860 (buf!7328 (_1!12337 lt!414908))) (currentByte!13566 (_1!12337 lt!414908)) (currentBit!13561 (_1!12337 lt!414908))) lt!414972)))

(declare-fun b!276846 () Bool)

(declare-fun res!229976 () Bool)

(assert (=> b!276846 (=> (not res!229976) (not e!196765))))

(assert (=> b!276846 (= res!229976 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414972))))

(declare-fun b!276847 () Bool)

(declare-fun lt!414971 () (_ BitVec 64))

(assert (=> b!276847 (= e!196765 (bvsle lt!414972 (bvmul lt!414971 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276847 (or (= lt!414971 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414971 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414971)))))

(assert (=> b!276847 (= lt!414971 ((_ sign_extend 32) (size!6860 (buf!7328 (_1!12337 lt!414908)))))))

(assert (= (and d!95368 res!229975) b!276846))

(assert (= (and b!276846 res!229976) b!276847))

(declare-fun m!409961 () Bool)

(assert (=> d!95368 m!409961))

(declare-fun m!409963 () Bool)

(assert (=> d!95368 m!409963))

(assert (=> b!276795 d!95368))

(declare-fun d!95370 () Bool)

(assert (=> d!95370 (= (bitAt!0 (buf!7328 bs2!19) lt!414910) (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 bs2!19)) ((_ extract 31 0) (bvsdiv lt!414910 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!414910 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!24061 () Bool)

(assert (= bs!24061 d!95370))

(declare-fun m!409965 () Bool)

(assert (=> bs!24061 m!409965))

(assert (=> bs!24061 m!409959))

(assert (=> b!276795 d!95370))

(declare-fun d!95372 () Bool)

(assert (=> d!95372 (= (bitAt!0 (buf!7328 bs1!11) lt!414910) (bitAt!0 (buf!7328 bs2!19) lt!414910))))

(declare-fun lt!414992 () Unit!19385)

(declare-fun choose!31 (array!15846 array!15846 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19385)

(assert (=> d!95372 (= lt!414992 (choose!31 (buf!7328 bs1!11) (buf!7328 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414910 lt!414911))))

(assert (=> d!95372 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414911))))

(assert (=> d!95372 (= (arrayBitRangesEqImpliesEq!0 (buf!7328 bs1!11) (buf!7328 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414910 lt!414911) lt!414992)))

(declare-fun bs!24062 () Bool)

(assert (= bs!24062 d!95372))

(assert (=> bs!24062 m!409865))

(assert (=> bs!24062 m!409867))

(declare-fun m!409967 () Bool)

(assert (=> bs!24062 m!409967))

(assert (=> b!276795 d!95372))

(declare-fun d!95374 () Bool)

(assert (=> d!95374 (= (inv!12 bs1!11) (invariant!0 (currentBit!13561 bs1!11) (currentByte!13566 bs1!11) (size!6860 (buf!7328 bs1!11))))))

(declare-fun bs!24063 () Bool)

(assert (= bs!24063 d!95374))

(assert (=> bs!24063 m!409951))

(assert (=> start!61632 d!95374))

(declare-fun d!95376 () Bool)

(assert (=> d!95376 (= (inv!12 bs2!19) (invariant!0 (currentBit!13561 bs2!19) (currentByte!13566 bs2!19) (size!6860 (buf!7328 bs2!19))))))

(declare-fun bs!24064 () Bool)

(assert (= bs!24064 d!95376))

(declare-fun m!409969 () Bool)

(assert (=> bs!24064 m!409969))

(assert (=> start!61632 d!95376))

(declare-fun d!95378 () Bool)

(assert (=> d!95378 (= (array_inv!6584 (buf!7328 bs1!11)) (bvsge (size!6860 (buf!7328 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276793 d!95378))

(declare-fun d!95380 () Bool)

(assert (=> d!95380 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6860 (buf!7328 bs1!11))) ((_ sign_extend 32) (currentByte!13566 bs1!11)) ((_ sign_extend 32) (currentBit!13561 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6860 (buf!7328 bs1!11))) ((_ sign_extend 32) (currentByte!13566 bs1!11)) ((_ sign_extend 32) (currentBit!13561 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24065 () Bool)

(assert (= bs!24065 d!95380))

(assert (=> bs!24065 m!409949))

(assert (=> b!276790 d!95380))

(declare-fun d!95382 () Bool)

(assert (=> d!95382 (= (array_inv!6584 (buf!7328 bs2!19)) (bvsge (size!6860 (buf!7328 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276791 d!95382))

(check-sat (not b!276836) (not bm!4463) (not d!95368) (not d!95364) (not d!95380) (not d!95352) (not d!95376) (not d!95338) (not d!95336) (not d!95374) (not d!95372) (not b!276833) (not b!276834))
(check-sat)
(get-model)

(declare-fun d!95426 () Bool)

(assert (=> d!95426 (= (remainingBits!0 ((_ sign_extend 32) (size!6860 (buf!7328 (_1!12337 lt!414908)))) ((_ sign_extend 32) (currentByte!13566 (_1!12337 lt!414908))) ((_ sign_extend 32) (currentBit!13561 (_1!12337 lt!414908)))) (bvsub (bvmul ((_ sign_extend 32) (size!6860 (buf!7328 (_1!12337 lt!414908)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13566 (_1!12337 lt!414908))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13561 (_1!12337 lt!414908))))))))

(assert (=> d!95368 d!95426))

(declare-fun d!95428 () Bool)

(assert (=> d!95428 (= (invariant!0 (currentBit!13561 (_1!12337 lt!414908)) (currentByte!13566 (_1!12337 lt!414908)) (size!6860 (buf!7328 (_1!12337 lt!414908)))) (and (bvsge (currentBit!13561 (_1!12337 lt!414908)) #b00000000000000000000000000000000) (bvslt (currentBit!13561 (_1!12337 lt!414908)) #b00000000000000000000000000001000) (bvsge (currentByte!13566 (_1!12337 lt!414908)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13566 (_1!12337 lt!414908)) (size!6860 (buf!7328 (_1!12337 lt!414908)))) (and (= (currentBit!13561 (_1!12337 lt!414908)) #b00000000000000000000000000000000) (= (currentByte!13566 (_1!12337 lt!414908)) (size!6860 (buf!7328 (_1!12337 lt!414908))))))))))

(assert (=> d!95368 d!95428))

(declare-fun d!95430 () Bool)

(assert (=> d!95430 (= (byteRangesEq!0 (ite c!12651 (select (arr!7853 (buf!7328 bs1!11)) (_3!1050 lt!414942)) (select (arr!7853 (buf!7328 bs1!11)) (_4!270 lt!414942))) (ite c!12651 (select (arr!7853 (buf!7328 bs2!19)) (_3!1050 lt!414942)) (select (arr!7853 (buf!7328 bs2!19)) (_4!270 lt!414942))) (ite c!12651 lt!414943 #b00000000000000000000000000000000) lt!414941) (or (= (ite c!12651 lt!414943 #b00000000000000000000000000000000) lt!414941) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12651 (select (arr!7853 (buf!7328 bs1!11)) (_3!1050 lt!414942)) (select (arr!7853 (buf!7328 bs1!11)) (_4!270 lt!414942)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!414941))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12651 lt!414943 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12651 (select (arr!7853 (buf!7328 bs2!19)) (_3!1050 lt!414942)) (select (arr!7853 (buf!7328 bs2!19)) (_4!270 lt!414942)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!414941))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12651 lt!414943 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24075 () Bool)

(assert (= bs!24075 d!95430))

(declare-fun m!410039 () Bool)

(assert (=> bs!24075 m!410039))

(declare-fun m!410041 () Bool)

(assert (=> bs!24075 m!410041))

(assert (=> bm!4463 d!95430))

(declare-fun d!95432 () Bool)

(assert (=> d!95432 (= (invariant!0 (currentBit!13561 bs1!11) (currentByte!13566 bs1!11) (size!6860 (buf!7328 bs1!11))) (and (bvsge (currentBit!13561 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13561 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13566 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13566 bs1!11) (size!6860 (buf!7328 bs1!11))) (and (= (currentBit!13561 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13566 bs1!11) (size!6860 (buf!7328 bs1!11)))))))))

(assert (=> d!95374 d!95432))

(assert (=> d!95372 d!95366))

(assert (=> d!95372 d!95370))

(declare-fun d!95434 () Bool)

(assert (=> d!95434 (= (bitAt!0 (buf!7328 bs1!11) lt!414910) (bitAt!0 (buf!7328 bs2!19) lt!414910))))

(assert (=> d!95434 true))

(declare-fun _$31!47 () Unit!19385)

(assert (=> d!95434 (= (choose!31 (buf!7328 bs1!11) (buf!7328 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414910 lt!414911) _$31!47)))

(declare-fun bs!24076 () Bool)

(assert (= bs!24076 d!95434))

(assert (=> bs!24076 m!409865))

(assert (=> bs!24076 m!409867))

(assert (=> d!95372 d!95434))

(declare-fun d!95436 () Bool)

(assert (=> d!95436 (= (invariant!0 (currentBit!13561 bs2!19) (currentByte!13566 bs2!19) (size!6860 (buf!7328 bs2!19))) (and (bvsge (currentBit!13561 bs2!19) #b00000000000000000000000000000000) (bvslt (currentBit!13561 bs2!19) #b00000000000000000000000000001000) (bvsge (currentByte!13566 bs2!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!13566 bs2!19) (size!6860 (buf!7328 bs2!19))) (and (= (currentBit!13561 bs2!19) #b00000000000000000000000000000000) (= (currentByte!13566 bs2!19) (size!6860 (buf!7328 bs2!19)))))))))

(assert (=> d!95376 d!95436))

(declare-fun d!95438 () Bool)

(assert (=> d!95438 (= (remainingBits!0 ((_ sign_extend 32) (size!6860 (buf!7328 bs1!11))) ((_ sign_extend 32) (currentByte!13566 bs1!11)) ((_ sign_extend 32) (currentBit!13561 bs1!11))) (bvsub (bvmul ((_ sign_extend 32) (size!6860 (buf!7328 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13566 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13561 bs1!11)))))))

(assert (=> d!95380 d!95438))

(declare-fun d!95440 () Bool)

(assert (=> d!95440 (= (byteRangesEq!0 (select (arr!7853 (buf!7328 bs1!11)) (_3!1050 lt!414942)) (select (arr!7853 (buf!7328 bs2!19)) (_3!1050 lt!414942)) lt!414943 #b00000000000000000000000000001000) (or (= lt!414943 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 bs1!11)) (_3!1050 lt!414942))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!414943)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 bs2!19)) (_3!1050 lt!414942))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!414943)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24077 () Bool)

(assert (= bs!24077 d!95440))

(declare-fun m!410043 () Bool)

(assert (=> bs!24077 m!410043))

(declare-fun m!410045 () Bool)

(assert (=> bs!24077 m!410045))

(assert (=> b!276836 d!95440))

(declare-fun d!95442 () Bool)

(assert (=> d!95442 (= (remainingBits!0 ((_ sign_extend 32) (size!6860 (buf!7328 (_1!12337 lt!414912)))) ((_ sign_extend 32) (currentByte!13566 (_1!12337 lt!414912))) ((_ sign_extend 32) (currentBit!13561 (_1!12337 lt!414912)))) (bvsub (bvmul ((_ sign_extend 32) (size!6860 (buf!7328 (_1!12337 lt!414912)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13566 (_1!12337 lt!414912))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13561 (_1!12337 lt!414912))))))))

(assert (=> d!95364 d!95442))

(declare-fun d!95444 () Bool)

(assert (=> d!95444 (= (invariant!0 (currentBit!13561 (_1!12337 lt!414912)) (currentByte!13566 (_1!12337 lt!414912)) (size!6860 (buf!7328 (_1!12337 lt!414912)))) (and (bvsge (currentBit!13561 (_1!12337 lt!414912)) #b00000000000000000000000000000000) (bvslt (currentBit!13561 (_1!12337 lt!414912)) #b00000000000000000000000000001000) (bvsge (currentByte!13566 (_1!12337 lt!414912)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13566 (_1!12337 lt!414912)) (size!6860 (buf!7328 (_1!12337 lt!414912)))) (and (= (currentBit!13561 (_1!12337 lt!414912)) #b00000000000000000000000000000000) (= (currentByte!13566 (_1!12337 lt!414912)) (size!6860 (buf!7328 (_1!12337 lt!414912))))))))))

(assert (=> d!95364 d!95444))

(declare-fun d!95446 () Bool)

(assert (=> d!95446 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414911) (tuple4!541 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!414911 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!414911 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!276833 d!95446))

(declare-fun d!95448 () Bool)

(declare-fun e!196818 () Bool)

(assert (=> d!95448 e!196818))

(declare-fun res!230029 () Bool)

(assert (=> d!95448 (=> (not res!230029) (not e!196818))))

(declare-datatypes ((tuple2!22584 0))(
  ( (tuple2!22585 (_1!12345 Unit!19385) (_2!12345 BitStream!12534)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12534) tuple2!22584)

(assert (=> d!95448 (= res!230029 (= (buf!7328 (_2!12345 (increaseBitIndex!0 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))) (buf!7328 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))))

(declare-fun lt!415083 () Bool)

(assert (=> d!95448 (= lt!415083 (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))) (currentByte!13566 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13561 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!415080 () tuple2!22578)

(assert (=> d!95448 (= lt!415080 (tuple2!22579 (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))) (currentByte!13566 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13561 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))) #b00000000000000000000000000000000)) (_2!12345 (increaseBitIndex!0 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))))))

(assert (=> d!95448 (validate_offset_bit!0 ((_ sign_extend 32) (size!6860 (buf!7328 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))) ((_ sign_extend 32) (currentByte!13566 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))) ((_ sign_extend 32) (currentBit!13561 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))))

(assert (=> d!95448 (= (readBit!0 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))) lt!415080)))

(declare-fun lt!415082 () (_ BitVec 64))

(declare-fun b!276912 () Bool)

(declare-fun lt!415086 () (_ BitVec 64))

(assert (=> b!276912 (= e!196818 (= (bitIndex!0 (size!6860 (buf!7328 (_2!12345 (increaseBitIndex!0 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))) (currentByte!13566 (_2!12345 (increaseBitIndex!0 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))) (currentBit!13561 (_2!12345 (increaseBitIndex!0 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))) (bvadd lt!415086 lt!415082)))))

(assert (=> b!276912 (or (not (= (bvand lt!415086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415082 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!415086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!415086 lt!415082) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276912 (= lt!415082 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276912 (= lt!415086 (bitIndex!0 (size!6860 (buf!7328 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))) (currentByte!13566 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))) (currentBit!13561 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))))

(declare-fun lt!415084 () Bool)

(assert (=> b!276912 (= lt!415084 (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))) (currentByte!13566 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13561 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!415081 () Bool)

(assert (=> b!276912 (= lt!415081 (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))) (currentByte!13566 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13561 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!415085 () Bool)

(assert (=> b!276912 (= lt!415085 (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))) (currentByte!13566 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13561 (BitStream!12535 (buf!7328 bs2!19) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!95448 res!230029) b!276912))

(declare-fun m!410047 () Bool)

(assert (=> d!95448 m!410047))

(declare-fun m!410049 () Bool)

(assert (=> d!95448 m!410049))

(declare-fun m!410051 () Bool)

(assert (=> d!95448 m!410051))

(declare-fun m!410053 () Bool)

(assert (=> d!95448 m!410053))

(assert (=> b!276912 m!410049))

(declare-fun m!410055 () Bool)

(assert (=> b!276912 m!410055))

(assert (=> b!276912 m!410051))

(assert (=> b!276912 m!410047))

(declare-fun m!410057 () Bool)

(assert (=> b!276912 m!410057))

(assert (=> d!95336 d!95448))

(declare-fun d!95450 () Bool)

(declare-fun e!196819 () Bool)

(assert (=> d!95450 e!196819))

(declare-fun res!230030 () Bool)

(assert (=> d!95450 (=> (not res!230030) (not e!196819))))

(assert (=> d!95450 (= res!230030 (= (buf!7328 (_2!12345 (increaseBitIndex!0 bs1!11))) (buf!7328 bs1!11)))))

(declare-fun lt!415090 () Bool)

(assert (=> d!95450 (= lt!415090 (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 bs1!11)) (currentByte!13566 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13561 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!415087 () tuple2!22578)

(assert (=> d!95450 (= lt!415087 (tuple2!22579 (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 bs1!11)) (currentByte!13566 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13561 bs1!11)))) #b00000000000000000000000000000000)) (_2!12345 (increaseBitIndex!0 bs1!11))))))

(assert (=> d!95450 (validate_offset_bit!0 ((_ sign_extend 32) (size!6860 (buf!7328 bs1!11))) ((_ sign_extend 32) (currentByte!13566 bs1!11)) ((_ sign_extend 32) (currentBit!13561 bs1!11)))))

(assert (=> d!95450 (= (readBit!0 bs1!11) lt!415087)))

(declare-fun lt!415089 () (_ BitVec 64))

(declare-fun lt!415093 () (_ BitVec 64))

(declare-fun b!276913 () Bool)

(assert (=> b!276913 (= e!196819 (= (bitIndex!0 (size!6860 (buf!7328 (_2!12345 (increaseBitIndex!0 bs1!11)))) (currentByte!13566 (_2!12345 (increaseBitIndex!0 bs1!11))) (currentBit!13561 (_2!12345 (increaseBitIndex!0 bs1!11)))) (bvadd lt!415093 lt!415089)))))

(assert (=> b!276913 (or (not (= (bvand lt!415093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415089 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!415093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!415093 lt!415089) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276913 (= lt!415089 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276913 (= lt!415093 (bitIndex!0 (size!6860 (buf!7328 bs1!11)) (currentByte!13566 bs1!11) (currentBit!13561 bs1!11)))))

(declare-fun lt!415091 () Bool)

(assert (=> b!276913 (= lt!415091 (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 bs1!11)) (currentByte!13566 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13561 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!415088 () Bool)

(assert (=> b!276913 (= lt!415088 (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 bs1!11)) (currentByte!13566 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13561 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!415092 () Bool)

(assert (=> b!276913 (= lt!415092 (not (= (bvand ((_ sign_extend 24) (select (arr!7853 (buf!7328 bs1!11)) (currentByte!13566 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13561 bs1!11)))) #b00000000000000000000000000000000)))))

(assert (= (and d!95450 res!230030) b!276913))

(declare-fun m!410059 () Bool)

(assert (=> d!95450 m!410059))

(declare-fun m!410061 () Bool)

(assert (=> d!95450 m!410061))

(declare-fun m!410063 () Bool)

(assert (=> d!95450 m!410063))

(assert (=> d!95450 m!409881))

(assert (=> b!276913 m!410061))

(declare-fun m!410065 () Bool)

(assert (=> b!276913 m!410065))

(assert (=> b!276913 m!410063))

(assert (=> b!276913 m!410059))

(assert (=> b!276913 m!409861))

(assert (=> d!95338 d!95450))

(assert (=> d!95352 d!95438))

(assert (=> d!95352 d!95432))

(declare-fun d!95452 () Bool)

(declare-fun res!230035 () Bool)

(declare-fun e!196824 () Bool)

(assert (=> d!95452 (=> res!230035 e!196824)))

(assert (=> d!95452 (= res!230035 (= (_1!12340 lt!414942) (_2!12340 lt!414942)))))

(assert (=> d!95452 (= (arrayRangesEq!1163 (buf!7328 bs1!11) (buf!7328 bs2!19) (_1!12340 lt!414942) (_2!12340 lt!414942)) e!196824)))

(declare-fun b!276918 () Bool)

(declare-fun e!196825 () Bool)

(assert (=> b!276918 (= e!196824 e!196825)))

(declare-fun res!230036 () Bool)

(assert (=> b!276918 (=> (not res!230036) (not e!196825))))

(assert (=> b!276918 (= res!230036 (= (select (arr!7853 (buf!7328 bs1!11)) (_1!12340 lt!414942)) (select (arr!7853 (buf!7328 bs2!19)) (_1!12340 lt!414942))))))

(declare-fun b!276919 () Bool)

(assert (=> b!276919 (= e!196825 (arrayRangesEq!1163 (buf!7328 bs1!11) (buf!7328 bs2!19) (bvadd (_1!12340 lt!414942) #b00000000000000000000000000000001) (_2!12340 lt!414942)))))

(assert (= (and d!95452 (not res!230035)) b!276918))

(assert (= (and b!276918 res!230036) b!276919))

(declare-fun m!410067 () Bool)

(assert (=> b!276918 m!410067))

(declare-fun m!410069 () Bool)

(assert (=> b!276918 m!410069))

(declare-fun m!410071 () Bool)

(assert (=> b!276919 m!410071))

(assert (=> b!276834 d!95452))

(check-sat (not b!276912) (not d!95450) (not b!276919) (not d!95448) (not b!276913) (not d!95434))
(check-sat)
