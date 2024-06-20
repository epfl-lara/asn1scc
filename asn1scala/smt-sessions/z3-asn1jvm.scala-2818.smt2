; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68030 () Bool)

(assert start!68030)

(declare-fun b!305400 () Bool)

(declare-fun e!219949 () Bool)

(declare-fun call!5753 () Bool)

(assert (=> b!305400 (= e!219949 call!5753)))

(declare-fun c!14764 () Bool)

(declare-fun bm!5750 () Bool)

(declare-fun lt!438955 () (_ BitVec 32))

(declare-fun lt!438954 () (_ BitVec 32))

(declare-datatypes ((tuple4!1220 0))(
  ( (tuple4!1221 (_1!13265 (_ BitVec 32)) (_2!13265 (_ BitVec 32)) (_3!1567 (_ BitVec 32)) (_4!610 (_ BitVec 32))) )
))
(declare-fun lt!438956 () tuple4!1220)

(declare-datatypes ((array!18541 0))(
  ( (array!18542 (arr!9122 (Array (_ BitVec 32) (_ BitVec 8))) (size!8039 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18541)

(declare-fun a2!948 () array!18541)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5750 (= call!5753 (byteRangesEq!0 (ite c!14764 (select (arr!9122 a1!948) (_3!1567 lt!438956)) (select (arr!9122 a1!948) (_4!610 lt!438956))) (ite c!14764 (select (arr!9122 a2!948) (_3!1567 lt!438956)) (select (arr!9122 a2!948) (_4!610 lt!438956))) (ite c!14764 lt!438954 #b00000000000000000000000000000000) lt!438955))))

(declare-fun b!305401 () Bool)

(declare-fun res!251043 () Bool)

(assert (=> b!305401 (= res!251043 (= lt!438955 #b00000000000000000000000000000000))))

(declare-fun e!219956 () Bool)

(assert (=> b!305401 (=> res!251043 e!219956)))

(declare-fun e!219948 () Bool)

(assert (=> b!305401 (= e!219948 e!219956)))

(declare-fun b!305402 () Bool)

(assert (=> b!305402 (= e!219956 call!5753)))

(declare-fun b!305403 () Bool)

(declare-datatypes ((Unit!21311 0))(
  ( (Unit!21312) )
))
(declare-fun e!219955 () Unit!21311)

(declare-fun Unit!21313 () Unit!21311)

(assert (=> b!305403 (= e!219955 Unit!21313)))

(declare-fun b!305404 () Bool)

(assert (=> b!305404 (= e!219949 e!219948)))

(declare-fun res!251036 () Bool)

(assert (=> b!305404 (= res!251036 (byteRangesEq!0 (select (arr!9122 a1!948) (_3!1567 lt!438956)) (select (arr!9122 a2!948) (_3!1567 lt!438956)) lt!438954 #b00000000000000000000000000000111))))

(assert (=> b!305404 (=> (not res!251036) (not e!219948))))

(declare-fun b!305405 () Bool)

(declare-fun e!219952 () Bool)

(declare-fun e!219957 () Bool)

(assert (=> b!305405 (= e!219952 e!219957)))

(declare-fun res!251038 () Bool)

(assert (=> b!305405 (=> (not res!251038) (not e!219957))))

(assert (=> b!305405 (= res!251038 e!219949)))

(assert (=> b!305405 (= c!14764 (= (_3!1567 lt!438956) (_4!610 lt!438956)))))

(declare-fun lt!438953 () Unit!21311)

(declare-fun e!219950 () Unit!21311)

(assert (=> b!305405 (= lt!438953 e!219950)))

(declare-fun c!14766 () Bool)

(declare-fun lt!438950 () tuple4!1220)

(assert (=> b!305405 (= c!14766 (bvslt (_1!13265 lt!438950) (_2!13265 lt!438950)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1220)

(assert (=> b!305405 (= lt!438950 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!305405 (= lt!438955 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!305405 (= lt!438954 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305405 (= lt!438956 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305406 () Bool)

(declare-fun res!251037 () Bool)

(assert (=> b!305406 (=> (not res!251037) (not e!219952))))

(declare-fun arrayBitRangesEq!0 (array!18541 array!18541 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305406 (= res!251037 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!305407 () Bool)

(declare-fun res!251042 () Bool)

(assert (=> b!305407 (=> (not res!251042) (not e!219952))))

(declare-fun lt!438957 () (_ BitVec 64))

(assert (=> b!305407 (= res!251042 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438957) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!251040 () Bool)

(declare-fun e!219951 () Bool)

(assert (=> start!68030 (=> (not res!251040) (not e!219951))))

(assert (=> start!68030 (= res!251040 (and (bvsle (size!8039 a1!948) (size!8039 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68030 e!219951))

(assert (=> start!68030 true))

(declare-fun array_inv!7651 (array!18541) Bool)

(assert (=> start!68030 (array_inv!7651 a1!948)))

(assert (=> start!68030 (array_inv!7651 a2!948)))

(declare-fun b!305408 () Bool)

(declare-fun e!219953 () Bool)

(assert (=> b!305408 (= e!219957 e!219953)))

(declare-fun res!251041 () Bool)

(assert (=> b!305408 (=> (not res!251041) (not e!219953))))

(assert (=> b!305408 (= res!251041 (and (bvslt (_4!610 lt!438950) (_4!610 lt!438956)) (bvslt (_3!1567 lt!438956) (_4!610 lt!438950)) (bvsle #b00000000000000000000000000000000 (_1!13265 lt!438956)) (bvsle (_1!13265 lt!438956) (_2!13265 lt!438956)) (bvsle (_2!13265 lt!438956) (size!8039 a1!948)) (bvsle (_1!13265 lt!438956) (_4!610 lt!438950)) (bvslt (_4!610 lt!438950) (_2!13265 lt!438956))))))

(declare-fun lt!438952 () Unit!21311)

(assert (=> b!305408 (= lt!438952 e!219955)))

(declare-fun c!14765 () Bool)

(assert (=> b!305408 (= c!14765 (and (bvslt (_3!1567 lt!438956) (_3!1567 lt!438950)) (bvslt (_3!1567 lt!438950) (_4!610 lt!438956))))))

(declare-fun b!305409 () Bool)

(declare-fun Unit!21314 () Unit!21311)

(assert (=> b!305409 (= e!219950 Unit!21314)))

(declare-fun b!305410 () Bool)

(declare-fun lt!438951 () Unit!21311)

(assert (=> b!305410 (= e!219950 lt!438951)))

(declare-fun arrayRangesEqSlicedLemma!263 (array!18541 array!18541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21311)

(assert (=> b!305410 (= lt!438951 (arrayRangesEqSlicedLemma!263 a1!948 a2!948 (_1!13265 lt!438956) (_2!13265 lt!438956) (_1!13265 lt!438950) (_2!13265 lt!438950)))))

(declare-fun arrayRangesEq!1668 (array!18541 array!18541 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305410 (arrayRangesEq!1668 a1!948 a2!948 (_1!13265 lt!438950) (_2!13265 lt!438950))))

(declare-fun b!305411 () Bool)

(assert (=> b!305411 (= e!219953 (not (arrayRangesEq!1668 a1!948 a2!948 (_1!13265 lt!438956) (_2!13265 lt!438956))))))

(declare-fun b!305412 () Bool)

(assert (=> b!305412 (= e!219951 e!219952)))

(declare-fun res!251039 () Bool)

(assert (=> b!305412 (=> (not res!251039) (not e!219952))))

(assert (=> b!305412 (= res!251039 (and (bvsle toBit!258 lt!438957) (bvsle fromBit!258 lt!438957)))))

(assert (=> b!305412 (= lt!438957 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8039 a1!948))))))

(declare-fun b!305413 () Bool)

(declare-fun lt!438949 () Unit!21311)

(assert (=> b!305413 (= e!219955 lt!438949)))

(declare-fun arrayRangesEqImpliesEq!272 (array!18541 array!18541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21311)

(assert (=> b!305413 (= lt!438949 (arrayRangesEqImpliesEq!272 a1!948 a2!948 (_1!13265 lt!438956) (_3!1567 lt!438950) (_2!13265 lt!438956)))))

(assert (=> b!305413 (= (select (arr!9122 a1!948) (_3!1567 lt!438950)) (select (arr!9122 a2!948) (_3!1567 lt!438950)))))

(assert (= (and start!68030 res!251040) b!305412))

(assert (= (and b!305412 res!251039) b!305406))

(assert (= (and b!305406 res!251037) b!305407))

(assert (= (and b!305407 res!251042) b!305405))

(assert (= (and b!305405 c!14766) b!305410))

(assert (= (and b!305405 (not c!14766)) b!305409))

(assert (= (and b!305405 c!14764) b!305400))

(assert (= (and b!305405 (not c!14764)) b!305404))

(assert (= (and b!305404 res!251036) b!305401))

(assert (= (and b!305401 (not res!251043)) b!305402))

(assert (= (or b!305400 b!305402) bm!5750))

(assert (= (and b!305405 res!251038) b!305408))

(assert (= (and b!305408 c!14765) b!305413))

(assert (= (and b!305408 (not c!14765)) b!305403))

(assert (= (and b!305408 res!251041) b!305411))

(declare-fun m!443845 () Bool)

(assert (=> b!305405 m!443845))

(declare-fun m!443847 () Bool)

(assert (=> b!305405 m!443847))

(declare-fun m!443849 () Bool)

(assert (=> b!305413 m!443849))

(declare-fun m!443851 () Bool)

(assert (=> b!305413 m!443851))

(declare-fun m!443853 () Bool)

(assert (=> b!305413 m!443853))

(declare-fun m!443855 () Bool)

(assert (=> b!305411 m!443855))

(declare-fun m!443857 () Bool)

(assert (=> start!68030 m!443857))

(declare-fun m!443859 () Bool)

(assert (=> start!68030 m!443859))

(declare-fun m!443861 () Bool)

(assert (=> b!305406 m!443861))

(declare-fun m!443863 () Bool)

(assert (=> bm!5750 m!443863))

(declare-fun m!443865 () Bool)

(assert (=> bm!5750 m!443865))

(declare-fun m!443867 () Bool)

(assert (=> bm!5750 m!443867))

(declare-fun m!443869 () Bool)

(assert (=> bm!5750 m!443869))

(declare-fun m!443871 () Bool)

(assert (=> bm!5750 m!443871))

(declare-fun m!443873 () Bool)

(assert (=> b!305410 m!443873))

(declare-fun m!443875 () Bool)

(assert (=> b!305410 m!443875))

(assert (=> b!305404 m!443863))

(assert (=> b!305404 m!443871))

(assert (=> b!305404 m!443863))

(assert (=> b!305404 m!443871))

(declare-fun m!443877 () Bool)

(assert (=> b!305404 m!443877))

(check-sat (not bm!5750) (not b!305404) (not b!305410) (not b!305405) (not b!305413) (not b!305406) (not b!305411) (not start!68030))
(check-sat)
(get-model)

(declare-fun d!101918 () Bool)

(assert (=> d!101918 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1221 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305405 d!101918))

(declare-fun d!101920 () Bool)

(assert (=> d!101920 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1221 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305405 d!101920))

(declare-fun d!101922 () Bool)

(assert (=> d!101922 (= (byteRangesEq!0 (ite c!14764 (select (arr!9122 a1!948) (_3!1567 lt!438956)) (select (arr!9122 a1!948) (_4!610 lt!438956))) (ite c!14764 (select (arr!9122 a2!948) (_3!1567 lt!438956)) (select (arr!9122 a2!948) (_4!610 lt!438956))) (ite c!14764 lt!438954 #b00000000000000000000000000000000) lt!438955) (or (= (ite c!14764 lt!438954 #b00000000000000000000000000000000) lt!438955) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14764 (select (arr!9122 a1!948) (_3!1567 lt!438956)) (select (arr!9122 a1!948) (_4!610 lt!438956)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438955))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14764 lt!438954 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14764 (select (arr!9122 a2!948) (_3!1567 lt!438956)) (select (arr!9122 a2!948) (_4!610 lt!438956)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438955))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14764 lt!438954 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26262 () Bool)

(assert (= bs!26262 d!101922))

(declare-fun m!443913 () Bool)

(assert (=> bs!26262 m!443913))

(declare-fun m!443915 () Bool)

(assert (=> bs!26262 m!443915))

(assert (=> bm!5750 d!101922))

(declare-fun d!101924 () Bool)

(assert (=> d!101924 (= (array_inv!7651 a1!948) (bvsge (size!8039 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68030 d!101924))

(declare-fun d!101926 () Bool)

(assert (=> d!101926 (= (array_inv!7651 a2!948) (bvsge (size!8039 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68030 d!101926))

(declare-fun d!101928 () Bool)

(declare-fun res!251072 () Bool)

(declare-fun e!219996 () Bool)

(assert (=> d!101928 (=> res!251072 e!219996)))

(assert (=> d!101928 (= res!251072 (= (_1!13265 lt!438956) (_2!13265 lt!438956)))))

(assert (=> d!101928 (= (arrayRangesEq!1668 a1!948 a2!948 (_1!13265 lt!438956) (_2!13265 lt!438956)) e!219996)))

(declare-fun b!305460 () Bool)

(declare-fun e!219997 () Bool)

(assert (=> b!305460 (= e!219996 e!219997)))

(declare-fun res!251073 () Bool)

(assert (=> b!305460 (=> (not res!251073) (not e!219997))))

(assert (=> b!305460 (= res!251073 (= (select (arr!9122 a1!948) (_1!13265 lt!438956)) (select (arr!9122 a2!948) (_1!13265 lt!438956))))))

(declare-fun b!305461 () Bool)

(assert (=> b!305461 (= e!219997 (arrayRangesEq!1668 a1!948 a2!948 (bvadd (_1!13265 lt!438956) #b00000000000000000000000000000001) (_2!13265 lt!438956)))))

(assert (= (and d!101928 (not res!251072)) b!305460))

(assert (= (and b!305460 res!251073) b!305461))

(declare-fun m!443917 () Bool)

(assert (=> b!305460 m!443917))

(declare-fun m!443919 () Bool)

(assert (=> b!305460 m!443919))

(declare-fun m!443921 () Bool)

(assert (=> b!305461 m!443921))

(assert (=> b!305411 d!101928))

(declare-fun b!305484 () Bool)

(declare-fun e!220020 () Bool)

(declare-fun e!220019 () Bool)

(assert (=> b!305484 (= e!220020 e!220019)))

(declare-fun c!14778 () Bool)

(declare-fun lt!438998 () tuple4!1220)

(assert (=> b!305484 (= c!14778 (= (_3!1567 lt!438998) (_4!610 lt!438998)))))

(declare-fun call!5759 () Bool)

(declare-fun bm!5756 () Bool)

(declare-fun lt!438999 () (_ BitVec 32))

(declare-fun lt!438997 () (_ BitVec 32))

(assert (=> bm!5756 (= call!5759 (byteRangesEq!0 (ite c!14778 (select (arr!9122 a1!948) (_3!1567 lt!438998)) (select (arr!9122 a1!948) (_4!610 lt!438998))) (ite c!14778 (select (arr!9122 a2!948) (_3!1567 lt!438998)) (select (arr!9122 a2!948) (_4!610 lt!438998))) (ite c!14778 lt!438997 #b00000000000000000000000000000000) lt!438999))))

(declare-fun b!305485 () Bool)

(declare-fun e!220021 () Bool)

(assert (=> b!305485 (= e!220021 e!220020)))

(declare-fun res!251096 () Bool)

(assert (=> b!305485 (=> (not res!251096) (not e!220020))))

(declare-fun e!220023 () Bool)

(assert (=> b!305485 (= res!251096 e!220023)))

(declare-fun res!251095 () Bool)

(assert (=> b!305485 (=> res!251095 e!220023)))

(assert (=> b!305485 (= res!251095 (bvsge (_1!13265 lt!438998) (_2!13265 lt!438998)))))

(assert (=> b!305485 (= lt!438999 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305485 (= lt!438997 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305485 (= lt!438998 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305486 () Bool)

(assert (=> b!305486 (= e!220023 (arrayRangesEq!1668 a1!948 a2!948 (_1!13265 lt!438998) (_2!13265 lt!438998)))))

(declare-fun b!305487 () Bool)

(assert (=> b!305487 (= e!220019 call!5759)))

(declare-fun b!305488 () Bool)

(declare-fun e!220022 () Bool)

(assert (=> b!305488 (= e!220022 call!5759)))

(declare-fun d!101930 () Bool)

(declare-fun res!251094 () Bool)

(assert (=> d!101930 (=> res!251094 e!220021)))

(assert (=> d!101930 (= res!251094 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101930 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220021)))

(declare-fun b!305489 () Bool)

(declare-fun res!251092 () Bool)

(assert (=> b!305489 (= res!251092 (= lt!438999 #b00000000000000000000000000000000))))

(assert (=> b!305489 (=> res!251092 e!220022)))

(declare-fun e!220018 () Bool)

(assert (=> b!305489 (= e!220018 e!220022)))

(declare-fun b!305490 () Bool)

(assert (=> b!305490 (= e!220019 e!220018)))

(declare-fun res!251093 () Bool)

(assert (=> b!305490 (= res!251093 (byteRangesEq!0 (select (arr!9122 a1!948) (_3!1567 lt!438998)) (select (arr!9122 a2!948) (_3!1567 lt!438998)) lt!438997 #b00000000000000000000000000001000))))

(assert (=> b!305490 (=> (not res!251093) (not e!220018))))

(assert (= (and d!101930 (not res!251094)) b!305485))

(assert (= (and b!305485 (not res!251095)) b!305486))

(assert (= (and b!305485 res!251096) b!305484))

(assert (= (and b!305484 c!14778) b!305487))

(assert (= (and b!305484 (not c!14778)) b!305490))

(assert (= (and b!305490 res!251093) b!305489))

(assert (= (and b!305489 (not res!251092)) b!305488))

(assert (= (or b!305487 b!305488) bm!5756))

(declare-fun m!443939 () Bool)

(assert (=> bm!5756 m!443939))

(declare-fun m!443941 () Bool)

(assert (=> bm!5756 m!443941))

(declare-fun m!443943 () Bool)

(assert (=> bm!5756 m!443943))

(declare-fun m!443945 () Bool)

(assert (=> bm!5756 m!443945))

(declare-fun m!443947 () Bool)

(assert (=> bm!5756 m!443947))

(assert (=> b!305485 m!443847))

(declare-fun m!443949 () Bool)

(assert (=> b!305486 m!443949))

(assert (=> b!305490 m!443945))

(assert (=> b!305490 m!443941))

(assert (=> b!305490 m!443945))

(assert (=> b!305490 m!443941))

(declare-fun m!443951 () Bool)

(assert (=> b!305490 m!443951))

(assert (=> b!305406 d!101930))

(declare-fun d!101942 () Bool)

(assert (=> d!101942 (and (bvsge (_3!1567 lt!438950) #b00000000000000000000000000000000) (bvslt (_3!1567 lt!438950) (size!8039 a1!948)) (bvslt (_3!1567 lt!438950) (size!8039 a2!948)) (= (select (arr!9122 a1!948) (_3!1567 lt!438950)) (select (arr!9122 a2!948) (_3!1567 lt!438950))))))

(declare-fun lt!439002 () Unit!21311)

(declare-fun choose!597 (array!18541 array!18541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21311)

(assert (=> d!101942 (= lt!439002 (choose!597 a1!948 a2!948 (_1!13265 lt!438956) (_3!1567 lt!438950) (_2!13265 lt!438956)))))

(assert (=> d!101942 (and (bvsle #b00000000000000000000000000000000 (_1!13265 lt!438956)) (bvsle (_1!13265 lt!438956) (_2!13265 lt!438956)))))

(assert (=> d!101942 (= (arrayRangesEqImpliesEq!272 a1!948 a2!948 (_1!13265 lt!438956) (_3!1567 lt!438950) (_2!13265 lt!438956)) lt!439002)))

(declare-fun bs!26265 () Bool)

(assert (= bs!26265 d!101942))

(assert (=> bs!26265 m!443851))

(assert (=> bs!26265 m!443853))

(declare-fun m!443953 () Bool)

(assert (=> bs!26265 m!443953))

(assert (=> b!305413 d!101942))

(declare-fun d!101944 () Bool)

(assert (=> d!101944 (= (byteRangesEq!0 (select (arr!9122 a1!948) (_3!1567 lt!438956)) (select (arr!9122 a2!948) (_3!1567 lt!438956)) lt!438954 #b00000000000000000000000000000111) (or (= lt!438954 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9122 a1!948) (_3!1567 lt!438956))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438954)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9122 a2!948) (_3!1567 lt!438956))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438954)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26266 () Bool)

(assert (= bs!26266 d!101944))

(declare-fun m!443955 () Bool)

(assert (=> bs!26266 m!443955))

(declare-fun m!443957 () Bool)

(assert (=> bs!26266 m!443957))

(assert (=> b!305404 d!101944))

(declare-fun d!101946 () Bool)

(assert (=> d!101946 (arrayRangesEq!1668 a1!948 a2!948 (_1!13265 lt!438950) (_2!13265 lt!438950))))

(declare-fun lt!439005 () Unit!21311)

(declare-fun choose!599 (array!18541 array!18541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21311)

(assert (=> d!101946 (= lt!439005 (choose!599 a1!948 a2!948 (_1!13265 lt!438956) (_2!13265 lt!438956) (_1!13265 lt!438950) (_2!13265 lt!438950)))))

(assert (=> d!101946 (and (bvsle #b00000000000000000000000000000000 (_1!13265 lt!438956)) (bvsle (_1!13265 lt!438956) (_2!13265 lt!438956)))))

(assert (=> d!101946 (= (arrayRangesEqSlicedLemma!263 a1!948 a2!948 (_1!13265 lt!438956) (_2!13265 lt!438956) (_1!13265 lt!438950) (_2!13265 lt!438950)) lt!439005)))

(declare-fun bs!26268 () Bool)

(assert (= bs!26268 d!101946))

(assert (=> bs!26268 m!443875))

(declare-fun m!443963 () Bool)

(assert (=> bs!26268 m!443963))

(assert (=> b!305410 d!101946))

(declare-fun d!101954 () Bool)

(declare-fun res!251097 () Bool)

(declare-fun e!220024 () Bool)

(assert (=> d!101954 (=> res!251097 e!220024)))

(assert (=> d!101954 (= res!251097 (= (_1!13265 lt!438950) (_2!13265 lt!438950)))))

(assert (=> d!101954 (= (arrayRangesEq!1668 a1!948 a2!948 (_1!13265 lt!438950) (_2!13265 lt!438950)) e!220024)))

(declare-fun b!305491 () Bool)

(declare-fun e!220025 () Bool)

(assert (=> b!305491 (= e!220024 e!220025)))

(declare-fun res!251098 () Bool)

(assert (=> b!305491 (=> (not res!251098) (not e!220025))))

(assert (=> b!305491 (= res!251098 (= (select (arr!9122 a1!948) (_1!13265 lt!438950)) (select (arr!9122 a2!948) (_1!13265 lt!438950))))))

(declare-fun b!305492 () Bool)

(assert (=> b!305492 (= e!220025 (arrayRangesEq!1668 a1!948 a2!948 (bvadd (_1!13265 lt!438950) #b00000000000000000000000000000001) (_2!13265 lt!438950)))))

(assert (= (and d!101954 (not res!251097)) b!305491))

(assert (= (and b!305491 res!251098) b!305492))

(declare-fun m!443965 () Bool)

(assert (=> b!305491 m!443965))

(declare-fun m!443967 () Bool)

(assert (=> b!305491 m!443967))

(declare-fun m!443969 () Bool)

(assert (=> b!305492 m!443969))

(assert (=> b!305410 d!101954))

(check-sat (not b!305492) (not b!305486) (not b!305490) (not d!101942) (not bm!5756) (not b!305485) (not b!305461) (not d!101946))
(check-sat)
