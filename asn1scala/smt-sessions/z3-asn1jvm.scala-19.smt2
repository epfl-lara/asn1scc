; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!554 () Bool)

(assert start!554)

(declare-fun lt!1190 () (_ BitVec 32))

(declare-fun lt!1189 () (_ BitVec 32))

(assert (=> start!554 (= lt!1190 (bvand (bvadd #b00000000000000000000000000001000 lt!1189) #b10000000000000000000000000000000))))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!554 (= lt!1189 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!554 (and (not (= lt!1190 #b00000000000000000000000000000000)) (not (= lt!1190 (bvand (bvadd lt!1189 #b00000000000000000000000000000111) #b10000000000000000000000000000000))))))

(assert (=> start!554 true))

(declare-fun bs!466 () Bool)

(assert (= bs!466 start!554))

(declare-fun m!1195 () Bool)

(assert (=> bs!466 m!1195))

(check-sat (not start!554))
(check-sat)
(get-model)

(declare-fun b!1722 () Bool)

(declare-fun e!1096 () (_ BitVec 32))

(declare-datatypes ((Unit!57 0))(
  ( (Unit!58) )
))
(declare-datatypes ((ControlFlow!5 0))(
  ( (Return!4 (value!174 (_ BitVec 32))) (Proceed!4 (value!175 Unit!57)) )
))
(declare-fun lt!1234 () ControlFlow!5)

(assert (=> b!1722 (= e!1096 (value!174 lt!1234))))

(declare-fun b!1724 () Bool)

(declare-datatypes ((tuple3!6 0))(
  ( (tuple3!7 (_1!62 Unit!57) (_2!62 (_ BitVec 64)) (_3!3 (_ BitVec 32))) )
))
(declare-fun e!1093 () tuple3!6)

(declare-fun lt!1238 () (_ BitVec 32))

(declare-fun Unit!61 () Unit!57)

(assert (=> b!1724 (= e!1093 (tuple3!7 Unit!61 v!295 lt!1238))))

(declare-fun b!1726 () Bool)

(declare-fun e!1090 () Bool)

(declare-fun e!1088 () Bool)

(assert (=> b!1726 (= e!1090 e!1088)))

(declare-fun res!3650 () Bool)

(assert (=> b!1726 (=> res!3650 e!1088)))

(declare-fun lt!1240 () (_ BitVec 32))

(assert (=> b!1726 (= res!3650 (and (= lt!1240 #b00000000000000000000000001000000) (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1728 () Bool)

(declare-fun GetBitCountUnsignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple3!6)

(assert (=> b!1728 (= e!1093 (GetBitCountUnsignedWhile!0 v!295 lt!1238))))

(declare-fun b!1730 () Bool)

(declare-fun lt!1241 () (_ BitVec 64))

(assert (=> b!1730 (= e!1088 (= (bvlshr v!295 lt!1241) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1730 (and (bvsge lt!1241 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!1241 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!1730 (= lt!1241 ((_ sign_extend 32) lt!1240))))

(declare-fun b!1732 () Bool)

(declare-fun e!1091 () (_ BitVec 32))

(declare-fun lt!1236 () ControlFlow!5)

(assert (=> b!1732 (= e!1091 (value!174 lt!1236))))

(declare-fun b!1734 () Bool)

(assert (=> b!1734 (= e!1096 e!1091)))

(declare-fun Unit!63 () Unit!57)

(assert (=> b!1734 (= lt!1236 (ite (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!4 #b00000000000000000000000000000000) (Proceed!4 Unit!63)))))

(declare-fun c!60 () Bool)

(get-info :version)

(assert (=> b!1734 (= c!60 ((_ is Return!4) lt!1236))))

(declare-fun b!1736 () Bool)

(declare-fun c!61 () Bool)

(assert (=> b!1736 (= c!61 (and (bvslt lt!1238 #b00000000000000000000000000111111) (not (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1736 (= lt!1238 #b00000000000000000000000000000000)))

(assert (=> b!1736 (= e!1091 (_3!3 e!1093))))

(declare-fun d!1266 () Bool)

(assert (=> d!1266 e!1090))

(declare-fun res!3651 () Bool)

(assert (=> d!1266 (=> (not res!3651) (not e!1090))))

(assert (=> d!1266 (= res!3651 (and (bvsge lt!1240 #b00000000000000000000000000000000) (bvsle lt!1240 #b00000000000000000000000001000000)))))

(assert (=> d!1266 (= lt!1240 e!1096)))

(declare-fun c!57 () Bool)

(assert (=> d!1266 (= c!57 ((_ is Return!4) lt!1234))))

(declare-fun Unit!66 () Unit!57)

(assert (=> d!1266 (= lt!1234 (ite (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!4 #b00000000000000000000000001000000) (Proceed!4 Unit!66)))))

(assert (=> d!1266 (= (GetBitCountUnsigned!0 v!295) lt!1240)))

(assert (= (and d!1266 c!57) b!1722))

(assert (= (and d!1266 (not c!57)) b!1734))

(assert (= (and b!1734 c!60) b!1732))

(assert (= (and b!1734 (not c!60)) b!1736))

(assert (= (and b!1736 c!61) b!1728))

(assert (= (and b!1736 (not c!61)) b!1724))

(assert (= (and d!1266 res!3651) b!1726))

(assert (= (and b!1726 (not res!3650)) b!1730))

(declare-fun m!1202 () Bool)

(assert (=> b!1728 m!1202))

(assert (=> start!554 d!1266))

(check-sat (not b!1728))
(check-sat)
