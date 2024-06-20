; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3726 () Bool)

(assert start!3726)

(declare-fun b!16141 () Bool)

(declare-fun res!14854 () Bool)

(declare-fun e!10065 () Bool)

(assert (=> b!16141 (=> (not res!14854) (not e!10065))))

(declare-datatypes ((Unit!1377 0))(
  ( (Unit!1378) )
))
(declare-datatypes ((tuple2!1996 0))(
  ( (tuple2!1997 (_1!1059 Unit!1377) (_2!1059 (_ BitVec 32))) )
))
(declare-fun lt!24454 () tuple2!1996)

(declare-fun v!288 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!16141 (= res!14854 (= (bvor (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (_2!1059 lt!24454))) (bvand v!288 (onesLSBLong!0 (_2!1059 lt!24454)))) v!288))))

(declare-fun res!14855 () Bool)

(assert (=> start!3726 (=> (not res!14855) (not e!10065))))

(assert (=> start!3726 (= res!14855 (and (bvsle #b00000000000000000000000000000000 (_2!1059 lt!24454)) (bvsle (_2!1059 lt!24454) #b00000000000000000000000001000000) (bvslt v!288 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!10064 () tuple2!1996)

(assert (=> start!3726 (= lt!24454 e!10064)))

(declare-fun c!1120 () Bool)

(assert (=> start!3726 (= c!1120 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3726 e!10065))

(assert (=> start!3726 true))

(declare-fun b!16139 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1996)

(assert (=> b!16139 (= e!10064 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16142 () Bool)

(declare-fun lt!24453 () (_ BitVec 64))

(assert (=> b!16142 (= e!10065 (or (bvslt lt!24453 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!24453 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(assert (=> b!16142 (= lt!24453 ((_ sign_extend 32) (bvsub (_2!1059 lt!24454) #b00000000000000000000000000000001)))))

(declare-fun b!16140 () Bool)

(declare-fun Unit!1379 () Unit!1377)

(assert (=> b!16140 (= e!10064 (tuple2!1997 Unit!1379 #b00000000000000000000000001000000))))

(assert (= (and start!3726 c!1120) b!16139))

(assert (= (and start!3726 (not c!1120)) b!16140))

(assert (= (and start!3726 res!14855) b!16141))

(assert (= (and b!16141 res!14854) b!16142))

(declare-fun m!22827 () Bool)

(assert (=> b!16141 m!22827))

(declare-fun m!22829 () Bool)

(assert (=> b!16141 m!22829))

(declare-fun m!22831 () Bool)

(assert (=> b!16139 m!22831))

(push 1)

(assert (not b!16139))

(assert (not b!16141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!16165 () Bool)

(declare-fun e!10082 () Bool)

(declare-fun e!10083 () Bool)

(assert (=> b!16165 (= e!10082 e!10083)))

(declare-fun res!14867 () Bool)

(assert (=> b!16165 (=> res!14867 e!10083)))

(declare-fun lt!24476 () tuple2!1996)

(assert (=> b!16165 (= res!14867 (bvslt (_2!1059 lt!24476) #b00000000000000000000000000000010))))

(declare-fun b!16164 () Bool)

(declare-fun e!10081 () tuple2!1996)

(declare-fun lt!24475 () (_ BitVec 32))

(declare-fun Unit!1381 () Unit!1377)

(assert (=> b!16164 (= e!10081 (tuple2!1997 Unit!1381 lt!24475))))

(declare-fun b!16163 () Bool)

(assert (=> b!16163 (= e!10081 (GetBitCountSignedWhile!0 v!288 lt!24475))))

(declare-fun lt!24477 () (_ BitVec 64))

(declare-fun b!16166 () Bool)

(declare-fun lt!24478 () Bool)

(assert (=> b!16166 (= e!10083 (not (= (not (= (bvand v!288 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 lt!24477)) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!24478)))))

(assert (=> b!16166 (and (bvsge lt!24477 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!24477 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!16166 (= lt!24477 ((_ sign_extend 32) (bvsub (_2!1059 lt!24476) #b00000000000000000000000000000010)))))

(assert (=> b!16166 (or (= (bvand (_2!1059 lt!24476) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (_2!1059 lt!24476) #b10000000000000000000000000000000) (bvand (bvsub (_2!1059 lt!24476) #b00000000000000000000000000000010) #b10000000000000000000000000000000)))))

(declare-fun d!5180 () Bool)

(assert (=> d!5180 e!10082))

(declare-fun res!14866 () Bool)

(assert (=> d!5180 (=> (not res!14866) (not e!10082))))

(assert (=> d!5180 (= res!14866 (and (bvsge (_2!1059 lt!24476) #b00000000000000000000000000000001) (bvsle (_2!1059 lt!24476) #b00000000000000000000000001000000)))))

(assert (=> d!5180 (= lt!24476 e!10081)))

(declare-fun c!1126 () Bool)

(assert (=> d!5180 (= c!1126 (and (bvsge lt!24475 #b00000000000000000000000000000010) (= (not (= (bvand v!288 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub lt!24475 #b00000000000000000000000000000010)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!24478)))))

(assert (=> d!5180 (= lt!24475 (bvsub #b00000000000000000000000001000000 #b00000000000000000000000000000001))))

(assert (=> d!5180 (and (bvsge #b00000000000000000000000001000000 #b00000000000000000000000000000001) (bvsle #b00000000000000000000000001000000 #b00000000000000000000000001000000) (bvsge #b00000000000000000000000001000000 #b00000000000000000000000000000010) (= (not (= (bvand v!288 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 #b00000000000000000000000000000010)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!24478))))

(assert (=> d!5180 (= lt!24478 (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5180 (= (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000) lt!24476)))

(assert (= (and d!5180 c!1126) b!16163))

(assert (= (and d!5180 (not c!1126)) b!16164))

(assert (= (and d!5180 res!14866) b!16165))

(assert (= (and b!16165 (not res!14867)) b!16166))

(declare-fun m!22835 () Bool)

(assert (=> b!16163 m!22835))

(assert (=> b!16139 d!5180))

(declare-fun d!5188 () Bool)

(assert (=> d!5188 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (_2!1059 lt!24454))) (ite (= (bvsub #b00000000000000000000000001000000 (_2!1059 lt!24454)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 (_2!1059 lt!24454)))))))))

(assert (=> b!16141 d!5188))

(declare-fun d!5190 () Bool)

(assert (=> d!5190 (= (onesLSBLong!0 (_2!1059 lt!24454)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (_2!1059 lt!24454)))))))

(assert (=> b!16141 d!5190))

(push 1)

(assert (not b!16163))

(check-sat)

