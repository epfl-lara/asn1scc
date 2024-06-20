; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!556 () Bool)

(assert start!556)

(declare-fun lt!1196 () (_ BitVec 32))

(declare-fun lt!1195 () (_ BitVec 32))

(assert (=> start!556 (= lt!1196 (bvand (bvadd #b00000000000000000000000000001000 lt!1195) #b10000000000000000000000000000000))))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!556 (= lt!1195 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!556 (and (not (= lt!1196 #b00000000000000000000000000000000)) (not (= lt!1196 (bvand (bvadd lt!1195 #b00000000000000000000000000000111) #b10000000000000000000000000000000))))))

(assert (=> start!556 true))

(declare-fun bs!467 () Bool)

(assert (= bs!467 start!556))

(declare-fun m!1197 () Bool)

(assert (=> bs!467 m!1197))

(push 1)

(assert (not start!556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1723 () Bool)

(declare-fun c!58 () Bool)

(declare-fun lt!1233 () (_ BitVec 32))

(assert (=> b!1723 (= c!58 (and (bvslt lt!1233 #b00000000000000000000000000111111) (not (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1723 (= lt!1233 #b00000000000000000000000000000000)))

(declare-fun e!1094 () (_ BitVec 32))

(declare-datatypes ((Unit!59 0))(
  ( (Unit!60) )
))
(declare-datatypes ((tuple3!4 0))(
  ( (tuple3!5 (_1!61 Unit!59) (_2!61 (_ BitVec 64)) (_3!2 (_ BitVec 32))) )
))
(declare-fun e!1097 () tuple3!4)

(assert (=> b!1723 (= e!1094 (_3!2 e!1097))))

(declare-fun b!1725 () Bool)

(declare-fun Unit!62 () Unit!59)

(assert (=> b!1725 (= e!1097 (tuple3!5 Unit!62 v!295 lt!1233))))

(declare-fun d!1270 () Bool)

(declare-fun e!1095 () Bool)

(assert (=> d!1270 e!1095))

(declare-fun res!3652 () Bool)

(assert (=> d!1270 (=> (not res!3652) (not e!1095))))

(declare-fun lt!1235 () (_ BitVec 32))

(assert (=> d!1270 (= res!3652 (and (bvsge lt!1235 #b00000000000000000000000000000000) (bvsle lt!1235 #b00000000000000000000000001000000)))))

(declare-fun e!1089 () (_ BitVec 32))

(assert (=> d!1270 (= lt!1235 e!1089)))

(declare-fun c!59 () Bool)

(declare-datatypes ((ControlFlow!6 0))(
  ( (Return!5 (value!176 (_ BitVec 32))) (Proceed!5 (value!177 Unit!59)) )
))
(declare-fun lt!1232 () ControlFlow!6)

(assert (=> d!1270 (= c!59 (is-Return!5 lt!1232))))

(declare-fun Unit!64 () Unit!59)

(assert (=> d!1270 (= lt!1232 (ite (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!5 #b00000000000000000000000001000000) (Proceed!5 Unit!64)))))

(assert (=> d!1270 (= (GetBitCountUnsigned!0 v!295) lt!1235)))

(declare-fun b!1727 () Bool)

(assert (=> b!1727 (= e!1089 (value!176 lt!1232))))

(declare-fun b!1729 () Bool)

(assert (=> b!1729 (= e!1089 e!1094)))

(declare-fun lt!1239 () ControlFlow!6)

(declare-fun Unit!65 () Unit!59)

(assert (=> b!1729 (= lt!1239 (ite (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!5 #b00000000000000000000000000000000) (Proceed!5 Unit!65)))))

(declare-fun c!62 () Bool)

(assert (=> b!1729 (= c!62 (is-Return!5 lt!1239))))

(declare-fun b!1731 () Bool)

(assert (=> b!1731 (= e!1094 (value!176 lt!1239))))

(declare-fun b!1733 () Bool)

(declare-fun e!1092 () Bool)

(declare-fun lt!1237 () (_ BitVec 64))

(assert (=> b!1733 (= e!1092 (= (bvlshr v!295 lt!1237) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1733 (and (bvsge lt!1237 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!1237 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!1733 (= lt!1237 ((_ sign_extend 32) lt!1235))))

(declare-fun b!1735 () Bool)

(declare-fun GetBitCountUnsignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple3!4)

(assert (=> b!1735 (= e!1097 (GetBitCountUnsignedWhile!0 v!295 lt!1233))))

(declare-fun b!1737 () Bool)

(assert (=> b!1737 (= e!1095 e!1092)))

(declare-fun res!3649 () Bool)

(assert (=> b!1737 (=> res!3649 e!1092)))

(assert (=> b!1737 (= res!3649 (and (= lt!1235 #b00000000000000000000000001000000) (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!1270 c!59) b!1727))

(assert (= (and d!1270 (not c!59)) b!1729))

(assert (= (and b!1729 c!62) b!1731))

(assert (= (and b!1729 (not c!62)) b!1723))

(assert (= (and b!1723 c!58) b!1735))

(assert (= (and b!1723 (not c!58)) b!1725))

(assert (= (and d!1270 res!3652) b!1737))

(assert (= (and b!1737 (not res!3649)) b!1733))

(declare-fun m!1203 () Bool)

(assert (=> b!1735 m!1203))

(assert (=> start!556 d!1270))

(push 1)

