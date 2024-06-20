; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62550 () Bool)

(assert start!62550)

(declare-fun res!232645 () Bool)

(declare-fun e!199937 () Bool)

(assert (=> start!62550 (=> (not res!232645) (not e!199937))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16183 0))(
  ( (array!16184 (arr!7993 (Array (_ BitVec 32) (_ BitVec 8))) (size!6997 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16183)

(declare-fun a2!699 () array!16183)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62550 (= res!232645 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6997 a1!699) (size!6997 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6997 a1!699))))))))

(assert (=> start!62550 e!199937))

(assert (=> start!62550 true))

(declare-fun array_inv!6721 (array!16183) Bool)

(assert (=> start!62550 (array_inv!6721 a1!699)))

(assert (=> start!62550 (array_inv!6721 a2!699)))

(declare-fun b!280275 () Bool)

(declare-fun res!232646 () Bool)

(assert (=> b!280275 (=> (not res!232646) (not e!199937))))

(assert (=> b!280275 (= res!232646 (bvslt from!822 to!789))))

(declare-fun b!280276 () Bool)

(declare-fun res!232644 () Bool)

(assert (=> b!280276 (=> (not res!232644) (not e!199937))))

(declare-fun arrayBitRangesEq!0 (array!16183 array!16183 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280276 (= res!232644 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280277 () Bool)

(declare-datatypes ((Unit!19653 0))(
  ( (Unit!19654) )
))
(declare-fun e!199935 () Unit!19653)

(declare-fun Unit!19655 () Unit!19653)

(assert (=> b!280277 (= e!199935 Unit!19655)))

(declare-datatypes ((tuple4!744 0))(
  ( (tuple4!745 (_1!12447 (_ BitVec 32)) (_2!12447 (_ BitVec 32)) (_3!1152 (_ BitVec 32)) (_4!372 (_ BitVec 32))) )
))
(declare-fun lt!416783 () tuple4!744)

(declare-fun arrayRangesEq!1265 (array!16183 array!16183 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280277 (arrayRangesEq!1265 a1!699 a2!699 (_1!12447 lt!416783) (_2!12447 lt!416783))))

(declare-fun lt!416782 () Unit!19653)

(declare-fun arrayRangesEqSymmetricLemma!172 (array!16183 array!16183 (_ BitVec 32) (_ BitVec 32)) Unit!19653)

(assert (=> b!280277 (= lt!416782 (arrayRangesEqSymmetricLemma!172 a1!699 a2!699 (_1!12447 lt!416783) (_2!12447 lt!416783)))))

(assert (=> b!280277 (arrayRangesEq!1265 a2!699 a1!699 (_1!12447 lt!416783) (_2!12447 lt!416783))))

(declare-fun b!280278 () Bool)

(assert (=> b!280278 (= e!199937 (and (not (= (_3!1152 lt!416783) (_4!372 lt!416783))) (or (bvslt (_3!1152 lt!416783) #b00000000000000000000000000000000) (bvsge (_3!1152 lt!416783) (size!6997 a2!699)))))))

(declare-fun lt!416784 () Unit!19653)

(assert (=> b!280278 (= lt!416784 e!199935)))

(declare-fun c!12987 () Bool)

(assert (=> b!280278 (= c!12987 (bvslt (_1!12447 lt!416783) (_2!12447 lt!416783)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!744)

(assert (=> b!280278 (= lt!416783 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280279 () Bool)

(declare-fun Unit!19656 () Unit!19653)

(assert (=> b!280279 (= e!199935 Unit!19656)))

(assert (= (and start!62550 res!232645) b!280276))

(assert (= (and b!280276 res!232644) b!280275))

(assert (= (and b!280275 res!232646) b!280278))

(assert (= (and b!280278 c!12987) b!280277))

(assert (= (and b!280278 (not c!12987)) b!280279))

(declare-fun m!413301 () Bool)

(assert (=> start!62550 m!413301))

(declare-fun m!413303 () Bool)

(assert (=> start!62550 m!413303))

(declare-fun m!413305 () Bool)

(assert (=> b!280276 m!413305))

(declare-fun m!413307 () Bool)

(assert (=> b!280277 m!413307))

(declare-fun m!413309 () Bool)

(assert (=> b!280277 m!413309))

(declare-fun m!413311 () Bool)

(assert (=> b!280277 m!413311))

(declare-fun m!413313 () Bool)

(assert (=> b!280278 m!413313))

(push 1)

(assert (not b!280277))

(assert (not b!280276))

(assert (not start!62550))

(assert (not b!280278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96402 () Bool)

(declare-fun res!232669 () Bool)

(declare-fun e!199967 () Bool)

(assert (=> d!96402 (=> res!232669 e!199967)))

(assert (=> d!96402 (= res!232669 (= (_1!12447 lt!416783) (_2!12447 lt!416783)))))

(assert (=> d!96402 (= (arrayRangesEq!1265 a1!699 a2!699 (_1!12447 lt!416783) (_2!12447 lt!416783)) e!199967)))

(declare-fun b!280314 () Bool)

(declare-fun e!199968 () Bool)

(assert (=> b!280314 (= e!199967 e!199968)))

(declare-fun res!232670 () Bool)

(assert (=> b!280314 (=> (not res!232670) (not e!199968))))

(assert (=> b!280314 (= res!232670 (= (select (arr!7993 a1!699) (_1!12447 lt!416783)) (select (arr!7993 a2!699) (_1!12447 lt!416783))))))

(declare-fun b!280315 () Bool)

(assert (=> b!280315 (= e!199968 (arrayRangesEq!1265 a1!699 a2!699 (bvadd (_1!12447 lt!416783) #b00000000000000000000000000000001) (_2!12447 lt!416783)))))

(assert (= (and d!96402 (not res!232669)) b!280314))

(assert (= (and b!280314 res!232670) b!280315))

(declare-fun m!413343 () Bool)

(assert (=> b!280314 m!413343))

(declare-fun m!413345 () Bool)

(assert (=> b!280314 m!413345))

(declare-fun m!413347 () Bool)

(assert (=> b!280315 m!413347))

(assert (=> b!280277 d!96402))

(declare-fun d!96404 () Bool)

(assert (=> d!96404 (arrayRangesEq!1265 a2!699 a1!699 (_1!12447 lt!416783) (_2!12447 lt!416783))))

(declare-fun lt!416805 () Unit!19653)

(declare-fun choose!479 (array!16183 array!16183 (_ BitVec 32) (_ BitVec 32)) Unit!19653)

(assert (=> d!96404 (= lt!416805 (choose!479 a1!699 a2!699 (_1!12447 lt!416783) (_2!12447 lt!416783)))))

(assert (=> d!96404 (and (bvsle #b00000000000000000000000000000000 (_1!12447 lt!416783)) (bvsle (_1!12447 lt!416783) (_2!12447 lt!416783)) (bvsle (_2!12447 lt!416783) (size!6997 a1!699)))))

(assert (=> d!96404 (= (arrayRangesEqSymmetricLemma!172 a1!699 a2!699 (_1!12447 lt!416783) (_2!12447 lt!416783)) lt!416805)))

(declare-fun bs!24308 () Bool)

(assert (= bs!24308 d!96404))

(assert (=> bs!24308 m!413311))

(declare-fun m!413349 () Bool)

(assert (=> bs!24308 m!413349))

(assert (=> b!280277 d!96404))

(declare-fun d!96406 () Bool)

(declare-fun res!232671 () Bool)

(declare-fun e!199969 () Bool)

(assert (=> d!96406 (=> res!232671 e!199969)))

(assert (=> d!96406 (= res!232671 (= (_1!12447 lt!416783) (_2!12447 lt!416783)))))

(assert (=> d!96406 (= (arrayRangesEq!1265 a2!699 a1!699 (_1!12447 lt!416783) (_2!12447 lt!416783)) e!199969)))

(declare-fun b!280316 () Bool)

(declare-fun e!199970 () Bool)

(assert (=> b!280316 (= e!199969 e!199970)))

(declare-fun res!232672 () Bool)

(assert (=> b!280316 (=> (not res!232672) (not e!199970))))

(assert (=> b!280316 (= res!232672 (= (select (arr!7993 a2!699) (_1!12447 lt!416783)) (select (arr!7993 a1!699) (_1!12447 lt!416783))))))

(declare-fun b!280317 () Bool)

(assert (=> b!280317 (= e!199970 (arrayRangesEq!1265 a2!699 a1!699 (bvadd (_1!12447 lt!416783) #b00000000000000000000000000000001) (_2!12447 lt!416783)))))

(assert (= (and d!96406 (not res!232671)) b!280316))

(assert (= (and b!280316 res!232672) b!280317))

(assert (=> b!280316 m!413345))

(assert (=> b!280316 m!413343))

(declare-fun m!413351 () Bool)

(assert (=> b!280317 m!413351))

(assert (=> b!280277 d!96406))

(declare-fun d!96408 () Bool)

(declare-fun res!232699 () Bool)

(declare-fun e!200005 () Bool)

(assert (=> d!96408 (=> res!232699 e!200005)))

(assert (=> d!96408 (= res!232699 (bvsge from!822 to!789))))

(assert (=> d!96408 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200005)))

(declare-fun e!200003 () Bool)

(declare-fun lt!416821 () tuple4!744)

(declare-fun b!280353 () Bool)

(declare-fun lt!416822 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280353 (= e!200003 (byteRangesEq!0 (select (arr!7993 a1!699) (_4!372 lt!416821)) (select (arr!7993 a2!699) (_4!372 lt!416821)) #b00000000000000000000000000000000 lt!416822))))

(declare-fun b!280354 () Bool)

(declare-fun e!200001 () Bool)

(declare-fun e!200004 () Bool)

(assert (=> b!280354 (= e!200001 e!200004)))

(declare-fun c!12999 () Bool)

(assert (=> b!280354 (= c!12999 (= (_3!1152 lt!416821) (_4!372 lt!416821)))))

(declare-fun b!280355 () Bool)

(declare-fun call!4625 () Bool)

(assert (=> b!280355 (= e!200004 call!4625)))

(declare-fun b!280356 () Bool)

(declare-fun res!232698 () Bool)

(assert (=> b!280356 (= res!232698 (= lt!416822 #b00000000000000000000000000000000))))

(assert (=> b!280356 (=> res!232698 e!200003)))

(declare-fun e!200002 () Bool)

(assert (=> b!280356 (= e!200002 e!200003)))

(declare-fun b!280357 () Bool)

(declare-fun e!200006 () Bool)

(assert (=> b!280357 (= e!200006 (arrayRangesEq!1265 a1!699 a2!699 (_1!12447 lt!416821) (_2!12447 lt!416821)))))

(declare-fun b!280358 () Bool)

(assert (=> b!280358 (= e!200005 e!200001)))

(declare-fun res!232701 () Bool)

(assert (=> b!280358 (=> (not res!232701) (not e!200001))))

(assert (=> b!280358 (= res!232701 e!200006)))

(declare-fun res!232702 () Bool)

(assert (=> b!280358 (=> res!232702 e!200006)))

(assert (=> b!280358 (= res!232702 (bvsge (_1!12447 lt!416821) (_2!12447 lt!416821)))))

(assert (=> b!280358 (= lt!416822 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416823 () (_ BitVec 32))

(assert (=> b!280358 (= lt!416823 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280358 (= lt!416821 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280359 () Bool)

(assert (=> b!280359 (= e!200004 e!200002)))

(declare-fun res!232700 () Bool)

(assert (=> b!280359 (= res!232700 call!4625)))

(assert (=> b!280359 (=> (not res!232700) (not e!200002))))

(declare-fun bm!4622 () Bool)

(assert (=> bm!4622 (= call!4625 (byteRangesEq!0 (select (arr!7993 a1!699) (_3!1152 lt!416821)) (select (arr!7993 a2!699) (_3!1152 lt!416821)) lt!416823 (ite c!12999 lt!416822 #b00000000000000000000000000001000)))))

(assert (= (and d!96408 (not res!232699)) b!280358))

(assert (= (and b!280358 (not res!232702)) b!280357))

(assert (= (and b!280358 res!232701) b!280354))

(assert (= (and b!280354 c!12999) b!280355))

(assert (= (and b!280354 (not c!12999)) b!280359))

(assert (= (and b!280359 res!232700) b!280356))

(assert (= (and b!280356 (not res!232698)) b!280353))

(assert (= (or b!280355 b!280359) bm!4622))

(declare-fun m!413367 () Bool)

(assert (=> b!280353 m!413367))

(declare-fun m!413369 () Bool)

(assert (=> b!280353 m!413369))

(assert (=> b!280353 m!413367))

(assert (=> b!280353 m!413369))

(declare-fun m!413371 () Bool)

(assert (=> b!280353 m!413371))

(declare-fun m!413373 () Bool)

(assert (=> b!280357 m!413373))

(assert (=> b!280358 m!413313))

(declare-fun m!413375 () Bool)

(assert (=> bm!4622 m!413375))

(declare-fun m!413377 () Bool)

(assert (=> bm!4622 m!413377))

(assert (=> bm!4622 m!413375))

(assert (=> bm!4622 m!413377))

(declare-fun m!413379 () Bool)

(assert (=> bm!4622 m!413379))

(assert (=> b!280276 d!96408))

(declare-fun d!96424 () Bool)

(assert (=> d!96424 (= (array_inv!6721 a1!699) (bvsge (size!6997 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62550 d!96424))

(declare-fun d!96426 () Bool)

(assert (=> d!96426 (= (array_inv!6721 a2!699) (bvsge (size!6997 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62550 d!96426))

(declare-fun d!96428 () Bool)

(assert (=> d!96428 (= (arrayBitIndices!0 from!822 to!789) (tuple4!745 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280278 d!96428))

(push 1)

(assert (not b!280353))

(assert (not b!280315))

(assert (not d!96404))

(assert (not b!280357))

(assert (not bm!4622))

(assert (not b!280358))

(assert (not b!280317))

(check-sat)

(pop 1)

(push 1)

(check-sat)

