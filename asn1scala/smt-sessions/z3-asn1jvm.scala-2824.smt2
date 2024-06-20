; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68318 () Bool)

(assert start!68318)

(declare-fun b!306747 () Bool)

(declare-fun res!251848 () Bool)

(declare-fun e!221016 () Bool)

(assert (=> b!306747 (=> (not res!251848) (not e!221016))))

(declare-datatypes ((tuple4!1256 0))(
  ( (tuple4!1257 (_1!13283 (_ BitVec 32)) (_2!13283 (_ BitVec 32)) (_3!1585 (_ BitVec 32)) (_4!628 (_ BitVec 32))) )
))
(declare-fun lt!439833 () tuple4!1256)

(declare-datatypes ((array!18595 0))(
  ( (array!18596 (arr!9140 (Array (_ BitVec 32) (_ BitVec 8))) (size!8057 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18595)

(declare-fun a2!948 () array!18595)

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306747 (= res!251848 (byteRangesEq!0 (select (arr!9140 a1!948) (_3!1585 lt!439833)) (select (arr!9140 a2!948) (_3!1585 lt!439833)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!306748 () Bool)

(declare-datatypes ((Unit!21399 0))(
  ( (Unit!21400) )
))
(declare-fun e!221017 () Unit!21399)

(declare-fun Unit!21401 () Unit!21399)

(assert (=> b!306748 (= e!221017 Unit!21401)))

(declare-fun b!306749 () Bool)

(declare-fun e!221019 () Unit!21399)

(declare-fun lt!439834 () Unit!21399)

(assert (=> b!306749 (= e!221019 lt!439834)))

(declare-fun lt!439838 () tuple4!1256)

(declare-fun arrayRangesEqImpliesEq!290 (array!18595 array!18595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21399)

(assert (=> b!306749 (= lt!439834 (arrayRangesEqImpliesEq!290 a1!948 a2!948 (_1!13283 lt!439838) (_3!1585 lt!439833) (_2!13283 lt!439838)))))

(assert (=> b!306749 (= (select (arr!9140 a1!948) (_3!1585 lt!439833)) (select (arr!9140 a2!948) (_3!1585 lt!439833)))))

(declare-fun b!306750 () Bool)

(declare-fun res!251850 () Bool)

(declare-fun e!221020 () Bool)

(assert (=> b!306750 (=> (not res!251850) (not e!221020))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!439831 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(assert (=> b!306750 (= res!251850 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439831) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306751 () Bool)

(declare-fun res!251845 () Bool)

(declare-fun lt!439836 () (_ BitVec 32))

(assert (=> b!306751 (= res!251845 (= lt!439836 #b00000000000000000000000000000000))))

(declare-fun e!221021 () Bool)

(assert (=> b!306751 (=> res!251845 e!221021)))

(declare-fun e!221018 () Bool)

(assert (=> b!306751 (= e!221018 e!221021)))

(declare-fun b!306752 () Bool)

(declare-fun Unit!21402 () Unit!21399)

(assert (=> b!306752 (= e!221019 Unit!21402)))

(declare-fun b!306753 () Bool)

(declare-fun e!221023 () Unit!21399)

(declare-fun Unit!21403 () Unit!21399)

(assert (=> b!306753 (= e!221023 Unit!21403)))

(declare-fun b!306754 () Bool)

(declare-fun res!251853 () Bool)

(assert (=> b!306754 (=> (not res!251853) (not e!221020))))

(declare-fun arrayBitRangesEq!0 (array!18595 array!18595 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306754 (= res!251853 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306755 () Bool)

(declare-fun lt!439839 () Unit!21399)

(assert (=> b!306755 (= e!221017 lt!439839)))

(declare-fun arrayRangesEqSlicedLemma!281 (array!18595 array!18595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21399)

(assert (=> b!306755 (= lt!439839 (arrayRangesEqSlicedLemma!281 a1!948 a2!948 (_1!13283 lt!439838) (_2!13283 lt!439838) (_1!13283 lt!439833) (_2!13283 lt!439833)))))

(declare-fun arrayRangesEq!1686 (array!18595 array!18595 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306755 (arrayRangesEq!1686 a1!948 a2!948 (_1!13283 lt!439833) (_2!13283 lt!439833))))

(declare-fun b!306756 () Bool)

(declare-fun e!221014 () Bool)

(assert (=> b!306756 (= e!221014 e!221016)))

(declare-fun res!251846 () Bool)

(assert (=> b!306756 (=> (not res!251846) (not e!221016))))

(assert (=> b!306756 (= res!251846 (not (= (_3!1585 lt!439833) (_4!628 lt!439833))))))

(declare-fun lt!439835 () Unit!21399)

(assert (=> b!306756 (= lt!439835 e!221023)))

(declare-fun c!15034 () Bool)

(assert (=> b!306756 (= c!15034 (and (bvslt (_4!628 lt!439833) (_4!628 lt!439838)) (bvslt (_3!1585 lt!439838) (_4!628 lt!439833))))))

(declare-fun lt!439829 () Unit!21399)

(assert (=> b!306756 (= lt!439829 e!221019)))

(declare-fun c!15035 () Bool)

(assert (=> b!306756 (= c!15035 (and (bvslt (_3!1585 lt!439838) (_3!1585 lt!439833)) (bvslt (_3!1585 lt!439833) (_4!628 lt!439838))))))

(declare-fun b!306757 () Bool)

(assert (=> b!306757 (= e!221016 (and (not (= ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!628 lt!439833) #b00000000000000000000000000000000) (bvsge (_4!628 lt!439833) (size!8057 a1!948)))))))

(declare-fun res!251851 () Bool)

(declare-fun e!221015 () Bool)

(assert (=> start!68318 (=> (not res!251851) (not e!221015))))

(assert (=> start!68318 (= res!251851 (and (bvsle (size!8057 a1!948) (size!8057 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68318 e!221015))

(assert (=> start!68318 true))

(declare-fun array_inv!7669 (array!18595) Bool)

(assert (=> start!68318 (array_inv!7669 a1!948)))

(assert (=> start!68318 (array_inv!7669 a2!948)))

(declare-fun b!306758 () Bool)

(declare-fun call!5864 () Bool)

(assert (=> b!306758 (= e!221021 call!5864)))

(declare-fun b!306759 () Bool)

(declare-fun e!221022 () Bool)

(assert (=> b!306759 (= e!221022 e!221018)))

(declare-fun res!251849 () Bool)

(declare-fun lt!439830 () (_ BitVec 32))

(assert (=> b!306759 (= res!251849 (byteRangesEq!0 (select (arr!9140 a1!948) (_3!1585 lt!439838)) (select (arr!9140 a2!948) (_3!1585 lt!439838)) lt!439830 #b00000000000000000000000000000111))))

(assert (=> b!306759 (=> (not res!251849) (not e!221018))))

(declare-fun b!306760 () Bool)

(assert (=> b!306760 (= e!221015 e!221020)))

(declare-fun res!251847 () Bool)

(assert (=> b!306760 (=> (not res!251847) (not e!221020))))

(assert (=> b!306760 (= res!251847 (and (bvsle toBit!258 lt!439831) (bvsle fromBit!258 lt!439831)))))

(assert (=> b!306760 (= lt!439831 (bvmul ((_ sign_extend 32) (size!8057 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!306761 () Bool)

(declare-fun lt!439832 () Unit!21399)

(assert (=> b!306761 (= e!221023 lt!439832)))

(assert (=> b!306761 (= lt!439832 (arrayRangesEqImpliesEq!290 a1!948 a2!948 (_1!13283 lt!439838) (_4!628 lt!439833) (_2!13283 lt!439838)))))

(assert (=> b!306761 (= (select (arr!9140 a1!948) (_4!628 lt!439833)) (select (arr!9140 a2!948) (_4!628 lt!439833)))))

(declare-fun c!15036 () Bool)

(declare-fun bm!5861 () Bool)

(assert (=> bm!5861 (= call!5864 (byteRangesEq!0 (ite c!15036 (select (arr!9140 a1!948) (_3!1585 lt!439838)) (select (arr!9140 a1!948) (_4!628 lt!439838))) (ite c!15036 (select (arr!9140 a2!948) (_3!1585 lt!439838)) (select (arr!9140 a2!948) (_4!628 lt!439838))) (ite c!15036 lt!439830 #b00000000000000000000000000000000) lt!439836))))

(declare-fun b!306762 () Bool)

(assert (=> b!306762 (= e!221022 call!5864)))

(declare-fun b!306763 () Bool)

(assert (=> b!306763 (= e!221020 e!221014)))

(declare-fun res!251852 () Bool)

(assert (=> b!306763 (=> (not res!251852) (not e!221014))))

(assert (=> b!306763 (= res!251852 e!221022)))

(assert (=> b!306763 (= c!15036 (= (_3!1585 lt!439838) (_4!628 lt!439838)))))

(declare-fun lt!439837 () Unit!21399)

(assert (=> b!306763 (= lt!439837 e!221017)))

(declare-fun c!15033 () Bool)

(assert (=> b!306763 (= c!15033 (bvslt (_1!13283 lt!439833) (_2!13283 lt!439833)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1256)

(assert (=> b!306763 (= lt!439833 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306763 (= lt!439836 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306763 (= lt!439830 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306763 (= lt!439838 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!68318 res!251851) b!306760))

(assert (= (and b!306760 res!251847) b!306754))

(assert (= (and b!306754 res!251853) b!306750))

(assert (= (and b!306750 res!251850) b!306763))

(assert (= (and b!306763 c!15033) b!306755))

(assert (= (and b!306763 (not c!15033)) b!306748))

(assert (= (and b!306763 c!15036) b!306762))

(assert (= (and b!306763 (not c!15036)) b!306759))

(assert (= (and b!306759 res!251849) b!306751))

(assert (= (and b!306751 (not res!251845)) b!306758))

(assert (= (or b!306762 b!306758) bm!5861))

(assert (= (and b!306763 res!251852) b!306756))

(assert (= (and b!306756 c!15035) b!306749))

(assert (= (and b!306756 (not c!15035)) b!306752))

(assert (= (and b!306756 c!15034) b!306761))

(assert (= (and b!306756 (not c!15034)) b!306753))

(assert (= (and b!306756 res!251846) b!306747))

(assert (= (and b!306747 res!251848) b!306757))

(declare-fun m!445213 () Bool)

(assert (=> b!306763 m!445213))

(declare-fun m!445215 () Bool)

(assert (=> b!306763 m!445215))

(declare-fun m!445217 () Bool)

(assert (=> start!68318 m!445217))

(declare-fun m!445219 () Bool)

(assert (=> start!68318 m!445219))

(declare-fun m!445221 () Bool)

(assert (=> b!306759 m!445221))

(declare-fun m!445223 () Bool)

(assert (=> b!306759 m!445223))

(assert (=> b!306759 m!445221))

(assert (=> b!306759 m!445223))

(declare-fun m!445225 () Bool)

(assert (=> b!306759 m!445225))

(declare-fun m!445227 () Bool)

(assert (=> b!306754 m!445227))

(declare-fun m!445229 () Bool)

(assert (=> b!306761 m!445229))

(declare-fun m!445231 () Bool)

(assert (=> b!306761 m!445231))

(declare-fun m!445233 () Bool)

(assert (=> b!306761 m!445233))

(declare-fun m!445235 () Bool)

(assert (=> b!306755 m!445235))

(declare-fun m!445237 () Bool)

(assert (=> b!306755 m!445237))

(declare-fun m!445239 () Bool)

(assert (=> b!306749 m!445239))

(declare-fun m!445241 () Bool)

(assert (=> b!306749 m!445241))

(declare-fun m!445243 () Bool)

(assert (=> b!306749 m!445243))

(declare-fun m!445245 () Bool)

(assert (=> bm!5861 m!445245))

(assert (=> bm!5861 m!445221))

(declare-fun m!445247 () Bool)

(assert (=> bm!5861 m!445247))

(declare-fun m!445249 () Bool)

(assert (=> bm!5861 m!445249))

(assert (=> bm!5861 m!445223))

(assert (=> b!306747 m!445241))

(assert (=> b!306747 m!445243))

(assert (=> b!306747 m!445241))

(assert (=> b!306747 m!445243))

(declare-fun m!445251 () Bool)

(assert (=> b!306747 m!445251))

(check-sat (not start!68318) (not b!306755) (not b!306759) (not b!306754) (not b!306763) (not b!306747) (not b!306761) (not bm!5861) (not b!306749))
(check-sat)
(get-model)

(declare-fun d!102338 () Bool)

(assert (=> d!102338 (= (byteRangesEq!0 (select (arr!9140 a1!948) (_3!1585 lt!439833)) (select (arr!9140 a2!948) (_3!1585 lt!439833)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9140 a1!948) (_3!1585 lt!439833))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9140 a2!948) (_3!1585 lt!439833))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26370 () Bool)

(assert (= bs!26370 d!102338))

(declare-fun m!445293 () Bool)

(assert (=> bs!26370 m!445293))

(declare-fun m!445295 () Bool)

(assert (=> bs!26370 m!445295))

(assert (=> b!306747 d!102338))

(declare-fun d!102340 () Bool)

(assert (=> d!102340 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1257 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306763 d!102340))

(declare-fun d!102342 () Bool)

(assert (=> d!102342 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1257 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306763 d!102342))

(declare-fun d!102344 () Bool)

(assert (=> d!102344 (= (byteRangesEq!0 (select (arr!9140 a1!948) (_3!1585 lt!439838)) (select (arr!9140 a2!948) (_3!1585 lt!439838)) lt!439830 #b00000000000000000000000000000111) (or (= lt!439830 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9140 a1!948) (_3!1585 lt!439838))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439830)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9140 a2!948) (_3!1585 lt!439838))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439830)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26371 () Bool)

(assert (= bs!26371 d!102344))

(assert (=> bs!26371 m!445293))

(declare-fun m!445297 () Bool)

(assert (=> bs!26371 m!445297))

(assert (=> b!306759 d!102344))

(declare-fun d!102346 () Bool)

(assert (=> d!102346 (= (array_inv!7669 a1!948) (bvsge (size!8057 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68318 d!102346))

(declare-fun d!102348 () Bool)

(assert (=> d!102348 (= (array_inv!7669 a2!948) (bvsge (size!8057 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68318 d!102348))

(declare-fun c!15051 () Bool)

(declare-fun lt!439880 () (_ BitVec 32))

(declare-fun bm!5867 () Bool)

(declare-fun call!5870 () Bool)

(declare-fun lt!439879 () tuple4!1256)

(declare-fun lt!439881 () (_ BitVec 32))

(assert (=> bm!5867 (= call!5870 (byteRangesEq!0 (ite c!15051 (select (arr!9140 a1!948) (_3!1585 lt!439879)) (select (arr!9140 a1!948) (_4!628 lt!439879))) (ite c!15051 (select (arr!9140 a2!948) (_3!1585 lt!439879)) (select (arr!9140 a2!948) (_4!628 lt!439879))) (ite c!15051 lt!439881 #b00000000000000000000000000000000) lt!439880))))

(declare-fun b!306829 () Bool)

(declare-fun e!221076 () Bool)

(declare-fun e!221072 () Bool)

(assert (=> b!306829 (= e!221076 e!221072)))

(declare-fun res!251891 () Bool)

(assert (=> b!306829 (=> (not res!251891) (not e!221072))))

(declare-fun e!221074 () Bool)

(assert (=> b!306829 (= res!251891 e!221074)))

(declare-fun res!251893 () Bool)

(assert (=> b!306829 (=> res!251893 e!221074)))

(assert (=> b!306829 (= res!251893 (bvsge (_1!13283 lt!439879) (_2!13283 lt!439879)))))

(assert (=> b!306829 (= lt!439880 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306829 (= lt!439881 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306829 (= lt!439879 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306830 () Bool)

(declare-fun e!221077 () Bool)

(assert (=> b!306830 (= e!221077 call!5870)))

(declare-fun b!306831 () Bool)

(declare-fun res!251894 () Bool)

(assert (=> b!306831 (= res!251894 (= lt!439880 #b00000000000000000000000000000000))))

(declare-fun e!221073 () Bool)

(assert (=> b!306831 (=> res!251894 e!221073)))

(declare-fun e!221075 () Bool)

(assert (=> b!306831 (= e!221075 e!221073)))

(declare-fun d!102350 () Bool)

(declare-fun res!251892 () Bool)

(assert (=> d!102350 (=> res!251892 e!221076)))

(assert (=> d!102350 (= res!251892 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102350 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!221076)))

(declare-fun b!306832 () Bool)

(assert (=> b!306832 (= e!221077 e!221075)))

(declare-fun res!251895 () Bool)

(assert (=> b!306832 (= res!251895 (byteRangesEq!0 (select (arr!9140 a1!948) (_3!1585 lt!439879)) (select (arr!9140 a2!948) (_3!1585 lt!439879)) lt!439881 #b00000000000000000000000000001000))))

(assert (=> b!306832 (=> (not res!251895) (not e!221075))))

(declare-fun b!306833 () Bool)

(assert (=> b!306833 (= e!221072 e!221077)))

(assert (=> b!306833 (= c!15051 (= (_3!1585 lt!439879) (_4!628 lt!439879)))))

(declare-fun b!306834 () Bool)

(assert (=> b!306834 (= e!221074 (arrayRangesEq!1686 a1!948 a2!948 (_1!13283 lt!439879) (_2!13283 lt!439879)))))

(declare-fun b!306835 () Bool)

(assert (=> b!306835 (= e!221073 call!5870)))

(assert (= (and d!102350 (not res!251892)) b!306829))

(assert (= (and b!306829 (not res!251893)) b!306834))

(assert (= (and b!306829 res!251891) b!306833))

(assert (= (and b!306833 c!15051) b!306830))

(assert (= (and b!306833 (not c!15051)) b!306832))

(assert (= (and b!306832 res!251895) b!306831))

(assert (= (and b!306831 (not res!251894)) b!306835))

(assert (= (or b!306830 b!306835) bm!5867))

(declare-fun m!445299 () Bool)

(assert (=> bm!5867 m!445299))

(declare-fun m!445301 () Bool)

(assert (=> bm!5867 m!445301))

(declare-fun m!445303 () Bool)

(assert (=> bm!5867 m!445303))

(declare-fun m!445305 () Bool)

(assert (=> bm!5867 m!445305))

(declare-fun m!445307 () Bool)

(assert (=> bm!5867 m!445307))

(assert (=> b!306829 m!445215))

(assert (=> b!306832 m!445303))

(assert (=> b!306832 m!445299))

(assert (=> b!306832 m!445303))

(assert (=> b!306832 m!445299))

(declare-fun m!445309 () Bool)

(assert (=> b!306832 m!445309))

(declare-fun m!445311 () Bool)

(assert (=> b!306834 m!445311))

(assert (=> b!306754 d!102350))

(declare-fun d!102352 () Bool)

(assert (=> d!102352 (and (bvsge (_3!1585 lt!439833) #b00000000000000000000000000000000) (bvslt (_3!1585 lt!439833) (size!8057 a1!948)) (bvslt (_3!1585 lt!439833) (size!8057 a2!948)) (= (select (arr!9140 a1!948) (_3!1585 lt!439833)) (select (arr!9140 a2!948) (_3!1585 lt!439833))))))

(declare-fun lt!439884 () Unit!21399)

(declare-fun choose!632 (array!18595 array!18595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21399)

(assert (=> d!102352 (= lt!439884 (choose!632 a1!948 a2!948 (_1!13283 lt!439838) (_3!1585 lt!439833) (_2!13283 lt!439838)))))

(assert (=> d!102352 (and (bvsle #b00000000000000000000000000000000 (_1!13283 lt!439838)) (bvsle (_1!13283 lt!439838) (_2!13283 lt!439838)))))

(assert (=> d!102352 (= (arrayRangesEqImpliesEq!290 a1!948 a2!948 (_1!13283 lt!439838) (_3!1585 lt!439833) (_2!13283 lt!439838)) lt!439884)))

(declare-fun bs!26372 () Bool)

(assert (= bs!26372 d!102352))

(assert (=> bs!26372 m!445241))

(assert (=> bs!26372 m!445243))

(declare-fun m!445313 () Bool)

(assert (=> bs!26372 m!445313))

(assert (=> b!306749 d!102352))

(declare-fun d!102354 () Bool)

(assert (=> d!102354 (arrayRangesEq!1686 a1!948 a2!948 (_1!13283 lt!439833) (_2!13283 lt!439833))))

(declare-fun lt!439887 () Unit!21399)

(declare-fun choose!633 (array!18595 array!18595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21399)

(assert (=> d!102354 (= lt!439887 (choose!633 a1!948 a2!948 (_1!13283 lt!439838) (_2!13283 lt!439838) (_1!13283 lt!439833) (_2!13283 lt!439833)))))

(assert (=> d!102354 (and (bvsle #b00000000000000000000000000000000 (_1!13283 lt!439838)) (bvsle (_1!13283 lt!439838) (_2!13283 lt!439838)))))

(assert (=> d!102354 (= (arrayRangesEqSlicedLemma!281 a1!948 a2!948 (_1!13283 lt!439838) (_2!13283 lt!439838) (_1!13283 lt!439833) (_2!13283 lt!439833)) lt!439887)))

(declare-fun bs!26373 () Bool)

(assert (= bs!26373 d!102354))

(assert (=> bs!26373 m!445237))

(declare-fun m!445315 () Bool)

(assert (=> bs!26373 m!445315))

(assert (=> b!306755 d!102354))

(declare-fun d!102356 () Bool)

(declare-fun res!251900 () Bool)

(declare-fun e!221082 () Bool)

(assert (=> d!102356 (=> res!251900 e!221082)))

(assert (=> d!102356 (= res!251900 (= (_1!13283 lt!439833) (_2!13283 lt!439833)))))

(assert (=> d!102356 (= (arrayRangesEq!1686 a1!948 a2!948 (_1!13283 lt!439833) (_2!13283 lt!439833)) e!221082)))

(declare-fun b!306840 () Bool)

(declare-fun e!221083 () Bool)

(assert (=> b!306840 (= e!221082 e!221083)))

(declare-fun res!251901 () Bool)

(assert (=> b!306840 (=> (not res!251901) (not e!221083))))

(assert (=> b!306840 (= res!251901 (= (select (arr!9140 a1!948) (_1!13283 lt!439833)) (select (arr!9140 a2!948) (_1!13283 lt!439833))))))

(declare-fun b!306841 () Bool)

(assert (=> b!306841 (= e!221083 (arrayRangesEq!1686 a1!948 a2!948 (bvadd (_1!13283 lt!439833) #b00000000000000000000000000000001) (_2!13283 lt!439833)))))

(assert (= (and d!102356 (not res!251900)) b!306840))

(assert (= (and b!306840 res!251901) b!306841))

(declare-fun m!445317 () Bool)

(assert (=> b!306840 m!445317))

(declare-fun m!445319 () Bool)

(assert (=> b!306840 m!445319))

(declare-fun m!445321 () Bool)

(assert (=> b!306841 m!445321))

(assert (=> b!306755 d!102356))

(declare-fun d!102358 () Bool)

(assert (=> d!102358 (and (bvsge (_4!628 lt!439833) #b00000000000000000000000000000000) (bvslt (_4!628 lt!439833) (size!8057 a1!948)) (bvslt (_4!628 lt!439833) (size!8057 a2!948)) (= (select (arr!9140 a1!948) (_4!628 lt!439833)) (select (arr!9140 a2!948) (_4!628 lt!439833))))))

(declare-fun lt!439888 () Unit!21399)

(assert (=> d!102358 (= lt!439888 (choose!632 a1!948 a2!948 (_1!13283 lt!439838) (_4!628 lt!439833) (_2!13283 lt!439838)))))

(assert (=> d!102358 (and (bvsle #b00000000000000000000000000000000 (_1!13283 lt!439838)) (bvsle (_1!13283 lt!439838) (_2!13283 lt!439838)))))

(assert (=> d!102358 (= (arrayRangesEqImpliesEq!290 a1!948 a2!948 (_1!13283 lt!439838) (_4!628 lt!439833) (_2!13283 lt!439838)) lt!439888)))

(declare-fun bs!26374 () Bool)

(assert (= bs!26374 d!102358))

(assert (=> bs!26374 m!445231))

(assert (=> bs!26374 m!445233))

(declare-fun m!445323 () Bool)

(assert (=> bs!26374 m!445323))

(assert (=> b!306761 d!102358))

(declare-fun d!102360 () Bool)

(assert (=> d!102360 (= (byteRangesEq!0 (ite c!15036 (select (arr!9140 a1!948) (_3!1585 lt!439838)) (select (arr!9140 a1!948) (_4!628 lt!439838))) (ite c!15036 (select (arr!9140 a2!948) (_3!1585 lt!439838)) (select (arr!9140 a2!948) (_4!628 lt!439838))) (ite c!15036 lt!439830 #b00000000000000000000000000000000) lt!439836) (or (= (ite c!15036 lt!439830 #b00000000000000000000000000000000) lt!439836) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15036 (select (arr!9140 a1!948) (_3!1585 lt!439838)) (select (arr!9140 a1!948) (_4!628 lt!439838)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439836))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15036 lt!439830 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15036 (select (arr!9140 a2!948) (_3!1585 lt!439838)) (select (arr!9140 a2!948) (_4!628 lt!439838)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439836))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15036 lt!439830 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26375 () Bool)

(assert (= bs!26375 d!102360))

(declare-fun m!445325 () Bool)

(assert (=> bs!26375 m!445325))

(declare-fun m!445327 () Bool)

(assert (=> bs!26375 m!445327))

(assert (=> bm!5861 d!102360))

(check-sat (not d!102358) (not b!306834) (not b!306841) (not b!306832) (not b!306829) (not d!102354) (not d!102352) (not bm!5867))
