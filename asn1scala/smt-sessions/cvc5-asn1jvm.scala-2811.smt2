; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67752 () Bool)

(assert start!67752)

(declare-datatypes ((tuple4!1176 0))(
  ( (tuple4!1177 (_1!13243 (_ BitVec 32)) (_2!13243 (_ BitVec 32)) (_3!1545 (_ BitVec 32)) (_4!588 (_ BitVec 32))) )
))
(declare-fun lt!438165 () tuple4!1176)

(declare-datatypes ((array!18479 0))(
  ( (array!18480 (arr!9100 (Array (_ BitVec 32) (_ BitVec 8))) (size!8017 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18479)

(declare-fun bm!5630 () Bool)

(declare-fun a2!948 () array!18479)

(declare-fun call!5633 () Bool)

(declare-fun lt!438168 () (_ BitVec 32))

(declare-fun lt!438166 () (_ BitVec 32))

(declare-fun c!14537 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5630 (= call!5633 (byteRangesEq!0 (ite c!14537 (select (arr!9100 a1!948) (_3!1545 lt!438165)) (select (arr!9100 a1!948) (_4!588 lt!438165))) (ite c!14537 (select (arr!9100 a2!948) (_3!1545 lt!438165)) (select (arr!9100 a2!948) (_4!588 lt!438165))) (ite c!14537 lt!438168 #b00000000000000000000000000000000) lt!438166))))

(declare-fun b!304087 () Bool)

(declare-fun e!218871 () Bool)

(assert (=> b!304087 (= e!218871 call!5633)))

(declare-fun b!304088 () Bool)

(declare-fun e!218872 () Bool)

(assert (=> b!304088 (= e!218872 call!5633)))

(declare-fun b!304089 () Bool)

(declare-fun res!250177 () Bool)

(declare-fun e!218870 () Bool)

(assert (=> b!304089 (=> (not res!250177) (not e!218870))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18479 array!18479 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304089 (= res!250177 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304090 () Bool)

(declare-fun lt!438164 () tuple4!1176)

(declare-fun e!218877 () Bool)

(assert (=> b!304090 (= e!218877 (and (bvslt (_3!1545 lt!438165) (_3!1545 lt!438164)) (bvslt (_3!1545 lt!438164) (_4!588 lt!438165)) (bvsle #b00000000000000000000000000000000 (_1!13243 lt!438165)) (bvsle (_1!13243 lt!438165) (_2!13243 lt!438165)) (bvsgt (_2!13243 lt!438165) (size!8017 a1!948))))))

(declare-fun b!304091 () Bool)

(declare-datatypes ((Unit!21232 0))(
  ( (Unit!21233) )
))
(declare-fun e!218874 () Unit!21232)

(declare-fun Unit!21234 () Unit!21232)

(assert (=> b!304091 (= e!218874 Unit!21234)))

(declare-fun b!304092 () Bool)

(declare-fun e!218875 () Bool)

(assert (=> b!304092 (= e!218872 e!218875)))

(declare-fun res!250179 () Bool)

(assert (=> b!304092 (= res!250179 (byteRangesEq!0 (select (arr!9100 a1!948) (_3!1545 lt!438165)) (select (arr!9100 a2!948) (_3!1545 lt!438165)) lt!438168 #b00000000000000000000000000000111))))

(assert (=> b!304092 (=> (not res!250179) (not e!218875))))

(declare-fun res!250178 () Bool)

(declare-fun e!218876 () Bool)

(assert (=> start!67752 (=> (not res!250178) (not e!218876))))

(assert (=> start!67752 (= res!250178 (and (bvsle (size!8017 a1!948) (size!8017 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67752 e!218876))

(assert (=> start!67752 true))

(declare-fun array_inv!7629 (array!18479) Bool)

(assert (=> start!67752 (array_inv!7629 a1!948)))

(assert (=> start!67752 (array_inv!7629 a2!948)))

(declare-fun b!304086 () Bool)

(assert (=> b!304086 (= e!218870 e!218877)))

(declare-fun res!250182 () Bool)

(assert (=> b!304086 (=> (not res!250182) (not e!218877))))

(assert (=> b!304086 (= res!250182 e!218872)))

(assert (=> b!304086 (= c!14537 (= (_3!1545 lt!438165) (_4!588 lt!438165)))))

(declare-fun lt!438167 () Unit!21232)

(assert (=> b!304086 (= lt!438167 e!218874)))

(declare-fun c!14538 () Bool)

(assert (=> b!304086 (= c!14538 (bvslt (_1!13243 lt!438164) (_2!13243 lt!438164)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1176)

(assert (=> b!304086 (= lt!438164 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304086 (= lt!438166 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304086 (= lt!438168 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304086 (= lt!438165 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304093 () Bool)

(declare-fun lt!438162 () Unit!21232)

(assert (=> b!304093 (= e!218874 lt!438162)))

(declare-fun arrayRangesEqSlicedLemma!241 (array!18479 array!18479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21232)

(assert (=> b!304093 (= lt!438162 (arrayRangesEqSlicedLemma!241 a1!948 a2!948 (_1!13243 lt!438165) (_2!13243 lt!438165) (_1!13243 lt!438164) (_2!13243 lt!438164)))))

(declare-fun arrayRangesEq!1646 (array!18479 array!18479 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304093 (arrayRangesEq!1646 a1!948 a2!948 (_1!13243 lt!438164) (_2!13243 lt!438164))))

(declare-fun b!304094 () Bool)

(assert (=> b!304094 (= e!218876 e!218870)))

(declare-fun res!250181 () Bool)

(assert (=> b!304094 (=> (not res!250181) (not e!218870))))

(declare-fun lt!438163 () (_ BitVec 64))

(assert (=> b!304094 (= res!250181 (and (bvsle toBit!258 lt!438163) (bvsle fromBit!258 lt!438163)))))

(assert (=> b!304094 (= lt!438163 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8017 a1!948))))))

(declare-fun b!304095 () Bool)

(declare-fun res!250176 () Bool)

(assert (=> b!304095 (= res!250176 (= lt!438166 #b00000000000000000000000000000000))))

(assert (=> b!304095 (=> res!250176 e!218871)))

(assert (=> b!304095 (= e!218875 e!218871)))

(declare-fun b!304096 () Bool)

(declare-fun res!250180 () Bool)

(assert (=> b!304096 (=> (not res!250180) (not e!218870))))

(assert (=> b!304096 (= res!250180 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438163) (not (= fromSlice!52 toSlice!52))))))

(assert (= (and start!67752 res!250178) b!304094))

(assert (= (and b!304094 res!250181) b!304089))

(assert (= (and b!304089 res!250177) b!304096))

(assert (= (and b!304096 res!250180) b!304086))

(assert (= (and b!304086 c!14538) b!304093))

(assert (= (and b!304086 (not c!14538)) b!304091))

(assert (= (and b!304086 c!14537) b!304088))

(assert (= (and b!304086 (not c!14537)) b!304092))

(assert (= (and b!304092 res!250179) b!304095))

(assert (= (and b!304095 (not res!250176)) b!304087))

(assert (= (or b!304088 b!304087) bm!5630))

(assert (= (and b!304086 res!250182) b!304090))

(declare-fun m!442611 () Bool)

(assert (=> b!304093 m!442611))

(declare-fun m!442613 () Bool)

(assert (=> b!304093 m!442613))

(declare-fun m!442615 () Bool)

(assert (=> b!304092 m!442615))

(declare-fun m!442617 () Bool)

(assert (=> b!304092 m!442617))

(assert (=> b!304092 m!442615))

(assert (=> b!304092 m!442617))

(declare-fun m!442619 () Bool)

(assert (=> b!304092 m!442619))

(declare-fun m!442621 () Bool)

(assert (=> start!67752 m!442621))

(declare-fun m!442623 () Bool)

(assert (=> start!67752 m!442623))

(assert (=> bm!5630 m!442617))

(assert (=> bm!5630 m!442615))

(declare-fun m!442625 () Bool)

(assert (=> bm!5630 m!442625))

(declare-fun m!442627 () Bool)

(assert (=> bm!5630 m!442627))

(declare-fun m!442629 () Bool)

(assert (=> bm!5630 m!442629))

(declare-fun m!442631 () Bool)

(assert (=> b!304089 m!442631))

(declare-fun m!442633 () Bool)

(assert (=> b!304086 m!442633))

(declare-fun m!442635 () Bool)

(assert (=> b!304086 m!442635))

(push 1)

(assert (not b!304089))

(assert (not b!304092))

(assert (not b!304086))

(assert (not start!67752))

(assert (not bm!5630))

(assert (not b!304093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101574 () Bool)

(assert (=> d!101574 (= (byteRangesEq!0 (select (arr!9100 a1!948) (_3!1545 lt!438165)) (select (arr!9100 a2!948) (_3!1545 lt!438165)) lt!438168 #b00000000000000000000000000000111) (or (= lt!438168 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9100 a1!948) (_3!1545 lt!438165))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438168)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9100 a2!948) (_3!1545 lt!438165))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438168)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26181 () Bool)

(assert (= bs!26181 d!101574))

(declare-fun m!442719 () Bool)

(assert (=> bs!26181 m!442719))

(declare-fun m!442721 () Bool)

(assert (=> bs!26181 m!442721))

(assert (=> b!304092 d!101574))

(declare-fun d!101576 () Bool)

(assert (=> d!101576 (= (byteRangesEq!0 (ite c!14537 (select (arr!9100 a1!948) (_3!1545 lt!438165)) (select (arr!9100 a1!948) (_4!588 lt!438165))) (ite c!14537 (select (arr!9100 a2!948) (_3!1545 lt!438165)) (select (arr!9100 a2!948) (_4!588 lt!438165))) (ite c!14537 lt!438168 #b00000000000000000000000000000000) lt!438166) (or (= (ite c!14537 lt!438168 #b00000000000000000000000000000000) lt!438166) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14537 (select (arr!9100 a1!948) (_3!1545 lt!438165)) (select (arr!9100 a1!948) (_4!588 lt!438165)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438166))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14537 lt!438168 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14537 (select (arr!9100 a2!948) (_3!1545 lt!438165)) (select (arr!9100 a2!948) (_4!588 lt!438165)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438166))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14537 lt!438168 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26182 () Bool)

(assert (= bs!26182 d!101576))

(declare-fun m!442723 () Bool)

(assert (=> bs!26182 m!442723))

(declare-fun m!442725 () Bool)

(assert (=> bs!26182 m!442725))

(assert (=> bm!5630 d!101576))

(declare-fun d!101578 () Bool)

(assert (=> d!101578 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1177 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304086 d!101578))

(declare-fun d!101580 () Bool)

(assert (=> d!101580 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1177 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304086 d!101580))

(declare-fun b!304204 () Bool)

(declare-fun e!218970 () Bool)

(declare-fun e!218974 () Bool)

(assert (=> b!304204 (= e!218970 e!218974)))

(declare-fun res!250260 () Bool)

(declare-fun call!5645 () Bool)

(assert (=> b!304204 (= res!250260 call!5645)))

(assert (=> b!304204 (=> (not res!250260) (not e!218974))))

(declare-fun lt!438231 () tuple4!1176)

(declare-fun lt!438229 () (_ BitVec 32))

(declare-fun bm!5642 () Bool)

(declare-fun c!14556 () Bool)

(declare-fun lt!438230 () (_ BitVec 32))

(assert (=> bm!5642 (= call!5645 (byteRangesEq!0 (select (arr!9100 a1!948) (_3!1545 lt!438231)) (select (arr!9100 a2!948) (_3!1545 lt!438231)) lt!438230 (ite c!14556 lt!438229 #b00000000000000000000000000001000)))))

(declare-fun b!304205 () Bool)

(declare-fun e!218972 () Bool)

(assert (=> b!304205 (= e!218972 e!218970)))

(assert (=> b!304205 (= c!14556 (= (_3!1545 lt!438231) (_4!588 lt!438231)))))

(declare-fun e!218969 () Bool)

(declare-fun b!304206 () Bool)

(assert (=> b!304206 (= e!218969 (byteRangesEq!0 (select (arr!9100 a1!948) (_4!588 lt!438231)) (select (arr!9100 a2!948) (_4!588 lt!438231)) #b00000000000000000000000000000000 lt!438229))))

(declare-fun b!304207 () Bool)

(assert (=> b!304207 (= e!218970 call!5645)))

(declare-fun b!304208 () Bool)

(declare-fun e!218971 () Bool)

(assert (=> b!304208 (= e!218971 e!218972)))

(declare-fun res!250258 () Bool)

(assert (=> b!304208 (=> (not res!250258) (not e!218972))))

(declare-fun e!218973 () Bool)

(assert (=> b!304208 (= res!250258 e!218973)))

(declare-fun res!250257 () Bool)

(assert (=> b!304208 (=> res!250257 e!218973)))

(assert (=> b!304208 (= res!250257 (bvsge (_1!13243 lt!438231) (_2!13243 lt!438231)))))

(assert (=> b!304208 (= lt!438229 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304208 (= lt!438230 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304208 (= lt!438231 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304209 () Bool)

(assert (=> b!304209 (= e!218973 (arrayRangesEq!1646 a1!948 a2!948 (_1!13243 lt!438231) (_2!13243 lt!438231)))))

(declare-fun b!304210 () Bool)

(declare-fun res!250256 () Bool)

(assert (=> b!304210 (= res!250256 (= lt!438229 #b00000000000000000000000000000000))))

(assert (=> b!304210 (=> res!250256 e!218969)))

(assert (=> b!304210 (= e!218974 e!218969)))

(declare-fun d!101582 () Bool)

(declare-fun res!250259 () Bool)

(assert (=> d!101582 (=> res!250259 e!218971)))

(assert (=> d!101582 (= res!250259 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101582 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218971)))

(assert (= (and d!101582 (not res!250259)) b!304208))

(assert (= (and b!304208 (not res!250257)) b!304209))

(assert (= (and b!304208 res!250258) b!304205))

(assert (= (and b!304205 c!14556) b!304207))

(assert (= (and b!304205 (not c!14556)) b!304204))

(assert (= (and b!304204 res!250260) b!304210))

(assert (= (and b!304210 (not res!250256)) b!304206))

(assert (= (or b!304207 b!304204) bm!5642))

(declare-fun m!442727 () Bool)

(assert (=> bm!5642 m!442727))

(declare-fun m!442729 () Bool)

(assert (=> bm!5642 m!442729))

(assert (=> bm!5642 m!442727))

(assert (=> bm!5642 m!442729))

(declare-fun m!442731 () Bool)

(assert (=> bm!5642 m!442731))

(declare-fun m!442733 () Bool)

(assert (=> b!304206 m!442733))

(declare-fun m!442735 () Bool)

(assert (=> b!304206 m!442735))

(assert (=> b!304206 m!442733))

(assert (=> b!304206 m!442735))

(declare-fun m!442737 () Bool)

(assert (=> b!304206 m!442737))

(assert (=> b!304208 m!442635))

(declare-fun m!442739 () Bool)

(assert (=> b!304209 m!442739))

(assert (=> b!304089 d!101582))

(declare-fun d!101584 () Bool)

(assert (=> d!101584 (= (array_inv!7629 a1!948) (bvsge (size!8017 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67752 d!101584))

(declare-fun d!101586 () Bool)

(assert (=> d!101586 (= (array_inv!7629 a2!948) (bvsge (size!8017 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67752 d!101586))

(declare-fun d!101588 () Bool)

(assert (=> d!101588 (arrayRangesEq!1646 a1!948 a2!948 (_1!13243 lt!438164) (_2!13243 lt!438164))))

(declare-fun lt!438234 () Unit!21232)

(declare-fun choose!570 (array!18479 array!18479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21232)

(assert (=> d!101588 (= lt!438234 (choose!570 a1!948 a2!948 (_1!13243 lt!438165) (_2!13243 lt!438165) (_1!13243 lt!438164) (_2!13243 lt!438164)))))

(assert (=> d!101588 (and (bvsle #b00000000000000000000000000000000 (_1!13243 lt!438165)) (bvsle (_1!13243 lt!438165) (_2!13243 lt!438165)))))

(assert (=> d!101588 (= (arrayRangesEqSlicedLemma!241 a1!948 a2!948 (_1!13243 lt!438165) (_2!13243 lt!438165) (_1!13243 lt!438164) (_2!13243 lt!438164)) lt!438234)))

(declare-fun bs!26183 () Bool)

(assert (= bs!26183 d!101588))

(assert (=> bs!26183 m!442613))

(declare-fun m!442741 () Bool)

(assert (=> bs!26183 m!442741))

(assert (=> b!304093 d!101588))

(declare-fun d!101590 () Bool)

(declare-fun res!250265 () Bool)

(declare-fun e!218979 () Bool)

(assert (=> d!101590 (=> res!250265 e!218979)))

(assert (=> d!101590 (= res!250265 (= (_1!13243 lt!438164) (_2!13243 lt!438164)))))

(assert (=> d!101590 (= (arrayRangesEq!1646 a1!948 a2!948 (_1!13243 lt!438164) (_2!13243 lt!438164)) e!218979)))

(declare-fun b!304215 () Bool)

(declare-fun e!218980 () Bool)

(assert (=> b!304215 (= e!218979 e!218980)))

(declare-fun res!250266 () Bool)

(assert (=> b!304215 (=> (not res!250266) (not e!218980))))

(assert (=> b!304215 (= res!250266 (= (select (arr!9100 a1!948) (_1!13243 lt!438164)) (select (arr!9100 a2!948) (_1!13243 lt!438164))))))

(declare-fun b!304216 () Bool)

(assert (=> b!304216 (= e!218980 (arrayRangesEq!1646 a1!948 a2!948 (bvadd (_1!13243 lt!438164) #b00000000000000000000000000000001) (_2!13243 lt!438164)))))

(assert (= (and d!101590 (not res!250265)) b!304215))

(assert (= (and b!304215 res!250266) b!304216))

(declare-fun m!442743 () Bool)

(assert (=> b!304215 m!442743))

(declare-fun m!442745 () Bool)

(assert (=> b!304215 m!442745))

(declare-fun m!442747 () Bool)

(assert (=> b!304216 m!442747))

(assert (=> b!304093 d!101590))

(push 1)

(assert (not bm!5642))

(assert (not b!304208))

(assert (not b!304206))

(assert (not b!304216))

(assert (not d!101588))

(assert (not b!304209))

(check-sat)

(pop 1)

(push 1)

(check-sat)

