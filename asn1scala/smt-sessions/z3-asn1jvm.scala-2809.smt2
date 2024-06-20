; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67706 () Bool)

(assert start!67706)

(declare-fun b!303885 () Bool)

(declare-fun res!250035 () Bool)

(declare-fun e!218707 () Bool)

(assert (=> b!303885 (=> (not res!250035) (not e!218707))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18466 0))(
  ( (array!18467 (arr!9095 (Array (_ BitVec 32) (_ BitVec 8))) (size!8012 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18466)

(declare-fun a2!948 () array!18466)

(declare-fun arrayBitRangesEq!0 (array!18466 array!18466 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303885 (= res!250035 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303886 () Bool)

(declare-fun res!250039 () Bool)

(assert (=> b!303886 (=> (not res!250039) (not e!218707))))

(declare-fun lt!438045 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303886 (= res!250039 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438045) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303887 () Bool)

(declare-fun res!250038 () Bool)

(declare-fun lt!438043 () (_ BitVec 32))

(assert (=> b!303887 (= res!250038 (= lt!438043 #b00000000000000000000000000000000))))

(declare-fun e!218699 () Bool)

(assert (=> b!303887 (=> res!250038 e!218699)))

(declare-fun e!218706 () Bool)

(assert (=> b!303887 (= e!218706 e!218699)))

(declare-fun b!303888 () Bool)

(declare-fun e!218700 () Bool)

(assert (=> b!303888 (= e!218707 e!218700)))

(declare-fun res!250040 () Bool)

(assert (=> b!303888 (=> (not res!250040) (not e!218700))))

(declare-fun e!218703 () Bool)

(assert (=> b!303888 (= res!250040 e!218703)))

(declare-fun c!14508 () Bool)

(declare-datatypes ((tuple4!1166 0))(
  ( (tuple4!1167 (_1!13238 (_ BitVec 32)) (_2!13238 (_ BitVec 32)) (_3!1540 (_ BitVec 32)) (_4!583 (_ BitVec 32))) )
))
(declare-fun lt!438040 () tuple4!1166)

(assert (=> b!303888 (= c!14508 (= (_3!1540 lt!438040) (_4!583 lt!438040)))))

(declare-datatypes ((Unit!21217 0))(
  ( (Unit!21218) )
))
(declare-fun lt!438041 () Unit!21217)

(declare-fun e!218705 () Unit!21217)

(assert (=> b!303888 (= lt!438041 e!218705)))

(declare-fun c!14507 () Bool)

(declare-fun lt!438044 () tuple4!1166)

(assert (=> b!303888 (= c!14507 (bvslt (_1!13238 lt!438044) (_2!13238 lt!438044)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1166)

(assert (=> b!303888 (= lt!438044 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303888 (= lt!438043 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438042 () (_ BitVec 32))

(assert (=> b!303888 (= lt!438042 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303888 (= lt!438040 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303889 () Bool)

(declare-fun e!218704 () Bool)

(assert (=> b!303889 (= e!218704 e!218707)))

(declare-fun res!250036 () Bool)

(assert (=> b!303889 (=> (not res!250036) (not e!218707))))

(assert (=> b!303889 (= res!250036 (and (bvsle toBit!258 lt!438045) (bvsle fromBit!258 lt!438045)))))

(assert (=> b!303889 (= lt!438045 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8012 a1!948))))))

(declare-fun b!303890 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303890 (= e!218699 (byteRangesEq!0 (select (arr!9095 a1!948) (_4!583 lt!438040)) (select (arr!9095 a2!948) (_4!583 lt!438040)) #b00000000000000000000000000000000 lt!438043))))

(declare-fun b!303891 () Bool)

(declare-fun call!5618 () Bool)

(assert (=> b!303891 (= e!218703 call!5618)))

(declare-fun b!303892 () Bool)

(assert (=> b!303892 (= e!218700 (and (bvslt (_3!1540 lt!438040) (_3!1540 lt!438044)) (bvslt (_3!1540 lt!438044) (_4!583 lt!438040)) (or (bvsgt #b00000000000000000000000000000000 (_1!13238 lt!438040)) (bvsgt (_1!13238 lt!438040) (_2!13238 lt!438040)))))))

(declare-fun b!303893 () Bool)

(declare-fun lt!438039 () Unit!21217)

(assert (=> b!303893 (= e!218705 lt!438039)))

(declare-fun arrayRangesEqSlicedLemma!236 (array!18466 array!18466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21217)

(assert (=> b!303893 (= lt!438039 (arrayRangesEqSlicedLemma!236 a1!948 a2!948 (_1!13238 lt!438040) (_2!13238 lt!438040) (_1!13238 lt!438044) (_2!13238 lt!438044)))))

(declare-fun arrayRangesEq!1641 (array!18466 array!18466 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303893 (arrayRangesEq!1641 a1!948 a2!948 (_1!13238 lt!438044) (_2!13238 lt!438044))))

(declare-fun bm!5615 () Bool)

(assert (=> bm!5615 (= call!5618 (byteRangesEq!0 (select (arr!9095 a1!948) (_3!1540 lt!438040)) (select (arr!9095 a2!948) (_3!1540 lt!438040)) lt!438042 (ite c!14508 lt!438043 #b00000000000000000000000000000111)))))

(declare-fun res!250037 () Bool)

(assert (=> start!67706 (=> (not res!250037) (not e!218704))))

(assert (=> start!67706 (= res!250037 (and (bvsle (size!8012 a1!948) (size!8012 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67706 e!218704))

(assert (=> start!67706 true))

(declare-fun array_inv!7624 (array!18466) Bool)

(assert (=> start!67706 (array_inv!7624 a1!948)))

(assert (=> start!67706 (array_inv!7624 a2!948)))

(declare-fun b!303894 () Bool)

(assert (=> b!303894 (= e!218703 e!218706)))

(declare-fun res!250041 () Bool)

(assert (=> b!303894 (= res!250041 call!5618)))

(assert (=> b!303894 (=> (not res!250041) (not e!218706))))

(declare-fun b!303895 () Bool)

(declare-fun Unit!21219 () Unit!21217)

(assert (=> b!303895 (= e!218705 Unit!21219)))

(assert (= (and start!67706 res!250037) b!303889))

(assert (= (and b!303889 res!250036) b!303885))

(assert (= (and b!303885 res!250035) b!303886))

(assert (= (and b!303886 res!250039) b!303888))

(assert (= (and b!303888 c!14507) b!303893))

(assert (= (and b!303888 (not c!14507)) b!303895))

(assert (= (and b!303888 c!14508) b!303891))

(assert (= (and b!303888 (not c!14508)) b!303894))

(assert (= (and b!303894 res!250041) b!303887))

(assert (= (and b!303887 (not res!250038)) b!303890))

(assert (= (or b!303891 b!303894) bm!5615))

(assert (= (and b!303888 res!250040) b!303892))

(declare-fun m!442427 () Bool)

(assert (=> b!303885 m!442427))

(declare-fun m!442429 () Bool)

(assert (=> b!303890 m!442429))

(declare-fun m!442431 () Bool)

(assert (=> b!303890 m!442431))

(assert (=> b!303890 m!442429))

(assert (=> b!303890 m!442431))

(declare-fun m!442433 () Bool)

(assert (=> b!303890 m!442433))

(declare-fun m!442435 () Bool)

(assert (=> bm!5615 m!442435))

(declare-fun m!442437 () Bool)

(assert (=> bm!5615 m!442437))

(assert (=> bm!5615 m!442435))

(assert (=> bm!5615 m!442437))

(declare-fun m!442439 () Bool)

(assert (=> bm!5615 m!442439))

(declare-fun m!442441 () Bool)

(assert (=> b!303888 m!442441))

(declare-fun m!442443 () Bool)

(assert (=> b!303888 m!442443))

(declare-fun m!442445 () Bool)

(assert (=> start!67706 m!442445))

(declare-fun m!442447 () Bool)

(assert (=> start!67706 m!442447))

(declare-fun m!442449 () Bool)

(assert (=> b!303893 m!442449))

(declare-fun m!442451 () Bool)

(assert (=> b!303893 m!442451))

(check-sat (not b!303888) (not b!303890) (not bm!5615) (not b!303893) (not start!67706) (not b!303885))
(check-sat)
(get-model)

(declare-fun d!101498 () Bool)

(assert (=> d!101498 (arrayRangesEq!1641 a1!948 a2!948 (_1!13238 lt!438044) (_2!13238 lt!438044))))

(declare-fun lt!438069 () Unit!21217)

(declare-fun choose!566 (array!18466 array!18466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21217)

(assert (=> d!101498 (= lt!438069 (choose!566 a1!948 a2!948 (_1!13238 lt!438040) (_2!13238 lt!438040) (_1!13238 lt!438044) (_2!13238 lt!438044)))))

(assert (=> d!101498 (and (bvsle #b00000000000000000000000000000000 (_1!13238 lt!438040)) (bvsle (_1!13238 lt!438040) (_2!13238 lt!438040)))))

(assert (=> d!101498 (= (arrayRangesEqSlicedLemma!236 a1!948 a2!948 (_1!13238 lt!438040) (_2!13238 lt!438040) (_1!13238 lt!438044) (_2!13238 lt!438044)) lt!438069)))

(declare-fun bs!26163 () Bool)

(assert (= bs!26163 d!101498))

(assert (=> bs!26163 m!442451))

(declare-fun m!442479 () Bool)

(assert (=> bs!26163 m!442479))

(assert (=> b!303893 d!101498))

(declare-fun d!101500 () Bool)

(declare-fun res!250067 () Bool)

(declare-fun e!218739 () Bool)

(assert (=> d!101500 (=> res!250067 e!218739)))

(assert (=> d!101500 (= res!250067 (= (_1!13238 lt!438044) (_2!13238 lt!438044)))))

(assert (=> d!101500 (= (arrayRangesEq!1641 a1!948 a2!948 (_1!13238 lt!438044) (_2!13238 lt!438044)) e!218739)))

(declare-fun b!303933 () Bool)

(declare-fun e!218740 () Bool)

(assert (=> b!303933 (= e!218739 e!218740)))

(declare-fun res!250068 () Bool)

(assert (=> b!303933 (=> (not res!250068) (not e!218740))))

(assert (=> b!303933 (= res!250068 (= (select (arr!9095 a1!948) (_1!13238 lt!438044)) (select (arr!9095 a2!948) (_1!13238 lt!438044))))))

(declare-fun b!303934 () Bool)

(assert (=> b!303934 (= e!218740 (arrayRangesEq!1641 a1!948 a2!948 (bvadd (_1!13238 lt!438044) #b00000000000000000000000000000001) (_2!13238 lt!438044)))))

(assert (= (and d!101500 (not res!250067)) b!303933))

(assert (= (and b!303933 res!250068) b!303934))

(declare-fun m!442481 () Bool)

(assert (=> b!303933 m!442481))

(declare-fun m!442483 () Bool)

(assert (=> b!303933 m!442483))

(declare-fun m!442485 () Bool)

(assert (=> b!303934 m!442485))

(assert (=> b!303893 d!101500))

(declare-fun d!101502 () Bool)

(assert (=> d!101502 (= (array_inv!7624 a1!948) (bvsge (size!8012 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67706 d!101502))

(declare-fun d!101504 () Bool)

(assert (=> d!101504 (= (array_inv!7624 a2!948) (bvsge (size!8012 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67706 d!101504))

(declare-fun d!101506 () Bool)

(assert (=> d!101506 (= (byteRangesEq!0 (select (arr!9095 a1!948) (_3!1540 lt!438040)) (select (arr!9095 a2!948) (_3!1540 lt!438040)) lt!438042 (ite c!14508 lt!438043 #b00000000000000000000000000000111)) (or (= lt!438042 (ite c!14508 lt!438043 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9095 a1!948) (_3!1540 lt!438040))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14508 lt!438043 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438042)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9095 a2!948) (_3!1540 lt!438040))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14508 lt!438043 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438042)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26164 () Bool)

(assert (= bs!26164 d!101506))

(declare-fun m!442487 () Bool)

(assert (=> bs!26164 m!442487))

(declare-fun m!442489 () Bool)

(assert (=> bs!26164 m!442489))

(assert (=> bm!5615 d!101506))

(declare-fun bm!5621 () Bool)

(declare-fun lt!438077 () (_ BitVec 32))

(declare-fun lt!438076 () tuple4!1166)

(declare-fun c!14517 () Bool)

(declare-fun call!5624 () Bool)

(declare-fun lt!438078 () (_ BitVec 32))

(assert (=> bm!5621 (= call!5624 (byteRangesEq!0 (select (arr!9095 a1!948) (_3!1540 lt!438076)) (select (arr!9095 a2!948) (_3!1540 lt!438076)) lt!438077 (ite c!14517 lt!438078 #b00000000000000000000000000001000)))))

(declare-fun e!218758 () Bool)

(declare-fun b!303949 () Bool)

(assert (=> b!303949 (= e!218758 (byteRangesEq!0 (select (arr!9095 a1!948) (_4!583 lt!438076)) (select (arr!9095 a2!948) (_4!583 lt!438076)) #b00000000000000000000000000000000 lt!438078))))

(declare-fun d!101508 () Bool)

(declare-fun res!250083 () Bool)

(declare-fun e!218756 () Bool)

(assert (=> d!101508 (=> res!250083 e!218756)))

(assert (=> d!101508 (= res!250083 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101508 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218756)))

(declare-fun b!303950 () Bool)

(declare-fun e!218755 () Bool)

(declare-fun e!218753 () Bool)

(assert (=> b!303950 (= e!218755 e!218753)))

(declare-fun res!250079 () Bool)

(assert (=> b!303950 (= res!250079 call!5624)))

(assert (=> b!303950 (=> (not res!250079) (not e!218753))))

(declare-fun b!303951 () Bool)

(declare-fun e!218754 () Bool)

(assert (=> b!303951 (= e!218754 e!218755)))

(assert (=> b!303951 (= c!14517 (= (_3!1540 lt!438076) (_4!583 lt!438076)))))

(declare-fun e!218757 () Bool)

(declare-fun b!303952 () Bool)

(assert (=> b!303952 (= e!218757 (arrayRangesEq!1641 a1!948 a2!948 (_1!13238 lt!438076) (_2!13238 lt!438076)))))

(declare-fun b!303953 () Bool)

(assert (=> b!303953 (= e!218756 e!218754)))

(declare-fun res!250081 () Bool)

(assert (=> b!303953 (=> (not res!250081) (not e!218754))))

(assert (=> b!303953 (= res!250081 e!218757)))

(declare-fun res!250080 () Bool)

(assert (=> b!303953 (=> res!250080 e!218757)))

(assert (=> b!303953 (= res!250080 (bvsge (_1!13238 lt!438076) (_2!13238 lt!438076)))))

(assert (=> b!303953 (= lt!438078 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303953 (= lt!438077 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303953 (= lt!438076 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303954 () Bool)

(declare-fun res!250082 () Bool)

(assert (=> b!303954 (= res!250082 (= lt!438078 #b00000000000000000000000000000000))))

(assert (=> b!303954 (=> res!250082 e!218758)))

(assert (=> b!303954 (= e!218753 e!218758)))

(declare-fun b!303955 () Bool)

(assert (=> b!303955 (= e!218755 call!5624)))

(assert (= (and d!101508 (not res!250083)) b!303953))

(assert (= (and b!303953 (not res!250080)) b!303952))

(assert (= (and b!303953 res!250081) b!303951))

(assert (= (and b!303951 c!14517) b!303955))

(assert (= (and b!303951 (not c!14517)) b!303950))

(assert (= (and b!303950 res!250079) b!303954))

(assert (= (and b!303954 (not res!250082)) b!303949))

(assert (= (or b!303955 b!303950) bm!5621))

(declare-fun m!442491 () Bool)

(assert (=> bm!5621 m!442491))

(declare-fun m!442493 () Bool)

(assert (=> bm!5621 m!442493))

(assert (=> bm!5621 m!442491))

(assert (=> bm!5621 m!442493))

(declare-fun m!442495 () Bool)

(assert (=> bm!5621 m!442495))

(declare-fun m!442497 () Bool)

(assert (=> b!303949 m!442497))

(declare-fun m!442499 () Bool)

(assert (=> b!303949 m!442499))

(assert (=> b!303949 m!442497))

(assert (=> b!303949 m!442499))

(declare-fun m!442501 () Bool)

(assert (=> b!303949 m!442501))

(declare-fun m!442503 () Bool)

(assert (=> b!303952 m!442503))

(assert (=> b!303953 m!442443))

(assert (=> b!303885 d!101508))

(declare-fun d!101510 () Bool)

(assert (=> d!101510 (= (byteRangesEq!0 (select (arr!9095 a1!948) (_4!583 lt!438040)) (select (arr!9095 a2!948) (_4!583 lt!438040)) #b00000000000000000000000000000000 lt!438043) (or (= #b00000000000000000000000000000000 lt!438043) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9095 a1!948) (_4!583 lt!438040))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438043))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9095 a2!948) (_4!583 lt!438040))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438043))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26165 () Bool)

(assert (= bs!26165 d!101510))

(declare-fun m!442505 () Bool)

(assert (=> bs!26165 m!442505))

(declare-fun m!442507 () Bool)

(assert (=> bs!26165 m!442507))

(assert (=> b!303890 d!101510))

(declare-fun d!101512 () Bool)

(assert (=> d!101512 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1167 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303888 d!101512))

(declare-fun d!101514 () Bool)

(assert (=> d!101514 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1167 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303888 d!101514))

(check-sat (not b!303953) (not bm!5621) (not b!303934) (not b!303949) (not d!101498) (not b!303952))
(check-sat)
