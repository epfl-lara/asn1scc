; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67104 () Bool)

(assert start!67104)

(declare-fun b!301380 () Bool)

(declare-fun res!248168 () Bool)

(declare-fun e!216432 () Bool)

(assert (=> b!301380 (=> (not res!248168) (not e!216432))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436662 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!301380 (= res!248168 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436662) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301381 () Bool)

(declare-fun e!216435 () Bool)

(assert (=> b!301381 (= e!216435 e!216432)))

(declare-fun res!248169 () Bool)

(assert (=> b!301381 (=> (not res!248169) (not e!216432))))

(assert (=> b!301381 (= res!248169 (and (bvsle toBit!258 lt!436662) (bvsle fromBit!258 lt!436662)))))

(declare-datatypes ((array!18265 0))(
  ( (array!18266 (arr!9017 (Array (_ BitVec 32) (_ BitVec 8))) (size!7934 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18265)

(assert (=> b!301381 (= lt!436662 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7934 a1!948))))))

(declare-fun b!301382 () Bool)

(declare-fun res!248171 () Bool)

(declare-fun lt!436666 () (_ BitVec 32))

(assert (=> b!301382 (= res!248171 (not (= lt!436666 #b00000000000000000000000000000000)))))

(declare-fun e!216431 () Bool)

(assert (=> b!301382 (=> (not res!248171) (not e!216431))))

(declare-fun e!216437 () Bool)

(assert (=> b!301382 (= e!216437 e!216431)))

(declare-fun b!301383 () Bool)

(declare-datatypes ((Unit!21109 0))(
  ( (Unit!21110) )
))
(declare-fun e!216434 () Unit!21109)

(declare-fun Unit!21111 () Unit!21109)

(assert (=> b!301383 (= e!216434 Unit!21111)))

(declare-fun b!301384 () Bool)

(declare-fun e!216433 () Bool)

(assert (=> b!301384 (= e!216432 e!216433)))

(declare-fun c!14189 () Bool)

(declare-datatypes ((tuple4!1076 0))(
  ( (tuple4!1077 (_1!13193 (_ BitVec 32)) (_2!13193 (_ BitVec 32)) (_3!1495 (_ BitVec 32)) (_4!538 (_ BitVec 32))) )
))
(declare-fun lt!436665 () tuple4!1076)

(assert (=> b!301384 (= c!14189 (= (_3!1495 lt!436665) (_4!538 lt!436665)))))

(declare-fun lt!436664 () Unit!21109)

(assert (=> b!301384 (= lt!436664 e!216434)))

(declare-fun c!14190 () Bool)

(declare-fun lt!436663 () tuple4!1076)

(assert (=> b!301384 (= c!14190 (bvslt (_1!13193 lt!436663) (_2!13193 lt!436663)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1076)

(assert (=> b!301384 (= lt!436663 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301384 (= lt!436666 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436668 () (_ BitVec 32))

(assert (=> b!301384 (= lt!436668 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301384 (= lt!436665 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301386 () Bool)

(assert (=> b!301386 (= e!216433 e!216437)))

(declare-fun res!248167 () Bool)

(declare-fun call!5444 () Bool)

(assert (=> b!301386 (= res!248167 (not call!5444))))

(assert (=> b!301386 (=> res!248167 e!216437)))

(declare-fun b!301387 () Bool)

(declare-fun a2!948 () array!18265)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301387 (= e!216431 (not (byteRangesEq!0 (select (arr!9017 a1!948) (_4!538 lt!436665)) (select (arr!9017 a2!948) (_4!538 lt!436665)) #b00000000000000000000000000000000 lt!436666)))))

(declare-fun b!301388 () Bool)

(declare-fun lt!436667 () Unit!21109)

(assert (=> b!301388 (= e!216434 lt!436667)))

(declare-fun arrayRangesEqSlicedLemma!206 (array!18265 array!18265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21109)

(assert (=> b!301388 (= lt!436667 (arrayRangesEqSlicedLemma!206 a1!948 a2!948 (_1!13193 lt!436665) (_2!13193 lt!436665) (_1!13193 lt!436663) (_2!13193 lt!436663)))))

(declare-fun arrayRangesEq!1596 (array!18265 array!18265 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301388 (arrayRangesEq!1596 a1!948 a2!948 (_1!13193 lt!436663) (_2!13193 lt!436663))))

(declare-fun b!301385 () Bool)

(declare-fun res!248170 () Bool)

(assert (=> b!301385 (=> (not res!248170) (not e!216432))))

(declare-fun arrayBitRangesEq!0 (array!18265 array!18265 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301385 (= res!248170 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun res!248166 () Bool)

(assert (=> start!67104 (=> (not res!248166) (not e!216435))))

(assert (=> start!67104 (= res!248166 (and (bvsle (size!7934 a1!948) (size!7934 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67104 e!216435))

(assert (=> start!67104 true))

(declare-fun array_inv!7546 (array!18265) Bool)

(assert (=> start!67104 (array_inv!7546 a1!948)))

(assert (=> start!67104 (array_inv!7546 a2!948)))

(declare-fun bm!5441 () Bool)

(assert (=> bm!5441 (= call!5444 (byteRangesEq!0 (select (arr!9017 a1!948) (_3!1495 lt!436665)) (select (arr!9017 a2!948) (_3!1495 lt!436665)) lt!436668 (ite c!14189 lt!436666 #b00000000000000000000000000000111)))))

(declare-fun b!301389 () Bool)

(assert (=> b!301389 (= e!216433 (not call!5444))))

(assert (= (and start!67104 res!248166) b!301381))

(assert (= (and b!301381 res!248169) b!301385))

(assert (= (and b!301385 res!248170) b!301380))

(assert (= (and b!301380 res!248168) b!301384))

(assert (= (and b!301384 c!14190) b!301388))

(assert (= (and b!301384 (not c!14190)) b!301383))

(assert (= (and b!301384 c!14189) b!301389))

(assert (= (and b!301384 (not c!14189)) b!301386))

(assert (= (and b!301386 (not res!248167)) b!301382))

(assert (= (and b!301382 res!248171) b!301387))

(assert (= (or b!301389 b!301386) bm!5441))

(declare-fun m!440205 () Bool)

(assert (=> start!67104 m!440205))

(declare-fun m!440207 () Bool)

(assert (=> start!67104 m!440207))

(declare-fun m!440209 () Bool)

(assert (=> b!301388 m!440209))

(declare-fun m!440211 () Bool)

(assert (=> b!301388 m!440211))

(declare-fun m!440213 () Bool)

(assert (=> b!301387 m!440213))

(declare-fun m!440215 () Bool)

(assert (=> b!301387 m!440215))

(assert (=> b!301387 m!440213))

(assert (=> b!301387 m!440215))

(declare-fun m!440217 () Bool)

(assert (=> b!301387 m!440217))

(declare-fun m!440219 () Bool)

(assert (=> b!301384 m!440219))

(declare-fun m!440221 () Bool)

(assert (=> b!301384 m!440221))

(declare-fun m!440223 () Bool)

(assert (=> b!301385 m!440223))

(declare-fun m!440225 () Bool)

(assert (=> bm!5441 m!440225))

(declare-fun m!440227 () Bool)

(assert (=> bm!5441 m!440227))

(assert (=> bm!5441 m!440225))

(assert (=> bm!5441 m!440227))

(declare-fun m!440229 () Bool)

(assert (=> bm!5441 m!440229))

(check-sat (not bm!5441) (not b!301387) (not start!67104) (not b!301388) (not b!301384) (not b!301385))
(check-sat)
(get-model)

(declare-fun d!100746 () Bool)

(assert (=> d!100746 (arrayRangesEq!1596 a1!948 a2!948 (_1!13193 lt!436663) (_2!13193 lt!436663))))

(declare-fun lt!436692 () Unit!21109)

(declare-fun choose!527 (array!18265 array!18265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21109)

(assert (=> d!100746 (= lt!436692 (choose!527 a1!948 a2!948 (_1!13193 lt!436665) (_2!13193 lt!436665) (_1!13193 lt!436663) (_2!13193 lt!436663)))))

(assert (=> d!100746 (and (bvsle #b00000000000000000000000000000000 (_1!13193 lt!436665)) (bvsle (_1!13193 lt!436665) (_2!13193 lt!436665)))))

(assert (=> d!100746 (= (arrayRangesEqSlicedLemma!206 a1!948 a2!948 (_1!13193 lt!436665) (_2!13193 lt!436665) (_1!13193 lt!436663) (_2!13193 lt!436663)) lt!436692)))

(declare-fun bs!25986 () Bool)

(assert (= bs!25986 d!100746))

(assert (=> bs!25986 m!440211))

(declare-fun m!440257 () Bool)

(assert (=> bs!25986 m!440257))

(assert (=> b!301388 d!100746))

(declare-fun d!100748 () Bool)

(declare-fun res!248194 () Bool)

(declare-fun e!216467 () Bool)

(assert (=> d!100748 (=> res!248194 e!216467)))

(assert (=> d!100748 (= res!248194 (= (_1!13193 lt!436663) (_2!13193 lt!436663)))))

(assert (=> d!100748 (= (arrayRangesEq!1596 a1!948 a2!948 (_1!13193 lt!436663) (_2!13193 lt!436663)) e!216467)))

(declare-fun b!301424 () Bool)

(declare-fun e!216468 () Bool)

(assert (=> b!301424 (= e!216467 e!216468)))

(declare-fun res!248195 () Bool)

(assert (=> b!301424 (=> (not res!248195) (not e!216468))))

(assert (=> b!301424 (= res!248195 (= (select (arr!9017 a1!948) (_1!13193 lt!436663)) (select (arr!9017 a2!948) (_1!13193 lt!436663))))))

(declare-fun b!301425 () Bool)

(assert (=> b!301425 (= e!216468 (arrayRangesEq!1596 a1!948 a2!948 (bvadd (_1!13193 lt!436663) #b00000000000000000000000000000001) (_2!13193 lt!436663)))))

(assert (= (and d!100748 (not res!248194)) b!301424))

(assert (= (and b!301424 res!248195) b!301425))

(declare-fun m!440259 () Bool)

(assert (=> b!301424 m!440259))

(declare-fun m!440261 () Bool)

(assert (=> b!301424 m!440261))

(declare-fun m!440263 () Bool)

(assert (=> b!301425 m!440263))

(assert (=> b!301388 d!100748))

(declare-fun d!100750 () Bool)

(assert (=> d!100750 (= (byteRangesEq!0 (select (arr!9017 a1!948) (_3!1495 lt!436665)) (select (arr!9017 a2!948) (_3!1495 lt!436665)) lt!436668 (ite c!14189 lt!436666 #b00000000000000000000000000000111)) (or (= lt!436668 (ite c!14189 lt!436666 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9017 a1!948) (_3!1495 lt!436665))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14189 lt!436666 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436668)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9017 a2!948) (_3!1495 lt!436665))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14189 lt!436666 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436668)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25987 () Bool)

(assert (= bs!25987 d!100750))

(declare-fun m!440265 () Bool)

(assert (=> bs!25987 m!440265))

(declare-fun m!440267 () Bool)

(assert (=> bs!25987 m!440267))

(assert (=> bm!5441 d!100750))

(declare-fun d!100752 () Bool)

(assert (=> d!100752 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1077 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301384 d!100752))

(declare-fun d!100754 () Bool)

(assert (=> d!100754 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1077 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301384 d!100754))

(declare-fun b!301440 () Bool)

(declare-fun e!216486 () Bool)

(declare-fun e!216484 () Bool)

(assert (=> b!301440 (= e!216486 e!216484)))

(declare-fun res!248207 () Bool)

(declare-fun lt!436700 () tuple4!1076)

(declare-fun lt!436699 () (_ BitVec 32))

(assert (=> b!301440 (= res!248207 (byteRangesEq!0 (select (arr!9017 a1!948) (_3!1495 lt!436700)) (select (arr!9017 a2!948) (_3!1495 lt!436700)) lt!436699 #b00000000000000000000000000001000))))

(assert (=> b!301440 (=> (not res!248207) (not e!216484))))

(declare-fun e!216482 () Bool)

(declare-fun b!301441 () Bool)

(assert (=> b!301441 (= e!216482 (arrayRangesEq!1596 a1!948 a2!948 (_1!13193 lt!436700) (_2!13193 lt!436700)))))

(declare-fun b!301442 () Bool)

(declare-fun e!216481 () Bool)

(declare-fun call!5450 () Bool)

(assert (=> b!301442 (= e!216481 call!5450)))

(declare-fun b!301443 () Bool)

(declare-fun e!216483 () Bool)

(declare-fun e!216485 () Bool)

(assert (=> b!301443 (= e!216483 e!216485)))

(declare-fun res!248209 () Bool)

(assert (=> b!301443 (=> (not res!248209) (not e!216485))))

(assert (=> b!301443 (= res!248209 e!216482)))

(declare-fun res!248206 () Bool)

(assert (=> b!301443 (=> res!248206 e!216482)))

(assert (=> b!301443 (= res!248206 (bvsge (_1!13193 lt!436700) (_2!13193 lt!436700)))))

(declare-fun lt!436701 () (_ BitVec 32))

(assert (=> b!301443 (= lt!436701 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301443 (= lt!436699 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301443 (= lt!436700 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!100756 () Bool)

(declare-fun res!248210 () Bool)

(assert (=> d!100756 (=> res!248210 e!216483)))

(assert (=> d!100756 (= res!248210 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100756 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!216483)))

(declare-fun c!14199 () Bool)

(declare-fun bm!5447 () Bool)

(assert (=> bm!5447 (= call!5450 (byteRangesEq!0 (ite c!14199 (select (arr!9017 a1!948) (_3!1495 lt!436700)) (select (arr!9017 a1!948) (_4!538 lt!436700))) (ite c!14199 (select (arr!9017 a2!948) (_3!1495 lt!436700)) (select (arr!9017 a2!948) (_4!538 lt!436700))) (ite c!14199 lt!436699 #b00000000000000000000000000000000) lt!436701))))

(declare-fun b!301444 () Bool)

(assert (=> b!301444 (= e!216485 e!216486)))

(assert (=> b!301444 (= c!14199 (= (_3!1495 lt!436700) (_4!538 lt!436700)))))

(declare-fun b!301445 () Bool)

(declare-fun res!248208 () Bool)

(assert (=> b!301445 (= res!248208 (= lt!436701 #b00000000000000000000000000000000))))

(assert (=> b!301445 (=> res!248208 e!216481)))

(assert (=> b!301445 (= e!216484 e!216481)))

(declare-fun b!301446 () Bool)

(assert (=> b!301446 (= e!216486 call!5450)))

(assert (= (and d!100756 (not res!248210)) b!301443))

(assert (= (and b!301443 (not res!248206)) b!301441))

(assert (= (and b!301443 res!248209) b!301444))

(assert (= (and b!301444 c!14199) b!301446))

(assert (= (and b!301444 (not c!14199)) b!301440))

(assert (= (and b!301440 res!248207) b!301445))

(assert (= (and b!301445 (not res!248208)) b!301442))

(assert (= (or b!301446 b!301442) bm!5447))

(declare-fun m!440269 () Bool)

(assert (=> b!301440 m!440269))

(declare-fun m!440271 () Bool)

(assert (=> b!301440 m!440271))

(assert (=> b!301440 m!440269))

(assert (=> b!301440 m!440271))

(declare-fun m!440273 () Bool)

(assert (=> b!301440 m!440273))

(declare-fun m!440275 () Bool)

(assert (=> b!301441 m!440275))

(assert (=> b!301443 m!440221))

(declare-fun m!440277 () Bool)

(assert (=> bm!5447 m!440277))

(assert (=> bm!5447 m!440271))

(assert (=> bm!5447 m!440269))

(declare-fun m!440279 () Bool)

(assert (=> bm!5447 m!440279))

(declare-fun m!440281 () Bool)

(assert (=> bm!5447 m!440281))

(assert (=> b!301385 d!100756))

(declare-fun d!100758 () Bool)

(assert (=> d!100758 (= (array_inv!7546 a1!948) (bvsge (size!7934 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67104 d!100758))

(declare-fun d!100760 () Bool)

(assert (=> d!100760 (= (array_inv!7546 a2!948) (bvsge (size!7934 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67104 d!100760))

(declare-fun d!100762 () Bool)

(assert (=> d!100762 (= (byteRangesEq!0 (select (arr!9017 a1!948) (_4!538 lt!436665)) (select (arr!9017 a2!948) (_4!538 lt!436665)) #b00000000000000000000000000000000 lt!436666) (or (= #b00000000000000000000000000000000 lt!436666) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9017 a1!948) (_4!538 lt!436665))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436666))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9017 a2!948) (_4!538 lt!436665))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436666))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25988 () Bool)

(assert (= bs!25988 d!100762))

(declare-fun m!440283 () Bool)

(assert (=> bs!25988 m!440283))

(declare-fun m!440285 () Bool)

(assert (=> bs!25988 m!440285))

(assert (=> b!301387 d!100762))

(check-sat (not d!100746) (not b!301443) (not b!301425) (not b!301441) (not bm!5447) (not b!301440))
(check-sat)
(get-model)

(declare-fun d!100800 () Bool)

(declare-fun res!248253 () Bool)

(declare-fun e!216535 () Bool)

(assert (=> d!100800 (=> res!248253 e!216535)))

(assert (=> d!100800 (= res!248253 (= (bvadd (_1!13193 lt!436663) #b00000000000000000000000000000001) (_2!13193 lt!436663)))))

(assert (=> d!100800 (= (arrayRangesEq!1596 a1!948 a2!948 (bvadd (_1!13193 lt!436663) #b00000000000000000000000000000001) (_2!13193 lt!436663)) e!216535)))

(declare-fun b!301501 () Bool)

(declare-fun e!216536 () Bool)

(assert (=> b!301501 (= e!216535 e!216536)))

(declare-fun res!248254 () Bool)

(assert (=> b!301501 (=> (not res!248254) (not e!216536))))

(assert (=> b!301501 (= res!248254 (= (select (arr!9017 a1!948) (bvadd (_1!13193 lt!436663) #b00000000000000000000000000000001)) (select (arr!9017 a2!948) (bvadd (_1!13193 lt!436663) #b00000000000000000000000000000001))))))

(declare-fun b!301502 () Bool)

(assert (=> b!301502 (= e!216536 (arrayRangesEq!1596 a1!948 a2!948 (bvadd (_1!13193 lt!436663) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_2!13193 lt!436663)))))

(assert (= (and d!100800 (not res!248253)) b!301501))

(assert (= (and b!301501 res!248254) b!301502))

(declare-fun m!440347 () Bool)

(assert (=> b!301501 m!440347))

(declare-fun m!440349 () Bool)

(assert (=> b!301501 m!440349))

(declare-fun m!440351 () Bool)

(assert (=> b!301502 m!440351))

(assert (=> b!301425 d!100800))

(assert (=> b!301443 d!100754))

(declare-fun d!100802 () Bool)

(assert (=> d!100802 (= (byteRangesEq!0 (ite c!14199 (select (arr!9017 a1!948) (_3!1495 lt!436700)) (select (arr!9017 a1!948) (_4!538 lt!436700))) (ite c!14199 (select (arr!9017 a2!948) (_3!1495 lt!436700)) (select (arr!9017 a2!948) (_4!538 lt!436700))) (ite c!14199 lt!436699 #b00000000000000000000000000000000) lt!436701) (or (= (ite c!14199 lt!436699 #b00000000000000000000000000000000) lt!436701) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14199 (select (arr!9017 a1!948) (_3!1495 lt!436700)) (select (arr!9017 a1!948) (_4!538 lt!436700)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436701))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14199 lt!436699 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14199 (select (arr!9017 a2!948) (_3!1495 lt!436700)) (select (arr!9017 a2!948) (_4!538 lt!436700)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436701))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14199 lt!436699 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!25995 () Bool)

(assert (= bs!25995 d!100802))

(declare-fun m!440353 () Bool)

(assert (=> bs!25995 m!440353))

(declare-fun m!440355 () Bool)

(assert (=> bs!25995 m!440355))

(assert (=> bm!5447 d!100802))

(declare-fun d!100804 () Bool)

(assert (=> d!100804 (= (byteRangesEq!0 (select (arr!9017 a1!948) (_3!1495 lt!436700)) (select (arr!9017 a2!948) (_3!1495 lt!436700)) lt!436699 #b00000000000000000000000000001000) (or (= lt!436699 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9017 a1!948) (_3!1495 lt!436700))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436699)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9017 a2!948) (_3!1495 lt!436700))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436699)))) #b00000000000000000000000011111111))))))

(declare-fun bs!25996 () Bool)

(assert (= bs!25996 d!100804))

(declare-fun m!440357 () Bool)

(assert (=> bs!25996 m!440357))

(declare-fun m!440359 () Bool)

(assert (=> bs!25996 m!440359))

(assert (=> b!301440 d!100804))

(assert (=> d!100746 d!100748))

(declare-fun d!100806 () Bool)

(assert (=> d!100806 (arrayRangesEq!1596 a1!948 a2!948 (_1!13193 lt!436663) (_2!13193 lt!436663))))

(assert (=> d!100806 true))

(declare-fun _$10!46 () Unit!21109)

(assert (=> d!100806 (= (choose!527 a1!948 a2!948 (_1!13193 lt!436665) (_2!13193 lt!436665) (_1!13193 lt!436663) (_2!13193 lt!436663)) _$10!46)))

(declare-fun bs!25997 () Bool)

(assert (= bs!25997 d!100806))

(assert (=> bs!25997 m!440211))

(assert (=> d!100746 d!100806))

(declare-fun d!100808 () Bool)

(declare-fun res!248255 () Bool)

(declare-fun e!216537 () Bool)

(assert (=> d!100808 (=> res!248255 e!216537)))

(assert (=> d!100808 (= res!248255 (= (_1!13193 lt!436700) (_2!13193 lt!436700)))))

(assert (=> d!100808 (= (arrayRangesEq!1596 a1!948 a2!948 (_1!13193 lt!436700) (_2!13193 lt!436700)) e!216537)))

(declare-fun b!301503 () Bool)

(declare-fun e!216538 () Bool)

(assert (=> b!301503 (= e!216537 e!216538)))

(declare-fun res!248256 () Bool)

(assert (=> b!301503 (=> (not res!248256) (not e!216538))))

(assert (=> b!301503 (= res!248256 (= (select (arr!9017 a1!948) (_1!13193 lt!436700)) (select (arr!9017 a2!948) (_1!13193 lt!436700))))))

(declare-fun b!301504 () Bool)

(assert (=> b!301504 (= e!216538 (arrayRangesEq!1596 a1!948 a2!948 (bvadd (_1!13193 lt!436700) #b00000000000000000000000000000001) (_2!13193 lt!436700)))))

(assert (= (and d!100808 (not res!248255)) b!301503))

(assert (= (and b!301503 res!248256) b!301504))

(declare-fun m!440361 () Bool)

(assert (=> b!301503 m!440361))

(declare-fun m!440363 () Bool)

(assert (=> b!301503 m!440363))

(declare-fun m!440365 () Bool)

(assert (=> b!301504 m!440365))

(assert (=> b!301441 d!100808))

(check-sat (not b!301502) (not d!100806) (not b!301504))
(check-sat)
