; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68220 () Bool)

(assert start!68220)

(declare-fun c!14932 () Bool)

(declare-fun call!5825 () Bool)

(declare-fun lt!439504 () (_ BitVec 32))

(declare-datatypes ((array!18575 0))(
  ( (array!18576 (arr!9133 (Array (_ BitVec 32) (_ BitVec 8))) (size!8050 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18575)

(declare-fun a2!948 () array!18575)

(declare-fun lt!439510 () (_ BitVec 32))

(declare-fun bm!5822 () Bool)

(declare-datatypes ((tuple4!1242 0))(
  ( (tuple4!1243 (_1!13276 (_ BitVec 32)) (_2!13276 (_ BitVec 32)) (_3!1578 (_ BitVec 32)) (_4!621 (_ BitVec 32))) )
))
(declare-fun lt!439506 () tuple4!1242)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5822 (= call!5825 (byteRangesEq!0 (ite c!14932 (select (arr!9133 a1!948) (_3!1578 lt!439506)) (select (arr!9133 a1!948) (_4!621 lt!439506))) (ite c!14932 (select (arr!9133 a2!948) (_3!1578 lt!439506)) (select (arr!9133 a2!948) (_4!621 lt!439506))) (ite c!14932 lt!439504 #b00000000000000000000000000000000) lt!439510))))

(declare-fun b!306261 () Bool)

(declare-datatypes ((Unit!21364 0))(
  ( (Unit!21365) )
))
(declare-fun e!220637 () Unit!21364)

(declare-fun Unit!21366 () Unit!21364)

(assert (=> b!306261 (= e!220637 Unit!21366)))

(declare-fun b!306262 () Bool)

(declare-fun e!220641 () Bool)

(declare-fun lt!439509 () tuple4!1242)

(assert (=> b!306262 (= e!220641 (and (not (= (_3!1578 lt!439509) (_4!621 lt!439509))) (or (bvslt (_3!1578 lt!439509) #b00000000000000000000000000000000) (bvsge (_3!1578 lt!439509) (size!8050 a1!948)))))))

(declare-fun lt!439503 () Unit!21364)

(assert (=> b!306262 (= lt!439503 e!220637)))

(declare-fun c!14934 () Bool)

(assert (=> b!306262 (= c!14934 (and (bvslt (_4!621 lt!439509) (_4!621 lt!439506)) (bvslt (_3!1578 lt!439506) (_4!621 lt!439509))))))

(declare-fun lt!439512 () Unit!21364)

(declare-fun e!220634 () Unit!21364)

(assert (=> b!306262 (= lt!439512 e!220634)))

(declare-fun c!14933 () Bool)

(assert (=> b!306262 (= c!14933 (and (bvslt (_3!1578 lt!439506) (_3!1578 lt!439509)) (bvslt (_3!1578 lt!439509) (_4!621 lt!439506))))))

(declare-fun b!306263 () Bool)

(declare-fun res!251564 () Bool)

(declare-fun e!220639 () Bool)

(assert (=> b!306263 (=> (not res!251564) (not e!220639))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!439505 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!306263 (= res!251564 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439505) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306264 () Bool)

(declare-fun e!220632 () Unit!21364)

(declare-fun Unit!21367 () Unit!21364)

(assert (=> b!306264 (= e!220632 Unit!21367)))

(declare-fun b!306265 () Bool)

(declare-fun lt!439502 () Unit!21364)

(assert (=> b!306265 (= e!220637 lt!439502)))

(declare-fun arrayRangesEqImpliesEq!283 (array!18575 array!18575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21364)

(assert (=> b!306265 (= lt!439502 (arrayRangesEqImpliesEq!283 a1!948 a2!948 (_1!13276 lt!439506) (_4!621 lt!439509) (_2!13276 lt!439506)))))

(assert (=> b!306265 (= (select (arr!9133 a1!948) (_4!621 lt!439509)) (select (arr!9133 a2!948) (_4!621 lt!439509)))))

(declare-fun b!306266 () Bool)

(declare-fun Unit!21368 () Unit!21364)

(assert (=> b!306266 (= e!220634 Unit!21368)))

(declare-fun res!251565 () Bool)

(declare-fun e!220635 () Bool)

(assert (=> start!68220 (=> (not res!251565) (not e!220635))))

(assert (=> start!68220 (= res!251565 (and (bvsle (size!8050 a1!948) (size!8050 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68220 e!220635))

(assert (=> start!68220 true))

(declare-fun array_inv!7662 (array!18575) Bool)

(assert (=> start!68220 (array_inv!7662 a1!948)))

(assert (=> start!68220 (array_inv!7662 a2!948)))

(declare-fun b!306260 () Bool)

(declare-fun lt!439507 () Unit!21364)

(assert (=> b!306260 (= e!220632 lt!439507)))

(declare-fun arrayRangesEqSlicedLemma!274 (array!18575 array!18575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21364)

(assert (=> b!306260 (= lt!439507 (arrayRangesEqSlicedLemma!274 a1!948 a2!948 (_1!13276 lt!439506) (_2!13276 lt!439506) (_1!13276 lt!439509) (_2!13276 lt!439509)))))

(declare-fun arrayRangesEq!1679 (array!18575 array!18575 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306260 (arrayRangesEq!1679 a1!948 a2!948 (_1!13276 lt!439509) (_2!13276 lt!439509))))

(declare-fun b!306267 () Bool)

(assert (=> b!306267 (= e!220635 e!220639)))

(declare-fun res!251568 () Bool)

(assert (=> b!306267 (=> (not res!251568) (not e!220639))))

(assert (=> b!306267 (= res!251568 (and (bvsle toBit!258 lt!439505) (bvsle fromBit!258 lt!439505)))))

(assert (=> b!306267 (= lt!439505 (bvmul ((_ sign_extend 32) (size!8050 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!306268 () Bool)

(declare-fun e!220642 () Bool)

(assert (=> b!306268 (= e!220642 call!5825)))

(declare-fun b!306269 () Bool)

(declare-fun e!220633 () Bool)

(assert (=> b!306269 (= e!220642 e!220633)))

(declare-fun res!251567 () Bool)

(assert (=> b!306269 (= res!251567 (byteRangesEq!0 (select (arr!9133 a1!948) (_3!1578 lt!439506)) (select (arr!9133 a2!948) (_3!1578 lt!439506)) lt!439504 #b00000000000000000000000000000111))))

(assert (=> b!306269 (=> (not res!251567) (not e!220633))))

(declare-fun b!306270 () Bool)

(declare-fun res!251566 () Bool)

(assert (=> b!306270 (=> (not res!251566) (not e!220639))))

(declare-fun arrayBitRangesEq!0 (array!18575 array!18575 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306270 (= res!251566 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306271 () Bool)

(declare-fun lt!439508 () Unit!21364)

(assert (=> b!306271 (= e!220634 lt!439508)))

(assert (=> b!306271 (= lt!439508 (arrayRangesEqImpliesEq!283 a1!948 a2!948 (_1!13276 lt!439506) (_3!1578 lt!439509) (_2!13276 lt!439506)))))

(assert (=> b!306271 (= (select (arr!9133 a1!948) (_3!1578 lt!439509)) (select (arr!9133 a2!948) (_3!1578 lt!439509)))))

(declare-fun b!306272 () Bool)

(assert (=> b!306272 (= e!220639 e!220641)))

(declare-fun res!251562 () Bool)

(assert (=> b!306272 (=> (not res!251562) (not e!220641))))

(assert (=> b!306272 (= res!251562 e!220642)))

(assert (=> b!306272 (= c!14932 (= (_3!1578 lt!439506) (_4!621 lt!439506)))))

(declare-fun lt!439511 () Unit!21364)

(assert (=> b!306272 (= lt!439511 e!220632)))

(declare-fun c!14931 () Bool)

(assert (=> b!306272 (= c!14931 (bvslt (_1!13276 lt!439509) (_2!13276 lt!439509)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1242)

(assert (=> b!306272 (= lt!439509 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306272 (= lt!439510 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306272 (= lt!439504 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306272 (= lt!439506 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306273 () Bool)

(declare-fun res!251563 () Bool)

(assert (=> b!306273 (= res!251563 (= lt!439510 #b00000000000000000000000000000000))))

(declare-fun e!220638 () Bool)

(assert (=> b!306273 (=> res!251563 e!220638)))

(assert (=> b!306273 (= e!220633 e!220638)))

(declare-fun b!306274 () Bool)

(assert (=> b!306274 (= e!220638 call!5825)))

(assert (= (and start!68220 res!251565) b!306267))

(assert (= (and b!306267 res!251568) b!306270))

(assert (= (and b!306270 res!251566) b!306263))

(assert (= (and b!306263 res!251564) b!306272))

(assert (= (and b!306272 c!14931) b!306260))

(assert (= (and b!306272 (not c!14931)) b!306264))

(assert (= (and b!306272 c!14932) b!306268))

(assert (= (and b!306272 (not c!14932)) b!306269))

(assert (= (and b!306269 res!251567) b!306273))

(assert (= (and b!306273 (not res!251563)) b!306274))

(assert (= (or b!306268 b!306274) bm!5822))

(assert (= (and b!306272 res!251562) b!306262))

(assert (= (and b!306262 c!14933) b!306271))

(assert (= (and b!306262 (not c!14933)) b!306266))

(assert (= (and b!306262 c!14934) b!306265))

(assert (= (and b!306262 (not c!14934)) b!306261))

(declare-fun m!444741 () Bool)

(assert (=> b!306260 m!444741))

(declare-fun m!444743 () Bool)

(assert (=> b!306260 m!444743))

(declare-fun m!444745 () Bool)

(assert (=> b!306270 m!444745))

(declare-fun m!444747 () Bool)

(assert (=> b!306269 m!444747))

(declare-fun m!444749 () Bool)

(assert (=> b!306269 m!444749))

(assert (=> b!306269 m!444747))

(assert (=> b!306269 m!444749))

(declare-fun m!444751 () Bool)

(assert (=> b!306269 m!444751))

(declare-fun m!444753 () Bool)

(assert (=> b!306271 m!444753))

(declare-fun m!444755 () Bool)

(assert (=> b!306271 m!444755))

(declare-fun m!444757 () Bool)

(assert (=> b!306271 m!444757))

(declare-fun m!444759 () Bool)

(assert (=> b!306272 m!444759))

(declare-fun m!444761 () Bool)

(assert (=> b!306272 m!444761))

(declare-fun m!444763 () Bool)

(assert (=> bm!5822 m!444763))

(declare-fun m!444765 () Bool)

(assert (=> bm!5822 m!444765))

(assert (=> bm!5822 m!444749))

(assert (=> bm!5822 m!444747))

(declare-fun m!444767 () Bool)

(assert (=> bm!5822 m!444767))

(declare-fun m!444769 () Bool)

(assert (=> b!306265 m!444769))

(declare-fun m!444771 () Bool)

(assert (=> b!306265 m!444771))

(declare-fun m!444773 () Bool)

(assert (=> b!306265 m!444773))

(declare-fun m!444775 () Bool)

(assert (=> start!68220 m!444775))

(declare-fun m!444777 () Bool)

(assert (=> start!68220 m!444777))

(push 1)

(assert (not start!68220))

(assert (not b!306271))

(assert (not b!306269))

(assert (not b!306260))

(assert (not bm!5822))

(assert (not b!306270))

(assert (not b!306272))

(assert (not b!306265))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102224 () Bool)

(assert (=> d!102224 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1243 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306272 d!102224))

(declare-fun d!102226 () Bool)

(assert (=> d!102226 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1243 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306272 d!102226))

(declare-fun d!102228 () Bool)

(assert (=> d!102228 (= (byteRangesEq!0 (select (arr!9133 a1!948) (_3!1578 lt!439506)) (select (arr!9133 a2!948) (_3!1578 lt!439506)) lt!439504 #b00000000000000000000000000000111) (or (= lt!439504 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9133 a1!948) (_3!1578 lt!439506))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439504)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9133 a2!948) (_3!1578 lt!439506))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439504)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26339 () Bool)

(assert (= bs!26339 d!102228))

(declare-fun m!444889 () Bool)

(assert (=> bs!26339 m!444889))

(declare-fun m!444891 () Bool)

(assert (=> bs!26339 m!444891))

(assert (=> b!306269 d!102228))

(declare-fun d!102230 () Bool)

(assert (=> d!102230 (= (array_inv!7662 a1!948) (bvsge (size!8050 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68220 d!102230))

(declare-fun d!102232 () Bool)

(assert (=> d!102232 (= (array_inv!7662 a2!948) (bvsge (size!8050 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68220 d!102232))

(declare-fun d!102234 () Bool)

(declare-fun res!251646 () Bool)

(declare-fun e!220747 () Bool)

(assert (=> d!102234 (=> res!251646 e!220747)))

(assert (=> d!102234 (= res!251646 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102234 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220747)))

(declare-fun b!306406 () Bool)

(declare-fun e!220749 () Bool)

(declare-fun call!5837 () Bool)

(assert (=> b!306406 (= e!220749 call!5837)))

(declare-fun b!306407 () Bool)

(declare-fun e!220745 () Bool)

(assert (=> b!306407 (= e!220745 call!5837)))

(declare-fun b!306408 () Bool)

(declare-fun e!220748 () Bool)

(assert (=> b!306408 (= e!220748 e!220749)))

(declare-fun c!14964 () Bool)

(declare-fun lt!439602 () tuple4!1242)

(assert (=> b!306408 (= c!14964 (= (_3!1578 lt!439602) (_4!621 lt!439602)))))

(declare-fun b!306409 () Bool)

(declare-fun res!251642 () Bool)

(declare-fun lt!439601 () (_ BitVec 32))

(assert (=> b!306409 (= res!251642 (= lt!439601 #b00000000000000000000000000000000))))

(assert (=> b!306409 (=> res!251642 e!220745)))

(declare-fun e!220750 () Bool)

(assert (=> b!306409 (= e!220750 e!220745)))

(declare-fun bm!5834 () Bool)

(declare-fun lt!439603 () (_ BitVec 32))

(assert (=> bm!5834 (= call!5837 (byteRangesEq!0 (ite c!14964 (select (arr!9133 a1!948) (_3!1578 lt!439602)) (select (arr!9133 a1!948) (_4!621 lt!439602))) (ite c!14964 (select (arr!9133 a2!948) (_3!1578 lt!439602)) (select (arr!9133 a2!948) (_4!621 lt!439602))) (ite c!14964 lt!439603 #b00000000000000000000000000000000) lt!439601))))

(declare-fun e!220746 () Bool)

(declare-fun b!306410 () Bool)

(assert (=> b!306410 (= e!220746 (arrayRangesEq!1679 a1!948 a2!948 (_1!13276 lt!439602) (_2!13276 lt!439602)))))

(declare-fun b!306411 () Bool)

(assert (=> b!306411 (= e!220749 e!220750)))

(declare-fun res!251643 () Bool)

(assert (=> b!306411 (= res!251643 (byteRangesEq!0 (select (arr!9133 a1!948) (_3!1578 lt!439602)) (select (arr!9133 a2!948) (_3!1578 lt!439602)) lt!439603 #b00000000000000000000000000001000))))

(assert (=> b!306411 (=> (not res!251643) (not e!220750))))

(declare-fun b!306412 () Bool)

(assert (=> b!306412 (= e!220747 e!220748)))

(declare-fun res!251644 () Bool)

(assert (=> b!306412 (=> (not res!251644) (not e!220748))))

(assert (=> b!306412 (= res!251644 e!220746)))

(declare-fun res!251645 () Bool)

(assert (=> b!306412 (=> res!251645 e!220746)))

(assert (=> b!306412 (= res!251645 (bvsge (_1!13276 lt!439602) (_2!13276 lt!439602)))))

(assert (=> b!306412 (= lt!439601 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306412 (= lt!439603 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306412 (= lt!439602 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and d!102234 (not res!251646)) b!306412))

(assert (= (and b!306412 (not res!251645)) b!306410))

(assert (= (and b!306412 res!251644) b!306408))

(assert (= (and b!306408 c!14964) b!306406))

(assert (= (and b!306408 (not c!14964)) b!306411))

(assert (= (and b!306411 res!251643) b!306409))

(assert (= (and b!306409 (not res!251642)) b!306407))

(assert (= (or b!306406 b!306407) bm!5834))

(declare-fun m!444893 () Bool)

(assert (=> bm!5834 m!444893))

(declare-fun m!444895 () Bool)

(assert (=> bm!5834 m!444895))

(declare-fun m!444897 () Bool)

(assert (=> bm!5834 m!444897))

(declare-fun m!444899 () Bool)

(assert (=> bm!5834 m!444899))

(declare-fun m!444901 () Bool)

(assert (=> bm!5834 m!444901))

(declare-fun m!444903 () Bool)

(assert (=> b!306410 m!444903))

(assert (=> b!306411 m!444901))

(assert (=> b!306411 m!444899))

(assert (=> b!306411 m!444901))

(assert (=> b!306411 m!444899))

(declare-fun m!444905 () Bool)

(assert (=> b!306411 m!444905))

(assert (=> b!306412 m!444761))

(assert (=> b!306270 d!102234))

(declare-fun d!102238 () Bool)

(assert (=> d!102238 (and (bvsge (_4!621 lt!439509) #b00000000000000000000000000000000) (bvslt (_4!621 lt!439509) (size!8050 a1!948)) (bvslt (_4!621 lt!439509) (size!8050 a2!948)) (= (select (arr!9133 a1!948) (_4!621 lt!439509)) (select (arr!9133 a2!948) (_4!621 lt!439509))))))

(declare-fun lt!439606 () Unit!21364)

(declare-fun choose!622 (array!18575 array!18575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21364)

(assert (=> d!102238 (= lt!439606 (choose!622 a1!948 a2!948 (_1!13276 lt!439506) (_4!621 lt!439509) (_2!13276 lt!439506)))))

(assert (=> d!102238 (and (bvsle #b00000000000000000000000000000000 (_1!13276 lt!439506)) (bvsle (_1!13276 lt!439506) (_2!13276 lt!439506)))))

(assert (=> d!102238 (= (arrayRangesEqImpliesEq!283 a1!948 a2!948 (_1!13276 lt!439506) (_4!621 lt!439509) (_2!13276 lt!439506)) lt!439606)))

(declare-fun bs!26340 () Bool)

(assert (= bs!26340 d!102238))

(assert (=> bs!26340 m!444771))

(assert (=> bs!26340 m!444773))

(declare-fun m!444907 () Bool)

(assert (=> bs!26340 m!444907))

(assert (=> b!306265 d!102238))

(declare-fun d!102240 () Bool)

(assert (=> d!102240 (= (byteRangesEq!0 (ite c!14932 (select (arr!9133 a1!948) (_3!1578 lt!439506)) (select (arr!9133 a1!948) (_4!621 lt!439506))) (ite c!14932 (select (arr!9133 a2!948) (_3!1578 lt!439506)) (select (arr!9133 a2!948) (_4!621 lt!439506))) (ite c!14932 lt!439504 #b00000000000000000000000000000000) lt!439510) (or (= (ite c!14932 lt!439504 #b00000000000000000000000000000000) lt!439510) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14932 (select (arr!9133 a1!948) (_3!1578 lt!439506)) (select (arr!9133 a1!948) (_4!621 lt!439506)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439510))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14932 lt!439504 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14932 (select (arr!9133 a2!948) (_3!1578 lt!439506)) (select (arr!9133 a2!948) (_4!621 lt!439506)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439510))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14932 lt!439504 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26341 () Bool)

(assert (= bs!26341 d!102240))

(declare-fun m!444909 () Bool)

(assert (=> bs!26341 m!444909))

(declare-fun m!444911 () Bool)

(assert (=> bs!26341 m!444911))

(assert (=> bm!5822 d!102240))

(declare-fun d!102242 () Bool)

(assert (=> d!102242 (arrayRangesEq!1679 a1!948 a2!948 (_1!13276 lt!439509) (_2!13276 lt!439509))))

(declare-fun lt!439609 () Unit!21364)

(declare-fun choose!623 (array!18575 array!18575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21364)

(assert (=> d!102242 (= lt!439609 (choose!623 a1!948 a2!948 (_1!13276 lt!439506) (_2!13276 lt!439506) (_1!13276 lt!439509) (_2!13276 lt!439509)))))

(assert (=> d!102242 (and (bvsle #b00000000000000000000000000000000 (_1!13276 lt!439506)) (bvsle (_1!13276 lt!439506) (_2!13276 lt!439506)))))

(assert (=> d!102242 (= (arrayRangesEqSlicedLemma!274 a1!948 a2!948 (_1!13276 lt!439506) (_2!13276 lt!439506) (_1!13276 lt!439509) (_2!13276 lt!439509)) lt!439609)))

(declare-fun bs!26343 () Bool)

(assert (= bs!26343 d!102242))

(assert (=> bs!26343 m!444743))

(declare-fun m!444917 () Bool)

(assert (=> bs!26343 m!444917))

(assert (=> b!306260 d!102242))

(declare-fun d!102246 () Bool)

(declare-fun res!251651 () Bool)

(declare-fun e!220755 () Bool)

(assert (=> d!102246 (=> res!251651 e!220755)))

(assert (=> d!102246 (= res!251651 (= (_1!13276 lt!439509) (_2!13276 lt!439509)))))

(assert (=> d!102246 (= (arrayRangesEq!1679 a1!948 a2!948 (_1!13276 lt!439509) (_2!13276 lt!439509)) e!220755)))

(declare-fun b!306417 () Bool)

(declare-fun e!220756 () Bool)

(assert (=> b!306417 (= e!220755 e!220756)))

(declare-fun res!251652 () Bool)

(assert (=> b!306417 (=> (not res!251652) (not e!220756))))

(assert (=> b!306417 (= res!251652 (= (select (arr!9133 a1!948) (_1!13276 lt!439509)) (select (arr!9133 a2!948) (_1!13276 lt!439509))))))

(declare-fun b!306418 () Bool)

(assert (=> b!306418 (= e!220756 (arrayRangesEq!1679 a1!948 a2!948 (bvadd (_1!13276 lt!439509) #b00000000000000000000000000000001) (_2!13276 lt!439509)))))

(assert (= (and d!102246 (not res!251651)) b!306417))

(assert (= (and b!306417 res!251652) b!306418))

(declare-fun m!444919 () Bool)

(assert (=> b!306417 m!444919))

(declare-fun m!444921 () Bool)

(assert (=> b!306417 m!444921))

(declare-fun m!444923 () Bool)

(assert (=> b!306418 m!444923))

(assert (=> b!306260 d!102246))

(declare-fun d!102248 () Bool)

(assert (=> d!102248 (and (bvsge (_3!1578 lt!439509) #b00000000000000000000000000000000) (bvslt (_3!1578 lt!439509) (size!8050 a1!948)) (bvslt (_3!1578 lt!439509) (size!8050 a2!948)) (= (select (arr!9133 a1!948) (_3!1578 lt!439509)) (select (arr!9133 a2!948) (_3!1578 lt!439509))))))

(declare-fun lt!439612 () Unit!21364)

(assert (=> d!102248 (= lt!439612 (choose!622 a1!948 a2!948 (_1!13276 lt!439506) (_3!1578 lt!439509) (_2!13276 lt!439506)))))

(assert (=> d!102248 (and (bvsle #b00000000000000000000000000000000 (_1!13276 lt!439506)) (bvsle (_1!13276 lt!439506) (_2!13276 lt!439506)))))

(assert (=> d!102248 (= (arrayRangesEqImpliesEq!283 a1!948 a2!948 (_1!13276 lt!439506) (_3!1578 lt!439509) (_2!13276 lt!439506)) lt!439612)))

(declare-fun bs!26344 () Bool)

(assert (= bs!26344 d!102248))

(assert (=> bs!26344 m!444755))

(assert (=> bs!26344 m!444757))

(declare-fun m!444925 () Bool)

(assert (=> bs!26344 m!444925))

(assert (=> b!306271 d!102248))

(push 1)

(assert (not bm!5834))

(assert (not d!102238))

(assert (not d!102242))

(assert (not b!306411))

(assert (not b!306412))

(assert (not d!102248))

(assert (not b!306410))

(assert (not b!306418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

