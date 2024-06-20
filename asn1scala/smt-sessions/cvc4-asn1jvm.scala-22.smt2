; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!580 () Bool)

(assert start!580)

(declare-fun lt!1268 () (_ BitVec 32))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun max!5 ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!580 (= lt!1268 (max!5 (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001))))

(assert (=> start!580 (or (bvsle lt!1268 #b00000000000000000000000000000000) (bvsgt lt!1268 #b00000000000000000000000000001000))))

(assert (=> start!580 true))

(declare-fun bs!485 () Bool)

(assert (= bs!485 start!580))

(declare-fun m!1225 () Bool)

(assert (=> bs!485 m!1225))

(declare-fun m!1227 () Bool)

(assert (=> bs!485 m!1227))

(push 1)

(assert (not start!580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1286 () Bool)

(assert (=> d!1286 (= (max!5 (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001) (ite (bvsge (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001) (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001))))

(assert (=> start!580 d!1286))

(declare-fun b!1802 () Bool)

(declare-fun e!1141 () (_ BitVec 32))

(declare-fun e!1140 () (_ BitVec 32))

(assert (=> b!1802 (= e!1141 e!1140)))

(declare-datatypes ((Unit!74 0))(
  ( (Unit!75) )
))
(declare-datatypes ((ControlFlow!8 0))(
  ( (Return!7 (value!195 (_ BitVec 32))) (Proceed!7 (value!196 Unit!74)) )
))
(declare-fun lt!1311 () ControlFlow!8)

(declare-fun Unit!76 () Unit!74)

(assert (=> b!1802 (= lt!1311 (ite (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!7 #b00000000000000000000000000000000) (Proceed!7 Unit!76)))))

(declare-fun c!87 () Bool)

(assert (=> b!1802 (= c!87 (is-Return!7 lt!1311))))

(declare-fun b!1803 () Bool)

(declare-fun c!88 () Bool)

(declare-fun lt!1313 () (_ BitVec 32))

(assert (=> b!1803 (= c!88 (and (bvslt lt!1313 #b00000000000000000000000000111111) (not (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1803 (= lt!1313 #b00000000000000000000000000000000)))

(declare-datatypes ((tuple3!12 0))(
  ( (tuple3!13 (_1!65 Unit!74) (_2!65 (_ BitVec 64)) (_3!6 (_ BitVec 32))) )
))
(declare-fun e!1142 () tuple3!12)

(assert (=> b!1803 (= e!1140 (_3!6 e!1142))))

(declare-fun d!1288 () Bool)

(declare-fun e!1138 () Bool)

(assert (=> d!1288 e!1138))

(declare-fun res!3670 () Bool)

(assert (=> d!1288 (=> (not res!3670) (not e!1138))))

(declare-fun lt!1312 () (_ BitVec 32))

(assert (=> d!1288 (= res!3670 (and (bvsge lt!1312 #b00000000000000000000000000000000) (bvsle lt!1312 #b00000000000000000000000001000000)))))

(assert (=> d!1288 (= lt!1312 e!1141)))

(declare-fun c!89 () Bool)

(declare-fun lt!1310 () ControlFlow!8)

(assert (=> d!1288 (= c!89 (is-Return!7 lt!1310))))

(declare-fun Unit!77 () Unit!74)

(assert (=> d!1288 (= lt!1310 (ite (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!7 #b00000000000000000000000001000000) (Proceed!7 Unit!77)))))

(assert (=> d!1288 (= (GetBitCountUnsigned!0 v!295) lt!1312)))

(declare-fun b!1804 () Bool)

(declare-fun e!1139 () Bool)

(declare-fun lt!1309 () (_ BitVec 64))

(assert (=> b!1804 (= e!1139 (= (bvlshr v!295 lt!1309) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1804 (and (bvsge lt!1309 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!1309 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!1804 (= lt!1309 ((_ sign_extend 32) lt!1312))))

(declare-fun b!1805 () Bool)

(assert (=> b!1805 (= e!1141 (value!195 lt!1310))))

(declare-fun b!1806 () Bool)

(assert (=> b!1806 (= e!1140 (value!195 lt!1311))))

(declare-fun b!1807 () Bool)

(assert (=> b!1807 (= e!1138 e!1139)))

(declare-fun res!3669 () Bool)

(assert (=> b!1807 (=> res!3669 e!1139)))

(assert (=> b!1807 (= res!3669 (and (= lt!1312 #b00000000000000000000000001000000) (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1808 () Bool)

(declare-fun Unit!78 () Unit!74)

(assert (=> b!1808 (= e!1142 (tuple3!13 Unit!78 v!295 lt!1313))))

(declare-fun b!1809 () Bool)

(declare-fun GetBitCountUnsignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple3!12)

(assert (=> b!1809 (= e!1142 (GetBitCountUnsignedWhile!0 v!295 lt!1313))))

(assert (= (and d!1288 c!89) b!1805))

(assert (= (and d!1288 (not c!89)) b!1802))

(assert (= (and b!1802 c!87) b!1806))

(assert (= (and b!1802 (not c!87)) b!1803))

(assert (= (and b!1803 c!88) b!1809))

(assert (= (and b!1803 (not c!88)) b!1808))

(assert (= (and d!1288 res!3670) b!1807))

(assert (= (and b!1807 (not res!3669)) b!1804))

(declare-fun m!1233 () Bool)

(assert (=> b!1809 m!1233))

(assert (=> start!580 d!1288))

(push 1)

