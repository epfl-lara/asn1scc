; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67102 () Bool)

(assert start!67102)

(declare-fun b!301350 () Bool)

(declare-datatypes ((Unit!21106 0))(
  ( (Unit!21107) )
))
(declare-fun e!216414 () Unit!21106)

(declare-fun lt!436642 () Unit!21106)

(assert (=> b!301350 (= e!216414 lt!436642)))

(declare-datatypes ((array!18263 0))(
  ( (array!18264 (arr!9016 (Array (_ BitVec 32) (_ BitVec 8))) (size!7933 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18263)

(declare-datatypes ((tuple4!1074 0))(
  ( (tuple4!1075 (_1!13192 (_ BitVec 32)) (_2!13192 (_ BitVec 32)) (_3!1494 (_ BitVec 32)) (_4!537 (_ BitVec 32))) )
))
(declare-fun lt!436645 () tuple4!1074)

(declare-fun lt!436647 () tuple4!1074)

(declare-fun a2!948 () array!18263)

(declare-fun arrayRangesEqSlicedLemma!205 (array!18263 array!18263 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21106)

(assert (=> b!301350 (= lt!436642 (arrayRangesEqSlicedLemma!205 a1!948 a2!948 (_1!13192 lt!436647) (_2!13192 lt!436647) (_1!13192 lt!436645) (_2!13192 lt!436645)))))

(declare-fun arrayRangesEq!1595 (array!18263 array!18263 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301350 (arrayRangesEq!1595 a1!948 a2!948 (_1!13192 lt!436645) (_2!13192 lt!436645))))

(declare-fun b!301351 () Bool)

(declare-fun lt!436644 () (_ BitVec 32))

(declare-fun e!216407 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301351 (= e!216407 (not (byteRangesEq!0 (select (arr!9016 a1!948) (_4!537 lt!436647)) (select (arr!9016 a2!948) (_4!537 lt!436647)) #b00000000000000000000000000000000 lt!436644)))))

(declare-fun b!301352 () Bool)

(declare-fun e!216412 () Bool)

(declare-fun e!216409 () Bool)

(assert (=> b!301352 (= e!216412 e!216409)))

(declare-fun res!248148 () Bool)

(declare-fun call!5441 () Bool)

(assert (=> b!301352 (= res!248148 (not call!5441))))

(assert (=> b!301352 (=> res!248148 e!216409)))

(declare-fun b!301353 () Bool)

(assert (=> b!301353 (= e!216412 (not call!5441))))

(declare-fun b!301355 () Bool)

(declare-fun e!216408 () Bool)

(declare-fun e!216413 () Bool)

(assert (=> b!301355 (= e!216408 e!216413)))

(declare-fun res!248152 () Bool)

(assert (=> b!301355 (=> (not res!248152) (not e!216413))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436643 () (_ BitVec 64))

(assert (=> b!301355 (= res!248152 (and (bvsle toBit!258 lt!436643) (bvsle fromBit!258 lt!436643)))))

(assert (=> b!301355 (= lt!436643 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7933 a1!948))))))

(declare-fun b!301356 () Bool)

(declare-fun res!248150 () Bool)

(assert (=> b!301356 (= res!248150 (not (= lt!436644 #b00000000000000000000000000000000)))))

(assert (=> b!301356 (=> (not res!248150) (not e!216407))))

(assert (=> b!301356 (= e!216409 e!216407)))

(declare-fun b!301357 () Bool)

(declare-fun Unit!21108 () Unit!21106)

(assert (=> b!301357 (= e!216414 Unit!21108)))

(declare-fun bm!5438 () Bool)

(declare-fun lt!436646 () (_ BitVec 32))

(declare-fun c!14184 () Bool)

(assert (=> bm!5438 (= call!5441 (byteRangesEq!0 (select (arr!9016 a1!948) (_3!1494 lt!436647)) (select (arr!9016 a2!948) (_3!1494 lt!436647)) lt!436646 (ite c!14184 lt!436644 #b00000000000000000000000000000111)))))

(declare-fun res!248149 () Bool)

(assert (=> start!67102 (=> (not res!248149) (not e!216408))))

(assert (=> start!67102 (= res!248149 (and (bvsle (size!7933 a1!948) (size!7933 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67102 e!216408))

(assert (=> start!67102 true))

(declare-fun array_inv!7545 (array!18263) Bool)

(assert (=> start!67102 (array_inv!7545 a1!948)))

(assert (=> start!67102 (array_inv!7545 a2!948)))

(declare-fun b!301354 () Bool)

(declare-fun res!248153 () Bool)

(assert (=> b!301354 (=> (not res!248153) (not e!216413))))

(declare-fun arrayBitRangesEq!0 (array!18263 array!18263 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301354 (= res!248153 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301358 () Bool)

(declare-fun res!248151 () Bool)

(assert (=> b!301358 (=> (not res!248151) (not e!216413))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!301358 (= res!248151 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436643) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301359 () Bool)

(assert (=> b!301359 (= e!216413 e!216412)))

(assert (=> b!301359 (= c!14184 (= (_3!1494 lt!436647) (_4!537 lt!436647)))))

(declare-fun lt!436641 () Unit!21106)

(assert (=> b!301359 (= lt!436641 e!216414)))

(declare-fun c!14183 () Bool)

(assert (=> b!301359 (= c!14183 (bvslt (_1!13192 lt!436645) (_2!13192 lt!436645)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1074)

(assert (=> b!301359 (= lt!436645 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301359 (= lt!436644 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301359 (= lt!436646 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301359 (= lt!436647 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!67102 res!248149) b!301355))

(assert (= (and b!301355 res!248152) b!301354))

(assert (= (and b!301354 res!248153) b!301358))

(assert (= (and b!301358 res!248151) b!301359))

(assert (= (and b!301359 c!14183) b!301350))

(assert (= (and b!301359 (not c!14183)) b!301357))

(assert (= (and b!301359 c!14184) b!301353))

(assert (= (and b!301359 (not c!14184)) b!301352))

(assert (= (and b!301352 (not res!248148)) b!301356))

(assert (= (and b!301356 res!248150) b!301351))

(assert (= (or b!301353 b!301352) bm!5438))

(declare-fun m!440179 () Bool)

(assert (=> start!67102 m!440179))

(declare-fun m!440181 () Bool)

(assert (=> start!67102 m!440181))

(declare-fun m!440183 () Bool)

(assert (=> b!301354 m!440183))

(declare-fun m!440185 () Bool)

(assert (=> bm!5438 m!440185))

(declare-fun m!440187 () Bool)

(assert (=> bm!5438 m!440187))

(assert (=> bm!5438 m!440185))

(assert (=> bm!5438 m!440187))

(declare-fun m!440189 () Bool)

(assert (=> bm!5438 m!440189))

(declare-fun m!440191 () Bool)

(assert (=> b!301351 m!440191))

(declare-fun m!440193 () Bool)

(assert (=> b!301351 m!440193))

(assert (=> b!301351 m!440191))

(assert (=> b!301351 m!440193))

(declare-fun m!440195 () Bool)

(assert (=> b!301351 m!440195))

(declare-fun m!440197 () Bool)

(assert (=> b!301350 m!440197))

(declare-fun m!440199 () Bool)

(assert (=> b!301350 m!440199))

(declare-fun m!440201 () Bool)

(assert (=> b!301359 m!440201))

(declare-fun m!440203 () Bool)

(assert (=> b!301359 m!440203))

(push 1)

(assert (not b!301359))

(assert (not start!67102))

(assert (not bm!5438))

(assert (not b!301351))

(assert (not b!301350))

(assert (not b!301354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100764 () Bool)

(assert (=> d!100764 (= (byteRangesEq!0 (select (arr!9016 a1!948) (_3!1494 lt!436647)) (select (arr!9016 a2!948) (_3!1494 lt!436647)) lt!436646 (ite c!14184 lt!436644 #b00000000000000000000000000000111)) (or (= lt!436646 (ite c!14184 lt!436644 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9016 a1!948) (_3!1494 lt!436647))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14184 lt!436644 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436646)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9016 a2!948) (_3!1494 lt!436647))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14184 lt!436644 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436646)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25989 () Bool)

(assert (= bs!25989 d!100764))

(declare-fun m!440287 () Bool)

(assert (=> bs!25989 m!440287))

(declare-fun m!440289 () Bool)

(assert (=> bs!25989 m!440289))

(assert (=> bm!5438 d!100764))

(declare-fun b!301461 () Bool)

(declare-fun res!248222 () Bool)

(declare-fun lt!436710 () (_ BitVec 32))

(assert (=> b!301461 (= res!248222 (= lt!436710 #b00000000000000000000000000000000))))

(declare-fun e!216502 () Bool)

(assert (=> b!301461 (=> res!248222 e!216502)))

(declare-fun e!216504 () Bool)

(assert (=> b!301461 (= e!216504 e!216502)))

(declare-fun b!301462 () Bool)

(declare-fun e!216500 () Bool)

(declare-fun e!216499 () Bool)

(assert (=> b!301462 (= e!216500 e!216499)))

(declare-fun c!14202 () Bool)

(declare-fun lt!436708 () tuple4!1074)

(assert (=> b!301462 (= c!14202 (= (_3!1494 lt!436708) (_4!537 lt!436708)))))

(declare-fun b!301463 () Bool)

(declare-fun call!5453 () Bool)

(assert (=> b!301463 (= e!216499 call!5453)))

(declare-fun d!100766 () Bool)

(declare-fun res!248223 () Bool)

(declare-fun e!216503 () Bool)

(assert (=> d!100766 (=> res!248223 e!216503)))

(assert (=> d!100766 (= res!248223 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100766 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!216503)))

(declare-fun lt!436709 () (_ BitVec 32))

(declare-fun bm!5450 () Bool)

(assert (=> bm!5450 (= call!5453 (byteRangesEq!0 (ite c!14202 (select (arr!9016 a1!948) (_3!1494 lt!436708)) (select (arr!9016 a1!948) (_4!537 lt!436708))) (ite c!14202 (select (arr!9016 a2!948) (_3!1494 lt!436708)) (select (arr!9016 a2!948) (_4!537 lt!436708))) (ite c!14202 lt!436709 #b00000000000000000000000000000000) lt!436710))))

(declare-fun b!301464 () Bool)

(assert (=> b!301464 (= e!216499 e!216504)))

(declare-fun res!248225 () Bool)

(assert (=> b!301464 (= res!248225 (byteRangesEq!0 (select (arr!9016 a1!948) (_3!1494 lt!436708)) (select (arr!9016 a2!948) (_3!1494 lt!436708)) lt!436709 #b00000000000000000000000000001000))))

(assert (=> b!301464 (=> (not res!248225) (not e!216504))))

(declare-fun b!301465 () Bool)

(assert (=> b!301465 (= e!216503 e!216500)))

(declare-fun res!248224 () Bool)

(assert (=> b!301465 (=> (not res!248224) (not e!216500))))

(declare-fun e!216501 () Bool)

(assert (=> b!301465 (= res!248224 e!216501)))

(declare-fun res!248221 () Bool)

(assert (=> b!301465 (=> res!248221 e!216501)))

(assert (=> b!301465 (= res!248221 (bvsge (_1!13192 lt!436708) (_2!13192 lt!436708)))))

(assert (=> b!301465 (= lt!436710 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301465 (= lt!436709 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301465 (= lt!436708 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301466 () Bool)

(assert (=> b!301466 (= e!216501 (arrayRangesEq!1595 a1!948 a2!948 (_1!13192 lt!436708) (_2!13192 lt!436708)))))

(declare-fun b!301467 () Bool)

(assert (=> b!301467 (= e!216502 call!5453)))

(assert (= (and d!100766 (not res!248223)) b!301465))

(assert (= (and b!301465 (not res!248221)) b!301466))

(assert (= (and b!301465 res!248224) b!301462))

(assert (= (and b!301462 c!14202) b!301463))

(assert (= (and b!301462 (not c!14202)) b!301464))

(assert (= (and b!301464 res!248225) b!301461))

(assert (= (and b!301461 (not res!248222)) b!301467))

(assert (= (or b!301463 b!301467) bm!5450))

(declare-fun m!440291 () Bool)

(assert (=> bm!5450 m!440291))

(declare-fun m!440293 () Bool)

(assert (=> bm!5450 m!440293))

(declare-fun m!440295 () Bool)

(assert (=> bm!5450 m!440295))

(declare-fun m!440297 () Bool)

(assert (=> bm!5450 m!440297))

(declare-fun m!440299 () Bool)

(assert (=> bm!5450 m!440299))

(assert (=> b!301464 m!440291))

(assert (=> b!301464 m!440295))

(assert (=> b!301464 m!440291))

(assert (=> b!301464 m!440295))

(declare-fun m!440301 () Bool)

(assert (=> b!301464 m!440301))

(assert (=> b!301465 m!440203))

(declare-fun m!440303 () Bool)

(assert (=> b!301466 m!440303))

(assert (=> b!301354 d!100766))

(declare-fun d!100770 () Bool)

(assert (=> d!100770 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1075 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301359 d!100770))

(declare-fun d!100772 () Bool)

(assert (=> d!100772 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1075 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301359 d!100772))

(declare-fun d!100774 () Bool)

(assert (=> d!100774 (arrayRangesEq!1595 a1!948 a2!948 (_1!13192 lt!436645) (_2!13192 lt!436645))))

(declare-fun lt!436719 () Unit!21106)

(declare-fun choose!528 (array!18263 array!18263 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21106)

(assert (=> d!100774 (= lt!436719 (choose!528 a1!948 a2!948 (_1!13192 lt!436647) (_2!13192 lt!436647) (_1!13192 lt!436645) (_2!13192 lt!436645)))))

(assert (=> d!100774 (and (bvsle #b00000000000000000000000000000000 (_1!13192 lt!436647)) (bvsle (_1!13192 lt!436647) (_2!13192 lt!436647)))))

(assert (=> d!100774 (= (arrayRangesEqSlicedLemma!205 a1!948 a2!948 (_1!13192 lt!436647) (_2!13192 lt!436647) (_1!13192 lt!436645) (_2!13192 lt!436645)) lt!436719)))

(declare-fun bs!25990 () Bool)

(assert (= bs!25990 d!100774))

(assert (=> bs!25990 m!440199))

(declare-fun m!440305 () Bool)

(assert (=> bs!25990 m!440305))

(assert (=> b!301350 d!100774))

(declare-fun d!100776 () Bool)

(declare-fun res!248245 () Bool)

(declare-fun e!216527 () Bool)

(assert (=> d!100776 (=> res!248245 e!216527)))

(assert (=> d!100776 (= res!248245 (= (_1!13192 lt!436645) (_2!13192 lt!436645)))))

(assert (=> d!100776 (= (arrayRangesEq!1595 a1!948 a2!948 (_1!13192 lt!436645) (_2!13192 lt!436645)) e!216527)))

(declare-fun b!301493 () Bool)

(declare-fun e!216528 () Bool)

(assert (=> b!301493 (= e!216527 e!216528)))

(declare-fun res!248246 () Bool)

(assert (=> b!301493 (=> (not res!248246) (not e!216528))))

(assert (=> b!301493 (= res!248246 (= (select (arr!9016 a1!948) (_1!13192 lt!436645)) (select (arr!9016 a2!948) (_1!13192 lt!436645))))))

(declare-fun b!301494 () Bool)

(assert (=> b!301494 (= e!216528 (arrayRangesEq!1595 a1!948 a2!948 (bvadd (_1!13192 lt!436645) #b00000000000000000000000000000001) (_2!13192 lt!436645)))))

(assert (= (and d!100776 (not res!248245)) b!301493))

(assert (= (and b!301493 res!248246) b!301494))

(declare-fun m!440313 () Bool)

(assert (=> b!301493 m!440313))

(declare-fun m!440315 () Bool)

(assert (=> b!301493 m!440315))

(declare-fun m!440321 () Bool)

(assert (=> b!301494 m!440321))

(assert (=> b!301350 d!100776))

(declare-fun d!100778 () Bool)

(assert (=> d!100778 (= (byteRangesEq!0 (select (arr!9016 a1!948) (_4!537 lt!436647)) (select (arr!9016 a2!948) (_4!537 lt!436647)) #b00000000000000000000000000000000 lt!436644) (or (= #b00000000000000000000000000000000 lt!436644) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9016 a1!948) (_4!537 lt!436647))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436644))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9016 a2!948) (_4!537 lt!436647))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436644))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25991 () Bool)

(assert (= bs!25991 d!100778))

(declare-fun m!440327 () Bool)

(assert (=> bs!25991 m!440327))

(declare-fun m!440329 () Bool)

(assert (=> bs!25991 m!440329))

(assert (=> b!301351 d!100778))

(declare-fun d!100782 () Bool)

(assert (=> d!100782 (= (array_inv!7545 a1!948) (bvsge (size!7933 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67102 d!100782))

(declare-fun d!100784 () Bool)

(assert (=> d!100784 (= (array_inv!7545 a2!948) (bvsge (size!7933 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67102 d!100784))

(push 1)

(assert (not b!301464))

(assert (not b!301466))

(assert (not b!301494))

(assert (not bm!5450))

(assert (not d!100774))

(assert (not b!301465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

