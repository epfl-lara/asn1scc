; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67840 () Bool)

(assert start!67840)

(declare-fun b!304520 () Bool)

(declare-datatypes ((Unit!21256 0))(
  ( (Unit!21257) )
))
(declare-fun e!219231 () Unit!21256)

(declare-fun Unit!21258 () Unit!21256)

(assert (=> b!304520 (= e!219231 Unit!21258)))

(declare-fun b!304521 () Bool)

(declare-fun e!219236 () Bool)

(declare-fun e!219235 () Bool)

(assert (=> b!304521 (= e!219236 e!219235)))

(declare-fun res!250483 () Bool)

(assert (=> b!304521 (=> (not res!250483) (not e!219235))))

(declare-fun e!219230 () Bool)

(assert (=> b!304521 (= res!250483 e!219230)))

(declare-fun c!14603 () Bool)

(declare-datatypes ((tuple4!1192 0))(
  ( (tuple4!1193 (_1!13251 (_ BitVec 32)) (_2!13251 (_ BitVec 32)) (_3!1553 (_ BitVec 32)) (_4!596 (_ BitVec 32))) )
))
(declare-fun lt!438402 () tuple4!1192)

(assert (=> b!304521 (= c!14603 (= (_3!1553 lt!438402) (_4!596 lt!438402)))))

(declare-fun lt!438408 () Unit!21256)

(assert (=> b!304521 (= lt!438408 e!219231)))

(declare-fun c!14604 () Bool)

(declare-fun lt!438403 () tuple4!1192)

