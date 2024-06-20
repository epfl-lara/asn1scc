; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62308 () Bool)

(assert start!62308)

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16133 0))(
  ( (array!16134 (arr!7977 (Array (_ BitVec 32) (_ BitVec 8))) (size!6981 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16133)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun b!279446 () Bool)

(declare-datatypes ((tuple4!712 0))(
  ( (tuple4!713 (_1!12431 (_ BitVec 32)) (_2!12431 (_ BitVec 32)) (_3!1136 (_ BitVec 32)) (_4!356 (_ BitVec 32))) )
))
(declare-fun lt!416379 () tuple4!712)

(declare-fun a1!699 () array!16133)

(declare-fun e!199211 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279446 (= e!199211 (not (byteRangesEq!0 (select (arr!7977 a1!699) (_3!1136 lt!416379)) (select (arr!7977 a2!699) (_3!1136 lt!416379)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun b!279447 () Bool)

(declare-fun res!232027 () Bool)

(declare-fun e!199213 () Bool)

(assert (=> b!279447 (=> (not res!232027) (not e!199213))))

(declare-fun arrayBitRangesEq!0 (array!16133 array!16133 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279447 (= res!232027 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279448 () Bool)

(declare-datatypes ((Unit!19589 0))(
  ( (Unit!19590) )
))
(declare-fun e!199215 () Unit!19589)

(declare-fun Unit!19591 () Unit!19589)

(assert (=> b!279448 (= e!199215 Unit!19591)))

(declare-fun res!232025 () Bool)

(assert (=> start!62308 (=> (not res!232025) (not e!199213))))

(assert (=> start!62308 (= res!232025 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6981 a1!699) (size!6981 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6981 a1!699))))))))

(assert (=> start!62308 e!199213))

(assert (=> start!62308 true))

(declare-fun array_inv!6705 (array!16133) Bool)

(assert (=> start!62308 (array_inv!6705 a1!699)))

(assert (=> start!62308 (array_inv!6705 a2!699)))

(declare-fun b!279449 () Bool)

(declare-fun res!232026 () Bool)

(assert (=> b!279449 (=> (not res!232026) (not e!199213))))

(assert (=> b!279449 (= res!232026 (bvslt from!822 to!789))))

(declare-fun b!279450 () Bool)

(declare-fun Unit!19592 () Unit!19589)

(assert (=> b!279450 (= e!199215 Unit!19592)))

(declare-fun arrayRangesEq!1249 (array!16133 array!16133 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279450 (arrayRangesEq!1249 a1!699 a2!699 (_1!12431 lt!416379) (_2!12431 lt!416379))))

(declare-fun lt!416377 () Unit!19589)

(declare-fun arrayRangesEqSymmetricLemma!156 (array!16133 array!16133 (_ BitVec 32) (_ BitVec 32)) Unit!19589)

(assert (=> b!279450 (= lt!416377 (arrayRangesEqSymmetricLemma!156 a1!699 a2!699 (_1!12431 lt!416379) (_2!12431 lt!416379)))))

(assert (=> b!279450 (arrayRangesEq!1249 a2!699 a1!699 (_1!12431 lt!416379) (_2!12431 lt!416379))))

(declare-fun b!279451 () Bool)

(assert (=> b!279451 (= e!199213 e!199211)))

(declare-fun res!232028 () Bool)

(assert (=> b!279451 (=> (not res!232028) (not e!199211))))

(assert (=> b!279451 (= res!232028 (= (_3!1136 lt!416379) (_4!356 lt!416379)))))

(declare-fun lt!416378 () Unit!19589)

(assert (=> b!279451 (= lt!416378 e!199215)))

(declare-fun c!12882 () Bool)

(assert (=> b!279451 (= c!12882 (bvslt (_1!12431 lt!416379) (_2!12431 lt!416379)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!712)

(assert (=> b!279451 (= lt!416379 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62308 res!232025) b!279447))

(assert (= (and b!279447 res!232027) b!279449))

(assert (= (and b!279449 res!232026) b!279451))

(assert (= (and b!279451 c!12882) b!279450))

(assert (= (and b!279451 (not c!12882)) b!279448))

(assert (= (and b!279451 res!232028) b!279446))

(declare-fun m!412475 () Bool)

(assert (=> b!279451 m!412475))

(declare-fun m!412477 () Bool)

(assert (=> b!279450 m!412477))

(declare-fun m!412479 () Bool)

(assert (=> b!279450 m!412479))

(declare-fun m!412481 () Bool)

(assert (=> b!279450 m!412481))

(declare-fun m!412483 () Bool)

(assert (=> b!279446 m!412483))

(declare-fun m!412485 () Bool)

(assert (=> b!279446 m!412485))

(assert (=> b!279446 m!412483))

(assert (=> b!279446 m!412485))

(declare-fun m!412487 () Bool)

(assert (=> b!279446 m!412487))

(declare-fun m!412489 () Bool)

(assert (=> b!279447 m!412489))

(declare-fun m!412491 () Bool)

(assert (=> start!62308 m!412491))

(declare-fun m!412493 () Bool)

(assert (=> start!62308 m!412493))

(push 1)

(assert (not b!279450))

(assert (not start!62308))

(assert (not b!279447))

(assert (not b!279451))

(assert (not b!279446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96094 () Bool)

(declare-fun res!232048 () Bool)

(declare-fun e!199238 () Bool)

(assert (=> d!96094 (=> res!232048 e!199238)))

(assert (=> d!96094 (= res!232048 (= (_1!12431 lt!416379) (_2!12431 lt!416379)))))

(assert (=> d!96094 (= (arrayRangesEq!1249 a1!699 a2!699 (_1!12431 lt!416379) (_2!12431 lt!416379)) e!199238)))

(declare-fun b!279477 () Bool)

(declare-fun e!199239 () Bool)

(assert (=> b!279477 (= e!199238 e!199239)))

(declare-fun res!232049 () Bool)

(assert (=> b!279477 (=> (not res!232049) (not e!199239))))

(assert (=> b!279477 (= res!232049 (= (select (arr!7977 a1!699) (_1!12431 lt!416379)) (select (arr!7977 a2!699) (_1!12431 lt!416379))))))

(declare-fun b!279478 () Bool)

(assert (=> b!279478 (= e!199239 (arrayRangesEq!1249 a1!699 a2!699 (bvadd (_1!12431 lt!416379) #b00000000000000000000000000000001) (_2!12431 lt!416379)))))

(assert (= (and d!96094 (not res!232048)) b!279477))

(assert (= (and b!279477 res!232049) b!279478))

(declare-fun m!412513 () Bool)

(assert (=> b!279477 m!412513))

(declare-fun m!412515 () Bool)

(assert (=> b!279477 m!412515))

(declare-fun m!412517 () Bool)

(assert (=> b!279478 m!412517))

(assert (=> b!279450 d!96094))

(declare-fun d!96098 () Bool)

(assert (=> d!96098 (arrayRangesEq!1249 a2!699 a1!699 (_1!12431 lt!416379) (_2!12431 lt!416379))))

(declare-fun lt!416391 () Unit!19589)

(declare-fun choose!465 (array!16133 array!16133 (_ BitVec 32) (_ BitVec 32)) Unit!19589)

(assert (=> d!96098 (= lt!416391 (choose!465 a1!699 a2!699 (_1!12431 lt!416379) (_2!12431 lt!416379)))))

(assert (=> d!96098 (and (bvsle #b00000000000000000000000000000000 (_1!12431 lt!416379)) (bvsle (_1!12431 lt!416379) (_2!12431 lt!416379)) (bvsle (_2!12431 lt!416379) (size!6981 a1!699)))))

(assert (=> d!96098 (= (arrayRangesEqSymmetricLemma!156 a1!699 a2!699 (_1!12431 lt!416379) (_2!12431 lt!416379)) lt!416391)))

(declare-fun bs!24252 () Bool)

(assert (= bs!24252 d!96098))

(assert (=> bs!24252 m!412481))

(declare-fun m!412519 () Bool)

(assert (=> bs!24252 m!412519))

(assert (=> b!279450 d!96098))

(declare-fun d!96102 () Bool)

(declare-fun res!232050 () Bool)

(declare-fun e!199240 () Bool)

(assert (=> d!96102 (=> res!232050 e!199240)))

(assert (=> d!96102 (= res!232050 (= (_1!12431 lt!416379) (_2!12431 lt!416379)))))

(assert (=> d!96102 (= (arrayRangesEq!1249 a2!699 a1!699 (_1!12431 lt!416379) (_2!12431 lt!416379)) e!199240)))

(declare-fun b!279479 () Bool)

(declare-fun e!199241 () Bool)

(assert (=> b!279479 (= e!199240 e!199241)))

(declare-fun res!232051 () Bool)

(assert (=> b!279479 (=> (not res!232051) (not e!199241))))

(assert (=> b!279479 (= res!232051 (= (select (arr!7977 a2!699) (_1!12431 lt!416379)) (select (arr!7977 a1!699) (_1!12431 lt!416379))))))

(declare-fun b!279480 () Bool)

(assert (=> b!279480 (= e!199241 (arrayRangesEq!1249 a2!699 a1!699 (bvadd (_1!12431 lt!416379) #b00000000000000000000000000000001) (_2!12431 lt!416379)))))

(assert (= (and d!96102 (not res!232050)) b!279479))

(assert (= (and b!279479 res!232051) b!279480))

(assert (=> b!279479 m!412515))

(assert (=> b!279479 m!412513))

(declare-fun m!412521 () Bool)

(assert (=> b!279480 m!412521))

(assert (=> b!279450 d!96102))

(declare-fun d!96104 () Bool)

(assert (=> d!96104 (= (arrayBitIndices!0 from!822 to!789) (tuple4!713 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279451 d!96104))

(declare-fun d!96108 () Bool)

(assert (=> d!96108 (= (byteRangesEq!0 (select (arr!7977 a1!699) (_3!1136 lt!416379)) (select (arr!7977 a2!699) (_3!1136 lt!416379)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7977 a1!699) (_3!1136 lt!416379))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7977 a2!699) (_3!1136 lt!416379))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24254 () Bool)

(assert (= bs!24254 d!96108))

(declare-fun m!412533 () Bool)

(assert (=> bs!24254 m!412533))

(declare-fun m!412535 () Bool)

(assert (=> bs!24254 m!412535))

(assert (=> b!279446 d!96108))

(declare-fun lt!416413 () tuple4!712)

(declare-fun b!279532 () Bool)

(declare-fun e!199289 () Bool)

(assert (=> b!279532 (= e!199289 (arrayRangesEq!1249 a1!699 a2!699 (_1!12431 lt!416413) (_2!12431 lt!416413)))))

(declare-fun d!96118 () Bool)

(declare-fun res!232096 () Bool)

(declare-fun e!199291 () Bool)

(assert (=> d!96118 (=> res!232096 e!199291)))

(assert (=> d!96118 (= res!232096 (bvsge from!822 to!789))))

(assert (=> d!96118 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199291)))

(declare-fun e!199293 () Bool)

(declare-fun b!279533 () Bool)

(declare-fun lt!416414 () (_ BitVec 32))

(assert (=> b!279533 (= e!199293 (byteRangesEq!0 (select (arr!7977 a1!699) (_4!356 lt!416413)) (select (arr!7977 a2!699) (_4!356 lt!416413)) #b00000000000000000000000000000000 lt!416414))))

(declare-fun b!279534 () Bool)

(declare-fun e!199290 () Bool)

(declare-fun call!4571 () Bool)

(assert (=> b!279534 (= e!199290 call!4571)))

(declare-fun b!279535 () Bool)

(declare-fun res!232095 () Bool)

(assert (=> b!279535 (= res!232095 (= lt!416414 #b00000000000000000000000000000000))))

(assert (=> b!279535 (=> res!232095 e!199293)))

(declare-fun e!199288 () Bool)

(assert (=> b!279535 (= e!199288 e!199293)))

(declare-fun lt!416415 () (_ BitVec 32))

(declare-fun c!12891 () Bool)

(declare-fun bm!4568 () Bool)

(assert (=> bm!4568 (= call!4571 (byteRangesEq!0 (select (arr!7977 a1!699) (_3!1136 lt!416413)) (select (arr!7977 a2!699) (_3!1136 lt!416413)) lt!416415 (ite c!12891 lt!416414 #b00000000000000000000000000001000)))))

(declare-fun b!279536 () Bool)

(assert (=> b!279536 (= e!199290 e!199288)))

(declare-fun res!232094 () Bool)

(assert (=> b!279536 (= res!232094 call!4571)))

(assert (=> b!279536 (=> (not res!232094) (not e!199288))))

(declare-fun b!279537 () Bool)

(declare-fun e!199292 () Bool)

(assert (=> b!279537 (= e!199291 e!199292)))

(declare-fun res!232093 () Bool)

(assert (=> b!279537 (=> (not res!232093) (not e!199292))))

(assert (=> b!279537 (= res!232093 e!199289)))

(declare-fun res!232097 () Bool)

(assert (=> b!279537 (=> res!232097 e!199289)))

(assert (=> b!279537 (= res!232097 (bvsge (_1!12431 lt!416413) (_2!12431 lt!416413)))))

(assert (=> b!279537 (= lt!416414 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279537 (= lt!416415 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279537 (= lt!416413 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279538 () Bool)

(assert (=> b!279538 (= e!199292 e!199290)))

(assert (=> b!279538 (= c!12891 (= (_3!1136 lt!416413) (_4!356 lt!416413)))))

(assert (= (and d!96118 (not res!232096)) b!279537))

(assert (= (and b!279537 (not res!232097)) b!279532))

