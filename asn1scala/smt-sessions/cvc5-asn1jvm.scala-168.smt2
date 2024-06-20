; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3752 () Bool)

(assert start!3752)

(declare-fun b!16226 () Bool)

(declare-fun e!10115 () Bool)

(declare-fun lt!24505 () (_ BitVec 64))

(assert (=> b!16226 (= e!10115 (or (bvslt lt!24505 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!24505 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-datatypes ((Unit!1392 0))(
  ( (Unit!1393) )
))
(declare-datatypes ((tuple2!2004 0))(
  ( (tuple2!2005 (_1!1063 Unit!1392) (_2!1063 (_ BitVec 32))) )
))
(declare-fun lt!24504 () tuple2!2004)

(assert (=> b!16226 (= lt!24505 ((_ sign_extend 32) (bvsub (_2!1063 lt!24504) #b00000000000000000000000000000001)))))

(declare-fun b!16223 () Bool)

(declare-fun e!10116 () tuple2!2004)

(declare-fun v!288 () (_ BitVec 64))

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!2004)

(assert (=> b!16223 (= e!10116 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16225 () Bool)

(declare-fun res!14897 () Bool)

(assert (=> b!16225 (=> (not res!14897) (not e!10115))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!16225 (= res!14897 (= (bvand v!288 (onesLSBLong!0 (_2!1063 lt!24504))) v!288))))

(declare-fun b!16224 () Bool)

(declare-fun Unit!1394 () Unit!1392)

(assert (=> b!16224 (= e!10116 (tuple2!2005 Unit!1394 #b00000000000000000000000001000000))))

(declare-fun res!14896 () Bool)

(assert (=> start!3752 (=> (not res!14896) (not e!10115))))

(assert (=> start!3752 (= res!14896 (and (bvsle #b00000000000000000000000000000000 (_2!1063 lt!24504)) (bvsle (_2!1063 lt!24504) #b00000000000000000000000001000000) (bvsge v!288 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3752 (= lt!24504 e!10116)))

(declare-fun c!1141 () Bool)

(assert (=> start!3752 (= c!1141 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3752 e!10115))

(assert (=> start!3752 true))

(assert (= (and start!3752 c!1141) b!16223))

(assert (= (and start!3752 (not c!1141)) b!16224))

(assert (= (and start!3752 res!14896) b!16225))

(assert (= (and b!16225 res!14897) b!16226))

(declare-fun m!22851 () Bool)

(assert (=> b!16223 m!22851))

(declare-fun m!22853 () Bool)

(assert (=> b!16225 m!22853))

(push 1)

(assert (not b!16225))

(assert (not b!16223))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5200 () Bool)

(assert (=> d!5200 (= (onesLSBLong!0 (_2!1063 lt!24504)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (_2!1063 lt!24504)))))))

(assert (=> b!16225 d!5200))

(declare-fun b!16259 () Bool)

(declare-fun e!10135 () tuple2!2004)

(declare-fun lt!24529 () (_ BitVec 32))

(assert (=> b!16259 (= e!10135 (GetBitCountSignedWhile!0 v!288 lt!24529))))

(declare-fun b!16262 () Bool)

(declare-fun lt!24528 () Bool)

(declare-fun e!10137 () Bool)

(declare-fun lt!24527 () (_ BitVec 64))

(assert (=> b!16262 (= e!10137 (not (= (not (= (bvand v!288 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 lt!24527)) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!24528)))))

(assert (=> b!16262 (and (bvsge lt!24527 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!24527 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!24526 () tuple2!2004)

(assert (=> b!16262 (= lt!24527 ((_ sign_extend 32) (bvsub (_2!1063 lt!24526) #b00000000000000000000000000000010)))))

(assert (=> b!16262 (or (= (bvand (_2!1063 lt!24526) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (_2!1063 lt!24526) #b10000000000000000000000000000000) (bvand (bvsub (_2!1063 lt!24526) #b00000000000000000000000000000010) #b10000000000000000000000000000000)))))

(declare-fun b!16261 () Bool)

(declare-fun e!10136 () Bool)

(assert (=> b!16261 (= e!10136 e!10137)))

(declare-fun res!14915 () Bool)

(assert (=> b!16261 (=> res!14915 e!10137)))

(assert (=> b!16261 (= res!14915 (bvslt (_2!1063 lt!24526) #b00000000000000000000000000000010))))

(declare-fun d!5202 () Bool)

(assert (=> d!5202 e!10136))

(declare-fun res!14914 () Bool)

(assert (=> d!5202 (=> (not res!14914) (not e!10136))))

(assert (=> d!5202 (= res!14914 (and (bvsge (_2!1063 lt!24526) #b00000000000000000000000000000001) (bvsle (_2!1063 lt!24526) #b00000000000000000000000001000000)))))

(assert (=> d!5202 (= lt!24526 e!10135)))

(declare-fun c!1150 () Bool)

(assert (=> d!5202 (= c!1150 (and (bvsge lt!24529 #b00000000000000000000000000000010) (= (not (= (bvand v!288 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub lt!24529 #b00000000000000000000000000000010)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!24528)))))

(assert (=> d!5202 (= lt!24529 (bvsub #b00000000000000000000000001000000 #b00000000000000000000000000000001))))

(assert (=> d!5202 (and (bvsge #b00000000000000000000000001000000 #b00000000000000000000000000000001) (bvsle #b00000000000000000000000001000000 #b00000000000000000000000001000000) (bvsge #b00000000000000000000000001000000 #b00000000000000000000000000000010) (= (not (= (bvand v!288 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 #b00000000000000000000000000000010)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!24528))))

(assert (=> d!5202 (= lt!24528 (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5202 (= (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000) lt!24526)))

(declare-fun b!16260 () Bool)

(declare-fun Unit!1402 () Unit!1392)

(assert (=> b!16260 (= e!10135 (tuple2!2005 Unit!1402 lt!24529))))

(assert (= (and d!5202 c!1150) b!16259))

(assert (= (and d!5202 (not c!1150)) b!16260))

(assert (= (and d!5202 res!14914) b!16261))

(assert (= (and b!16261 (not res!14915)) b!16262))

(declare-fun m!22863 () Bool)

(assert (=> b!16259 m!22863))

(assert (=> b!16223 d!5202))

(push 1)

(assert (not b!16259))

(check-sat)

(pop 1)

(push 1)

(check-sat)

