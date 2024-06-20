; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68172 () Bool)

(assert start!68172)

(declare-fun b!306009 () Bool)

(declare-fun res!251414 () Bool)

(declare-fun e!220440 () Bool)

(assert (=> b!306009 (=> (not res!251414) (not e!220440))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun lt!439349 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!306009 (= res!251414 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439349) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306010 () Bool)

(declare-fun res!251410 () Bool)

(declare-fun lt!439355 () (_ BitVec 32))

(assert (=> b!306010 (= res!251410 (= lt!439355 #b00000000000000000000000000000000))))

(declare-fun e!220438 () Bool)

(assert (=> b!306010 (=> res!251410 e!220438)))

(declare-fun e!220436 () Bool)

(assert (=> b!306010 (= e!220436 e!220438)))

(declare-fun b!306011 () Bool)

(declare-fun e!220447 () Bool)

(assert (=> b!306011 (= e!220440 e!220447)))

(declare-fun res!251409 () Bool)

(assert (=> b!306011 (=> (not res!251409) (not e!220447))))

(declare-fun e!220446 () Bool)

(assert (=> b!306011 (= res!251409 e!220446)))

(declare-fun c!14884 () Bool)

(declare-datatypes ((tuple4!1236 0))(
  ( (tuple4!1237 (_1!13273 (_ BitVec 32)) (_2!13273 (_ BitVec 32)) (_3!1575 (_ BitVec 32)) (_4!618 (_ BitVec 32))) )
))
(declare-fun lt!439352 () tuple4!1236)

(assert (=> b!306011 (= c!14884 (= (_3!1575 lt!439352) (_4!618 lt!439352)))))

(declare-datatypes ((Unit!21349 0))(
  ( (Unit!21350) )
))
(declare-fun lt!439351 () Unit!21349)

(declare-fun e!220437 () Unit!21349)

(assert (=> b!306011 (= lt!439351 e!220437)))

(declare-fun c!14883 () Bool)

(declare-fun lt!439347 () tuple4!1236)

(assert (=> b!306011 (= c!14883 (bvslt (_1!13273 lt!439347) (_2!13273 lt!439347)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1236)

(assert (=> b!306011 (= lt!439347 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306011 (= lt!439355 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439353 () (_ BitVec 32))

(assert (=> b!306011 (= lt!439353 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306011 (= lt!439352 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!251411 () Bool)

(declare-fun e!220444 () Bool)

(assert (=> start!68172 (=> (not res!251411) (not e!220444))))

(declare-datatypes ((array!18566 0))(
  ( (array!18567 (arr!9130 (Array (_ BitVec 32) (_ BitVec 8))) (size!8047 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18566)

(declare-fun a2!948 () array!18566)

(assert (=> start!68172 (= res!251411 (and (bvsle (size!8047 a1!948) (size!8047 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68172 e!220444))

(assert (=> start!68172 true))

(declare-fun array_inv!7659 (array!18566) Bool)

(assert (=> start!68172 (array_inv!7659 a1!948)))

(assert (=> start!68172 (array_inv!7659 a2!948)))

(declare-fun b!306012 () Bool)

(declare-fun e!220442 () Unit!21349)

(declare-fun lt!439350 () Unit!21349)

(assert (=> b!306012 (= e!220442 lt!439350)))

(declare-fun arrayRangesEqImpliesEq!280 (array!18566 array!18566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21349)

(assert (=> b!306012 (= lt!439350 (arrayRangesEqImpliesEq!280 a1!948 a2!948 (_1!13273 lt!439352) (_4!618 lt!439347) (_2!13273 lt!439352)))))

(assert (=> b!306012 (= (select (arr!9130 a1!948) (_4!618 lt!439347)) (select (arr!9130 a2!948) (_4!618 lt!439347)))))

(declare-fun b!306013 () Bool)

(declare-fun e!220441 () Bool)

(assert (=> b!306013 (= e!220447 e!220441)))

(declare-fun res!251408 () Bool)

(assert (=> b!306013 (=> (not res!251408) (not e!220441))))

(assert (=> b!306013 (= res!251408 (= (_3!1575 lt!439347) (_4!618 lt!439347)))))

(declare-fun lt!439348 () Unit!21349)

(assert (=> b!306013 (= lt!439348 e!220442)))

(declare-fun c!14885 () Bool)

(assert (=> b!306013 (= c!14885 (and (bvslt (_4!618 lt!439347) (_4!618 lt!439352)) (bvslt (_3!1575 lt!439352) (_4!618 lt!439347))))))

(declare-fun lt!439356 () Unit!21349)

(declare-fun e!220445 () Unit!21349)

(assert (=> b!306013 (= lt!439356 e!220445)))

(declare-fun c!14886 () Bool)

(assert (=> b!306013 (= c!14886 (and (bvslt (_3!1575 lt!439352) (_3!1575 lt!439347)) (bvslt (_3!1575 lt!439347) (_4!618 lt!439352))))))

(declare-fun b!306014 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306014 (= e!220438 (byteRangesEq!0 (select (arr!9130 a1!948) (_4!618 lt!439352)) (select (arr!9130 a2!948) (_4!618 lt!439352)) #b00000000000000000000000000000000 lt!439355))))

(declare-fun b!306015 () Bool)

(assert (=> b!306015 (= e!220444 e!220440)))

(declare-fun res!251413 () Bool)

(assert (=> b!306015 (=> (not res!251413) (not e!220440))))

(assert (=> b!306015 (= res!251413 (and (bvsle toBit!258 lt!439349) (bvsle fromBit!258 lt!439349)))))

(assert (=> b!306015 (= lt!439349 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8047 a1!948))))))

(declare-fun b!306016 () Bool)

(declare-fun Unit!21351 () Unit!21349)

(assert (=> b!306016 (= e!220437 Unit!21351)))

(declare-fun b!306017 () Bool)

(declare-fun lt!439346 () Unit!21349)

(assert (=> b!306017 (= e!220445 lt!439346)))

(assert (=> b!306017 (= lt!439346 (arrayRangesEqImpliesEq!280 a1!948 a2!948 (_1!13273 lt!439352) (_3!1575 lt!439347) (_2!13273 lt!439352)))))

(assert (=> b!306017 (= (select (arr!9130 a1!948) (_3!1575 lt!439347)) (select (arr!9130 a2!948) (_3!1575 lt!439347)))))

(declare-fun b!306018 () Bool)

(declare-fun Unit!21352 () Unit!21349)

(assert (=> b!306018 (= e!220442 Unit!21352)))

(declare-fun b!306019 () Bool)

(declare-fun Unit!21353 () Unit!21349)

(assert (=> b!306019 (= e!220445 Unit!21353)))

(declare-fun b!306020 () Bool)

(declare-fun lt!439354 () Unit!21349)

(assert (=> b!306020 (= e!220437 lt!439354)))

(declare-fun arrayRangesEqSlicedLemma!271 (array!18566 array!18566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21349)

(assert (=> b!306020 (= lt!439354 (arrayRangesEqSlicedLemma!271 a1!948 a2!948 (_1!13273 lt!439352) (_2!13273 lt!439352) (_1!13273 lt!439347) (_2!13273 lt!439347)))))

(declare-fun arrayRangesEq!1676 (array!18566 array!18566 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306020 (arrayRangesEq!1676 a1!948 a2!948 (_1!13273 lt!439347) (_2!13273 lt!439347))))

(declare-fun b!306021 () Bool)

(declare-fun res!251415 () Bool)

(assert (=> b!306021 (=> (not res!251415) (not e!220440))))

(declare-fun arrayBitRangesEq!0 (array!18566 array!18566 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306021 (= res!251415 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun call!5804 () Bool)

(declare-fun bm!5801 () Bool)

(assert (=> bm!5801 (= call!5804 (byteRangesEq!0 (select (arr!9130 a1!948) (_3!1575 lt!439352)) (select (arr!9130 a2!948) (_3!1575 lt!439352)) lt!439353 (ite c!14884 lt!439355 #b00000000000000000000000000000111)))))

(declare-fun b!306022 () Bool)

(assert (=> b!306022 (= e!220446 e!220436)))

(declare-fun res!251412 () Bool)

(assert (=> b!306022 (= res!251412 call!5804)))

(assert (=> b!306022 (=> (not res!251412) (not e!220436))))

(declare-fun b!306023 () Bool)

(declare-fun res!251407 () Bool)

(assert (=> b!306023 (=> (not res!251407) (not e!220441))))

(assert (=> b!306023 (= res!251407 (byteRangesEq!0 (select (arr!9130 a1!948) (_3!1575 lt!439347)) (select (arr!9130 a2!948) (_3!1575 lt!439347)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!306024 () Bool)

(assert (=> b!306024 (= e!220441 (not (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52)))))

(declare-fun b!306025 () Bool)

(assert (=> b!306025 (= e!220446 call!5804)))

(assert (= (and start!68172 res!251411) b!306015))

(assert (= (and b!306015 res!251413) b!306021))

(assert (= (and b!306021 res!251415) b!306009))

(assert (= (and b!306009 res!251414) b!306011))

(assert (= (and b!306011 c!14883) b!306020))

(assert (= (and b!306011 (not c!14883)) b!306016))

(assert (= (and b!306011 c!14884) b!306025))

(assert (= (and b!306011 (not c!14884)) b!306022))

(assert (= (and b!306022 res!251412) b!306010))

(assert (= (and b!306010 (not res!251410)) b!306014))

(assert (= (or b!306025 b!306022) bm!5801))

(assert (= (and b!306011 res!251409) b!306013))

(assert (= (and b!306013 c!14886) b!306017))

(assert (= (and b!306013 (not c!14886)) b!306019))

(assert (= (and b!306013 c!14885) b!306012))

(assert (= (and b!306013 (not c!14885)) b!306018))

(assert (= (and b!306013 res!251408) b!306023))

(assert (= (and b!306023 res!251407) b!306024))

(declare-fun m!444459 () Bool)

(assert (=> b!306011 m!444459))

(declare-fun m!444461 () Bool)

(assert (=> b!306011 m!444461))

(declare-fun m!444463 () Bool)

(assert (=> b!306017 m!444463))

(declare-fun m!444465 () Bool)

(assert (=> b!306017 m!444465))

(declare-fun m!444467 () Bool)

(assert (=> b!306017 m!444467))

(declare-fun m!444469 () Bool)

(assert (=> b!306014 m!444469))

(declare-fun m!444471 () Bool)

(assert (=> b!306014 m!444471))

(assert (=> b!306014 m!444469))

(assert (=> b!306014 m!444471))

(declare-fun m!444473 () Bool)

(assert (=> b!306014 m!444473))

(declare-fun m!444475 () Bool)

(assert (=> b!306024 m!444475))

(declare-fun m!444477 () Bool)

(assert (=> b!306012 m!444477))

(declare-fun m!444479 () Bool)

(assert (=> b!306012 m!444479))

(declare-fun m!444481 () Bool)

(assert (=> b!306012 m!444481))

(declare-fun m!444483 () Bool)

(assert (=> b!306020 m!444483))

(declare-fun m!444485 () Bool)

(assert (=> b!306020 m!444485))

(assert (=> b!306023 m!444465))

(assert (=> b!306023 m!444467))

(assert (=> b!306023 m!444465))

(assert (=> b!306023 m!444467))

(declare-fun m!444487 () Bool)

(assert (=> b!306023 m!444487))

(declare-fun m!444489 () Bool)

(assert (=> start!68172 m!444489))

(declare-fun m!444491 () Bool)

(assert (=> start!68172 m!444491))

(declare-fun m!444493 () Bool)

(assert (=> bm!5801 m!444493))

(declare-fun m!444495 () Bool)

(assert (=> bm!5801 m!444495))

(assert (=> bm!5801 m!444493))

(assert (=> bm!5801 m!444495))

(declare-fun m!444497 () Bool)

(assert (=> bm!5801 m!444497))

(declare-fun m!444499 () Bool)

(assert (=> b!306021 m!444499))

(push 1)

(assert (not bm!5801))

(assert (not b!306020))

(assert (not b!306014))

(assert (not start!68172))

(assert (not b!306017))

(assert (not b!306023))

(assert (not b!306011))

(assert (not b!306021))

(assert (not b!306024))

(assert (not b!306012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102136 () Bool)

(assert (=> d!102136 (= (byteRangesEq!0 (select (arr!9130 a1!948) (_3!1575 lt!439347)) (select (arr!9130 a2!948) (_3!1575 lt!439347)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9130 a1!948) (_3!1575 lt!439347))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9130 a2!948) (_3!1575 lt!439347))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26319 () Bool)

(assert (= bs!26319 d!102136))

(declare-fun m!444637 () Bool)

(assert (=> bs!26319 m!444637))

(declare-fun m!444639 () Bool)

(assert (=> bs!26319 m!444639))

(assert (=> b!306023 d!102136))

(declare-fun d!102150 () Bool)

(assert (=> d!102150 (= (byteRangesEq!0 (select (arr!9130 a1!948) (_4!618 lt!439352)) (select (arr!9130 a2!948) (_4!618 lt!439352)) #b00000000000000000000000000000000 lt!439355) (or (= #b00000000000000000000000000000000 lt!439355) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9130 a1!948) (_4!618 lt!439352))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439355))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9130 a2!948) (_4!618 lt!439352))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439355))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26320 () Bool)

(assert (= bs!26320 d!102150))

(declare-fun m!444641 () Bool)

(assert (=> bs!26320 m!444641))

(declare-fun m!444643 () Bool)

(assert (=> bs!26320 m!444643))

(assert (=> b!306014 d!102150))

(declare-fun d!102152 () Bool)

(assert (=> d!102152 (and (bvsge (_3!1575 lt!439347) #b00000000000000000000000000000000) (bvslt (_3!1575 lt!439347) (size!8047 a1!948)) (bvslt (_3!1575 lt!439347) (size!8047 a2!948)) (= (select (arr!9130 a1!948) (_3!1575 lt!439347)) (select (arr!9130 a2!948) (_3!1575 lt!439347))))))

(declare-fun lt!439444 () Unit!21349)

(declare-fun choose!616 (array!18566 array!18566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21349)

(assert (=> d!102152 (= lt!439444 (choose!616 a1!948 a2!948 (_1!13273 lt!439352) (_3!1575 lt!439347) (_2!13273 lt!439352)))))

(assert (=> d!102152 (and (bvsle #b00000000000000000000000000000000 (_1!13273 lt!439352)) (bvsle (_1!13273 lt!439352) (_2!13273 lt!439352)))))

(assert (=> d!102152 (= (arrayRangesEqImpliesEq!280 a1!948 a2!948 (_1!13273 lt!439352) (_3!1575 lt!439347) (_2!13273 lt!439352)) lt!439444)))

(declare-fun bs!26321 () Bool)

(assert (= bs!26321 d!102152))

(assert (=> bs!26321 m!444465))

(assert (=> bs!26321 m!444467))

(declare-fun m!444645 () Bool)

(assert (=> bs!26321 m!444645))

(assert (=> b!306017 d!102152))

(declare-fun d!102154 () Bool)

(assert (=> d!102154 (and (bvsge (_4!618 lt!439347) #b00000000000000000000000000000000) (bvslt (_4!618 lt!439347) (size!8047 a1!948)) (bvslt (_4!618 lt!439347) (size!8047 a2!948)) (= (select (arr!9130 a1!948) (_4!618 lt!439347)) (select (arr!9130 a2!948) (_4!618 lt!439347))))))

(declare-fun lt!439445 () Unit!21349)

(assert (=> d!102154 (= lt!439445 (choose!616 a1!948 a2!948 (_1!13273 lt!439352) (_4!618 lt!439347) (_2!13273 lt!439352)))))

(assert (=> d!102154 (and (bvsle #b00000000000000000000000000000000 (_1!13273 lt!439352)) (bvsle (_1!13273 lt!439352) (_2!13273 lt!439352)))))

(assert (=> d!102154 (= (arrayRangesEqImpliesEq!280 a1!948 a2!948 (_1!13273 lt!439352) (_4!618 lt!439347) (_2!13273 lt!439352)) lt!439445)))

(declare-fun bs!26322 () Bool)

(assert (= bs!26322 d!102154))

(assert (=> bs!26322 m!444479))

(assert (=> bs!26322 m!444481))

(declare-fun m!444647 () Bool)

(assert (=> bs!26322 m!444647))

(assert (=> b!306012 d!102154))

(declare-fun b!306176 () Bool)

(declare-fun e!220566 () Bool)

(declare-fun e!220565 () Bool)

(assert (=> b!306176 (= e!220566 e!220565)))

(declare-fun res!251509 () Bool)

(declare-fun call!5817 () Bool)

(assert (=> b!306176 (= res!251509 call!5817)))

(assert (=> b!306176 (=> (not res!251509) (not e!220565))))

(declare-fun b!306177 () Bool)

(declare-fun e!220562 () Bool)

(assert (=> b!306177 (= e!220562 e!220566)))

(declare-fun c!14917 () Bool)

(declare-fun lt!439455 () tuple4!1236)

(assert (=> b!306177 (= c!14917 (= (_3!1575 lt!439455) (_4!618 lt!439455)))))

(declare-fun b!306178 () Bool)

(assert (=> b!306178 (= e!220566 call!5817)))

(declare-fun b!306179 () Bool)

(declare-fun res!251506 () Bool)

(declare-fun lt!439457 () (_ BitVec 32))

(assert (=> b!306179 (= res!251506 (= lt!439457 #b00000000000000000000000000000000))))

(declare-fun e!220567 () Bool)

(assert (=> b!306179 (=> res!251506 e!220567)))

(assert (=> b!306179 (= e!220565 e!220567)))

(declare-fun b!306180 () Bool)

(assert (=> b!306180 (= e!220567 (byteRangesEq!0 (select (arr!9130 a1!948) (_4!618 lt!439455)) (select (arr!9130 a2!948) (_4!618 lt!439455)) #b00000000000000000000000000000000 lt!439457))))

(declare-fun d!102156 () Bool)

(declare-fun res!251507 () Bool)

(declare-fun e!220564 () Bool)

(assert (=> d!102156 (=> res!251507 e!220564)))

(assert (=> d!102156 (= res!251507 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102156 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220564)))

(declare-fun b!306181 () Bool)

(assert (=> b!306181 (= e!220564 e!220562)))

(declare-fun res!251508 () Bool)

(assert (=> b!306181 (=> (not res!251508) (not e!220562))))

(declare-fun e!220563 () Bool)

(assert (=> b!306181 (= res!251508 e!220563)))

(declare-fun res!251510 () Bool)

(assert (=> b!306181 (=> res!251510 e!220563)))

(assert (=> b!306181 (= res!251510 (bvsge (_1!13273 lt!439455) (_2!13273 lt!439455)))))

(assert (=> b!306181 (= lt!439457 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439456 () (_ BitVec 32))

(assert (=> b!306181 (= lt!439456 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306181 (= lt!439455 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306182 () Bool)

(assert (=> b!306182 (= e!220563 (arrayRangesEq!1676 a1!948 a2!948 (_1!13273 lt!439455) (_2!13273 lt!439455)))))

(declare-fun bm!5814 () Bool)

(assert (=> bm!5814 (= call!5817 (byteRangesEq!0 (select (arr!9130 a1!948) (_3!1575 lt!439455)) (select (arr!9130 a2!948) (_3!1575 lt!439455)) lt!439456 (ite c!14917 lt!439457 #b00000000000000000000000000001000)))))

(assert (= (and d!102156 (not res!251507)) b!306181))

(assert (= (and b!306181 (not res!251510)) b!306182))

(assert (= (and b!306181 res!251508) b!306177))

(assert (= (and b!306177 c!14917) b!306178))

(assert (= (and b!306177 (not c!14917)) b!306176))

(assert (= (and b!306176 res!251509) b!306179))

(assert (= (and b!306179 (not res!251506)) b!306180))

(assert (= (or b!306178 b!306176) bm!5814))

(declare-fun m!444651 () Bool)

(assert (=> b!306180 m!444651))

(declare-fun m!444653 () Bool)

(assert (=> b!306180 m!444653))

(assert (=> b!306180 m!444651))

(assert (=> b!306180 m!444653))

(declare-fun m!444655 () Bool)

(assert (=> b!306180 m!444655))

(assert (=> b!306181 m!444461))

(declare-fun m!444657 () Bool)

(assert (=> b!306182 m!444657))

(declare-fun m!444659 () Bool)

(assert (=> bm!5814 m!444659))

(declare-fun m!444661 () Bool)

(assert (=> bm!5814 m!444661))

(assert (=> bm!5814 m!444659))

(assert (=> bm!5814 m!444661))

(declare-fun m!444663 () Bool)

(assert (=> bm!5814 m!444663))

(assert (=> b!306021 d!102156))

(declare-fun d!102170 () Bool)

(assert (=> d!102170 (= (array_inv!7659 a1!948) (bvsge (size!8047 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68172 d!102170))

(declare-fun d!102172 () Bool)

(assert (=> d!102172 (= (array_inv!7659 a2!948) (bvsge (size!8047 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68172 d!102172))

(declare-fun d!102174 () Bool)

(assert (=> d!102174 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1237 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306011 d!102174))

(declare-fun d!102176 () Bool)

(assert (=> d!102176 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1237 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306011 d!102176))

(declare-fun d!102178 () Bool)

(assert (=> d!102178 (= (byteRangesEq!0 (select (arr!9130 a1!948) (_3!1575 lt!439352)) (select (arr!9130 a2!948) (_3!1575 lt!439352)) lt!439353 (ite c!14884 lt!439355 #b00000000000000000000000000000111)) (or (= lt!439353 (ite c!14884 lt!439355 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9130 a1!948) (_3!1575 lt!439352))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14884 lt!439355 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439353)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9130 a2!948) (_3!1575 lt!439352))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14884 lt!439355 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439353)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26324 () Bool)

(assert (= bs!26324 d!102178))

(declare-fun m!444665 () Bool)

(assert (=> bs!26324 m!444665))

(declare-fun m!444667 () Bool)

(assert (=> bs!26324 m!444667))

(assert (=> bm!5801 d!102178))

(declare-fun b!306197 () Bool)

(declare-fun e!220584 () Bool)

(declare-fun e!220583 () Bool)

(assert (=> b!306197 (= e!220584 e!220583)))

(declare-fun res!251524 () Bool)

(declare-fun call!5820 () Bool)

(assert (=> b!306197 (= res!251524 call!5820)))

(assert (=> b!306197 (=> (not res!251524) (not e!220583))))

(declare-fun b!306198 () Bool)

(declare-fun e!220580 () Bool)

(assert (=> b!306198 (= e!220580 e!220584)))

(declare-fun c!14920 () Bool)

(declare-fun lt!439464 () tuple4!1236)

(assert (=> b!306198 (= c!14920 (= (_3!1575 lt!439464) (_4!618 lt!439464)))))

(declare-fun b!306199 () Bool)

(assert (=> b!306199 (= e!220584 call!5820)))

(declare-fun b!306200 () Bool)

(declare-fun res!251521 () Bool)

(declare-fun lt!439466 () (_ BitVec 32))

(assert (=> b!306200 (= res!251521 (= lt!439466 #b00000000000000000000000000000000))))

(declare-fun e!220585 () Bool)

(assert (=> b!306200 (=> res!251521 e!220585)))

(assert (=> b!306200 (= e!220583 e!220585)))

(declare-fun b!306201 () Bool)

(assert (=> b!306201 (= e!220585 (byteRangesEq!0 (select (arr!9130 a1!948) (_4!618 lt!439464)) (select (arr!9130 a2!948) (_4!618 lt!439464)) #b00000000000000000000000000000000 lt!439466))))

(declare-fun d!102180 () Bool)

(declare-fun res!251522 () Bool)

(declare-fun e!220582 () Bool)

(assert (=> d!102180 (=> res!251522 e!220582)))

(assert (=> d!102180 (= res!251522 (bvsge fromSlice!52 toSlice!52))))

(assert (=> d!102180 (= (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52) e!220582)))

(declare-fun b!306202 () Bool)

(assert (=> b!306202 (= e!220582 e!220580)))

(declare-fun res!251523 () Bool)

(assert (=> b!306202 (=> (not res!251523) (not e!220580))))

(declare-fun e!220581 () Bool)

(assert (=> b!306202 (= res!251523 e!220581)))

(declare-fun res!251525 () Bool)

(assert (=> b!306202 (=> res!251525 e!220581)))

(assert (=> b!306202 (= res!251525 (bvsge (_1!13273 lt!439464) (_2!13273 lt!439464)))))

(assert (=> b!306202 (= lt!439466 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439465 () (_ BitVec 32))

(assert (=> b!306202 (= lt!439465 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306202 (= lt!439464 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun b!306203 () Bool)

(assert (=> b!306203 (= e!220581 (arrayRangesEq!1676 a1!948 a2!948 (_1!13273 lt!439464) (_2!13273 lt!439464)))))

(declare-fun bm!5817 () Bool)

(assert (=> bm!5817 (= call!5820 (byteRangesEq!0 (select (arr!9130 a1!948) (_3!1575 lt!439464)) (select (arr!9130 a2!948) (_3!1575 lt!439464)) lt!439465 (ite c!14920 lt!439466 #b00000000000000000000000000001000)))))

(assert (= (and d!102180 (not res!251522)) b!306202))

(assert (= (and b!306202 (not res!251525)) b!306203))

(assert (= (and b!306202 res!251523) b!306198))

(assert (= (and b!306198 c!14920) b!306199))

(assert (= (and b!306198 (not c!14920)) b!306197))

(assert (= (and b!306197 res!251524) b!306200))

(assert (= (and b!306200 (not res!251521)) b!306201))

(assert (= (or b!306199 b!306197) bm!5817))

(declare-fun m!444669 () Bool)

(assert (=> b!306201 m!444669))

(declare-fun m!444671 () Bool)

(assert (=> b!306201 m!444671))

(assert (=> b!306201 m!444669))

(assert (=> b!306201 m!444671))

(declare-fun m!444673 () Bool)

(assert (=> b!306201 m!444673))

(assert (=> b!306202 m!444459))

(declare-fun m!444675 () Bool)

(assert (=> b!306203 m!444675))

(declare-fun m!444677 () Bool)

(assert (=> bm!5817 m!444677))

(declare-fun m!444679 () Bool)

(assert (=> bm!5817 m!444679))

(assert (=> bm!5817 m!444677))

(assert (=> bm!5817 m!444679))

(declare-fun m!444681 () Bool)

(assert (=> bm!5817 m!444681))

(assert (=> b!306024 d!102180))

(declare-fun d!102182 () Bool)

(assert (=> d!102182 (arrayRangesEq!1676 a1!948 a2!948 (_1!13273 lt!439347) (_2!13273 lt!439347))))

(declare-fun lt!439472 () Unit!21349)

(declare-fun choose!618 (array!18566 array!18566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21349)

(assert (=> d!102182 (= lt!439472 (choose!618 a1!948 a2!948 (_1!13273 lt!439352) (_2!13273 lt!439352) (_1!13273 lt!439347) (_2!13273 lt!439347)))))

(assert (=> d!102182 (and (bvsle #b00000000000000000000000000000000 (_1!13273 lt!439352)) (bvsle (_1!13273 lt!439352) (_2!13273 lt!439352)))))

(assert (=> d!102182 (= (arrayRangesEqSlicedLemma!271 a1!948 a2!948 (_1!13273 lt!439352) (_2!13273 lt!439352) (_1!13273 lt!439347) (_2!13273 lt!439347)) lt!439472)))

(declare-fun bs!26325 () Bool)

(assert (= bs!26325 d!102182))

(assert (=> bs!26325 m!444485))

(declare-fun m!444697 () Bool)

(assert (=> bs!26325 m!444697))

(assert (=> b!306020 d!102182))

(declare-fun d!102186 () Bool)

(declare-fun res!251535 () Bool)

(declare-fun e!220596 () Bool)

(assert (=> d!102186 (=> res!251535 e!220596)))

(assert (=> d!102186 (= res!251535 (= (_1!13273 lt!439347) (_2!13273 lt!439347)))))

(assert (=> d!102186 (= (arrayRangesEq!1676 a1!948 a2!948 (_1!13273 lt!439347) (_2!13273 lt!439347)) e!220596)))

(declare-fun b!306215 () Bool)

(declare-fun e!220597 () Bool)

(assert (=> b!306215 (= e!220596 e!220597)))

(declare-fun res!251536 () Bool)

(assert (=> b!306215 (=> (not res!251536) (not e!220597))))

(assert (=> b!306215 (= res!251536 (= (select (arr!9130 a1!948) (_1!13273 lt!439347)) (select (arr!9130 a2!948) (_1!13273 lt!439347))))))

(declare-fun b!306216 () Bool)

(assert (=> b!306216 (= e!220597 (arrayRangesEq!1676 a1!948 a2!948 (bvadd (_1!13273 lt!439347) #b00000000000000000000000000000001) (_2!13273 lt!439347)))))

(assert (= (and d!102186 (not res!251535)) b!306215))

(assert (= (and b!306215 res!251536) b!306216))

(declare-fun m!444699 () Bool)

(assert (=> b!306215 m!444699))

(declare-fun m!444701 () Bool)

(assert (=> b!306215 m!444701))

(declare-fun m!444703 () Bool)

(assert (=> b!306216 m!444703))

(assert (=> b!306020 d!102186))

(push 1)

(assert (not b!306203))

(assert (not bm!5817))

(assert (not b!306181))

(assert (not b!306182))

(assert (not bm!5814))

(assert (not d!102152))

(assert (not b!306202))

(assert (not d!102182))

(assert (not d!102154))

(assert (not b!306216))

(assert (not b!306201))

(assert (not b!306180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

