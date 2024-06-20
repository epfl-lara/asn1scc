; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66912 () Bool)

(assert start!66912)

(declare-fun b!299146 () Bool)

(declare-datatypes ((Unit!20872 0))(
  ( (Unit!20873) )
))
(declare-fun e!214725 () Unit!20872)

(declare-fun lt!435045 () Unit!20872)

(assert (=> b!299146 (= e!214725 lt!435045)))

(declare-datatypes ((array!18139 0))(
  ( (array!18140 (arr!8957 (Array (_ BitVec 32) (_ BitVec 8))) (size!7874 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18139)

(declare-fun a2!948 () array!18139)

(declare-datatypes ((tuple4!956 0))(
  ( (tuple4!957 (_1!13133 (_ BitVec 32)) (_2!13133 (_ BitVec 32)) (_3!1435 (_ BitVec 32)) (_4!478 (_ BitVec 32))) )
))
(declare-fun lt!435040 () tuple4!956)

(declare-fun lt!435041 () tuple4!956)

(declare-fun arrayRangesEqSlicedLemma!146 (array!18139 array!18139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20872)

(assert (=> b!299146 (= lt!435045 (arrayRangesEqSlicedLemma!146 a1!948 a2!948 (_1!13133 lt!435040) (_2!13133 lt!435040) (_1!13133 lt!435041) (_2!13133 lt!435041)))))

(declare-fun arrayRangesEq!1536 (array!18139 array!18139 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299146 (arrayRangesEq!1536 a1!948 a2!948 (_1!13133 lt!435041) (_2!13133 lt!435041))))

(declare-fun b!299147 () Bool)

(declare-fun e!214724 () Bool)

(declare-fun e!214728 () Bool)

(assert (=> b!299147 (= e!214724 e!214728)))

(declare-fun res!246896 () Bool)

(assert (=> b!299147 (=> (not res!246896) (not e!214728))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435043 () (_ BitVec 64))

(assert (=> b!299147 (= res!246896 (and (bvsle toBit!258 lt!435043) (bvsle fromBit!258 lt!435043)))))

(assert (=> b!299147 (= lt!435043 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7874 a1!948))))))

(declare-fun res!246897 () Bool)

(assert (=> start!66912 (=> (not res!246897) (not e!214724))))

(assert (=> start!66912 (= res!246897 (and (bvsle (size!7874 a1!948) (size!7874 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66912 e!214724))

(assert (=> start!66912 true))

(declare-fun array_inv!7486 (array!18139) Bool)

(assert (=> start!66912 (array_inv!7486 a1!948)))

(assert (=> start!66912 (array_inv!7486 a2!948)))

(declare-fun b!299148 () Bool)

(declare-fun lt!435039 () (_ BitVec 32))

(declare-fun lt!435042 () (_ BitVec 32))

(assert (=> b!299148 (= e!214728 (and (= (_3!1435 lt!435040) (_4!478 lt!435040)) (or (bvsgt #b00000000000000000000000000000000 lt!435039) (bvsgt lt!435039 lt!435042) (bvsgt lt!435042 #b00000000000000000000000000001000))))))

(declare-fun lt!435044 () Unit!20872)

(assert (=> b!299148 (= lt!435044 e!214725)))

(declare-fun c!13707 () Bool)

(assert (=> b!299148 (= c!13707 (bvslt (_1!13133 lt!435041) (_2!13133 lt!435041)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!956)

(assert (=> b!299148 (= lt!435041 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299148 (= lt!435042 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299148 (= lt!435039 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299148 (= lt!435040 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299149 () Bool)

(declare-fun Unit!20874 () Unit!20872)

(assert (=> b!299149 (= e!214725 Unit!20874)))

(declare-fun b!299150 () Bool)

(declare-fun res!246898 () Bool)

(assert (=> b!299150 (=> (not res!246898) (not e!214728))))

(declare-fun arrayBitRangesEq!0 (array!18139 array!18139 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299150 (= res!246898 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299151 () Bool)

(declare-fun res!246899 () Bool)

(assert (=> b!299151 (=> (not res!246899) (not e!214728))))

(assert (=> b!299151 (= res!246899 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435043) (not (= fromSlice!52 toSlice!52))))))

(assert (= (and start!66912 res!246897) b!299147))

(assert (= (and b!299147 res!246896) b!299150))

(assert (= (and b!299150 res!246898) b!299151))

(assert (= (and b!299151 res!246899) b!299148))

(assert (= (and b!299148 c!13707) b!299146))

(assert (= (and b!299148 (not c!13707)) b!299149))

(declare-fun m!438369 () Bool)

(assert (=> b!299146 m!438369))

(declare-fun m!438371 () Bool)

(assert (=> b!299146 m!438371))

(declare-fun m!438373 () Bool)

(assert (=> start!66912 m!438373))

(declare-fun m!438375 () Bool)

(assert (=> start!66912 m!438375))

(declare-fun m!438377 () Bool)

(assert (=> b!299148 m!438377))

(declare-fun m!438379 () Bool)

(assert (=> b!299148 m!438379))

(declare-fun m!438381 () Bool)

(assert (=> b!299150 m!438381))

(check-sat (not b!299150) (not b!299148) (not b!299146) (not start!66912))
(check-sat)
(get-model)

(declare-fun c!13713 () Bool)

(declare-fun lt!435073 () (_ BitVec 32))

(declare-fun lt!435075 () (_ BitVec 32))

(declare-fun call!5315 () Bool)

(declare-fun lt!435074 () tuple4!956)

(declare-fun bm!5312 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5312 (= call!5315 (byteRangesEq!0 (ite c!13713 (select (arr!8957 a1!948) (_3!1435 lt!435074)) (select (arr!8957 a1!948) (_4!478 lt!435074))) (ite c!13713 (select (arr!8957 a2!948) (_3!1435 lt!435074)) (select (arr!8957 a2!948) (_4!478 lt!435074))) (ite c!13713 lt!435073 #b00000000000000000000000000000000) lt!435075))))

(declare-fun b!299184 () Bool)

(declare-fun res!246926 () Bool)

(assert (=> b!299184 (= res!246926 (= lt!435075 #b00000000000000000000000000000000))))

(declare-fun e!214760 () Bool)

(assert (=> b!299184 (=> res!246926 e!214760)))

(declare-fun e!214757 () Bool)

(assert (=> b!299184 (= e!214757 e!214760)))

(declare-fun e!214756 () Bool)

(declare-fun b!299185 () Bool)

(assert (=> b!299185 (= e!214756 (arrayRangesEq!1536 a1!948 a2!948 (_1!13133 lt!435074) (_2!13133 lt!435074)))))

(declare-fun b!299186 () Bool)

(declare-fun e!214758 () Bool)

(assert (=> b!299186 (= e!214758 call!5315)))

(declare-fun d!100598 () Bool)

(declare-fun res!246922 () Bool)

(declare-fun e!214759 () Bool)

(assert (=> d!100598 (=> res!246922 e!214759)))

(assert (=> d!100598 (= res!246922 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100598 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!214759)))

(declare-fun b!299187 () Bool)

(assert (=> b!299187 (= e!214760 call!5315)))

(declare-fun b!299188 () Bool)

(declare-fun e!214761 () Bool)

(assert (=> b!299188 (= e!214761 e!214758)))

(assert (=> b!299188 (= c!13713 (= (_3!1435 lt!435074) (_4!478 lt!435074)))))

(declare-fun b!299189 () Bool)

(assert (=> b!299189 (= e!214759 e!214761)))

(declare-fun res!246925 () Bool)

(assert (=> b!299189 (=> (not res!246925) (not e!214761))))

(assert (=> b!299189 (= res!246925 e!214756)))

(declare-fun res!246924 () Bool)

(assert (=> b!299189 (=> res!246924 e!214756)))

(assert (=> b!299189 (= res!246924 (bvsge (_1!13133 lt!435074) (_2!13133 lt!435074)))))

(assert (=> b!299189 (= lt!435075 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299189 (= lt!435073 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299189 (= lt!435074 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299190 () Bool)

(assert (=> b!299190 (= e!214758 e!214757)))

(declare-fun res!246923 () Bool)

(assert (=> b!299190 (= res!246923 (byteRangesEq!0 (select (arr!8957 a1!948) (_3!1435 lt!435074)) (select (arr!8957 a2!948) (_3!1435 lt!435074)) lt!435073 #b00000000000000000000000000001000))))

(assert (=> b!299190 (=> (not res!246923) (not e!214757))))

(assert (= (and d!100598 (not res!246922)) b!299189))

(assert (= (and b!299189 (not res!246924)) b!299185))

(assert (= (and b!299189 res!246925) b!299188))

(assert (= (and b!299188 c!13713) b!299186))

(assert (= (and b!299188 (not c!13713)) b!299190))

(assert (= (and b!299190 res!246923) b!299184))

(assert (= (and b!299184 (not res!246926)) b!299187))

(assert (= (or b!299186 b!299187) bm!5312))

(declare-fun m!438397 () Bool)

(assert (=> bm!5312 m!438397))

(declare-fun m!438399 () Bool)

(assert (=> bm!5312 m!438399))

(declare-fun m!438401 () Bool)

(assert (=> bm!5312 m!438401))

(declare-fun m!438403 () Bool)

(assert (=> bm!5312 m!438403))

(declare-fun m!438405 () Bool)

(assert (=> bm!5312 m!438405))

(declare-fun m!438407 () Bool)

(assert (=> b!299185 m!438407))

(assert (=> b!299189 m!438379))

(assert (=> b!299190 m!438405))

(assert (=> b!299190 m!438397))

(assert (=> b!299190 m!438405))

(assert (=> b!299190 m!438397))

(declare-fun m!438409 () Bool)

(assert (=> b!299190 m!438409))

(assert (=> b!299150 d!100598))

(declare-fun d!100600 () Bool)

(assert (=> d!100600 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!957 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!299148 d!100600))

(declare-fun d!100602 () Bool)

(assert (=> d!100602 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!957 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!299148 d!100602))

(declare-fun d!100604 () Bool)

(assert (=> d!100604 (arrayRangesEq!1536 a1!948 a2!948 (_1!13133 lt!435041) (_2!13133 lt!435041))))

(declare-fun lt!435078 () Unit!20872)

(declare-fun choose!518 (array!18139 array!18139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20872)

(assert (=> d!100604 (= lt!435078 (choose!518 a1!948 a2!948 (_1!13133 lt!435040) (_2!13133 lt!435040) (_1!13133 lt!435041) (_2!13133 lt!435041)))))

(assert (=> d!100604 (and (bvsle #b00000000000000000000000000000000 (_1!13133 lt!435040)) (bvsle (_1!13133 lt!435040) (_2!13133 lt!435040)))))

(assert (=> d!100604 (= (arrayRangesEqSlicedLemma!146 a1!948 a2!948 (_1!13133 lt!435040) (_2!13133 lt!435040) (_1!13133 lt!435041) (_2!13133 lt!435041)) lt!435078)))

(declare-fun bs!25908 () Bool)

(assert (= bs!25908 d!100604))

(assert (=> bs!25908 m!438371))

(declare-fun m!438411 () Bool)

(assert (=> bs!25908 m!438411))

(assert (=> b!299146 d!100604))

(declare-fun d!100606 () Bool)

(declare-fun res!246931 () Bool)

(declare-fun e!214766 () Bool)

(assert (=> d!100606 (=> res!246931 e!214766)))

(assert (=> d!100606 (= res!246931 (= (_1!13133 lt!435041) (_2!13133 lt!435041)))))

(assert (=> d!100606 (= (arrayRangesEq!1536 a1!948 a2!948 (_1!13133 lt!435041) (_2!13133 lt!435041)) e!214766)))

(declare-fun b!299195 () Bool)

(declare-fun e!214767 () Bool)

(assert (=> b!299195 (= e!214766 e!214767)))

(declare-fun res!246932 () Bool)

(assert (=> b!299195 (=> (not res!246932) (not e!214767))))

(assert (=> b!299195 (= res!246932 (= (select (arr!8957 a1!948) (_1!13133 lt!435041)) (select (arr!8957 a2!948) (_1!13133 lt!435041))))))

(declare-fun b!299196 () Bool)

(assert (=> b!299196 (= e!214767 (arrayRangesEq!1536 a1!948 a2!948 (bvadd (_1!13133 lt!435041) #b00000000000000000000000000000001) (_2!13133 lt!435041)))))

(assert (= (and d!100606 (not res!246931)) b!299195))

(assert (= (and b!299195 res!246932) b!299196))

(declare-fun m!438413 () Bool)

(assert (=> b!299195 m!438413))

(declare-fun m!438415 () Bool)

(assert (=> b!299195 m!438415))

(declare-fun m!438417 () Bool)

(assert (=> b!299196 m!438417))

(assert (=> b!299146 d!100606))

(declare-fun d!100608 () Bool)

(assert (=> d!100608 (= (array_inv!7486 a1!948) (bvsge (size!7874 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!66912 d!100608))

(declare-fun d!100610 () Bool)

(assert (=> d!100610 (= (array_inv!7486 a2!948) (bvsge (size!7874 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!66912 d!100610))

(check-sat (not b!299196) (not bm!5312) (not b!299189) (not b!299185) (not d!100604) (not b!299190))
(check-sat)
