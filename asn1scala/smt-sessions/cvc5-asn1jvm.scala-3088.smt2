; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71056 () Bool)

(assert start!71056)

(declare-fun res!263544 () Bool)

(declare-fun e!231052 () Bool)

(assert (=> start!71056 (=> (not res!263544) (not e!231052))))

(declare-fun nBits!542 () (_ BitVec 32))

(assert (=> start!71056 (= res!263544 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71056 e!231052))

(assert (=> start!71056 true))

(declare-datatypes ((array!20286 0))(
  ( (array!20287 (arr!9934 (Array (_ BitVec 32) (_ BitVec 8))) (size!8842 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13846 0))(
  ( (BitStream!13847 (buf!7984 array!20286) (currentByte!14719 (_ BitVec 32)) (currentBit!14714 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13846)

(declare-fun e!231053 () Bool)

(declare-fun inv!12 (BitStream!13846) Bool)

(assert (=> start!71056 (and (inv!12 thiss!1780) e!231053)))

(declare-fun b!320860 () Bool)

(declare-fun res!263545 () Bool)

(assert (=> b!320860 (=> (not res!263545) (not e!231052))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320860 (= res!263545 (validate_offset_bits!1 ((_ sign_extend 32) (size!8842 (buf!7984 thiss!1780))) ((_ sign_extend 32) (currentByte!14719 thiss!1780)) ((_ sign_extend 32) (currentBit!14714 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!320863 () Bool)

(declare-fun array_inv!8394 (array!20286) Bool)

(assert (=> b!320863 (= e!231053 (array_inv!8394 (buf!7984 thiss!1780)))))

(declare-fun b!320861 () Bool)

(declare-fun e!231051 () Bool)

(assert (=> b!320861 (= e!231052 e!231051)))

(declare-fun res!263543 () Bool)

(assert (=> b!320861 (=> (not res!263543) (not e!231051))))

(declare-datatypes ((tuple2!23444 0))(
  ( (tuple2!23445 (_1!13351 (_ BitVec 64)) (_2!13351 BitStream!13846)) )
))
(declare-fun lt!444107 () tuple2!23444)

(assert (=> b!320861 (= res!263543 (= (buf!7984 (_2!13351 lt!444107)) (buf!7984 thiss!1780)))))

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23444)

(assert (=> b!320861 (= lt!444107 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320862 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320862 (= e!231051 (not (invariant!0 (currentBit!14714 (_2!13351 lt!444107)) (currentByte!14719 (_2!13351 lt!444107)) (size!8842 (buf!7984 (_2!13351 lt!444107))))))))

(assert (= (and start!71056 res!263544) b!320860))

(assert (= (and b!320860 res!263545) b!320861))

(assert (= (and b!320861 res!263543) b!320862))

(assert (= start!71056 b!320863))

(declare-fun m!459213 () Bool)

(assert (=> b!320860 m!459213))

(declare-fun m!459215 () Bool)

(assert (=> b!320863 m!459215))

(declare-fun m!459217 () Bool)

(assert (=> b!320862 m!459217))

(declare-fun m!459219 () Bool)

(assert (=> b!320861 m!459219))

(declare-fun m!459221 () Bool)

(assert (=> start!71056 m!459221))

(push 1)

(assert (not b!320862))

(assert (not start!71056))

(assert (not b!320861))

(assert (not b!320860))

(assert (not b!320863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105068 () Bool)

(assert (=> d!105068 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14714 thiss!1780) (currentByte!14719 thiss!1780) (size!8842 (buf!7984 thiss!1780))))))

(declare-fun bs!27639 () Bool)

(assert (= bs!27639 d!105068))

(declare-fun m!459243 () Bool)

(assert (=> bs!27639 m!459243))

(assert (=> start!71056 d!105068))

(declare-fun d!105074 () Bool)

(assert (=> d!105074 (= (array_inv!8394 (buf!7984 thiss!1780)) (bvsge (size!8842 (buf!7984 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!320863 d!105074))

(declare-fun d!105076 () Bool)

(assert (=> d!105076 (= (invariant!0 (currentBit!14714 (_2!13351 lt!444107)) (currentByte!14719 (_2!13351 lt!444107)) (size!8842 (buf!7984 (_2!13351 lt!444107)))) (and (bvsge (currentBit!14714 (_2!13351 lt!444107)) #b00000000000000000000000000000000) (bvslt (currentBit!14714 (_2!13351 lt!444107)) #b00000000000000000000000000001000) (bvsge (currentByte!14719 (_2!13351 lt!444107)) #b00000000000000000000000000000000) (or (bvslt (currentByte!14719 (_2!13351 lt!444107)) (size!8842 (buf!7984 (_2!13351 lt!444107)))) (and (= (currentBit!14714 (_2!13351 lt!444107)) #b00000000000000000000000000000000) (= (currentByte!14719 (_2!13351 lt!444107)) (size!8842 (buf!7984 (_2!13351 lt!444107))))))))))

(assert (=> b!320862 d!105076))

(declare-fun b!320944 () Bool)

(declare-fun e!231105 () tuple2!23444)

(assert (=> b!320944 (= e!231105 (tuple2!23445 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(declare-fun b!320945 () Bool)

(declare-fun lt!444166 () tuple2!23444)

(assert (=> b!320945 (= e!231105 (tuple2!23445 (_1!13351 lt!444166) (_2!13351 lt!444166)))))

(declare-datatypes ((tuple2!23456 0))(
  ( (tuple2!23457 (_1!13357 Bool) (_2!13357 BitStream!13846)) )
))
(declare-fun lt!444163 () tuple2!23456)

(declare-fun readBit!0 (BitStream!13846) tuple2!23456)

(assert (=> b!320945 (= lt!444163 (readBit!0 thiss!1780))))

(assert (=> b!320945 (= lt!444166 (readNBitsLSBFirstsLoop!0 (_2!13357 lt!444163) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13357 lt!444163) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!320946 () Bool)

(declare-fun res!263608 () Bool)

(declare-fun e!231103 () Bool)

(assert (=> b!320946 (=> (not res!263608) (not e!231103))))

(declare-fun lt!444164 () tuple2!23444)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!320946 (= res!263608 (= (bvand (_1!13351 lt!444164) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun b!320947 () Bool)

(declare-fun e!231104 () Bool)

(assert (=> b!320947 (= e!231103 e!231104)))

(declare-fun res!263604 () Bool)

(assert (=> b!320947 (=> res!263604 e!231104)))

(assert (=> b!320947 (= res!263604 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun d!105080 () Bool)

(assert (=> d!105080 e!231103))

(declare-fun res!263605 () Bool)

(assert (=> d!105080 (=> (not res!263605) (not e!231103))))

(assert (=> d!105080 (= res!263605 (= (buf!7984 (_2!13351 lt!444164)) (buf!7984 thiss!1780)))))

(assert (=> d!105080 (= lt!444164 e!231105)))

(declare-fun c!15382 () Bool)

(assert (=> d!105080 (= c!15382 (= nBits!542 #b00000000000000000000000000000000))))

(assert (=> d!105080 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105080 (= (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!444164)))

(declare-fun b!320948 () Bool)

(declare-fun res!263607 () Bool)

(assert (=> b!320948 (=> (not res!263607) (not e!231103))))

(declare-fun lt!444167 () (_ BitVec 64))

(declare-fun lt!444165 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!320948 (= res!263607 (= (bitIndex!0 (size!8842 (buf!7984 (_2!13351 lt!444164))) (currentByte!14719 (_2!13351 lt!444164)) (currentBit!14714 (_2!13351 lt!444164))) (bvadd lt!444165 lt!444167)))))

(assert (=> b!320948 (or (not (= (bvand lt!444165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444167 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444165 lt!444167) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!320948 (= lt!444167 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!320948 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!320948 (= lt!444165 (bitIndex!0 (size!8842 (buf!7984 thiss!1780)) (currentByte!14719 thiss!1780) (currentBit!14714 thiss!1780)))))

(declare-fun lt!444162 () (_ BitVec 64))

(declare-fun b!320949 () Bool)

(declare-datatypes ((tuple2!23460 0))(
  ( (tuple2!23461 (_1!13359 BitStream!13846) (_2!13359 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13846) tuple2!23460)

(assert (=> b!320949 (= e!231104 (= (= (bvand (bvlshr (_1!13351 lt!444164) lt!444162) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13359 (readBitPure!0 thiss!1780))))))

(assert (=> b!320949 (and (bvsge lt!444162 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444162 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!320949 (= lt!444162 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun b!320950 () Bool)

(declare-fun res!263606 () Bool)

(assert (=> b!320950 (=> (not res!263606) (not e!231103))))

(assert (=> b!320950 (= res!263606 (= (bvand (_1!13351 lt!444164) (onesLSBLong!0 nBits!542)) (_1!13351 lt!444164)))))

(assert (= (and d!105080 c!15382) b!320944))

(assert (= (and d!105080 (not c!15382)) b!320945))

(assert (= (and d!105080 res!263605) b!320948))

(assert (= (and b!320948 res!263607) b!320946))

(assert (= (and b!320946 res!263608) b!320950))

(assert (= (and b!320950 res!263606) b!320947))

(assert (= (and b!320947 (not res!263604)) b!320949))

(declare-fun m!459281 () Bool)

(assert (=> b!320948 m!459281))

(declare-fun m!459283 () Bool)

(assert (=> b!320948 m!459283))

(declare-fun m!459285 () Bool)

(assert (=> b!320949 m!459285))

(declare-fun m!459287 () Bool)

(assert (=> b!320946 m!459287))

(declare-fun m!459289 () Bool)

(assert (=> b!320945 m!459289))

(declare-fun m!459291 () Bool)

(assert (=> b!320945 m!459291))

(declare-fun m!459293 () Bool)

(assert (=> b!320950 m!459293))

(assert (=> b!320861 d!105080))

(declare-fun d!105094 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105094 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8842 (buf!7984 thiss!1780))) ((_ sign_extend 32) (currentByte!14719 thiss!1780)) ((_ sign_extend 32) (currentBit!14714 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8842 (buf!7984 thiss!1780))) ((_ sign_extend 32) (currentByte!14719 thiss!1780)) ((_ sign_extend 32) (currentBit!14714 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27644 () Bool)

(assert (= bs!27644 d!105094))

(declare-fun m!459295 () Bool)

(assert (=> bs!27644 m!459295))

(assert (=> b!320860 d!105094))

(push 1)

(assert (not b!320946))

(assert (not d!105068))

(assert (not b!320950))

(assert (not b!320949))

(assert (not d!105094))

(assert (not b!320945))

(assert (not b!320948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105114 () Bool)

(declare-fun e!231128 () Bool)

(assert (=> d!105114 e!231128))

(declare-fun res!263632 () Bool)

(assert (=> d!105114 (=> (not res!263632) (not e!231128))))

(declare-fun lt!444250 () (_ BitVec 64))

(declare-fun lt!444249 () (_ BitVec 64))

(declare-fun lt!444251 () (_ BitVec 64))

(assert (=> d!105114 (= res!263632 (= lt!444251 (bvsub lt!444249 lt!444250)))))

(assert (=> d!105114 (or (= (bvand lt!444249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444250 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444249 lt!444250) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105114 (= lt!444250 (remainingBits!0 ((_ sign_extend 32) (size!8842 (buf!7984 (_2!13351 lt!444164)))) ((_ sign_extend 32) (currentByte!14719 (_2!13351 lt!444164))) ((_ sign_extend 32) (currentBit!14714 (_2!13351 lt!444164)))))))

(declare-fun lt!444252 () (_ BitVec 64))

(declare-fun lt!444253 () (_ BitVec 64))

(assert (=> d!105114 (= lt!444249 (bvmul lt!444252 lt!444253))))

(assert (=> d!105114 (or (= lt!444252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444253 (bvsdiv (bvmul lt!444252 lt!444253) lt!444252)))))

(assert (=> d!105114 (= lt!444253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105114 (= lt!444252 ((_ sign_extend 32) (size!8842 (buf!7984 (_2!13351 lt!444164)))))))

(assert (=> d!105114 (= lt!444251 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14719 (_2!13351 lt!444164))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14714 (_2!13351 lt!444164)))))))

(assert (=> d!105114 (invariant!0 (currentBit!14714 (_2!13351 lt!444164)) (currentByte!14719 (_2!13351 lt!444164)) (size!8842 (buf!7984 (_2!13351 lt!444164))))))

(assert (=> d!105114 (= (bitIndex!0 (size!8842 (buf!7984 (_2!13351 lt!444164))) (currentByte!14719 (_2!13351 lt!444164)) (currentBit!14714 (_2!13351 lt!444164))) lt!444251)))

(declare-fun b!320975 () Bool)

(declare-fun res!263631 () Bool)

(assert (=> b!320975 (=> (not res!263631) (not e!231128))))

(assert (=> b!320975 (= res!263631 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444251))))

(declare-fun b!320976 () Bool)

(declare-fun lt!444248 () (_ BitVec 64))

(assert (=> b!320976 (= e!231128 (bvsle lt!444251 (bvmul lt!444248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320976 (or (= lt!444248 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444248 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444248)))))

(assert (=> b!320976 (= lt!444248 ((_ sign_extend 32) (size!8842 (buf!7984 (_2!13351 lt!444164)))))))

(assert (= (and d!105114 res!263632) b!320975))

(assert (= (and b!320975 res!263631) b!320976))

(declare-fun m!459323 () Bool)

(assert (=> d!105114 m!459323))

(declare-fun m!459325 () Bool)

(assert (=> d!105114 m!459325))

(assert (=> b!320948 d!105114))

(declare-fun d!105124 () Bool)

(declare-fun e!231130 () Bool)

(assert (=> d!105124 e!231130))

(declare-fun res!263635 () Bool)

(assert (=> d!105124 (=> (not res!263635) (not e!231130))))

(declare-fun lt!444263 () (_ BitVec 64))

(declare-fun lt!444262 () (_ BitVec 64))

(declare-fun lt!444264 () (_ BitVec 64))

(assert (=> d!105124 (= res!263635 (= lt!444264 (bvsub lt!444262 lt!444263)))))

(assert (=> d!105124 (or (= (bvand lt!444262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444262 lt!444263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105124 (= lt!444263 (remainingBits!0 ((_ sign_extend 32) (size!8842 (buf!7984 thiss!1780))) ((_ sign_extend 32) (currentByte!14719 thiss!1780)) ((_ sign_extend 32) (currentBit!14714 thiss!1780))))))

(declare-fun lt!444265 () (_ BitVec 64))

(declare-fun lt!444266 () (_ BitVec 64))

(assert (=> d!105124 (= lt!444262 (bvmul lt!444265 lt!444266))))

(assert (=> d!105124 (or (= lt!444265 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444266 (bvsdiv (bvmul lt!444265 lt!444266) lt!444265)))))

(assert (=> d!105124 (= lt!444266 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105124 (= lt!444265 ((_ sign_extend 32) (size!8842 (buf!7984 thiss!1780))))))

(assert (=> d!105124 (= lt!444264 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14719 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14714 thiss!1780))))))

(assert (=> d!105124 (invariant!0 (currentBit!14714 thiss!1780) (currentByte!14719 thiss!1780) (size!8842 (buf!7984 thiss!1780)))))

(assert (=> d!105124 (= (bitIndex!0 (size!8842 (buf!7984 thiss!1780)) (currentByte!14719 thiss!1780) (currentBit!14714 thiss!1780)) lt!444264)))

(declare-fun b!320978 () Bool)

(declare-fun res!263634 () Bool)

(assert (=> b!320978 (=> (not res!263634) (not e!231130))))

(assert (=> b!320978 (= res!263634 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444264))))

(declare-fun b!320979 () Bool)

(declare-fun lt!444261 () (_ BitVec 64))

(assert (=> b!320979 (= e!231130 (bvsle lt!444264 (bvmul lt!444261 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320979 (or (= lt!444261 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444261 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444261)))))

(assert (=> b!320979 (= lt!444261 ((_ sign_extend 32) (size!8842 (buf!7984 thiss!1780))))))

(assert (= (and d!105124 res!263635) b!320978))

(assert (= (and b!320978 res!263634) b!320979))

(assert (=> d!105124 m!459295))

(assert (=> d!105124 m!459243))

(assert (=> b!320948 d!105124))

(declare-fun d!105126 () Bool)

(assert (=> d!105126 (= (onesLSBLong!0 #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!320946 d!105126))

(declare-fun d!105128 () Bool)

(assert (=> d!105128 (= (onesLSBLong!0 nBits!542) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!542))))))

(assert (=> b!320950 d!105128))

(declare-fun d!105132 () Bool)

(declare-fun e!231144 () Bool)

(assert (=> d!105132 e!231144))

(declare-fun res!263651 () Bool)

(assert (=> d!105132 (=> (not res!263651) (not e!231144))))

(declare-datatypes ((Unit!21996 0))(
  ( (Unit!21997) )
))
(declare-datatypes ((tuple2!23466 0))(
  ( (tuple2!23467 (_1!13362 Unit!21996) (_2!13362 BitStream!13846)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13846) tuple2!23466)

(assert (=> d!105132 (= res!263651 (= (buf!7984 (_2!13362 (increaseBitIndex!0 thiss!1780))) (buf!7984 thiss!1780)))))

(declare-fun lt!444320 () Bool)

(assert (=> d!105132 (= lt!444320 (not (= (bvand ((_ sign_extend 24) (select (arr!9934 (buf!7984 thiss!1780)) (currentByte!14719 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14714 thiss!1780)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444318 () tuple2!23456)

(assert (=> d!105132 (= lt!444318 (tuple2!23457 (not (= (bvand ((_ sign_extend 24) (select (arr!9934 (buf!7984 thiss!1780)) (currentByte!14719 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14714 thiss!1780)))) #b00000000000000000000000000000000)) (_2!13362 (increaseBitIndex!0 thiss!1780))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105132 (validate_offset_bit!0 ((_ sign_extend 32) (size!8842 (buf!7984 thiss!1780))) ((_ sign_extend 32) (currentByte!14719 thiss!1780)) ((_ sign_extend 32) (currentBit!14714 thiss!1780)))))

(assert (=> d!105132 (= (readBit!0 thiss!1780) lt!444318)))

(declare-fun b!320997 () Bool)

(declare-fun lt!444315 () (_ BitVec 64))

(declare-fun lt!444314 () (_ BitVec 64))

(assert (=> b!320997 (= e!231144 (= (bitIndex!0 (size!8842 (buf!7984 (_2!13362 (increaseBitIndex!0 thiss!1780)))) (currentByte!14719 (_2!13362 (increaseBitIndex!0 thiss!1780))) (currentBit!14714 (_2!13362 (increaseBitIndex!0 thiss!1780)))) (bvadd lt!444315 lt!444314)))))

(assert (=> b!320997 (or (not (= (bvand lt!444315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444315 lt!444314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!320997 (= lt!444314 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!320997 (= lt!444315 (bitIndex!0 (size!8842 (buf!7984 thiss!1780)) (currentByte!14719 thiss!1780) (currentBit!14714 thiss!1780)))))

(declare-fun lt!444317 () Bool)

(assert (=> b!320997 (= lt!444317 (not (= (bvand ((_ sign_extend 24) (select (arr!9934 (buf!7984 thiss!1780)) (currentByte!14719 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14714 thiss!1780)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444316 () Bool)

(assert (=> b!320997 (= lt!444316 (not (= (bvand ((_ sign_extend 24) (select (arr!9934 (buf!7984 thiss!1780)) (currentByte!14719 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14714 thiss!1780)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444319 () Bool)

(assert (=> b!320997 (= lt!444319 (not (= (bvand ((_ sign_extend 24) (select (arr!9934 (buf!7984 thiss!1780)) (currentByte!14719 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14714 thiss!1780)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105132 res!263651) b!320997))

(declare-fun m!459353 () Bool)

(assert (=> d!105132 m!459353))

(declare-fun m!459355 () Bool)

(assert (=> d!105132 m!459355))

(declare-fun m!459357 () Bool)

(assert (=> d!105132 m!459357))

(declare-fun m!459359 () Bool)

(assert (=> d!105132 m!459359))

(declare-fun m!459361 () Bool)

(assert (=> b!320997 m!459361))

(assert (=> b!320997 m!459357))

(assert (=> b!320997 m!459353))

(assert (=> b!320997 m!459283))

(assert (=> b!320997 m!459355))

(assert (=> b!320945 d!105132))

(declare-fun b!320998 () Bool)

(declare-fun e!231147 () tuple2!23444)

(assert (=> b!320998 (= e!231147 (tuple2!23445 (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13357 lt!444163) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13357 lt!444163)))))

(declare-fun b!320999 () Bool)

(declare-fun lt!444325 () tuple2!23444)

(assert (=> b!320999 (= e!231147 (tuple2!23445 (_1!13351 lt!444325) (_2!13351 lt!444325)))))

(declare-fun lt!444322 () tuple2!23456)

(assert (=> b!320999 (= lt!444322 (readBit!0 (_2!13357 lt!444163)))))

(assert (=> b!320999 (= lt!444325 (readNBitsLSBFirstsLoop!0 (_2!13357 lt!444322) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13357 lt!444163) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13357 lt!444322) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321000 () Bool)

(declare-fun res!263656 () Bool)

(declare-fun e!231145 () Bool)

(assert (=> b!321000 (=> (not res!263656) (not e!231145))))

(declare-fun lt!444323 () tuple2!23444)

(assert (=> b!321000 (= res!263656 (= (bvand (_1!13351 lt!444323) (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (bvand (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13357 lt!444163) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun b!321001 () Bool)

(declare-fun e!231146 () Bool)

(assert (=> b!321001 (= e!231145 e!231146)))

(declare-fun res!263652 () Bool)

(assert (=> b!321001 (=> res!263652 e!231146)))

(assert (=> b!321001 (= res!263652 (not (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!542)))))

(declare-fun d!105142 () Bool)

(assert (=> d!105142 e!231145))

(declare-fun res!263653 () Bool)

(assert (=> d!105142 (=> (not res!263653) (not e!231145))))

(assert (=> d!105142 (= res!263653 (= (buf!7984 (_2!13351 lt!444323)) (buf!7984 (_2!13357 lt!444163))))))

(assert (=> d!105142 (= lt!444323 e!231147)))

(declare-fun c!15385 () Bool)

(assert (=> d!105142 (= c!15385 (= nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!105142 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105142 (= (readNBitsLSBFirstsLoop!0 (_2!13357 lt!444163) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13357 lt!444163) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!444323)))

(declare-fun b!321002 () Bool)

(declare-fun res!263655 () Bool)

(assert (=> b!321002 (=> (not res!263655) (not e!231145))))

(declare-fun lt!444324 () (_ BitVec 64))

(declare-fun lt!444326 () (_ BitVec 64))

(assert (=> b!321002 (= res!263655 (= (bitIndex!0 (size!8842 (buf!7984 (_2!13351 lt!444323))) (currentByte!14719 (_2!13351 lt!444323)) (currentBit!14714 (_2!13351 lt!444323))) (bvadd lt!444324 lt!444326)))))

(assert (=> b!321002 (or (not (= (bvand lt!444324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444326 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444324 lt!444326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!321002 (= lt!444326 ((_ sign_extend 32) (bvsub nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!321002 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!321002 (= lt!444324 (bitIndex!0 (size!8842 (buf!7984 (_2!13357 lt!444163))) (currentByte!14719 (_2!13357 lt!444163)) (currentBit!14714 (_2!13357 lt!444163))))))

(declare-fun lt!444321 () (_ BitVec 64))

(declare-fun b!321003 () Bool)

(assert (=> b!321003 (= e!231146 (= (= (bvand (bvlshr (_1!13351 lt!444323) lt!444321) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13359 (readBitPure!0 (_2!13357 lt!444163)))))))

(assert (=> b!321003 (and (bvsge lt!444321 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444321 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!321003 (= lt!444321 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!321004 () Bool)

(declare-fun res!263654 () Bool)

(assert (=> b!321004 (=> (not res!263654) (not e!231145))))

(assert (=> b!321004 (= res!263654 (= (bvand (_1!13351 lt!444323) (onesLSBLong!0 nBits!542)) (_1!13351 lt!444323)))))

(assert (= (and d!105142 c!15385) b!320998))

(assert (= (and d!105142 (not c!15385)) b!320999))

(assert (= (and d!105142 res!263653) b!321002))

(assert (= (and b!321002 res!263655) b!321000))

(assert (= (and b!321000 res!263656) b!321004))

(assert (= (and b!321004 res!263654) b!321001))

(assert (= (and b!321001 (not res!263652)) b!321003))

(declare-fun m!459363 () Bool)

(assert (=> b!321002 m!459363))

(declare-fun m!459365 () Bool)

(assert (=> b!321002 m!459365))

(declare-fun m!459367 () Bool)

(assert (=> b!321003 m!459367))

(declare-fun m!459369 () Bool)

(assert (=> b!321000 m!459369))

(declare-fun m!459371 () Bool)

(assert (=> b!320999 m!459371))

(declare-fun m!459373 () Bool)

(assert (=> b!320999 m!459373))

(assert (=> b!321004 m!459293))

(assert (=> b!320945 d!105142))

(declare-fun d!105144 () Bool)

(assert (=> d!105144 (= (remainingBits!0 ((_ sign_extend 32) (size!8842 (buf!7984 thiss!1780))) ((_ sign_extend 32) (currentByte!14719 thiss!1780)) ((_ sign_extend 32) (currentBit!14714 thiss!1780))) (bvsub (bvmul ((_ sign_extend 32) (size!8842 (buf!7984 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14719 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14714 thiss!1780)))))))

(assert (=> d!105094 d!105144))

(declare-fun d!105146 () Bool)

(declare-fun lt!444329 () tuple2!23456)

(assert (=> d!105146 (= lt!444329 (readBit!0 thiss!1780))))

(assert (=> d!105146 (= (readBitPure!0 thiss!1780) (tuple2!23461 (_2!13357 lt!444329) (_1!13357 lt!444329)))))

(declare-fun bs!27647 () Bool)

(assert (= bs!27647 d!105146))

(assert (=> bs!27647 m!459289))

(assert (=> b!320949 d!105146))

(declare-fun d!105148 () Bool)

(assert (=> d!105148 (= (invariant!0 (currentBit!14714 thiss!1780) (currentByte!14719 thiss!1780) (size!8842 (buf!7984 thiss!1780))) (and (bvsge (currentBit!14714 thiss!1780) #b00000000000000000000000000000000) (bvslt (currentBit!14714 thiss!1780) #b00000000000000000000000000001000) (bvsge (currentByte!14719 thiss!1780) #b00000000000000000000000000000000) (or (bvslt (currentByte!14719 thiss!1780) (size!8842 (buf!7984 thiss!1780))) (and (= (currentBit!14714 thiss!1780) #b00000000000000000000000000000000) (= (currentByte!14719 thiss!1780) (size!8842 (buf!7984 thiss!1780)))))))))

(assert (=> d!105068 d!105148))

(push 1)

