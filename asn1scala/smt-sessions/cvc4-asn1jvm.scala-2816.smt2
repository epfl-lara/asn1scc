; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67936 () Bool)

(assert start!67936)

(declare-fun b!305038 () Bool)

(declare-datatypes ((Unit!21291 0))(
  ( (Unit!21292) )
))
(declare-fun e!219649 () Unit!21291)

(declare-fun Unit!21293 () Unit!21291)

(assert (=> b!305038 (= e!219649 Unit!21293)))

(declare-fun b!305039 () Bool)

(declare-fun e!219650 () Unit!21291)

(declare-fun lt!438725 () Unit!21291)

(assert (=> b!305039 (= e!219650 lt!438725)))

(declare-datatypes ((tuple4!1210 0))(
  ( (tuple4!1211 (_1!13260 (_ BitVec 32)) (_2!13260 (_ BitVec 32)) (_3!1562 (_ BitVec 32)) (_4!605 (_ BitVec 32))) )
))
(declare-fun lt!438731 () tuple4!1210)

(declare-datatypes ((array!18525 0))(
  ( (array!18526 (arr!9117 (Array (_ BitVec 32) (_ BitVec 8))) (size!8034 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18525)

(declare-fun a2!948 () array!18525)

(declare-fun lt!438726 () tuple4!1210)

(declare-fun arrayRangesEqImpliesEq!267 (array!18525 array!18525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21291)

(assert (=> b!305039 (= lt!438725 (arrayRangesEqImpliesEq!267 a1!948 a2!948 (_1!13260 lt!438731) (_3!1562 lt!438726) (_2!13260 lt!438731)))))

(assert (=> b!305039 (= (select (arr!9117 a1!948) (_3!1562 lt!438726)) (select (arr!9117 a2!948) (_3!1562 lt!438726)))))

(declare-fun b!305040 () Bool)

(declare-fun e!219653 () Bool)

(assert (=> b!305040 (= e!219653 (and (bvslt (_4!605 lt!438726) (_4!605 lt!438731)) (bvslt (_3!1562 lt!438731) (_4!605 lt!438726)) (bvsle #b00000000000000000000000000000000 (_1!13260 lt!438731)) (bvsle (_1!13260 lt!438731) (_2!13260 lt!438731)) (bvsgt (_2!13260 lt!438731) (size!8034 a1!948))))))

(declare-fun lt!438732 () Unit!21291)

(assert (=> b!305040 (= lt!438732 e!219650)))

(declare-fun c!14702 () Bool)

(assert (=> b!305040 (= c!14702 (and (bvslt (_3!1562 lt!438731) (_3!1562 lt!438726)) (bvslt (_3!1562 lt!438726) (_4!605 lt!438731))))))

(declare-fun b!305041 () Bool)

(declare-fun e!219658 () Bool)

(declare-fun e!219651 () Bool)

(assert (=> b!305041 (= e!219658 e!219651)))

(declare-fun res!250805 () Bool)

(assert (=> b!305041 (=> (not res!250805) (not e!219651))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!438727 () (_ BitVec 64))

(assert (=> b!305041 (= res!250805 (and (bvsle toBit!258 lt!438727) (bvsle fromBit!258 lt!438727)))))

(assert (=> b!305041 (= lt!438727 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8034 a1!948))))))

(declare-fun b!305042 () Bool)

(declare-fun res!250800 () Bool)

(assert (=> b!305042 (=> (not res!250800) (not e!219651))))

(declare-fun arrayBitRangesEq!0 (array!18525 array!18525 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305042 (= res!250800 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!305043 () Bool)

(declare-fun res!250803 () Bool)

(declare-fun lt!438728 () (_ BitVec 32))

(assert (=> b!305043 (= res!250803 (= lt!438728 #b00000000000000000000000000000000))))

(declare-fun e!219655 () Bool)

(assert (=> b!305043 (=> res!250803 e!219655)))

(declare-fun e!219654 () Bool)

(assert (=> b!305043 (= e!219654 e!219655)))

(declare-fun b!305044 () Bool)

(assert (=> b!305044 (= e!219651 e!219653)))

(declare-fun res!250801 () Bool)

(assert (=> b!305044 (=> (not res!250801) (not e!219653))))

(declare-fun e!219656 () Bool)

(assert (=> b!305044 (= res!250801 e!219656)))

(declare-fun c!14703 () Bool)

(assert (=> b!305044 (= c!14703 (= (_3!1562 lt!438731) (_4!605 lt!438731)))))

(declare-fun lt!438729 () Unit!21291)

(assert (=> b!305044 (= lt!438729 e!219649)))

(declare-fun c!14701 () Bool)

(assert (=> b!305044 (= c!14701 (bvslt (_1!13260 lt!438726) (_2!13260 lt!438726)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1210)

(assert (=> b!305044 (= lt!438726 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!305044 (= lt!438728 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438724 () (_ BitVec 32))

(assert (=> b!305044 (= lt!438724 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305044 (= lt!438731 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun bm!5717 () Bool)

(declare-fun call!5720 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5717 (= call!5720 (byteRangesEq!0 (ite c!14703 (select (arr!9117 a1!948) (_3!1562 lt!438731)) (select (arr!9117 a1!948) (_4!605 lt!438731))) (ite c!14703 (select (arr!9117 a2!948) (_3!1562 lt!438731)) (select (arr!9117 a2!948) (_4!605 lt!438731))) (ite c!14703 lt!438724 #b00000000000000000000000000000000) lt!438728))))

(declare-fun b!305045 () Bool)

(assert (=> b!305045 (= e!219655 call!5720)))

(declare-fun b!305046 () Bool)

(declare-fun lt!438730 () Unit!21291)

(assert (=> b!305046 (= e!219649 lt!438730)))

(declare-fun arrayRangesEqSlicedLemma!258 (array!18525 array!18525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21291)

(assert (=> b!305046 (= lt!438730 (arrayRangesEqSlicedLemma!258 a1!948 a2!948 (_1!13260 lt!438731) (_2!13260 lt!438731) (_1!13260 lt!438726) (_2!13260 lt!438726)))))

(declare-fun arrayRangesEq!1663 (array!18525 array!18525 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305046 (arrayRangesEq!1663 a1!948 a2!948 (_1!13260 lt!438726) (_2!13260 lt!438726))))

(declare-fun res!250806 () Bool)

(assert (=> start!67936 (=> (not res!250806) (not e!219658))))

(assert (=> start!67936 (= res!250806 (and (bvsle (size!8034 a1!948) (size!8034 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67936 e!219658))

(assert (=> start!67936 true))

(declare-fun array_inv!7646 (array!18525) Bool)

(assert (=> start!67936 (array_inv!7646 a1!948)))

(assert (=> start!67936 (array_inv!7646 a2!948)))

(declare-fun b!305047 () Bool)

(declare-fun res!250804 () Bool)

(assert (=> b!305047 (=> (not res!250804) (not e!219651))))

(assert (=> b!305047 (= res!250804 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438727) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!305048 () Bool)

(assert (=> b!305048 (= e!219656 call!5720)))

(declare-fun b!305049 () Bool)

(assert (=> b!305049 (= e!219656 e!219654)))

(declare-fun res!250802 () Bool)

(assert (=> b!305049 (= res!250802 (byteRangesEq!0 (select (arr!9117 a1!948) (_3!1562 lt!438731)) (select (arr!9117 a2!948) (_3!1562 lt!438731)) lt!438724 #b00000000000000000000000000000111))))

(assert (=> b!305049 (=> (not res!250802) (not e!219654))))

(declare-fun b!305050 () Bool)

(declare-fun Unit!21294 () Unit!21291)

(assert (=> b!305050 (= e!219650 Unit!21294)))

(assert (= (and start!67936 res!250806) b!305041))

(assert (= (and b!305041 res!250805) b!305042))

(assert (= (and b!305042 res!250800) b!305047))

(assert (= (and b!305047 res!250804) b!305044))

(assert (= (and b!305044 c!14701) b!305046))

(assert (= (and b!305044 (not c!14701)) b!305038))

(assert (= (and b!305044 c!14703) b!305048))

(assert (= (and b!305044 (not c!14703)) b!305049))

(assert (= (and b!305049 res!250802) b!305043))

(assert (= (and b!305043 (not res!250803)) b!305045))

(assert (= (or b!305048 b!305045) bm!5717))

(assert (= (and b!305044 res!250801) b!305040))

(assert (= (and b!305040 c!14702) b!305039))

(assert (= (and b!305040 (not c!14702)) b!305050))

(declare-fun m!443491 () Bool)

(assert (=> b!305039 m!443491))

(declare-fun m!443493 () Bool)

(assert (=> b!305039 m!443493))

(declare-fun m!443495 () Bool)

(assert (=> b!305039 m!443495))

(declare-fun m!443497 () Bool)

(assert (=> start!67936 m!443497))

(declare-fun m!443499 () Bool)

(assert (=> start!67936 m!443499))

(declare-fun m!443501 () Bool)

(assert (=> b!305049 m!443501))

(declare-fun m!443503 () Bool)

(assert (=> b!305049 m!443503))

(assert (=> b!305049 m!443501))

(assert (=> b!305049 m!443503))

(declare-fun m!443505 () Bool)

(assert (=> b!305049 m!443505))

(declare-fun m!443507 () Bool)

(assert (=> b!305042 m!443507))

(declare-fun m!443509 () Bool)

(assert (=> bm!5717 m!443509))

(assert (=> bm!5717 m!443503))

(assert (=> bm!5717 m!443501))

(declare-fun m!443511 () Bool)

(assert (=> bm!5717 m!443511))

(declare-fun m!443513 () Bool)

(assert (=> bm!5717 m!443513))

(declare-fun m!443515 () Bool)

(assert (=> b!305046 m!443515))

(declare-fun m!443517 () Bool)

(assert (=> b!305046 m!443517))

(declare-fun m!443519 () Bool)

(assert (=> b!305044 m!443519))

(declare-fun m!443521 () Bool)

(assert (=> b!305044 m!443521))

(push 1)

(assert (not b!305049))

(assert (not b!305046))

(assert (not b!305039))

(assert (not b!305042))

(assert (not start!67936))

(assert (not bm!5717))

(assert (not b!305044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101828 () Bool)

(assert (=> d!101828 (= (byteRangesEq!0 (ite c!14703 (select (arr!9117 a1!948) (_3!1562 lt!438731)) (select (arr!9117 a1!948) (_4!605 lt!438731))) (ite c!14703 (select (arr!9117 a2!948) (_3!1562 lt!438731)) (select (arr!9117 a2!948) (_4!605 lt!438731))) (ite c!14703 lt!438724 #b00000000000000000000000000000000) lt!438728) (or (= (ite c!14703 lt!438724 #b00000000000000000000000000000000) lt!438728) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14703 (select (arr!9117 a1!948) (_3!1562 lt!438731)) (select (arr!9117 a1!948) (_4!605 lt!438731)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14703 lt!438724 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14703 (select (arr!9117 a2!948) (_3!1562 lt!438731)) (select (arr!9117 a2!948) (_4!605 lt!438731)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14703 lt!438724 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26239 () Bool)

(assert (= bs!26239 d!101828))

(declare-fun m!443577 () Bool)

(assert (=> bs!26239 m!443577))

(declare-fun m!443583 () Bool)

(assert (=> bs!26239 m!443583))

(assert (=> bm!5717 d!101828))

(declare-fun d!101830 () Bool)

(assert (=> d!101830 (arrayRangesEq!1663 a1!948 a2!948 (_1!13260 lt!438726) (_2!13260 lt!438726))))

(declare-fun lt!438765 () Unit!21291)

(declare-fun choose!588 (array!18525 array!18525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21291)

(assert (=> d!101830 (= lt!438765 (choose!588 a1!948 a2!948 (_1!13260 lt!438731) (_2!13260 lt!438731) (_1!13260 lt!438726) (_2!13260 lt!438726)))))

(assert (=> d!101830 (and (bvsle #b00000000000000000000000000000000 (_1!13260 lt!438731)) (bvsle (_1!13260 lt!438731) (_2!13260 lt!438731)))))

(assert (=> d!101830 (= (arrayRangesEqSlicedLemma!258 a1!948 a2!948 (_1!13260 lt!438731) (_2!13260 lt!438731) (_1!13260 lt!438726) (_2!13260 lt!438726)) lt!438765)))

(declare-fun bs!26241 () Bool)

(assert (= bs!26241 d!101830))

(assert (=> bs!26241 m!443517))

(declare-fun m!443591 () Bool)

(assert (=> bs!26241 m!443591))

(assert (=> b!305046 d!101830))

(declare-fun d!101836 () Bool)

(declare-fun res!250853 () Bool)

(declare-fun e!219711 () Bool)

(assert (=> d!101836 (=> res!250853 e!219711)))

(assert (=> d!101836 (= res!250853 (= (_1!13260 lt!438726) (_2!13260 lt!438726)))))

(assert (=> d!101836 (= (arrayRangesEq!1663 a1!948 a2!948 (_1!13260 lt!438726) (_2!13260 lt!438726)) e!219711)))

(declare-fun b!305109 () Bool)

(declare-fun e!219712 () Bool)

(assert (=> b!305109 (= e!219711 e!219712)))

(declare-fun res!250854 () Bool)

(assert (=> b!305109 (=> (not res!250854) (not e!219712))))

(assert (=> b!305109 (= res!250854 (= (select (arr!9117 a1!948) (_1!13260 lt!438726)) (select (arr!9117 a2!948) (_1!13260 lt!438726))))))

(declare-fun b!305110 () Bool)

(assert (=> b!305110 (= e!219712 (arrayRangesEq!1663 a1!948 a2!948 (bvadd (_1!13260 lt!438726) #b00000000000000000000000000000001) (_2!13260 lt!438726)))))

(assert (= (and d!101836 (not res!250853)) b!305109))

(assert (= (and b!305109 res!250854) b!305110))

(declare-fun m!443593 () Bool)

(assert (=> b!305109 m!443593))

(declare-fun m!443595 () Bool)

(assert (=> b!305109 m!443595))

(declare-fun m!443597 () Bool)

(assert (=> b!305110 m!443597))

(assert (=> b!305046 d!101836))

(declare-fun d!101840 () Bool)

(assert (=> d!101840 (= (array_inv!7646 a1!948) (bvsge (size!8034 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67936 d!101840))

(declare-fun d!101842 () Bool)

(assert (=> d!101842 (= (array_inv!7646 a2!948) (bvsge (size!8034 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67936 d!101842))

(declare-fun b!305125 () Bool)

(declare-fun e!219725 () Bool)

(declare-fun e!219727 () Bool)

(assert (=> b!305125 (= e!219725 e!219727)))

(declare-fun res!250869 () Bool)

(assert (=> b!305125 (=> (not res!250869) (not e!219727))))

(declare-fun e!219726 () Bool)

(assert (=> b!305125 (= res!250869 e!219726)))

(declare-fun res!250866 () Bool)

(assert (=> b!305125 (=> res!250866 e!219726)))

(declare-fun lt!438772 () tuple4!1210)

(assert (=> b!305125 (= res!250866 (bvsge (_1!13260 lt!438772) (_2!13260 lt!438772)))))

(declare-fun lt!438773 () (_ BitVec 32))

(assert (=> b!305125 (= lt!438773 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438774 () (_ BitVec 32))

(assert (=> b!305125 (= lt!438774 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305125 (= lt!438772 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!101844 () Bool)

(declare-fun res!250867 () Bool)

(assert (=> d!101844 (=> res!250867 e!219725)))

(assert (=> d!101844 (= res!250867 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101844 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219725)))

(declare-fun b!305126 () Bool)

(declare-fun e!219730 () Bool)

(assert (=> b!305126 (= e!219727 e!219730)))

(declare-fun c!14712 () Bool)

(assert (=> b!305126 (= c!14712 (= (_3!1562 lt!438772) (_4!605 lt!438772)))))

(declare-fun call!5729 () Bool)

(declare-fun bm!5726 () Bool)

(assert (=> bm!5726 (= call!5729 (byteRangesEq!0 (ite c!14712 (select (arr!9117 a1!948) (_3!1562 lt!438772)) (select (arr!9117 a1!948) (_4!605 lt!438772))) (ite c!14712 (select (arr!9117 a2!948) (_3!1562 lt!438772)) (select (arr!9117 a2!948) (_4!605 lt!438772))) (ite c!14712 lt!438774 #b00000000000000000000000000000000) lt!438773))))

(declare-fun b!305127 () Bool)

(declare-fun e!219729 () Bool)

(assert (=> b!305127 (= e!219729 call!5729)))

(declare-fun b!305128 () Bool)

(declare-fun e!219728 () Bool)

(assert (=> b!305128 (= e!219730 e!219728)))

(declare-fun res!250865 () Bool)

(assert (=> b!305128 (= res!250865 (byteRangesEq!0 (select (arr!9117 a1!948) (_3!1562 lt!438772)) (select (arr!9117 a2!948) (_3!1562 lt!438772)) lt!438774 #b00000000000000000000000000001000))))

(assert (=> b!305128 (=> (not res!250865) (not e!219728))))

(declare-fun b!305129 () Bool)

(assert (=> b!305129 (= e!219726 (arrayRangesEq!1663 a1!948 a2!948 (_1!13260 lt!438772) (_2!13260 lt!438772)))))

(declare-fun b!305130 () Bool)

(assert (=> b!305130 (= e!219730 call!5729)))

(declare-fun b!305131 () Bool)

(declare-fun res!250868 () Bool)

(assert (=> b!305131 (= res!250868 (= lt!438773 #b00000000000000000000000000000000))))

(assert (=> b!305131 (=> res!250868 e!219729)))

(assert (=> b!305131 (= e!219728 e!219729)))

(assert (= (and d!101844 (not res!250867)) b!305125))

(assert (= (and b!305125 (not res!250866)) b!305129))

(assert (= (and b!305125 res!250869) b!305126))

(assert (= (and b!305126 c!14712) b!305130))

(assert (= (and b!305126 (not c!14712)) b!305128))

(assert (= (and b!305128 res!250865) b!305131))

(assert (= (and b!305131 (not res!250868)) b!305127))

(assert (= (or b!305130 b!305127) bm!5726))

(assert (=> b!305125 m!443521))

(declare-fun m!443599 () Bool)

(assert (=> bm!5726 m!443599))

(declare-fun m!443601 () Bool)

(assert (=> bm!5726 m!443601))

(declare-fun m!443603 () Bool)

(assert (=> bm!5726 m!443603))

(declare-fun m!443605 () Bool)

(assert (=> bm!5726 m!443605))

(declare-fun m!443607 () Bool)

(assert (=> bm!5726 m!443607))

(assert (=> b!305128 m!443605))

(assert (=> b!305128 m!443603))

(assert (=> b!305128 m!443605))

(assert (=> b!305128 m!443603))

(declare-fun m!443609 () Bool)

(assert (=> b!305128 m!443609))

(declare-fun m!443611 () Bool)

(assert (=> b!305129 m!443611))

(assert (=> b!305042 d!101844))

(declare-fun d!101846 () Bool)

(assert (=> d!101846 (and (bvsge (_3!1562 lt!438726) #b00000000000000000000000000000000) (bvslt (_3!1562 lt!438726) (size!8034 a1!948)) (bvslt (_3!1562 lt!438726) (size!8034 a2!948)) (= (select (arr!9117 a1!948) (_3!1562 lt!438726)) (select (arr!9117 a2!948) (_3!1562 lt!438726))))))

(declare-fun lt!438777 () Unit!21291)

(declare-fun choose!589 (array!18525 array!18525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21291)

(assert (=> d!101846 (= lt!438777 (choose!589 a1!948 a2!948 (_1!13260 lt!438731) (_3!1562 lt!438726) (_2!13260 lt!438731)))))

(assert (=> d!101846 (and (bvsle #b00000000000000000000000000000000 (_1!13260 lt!438731)) (bvsle (_1!13260 lt!438731) (_2!13260 lt!438731)))))

(assert (=> d!101846 (= (arrayRangesEqImpliesEq!267 a1!948 a2!948 (_1!13260 lt!438731) (_3!1562 lt!438726) (_2!13260 lt!438731)) lt!438777)))

(declare-fun bs!26242 () Bool)

(assert (= bs!26242 d!101846))

(assert (=> bs!26242 m!443493))

(assert (=> bs!26242 m!443495))

(declare-fun m!443613 () Bool)

(assert (=> bs!26242 m!443613))

(assert (=> b!305039 d!101846))

(declare-fun d!101848 () Bool)

(assert (=> d!101848 (= (byteRangesEq!0 (select (arr!9117 a1!948) (_3!1562 lt!438731)) (select (arr!9117 a2!948) (_3!1562 lt!438731)) lt!438724 #b00000000000000000000000000000111) (or (= lt!438724 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9117 a1!948) (_3!1562 lt!438731))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438724)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9117 a2!948) (_3!1562 lt!438731))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438724)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26243 () Bool)

(assert (= bs!26243 d!101848))

(declare-fun m!443615 () Bool)

(assert (=> bs!26243 m!443615))

(declare-fun m!443617 () Bool)

(assert (=> bs!26243 m!443617))

(assert (=> b!305049 d!101848))

(declare-fun d!101850 () Bool)

(assert (=> d!101850 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1211 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305044 d!101850))

(declare-fun d!101852 () Bool)

(assert (=> d!101852 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1211 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305044 d!101852))

(push 1)

(assert (not d!101830))

(assert (not b!305128))

(assert (not b!305110))

(assert (not b!305125))

(assert (not b!305129))

(assert (not bm!5726))

(assert (not d!101846))

(check-sat)

