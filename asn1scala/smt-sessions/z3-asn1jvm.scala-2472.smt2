; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62882 () Bool)

(assert start!62882)

(declare-fun b!281465 () Bool)

(declare-datatypes ((Unit!19753 0))(
  ( (Unit!19754) )
))
(declare-fun e!200975 () Unit!19753)

(declare-fun Unit!19755 () Unit!19753)

(assert (=> b!281465 (= e!200975 Unit!19755)))

(declare-fun b!281466 () Bool)

(declare-fun res!233545 () Bool)

(declare-fun e!200977 () Bool)

(assert (=> b!281466 (=> (not res!233545) (not e!200977))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!281466 (= res!233545 (bvslt from!822 to!789))))

(declare-fun b!281467 () Bool)

(declare-fun Unit!19756 () Unit!19753)

(assert (=> b!281467 (= e!200975 Unit!19756)))

(declare-datatypes ((array!16257 0))(
  ( (array!16258 (arr!8018 (Array (_ BitVec 32) (_ BitVec 8))) (size!7022 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16257)

(declare-fun a2!699 () array!16257)

(declare-datatypes ((tuple4!794 0))(
  ( (tuple4!795 (_1!12472 (_ BitVec 32)) (_2!12472 (_ BitVec 32)) (_3!1177 (_ BitVec 32)) (_4!397 (_ BitVec 32))) )
))
(declare-fun lt!417351 () tuple4!794)

(declare-fun arrayRangesEq!1290 (array!16257 array!16257 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281467 (arrayRangesEq!1290 a1!699 a2!699 (_1!12472 lt!417351) (_2!12472 lt!417351))))

(declare-fun lt!417354 () Unit!19753)

(declare-fun arrayRangesEqSymmetricLemma!197 (array!16257 array!16257 (_ BitVec 32) (_ BitVec 32)) Unit!19753)

(assert (=> b!281467 (= lt!417354 (arrayRangesEqSymmetricLemma!197 a1!699 a2!699 (_1!12472 lt!417351) (_2!12472 lt!417351)))))

(assert (=> b!281467 (arrayRangesEq!1290 a2!699 a1!699 (_1!12472 lt!417351) (_2!12472 lt!417351))))

(declare-fun b!281468 () Bool)

(declare-fun res!233544 () Bool)

(assert (=> b!281468 (=> (not res!233544) (not e!200977))))

(declare-fun arrayBitRangesEq!0 (array!16257 array!16257 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!281468 (= res!233544 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!281469 () Bool)

(declare-fun e!200973 () Bool)

(declare-fun e!200979 () Bool)

(assert (=> b!281469 (= e!200973 e!200979)))

(declare-fun res!233546 () Bool)

(assert (=> b!281469 (=> res!233546 e!200979)))

(declare-fun lt!417352 () (_ BitVec 32))

(assert (=> b!281469 (= res!233546 (= lt!417352 #b00000000000000000000000000000000))))

(declare-fun e!200974 () Bool)

(declare-fun b!281470 () Bool)

(assert (=> b!281470 (= e!200974 (not (or (= lt!417352 #b00000000000000000000000000000000) (and (bvsge (_4!397 lt!417351) #b00000000000000000000000000000000) (bvslt (_4!397 lt!417351) (size!7022 a2!699))))))))

(assert (=> b!281470 e!200973))

(declare-fun res!233543 () Bool)

(assert (=> b!281470 (=> (not res!233543) (not e!200973))))

(declare-fun lt!417350 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281470 (= res!233543 (byteRangesEq!0 (select (arr!8018 a1!699) (_3!1177 lt!417351)) (select (arr!8018 a2!699) (_3!1177 lt!417351)) lt!417350 #b00000000000000000000000000001000))))

(declare-fun res!233542 () Bool)

(assert (=> start!62882 (=> (not res!233542) (not e!200977))))

(assert (=> start!62882 (= res!233542 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7022 a1!699) (size!7022 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7022 a1!699))))))))

(assert (=> start!62882 e!200977))

(assert (=> start!62882 true))

(declare-fun array_inv!6746 (array!16257) Bool)

(assert (=> start!62882 (array_inv!6746 a1!699)))

(assert (=> start!62882 (array_inv!6746 a2!699)))

(declare-fun b!281471 () Bool)

(assert (=> b!281471 (= e!200977 e!200974)))

(declare-fun res!233541 () Bool)

(assert (=> b!281471 (=> (not res!233541) (not e!200974))))

(assert (=> b!281471 (= res!233541 (not (= (_3!1177 lt!417351) (_4!397 lt!417351))))))

(declare-fun lt!417353 () Unit!19753)

(assert (=> b!281471 (= lt!417353 e!200975)))

(declare-fun c!13134 () Bool)

(assert (=> b!281471 (= c!13134 (bvslt (_1!12472 lt!417351) (_2!12472 lt!417351)))))

(assert (=> b!281471 (= lt!417352 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281471 (= lt!417350 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!794)

(assert (=> b!281471 (= lt!417351 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281472 () Bool)

(assert (=> b!281472 (= e!200979 (byteRangesEq!0 (select (arr!8018 a1!699) (_4!397 lt!417351)) (select (arr!8018 a2!699) (_4!397 lt!417351)) #b00000000000000000000000000000000 lt!417352))))

(declare-fun b!281473 () Bool)

(declare-fun res!233540 () Bool)

(assert (=> b!281473 (=> (not res!233540) (not e!200973))))

(assert (=> b!281473 (= res!233540 (byteRangesEq!0 (select (arr!8018 a2!699) (_3!1177 lt!417351)) (select (arr!8018 a1!699) (_3!1177 lt!417351)) lt!417350 #b00000000000000000000000000001000))))

(assert (= (and start!62882 res!233542) b!281468))

(assert (= (and b!281468 res!233544) b!281466))

(assert (= (and b!281466 res!233545) b!281471))

(assert (= (and b!281471 c!13134) b!281467))

(assert (= (and b!281471 (not c!13134)) b!281465))

(assert (= (and b!281471 res!233541) b!281470))

(assert (= (and b!281470 res!233543) b!281473))

(assert (= (and b!281473 res!233540) b!281469))

(assert (= (and b!281469 (not res!233546)) b!281472))

(declare-fun m!414505 () Bool)

(assert (=> b!281471 m!414505))

(declare-fun m!414507 () Bool)

(assert (=> b!281470 m!414507))

(declare-fun m!414509 () Bool)

(assert (=> b!281470 m!414509))

(assert (=> b!281470 m!414507))

(assert (=> b!281470 m!414509))

(declare-fun m!414511 () Bool)

(assert (=> b!281470 m!414511))

(declare-fun m!414513 () Bool)

(assert (=> b!281472 m!414513))

(declare-fun m!414515 () Bool)

(assert (=> b!281472 m!414515))

(assert (=> b!281472 m!414513))

(assert (=> b!281472 m!414515))

(declare-fun m!414517 () Bool)

(assert (=> b!281472 m!414517))

(declare-fun m!414519 () Bool)

(assert (=> b!281467 m!414519))

(declare-fun m!414521 () Bool)

(assert (=> b!281467 m!414521))

(declare-fun m!414523 () Bool)

(assert (=> b!281467 m!414523))

(assert (=> b!281473 m!414509))

(assert (=> b!281473 m!414507))

(assert (=> b!281473 m!414509))

(assert (=> b!281473 m!414507))

(declare-fun m!414525 () Bool)

(assert (=> b!281473 m!414525))

(declare-fun m!414527 () Bool)

(assert (=> b!281468 m!414527))

(declare-fun m!414529 () Bool)

(assert (=> start!62882 m!414529))

(declare-fun m!414531 () Bool)

(assert (=> start!62882 m!414531))

(check-sat (not b!281471) (not b!281468) (not b!281467) (not start!62882) (not b!281472) (not b!281473) (not b!281470))
(check-sat)
(get-model)

(declare-fun d!96824 () Bool)

(assert (=> d!96824 (= (byteRangesEq!0 (select (arr!8018 a2!699) (_3!1177 lt!417351)) (select (arr!8018 a1!699) (_3!1177 lt!417351)) lt!417350 #b00000000000000000000000000001000) (or (= lt!417350 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8018 a2!699) (_3!1177 lt!417351))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417350)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8018 a1!699) (_3!1177 lt!417351))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417350)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24392 () Bool)

(assert (= bs!24392 d!96824))

(declare-fun m!414561 () Bool)

(assert (=> bs!24392 m!414561))

(declare-fun m!414563 () Bool)

(assert (=> bs!24392 m!414563))

(assert (=> b!281473 d!96824))

(declare-fun b!281515 () Bool)

(declare-fun e!201013 () Bool)

(declare-fun e!201014 () Bool)

(assert (=> b!281515 (= e!201013 e!201014)))

(declare-fun lt!417377 () (_ BitVec 32))

(declare-fun lt!417376 () tuple4!794)

(declare-fun res!233580 () Bool)

(assert (=> b!281515 (= res!233580 (byteRangesEq!0 (select (arr!8018 a1!699) (_3!1177 lt!417376)) (select (arr!8018 a2!699) (_3!1177 lt!417376)) lt!417377 #b00000000000000000000000000001000))))

(assert (=> b!281515 (=> (not res!233580) (not e!201014))))

(declare-fun b!281516 () Bool)

(declare-fun e!201016 () Bool)

(assert (=> b!281516 (= e!201016 e!201013)))

(declare-fun c!13140 () Bool)

(assert (=> b!281516 (= c!13140 (= (_3!1177 lt!417376) (_4!397 lt!417376)))))

(declare-fun b!281518 () Bool)

(declare-fun e!201015 () Bool)

(assert (=> b!281518 (= e!201015 e!201016)))

(declare-fun res!233581 () Bool)

(assert (=> b!281518 (=> (not res!233581) (not e!201016))))

(declare-fun e!201017 () Bool)

(assert (=> b!281518 (= res!233581 e!201017)))

(declare-fun res!233579 () Bool)

(assert (=> b!281518 (=> res!233579 e!201017)))

(assert (=> b!281518 (= res!233579 (bvsge (_1!12472 lt!417376) (_2!12472 lt!417376)))))

(declare-fun lt!417378 () (_ BitVec 32))

(assert (=> b!281518 (= lt!417378 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281518 (= lt!417377 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281518 (= lt!417376 (arrayBitIndices!0 from!822 to!789))))

(declare-fun call!4694 () Bool)

(declare-fun bm!4691 () Bool)

(assert (=> bm!4691 (= call!4694 (byteRangesEq!0 (ite c!13140 (select (arr!8018 a1!699) (_3!1177 lt!417376)) (select (arr!8018 a1!699) (_4!397 lt!417376))) (ite c!13140 (select (arr!8018 a2!699) (_3!1177 lt!417376)) (select (arr!8018 a2!699) (_4!397 lt!417376))) (ite c!13140 lt!417377 #b00000000000000000000000000000000) lt!417378))))

(declare-fun b!281519 () Bool)

(declare-fun res!233582 () Bool)

(assert (=> b!281519 (= res!233582 (= lt!417378 #b00000000000000000000000000000000))))

(declare-fun e!201018 () Bool)

(assert (=> b!281519 (=> res!233582 e!201018)))

(assert (=> b!281519 (= e!201014 e!201018)))

(declare-fun d!96826 () Bool)

(declare-fun res!233578 () Bool)

(assert (=> d!96826 (=> res!233578 e!201015)))

(assert (=> d!96826 (= res!233578 (bvsge from!822 to!789))))

(assert (=> d!96826 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201015)))

(declare-fun b!281517 () Bool)

(assert (=> b!281517 (= e!201013 call!4694)))

(declare-fun b!281520 () Bool)

(assert (=> b!281520 (= e!201018 call!4694)))

(declare-fun b!281521 () Bool)

(assert (=> b!281521 (= e!201017 (arrayRangesEq!1290 a1!699 a2!699 (_1!12472 lt!417376) (_2!12472 lt!417376)))))

(assert (= (and d!96826 (not res!233578)) b!281518))

(assert (= (and b!281518 (not res!233579)) b!281521))

(assert (= (and b!281518 res!233581) b!281516))

(assert (= (and b!281516 c!13140) b!281517))

(assert (= (and b!281516 (not c!13140)) b!281515))

(assert (= (and b!281515 res!233580) b!281519))

(assert (= (and b!281519 (not res!233582)) b!281520))

(assert (= (or b!281517 b!281520) bm!4691))

(declare-fun m!414565 () Bool)

(assert (=> b!281515 m!414565))

(declare-fun m!414567 () Bool)

(assert (=> b!281515 m!414567))

(assert (=> b!281515 m!414565))

(assert (=> b!281515 m!414567))

(declare-fun m!414569 () Bool)

(assert (=> b!281515 m!414569))

(assert (=> b!281518 m!414505))

(declare-fun m!414571 () Bool)

(assert (=> bm!4691 m!414571))

(declare-fun m!414573 () Bool)

(assert (=> bm!4691 m!414573))

(assert (=> bm!4691 m!414567))

(assert (=> bm!4691 m!414565))

(declare-fun m!414575 () Bool)

(assert (=> bm!4691 m!414575))

(declare-fun m!414577 () Bool)

(assert (=> b!281521 m!414577))

(assert (=> b!281468 d!96826))

(declare-fun d!96828 () Bool)

(assert (=> d!96828 (= (byteRangesEq!0 (select (arr!8018 a1!699) (_4!397 lt!417351)) (select (arr!8018 a2!699) (_4!397 lt!417351)) #b00000000000000000000000000000000 lt!417352) (or (= #b00000000000000000000000000000000 lt!417352) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8018 a1!699) (_4!397 lt!417351))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417352))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8018 a2!699) (_4!397 lt!417351))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417352))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24393 () Bool)

(assert (= bs!24393 d!96828))

(declare-fun m!414579 () Bool)

(assert (=> bs!24393 m!414579))

(declare-fun m!414581 () Bool)

(assert (=> bs!24393 m!414581))

(assert (=> b!281472 d!96828))

(declare-fun d!96830 () Bool)

(declare-fun res!233587 () Bool)

(declare-fun e!201023 () Bool)

(assert (=> d!96830 (=> res!233587 e!201023)))

(assert (=> d!96830 (= res!233587 (= (_1!12472 lt!417351) (_2!12472 lt!417351)))))

(assert (=> d!96830 (= (arrayRangesEq!1290 a1!699 a2!699 (_1!12472 lt!417351) (_2!12472 lt!417351)) e!201023)))

(declare-fun b!281526 () Bool)

(declare-fun e!201024 () Bool)

(assert (=> b!281526 (= e!201023 e!201024)))

(declare-fun res!233588 () Bool)

(assert (=> b!281526 (=> (not res!233588) (not e!201024))))

(assert (=> b!281526 (= res!233588 (= (select (arr!8018 a1!699) (_1!12472 lt!417351)) (select (arr!8018 a2!699) (_1!12472 lt!417351))))))

(declare-fun b!281527 () Bool)

(assert (=> b!281527 (= e!201024 (arrayRangesEq!1290 a1!699 a2!699 (bvadd (_1!12472 lt!417351) #b00000000000000000000000000000001) (_2!12472 lt!417351)))))

(assert (= (and d!96830 (not res!233587)) b!281526))

(assert (= (and b!281526 res!233588) b!281527))

(declare-fun m!414583 () Bool)

(assert (=> b!281526 m!414583))

(declare-fun m!414585 () Bool)

(assert (=> b!281526 m!414585))

(declare-fun m!414587 () Bool)

(assert (=> b!281527 m!414587))

(assert (=> b!281467 d!96830))

(declare-fun d!96832 () Bool)

(assert (=> d!96832 (arrayRangesEq!1290 a2!699 a1!699 (_1!12472 lt!417351) (_2!12472 lt!417351))))

(declare-fun lt!417381 () Unit!19753)

(declare-fun choose!499 (array!16257 array!16257 (_ BitVec 32) (_ BitVec 32)) Unit!19753)

(assert (=> d!96832 (= lt!417381 (choose!499 a1!699 a2!699 (_1!12472 lt!417351) (_2!12472 lt!417351)))))

(assert (=> d!96832 (and (bvsle #b00000000000000000000000000000000 (_1!12472 lt!417351)) (bvsle (_1!12472 lt!417351) (_2!12472 lt!417351)) (bvsle (_2!12472 lt!417351) (size!7022 a1!699)))))

(assert (=> d!96832 (= (arrayRangesEqSymmetricLemma!197 a1!699 a2!699 (_1!12472 lt!417351) (_2!12472 lt!417351)) lt!417381)))

(declare-fun bs!24394 () Bool)

(assert (= bs!24394 d!96832))

(assert (=> bs!24394 m!414523))

(declare-fun m!414589 () Bool)

(assert (=> bs!24394 m!414589))

(assert (=> b!281467 d!96832))

(declare-fun d!96834 () Bool)

(declare-fun res!233589 () Bool)

(declare-fun e!201025 () Bool)

(assert (=> d!96834 (=> res!233589 e!201025)))

(assert (=> d!96834 (= res!233589 (= (_1!12472 lt!417351) (_2!12472 lt!417351)))))

(assert (=> d!96834 (= (arrayRangesEq!1290 a2!699 a1!699 (_1!12472 lt!417351) (_2!12472 lt!417351)) e!201025)))

(declare-fun b!281528 () Bool)

(declare-fun e!201026 () Bool)

(assert (=> b!281528 (= e!201025 e!201026)))

(declare-fun res!233590 () Bool)

(assert (=> b!281528 (=> (not res!233590) (not e!201026))))

(assert (=> b!281528 (= res!233590 (= (select (arr!8018 a2!699) (_1!12472 lt!417351)) (select (arr!8018 a1!699) (_1!12472 lt!417351))))))

(declare-fun b!281529 () Bool)

(assert (=> b!281529 (= e!201026 (arrayRangesEq!1290 a2!699 a1!699 (bvadd (_1!12472 lt!417351) #b00000000000000000000000000000001) (_2!12472 lt!417351)))))

(assert (= (and d!96834 (not res!233589)) b!281528))

(assert (= (and b!281528 res!233590) b!281529))

(assert (=> b!281528 m!414585))

(assert (=> b!281528 m!414583))

(declare-fun m!414591 () Bool)

(assert (=> b!281529 m!414591))

(assert (=> b!281467 d!96834))

(declare-fun d!96836 () Bool)

(assert (=> d!96836 (= (arrayBitIndices!0 from!822 to!789) (tuple4!795 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!281471 d!96836))

(declare-fun d!96838 () Bool)

(assert (=> d!96838 (= (array_inv!6746 a1!699) (bvsge (size!7022 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62882 d!96838))

(declare-fun d!96840 () Bool)

(assert (=> d!96840 (= (array_inv!6746 a2!699) (bvsge (size!7022 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62882 d!96840))

(declare-fun d!96842 () Bool)

(assert (=> d!96842 (= (byteRangesEq!0 (select (arr!8018 a1!699) (_3!1177 lt!417351)) (select (arr!8018 a2!699) (_3!1177 lt!417351)) lt!417350 #b00000000000000000000000000001000) (or (= lt!417350 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8018 a1!699) (_3!1177 lt!417351))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417350)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8018 a2!699) (_3!1177 lt!417351))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417350)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24395 () Bool)

(assert (= bs!24395 d!96842))

(assert (=> bs!24395 m!414561))

(assert (=> bs!24395 m!414563))

(assert (=> b!281470 d!96842))

(check-sat (not bm!4691) (not b!281521) (not b!281529) (not b!281515) (not d!96832) (not b!281518) (not b!281527))
(check-sat)
