; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62306 () Bool)

(assert start!62306)

(declare-fun b!279428 () Bool)

(declare-fun res!232013 () Bool)

(declare-fun e!199196 () Bool)

(assert (=> b!279428 (=> (not res!232013) (not e!199196))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16131 0))(
  ( (array!16132 (arr!7976 (Array (_ BitVec 32) (_ BitVec 8))) (size!6980 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16131)

(declare-fun a2!699 () array!16131)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16131 array!16131 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279428 (= res!232013 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!232016 () Bool)

(assert (=> start!62306 (=> (not res!232016) (not e!199196))))

(assert (=> start!62306 (= res!232016 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6980 a1!699) (size!6980 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6980 a1!699))))))))

(assert (=> start!62306 e!199196))

(assert (=> start!62306 true))

(declare-fun array_inv!6704 (array!16131) Bool)

(assert (=> start!62306 (array_inv!6704 a1!699)))

(assert (=> start!62306 (array_inv!6704 a2!699)))

(declare-fun b!279429 () Bool)

(declare-datatypes ((Unit!19585 0))(
  ( (Unit!19586) )
))
(declare-fun e!199198 () Unit!19585)

(declare-fun Unit!19587 () Unit!19585)

(assert (=> b!279429 (= e!199198 Unit!19587)))

(declare-datatypes ((tuple4!710 0))(
  ( (tuple4!711 (_1!12430 (_ BitVec 32)) (_2!12430 (_ BitVec 32)) (_3!1135 (_ BitVec 32)) (_4!355 (_ BitVec 32))) )
))
(declare-fun lt!416369 () tuple4!710)

(declare-fun arrayRangesEq!1248 (array!16131 array!16131 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279429 (arrayRangesEq!1248 a1!699 a2!699 (_1!12430 lt!416369) (_2!12430 lt!416369))))

(declare-fun lt!416370 () Unit!19585)

(declare-fun arrayRangesEqSymmetricLemma!155 (array!16131 array!16131 (_ BitVec 32) (_ BitVec 32)) Unit!19585)

(assert (=> b!279429 (= lt!416370 (arrayRangesEqSymmetricLemma!155 a1!699 a2!699 (_1!12430 lt!416369) (_2!12430 lt!416369)))))

(assert (=> b!279429 (arrayRangesEq!1248 a2!699 a1!699 (_1!12430 lt!416369) (_2!12430 lt!416369))))

(declare-fun b!279430 () Bool)

(declare-fun e!199197 () Bool)

(assert (=> b!279430 (= e!199196 e!199197)))

(declare-fun res!232014 () Bool)

(assert (=> b!279430 (=> (not res!232014) (not e!199197))))

(assert (=> b!279430 (= res!232014 (= (_3!1135 lt!416369) (_4!355 lt!416369)))))

(declare-fun lt!416368 () Unit!19585)

(assert (=> b!279430 (= lt!416368 e!199198)))

(declare-fun c!12879 () Bool)

