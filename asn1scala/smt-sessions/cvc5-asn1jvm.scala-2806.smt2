; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67584 () Bool)

(assert start!67584)

(declare-fun b!303401 () Bool)

(declare-datatypes ((Unit!21187 0))(
  ( (Unit!21188) )
))
(declare-fun e!218299 () Unit!21187)

(declare-fun Unit!21189 () Unit!21187)

(assert (=> b!303401 (= e!218299 Unit!21189)))

(declare-fun b!303402 () Bool)

(declare-fun res!249675 () Bool)

(declare-fun e!218295 () Bool)

(assert (=> b!303402 (=> (not res!249675) (not e!218295))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18437 0))(
  ( (array!18438 (arr!9085 (Array (_ BitVec 32) (_ BitVec 8))) (size!8002 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18437)

(declare-fun a2!948 () array!18437)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18437 array!18437 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303402 (= res!249675 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303403 () Bool)

(declare-fun lt!437773 () Unit!21187)

(assert (=> b!303403 (= e!218299 lt!437773)))

(declare-datatypes ((tuple4!1146 0))(
  ( (tuple4!1147 (_1!13228 (_ BitVec 32)) (_2!13228 (_ BitVec 32)) (_3!1530 (_ BitVec 32)) (_4!573 (_ BitVec 32))) )
))
(declare-fun lt!437775 () tuple4!1146)

(declare-fun lt!437772 () tuple4!1146)

(declare-fun arrayRangesEqSlicedLemma!226 (array!18437 array!18437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21187)

(assert (=> b!303403 (= lt!437773 (arrayRangesEqSlicedLemma!226 a1!948 a2!948 (_1!13228 lt!437772) (_2!13228 lt!437772) (_1!13228 lt!437775) (_2!13228 lt!437775)))))

(declare-fun arrayRangesEq!1631 (array!18437 array!18437 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303403 (arrayRangesEq!1631 a1!948 a2!948 (_1!13228 lt!437775) (_2!13228 lt!437775))))

(declare-fun b!303404 () Bool)

(declare-fun res!249676 () Bool)

(assert (=> b!303404 (=> (not res!249676) (not e!218295))))

(declare-fun lt!437774 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303404 (= res!249676 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437774) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303406 () Bool)

(declare-fun e!218296 () Bool)

(assert (=> b!303406 (= e!218296 e!218295)))

(declare-fun res!249678 () Bool)

(assert (=> b!303406 (=> (not res!249678) (not e!218295))))

(assert (=> b!303406 (= res!249678 (and (bvsle toBit!258 lt!437774) (bvsle fromBit!258 lt!437774)))))

(assert (=> b!303406 (= lt!437774 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8002 a1!948))))))

(declare-fun b!303405 () Bool)

(assert (=> b!303405 (= e!218295 (and (not (= (_3!1530 lt!437772) (_4!573 lt!437772))) (or (bvslt (_3!1530 lt!437772) #b00000000000000000000000000000000) (bvsge (_3!1530 lt!437772) (size!8002 a2!948)))))))

(declare-fun lt!437771 () Unit!21187)

(assert (=> b!303405 (= lt!437771 e!218299)))

(declare-fun c!14445 () Bool)

(assert (=> b!303405 (= c!14445 (bvslt (_1!13228 lt!437775) (_2!13228 lt!437775)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1146)

(assert (=> b!303405 (= lt!437775 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303405 (= lt!437772 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!249677 () Bool)

(assert (=> start!67584 (=> (not res!249677) (not e!218296))))

(assert (=> start!67584 (= res!249677 (and (bvsle (size!8002 a1!948) (size!8002 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67584 e!218296))

(assert (=> start!67584 true))

(declare-fun array_inv!7614 (array!18437) Bool)

(assert (=> start!67584 (array_inv!7614 a1!948)))

(assert (=> start!67584 (array_inv!7614 a2!948)))

(assert (= (and start!67584 res!249677) b!303406))

(assert (= (and b!303406 res!249678) b!303402))

(assert (= (and b!303402 res!249675) b!303404))

(assert (= (and b!303404 res!249676) b!303405))

(assert (= (and b!303405 c!14445) b!303403))

(assert (= (and b!303405 (not c!14445)) b!303401))

(declare-fun m!442017 () Bool)

(assert (=> b!303402 m!442017))

(declare-fun m!442019 () Bool)

(assert (=> b!303403 m!442019))

(declare-fun m!442021 () Bool)

(assert (=> b!303403 m!442021))

(declare-fun m!442023 () Bool)

(assert (=> b!303405 m!442023))

(declare-fun m!442025 () Bool)

(assert (=> b!303405 m!442025))

(declare-fun m!442027 () Bool)

(assert (=> start!67584 m!442027))

(declare-fun m!442029 () Bool)

(assert (=> start!67584 m!442029))

(push 1)

(assert (not start!67584))

(assert (not b!303402))

(assert (not b!303405))

(assert (not b!303403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101360 () Bool)

(assert (=> d!101360 (= (array_inv!7614 a1!948) (bvsge (size!8002 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67584 d!101360))

(declare-fun d!101362 () Bool)

(assert (=> d!101362 (= (array_inv!7614 a2!948) (bvsge (size!8002 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67584 d!101362))

(declare-fun b!303469 () Bool)

(declare-fun e!218355 () Bool)

(declare-fun e!218356 () Bool)

(assert (=> b!303469 (= e!218355 e!218356)))

(declare-fun res!249727 () Bool)

(assert (=> b!303469 (=> (not res!249727) (not e!218356))))

(declare-fun e!218359 () Bool)

(assert (=> b!303469 (= res!249727 e!218359)))

(declare-fun res!249726 () Bool)

(assert (=> b!303469 (=> res!249726 e!218359)))

(declare-fun lt!437819 () tuple4!1146)

(assert (=> b!303469 (= res!249726 (bvsge (_1!13228 lt!437819) (_2!13228 lt!437819)))))

(declare-fun lt!437818 () (_ BitVec 32))

(assert (=> b!303469 (= lt!437818 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437820 () (_ BitVec 32))

(assert (=> b!303469 (= lt!437820 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303469 (= lt!437819 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!101364 () Bool)

(declare-fun res!249728 () Bool)

(assert (=> d!101364 (=> res!249728 e!218355)))

(assert (=> d!101364 (= res!249728 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101364 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218355)))

(declare-fun b!303470 () Bool)

(declare-fun e!218357 () Bool)

(declare-fun e!218358 () Bool)

(assert (=> b!303470 (= e!218357 e!218358)))

(declare-fun res!249725 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303470 (= res!249725 (byteRangesEq!0 (select (arr!9085 a1!948) (_3!1530 lt!437819)) (select (arr!9085 a2!948) (_3!1530 lt!437819)) lt!437820 #b00000000000000000000000000001000))))

(assert (=> b!303470 (=> (not res!249725) (not e!218358))))

(declare-fun b!303471 () Bool)

(declare-fun call!5588 () Bool)

(assert (=> b!303471 (= e!218357 call!5588)))

(declare-fun b!303472 () Bool)

(declare-fun e!218354 () Bool)

(assert (=> b!303472 (= e!218354 call!5588)))

(declare-fun bm!5585 () Bool)

(declare-fun c!14454 () Bool)

(assert (=> bm!5585 (= call!5588 (byteRangesEq!0 (ite c!14454 (select (arr!9085 a1!948) (_3!1530 lt!437819)) (select (arr!9085 a1!948) (_4!573 lt!437819))) (ite c!14454 (select (arr!9085 a2!948) (_3!1530 lt!437819)) (select (arr!9085 a2!948) (_4!573 lt!437819))) (ite c!14454 lt!437820 #b00000000000000000000000000000000) lt!437818))))

(declare-fun b!303473 () Bool)

(assert (=> b!303473 (= e!218356 e!218357)))

(assert (=> b!303473 (= c!14454 (= (_3!1530 lt!437819) (_4!573 lt!437819)))))

(declare-fun b!303474 () Bool)

(declare-fun res!249729 () Bool)

(assert (=> b!303474 (= res!249729 (= lt!437818 #b00000000000000000000000000000000))))

(assert (=> b!303474 (=> res!249729 e!218354)))

(assert (=> b!303474 (= e!218358 e!218354)))

(declare-fun b!303475 () Bool)

(assert (=> b!303475 (= e!218359 (arrayRangesEq!1631 a1!948 a2!948 (_1!13228 lt!437819) (_2!13228 lt!437819)))))

(assert (= (and d!101364 (not res!249728)) b!303469))

(assert (= (and b!303469 (not res!249726)) b!303475))

(assert (= (and b!303469 res!249727) b!303473))

(assert (= (and b!303473 c!14454) b!303471))

(assert (= (and b!303473 (not c!14454)) b!303470))

(assert (= (and b!303470 res!249725) b!303474))

(assert (= (and b!303474 (not res!249729)) b!303472))

(assert (= (or b!303471 b!303472) bm!5585))

(assert (=> b!303469 m!442025))

(declare-fun m!442075 () Bool)

(assert (=> b!303470 m!442075))

(declare-fun m!442077 () Bool)

(assert (=> b!303470 m!442077))

(assert (=> b!303470 m!442075))

(assert (=> b!303470 m!442077))

(declare-fun m!442079 () Bool)

(assert (=> b!303470 m!442079))

(assert (=> bm!5585 m!442075))

(declare-fun m!442081 () Bool)

(assert (=> bm!5585 m!442081))

(declare-fun m!442083 () Bool)

(assert (=> bm!5585 m!442083))

(declare-fun m!442085 () Bool)

(assert (=> bm!5585 m!442085))

(assert (=> bm!5585 m!442077))

(declare-fun m!442087 () Bool)

(assert (=> b!303475 m!442087))

(assert (=> b!303402 d!101364))

(declare-fun d!101384 () Bool)

(assert (=> d!101384 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1147 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303405 d!101384))

(declare-fun d!101386 () Bool)

(assert (=> d!101386 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1147 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303405 d!101386))

(declare-fun d!101388 () Bool)

(assert (=> d!101388 (arrayRangesEq!1631 a1!948 a2!948 (_1!13228 lt!437775) (_2!13228 lt!437775))))

(declare-fun lt!437829 () Unit!21187)

(declare-fun choose!559 (array!18437 array!18437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21187)

(assert (=> d!101388 (= lt!437829 (choose!559 a1!948 a2!948 (_1!13228 lt!437772) (_2!13228 lt!437772) (_1!13228 lt!437775) (_2!13228 lt!437775)))))

(assert (=> d!101388 (and (bvsle #b00000000000000000000000000000000 (_1!13228 lt!437772)) (bvsle (_1!13228 lt!437772) (_2!13228 lt!437772)))))

(assert (=> d!101388 (= (arrayRangesEqSlicedLemma!226 a1!948 a2!948 (_1!13228 lt!437772) (_2!13228 lt!437772) (_1!13228 lt!437775) (_2!13228 lt!437775)) lt!437829)))

(declare-fun bs!26141 () Bool)

(assert (= bs!26141 d!101388))

(assert (=> bs!26141 m!442021))

(declare-fun m!442089 () Bool)

(assert (=> bs!26141 m!442089))

(assert (=> b!303403 d!101388))

(declare-fun d!101390 () Bool)

(declare-fun res!249754 () Bool)

(declare-fun e!218388 () Bool)

(assert (=> d!101390 (=> res!249754 e!218388)))

(assert (=> d!101390 (= res!249754 (= (_1!13228 lt!437775) (_2!13228 lt!437775)))))

(assert (=> d!101390 (= (arrayRangesEq!1631 a1!948 a2!948 (_1!13228 lt!437775) (_2!13228 lt!437775)) e!218388)))

(declare-fun b!303508 () Bool)

(declare-fun e!218389 () Bool)

(assert (=> b!303508 (= e!218388 e!218389)))

(declare-fun res!249755 () Bool)

(assert (=> b!303508 (=> (not res!249755) (not e!218389))))

(assert (=> b!303508 (= res!249755 (= (select (arr!9085 a1!948) (_1!13228 lt!437775)) (select (arr!9085 a2!948) (_1!13228 lt!437775))))))

(declare-fun b!303509 () Bool)

(assert (=> b!303509 (= e!218389 (arrayRangesEq!1631 a1!948 a2!948 (bvadd (_1!13228 lt!437775) #b00000000000000000000000000000001) (_2!13228 lt!437775)))))

(assert (= (and d!101390 (not res!249754)) b!303508))

(assert (= (and b!303508 res!249755) b!303509))

(declare-fun m!442091 () Bool)

(assert (=> b!303508 m!442091))

(declare-fun m!442093 () Bool)

(assert (=> b!303508 m!442093))

(declare-fun m!442095 () Bool)

(assert (=> b!303509 m!442095))

(assert (=> b!303403 d!101390))

(push 1)

(assert (not b!303509))

(assert (not d!101388))

(assert (not b!303475))

(assert (not b!303470))

(assert (not bm!5585))

(assert (not b!303469))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

