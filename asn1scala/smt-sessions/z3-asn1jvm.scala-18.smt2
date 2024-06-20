; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!542 () Bool)

(assert start!542)

(declare-fun lt!1127 () (_ BitVec 32))

(declare-fun lt!1126 () (_ BitVec 32))

(assert (=> start!542 (= lt!1127 (bvand lt!1126 #b10000000000000000000000000000000))))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!542 (= lt!1126 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!542 (and (= lt!1127 #b00000000000000000000000000000000) (not (= lt!1127 (bvand (bvadd #b00000000000000000000000000001000 lt!1126) #b10000000000000000000000000000000))))))

(assert (=> start!542 true))

(declare-fun bs!460 () Bool)

(assert (= bs!460 start!542))

(declare-fun m!1183 () Bool)

(assert (=> bs!460 m!1183))

(check-sat (not start!542))
(check-sat)
(get-model)

(declare-fun b!1653 () Bool)

(declare-fun e!1052 () Bool)

(declare-fun e!1049 () Bool)

(assert (=> b!1653 (= e!1052 e!1049)))

(declare-fun res!3634 () Bool)

(assert (=> b!1653 (=> res!3634 e!1049)))

(declare-fun lt!1177 () (_ BitVec 32))

(assert (=> b!1653 (= res!3634 (and (= lt!1177 #b00000000000000000000000001000000) (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1655 () Bool)

(declare-fun e!1046 () (_ BitVec 32))

(declare-datatypes ((Unit!47 0))(
  ( (Unit!48) )
))
(declare-datatypes ((ControlFlow!2 0))(
  ( (Return!1 (value!163 (_ BitVec 32))) (Proceed!1 (value!164 Unit!47)) )
))
(declare-fun lt!1173 () ControlFlow!2)

(assert (=> b!1655 (= e!1046 (value!163 lt!1173))))

(declare-fun b!1656 () Bool)

(declare-fun e!1050 () (_ BitVec 32))

(assert (=> b!1656 (= e!1046 e!1050)))

(declare-fun lt!1178 () ControlFlow!2)

(declare-fun Unit!49 () Unit!47)

(assert (=> b!1656 (= lt!1178 (ite (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!1 #b00000000000000000000000000000000) (Proceed!1 Unit!49)))))

(declare-fun c!34 () Bool)

(get-info :version)

(assert (=> b!1656 (= c!34 ((_ is Return!1) lt!1178))))

(declare-fun d!1261 () Bool)

(assert (=> d!1261 e!1052))

(declare-fun res!3633 () Bool)

(assert (=> d!1261 (=> (not res!3633) (not e!1052))))

(assert (=> d!1261 (= res!3633 (and (bvsge lt!1177 #b00000000000000000000000000000000) (bvsle lt!1177 #b00000000000000000000000001000000)))))

(assert (=> d!1261 (= lt!1177 e!1046)))

(declare-fun c!31 () Bool)

(assert (=> d!1261 (= c!31 ((_ is Return!1) lt!1173))))

(declare-fun Unit!53 () Unit!47)

(assert (=> d!1261 (= lt!1173 (ite (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!1 #b00000000000000000000000001000000) (Proceed!1 Unit!53)))))

(assert (=> d!1261 (= (GetBitCountUnsigned!0 v!295) lt!1177)))

(declare-fun b!1657 () Bool)

(declare-datatypes ((tuple3!2 0))(
  ( (tuple3!3 (_1!60 Unit!47) (_2!60 (_ BitVec 64)) (_3!1 (_ BitVec 32))) )
))
(declare-fun e!1051 () tuple3!2)

(declare-fun lt!1176 () (_ BitVec 32))

(declare-fun Unit!54 () Unit!47)

(assert (=> b!1657 (= e!1051 (tuple3!3 Unit!54 v!295 lt!1176))))

(declare-fun b!1658 () Bool)

(declare-fun c!35 () Bool)

(assert (=> b!1658 (= c!35 (and (bvslt lt!1176 #b00000000000000000000000000111111) (not (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1658 (= lt!1176 #b00000000000000000000000000000000)))

(assert (=> b!1658 (= e!1050 (_3!1 e!1051))))

(declare-fun b!1661 () Bool)

(assert (=> b!1661 (= e!1050 (value!163 lt!1178))))

(declare-fun b!1664 () Bool)

(declare-fun GetBitCountUnsignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple3!2)

(assert (=> b!1664 (= e!1051 (GetBitCountUnsignedWhile!0 v!295 lt!1176))))

(declare-fun b!1665 () Bool)

(declare-fun lt!1174 () (_ BitVec 64))

(assert (=> b!1665 (= e!1049 (= (bvlshr v!295 lt!1174) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1665 (and (bvsge lt!1174 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!1174 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!1665 (= lt!1174 ((_ sign_extend 32) lt!1177))))

(assert (= (and d!1261 c!31) b!1655))

(assert (= (and d!1261 (not c!31)) b!1656))

(assert (= (and b!1656 c!34) b!1661))

(assert (= (and b!1656 (not c!34)) b!1658))

(assert (= (and b!1658 c!35) b!1664))

(assert (= (and b!1658 (not c!35)) b!1657))

(assert (= (and d!1261 res!3633) b!1653))

(assert (= (and b!1653 (not res!3634)) b!1665))

(declare-fun m!1191 () Bool)

(assert (=> b!1664 m!1191))

(assert (=> start!542 d!1261))

(check-sat (not b!1664))
(check-sat)
