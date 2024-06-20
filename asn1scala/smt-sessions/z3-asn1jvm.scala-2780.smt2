; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67086 () Bool)

(assert start!67086)

(declare-fun b!300956 () Bool)

(declare-datatypes ((Unit!21066 0))(
  ( (Unit!21067) )
))
(declare-fun e!216128 () Unit!21066)

(declare-fun Unit!21068 () Unit!21066)

(assert (=> b!300956 (= e!216128 Unit!21068)))

(declare-fun b!300957 () Bool)

(declare-fun e!216138 () Unit!21066)

(declare-fun lt!436381 () Unit!21066)

(assert (=> b!300957 (= e!216138 lt!436381)))

(declare-datatypes ((array!18247 0))(
  ( (array!18248 (arr!9008 (Array (_ BitVec 32) (_ BitVec 8))) (size!7925 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18247)

(declare-datatypes ((tuple4!1058 0))(
  ( (tuple4!1059 (_1!13184 (_ BitVec 32)) (_2!13184 (_ BitVec 32)) (_3!1486 (_ BitVec 32)) (_4!529 (_ BitVec 32))) )
))
(declare-fun lt!436379 () tuple4!1058)

(declare-fun lt!436373 () tuple4!1058)

(declare-fun a1!948 () array!18247)

(declare-fun arrayRangesEqImpliesEq!242 (array!18247 array!18247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21066)

(assert (=> b!300957 (= lt!436381 (arrayRangesEqImpliesEq!242 a1!948 a2!948 (_1!13184 lt!436373) (_3!1486 lt!436379) (_2!13184 lt!436373)))))

(assert (=> b!300957 (= (select (arr!9008 a1!948) (_3!1486 lt!436379)) (select (arr!9008 a2!948) (_3!1486 lt!436379)))))

(declare-fun b!300958 () Bool)

(declare-fun res!247939 () Bool)

(declare-fun e!216132 () Bool)

(assert (=> b!300958 (=> (not res!247939) (not e!216132))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436383 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300958 (= res!247939 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436383) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300959 () Bool)

(declare-fun e!216135 () Bool)

(assert (=> b!300959 (= e!216135 e!216132)))

(declare-fun res!247945 () Bool)

(assert (=> b!300959 (=> (not res!247945) (not e!216132))))

(assert (=> b!300959 (= res!247945 (and (bvsle toBit!258 lt!436383) (bvsle fromBit!258 lt!436383)))))

(assert (=> b!300959 (= lt!436383 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7925 a1!948))))))

(declare-fun b!300960 () Bool)

(declare-fun lt!436375 () Unit!21066)

(assert (=> b!300960 (= e!216128 lt!436375)))

(assert (=> b!300960 (= lt!436375 (arrayRangesEqImpliesEq!242 a1!948 a2!948 (_1!13184 lt!436373) (_4!529 lt!436379) (_2!13184 lt!436373)))))

(assert (=> b!300960 (= (select (arr!9008 a1!948) (_4!529 lt!436379)) (select (arr!9008 a2!948) (_4!529 lt!436379)))))

(declare-fun b!300961 () Bool)

(declare-fun e!216137 () Bool)

(declare-fun e!216131 () Bool)

(assert (=> b!300961 (= e!216137 e!216131)))

(declare-fun res!247940 () Bool)

(assert (=> b!300961 (=> (not res!247940) (not e!216131))))

(assert (=> b!300961 (= res!247940 (not (= (_3!1486 lt!436379) (_4!529 lt!436379))))))

(declare-fun lt!436382 () Unit!21066)

(assert (=> b!300961 (= lt!436382 e!216128)))

(declare-fun c!14094 () Bool)

(assert (=> b!300961 (= c!14094 (and (bvslt (_4!529 lt!436379) (_4!529 lt!436373)) (bvslt (_3!1486 lt!436373) (_4!529 lt!436379))))))

(declare-fun lt!436376 () Unit!21066)

(assert (=> b!300961 (= lt!436376 e!216138)))

(declare-fun c!14091 () Bool)

(assert (=> b!300961 (= c!14091 (and (bvslt (_3!1486 lt!436373) (_3!1486 lt!436379)) (bvslt (_3!1486 lt!436379) (_4!529 lt!436373))))))

(declare-fun b!300962 () Bool)

(declare-fun res!247938 () Bool)

(declare-fun lt!436380 () (_ BitVec 32))

(assert (=> b!300962 (= res!247938 (= lt!436380 #b00000000000000000000000000000000))))

(declare-fun e!216136 () Bool)

(assert (=> b!300962 (=> res!247938 e!216136)))

(declare-fun e!216133 () Bool)

(assert (=> b!300962 (= e!216133 e!216136)))

(declare-fun b!300963 () Bool)

(declare-fun res!247944 () Bool)

(assert (=> b!300963 (=> (not res!247944) (not e!216131))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300963 (= res!247944 (byteRangesEq!0 (select (arr!9008 a1!948) (_3!1486 lt!436379)) (select (arr!9008 a2!948) (_3!1486 lt!436379)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!300964 () Bool)

(declare-fun e!216130 () Bool)

(assert (=> b!300964 (= e!216130 e!216133)))

(declare-fun res!247946 () Bool)

(declare-fun call!5417 () Bool)

(assert (=> b!300964 (= res!247946 call!5417)))

(assert (=> b!300964 (=> (not res!247946) (not e!216133))))

(declare-fun res!247943 () Bool)

(assert (=> start!67086 (=> (not res!247943) (not e!216135))))

(assert (=> start!67086 (= res!247943 (and (bvsle (size!7925 a1!948) (size!7925 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67086 e!216135))

(assert (=> start!67086 true))

(declare-fun array_inv!7537 (array!18247) Bool)

(assert (=> start!67086 (array_inv!7537 a1!948)))

(assert (=> start!67086 (array_inv!7537 a2!948)))

(declare-fun b!300965 () Bool)

(declare-fun res!247942 () Bool)

(assert (=> b!300965 (=> (not res!247942) (not e!216132))))

(declare-fun arrayBitRangesEq!0 (array!18247 array!18247 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300965 (= res!247942 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300966 () Bool)

(declare-fun e!216127 () Unit!21066)

(declare-fun Unit!21069 () Unit!21066)

(assert (=> b!300966 (= e!216127 Unit!21069)))

(declare-fun b!300967 () Bool)

(assert (=> b!300967 (= e!216130 call!5417)))

(declare-fun lt!436378 () (_ BitVec 32))

(declare-fun c!14092 () Bool)

(declare-fun bm!5414 () Bool)

(assert (=> bm!5414 (= call!5417 (byteRangesEq!0 (select (arr!9008 a1!948) (_3!1486 lt!436373)) (select (arr!9008 a2!948) (_3!1486 lt!436373)) lt!436378 (ite c!14092 lt!436380 #b00000000000000000000000000000111)))))

(declare-fun b!300968 () Bool)

(declare-fun Unit!21070 () Unit!21066)

(assert (=> b!300968 (= e!216138 Unit!21070)))

(declare-fun b!300969 () Bool)

(assert (=> b!300969 (= e!216136 (byteRangesEq!0 (select (arr!9008 a1!948) (_4!529 lt!436373)) (select (arr!9008 a2!948) (_4!529 lt!436373)) #b00000000000000000000000000000000 lt!436380))))

(declare-fun b!300970 () Bool)

(assert (=> b!300970 (= e!216132 e!216137)))

(declare-fun res!247941 () Bool)

(assert (=> b!300970 (=> (not res!247941) (not e!216137))))

(assert (=> b!300970 (= res!247941 e!216130)))

(assert (=> b!300970 (= c!14092 (= (_3!1486 lt!436373) (_4!529 lt!436373)))))

(declare-fun lt!436372 () Unit!21066)

(assert (=> b!300970 (= lt!436372 e!216127)))

(declare-fun c!14093 () Bool)

(assert (=> b!300970 (= c!14093 (bvslt (_1!13184 lt!436379) (_2!13184 lt!436379)))))

(declare-fun lt!436374 () (_ BitVec 32))

(assert (=> b!300970 (= lt!436374 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1058)

(assert (=> b!300970 (= lt!436379 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300970 (= lt!436380 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300970 (= lt!436378 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300970 (= lt!436373 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300971 () Bool)

(declare-fun lt!436377 () Unit!21066)

(assert (=> b!300971 (= e!216127 lt!436377)))

(declare-fun arrayRangesEqSlicedLemma!197 (array!18247 array!18247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21066)

(assert (=> b!300971 (= lt!436377 (arrayRangesEqSlicedLemma!197 a1!948 a2!948 (_1!13184 lt!436373) (_2!13184 lt!436373) (_1!13184 lt!436379) (_2!13184 lt!436379)))))

(declare-fun arrayRangesEq!1587 (array!18247 array!18247 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300971 (arrayRangesEq!1587 a1!948 a2!948 (_1!13184 lt!436379) (_2!13184 lt!436379))))

(declare-fun b!300972 () Bool)

(assert (=> b!300972 (= e!216131 (and (not (= lt!436374 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 lt!436374) (bvsgt lt!436374 #b00000000000000000000000000001000))))))

(assert (= (and start!67086 res!247943) b!300959))

(assert (= (and b!300959 res!247945) b!300965))

(assert (= (and b!300965 res!247942) b!300958))

(assert (= (and b!300958 res!247939) b!300970))

(assert (= (and b!300970 c!14093) b!300971))

(assert (= (and b!300970 (not c!14093)) b!300966))

(assert (= (and b!300970 c!14092) b!300967))

(assert (= (and b!300970 (not c!14092)) b!300964))

(assert (= (and b!300964 res!247946) b!300962))

(assert (= (and b!300962 (not res!247938)) b!300969))

(assert (= (or b!300967 b!300964) bm!5414))

(assert (= (and b!300970 res!247941) b!300961))

(assert (= (and b!300961 c!14091) b!300957))

(assert (= (and b!300961 (not c!14091)) b!300968))

(assert (= (and b!300961 c!14094) b!300960))

(assert (= (and b!300961 (not c!14094)) b!300956))

(assert (= (and b!300961 res!247940) b!300963))

(assert (= (and b!300963 res!247944) b!300972))

(declare-fun m!439859 () Bool)

(assert (=> bm!5414 m!439859))

(declare-fun m!439861 () Bool)

(assert (=> bm!5414 m!439861))

(assert (=> bm!5414 m!439859))

(assert (=> bm!5414 m!439861))

(declare-fun m!439863 () Bool)

(assert (=> bm!5414 m!439863))

(declare-fun m!439865 () Bool)

(assert (=> b!300957 m!439865))

(declare-fun m!439867 () Bool)

(assert (=> b!300957 m!439867))

(declare-fun m!439869 () Bool)

(assert (=> b!300957 m!439869))

(declare-fun m!439871 () Bool)

(assert (=> b!300970 m!439871))

(declare-fun m!439873 () Bool)

(assert (=> b!300970 m!439873))

(assert (=> b!300963 m!439867))

(assert (=> b!300963 m!439869))

(assert (=> b!300963 m!439867))

(assert (=> b!300963 m!439869))

(declare-fun m!439875 () Bool)

(assert (=> b!300963 m!439875))

(declare-fun m!439877 () Bool)

(assert (=> b!300960 m!439877))

(declare-fun m!439879 () Bool)

(assert (=> b!300960 m!439879))

(declare-fun m!439881 () Bool)

(assert (=> b!300960 m!439881))

(declare-fun m!439883 () Bool)

(assert (=> b!300965 m!439883))

(declare-fun m!439885 () Bool)

(assert (=> b!300969 m!439885))

(declare-fun m!439887 () Bool)

(assert (=> b!300969 m!439887))

(assert (=> b!300969 m!439885))

(assert (=> b!300969 m!439887))

(declare-fun m!439889 () Bool)

(assert (=> b!300969 m!439889))

(declare-fun m!439891 () Bool)

(assert (=> start!67086 m!439891))

(declare-fun m!439893 () Bool)

(assert (=> start!67086 m!439893))

(declare-fun m!439895 () Bool)

(assert (=> b!300971 m!439895))

(declare-fun m!439897 () Bool)

(assert (=> b!300971 m!439897))

(check-sat (not b!300971) (not bm!5414) (not b!300969) (not b!300963) (not start!67086) (not b!300965) (not b!300957) (not b!300960) (not b!300970))
(check-sat)
