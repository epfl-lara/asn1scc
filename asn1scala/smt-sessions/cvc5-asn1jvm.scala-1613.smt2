; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45802 () Bool)

(assert start!45802)

(declare-fun res!186323 () Bool)

(declare-fun e!150216 () Bool)

(assert (=> start!45802 (=> (not res!186323) (not e!150216))))

(declare-fun v!319 () (_ BitVec 64))

(assert (=> start!45802 (= res!186323 (bvslt v!319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!45802 e!150216))

(assert (=> start!45802 true))

(declare-fun b!221247 () Bool)

(declare-fun lt!349232 () (_ BitVec 32))

(assert (=> b!221247 (= e!150216 (or (bvsle lt!349232 #b00000000000000000000000000000000) (bvsgt lt!349232 #b00000000000000000000000000001000)))))

(declare-fun GetBytesNeededForNegativeNumber!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> b!221247 (= lt!349232 (GetBytesNeededForNegativeNumber!0 v!319))))

(assert (= (and start!45802 res!186323) b!221247))

(declare-fun m!339961 () Bool)

(assert (=> b!221247 m!339961))

(push 1)

(assert (not b!221247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74571 () Bool)

(declare-fun lt!349254 () (_ BitVec 32))

(declare-datatypes ((Unit!15643 0))(
  ( (Unit!15644) )
))
(declare-datatypes ((tuple3!1036 0))(
  ( (tuple3!1037 (_1!10153 Unit!15643) (_2!10153 (_ BitVec 32)) (_3!660 Bool)) )
))
(declare-fun lt!349255 () tuple3!1036)

(assert (=> d!74571 (and (bvsgt lt!349254 #b00000000000000000000000000000000) (bvsle lt!349254 #b00000000000000000000000000001000) (_3!660 lt!349255))))

(declare-fun e!150225 () tuple3!1036)

(assert (=> d!74571 (= lt!349255 e!150225)))

(declare-fun c!10724 () Bool)

(declare-fun lt!349251 () (_ BitVec 32))

(assert (=> d!74571 (= c!10724 (bvslt lt!349251 #b00000000000000000000000001000000))))

(declare-fun lt!349253 () Bool)

(assert (=> d!74571 (= lt!349253 true)))

(declare-fun lt!349252 () (_ BitVec 32))

(assert (=> d!74571 (= lt!349251 (bvsub lt!349252 #b00000000000000000000000000000001))))

(assert (=> d!74571 (or (= (bvand lt!349252 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand lt!349252 #b10000000000000000000000000000000) (bvand (bvsub lt!349252 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun lt!349256 () (_ BitVec 32))

(assert (=> d!74571 (= lt!349252 (bvmul lt!349254 lt!349256))))

(assert (=> d!74571 (or (= lt!349254 #b00000000000000000000000000000000) (= lt!349256 (bvsdiv (bvmul lt!349254 lt!349256) lt!349254)))))

(assert (=> d!74571 (= lt!349256 #b00000000000000000000000000001000)))

(assert (=> d!74571 (= lt!349254 (ite (bvsge v!319 #b1111111111111111111111111111111111111111111111111111111110000000) #b00000000000000000000000000000001 (ite (bvsge v!319 #b1111111111111111111111111111111111111111111111111000000000000000) #b00000000000000000000000000000010 (ite (bvsge v!319 #b1111111111111111111111111111111111111111100000000000000000000000) #b00000000000000000000000000000011 (ite (bvsge v!319 #b1111111111111111111111111111111110000000000000000000000000000000) #b00000000000000000000000000000100 (ite (bvsge v!319 #b1111111111111111111111111000000000000000000000000000000000000000) #b00000000000000000000000000000101 (ite (bvsge v!319 #b1111111111111111100000000000000000000000000000000000000000000000) #b00000000000000000000000000000110 (ite (bvsge v!319 #b1111111110000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000111 #b00000000000000000000000000001000))))))))))

(assert (=> d!74571 (bvslt v!319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!74571 (= (GetBytesNeededForNegativeNumber!0 v!319) lt!349254)))

(declare-fun b!221258 () Bool)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1036)

(assert (=> b!221258 (= e!150225 (GetBytesNeededForNegativeNumberWhile!0 v!319 lt!349251 lt!349253))))

(declare-fun b!221259 () Bool)

(declare-fun Unit!15651 () Unit!15643)

(assert (=> b!221259 (= e!150225 (tuple3!1037 Unit!15651 lt!349251 lt!349253))))

(assert (= (and d!74571 c!10724) b!221258))

(assert (= (and d!74571 (not c!10724)) b!221259))

(declare-fun m!339967 () Bool)

(assert (=> b!221258 m!339967))

(assert (=> b!221247 d!74571))

(push 1)

(assert (not b!221258))

(check-sat)

