; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68368 () Bool)

(assert start!68368)

(declare-fun b!307032 () Bool)

(declare-fun e!221230 () Bool)

(declare-fun e!221229 () Bool)

(assert (=> b!307032 (= e!221230 e!221229)))

(declare-fun res!252024 () Bool)

(assert (=> b!307032 (=> (not res!252024) (not e!221229))))

(declare-fun e!221233 () Bool)

(assert (=> b!307032 (= res!252024 e!221233)))

(declare-fun c!15093 () Bool)

(declare-datatypes ((tuple4!1264 0))(
  ( (tuple4!1265 (_1!13287 (_ BitVec 32)) (_2!13287 (_ BitVec 32)) (_3!1589 (_ BitVec 32)) (_4!632 (_ BitVec 32))) )
))
(declare-fun lt!440019 () tuple4!1264)

(assert (=> b!307032 (= c!15093 (= (_3!1589 lt!440019) (_4!632 lt!440019)))))

(declare-datatypes ((Unit!21419 0))(
  ( (Unit!21420) )
))
(declare-fun lt!440017 () Unit!21419)

(declare-fun e!221234 () Unit!21419)

(assert (=> b!307032 (= lt!440017 e!221234)))

(declare-fun c!15091 () Bool)

(declare-fun lt!440011 () tuple4!1264)

