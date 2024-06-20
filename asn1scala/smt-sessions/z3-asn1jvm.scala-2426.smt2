; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61866 () Bool)

(assert start!61866)

(declare-fun res!230282 () Bool)

(declare-fun e!197237 () Bool)

(assert (=> start!61866 (=> (not res!230282) (not e!197237))))

(declare-datatypes ((array!15912 0))(
  ( (array!15913 (arr!7880 (Array (_ BitVec 32) (_ BitVec 8))) (size!6884 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15912)

(declare-fun a2!699 () array!15912)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> start!61866 (= res!230282 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6884 a1!699) (size!6884 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6884 a1!699))))))))

(assert (=> start!61866 e!197237))

(assert (=> start!61866 true))

(declare-fun array_inv!6608 (array!15912) Bool)

(assert (=> start!61866 (array_inv!6608 a1!699)))

(assert (=> start!61866 (array_inv!6608 a2!699)))

(declare-fun b!277273 () Bool)

(declare-fun res!230284 () Bool)

(assert (=> b!277273 (=> (not res!230284) (not e!197237))))

(declare-fun arrayBitRangesEq!0 (array!15912 array!15912 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277273 (= res!230284 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277274 () Bool)

(declare-fun res!230283 () Bool)

(assert (=> b!277274 (=> (not res!230283) (not e!197237))))

(assert (=> b!277274 (= res!230283 (bvslt from!822 to!789))))

(declare-fun b!277275 () Bool)

(declare-datatypes ((tuple4!554 0))(
  ( (tuple4!555 (_1!12352 (_ BitVec 32)) (_2!12352 (_ BitVec 32)) (_3!1057 (_ BitVec 32)) (_4!277 (_ BitVec 32))) )
))
(declare-fun lt!415362 () tuple4!554)

(assert (=> b!277275 (= e!197237 (and (bvslt (_1!12352 lt!415362) (_2!12352 lt!415362)) (bvsle #b00000000000000000000000000000000 (_1!12352 lt!415362)) (bvsle (_1!12352 lt!415362) (_2!12352 lt!415362)) (bvsgt (_2!12352 lt!415362) (size!6884 a1!699))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!554)

(assert (=> b!277275 (= lt!415362 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!61866 res!230282) b!277273))

(assert (= (and b!277273 res!230284) b!277274))

(assert (= (and b!277274 res!230283) b!277275))

(declare-fun m!410461 () Bool)

(assert (=> start!61866 m!410461))

(declare-fun m!410463 () Bool)

(assert (=> start!61866 m!410463))

(declare-fun m!410465 () Bool)

(assert (=> b!277273 m!410465))

(declare-fun m!410467 () Bool)

(assert (=> b!277275 m!410467))

(check-sat (not b!277273) (not b!277275) (not start!61866))
(check-sat)
(get-model)

(declare-fun b!277341 () Bool)

(declare-fun e!197300 () Bool)

(declare-fun lt!415390 () tuple4!554)

(declare-fun arrayRangesEq!1171 (array!15912 array!15912 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277341 (= e!197300 (arrayRangesEq!1171 a1!699 a2!699 (_1!12352 lt!415390) (_2!12352 lt!415390)))))

(declare-fun d!95688 () Bool)

(declare-fun res!230335 () Bool)

(declare-fun e!197298 () Bool)

(assert (=> d!95688 (=> res!230335 e!197298)))

(assert (=> d!95688 (= res!230335 (bvsge from!822 to!789))))

(assert (=> d!95688 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197298)))

(declare-fun b!277342 () Bool)

(declare-fun e!197297 () Bool)

(declare-fun call!4490 () Bool)

(assert (=> b!277342 (= e!197297 call!4490)))

(declare-fun bm!4487 () Bool)

(declare-fun lt!415392 () (_ BitVec 32))

(declare-fun lt!415391 () (_ BitVec 32))

(declare-fun c!12675 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4487 (= call!4490 (byteRangesEq!0 (select (arr!7880 a1!699) (_3!1057 lt!415390)) (select (arr!7880 a2!699) (_3!1057 lt!415390)) lt!415391 (ite c!12675 lt!415392 #b00000000000000000000000000001000)))))

(declare-fun b!277343 () Bool)

(declare-fun e!197296 () Bool)

(assert (=> b!277343 (= e!197298 e!197296)))

(declare-fun res!230334 () Bool)

(assert (=> b!277343 (=> (not res!230334) (not e!197296))))

(assert (=> b!277343 (= res!230334 e!197300)))

(declare-fun res!230338 () Bool)

(assert (=> b!277343 (=> res!230338 e!197300)))

(assert (=> b!277343 (= res!230338 (bvsge (_1!12352 lt!415390) (_2!12352 lt!415390)))))

(assert (=> b!277343 (= lt!415392 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277343 (= lt!415391 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277343 (= lt!415390 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277344 () Bool)

(declare-fun e!197295 () Bool)

(assert (=> b!277344 (= e!197297 e!197295)))

(declare-fun res!230336 () Bool)

(assert (=> b!277344 (= res!230336 call!4490)))

(assert (=> b!277344 (=> (not res!230336) (not e!197295))))

(declare-fun e!197299 () Bool)

(declare-fun b!277345 () Bool)

(assert (=> b!277345 (= e!197299 (byteRangesEq!0 (select (arr!7880 a1!699) (_4!277 lt!415390)) (select (arr!7880 a2!699) (_4!277 lt!415390)) #b00000000000000000000000000000000 lt!415392))))

(declare-fun b!277346 () Bool)

(declare-fun res!230337 () Bool)

(assert (=> b!277346 (= res!230337 (= lt!415392 #b00000000000000000000000000000000))))

(assert (=> b!277346 (=> res!230337 e!197299)))

(assert (=> b!277346 (= e!197295 e!197299)))

(declare-fun b!277347 () Bool)

(assert (=> b!277347 (= e!197296 e!197297)))

(assert (=> b!277347 (= c!12675 (= (_3!1057 lt!415390) (_4!277 lt!415390)))))

(assert (= (and d!95688 (not res!230335)) b!277343))

(assert (= (and b!277343 (not res!230338)) b!277341))

(assert (= (and b!277343 res!230334) b!277347))

(assert (= (and b!277347 c!12675) b!277342))

(assert (= (and b!277347 (not c!12675)) b!277344))

(assert (= (and b!277344 res!230336) b!277346))

(assert (= (and b!277346 (not res!230337)) b!277345))

(assert (= (or b!277342 b!277344) bm!4487))

(declare-fun m!410505 () Bool)

(assert (=> b!277341 m!410505))

(declare-fun m!410507 () Bool)

(assert (=> bm!4487 m!410507))

(declare-fun m!410509 () Bool)

(assert (=> bm!4487 m!410509))

(assert (=> bm!4487 m!410507))

(assert (=> bm!4487 m!410509))

(declare-fun m!410511 () Bool)

(assert (=> bm!4487 m!410511))

(assert (=> b!277343 m!410467))

(declare-fun m!410513 () Bool)

(assert (=> b!277345 m!410513))

(declare-fun m!410515 () Bool)

(assert (=> b!277345 m!410515))

(assert (=> b!277345 m!410513))

(assert (=> b!277345 m!410515))

(declare-fun m!410517 () Bool)

(assert (=> b!277345 m!410517))

(assert (=> b!277273 d!95688))

(declare-fun d!95706 () Bool)

(assert (=> d!95706 (= (arrayBitIndices!0 from!822 to!789) (tuple4!555 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277275 d!95706))

(declare-fun d!95708 () Bool)

(assert (=> d!95708 (= (array_inv!6608 a1!699) (bvsge (size!6884 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61866 d!95708))

(declare-fun d!95710 () Bool)

(assert (=> d!95710 (= (array_inv!6608 a2!699) (bvsge (size!6884 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61866 d!95710))

(check-sat (not b!277345) (not b!277341) (not bm!4487) (not b!277343))
(check-sat)
