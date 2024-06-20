; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46040 () Bool)

(assert start!46040)

(declare-fun res!186798 () Bool)

(declare-fun e!151025 () Bool)

(assert (=> start!46040 (=> (not res!186798) (not e!151025))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!46040 (= res!186798 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111100000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111110000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46040 e!151025))

(assert (=> start!46040 true))

(declare-fun b!222390 () Bool)

(declare-datatypes ((Unit!16028 0))(
  ( (Unit!16029) )
))
(declare-datatypes ((tuple3!1132 0))(
  ( (tuple3!1133 (_1!10201 Unit!16028) (_2!10201 (_ BitVec 32)) (_3!708 Bool)) )
))
(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1132)

(assert (=> b!222390 (= e!151025 (not (_3!708 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000111111 true))))))

(assert (= (and start!46040 res!186798) b!222390))

(declare-fun m!340633 () Bool)

(assert (=> b!222390 m!340633))

(push 1)

(assert (not b!222390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75209 () Bool)

(declare-fun e!151039 () Bool)

(assert (=> d!75209 e!151039))

(declare-fun res!186804 () Bool)

(assert (=> d!75209 (=> (not res!186804) (not e!151039))))

(declare-fun lt!351355 () tuple3!1132)

(declare-fun lt!351358 () (_ BitVec 32))

(assert (=> d!75209 (= res!186804 (bvsge (_2!10201 lt!351355) (bvsub lt!351358 #b00000000000000000000000000000001)))))

(assert (=> d!75209 (or (= (bvand lt!351358 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand lt!351358 #b10000000000000000000000000000000) (bvand (bvsub lt!351358 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun lt!351356 () (_ BitVec 32))

(declare-fun lt!351357 () (_ BitVec 32))

(assert (=> d!75209 (= lt!351358 (bvmul lt!351356 lt!351357))))

(assert (=> d!75209 (or (= lt!351356 #b00000000000000000000000000000000) (= lt!351357 (bvsdiv (bvmul lt!351356 lt!351357) lt!351356)))))

(assert (=> d!75209 (= lt!351357 #b00000000000000000000000000001000)))

(declare-fun e!151038 () tuple3!1132)

(assert (=> d!75209 (= lt!351355 e!151038)))

(declare-fun c!11063 () Bool)

(declare-fun lt!351354 () (_ BitVec 32))

(assert (=> d!75209 (= c!11063 (bvslt lt!351354 #b00000000000000000000000001000000))))

(assert (=> d!75209 (= lt!351354 (bvadd #b00000000000000000000000000111111 #b00000000000000000000000000000001))))

(declare-fun lt!351353 () Bool)

(assert (=> d!75209 (= lt!351353 (not (= (bvand v!298 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000111111))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75209 (and (bvsge #b00000000000000000000000000111111 (bvsub (bvmul lt!351356 #b00000000000000000000000000001000) #b00000000000000000000000000000001)) (bvsle #b00000000000000000000000000111111 #b00000000000000000000000001000000) (bvslt #b00000000000000000000000000111111 #b00000000000000000000000001000000))))

(assert (=> d!75209 (= lt!351356 (ite (bvsge v!298 #b1111111111111111111111111111111111111111111111111111111110000000) #b00000000000000000000000000000001 (ite (bvsge v!298 #b1111111111111111111111111111111111111111111111111000000000000000) #b00000000000000000000000000000010 (ite (bvsge v!298 #b1111111111111111111111111111111111111111100000000000000000000000) #b00000000000000000000000000000011 (ite (bvsge v!298 #b1111111111111111111111111111111110000000000000000000000000000000) #b00000000000000000000000000000100 (ite (bvsge v!298 #b1111111111111111111111111000000000000000000000000000000000000000) #b00000000000000000000000000000101 (ite (bvsge v!298 #b1111111111111111100000000000000000000000000000000000000000000000) #b00000000000000000000000000000110 (ite (bvsge v!298 #b1111111110000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000111 #b00000000000000000000000000001000))))))))))

(assert (=> d!75209 (= (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000111111 true) lt!351355)))

(declare-fun b!222410 () Bool)

(assert (=> b!222410 (= e!151038 (GetBytesNeededForNegativeNumberWhile!0 v!298 lt!351354 lt!351353))))

(declare-fun b!222411 () Bool)

(declare-fun Unit!16032 () Unit!16028)

(assert (=> b!222411 (= e!151038 (tuple3!1133 Unit!16032 lt!351354 lt!351353))))

(declare-fun b!222412 () Bool)

(assert (=> b!222412 (= e!151039 (and (bvsle (_2!10201 lt!351355) #b00000000000000000000000001000000) (bvsge (_2!10201 lt!351355) #b00000000000000000000000001000000)))))

(assert (= (and d!75209 c!11063) b!222410))

(assert (= (and d!75209 (not c!11063)) b!222411))

(assert (= (and d!75209 res!186804) b!222412))

(declare-fun m!340637 () Bool)

(assert (=> b!222410 m!340637))

(assert (=> b!222390 d!75209))

(push 1)

(assert (not b!222410))

(check-sat)

