; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67934 () Bool)

(assert start!67934)

(declare-fun b!304999 () Bool)

(declare-datatypes ((Unit!21287 0))(
  ( (Unit!21288) )
))
(declare-fun e!219621 () Unit!21287)

(declare-fun Unit!21289 () Unit!21287)

(assert (=> b!304999 (= e!219621 Unit!21289)))

(declare-fun b!305000 () Bool)

(declare-fun e!219620 () Unit!21287)

(declare-fun Unit!21290 () Unit!21287)

(assert (=> b!305000 (= e!219620 Unit!21290)))

(declare-fun b!305001 () Bool)

(declare-fun lt!438700 () Unit!21287)

(assert (=> b!305001 (= e!219621 lt!438700)))

(declare-datatypes ((array!18523 0))(
  ( (array!18524 (arr!9116 (Array (_ BitVec 32) (_ BitVec 8))) (size!8033 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18523)

(declare-fun a2!948 () array!18523)

(declare-datatypes ((tuple4!1208 0))(
  ( (tuple4!1209 (_1!13259 (_ BitVec 32)) (_2!13259 (_ BitVec 32)) (_3!1561 (_ BitVec 32)) (_4!604 (_ BitVec 32))) )
))
(declare-fun lt!438698 () tuple4!1208)

(declare-fun lt!438701 () tuple4!1208)

(declare-fun arrayRangesEqImpliesEq!266 (array!18523 array!18523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21287)

(assert (=> b!305001 (= lt!438700 (arrayRangesEqImpliesEq!266 a1!948 a2!948 (_1!13259 lt!438698) (_3!1561 lt!438701) (_2!13259 lt!438698)))))

(assert (=> b!305001 (= (select (arr!9116 a1!948) (_3!1561 lt!438701)) (select (arr!9116 a2!948) (_3!1561 lt!438701)))))

(declare-fun b!305002 () Bool)

(declare-fun res!250782 () Bool)

(declare-fun e!219626 () Bool)

(assert (=> b!305002 (=> (not res!250782) (not e!219626))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18523 array!18523 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305002 (= res!250782 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!305003 () Bool)

(declare-fun e!219619 () Bool)

(declare-fun call!5717 () Bool)

(assert (=> b!305003 (= e!219619 call!5717)))

(declare-fun b!305004 () Bool)

(declare-fun res!250781 () Bool)

(declare-fun lt!438697 () (_ BitVec 32))

(assert (=> b!305004 (= res!250781 (= lt!438697 #b00000000000000000000000000000000))))

(declare-fun e!219625 () Bool)

(assert (=> b!305004 (=> res!250781 e!219625)))

(declare-fun e!219624 () Bool)

(assert (=> b!305004 (= e!219624 e!219625)))

(declare-fun b!305005 () Bool)

(assert (=> b!305005 (= e!219625 call!5717)))

(declare-fun b!305006 () Bool)

(declare-fun e!219627 () Bool)

(assert (=> b!305006 (= e!219626 e!219627)))

(declare-fun res!250783 () Bool)

(assert (=> b!305006 (=> (not res!250783) (not e!219627))))

(assert (=> b!305006 (= res!250783 e!219619)))

(declare-fun c!14694 () Bool)

(assert (=> b!305006 (= c!14694 (= (_3!1561 lt!438698) (_4!604 lt!438698)))))

(declare-fun lt!438699 () Unit!21287)

(assert (=> b!305006 (= lt!438699 e!219620)))

(declare-fun c!14692 () Bool)

(assert (=> b!305006 (= c!14692 (bvslt (_1!13259 lt!438701) (_2!13259 lt!438701)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1208)

(assert (=> b!305006 (= lt!438701 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!305006 (= lt!438697 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438702 () (_ BitVec 32))

(assert (=> b!305006 (= lt!438702 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305006 (= lt!438698 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305007 () Bool)

(declare-fun res!250784 () Bool)

(assert (=> b!305007 (=> (not res!250784) (not e!219626))))

(declare-fun lt!438704 () (_ BitVec 64))

(assert (=> b!305007 (= res!250784 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438704) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!305008 () Bool)

(declare-fun lt!438703 () Unit!21287)

(assert (=> b!305008 (= e!219620 lt!438703)))

(declare-fun arrayRangesEqSlicedLemma!257 (array!18523 array!18523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21287)

(assert (=> b!305008 (= lt!438703 (arrayRangesEqSlicedLemma!257 a1!948 a2!948 (_1!13259 lt!438698) (_2!13259 lt!438698) (_1!13259 lt!438701) (_2!13259 lt!438701)))))

(declare-fun arrayRangesEq!1662 (array!18523 array!18523 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305008 (arrayRangesEq!1662 a1!948 a2!948 (_1!13259 lt!438701) (_2!13259 lt!438701))))

(declare-fun b!305009 () Bool)

(assert (=> b!305009 (= e!219619 e!219624)))

(declare-fun res!250780 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305009 (= res!250780 (byteRangesEq!0 (select (arr!9116 a1!948) (_3!1561 lt!438698)) (select (arr!9116 a2!948) (_3!1561 lt!438698)) lt!438702 #b00000000000000000000000000000111))))

(assert (=> b!305009 (=> (not res!250780) (not e!219624))))

(declare-fun bm!5714 () Bool)

(assert (=> bm!5714 (= call!5717 (byteRangesEq!0 (ite c!14694 (select (arr!9116 a1!948) (_3!1561 lt!438698)) (select (arr!9116 a1!948) (_4!604 lt!438698))) (ite c!14694 (select (arr!9116 a2!948) (_3!1561 lt!438698)) (select (arr!9116 a2!948) (_4!604 lt!438698))) (ite c!14694 lt!438702 #b00000000000000000000000000000000) lt!438697))))

(declare-fun res!250779 () Bool)

(declare-fun e!219622 () Bool)

(assert (=> start!67934 (=> (not res!250779) (not e!219622))))

(assert (=> start!67934 (= res!250779 (and (bvsle (size!8033 a1!948) (size!8033 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67934 e!219622))

(assert (=> start!67934 true))

(declare-fun array_inv!7645 (array!18523) Bool)

(assert (=> start!67934 (array_inv!7645 a1!948)))

(assert (=> start!67934 (array_inv!7645 a2!948)))

(declare-fun b!305010 () Bool)

(assert (=> b!305010 (= e!219622 e!219626)))

(declare-fun res!250785 () Bool)

(assert (=> b!305010 (=> (not res!250785) (not e!219626))))

(assert (=> b!305010 (= res!250785 (and (bvsle toBit!258 lt!438704) (bvsle fromBit!258 lt!438704)))))

(assert (=> b!305010 (= lt!438704 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8033 a1!948))))))

(declare-fun b!305011 () Bool)

(assert (=> b!305011 (= e!219627 (and (bvslt (_4!604 lt!438701) (_4!604 lt!438698)) (bvslt (_3!1561 lt!438698) (_4!604 lt!438701)) (bvsle #b00000000000000000000000000000000 (_1!13259 lt!438698)) (bvsle (_1!13259 lt!438698) (_2!13259 lt!438698)) (bvsgt (_2!13259 lt!438698) (size!8033 a1!948))))))

(declare-fun lt!438705 () Unit!21287)

(assert (=> b!305011 (= lt!438705 e!219621)))

(declare-fun c!14693 () Bool)

(assert (=> b!305011 (= c!14693 (and (bvslt (_3!1561 lt!438698) (_3!1561 lt!438701)) (bvslt (_3!1561 lt!438701) (_4!604 lt!438698))))))

(assert (= (and start!67934 res!250779) b!305010))

(assert (= (and b!305010 res!250785) b!305002))

(assert (= (and b!305002 res!250782) b!305007))

(assert (= (and b!305007 res!250784) b!305006))

(assert (= (and b!305006 c!14692) b!305008))

(assert (= (and b!305006 (not c!14692)) b!305000))

(assert (= (and b!305006 c!14694) b!305003))

(assert (= (and b!305006 (not c!14694)) b!305009))

(assert (= (and b!305009 res!250780) b!305004))

(assert (= (and b!305004 (not res!250781)) b!305005))

(assert (= (or b!305003 b!305005) bm!5714))

(assert (= (and b!305006 res!250783) b!305011))

(assert (= (and b!305011 c!14693) b!305001))

(assert (= (and b!305011 (not c!14693)) b!304999))

(declare-fun m!443459 () Bool)

(assert (=> b!305009 m!443459))

(declare-fun m!443461 () Bool)

(assert (=> b!305009 m!443461))

(assert (=> b!305009 m!443459))

(assert (=> b!305009 m!443461))

(declare-fun m!443463 () Bool)

(assert (=> b!305009 m!443463))

(declare-fun m!443465 () Bool)

(assert (=> b!305008 m!443465))

(declare-fun m!443467 () Bool)

(assert (=> b!305008 m!443467))

(assert (=> bm!5714 m!443461))

(assert (=> bm!5714 m!443459))

(declare-fun m!443469 () Bool)

(assert (=> bm!5714 m!443469))

(declare-fun m!443471 () Bool)

(assert (=> bm!5714 m!443471))

(declare-fun m!443473 () Bool)

(assert (=> bm!5714 m!443473))

(declare-fun m!443475 () Bool)

(assert (=> start!67934 m!443475))

(declare-fun m!443477 () Bool)

(assert (=> start!67934 m!443477))

(declare-fun m!443479 () Bool)

(assert (=> b!305006 m!443479))

(declare-fun m!443481 () Bool)

(assert (=> b!305006 m!443481))

(declare-fun m!443483 () Bool)

(assert (=> b!305002 m!443483))

(declare-fun m!443485 () Bool)

(assert (=> b!305001 m!443485))

(declare-fun m!443487 () Bool)

(assert (=> b!305001 m!443487))

(declare-fun m!443489 () Bool)

(assert (=> b!305001 m!443489))

(check-sat (not bm!5714) (not b!305001) (not b!305002) (not start!67934) (not b!305008) (not b!305006) (not b!305009))
(check-sat)
(get-model)

(declare-fun d!101794 () Bool)

(assert (=> d!101794 (= (byteRangesEq!0 (select (arr!9116 a1!948) (_3!1561 lt!438698)) (select (arr!9116 a2!948) (_3!1561 lt!438698)) lt!438702 #b00000000000000000000000000000111) (or (= lt!438702 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9116 a1!948) (_3!1561 lt!438698))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438702)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9116 a2!948) (_3!1561 lt!438698))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438702)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26232 () Bool)

(assert (= bs!26232 d!101794))

(declare-fun m!443523 () Bool)

(assert (=> bs!26232 m!443523))

(declare-fun m!443525 () Bool)

(assert (=> bs!26232 m!443525))

(assert (=> b!305009 d!101794))

(declare-fun d!101796 () Bool)

(assert (=> d!101796 (= (byteRangesEq!0 (ite c!14694 (select (arr!9116 a1!948) (_3!1561 lt!438698)) (select (arr!9116 a1!948) (_4!604 lt!438698))) (ite c!14694 (select (arr!9116 a2!948) (_3!1561 lt!438698)) (select (arr!9116 a2!948) (_4!604 lt!438698))) (ite c!14694 lt!438702 #b00000000000000000000000000000000) lt!438697) (or (= (ite c!14694 lt!438702 #b00000000000000000000000000000000) lt!438697) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14694 (select (arr!9116 a1!948) (_3!1561 lt!438698)) (select (arr!9116 a1!948) (_4!604 lt!438698)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438697))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14694 lt!438702 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14694 (select (arr!9116 a2!948) (_3!1561 lt!438698)) (select (arr!9116 a2!948) (_4!604 lt!438698)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438697))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14694 lt!438702 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26233 () Bool)

(assert (= bs!26233 d!101796))

(declare-fun m!443527 () Bool)

(assert (=> bs!26233 m!443527))

(declare-fun m!443529 () Bool)

(assert (=> bs!26233 m!443529))

(assert (=> bm!5714 d!101796))

(declare-fun d!101798 () Bool)

(assert (=> d!101798 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1209 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305006 d!101798))

(declare-fun d!101800 () Bool)

(assert (=> d!101800 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1209 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305006 d!101800))

(declare-fun d!101802 () Bool)

(assert (=> d!101802 (and (bvsge (_3!1561 lt!438701) #b00000000000000000000000000000000) (bvslt (_3!1561 lt!438701) (size!8033 a1!948)) (bvslt (_3!1561 lt!438701) (size!8033 a2!948)) (= (select (arr!9116 a1!948) (_3!1561 lt!438701)) (select (arr!9116 a2!948) (_3!1561 lt!438701))))))

(declare-fun lt!438735 () Unit!21287)

(declare-fun choose!584 (array!18523 array!18523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21287)

(assert (=> d!101802 (= lt!438735 (choose!584 a1!948 a2!948 (_1!13259 lt!438698) (_3!1561 lt!438701) (_2!13259 lt!438698)))))

(assert (=> d!101802 (and (bvsle #b00000000000000000000000000000000 (_1!13259 lt!438698)) (bvsle (_1!13259 lt!438698) (_2!13259 lt!438698)))))

(assert (=> d!101802 (= (arrayRangesEqImpliesEq!266 a1!948 a2!948 (_1!13259 lt!438698) (_3!1561 lt!438701) (_2!13259 lt!438698)) lt!438735)))

(declare-fun bs!26234 () Bool)

(assert (= bs!26234 d!101802))

(assert (=> bs!26234 m!443487))

(assert (=> bs!26234 m!443489))

(declare-fun m!443531 () Bool)

(assert (=> bs!26234 m!443531))

(assert (=> b!305001 d!101802))

(declare-fun d!101804 () Bool)

(assert (=> d!101804 (arrayRangesEq!1662 a1!948 a2!948 (_1!13259 lt!438701) (_2!13259 lt!438701))))

(declare-fun lt!438738 () Unit!21287)

(declare-fun choose!585 (array!18523 array!18523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21287)

(assert (=> d!101804 (= lt!438738 (choose!585 a1!948 a2!948 (_1!13259 lt!438698) (_2!13259 lt!438698) (_1!13259 lt!438701) (_2!13259 lt!438701)))))

(assert (=> d!101804 (and (bvsle #b00000000000000000000000000000000 (_1!13259 lt!438698)) (bvsle (_1!13259 lt!438698) (_2!13259 lt!438698)))))

(assert (=> d!101804 (= (arrayRangesEqSlicedLemma!257 a1!948 a2!948 (_1!13259 lt!438698) (_2!13259 lt!438698) (_1!13259 lt!438701) (_2!13259 lt!438701)) lt!438738)))

(declare-fun bs!26235 () Bool)

(assert (= bs!26235 d!101804))

(assert (=> bs!26235 m!443467))

(declare-fun m!443533 () Bool)

(assert (=> bs!26235 m!443533))

(assert (=> b!305008 d!101804))

(declare-fun d!101806 () Bool)

(declare-fun res!250811 () Bool)

(declare-fun e!219663 () Bool)

(assert (=> d!101806 (=> res!250811 e!219663)))

(assert (=> d!101806 (= res!250811 (= (_1!13259 lt!438701) (_2!13259 lt!438701)))))

(assert (=> d!101806 (= (arrayRangesEq!1662 a1!948 a2!948 (_1!13259 lt!438701) (_2!13259 lt!438701)) e!219663)))

(declare-fun b!305055 () Bool)

(declare-fun e!219664 () Bool)

(assert (=> b!305055 (= e!219663 e!219664)))

(declare-fun res!250812 () Bool)

(assert (=> b!305055 (=> (not res!250812) (not e!219664))))

(assert (=> b!305055 (= res!250812 (= (select (arr!9116 a1!948) (_1!13259 lt!438701)) (select (arr!9116 a2!948) (_1!13259 lt!438701))))))

(declare-fun b!305056 () Bool)

(assert (=> b!305056 (= e!219664 (arrayRangesEq!1662 a1!948 a2!948 (bvadd (_1!13259 lt!438701) #b00000000000000000000000000000001) (_2!13259 lt!438701)))))

(assert (= (and d!101806 (not res!250811)) b!305055))

(assert (= (and b!305055 res!250812) b!305056))

(declare-fun m!443535 () Bool)

(assert (=> b!305055 m!443535))

(declare-fun m!443537 () Bool)

(assert (=> b!305055 m!443537))

(declare-fun m!443539 () Bool)

(assert (=> b!305056 m!443539))

(assert (=> b!305008 d!101806))

(declare-fun d!101808 () Bool)

(assert (=> d!101808 (= (array_inv!7645 a1!948) (bvsge (size!8033 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67934 d!101808))

(declare-fun d!101810 () Bool)

(assert (=> d!101810 (= (array_inv!7645 a2!948) (bvsge (size!8033 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67934 d!101810))

(declare-fun d!101812 () Bool)

(declare-fun res!250824 () Bool)

(declare-fun e!219681 () Bool)

(assert (=> d!101812 (=> res!250824 e!219681)))

(assert (=> d!101812 (= res!250824 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101812 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219681)))

(declare-fun b!305071 () Bool)

(declare-fun e!219682 () Bool)

(declare-fun call!5723 () Bool)

(assert (=> b!305071 (= e!219682 call!5723)))

(declare-fun b!305072 () Bool)

(declare-fun res!250823 () Bool)

(declare-fun lt!438745 () (_ BitVec 32))

(assert (=> b!305072 (= res!250823 (= lt!438745 #b00000000000000000000000000000000))))

(declare-fun e!219680 () Bool)

(assert (=> b!305072 (=> res!250823 e!219680)))

(declare-fun e!219678 () Bool)

(assert (=> b!305072 (= e!219678 e!219680)))

(declare-fun b!305073 () Bool)

(declare-fun e!219677 () Bool)

(assert (=> b!305073 (= e!219677 e!219682)))

(declare-fun c!14706 () Bool)

(declare-fun lt!438747 () tuple4!1208)

(assert (=> b!305073 (= c!14706 (= (_3!1561 lt!438747) (_4!604 lt!438747)))))

(declare-fun b!305074 () Bool)

(assert (=> b!305074 (= e!219681 e!219677)))

(declare-fun res!250825 () Bool)

(assert (=> b!305074 (=> (not res!250825) (not e!219677))))

(declare-fun e!219679 () Bool)

(assert (=> b!305074 (= res!250825 e!219679)))

(declare-fun res!250827 () Bool)

(assert (=> b!305074 (=> res!250827 e!219679)))

(assert (=> b!305074 (= res!250827 (bvsge (_1!13259 lt!438747) (_2!13259 lt!438747)))))

(assert (=> b!305074 (= lt!438745 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438746 () (_ BitVec 32))

(assert (=> b!305074 (= lt!438746 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305074 (= lt!438747 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305075 () Bool)

(assert (=> b!305075 (= e!219682 e!219678)))

(declare-fun res!250826 () Bool)

(assert (=> b!305075 (= res!250826 (byteRangesEq!0 (select (arr!9116 a1!948) (_3!1561 lt!438747)) (select (arr!9116 a2!948) (_3!1561 lt!438747)) lt!438746 #b00000000000000000000000000001000))))

(assert (=> b!305075 (=> (not res!250826) (not e!219678))))

(declare-fun b!305076 () Bool)

(assert (=> b!305076 (= e!219679 (arrayRangesEq!1662 a1!948 a2!948 (_1!13259 lt!438747) (_2!13259 lt!438747)))))

(declare-fun b!305077 () Bool)

(assert (=> b!305077 (= e!219680 call!5723)))

(declare-fun bm!5720 () Bool)

(assert (=> bm!5720 (= call!5723 (byteRangesEq!0 (ite c!14706 (select (arr!9116 a1!948) (_3!1561 lt!438747)) (select (arr!9116 a1!948) (_4!604 lt!438747))) (ite c!14706 (select (arr!9116 a2!948) (_3!1561 lt!438747)) (select (arr!9116 a2!948) (_4!604 lt!438747))) (ite c!14706 lt!438746 #b00000000000000000000000000000000) lt!438745))))

(assert (= (and d!101812 (not res!250824)) b!305074))

(assert (= (and b!305074 (not res!250827)) b!305076))

(assert (= (and b!305074 res!250825) b!305073))

(assert (= (and b!305073 c!14706) b!305071))

(assert (= (and b!305073 (not c!14706)) b!305075))

(assert (= (and b!305075 res!250826) b!305072))

(assert (= (and b!305072 (not res!250823)) b!305077))

(assert (= (or b!305071 b!305077) bm!5720))

(assert (=> b!305074 m!443481))

(declare-fun m!443541 () Bool)

(assert (=> b!305075 m!443541))

(declare-fun m!443543 () Bool)

(assert (=> b!305075 m!443543))

(assert (=> b!305075 m!443541))

(assert (=> b!305075 m!443543))

(declare-fun m!443545 () Bool)

(assert (=> b!305075 m!443545))

(declare-fun m!443547 () Bool)

(assert (=> b!305076 m!443547))

(assert (=> bm!5720 m!443541))

(declare-fun m!443549 () Bool)

(assert (=> bm!5720 m!443549))

(declare-fun m!443551 () Bool)

(assert (=> bm!5720 m!443551))

(declare-fun m!443553 () Bool)

(assert (=> bm!5720 m!443553))

(assert (=> bm!5720 m!443543))

(assert (=> b!305002 d!101812))

(check-sat (not d!101802) (not d!101804) (not b!305056) (not bm!5720) (not b!305075) (not b!305076) (not b!305074))
(check-sat)
