; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45806 () Bool)

(assert start!45806)

(declare-fun res!186329 () Bool)

(declare-fun e!150222 () Bool)

(assert (=> start!45806 (=> (not res!186329) (not e!150222))))

(declare-fun v!319 () (_ BitVec 64))

(assert (=> start!45806 (= res!186329 (bvslt v!319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!45806 e!150222))

(assert (=> start!45806 true))

(declare-fun b!221253 () Bool)

(declare-fun lt!349238 () (_ BitVec 32))

(assert (=> b!221253 (= e!150222 (or (bvsle lt!349238 #b00000000000000000000000000000000) (bvsgt lt!349238 #b00000000000000000000000000001000)))))

(declare-fun GetBytesNeededForNegativeNumber!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> b!221253 (= lt!349238 (GetBytesNeededForNegativeNumber!0 v!319))))

(assert (= (and start!45806 res!186329) b!221253))

(declare-fun m!339965 () Bool)

(assert (=> b!221253 m!339965))

(push 1)

(assert (not b!221253))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74575 () Bool)

(declare-fun lt!349289 () (_ BitVec 32))

(declare-datatypes ((Unit!15647 0))(
  ( (Unit!15648) )
))
(declare-datatypes ((tuple3!1034 0))(
  ( (tuple3!1035 (_1!10152 Unit!15647) (_2!10152 (_ BitVec 32)) (_3!659 Bool)) )
))
(declare-fun lt!349288 () tuple3!1034)

(assert (=> d!74575 (and (bvsgt lt!349289 #b00000000000000000000000000000000) (bvsle lt!349289 #b00000000000000000000000000001000) (_3!659 lt!349288))))

(declare-fun e!150231 () tuple3!1034)

(assert (=> d!74575 (= lt!349288 e!150231)))

(declare-fun c!10730 () Bool)

(declare-fun lt!349290 () (_ BitVec 32))

(assert (=> d!74575 (= c!10730 (bvslt lt!349290 #b00000000000000000000000001000000))))

(declare-fun lt!349291 () Bool)

(assert (=> d!74575 (= lt!349291 true)))

(declare-fun lt!349292 () (_ BitVec 32))

(assert (=> d!74575 (= lt!349290 (bvsub lt!349292 #b00000000000000000000000000000001))))

(assert (=> d!74575 (or (= (bvand lt!349292 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand lt!349292 #b10000000000000000000000000000000) (bvand (bvsub lt!349292 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun lt!349287 () (_ BitVec 32))

(assert (=> d!74575 (= lt!349292 (bvmul lt!349289 lt!349287))))

(assert (=> d!74575 (or (= lt!349289 #b00000000000000000000000000000000) (= lt!349287 (bvsdiv (bvmul lt!349289 lt!349287) lt!349289)))))

(assert (=> d!74575 (= lt!349287 #b00000000000000000000000000001000)))

(assert (=> d!74575 (= lt!349289 (ite (bvsge v!319 #b1111111111111111111111111111111111111111111111111111111110000000) #b00000000000000000000000000000001 (ite (bvsge v!319 #b1111111111111111111111111111111111111111111111111000000000000000) #b00000000000000000000000000000010 (ite (bvsge v!319 #b1111111111111111111111111111111111111111100000000000000000000000) #b00000000000000000000000000000011 (ite (bvsge v!319 #b1111111111111111111111111111111110000000000000000000000000000000) #b00000000000000000000000000000100 (ite (bvsge v!319 #b1111111111111111111111111000000000000000000000000000000000000000) #b00000000000000000000000000000101 (ite (bvsge v!319 #b1111111111111111100000000000000000000000000000000000000000000000) #b00000000000000000000000000000110 (ite (bvsge v!319 #b1111111110000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000111 #b00000000000000000000000000001000))))))))))

(assert (=> d!74575 (bvslt v!319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!74575 (= (GetBytesNeededForNegativeNumber!0 v!319) lt!349289)))

(declare-fun b!221270 () Bool)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1034)

(assert (=> b!221270 (= e!150231 (GetBytesNeededForNegativeNumberWhile!0 v!319 lt!349290 lt!349291))))

(declare-fun b!221271 () Bool)

(declare-fun Unit!15650 () Unit!15647)

(assert (=> b!221271 (= e!150231 (tuple3!1035 Unit!15650 lt!349290 lt!349291))))

(assert (= (and d!74575 c!10730) b!221270))

(assert (= (and d!74575 (not c!10730)) b!221271))

(declare-fun m!339971 () Bool)

(assert (=> b!221270 m!339971))

(assert (=> b!221253 d!74575))

(push 1)

(assert (not b!221270))

(check-sat)

