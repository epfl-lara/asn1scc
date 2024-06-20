; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62554 () Bool)

(assert start!62554)

(declare-fun b!280305 () Bool)

(declare-datatypes ((Unit!19661 0))(
  ( (Unit!19662) )
))
(declare-fun e!199960 () Unit!19661)

(declare-fun Unit!19663 () Unit!19661)

(assert (=> b!280305 (= e!199960 Unit!19663)))

(declare-fun res!232662 () Bool)

(declare-fun e!199959 () Bool)

(assert (=> start!62554 (=> (not res!232662) (not e!199959))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16187 0))(
  ( (array!16188 (arr!7995 (Array (_ BitVec 32) (_ BitVec 8))) (size!6999 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16187)

(declare-fun a2!699 () array!16187)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62554 (= res!232662 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6999 a1!699) (size!6999 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6999 a1!699))))))))

(assert (=> start!62554 e!199959))

(assert (=> start!62554 true))

(declare-fun array_inv!6723 (array!16187) Bool)

(assert (=> start!62554 (array_inv!6723 a1!699)))

(assert (=> start!62554 (array_inv!6723 a2!699)))

(declare-fun b!280306 () Bool)

(declare-datatypes ((tuple4!748 0))(
  ( (tuple4!749 (_1!12449 (_ BitVec 32)) (_2!12449 (_ BitVec 32)) (_3!1154 (_ BitVec 32)) (_4!374 (_ BitVec 32))) )
))
(declare-fun lt!416802 () tuple4!748)

