; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68364 () Bool)

(assert start!68364)

(declare-fun b!306930 () Bool)

(declare-fun e!221157 () Bool)

(declare-fun e!221158 () Bool)

(assert (=> b!306930 (= e!221157 e!221158)))

(declare-datatypes ((tuple4!1260 0))(
  ( (tuple4!1261 (_1!13285 (_ BitVec 32)) (_2!13285 (_ BitVec 32)) (_3!1587 (_ BitVec 32)) (_4!630 (_ BitVec 32))) )
))
(declare-fun lt!439952 () tuple4!1260)

(declare-fun res!251962 () Bool)

(declare-datatypes ((array!18602 0))(
  ( (array!18603 (arr!9142 (Array (_ BitVec 32) (_ BitVec 8))) (size!8059 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18602)

(declare-fun a2!948 () array!18602)

(declare-fun lt!439944 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306930 (= res!251962 (byteRangesEq!0 (select (arr!9142 a1!948) (_3!1587 lt!439952)) (select (arr!9142 a2!948) (_3!1587 lt!439952)) lt!439944 #b00000000000000000000000000000111))))

(assert (=> b!306930 (=> (not res!251962) (not e!221158))))

(declare-fun lt!439945 () tuple4!1260)

(declare-fun e!221161 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun b!306931 () Bool)

(assert (=> b!306931 (= e!221161 (and (not (= ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!630 lt!439945) #b00000000000000000000000000000000) (bvsge (_4!630 lt!439945) (size!8059 a2!948)))))))

(declare-fun b!306932 () Bool)

(declare-datatypes ((Unit!21409 0))(
  ( (Unit!21410) )
))
(declare-fun e!221165 () Unit!21409)

(declare-fun lt!439947 () Unit!21409)

(assert (=> b!306932 (= e!221165 lt!439947)))

(declare-fun arrayRangesEqImpliesEq!292 (array!18602 array!18602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21409)

(assert (=> b!306932 (= lt!439947 (arrayRangesEqImpliesEq!292 a1!948 a2!948 (_1!13285 lt!439952) (_3!1587 lt!439945) (_2!13285 lt!439952)))))

(assert (=> b!306932 (= (select (arr!9142 a1!948) (_3!1587 lt!439945)) (select (arr!9142 a2!948) (_3!1587 lt!439945)))))

(declare-fun b!306933 () Bool)

(declare-fun e!221156 () Bool)

(declare-fun e!221164 () Bool)

(assert (=> b!306933 (= e!221156 e!221164)))

(declare-fun res!251964 () Bool)

(assert (=> b!306933 (=> (not res!251964) (not e!221164))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!439943 () (_ BitVec 64))

(assert (=> b!306933 (= res!251964 (and (bvsle toBit!258 lt!439943) (bvsle fromBit!258 lt!439943)))))

(assert (=> b!306933 (= lt!439943 (bvmul ((_ sign_extend 32) (size!8059 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bm!5876 () Bool)

(declare-fun c!15068 () Bool)

(declare-fun lt!439948 () (_ BitVec 32))

(declare-fun call!5879 () Bool)

(assert (=> bm!5876 (= call!5879 (byteRangesEq!0 (ite c!15068 (select (arr!9142 a1!948) (_3!1587 lt!439952)) (select (arr!9142 a1!948) (_4!630 lt!439952))) (ite c!15068 (select (arr!9142 a2!948) (_3!1587 lt!439952)) (select (arr!9142 a2!948) (_4!630 lt!439952))) (ite c!15068 lt!439944 #b00000000000000000000000000000000) lt!439948))))

(declare-fun b!306934 () Bool)

(declare-fun e!221159 () Bool)

(assert (=> b!306934 (= e!221159 e!221161)))

(declare-fun res!251970 () Bool)

(assert (=> b!306934 (=> (not res!251970) (not e!221161))))

(assert (=> b!306934 (= res!251970 (not (= (_3!1587 lt!439945) (_4!630 lt!439945))))))

(declare-fun lt!439953 () Unit!21409)

(declare-fun e!221166 () Unit!21409)

(assert (=> b!306934 (= lt!439953 e!221166)))

(declare-fun c!15066 () Bool)

(assert (=> b!306934 (= c!15066 (and (bvslt (_4!630 lt!439945) (_4!630 lt!439952)) (bvslt (_3!1587 lt!439952) (_4!630 lt!439945))))))

(declare-fun lt!439949 () Unit!21409)

(assert (=> b!306934 (= lt!439949 e!221165)))

(declare-fun c!15067 () Bool)

(assert (=> b!306934 (= c!15067 (and (bvslt (_3!1587 lt!439952) (_3!1587 lt!439945)) (bvslt (_3!1587 lt!439945) (_4!630 lt!439952))))))

(declare-fun b!306935 () Bool)

(declare-fun res!251969 () Bool)

(assert (=> b!306935 (=> (not res!251969) (not e!221164))))

(declare-fun arrayBitRangesEq!0 (array!18602 array!18602 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306935 (= res!251969 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306936 () Bool)

(declare-fun res!251965 () Bool)

(assert (=> b!306936 (=> (not res!251965) (not e!221164))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!306936 (= res!251965 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439943) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306937 () Bool)

(declare-fun Unit!21411 () Unit!21409)

(assert (=> b!306937 (= e!221165 Unit!21411)))

(declare-fun b!306938 () Bool)

(assert (=> b!306938 (= e!221157 call!5879)))

(declare-fun b!306939 () Bool)

(declare-fun e!221167 () Unit!21409)

(declare-fun lt!439946 () Unit!21409)

(assert (=> b!306939 (= e!221167 lt!439946)))

(declare-fun arrayRangesEqSlicedLemma!283 (array!18602 array!18602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21409)

(assert (=> b!306939 (= lt!439946 (arrayRangesEqSlicedLemma!283 a1!948 a2!948 (_1!13285 lt!439952) (_2!13285 lt!439952) (_1!13285 lt!439945) (_2!13285 lt!439945)))))

(declare-fun arrayRangesEq!1688 (array!18602 array!18602 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306939 (arrayRangesEq!1688 a1!948 a2!948 (_1!13285 lt!439945) (_2!13285 lt!439945))))

(declare-fun b!306940 () Bool)

(assert (=> b!306940 (= e!221164 e!221159)))

(declare-fun res!251963 () Bool)

(assert (=> b!306940 (=> (not res!251963) (not e!221159))))

(assert (=> b!306940 (= res!251963 e!221157)))

(assert (=> b!306940 (= c!15068 (= (_3!1587 lt!439952) (_4!630 lt!439952)))))

(declare-fun lt!439951 () Unit!21409)

(assert (=> b!306940 (= lt!439951 e!221167)))

(declare-fun c!15069 () Bool)

(assert (=> b!306940 (= c!15069 (bvslt (_1!13285 lt!439945) (_2!13285 lt!439945)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1260)

(assert (=> b!306940 (= lt!439945 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306940 (= lt!439948 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306940 (= lt!439944 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306940 (= lt!439952 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306941 () Bool)

(declare-fun Unit!21412 () Unit!21409)

(assert (=> b!306941 (= e!221167 Unit!21412)))

(declare-fun b!306942 () Bool)

(declare-fun e!221160 () Bool)

(assert (=> b!306942 (= e!221160 call!5879)))

(declare-fun b!306943 () Bool)

(declare-fun res!251968 () Bool)

(assert (=> b!306943 (=> (not res!251968) (not e!221161))))

(assert (=> b!306943 (= res!251968 (byteRangesEq!0 (select (arr!9142 a1!948) (_3!1587 lt!439945)) (select (arr!9142 a2!948) (_3!1587 lt!439945)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!306944 () Bool)

(declare-fun Unit!21413 () Unit!21409)

(assert (=> b!306944 (= e!221166 Unit!21413)))

(declare-fun res!251966 () Bool)

(assert (=> start!68364 (=> (not res!251966) (not e!221156))))

(assert (=> start!68364 (= res!251966 (and (bvsle (size!8059 a1!948) (size!8059 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68364 e!221156))

(assert (=> start!68364 true))

(declare-fun array_inv!7671 (array!18602) Bool)

(assert (=> start!68364 (array_inv!7671 a1!948)))

(assert (=> start!68364 (array_inv!7671 a2!948)))

(declare-fun b!306945 () Bool)

(declare-fun res!251967 () Bool)

(assert (=> b!306945 (= res!251967 (= lt!439948 #b00000000000000000000000000000000))))

(assert (=> b!306945 (=> res!251967 e!221160)))

(assert (=> b!306945 (= e!221158 e!221160)))

(declare-fun b!306946 () Bool)

(declare-fun lt!439950 () Unit!21409)

(assert (=> b!306946 (= e!221166 lt!439950)))

(assert (=> b!306946 (= lt!439950 (arrayRangesEqImpliesEq!292 a1!948 a2!948 (_1!13285 lt!439952) (_4!630 lt!439945) (_2!13285 lt!439952)))))

(assert (=> b!306946 (= (select (arr!9142 a1!948) (_4!630 lt!439945)) (select (arr!9142 a2!948) (_4!630 lt!439945)))))

(assert (= (and start!68364 res!251966) b!306933))

(assert (= (and b!306933 res!251964) b!306935))

(assert (= (and b!306935 res!251969) b!306936))

(assert (= (and b!306936 res!251965) b!306940))

(assert (= (and b!306940 c!15069) b!306939))

(assert (= (and b!306940 (not c!15069)) b!306941))

(assert (= (and b!306940 c!15068) b!306938))

(assert (= (and b!306940 (not c!15068)) b!306930))

(assert (= (and b!306930 res!251962) b!306945))

(assert (= (and b!306945 (not res!251967)) b!306942))

(assert (= (or b!306938 b!306942) bm!5876))

(assert (= (and b!306940 res!251963) b!306934))

(assert (= (and b!306934 c!15067) b!306932))

(assert (= (and b!306934 (not c!15067)) b!306937))

(assert (= (and b!306934 c!15066) b!306946))

(assert (= (and b!306934 (not c!15066)) b!306944))

(assert (= (and b!306934 res!251970) b!306943))

(assert (= (and b!306943 res!251968) b!306931))

(declare-fun m!445403 () Bool)

(assert (=> b!306930 m!445403))

(declare-fun m!445405 () Bool)

(assert (=> b!306930 m!445405))

(assert (=> b!306930 m!445403))

(assert (=> b!306930 m!445405))

(declare-fun m!445407 () Bool)

(assert (=> b!306930 m!445407))

(declare-fun m!445409 () Bool)

(assert (=> b!306932 m!445409))

(declare-fun m!445411 () Bool)

(assert (=> b!306932 m!445411))

(declare-fun m!445413 () Bool)

(assert (=> b!306932 m!445413))

(declare-fun m!445415 () Bool)

(assert (=> b!306935 m!445415))

(declare-fun m!445417 () Bool)

(assert (=> b!306946 m!445417))

(declare-fun m!445419 () Bool)

(assert (=> b!306946 m!445419))

(declare-fun m!445421 () Bool)

(assert (=> b!306946 m!445421))

(assert (=> b!306943 m!445411))

(assert (=> b!306943 m!445413))

(assert (=> b!306943 m!445411))

(assert (=> b!306943 m!445413))

(declare-fun m!445423 () Bool)

(assert (=> b!306943 m!445423))

(declare-fun m!445425 () Bool)

(assert (=> b!306939 m!445425))

(declare-fun m!445427 () Bool)

(assert (=> b!306939 m!445427))

(declare-fun m!445429 () Bool)

(assert (=> bm!5876 m!445429))

(assert (=> bm!5876 m!445405))

(declare-fun m!445431 () Bool)

(assert (=> bm!5876 m!445431))

(assert (=> bm!5876 m!445403))

(declare-fun m!445433 () Bool)

(assert (=> bm!5876 m!445433))

(declare-fun m!445435 () Bool)

(assert (=> start!68364 m!445435))

(declare-fun m!445437 () Bool)

(assert (=> start!68364 m!445437))

(declare-fun m!445439 () Bool)

(assert (=> b!306940 m!445439))

(declare-fun m!445441 () Bool)

(assert (=> b!306940 m!445441))

(push 1)

(assert (not b!306932))

(assert (not b!306930))

(assert (not b!306946))

(assert (not start!68364))

(assert (not b!306940))

(assert (not b!306939))

(assert (not b!306943))

(assert (not bm!5876))

(assert (not b!306935))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102436 () Bool)

(assert (=> d!102436 (= (byteRangesEq!0 (select (arr!9142 a1!948) (_3!1587 lt!439952)) (select (arr!9142 a2!948) (_3!1587 lt!439952)) lt!439944 #b00000000000000000000000000000111) (or (= lt!439944 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9142 a1!948) (_3!1587 lt!439952))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439944)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9142 a2!948) (_3!1587 lt!439952))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439944)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26397 () Bool)

(assert (= bs!26397 d!102436))

(declare-fun m!445559 () Bool)

(assert (=> bs!26397 m!445559))

(declare-fun m!445561 () Bool)

(assert (=> bs!26397 m!445561))

(assert (=> b!306930 d!102436))

(declare-fun d!102438 () Bool)

(assert (=> d!102438 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1261 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306940 d!102438))

(declare-fun d!102440 () Bool)

(assert (=> d!102440 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1261 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306940 d!102440))

(declare-fun d!102442 () Bool)

(assert (=> d!102442 (arrayRangesEq!1688 a1!948 a2!948 (_1!13285 lt!439945) (_2!13285 lt!439945))))

(declare-fun lt!440038 () Unit!21409)

(declare-fun choose!640 (array!18602 array!18602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21409)

(assert (=> d!102442 (= lt!440038 (choose!640 a1!948 a2!948 (_1!13285 lt!439952) (_2!13285 lt!439952) (_1!13285 lt!439945) (_2!13285 lt!439945)))))

(assert (=> d!102442 (and (bvsle #b00000000000000000000000000000000 (_1!13285 lt!439952)) (bvsle (_1!13285 lt!439952) (_2!13285 lt!439952)))))

(assert (=> d!102442 (= (arrayRangesEqSlicedLemma!283 a1!948 a2!948 (_1!13285 lt!439952) (_2!13285 lt!439952) (_1!13285 lt!439945) (_2!13285 lt!439945)) lt!440038)))

(declare-fun bs!26398 () Bool)

(assert (= bs!26398 d!102442))

(assert (=> bs!26398 m!445427))

(declare-fun m!445563 () Bool)

(assert (=> bs!26398 m!445563))

(assert (=> b!306939 d!102442))

(declare-fun d!102444 () Bool)

(declare-fun res!252050 () Bool)

(declare-fun e!221268 () Bool)

(assert (=> d!102444 (=> res!252050 e!221268)))

(assert (=> d!102444 (= res!252050 (= (_1!13285 lt!439945) (_2!13285 lt!439945)))))

(assert (=> d!102444 (= (arrayRangesEq!1688 a1!948 a2!948 (_1!13285 lt!439945) (_2!13285 lt!439945)) e!221268)))

(declare-fun b!307080 () Bool)

(declare-fun e!221269 () Bool)

(assert (=> b!307080 (= e!221268 e!221269)))

(declare-fun res!252051 () Bool)

(assert (=> b!307080 (=> (not res!252051) (not e!221269))))

(assert (=> b!307080 (= res!252051 (= (select (arr!9142 a1!948) (_1!13285 lt!439945)) (select (arr!9142 a2!948) (_1!13285 lt!439945))))))

(declare-fun b!307081 () Bool)

(assert (=> b!307081 (= e!221269 (arrayRangesEq!1688 a1!948 a2!948 (bvadd (_1!13285 lt!439945) #b00000000000000000000000000000001) (_2!13285 lt!439945)))))

(assert (= (and d!102444 (not res!252050)) b!307080))

(assert (= (and b!307080 res!252051) b!307081))

(declare-fun m!445565 () Bool)

(assert (=> b!307080 m!445565))

(declare-fun m!445567 () Bool)

(assert (=> b!307080 m!445567))

(declare-fun m!445569 () Bool)

(assert (=> b!307081 m!445569))

(assert (=> b!306939 d!102444))

(declare-fun d!102452 () Bool)

(assert (=> d!102452 (= (byteRangesEq!0 (ite c!15068 (select (arr!9142 a1!948) (_3!1587 lt!439952)) (select (arr!9142 a1!948) (_4!630 lt!439952))) (ite c!15068 (select (arr!9142 a2!948) (_3!1587 lt!439952)) (select (arr!9142 a2!948) (_4!630 lt!439952))) (ite c!15068 lt!439944 #b00000000000000000000000000000000) lt!439948) (or (= (ite c!15068 lt!439944 #b00000000000000000000000000000000) lt!439948) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15068 (select (arr!9142 a1!948) (_3!1587 lt!439952)) (select (arr!9142 a1!948) (_4!630 lt!439952)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439948))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15068 lt!439944 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15068 (select (arr!9142 a2!948) (_3!1587 lt!439952)) (select (arr!9142 a2!948) (_4!630 lt!439952)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439948))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15068 lt!439944 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26399 () Bool)

(assert (= bs!26399 d!102452))

(declare-fun m!445571 () Bool)

(assert (=> bs!26399 m!445571))

(declare-fun m!445573 () Bool)

(assert (=> bs!26399 m!445573))

(assert (=> bm!5876 d!102452))

(declare-fun d!102454 () Bool)

(assert (=> d!102454 (= (byteRangesEq!0 (select (arr!9142 a1!948) (_3!1587 lt!439945)) (select (arr!9142 a2!948) (_3!1587 lt!439945)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9142 a1!948) (_3!1587 lt!439945))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9142 a2!948) (_3!1587 lt!439945))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26400 () Bool)

(assert (= bs!26400 d!102454))

(assert (=> bs!26400 m!445559))

(declare-fun m!445575 () Bool)

(assert (=> bs!26400 m!445575))

(assert (=> b!306943 d!102454))

(declare-fun d!102456 () Bool)

(assert (=> d!102456 (and (bvsge (_3!1587 lt!439945) #b00000000000000000000000000000000) (bvslt (_3!1587 lt!439945) (size!8059 a1!948)) (bvslt (_3!1587 lt!439945) (size!8059 a2!948)) (= (select (arr!9142 a1!948) (_3!1587 lt!439945)) (select (arr!9142 a2!948) (_3!1587 lt!439945))))))

(declare-fun lt!440043 () Unit!21409)

(declare-fun choose!641 (array!18602 array!18602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21409)

(assert (=> d!102456 (= lt!440043 (choose!641 a1!948 a2!948 (_1!13285 lt!439952) (_3!1587 lt!439945) (_2!13285 lt!439952)))))

(assert (=> d!102456 (and (bvsle #b00000000000000000000000000000000 (_1!13285 lt!439952)) (bvsle (_1!13285 lt!439952) (_2!13285 lt!439952)))))

(assert (=> d!102456 (= (arrayRangesEqImpliesEq!292 a1!948 a2!948 (_1!13285 lt!439952) (_3!1587 lt!439945) (_2!13285 lt!439952)) lt!440043)))

(declare-fun bs!26401 () Bool)

(assert (= bs!26401 d!102456))

(assert (=> bs!26401 m!445411))

(assert (=> bs!26401 m!445413))

(declare-fun m!445577 () Bool)

(assert (=> bs!26401 m!445577))

(assert (=> b!306932 d!102456))

(declare-fun d!102458 () Bool)

(assert (=> d!102458 (= (array_inv!7671 a1!948) (bvsge (size!8059 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68364 d!102458))

(declare-fun d!102460 () Bool)

(assert (=> d!102460 (= (array_inv!7671 a2!948) (bvsge (size!8059 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68364 d!102460))

(declare-fun lt!440064 () (_ BitVec 32))

(declare-fun lt!440063 () tuple4!1260)

(declare-fun b!307117 () Bool)

(declare-fun e!221303 () Bool)

(assert (=> b!307117 (= e!221303 (byteRangesEq!0 (select (arr!9142 a1!948) (_4!630 lt!440063)) (select (arr!9142 a2!948) (_4!630 lt!440063)) #b00000000000000000000000000000000 lt!440064))))

(declare-fun b!307118 () Bool)

(declare-fun res!252079 () Bool)

(assert (=> b!307118 (= res!252079 (= lt!440064 #b00000000000000000000000000000000))))

(assert (=> b!307118 (=> res!252079 e!221303)))

(declare-fun e!221300 () Bool)

(assert (=> b!307118 (= e!221300 e!221303)))

(declare-fun b!307119 () Bool)

(declare-fun e!221301 () Bool)

(declare-fun call!5894 () Bool)

(assert (=> b!307119 (= e!221301 call!5894)))

(declare-fun b!307120 () Bool)

(declare-fun e!221304 () Bool)

(declare-fun e!221302 () Bool)

(assert (=> b!307120 (= e!221304 e!221302)))

(declare-fun res!252081 () Bool)

(assert (=> b!307120 (=> (not res!252081) (not e!221302))))

(declare-fun e!221305 () Bool)

(assert (=> b!307120 (= res!252081 e!221305)))

(declare-fun res!252080 () Bool)

(assert (=> b!307120 (=> res!252080 e!221305)))

(assert (=> b!307120 (= res!252080 (bvsge (_1!13285 lt!440063) (_2!13285 lt!440063)))))

(assert (=> b!307120 (= lt!440064 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!440065 () (_ BitVec 32))

(assert (=> b!307120 (= lt!440065 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307120 (= lt!440063 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!102462 () Bool)

(declare-fun res!252077 () Bool)

(assert (=> d!102462 (=> res!252077 e!221304)))

(assert (=> d!102462 (= res!252077 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102462 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!221304)))

(declare-fun b!307121 () Bool)

(assert (=> b!307121 (= e!221301 e!221300)))

(declare-fun res!252078 () Bool)

(assert (=> b!307121 (= res!252078 call!5894)))

(assert (=> b!307121 (=> (not res!252078) (not e!221300))))

(declare-fun b!307122 () Bool)

(assert (=> b!307122 (= e!221305 (arrayRangesEq!1688 a1!948 a2!948 (_1!13285 lt!440063) (_2!13285 lt!440063)))))

(declare-fun c!15102 () Bool)

(declare-fun bm!5891 () Bool)

(assert (=> bm!5891 (= call!5894 (byteRangesEq!0 (select (arr!9142 a1!948) (_3!1587 lt!440063)) (select (arr!9142 a2!948) (_3!1587 lt!440063)) lt!440065 (ite c!15102 lt!440064 #b00000000000000000000000000001000)))))

(declare-fun b!307123 () Bool)

(assert (=> b!307123 (= e!221302 e!221301)))

(assert (=> b!307123 (= c!15102 (= (_3!1587 lt!440063) (_4!630 lt!440063)))))

(assert (= (and d!102462 (not res!252077)) b!307120))

(assert (= (and b!307120 (not res!252080)) b!307122))

(assert (= (and b!307120 res!252081) b!307123))

(assert (= (and b!307123 c!15102) b!307119))

(assert (= (and b!307123 (not c!15102)) b!307121))

(assert (= (and b!307121 res!252078) b!307118))

(assert (= (and b!307118 (not res!252079)) b!307117))

(assert (= (or b!307119 b!307121) bm!5891))

(declare-fun m!445597 () Bool)

(assert (=> b!307117 m!445597))

(declare-fun m!445599 () Bool)

(assert (=> b!307117 m!445599))

(assert (=> b!307117 m!445597))

(assert (=> b!307117 m!445599))

(declare-fun m!445601 () Bool)

(assert (=> b!307117 m!445601))

(assert (=> b!307120 m!445441))

(declare-fun m!445603 () Bool)

(assert (=> b!307122 m!445603))

(declare-fun m!445605 () Bool)

(assert (=> bm!5891 m!445605))

(declare-fun m!445607 () Bool)

(assert (=> bm!5891 m!445607))

(assert (=> bm!5891 m!445605))

(assert (=> bm!5891 m!445607))

(declare-fun m!445609 () Bool)

(assert (=> bm!5891 m!445609))

(assert (=> b!306935 d!102462))

(declare-fun d!102474 () Bool)

(assert (=> d!102474 (and (bvsge (_4!630 lt!439945) #b00000000000000000000000000000000) (bvslt (_4!630 lt!439945) (size!8059 a1!948)) (bvslt (_4!630 lt!439945) (size!8059 a2!948)) (= (select (arr!9142 a1!948) (_4!630 lt!439945)) (select (arr!9142 a2!948) (_4!630 lt!439945))))))

(declare-fun lt!440066 () Unit!21409)

(assert (=> d!102474 (= lt!440066 (choose!641 a1!948 a2!948 (_1!13285 lt!439952) (_4!630 lt!439945) (_2!13285 lt!439952)))))

(assert (=> d!102474 (and (bvsle #b00000000000000000000000000000000 (_1!13285 lt!439952)) (bvsle (_1!13285 lt!439952) (_2!13285 lt!439952)))))

(assert (=> d!102474 (= (arrayRangesEqImpliesEq!292 a1!948 a2!948 (_1!13285 lt!439952) (_4!630 lt!439945) (_2!13285 lt!439952)) lt!440066)))

(declare-fun bs!26404 () Bool)

(assert (= bs!26404 d!102474))

(assert (=> bs!26404 m!445419))

(assert (=> bs!26404 m!445421))

(declare-fun m!445611 () Bool)

(assert (=> bs!26404 m!445611))

(assert (=> b!306946 d!102474))

(push 1)

(assert (not d!102456))

(assert (not bm!5891))

(assert (not b!307081))

(assert (not b!307122))

(assert (not d!102442))

(assert (not b!307120))

(assert (not b!307117))

(assert (not d!102474))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