(assert (=> b!307032 (= c!15091 (bvslt (_1!13287 lt!440011) (_2!13287 lt!440011)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1264)

(assert (=> b!307032 (= lt!440011 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!440009 () (_ BitVec 32))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!307032 (= lt!440009 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!440013 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!307032 (= lt!440013 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307032 (= lt!440019 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!307033 () Bool)

(declare-fun res!252019 () Bool)

(assert (=> b!307033 (=> (not res!252019) (not e!221230))))

(declare-datatypes ((array!18606 0))(
  ( (array!18607 (arr!9144 (Array (_ BitVec 32) (_ BitVec 8))) (size!8061 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18606)

(declare-fun a2!948 () array!18606)

(declare-fun arrayBitRangesEq!0 (array!18606 array!18606 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!307033 (= res!252019 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun bm!5882 () Bool)

(declare-fun call!5885 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5882 (= call!5885 (byteRangesEq!0 (ite c!15093 (select (arr!9144 a1!948) (_3!1589 lt!440019)) (select (arr!9144 a1!948) (_4!632 lt!440019))) (ite c!15093 (select (arr!9144 a2!948) (_3!1589 lt!440019)) (select (arr!9144 a2!948) (_4!632 lt!440019))) (ite c!15093 lt!440013 #b00000000000000000000000000000000) lt!440009))))

(declare-fun b!307034 () Bool)

(declare-fun res!252018 () Bool)

(assert (=> b!307034 (= res!252018 (= lt!440009 #b00000000000000000000000000000000))))

(declare-fun e!221238 () Bool)

(assert (=> b!307034 (=> res!252018 e!221238)))

(declare-fun e!221228 () Bool)

(assert (=> b!307034 (= e!221228 e!221238)))

(declare-fun b!307035 () Bool)

(declare-fun e!221232 () Unit!21419)

(declare-fun Unit!21421 () Unit!21419)

(assert (=> b!307035 (= e!221232 Unit!21421)))

(declare-fun b!307036 () Bool)

(declare-fun e!221237 () Bool)

(assert (=> b!307036 (= e!221237 e!221230)))

(declare-fun res!252017 () Bool)

(assert (=> b!307036 (=> (not res!252017) (not e!221230))))

(declare-fun lt!440015 () (_ BitVec 64))

(assert (=> b!307036 (= res!252017 (and (bvsle toBit!258 lt!440015) (bvsle fromBit!258 lt!440015)))))

(assert (=> b!307036 (= lt!440015 (bvmul ((_ sign_extend 32) (size!8061 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!307037 () Bool)

(assert (=> b!307037 (= e!221238 call!5885)))

(declare-fun b!307038 () Bool)

(declare-fun e!221239 () Unit!21419)

(declare-fun Unit!21422 () Unit!21419)

(assert (=> b!307038 (= e!221239 Unit!21422)))

(declare-fun b!307039 () Bool)

(declare-fun res!252022 () Bool)

(declare-fun e!221231 () Bool)

(assert (=> b!307039 (=> (not res!252022) (not e!221231))))

(assert (=> b!307039 (= res!252022 (byteRangesEq!0 (select (arr!9144 a1!948) (_3!1589 lt!440011)) (select (arr!9144 a2!948) (_3!1589 lt!440011)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!307040 () Bool)

(assert (=> b!307040 (= e!221233 call!5885)))

(declare-fun b!307041 () Bool)

(assert (=> b!307041 (= e!221229 e!221231)))

(declare-fun res!252016 () Bool)

(assert (=> b!307041 (=> (not res!252016) (not e!221231))))

(assert (=> b!307041 (= res!252016 (not (= (_3!1589 lt!440011) (_4!632 lt!440011))))))

(declare-fun lt!440014 () Unit!21419)

(assert (=> b!307041 (= lt!440014 e!221239)))

(declare-fun c!15092 () Bool)

(assert (=> b!307041 (= c!15092 (and (bvslt (_4!632 lt!440011) (_4!632 lt!440019)) (bvslt (_3!1589 lt!440019) (_4!632 lt!440011))))))

(declare-fun lt!440018 () Unit!21419)

(assert (=> b!307041 (= lt!440018 e!221232)))

(declare-fun c!15090 () Bool)

(assert (=> b!307041 (= c!15090 (and (bvslt (_3!1589 lt!440019) (_3!1589 lt!440011)) (bvslt (_3!1589 lt!440011) (_4!632 lt!440019))))))

(declare-fun b!307042 () Bool)

(declare-fun lt!440016 () Unit!21419)

(assert (=> b!307042 (= e!221234 lt!440016)))

(declare-fun arrayRangesEqSlicedLemma!285 (array!18606 array!18606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21419)

(assert (=> b!307042 (= lt!440016 (arrayRangesEqSlicedLemma!285 a1!948 a2!948 (_1!13287 lt!440019) (_2!13287 lt!440019) (_1!13287 lt!440011) (_2!13287 lt!440011)))))

(declare-fun arrayRangesEq!1690 (array!18606 array!18606 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307042 (arrayRangesEq!1690 a1!948 a2!948 (_1!13287 lt!440011) (_2!13287 lt!440011))))

(declare-fun b!307043 () Bool)

(declare-fun Unit!21423 () Unit!21419)

(assert (=> b!307043 (= e!221234 Unit!21423)))

(declare-fun b!307045 () Bool)

(assert (=> b!307045 (= e!221231 (and (not (= ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!632 lt!440011) #b00000000000000000000000000000000) (bvsge (_4!632 lt!440011) (size!8061 a2!948)))))))

(declare-fun b!307046 () Bool)

(assert (=> b!307046 (= e!221233 e!221228)))

(declare-fun res!252023 () Bool)

(assert (=> b!307046 (= res!252023 (byteRangesEq!0 (select (arr!9144 a1!948) (_3!1589 lt!440019)) (select (arr!9144 a2!948) (_3!1589 lt!440019)) lt!440013 #b00000000000000000000000000000111))))

(assert (=> b!307046 (=> (not res!252023) (not e!221228))))

(declare-fun b!307047 () Bool)

(declare-fun res!252020 () Bool)

(assert (=> b!307047 (=> (not res!252020) (not e!221230))))

(assert (=> b!307047 (= res!252020 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!440015) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!307048 () Bool)

(declare-fun lt!440010 () Unit!21419)

(assert (=> b!307048 (= e!221232 lt!440010)))

(declare-fun arrayRangesEqImpliesEq!294 (array!18606 array!18606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21419)

(assert (=> b!307048 (= lt!440010 (arrayRangesEqImpliesEq!294 a1!948 a2!948 (_1!13287 lt!440019) (_3!1589 lt!440011) (_2!13287 lt!440019)))))

(assert (=> b!307048 (= (select (arr!9144 a1!948) (_3!1589 lt!440011)) (select (arr!9144 a2!948) (_3!1589 lt!440011)))))

(declare-fun res!252021 () Bool)

(assert (=> start!68368 (=> (not res!252021) (not e!221237))))

(assert (=> start!68368 (= res!252021 (and (bvsle (size!8061 a1!948) (size!8061 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68368 e!221237))

(assert (=> start!68368 true))

(declare-fun array_inv!7673 (array!18606) Bool)

(assert (=> start!68368 (array_inv!7673 a1!948)))

(assert (=> start!68368 (array_inv!7673 a2!948)))

(declare-fun b!307044 () Bool)

(declare-fun lt!440012 () Unit!21419)

(assert (=> b!307044 (= e!221239 lt!440012)))

(assert (=> b!307044 (= lt!440012 (arrayRangesEqImpliesEq!294 a1!948 a2!948 (_1!13287 lt!440019) (_4!632 lt!440011) (_2!13287 lt!440019)))))

(assert (=> b!307044 (= (select (arr!9144 a1!948) (_4!632 lt!440011)) (select (arr!9144 a2!948) (_4!632 lt!440011)))))

(assert (= (and start!68368 res!252021) b!307036))

(assert (= (and b!307036 res!252017) b!307033))

(assert (= (and b!307033 res!252019) b!307047))

(assert (= (and b!307047 res!252020) b!307032))

(assert (= (and b!307032 c!15091) b!307042))

(assert (= (and b!307032 (not c!15091)) b!307043))

(assert (= (and b!307032 c!15093) b!307040))

(assert (= (and b!307032 (not c!15093)) b!307046))

(assert (= (and b!307046 res!252023) b!307034))

(assert (= (and b!307034 (not res!252018)) b!307037))

(assert (= (or b!307040 b!307037) bm!5882))

(assert (= (and b!307032 res!252024) b!307041))

(assert (= (and b!307041 c!15090) b!307048))

(assert (= (and b!307041 (not c!15090)) b!307035))

(assert (= (and b!307041 c!15092) b!307044))

(assert (= (and b!307041 (not c!15092)) b!307038))

(assert (= (and b!307041 res!252016) b!307039))

(assert (= (and b!307039 res!252022) b!307045))

(declare-fun m!445483 () Bool)

(assert (=> start!68368 m!445483))

(declare-fun m!445485 () Bool)

(assert (=> start!68368 m!445485))

(declare-fun m!445487 () Bool)

(assert (=> b!307044 m!445487))

(declare-fun m!445489 () Bool)

(assert (=> b!307044 m!445489))

(declare-fun m!445491 () Bool)

(assert (=> b!307044 m!445491))

(declare-fun m!445493 () Bool)

(assert (=> b!307048 m!445493))

(declare-fun m!445495 () Bool)

(assert (=> b!307048 m!445495))

(declare-fun m!445497 () Bool)

(assert (=> b!307048 m!445497))

(declare-fun m!445499 () Bool)

(assert (=> bm!5882 m!445499))

(declare-fun m!445501 () Bool)

(assert (=> bm!5882 m!445501))

(declare-fun m!445503 () Bool)

(assert (=> bm!5882 m!445503))

(declare-fun m!445505 () Bool)

(assert (=> bm!5882 m!445505))

(declare-fun m!445507 () Bool)

(assert (=> bm!5882 m!445507))

(assert (=> b!307039 m!445495))

(assert (=> b!307039 m!445497))

(assert (=> b!307039 m!445495))

(assert (=> b!307039 m!445497))

(declare-fun m!445509 () Bool)

(assert (=> b!307039 m!445509))

(declare-fun m!445511 () Bool)

(assert (=> b!307032 m!445511))

(declare-fun m!445513 () Bool)

(assert (=> b!307032 m!445513))

(declare-fun m!445515 () Bool)

(assert (=> b!307033 m!445515))

(assert (=> b!307046 m!445507))

(assert (=> b!307046 m!445505))

(assert (=> b!307046 m!445507))

(assert (=> b!307046 m!445505))

(declare-fun m!445517 () Bool)

(assert (=> b!307046 m!445517))

(declare-fun m!445519 () Bool)

(assert (=> b!307042 m!445519))

(declare-fun m!445521 () Bool)

(assert (=> b!307042 m!445521))

(push 1)

(assert (not bm!5882))

(assert (not b!307042))

(assert (not start!68368))

(assert (not b!307048))

(assert (not b!307032))

(assert (not b!307033))

(assert (not b!307046))

(assert (not b!307044))

(assert (not b!307039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102446 () Bool)

(assert (=> d!102446 (= (array_inv!7673 a1!948) (bvsge (size!8061 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68368 d!102446))

(declare-fun d!102448 () Bool)

(assert (=> d!102448 (= (array_inv!7673 a2!948) (bvsge (size!8061 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68368 d!102448))

(declare-fun b!307096 () Bool)

(declare-fun e!221284 () Bool)

(declare-fun e!221285 () Bool)

(assert (=> b!307096 (= e!221284 e!221285)))

(declare-fun res!252066 () Bool)

(assert (=> b!307096 (=> (not res!252066) (not e!221285))))

(declare-fun e!221282 () Bool)

(assert (=> b!307096 (= res!252066 e!221282)))

(declare-fun res!252064 () Bool)

(assert (=> b!307096 (=> res!252064 e!221282)))

(declare-fun lt!440050 () tuple4!1264)

(assert (=> b!307096 (= res!252064 (bvsge (_1!13287 lt!440050) (_2!13287 lt!440050)))))

(declare-fun lt!440048 () (_ BitVec 32))

(assert (=> b!307096 (= lt!440048 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!440049 () (_ BitVec 32))

(assert (=> b!307096 (= lt!440049 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307096 (= lt!440050 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!307097 () Bool)

(declare-fun res!252063 () Bool)

(assert (=> b!307097 (= res!252063 (= lt!440048 #b00000000000000000000000000000000))))

(declare-fun e!221287 () Bool)

(assert (=> b!307097 (=> res!252063 e!221287)))

(declare-fun e!221283 () Bool)

(assert (=> b!307097 (= e!221283 e!221287)))

(declare-fun b!307098 () Bool)

(declare-fun e!221286 () Bool)

(declare-fun call!5891 () Bool)

(assert (=> b!307098 (= e!221286 call!5891)))

(declare-fun bm!5888 () Bool)

(declare-fun c!15099 () Bool)

(assert (=> bm!5888 (= call!5891 (byteRangesEq!0 (ite c!15099 (select (arr!9144 a1!948) (_3!1589 lt!440050)) (select (arr!9144 a1!948) (_4!632 lt!440050))) (ite c!15099 (select (arr!9144 a2!948) (_3!1589 lt!440050)) (select (arr!9144 a2!948) (_4!632 lt!440050))) (ite c!15099 lt!440049 #b00000000000000000000000000000000) lt!440048))))

(declare-fun b!307099 () Bool)

(assert (=> b!307099 (= e!221285 e!221286)))

(assert (=> b!307099 (= c!15099 (= (_3!1589 lt!440050) (_4!632 lt!440050)))))

(declare-fun b!307100 () Bool)

(assert (=> b!307100 (= e!221287 call!5891)))

(declare-fun d!102450 () Bool)

(declare-fun res!252065 () Bool)

(assert (=> d!102450 (=> res!252065 e!221284)))

(assert (=> d!102450 (= res!252065 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102450 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!221284)))

(declare-fun b!307101 () Bool)

(assert (=> b!307101 (= e!221282 (arrayRangesEq!1690 a1!948 a2!948 (_1!13287 lt!440050) (_2!13287 lt!440050)))))

(declare-fun b!307102 () Bool)

(assert (=> b!307102 (= e!221286 e!221283)))

(declare-fun res!252062 () Bool)

(assert (=> b!307102 (= res!252062 (byteRangesEq!0 (select (arr!9144 a1!948) (_3!1589 lt!440050)) (select (arr!9144 a2!948) (_3!1589 lt!440050)) lt!440049 #b00000000000000000000000000001000))))

(assert (=> b!307102 (=> (not res!252062) (not e!221283))))

(assert (= (and d!102450 (not res!252065)) b!307096))

(assert (= (and b!307096 (not res!252064)) b!307101))

(assert (= (and b!307096 res!252066) b!307099))

(assert (= (and b!307099 c!15099) b!307098))

(assert (= (and b!307099 (not c!15099)) b!307102))

(assert (= (and b!307102 res!252062) b!307097))

(assert (= (and b!307097 (not res!252063)) b!307100))

(assert (= (or b!307098 b!307100) bm!5888))

(assert (=> b!307096 m!445513))

(declare-fun m!445579 () Bool)

(assert (=> bm!5888 m!445579))

(declare-fun m!445581 () Bool)

(assert (=> bm!5888 m!445581))

(declare-fun m!445583 () Bool)

(assert (=> bm!5888 m!445583))

(declare-fun m!445585 () Bool)

(assert (=> bm!5888 m!445585))

(declare-fun m!445587 () Bool)

(assert (=> bm!5888 m!445587))

(declare-fun m!445589 () Bool)

(assert (=> b!307101 m!445589))

(assert (=> b!307102 m!445581))

(assert (=> b!307102 m!445585))

(assert (=> b!307102 m!445581))

(assert (=> b!307102 m!445585))

(declare-fun m!445591 () Bool)

(assert (=> b!307102 m!445591))

(assert (=> b!307033 d!102450))

(declare-fun d!102464 () Bool)

(assert (=> d!102464 (and (bvsge (_3!1589 lt!440011) #b00000000000000000000000000000000) (bvslt (_3!1589 lt!440011) (size!8061 a1!948)) (bvslt (_3!1589 lt!440011) (size!8061 a2!948)) (= (select (arr!9144 a1!948) (_3!1589 lt!440011)) (select (arr!9144 a2!948) (_3!1589 lt!440011))))))

(declare-fun lt!440053 () Unit!21419)

(declare-fun choose!642 (array!18606 array!18606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21419)

(assert (=> d!102464 (= lt!440053 (choose!642 a1!948 a2!948 (_1!13287 lt!440019) (_3!1589 lt!440011) (_2!13287 lt!440019)))))

(assert (=> d!102464 (and (bvsle #b00000000000000000000000000000000 (_1!13287 lt!440019)) (bvsle (_1!13287 lt!440019) (_2!13287 lt!440019)))))

(assert (=> d!102464 (= (arrayRangesEqImpliesEq!294 a1!948 a2!948 (_1!13287 lt!440019) (_3!1589 lt!440011) (_2!13287 lt!440019)) lt!440053)))

(declare-fun bs!26402 () Bool)

(assert (= bs!26402 d!102464))

(assert (=> bs!26402 m!445495))

(assert (=> bs!26402 m!445497))

(declare-fun m!445593 () Bool)

(assert (=> bs!26402 m!445593))

(assert (=> b!307048 d!102464))

(declare-fun d!102466 () Bool)

(assert (=> d!102466 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1265 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!307032 d!102466))

(declare-fun d!102468 () Bool)

(assert (=> d!102468 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1265 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!307032 d!102468))

(declare-fun d!102470 () Bool)

(assert (=> d!102470 (arrayRangesEq!1690 a1!948 a2!948 (_1!13287 lt!440011) (_2!13287 lt!440011))))

(declare-fun lt!440062 () Unit!21419)

(declare-fun choose!643 (array!18606 array!18606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21419)

(assert (=> d!102470 (= lt!440062 (choose!643 a1!948 a2!948 (_1!13287 lt!440019) (_2!13287 lt!440019) (_1!13287 lt!440011) (_2!13287 lt!440011)))))

(assert (=> d!102470 (and (bvsle #b00000000000000000000000000000000 (_1!13287 lt!440019)) (bvsle (_1!13287 lt!440019) (_2!13287 lt!440019)))))

(assert (=> d!102470 (= (arrayRangesEqSlicedLemma!285 a1!948 a2!948 (_1!13287 lt!440019) (_2!13287 lt!440019) (_1!13287 lt!440011) (_2!13287 lt!440011)) lt!440062)))

(declare-fun bs!26403 () Bool)

(assert (= bs!26403 d!102470))

(assert (=> bs!26403 m!445521))

(declare-fun m!445595 () Bool)

(assert (=> bs!26403 m!445595))

(assert (=> b!307042 d!102470))

(declare-fun d!102472 () Bool)

(declare-fun res!252086 () Bool)

(declare-fun e!221310 () Bool)

(assert (=> d!102472 (=> res!252086 e!221310)))

(assert (=> d!102472 (= res!252086 (= (_1!13287 lt!440011) (_2!13287 lt!440011)))))

(assert (=> d!102472 (= (arrayRangesEq!1690 a1!948 a2!948 (_1!13287 lt!440011) (_2!13287 lt!440011)) e!221310)))

(declare-fun b!307128 () Bool)

(declare-fun e!221311 () Bool)

(assert (=> b!307128 (= e!221310 e!221311)))

(declare-fun res!252087 () Bool)

(assert (=> b!307128 (=> (not res!252087) (not e!221311))))

(assert (=> b!307128 (= res!252087 (= (select (arr!9144 a1!948) (_1!13287 lt!440011)) (select (arr!9144 a2!948) (_1!13287 lt!440011))))))

(declare-fun b!307129 () Bool)

(assert (=> b!307129 (= e!221311 (arrayRangesEq!1690 a1!948 a2!948 (bvadd (_1!13287 lt!440011) #b00000000000000000000000000000001) (_2!13287 lt!440011)))))

(assert (= (and d!102472 (not res!252086)) b!307128))

(assert (= (and b!307128 res!252087) b!307129))

(declare-fun m!445613 () Bool)

(assert (=> b!307128 m!445613))

(declare-fun m!445615 () Bool)

(assert (=> b!307128 m!445615))

(declare-fun m!445617 () Bool)

(assert (=> b!307129 m!445617))

(assert (=> b!307042 d!102472))

(declare-fun d!102476 () Bool)

(assert (=> d!102476 (= (byteRangesEq!0 (select (arr!9144 a1!948) (_3!1589 lt!440019)) (select (arr!9144 a2!948) (_3!1589 lt!440019)) lt!440013 #b00000000000000000000000000000111) (or (= lt!440013 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9144 a1!948) (_3!1589 lt!440019))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440013)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9144 a2!948) (_3!1589 lt!440019))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440013)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26405 () Bool)

(assert (= bs!26405 d!102476))

(declare-fun m!445619 () Bool)

(assert (=> bs!26405 m!445619))

(declare-fun m!445621 () Bool)

(assert (=> bs!26405 m!445621))

(assert (=> b!307046 d!102476))

(declare-fun d!102478 () Bool)

(assert (=> d!102478 (= (byteRangesEq!0 (select (arr!9144 a1!948) (_3!1589 lt!440011)) (select (arr!9144 a2!948) (_3!1589 lt!440011)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9144 a1!948) (_3!1589 lt!440011))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9144 a2!948) (_3!1589 lt!440011))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26406 () Bool)

(assert (= bs!26406 d!102478))

(assert (=> bs!26406 m!445619))

(declare-fun m!445623 () Bool)

(assert (=> bs!26406 m!445623))

(assert (=> b!307039 d!102478))

(declare-fun d!102480 () Bool)

(assert (=> d!102480 (= (byteRangesEq!0 (ite c!15093 (select (arr!9144 a1!948) (_3!1589 lt!440019)) (select (arr!9144 a1!948) (_4!632 lt!440019))) (ite c!15093 (select (arr!9144 a2!948) (_3!1589 lt!440019)) (select (arr!9144 a2!948) (_4!632 lt!440019))) (ite c!15093 lt!440013 #b00000000000000000000000000000000) lt!440009) (or (= (ite c!15093 lt!440013 #b00000000000000000000000000000000) lt!440009) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15093 (select (arr!9144 a1!948) (_3!1589 lt!440019)) (select (arr!9144 a1!948) (_4!632 lt!440019)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440009))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15093 lt!440013 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15093 (select (arr!9144 a2!948) (_3!1589 lt!440019)) (select (arr!9144 a2!948) (_4!632 lt!440019)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440009))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15093 lt!440013 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26407 () Bool)

(assert (= bs!26407 d!102480))

(declare-fun m!445625 () Bool)

(assert (=> bs!26407 m!445625))

(declare-fun m!445627 () Bool)

(assert (=> bs!26407 m!445627))

(assert (=> bm!5882 d!102480))

(declare-fun d!102482 () Bool)

(assert (=> d!102482 (and (bvsge (_4!632 lt!440011) #b00000000000000000000000000000000) (bvslt (_4!632 lt!440011) (size!8061 a1!948)) (bvslt (_4!632 lt!440011) (size!8061 a2!948)) (= (select (arr!9144 a1!948) (_4!632 lt!440011)) (select (arr!9144 a2!948) (_4!632 lt!440011))))))

(declare-fun lt!440067 () Unit!21419)

(assert (=> d!102482 (= lt!440067 (choose!642 a1!948 a2!948 (_1!13287 lt!440019) (_4!632 lt!440011) (_2!13287 lt!440019)))))

(assert (=> d!102482 (and (bvsle #b00000000000000000000000000000000 (_1!13287 lt!440019)) (bvsle (_1!13287 lt!440019) (_2!13287 lt!440019)))))

(assert (=> d!102482 (= (arrayRangesEqImpliesEq!294 a1!948 a2!948 (_1!13287 lt!440019) (_4!632 lt!440011) (_2!13287 lt!440019)) lt!440067)))

(declare-fun bs!26408 () Bool)

(assert (= bs!26408 d!102482))

(assert (=> bs!26408 m!445489))

(assert (=> bs!26408 m!445491))

(declare-fun m!445629 () Bool)

(assert (=> bs!26408 m!445629))

(assert (=> b!307044 d!102482))

(push 1)

(assert (not d!102470))

(assert (not b!307129))

(assert (not d!102464))

(assert (not b!307101))

(assert (not d!102482))

(assert (not b!307096))

(assert (not bm!5888))

(assert (not b!307102))

(check-sat)