(assert (=> b!280306 (= e!199959 (and (not (= (_3!1154 lt!416802) (_4!374 lt!416802))) (or (bvslt (_3!1154 lt!416802) #b00000000000000000000000000000000) (bvsge (_3!1154 lt!416802) (size!6999 a2!699)))))))

(declare-fun lt!416800 () Unit!19661)

(assert (=> b!280306 (= lt!416800 e!199960)))

(declare-fun c!12993 () Bool)

(assert (=> b!280306 (= c!12993 (bvslt (_1!12449 lt!416802) (_2!12449 lt!416802)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!748)

(assert (=> b!280306 (= lt!416802 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280307 () Bool)

(declare-fun res!232663 () Bool)

(assert (=> b!280307 (=> (not res!232663) (not e!199959))))

(declare-fun arrayBitRangesEq!0 (array!16187 array!16187 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280307 (= res!232663 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280308 () Bool)

(declare-fun res!232664 () Bool)

(assert (=> b!280308 (=> (not res!232664) (not e!199959))))

(assert (=> b!280308 (= res!232664 (bvslt from!822 to!789))))

(declare-fun b!280309 () Bool)

(declare-fun Unit!19664 () Unit!19661)

(assert (=> b!280309 (= e!199960 Unit!19664)))

(declare-fun arrayRangesEq!1267 (array!16187 array!16187 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280309 (arrayRangesEq!1267 a1!699 a2!699 (_1!12449 lt!416802) (_2!12449 lt!416802))))

(declare-fun lt!416801 () Unit!19661)

(declare-fun arrayRangesEqSymmetricLemma!174 (array!16187 array!16187 (_ BitVec 32) (_ BitVec 32)) Unit!19661)

(assert (=> b!280309 (= lt!416801 (arrayRangesEqSymmetricLemma!174 a1!699 a2!699 (_1!12449 lt!416802) (_2!12449 lt!416802)))))

(assert (=> b!280309 (arrayRangesEq!1267 a2!699 a1!699 (_1!12449 lt!416802) (_2!12449 lt!416802))))

(assert (= (and start!62554 res!232662) b!280307))

(assert (= (and b!280307 res!232663) b!280308))

(assert (= (and b!280308 res!232664) b!280306))

(assert (= (and b!280306 c!12993) b!280309))

(assert (= (and b!280306 (not c!12993)) b!280305))

(declare-fun m!413329 () Bool)

(assert (=> start!62554 m!413329))

(declare-fun m!413331 () Bool)

(assert (=> start!62554 m!413331))

(declare-fun m!413333 () Bool)

(assert (=> b!280306 m!413333))

(declare-fun m!413335 () Bool)

(assert (=> b!280307 m!413335))

(declare-fun m!413337 () Bool)

(assert (=> b!280309 m!413337))

(declare-fun m!413339 () Bool)

(assert (=> b!280309 m!413339))

(declare-fun m!413341 () Bool)

(assert (=> b!280309 m!413341))

(push 1)

(assert (not start!62554))

(assert (not b!280309))

(assert (not b!280306))

(assert (not b!280307))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96412 () Bool)

(assert (=> d!96412 (= (array_inv!6723 a1!699) (bvsge (size!6999 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62554 d!96412))

(declare-fun d!96414 () Bool)

(assert (=> d!96414 (= (array_inv!6723 a2!699) (bvsge (size!6999 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62554 d!96414))

(declare-fun d!96416 () Bool)

(declare-fun res!232711 () Bool)

(declare-fun e!200015 () Bool)

(assert (=> d!96416 (=> res!232711 e!200015)))

(assert (=> d!96416 (= res!232711 (= (_1!12449 lt!416802) (_2!12449 lt!416802)))))

(assert (=> d!96416 (= (arrayRangesEq!1267 a1!699 a2!699 (_1!12449 lt!416802) (_2!12449 lt!416802)) e!200015)))

(declare-fun b!280368 () Bool)

(declare-fun e!200016 () Bool)

(assert (=> b!280368 (= e!200015 e!200016)))

(declare-fun res!232712 () Bool)

(assert (=> b!280368 (=> (not res!232712) (not e!200016))))

(assert (=> b!280368 (= res!232712 (= (select (arr!7995 a1!699) (_1!12449 lt!416802)) (select (arr!7995 a2!699) (_1!12449 lt!416802))))))

(declare-fun b!280369 () Bool)

(assert (=> b!280369 (= e!200016 (arrayRangesEq!1267 a1!699 a2!699 (bvadd (_1!12449 lt!416802) #b00000000000000000000000000000001) (_2!12449 lt!416802)))))

(assert (= (and d!96416 (not res!232711)) b!280368))

(assert (= (and b!280368 res!232712) b!280369))

(declare-fun m!413381 () Bool)

(assert (=> b!280368 m!413381))

(declare-fun m!413383 () Bool)

(assert (=> b!280368 m!413383))

(declare-fun m!413385 () Bool)

(assert (=> b!280369 m!413385))

(assert (=> b!280309 d!96416))

(declare-fun d!96430 () Bool)

(assert (=> d!96430 (arrayRangesEq!1267 a2!699 a1!699 (_1!12449 lt!416802) (_2!12449 lt!416802))))

(declare-fun lt!416826 () Unit!19661)

(declare-fun choose!481 (array!16187 array!16187 (_ BitVec 32) (_ BitVec 32)) Unit!19661)

(assert (=> d!96430 (= lt!416826 (choose!481 a1!699 a2!699 (_1!12449 lt!416802) (_2!12449 lt!416802)))))

(assert (=> d!96430 (and (bvsle #b00000000000000000000000000000000 (_1!12449 lt!416802)) (bvsle (_1!12449 lt!416802) (_2!12449 lt!416802)) (bvsle (_2!12449 lt!416802) (size!6999 a1!699)))))

(assert (=> d!96430 (= (arrayRangesEqSymmetricLemma!174 a1!699 a2!699 (_1!12449 lt!416802) (_2!12449 lt!416802)) lt!416826)))

(declare-fun bs!24309 () Bool)

(assert (= bs!24309 d!96430))

(assert (=> bs!24309 m!413341))

(declare-fun m!413393 () Bool)

(assert (=> bs!24309 m!413393))

(assert (=> b!280309 d!96430))

(declare-fun d!96434 () Bool)

(declare-fun res!232715 () Bool)

(declare-fun e!200019 () Bool)

(assert (=> d!96434 (=> res!232715 e!200019)))

(assert (=> d!96434 (= res!232715 (= (_1!12449 lt!416802) (_2!12449 lt!416802)))))

(assert (=> d!96434 (= (arrayRangesEq!1267 a2!699 a1!699 (_1!12449 lt!416802) (_2!12449 lt!416802)) e!200019)))

(declare-fun b!280372 () Bool)

(declare-fun e!200020 () Bool)

(assert (=> b!280372 (= e!200019 e!200020)))

(declare-fun res!232716 () Bool)

(assert (=> b!280372 (=> (not res!232716) (not e!200020))))

(assert (=> b!280372 (= res!232716 (= (select (arr!7995 a2!699) (_1!12449 lt!416802)) (select (arr!7995 a1!699) (_1!12449 lt!416802))))))

(declare-fun b!280373 () Bool)

(assert (=> b!280373 (= e!200020 (arrayRangesEq!1267 a2!699 a1!699 (bvadd (_1!12449 lt!416802) #b00000000000000000000000000000001) (_2!12449 lt!416802)))))

(assert (= (and d!96434 (not res!232715)) b!280372))

(assert (= (and b!280372 res!232716) b!280373))

(assert (=> b!280372 m!413383))

(assert (=> b!280372 m!413381))

(declare-fun m!413395 () Bool)

(assert (=> b!280373 m!413395))

(assert (=> b!280309 d!96434))

(declare-fun d!96436 () Bool)

(assert (=> d!96436 (= (arrayBitIndices!0 from!822 to!789) (tuple4!749 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280306 d!96436))

(declare-fun d!96440 () Bool)

(declare-fun res!232733 () Bool)

(declare-fun e!200040 () Bool)

(assert (=> d!96440 (=> res!232733 e!200040)))

(assert (=> d!96440 (= res!232733 (bvsge from!822 to!789))))

(assert (=> d!96440 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200040)))

(declare-fun b!280390 () Bool)

(declare-fun e!200037 () Bool)

(declare-fun e!200035 () Bool)

(assert (=> b!280390 (= e!200037 e!200035)))

(declare-fun c!13002 () Bool)

(declare-fun lt!416837 () tuple4!748)

(assert (=> b!280390 (= c!13002 (= (_3!1154 lt!416837) (_4!374 lt!416837)))))

(declare-fun b!280391 () Bool)

(declare-fun call!4628 () Bool)

(assert (=> b!280391 (= e!200035 call!4628)))

(declare-fun b!280392 () Bool)

(assert (=> b!280392 (= e!200040 e!200037)))

(declare-fun res!232729 () Bool)

(assert (=> b!280392 (=> (not res!232729) (not e!200037))))

(declare-fun e!200036 () Bool)

(assert (=> b!280392 (= res!232729 e!200036)))

(declare-fun res!232730 () Bool)

(assert (=> b!280392 (=> res!232730 e!200036)))

(assert (=> b!280392 (= res!232730 (bvsge (_1!12449 lt!416837) (_2!12449 lt!416837)))))

(declare-fun lt!416838 () (_ BitVec 32))

(assert (=> b!280392 (= lt!416838 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416836 () (_ BitVec 32))

(assert (=> b!280392 (= lt!416836 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280392 (= lt!416837 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280393 () Bool)

(declare-fun e!200038 () Bool)

(assert (=> b!280393 (= e!200038 call!4628)))

(declare-fun b!280394 () Bool)

(declare-fun res!232731 () Bool)

(assert (=> b!280394 (= res!232731 (= lt!416838 #b00000000000000000000000000000000))))

(assert (=> b!280394 (=> res!232731 e!200038)))

(declare-fun e!200039 () Bool)

(assert (=> b!280394 (= e!200039 e!200038)))

(declare-fun b!280395 () Bool)

(assert (=> b!280395 (= e!200036 (arrayRangesEq!1267 a1!699 a2!699 (_1!12449 lt!416837) (_2!12449 lt!416837)))))

(declare-fun bm!4625 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4625 (= call!4628 (byteRangesEq!0 (ite c!13002 (select (arr!7995 a1!699) (_3!1154 lt!416837)) (select (arr!7995 a1!699) (_4!374 lt!416837))) (ite c!13002 (select (arr!7995 a2!699) (_3!1154 lt!416837)) (select (arr!7995 a2!699) (_4!374 lt!416837))) (ite c!13002 lt!416836 #b00000000000000000000000000000000) lt!416838))))

(declare-fun b!280396 () Bool)

(assert (=> b!280396 (= e!200035 e!200039)))

(declare-fun res!232732 () Bool)

(assert (=> b!280396 (= res!232732 (byteRangesEq!0 (select (arr!7995 a1!699) (_3!1154 lt!416837)) (select (arr!7995 a2!699) (_3!1154 lt!416837)) lt!416836 #b00000000000000000000000000001000))))

(assert (=> b!280396 (=> (not res!232732) (not e!200039))))

(assert (= (and d!96440 (not res!232733)) b!280392))

(assert (= (and b!280392 (not res!232730)) b!280395))

(assert (= (and b!280392 res!232729) b!280390))

(assert (= (and b!280390 c!13002) b!280391))

(assert (= (and b!280390 (not c!13002)) b!280396))

(assert (= (and b!280396 res!232732) b!280394))

(assert (= (and b!280394 (not res!232731)) b!280393))

(assert (= (or b!280391 b!280393) bm!4625))

(assert (=> b!280392 m!413333))

(declare-fun m!413401 () Bool)

(assert (=> b!280395 m!413401))

(declare-fun m!413403 () Bool)

(assert (=> bm!4625 m!413403))

(declare-fun m!413405 () Bool)

(assert (=> bm!4625 m!413405))

(declare-fun m!413407 () Bool)

(assert (=> bm!4625 m!413407))

(declare-fun m!413409 () Bool)

(assert (=> bm!4625 m!413409))

(declare-fun m!413411 () Bool)

(assert (=> bm!4625 m!413411))

(assert (=> b!280396 m!413409))

(assert (=> b!280396 m!413411))

(assert (=> b!280396 m!413409))

(assert (=> b!280396 m!413411))

(declare-fun m!413413 () Bool)

(assert (=> b!280396 m!413413))

(assert (=> b!280307 d!96440))

(push 1)

(assert (not b!280373))

(assert (not d!96430))

(assert (not b!280396))

(assert (not b!280392))

(assert (not b!280395))

(assert (not bm!4625))

(assert (not b!280369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

