; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45804 () Bool)

(assert start!45804)

(declare-fun res!186326 () Bool)

(declare-fun e!150219 () Bool)

(assert (=> start!45804 (=> (not res!186326) (not e!150219))))

(declare-fun v!319 () (_ BitVec 64))

(assert (=> start!45804 (= res!186326 (bvslt v!319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!45804 e!150219))

(assert (=> start!45804 true))

(declare-fun b!221250 () Bool)

(declare-fun lt!349235 () (_ BitVec 32))

(assert (=> b!221250 (= e!150219 (or (bvsle lt!349235 #b00000000000000000000000000000000) (bvsgt lt!349235 #b00000000000000000000000000001000)))))

(declare-fun GetBytesNeededForNegativeNumber!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> b!221250 (= lt!349235 (GetBytesNeededForNegativeNumber!0 v!319))))

(assert (= (and start!45804 res!186326) b!221250))

(declare-fun m!339963 () Bool)

(assert (=> b!221250 m!339963))

(check-sat (not b!221250))
(check-sat)
(get-model)

(declare-fun d!74573 () Bool)

(declare-fun lt!349282 () (_ BitVec 32))

(declare-datatypes ((Unit!15645 0))(
  ( (Unit!15646) )
))
(declare-datatypes ((tuple3!1032 0))(
  ( (tuple3!1033 (_1!10151 Unit!15645) (_2!10151 (_ BitVec 32)) (_3!658 Bool)) )
))
(declare-fun lt!349285 () tuple3!1032)

(assert (=> d!74573 (and (bvsgt lt!349282 #b00000000000000000000000000000000) (bvsle lt!349282 #b00000000000000000000000000001000) (_3!658 lt!349285))))

(declare-fun e!150230 () tuple3!1032)

(assert (=> d!74573 (= lt!349285 e!150230)))

(declare-fun c!10729 () Bool)

(declare-fun lt!349281 () (_ BitVec 32))

(assert (=> d!74573 (= c!10729 (bvslt lt!349281 #b00000000000000000000000001000000))))

(declare-fun lt!349284 () Bool)

(assert (=> d!74573 (= lt!349284 true)))

(declare-fun lt!349283 () (_ BitVec 32))

(assert (=> d!74573 (= lt!349281 (bvsub lt!349283 #b00000000000000000000000000000001))))

(assert (=> d!74573 (or (= (bvand lt!349283 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand lt!349283 #b10000000000000000000000000000000) (bvand (bvsub lt!349283 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun lt!349286 () (_ BitVec 32))

(assert (=> d!74573 (= lt!349283 (bvmul lt!349282 lt!349286))))

(assert (=> d!74573 (or (= lt!349282 #b00000000000000000000000000000000) (= lt!349286 (bvsdiv (bvmul lt!349282 lt!349286) lt!349282)))))

(assert (=> d!74573 (= lt!349286 #b00000000000000000000000000001000)))

(assert (=> d!74573 (= lt!349282 (ite (bvsge v!319 #b1111111111111111111111111111111111111111111111111111111110000000) #b00000000000000000000000000000001 (ite (bvsge v!319 #b1111111111111111111111111111111111111111111111111000000000000000) #b00000000000000000000000000000010 (ite (bvsge v!319 #b1111111111111111111111111111111111111111100000000000000000000000) #b00000000000000000000000000000011 (ite (bvsge v!319 #b1111111111111111111111111111111110000000000000000000000000000000) #b00000000000000000000000000000100 (ite (bvsge v!319 #b1111111111111111111111111000000000000000000000000000000000000000) #b00000000000000000000000000000101 (ite (bvsge v!319 #b1111111111111111100000000000000000000000000000000000000000000000) #b00000000000000000000000000000110 (ite (bvsge v!319 #b1111111110000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000111 #b00000000000000000000000000001000))))))))))

(assert (=> d!74573 (bvslt v!319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!74573 (= (GetBytesNeededForNegativeNumber!0 v!319) lt!349282)))

(declare-fun b!221268 () Bool)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1032)

(assert (=> b!221268 (= e!150230 (GetBytesNeededForNegativeNumberWhile!0 v!319 lt!349281 lt!349284))))

(declare-fun b!221269 () Bool)

(declare-fun Unit!15649 () Unit!15645)

(assert (=> b!221269 (= e!150230 (tuple3!1033 Unit!15649 lt!349281 lt!349284))))

(assert (= (and d!74573 c!10729) b!221268))

(assert (= (and d!74573 (not c!10729)) b!221269))

(declare-fun m!339969 () Bool)

(assert (=> b!221268 m!339969))

(assert (=> b!221250 d!74573))

(check-sat (not b!221268))
(check-sat)
