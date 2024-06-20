; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67878 () Bool)

(assert start!67878)

(declare-fun b!304645 () Bool)

(declare-fun res!250574 () Bool)

(declare-fun lt!438466 () (_ BitVec 32))

(assert (=> b!304645 (= res!250574 (= lt!438466 #b00000000000000000000000000000000))))

(declare-fun e!219337 () Bool)

(assert (=> b!304645 (=> res!250574 e!219337)))

(declare-fun e!219344 () Bool)

(assert (=> b!304645 (= e!219344 e!219337)))

(declare-fun b!304646 () Bool)

(declare-fun res!250570 () Bool)

(declare-fun e!219342 () Bool)

(assert (=> b!304646 (=> (not res!250570) (not e!219342))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18506 0))(
  ( (array!18507 (arr!9109 (Array (_ BitVec 32) (_ BitVec 8))) (size!8026 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18506)

(declare-fun a2!948 () array!18506)

(declare-fun arrayBitRangesEq!0 (array!18506 array!18506 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304646 (= res!250570 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304647 () Bool)

(declare-fun e!219341 () Bool)

(declare-datatypes ((tuple4!1194 0))(
  ( (tuple4!1195 (_1!13252 (_ BitVec 32)) (_2!13252 (_ BitVec 32)) (_3!1554 (_ BitVec 32)) (_4!597 (_ BitVec 32))) )
))
(declare-fun lt!438468 () tuple4!1194)

(declare-fun lt!438469 () tuple4!1194)

(assert (=> b!304647 (= e!219341 (and (bvslt (_4!597 lt!438468) (_4!597 lt!438469)) (bvslt (_3!1554 lt!438469) (_4!597 lt!438468)) (or (bvsgt #b00000000000000000000000000000000 (_1!13252 lt!438469)) (bvsgt (_1!13252 lt!438469) (_2!13252 lt!438469)))))))

(declare-datatypes ((Unit!21259 0))(
  ( (Unit!21260) )
))
(declare-fun lt!438464 () Unit!21259)

(declare-fun e!219343 () Unit!21259)

(assert (=> b!304647 (= lt!438464 e!219343)))

(declare-fun c!14621 () Bool)

(assert (=> b!304647 (= c!14621 (and (bvslt (_3!1554 lt!438469) (_3!1554 lt!438468)) (bvslt (_3!1554 lt!438468) (_4!597 lt!438469))))))

(declare-fun b!304648 () Bool)

(declare-fun res!250572 () Bool)

(assert (=> b!304648 (=> (not res!250572) (not e!219342))))

(declare-fun lt!438463 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!304648 (= res!250572 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438463) (not (= fromSlice!52 toSlice!52))))))

(declare-fun c!14622 () Bool)

(declare-fun lt!438471 () (_ BitVec 32))

(declare-fun call!5687 () Bool)

(declare-fun bm!5684 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5684 (= call!5687 (byteRangesEq!0 (ite c!14622 (select (arr!9109 a1!948) (_3!1554 lt!438469)) (select (arr!9109 a1!948) (_4!597 lt!438469))) (ite c!14622 (select (arr!9109 a2!948) (_3!1554 lt!438469)) (select (arr!9109 a2!948) (_4!597 lt!438469))) (ite c!14622 lt!438471 #b00000000000000000000000000000000) lt!438466))))

(declare-fun b!304649 () Bool)

(declare-fun e!219340 () Bool)

(assert (=> b!304649 (= e!219340 e!219342)))

(declare-fun res!250575 () Bool)

(assert (=> b!304649 (=> (not res!250575) (not e!219342))))

(assert (=> b!304649 (= res!250575 (and (bvsle toBit!258 lt!438463) (bvsle fromBit!258 lt!438463)))))

(assert (=> b!304649 (= lt!438463 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8026 a1!948))))))

(declare-fun b!304650 () Bool)

(declare-fun lt!438467 () Unit!21259)

(assert (=> b!304650 (= e!219343 lt!438467)))

(declare-fun arrayRangesEqImpliesEq!259 (array!18506 array!18506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21259)

(assert (=> b!304650 (= lt!438467 (arrayRangesEqImpliesEq!259 a1!948 a2!948 (_1!13252 lt!438469) (_3!1554 lt!438468) (_2!13252 lt!438469)))))

(assert (=> b!304650 (= (select (arr!9109 a1!948) (_3!1554 lt!438468)) (select (arr!9109 a2!948) (_3!1554 lt!438468)))))

(declare-fun res!250573 () Bool)

(assert (=> start!67878 (=> (not res!250573) (not e!219340))))

(assert (=> start!67878 (= res!250573 (and (bvsle (size!8026 a1!948) (size!8026 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67878 e!219340))

(assert (=> start!67878 true))

(declare-fun array_inv!7638 (array!18506) Bool)

(assert (=> start!67878 (array_inv!7638 a1!948)))

(assert (=> start!67878 (array_inv!7638 a2!948)))

(declare-fun b!304651 () Bool)

(declare-fun e!219339 () Bool)

(assert (=> b!304651 (= e!219339 e!219344)))

(declare-fun res!250571 () Bool)

(assert (=> b!304651 (= res!250571 (byteRangesEq!0 (select (arr!9109 a1!948) (_3!1554 lt!438469)) (select (arr!9109 a2!948) (_3!1554 lt!438469)) lt!438471 #b00000000000000000000000000000111))))

(assert (=> b!304651 (=> (not res!250571) (not e!219344))))

(declare-fun b!304652 () Bool)

(assert (=> b!304652 (= e!219337 call!5687)))

(declare-fun b!304653 () Bool)

(assert (=> b!304653 (= e!219342 e!219341)))

(declare-fun res!250569 () Bool)

(assert (=> b!304653 (=> (not res!250569) (not e!219341))))

(assert (=> b!304653 (= res!250569 e!219339)))

(assert (=> b!304653 (= c!14622 (= (_3!1554 lt!438469) (_4!597 lt!438469)))))

(declare-fun lt!438470 () Unit!21259)

(declare-fun e!219338 () Unit!21259)

(assert (=> b!304653 (= lt!438470 e!219338)))

(declare-fun c!14620 () Bool)

(assert (=> b!304653 (= c!14620 (bvslt (_1!13252 lt!438468) (_2!13252 lt!438468)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1194)

(assert (=> b!304653 (= lt!438468 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304653 (= lt!438466 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304653 (= lt!438471 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304653 (= lt!438469 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304654 () Bool)

(declare-fun Unit!21261 () Unit!21259)

(assert (=> b!304654 (= e!219343 Unit!21261)))

(declare-fun b!304655 () Bool)

(assert (=> b!304655 (= e!219339 call!5687)))

(declare-fun b!304656 () Bool)

(declare-fun Unit!21262 () Unit!21259)

(assert (=> b!304656 (= e!219338 Unit!21262)))

(declare-fun b!304657 () Bool)

(declare-fun lt!438465 () Unit!21259)

(assert (=> b!304657 (= e!219338 lt!438465)))

(declare-fun arrayRangesEqSlicedLemma!250 (array!18506 array!18506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21259)

(assert (=> b!304657 (= lt!438465 (arrayRangesEqSlicedLemma!250 a1!948 a2!948 (_1!13252 lt!438469) (_2!13252 lt!438469) (_1!13252 lt!438468) (_2!13252 lt!438468)))))

(declare-fun arrayRangesEq!1655 (array!18506 array!18506 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304657 (arrayRangesEq!1655 a1!948 a2!948 (_1!13252 lt!438468) (_2!13252 lt!438468))))

(assert (= (and start!67878 res!250573) b!304649))

(assert (= (and b!304649 res!250575) b!304646))

(assert (= (and b!304646 res!250570) b!304648))

(assert (= (and b!304648 res!250572) b!304653))

(assert (= (and b!304653 c!14620) b!304657))

(assert (= (and b!304653 (not c!14620)) b!304656))

(assert (= (and b!304653 c!14622) b!304655))

(assert (= (and b!304653 (not c!14622)) b!304651))

(assert (= (and b!304651 res!250571) b!304645))

(assert (= (and b!304645 (not res!250574)) b!304652))

(assert (= (or b!304655 b!304652) bm!5684))

(assert (= (and b!304653 res!250569) b!304647))

(assert (= (and b!304647 c!14621) b!304650))

(assert (= (and b!304647 (not c!14621)) b!304654))

(declare-fun m!443139 () Bool)

(assert (=> b!304653 m!443139))

(declare-fun m!443141 () Bool)

(assert (=> b!304653 m!443141))

(declare-fun m!443143 () Bool)

(assert (=> b!304646 m!443143))

(declare-fun m!443145 () Bool)

(assert (=> b!304651 m!443145))

(declare-fun m!443147 () Bool)

(assert (=> b!304651 m!443147))

(assert (=> b!304651 m!443145))

(assert (=> b!304651 m!443147))

(declare-fun m!443149 () Bool)

(assert (=> b!304651 m!443149))

(assert (=> bm!5684 m!443145))

(declare-fun m!443151 () Bool)

(assert (=> bm!5684 m!443151))

(assert (=> bm!5684 m!443147))

(declare-fun m!443153 () Bool)

(assert (=> bm!5684 m!443153))

(declare-fun m!443155 () Bool)

(assert (=> bm!5684 m!443155))

(declare-fun m!443157 () Bool)

(assert (=> start!67878 m!443157))

(declare-fun m!443159 () Bool)

(assert (=> start!67878 m!443159))

(declare-fun m!443161 () Bool)

(assert (=> b!304650 m!443161))

(declare-fun m!443163 () Bool)

(assert (=> b!304650 m!443163))

(declare-fun m!443165 () Bool)

(assert (=> b!304650 m!443165))

(declare-fun m!443167 () Bool)

(assert (=> b!304657 m!443167))

(declare-fun m!443169 () Bool)

(assert (=> b!304657 m!443169))

(push 1)

(assert (not b!304653))

(assert (not bm!5684))

(assert (not b!304650))

(assert (not b!304646))

(assert (not b!304657))

(assert (not start!67878))

(assert (not b!304651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101750 () Bool)

(assert (=> d!101750 (and (bvsge (_3!1554 lt!438468) #b00000000000000000000000000000000) (bvslt (_3!1554 lt!438468) (size!8026 a1!948)) (bvslt (_3!1554 lt!438468) (size!8026 a2!948)) (= (select (arr!9109 a1!948) (_3!1554 lt!438468)) (select (arr!9109 a2!948) (_3!1554 lt!438468))))))

(declare-fun lt!438543 () Unit!21259)

(declare-fun choose!580 (array!18506 array!18506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21259)

(assert (=> d!101750 (= lt!438543 (choose!580 a1!948 a2!948 (_1!13252 lt!438469) (_3!1554 lt!438468) (_2!13252 lt!438469)))))

(assert (=> d!101750 (and (bvsle #b00000000000000000000000000000000 (_1!13252 lt!438469)) (bvsle (_1!13252 lt!438469) (_2!13252 lt!438469)))))

(assert (=> d!101750 (= (arrayRangesEqImpliesEq!259 a1!948 a2!948 (_1!13252 lt!438469) (_3!1554 lt!438468) (_2!13252 lt!438469)) lt!438543)))

(declare-fun bs!26218 () Bool)

(assert (= bs!26218 d!101750))

(assert (=> bs!26218 m!443163))

(assert (=> bs!26218 m!443165))

(declare-fun m!443267 () Bool)

(assert (=> bs!26218 m!443267))

(assert (=> b!304650 d!101750))

(declare-fun b!304777 () Bool)

(declare-fun e!219448 () Bool)

(declare-fun lt!438551 () tuple4!1194)

(assert (=> b!304777 (= e!219448 (arrayRangesEq!1655 a1!948 a2!948 (_1!13252 lt!438551) (_2!13252 lt!438551)))))

(declare-fun e!219446 () Bool)

(declare-fun b!304778 () Bool)

(declare-fun lt!438550 () (_ BitVec 32))

(assert (=> b!304778 (= e!219446 (byteRangesEq!0 (select (arr!9109 a1!948) (_4!597 lt!438551)) (select (arr!9109 a2!948) (_4!597 lt!438551)) #b00000000000000000000000000000000 lt!438550))))

(declare-fun b!304779 () Bool)

(declare-fun e!219445 () Bool)

(declare-fun e!219443 () Bool)

(assert (=> b!304779 (= e!219445 e!219443)))

(declare-fun res!250653 () Bool)

(assert (=> b!304779 (=> (not res!250653) (not e!219443))))

(assert (=> b!304779 (= res!250653 e!219448)))

(declare-fun res!250652 () Bool)

(assert (=> b!304779 (=> res!250652 e!219448)))

(assert (=> b!304779 (= res!250652 (bvsge (_1!13252 lt!438551) (_2!13252 lt!438551)))))

(assert (=> b!304779 (= lt!438550 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438552 () (_ BitVec 32))

(assert (=> b!304779 (= lt!438552 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304779 (= lt!438551 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun call!5699 () Bool)

(declare-fun bm!5696 () Bool)

(declare-fun c!14646 () Bool)

(assert (=> bm!5696 (= call!5699 (byteRangesEq!0 (select (arr!9109 a1!948) (_3!1554 lt!438551)) (select (arr!9109 a2!948) (_3!1554 lt!438551)) lt!438552 (ite c!14646 lt!438550 #b00000000000000000000000000001000)))))

(declare-fun d!101752 () Bool)

(declare-fun res!250650 () Bool)

(assert (=> d!101752 (=> res!250650 e!219445)))

(assert (=> d!101752 (= res!250650 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101752 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219445)))

(declare-fun b!304780 () Bool)

(declare-fun e!219447 () Bool)

(assert (=> b!304780 (= e!219443 e!219447)))

(assert (=> b!304780 (= c!14646 (= (_3!1554 lt!438551) (_4!597 lt!438551)))))

(declare-fun b!304781 () Bool)

(declare-fun res!250651 () Bool)

(assert (=> b!304781 (= res!250651 (= lt!438550 #b00000000000000000000000000000000))))

(assert (=> b!304781 (=> res!250651 e!219446)))

(declare-fun e!219444 () Bool)

(assert (=> b!304781 (= e!219444 e!219446)))

(declare-fun b!304782 () Bool)

(assert (=> b!304782 (= e!219447 call!5699)))

(declare-fun b!304783 () Bool)

(assert (=> b!304783 (= e!219447 e!219444)))

(declare-fun res!250649 () Bool)

(assert (=> b!304783 (= res!250649 call!5699)))

(assert (=> b!304783 (=> (not res!250649) (not e!219444))))

(assert (= (and d!101752 (not res!250650)) b!304779))

(assert (= (and b!304779 (not res!250652)) b!304777))

(assert (= (and b!304779 res!250653) b!304780))

(assert (= (and b!304780 c!14646) b!304782))

(assert (= (and b!304780 (not c!14646)) b!304783))

(assert (= (and b!304783 res!250649) b!304781))

(assert (= (and b!304781 (not res!250651)) b!304778))

(assert (= (or b!304782 b!304783) bm!5696))

(declare-fun m!443269 () Bool)

(assert (=> b!304777 m!443269))

(declare-fun m!443271 () Bool)

(assert (=> b!304778 m!443271))

(declare-fun m!443273 () Bool)

(assert (=> b!304778 m!443273))

(assert (=> b!304778 m!443271))

(assert (=> b!304778 m!443273))

(declare-fun m!443275 () Bool)

(assert (=> b!304778 m!443275))

(assert (=> b!304779 m!443141))

(declare-fun m!443277 () Bool)

(assert (=> bm!5696 m!443277))

(declare-fun m!443279 () Bool)

(assert (=> bm!5696 m!443279))

(assert (=> bm!5696 m!443277))

(assert (=> bm!5696 m!443279))

(declare-fun m!443281 () Bool)

(assert (=> bm!5696 m!443281))

(assert (=> b!304646 d!101752))

(declare-fun d!101756 () Bool)

(assert (=> d!101756 (= (byteRangesEq!0 (select (arr!9109 a1!948) (_3!1554 lt!438469)) (select (arr!9109 a2!948) (_3!1554 lt!438469)) lt!438471 #b00000000000000000000000000000111) (or (= lt!438471 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9109 a1!948) (_3!1554 lt!438469))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438471)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9109 a2!948) (_3!1554 lt!438469))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438471)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26219 () Bool)

(assert (= bs!26219 d!101756))

(declare-fun m!443283 () Bool)

(assert (=> bs!26219 m!443283))

(declare-fun m!443289 () Bool)

(assert (=> bs!26219 m!443289))

(assert (=> b!304651 d!101756))

(declare-fun d!101758 () Bool)

(assert (=> d!101758 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1195 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304653 d!101758))

(declare-fun d!101766 () Bool)

(assert (=> d!101766 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1195 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304653 d!101766))

(declare-fun d!101768 () Bool)

(assert (=> d!101768 (= (array_inv!7638 a1!948) (bvsge (size!8026 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67878 d!101768))

(declare-fun d!101770 () Bool)

(assert (=> d!101770 (= (array_inv!7638 a2!948) (bvsge (size!8026 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67878 d!101770))

(declare-fun d!101772 () Bool)

(assert (=> d!101772 (= (byteRangesEq!0 (ite c!14622 (select (arr!9109 a1!948) (_3!1554 lt!438469)) (select (arr!9109 a1!948) (_4!597 lt!438469))) (ite c!14622 (select (arr!9109 a2!948) (_3!1554 lt!438469)) (select (arr!9109 a2!948) (_4!597 lt!438469))) (ite c!14622 lt!438471 #b00000000000000000000000000000000) lt!438466) (or (= (ite c!14622 lt!438471 #b00000000000000000000000000000000) lt!438466) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14622 (select (arr!9109 a1!948) (_3!1554 lt!438469)) (select (arr!9109 a1!948) (_4!597 lt!438469)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438466))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14622 lt!438471 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14622 (select (arr!9109 a2!948) (_3!1554 lt!438469)) (select (arr!9109 a2!948) (_4!597 lt!438469)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438466))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14622 lt!438471 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26220 () Bool)

(assert (= bs!26220 d!101772))

(declare-fun m!443301 () Bool)

(assert (=> bs!26220 m!443301))

(declare-fun m!443303 () Bool)

(assert (=> bs!26220 m!443303))

(assert (=> bm!5684 d!101772))

(declare-fun d!101774 () Bool)

(assert (=> d!101774 (arrayRangesEq!1655 a1!948 a2!948 (_1!13252 lt!438468) (_2!13252 lt!438468))))

(declare-fun lt!438567 () Unit!21259)

(declare-fun choose!582 (array!18506 array!18506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21259)

(assert (=> d!101774 (= lt!438567 (choose!582 a1!948 a2!948 (_1!13252 lt!438469) (_2!13252 lt!438469) (_1!13252 lt!438468) (_2!13252 lt!438468)))))

(assert (=> d!101774 (and (bvsle #b00000000000000000000000000000000 (_1!13252 lt!438469)) (bvsle (_1!13252 lt!438469) (_2!13252 lt!438469)))))

(assert (=> d!101774 (= (arrayRangesEqSlicedLemma!250 a1!948 a2!948 (_1!13252 lt!438469) (_2!13252 lt!438469) (_1!13252 lt!438468) (_2!13252 lt!438468)) lt!438567)))

(declare-fun bs!26222 () Bool)

(assert (= bs!26222 d!101774))

(assert (=> bs!26222 m!443169))

(declare-fun m!443313 () Bool)

(assert (=> bs!26222 m!443313))

(assert (=> b!304657 d!101774))

(declare-fun d!101780 () Bool)

(declare-fun res!250679 () Bool)

(declare-fun e!219477 () Bool)

(assert (=> d!101780 (=> res!250679 e!219477)))

(assert (=> d!101780 (= res!250679 (= (_1!13252 lt!438468) (_2!13252 lt!438468)))))

(assert (=> d!101780 (= (arrayRangesEq!1655 a1!948 a2!948 (_1!13252 lt!438468) (_2!13252 lt!438468)) e!219477)))

(declare-fun b!304815 () Bool)

(declare-fun e!219478 () Bool)

(assert (=> b!304815 (= e!219477 e!219478)))

(declare-fun res!250680 () Bool)

(assert (=> b!304815 (=> (not res!250680) (not e!219478))))

(assert (=> b!304815 (= res!250680 (= (select (arr!9109 a1!948) (_1!13252 lt!438468)) (select (arr!9109 a2!948) (_1!13252 lt!438468))))))

(declare-fun b!304816 () Bool)

(assert (=> b!304816 (= e!219478 (arrayRangesEq!1655 a1!948 a2!948 (bvadd (_1!13252 lt!438468) #b00000000000000000000000000000001) (_2!13252 lt!438468)))))

(assert (= (and d!101780 (not res!250679)) b!304815))

(assert (= (and b!304815 res!250680) b!304816))

(declare-fun m!443315 () Bool)

(assert (=> b!304815 m!443315))

(declare-fun m!443317 () Bool)

(assert (=> b!304815 m!443317))

(declare-fun m!443319 () Bool)

(assert (=> b!304816 m!443319))

(assert (=> b!304657 d!101780))

(push 1)

(assert (not bm!5696))

(assert (not b!304777))

(assert (not b!304778))

(assert (not d!101774))

(assert (not d!101750))

(assert (not b!304779))

(assert (not b!304816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

