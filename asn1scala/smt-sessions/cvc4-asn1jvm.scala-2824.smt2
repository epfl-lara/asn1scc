; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68320 () Bool)

(assert start!68320)

(declare-fun b!306798 () Bool)

(declare-fun res!251880 () Bool)

(declare-fun lt!439868 () (_ BitVec 32))

(assert (=> b!306798 (= res!251880 (= lt!439868 #b00000000000000000000000000000000))))

(declare-fun e!221056 () Bool)

(assert (=> b!306798 (=> res!251880 e!221056)))

(declare-fun e!221048 () Bool)

(assert (=> b!306798 (= e!221048 e!221056)))

(declare-fun b!306799 () Bool)

(declare-fun e!221051 () Bool)

(declare-fun e!221052 () Bool)

(assert (=> b!306799 (= e!221051 e!221052)))

(declare-fun res!251875 () Bool)

(assert (=> b!306799 (=> (not res!251875) (not e!221052))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!439866 () (_ BitVec 64))

(assert (=> b!306799 (= res!251875 (and (bvsle toBit!258 lt!439866) (bvsle fromBit!258 lt!439866)))))

(declare-datatypes ((array!18597 0))(
  ( (array!18598 (arr!9141 (Array (_ BitVec 32) (_ BitVec 8))) (size!8058 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18597)

(assert (=> b!306799 (= lt!439866 (bvmul ((_ sign_extend 32) (size!8058 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!306800 () Bool)

(declare-datatypes ((Unit!21404 0))(
  ( (Unit!21405) )
))
(declare-fun e!221057 () Unit!21404)

(declare-fun lt!439872 () Unit!21404)

(assert (=> b!306800 (= e!221057 lt!439872)))

(declare-datatypes ((tuple4!1258 0))(
  ( (tuple4!1259 (_1!13284 (_ BitVec 32)) (_2!13284 (_ BitVec 32)) (_3!1586 (_ BitVec 32)) (_4!629 (_ BitVec 32))) )
))
(declare-fun lt!439863 () tuple4!1258)

(declare-fun a2!948 () array!18597)

(declare-fun lt!439862 () tuple4!1258)

(declare-fun arrayRangesEqImpliesEq!291 (array!18597 array!18597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21404)

(assert (=> b!306800 (= lt!439872 (arrayRangesEqImpliesEq!291 a1!948 a2!948 (_1!13284 lt!439862) (_4!629 lt!439863) (_2!13284 lt!439862)))))

(assert (=> b!306800 (= (select (arr!9141 a1!948) (_4!629 lt!439863)) (select (arr!9141 a2!948) (_4!629 lt!439863)))))

(declare-fun b!306801 () Bool)

(declare-fun Unit!21406 () Unit!21404)

(assert (=> b!306801 (= e!221057 Unit!21406)))

(declare-fun b!306802 () Bool)

(declare-fun e!221053 () Bool)

(assert (=> b!306802 (= e!221052 e!221053)))

(declare-fun res!251878 () Bool)

(assert (=> b!306802 (=> (not res!251878) (not e!221053))))

(declare-fun e!221059 () Bool)

(assert (=> b!306802 (= res!251878 e!221059)))

(declare-fun c!15046 () Bool)

(assert (=> b!306802 (= c!15046 (= (_3!1586 lt!439862) (_4!629 lt!439862)))))

(declare-fun lt!439864 () Unit!21404)

(declare-fun e!221050 () Unit!21404)

(assert (=> b!306802 (= lt!439864 e!221050)))

(declare-fun c!15047 () Bool)

(assert (=> b!306802 (= c!15047 (bvslt (_1!13284 lt!439863) (_2!13284 lt!439863)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1258)

(assert (=> b!306802 (= lt!439863 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306802 (= lt!439868 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439869 () (_ BitVec 32))

(assert (=> b!306802 (= lt!439869 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306802 (= lt!439862 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306803 () Bool)

(declare-fun Unit!21407 () Unit!21404)

(assert (=> b!306803 (= e!221050 Unit!21407)))

(declare-fun b!306804 () Bool)

(assert (=> b!306804 (= e!221059 e!221048)))

(declare-fun res!251874 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306804 (= res!251874 (byteRangesEq!0 (select (arr!9141 a1!948) (_3!1586 lt!439862)) (select (arr!9141 a2!948) (_3!1586 lt!439862)) lt!439869 #b00000000000000000000000000000111))))

(assert (=> b!306804 (=> (not res!251874) (not e!221048))))

(declare-fun b!306806 () Bool)

(declare-fun res!251879 () Bool)

(assert (=> b!306806 (=> (not res!251879) (not e!221052))))

(declare-fun arrayBitRangesEq!0 (array!18597 array!18597 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306806 (= res!251879 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306807 () Bool)

(declare-fun res!251872 () Bool)

(assert (=> b!306807 (=> (not res!251872) (not e!221052))))

(assert (=> b!306807 (= res!251872 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439866) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306808 () Bool)

(declare-fun call!5867 () Bool)

(assert (=> b!306808 (= e!221056 call!5867)))

(declare-fun b!306809 () Bool)

(declare-fun e!221058 () Bool)

(assert (=> b!306809 (= e!221053 e!221058)))

(declare-fun res!251873 () Bool)

(assert (=> b!306809 (=> (not res!251873) (not e!221058))))

(assert (=> b!306809 (= res!251873 (not (= (_3!1586 lt!439863) (_4!629 lt!439863))))))

(declare-fun lt!439871 () Unit!21404)

(assert (=> b!306809 (= lt!439871 e!221057)))

(declare-fun c!15045 () Bool)

(assert (=> b!306809 (= c!15045 (and (bvslt (_4!629 lt!439863) (_4!629 lt!439862)) (bvslt (_3!1586 lt!439862) (_4!629 lt!439863))))))

(declare-fun lt!439865 () Unit!21404)

(declare-fun e!221054 () Unit!21404)

(assert (=> b!306809 (= lt!439865 e!221054)))

(declare-fun c!15048 () Bool)

(assert (=> b!306809 (= c!15048 (and (bvslt (_3!1586 lt!439862) (_3!1586 lt!439863)) (bvslt (_3!1586 lt!439863) (_4!629 lt!439862))))))

(declare-fun b!306810 () Bool)

(declare-fun Unit!21408 () Unit!21404)

(assert (=> b!306810 (= e!221054 Unit!21408)))

(declare-fun b!306811 () Bool)

(declare-fun res!251876 () Bool)

(assert (=> b!306811 (=> (not res!251876) (not e!221058))))

(assert (=> b!306811 (= res!251876 (byteRangesEq!0 (select (arr!9141 a1!948) (_3!1586 lt!439863)) (select (arr!9141 a2!948) (_3!1586 lt!439863)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun bm!5864 () Bool)

(assert (=> bm!5864 (= call!5867 (byteRangesEq!0 (ite c!15046 (select (arr!9141 a1!948) (_3!1586 lt!439862)) (select (arr!9141 a1!948) (_4!629 lt!439862))) (ite c!15046 (select (arr!9141 a2!948) (_3!1586 lt!439862)) (select (arr!9141 a2!948) (_4!629 lt!439862))) (ite c!15046 lt!439869 #b00000000000000000000000000000000) lt!439868))))

(declare-fun b!306812 () Bool)

(declare-fun lt!439867 () Unit!21404)

(assert (=> b!306812 (= e!221054 lt!439867)))

(assert (=> b!306812 (= lt!439867 (arrayRangesEqImpliesEq!291 a1!948 a2!948 (_1!13284 lt!439862) (_3!1586 lt!439863) (_2!13284 lt!439862)))))

(assert (=> b!306812 (= (select (arr!9141 a1!948) (_3!1586 lt!439863)) (select (arr!9141 a2!948) (_3!1586 lt!439863)))))

(declare-fun b!306813 () Bool)

(assert (=> b!306813 (= e!221058 (and (not (= ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!629 lt!439863) #b00000000000000000000000000000000) (bvsge (_4!629 lt!439863) (size!8058 a1!948)))))))

(declare-fun b!306814 () Bool)

(declare-fun lt!439870 () Unit!21404)

(assert (=> b!306814 (= e!221050 lt!439870)))

(declare-fun arrayRangesEqSlicedLemma!282 (array!18597 array!18597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21404)

(assert (=> b!306814 (= lt!439870 (arrayRangesEqSlicedLemma!282 a1!948 a2!948 (_1!13284 lt!439862) (_2!13284 lt!439862) (_1!13284 lt!439863) (_2!13284 lt!439863)))))

(declare-fun arrayRangesEq!1687 (array!18597 array!18597 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306814 (arrayRangesEq!1687 a1!948 a2!948 (_1!13284 lt!439863) (_2!13284 lt!439863))))

(declare-fun b!306805 () Bool)

(assert (=> b!306805 (= e!221059 call!5867)))

(declare-fun res!251877 () Bool)

(assert (=> start!68320 (=> (not res!251877) (not e!221051))))

(assert (=> start!68320 (= res!251877 (and (bvsle (size!8058 a1!948) (size!8058 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68320 e!221051))

(assert (=> start!68320 true))

(declare-fun array_inv!7670 (array!18597) Bool)

(assert (=> start!68320 (array_inv!7670 a1!948)))

(assert (=> start!68320 (array_inv!7670 a2!948)))

(assert (= (and start!68320 res!251877) b!306799))

(assert (= (and b!306799 res!251875) b!306806))

(assert (= (and b!306806 res!251879) b!306807))

(assert (= (and b!306807 res!251872) b!306802))

(assert (= (and b!306802 c!15047) b!306814))

(assert (= (and b!306802 (not c!15047)) b!306803))

(assert (= (and b!306802 c!15046) b!306805))

(assert (= (and b!306802 (not c!15046)) b!306804))

(assert (= (and b!306804 res!251874) b!306798))

(assert (= (and b!306798 (not res!251880)) b!306808))

(assert (= (or b!306805 b!306808) bm!5864))

(assert (= (and b!306802 res!251878) b!306809))

(assert (= (and b!306809 c!15048) b!306812))

(assert (= (and b!306809 (not c!15048)) b!306810))

(assert (= (and b!306809 c!15045) b!306800))

(assert (= (and b!306809 (not c!15045)) b!306801))

(assert (= (and b!306809 res!251873) b!306811))

(assert (= (and b!306811 res!251876) b!306813))

(declare-fun m!445253 () Bool)

(assert (=> b!306800 m!445253))

(declare-fun m!445255 () Bool)

(assert (=> b!306800 m!445255))

(declare-fun m!445257 () Bool)

(assert (=> b!306800 m!445257))

(declare-fun m!445259 () Bool)

(assert (=> b!306804 m!445259))

(declare-fun m!445261 () Bool)

(assert (=> b!306804 m!445261))

(assert (=> b!306804 m!445259))

(assert (=> b!306804 m!445261))

(declare-fun m!445263 () Bool)

(assert (=> b!306804 m!445263))

(declare-fun m!445265 () Bool)

(assert (=> b!306814 m!445265))

(declare-fun m!445267 () Bool)

(assert (=> b!306814 m!445267))

(declare-fun m!445269 () Bool)

(assert (=> start!68320 m!445269))

(declare-fun m!445271 () Bool)

(assert (=> start!68320 m!445271))

(declare-fun m!445273 () Bool)

(assert (=> b!306812 m!445273))

(declare-fun m!445275 () Bool)

(assert (=> b!306812 m!445275))

(declare-fun m!445277 () Bool)

(assert (=> b!306812 m!445277))

(declare-fun m!445279 () Bool)

(assert (=> b!306806 m!445279))

(declare-fun m!445281 () Bool)

(assert (=> bm!5864 m!445281))

(assert (=> bm!5864 m!445259))

(declare-fun m!445283 () Bool)

(assert (=> bm!5864 m!445283))

(declare-fun m!445285 () Bool)

(assert (=> bm!5864 m!445285))

(assert (=> bm!5864 m!445261))

(declare-fun m!445287 () Bool)

(assert (=> b!306802 m!445287))

(declare-fun m!445289 () Bool)

(assert (=> b!306802 m!445289))

(assert (=> b!306811 m!445275))

(assert (=> b!306811 m!445277))

(assert (=> b!306811 m!445275))

(assert (=> b!306811 m!445277))

(declare-fun m!445291 () Bool)

(assert (=> b!306811 m!445291))

(push 1)

(assert (not b!306800))

(assert (not b!306806))

(assert (not b!306804))

(assert (not b!306811))

(assert (not bm!5864))

(assert (not start!68320))

(assert (not b!306814))

(assert (not b!306812))

(assert (not b!306802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102378 () Bool)

(assert (=> d!102378 (= (byteRangesEq!0 (select (arr!9141 a1!948) (_3!1586 lt!439863)) (select (arr!9141 a2!948) (_3!1586 lt!439863)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9141 a1!948) (_3!1586 lt!439863))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9141 a2!948) (_3!1586 lt!439863))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26382 () Bool)

(assert (= bs!26382 d!102378))

(declare-fun m!445353 () Bool)

(assert (=> bs!26382 m!445353))

(declare-fun m!445355 () Bool)

(assert (=> bs!26382 m!445355))

(assert (=> b!306811 d!102378))

(declare-fun d!102384 () Bool)

(assert (=> d!102384 (and (bvsge (_4!629 lt!439863) #b00000000000000000000000000000000) (bvslt (_4!629 lt!439863) (size!8058 a1!948)) (bvslt (_4!629 lt!439863) (size!8058 a2!948)) (= (select (arr!9141 a1!948) (_4!629 lt!439863)) (select (arr!9141 a2!948) (_4!629 lt!439863))))))

(declare-fun lt!439898 () Unit!21404)

(declare-fun choose!635 (array!18597 array!18597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21404)

(assert (=> d!102384 (= lt!439898 (choose!635 a1!948 a2!948 (_1!13284 lt!439862) (_4!629 lt!439863) (_2!13284 lt!439862)))))

(assert (=> d!102384 (and (bvsle #b00000000000000000000000000000000 (_1!13284 lt!439862)) (bvsle (_1!13284 lt!439862) (_2!13284 lt!439862)))))

(assert (=> d!102384 (= (arrayRangesEqImpliesEq!291 a1!948 a2!948 (_1!13284 lt!439862) (_4!629 lt!439863) (_2!13284 lt!439862)) lt!439898)))

(declare-fun bs!26383 () Bool)

(assert (= bs!26383 d!102384))

(assert (=> bs!26383 m!445255))

(assert (=> bs!26383 m!445257))

(declare-fun m!445357 () Bool)

(assert (=> bs!26383 m!445357))

(assert (=> b!306800 d!102384))

(declare-fun d!102386 () Bool)

(assert (=> d!102386 (= (array_inv!7670 a1!948) (bvsge (size!8058 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68320 d!102386))

(declare-fun d!102388 () Bool)

(assert (=> d!102388 (= (array_inv!7670 a2!948) (bvsge (size!8058 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68320 d!102388))

(declare-fun d!102390 () Bool)

(assert (=> d!102390 (arrayRangesEq!1687 a1!948 a2!948 (_1!13284 lt!439863) (_2!13284 lt!439863))))

(declare-fun lt!439901 () Unit!21404)

(declare-fun choose!637 (array!18597 array!18597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21404)

(assert (=> d!102390 (= lt!439901 (choose!637 a1!948 a2!948 (_1!13284 lt!439862) (_2!13284 lt!439862) (_1!13284 lt!439863) (_2!13284 lt!439863)))))

(assert (=> d!102390 (and (bvsle #b00000000000000000000000000000000 (_1!13284 lt!439862)) (bvsle (_1!13284 lt!439862) (_2!13284 lt!439862)))))

(assert (=> d!102390 (= (arrayRangesEqSlicedLemma!282 a1!948 a2!948 (_1!13284 lt!439862) (_2!13284 lt!439862) (_1!13284 lt!439863) (_2!13284 lt!439863)) lt!439901)))

(declare-fun bs!26384 () Bool)

(assert (= bs!26384 d!102390))

(assert (=> bs!26384 m!445267))

(declare-fun m!445359 () Bool)

(assert (=> bs!26384 m!445359))

(assert (=> b!306814 d!102390))

(declare-fun d!102392 () Bool)

(declare-fun res!251918 () Bool)

(declare-fun e!221100 () Bool)

(assert (=> d!102392 (=> res!251918 e!221100)))

(assert (=> d!102392 (= res!251918 (= (_1!13284 lt!439863) (_2!13284 lt!439863)))))

(assert (=> d!102392 (= (arrayRangesEq!1687 a1!948 a2!948 (_1!13284 lt!439863) (_2!13284 lt!439863)) e!221100)))

(declare-fun b!306860 () Bool)

(declare-fun e!221101 () Bool)

(assert (=> b!306860 (= e!221100 e!221101)))

(declare-fun res!251919 () Bool)

(assert (=> b!306860 (=> (not res!251919) (not e!221101))))

(assert (=> b!306860 (= res!251919 (= (select (arr!9141 a1!948) (_1!13284 lt!439863)) (select (arr!9141 a2!948) (_1!13284 lt!439863))))))

(declare-fun b!306861 () Bool)

(assert (=> b!306861 (= e!221101 (arrayRangesEq!1687 a1!948 a2!948 (bvadd (_1!13284 lt!439863) #b00000000000000000000000000000001) (_2!13284 lt!439863)))))

(assert (= (and d!102392 (not res!251918)) b!306860))

(assert (= (and b!306860 res!251919) b!306861))

(declare-fun m!445361 () Bool)

(assert (=> b!306860 m!445361))

(declare-fun m!445363 () Bool)

(assert (=> b!306860 m!445363))

(declare-fun m!445365 () Bool)

(assert (=> b!306861 m!445365))

(assert (=> b!306814 d!102392))

(declare-fun d!102394 () Bool)

(assert (=> d!102394 (= (byteRangesEq!0 (select (arr!9141 a1!948) (_3!1586 lt!439862)) (select (arr!9141 a2!948) (_3!1586 lt!439862)) lt!439869 #b00000000000000000000000000000111) (or (= lt!439869 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9141 a1!948) (_3!1586 lt!439862))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439869)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9141 a2!948) (_3!1586 lt!439862))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439869)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26385 () Bool)

(assert (= bs!26385 d!102394))

(assert (=> bs!26385 m!445353))

(declare-fun m!445367 () Bool)

(assert (=> bs!26385 m!445367))

(assert (=> b!306804 d!102394))

(declare-fun d!102396 () Bool)

(assert (=> d!102396 (and (bvsge (_3!1586 lt!439863) #b00000000000000000000000000000000) (bvslt (_3!1586 lt!439863) (size!8058 a1!948)) (bvslt (_3!1586 lt!439863) (size!8058 a2!948)) (= (select (arr!9141 a1!948) (_3!1586 lt!439863)) (select (arr!9141 a2!948) (_3!1586 lt!439863))))))

(declare-fun lt!439908 () Unit!21404)

(assert (=> d!102396 (= lt!439908 (choose!635 a1!948 a2!948 (_1!13284 lt!439862) (_3!1586 lt!439863) (_2!13284 lt!439862)))))

(assert (=> d!102396 (and (bvsle #b00000000000000000000000000000000 (_1!13284 lt!439862)) (bvsle (_1!13284 lt!439862) (_2!13284 lt!439862)))))

(assert (=> d!102396 (= (arrayRangesEqImpliesEq!291 a1!948 a2!948 (_1!13284 lt!439862) (_3!1586 lt!439863) (_2!13284 lt!439862)) lt!439908)))

(declare-fun bs!26386 () Bool)

(assert (= bs!26386 d!102396))

(assert (=> bs!26386 m!445275))

(assert (=> bs!26386 m!445277))

(declare-fun m!445369 () Bool)

(assert (=> bs!26386 m!445369))

(assert (=> b!306812 d!102396))

(declare-fun d!102398 () Bool)

(assert (=> d!102398 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1259 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306802 d!102398))

(declare-fun d!102400 () Bool)

(assert (=> d!102400 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1259 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306802 d!102400))

(declare-fun d!102402 () Bool)

(assert (=> d!102402 (= (byteRangesEq!0 (ite c!15046 (select (arr!9141 a1!948) (_3!1586 lt!439862)) (select (arr!9141 a1!948) (_4!629 lt!439862))) (ite c!15046 (select (arr!9141 a2!948) (_3!1586 lt!439862)) (select (arr!9141 a2!948) (_4!629 lt!439862))) (ite c!15046 lt!439869 #b00000000000000000000000000000000) lt!439868) (or (= (ite c!15046 lt!439869 #b00000000000000000000000000000000) lt!439868) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15046 (select (arr!9141 a1!948) (_3!1586 lt!439862)) (select (arr!9141 a1!948) (_4!629 lt!439862)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439868))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15046 lt!439869 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15046 (select (arr!9141 a2!948) (_3!1586 lt!439862)) (select (arr!9141 a2!948) (_4!629 lt!439862)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439868))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15046 lt!439869 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26387 () Bool)

(assert (= bs!26387 d!102402))

(declare-fun m!445371 () Bool)

(assert (=> bs!26387 m!445371))

(declare-fun m!445373 () Bool)

(assert (=> bs!26387 m!445373))

(assert (=> bm!5864 d!102402))

(declare-fun b!306889 () Bool)

(declare-fun e!221130 () Bool)

(declare-fun e!221127 () Bool)

(assert (=> b!306889 (= e!221130 e!221127)))

(declare-fun res!251942 () Bool)

(assert (=> b!306889 (=> (not res!251942) (not e!221127))))

(declare-fun e!221126 () Bool)

(assert (=> b!306889 (= res!251942 e!221126)))

(declare-fun res!251941 () Bool)

(assert (=> b!306889 (=> res!251941 e!221126)))

(declare-fun lt!439919 () tuple4!1258)

(assert (=> b!306889 (= res!251941 (bvsge (_1!13284 lt!439919) (_2!13284 lt!439919)))))

(declare-fun lt!439920 () (_ BitVec 32))

(assert (=> b!306889 (= lt!439920 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439918 () (_ BitVec 32))

(assert (=> b!306889 (= lt!439918 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306889 (= lt!439919 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun c!15057 () Bool)

(declare-fun bm!5873 () Bool)

(declare-fun call!5876 () Bool)

(assert (=> bm!5873 (= call!5876 (byteRangesEq!0 (ite c!15057 (select (arr!9141 a1!948) (_3!1586 lt!439919)) (select (arr!9141 a1!948) (_4!629 lt!439919))) (ite c!15057 (select (arr!9141 a2!948) (_3!1586 lt!439919)) (select (arr!9141 a2!948) (_4!629 lt!439919))) (ite c!15057 lt!439918 #b00000000000000000000000000000000) lt!439920))))

(declare-fun b!306891 () Bool)

(declare-fun e!221131 () Bool)

(assert (=> b!306891 (= e!221131 call!5876)))

(declare-fun b!306892 () Bool)

(assert (=> b!306892 (= e!221127 e!221131)))

(assert (=> b!306892 (= c!15057 (= (_3!1586 lt!439919) (_4!629 lt!439919)))))

(declare-fun b!306893 () Bool)

(declare-fun e!221129 () Bool)

(assert (=> b!306893 (= e!221129 call!5876)))

(declare-fun b!306894 () Bool)

(declare-fun res!251940 () Bool)

(assert (=> b!306894 (= res!251940 (= lt!439920 #b00000000000000000000000000000000))))

(assert (=> b!306894 (=> res!251940 e!221129)))

(declare-fun e!221128 () Bool)

(assert (=> b!306894 (= e!221128 e!221129)))

(declare-fun b!306895 () Bool)

(assert (=> b!306895 (= e!221131 e!221128)))

(declare-fun res!251943 () Bool)

(assert (=> b!306895 (= res!251943 (byteRangesEq!0 (select (arr!9141 a1!948) (_3!1586 lt!439919)) (select (arr!9141 a2!948) (_3!1586 lt!439919)) lt!439918 #b00000000000000000000000000001000))))

(assert (=> b!306895 (=> (not res!251943) (not e!221128))))

(declare-fun d!102404 () Bool)

(declare-fun res!251939 () Bool)

(assert (=> d!102404 (=> res!251939 e!221130)))

(assert (=> d!102404 (= res!251939 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102404 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!221130)))

(declare-fun b!306890 () Bool)

(assert (=> b!306890 (= e!221126 (arrayRangesEq!1687 a1!948 a2!948 (_1!13284 lt!439919) (_2!13284 lt!439919)))))

(assert (= (and d!102404 (not res!251939)) b!306889))

(assert (= (and b!306889 (not res!251941)) b!306890))

(assert (= (and b!306889 res!251942) b!306892))

(assert (= (and b!306892 c!15057) b!306891))

(assert (= (and b!306892 (not c!15057)) b!306895))

(assert (= (and b!306895 res!251943) b!306894))

(assert (= (and b!306894 (not res!251940)) b!306893))

(assert (= (or b!306891 b!306893) bm!5873))

(assert (=> b!306889 m!445289))

(declare-fun m!445389 () Bool)

(assert (=> bm!5873 m!445389))

(declare-fun m!445391 () Bool)

(assert (=> bm!5873 m!445391))

(declare-fun m!445393 () Bool)

(assert (=> bm!5873 m!445393))

(declare-fun m!445395 () Bool)

(assert (=> bm!5873 m!445395))

(declare-fun m!445397 () Bool)

(assert (=> bm!5873 m!445397))

(assert (=> b!306895 m!445393))

(assert (=> b!306895 m!445389))

(assert (=> b!306895 m!445393))

(assert (=> b!306895 m!445389))

(declare-fun m!445399 () Bool)

(assert (=> b!306895 m!445399))

(declare-fun m!445401 () Bool)

(assert (=> b!306890 m!445401))

(assert (=> b!306806 d!102404))

(push 1)

(assert (not b!306890))

(assert (not d!102384))

(assert (not b!306889))

(assert (not b!306861))

(assert (not bm!5873))

(assert (not d!102390))

(assert (not b!306895))

(assert (not d!102396))

(check-sat)

