; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67622 () Bool)

(assert start!67622)

(declare-fun b!303564 () Bool)

(declare-datatypes ((Unit!21199 0))(
  ( (Unit!21200) )
))
(declare-fun e!218436 () Unit!21199)

(declare-fun Unit!21201 () Unit!21199)

(assert (=> b!303564 (= e!218436 Unit!21201)))

(declare-fun b!303565 () Bool)

(declare-fun res!249797 () Bool)

(declare-fun e!218434 () Bool)

(assert (=> b!303565 (=> (not res!249797) (not e!218434))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437871 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303565 (= res!249797 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437871) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303566 () Bool)

(declare-fun lt!437868 () Unit!21199)

(assert (=> b!303566 (= e!218436 lt!437868)))

(declare-datatypes ((tuple4!1154 0))(
  ( (tuple4!1155 (_1!13232 (_ BitVec 32)) (_2!13232 (_ BitVec 32)) (_3!1534 (_ BitVec 32)) (_4!577 (_ BitVec 32))) )
))
(declare-fun lt!437869 () tuple4!1154)

(declare-datatypes ((array!18448 0))(
  ( (array!18449 (arr!9089 (Array (_ BitVec 32) (_ BitVec 8))) (size!8006 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18448)

(declare-fun a2!948 () array!18448)

(declare-fun lt!437870 () tuple4!1154)

(declare-fun arrayRangesEqSlicedLemma!230 (array!18448 array!18448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21199)

(assert (=> b!303566 (= lt!437868 (arrayRangesEqSlicedLemma!230 a1!948 a2!948 (_1!13232 lt!437869) (_2!13232 lt!437869) (_1!13232 lt!437870) (_2!13232 lt!437870)))))

(declare-fun arrayRangesEq!1635 (array!18448 array!18448 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303566 (arrayRangesEq!1635 a1!948 a2!948 (_1!13232 lt!437870) (_2!13232 lt!437870))))

(declare-fun res!249801 () Bool)

(declare-fun e!218433 () Bool)

(assert (=> start!67622 (=> (not res!249801) (not e!218433))))

(assert (=> start!67622 (= res!249801 (and (bvsle (size!8006 a1!948) (size!8006 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67622 e!218433))

(assert (=> start!67622 true))

(declare-fun array_inv!7618 (array!18448) Bool)

(assert (=> start!67622 (array_inv!7618 a1!948)))

(assert (=> start!67622 (array_inv!7618 a2!948)))

(declare-fun b!303567 () Bool)

(assert (=> b!303567 (= e!218433 e!218434)))

(declare-fun res!249796 () Bool)

(assert (=> b!303567 (=> (not res!249796) (not e!218434))))

(assert (=> b!303567 (= res!249796 (and (bvsle toBit!258 lt!437871) (bvsle fromBit!258 lt!437871)))))

(assert (=> b!303567 (= lt!437871 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8006 a1!948))))))

(declare-fun b!303568 () Bool)

(declare-fun res!249799 () Bool)

(assert (=> b!303568 (=> (not res!249799) (not e!218434))))

(declare-fun arrayBitRangesEq!0 (array!18448 array!18448 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303568 (= res!249799 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303569 () Bool)

(declare-fun e!218437 () Bool)

(assert (=> b!303569 (= e!218437 (and (not (= ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!577 lt!437869) #b00000000000000000000000000000000) (bvsge (_4!577 lt!437869) (size!8006 a1!948)))))))

(declare-fun b!303570 () Bool)

(assert (=> b!303570 (= e!218434 e!218437)))

(declare-fun res!249800 () Bool)

(assert (=> b!303570 (=> (not res!249800) (not e!218437))))

(assert (=> b!303570 (= res!249800 (not (= (_3!1534 lt!437869) (_4!577 lt!437869))))))

(declare-fun lt!437867 () Unit!21199)

(assert (=> b!303570 (= lt!437867 e!218436)))

(declare-fun c!14466 () Bool)

(assert (=> b!303570 (= c!14466 (bvslt (_1!13232 lt!437870) (_2!13232 lt!437870)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1154)

(assert (=> b!303570 (= lt!437870 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303570 (= lt!437869 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303571 () Bool)

(declare-fun res!249798 () Bool)

(assert (=> b!303571 (=> (not res!249798) (not e!218437))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303571 (= res!249798 (byteRangesEq!0 (select (arr!9089 a1!948) (_3!1534 lt!437869)) (select (arr!9089 a2!948) (_3!1534 lt!437869)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(assert (= (and start!67622 res!249801) b!303567))

(assert (= (and b!303567 res!249796) b!303568))

(assert (= (and b!303568 res!249799) b!303565))

(assert (= (and b!303565 res!249797) b!303570))

(assert (= (and b!303570 c!14466) b!303566))

(assert (= (and b!303570 (not c!14466)) b!303564))

(assert (= (and b!303570 res!249800) b!303571))

(assert (= (and b!303571 res!249798) b!303569))

(declare-fun m!442145 () Bool)

(assert (=> b!303566 m!442145))

(declare-fun m!442147 () Bool)

(assert (=> b!303566 m!442147))

(declare-fun m!442149 () Bool)

(assert (=> start!67622 m!442149))

(declare-fun m!442151 () Bool)

(assert (=> start!67622 m!442151))

(declare-fun m!442153 () Bool)

(assert (=> b!303571 m!442153))

(declare-fun m!442155 () Bool)

(assert (=> b!303571 m!442155))

(assert (=> b!303571 m!442153))

(assert (=> b!303571 m!442155))

(declare-fun m!442157 () Bool)

(assert (=> b!303571 m!442157))

(declare-fun m!442159 () Bool)

(assert (=> b!303570 m!442159))

(declare-fun m!442161 () Bool)

(assert (=> b!303570 m!442161))

(declare-fun m!442163 () Bool)

(assert (=> b!303568 m!442163))

(check-sat (not b!303571) (not start!67622) (not b!303568) (not b!303570) (not b!303566))
(check-sat)
(get-model)

(declare-fun d!101398 () Bool)

(assert (=> d!101398 (arrayRangesEq!1635 a1!948 a2!948 (_1!13232 lt!437870) (_2!13232 lt!437870))))

(declare-fun lt!437889 () Unit!21199)

(declare-fun choose!560 (array!18448 array!18448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21199)

(assert (=> d!101398 (= lt!437889 (choose!560 a1!948 a2!948 (_1!13232 lt!437869) (_2!13232 lt!437869) (_1!13232 lt!437870) (_2!13232 lt!437870)))))

(assert (=> d!101398 (and (bvsle #b00000000000000000000000000000000 (_1!13232 lt!437869)) (bvsle (_1!13232 lt!437869) (_2!13232 lt!437869)))))

(assert (=> d!101398 (= (arrayRangesEqSlicedLemma!230 a1!948 a2!948 (_1!13232 lt!437869) (_2!13232 lt!437869) (_1!13232 lt!437870) (_2!13232 lt!437870)) lt!437889)))

(declare-fun bs!26145 () Bool)

(assert (= bs!26145 d!101398))

(assert (=> bs!26145 m!442147))

(declare-fun m!442185 () Bool)

(assert (=> bs!26145 m!442185))

(assert (=> b!303566 d!101398))

(declare-fun d!101400 () Bool)

(declare-fun res!249824 () Bool)

(declare-fun e!218460 () Bool)

(assert (=> d!101400 (=> res!249824 e!218460)))

(assert (=> d!101400 (= res!249824 (= (_1!13232 lt!437870) (_2!13232 lt!437870)))))

(assert (=> d!101400 (= (arrayRangesEq!1635 a1!948 a2!948 (_1!13232 lt!437870) (_2!13232 lt!437870)) e!218460)))

(declare-fun b!303600 () Bool)

(declare-fun e!218461 () Bool)

(assert (=> b!303600 (= e!218460 e!218461)))

(declare-fun res!249825 () Bool)

(assert (=> b!303600 (=> (not res!249825) (not e!218461))))

(assert (=> b!303600 (= res!249825 (= (select (arr!9089 a1!948) (_1!13232 lt!437870)) (select (arr!9089 a2!948) (_1!13232 lt!437870))))))

(declare-fun b!303601 () Bool)

(assert (=> b!303601 (= e!218461 (arrayRangesEq!1635 a1!948 a2!948 (bvadd (_1!13232 lt!437870) #b00000000000000000000000000000001) (_2!13232 lt!437870)))))

(assert (= (and d!101400 (not res!249824)) b!303600))

(assert (= (and b!303600 res!249825) b!303601))

(declare-fun m!442187 () Bool)

(assert (=> b!303600 m!442187))

(declare-fun m!442189 () Bool)

(assert (=> b!303600 m!442189))

(declare-fun m!442191 () Bool)

(assert (=> b!303601 m!442191))

(assert (=> b!303566 d!101400))

(declare-fun d!101402 () Bool)

(assert (=> d!101402 (= (byteRangesEq!0 (select (arr!9089 a1!948) (_3!1534 lt!437869)) (select (arr!9089 a2!948) (_3!1534 lt!437869)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9089 a1!948) (_3!1534 lt!437869))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9089 a2!948) (_3!1534 lt!437869))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26146 () Bool)

(assert (= bs!26146 d!101402))

(declare-fun m!442193 () Bool)

(assert (=> bs!26146 m!442193))

(declare-fun m!442195 () Bool)

(assert (=> bs!26146 m!442195))

(assert (=> b!303571 d!101402))

(declare-fun e!218474 () Bool)

(declare-fun lt!437896 () tuple4!1154)

(declare-fun b!303616 () Bool)

(assert (=> b!303616 (= e!218474 (arrayRangesEq!1635 a1!948 a2!948 (_1!13232 lt!437896) (_2!13232 lt!437896)))))

(declare-fun b!303617 () Bool)

(declare-fun e!218477 () Bool)

(declare-fun call!5597 () Bool)

(assert (=> b!303617 (= e!218477 call!5597)))

(declare-fun b!303619 () Bool)

(declare-fun e!218479 () Bool)

(declare-fun e!218478 () Bool)

(assert (=> b!303619 (= e!218479 e!218478)))

(declare-fun res!249836 () Bool)

(assert (=> b!303619 (=> (not res!249836) (not e!218478))))

(assert (=> b!303619 (= res!249836 e!218474)))

(declare-fun res!249838 () Bool)

(assert (=> b!303619 (=> res!249838 e!218474)))

(assert (=> b!303619 (= res!249838 (bvsge (_1!13232 lt!437896) (_2!13232 lt!437896)))))

(declare-fun lt!437898 () (_ BitVec 32))

(assert (=> b!303619 (= lt!437898 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437897 () (_ BitVec 32))

(assert (=> b!303619 (= lt!437897 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303619 (= lt!437896 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!101404 () Bool)

(declare-fun res!249837 () Bool)

(assert (=> d!101404 (=> res!249837 e!218479)))

(assert (=> d!101404 (= res!249837 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101404 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218479)))

(declare-fun b!303618 () Bool)

(declare-fun e!218475 () Bool)

(declare-fun e!218476 () Bool)

(assert (=> b!303618 (= e!218475 e!218476)))

(declare-fun res!249839 () Bool)

(assert (=> b!303618 (= res!249839 (byteRangesEq!0 (select (arr!9089 a1!948) (_3!1534 lt!437896)) (select (arr!9089 a2!948) (_3!1534 lt!437896)) lt!437897 #b00000000000000000000000000001000))))

(assert (=> b!303618 (=> (not res!249839) (not e!218476))))

(declare-fun b!303620 () Bool)

(assert (=> b!303620 (= e!218478 e!218475)))

(declare-fun c!14472 () Bool)

(assert (=> b!303620 (= c!14472 (= (_3!1534 lt!437896) (_4!577 lt!437896)))))

(declare-fun b!303621 () Bool)

(declare-fun res!249840 () Bool)

(assert (=> b!303621 (= res!249840 (= lt!437898 #b00000000000000000000000000000000))))

(assert (=> b!303621 (=> res!249840 e!218477)))

(assert (=> b!303621 (= e!218476 e!218477)))

(declare-fun b!303622 () Bool)

(assert (=> b!303622 (= e!218475 call!5597)))

(declare-fun bm!5594 () Bool)

(assert (=> bm!5594 (= call!5597 (byteRangesEq!0 (ite c!14472 (select (arr!9089 a1!948) (_3!1534 lt!437896)) (select (arr!9089 a1!948) (_4!577 lt!437896))) (ite c!14472 (select (arr!9089 a2!948) (_3!1534 lt!437896)) (select (arr!9089 a2!948) (_4!577 lt!437896))) (ite c!14472 lt!437897 #b00000000000000000000000000000000) lt!437898))))

(assert (= (and d!101404 (not res!249837)) b!303619))

(assert (= (and b!303619 (not res!249838)) b!303616))

(assert (= (and b!303619 res!249836) b!303620))

(assert (= (and b!303620 c!14472) b!303622))

(assert (= (and b!303620 (not c!14472)) b!303618))

(assert (= (and b!303618 res!249839) b!303621))

(assert (= (and b!303621 (not res!249840)) b!303617))

(assert (= (or b!303622 b!303617) bm!5594))

(declare-fun m!442197 () Bool)

(assert (=> b!303616 m!442197))

(assert (=> b!303619 m!442161))

(declare-fun m!442199 () Bool)

(assert (=> b!303618 m!442199))

(declare-fun m!442201 () Bool)

(assert (=> b!303618 m!442201))

(assert (=> b!303618 m!442199))

(assert (=> b!303618 m!442201))

(declare-fun m!442203 () Bool)

(assert (=> b!303618 m!442203))

(declare-fun m!442205 () Bool)

(assert (=> bm!5594 m!442205))

(declare-fun m!442207 () Bool)

(assert (=> bm!5594 m!442207))

(declare-fun m!442209 () Bool)

(assert (=> bm!5594 m!442209))

(assert (=> bm!5594 m!442201))

(assert (=> bm!5594 m!442199))

(assert (=> b!303568 d!101404))

(declare-fun d!101406 () Bool)

(assert (=> d!101406 (= (array_inv!7618 a1!948) (bvsge (size!8006 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67622 d!101406))

(declare-fun d!101408 () Bool)

(assert (=> d!101408 (= (array_inv!7618 a2!948) (bvsge (size!8006 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67622 d!101408))

(declare-fun d!101410 () Bool)

(assert (=> d!101410 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1155 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303570 d!101410))

(declare-fun d!101412 () Bool)

(assert (=> d!101412 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1155 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303570 d!101412))

(check-sat (not b!303616) (not b!303618) (not b!303619) (not bm!5594) (not d!101398) (not b!303601))
