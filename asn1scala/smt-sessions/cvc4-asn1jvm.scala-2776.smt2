; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67022 () Bool)

(assert start!67022)

(declare-fun b!300352 () Bool)

(declare-datatypes ((Unit!21011 0))(
  ( (Unit!21012) )
))
(declare-fun e!215681 () Unit!21011)

(declare-fun Unit!21013 () Unit!21011)

(assert (=> b!300352 (= e!215681 Unit!21013)))

(declare-datatypes ((tuple4!1036 0))(
  ( (tuple4!1037 (_1!13173 (_ BitVec 32)) (_2!13173 (_ BitVec 32)) (_3!1475 (_ BitVec 32)) (_4!518 (_ BitVec 32))) )
))
(declare-fun lt!435950 () tuple4!1036)

(declare-fun e!215685 () Bool)

(declare-fun lt!435947 () (_ BitVec 32))

(declare-fun lt!435948 () (_ BitVec 32))

(declare-fun b!300354 () Bool)

(assert (=> b!300354 (= e!215685 (and (= (_3!1475 lt!435950) (_4!518 lt!435950)) (or (bvsgt #b00000000000000000000000000000000 lt!435947) (bvsgt lt!435947 lt!435948) (bvsgt lt!435948 #b00000000000000000000000000001000))))))

(declare-fun lt!435946 () Unit!21011)

(assert (=> b!300354 (= lt!435946 e!215681)))

(declare-fun c!13953 () Bool)

(declare-fun lt!435945 () tuple4!1036)

(assert (=> b!300354 (= c!13953 (and (bvslt (_4!518 lt!435950) (_4!518 lt!435945)) (bvslt (_3!1475 lt!435945) (_4!518 lt!435950))))))

(declare-fun lt!435957 () Unit!21011)

(declare-fun e!215688 () Unit!21011)

(assert (=> b!300354 (= lt!435957 e!215688)))

(declare-fun c!13950 () Bool)

(assert (=> b!300354 (= c!13950 (and (bvslt (_3!1475 lt!435945) (_3!1475 lt!435950)) (bvslt (_3!1475 lt!435950) (_4!518 lt!435945))))))

(declare-fun b!300355 () Bool)

(declare-fun e!215684 () Bool)

(declare-fun call!5375 () Bool)

(assert (=> b!300355 (= e!215684 call!5375)))

(declare-fun b!300356 () Bool)

(declare-fun Unit!21014 () Unit!21011)

(assert (=> b!300356 (= e!215688 Unit!21014)))

(declare-fun b!300357 () Bool)

(declare-fun e!215680 () Bool)

(declare-fun e!215687 () Bool)

(assert (=> b!300357 (= e!215680 e!215687)))

(declare-fun res!247621 () Bool)

(assert (=> b!300357 (=> (not res!247621) (not e!215687))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435954 () (_ BitVec 64))

(assert (=> b!300357 (= res!247621 (and (bvsle toBit!258 lt!435954) (bvsle fromBit!258 lt!435954)))))

(declare-datatypes ((array!18222 0))(
  ( (array!18223 (arr!8997 (Array (_ BitVec 32) (_ BitVec 8))) (size!7914 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18222)

(assert (=> b!300357 (= lt!435954 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7914 a1!948))))))

(declare-fun b!300358 () Bool)

(declare-fun res!247622 () Bool)

(assert (=> b!300358 (=> (not res!247622) (not e!215687))))

(declare-fun a2!948 () array!18222)

(declare-fun arrayBitRangesEq!0 (array!18222 array!18222 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300358 (= res!247622 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun bm!5372 () Bool)

(declare-fun c!13952 () Bool)

(declare-fun lt!435953 () (_ BitVec 32))

(declare-fun lt!435949 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5372 (= call!5375 (byteRangesEq!0 (ite c!13952 (select (arr!8997 a1!948) (_3!1475 lt!435945)) (select (arr!8997 a1!948) (_4!518 lt!435945))) (ite c!13952 (select (arr!8997 a2!948) (_3!1475 lt!435945)) (select (arr!8997 a2!948) (_4!518 lt!435945))) (ite c!13952 lt!435949 #b00000000000000000000000000000000) lt!435953))))

(declare-fun b!300359 () Bool)

(declare-fun lt!435956 () Unit!21011)

(assert (=> b!300359 (= e!215688 lt!435956)))

(declare-fun arrayRangesEqImpliesEq!231 (array!18222 array!18222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21011)

(assert (=> b!300359 (= lt!435956 (arrayRangesEqImpliesEq!231 a1!948 a2!948 (_1!13173 lt!435945) (_3!1475 lt!435950) (_2!13173 lt!435945)))))

(assert (=> b!300359 (= (select (arr!8997 a1!948) (_3!1475 lt!435950)) (select (arr!8997 a2!948) (_3!1475 lt!435950)))))

(declare-fun res!247616 () Bool)

(assert (=> start!67022 (=> (not res!247616) (not e!215680))))

(assert (=> start!67022 (= res!247616 (and (bvsle (size!7914 a1!948) (size!7914 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67022 e!215680))

(assert (=> start!67022 true))

(declare-fun array_inv!7526 (array!18222) Bool)

(assert (=> start!67022 (array_inv!7526 a1!948)))

(assert (=> start!67022 (array_inv!7526 a2!948)))

(declare-fun b!300353 () Bool)

(declare-fun lt!435955 () Unit!21011)

(assert (=> b!300353 (= e!215681 lt!435955)))

(assert (=> b!300353 (= lt!435955 (arrayRangesEqImpliesEq!231 a1!948 a2!948 (_1!13173 lt!435945) (_4!518 lt!435950) (_2!13173 lt!435945)))))

(assert (=> b!300353 (= (select (arr!8997 a1!948) (_4!518 lt!435950)) (select (arr!8997 a2!948) (_4!518 lt!435950)))))

(declare-fun b!300360 () Bool)

(declare-fun e!215682 () Unit!21011)

(declare-fun lt!435952 () Unit!21011)

(assert (=> b!300360 (= e!215682 lt!435952)))

(declare-fun arrayRangesEqSlicedLemma!186 (array!18222 array!18222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21011)

(assert (=> b!300360 (= lt!435952 (arrayRangesEqSlicedLemma!186 a1!948 a2!948 (_1!13173 lt!435945) (_2!13173 lt!435945) (_1!13173 lt!435950) (_2!13173 lt!435950)))))

(declare-fun arrayRangesEq!1576 (array!18222 array!18222 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300360 (arrayRangesEq!1576 a1!948 a2!948 (_1!13173 lt!435950) (_2!13173 lt!435950))))

(declare-fun b!300361 () Bool)

(declare-fun e!215683 () Bool)

(declare-fun e!215678 () Bool)

(assert (=> b!300361 (= e!215683 e!215678)))

(declare-fun res!247620 () Bool)

(assert (=> b!300361 (= res!247620 (byteRangesEq!0 (select (arr!8997 a1!948) (_3!1475 lt!435945)) (select (arr!8997 a2!948) (_3!1475 lt!435945)) lt!435949 #b00000000000000000000000000000111))))

(assert (=> b!300361 (=> (not res!247620) (not e!215678))))

(declare-fun b!300362 () Bool)

(assert (=> b!300362 (= e!215683 call!5375)))

(declare-fun b!300363 () Bool)

(declare-fun res!247618 () Bool)

(assert (=> b!300363 (= res!247618 (= lt!435953 #b00000000000000000000000000000000))))

(assert (=> b!300363 (=> res!247618 e!215684)))

(assert (=> b!300363 (= e!215678 e!215684)))

(declare-fun b!300364 () Bool)

(assert (=> b!300364 (= e!215687 e!215685)))

(declare-fun res!247617 () Bool)

(assert (=> b!300364 (=> (not res!247617) (not e!215685))))

(assert (=> b!300364 (= res!247617 e!215683)))

(assert (=> b!300364 (= c!13952 (= (_3!1475 lt!435945) (_4!518 lt!435945)))))

(declare-fun lt!435951 () Unit!21011)

(assert (=> b!300364 (= lt!435951 e!215682)))

(declare-fun c!13951 () Bool)

(assert (=> b!300364 (= c!13951 (bvslt (_1!13173 lt!435950) (_2!13173 lt!435950)))))

(declare-fun toSlice!52 () (_ BitVec 64))

(assert (=> b!300364 (= lt!435948 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300364 (= lt!435947 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1036)

(assert (=> b!300364 (= lt!435950 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300364 (= lt!435953 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300364 (= lt!435949 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300364 (= lt!435945 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300365 () Bool)

(declare-fun Unit!21015 () Unit!21011)

(assert (=> b!300365 (= e!215682 Unit!21015)))

(declare-fun b!300366 () Bool)

(declare-fun res!247619 () Bool)

(assert (=> b!300366 (=> (not res!247619) (not e!215687))))

(assert (=> b!300366 (= res!247619 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435954) (not (= fromSlice!52 toSlice!52))))))

(assert (= (and start!67022 res!247616) b!300357))

(assert (= (and b!300357 res!247621) b!300358))

(assert (= (and b!300358 res!247622) b!300366))

(assert (= (and b!300366 res!247619) b!300364))

(assert (= (and b!300364 c!13951) b!300360))

(assert (= (and b!300364 (not c!13951)) b!300365))

(assert (= (and b!300364 c!13952) b!300362))

(assert (= (and b!300364 (not c!13952)) b!300361))

(assert (= (and b!300361 res!247620) b!300363))

(assert (= (and b!300363 (not res!247618)) b!300355))

(assert (= (or b!300362 b!300355) bm!5372))

(assert (= (and b!300364 res!247617) b!300354))

(assert (= (and b!300354 c!13950) b!300359))

(assert (= (and b!300354 (not c!13950)) b!300356))

(assert (= (and b!300354 c!13953) b!300353))

(assert (= (and b!300354 (not c!13953)) b!300352))

(declare-fun m!439331 () Bool)

(assert (=> b!300361 m!439331))

(declare-fun m!439333 () Bool)

(assert (=> b!300361 m!439333))

(assert (=> b!300361 m!439331))

(assert (=> b!300361 m!439333))

(declare-fun m!439335 () Bool)

(assert (=> b!300361 m!439335))

(declare-fun m!439337 () Bool)

(assert (=> b!300353 m!439337))

(declare-fun m!439339 () Bool)

(assert (=> b!300353 m!439339))

(declare-fun m!439341 () Bool)

(assert (=> b!300353 m!439341))

(declare-fun m!439343 () Bool)

(assert (=> b!300358 m!439343))

(declare-fun m!439345 () Bool)

(assert (=> b!300359 m!439345))

(declare-fun m!439347 () Bool)

(assert (=> b!300359 m!439347))

(declare-fun m!439349 () Bool)

(assert (=> b!300359 m!439349))

(assert (=> bm!5372 m!439331))

(assert (=> bm!5372 m!439333))

(declare-fun m!439351 () Bool)

(assert (=> bm!5372 m!439351))

(declare-fun m!439353 () Bool)

(assert (=> bm!5372 m!439353))

(declare-fun m!439355 () Bool)

(assert (=> bm!5372 m!439355))

(declare-fun m!439357 () Bool)

(assert (=> b!300360 m!439357))

(declare-fun m!439359 () Bool)

(assert (=> b!300360 m!439359))

(declare-fun m!439361 () Bool)

(assert (=> b!300364 m!439361))

(declare-fun m!439363 () Bool)

(assert (=> b!300364 m!439363))

(declare-fun m!439365 () Bool)

(assert (=> start!67022 m!439365))

(declare-fun m!439367 () Bool)

(assert (=> start!67022 m!439367))

(push 1)

(assert (not b!300359))

(assert (not start!67022))

(assert (not b!300360))

(assert (not b!300364))

(assert (not b!300361))

(assert (not b!300353))

(assert (not bm!5372))

(assert (not b!300358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100710 () Bool)

(assert (=> d!100710 (and (bvsge (_3!1475 lt!435950) #b00000000000000000000000000000000) (bvslt (_3!1475 lt!435950) (size!7914 a1!948)) (bvslt (_3!1475 lt!435950) (size!7914 a2!948)) (= (select (arr!8997 a1!948) (_3!1475 lt!435950)) (select (arr!8997 a2!948) (_3!1475 lt!435950))))))

(declare-fun lt!435992 () Unit!21011)

(declare-fun choose!525 (array!18222 array!18222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21011)

(assert (=> d!100710 (= lt!435992 (choose!525 a1!948 a2!948 (_1!13173 lt!435945) (_3!1475 lt!435950) (_2!13173 lt!435945)))))

(assert (=> d!100710 (and (bvsle #b00000000000000000000000000000000 (_1!13173 lt!435945)) (bvsle (_1!13173 lt!435945) (_2!13173 lt!435945)))))

(assert (=> d!100710 (= (arrayRangesEqImpliesEq!231 a1!948 a2!948 (_1!13173 lt!435945) (_3!1475 lt!435950) (_2!13173 lt!435945)) lt!435992)))

(declare-fun bs!25960 () Bool)

(assert (= bs!25960 d!100710))

(assert (=> bs!25960 m!439347))

(assert (=> bs!25960 m!439349))

(declare-fun m!439437 () Bool)

(assert (=> bs!25960 m!439437))

(assert (=> b!300359 d!100710))

(declare-fun d!100712 () Bool)

(assert (=> d!100712 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1037 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!300364 d!100712))

(declare-fun d!100714 () Bool)

(assert (=> d!100714 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1037 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!300364 d!100714))

(declare-fun d!100716 () Bool)

(assert (=> d!100716 (= (byteRangesEq!0 (ite c!13952 (select (arr!8997 a1!948) (_3!1475 lt!435945)) (select (arr!8997 a1!948) (_4!518 lt!435945))) (ite c!13952 (select (arr!8997 a2!948) (_3!1475 lt!435945)) (select (arr!8997 a2!948) (_4!518 lt!435945))) (ite c!13952 lt!435949 #b00000000000000000000000000000000) lt!435953) (or (= (ite c!13952 lt!435949 #b00000000000000000000000000000000) lt!435953) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!13952 (select (arr!8997 a1!948) (_3!1475 lt!435945)) (select (arr!8997 a1!948) (_4!518 lt!435945)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!435953))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!13952 lt!435949 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!13952 (select (arr!8997 a2!948) (_3!1475 lt!435945)) (select (arr!8997 a2!948) (_4!518 lt!435945)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!435953))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!13952 lt!435949 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!25961 () Bool)

(assert (= bs!25961 d!100716))

(declare-fun m!439439 () Bool)

(assert (=> bs!25961 m!439439))

(declare-fun m!439441 () Bool)

(assert (=> bs!25961 m!439441))

(assert (=> bm!5372 d!100716))

(declare-fun d!100718 () Bool)

(assert (=> d!100718 (and (bvsge (_4!518 lt!435950) #b00000000000000000000000000000000) (bvslt (_4!518 lt!435950) (size!7914 a1!948)) (bvslt (_4!518 lt!435950) (size!7914 a2!948)) (= (select (arr!8997 a1!948) (_4!518 lt!435950)) (select (arr!8997 a2!948) (_4!518 lt!435950))))))

(declare-fun lt!435993 () Unit!21011)

(assert (=> d!100718 (= lt!435993 (choose!525 a1!948 a2!948 (_1!13173 lt!435945) (_4!518 lt!435950) (_2!13173 lt!435945)))))

(assert (=> d!100718 (and (bvsle #b00000000000000000000000000000000 (_1!13173 lt!435945)) (bvsle (_1!13173 lt!435945) (_2!13173 lt!435945)))))

(assert (=> d!100718 (= (arrayRangesEqImpliesEq!231 a1!948 a2!948 (_1!13173 lt!435945) (_4!518 lt!435950) (_2!13173 lt!435945)) lt!435993)))

(declare-fun bs!25962 () Bool)

(assert (= bs!25962 d!100718))

(assert (=> bs!25962 m!439339))

(assert (=> bs!25962 m!439341))

(declare-fun m!439443 () Bool)

(assert (=> bs!25962 m!439443))

(assert (=> b!300353 d!100718))

(declare-fun b!300435 () Bool)

(declare-fun e!215753 () Bool)

(declare-fun call!5384 () Bool)

(assert (=> b!300435 (= e!215753 call!5384)))

(declare-fun b!300436 () Bool)

(declare-fun e!215749 () Bool)

(declare-fun e!215750 () Bool)

(assert (=> b!300436 (= e!215749 e!215750)))

(declare-fun c!13962 () Bool)

(declare-fun lt!436001 () tuple4!1036)

(assert (=> b!300436 (= c!13962 (= (_3!1475 lt!436001) (_4!518 lt!436001)))))

(declare-fun b!300437 () Bool)

(declare-fun res!247679 () Bool)

(declare-fun lt!436002 () (_ BitVec 32))

(assert (=> b!300437 (= res!247679 (= lt!436002 #b00000000000000000000000000000000))))

(assert (=> b!300437 (=> res!247679 e!215753)))

(declare-fun e!215754 () Bool)

(assert (=> b!300437 (= e!215754 e!215753)))

(declare-fun lt!436000 () (_ BitVec 32))

(declare-fun bm!5381 () Bool)

(assert (=> bm!5381 (= call!5384 (byteRangesEq!0 (ite c!13962 (select (arr!8997 a1!948) (_3!1475 lt!436001)) (select (arr!8997 a1!948) (_4!518 lt!436001))) (ite c!13962 (select (arr!8997 a2!948) (_3!1475 lt!436001)) (select (arr!8997 a2!948) (_4!518 lt!436001))) (ite c!13962 lt!436000 #b00000000000000000000000000000000) lt!436002))))

(declare-fun b!300438 () Bool)

(declare-fun e!215751 () Bool)

(assert (=> b!300438 (= e!215751 e!215749)))

(declare-fun res!247675 () Bool)

(assert (=> b!300438 (=> (not res!247675) (not e!215749))))

(declare-fun e!215752 () Bool)

(assert (=> b!300438 (= res!247675 e!215752)))

(declare-fun res!247676 () Bool)

(assert (=> b!300438 (=> res!247676 e!215752)))

(assert (=> b!300438 (= res!247676 (bvsge (_1!13173 lt!436001) (_2!13173 lt!436001)))))

(assert (=> b!300438 (= lt!436002 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300438 (= lt!436000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300438 (= lt!436001 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!100720 () Bool)

(declare-fun res!247677 () Bool)

(assert (=> d!100720 (=> res!247677 e!215751)))

(assert (=> d!100720 (= res!247677 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100720 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!215751)))

(declare-fun b!300439 () Bool)

(assert (=> b!300439 (= e!215752 (arrayRangesEq!1576 a1!948 a2!948 (_1!13173 lt!436001) (_2!13173 lt!436001)))))

(declare-fun b!300440 () Bool)

(assert (=> b!300440 (= e!215750 e!215754)))

(declare-fun res!247678 () Bool)

(assert (=> b!300440 (= res!247678 (byteRangesEq!0 (select (arr!8997 a1!948) (_3!1475 lt!436001)) (select (arr!8997 a2!948) (_3!1475 lt!436001)) lt!436000 #b00000000000000000000000000001000))))

(assert (=> b!300440 (=> (not res!247678) (not e!215754))))

(declare-fun b!300441 () Bool)

(assert (=> b!300441 (= e!215750 call!5384)))

(assert (= (and d!100720 (not res!247677)) b!300438))

(assert (= (and b!300438 (not res!247676)) b!300439))

(assert (= (and b!300438 res!247675) b!300436))

(assert (= (and b!300436 c!13962) b!300441))

(assert (= (and b!300436 (not c!13962)) b!300440))

(assert (= (and b!300440 res!247678) b!300437))

(assert (= (and b!300437 (not res!247679)) b!300435))

(assert (= (or b!300441 b!300435) bm!5381))

(declare-fun m!439445 () Bool)

(assert (=> bm!5381 m!439445))

(declare-fun m!439447 () Bool)

(assert (=> bm!5381 m!439447))

(declare-fun m!439449 () Bool)

(assert (=> bm!5381 m!439449))

(declare-fun m!439451 () Bool)

(assert (=> bm!5381 m!439451))

(declare-fun m!439453 () Bool)

(assert (=> bm!5381 m!439453))

(assert (=> b!300438 m!439363))

(declare-fun m!439455 () Bool)

(assert (=> b!300439 m!439455))

(assert (=> b!300440 m!439453))

(assert (=> b!300440 m!439451))

(assert (=> b!300440 m!439453))

(assert (=> b!300440 m!439451))

(declare-fun m!439457 () Bool)

(assert (=> b!300440 m!439457))

(assert (=> b!300358 d!100720))

(declare-fun d!100722 () Bool)

(assert (=> d!100722 (= (byteRangesEq!0 (select (arr!8997 a1!948) (_3!1475 lt!435945)) (select (arr!8997 a2!948) (_3!1475 lt!435945)) lt!435949 #b00000000000000000000000000000111) (or (= lt!435949 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8997 a1!948) (_3!1475 lt!435945))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!435949)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8997 a2!948) (_3!1475 lt!435945))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!435949)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25963 () Bool)

(assert (= bs!25963 d!100722))

(declare-fun m!439459 () Bool)

(assert (=> bs!25963 m!439459))

(declare-fun m!439461 () Bool)

(assert (=> bs!25963 m!439461))

(assert (=> b!300361 d!100722))

(declare-fun d!100724 () Bool)

(assert (=> d!100724 (arrayRangesEq!1576 a1!948 a2!948 (_1!13173 lt!435950) (_2!13173 lt!435950))))

(declare-fun lt!436005 () Unit!21011)

(declare-fun choose!526 (array!18222 array!18222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21011)

(assert (=> d!100724 (= lt!436005 (choose!526 a1!948 a2!948 (_1!13173 lt!435945) (_2!13173 lt!435945) (_1!13173 lt!435950) (_2!13173 lt!435950)))))

(assert (=> d!100724 (and (bvsle #b00000000000000000000000000000000 (_1!13173 lt!435945)) (bvsle (_1!13173 lt!435945) (_2!13173 lt!435945)))))

(assert (=> d!100724 (= (arrayRangesEqSlicedLemma!186 a1!948 a2!948 (_1!13173 lt!435945) (_2!13173 lt!435945) (_1!13173 lt!435950) (_2!13173 lt!435950)) lt!436005)))

(declare-fun bs!25964 () Bool)

(assert (= bs!25964 d!100724))

(assert (=> bs!25964 m!439359))

(declare-fun m!439463 () Bool)

(assert (=> bs!25964 m!439463))

(assert (=> b!300360 d!100724))

(declare-fun d!100726 () Bool)

(declare-fun res!247684 () Bool)

(declare-fun e!215759 () Bool)

(assert (=> d!100726 (=> res!247684 e!215759)))

(assert (=> d!100726 (= res!247684 (= (_1!13173 lt!435950) (_2!13173 lt!435950)))))

(assert (=> d!100726 (= (arrayRangesEq!1576 a1!948 a2!948 (_1!13173 lt!435950) (_2!13173 lt!435950)) e!215759)))

(declare-fun b!300446 () Bool)

(declare-fun e!215760 () Bool)

(assert (=> b!300446 (= e!215759 e!215760)))

(declare-fun res!247685 () Bool)

(assert (=> b!300446 (=> (not res!247685) (not e!215760))))

(assert (=> b!300446 (= res!247685 (= (select (arr!8997 a1!948) (_1!13173 lt!435950)) (select (arr!8997 a2!948) (_1!13173 lt!435950))))))

(declare-fun b!300447 () Bool)

(assert (=> b!300447 (= e!215760 (arrayRangesEq!1576 a1!948 a2!948 (bvadd (_1!13173 lt!435950) #b00000000000000000000000000000001) (_2!13173 lt!435950)))))

(assert (= (and d!100726 (not res!247684)) b!300446))

(assert (= (and b!300446 res!247685) b!300447))

(declare-fun m!439465 () Bool)

(assert (=> b!300446 m!439465))

(declare-fun m!439467 () Bool)

(assert (=> b!300446 m!439467))

(declare-fun m!439469 () Bool)

(assert (=> b!300447 m!439469))

(assert (=> b!300360 d!100726))

(declare-fun d!100728 () Bool)

(assert (=> d!100728 (= (array_inv!7526 a1!948) (bvsge (size!7914 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67022 d!100728))

(declare-fun d!100730 () Bool)

(assert (=> d!100730 (= (array_inv!7526 a2!948) (bvsge (size!7914 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67022 d!100730))

(push 1)

(assert (not d!100718))

(assert (not d!100710))

(assert (not b!300440))

(assert (not b!300439))

(assert (not b!300447))

(assert (not bm!5381))

(assert (not b!300438))

(assert (not d!100724))

(check-sat)

