; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61630 () Bool)

(assert start!61630)

(declare-fun b!276768 () Bool)

(declare-fun e!196689 () Bool)

(declare-fun e!196693 () Bool)

(assert (=> b!276768 (= e!196689 e!196693)))

(declare-fun res!229917 () Bool)

(assert (=> b!276768 (=> (not res!229917) (not e!196693))))

(declare-datatypes ((array!15844 0))(
  ( (array!15845 (arr!7852 (Array (_ BitVec 32) (_ BitVec 8))) (size!6859 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12532 0))(
  ( (BitStream!12533 (buf!7327 array!15844) (currentByte!13565 (_ BitVec 32)) (currentBit!13560 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22572 0))(
  ( (tuple2!22573 (_1!12336 BitStream!12532) (_2!12336 Bool)) )
))
(declare-fun lt!414897 () tuple2!22572)

(declare-fun lt!414894 () tuple2!22572)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276768 (= res!229917 (= (bitIndex!0 (size!6859 (buf!7327 (_1!12336 lt!414897))) (currentByte!13565 (_1!12336 lt!414897)) (currentBit!13560 (_1!12336 lt!414897))) (bitIndex!0 (size!6859 (buf!7327 (_1!12336 lt!414894))) (currentByte!13565 (_1!12336 lt!414894)) (currentBit!13560 (_1!12336 lt!414894)))))))

(declare-fun bs1!11 () BitStream!12532)

(declare-fun lt!414895 () (_ BitVec 64))

(declare-fun bs2!19 () BitStream!12532)

(declare-fun bitAt!0 (array!15844 (_ BitVec 64)) Bool)

(assert (=> b!276768 (= (bitAt!0 (buf!7327 bs1!11) lt!414895) (bitAt!0 (buf!7327 bs2!19) lt!414895))))

(declare-datatypes ((Unit!19383 0))(
  ( (Unit!19384) )
))
(declare-fun lt!414896 () Unit!19383)

(declare-fun lt!414893 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!15844 array!15844 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19383)

(assert (=> b!276768 (= lt!414896 (arrayBitRangesEqImpliesEq!0 (buf!7327 bs1!11) (buf!7327 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414895 lt!414893))))

(declare-fun b!276769 () Bool)

(declare-fun res!229919 () Bool)

(declare-fun e!196687 () Bool)

(assert (=> b!276769 (=> (not res!229919) (not e!196687))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276769 (= res!229919 (validate_offset_bit!0 ((_ sign_extend 32) (size!6859 (buf!7327 bs1!11))) ((_ sign_extend 32) (currentByte!13565 bs1!11)) ((_ sign_extend 32) (currentBit!13560 bs1!11))))))

(declare-fun b!276770 () Bool)

(declare-fun e!196694 () Bool)

(assert (=> b!276770 (= e!196687 e!196694)))

(declare-fun res!229918 () Bool)

(assert (=> b!276770 (=> (not res!229918) (not e!196694))))

(declare-fun arrayBitRangesEq!0 (array!15844 array!15844 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276770 (= res!229918 (arrayBitRangesEq!0 (buf!7327 bs1!11) (buf!7327 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414893))))

(assert (=> b!276770 (= lt!414893 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414895))))

(assert (=> b!276770 (= lt!414895 (bitIndex!0 (size!6859 (buf!7327 bs1!11)) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))

(declare-fun b!276771 () Bool)

(declare-fun e!196691 () Bool)

(declare-fun array_inv!6583 (array!15844) Bool)

(assert (=> b!276771 (= e!196691 (array_inv!6583 (buf!7327 bs2!19)))))

(declare-fun b!276772 () Bool)

(assert (=> b!276772 (= e!196693 (= (_2!12336 lt!414897) (_2!12336 lt!414894)))))

(declare-fun b!276773 () Bool)

(declare-fun e!196692 () Bool)

(assert (=> b!276773 (= e!196692 (array_inv!6583 (buf!7327 bs1!11)))))

(declare-fun res!229921 () Bool)

(assert (=> start!61630 (=> (not res!229921) (not e!196687))))

(assert (=> start!61630 (= res!229921 (= (size!6859 (buf!7327 bs1!11)) (size!6859 (buf!7327 bs2!19))))))

(assert (=> start!61630 e!196687))

(declare-fun inv!12 (BitStream!12532) Bool)

(assert (=> start!61630 (and (inv!12 bs1!11) e!196692)))

(assert (=> start!61630 (and (inv!12 bs2!19) e!196691)))

(declare-fun b!276774 () Bool)

(assert (=> b!276774 (= e!196694 (not e!196689))))

(declare-fun res!229920 () Bool)

(assert (=> b!276774 (=> res!229920 e!196689)))

(assert (=> b!276774 (= res!229920 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414893) (bvsgt lt!414893 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6859 (buf!7327 bs1!11))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414895) (bvsge lt!414895 lt!414893)))))

(declare-fun readBitPure!0 (BitStream!12532) tuple2!22572)

(assert (=> b!276774 (= lt!414894 (readBitPure!0 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))))

(assert (=> b!276774 (= lt!414897 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276774 (invariant!0 (currentBit!13560 bs1!11) (currentByte!13565 bs1!11) (size!6859 (buf!7327 bs2!19)))))

(assert (= (and start!61630 res!229921) b!276769))

(assert (= (and b!276769 res!229919) b!276770))

(assert (= (and b!276770 res!229918) b!276774))

(assert (= (and b!276774 (not res!229920)) b!276768))

(assert (= (and b!276768 res!229917) b!276772))

(assert (= start!61630 b!276773))

(assert (= start!61630 b!276771))

(declare-fun m!409823 () Bool)

(assert (=> start!61630 m!409823))

(declare-fun m!409825 () Bool)

(assert (=> start!61630 m!409825))

(declare-fun m!409827 () Bool)

(assert (=> b!276771 m!409827))

(declare-fun m!409829 () Bool)

(assert (=> b!276773 m!409829))

(declare-fun m!409831 () Bool)

(assert (=> b!276769 m!409831))

(declare-fun m!409833 () Bool)

(assert (=> b!276770 m!409833))

(declare-fun m!409835 () Bool)

(assert (=> b!276770 m!409835))

(declare-fun m!409837 () Bool)

(assert (=> b!276768 m!409837))

(declare-fun m!409839 () Bool)

(assert (=> b!276768 m!409839))

(declare-fun m!409841 () Bool)

(assert (=> b!276768 m!409841))

(declare-fun m!409843 () Bool)

(assert (=> b!276768 m!409843))

(declare-fun m!409845 () Bool)

(assert (=> b!276768 m!409845))

(declare-fun m!409847 () Bool)

(assert (=> b!276774 m!409847))

(declare-fun m!409849 () Bool)

(assert (=> b!276774 m!409849))

(declare-fun m!409851 () Bool)

(assert (=> b!276774 m!409851))

(push 1)

(assert (not b!276773))

(assert (not start!61630))

(assert (not b!276770))

(assert (not b!276771))

(assert (not b!276769))

(assert (not b!276768))

(assert (not b!276774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95344 () Bool)

(assert (=> d!95344 (= (inv!12 bs1!11) (invariant!0 (currentBit!13560 bs1!11) (currentByte!13565 bs1!11) (size!6859 (buf!7327 bs1!11))))))

(declare-fun bs!24053 () Bool)

(assert (= bs!24053 d!95344))

(declare-fun m!409917 () Bool)

(assert (=> bs!24053 m!409917))

(assert (=> start!61630 d!95344))

(declare-fun d!95346 () Bool)

(assert (=> d!95346 (= (inv!12 bs2!19) (invariant!0 (currentBit!13560 bs2!19) (currentByte!13565 bs2!19) (size!6859 (buf!7327 bs2!19))))))

(declare-fun bs!24054 () Bool)

(assert (= bs!24054 d!95346))

(declare-fun m!409919 () Bool)

(assert (=> bs!24054 m!409919))

(assert (=> start!61630 d!95346))

(declare-fun d!95348 () Bool)

(assert (=> d!95348 (= (bitAt!0 (buf!7327 bs1!11) lt!414895) (bitAt!0 (buf!7327 bs2!19) lt!414895))))

(declare-fun lt!414940 () Unit!19383)

(declare-fun choose!31 (array!15844 array!15844 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19383)

(assert (=> d!95348 (= lt!414940 (choose!31 (buf!7327 bs1!11) (buf!7327 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414895 lt!414893))))

(assert (=> d!95348 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414893))))

(assert (=> d!95348 (= (arrayBitRangesEqImpliesEq!0 (buf!7327 bs1!11) (buf!7327 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414895 lt!414893) lt!414940)))

(declare-fun bs!24055 () Bool)

(assert (= bs!24055 d!95348))

(assert (=> bs!24055 m!409839))

(assert (=> bs!24055 m!409843))

(declare-fun m!409921 () Bool)

(assert (=> bs!24055 m!409921))

(assert (=> b!276768 d!95348))

(declare-fun d!95350 () Bool)

(assert (=> d!95350 (= (bitAt!0 (buf!7327 bs2!19) lt!414895) (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 bs2!19)) ((_ extract 31 0) (bvsdiv lt!414895 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!414895 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!24056 () Bool)

(assert (= bs!24056 d!95350))

(declare-fun m!409939 () Bool)

(assert (=> bs!24056 m!409939))

(declare-fun m!409941 () Bool)

(assert (=> bs!24056 m!409941))

(assert (=> b!276768 d!95350))

(declare-fun d!95354 () Bool)

(assert (=> d!95354 (= (bitAt!0 (buf!7327 bs1!11) lt!414895) (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 bs1!11)) ((_ extract 31 0) (bvsdiv lt!414895 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!414895 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!24057 () Bool)

(assert (= bs!24057 d!95354))

(declare-fun m!409943 () Bool)

(assert (=> bs!24057 m!409943))

(assert (=> bs!24057 m!409941))

(assert (=> b!276768 d!95354))

(declare-fun d!95356 () Bool)

(declare-fun e!196780 () Bool)

(assert (=> d!95356 e!196780))

(declare-fun res!229992 () Bool)

(assert (=> d!95356 (=> (not res!229992) (not e!196780))))

(declare-fun lt!414996 () (_ BitVec 64))

(declare-fun lt!414997 () (_ BitVec 64))

(declare-fun lt!414999 () (_ BitVec 64))

(assert (=> d!95356 (= res!229992 (= lt!414997 (bvsub lt!414996 lt!414999)))))

(assert (=> d!95356 (or (= (bvand lt!414996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414999 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414996 lt!414999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95356 (= lt!414999 (remainingBits!0 ((_ sign_extend 32) (size!6859 (buf!7327 (_1!12336 lt!414894)))) ((_ sign_extend 32) (currentByte!13565 (_1!12336 lt!414894))) ((_ sign_extend 32) (currentBit!13560 (_1!12336 lt!414894)))))))

(declare-fun lt!414998 () (_ BitVec 64))

(declare-fun lt!414995 () (_ BitVec 64))

(assert (=> d!95356 (= lt!414996 (bvmul lt!414998 lt!414995))))

(assert (=> d!95356 (or (= lt!414998 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414995 (bvsdiv (bvmul lt!414998 lt!414995) lt!414998)))))

(assert (=> d!95356 (= lt!414995 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95356 (= lt!414998 ((_ sign_extend 32) (size!6859 (buf!7327 (_1!12336 lt!414894)))))))

(assert (=> d!95356 (= lt!414997 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13565 (_1!12336 lt!414894))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13560 (_1!12336 lt!414894)))))))

(assert (=> d!95356 (invariant!0 (currentBit!13560 (_1!12336 lt!414894)) (currentByte!13565 (_1!12336 lt!414894)) (size!6859 (buf!7327 (_1!12336 lt!414894))))))

(assert (=> d!95356 (= (bitIndex!0 (size!6859 (buf!7327 (_1!12336 lt!414894))) (currentByte!13565 (_1!12336 lt!414894)) (currentBit!13560 (_1!12336 lt!414894))) lt!414997)))

(declare-fun b!276866 () Bool)

(declare-fun res!229991 () Bool)

(assert (=> b!276866 (=> (not res!229991) (not e!196780))))

(assert (=> b!276866 (= res!229991 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414997))))

(declare-fun b!276867 () Bool)

(declare-fun lt!415000 () (_ BitVec 64))

(assert (=> b!276867 (= e!196780 (bvsle lt!414997 (bvmul lt!415000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276867 (or (= lt!415000 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415000 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415000)))))

(assert (=> b!276867 (= lt!415000 ((_ sign_extend 32) (size!6859 (buf!7327 (_1!12336 lt!414894)))))))

(assert (= (and d!95356 res!229992) b!276866))

(assert (= (and b!276866 res!229991) b!276867))

(declare-fun m!409971 () Bool)

(assert (=> d!95356 m!409971))

(declare-fun m!409973 () Bool)

(assert (=> d!95356 m!409973))

(assert (=> b!276768 d!95356))

(declare-fun d!95384 () Bool)

(declare-fun e!196781 () Bool)

(assert (=> d!95384 e!196781))

(declare-fun res!229994 () Bool)

(assert (=> d!95384 (=> (not res!229994) (not e!196781))))

(declare-fun lt!415003 () (_ BitVec 64))

(declare-fun lt!415005 () (_ BitVec 64))

(declare-fun lt!415002 () (_ BitVec 64))

(assert (=> d!95384 (= res!229994 (= lt!415003 (bvsub lt!415002 lt!415005)))))

(assert (=> d!95384 (or (= (bvand lt!415002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415005 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415002 lt!415005) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95384 (= lt!415005 (remainingBits!0 ((_ sign_extend 32) (size!6859 (buf!7327 (_1!12336 lt!414897)))) ((_ sign_extend 32) (currentByte!13565 (_1!12336 lt!414897))) ((_ sign_extend 32) (currentBit!13560 (_1!12336 lt!414897)))))))

(declare-fun lt!415004 () (_ BitVec 64))

(declare-fun lt!415001 () (_ BitVec 64))

(assert (=> d!95384 (= lt!415002 (bvmul lt!415004 lt!415001))))

(assert (=> d!95384 (or (= lt!415004 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415001 (bvsdiv (bvmul lt!415004 lt!415001) lt!415004)))))

(assert (=> d!95384 (= lt!415001 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95384 (= lt!415004 ((_ sign_extend 32) (size!6859 (buf!7327 (_1!12336 lt!414897)))))))

(assert (=> d!95384 (= lt!415003 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13565 (_1!12336 lt!414897))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13560 (_1!12336 lt!414897)))))))

(assert (=> d!95384 (invariant!0 (currentBit!13560 (_1!12336 lt!414897)) (currentByte!13565 (_1!12336 lt!414897)) (size!6859 (buf!7327 (_1!12336 lt!414897))))))

(assert (=> d!95384 (= (bitIndex!0 (size!6859 (buf!7327 (_1!12336 lt!414897))) (currentByte!13565 (_1!12336 lt!414897)) (currentBit!13560 (_1!12336 lt!414897))) lt!415003)))

(declare-fun b!276868 () Bool)

(declare-fun res!229993 () Bool)

(assert (=> b!276868 (=> (not res!229993) (not e!196781))))

(assert (=> b!276868 (= res!229993 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415003))))

(declare-fun b!276869 () Bool)

(declare-fun lt!415006 () (_ BitVec 64))

(assert (=> b!276869 (= e!196781 (bvsle lt!415003 (bvmul lt!415006 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276869 (or (= lt!415006 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415006 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415006)))))

(assert (=> b!276869 (= lt!415006 ((_ sign_extend 32) (size!6859 (buf!7327 (_1!12336 lt!414897)))))))

(assert (= (and d!95384 res!229994) b!276868))

(assert (= (and b!276868 res!229993) b!276869))

(declare-fun m!409975 () Bool)

(assert (=> d!95384 m!409975))

(declare-fun m!409977 () Bool)

(assert (=> d!95384 m!409977))

(assert (=> b!276768 d!95384))

(declare-fun d!95386 () Bool)

(assert (=> d!95386 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6859 (buf!7327 bs1!11))) ((_ sign_extend 32) (currentByte!13565 bs1!11)) ((_ sign_extend 32) (currentBit!13560 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6859 (buf!7327 bs1!11))) ((_ sign_extend 32) (currentByte!13565 bs1!11)) ((_ sign_extend 32) (currentBit!13560 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24066 () Bool)

(assert (= bs!24066 d!95386))

(declare-fun m!409995 () Bool)

(assert (=> bs!24066 m!409995))

(assert (=> b!276769 d!95386))

(declare-fun d!95390 () Bool)

(declare-datatypes ((tuple2!22580 0))(
  ( (tuple2!22581 (_1!12342 Bool) (_2!12342 BitStream!12532)) )
))
(declare-fun lt!415012 () tuple2!22580)

(declare-fun readBit!0 (BitStream!12532) tuple2!22580)

(assert (=> d!95390 (= lt!415012 (readBit!0 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))))

(assert (=> d!95390 (= (readBitPure!0 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))) (tuple2!22573 (_2!12342 lt!415012) (_1!12342 lt!415012)))))

(declare-fun bs!24067 () Bool)

(assert (= bs!24067 d!95390))

(declare-fun m!409997 () Bool)

(assert (=> bs!24067 m!409997))

(assert (=> b!276774 d!95390))

(declare-fun d!95392 () Bool)

(declare-fun lt!415013 () tuple2!22580)

(assert (=> d!95392 (= lt!415013 (readBit!0 bs1!11))))

(assert (=> d!95392 (= (readBitPure!0 bs1!11) (tuple2!22573 (_2!12342 lt!415013) (_1!12342 lt!415013)))))

(declare-fun bs!24068 () Bool)

(assert (= bs!24068 d!95392))

(declare-fun m!409999 () Bool)

(assert (=> bs!24068 m!409999))

(assert (=> b!276774 d!95392))

(declare-fun d!95394 () Bool)

(assert (=> d!95394 (= (invariant!0 (currentBit!13560 bs1!11) (currentByte!13565 bs1!11) (size!6859 (buf!7327 bs2!19))) (and (bvsge (currentBit!13560 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13560 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13565 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13565 bs1!11) (size!6859 (buf!7327 bs2!19))) (and (= (currentBit!13560 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13565 bs1!11) (size!6859 (buf!7327 bs2!19)))))))))

(assert (=> b!276774 d!95394))

(declare-fun d!95396 () Bool)

(assert (=> d!95396 (= (array_inv!6583 (buf!7327 bs1!11)) (bvsge (size!6859 (buf!7327 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276773 d!95396))

(declare-fun d!95398 () Bool)

(assert (=> d!95398 (= (array_inv!6583 (buf!7327 bs2!19)) (bvsge (size!6859 (buf!7327 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276771 d!95398))

(declare-fun b!276901 () Bool)

(declare-fun e!196807 () Bool)

(declare-fun e!196809 () Bool)

(assert (=> b!276901 (= e!196807 e!196809)))

(declare-fun res!230020 () Bool)

(assert (=> b!276901 (=> (not res!230020) (not e!196809))))

(declare-fun e!196808 () Bool)

(assert (=> b!276901 (= res!230020 e!196808)))

(declare-fun res!230023 () Bool)

(assert (=> b!276901 (=> res!230023 e!196808)))

(declare-datatypes ((tuple4!544 0))(
  ( (tuple4!545 (_1!12343 (_ BitVec 32)) (_2!12343 (_ BitVec 32)) (_3!1052 (_ BitVec 32)) (_4!272 (_ BitVec 32))) )
))
(declare-fun lt!415057 () tuple4!544)

(assert (=> b!276901 (= res!230023 (bvsge (_1!12343 lt!415057) (_2!12343 lt!415057)))))

(declare-fun lt!415058 () (_ BitVec 32))

(assert (=> b!276901 (= lt!415058 ((_ extract 31 0) (bvsrem lt!414893 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415059 () (_ BitVec 32))

(assert (=> b!276901 (= lt!415059 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!544)

(assert (=> b!276901 (= lt!415057 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414893))))

(declare-fun b!276902 () Bool)

(declare-fun e!196810 () Bool)

(declare-fun call!4472 () Bool)

(assert (=> b!276902 (= e!196810 call!4472)))

(declare-fun b!276903 () Bool)

(declare-fun res!230024 () Bool)

(assert (=> b!276903 (= res!230024 (= lt!415058 #b00000000000000000000000000000000))))

(assert (=> b!276903 (=> res!230024 e!196810)))

(declare-fun e!196805 () Bool)

(assert (=> b!276903 (= e!196805 e!196810)))

(declare-fun bm!4469 () Bool)

(declare-fun c!12657 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4469 (= call!4472 (byteRangesEq!0 (ite c!12657 (select (arr!7852 (buf!7327 bs1!11)) (_3!1052 lt!415057)) (select (arr!7852 (buf!7327 bs1!11)) (_4!272 lt!415057))) (ite c!12657 (select (arr!7852 (buf!7327 bs2!19)) (_3!1052 lt!415057)) (select (arr!7852 (buf!7327 bs2!19)) (_4!272 lt!415057))) (ite c!12657 lt!415059 #b00000000000000000000000000000000) lt!415058))))

(declare-fun b!276904 () Bool)

(declare-fun arrayRangesEq!1165 (array!15844 array!15844 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276904 (= e!196808 (arrayRangesEq!1165 (buf!7327 bs1!11) (buf!7327 bs2!19) (_1!12343 lt!415057) (_2!12343 lt!415057)))))

(declare-fun b!276905 () Bool)

(declare-fun e!196806 () Bool)

(assert (=> b!276905 (= e!196806 e!196805)))

(declare-fun res!230022 () Bool)

(assert (=> b!276905 (= res!230022 (byteRangesEq!0 (select (arr!7852 (buf!7327 bs1!11)) (_3!1052 lt!415057)) (select (arr!7852 (buf!7327 bs2!19)) (_3!1052 lt!415057)) lt!415059 #b00000000000000000000000000001000))))

(assert (=> b!276905 (=> (not res!230022) (not e!196805))))

(declare-fun d!95400 () Bool)

(declare-fun res!230021 () Bool)

(assert (=> d!95400 (=> res!230021 e!196807)))

(assert (=> d!95400 (= res!230021 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414893))))

(assert (=> d!95400 (= (arrayBitRangesEq!0 (buf!7327 bs1!11) (buf!7327 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414893) e!196807)))

(declare-fun b!276906 () Bool)

(assert (=> b!276906 (= e!196809 e!196806)))

(assert (=> b!276906 (= c!12657 (= (_3!1052 lt!415057) (_4!272 lt!415057)))))

(declare-fun b!276907 () Bool)

(assert (=> b!276907 (= e!196806 call!4472)))

(assert (= (and d!95400 (not res!230021)) b!276901))

(assert (= (and b!276901 (not res!230023)) b!276904))

(assert (= (and b!276901 res!230020) b!276906))

(assert (= (and b!276906 c!12657) b!276907))

(assert (= (and b!276906 (not c!12657)) b!276905))

(assert (= (and b!276905 res!230022) b!276903))

(assert (= (and b!276903 (not res!230024)) b!276902))

(assert (= (or b!276907 b!276902) bm!4469))

(declare-fun m!410023 () Bool)

(assert (=> b!276901 m!410023))

(declare-fun m!410025 () Bool)

(assert (=> bm!4469 m!410025))

(declare-fun m!410027 () Bool)

(assert (=> bm!4469 m!410027))

(declare-fun m!410029 () Bool)

(assert (=> bm!4469 m!410029))

(declare-fun m!410031 () Bool)

(assert (=> bm!4469 m!410031))

(declare-fun m!410033 () Bool)

(assert (=> bm!4469 m!410033))

(declare-fun m!410035 () Bool)

(assert (=> b!276904 m!410035))

(assert (=> b!276905 m!410029))

(assert (=> b!276905 m!410031))

(assert (=> b!276905 m!410029))

(assert (=> b!276905 m!410031))

(declare-fun m!410037 () Bool)

(assert (=> b!276905 m!410037))

(assert (=> b!276770 d!95400))

(declare-fun d!95424 () Bool)

(declare-fun e!196811 () Bool)

(assert (=> d!95424 e!196811))

(declare-fun res!230026 () Bool)

(assert (=> d!95424 (=> (not res!230026) (not e!196811))))

(declare-fun lt!415064 () (_ BitVec 64))

(declare-fun lt!415062 () (_ BitVec 64))

(declare-fun lt!415061 () (_ BitVec 64))

(assert (=> d!95424 (= res!230026 (= lt!415062 (bvsub lt!415061 lt!415064)))))

(assert (=> d!95424 (or (= (bvand lt!415061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415064 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415061 lt!415064) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95424 (= lt!415064 (remainingBits!0 ((_ sign_extend 32) (size!6859 (buf!7327 bs1!11))) ((_ sign_extend 32) (currentByte!13565 bs1!11)) ((_ sign_extend 32) (currentBit!13560 bs1!11))))))

(declare-fun lt!415063 () (_ BitVec 64))

(declare-fun lt!415060 () (_ BitVec 64))

(assert (=> d!95424 (= lt!415061 (bvmul lt!415063 lt!415060))))

(assert (=> d!95424 (or (= lt!415063 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415060 (bvsdiv (bvmul lt!415063 lt!415060) lt!415063)))))

(assert (=> d!95424 (= lt!415060 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95424 (= lt!415063 ((_ sign_extend 32) (size!6859 (buf!7327 bs1!11))))))

(assert (=> d!95424 (= lt!415062 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13565 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13560 bs1!11))))))

(assert (=> d!95424 (invariant!0 (currentBit!13560 bs1!11) (currentByte!13565 bs1!11) (size!6859 (buf!7327 bs1!11)))))

(assert (=> d!95424 (= (bitIndex!0 (size!6859 (buf!7327 bs1!11)) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)) lt!415062)))

(declare-fun b!276908 () Bool)

(declare-fun res!230025 () Bool)

(assert (=> b!276908 (=> (not res!230025) (not e!196811))))

(assert (=> b!276908 (= res!230025 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415062))))

(declare-fun b!276909 () Bool)

(declare-fun lt!415065 () (_ BitVec 64))

(assert (=> b!276909 (= e!196811 (bvsle lt!415062 (bvmul lt!415065 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276909 (or (= lt!415065 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415065 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415065)))))

(assert (=> b!276909 (= lt!415065 ((_ sign_extend 32) (size!6859 (buf!7327 bs1!11))))))

(assert (= (and d!95424 res!230026) b!276908))

(assert (= (and b!276908 res!230025) b!276909))

(assert (=> d!95424 m!409995))

(assert (=> d!95424 m!409917))

(assert (=> b!276770 d!95424))

(push 1)

(assert (not d!95386))

(assert (not d!95384))

(assert (not d!95392))

(assert (not b!276905))

(assert (not b!276901))

(assert (not d!95346))

(assert (not bm!4469))

(assert (not d!95424))

(assert (not b!276904))

(assert (not d!95356))

(assert (not d!95344))

(assert (not d!95348))

(assert (not d!95390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95454 () Bool)

(assert (=> d!95454 (= (byteRangesEq!0 (select (arr!7852 (buf!7327 bs1!11)) (_3!1052 lt!415057)) (select (arr!7852 (buf!7327 bs2!19)) (_3!1052 lt!415057)) lt!415059 #b00000000000000000000000000001000) (or (= lt!415059 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 bs1!11)) (_3!1052 lt!415057))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!415059)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 bs2!19)) (_3!1052 lt!415057))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!415059)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24078 () Bool)

(assert (= bs!24078 d!95454))

(declare-fun m!410073 () Bool)

(assert (=> bs!24078 m!410073))

(declare-fun m!410075 () Bool)

(assert (=> bs!24078 m!410075))

(assert (=> b!276905 d!95454))

(declare-fun d!95456 () Bool)

(assert (=> d!95456 (= (byteRangesEq!0 (ite c!12657 (select (arr!7852 (buf!7327 bs1!11)) (_3!1052 lt!415057)) (select (arr!7852 (buf!7327 bs1!11)) (_4!272 lt!415057))) (ite c!12657 (select (arr!7852 (buf!7327 bs2!19)) (_3!1052 lt!415057)) (select (arr!7852 (buf!7327 bs2!19)) (_4!272 lt!415057))) (ite c!12657 lt!415059 #b00000000000000000000000000000000) lt!415058) (or (= (ite c!12657 lt!415059 #b00000000000000000000000000000000) lt!415058) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12657 (select (arr!7852 (buf!7327 bs1!11)) (_3!1052 lt!415057)) (select (arr!7852 (buf!7327 bs1!11)) (_4!272 lt!415057)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!415058))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12657 lt!415059 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12657 (select (arr!7852 (buf!7327 bs2!19)) (_3!1052 lt!415057)) (select (arr!7852 (buf!7327 bs2!19)) (_4!272 lt!415057)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!415058))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12657 lt!415059 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24079 () Bool)

(assert (= bs!24079 d!95456))

(declare-fun m!410077 () Bool)

(assert (=> bs!24079 m!410077))

(declare-fun m!410079 () Bool)

(assert (=> bs!24079 m!410079))

(assert (=> bm!4469 d!95456))

(assert (=> d!95348 d!95354))

(assert (=> d!95348 d!95350))

(declare-fun d!95458 () Bool)

(assert (=> d!95458 (= (bitAt!0 (buf!7327 bs1!11) lt!414895) (bitAt!0 (buf!7327 bs2!19) lt!414895))))

(assert (=> d!95458 true))

(declare-fun _$31!50 () Unit!19383)

(assert (=> d!95458 (= (choose!31 (buf!7327 bs1!11) (buf!7327 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414895 lt!414893) _$31!50)))

(declare-fun bs!24080 () Bool)

(assert (= bs!24080 d!95458))

(assert (=> bs!24080 m!409839))

(assert (=> bs!24080 m!409843))

(assert (=> d!95348 d!95458))

(declare-fun d!95460 () Bool)

(assert (=> d!95460 (= (remainingBits!0 ((_ sign_extend 32) (size!6859 (buf!7327 bs1!11))) ((_ sign_extend 32) (currentByte!13565 bs1!11)) ((_ sign_extend 32) (currentBit!13560 bs1!11))) (bvsub (bvmul ((_ sign_extend 32) (size!6859 (buf!7327 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13565 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13560 bs1!11)))))))

(assert (=> d!95424 d!95460))

(declare-fun d!95462 () Bool)

(assert (=> d!95462 (= (invariant!0 (currentBit!13560 bs1!11) (currentByte!13565 bs1!11) (size!6859 (buf!7327 bs1!11))) (and (bvsge (currentBit!13560 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13560 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13565 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13565 bs1!11) (size!6859 (buf!7327 bs1!11))) (and (= (currentBit!13560 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13565 bs1!11) (size!6859 (buf!7327 bs1!11)))))))))

(assert (=> d!95424 d!95462))

(declare-fun d!95464 () Bool)

(assert (=> d!95464 (= (remainingBits!0 ((_ sign_extend 32) (size!6859 (buf!7327 (_1!12336 lt!414897)))) ((_ sign_extend 32) (currentByte!13565 (_1!12336 lt!414897))) ((_ sign_extend 32) (currentBit!13560 (_1!12336 lt!414897)))) (bvsub (bvmul ((_ sign_extend 32) (size!6859 (buf!7327 (_1!12336 lt!414897)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13565 (_1!12336 lt!414897))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13560 (_1!12336 lt!414897))))))))

(assert (=> d!95384 d!95464))

(declare-fun d!95466 () Bool)

(assert (=> d!95466 (= (invariant!0 (currentBit!13560 (_1!12336 lt!414897)) (currentByte!13565 (_1!12336 lt!414897)) (size!6859 (buf!7327 (_1!12336 lt!414897)))) (and (bvsge (currentBit!13560 (_1!12336 lt!414897)) #b00000000000000000000000000000000) (bvslt (currentBit!13560 (_1!12336 lt!414897)) #b00000000000000000000000000001000) (bvsge (currentByte!13565 (_1!12336 lt!414897)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13565 (_1!12336 lt!414897)) (size!6859 (buf!7327 (_1!12336 lt!414897)))) (and (= (currentBit!13560 (_1!12336 lt!414897)) #b00000000000000000000000000000000) (= (currentByte!13565 (_1!12336 lt!414897)) (size!6859 (buf!7327 (_1!12336 lt!414897))))))))))

(assert (=> d!95384 d!95466))

(declare-fun d!95468 () Bool)

(declare-fun res!230041 () Bool)

(declare-fun e!196830 () Bool)

(assert (=> d!95468 (=> res!230041 e!196830)))

(assert (=> d!95468 (= res!230041 (= (_1!12343 lt!415057) (_2!12343 lt!415057)))))

(assert (=> d!95468 (= (arrayRangesEq!1165 (buf!7327 bs1!11) (buf!7327 bs2!19) (_1!12343 lt!415057) (_2!12343 lt!415057)) e!196830)))

(declare-fun b!276924 () Bool)

(declare-fun e!196831 () Bool)

(assert (=> b!276924 (= e!196830 e!196831)))

(declare-fun res!230042 () Bool)

(assert (=> b!276924 (=> (not res!230042) (not e!196831))))

(assert (=> b!276924 (= res!230042 (= (select (arr!7852 (buf!7327 bs1!11)) (_1!12343 lt!415057)) (select (arr!7852 (buf!7327 bs2!19)) (_1!12343 lt!415057))))))

(declare-fun b!276925 () Bool)

(assert (=> b!276925 (= e!196831 (arrayRangesEq!1165 (buf!7327 bs1!11) (buf!7327 bs2!19) (bvadd (_1!12343 lt!415057) #b00000000000000000000000000000001) (_2!12343 lt!415057)))))

(assert (= (and d!95468 (not res!230041)) b!276924))

(assert (= (and b!276924 res!230042) b!276925))

(declare-fun m!410081 () Bool)

(assert (=> b!276924 m!410081))

(declare-fun m!410083 () Bool)

(assert (=> b!276924 m!410083))

(declare-fun m!410085 () Bool)

(assert (=> b!276925 m!410085))

(assert (=> b!276904 d!95468))

(declare-fun d!95470 () Bool)

(declare-fun e!196838 () Bool)

(assert (=> d!95470 e!196838))

(declare-fun res!230045 () Bool)

(assert (=> d!95470 (=> (not res!230045) (not e!196838))))

(declare-datatypes ((tuple2!22586 0))(
  ( (tuple2!22587 (_1!12346 Unit!19383) (_2!12346 BitStream!12532)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12532) tuple2!22586)

(assert (=> d!95470 (= res!230045 (= (buf!7327 (_2!12346 (increaseBitIndex!0 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))) (buf!7327 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))))

(declare-fun lt!415108 () Bool)

(assert (=> d!95470 (= lt!415108 (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))) (currentByte!13565 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13560 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!415112 () tuple2!22580)

(assert (=> d!95470 (= lt!415112 (tuple2!22581 (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))) (currentByte!13565 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13560 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))) #b00000000000000000000000000000000)) (_2!12346 (increaseBitIndex!0 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))))))

(assert (=> d!95470 (validate_offset_bit!0 ((_ sign_extend 32) (size!6859 (buf!7327 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))) ((_ sign_extend 32) (currentByte!13565 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))) ((_ sign_extend 32) (currentBit!13560 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))))

(assert (=> d!95470 (= (readBit!0 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))) lt!415112)))

(declare-fun lt!415113 () (_ BitVec 64))

(declare-fun lt!415114 () (_ BitVec 64))

(declare-fun b!276928 () Bool)

(assert (=> b!276928 (= e!196838 (= (bitIndex!0 (size!6859 (buf!7327 (_2!12346 (increaseBitIndex!0 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))) (currentByte!13565 (_2!12346 (increaseBitIndex!0 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))) (currentBit!13560 (_2!12346 (increaseBitIndex!0 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))) (bvadd lt!415113 lt!415114)))))

(assert (=> b!276928 (or (not (= (bvand lt!415113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415114 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!415113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!415113 lt!415114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276928 (= lt!415114 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276928 (= lt!415113 (bitIndex!0 (size!6859 (buf!7327 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))) (currentByte!13565 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))) (currentBit!13560 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))))

(declare-fun lt!415111 () Bool)

(assert (=> b!276928 (= lt!415111 (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))) (currentByte!13565 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13560 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!415109 () Bool)

(assert (=> b!276928 (= lt!415109 (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))) (currentByte!13565 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13560 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!415110 () Bool)

(assert (=> b!276928 (= lt!415110 (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))) (currentByte!13565 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13560 (BitStream!12533 (buf!7327 bs2!19) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!95470 res!230045) b!276928))

(declare-fun m!410087 () Bool)

(assert (=> d!95470 m!410087))

(declare-fun m!410089 () Bool)

(assert (=> d!95470 m!410089))

(declare-fun m!410091 () Bool)

(assert (=> d!95470 m!410091))

(declare-fun m!410093 () Bool)

(assert (=> d!95470 m!410093))

(declare-fun m!410095 () Bool)

(assert (=> b!276928 m!410095))

(assert (=> b!276928 m!410091))

(declare-fun m!410097 () Bool)

(assert (=> b!276928 m!410097))

(assert (=> b!276928 m!410089))

(assert (=> b!276928 m!410087))

(assert (=> d!95390 d!95470))

(declare-fun d!95472 () Bool)

(assert (=> d!95472 (= (remainingBits!0 ((_ sign_extend 32) (size!6859 (buf!7327 (_1!12336 lt!414894)))) ((_ sign_extend 32) (currentByte!13565 (_1!12336 lt!414894))) ((_ sign_extend 32) (currentBit!13560 (_1!12336 lt!414894)))) (bvsub (bvmul ((_ sign_extend 32) (size!6859 (buf!7327 (_1!12336 lt!414894)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13565 (_1!12336 lt!414894))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13560 (_1!12336 lt!414894))))))))

(assert (=> d!95356 d!95472))

(declare-fun d!95474 () Bool)

(assert (=> d!95474 (= (invariant!0 (currentBit!13560 (_1!12336 lt!414894)) (currentByte!13565 (_1!12336 lt!414894)) (size!6859 (buf!7327 (_1!12336 lt!414894)))) (and (bvsge (currentBit!13560 (_1!12336 lt!414894)) #b00000000000000000000000000000000) (bvslt (currentBit!13560 (_1!12336 lt!414894)) #b00000000000000000000000000001000) (bvsge (currentByte!13565 (_1!12336 lt!414894)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13565 (_1!12336 lt!414894)) (size!6859 (buf!7327 (_1!12336 lt!414894)))) (and (= (currentBit!13560 (_1!12336 lt!414894)) #b00000000000000000000000000000000) (= (currentByte!13565 (_1!12336 lt!414894)) (size!6859 (buf!7327 (_1!12336 lt!414894))))))))))

(assert (=> d!95356 d!95474))

(assert (=> d!95344 d!95462))

(declare-fun d!95476 () Bool)

(assert (=> d!95476 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414893) (tuple4!545 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!414893 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!414893 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!276901 d!95476))

(declare-fun d!95478 () Bool)

(declare-fun e!196839 () Bool)

(assert (=> d!95478 e!196839))

(declare-fun res!230046 () Bool)

(assert (=> d!95478 (=> (not res!230046) (not e!196839))))

(assert (=> d!95478 (= res!230046 (= (buf!7327 (_2!12346 (increaseBitIndex!0 bs1!11))) (buf!7327 bs1!11)))))

(declare-fun lt!415115 () Bool)

(assert (=> d!95478 (= lt!415115 (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 bs1!11)) (currentByte!13565 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13560 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!415119 () tuple2!22580)

(assert (=> d!95478 (= lt!415119 (tuple2!22581 (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 bs1!11)) (currentByte!13565 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13560 bs1!11)))) #b00000000000000000000000000000000)) (_2!12346 (increaseBitIndex!0 bs1!11))))))

(assert (=> d!95478 (validate_offset_bit!0 ((_ sign_extend 32) (size!6859 (buf!7327 bs1!11))) ((_ sign_extend 32) (currentByte!13565 bs1!11)) ((_ sign_extend 32) (currentBit!13560 bs1!11)))))

(assert (=> d!95478 (= (readBit!0 bs1!11) lt!415119)))

(declare-fun b!276929 () Bool)

(declare-fun lt!415120 () (_ BitVec 64))

(declare-fun lt!415121 () (_ BitVec 64))

(assert (=> b!276929 (= e!196839 (= (bitIndex!0 (size!6859 (buf!7327 (_2!12346 (increaseBitIndex!0 bs1!11)))) (currentByte!13565 (_2!12346 (increaseBitIndex!0 bs1!11))) (currentBit!13560 (_2!12346 (increaseBitIndex!0 bs1!11)))) (bvadd lt!415120 lt!415121)))))

(assert (=> b!276929 (or (not (= (bvand lt!415120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415121 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!415120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!415120 lt!415121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276929 (= lt!415121 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276929 (= lt!415120 (bitIndex!0 (size!6859 (buf!7327 bs1!11)) (currentByte!13565 bs1!11) (currentBit!13560 bs1!11)))))

(declare-fun lt!415118 () Bool)

(assert (=> b!276929 (= lt!415118 (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 bs1!11)) (currentByte!13565 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13560 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!415116 () Bool)

(assert (=> b!276929 (= lt!415116 (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 bs1!11)) (currentByte!13565 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13560 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!415117 () Bool)

(assert (=> b!276929 (= lt!415117 (not (= (bvand ((_ sign_extend 24) (select (arr!7852 (buf!7327 bs1!11)) (currentByte!13565 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13560 bs1!11)))) #b00000000000000000000000000000000)))))

(assert (= (and d!95478 res!230046) b!276929))

(declare-fun m!410099 () Bool)

(assert (=> d!95478 m!410099))

(declare-fun m!410101 () Bool)

(assert (=> d!95478 m!410101))

(declare-fun m!410103 () Bool)

(assert (=> d!95478 m!410103))

(assert (=> d!95478 m!409831))

(assert (=> b!276929 m!409835))

(assert (=> b!276929 m!410103))

(declare-fun m!410105 () Bool)

(assert (=> b!276929 m!410105))

(assert (=> b!276929 m!410101))

(assert (=> b!276929 m!410099))

(assert (=> d!95392 d!95478))

(declare-fun d!95480 () Bool)

(assert (=> d!95480 (= (invariant!0 (currentBit!13560 bs2!19) (currentByte!13565 bs2!19) (size!6859 (buf!7327 bs2!19))) (and (bvsge (currentBit!13560 bs2!19) #b00000000000000000000000000000000) (bvslt (currentBit!13560 bs2!19) #b00000000000000000000000000001000) (bvsge (currentByte!13565 bs2!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!13565 bs2!19) (size!6859 (buf!7327 bs2!19))) (and (= (currentBit!13560 bs2!19) #b00000000000000000000000000000000) (= (currentByte!13565 bs2!19) (size!6859 (buf!7327 bs2!19)))))))))

(assert (=> d!95346 d!95480))

(assert (=> d!95386 d!95460))

(push 1)

(assert (not d!95470))

(assert (not d!95458))

(assert (not b!276928))

(assert (not d!95478))

(assert (not b!276925))

(assert (not b!276929))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

