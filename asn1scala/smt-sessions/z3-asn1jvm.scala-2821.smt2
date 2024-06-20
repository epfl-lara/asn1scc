; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68174 () Bool)

(assert start!68174)

(declare-fun bm!5804 () Bool)

(declare-fun call!5807 () Bool)

(declare-fun lt!439388 () (_ BitVec 32))

(declare-datatypes ((array!18568 0))(
  ( (array!18569 (arr!9131 (Array (_ BitVec 32) (_ BitVec 8))) (size!8048 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18568)

(declare-fun a2!948 () array!18568)

(declare-fun c!14897 () Bool)

(declare-datatypes ((tuple4!1238 0))(
  ( (tuple4!1239 (_1!13274 (_ BitVec 32)) (_2!13274 (_ BitVec 32)) (_3!1576 (_ BitVec 32)) (_4!619 (_ BitVec 32))) )
))
(declare-fun lt!439382 () tuple4!1238)

(declare-fun lt!439379 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5804 (= call!5807 (byteRangesEq!0 (select (arr!9131 a1!948) (_3!1576 lt!439382)) (select (arr!9131 a2!948) (_3!1576 lt!439382)) lt!439379 (ite c!14897 lt!439388 #b00000000000000000000000000000111)))))

(declare-fun b!306060 () Bool)

(declare-fun e!220472 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18568 array!18568 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306060 (= e!220472 (not (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52)))))

(declare-fun b!306061 () Bool)

(declare-datatypes ((Unit!21354 0))(
  ( (Unit!21355) )
))
(declare-fun e!220483 () Unit!21354)

(declare-fun Unit!21356 () Unit!21354)

(assert (=> b!306061 (= e!220483 Unit!21356)))

(declare-fun b!306063 () Bool)

(declare-fun res!251438 () Bool)

(assert (=> b!306063 (=> (not res!251438) (not e!220472))))

(declare-fun lt!439385 () tuple4!1238)

(assert (=> b!306063 (= res!251438 (byteRangesEq!0 (select (arr!9131 a1!948) (_3!1576 lt!439385)) (select (arr!9131 a2!948) (_3!1576 lt!439385)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!306064 () Bool)

(declare-fun e!220473 () Unit!21354)

(declare-fun lt!439389 () Unit!21354)

(assert (=> b!306064 (= e!220473 lt!439389)))

(declare-fun arrayRangesEqImpliesEq!281 (array!18568 array!18568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21354)

(assert (=> b!306064 (= lt!439389 (arrayRangesEqImpliesEq!281 a1!948 a2!948 (_1!13274 lt!439382) (_4!619 lt!439385) (_2!13274 lt!439382)))))

(assert (=> b!306064 (= (select (arr!9131 a1!948) (_4!619 lt!439385)) (select (arr!9131 a2!948) (_4!619 lt!439385)))))

(declare-fun b!306065 () Bool)

(declare-fun e!220481 () Bool)

(assert (=> b!306065 (= e!220481 e!220472)))

(declare-fun res!251441 () Bool)

(assert (=> b!306065 (=> (not res!251441) (not e!220472))))

(assert (=> b!306065 (= res!251441 (= (_3!1576 lt!439385) (_4!619 lt!439385)))))

(declare-fun lt!439380 () Unit!21354)

(assert (=> b!306065 (= lt!439380 e!220473)))

(declare-fun c!14898 () Bool)

(assert (=> b!306065 (= c!14898 (and (bvslt (_4!619 lt!439385) (_4!619 lt!439382)) (bvslt (_3!1576 lt!439382) (_4!619 lt!439385))))))

(declare-fun lt!439384 () Unit!21354)

(assert (=> b!306065 (= lt!439384 e!220483)))

(declare-fun c!14896 () Bool)

(assert (=> b!306065 (= c!14896 (and (bvslt (_3!1576 lt!439382) (_3!1576 lt!439385)) (bvslt (_3!1576 lt!439385) (_4!619 lt!439382))))))

(declare-fun b!306066 () Bool)

(declare-fun res!251436 () Bool)

(assert (=> b!306066 (= res!251436 (= lt!439388 #b00000000000000000000000000000000))))

(declare-fun e!220475 () Bool)

(assert (=> b!306066 (=> res!251436 e!220475)))

(declare-fun e!220482 () Bool)

(assert (=> b!306066 (= e!220482 e!220475)))

(declare-fun b!306067 () Bool)

(declare-fun e!220477 () Unit!21354)

(declare-fun Unit!21357 () Unit!21354)

(assert (=> b!306067 (= e!220477 Unit!21357)))

(declare-fun b!306068 () Bool)

(declare-fun e!220480 () Bool)

(declare-fun e!220478 () Bool)

(assert (=> b!306068 (= e!220480 e!220478)))

(declare-fun res!251434 () Bool)

(assert (=> b!306068 (=> (not res!251434) (not e!220478))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!439387 () (_ BitVec 64))

(assert (=> b!306068 (= res!251434 (and (bvsle toBit!258 lt!439387) (bvsle fromBit!258 lt!439387)))))

(assert (=> b!306068 (= lt!439387 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8048 a1!948))))))

(declare-fun b!306069 () Bool)

(declare-fun lt!439383 () Unit!21354)

(assert (=> b!306069 (= e!220483 lt!439383)))

(assert (=> b!306069 (= lt!439383 (arrayRangesEqImpliesEq!281 a1!948 a2!948 (_1!13274 lt!439382) (_3!1576 lt!439385) (_2!13274 lt!439382)))))

(assert (=> b!306069 (= (select (arr!9131 a1!948) (_3!1576 lt!439385)) (select (arr!9131 a2!948) (_3!1576 lt!439385)))))

(declare-fun b!306062 () Bool)

(assert (=> b!306062 (= e!220478 e!220481)))

(declare-fun res!251435 () Bool)

(assert (=> b!306062 (=> (not res!251435) (not e!220481))))

(declare-fun e!220476 () Bool)

(assert (=> b!306062 (= res!251435 e!220476)))

(assert (=> b!306062 (= c!14897 (= (_3!1576 lt!439382) (_4!619 lt!439382)))))

(declare-fun lt!439381 () Unit!21354)

(assert (=> b!306062 (= lt!439381 e!220477)))

(declare-fun c!14895 () Bool)

(assert (=> b!306062 (= c!14895 (bvslt (_1!13274 lt!439385) (_2!13274 lt!439385)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1238)

(assert (=> b!306062 (= lt!439385 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306062 (= lt!439388 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306062 (= lt!439379 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306062 (= lt!439382 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!251439 () Bool)

(assert (=> start!68174 (=> (not res!251439) (not e!220480))))

(assert (=> start!68174 (= res!251439 (and (bvsle (size!8048 a1!948) (size!8048 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68174 e!220480))

(assert (=> start!68174 true))

(declare-fun array_inv!7660 (array!18568) Bool)

(assert (=> start!68174 (array_inv!7660 a1!948)))

(assert (=> start!68174 (array_inv!7660 a2!948)))

(declare-fun b!306070 () Bool)

(assert (=> b!306070 (= e!220476 call!5807)))

(declare-fun b!306071 () Bool)

(declare-fun lt!439386 () Unit!21354)

(assert (=> b!306071 (= e!220477 lt!439386)))

(declare-fun arrayRangesEqSlicedLemma!272 (array!18568 array!18568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21354)

(assert (=> b!306071 (= lt!439386 (arrayRangesEqSlicedLemma!272 a1!948 a2!948 (_1!13274 lt!439382) (_2!13274 lt!439382) (_1!13274 lt!439385) (_2!13274 lt!439385)))))

(declare-fun arrayRangesEq!1677 (array!18568 array!18568 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306071 (arrayRangesEq!1677 a1!948 a2!948 (_1!13274 lt!439385) (_2!13274 lt!439385))))

(declare-fun b!306072 () Bool)

(assert (=> b!306072 (= e!220475 (byteRangesEq!0 (select (arr!9131 a1!948) (_4!619 lt!439382)) (select (arr!9131 a2!948) (_4!619 lt!439382)) #b00000000000000000000000000000000 lt!439388))))

(declare-fun b!306073 () Bool)

(declare-fun Unit!21358 () Unit!21354)

(assert (=> b!306073 (= e!220473 Unit!21358)))

(declare-fun b!306074 () Bool)

(declare-fun res!251440 () Bool)

(assert (=> b!306074 (=> (not res!251440) (not e!220478))))

(assert (=> b!306074 (= res!251440 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306075 () Bool)

(assert (=> b!306075 (= e!220476 e!220482)))

(declare-fun res!251437 () Bool)

(assert (=> b!306075 (= res!251437 call!5807)))

(assert (=> b!306075 (=> (not res!251437) (not e!220482))))

(declare-fun b!306076 () Bool)

(declare-fun res!251442 () Bool)

(assert (=> b!306076 (=> (not res!251442) (not e!220478))))

(assert (=> b!306076 (= res!251442 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439387) (not (= fromSlice!52 toSlice!52))))))

(assert (= (and start!68174 res!251439) b!306068))

(assert (= (and b!306068 res!251434) b!306074))

(assert (= (and b!306074 res!251440) b!306076))

(assert (= (and b!306076 res!251442) b!306062))

(assert (= (and b!306062 c!14895) b!306071))

(assert (= (and b!306062 (not c!14895)) b!306067))

(assert (= (and b!306062 c!14897) b!306070))

(assert (= (and b!306062 (not c!14897)) b!306075))

(assert (= (and b!306075 res!251437) b!306066))

(assert (= (and b!306066 (not res!251436)) b!306072))

(assert (= (or b!306070 b!306075) bm!5804))

(assert (= (and b!306062 res!251435) b!306065))

(assert (= (and b!306065 c!14896) b!306069))

(assert (= (and b!306065 (not c!14896)) b!306061))

(assert (= (and b!306065 c!14898) b!306064))

(assert (= (and b!306065 (not c!14898)) b!306073))

(assert (= (and b!306065 res!251441) b!306063))

(assert (= (and b!306063 res!251438) b!306060))

(declare-fun m!444501 () Bool)

(assert (=> b!306064 m!444501))

(declare-fun m!444503 () Bool)

(assert (=> b!306064 m!444503))

(declare-fun m!444505 () Bool)

(assert (=> b!306064 m!444505))

(declare-fun m!444507 () Bool)

(assert (=> b!306072 m!444507))

(declare-fun m!444509 () Bool)

(assert (=> b!306072 m!444509))

(assert (=> b!306072 m!444507))

(assert (=> b!306072 m!444509))

(declare-fun m!444511 () Bool)

(assert (=> b!306072 m!444511))

(declare-fun m!444513 () Bool)

(assert (=> start!68174 m!444513))

(declare-fun m!444515 () Bool)

(assert (=> start!68174 m!444515))

(declare-fun m!444517 () Bool)

(assert (=> b!306060 m!444517))

(declare-fun m!444519 () Bool)

(assert (=> b!306063 m!444519))

(declare-fun m!444521 () Bool)

(assert (=> b!306063 m!444521))

(assert (=> b!306063 m!444519))

(assert (=> b!306063 m!444521))

(declare-fun m!444523 () Bool)

(assert (=> b!306063 m!444523))

(declare-fun m!444525 () Bool)

(assert (=> b!306074 m!444525))

(declare-fun m!444527 () Bool)

(assert (=> b!306062 m!444527))

(declare-fun m!444529 () Bool)

(assert (=> b!306062 m!444529))

(declare-fun m!444531 () Bool)

(assert (=> bm!5804 m!444531))

(declare-fun m!444533 () Bool)

(assert (=> bm!5804 m!444533))

(assert (=> bm!5804 m!444531))

(assert (=> bm!5804 m!444533))

(declare-fun m!444535 () Bool)

(assert (=> bm!5804 m!444535))

(declare-fun m!444537 () Bool)

(assert (=> b!306069 m!444537))

(assert (=> b!306069 m!444519))

(assert (=> b!306069 m!444521))

(declare-fun m!444539 () Bool)

(assert (=> b!306071 m!444539))

(declare-fun m!444541 () Bool)

(assert (=> b!306071 m!444541))

(check-sat (not b!306064) (not b!306072) (not b!306074) (not b!306071) (not b!306063) (not b!306062) (not b!306069) (not start!68174) (not b!306060) (not bm!5804))
(check-sat)
(get-model)

(declare-fun d!102122 () Bool)

(assert (=> d!102122 (= (byteRangesEq!0 (select (arr!9131 a1!948) (_3!1576 lt!439382)) (select (arr!9131 a2!948) (_3!1576 lt!439382)) lt!439379 (ite c!14897 lt!439388 #b00000000000000000000000000000111)) (or (= lt!439379 (ite c!14897 lt!439388 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9131 a1!948) (_3!1576 lt!439382))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14897 lt!439388 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439379)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9131 a2!948) (_3!1576 lt!439382))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14897 lt!439388 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439379)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26313 () Bool)

(assert (= bs!26313 d!102122))

(declare-fun m!444585 () Bool)

(assert (=> bs!26313 m!444585))

(declare-fun m!444587 () Bool)

(assert (=> bs!26313 m!444587))

(assert (=> bm!5804 d!102122))

(declare-fun e!220537 () Bool)

(declare-fun lt!439431 () tuple4!1238)

(declare-fun b!306142 () Bool)

(assert (=> b!306142 (= e!220537 (arrayRangesEq!1677 a1!948 a2!948 (_1!13274 lt!439431) (_2!13274 lt!439431)))))

(declare-fun call!5813 () Bool)

(declare-fun lt!439429 () (_ BitVec 32))

(declare-fun bm!5810 () Bool)

(declare-fun c!14913 () Bool)

(declare-fun lt!439430 () (_ BitVec 32))

(assert (=> bm!5810 (= call!5813 (byteRangesEq!0 (ite c!14913 (select (arr!9131 a1!948) (_3!1576 lt!439431)) (select (arr!9131 a1!948) (_4!619 lt!439431))) (ite c!14913 (select (arr!9131 a2!948) (_3!1576 lt!439431)) (select (arr!9131 a2!948) (_4!619 lt!439431))) (ite c!14913 lt!439429 #b00000000000000000000000000000000) lt!439430))))

(declare-fun b!306143 () Bool)

(declare-fun e!220535 () Bool)

(declare-fun e!220533 () Bool)

(assert (=> b!306143 (= e!220535 e!220533)))

(declare-fun res!251484 () Bool)

(assert (=> b!306143 (=> (not res!251484) (not e!220533))))

(assert (=> b!306143 (= res!251484 e!220537)))

(declare-fun res!251482 () Bool)

(assert (=> b!306143 (=> res!251482 e!220537)))

(assert (=> b!306143 (= res!251482 (bvsge (_1!13274 lt!439431) (_2!13274 lt!439431)))))

(assert (=> b!306143 (= lt!439430 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306143 (= lt!439429 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306143 (= lt!439431 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun b!306144 () Bool)

(declare-fun e!220532 () Bool)

(assert (=> b!306144 (= e!220532 call!5813)))

(declare-fun b!306145 () Bool)

(declare-fun e!220534 () Bool)

(assert (=> b!306145 (= e!220534 call!5813)))

(declare-fun d!102124 () Bool)

(declare-fun res!251483 () Bool)

(assert (=> d!102124 (=> res!251483 e!220535)))

(assert (=> d!102124 (= res!251483 (bvsge fromSlice!52 toSlice!52))))

(assert (=> d!102124 (= (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52) e!220535)))

(declare-fun b!306146 () Bool)

(assert (=> b!306146 (= e!220533 e!220532)))

(assert (=> b!306146 (= c!14913 (= (_3!1576 lt!439431) (_4!619 lt!439431)))))

(declare-fun b!306147 () Bool)

(declare-fun res!251480 () Bool)

(assert (=> b!306147 (= res!251480 (= lt!439430 #b00000000000000000000000000000000))))

(assert (=> b!306147 (=> res!251480 e!220534)))

(declare-fun e!220536 () Bool)

(assert (=> b!306147 (= e!220536 e!220534)))

(declare-fun b!306148 () Bool)

(assert (=> b!306148 (= e!220532 e!220536)))

(declare-fun res!251481 () Bool)

(assert (=> b!306148 (= res!251481 (byteRangesEq!0 (select (arr!9131 a1!948) (_3!1576 lt!439431)) (select (arr!9131 a2!948) (_3!1576 lt!439431)) lt!439429 #b00000000000000000000000000001000))))

(assert (=> b!306148 (=> (not res!251481) (not e!220536))))

(assert (= (and d!102124 (not res!251483)) b!306143))

(assert (= (and b!306143 (not res!251482)) b!306142))

(assert (= (and b!306143 res!251484) b!306146))

(assert (= (and b!306146 c!14913) b!306144))

(assert (= (and b!306146 (not c!14913)) b!306148))

(assert (= (and b!306148 res!251481) b!306147))

(assert (= (and b!306147 (not res!251480)) b!306145))

(assert (= (or b!306144 b!306145) bm!5810))

(declare-fun m!444589 () Bool)

(assert (=> b!306142 m!444589))

(declare-fun m!444591 () Bool)

(assert (=> bm!5810 m!444591))

(declare-fun m!444593 () Bool)

(assert (=> bm!5810 m!444593))

(declare-fun m!444595 () Bool)

(assert (=> bm!5810 m!444595))

(declare-fun m!444597 () Bool)

(assert (=> bm!5810 m!444597))

(declare-fun m!444599 () Bool)

(assert (=> bm!5810 m!444599))

(assert (=> b!306143 m!444527))

(assert (=> b!306148 m!444595))

(assert (=> b!306148 m!444593))

(assert (=> b!306148 m!444595))

(assert (=> b!306148 m!444593))

(declare-fun m!444601 () Bool)

(assert (=> b!306148 m!444601))

(assert (=> b!306060 d!102124))

(declare-fun d!102126 () Bool)

(assert (=> d!102126 (= (byteRangesEq!0 (select (arr!9131 a1!948) (_3!1576 lt!439385)) (select (arr!9131 a2!948) (_3!1576 lt!439385)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9131 a1!948) (_3!1576 lt!439385))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9131 a2!948) (_3!1576 lt!439385))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26314 () Bool)

(assert (= bs!26314 d!102126))

(declare-fun m!444603 () Bool)

(assert (=> bs!26314 m!444603))

(declare-fun m!444605 () Bool)

(assert (=> bs!26314 m!444605))

(assert (=> b!306063 d!102126))

(declare-fun lt!439434 () tuple4!1238)

(declare-fun b!306149 () Bool)

(declare-fun e!220543 () Bool)

(assert (=> b!306149 (= e!220543 (arrayRangesEq!1677 a1!948 a2!948 (_1!13274 lt!439434) (_2!13274 lt!439434)))))

(declare-fun lt!439433 () (_ BitVec 32))

(declare-fun c!14914 () Bool)

(declare-fun call!5814 () Bool)

(declare-fun lt!439432 () (_ BitVec 32))

(declare-fun bm!5811 () Bool)

(assert (=> bm!5811 (= call!5814 (byteRangesEq!0 (ite c!14914 (select (arr!9131 a1!948) (_3!1576 lt!439434)) (select (arr!9131 a1!948) (_4!619 lt!439434))) (ite c!14914 (select (arr!9131 a2!948) (_3!1576 lt!439434)) (select (arr!9131 a2!948) (_4!619 lt!439434))) (ite c!14914 lt!439432 #b00000000000000000000000000000000) lt!439433))))

(declare-fun b!306150 () Bool)

(declare-fun e!220541 () Bool)

(declare-fun e!220539 () Bool)

(assert (=> b!306150 (= e!220541 e!220539)))

(declare-fun res!251489 () Bool)

(assert (=> b!306150 (=> (not res!251489) (not e!220539))))

(assert (=> b!306150 (= res!251489 e!220543)))

(declare-fun res!251487 () Bool)

(assert (=> b!306150 (=> res!251487 e!220543)))

(assert (=> b!306150 (= res!251487 (bvsge (_1!13274 lt!439434) (_2!13274 lt!439434)))))

(assert (=> b!306150 (= lt!439433 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306150 (= lt!439432 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306150 (= lt!439434 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306151 () Bool)

(declare-fun e!220538 () Bool)

(assert (=> b!306151 (= e!220538 call!5814)))

(declare-fun b!306152 () Bool)

(declare-fun e!220540 () Bool)

(assert (=> b!306152 (= e!220540 call!5814)))

(declare-fun d!102128 () Bool)

(declare-fun res!251488 () Bool)

(assert (=> d!102128 (=> res!251488 e!220541)))

(assert (=> d!102128 (= res!251488 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102128 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220541)))

(declare-fun b!306153 () Bool)

(assert (=> b!306153 (= e!220539 e!220538)))

(assert (=> b!306153 (= c!14914 (= (_3!1576 lt!439434) (_4!619 lt!439434)))))

(declare-fun b!306154 () Bool)

(declare-fun res!251485 () Bool)

(assert (=> b!306154 (= res!251485 (= lt!439433 #b00000000000000000000000000000000))))

(assert (=> b!306154 (=> res!251485 e!220540)))

(declare-fun e!220542 () Bool)

(assert (=> b!306154 (= e!220542 e!220540)))

(declare-fun b!306155 () Bool)

(assert (=> b!306155 (= e!220538 e!220542)))

(declare-fun res!251486 () Bool)

(assert (=> b!306155 (= res!251486 (byteRangesEq!0 (select (arr!9131 a1!948) (_3!1576 lt!439434)) (select (arr!9131 a2!948) (_3!1576 lt!439434)) lt!439432 #b00000000000000000000000000001000))))

(assert (=> b!306155 (=> (not res!251486) (not e!220542))))

(assert (= (and d!102128 (not res!251488)) b!306150))

(assert (= (and b!306150 (not res!251487)) b!306149))

(assert (= (and b!306150 res!251489) b!306153))

(assert (= (and b!306153 c!14914) b!306151))

(assert (= (and b!306153 (not c!14914)) b!306155))

(assert (= (and b!306155 res!251486) b!306154))

(assert (= (and b!306154 (not res!251485)) b!306152))

(assert (= (or b!306151 b!306152) bm!5811))

(declare-fun m!444607 () Bool)

(assert (=> b!306149 m!444607))

(declare-fun m!444609 () Bool)

(assert (=> bm!5811 m!444609))

(declare-fun m!444611 () Bool)

(assert (=> bm!5811 m!444611))

(declare-fun m!444613 () Bool)

(assert (=> bm!5811 m!444613))

(declare-fun m!444615 () Bool)

(assert (=> bm!5811 m!444615))

(declare-fun m!444617 () Bool)

(assert (=> bm!5811 m!444617))

(assert (=> b!306150 m!444529))

(assert (=> b!306155 m!444613))

(assert (=> b!306155 m!444611))

(assert (=> b!306155 m!444613))

(assert (=> b!306155 m!444611))

(declare-fun m!444619 () Bool)

(assert (=> b!306155 m!444619))

(assert (=> b!306074 d!102128))

(declare-fun d!102130 () Bool)

(assert (=> d!102130 (and (bvsge (_3!1576 lt!439385) #b00000000000000000000000000000000) (bvslt (_3!1576 lt!439385) (size!8048 a1!948)) (bvslt (_3!1576 lt!439385) (size!8048 a2!948)) (= (select (arr!9131 a1!948) (_3!1576 lt!439385)) (select (arr!9131 a2!948) (_3!1576 lt!439385))))))

(declare-fun lt!439437 () Unit!21354)

(declare-fun choose!614 (array!18568 array!18568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21354)

(assert (=> d!102130 (= lt!439437 (choose!614 a1!948 a2!948 (_1!13274 lt!439382) (_3!1576 lt!439385) (_2!13274 lt!439382)))))

(assert (=> d!102130 (and (bvsle #b00000000000000000000000000000000 (_1!13274 lt!439382)) (bvsle (_1!13274 lt!439382) (_2!13274 lt!439382)))))

(assert (=> d!102130 (= (arrayRangesEqImpliesEq!281 a1!948 a2!948 (_1!13274 lt!439382) (_3!1576 lt!439385) (_2!13274 lt!439382)) lt!439437)))

(declare-fun bs!26315 () Bool)

(assert (= bs!26315 d!102130))

(assert (=> bs!26315 m!444519))

(assert (=> bs!26315 m!444521))

(declare-fun m!444621 () Bool)

(assert (=> bs!26315 m!444621))

(assert (=> b!306069 d!102130))

(declare-fun d!102132 () Bool)

(assert (=> d!102132 (and (bvsge (_4!619 lt!439385) #b00000000000000000000000000000000) (bvslt (_4!619 lt!439385) (size!8048 a1!948)) (bvslt (_4!619 lt!439385) (size!8048 a2!948)) (= (select (arr!9131 a1!948) (_4!619 lt!439385)) (select (arr!9131 a2!948) (_4!619 lt!439385))))))

(declare-fun lt!439438 () Unit!21354)

(assert (=> d!102132 (= lt!439438 (choose!614 a1!948 a2!948 (_1!13274 lt!439382) (_4!619 lt!439385) (_2!13274 lt!439382)))))

(assert (=> d!102132 (and (bvsle #b00000000000000000000000000000000 (_1!13274 lt!439382)) (bvsle (_1!13274 lt!439382) (_2!13274 lt!439382)))))

(assert (=> d!102132 (= (arrayRangesEqImpliesEq!281 a1!948 a2!948 (_1!13274 lt!439382) (_4!619 lt!439385) (_2!13274 lt!439382)) lt!439438)))

(declare-fun bs!26316 () Bool)

(assert (= bs!26316 d!102132))

(assert (=> bs!26316 m!444503))

(assert (=> bs!26316 m!444505))

(declare-fun m!444623 () Bool)

(assert (=> bs!26316 m!444623))

(assert (=> b!306064 d!102132))

(declare-fun d!102134 () Bool)

(assert (=> d!102134 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1239 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306062 d!102134))

(declare-fun d!102138 () Bool)

(assert (=> d!102138 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1239 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306062 d!102138))

(declare-fun d!102140 () Bool)

(assert (=> d!102140 (arrayRangesEq!1677 a1!948 a2!948 (_1!13274 lt!439385) (_2!13274 lt!439385))))

(declare-fun lt!439441 () Unit!21354)

(declare-fun choose!615 (array!18568 array!18568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21354)

(assert (=> d!102140 (= lt!439441 (choose!615 a1!948 a2!948 (_1!13274 lt!439382) (_2!13274 lt!439382) (_1!13274 lt!439385) (_2!13274 lt!439385)))))

(assert (=> d!102140 (and (bvsle #b00000000000000000000000000000000 (_1!13274 lt!439382)) (bvsle (_1!13274 lt!439382) (_2!13274 lt!439382)))))

(assert (=> d!102140 (= (arrayRangesEqSlicedLemma!272 a1!948 a2!948 (_1!13274 lt!439382) (_2!13274 lt!439382) (_1!13274 lt!439385) (_2!13274 lt!439385)) lt!439441)))

(declare-fun bs!26317 () Bool)

(assert (= bs!26317 d!102140))

(assert (=> bs!26317 m!444541))

(declare-fun m!444625 () Bool)

(assert (=> bs!26317 m!444625))

(assert (=> b!306071 d!102140))

(declare-fun d!102142 () Bool)

(declare-fun res!251494 () Bool)

(declare-fun e!220548 () Bool)

(assert (=> d!102142 (=> res!251494 e!220548)))

(assert (=> d!102142 (= res!251494 (= (_1!13274 lt!439385) (_2!13274 lt!439385)))))

(assert (=> d!102142 (= (arrayRangesEq!1677 a1!948 a2!948 (_1!13274 lt!439385) (_2!13274 lt!439385)) e!220548)))

(declare-fun b!306160 () Bool)

(declare-fun e!220549 () Bool)

(assert (=> b!306160 (= e!220548 e!220549)))

(declare-fun res!251495 () Bool)

(assert (=> b!306160 (=> (not res!251495) (not e!220549))))

(assert (=> b!306160 (= res!251495 (= (select (arr!9131 a1!948) (_1!13274 lt!439385)) (select (arr!9131 a2!948) (_1!13274 lt!439385))))))

(declare-fun b!306161 () Bool)

(assert (=> b!306161 (= e!220549 (arrayRangesEq!1677 a1!948 a2!948 (bvadd (_1!13274 lt!439385) #b00000000000000000000000000000001) (_2!13274 lt!439385)))))

(assert (= (and d!102142 (not res!251494)) b!306160))

(assert (= (and b!306160 res!251495) b!306161))

(declare-fun m!444627 () Bool)

(assert (=> b!306160 m!444627))

(declare-fun m!444629 () Bool)

(assert (=> b!306160 m!444629))

(declare-fun m!444631 () Bool)

(assert (=> b!306161 m!444631))

(assert (=> b!306071 d!102142))

(declare-fun d!102144 () Bool)

(assert (=> d!102144 (= (array_inv!7660 a1!948) (bvsge (size!8048 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68174 d!102144))

(declare-fun d!102146 () Bool)

(assert (=> d!102146 (= (array_inv!7660 a2!948) (bvsge (size!8048 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68174 d!102146))

(declare-fun d!102148 () Bool)

(assert (=> d!102148 (= (byteRangesEq!0 (select (arr!9131 a1!948) (_4!619 lt!439382)) (select (arr!9131 a2!948) (_4!619 lt!439382)) #b00000000000000000000000000000000 lt!439388) (or (= #b00000000000000000000000000000000 lt!439388) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9131 a1!948) (_4!619 lt!439382))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439388))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9131 a2!948) (_4!619 lt!439382))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439388))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26318 () Bool)

(assert (= bs!26318 d!102148))

(declare-fun m!444633 () Bool)

(assert (=> bs!26318 m!444633))

(declare-fun m!444635 () Bool)

(assert (=> bs!26318 m!444635))

(assert (=> b!306072 d!102148))

(check-sat (not b!306161) (not bm!5810) (not d!102132) (not b!306149) (not b!306142) (not d!102130) (not d!102140) (not b!306148) (not b!306143) (not b!306150) (not b!306155) (not bm!5811))
(check-sat)
