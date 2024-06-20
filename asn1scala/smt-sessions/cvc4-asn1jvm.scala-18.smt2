; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!544 () Bool)

(assert start!544)

(declare-fun lt!1133 () (_ BitVec 32))

(declare-fun lt!1132 () (_ BitVec 32))

(assert (=> start!544 (= lt!1133 (bvand lt!1132 #b10000000000000000000000000000000))))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!544 (= lt!1132 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!544 (and (= lt!1133 #b00000000000000000000000000000000) (not (= lt!1133 (bvand (bvadd #b00000000000000000000000000001000 lt!1132) #b10000000000000000000000000000000))))))

(assert (=> start!544 true))

(declare-fun bs!461 () Bool)

(assert (= bs!461 start!544))

(declare-fun m!1185 () Bool)

(assert (=> bs!461 m!1185))

(push 1)

(assert (not start!544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1642 () Bool)

(declare-datatypes ((Unit!43 0))(
  ( (Unit!44) )
))
(declare-datatypes ((tuple3!0 0))(
  ( (tuple3!1 (_1!59 Unit!43) (_2!59 (_ BitVec 64)) (_3!0 (_ BitVec 32))) )
))
(declare-fun e!1045 () tuple3!0)

(declare-fun lt!1168 () (_ BitVec 32))

(declare-fun GetBitCountUnsignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple3!0)

(assert (=> b!1642 (= e!1045 (GetBitCountUnsignedWhile!0 v!295 lt!1168))))

(declare-fun b!1644 () Bool)

(declare-fun c!29 () Bool)

(assert (=> b!1644 (= c!29 (and (bvslt lt!1168 #b00000000000000000000000000111111) (not (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1644 (= lt!1168 #b00000000000000000000000000000000)))

(declare-fun e!1042 () (_ BitVec 32))

(assert (=> b!1644 (= e!1042 (_3!0 e!1045))))

(declare-fun b!1647 () Bool)

(declare-fun e!1047 () (_ BitVec 32))

(declare-datatypes ((ControlFlow!3 0))(
  ( (Return!2 (value!165 (_ BitVec 32))) (Proceed!2 (value!166 Unit!43)) )
))
(declare-fun lt!1169 () ControlFlow!3)

(assert (=> b!1647 (= e!1047 (value!165 lt!1169))))

(declare-fun b!1650 () Bool)

(declare-fun e!1039 () Bool)

(declare-fun e!1040 () Bool)

(assert (=> b!1650 (= e!1039 e!1040)))

(declare-fun res!3632 () Bool)

(assert (=> b!1650 (=> res!3632 e!1040)))

(declare-fun lt!1172 () (_ BitVec 32))

(assert (=> b!1650 (= res!3632 (and (= lt!1172 #b00000000000000000000000001000000) (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1652 () Bool)

(declare-fun lt!1165 () (_ BitVec 64))

(assert (=> b!1652 (= e!1040 (= (bvlshr v!295 lt!1165) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1652 (and (bvsge lt!1165 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!1165 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!1652 (= lt!1165 ((_ sign_extend 32) lt!1172))))

(declare-fun d!1262 () Bool)

(assert (=> d!1262 e!1039))

(declare-fun res!3630 () Bool)

(assert (=> d!1262 (=> (not res!3630) (not e!1039))))

(assert (=> d!1262 (= res!3630 (and (bvsge lt!1172 #b00000000000000000000000000000000) (bvsle lt!1172 #b00000000000000000000000001000000)))))

(assert (=> d!1262 (= lt!1172 e!1047)))

(declare-fun c!32 () Bool)

(assert (=> d!1262 (= c!32 (is-Return!2 lt!1169))))

(declare-fun Unit!50 () Unit!43)

(assert (=> d!1262 (= lt!1169 (ite (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!2 #b00000000000000000000000001000000) (Proceed!2 Unit!50)))))

(assert (=> d!1262 (= (GetBitCountUnsigned!0 v!295) lt!1172)))

(declare-fun b!1654 () Bool)

(declare-fun lt!1175 () ControlFlow!3)

(assert (=> b!1654 (= e!1042 (value!165 lt!1175))))

(declare-fun b!1660 () Bool)

(assert (=> b!1660 (= e!1047 e!1042)))

(declare-fun Unit!51 () Unit!43)

(assert (=> b!1660 (= lt!1175 (ite (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!2 #b00000000000000000000000000000000) (Proceed!2 Unit!51)))))

(declare-fun c!27 () Bool)

(assert (=> b!1660 (= c!27 (is-Return!2 lt!1175))))

(declare-fun b!1663 () Bool)

(declare-fun Unit!52 () Unit!43)

(assert (=> b!1663 (= e!1045 (tuple3!1 Unit!52 v!295 lt!1168))))

(assert (= (and d!1262 c!32) b!1647))

(assert (= (and d!1262 (not c!32)) b!1660))

(assert (= (and b!1660 c!27) b!1654))

(assert (= (and b!1660 (not c!27)) b!1644))

(assert (= (and b!1644 c!29) b!1642))

(assert (= (and b!1644 (not c!29)) b!1663))

(assert (= (and d!1262 res!3630) b!1650))

(assert (= (and b!1650 (not res!3632)) b!1652))

(declare-fun m!1190 () Bool)

(assert (=> b!1642 m!1190))

(assert (=> start!544 d!1262))

(push 1)

(assert (not b!1642))

(check-sat)

