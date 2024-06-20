; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62272 () Bool)

(assert start!62272)

(declare-fun res!231921 () Bool)

(declare-fun e!199092 () Bool)

(assert (=> start!62272 (=> (not res!231921) (not e!199092))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16124 0))(
  ( (array!16125 (arr!7974 (Array (_ BitVec 32) (_ BitVec 8))) (size!6978 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16124)

(declare-fun a2!699 () array!16124)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62272 (= res!231921 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6978 a1!699) (size!6978 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6978 a1!699))))))))

(assert (=> start!62272 e!199092))

(assert (=> start!62272 true))

(declare-fun array_inv!6702 (array!16124) Bool)

(assert (=> start!62272 (array_inv!6702 a1!699)))

(assert (=> start!62272 (array_inv!6702 a2!699)))

(declare-fun b!279306 () Bool)

(declare-fun res!231923 () Bool)

(assert (=> b!279306 (=> (not res!231923) (not e!199092))))

(declare-fun arrayBitRangesEq!0 (array!16124 array!16124 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279306 (= res!231923 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279307 () Bool)

(declare-fun res!231922 () Bool)

(assert (=> b!279307 (=> (not res!231922) (not e!199092))))

(assert (=> b!279307 (= res!231922 (bvslt from!822 to!789))))

(declare-fun b!279308 () Bool)

(declare-datatypes ((Unit!19577 0))(
  ( (Unit!19578) )
))
(declare-fun e!199091 () Unit!19577)

(declare-fun Unit!19579 () Unit!19577)

(assert (=> b!279308 (= e!199091 Unit!19579)))

(declare-fun b!279309 () Bool)

(declare-datatypes ((tuple4!706 0))(
  ( (tuple4!707 (_1!12428 (_ BitVec 32)) (_2!12428 (_ BitVec 32)) (_3!1133 (_ BitVec 32)) (_4!353 (_ BitVec 32))) )
))
(declare-fun lt!416316 () tuple4!706)

(assert (=> b!279309 (= e!199092 (and (= (_3!1133 lt!416316) (_4!353 lt!416316)) (or (bvslt (_3!1133 lt!416316) #b00000000000000000000000000000000) (bvsge (_3!1133 lt!416316) (size!6978 a2!699)))))))

(declare-fun lt!416314 () Unit!19577)

(assert (=> b!279309 (= lt!416314 e!199091)))

(declare-fun c!12864 () Bool)

(assert (=> b!279309 (= c!12864 (bvslt (_1!12428 lt!416316) (_2!12428 lt!416316)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!706)

(assert (=> b!279309 (= lt!416316 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279310 () Bool)

(declare-fun Unit!19580 () Unit!19577)

(assert (=> b!279310 (= e!199091 Unit!19580)))

(declare-fun arrayRangesEq!1246 (array!16124 array!16124 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279310 (arrayRangesEq!1246 a1!699 a2!699 (_1!12428 lt!416316) (_2!12428 lt!416316))))

(declare-fun lt!416315 () Unit!19577)

(declare-fun arrayRangesEqSymmetricLemma!153 (array!16124 array!16124 (_ BitVec 32) (_ BitVec 32)) Unit!19577)

(assert (=> b!279310 (= lt!416315 (arrayRangesEqSymmetricLemma!153 a1!699 a2!699 (_1!12428 lt!416316) (_2!12428 lt!416316)))))

(assert (=> b!279310 (arrayRangesEq!1246 a2!699 a1!699 (_1!12428 lt!416316) (_2!12428 lt!416316))))

(assert (= (and start!62272 res!231921) b!279306))

(assert (= (and b!279306 res!231923) b!279307))

(assert (= (and b!279307 res!231922) b!279309))

(assert (= (and b!279309 c!12864) b!279310))

(assert (= (and b!279309 (not c!12864)) b!279308))

(declare-fun m!412349 () Bool)

(assert (=> start!62272 m!412349))

(declare-fun m!412351 () Bool)

(assert (=> start!62272 m!412351))

(declare-fun m!412353 () Bool)

(assert (=> b!279306 m!412353))

(declare-fun m!412355 () Bool)

(assert (=> b!279309 m!412355))

(declare-fun m!412357 () Bool)

(assert (=> b!279310 m!412357))

(declare-fun m!412359 () Bool)

(assert (=> b!279310 m!412359))

(declare-fun m!412361 () Bool)

(assert (=> b!279310 m!412361))

(push 1)

(assert (not b!279309))

(assert (not b!279310))

(assert (not start!62272))

(assert (not b!279306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96048 () Bool)

(assert (=> d!96048 (= (arrayBitIndices!0 from!822 to!789) (tuple4!707 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279309 d!96048))

(declare-fun d!96056 () Bool)

(declare-fun res!231938 () Bool)

(declare-fun e!199109 () Bool)

(assert (=> d!96056 (=> res!231938 e!199109)))

(assert (=> d!96056 (= res!231938 (= (_1!12428 lt!416316) (_2!12428 lt!416316)))))

(assert (=> d!96056 (= (arrayRangesEq!1246 a1!699 a2!699 (_1!12428 lt!416316) (_2!12428 lt!416316)) e!199109)))

(declare-fun b!279329 () Bool)

(declare-fun e!199110 () Bool)

(assert (=> b!279329 (= e!199109 e!199110)))

(declare-fun res!231939 () Bool)

(assert (=> b!279329 (=> (not res!231939) (not e!199110))))

(assert (=> b!279329 (= res!231939 (= (select (arr!7974 a1!699) (_1!12428 lt!416316)) (select (arr!7974 a2!699) (_1!12428 lt!416316))))))

(declare-fun b!279330 () Bool)

(assert (=> b!279330 (= e!199110 (arrayRangesEq!1246 a1!699 a2!699 (bvadd (_1!12428 lt!416316) #b00000000000000000000000000000001) (_2!12428 lt!416316)))))

(assert (= (and d!96056 (not res!231938)) b!279329))

(assert (= (and b!279329 res!231939) b!279330))

(declare-fun m!412363 () Bool)

(assert (=> b!279329 m!412363))

(declare-fun m!412365 () Bool)

(assert (=> b!279329 m!412365))

(declare-fun m!412367 () Bool)

(assert (=> b!279330 m!412367))

(assert (=> b!279310 d!96056))

(declare-fun d!96058 () Bool)

(assert (=> d!96058 (arrayRangesEq!1246 a2!699 a1!699 (_1!12428 lt!416316) (_2!12428 lt!416316))))

(declare-fun lt!416325 () Unit!19577)

(declare-fun choose!462 (array!16124 array!16124 (_ BitVec 32) (_ BitVec 32)) Unit!19577)

(assert (=> d!96058 (= lt!416325 (choose!462 a1!699 a2!699 (_1!12428 lt!416316) (_2!12428 lt!416316)))))

(assert (=> d!96058 (and (bvsle #b00000000000000000000000000000000 (_1!12428 lt!416316)) (bvsle (_1!12428 lt!416316) (_2!12428 lt!416316)) (bvsle (_2!12428 lt!416316) (size!6978 a1!699)))))

(assert (=> d!96058 (= (arrayRangesEqSymmetricLemma!153 a1!699 a2!699 (_1!12428 lt!416316) (_2!12428 lt!416316)) lt!416325)))

(declare-fun bs!24245 () Bool)

(assert (= bs!24245 d!96058))

(assert (=> bs!24245 m!412361))

(declare-fun m!412369 () Bool)

(assert (=> bs!24245 m!412369))

(assert (=> b!279310 d!96058))

(declare-fun d!96060 () Bool)

(declare-fun res!231945 () Bool)

(declare-fun e!199117 () Bool)

(assert (=> d!96060 (=> res!231945 e!199117)))

(assert (=> d!96060 (= res!231945 (= (_1!12428 lt!416316) (_2!12428 lt!416316)))))

(assert (=> d!96060 (= (arrayRangesEq!1246 a2!699 a1!699 (_1!12428 lt!416316) (_2!12428 lt!416316)) e!199117)))

(declare-fun b!279338 () Bool)

(declare-fun e!199118 () Bool)

(assert (=> b!279338 (= e!199117 e!199118)))

(declare-fun res!231946 () Bool)

(assert (=> b!279338 (=> (not res!231946) (not e!199118))))

(assert (=> b!279338 (= res!231946 (= (select (arr!7974 a2!699) (_1!12428 lt!416316)) (select (arr!7974 a1!699) (_1!12428 lt!416316))))))

(declare-fun b!279339 () Bool)

(assert (=> b!279339 (= e!199118 (arrayRangesEq!1246 a2!699 a1!699 (bvadd (_1!12428 lt!416316) #b00000000000000000000000000000001) (_2!12428 lt!416316)))))

(assert (= (and d!96060 (not res!231945)) b!279338))

(assert (= (and b!279338 res!231946) b!279339))

(assert (=> b!279338 m!412365))

(assert (=> b!279338 m!412363))

(declare-fun m!412371 () Bool)

(assert (=> b!279339 m!412371))

(assert (=> b!279310 d!96060))

(declare-fun d!96062 () Bool)

(assert (=> d!96062 (= (array_inv!6702 a1!699) (bvsge (size!6978 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62272 d!96062))

(declare-fun d!96064 () Bool)

(assert (=> d!96064 (= (array_inv!6702 a2!699) (bvsge (size!6978 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62272 d!96064))

(declare-fun b!279383 () Bool)

(declare-fun e!199158 () Bool)

(declare-fun call!4562 () Bool)

(assert (=> b!279383 (= e!199158 call!4562)))

(declare-fun b!279384 () Bool)

(declare-fun e!199157 () Bool)

(declare-fun e!199161 () Bool)

(assert (=> b!279384 (= e!199157 e!199161)))

(declare-fun res!231983 () Bool)

(declare-fun lt!416347 () tuple4!706)

(declare-fun lt!416349 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279384 (= res!231983 (byteRangesEq!0 (select (arr!7974 a1!699) (_3!1133 lt!416347)) (select (arr!7974 a2!699) (_3!1133 lt!416347)) lt!416349 #b00000000000000000000000000001000))))

(assert (=> b!279384 (=> (not res!231983) (not e!199161))))

(declare-fun e!199159 () Bool)

(declare-fun b!279385 () Bool)

(assert (=> b!279385 (= e!199159 (arrayRangesEq!1246 a1!699 a2!699 (_1!12428 lt!416347) (_2!12428 lt!416347)))))

(declare-fun b!279386 () Bool)

(assert (=> b!279386 (= e!199157 call!4562)))

(declare-fun d!96066 () Bool)

(declare-fun res!231980 () Bool)

(declare-fun e!199160 () Bool)

(assert (=> d!96066 (=> res!231980 e!199160)))

(assert (=> d!96066 (= res!231980 (bvsge from!822 to!789))))

(assert (=> d!96066 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199160)))

(declare-fun b!279387 () Bool)

(declare-fun e!199162 () Bool)

(assert (=> b!279387 (= e!199162 e!199157)))

(declare-fun c!12873 () Bool)

(assert (=> b!279387 (= c!12873 (= (_3!1133 lt!416347) (_4!353 lt!416347)))))

(declare-fun lt!416348 () (_ BitVec 32))

(declare-fun bm!4559 () Bool)

(assert (=> bm!4559 (= call!4562 (byteRangesEq!0 (ite c!12873 (select (arr!7974 a1!699) (_3!1133 lt!416347)) (select (arr!7974 a1!699) (_4!353 lt!416347))) (ite c!12873 (select (arr!7974 a2!699) (_3!1133 lt!416347)) (select (arr!7974 a2!699) (_4!353 lt!416347))) (ite c!12873 lt!416349 #b00000000000000000000000000000000) lt!416348))))

(declare-fun b!279388 () Bool)

(assert (=> b!279388 (= e!199160 e!199162)))

(declare-fun res!231982 () Bool)

(assert (=> b!279388 (=> (not res!231982) (not e!199162))))

(assert (=> b!279388 (= res!231982 e!199159)))

(declare-fun res!231984 () Bool)

(assert (=> b!279388 (=> res!231984 e!199159)))

(assert (=> b!279388 (= res!231984 (bvsge (_1!12428 lt!416347) (_2!12428 lt!416347)))))

(assert (=> b!279388 (= lt!416348 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279388 (= lt!416349 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279388 (= lt!416347 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279389 () Bool)

(declare-fun res!231981 () Bool)

(assert (=> b!279389 (= res!231981 (= lt!416348 #b00000000000000000000000000000000))))

(assert (=> b!279389 (=> res!231981 e!199158)))

(assert (=> b!279389 (= e!199161 e!199158)))

(assert (= (and d!96066 (not res!231980)) b!279388))

(assert (= (and b!279388 (not res!231984)) b!279385))

(assert (= (and b!279388 res!231982) b!279387))

(assert (= (and b!279387 c!12873) b!279386))

(assert (= (and b!279387 (not c!12873)) b!279384))

(assert (= (and b!279384 res!231983) b!279389))

(assert (= (and b!279389 (not res!231981)) b!279383))

(assert (= (or b!279386 b!279383) bm!4559))

(declare-fun m!412399 () Bool)

(assert (=> b!279384 m!412399))

(declare-fun m!412401 () Bool)

(assert (=> b!279384 m!412401))

(assert (=> b!279384 m!412399))

(assert (=> b!279384 m!412401))

(declare-fun m!412407 () Bool)

(assert (=> b!279384 m!412407))

(declare-fun m!412409 () Bool)

(assert (=> b!279385 m!412409))

(declare-fun m!412411 () Bool)

(assert (=> bm!4559 m!412411))

(declare-fun m!412415 () Bool)

(assert (=> bm!4559 m!412415))

(declare-fun m!412421 () Bool)

(assert (=> bm!4559 m!412421))

(assert (=> bm!4559 m!412399))

(assert (=> bm!4559 m!412401))

(assert (=> b!279388 m!412355))

(assert (=> b!279306 d!96066))

(push 1)

(assert (not b!279388))

(assert (not b!279339))

(assert (not b!279330))

(assert (not b!279384))

(assert (not d!96058))

(assert (not bm!4559))

(assert (not b!279385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

