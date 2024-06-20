; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61290 () Bool)

(assert start!61290)

(declare-fun b!275885 () Bool)

(declare-fun e!195843 () Bool)

(declare-fun e!195845 () Bool)

(assert (=> b!275885 (= e!195843 (not e!195845))))

(declare-fun res!229287 () Bool)

(assert (=> b!275885 (=> res!229287 e!195845)))

(declare-fun lt!413966 () (_ BitVec 64))

(declare-fun lt!413963 () (_ BitVec 64))

(declare-datatypes ((array!15772 0))(
  ( (array!15773 (arr!7822 (Array (_ BitVec 32) (_ BitVec 8))) (size!6832 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12478 0))(
  ( (BitStream!12479 (buf!7300 array!15772) (currentByte!13484 (_ BitVec 32)) (currentBit!13479 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12478)

(assert (=> b!275885 (= res!229287 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413963) (bvsgt lt!413963 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6832 (buf!7300 bs1!11))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413966) (bvsge lt!413966 lt!413963)))))

(declare-datatypes ((tuple2!22494 0))(
  ( (tuple2!22495 (_1!12282 BitStream!12478) (_2!12282 Bool)) )
))
(declare-fun lt!413964 () tuple2!22494)

(declare-fun bs2!19 () BitStream!12478)

(declare-fun readBitPure!0 (BitStream!12478) tuple2!22494)

(assert (=> b!275885 (= lt!413964 (readBitPure!0 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))))

(declare-fun lt!413965 () tuple2!22494)

(assert (=> b!275885 (= lt!413965 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275885 (invariant!0 (currentBit!13479 bs1!11) (currentByte!13484 bs1!11) (size!6832 (buf!7300 bs2!19)))))

(declare-fun b!275886 () Bool)

(assert (=> b!275886 (= e!195845 (invariant!0 (currentBit!13479 (_1!12282 lt!413964)) (currentByte!13484 (_1!12282 lt!413964)) (size!6832 (buf!7300 (_1!12282 lt!413964)))))))

(declare-fun bitAt!0 (array!15772 (_ BitVec 64)) Bool)

(assert (=> b!275886 (= (bitAt!0 (buf!7300 bs1!11) lt!413966) (bitAt!0 (buf!7300 bs2!19) lt!413966))))

(declare-datatypes ((Unit!19369 0))(
  ( (Unit!19370) )
))
(declare-fun lt!413962 () Unit!19369)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!15772 array!15772 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19369)

(assert (=> b!275886 (= lt!413962 (arrayBitRangesEqImpliesEq!0 (buf!7300 bs1!11) (buf!7300 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413966 lt!413963))))

(declare-fun b!275887 () Bool)

(declare-fun e!195847 () Bool)

(declare-fun array_inv!6556 (array!15772) Bool)

(assert (=> b!275887 (= e!195847 (array_inv!6556 (buf!7300 bs2!19)))))

(declare-fun b!275888 () Bool)

(declare-fun e!195848 () Bool)

(assert (=> b!275888 (= e!195848 (array_inv!6556 (buf!7300 bs1!11)))))

(declare-fun b!275890 () Bool)

(declare-fun e!195842 () Bool)

(assert (=> b!275890 (= e!195842 e!195843)))

(declare-fun res!229286 () Bool)

(assert (=> b!275890 (=> (not res!229286) (not e!195843))))

(declare-fun arrayBitRangesEq!0 (array!15772 array!15772 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275890 (= res!229286 (arrayBitRangesEq!0 (buf!7300 bs1!11) (buf!7300 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413963))))

(assert (=> b!275890 (= lt!413963 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!413966))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275890 (= lt!413966 (bitIndex!0 (size!6832 (buf!7300 bs1!11)) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))

(declare-fun b!275889 () Bool)

(declare-fun res!229288 () Bool)

(assert (=> b!275889 (=> (not res!229288) (not e!195842))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275889 (= res!229288 (validate_offset_bit!0 ((_ sign_extend 32) (size!6832 (buf!7300 bs1!11))) ((_ sign_extend 32) (currentByte!13484 bs1!11)) ((_ sign_extend 32) (currentBit!13479 bs1!11))))))

(declare-fun res!229289 () Bool)

(assert (=> start!61290 (=> (not res!229289) (not e!195842))))

(assert (=> start!61290 (= res!229289 (= (size!6832 (buf!7300 bs1!11)) (size!6832 (buf!7300 bs2!19))))))

(assert (=> start!61290 e!195842))

(declare-fun inv!12 (BitStream!12478) Bool)

(assert (=> start!61290 (and (inv!12 bs1!11) e!195848)))

(assert (=> start!61290 (and (inv!12 bs2!19) e!195847)))

(assert (= (and start!61290 res!229289) b!275889))

(assert (= (and b!275889 res!229288) b!275890))

(assert (= (and b!275890 res!229286) b!275885))

(assert (= (and b!275885 (not res!229287)) b!275886))

(assert (= start!61290 b!275888))

(assert (= start!61290 b!275887))

(declare-fun m!408721 () Bool)

(assert (=> b!275889 m!408721))

(declare-fun m!408723 () Bool)

(assert (=> b!275886 m!408723))

(declare-fun m!408725 () Bool)

(assert (=> b!275886 m!408725))

(declare-fun m!408727 () Bool)

(assert (=> b!275886 m!408727))

(declare-fun m!408729 () Bool)

(assert (=> b!275886 m!408729))

(declare-fun m!408731 () Bool)

(assert (=> start!61290 m!408731))

(declare-fun m!408733 () Bool)

(assert (=> start!61290 m!408733))

(declare-fun m!408735 () Bool)

(assert (=> b!275885 m!408735))

(declare-fun m!408737 () Bool)

(assert (=> b!275885 m!408737))

(declare-fun m!408739 () Bool)

(assert (=> b!275885 m!408739))

(declare-fun m!408741 () Bool)

(assert (=> b!275888 m!408741))

(declare-fun m!408743 () Bool)

(assert (=> b!275887 m!408743))

(declare-fun m!408745 () Bool)

(assert (=> b!275890 m!408745))

(declare-fun m!408747 () Bool)

(assert (=> b!275890 m!408747))

(push 1)

(assert (not b!275885))

(assert (not b!275888))

(assert (not b!275890))

(assert (not b!275889))

(assert (not b!275886))

(assert (not b!275887))

(assert (not start!61290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!275962 () Bool)

(declare-fun e!195922 () Bool)

(declare-fun e!195921 () Bool)

(assert (=> b!275962 (= e!195922 e!195921)))

(declare-fun res!229340 () Bool)

(assert (=> b!275962 (=> (not res!229340) (not e!195921))))

(declare-fun e!195923 () Bool)

(assert (=> b!275962 (= res!229340 e!195923)))

(declare-fun res!229341 () Bool)

(assert (=> b!275962 (=> res!229341 e!195923)))

(declare-datatypes ((tuple4!512 0))(
  ( (tuple4!513 (_1!12287 (_ BitVec 32)) (_2!12287 (_ BitVec 32)) (_3!1036 (_ BitVec 32)) (_4!256 (_ BitVec 32))) )
))
(declare-fun lt!414019 () tuple4!512)

(assert (=> b!275962 (= res!229341 (bvsge (_1!12287 lt!414019) (_2!12287 lt!414019)))))

(declare-fun lt!414020 () (_ BitVec 32))

(assert (=> b!275962 (= lt!414020 ((_ extract 31 0) (bvsrem lt!413963 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!414021 () (_ BitVec 32))

(assert (=> b!275962 (= lt!414021 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!512)

(assert (=> b!275962 (= lt!414019 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413963))))

(declare-fun b!275963 () Bool)

(declare-fun e!195925 () Bool)

(declare-fun call!4424 () Bool)

(assert (=> b!275963 (= e!195925 call!4424)))

(declare-fun b!275964 () Bool)

(assert (=> b!275964 (= e!195921 e!195925)))

(declare-fun c!12609 () Bool)

(assert (=> b!275964 (= c!12609 (= (_3!1036 lt!414019) (_4!256 lt!414019)))))

(declare-fun b!275965 () Bool)

(declare-fun res!229339 () Bool)

(assert (=> b!275965 (= res!229339 (= lt!414020 #b00000000000000000000000000000000))))

(declare-fun e!195924 () Bool)

(assert (=> b!275965 (=> res!229339 e!195924)))

(declare-fun e!195926 () Bool)

(assert (=> b!275965 (= e!195926 e!195924)))

(declare-fun bm!4421 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4421 (= call!4424 (byteRangesEq!0 (ite c!12609 (select (arr!7822 (buf!7300 bs1!11)) (_3!1036 lt!414019)) (select (arr!7822 (buf!7300 bs1!11)) (_4!256 lt!414019))) (ite c!12609 (select (arr!7822 (buf!7300 bs2!19)) (_3!1036 lt!414019)) (select (arr!7822 (buf!7300 bs2!19)) (_4!256 lt!414019))) (ite c!12609 lt!414021 #b00000000000000000000000000000000) lt!414020))))

(declare-fun d!94896 () Bool)

(declare-fun res!229342 () Bool)

(assert (=> d!94896 (=> res!229342 e!195922)))

(assert (=> d!94896 (= res!229342 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!413963))))

(assert (=> d!94896 (= (arrayBitRangesEq!0 (buf!7300 bs1!11) (buf!7300 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413963) e!195922)))

(declare-fun b!275966 () Bool)

(declare-fun arrayRangesEq!1149 (array!15772 array!15772 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275966 (= e!195923 (arrayRangesEq!1149 (buf!7300 bs1!11) (buf!7300 bs2!19) (_1!12287 lt!414019) (_2!12287 lt!414019)))))

(declare-fun b!275967 () Bool)

(assert (=> b!275967 (= e!195924 call!4424)))

(declare-fun b!275968 () Bool)

(assert (=> b!275968 (= e!195925 e!195926)))

(declare-fun res!229343 () Bool)

(assert (=> b!275968 (= res!229343 (byteRangesEq!0 (select (arr!7822 (buf!7300 bs1!11)) (_3!1036 lt!414019)) (select (arr!7822 (buf!7300 bs2!19)) (_3!1036 lt!414019)) lt!414021 #b00000000000000000000000000001000))))

(assert (=> b!275968 (=> (not res!229343) (not e!195926))))

(assert (= (and d!94896 (not res!229342)) b!275962))

(assert (= (and b!275962 (not res!229341)) b!275966))

(assert (= (and b!275962 res!229340) b!275964))

(assert (= (and b!275964 c!12609) b!275963))

(assert (= (and b!275964 (not c!12609)) b!275968))

(assert (= (and b!275968 res!229343) b!275965))

(assert (= (and b!275965 (not res!229339)) b!275967))

(assert (= (or b!275963 b!275967) bm!4421))

(declare-fun m!408839 () Bool)

(assert (=> b!275962 m!408839))

(declare-fun m!408841 () Bool)

(assert (=> bm!4421 m!408841))

(declare-fun m!408843 () Bool)

(assert (=> bm!4421 m!408843))

(declare-fun m!408845 () Bool)

(assert (=> bm!4421 m!408845))

(declare-fun m!408847 () Bool)

(assert (=> bm!4421 m!408847))

(declare-fun m!408849 () Bool)

(assert (=> bm!4421 m!408849))

(declare-fun m!408851 () Bool)

(assert (=> b!275966 m!408851))

(assert (=> b!275968 m!408843))

(assert (=> b!275968 m!408847))

(assert (=> b!275968 m!408843))

(assert (=> b!275968 m!408847))

(declare-fun m!408853 () Bool)

(assert (=> b!275968 m!408853))

(assert (=> b!275890 d!94896))

(declare-fun d!94902 () Bool)

(declare-fun e!195950 () Bool)

(assert (=> d!94902 e!195950))

(declare-fun res!229369 () Bool)

(assert (=> d!94902 (=> (not res!229369) (not e!195950))))

(declare-fun lt!414064 () (_ BitVec 64))

(declare-fun lt!414065 () (_ BitVec 64))

(declare-fun lt!414066 () (_ BitVec 64))

(assert (=> d!94902 (= res!229369 (= lt!414066 (bvsub lt!414065 lt!414064)))))

(assert (=> d!94902 (or (= (bvand lt!414065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414064 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414065 lt!414064) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94902 (= lt!414064 (remainingBits!0 ((_ sign_extend 32) (size!6832 (buf!7300 bs1!11))) ((_ sign_extend 32) (currentByte!13484 bs1!11)) ((_ sign_extend 32) (currentBit!13479 bs1!11))))))

(declare-fun lt!414063 () (_ BitVec 64))

(declare-fun lt!414062 () (_ BitVec 64))

(assert (=> d!94902 (= lt!414065 (bvmul lt!414063 lt!414062))))

(assert (=> d!94902 (or (= lt!414063 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414062 (bvsdiv (bvmul lt!414063 lt!414062) lt!414063)))))

(assert (=> d!94902 (= lt!414062 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94902 (= lt!414063 ((_ sign_extend 32) (size!6832 (buf!7300 bs1!11))))))

(assert (=> d!94902 (= lt!414066 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13484 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13479 bs1!11))))))

(assert (=> d!94902 (invariant!0 (currentBit!13479 bs1!11) (currentByte!13484 bs1!11) (size!6832 (buf!7300 bs1!11)))))

(assert (=> d!94902 (= (bitIndex!0 (size!6832 (buf!7300 bs1!11)) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)) lt!414066)))

(declare-fun b!276000 () Bool)

(declare-fun res!229370 () Bool)

(assert (=> b!276000 (=> (not res!229370) (not e!195950))))

(assert (=> b!276000 (= res!229370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414066))))

(declare-fun b!276001 () Bool)

(declare-fun lt!414061 () (_ BitVec 64))

(assert (=> b!276001 (= e!195950 (bvsle lt!414066 (bvmul lt!414061 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276001 (or (= lt!414061 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414061 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414061)))))

(assert (=> b!276001 (= lt!414061 ((_ sign_extend 32) (size!6832 (buf!7300 bs1!11))))))

(assert (= (and d!94902 res!229369) b!276000))

(assert (= (and b!276000 res!229370) b!276001))

(declare-fun m!408871 () Bool)

(assert (=> d!94902 m!408871))

(declare-fun m!408873 () Bool)

(assert (=> d!94902 m!408873))

(assert (=> b!275890 d!94902))

(declare-fun d!94906 () Bool)

(declare-datatypes ((tuple2!22502 0))(
  ( (tuple2!22503 (_1!12289 Bool) (_2!12289 BitStream!12478)) )
))
(declare-fun lt!414081 () tuple2!22502)

(declare-fun readBit!0 (BitStream!12478) tuple2!22502)

(assert (=> d!94906 (= lt!414081 (readBit!0 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))))

(assert (=> d!94906 (= (readBitPure!0 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))) (tuple2!22495 (_2!12289 lt!414081) (_1!12289 lt!414081)))))

(declare-fun bs!23928 () Bool)

(assert (= bs!23928 d!94906))

(declare-fun m!408875 () Bool)

(assert (=> bs!23928 m!408875))

(assert (=> b!275885 d!94906))

(declare-fun d!94908 () Bool)

(declare-fun lt!414082 () tuple2!22502)

(assert (=> d!94908 (= lt!414082 (readBit!0 bs1!11))))

(assert (=> d!94908 (= (readBitPure!0 bs1!11) (tuple2!22495 (_2!12289 lt!414082) (_1!12289 lt!414082)))))

(declare-fun bs!23929 () Bool)

(assert (= bs!23929 d!94908))

(declare-fun m!408877 () Bool)

(assert (=> bs!23929 m!408877))

(assert (=> b!275885 d!94908))

(declare-fun d!94910 () Bool)

(assert (=> d!94910 (= (invariant!0 (currentBit!13479 bs1!11) (currentByte!13484 bs1!11) (size!6832 (buf!7300 bs2!19))) (and (bvsge (currentBit!13479 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13479 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13484 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13484 bs1!11) (size!6832 (buf!7300 bs2!19))) (and (= (currentBit!13479 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13484 bs1!11) (size!6832 (buf!7300 bs2!19)))))))))

(assert (=> b!275885 d!94910))

(declare-fun d!94914 () Bool)

(assert (=> d!94914 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6832 (buf!7300 bs1!11))) ((_ sign_extend 32) (currentByte!13484 bs1!11)) ((_ sign_extend 32) (currentBit!13479 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6832 (buf!7300 bs1!11))) ((_ sign_extend 32) (currentByte!13484 bs1!11)) ((_ sign_extend 32) (currentBit!13479 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23930 () Bool)

(assert (= bs!23930 d!94914))

(assert (=> bs!23930 m!408871))

(assert (=> b!275889 d!94914))

(declare-fun d!94918 () Bool)

(assert (=> d!94918 (= (array_inv!6556 (buf!7300 bs2!19)) (bvsge (size!6832 (buf!7300 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275887 d!94918))

(declare-fun d!94920 () Bool)

(assert (=> d!94920 (= (array_inv!6556 (buf!7300 bs1!11)) (bvsge (size!6832 (buf!7300 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275888 d!94920))

(declare-fun d!94922 () Bool)

(assert (=> d!94922 (= (inv!12 bs1!11) (invariant!0 (currentBit!13479 bs1!11) (currentByte!13484 bs1!11) (size!6832 (buf!7300 bs1!11))))))

(declare-fun bs!23931 () Bool)

(assert (= bs!23931 d!94922))

(assert (=> bs!23931 m!408873))

(assert (=> start!61290 d!94922))

(declare-fun d!94924 () Bool)

(assert (=> d!94924 (= (inv!12 bs2!19) (invariant!0 (currentBit!13479 bs2!19) (currentByte!13484 bs2!19) (size!6832 (buf!7300 bs2!19))))))

(declare-fun bs!23932 () Bool)

(assert (= bs!23932 d!94924))

(declare-fun m!408883 () Bool)

(assert (=> bs!23932 m!408883))

(assert (=> start!61290 d!94924))

(declare-fun d!94926 () Bool)

(assert (=> d!94926 (= (invariant!0 (currentBit!13479 (_1!12282 lt!413964)) (currentByte!13484 (_1!12282 lt!413964)) (size!6832 (buf!7300 (_1!12282 lt!413964)))) (and (bvsge (currentBit!13479 (_1!12282 lt!413964)) #b00000000000000000000000000000000) (bvslt (currentBit!13479 (_1!12282 lt!413964)) #b00000000000000000000000000001000) (bvsge (currentByte!13484 (_1!12282 lt!413964)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13484 (_1!12282 lt!413964)) (size!6832 (buf!7300 (_1!12282 lt!413964)))) (and (= (currentBit!13479 (_1!12282 lt!413964)) #b00000000000000000000000000000000) (= (currentByte!13484 (_1!12282 lt!413964)) (size!6832 (buf!7300 (_1!12282 lt!413964))))))))))

(assert (=> b!275886 d!94926))

(declare-fun d!94928 () Bool)

(assert (=> d!94928 (= (bitAt!0 (buf!7300 bs1!11) lt!413966) (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 bs1!11)) ((_ extract 31 0) (bvsdiv lt!413966 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413966 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23936 () Bool)

(assert (= bs!23936 d!94928))

(declare-fun m!408893 () Bool)

(assert (=> bs!23936 m!408893))

(declare-fun m!408895 () Bool)

(assert (=> bs!23936 m!408895))

(assert (=> b!275886 d!94928))

(declare-fun d!94938 () Bool)

(assert (=> d!94938 (= (bitAt!0 (buf!7300 bs2!19) lt!413966) (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 bs2!19)) ((_ extract 31 0) (bvsdiv lt!413966 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413966 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23937 () Bool)

(assert (= bs!23937 d!94938))

(declare-fun m!408897 () Bool)

(assert (=> bs!23937 m!408897))

(assert (=> bs!23937 m!408895))

(assert (=> b!275886 d!94938))

(declare-fun d!94940 () Bool)

(assert (=> d!94940 (= (bitAt!0 (buf!7300 bs1!11) lt!413966) (bitAt!0 (buf!7300 bs2!19) lt!413966))))

(declare-fun lt!414097 () Unit!19369)

(declare-fun choose!31 (array!15772 array!15772 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19369)

(assert (=> d!94940 (= lt!414097 (choose!31 (buf!7300 bs1!11) (buf!7300 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413966 lt!413963))))

(assert (=> d!94940 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413963))))

(assert (=> d!94940 (= (arrayBitRangesEqImpliesEq!0 (buf!7300 bs1!11) (buf!7300 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413966 lt!413963) lt!414097)))

(declare-fun bs!23941 () Bool)

(assert (= bs!23941 d!94940))

(assert (=> bs!23941 m!408725))

(assert (=> bs!23941 m!408727))

(declare-fun m!408903 () Bool)

(assert (=> bs!23941 m!408903))

(assert (=> b!275886 d!94940))

(push 1)

(assert (not d!94914))

(assert (not d!94908))

(assert (not d!94924))

(assert (not b!275966))

(assert (not b!275962))

(assert (not b!275968))

(assert (not d!94906))

(assert (not d!94940))

(assert (not d!94902))

(assert (not bm!4421))

(assert (not d!94922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95022 () Bool)

(assert (=> d!95022 (= (remainingBits!0 ((_ sign_extend 32) (size!6832 (buf!7300 bs1!11))) ((_ sign_extend 32) (currentByte!13484 bs1!11)) ((_ sign_extend 32) (currentBit!13479 bs1!11))) (bvsub (bvmul ((_ sign_extend 32) (size!6832 (buf!7300 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13484 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13479 bs1!11)))))))

(assert (=> d!94902 d!95022))

(declare-fun d!95024 () Bool)

(assert (=> d!95024 (= (invariant!0 (currentBit!13479 bs1!11) (currentByte!13484 bs1!11) (size!6832 (buf!7300 bs1!11))) (and (bvsge (currentBit!13479 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13479 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13484 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13484 bs1!11) (size!6832 (buf!7300 bs1!11))) (and (= (currentBit!13479 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13484 bs1!11) (size!6832 (buf!7300 bs1!11)))))))))

(assert (=> d!94902 d!95024))

(assert (=> d!94940 d!94928))

(assert (=> d!94940 d!94938))

(declare-fun d!95026 () Bool)

(assert (=> d!95026 (= (bitAt!0 (buf!7300 bs1!11) lt!413966) (bitAt!0 (buf!7300 bs2!19) lt!413966))))

(assert (=> d!95026 true))

(declare-fun _$31!44 () Unit!19369)

(assert (=> d!95026 (= (choose!31 (buf!7300 bs1!11) (buf!7300 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413966 lt!413963) _$31!44)))

(declare-fun bs!23952 () Bool)

(assert (= bs!23952 d!95026))

(assert (=> bs!23952 m!408725))

(assert (=> bs!23952 m!408727))

(assert (=> d!94940 d!95026))

(declare-fun d!95028 () Bool)

(declare-fun res!229433 () Bool)

(declare-fun e!196004 () Bool)

(assert (=> d!95028 (=> res!229433 e!196004)))

(assert (=> d!95028 (= res!229433 (= (_1!12287 lt!414019) (_2!12287 lt!414019)))))

(assert (=> d!95028 (= (arrayRangesEq!1149 (buf!7300 bs1!11) (buf!7300 bs2!19) (_1!12287 lt!414019) (_2!12287 lt!414019)) e!196004)))

(declare-fun b!276064 () Bool)

(declare-fun e!196005 () Bool)

(assert (=> b!276064 (= e!196004 e!196005)))

(declare-fun res!229434 () Bool)

(assert (=> b!276064 (=> (not res!229434) (not e!196005))))

(assert (=> b!276064 (= res!229434 (= (select (arr!7822 (buf!7300 bs1!11)) (_1!12287 lt!414019)) (select (arr!7822 (buf!7300 bs2!19)) (_1!12287 lt!414019))))))

(declare-fun b!276065 () Bool)

(assert (=> b!276065 (= e!196005 (arrayRangesEq!1149 (buf!7300 bs1!11) (buf!7300 bs2!19) (bvadd (_1!12287 lt!414019) #b00000000000000000000000000000001) (_2!12287 lt!414019)))))

(assert (= (and d!95028 (not res!229433)) b!276064))

(assert (= (and b!276064 res!229434) b!276065))

(declare-fun m!409027 () Bool)

(assert (=> b!276064 m!409027))

(declare-fun m!409029 () Bool)

(assert (=> b!276064 m!409029))

(declare-fun m!409031 () Bool)

(assert (=> b!276065 m!409031))

(assert (=> b!275966 d!95028))

(declare-fun d!95030 () Bool)

(assert (=> d!95030 (= (byteRangesEq!0 (ite c!12609 (select (arr!7822 (buf!7300 bs1!11)) (_3!1036 lt!414019)) (select (arr!7822 (buf!7300 bs1!11)) (_4!256 lt!414019))) (ite c!12609 (select (arr!7822 (buf!7300 bs2!19)) (_3!1036 lt!414019)) (select (arr!7822 (buf!7300 bs2!19)) (_4!256 lt!414019))) (ite c!12609 lt!414021 #b00000000000000000000000000000000) lt!414020) (or (= (ite c!12609 lt!414021 #b00000000000000000000000000000000) lt!414020) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12609 (select (arr!7822 (buf!7300 bs1!11)) (_3!1036 lt!414019)) (select (arr!7822 (buf!7300 bs1!11)) (_4!256 lt!414019)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!414020))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12609 lt!414021 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12609 (select (arr!7822 (buf!7300 bs2!19)) (_3!1036 lt!414019)) (select (arr!7822 (buf!7300 bs2!19)) (_4!256 lt!414019)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!414020))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12609 lt!414021 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23953 () Bool)

(assert (= bs!23953 d!95030))

(declare-fun m!409033 () Bool)

(assert (=> bs!23953 m!409033))

(declare-fun m!409035 () Bool)

(assert (=> bs!23953 m!409035))

(assert (=> bm!4421 d!95030))

(declare-fun d!95032 () Bool)

(assert (=> d!95032 (= (byteRangesEq!0 (select (arr!7822 (buf!7300 bs1!11)) (_3!1036 lt!414019)) (select (arr!7822 (buf!7300 bs2!19)) (_3!1036 lt!414019)) lt!414021 #b00000000000000000000000000001000) (or (= lt!414021 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 bs1!11)) (_3!1036 lt!414019))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!414021)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 bs2!19)) (_3!1036 lt!414019))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!414021)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23954 () Bool)

(assert (= bs!23954 d!95032))

(declare-fun m!409037 () Bool)

(assert (=> bs!23954 m!409037))

(declare-fun m!409039 () Bool)

(assert (=> bs!23954 m!409039))

(assert (=> b!275968 d!95032))

(assert (=> d!94922 d!95024))

(assert (=> d!94914 d!95022))

(declare-fun d!95034 () Bool)

(declare-fun e!196012 () Bool)

(assert (=> d!95034 e!196012))

(declare-fun res!229437 () Bool)

(assert (=> d!95034 (=> (not res!229437) (not e!196012))))

(declare-datatypes ((tuple2!22510 0))(
  ( (tuple2!22511 (_1!12293 Unit!19369) (_2!12293 BitStream!12478)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12478) tuple2!22510)

(assert (=> d!95034 (= res!229437 (= (buf!7300 (_2!12293 (increaseBitIndex!0 bs1!11))) (buf!7300 bs1!11)))))

(declare-fun lt!414246 () Bool)

(assert (=> d!95034 (= lt!414246 (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 bs1!11)) (currentByte!13484 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13479 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!414249 () tuple2!22502)

(assert (=> d!95034 (= lt!414249 (tuple2!22503 (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 bs1!11)) (currentByte!13484 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13479 bs1!11)))) #b00000000000000000000000000000000)) (_2!12293 (increaseBitIndex!0 bs1!11))))))

(assert (=> d!95034 (validate_offset_bit!0 ((_ sign_extend 32) (size!6832 (buf!7300 bs1!11))) ((_ sign_extend 32) (currentByte!13484 bs1!11)) ((_ sign_extend 32) (currentBit!13479 bs1!11)))))

(assert (=> d!95034 (= (readBit!0 bs1!11) lt!414249)))

(declare-fun lt!414245 () (_ BitVec 64))

(declare-fun lt!414247 () (_ BitVec 64))

(declare-fun b!276068 () Bool)

(assert (=> b!276068 (= e!196012 (= (bitIndex!0 (size!6832 (buf!7300 (_2!12293 (increaseBitIndex!0 bs1!11)))) (currentByte!13484 (_2!12293 (increaseBitIndex!0 bs1!11))) (currentBit!13479 (_2!12293 (increaseBitIndex!0 bs1!11)))) (bvadd lt!414247 lt!414245)))))

(assert (=> b!276068 (or (not (= (bvand lt!414247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414245 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!414247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!414247 lt!414245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276068 (= lt!414245 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276068 (= lt!414247 (bitIndex!0 (size!6832 (buf!7300 bs1!11)) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))

(declare-fun lt!414248 () Bool)

(assert (=> b!276068 (= lt!414248 (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 bs1!11)) (currentByte!13484 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13479 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!414250 () Bool)

(assert (=> b!276068 (= lt!414250 (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 bs1!11)) (currentByte!13484 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13479 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!414251 () Bool)

(assert (=> b!276068 (= lt!414251 (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 bs1!11)) (currentByte!13484 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13479 bs1!11)))) #b00000000000000000000000000000000)))))

(assert (= (and d!95034 res!229437) b!276068))

(declare-fun m!409041 () Bool)

(assert (=> d!95034 m!409041))

(declare-fun m!409043 () Bool)

(assert (=> d!95034 m!409043))

(declare-fun m!409045 () Bool)

(assert (=> d!95034 m!409045))

(assert (=> d!95034 m!408721))

(assert (=> b!276068 m!409045))

(assert (=> b!276068 m!408747))

(declare-fun m!409047 () Bool)

(assert (=> b!276068 m!409047))

(assert (=> b!276068 m!409041))

(assert (=> b!276068 m!409043))

(assert (=> d!94908 d!95034))

(declare-fun d!95036 () Bool)

(assert (=> d!95036 (= (invariant!0 (currentBit!13479 bs2!19) (currentByte!13484 bs2!19) (size!6832 (buf!7300 bs2!19))) (and (bvsge (currentBit!13479 bs2!19) #b00000000000000000000000000000000) (bvslt (currentBit!13479 bs2!19) #b00000000000000000000000000001000) (bvsge (currentByte!13484 bs2!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!13484 bs2!19) (size!6832 (buf!7300 bs2!19))) (and (= (currentBit!13479 bs2!19) #b00000000000000000000000000000000) (= (currentByte!13484 bs2!19) (size!6832 (buf!7300 bs2!19)))))))))

(assert (=> d!94924 d!95036))

(declare-fun d!95038 () Bool)

(declare-fun e!196013 () Bool)

(assert (=> d!95038 e!196013))

(declare-fun res!229438 () Bool)

(assert (=> d!95038 (=> (not res!229438) (not e!196013))))

(assert (=> d!95038 (= res!229438 (= (buf!7300 (_2!12293 (increaseBitIndex!0 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))) (buf!7300 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))))

(declare-fun lt!414253 () Bool)

(assert (=> d!95038 (= lt!414253 (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))) (currentByte!13484 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13479 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!414256 () tuple2!22502)

(assert (=> d!95038 (= lt!414256 (tuple2!22503 (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))) (currentByte!13484 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13479 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))) #b00000000000000000000000000000000)) (_2!12293 (increaseBitIndex!0 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))))))

(assert (=> d!95038 (validate_offset_bit!0 ((_ sign_extend 32) (size!6832 (buf!7300 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))) ((_ sign_extend 32) (currentByte!13484 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))) ((_ sign_extend 32) (currentBit!13479 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))))

(assert (=> d!95038 (= (readBit!0 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))) lt!414256)))

(declare-fun lt!414252 () (_ BitVec 64))

(declare-fun lt!414254 () (_ BitVec 64))

(declare-fun b!276069 () Bool)

(assert (=> b!276069 (= e!196013 (= (bitIndex!0 (size!6832 (buf!7300 (_2!12293 (increaseBitIndex!0 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))) (currentByte!13484 (_2!12293 (increaseBitIndex!0 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))) (currentBit!13479 (_2!12293 (increaseBitIndex!0 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))) (bvadd lt!414254 lt!414252)))))

(assert (=> b!276069 (or (not (= (bvand lt!414254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414252 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!414254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!414254 lt!414252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276069 (= lt!414252 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276069 (= lt!414254 (bitIndex!0 (size!6832 (buf!7300 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))) (currentByte!13484 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))) (currentBit!13479 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))))

(declare-fun lt!414255 () Bool)

(assert (=> b!276069 (= lt!414255 (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))) (currentByte!13484 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13479 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!414257 () Bool)

(assert (=> b!276069 (= lt!414257 (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))) (currentByte!13484 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13479 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!414258 () Bool)

(assert (=> b!276069 (= lt!414258 (not (= (bvand ((_ sign_extend 24) (select (arr!7822 (buf!7300 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))) (currentByte!13484 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13479 (BitStream!12479 (buf!7300 bs2!19) (currentByte!13484 bs1!11) (currentBit!13479 bs1!11)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!95038 res!229438) b!276069))

(declare-fun m!409049 () Bool)

(assert (=> d!95038 m!409049))

(declare-fun m!409051 () Bool)

(assert (=> d!95038 m!409051))

(declare-fun m!409053 () Bool)

(assert (=> d!95038 m!409053))

(declare-fun m!409055 () Bool)

(assert (=> d!95038 m!409055))

(assert (=> b!276069 m!409053))

(declare-fun m!409057 () Bool)

(assert (=> b!276069 m!409057))

(declare-fun m!409059 () Bool)

(assert (=> b!276069 m!409059))

(assert (=> b!276069 m!409049))

(assert (=> b!276069 m!409051))

(assert (=> d!94906 d!95038))

(declare-fun d!95040 () Bool)

(assert (=> d!95040 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413963) (tuple4!513 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!413963 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!413963 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!275962 d!95040))

(push 1)

(assert (not b!276065))

(assert (not d!95038))

(assert (not d!95026))

(assert (not d!95034))

(assert (not b!276069))

(assert (not b!276068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

