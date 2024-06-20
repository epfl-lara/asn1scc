; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67150 () Bool)

(assert start!67150)

(declare-fun b!301633 () Bool)

(declare-fun res!248323 () Bool)

(declare-fun e!216645 () Bool)

(assert (=> b!301633 (=> (not res!248323) (not e!216645))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18276 0))(
  ( (array!18277 (arr!9021 (Array (_ BitVec 32) (_ BitVec 8))) (size!7938 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18276)

(declare-fun a2!948 () array!18276)

(declare-fun arrayBitRangesEq!0 (array!18276 array!18276 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301633 (= res!248323 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301634 () Bool)

(declare-datatypes ((Unit!21125 0))(
  ( (Unit!21126) )
))
(declare-fun e!216640 () Unit!21125)

(declare-fun lt!436821 () Unit!21125)

(assert (=> b!301634 (= e!216640 lt!436821)))

(declare-datatypes ((tuple4!1084 0))(
  ( (tuple4!1085 (_1!13197 (_ BitVec 32)) (_2!13197 (_ BitVec 32)) (_3!1499 (_ BitVec 32)) (_4!542 (_ BitVec 32))) )
))
(declare-fun lt!436820 () tuple4!1084)

(declare-fun lt!436814 () tuple4!1084)

(declare-fun arrayRangesEqImpliesEq!252 (array!18276 array!18276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21125)

(assert (=> b!301634 (= lt!436821 (arrayRangesEqImpliesEq!252 a1!948 a2!948 (_1!13197 lt!436814) (_3!1499 lt!436820) (_2!13197 lt!436814)))))

(assert (=> b!301634 (= (select (arr!9021 a1!948) (_3!1499 lt!436820)) (select (arr!9021 a2!948) (_3!1499 lt!436820)))))

(declare-fun res!248325 () Bool)

(declare-fun e!216644 () Bool)

(assert (=> start!67150 (=> (not res!248325) (not e!216644))))

(assert (=> start!67150 (= res!248325 (and (bvsle (size!7938 a1!948) (size!7938 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67150 e!216644))

(assert (=> start!67150 true))

(declare-fun array_inv!7550 (array!18276) Bool)

(assert (=> start!67150 (array_inv!7550 a1!948)))

(assert (=> start!67150 (array_inv!7550 a2!948)))

(declare-fun b!301635 () Bool)

(declare-fun Unit!21127 () Unit!21125)

(assert (=> b!301635 (= e!216640 Unit!21127)))

(declare-fun b!301636 () Bool)

(declare-fun res!248326 () Bool)

(assert (=> b!301636 (=> (not res!248326) (not e!216645))))

(declare-fun lt!436818 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!301636 (= res!248326 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436818) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301637 () Bool)

(declare-fun e!216638 () Unit!21125)

(declare-fun lt!436819 () Unit!21125)

(assert (=> b!301637 (= e!216638 lt!436819)))

(assert (=> b!301637 (= lt!436819 (arrayRangesEqImpliesEq!252 a1!948 a2!948 (_1!13197 lt!436814) (_4!542 lt!436820) (_2!13197 lt!436814)))))

(assert (=> b!301637 (= (select (arr!9021 a1!948) (_4!542 lt!436820)) (select (arr!9021 a2!948) (_4!542 lt!436820)))))

(declare-fun b!301638 () Bool)

(declare-fun e!216636 () Bool)

(declare-fun call!5465 () Bool)

(assert (=> b!301638 (= e!216636 call!5465)))

(declare-fun b!301639 () Bool)

(declare-fun e!216646 () Bool)

(assert (=> b!301639 (= e!216646 call!5465)))

(declare-fun b!301640 () Bool)

(declare-fun e!216637 () Unit!21125)

(declare-fun Unit!21128 () Unit!21125)

(assert (=> b!301640 (= e!216637 Unit!21128)))

(declare-fun b!301641 () Bool)

(declare-fun e!216635 () Bool)

(assert (=> b!301641 (= e!216645 e!216635)))

(declare-fun res!248327 () Bool)

(assert (=> b!301641 (=> (not res!248327) (not e!216635))))

(assert (=> b!301641 (= res!248327 e!216646)))

(declare-fun c!14239 () Bool)

(assert (=> b!301641 (= c!14239 (= (_3!1499 lt!436814) (_4!542 lt!436814)))))

(declare-fun lt!436817 () Unit!21125)

(assert (=> b!301641 (= lt!436817 e!216637)))

(declare-fun c!14241 () Bool)

(assert (=> b!301641 (= c!14241 (bvslt (_1!13197 lt!436820) (_2!13197 lt!436820)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1084)

(assert (=> b!301641 (= lt!436820 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!436815 () (_ BitVec 32))

(assert (=> b!301641 (= lt!436815 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436816 () (_ BitVec 32))

(assert (=> b!301641 (= lt!436816 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301641 (= lt!436814 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301642 () Bool)

(declare-fun e!216642 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301642 (= e!216642 (not (byteRangesEq!0 (select (arr!9021 a1!948) (_3!1499 lt!436820)) (select (arr!9021 a2!948) (_3!1499 lt!436820)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun b!301643 () Bool)

(declare-fun e!216639 () Bool)

(assert (=> b!301643 (= e!216646 e!216639)))

(declare-fun res!248328 () Bool)

(assert (=> b!301643 (= res!248328 (byteRangesEq!0 (select (arr!9021 a1!948) (_3!1499 lt!436814)) (select (arr!9021 a2!948) (_3!1499 lt!436814)) lt!436816 #b00000000000000000000000000000111))))

(assert (=> b!301643 (=> (not res!248328) (not e!216639))))

(declare-fun b!301644 () Bool)

(declare-fun lt!436823 () Unit!21125)

(assert (=> b!301644 (= e!216637 lt!436823)))

(declare-fun arrayRangesEqSlicedLemma!210 (array!18276 array!18276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21125)

(assert (=> b!301644 (= lt!436823 (arrayRangesEqSlicedLemma!210 a1!948 a2!948 (_1!13197 lt!436814) (_2!13197 lt!436814) (_1!13197 lt!436820) (_2!13197 lt!436820)))))

(declare-fun arrayRangesEq!1600 (array!18276 array!18276 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301644 (arrayRangesEq!1600 a1!948 a2!948 (_1!13197 lt!436820) (_2!13197 lt!436820))))

(declare-fun b!301645 () Bool)

(declare-fun Unit!21129 () Unit!21125)

(assert (=> b!301645 (= e!216638 Unit!21129)))

(declare-fun b!301646 () Bool)

(assert (=> b!301646 (= e!216635 e!216642)))

(declare-fun res!248322 () Bool)

(assert (=> b!301646 (=> (not res!248322) (not e!216642))))

(assert (=> b!301646 (= res!248322 (= (_3!1499 lt!436820) (_4!542 lt!436820)))))

(declare-fun lt!436822 () Unit!21125)

(assert (=> b!301646 (= lt!436822 e!216638)))

(declare-fun c!14238 () Bool)

(assert (=> b!301646 (= c!14238 (and (bvslt (_4!542 lt!436820) (_4!542 lt!436814)) (bvslt (_3!1499 lt!436814) (_4!542 lt!436820))))))

(declare-fun lt!436824 () Unit!21125)

(assert (=> b!301646 (= lt!436824 e!216640)))

(declare-fun c!14240 () Bool)

(assert (=> b!301646 (= c!14240 (and (bvslt (_3!1499 lt!436814) (_3!1499 lt!436820)) (bvslt (_3!1499 lt!436820) (_4!542 lt!436814))))))

(declare-fun b!301647 () Bool)

(assert (=> b!301647 (= e!216644 e!216645)))

(declare-fun res!248324 () Bool)

(assert (=> b!301647 (=> (not res!248324) (not e!216645))))

(assert (=> b!301647 (= res!248324 (and (bvsle toBit!258 lt!436818) (bvsle fromBit!258 lt!436818)))))

(assert (=> b!301647 (= lt!436818 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7938 a1!948))))))

(declare-fun b!301648 () Bool)

(declare-fun res!248321 () Bool)

(assert (=> b!301648 (= res!248321 (= lt!436815 #b00000000000000000000000000000000))))

(assert (=> b!301648 (=> res!248321 e!216636)))

(assert (=> b!301648 (= e!216639 e!216636)))

(declare-fun bm!5462 () Bool)

(assert (=> bm!5462 (= call!5465 (byteRangesEq!0 (ite c!14239 (select (arr!9021 a1!948) (_3!1499 lt!436814)) (select (arr!9021 a1!948) (_4!542 lt!436814))) (ite c!14239 (select (arr!9021 a2!948) (_3!1499 lt!436814)) (select (arr!9021 a2!948) (_4!542 lt!436814))) (ite c!14239 lt!436816 #b00000000000000000000000000000000) lt!436815))))

(assert (= (and start!67150 res!248325) b!301647))

(assert (= (and b!301647 res!248324) b!301633))

(assert (= (and b!301633 res!248323) b!301636))

(assert (= (and b!301636 res!248326) b!301641))

(assert (= (and b!301641 c!14241) b!301644))

(assert (= (and b!301641 (not c!14241)) b!301640))

(assert (= (and b!301641 c!14239) b!301639))

(assert (= (and b!301641 (not c!14239)) b!301643))

(assert (= (and b!301643 res!248328) b!301648))

(assert (= (and b!301648 (not res!248321)) b!301638))

(assert (= (or b!301639 b!301638) bm!5462))

(assert (= (and b!301641 res!248327) b!301646))

(assert (= (and b!301646 c!14240) b!301634))

(assert (= (and b!301646 (not c!14240)) b!301635))

(assert (= (and b!301646 c!14238) b!301637))

(assert (= (and b!301646 (not c!14238)) b!301645))

(assert (= (and b!301646 res!248322) b!301642))

(declare-fun m!440447 () Bool)

(assert (=> b!301637 m!440447))

(declare-fun m!440449 () Bool)

(assert (=> b!301637 m!440449))

(declare-fun m!440451 () Bool)

(assert (=> b!301637 m!440451))

(declare-fun m!440453 () Bool)

(assert (=> bm!5462 m!440453))

(declare-fun m!440455 () Bool)

(assert (=> bm!5462 m!440455))

(declare-fun m!440457 () Bool)

(assert (=> bm!5462 m!440457))

(declare-fun m!440459 () Bool)

(assert (=> bm!5462 m!440459))

(declare-fun m!440461 () Bool)

(assert (=> bm!5462 m!440461))

(declare-fun m!440463 () Bool)

(assert (=> b!301644 m!440463))

(declare-fun m!440465 () Bool)

(assert (=> b!301644 m!440465))

(declare-fun m!440467 () Bool)

(assert (=> b!301641 m!440467))

(declare-fun m!440469 () Bool)

(assert (=> b!301641 m!440469))

(declare-fun m!440471 () Bool)

(assert (=> start!67150 m!440471))

(declare-fun m!440473 () Bool)

(assert (=> start!67150 m!440473))

(declare-fun m!440475 () Bool)

(assert (=> b!301633 m!440475))

(assert (=> b!301643 m!440457))

(assert (=> b!301643 m!440453))

(assert (=> b!301643 m!440457))

(assert (=> b!301643 m!440453))

(declare-fun m!440477 () Bool)

(assert (=> b!301643 m!440477))

(declare-fun m!440479 () Bool)

(assert (=> b!301642 m!440479))

(declare-fun m!440481 () Bool)

(assert (=> b!301642 m!440481))

(assert (=> b!301642 m!440479))

(assert (=> b!301642 m!440481))

(declare-fun m!440483 () Bool)

(assert (=> b!301642 m!440483))

(declare-fun m!440485 () Bool)

(assert (=> b!301634 m!440485))

(assert (=> b!301634 m!440479))

(assert (=> b!301634 m!440481))

(push 1)

(assert (not b!301633))

(assert (not bm!5462))

(assert (not b!301637))

(assert (not b!301641))

(assert (not start!67150))

(assert (not b!301642))

(assert (not b!301644))

(assert (not b!301634))

(assert (not b!301643))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100846 () Bool)

(assert (=> d!100846 (and (bvsge (_3!1499 lt!436820) #b00000000000000000000000000000000) (bvslt (_3!1499 lt!436820) (size!7938 a1!948)) (bvslt (_3!1499 lt!436820) (size!7938 a2!948)) (= (select (arr!9021 a1!948) (_3!1499 lt!436820)) (select (arr!9021 a2!948) (_3!1499 lt!436820))))))

(declare-fun lt!436856 () Unit!21125)

(declare-fun choose!534 (array!18276 array!18276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21125)

(assert (=> d!100846 (= lt!436856 (choose!534 a1!948 a2!948 (_1!13197 lt!436814) (_3!1499 lt!436820) (_2!13197 lt!436814)))))

(assert (=> d!100846 (and (bvsle #b00000000000000000000000000000000 (_1!13197 lt!436814)) (bvsle (_1!13197 lt!436814) (_2!13197 lt!436814)))))

(assert (=> d!100846 (= (arrayRangesEqImpliesEq!252 a1!948 a2!948 (_1!13197 lt!436814) (_3!1499 lt!436820) (_2!13197 lt!436814)) lt!436856)))

(declare-fun bs!26011 () Bool)

(assert (= bs!26011 d!100846))

(assert (=> bs!26011 m!440479))

(assert (=> bs!26011 m!440481))

(declare-fun m!440551 () Bool)

(assert (=> bs!26011 m!440551))

(assert (=> b!301634 d!100846))

(declare-fun d!100858 () Bool)

(assert (=> d!100858 (= (array_inv!7550 a1!948) (bvsge (size!7938 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67150 d!100858))

(declare-fun d!100860 () Bool)

(assert (=> d!100860 (= (array_inv!7550 a2!948) (bvsge (size!7938 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67150 d!100860))

(declare-fun d!100864 () Bool)

(assert (=> d!100864 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1085 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301641 d!100864))

(declare-fun d!100868 () Bool)

(assert (=> d!100868 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1085 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301641 d!100868))

(declare-fun d!100870 () Bool)

(assert (=> d!100870 (= (byteRangesEq!0 (select (arr!9021 a1!948) (_3!1499 lt!436820)) (select (arr!9021 a2!948) (_3!1499 lt!436820)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9021 a1!948) (_3!1499 lt!436820))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9021 a2!948) (_3!1499 lt!436820))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26014 () Bool)

(assert (= bs!26014 d!100870))

(declare-fun m!440565 () Bool)

(assert (=> bs!26014 m!440565))

(declare-fun m!440567 () Bool)

(assert (=> bs!26014 m!440567))

(assert (=> b!301642 d!100870))

(declare-fun d!100872 () Bool)

(assert (=> d!100872 (and (bvsge (_4!542 lt!436820) #b00000000000000000000000000000000) (bvslt (_4!542 lt!436820) (size!7938 a1!948)) (bvslt (_4!542 lt!436820) (size!7938 a2!948)) (= (select (arr!9021 a1!948) (_4!542 lt!436820)) (select (arr!9021 a2!948) (_4!542 lt!436820))))))

(declare-fun lt!436860 () Unit!21125)

(assert (=> d!100872 (= lt!436860 (choose!534 a1!948 a2!948 (_1!13197 lt!436814) (_4!542 lt!436820) (_2!13197 lt!436814)))))

(assert (=> d!100872 (and (bvsle #b00000000000000000000000000000000 (_1!13197 lt!436814)) (bvsle (_1!13197 lt!436814) (_2!13197 lt!436814)))))

(assert (=> d!100872 (= (arrayRangesEqImpliesEq!252 a1!948 a2!948 (_1!13197 lt!436814) (_4!542 lt!436820) (_2!13197 lt!436814)) lt!436860)))

(declare-fun bs!26015 () Bool)

(assert (= bs!26015 d!100872))

(assert (=> bs!26015 m!440449))

(assert (=> bs!26015 m!440451))

(declare-fun m!440569 () Bool)

(assert (=> bs!26015 m!440569))

(assert (=> b!301637 d!100872))

(declare-fun d!100874 () Bool)

(assert (=> d!100874 (= (byteRangesEq!0 (select (arr!9021 a1!948) (_3!1499 lt!436814)) (select (arr!9021 a2!948) (_3!1499 lt!436814)) lt!436816 #b00000000000000000000000000000111) (or (= lt!436816 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9021 a1!948) (_3!1499 lt!436814))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436816)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9021 a2!948) (_3!1499 lt!436814))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436816)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26016 () Bool)

(assert (= bs!26016 d!100874))

(declare-fun m!440571 () Bool)

(assert (=> bs!26016 m!440571))

(declare-fun m!440573 () Bool)

(assert (=> bs!26016 m!440573))

(assert (=> b!301643 d!100874))

(declare-fun b!301717 () Bool)

(declare-fun res!248381 () Bool)

(declare-fun lt!436867 () (_ BitVec 32))

(assert (=> b!301717 (= res!248381 (= lt!436867 #b00000000000000000000000000000000))))

(declare-fun e!216707 () Bool)

(assert (=> b!301717 (=> res!248381 e!216707)))

(declare-fun e!216712 () Bool)

(assert (=> b!301717 (= e!216712 e!216707)))

(declare-fun b!301718 () Bool)

(declare-fun e!216711 () Bool)

(assert (=> b!301718 (= e!216711 e!216712)))

(declare-fun res!248382 () Bool)

(declare-fun call!5474 () Bool)

(assert (=> b!301718 (= res!248382 call!5474)))

(assert (=> b!301718 (=> (not res!248382) (not e!216712))))

(declare-fun b!301719 () Bool)

(declare-fun e!216710 () Bool)

(assert (=> b!301719 (= e!216710 e!216711)))

(declare-fun c!14250 () Bool)

(declare-fun lt!436868 () tuple4!1084)

(assert (=> b!301719 (= c!14250 (= (_3!1499 lt!436868) (_4!542 lt!436868)))))

(declare-fun b!301720 () Bool)

(declare-fun e!216709 () Bool)

(assert (=> b!301720 (= e!216709 e!216710)))

(declare-fun res!248383 () Bool)

(assert (=> b!301720 (=> (not res!248383) (not e!216710))))

(declare-fun e!216708 () Bool)

(assert (=> b!301720 (= res!248383 e!216708)))

(declare-fun res!248385 () Bool)

(assert (=> b!301720 (=> res!248385 e!216708)))

(assert (=> b!301720 (= res!248385 (bvsge (_1!13197 lt!436868) (_2!13197 lt!436868)))))

(assert (=> b!301720 (= lt!436867 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!436869 () (_ BitVec 32))

(assert (=> b!301720 (= lt!436869 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301720 (= lt!436868 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301721 () Bool)

(assert (=> b!301721 (= e!216711 call!5474)))

(declare-fun b!301722 () Bool)

(assert (=> b!301722 (= e!216708 (arrayRangesEq!1600 a1!948 a2!948 (_1!13197 lt!436868) (_2!13197 lt!436868)))))

(declare-fun b!301723 () Bool)

(assert (=> b!301723 (= e!216707 (byteRangesEq!0 (select (arr!9021 a1!948) (_4!542 lt!436868)) (select (arr!9021 a2!948) (_4!542 lt!436868)) #b00000000000000000000000000000000 lt!436867))))

(declare-fun d!100876 () Bool)

(declare-fun res!248384 () Bool)

(assert (=> d!100876 (=> res!248384 e!216709)))

(assert (=> d!100876 (= res!248384 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100876 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!216709)))

(declare-fun bm!5471 () Bool)

(assert (=> bm!5471 (= call!5474 (byteRangesEq!0 (select (arr!9021 a1!948) (_3!1499 lt!436868)) (select (arr!9021 a2!948) (_3!1499 lt!436868)) lt!436869 (ite c!14250 lt!436867 #b00000000000000000000000000001000)))))

(assert (= (and d!100876 (not res!248384)) b!301720))

(assert (= (and b!301720 (not res!248385)) b!301722))

(assert (= (and b!301720 res!248383) b!301719))

(assert (= (and b!301719 c!14250) b!301721))

(assert (= (and b!301719 (not c!14250)) b!301718))

(assert (= (and b!301718 res!248382) b!301717))

(assert (= (and b!301717 (not res!248381)) b!301723))

(assert (= (or b!301721 b!301718) bm!5471))

(assert (=> b!301720 m!440469))

(declare-fun m!440575 () Bool)

(assert (=> b!301722 m!440575))

(declare-fun m!440577 () Bool)

(assert (=> b!301723 m!440577))

(declare-fun m!440579 () Bool)

(assert (=> b!301723 m!440579))

(assert (=> b!301723 m!440577))

(assert (=> b!301723 m!440579))

(declare-fun m!440581 () Bool)

(assert (=> b!301723 m!440581))

(declare-fun m!440583 () Bool)

(assert (=> bm!5471 m!440583))

(declare-fun m!440585 () Bool)

(assert (=> bm!5471 m!440585))

(assert (=> bm!5471 m!440583))

(assert (=> bm!5471 m!440585))

(declare-fun m!440587 () Bool)

(assert (=> bm!5471 m!440587))

(assert (=> b!301633 d!100876))

(declare-fun d!100878 () Bool)

(assert (=> d!100878 (= (byteRangesEq!0 (ite c!14239 (select (arr!9021 a1!948) (_3!1499 lt!436814)) (select (arr!9021 a1!948) (_4!542 lt!436814))) (ite c!14239 (select (arr!9021 a2!948) (_3!1499 lt!436814)) (select (arr!9021 a2!948) (_4!542 lt!436814))) (ite c!14239 lt!436816 #b00000000000000000000000000000000) lt!436815) (or (= (ite c!14239 lt!436816 #b00000000000000000000000000000000) lt!436815) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14239 (select (arr!9021 a1!948) (_3!1499 lt!436814)) (select (arr!9021 a1!948) (_4!542 lt!436814)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436815))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14239 lt!436816 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14239 (select (arr!9021 a2!948) (_3!1499 lt!436814)) (select (arr!9021 a2!948) (_4!542 lt!436814)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436815))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14239 lt!436816 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26017 () Bool)

(assert (= bs!26017 d!100878))

(declare-fun m!440589 () Bool)

(assert (=> bs!26017 m!440589))

(declare-fun m!440591 () Bool)

(assert (=> bs!26017 m!440591))

(assert (=> bm!5462 d!100878))

(declare-fun d!100880 () Bool)

(assert (=> d!100880 (arrayRangesEq!1600 a1!948 a2!948 (_1!13197 lt!436820) (_2!13197 lt!436820))))

(declare-fun lt!436872 () Unit!21125)

(declare-fun choose!535 (array!18276 array!18276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21125)

(assert (=> d!100880 (= lt!436872 (choose!535 a1!948 a2!948 (_1!13197 lt!436814) (_2!13197 lt!436814) (_1!13197 lt!436820) (_2!13197 lt!436820)))))

(assert (=> d!100880 (and (bvsle #b00000000000000000000000000000000 (_1!13197 lt!436814)) (bvsle (_1!13197 lt!436814) (_2!13197 lt!436814)))))

(assert (=> d!100880 (= (arrayRangesEqSlicedLemma!210 a1!948 a2!948 (_1!13197 lt!436814) (_2!13197 lt!436814) (_1!13197 lt!436820) (_2!13197 lt!436820)) lt!436872)))

(declare-fun bs!26018 () Bool)

(assert (= bs!26018 d!100880))

(assert (=> bs!26018 m!440465))

(declare-fun m!440593 () Bool)

(assert (=> bs!26018 m!440593))

(assert (=> b!301644 d!100880))

(declare-fun d!100882 () Bool)

(declare-fun res!248390 () Bool)

(declare-fun e!216717 () Bool)

(assert (=> d!100882 (=> res!248390 e!216717)))

(assert (=> d!100882 (= res!248390 (= (_1!13197 lt!436820) (_2!13197 lt!436820)))))

(assert (=> d!100882 (= (arrayRangesEq!1600 a1!948 a2!948 (_1!13197 lt!436820) (_2!13197 lt!436820)) e!216717)))

(declare-fun b!301728 () Bool)

(declare-fun e!216718 () Bool)

(assert (=> b!301728 (= e!216717 e!216718)))

(declare-fun res!248391 () Bool)

(assert (=> b!301728 (=> (not res!248391) (not e!216718))))

(assert (=> b!301728 (= res!248391 (= (select (arr!9021 a1!948) (_1!13197 lt!436820)) (select (arr!9021 a2!948) (_1!13197 lt!436820))))))

(declare-fun b!301729 () Bool)

(assert (=> b!301729 (= e!216718 (arrayRangesEq!1600 a1!948 a2!948 (bvadd (_1!13197 lt!436820) #b00000000000000000000000000000001) (_2!13197 lt!436820)))))

(assert (= (and d!100882 (not res!248390)) b!301728))

(assert (= (and b!301728 res!248391) b!301729))

(declare-fun m!440595 () Bool)

(assert (=> b!301728 m!440595))

(declare-fun m!440597 () Bool)

(assert (=> b!301728 m!440597))

(declare-fun m!440599 () Bool)

(assert (=> b!301729 m!440599))

(assert (=> b!301644 d!100882))

(push 1)

(assert (not d!100872))

(assert (not b!301720))

(assert (not b!301722))

(assert (not bm!5471))

(assert (not d!100880))

(assert (not b!301723))

(assert (not d!100846))

(assert (not b!301729))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

