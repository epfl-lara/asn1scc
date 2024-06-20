; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67550 () Bool)

(assert start!67550)

(declare-fun b!303284 () Bool)

(declare-fun res!249591 () Bool)

(declare-fun e!218197 () Bool)

(assert (=> b!303284 (=> (not res!249591) (not e!218197))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18430 0))(
  ( (array!18431 (arr!9083 (Array (_ BitVec 32) (_ BitVec 8))) (size!8000 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18430)

(declare-fun a2!948 () array!18430)

(declare-fun arrayBitRangesEq!0 (array!18430 array!18430 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303284 (= res!249591 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303285 () Bool)

(declare-fun res!249588 () Bool)

(assert (=> b!303285 (=> (not res!249588) (not e!218197))))

(declare-fun lt!437706 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303285 (= res!249588 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437706) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!249589 () Bool)

(declare-fun e!218195 () Bool)

(assert (=> start!67550 (=> (not res!249589) (not e!218195))))

(assert (=> start!67550 (= res!249589 (and (bvsle (size!8000 a1!948) (size!8000 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67550 e!218195))

(assert (=> start!67550 true))

(declare-fun array_inv!7612 (array!18430) Bool)

(assert (=> start!67550 (array_inv!7612 a1!948)))

(assert (=> start!67550 (array_inv!7612 a2!948)))

(declare-fun b!303286 () Bool)

(declare-datatypes ((tuple4!1142 0))(
  ( (tuple4!1143 (_1!13226 (_ BitVec 32)) (_2!13226 (_ BitVec 32)) (_3!1528 (_ BitVec 32)) (_4!571 (_ BitVec 32))) )
))
(declare-fun lt!437707 () tuple4!1142)

(assert (=> b!303286 (= e!218197 (and (not (= (_3!1528 lt!437707) (_4!571 lt!437707))) (or (bvslt (_3!1528 lt!437707) #b00000000000000000000000000000000) (bvsge (_3!1528 lt!437707) (size!8000 a1!948)))))))

(declare-datatypes ((Unit!21181 0))(
  ( (Unit!21182) )
))
(declare-fun lt!437708 () Unit!21181)

(declare-fun e!218194 () Unit!21181)

(assert (=> b!303286 (= lt!437708 e!218194)))

(declare-fun c!14430 () Bool)

(declare-fun lt!437705 () tuple4!1142)

(assert (=> b!303286 (= c!14430 (bvslt (_1!13226 lt!437705) (_2!13226 lt!437705)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1142)

(assert (=> b!303286 (= lt!437705 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303286 (= lt!437707 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303287 () Bool)

(assert (=> b!303287 (= e!218195 e!218197)))

(declare-fun res!249590 () Bool)

(assert (=> b!303287 (=> (not res!249590) (not e!218197))))

(assert (=> b!303287 (= res!249590 (and (bvsle toBit!258 lt!437706) (bvsle fromBit!258 lt!437706)))))

(assert (=> b!303287 (= lt!437706 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8000 a1!948))))))

(declare-fun b!303288 () Bool)

(declare-fun Unit!21183 () Unit!21181)

(assert (=> b!303288 (= e!218194 Unit!21183)))

(declare-fun b!303289 () Bool)

(declare-fun lt!437709 () Unit!21181)

(assert (=> b!303289 (= e!218194 lt!437709)))

(declare-fun arrayRangesEqSlicedLemma!224 (array!18430 array!18430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21181)

(assert (=> b!303289 (= lt!437709 (arrayRangesEqSlicedLemma!224 a1!948 a2!948 (_1!13226 lt!437707) (_2!13226 lt!437707) (_1!13226 lt!437705) (_2!13226 lt!437705)))))

(declare-fun arrayRangesEq!1629 (array!18430 array!18430 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303289 (arrayRangesEq!1629 a1!948 a2!948 (_1!13226 lt!437705) (_2!13226 lt!437705))))

(assert (= (and start!67550 res!249589) b!303287))

(assert (= (and b!303287 res!249590) b!303284))

(assert (= (and b!303284 res!249591) b!303285))

(assert (= (and b!303285 res!249588) b!303286))

(assert (= (and b!303286 c!14430) b!303289))

(assert (= (and b!303286 (not c!14430)) b!303288))

(declare-fun m!441923 () Bool)

(assert (=> b!303284 m!441923))

(declare-fun m!441925 () Bool)

(assert (=> start!67550 m!441925))

(declare-fun m!441927 () Bool)

(assert (=> start!67550 m!441927))

(declare-fun m!441929 () Bool)

(assert (=> b!303286 m!441929))

(declare-fun m!441931 () Bool)

(assert (=> b!303286 m!441931))

(declare-fun m!441933 () Bool)

(assert (=> b!303289 m!441933))

(declare-fun m!441935 () Bool)

(assert (=> b!303289 m!441935))

(check-sat (not b!303286) (not start!67550) (not b!303289) (not b!303284))
(check-sat)
(get-model)

(declare-fun d!101310 () Bool)

(assert (=> d!101310 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1143 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303286 d!101310))

(declare-fun d!101312 () Bool)

(assert (=> d!101312 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1143 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303286 d!101312))

(declare-fun d!101314 () Bool)

(assert (=> d!101314 (= (array_inv!7612 a1!948) (bvsge (size!8000 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67550 d!101314))

(declare-fun d!101316 () Bool)

(assert (=> d!101316 (= (array_inv!7612 a2!948) (bvsge (size!8000 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67550 d!101316))

(declare-fun d!101318 () Bool)

(assert (=> d!101318 (arrayRangesEq!1629 a1!948 a2!948 (_1!13226 lt!437705) (_2!13226 lt!437705))))

(declare-fun lt!437727 () Unit!21181)

(declare-fun choose!554 (array!18430 array!18430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21181)

(assert (=> d!101318 (= lt!437727 (choose!554 a1!948 a2!948 (_1!13226 lt!437707) (_2!13226 lt!437707) (_1!13226 lt!437705) (_2!13226 lt!437705)))))

(assert (=> d!101318 (and (bvsle #b00000000000000000000000000000000 (_1!13226 lt!437707)) (bvsle (_1!13226 lt!437707) (_2!13226 lt!437707)))))

(assert (=> d!101318 (= (arrayRangesEqSlicedLemma!224 a1!948 a2!948 (_1!13226 lt!437707) (_2!13226 lt!437707) (_1!13226 lt!437705) (_2!13226 lt!437705)) lt!437727)))

(declare-fun bs!26133 () Bool)

(assert (= bs!26133 d!101318))

(assert (=> bs!26133 m!441935))

(declare-fun m!441951 () Bool)

(assert (=> bs!26133 m!441951))

(assert (=> b!303289 d!101318))

(declare-fun d!101320 () Bool)

(declare-fun res!249608 () Bool)

(declare-fun e!218217 () Bool)

(assert (=> d!101320 (=> res!249608 e!218217)))

(assert (=> d!101320 (= res!249608 (= (_1!13226 lt!437705) (_2!13226 lt!437705)))))

(assert (=> d!101320 (= (arrayRangesEq!1629 a1!948 a2!948 (_1!13226 lt!437705) (_2!13226 lt!437705)) e!218217)))

(declare-fun b!303312 () Bool)

(declare-fun e!218218 () Bool)

(assert (=> b!303312 (= e!218217 e!218218)))

(declare-fun res!249609 () Bool)

(assert (=> b!303312 (=> (not res!249609) (not e!218218))))

(assert (=> b!303312 (= res!249609 (= (select (arr!9083 a1!948) (_1!13226 lt!437705)) (select (arr!9083 a2!948) (_1!13226 lt!437705))))))

(declare-fun b!303313 () Bool)

(assert (=> b!303313 (= e!218218 (arrayRangesEq!1629 a1!948 a2!948 (bvadd (_1!13226 lt!437705) #b00000000000000000000000000000001) (_2!13226 lt!437705)))))

(assert (= (and d!101320 (not res!249608)) b!303312))

(assert (= (and b!303312 res!249609) b!303313))

(declare-fun m!441953 () Bool)

(assert (=> b!303312 m!441953))

(declare-fun m!441955 () Bool)

(assert (=> b!303312 m!441955))

(declare-fun m!441957 () Bool)

(assert (=> b!303313 m!441957))

(assert (=> b!303289 d!101320))

(declare-fun b!303328 () Bool)

(declare-fun e!218235 () Bool)

(declare-fun call!5579 () Bool)

(assert (=> b!303328 (= e!218235 call!5579)))

(declare-fun b!303329 () Bool)

(declare-fun e!218232 () Bool)

(declare-fun lt!437738 () tuple4!1142)

(assert (=> b!303329 (= e!218232 (arrayRangesEq!1629 a1!948 a2!948 (_1!13226 lt!437738) (_2!13226 lt!437738)))))

(declare-fun b!303330 () Bool)

(declare-fun res!249622 () Bool)

(declare-fun lt!437739 () (_ BitVec 32))

(assert (=> b!303330 (= res!249622 (= lt!437739 #b00000000000000000000000000000000))))

(declare-fun e!218236 () Bool)

(assert (=> b!303330 (=> res!249622 e!218236)))

(declare-fun e!218233 () Bool)

(assert (=> b!303330 (= e!218233 e!218236)))

(declare-fun b!303331 () Bool)

(declare-fun e!218231 () Bool)

(assert (=> b!303331 (= e!218231 e!218235)))

(declare-fun c!14436 () Bool)

(assert (=> b!303331 (= c!14436 (= (_3!1528 lt!437738) (_4!571 lt!437738)))))

(declare-fun b!303332 () Bool)

(assert (=> b!303332 (= e!218235 e!218233)))

(declare-fun res!249624 () Bool)

(assert (=> b!303332 (= res!249624 call!5579)))

(assert (=> b!303332 (=> (not res!249624) (not e!218233))))

(declare-fun b!303333 () Bool)

(declare-fun e!218234 () Bool)

(assert (=> b!303333 (= e!218234 e!218231)))

(declare-fun res!249621 () Bool)

(assert (=> b!303333 (=> (not res!249621) (not e!218231))))

(assert (=> b!303333 (= res!249621 e!218232)))

(declare-fun res!249620 () Bool)

(assert (=> b!303333 (=> res!249620 e!218232)))

(assert (=> b!303333 (= res!249620 (bvsge (_1!13226 lt!437738) (_2!13226 lt!437738)))))

(assert (=> b!303333 (= lt!437739 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437737 () (_ BitVec 32))

(assert (=> b!303333 (= lt!437737 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303333 (= lt!437738 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303334 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303334 (= e!218236 (byteRangesEq!0 (select (arr!9083 a1!948) (_4!571 lt!437738)) (select (arr!9083 a2!948) (_4!571 lt!437738)) #b00000000000000000000000000000000 lt!437739))))

(declare-fun d!101322 () Bool)

(declare-fun res!249623 () Bool)

(assert (=> d!101322 (=> res!249623 e!218234)))

(assert (=> d!101322 (= res!249623 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101322 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218234)))

(declare-fun bm!5576 () Bool)

(assert (=> bm!5576 (= call!5579 (byteRangesEq!0 (select (arr!9083 a1!948) (_3!1528 lt!437738)) (select (arr!9083 a2!948) (_3!1528 lt!437738)) lt!437737 (ite c!14436 lt!437739 #b00000000000000000000000000001000)))))

(assert (= (and d!101322 (not res!249623)) b!303333))

(assert (= (and b!303333 (not res!249620)) b!303329))

(assert (= (and b!303333 res!249621) b!303331))

(assert (= (and b!303331 c!14436) b!303328))

(assert (= (and b!303331 (not c!14436)) b!303332))

(assert (= (and b!303332 res!249624) b!303330))

(assert (= (and b!303330 (not res!249622)) b!303334))

(assert (= (or b!303328 b!303332) bm!5576))

(declare-fun m!441961 () Bool)

(assert (=> b!303329 m!441961))

(assert (=> b!303333 m!441931))

(declare-fun m!441963 () Bool)

(assert (=> b!303334 m!441963))

(declare-fun m!441965 () Bool)

(assert (=> b!303334 m!441965))

(assert (=> b!303334 m!441963))

(assert (=> b!303334 m!441965))

(declare-fun m!441967 () Bool)

(assert (=> b!303334 m!441967))

(declare-fun m!441969 () Bool)

(assert (=> bm!5576 m!441969))

(declare-fun m!441971 () Bool)

(assert (=> bm!5576 m!441971))

(assert (=> bm!5576 m!441969))

(assert (=> bm!5576 m!441971))

(declare-fun m!441973 () Bool)

(assert (=> bm!5576 m!441973))

(assert (=> b!303284 d!101322))

(check-sat (not b!303313) (not bm!5576) (not d!101318) (not b!303334) (not b!303333) (not b!303329))