(assert (=> b!279430 (= c!12879 (bvslt (_1!12430 lt!416369) (_2!12430 lt!416369)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!710)

(assert (=> b!279430 (= lt!416369 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279431 () Bool)

(declare-fun res!232015 () Bool)

(assert (=> b!279431 (=> (not res!232015) (not e!199196))))

(assert (=> b!279431 (= res!232015 (bvslt from!822 to!789))))

(declare-fun b!279432 () Bool)

(declare-fun Unit!19588 () Unit!19585)

(assert (=> b!279432 (= e!199198 Unit!19588)))

(declare-fun b!279433 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279433 (= e!199197 (not (byteRangesEq!0 (select (arr!7976 a1!699) (_3!1135 lt!416369)) (select (arr!7976 a2!699) (_3!1135 lt!416369)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (= (and start!62306 res!232016) b!279428))

(assert (= (and b!279428 res!232013) b!279431))

(assert (= (and b!279431 res!232015) b!279430))

(assert (= (and b!279430 c!12879) b!279429))

(assert (= (and b!279430 (not c!12879)) b!279432))

(assert (= (and b!279430 res!232014) b!279433))

(declare-fun m!412455 () Bool)

(assert (=> b!279430 m!412455))

(declare-fun m!412457 () Bool)

(assert (=> b!279433 m!412457))

(declare-fun m!412459 () Bool)

(assert (=> b!279433 m!412459))

(assert (=> b!279433 m!412457))

(assert (=> b!279433 m!412459))

(declare-fun m!412461 () Bool)

(assert (=> b!279433 m!412461))

(declare-fun m!412463 () Bool)

(assert (=> b!279428 m!412463))

(declare-fun m!412465 () Bool)

(assert (=> b!279429 m!412465))

(declare-fun m!412467 () Bool)

(assert (=> b!279429 m!412467))

(declare-fun m!412469 () Bool)

(assert (=> b!279429 m!412469))

(declare-fun m!412471 () Bool)

(assert (=> start!62306 m!412471))

(declare-fun m!412473 () Bool)

(assert (=> start!62306 m!412473))

(check-sat (not b!279429) (not b!279430) (not b!279428) (not b!279433) (not start!62306))
(check-sat)
(get-model)

(declare-fun d!96088 () Bool)

(assert (=> d!96088 (= (byteRangesEq!0 (select (arr!7976 a1!699) (_3!1135 lt!416369)) (select (arr!7976 a2!699) (_3!1135 lt!416369)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7976 a1!699) (_3!1135 lt!416369))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7976 a2!699) (_3!1135 lt!416369))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24251 () Bool)

(assert (= bs!24251 d!96088))

(declare-fun m!412495 () Bool)

(assert (=> bs!24251 m!412495))

(declare-fun m!412497 () Bool)

(assert (=> bs!24251 m!412497))

(assert (=> b!279433 d!96088))

(declare-fun e!199265 () Bool)

(declare-fun b!279503 () Bool)

(declare-fun lt!416401 () tuple4!710)

(assert (=> b!279503 (= e!199265 (arrayRangesEq!1248 a1!699 a2!699 (_1!12430 lt!416401) (_2!12430 lt!416401)))))

(declare-fun b!279504 () Bool)

(declare-fun e!199264 () Bool)

(declare-fun e!199267 () Bool)

(assert (=> b!279504 (= e!199264 e!199267)))

(declare-fun res!232073 () Bool)

(assert (=> b!279504 (=> (not res!232073) (not e!199267))))

(assert (=> b!279504 (= res!232073 e!199265)))

(declare-fun res!232072 () Bool)

(assert (=> b!279504 (=> res!232072 e!199265)))

(assert (=> b!279504 (= res!232072 (bvsge (_1!12430 lt!416401) (_2!12430 lt!416401)))))

(declare-fun lt!416403 () (_ BitVec 32))

(assert (=> b!279504 (= lt!416403 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416402 () (_ BitVec 32))

(assert (=> b!279504 (= lt!416402 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279504 (= lt!416401 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279505 () Bool)

(declare-fun e!199266 () Bool)

(declare-fun e!199263 () Bool)

(assert (=> b!279505 (= e!199266 e!199263)))

(declare-fun res!232070 () Bool)

(assert (=> b!279505 (= res!232070 (byteRangesEq!0 (select (arr!7976 a1!699) (_3!1135 lt!416401)) (select (arr!7976 a2!699) (_3!1135 lt!416401)) lt!416402 #b00000000000000000000000000001000))))

(assert (=> b!279505 (=> (not res!232070) (not e!199263))))

(declare-fun call!4568 () Bool)

(declare-fun c!12888 () Bool)

(declare-fun bm!4565 () Bool)

(assert (=> bm!4565 (= call!4568 (byteRangesEq!0 (ite c!12888 (select (arr!7976 a1!699) (_3!1135 lt!416401)) (select (arr!7976 a1!699) (_4!355 lt!416401))) (ite c!12888 (select (arr!7976 a2!699) (_3!1135 lt!416401)) (select (arr!7976 a2!699) (_4!355 lt!416401))) (ite c!12888 lt!416402 #b00000000000000000000000000000000) lt!416403))))

(declare-fun b!279506 () Bool)

(declare-fun e!199262 () Bool)

(assert (=> b!279506 (= e!199262 call!4568)))

(declare-fun b!279507 () Bool)

(assert (=> b!279507 (= e!199266 call!4568)))

(declare-fun b!279508 () Bool)

(assert (=> b!279508 (= e!199267 e!199266)))

(assert (=> b!279508 (= c!12888 (= (_3!1135 lt!416401) (_4!355 lt!416401)))))

(declare-fun d!96092 () Bool)

(declare-fun res!232071 () Bool)

(assert (=> d!96092 (=> res!232071 e!199264)))

(assert (=> d!96092 (= res!232071 (bvsge from!822 to!789))))

(assert (=> d!96092 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199264)))

(declare-fun b!279509 () Bool)

(declare-fun res!232074 () Bool)

(assert (=> b!279509 (= res!232074 (= lt!416403 #b00000000000000000000000000000000))))

(assert (=> b!279509 (=> res!232074 e!199262)))

(assert (=> b!279509 (= e!199263 e!199262)))

(assert (= (and d!96092 (not res!232071)) b!279504))

(assert (= (and b!279504 (not res!232072)) b!279503))

(assert (= (and b!279504 res!232073) b!279508))

(assert (= (and b!279508 c!12888) b!279507))

(assert (= (and b!279508 (not c!12888)) b!279505))

(assert (= (and b!279505 res!232070) b!279509))

(assert (= (and b!279509 (not res!232074)) b!279506))

(assert (= (or b!279507 b!279506) bm!4565))

(declare-fun m!412541 () Bool)

(assert (=> b!279503 m!412541))

(assert (=> b!279504 m!412455))

(declare-fun m!412543 () Bool)

(assert (=> b!279505 m!412543))

(declare-fun m!412545 () Bool)

(assert (=> b!279505 m!412545))

(assert (=> b!279505 m!412543))

(assert (=> b!279505 m!412545))

(declare-fun m!412547 () Bool)

(assert (=> b!279505 m!412547))

(assert (=> bm!4565 m!412543))

(declare-fun m!412549 () Bool)

(assert (=> bm!4565 m!412549))

(assert (=> bm!4565 m!412545))

(declare-fun m!412551 () Bool)

(assert (=> bm!4565 m!412551))

(declare-fun m!412553 () Bool)

(assert (=> bm!4565 m!412553))

(assert (=> b!279428 d!96092))

(declare-fun d!96120 () Bool)

(declare-fun res!232079 () Bool)

(declare-fun e!199272 () Bool)

(assert (=> d!96120 (=> res!232079 e!199272)))

(assert (=> d!96120 (= res!232079 (= (_1!12430 lt!416369) (_2!12430 lt!416369)))))

(assert (=> d!96120 (= (arrayRangesEq!1248 a1!699 a2!699 (_1!12430 lt!416369) (_2!12430 lt!416369)) e!199272)))

(declare-fun b!279514 () Bool)

(declare-fun e!199273 () Bool)

(assert (=> b!279514 (= e!199272 e!199273)))

(declare-fun res!232080 () Bool)

(assert (=> b!279514 (=> (not res!232080) (not e!199273))))

(assert (=> b!279514 (= res!232080 (= (select (arr!7976 a1!699) (_1!12430 lt!416369)) (select (arr!7976 a2!699) (_1!12430 lt!416369))))))

(declare-fun b!279515 () Bool)

(assert (=> b!279515 (= e!199273 (arrayRangesEq!1248 a1!699 a2!699 (bvadd (_1!12430 lt!416369) #b00000000000000000000000000000001) (_2!12430 lt!416369)))))

(assert (= (and d!96120 (not res!232079)) b!279514))

(assert (= (and b!279514 res!232080) b!279515))

(declare-fun m!412555 () Bool)

(assert (=> b!279514 m!412555))

(declare-fun m!412557 () Bool)

(assert (=> b!279514 m!412557))

(declare-fun m!412559 () Bool)

(assert (=> b!279515 m!412559))

(assert (=> b!279429 d!96120))

(declare-fun d!96122 () Bool)

(assert (=> d!96122 (arrayRangesEq!1248 a2!699 a1!699 (_1!12430 lt!416369) (_2!12430 lt!416369))))

(declare-fun lt!416412 () Unit!19585)

(declare-fun choose!466 (array!16131 array!16131 (_ BitVec 32) (_ BitVec 32)) Unit!19585)

(assert (=> d!96122 (= lt!416412 (choose!466 a1!699 a2!699 (_1!12430 lt!416369) (_2!12430 lt!416369)))))

(assert (=> d!96122 (and (bvsle #b00000000000000000000000000000000 (_1!12430 lt!416369)) (bvsle (_1!12430 lt!416369) (_2!12430 lt!416369)) (bvsle (_2!12430 lt!416369) (size!6980 a1!699)))))

(assert (=> d!96122 (= (arrayRangesEqSymmetricLemma!155 a1!699 a2!699 (_1!12430 lt!416369) (_2!12430 lt!416369)) lt!416412)))

(declare-fun bs!24256 () Bool)

(assert (= bs!24256 d!96122))

(assert (=> bs!24256 m!412469))

(declare-fun m!412561 () Bool)

(assert (=> bs!24256 m!412561))

(assert (=> b!279429 d!96122))

(declare-fun d!96124 () Bool)

(declare-fun res!232091 () Bool)

(declare-fun e!199286 () Bool)

(assert (=> d!96124 (=> res!232091 e!199286)))

(assert (=> d!96124 (= res!232091 (= (_1!12430 lt!416369) (_2!12430 lt!416369)))))

(assert (=> d!96124 (= (arrayRangesEq!1248 a2!699 a1!699 (_1!12430 lt!416369) (_2!12430 lt!416369)) e!199286)))

(declare-fun b!279530 () Bool)

(declare-fun e!199287 () Bool)

(assert (=> b!279530 (= e!199286 e!199287)))

(declare-fun res!232092 () Bool)

(assert (=> b!279530 (=> (not res!232092) (not e!199287))))

(assert (=> b!279530 (= res!232092 (= (select (arr!7976 a2!699) (_1!12430 lt!416369)) (select (arr!7976 a1!699) (_1!12430 lt!416369))))))

(declare-fun b!279531 () Bool)

(assert (=> b!279531 (= e!199287 (arrayRangesEq!1248 a2!699 a1!699 (bvadd (_1!12430 lt!416369) #b00000000000000000000000000000001) (_2!12430 lt!416369)))))

(assert (= (and d!96124 (not res!232091)) b!279530))

(assert (= (and b!279530 res!232092) b!279531))

(assert (=> b!279530 m!412557))

(assert (=> b!279530 m!412555))

(declare-fun m!412563 () Bool)

(assert (=> b!279531 m!412563))

(assert (=> b!279429 d!96124))

(declare-fun d!96126 () Bool)

(assert (=> d!96126 (= (array_inv!6704 a1!699) (bvsge (size!6980 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62306 d!96126))

(declare-fun d!96128 () Bool)

(assert (=> d!96128 (= (array_inv!6704 a2!699) (bvsge (size!6980 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62306 d!96128))

(declare-fun d!96130 () Bool)

(assert (=> d!96130 (= (arrayBitIndices!0 from!822 to!789) (tuple4!711 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279430 d!96130))

(check-sat (not b!279504) (not d!96122) (not b!279515) (not bm!4565) (not b!279531) (not b!279503) (not b!279505))