(assert (=> b!304521 (= c!14604 (bvslt (_1!13251 lt!438403) (_2!13251 lt!438403)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1192)

(assert (=> b!304521 (= lt!438403 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!438406 () (_ BitVec 32))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!304521 (= lt!438406 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438405 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!304521 (= lt!438405 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304521 (= lt!438402 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304522 () Bool)

(declare-fun e!219238 () Bool)

(assert (=> b!304522 (= e!219238 e!219236)))

(declare-fun res!250478 () Bool)

(assert (=> b!304522 (=> (not res!250478) (not e!219236))))

(declare-fun lt!438404 () (_ BitVec 64))

(assert (=> b!304522 (= res!250478 (and (bvsle toBit!258 lt!438404) (bvsle fromBit!258 lt!438404)))))

(declare-datatypes ((array!18501 0))(
  ( (array!18502 (arr!9108 (Array (_ BitVec 32) (_ BitVec 8))) (size!8025 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18501)

(assert (=> b!304522 (= lt!438404 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8025 a1!948))))))

(declare-fun e!219233 () Bool)

(declare-fun a2!948 () array!18501)

(declare-fun b!304523 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304523 (= e!219233 (byteRangesEq!0 (select (arr!9108 a1!948) (_4!596 lt!438402)) (select (arr!9108 a2!948) (_4!596 lt!438402)) #b00000000000000000000000000000000 lt!438406))))

(declare-fun b!304524 () Bool)

(declare-fun res!250485 () Bool)

(assert (=> b!304524 (=> (not res!250485) (not e!219236))))

(declare-fun arrayBitRangesEq!0 (array!18501 array!18501 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304524 (= res!250485 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun res!250480 () Bool)

(assert (=> start!67840 (=> (not res!250480) (not e!219238))))

(assert (=> start!67840 (= res!250480 (and (bvsle (size!8025 a1!948) (size!8025 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67840 e!219238))

(assert (=> start!67840 true))

(declare-fun array_inv!7637 (array!18501) Bool)

(assert (=> start!67840 (array_inv!7637 a1!948)))

(assert (=> start!67840 (array_inv!7637 a2!948)))

(declare-fun b!304525 () Bool)

(declare-fun e!219234 () Bool)

(assert (=> b!304525 (= e!219230 e!219234)))

(declare-fun res!250484 () Bool)

(declare-fun call!5675 () Bool)

(assert (=> b!304525 (= res!250484 call!5675)))

(assert (=> b!304525 (=> (not res!250484) (not e!219234))))

(declare-fun bm!5672 () Bool)

(assert (=> bm!5672 (= call!5675 (byteRangesEq!0 (select (arr!9108 a1!948) (_3!1553 lt!438402)) (select (arr!9108 a2!948) (_3!1553 lt!438402)) lt!438405 (ite c!14603 lt!438406 #b00000000000000000000000000000111)))))

(declare-fun b!304526 () Bool)

(declare-fun res!250479 () Bool)

(assert (=> b!304526 (=> (not res!250479) (not e!219236))))

(assert (=> b!304526 (= res!250479 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438404) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!304527 () Bool)

(declare-fun res!250482 () Bool)

(assert (=> b!304527 (=> (not res!250482) (not e!219235))))

(assert (=> b!304527 (= res!250482 (and (bvslt (_3!1553 lt!438402) (_3!1553 lt!438403)) (bvslt (_3!1553 lt!438403) (_4!596 lt!438402)) (bvsle #b00000000000000000000000000000000 (_1!13251 lt!438402)) (bvsle (_1!13251 lt!438402) (_2!13251 lt!438402)) (bvsle (_2!13251 lt!438402) (size!8025 a1!948)) (bvsle (_1!13251 lt!438402) (_3!1553 lt!438403)) (bvslt (_3!1553 lt!438403) (_2!13251 lt!438402))))))

(declare-fun b!304528 () Bool)

(assert (=> b!304528 (= e!219230 call!5675)))

(declare-fun b!304529 () Bool)

(declare-fun res!250481 () Bool)

(assert (=> b!304529 (= res!250481 (= lt!438406 #b00000000000000000000000000000000))))

(assert (=> b!304529 (=> res!250481 e!219233)))

(assert (=> b!304529 (= e!219234 e!219233)))

(declare-fun b!304530 () Bool)

(declare-fun lt!438407 () Unit!21256)

(assert (=> b!304530 (= e!219231 lt!438407)))

(declare-fun arrayRangesEqSlicedLemma!249 (array!18501 array!18501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21256)

(assert (=> b!304530 (= lt!438407 (arrayRangesEqSlicedLemma!249 a1!948 a2!948 (_1!13251 lt!438402) (_2!13251 lt!438402) (_1!13251 lt!438403) (_2!13251 lt!438403)))))

(declare-fun arrayRangesEq!1654 (array!18501 array!18501 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304530 (arrayRangesEq!1654 a1!948 a2!948 (_1!13251 lt!438403) (_2!13251 lt!438403))))

(declare-fun b!304531 () Bool)

(assert (=> b!304531 (= e!219235 (not (arrayRangesEq!1654 a1!948 a2!948 (_1!13251 lt!438402) (_2!13251 lt!438402))))))

(assert (= (and start!67840 res!250480) b!304522))

(assert (= (and b!304522 res!250478) b!304524))

(assert (= (and b!304524 res!250485) b!304526))

(assert (= (and b!304526 res!250479) b!304521))

(assert (= (and b!304521 c!14604) b!304530))

(assert (= (and b!304521 (not c!14604)) b!304520))

(assert (= (and b!304521 c!14603) b!304528))

(assert (= (and b!304521 (not c!14603)) b!304525))

(assert (= (and b!304525 res!250484) b!304529))

(assert (= (and b!304529 (not res!250481)) b!304523))

(assert (= (or b!304528 b!304525) bm!5672))

(assert (= (and b!304521 res!250483) b!304527))

(assert (= (and b!304527 res!250482) b!304531))

(declare-fun m!443003 () Bool)

(assert (=> b!304530 m!443003))

(declare-fun m!443005 () Bool)

(assert (=> b!304530 m!443005))

(declare-fun m!443007 () Bool)

(assert (=> bm!5672 m!443007))

(declare-fun m!443009 () Bool)

(assert (=> bm!5672 m!443009))

(assert (=> bm!5672 m!443007))

(assert (=> bm!5672 m!443009))

(declare-fun m!443011 () Bool)

(assert (=> bm!5672 m!443011))

(declare-fun m!443013 () Bool)

(assert (=> b!304531 m!443013))

(declare-fun m!443015 () Bool)

(assert (=> b!304524 m!443015))

(declare-fun m!443017 () Bool)

(assert (=> b!304523 m!443017))

(declare-fun m!443019 () Bool)

(assert (=> b!304523 m!443019))

(assert (=> b!304523 m!443017))

(assert (=> b!304523 m!443019))

(declare-fun m!443021 () Bool)

(assert (=> b!304523 m!443021))

(declare-fun m!443023 () Bool)

(assert (=> b!304521 m!443023))

(declare-fun m!443025 () Bool)

(assert (=> b!304521 m!443025))

(declare-fun m!443027 () Bool)

(assert (=> start!67840 m!443027))

(declare-fun m!443029 () Bool)

(assert (=> start!67840 m!443029))

(push 1)

(assert (not b!304531))

(assert (not b!304523))

(assert (not b!304521))

(assert (not bm!5672))

(assert (not start!67840))

(assert (not b!304530))

(assert (not b!304524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101708 () Bool)

(declare-fun res!250536 () Bool)

(declare-fun e!219295 () Bool)

(assert (=> d!101708 (=> res!250536 e!219295)))

(assert (=> d!101708 (= res!250536 (= (_1!13251 lt!438402) (_2!13251 lt!438402)))))

(assert (=> d!101708 (= (arrayRangesEq!1654 a1!948 a2!948 (_1!13251 lt!438402) (_2!13251 lt!438402)) e!219295)))

(declare-fun b!304594 () Bool)

(declare-fun e!219296 () Bool)

(assert (=> b!304594 (= e!219295 e!219296)))

(declare-fun res!250537 () Bool)

(assert (=> b!304594 (=> (not res!250537) (not e!219296))))

(assert (=> b!304594 (= res!250537 (= (select (arr!9108 a1!948) (_1!13251 lt!438402)) (select (arr!9108 a2!948) (_1!13251 lt!438402))))))

(declare-fun b!304595 () Bool)

(assert (=> b!304595 (= e!219296 (arrayRangesEq!1654 a1!948 a2!948 (bvadd (_1!13251 lt!438402) #b00000000000000000000000000000001) (_2!13251 lt!438402)))))

(assert (= (and d!101708 (not res!250536)) b!304594))

(assert (= (and b!304594 res!250537) b!304595))

(declare-fun m!443103 () Bool)

(assert (=> b!304594 m!443103))

(declare-fun m!443105 () Bool)

(assert (=> b!304594 m!443105))

(declare-fun m!443107 () Bool)

(assert (=> b!304595 m!443107))

(assert (=> b!304531 d!101708))

(declare-fun d!101710 () Bool)

(assert (=> d!101710 (arrayRangesEq!1654 a1!948 a2!948 (_1!13251 lt!438403) (_2!13251 lt!438403))))

(declare-fun lt!438435 () Unit!21256)

(declare-fun choose!577 (array!18501 array!18501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21256)

(assert (=> d!101710 (= lt!438435 (choose!577 a1!948 a2!948 (_1!13251 lt!438402) (_2!13251 lt!438402) (_1!13251 lt!438403) (_2!13251 lt!438403)))))

(assert (=> d!101710 (and (bvsle #b00000000000000000000000000000000 (_1!13251 lt!438402)) (bvsle (_1!13251 lt!438402) (_2!13251 lt!438402)))))

(assert (=> d!101710 (= (arrayRangesEqSlicedLemma!249 a1!948 a2!948 (_1!13251 lt!438402) (_2!13251 lt!438402) (_1!13251 lt!438403) (_2!13251 lt!438403)) lt!438435)))

(declare-fun bs!26208 () Bool)

(assert (= bs!26208 d!101710))

(assert (=> bs!26208 m!443005))

(declare-fun m!443109 () Bool)

(assert (=> bs!26208 m!443109))

(assert (=> b!304530 d!101710))

(declare-fun d!101712 () Bool)

(declare-fun res!250538 () Bool)

(declare-fun e!219297 () Bool)

(assert (=> d!101712 (=> res!250538 e!219297)))

(assert (=> d!101712 (= res!250538 (= (_1!13251 lt!438403) (_2!13251 lt!438403)))))

(assert (=> d!101712 (= (arrayRangesEq!1654 a1!948 a2!948 (_1!13251 lt!438403) (_2!13251 lt!438403)) e!219297)))

(declare-fun b!304596 () Bool)

(declare-fun e!219298 () Bool)

(assert (=> b!304596 (= e!219297 e!219298)))

(declare-fun res!250539 () Bool)

(assert (=> b!304596 (=> (not res!250539) (not e!219298))))

(assert (=> b!304596 (= res!250539 (= (select (arr!9108 a1!948) (_1!13251 lt!438403)) (select (arr!9108 a2!948) (_1!13251 lt!438403))))))

(declare-fun b!304597 () Bool)

(assert (=> b!304597 (= e!219298 (arrayRangesEq!1654 a1!948 a2!948 (bvadd (_1!13251 lt!438403) #b00000000000000000000000000000001) (_2!13251 lt!438403)))))

(assert (= (and d!101712 (not res!250538)) b!304596))

(assert (= (and b!304596 res!250539) b!304597))

(declare-fun m!443111 () Bool)

(assert (=> b!304596 m!443111))

(declare-fun m!443113 () Bool)

(assert (=> b!304596 m!443113))

(declare-fun m!443115 () Bool)

(assert (=> b!304597 m!443115))

(assert (=> b!304530 d!101712))

(declare-fun d!101714 () Bool)

(assert (=> d!101714 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1193 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304521 d!101714))

(declare-fun d!101716 () Bool)

(assert (=> d!101716 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1193 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304521 d!101716))

(declare-fun d!101718 () Bool)

(assert (=> d!101718 (= (byteRangesEq!0 (select (arr!9108 a1!948) (_3!1553 lt!438402)) (select (arr!9108 a2!948) (_3!1553 lt!438402)) lt!438405 (ite c!14603 lt!438406 #b00000000000000000000000000000111)) (or (= lt!438405 (ite c!14603 lt!438406 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9108 a1!948) (_3!1553 lt!438402))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14603 lt!438406 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438405)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9108 a2!948) (_3!1553 lt!438402))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14603 lt!438406 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438405)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26209 () Bool)

(assert (= bs!26209 d!101718))

(declare-fun m!443117 () Bool)

(assert (=> bs!26209 m!443117))

(declare-fun m!443119 () Bool)

(assert (=> bs!26209 m!443119))

(assert (=> bm!5672 d!101718))

(declare-fun lt!438442 () (_ BitVec 32))

(declare-fun lt!438444 () tuple4!1192)

(declare-fun e!219315 () Bool)

(declare-fun b!304612 () Bool)

(assert (=> b!304612 (= e!219315 (byteRangesEq!0 (select (arr!9108 a1!948) (_4!596 lt!438444)) (select (arr!9108 a2!948) (_4!596 lt!438444)) #b00000000000000000000000000000000 lt!438442))))

(declare-fun d!101720 () Bool)

(declare-fun res!250554 () Bool)

(declare-fun e!219313 () Bool)

(assert (=> d!101720 (=> res!250554 e!219313)))

(assert (=> d!101720 (= res!250554 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101720 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219313)))

(declare-fun b!304613 () Bool)

(declare-fun e!219314 () Bool)

(declare-fun call!5684 () Bool)

(assert (=> b!304613 (= e!219314 call!5684)))

(declare-fun b!304614 () Bool)

(declare-fun e!219311 () Bool)

(assert (=> b!304614 (= e!219311 e!219314)))

(declare-fun c!14613 () Bool)

(assert (=> b!304614 (= c!14613 (= (_3!1553 lt!438444) (_4!596 lt!438444)))))

(declare-fun bm!5681 () Bool)

(declare-fun lt!438443 () (_ BitVec 32))

(assert (=> bm!5681 (= call!5684 (byteRangesEq!0 (select (arr!9108 a1!948) (_3!1553 lt!438444)) (select (arr!9108 a2!948) (_3!1553 lt!438444)) lt!438443 (ite c!14613 lt!438442 #b00000000000000000000000000001000)))))

(declare-fun b!304615 () Bool)

(declare-fun res!250552 () Bool)

(assert (=> b!304615 (= res!250552 (= lt!438442 #b00000000000000000000000000000000))))

(assert (=> b!304615 (=> res!250552 e!219315)))

(declare-fun e!219316 () Bool)

(assert (=> b!304615 (= e!219316 e!219315)))

(declare-fun b!304616 () Bool)

(declare-fun e!219312 () Bool)

(assert (=> b!304616 (= e!219312 (arrayRangesEq!1654 a1!948 a2!948 (_1!13251 lt!438444) (_2!13251 lt!438444)))))

(declare-fun b!304617 () Bool)

(assert (=> b!304617 (= e!219313 e!219311)))

(declare-fun res!250550 () Bool)

(assert (=> b!304617 (=> (not res!250550) (not e!219311))))

(assert (=> b!304617 (= res!250550 e!219312)))

(declare-fun res!250553 () Bool)

(assert (=> b!304617 (=> res!250553 e!219312)))

(assert (=> b!304617 (= res!250553 (bvsge (_1!13251 lt!438444) (_2!13251 lt!438444)))))

(assert (=> b!304617 (= lt!438442 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304617 (= lt!438443 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304617 (= lt!438444 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304618 () Bool)

(assert (=> b!304618 (= e!219314 e!219316)))

(declare-fun res!250551 () Bool)

(assert (=> b!304618 (= res!250551 call!5684)))

(assert (=> b!304618 (=> (not res!250551) (not e!219316))))

(assert (= (and d!101720 (not res!250554)) b!304617))

(assert (= (and b!304617 (not res!250553)) b!304616))

(assert (= (and b!304617 res!250550) b!304614))

(assert (= (and b!304614 c!14613) b!304613))

(assert (= (and b!304614 (not c!14613)) b!304618))

(assert (= (and b!304618 res!250551) b!304615))

(assert (= (and b!304615 (not res!250552)) b!304612))

(assert (= (or b!304613 b!304618) bm!5681))

(declare-fun m!443121 () Bool)

(assert (=> b!304612 m!443121))

(declare-fun m!443123 () Bool)

(assert (=> b!304612 m!443123))

(assert (=> b!304612 m!443121))

(assert (=> b!304612 m!443123))

(declare-fun m!443125 () Bool)

(assert (=> b!304612 m!443125))

(declare-fun m!443127 () Bool)

(assert (=> bm!5681 m!443127))

(declare-fun m!443129 () Bool)

(assert (=> bm!5681 m!443129))

(assert (=> bm!5681 m!443127))

(assert (=> bm!5681 m!443129))

(declare-fun m!443131 () Bool)

(assert (=> bm!5681 m!443131))

(declare-fun m!443133 () Bool)

(assert (=> b!304616 m!443133))

(assert (=> b!304617 m!443025))

(assert (=> b!304524 d!101720))

(declare-fun d!101722 () Bool)

(assert (=> d!101722 (= (array_inv!7637 a1!948) (bvsge (size!8025 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67840 d!101722))

(declare-fun d!101724 () Bool)

(assert (=> d!101724 (= (array_inv!7637 a2!948) (bvsge (size!8025 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67840 d!101724))

(declare-fun d!101726 () Bool)

(assert (=> d!101726 (= (byteRangesEq!0 (select (arr!9108 a1!948) (_4!596 lt!438402)) (select (arr!9108 a2!948) (_4!596 lt!438402)) #b00000000000000000000000000000000 lt!438406) (or (= #b00000000000000000000000000000000 lt!438406) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9108 a1!948) (_4!596 lt!438402))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438406))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9108 a2!948) (_4!596 lt!438402))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438406))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26210 () Bool)

(assert (= bs!26210 d!101726))

(declare-fun m!443135 () Bool)

(assert (=> bs!26210 m!443135))

(declare-fun m!443137 () Bool)

(assert (=> bs!26210 m!443137))

(assert (=> b!304523 d!101726))

(push 1)

(assert (not b!304612))

(assert (not d!101710))

(assert (not b!304597))

(assert (not b!304617))

(assert (not bm!5681))

(assert (not b!304616))

(assert (not b!304595))

(check-sat)

