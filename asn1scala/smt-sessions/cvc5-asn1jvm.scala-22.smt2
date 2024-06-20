; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!576 () Bool)

(assert start!576)

(declare-fun lt!1262 () (_ BitVec 32))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun max!5 ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!576 (= lt!1262 (max!5 (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001))))

(assert (=> start!576 (or (bvsle lt!1262 #b00000000000000000000000000000000) (bvsgt lt!1262 #b00000000000000000000000000001000))))

(assert (=> start!576 true))

(declare-fun bs!483 () Bool)

(assert (= bs!483 start!576))

(declare-fun m!1217 () Bool)

(assert (=> bs!483 m!1217))

(declare-fun m!1219 () Bool)

(assert (=> bs!483 m!1219))

(push 1)

(assert (not start!576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1282 () Bool)

(assert (=> d!1282 (= (max!5 (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001) (ite (bvsge (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001) (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001))))

(assert (=> start!576 d!1282))

(declare-fun d!1284 () Bool)

(declare-fun e!1131 () Bool)

(assert (=> d!1284 e!1131))

(declare-fun res!3663 () Bool)

(assert (=> d!1284 (=> (not res!3663) (not e!1131))))

(declare-fun lt!1306 () (_ BitVec 32))

(assert (=> d!1284 (= res!3663 (and (bvsge lt!1306 #b00000000000000000000000000000000) (bvsle lt!1306 #b00000000000000000000000001000000)))))

(declare-fun e!1129 () (_ BitVec 32))

(assert (=> d!1284 (= lt!1306 e!1129)))

(declare-fun c!84 () Bool)

(declare-datatypes ((Unit!71 0))(
  ( (Unit!72) )
))
