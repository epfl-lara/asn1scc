; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67664 () Bool)

(assert start!67664)

(declare-fun res!249917 () Bool)

(declare-fun e!218563 () Bool)

(assert (=> start!67664 (=> (not res!249917) (not e!218563))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18457 0))(
  ( (array!18458 (arr!9092 (Array (_ BitVec 32) (_ BitVec 8))) (size!8009 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18457)

(declare-fun a2!948 () array!18457)

(assert (=> start!67664 (= res!249917 (and (bvsle (size!8009 a1!948) (size!8009 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67664 e!218563))

(assert (=> start!67664 true))

(declare-fun array_inv!7621 (array!18457) Bool)

(assert (=> start!67664 (array_inv!7621 a1!948)))

(assert (=> start!67664 (array_inv!7621 a2!948)))

(declare-fun b!303717 () Bool)

(declare-datatypes ((Unit!21208 0))(
  ( (Unit!21209) )
))
(declare-fun e!218558 () Unit!21208)

(declare-fun lt!437949 () Unit!21208)

(assert (=> b!303717 (= e!218558 lt!437949)))

(declare-datatypes ((tuple4!1160 0))(
  ( (tuple4!1161 (_1!13235 (_ BitVec 32)) (_2!13235 (_ BitVec 32)) (_3!1537 (_ BitVec 32)) (_4!580 (_ BitVec 32))) )
))
(declare-fun lt!437952 () tuple4!1160)

(declare-fun lt!437951 () tuple4!1160)

(declare-fun arrayRangesEqSlicedLemma!233 (array!18457 array!18457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21208)

(assert (=> b!303717 (= lt!437949 (arrayRangesEqSlicedLemma!233 a1!948 a2!948 (_1!13235 lt!437952) (_2!13235 lt!437952) (_1!13235 lt!437951) (_2!13235 lt!437951)))))

(declare-fun arrayRangesEq!1638 (array!18457 array!18457 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303717 (arrayRangesEq!1638 a1!948 a2!948 (_1!13235 lt!437951) (_2!13235 lt!437951))))

(declare-fun b!303718 () Bool)

(declare-fun res!249915 () Bool)

(declare-fun e!218560 () Bool)

(assert (=> b!303718 (=> (not res!249915) (not e!218560))))

(declare-fun arrayBitRangesEq!0 (array!18457 array!18457 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303718 (= res!249915 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303719 () Bool)

(assert (=> b!303719 (= e!218563 e!218560)))

(declare-fun res!249913 () Bool)

(assert (=> b!303719 (=> (not res!249913) (not e!218560))))

(declare-fun lt!437948 () (_ BitVec 64))

(assert (=> b!303719 (= res!249913 (and (bvsle toBit!258 lt!437948) (bvsle fromBit!258 lt!437948)))))

(assert (=> b!303719 (= lt!437948 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8009 a1!948))))))

(declare-fun b!303720 () Bool)

(declare-fun e!218562 () Bool)

(assert (=> b!303720 (= e!218560 e!218562)))

(declare-fun res!249918 () Bool)

(assert (=> b!303720 (=> (not res!249918) (not e!218562))))

(assert (=> b!303720 (= res!249918 (not (= (_3!1537 lt!437952) (_4!580 lt!437952))))))

(declare-fun lt!437950 () Unit!21208)

(assert (=> b!303720 (= lt!437950 e!218558)))

(declare-fun c!14484 () Bool)

(assert (=> b!303720 (= c!14484 (bvslt (_1!13235 lt!437951) (_2!13235 lt!437951)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1160)

(assert (=> b!303720 (= lt!437951 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303720 (= lt!437952 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303721 () Bool)

(declare-fun Unit!21210 () Unit!21208)

(assert (=> b!303721 (= e!218558 Unit!21210)))

(declare-fun b!303722 () Bool)

(declare-fun res!249914 () Bool)

(assert (=> b!303722 (=> (not res!249914) (not e!218560))))

(assert (=> b!303722 (= res!249914 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437948) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303723 () Bool)

(declare-fun res!249916 () Bool)

(assert (=> b!303723 (=> (not res!249916) (not e!218562))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303723 (= res!249916 (byteRangesEq!0 (select (arr!9092 a1!948) (_3!1537 lt!437952)) (select (arr!9092 a2!948) (_3!1537 lt!437952)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!303724 () Bool)

(assert (=> b!303724 (= e!218562 (and (not (= ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!580 lt!437952) #b00000000000000000000000000000000) (bvsge (_4!580 lt!437952) (size!8009 a2!948)))))))

(assert (= (and start!67664 res!249917) b!303719))

(assert (= (and b!303719 res!249913) b!303718))

(assert (= (and b!303718 res!249915) b!303722))

(assert (= (and b!303722 res!249914) b!303720))

(assert (= (and b!303720 c!14484) b!303717))

(assert (= (and b!303720 (not c!14484)) b!303721))

(assert (= (and b!303720 res!249918) b!303723))

(assert (= (and b!303723 res!249916) b!303724))

(declare-fun m!442283 () Bool)

(assert (=> b!303718 m!442283))

(declare-fun m!442285 () Bool)

(assert (=> b!303723 m!442285))

(declare-fun m!442287 () Bool)

(assert (=> b!303723 m!442287))

(assert (=> b!303723 m!442285))

(assert (=> b!303723 m!442287))

(declare-fun m!442289 () Bool)

(assert (=> b!303723 m!442289))

(declare-fun m!442291 () Bool)

(assert (=> b!303720 m!442291))

(declare-fun m!442293 () Bool)

(assert (=> b!303720 m!442293))

(declare-fun m!442295 () Bool)

(assert (=> b!303717 m!442295))

(declare-fun m!442297 () Bool)

(assert (=> b!303717 m!442297))

(declare-fun m!442299 () Bool)

(assert (=> start!67664 m!442299))

(declare-fun m!442301 () Bool)

(assert (=> start!67664 m!442301))

(check-sat (not b!303723) (not b!303720) (not b!303718) (not start!67664) (not b!303717))
(check-sat)
(get-model)

(declare-fun d!101448 () Bool)

(assert (=> d!101448 (= (array_inv!7621 a1!948) (bvsge (size!8009 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67664 d!101448))

(declare-fun d!101450 () Bool)

(assert (=> d!101450 (= (array_inv!7621 a2!948) (bvsge (size!8009 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67664 d!101450))

(declare-fun d!101452 () Bool)

(assert (=> d!101452 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1161 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303720 d!101452))

(declare-fun d!101454 () Bool)

(assert (=> d!101454 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1161 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303720 d!101454))

(declare-fun d!101456 () Bool)

(assert (=> d!101456 (arrayRangesEq!1638 a1!948 a2!948 (_1!13235 lt!437951) (_2!13235 lt!437951))))

(declare-fun lt!437970 () Unit!21208)

(declare-fun choose!563 (array!18457 array!18457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21208)

(assert (=> d!101456 (= lt!437970 (choose!563 a1!948 a2!948 (_1!13235 lt!437952) (_2!13235 lt!437952) (_1!13235 lt!437951) (_2!13235 lt!437951)))))

(assert (=> d!101456 (and (bvsle #b00000000000000000000000000000000 (_1!13235 lt!437952)) (bvsle (_1!13235 lt!437952) (_2!13235 lt!437952)))))

(assert (=> d!101456 (= (arrayRangesEqSlicedLemma!233 a1!948 a2!948 (_1!13235 lt!437952) (_2!13235 lt!437952) (_1!13235 lt!437951) (_2!13235 lt!437951)) lt!437970)))

(declare-fun bs!26154 () Bool)

(assert (= bs!26154 d!101456))

(assert (=> bs!26154 m!442297))

(declare-fun m!442323 () Bool)

(assert (=> bs!26154 m!442323))

(assert (=> b!303717 d!101456))

(declare-fun d!101458 () Bool)

(declare-fun res!249941 () Bool)

(declare-fun e!218586 () Bool)

(assert (=> d!101458 (=> res!249941 e!218586)))

(assert (=> d!101458 (= res!249941 (= (_1!13235 lt!437951) (_2!13235 lt!437951)))))

(assert (=> d!101458 (= (arrayRangesEq!1638 a1!948 a2!948 (_1!13235 lt!437951) (_2!13235 lt!437951)) e!218586)))

(declare-fun b!303753 () Bool)

(declare-fun e!218587 () Bool)

(assert (=> b!303753 (= e!218586 e!218587)))

(declare-fun res!249942 () Bool)

(assert (=> b!303753 (=> (not res!249942) (not e!218587))))

(assert (=> b!303753 (= res!249942 (= (select (arr!9092 a1!948) (_1!13235 lt!437951)) (select (arr!9092 a2!948) (_1!13235 lt!437951))))))

(declare-fun b!303754 () Bool)

(assert (=> b!303754 (= e!218587 (arrayRangesEq!1638 a1!948 a2!948 (bvadd (_1!13235 lt!437951) #b00000000000000000000000000000001) (_2!13235 lt!437951)))))

(assert (= (and d!101458 (not res!249941)) b!303753))

(assert (= (and b!303753 res!249942) b!303754))

(declare-fun m!442325 () Bool)

(assert (=> b!303753 m!442325))

(declare-fun m!442327 () Bool)

(assert (=> b!303753 m!442327))

(declare-fun m!442329 () Bool)

(assert (=> b!303754 m!442329))

(assert (=> b!303717 d!101458))

(declare-fun d!101460 () Bool)

(declare-fun res!249961 () Bool)

(declare-fun e!218611 () Bool)

(assert (=> d!101460 (=> res!249961 e!218611)))

(assert (=> d!101460 (= res!249961 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101460 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218611)))

(declare-fun b!303775 () Bool)

(declare-fun e!218607 () Bool)

(declare-fun e!218609 () Bool)

(assert (=> b!303775 (= e!218607 e!218609)))

(declare-fun c!14490 () Bool)

(declare-fun lt!437981 () tuple4!1160)

(assert (=> b!303775 (= c!14490 (= (_3!1537 lt!437981) (_4!580 lt!437981)))))

(declare-fun b!303776 () Bool)

(declare-fun res!249962 () Bool)

(declare-fun lt!437980 () (_ BitVec 32))

(assert (=> b!303776 (= res!249962 (= lt!437980 #b00000000000000000000000000000000))))

(declare-fun e!218606 () Bool)

(assert (=> b!303776 (=> res!249962 e!218606)))

(declare-fun e!218610 () Bool)

(assert (=> b!303776 (= e!218610 e!218606)))

(declare-fun b!303777 () Bool)

(declare-fun call!5606 () Bool)

(assert (=> b!303777 (= e!218606 call!5606)))

(declare-fun b!303778 () Bool)

(assert (=> b!303778 (= e!218609 e!218610)))

(declare-fun res!249959 () Bool)

(declare-fun lt!437982 () (_ BitVec 32))

(assert (=> b!303778 (= res!249959 (byteRangesEq!0 (select (arr!9092 a1!948) (_3!1537 lt!437981)) (select (arr!9092 a2!948) (_3!1537 lt!437981)) lt!437982 #b00000000000000000000000000001000))))

(assert (=> b!303778 (=> (not res!249959) (not e!218610))))

(declare-fun b!303779 () Bool)

(assert (=> b!303779 (= e!218611 e!218607)))

(declare-fun res!249963 () Bool)

(assert (=> b!303779 (=> (not res!249963) (not e!218607))))

(declare-fun e!218608 () Bool)

(assert (=> b!303779 (= res!249963 e!218608)))

(declare-fun res!249960 () Bool)

(assert (=> b!303779 (=> res!249960 e!218608)))

(assert (=> b!303779 (= res!249960 (bvsge (_1!13235 lt!437981) (_2!13235 lt!437981)))))

(assert (=> b!303779 (= lt!437980 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303779 (= lt!437982 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303779 (= lt!437981 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303780 () Bool)

(assert (=> b!303780 (= e!218608 (arrayRangesEq!1638 a1!948 a2!948 (_1!13235 lt!437981) (_2!13235 lt!437981)))))

(declare-fun b!303781 () Bool)

(assert (=> b!303781 (= e!218609 call!5606)))

(declare-fun bm!5603 () Bool)

(assert (=> bm!5603 (= call!5606 (byteRangesEq!0 (ite c!14490 (select (arr!9092 a1!948) (_3!1537 lt!437981)) (select (arr!9092 a1!948) (_4!580 lt!437981))) (ite c!14490 (select (arr!9092 a2!948) (_3!1537 lt!437981)) (select (arr!9092 a2!948) (_4!580 lt!437981))) (ite c!14490 lt!437982 #b00000000000000000000000000000000) lt!437980))))

(assert (= (and d!101460 (not res!249961)) b!303779))

(assert (= (and b!303779 (not res!249960)) b!303780))

(assert (= (and b!303779 res!249963) b!303775))

(assert (= (and b!303775 c!14490) b!303781))

(assert (= (and b!303775 (not c!14490)) b!303778))

(assert (= (and b!303778 res!249959) b!303776))

(assert (= (and b!303776 (not res!249962)) b!303777))

(assert (= (or b!303781 b!303777) bm!5603))

(declare-fun m!442339 () Bool)

(assert (=> b!303778 m!442339))

(declare-fun m!442341 () Bool)

(assert (=> b!303778 m!442341))

(assert (=> b!303778 m!442339))

(assert (=> b!303778 m!442341))

(declare-fun m!442343 () Bool)

(assert (=> b!303778 m!442343))

(assert (=> b!303779 m!442293))

(declare-fun m!442345 () Bool)

(assert (=> b!303780 m!442345))

(declare-fun m!442347 () Bool)

(assert (=> bm!5603 m!442347))

(assert (=> bm!5603 m!442339))

(assert (=> bm!5603 m!442341))

(declare-fun m!442349 () Bool)

(assert (=> bm!5603 m!442349))

(declare-fun m!442351 () Bool)

(assert (=> bm!5603 m!442351))

(assert (=> b!303718 d!101460))

(declare-fun d!101472 () Bool)

(assert (=> d!101472 (= (byteRangesEq!0 (select (arr!9092 a1!948) (_3!1537 lt!437952)) (select (arr!9092 a2!948) (_3!1537 lt!437952)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9092 a1!948) (_3!1537 lt!437952))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9092 a2!948) (_3!1537 lt!437952))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26157 () Bool)

(assert (= bs!26157 d!101472))

(declare-fun m!442357 () Bool)

(assert (=> bs!26157 m!442357))

(declare-fun m!442359 () Bool)

(assert (=> bs!26157 m!442359))

(assert (=> b!303723 d!101472))

(check-sat (not b!303779) (not bm!5603) (not b!303778) (not d!101456) (not b!303754) (not b!303780))
(check-sat)
