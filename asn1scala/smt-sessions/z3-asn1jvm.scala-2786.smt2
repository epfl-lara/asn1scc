; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67244 () Bool)

(assert start!67244)

(declare-fun b!302045 () Bool)

(declare-fun res!248578 () Bool)

(declare-fun e!216970 () Bool)

(assert (=> b!302045 (=> (not res!248578) (not e!216970))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18292 0))(
  ( (array!18293 (arr!9026 (Array (_ BitVec 32) (_ BitVec 8))) (size!7943 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18292)

(declare-fun a2!948 () array!18292)

(declare-fun arrayBitRangesEq!0 (array!18292 array!18292 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302045 (= res!248578 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-datatypes ((tuple4!1094 0))(
  ( (tuple4!1095 (_1!13202 (_ BitVec 32)) (_2!13202 (_ BitVec 32)) (_3!1504 (_ BitVec 32)) (_4!547 (_ BitVec 32))) )
))
(declare-fun lt!437089 () tuple4!1094)

(declare-fun lt!437087 () (_ BitVec 32))

(declare-fun lt!437091 () (_ BitVec 32))

(declare-fun c!14319 () Bool)

(declare-fun bm!5495 () Bool)

(declare-fun call!5498 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5495 (= call!5498 (byteRangesEq!0 (select (arr!9026 a1!948) (_3!1504 lt!437089)) (select (arr!9026 a2!948) (_3!1504 lt!437089)) lt!437091 (ite c!14319 lt!437087 #b00000000000000000000000000000111)))))

(declare-fun b!302046 () Bool)

(declare-fun e!216965 () Bool)

(assert (=> b!302046 (= e!216965 call!5498)))

(declare-fun b!302047 () Bool)

(declare-datatypes ((Unit!21150 0))(
  ( (Unit!21151) )
))
(declare-fun e!216963 () Unit!21150)

(declare-fun lt!437082 () Unit!21150)

(assert (=> b!302047 (= e!216963 lt!437082)))

(declare-fun lt!437084 () tuple4!1094)

(declare-fun arrayRangesEqImpliesEq!257 (array!18292 array!18292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21150)

(assert (=> b!302047 (= lt!437082 (arrayRangesEqImpliesEq!257 a1!948 a2!948 (_1!13202 lt!437089) (_3!1504 lt!437084) (_2!13202 lt!437089)))))

(assert (=> b!302047 (= (select (arr!9026 a1!948) (_3!1504 lt!437084)) (select (arr!9026 a2!948) (_3!1504 lt!437084)))))

(declare-fun b!302048 () Bool)

(declare-fun e!216967 () Unit!21150)

(declare-fun Unit!21152 () Unit!21150)

(assert (=> b!302048 (= e!216967 Unit!21152)))

(declare-fun b!302049 () Bool)

(declare-fun Unit!21153 () Unit!21150)

(assert (=> b!302049 (= e!216963 Unit!21153)))

(declare-fun b!302050 () Bool)

(declare-fun res!248577 () Bool)

(assert (=> b!302050 (= res!248577 (= lt!437087 #b00000000000000000000000000000000))))

(declare-fun e!216962 () Bool)

(assert (=> b!302050 (=> res!248577 e!216962)))

(declare-fun e!216964 () Bool)

(assert (=> b!302050 (= e!216964 e!216962)))

(declare-fun b!302051 () Bool)

(declare-fun e!216966 () Bool)

(assert (=> b!302051 (= e!216970 e!216966)))

(declare-fun res!248586 () Bool)

(assert (=> b!302051 (=> (not res!248586) (not e!216966))))

(assert (=> b!302051 (= res!248586 e!216965)))

(assert (=> b!302051 (= c!14319 (= (_3!1504 lt!437089) (_4!547 lt!437089)))))

(declare-fun lt!437085 () Unit!21150)

(assert (=> b!302051 (= lt!437085 e!216967)))

(declare-fun c!14318 () Bool)

(assert (=> b!302051 (= c!14318 (bvslt (_1!13202 lt!437084) (_2!13202 lt!437084)))))

(declare-fun lt!437083 () (_ BitVec 32))

(declare-fun toSlice!52 () (_ BitVec 64))

(assert (=> b!302051 (= lt!437083 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1094)

(assert (=> b!302051 (= lt!437084 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302051 (= lt!437087 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302051 (= lt!437091 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302051 (= lt!437089 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302052 () Bool)

(assert (=> b!302052 (= e!216965 e!216964)))

(declare-fun res!248585 () Bool)

(assert (=> b!302052 (= res!248585 call!5498)))

(assert (=> b!302052 (=> (not res!248585) (not e!216964))))

(declare-fun b!302053 () Bool)

(declare-fun e!216959 () Unit!21150)

(declare-fun lt!437080 () Unit!21150)

(assert (=> b!302053 (= e!216959 lt!437080)))

(assert (=> b!302053 (= lt!437080 (arrayRangesEqImpliesEq!257 a1!948 a2!948 (_1!13202 lt!437089) (_4!547 lt!437084) (_2!13202 lt!437089)))))

(assert (=> b!302053 (= (select (arr!9026 a1!948) (_4!547 lt!437084)) (select (arr!9026 a2!948) (_4!547 lt!437084)))))

(declare-fun b!302054 () Bool)

(assert (=> b!302054 (= e!216962 (byteRangesEq!0 (select (arr!9026 a1!948) (_4!547 lt!437089)) (select (arr!9026 a2!948) (_4!547 lt!437089)) #b00000000000000000000000000000000 lt!437087))))

(declare-fun b!302055 () Bool)

(declare-fun e!216968 () Bool)

(assert (=> b!302055 (= e!216968 e!216970)))

(declare-fun res!248582 () Bool)

(assert (=> b!302055 (=> (not res!248582) (not e!216970))))

(declare-fun lt!437090 () (_ BitVec 64))

(assert (=> b!302055 (= res!248582 (and (bvsle toBit!258 lt!437090) (bvsle fromBit!258 lt!437090)))))

(assert (=> b!302055 (= lt!437090 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7943 a1!948))))))

(declare-fun b!302056 () Bool)

(declare-fun res!248580 () Bool)

(declare-fun e!216969 () Bool)

(assert (=> b!302056 (=> (not res!248580) (not e!216969))))

(assert (=> b!302056 (= res!248580 (not (= lt!437083 #b00000000000000000000000000000000)))))

(declare-fun b!302057 () Bool)

(declare-fun Unit!21154 () Unit!21150)

(assert (=> b!302057 (= e!216959 Unit!21154)))

(declare-fun b!302058 () Bool)

(declare-fun res!248584 () Bool)

(assert (=> b!302058 (=> (not res!248584) (not e!216969))))

(assert (=> b!302058 (= res!248584 (byteRangesEq!0 (select (arr!9026 a1!948) (_3!1504 lt!437084)) (select (arr!9026 a2!948) (_3!1504 lt!437084)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun res!248579 () Bool)

(assert (=> start!67244 (=> (not res!248579) (not e!216968))))

(assert (=> start!67244 (= res!248579 (and (bvsle (size!7943 a1!948) (size!7943 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67244 e!216968))

(assert (=> start!67244 true))

(declare-fun array_inv!7555 (array!18292) Bool)

(assert (=> start!67244 (array_inv!7555 a1!948)))

(assert (=> start!67244 (array_inv!7555 a2!948)))

(declare-fun b!302059 () Bool)

(assert (=> b!302059 (= e!216966 e!216969)))

(declare-fun res!248583 () Bool)

(assert (=> b!302059 (=> (not res!248583) (not e!216969))))

(assert (=> b!302059 (= res!248583 (not (= (_3!1504 lt!437084) (_4!547 lt!437084))))))

(declare-fun lt!437081 () Unit!21150)

(assert (=> b!302059 (= lt!437081 e!216959)))

(declare-fun c!14317 () Bool)

(assert (=> b!302059 (= c!14317 (and (bvslt (_4!547 lt!437084) (_4!547 lt!437089)) (bvslt (_3!1504 lt!437089) (_4!547 lt!437084))))))

(declare-fun lt!437088 () Unit!21150)

(assert (=> b!302059 (= lt!437088 e!216963)))

(declare-fun c!14316 () Bool)

(assert (=> b!302059 (= c!14316 (and (bvslt (_3!1504 lt!437089) (_3!1504 lt!437084)) (bvslt (_3!1504 lt!437084) (_4!547 lt!437089))))))

(declare-fun b!302060 () Bool)

(declare-fun res!248581 () Bool)

(assert (=> b!302060 (=> (not res!248581) (not e!216970))))

(assert (=> b!302060 (= res!248581 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437090) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!302061 () Bool)

(assert (=> b!302061 (= e!216969 (not (byteRangesEq!0 (select (arr!9026 a1!948) (_4!547 lt!437084)) (select (arr!9026 a2!948) (_4!547 lt!437084)) #b00000000000000000000000000000000 lt!437083)))))

(declare-fun b!302062 () Bool)

(declare-fun lt!437086 () Unit!21150)

(assert (=> b!302062 (= e!216967 lt!437086)))

(declare-fun arrayRangesEqSlicedLemma!215 (array!18292 array!18292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21150)

(assert (=> b!302062 (= lt!437086 (arrayRangesEqSlicedLemma!215 a1!948 a2!948 (_1!13202 lt!437089) (_2!13202 lt!437089) (_1!13202 lt!437084) (_2!13202 lt!437084)))))

(declare-fun arrayRangesEq!1605 (array!18292 array!18292 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302062 (arrayRangesEq!1605 a1!948 a2!948 (_1!13202 lt!437084) (_2!13202 lt!437084))))

(assert (= (and start!67244 res!248579) b!302055))

(assert (= (and b!302055 res!248582) b!302045))

(assert (= (and b!302045 res!248578) b!302060))

(assert (= (and b!302060 res!248581) b!302051))

(assert (= (and b!302051 c!14318) b!302062))

(assert (= (and b!302051 (not c!14318)) b!302048))

(assert (= (and b!302051 c!14319) b!302046))

(assert (= (and b!302051 (not c!14319)) b!302052))

(assert (= (and b!302052 res!248585) b!302050))

(assert (= (and b!302050 (not res!248577)) b!302054))

(assert (= (or b!302046 b!302052) bm!5495))

(assert (= (and b!302051 res!248586) b!302059))

(assert (= (and b!302059 c!14316) b!302047))

(assert (= (and b!302059 (not c!14316)) b!302049))

(assert (= (and b!302059 c!14317) b!302053))

(assert (= (and b!302059 (not c!14317)) b!302057))

(assert (= (and b!302059 res!248583) b!302058))

(assert (= (and b!302058 res!248584) b!302056))

(assert (= (and b!302056 res!248580) b!302061))

(declare-fun m!440871 () Bool)

(assert (=> b!302058 m!440871))

(declare-fun m!440873 () Bool)

(assert (=> b!302058 m!440873))

(assert (=> b!302058 m!440871))

(assert (=> b!302058 m!440873))

(declare-fun m!440875 () Bool)

(assert (=> b!302058 m!440875))

(declare-fun m!440877 () Bool)

(assert (=> b!302061 m!440877))

(declare-fun m!440879 () Bool)

(assert (=> b!302061 m!440879))

(assert (=> b!302061 m!440877))

(assert (=> b!302061 m!440879))

(declare-fun m!440881 () Bool)

(assert (=> b!302061 m!440881))

(declare-fun m!440883 () Bool)

(assert (=> start!67244 m!440883))

(declare-fun m!440885 () Bool)

(assert (=> start!67244 m!440885))

(declare-fun m!440887 () Bool)

(assert (=> b!302054 m!440887))

(declare-fun m!440889 () Bool)

(assert (=> b!302054 m!440889))

(assert (=> b!302054 m!440887))

(assert (=> b!302054 m!440889))

(declare-fun m!440891 () Bool)

(assert (=> b!302054 m!440891))

(declare-fun m!440893 () Bool)

(assert (=> b!302045 m!440893))

(declare-fun m!440895 () Bool)

(assert (=> b!302062 m!440895))

(declare-fun m!440897 () Bool)

(assert (=> b!302062 m!440897))

(declare-fun m!440899 () Bool)

(assert (=> b!302053 m!440899))

(assert (=> b!302053 m!440877))

(assert (=> b!302053 m!440879))

(declare-fun m!440901 () Bool)

(assert (=> b!302051 m!440901))

(declare-fun m!440903 () Bool)

(assert (=> b!302051 m!440903))

(declare-fun m!440905 () Bool)

(assert (=> b!302047 m!440905))

(assert (=> b!302047 m!440871))

(assert (=> b!302047 m!440873))

(declare-fun m!440907 () Bool)

(assert (=> bm!5495 m!440907))

(declare-fun m!440909 () Bool)

(assert (=> bm!5495 m!440909))

(assert (=> bm!5495 m!440907))

(assert (=> bm!5495 m!440909))

(declare-fun m!440911 () Bool)

(assert (=> bm!5495 m!440911))

(check-sat (not b!302062) (not b!302058) (not b!302045) (not b!302047) (not b!302051) (not b!302053) (not start!67244) (not bm!5495) (not b!302061) (not b!302054))
(check-sat)
(get-model)

(declare-fun d!100960 () Bool)

(assert (=> d!100960 (and (bvsge (_3!1504 lt!437084) #b00000000000000000000000000000000) (bvslt (_3!1504 lt!437084) (size!7943 a1!948)) (bvslt (_3!1504 lt!437084) (size!7943 a2!948)) (= (select (arr!9026 a1!948) (_3!1504 lt!437084)) (select (arr!9026 a2!948) (_3!1504 lt!437084))))))

(declare-fun lt!437130 () Unit!21150)

(declare-fun choose!542 (array!18292 array!18292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21150)

(assert (=> d!100960 (= lt!437130 (choose!542 a1!948 a2!948 (_1!13202 lt!437089) (_3!1504 lt!437084) (_2!13202 lt!437089)))))

(assert (=> d!100960 (and (bvsle #b00000000000000000000000000000000 (_1!13202 lt!437089)) (bvsle (_1!13202 lt!437089) (_2!13202 lt!437089)))))

(assert (=> d!100960 (= (arrayRangesEqImpliesEq!257 a1!948 a2!948 (_1!13202 lt!437089) (_3!1504 lt!437084) (_2!13202 lt!437089)) lt!437130)))

(declare-fun bs!26043 () Bool)

(assert (= bs!26043 d!100960))

(assert (=> bs!26043 m!440871))

(assert (=> bs!26043 m!440873))

(declare-fun m!440955 () Bool)

(assert (=> bs!26043 m!440955))

(assert (=> b!302047 d!100960))

(declare-fun d!100962 () Bool)

(assert (=> d!100962 (and (bvsge (_4!547 lt!437084) #b00000000000000000000000000000000) (bvslt (_4!547 lt!437084) (size!7943 a1!948)) (bvslt (_4!547 lt!437084) (size!7943 a2!948)) (= (select (arr!9026 a1!948) (_4!547 lt!437084)) (select (arr!9026 a2!948) (_4!547 lt!437084))))))

(declare-fun lt!437131 () Unit!21150)

(assert (=> d!100962 (= lt!437131 (choose!542 a1!948 a2!948 (_1!13202 lt!437089) (_4!547 lt!437084) (_2!13202 lt!437089)))))

(assert (=> d!100962 (and (bvsle #b00000000000000000000000000000000 (_1!13202 lt!437089)) (bvsle (_1!13202 lt!437089) (_2!13202 lt!437089)))))

(assert (=> d!100962 (= (arrayRangesEqImpliesEq!257 a1!948 a2!948 (_1!13202 lt!437089) (_4!547 lt!437084) (_2!13202 lt!437089)) lt!437131)))

(declare-fun bs!26044 () Bool)

(assert (= bs!26044 d!100962))

(assert (=> bs!26044 m!440877))

(assert (=> bs!26044 m!440879))

(declare-fun m!440957 () Bool)

(assert (=> bs!26044 m!440957))

(assert (=> b!302053 d!100962))

(declare-fun d!100964 () Bool)

(assert (=> d!100964 (= (byteRangesEq!0 (select (arr!9026 a1!948) (_3!1504 lt!437084)) (select (arr!9026 a2!948) (_3!1504 lt!437084)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9026 a1!948) (_3!1504 lt!437084))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9026 a2!948) (_3!1504 lt!437084))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26045 () Bool)

(assert (= bs!26045 d!100964))

(declare-fun m!440959 () Bool)

(assert (=> bs!26045 m!440959))

(declare-fun m!440961 () Bool)

(assert (=> bs!26045 m!440961))

(assert (=> b!302058 d!100964))

(declare-fun d!100966 () Bool)

(assert (=> d!100966 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1095 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302051 d!100966))

(declare-fun d!100968 () Bool)

(assert (=> d!100968 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1095 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302051 d!100968))

(declare-fun d!100970 () Bool)

(assert (=> d!100970 (arrayRangesEq!1605 a1!948 a2!948 (_1!13202 lt!437084) (_2!13202 lt!437084))))

(declare-fun lt!437134 () Unit!21150)

(declare-fun choose!543 (array!18292 array!18292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21150)

(assert (=> d!100970 (= lt!437134 (choose!543 a1!948 a2!948 (_1!13202 lt!437089) (_2!13202 lt!437089) (_1!13202 lt!437084) (_2!13202 lt!437084)))))

(assert (=> d!100970 (and (bvsle #b00000000000000000000000000000000 (_1!13202 lt!437089)) (bvsle (_1!13202 lt!437089) (_2!13202 lt!437089)))))

(assert (=> d!100970 (= (arrayRangesEqSlicedLemma!215 a1!948 a2!948 (_1!13202 lt!437089) (_2!13202 lt!437089) (_1!13202 lt!437084) (_2!13202 lt!437084)) lt!437134)))

(declare-fun bs!26046 () Bool)

(assert (= bs!26046 d!100970))

(assert (=> bs!26046 m!440897))

(declare-fun m!440963 () Bool)

(assert (=> bs!26046 m!440963))

(assert (=> b!302062 d!100970))

(declare-fun d!100972 () Bool)

(declare-fun res!248621 () Bool)

(declare-fun e!217011 () Bool)

(assert (=> d!100972 (=> res!248621 e!217011)))

(assert (=> d!100972 (= res!248621 (= (_1!13202 lt!437084) (_2!13202 lt!437084)))))

(assert (=> d!100972 (= (arrayRangesEq!1605 a1!948 a2!948 (_1!13202 lt!437084) (_2!13202 lt!437084)) e!217011)))

(declare-fun b!302121 () Bool)

(declare-fun e!217012 () Bool)

(assert (=> b!302121 (= e!217011 e!217012)))

(declare-fun res!248622 () Bool)

(assert (=> b!302121 (=> (not res!248622) (not e!217012))))

(assert (=> b!302121 (= res!248622 (= (select (arr!9026 a1!948) (_1!13202 lt!437084)) (select (arr!9026 a2!948) (_1!13202 lt!437084))))))

(declare-fun b!302122 () Bool)

(assert (=> b!302122 (= e!217012 (arrayRangesEq!1605 a1!948 a2!948 (bvadd (_1!13202 lt!437084) #b00000000000000000000000000000001) (_2!13202 lt!437084)))))

(assert (= (and d!100972 (not res!248621)) b!302121))

(assert (= (and b!302121 res!248622) b!302122))

(declare-fun m!440965 () Bool)

(assert (=> b!302121 m!440965))

(declare-fun m!440967 () Bool)

(assert (=> b!302121 m!440967))

(declare-fun m!440969 () Bool)

(assert (=> b!302122 m!440969))

(assert (=> b!302062 d!100972))

(declare-fun d!100974 () Bool)

(declare-fun res!248634 () Bool)

(declare-fun e!217030 () Bool)

(assert (=> d!100974 (=> res!248634 e!217030)))

(assert (=> d!100974 (= res!248634 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100974 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217030)))

(declare-fun b!302137 () Bool)

(declare-fun e!217029 () Bool)

(declare-fun e!217027 () Bool)

(assert (=> b!302137 (= e!217029 e!217027)))

(declare-fun lt!437141 () (_ BitVec 32))

(declare-fun lt!437142 () tuple4!1094)

(declare-fun res!248636 () Bool)

(assert (=> b!302137 (= res!248636 (byteRangesEq!0 (select (arr!9026 a1!948) (_3!1504 lt!437142)) (select (arr!9026 a2!948) (_3!1504 lt!437142)) lt!437141 #b00000000000000000000000000001000))))

(assert (=> b!302137 (=> (not res!248636) (not e!217027))))

(declare-fun b!302138 () Bool)

(declare-fun e!217028 () Bool)

(assert (=> b!302138 (= e!217028 e!217029)))

(declare-fun c!14334 () Bool)

(assert (=> b!302138 (= c!14334 (= (_3!1504 lt!437142) (_4!547 lt!437142)))))

(declare-fun b!302139 () Bool)

(declare-fun e!217026 () Bool)

(assert (=> b!302139 (= e!217026 (arrayRangesEq!1605 a1!948 a2!948 (_1!13202 lt!437142) (_2!13202 lt!437142)))))

(declare-fun b!302140 () Bool)

(declare-fun call!5504 () Bool)

(assert (=> b!302140 (= e!217029 call!5504)))

(declare-fun b!302141 () Bool)

(declare-fun e!217025 () Bool)

(assert (=> b!302141 (= e!217025 call!5504)))

(declare-fun b!302142 () Bool)

(assert (=> b!302142 (= e!217030 e!217028)))

(declare-fun res!248637 () Bool)

(assert (=> b!302142 (=> (not res!248637) (not e!217028))))

(assert (=> b!302142 (= res!248637 e!217026)))

(declare-fun res!248635 () Bool)

(assert (=> b!302142 (=> res!248635 e!217026)))

(assert (=> b!302142 (= res!248635 (bvsge (_1!13202 lt!437142) (_2!13202 lt!437142)))))

(declare-fun lt!437143 () (_ BitVec 32))

(assert (=> b!302142 (= lt!437143 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302142 (= lt!437141 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302142 (= lt!437142 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302143 () Bool)

(declare-fun res!248633 () Bool)

(assert (=> b!302143 (= res!248633 (= lt!437143 #b00000000000000000000000000000000))))

(assert (=> b!302143 (=> res!248633 e!217025)))

(assert (=> b!302143 (= e!217027 e!217025)))

(declare-fun bm!5501 () Bool)

(assert (=> bm!5501 (= call!5504 (byteRangesEq!0 (ite c!14334 (select (arr!9026 a1!948) (_3!1504 lt!437142)) (select (arr!9026 a1!948) (_4!547 lt!437142))) (ite c!14334 (select (arr!9026 a2!948) (_3!1504 lt!437142)) (select (arr!9026 a2!948) (_4!547 lt!437142))) (ite c!14334 lt!437141 #b00000000000000000000000000000000) lt!437143))))

(assert (= (and d!100974 (not res!248634)) b!302142))

(assert (= (and b!302142 (not res!248635)) b!302139))

(assert (= (and b!302142 res!248637) b!302138))

(assert (= (and b!302138 c!14334) b!302140))

(assert (= (and b!302138 (not c!14334)) b!302137))

(assert (= (and b!302137 res!248636) b!302143))

(assert (= (and b!302143 (not res!248633)) b!302141))

(assert (= (or b!302140 b!302141) bm!5501))

(declare-fun m!440971 () Bool)

(assert (=> b!302137 m!440971))

(declare-fun m!440973 () Bool)

(assert (=> b!302137 m!440973))

(assert (=> b!302137 m!440971))

(assert (=> b!302137 m!440973))

(declare-fun m!440975 () Bool)

(assert (=> b!302137 m!440975))

(declare-fun m!440977 () Bool)

(assert (=> b!302139 m!440977))

(assert (=> b!302142 m!440903))

(assert (=> bm!5501 m!440971))

(assert (=> bm!5501 m!440973))

(declare-fun m!440979 () Bool)

(assert (=> bm!5501 m!440979))

(declare-fun m!440981 () Bool)

(assert (=> bm!5501 m!440981))

(declare-fun m!440983 () Bool)

(assert (=> bm!5501 m!440983))

(assert (=> b!302045 d!100974))

(declare-fun d!100976 () Bool)

(assert (=> d!100976 (= (byteRangesEq!0 (select (arr!9026 a1!948) (_3!1504 lt!437089)) (select (arr!9026 a2!948) (_3!1504 lt!437089)) lt!437091 (ite c!14319 lt!437087 #b00000000000000000000000000000111)) (or (= lt!437091 (ite c!14319 lt!437087 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9026 a1!948) (_3!1504 lt!437089))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14319 lt!437087 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!437091)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9026 a2!948) (_3!1504 lt!437089))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14319 lt!437087 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!437091)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26047 () Bool)

(assert (= bs!26047 d!100976))

(declare-fun m!440985 () Bool)

(assert (=> bs!26047 m!440985))

(declare-fun m!440987 () Bool)

(assert (=> bs!26047 m!440987))

(assert (=> bm!5495 d!100976))

(declare-fun d!100978 () Bool)

(assert (=> d!100978 (= (byteRangesEq!0 (select (arr!9026 a1!948) (_4!547 lt!437084)) (select (arr!9026 a2!948) (_4!547 lt!437084)) #b00000000000000000000000000000000 lt!437083) (or (= #b00000000000000000000000000000000 lt!437083) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9026 a1!948) (_4!547 lt!437084))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437083))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9026 a2!948) (_4!547 lt!437084))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437083))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26048 () Bool)

(assert (= bs!26048 d!100978))

(declare-fun m!440989 () Bool)

(assert (=> bs!26048 m!440989))

(declare-fun m!440991 () Bool)

(assert (=> bs!26048 m!440991))

(assert (=> b!302061 d!100978))

(declare-fun d!100980 () Bool)

(assert (=> d!100980 (= (array_inv!7555 a1!948) (bvsge (size!7943 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67244 d!100980))

(declare-fun d!100982 () Bool)

(assert (=> d!100982 (= (array_inv!7555 a2!948) (bvsge (size!7943 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67244 d!100982))

(declare-fun d!100984 () Bool)

(assert (=> d!100984 (= (byteRangesEq!0 (select (arr!9026 a1!948) (_4!547 lt!437089)) (select (arr!9026 a2!948) (_4!547 lt!437089)) #b00000000000000000000000000000000 lt!437087) (or (= #b00000000000000000000000000000000 lt!437087) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9026 a1!948) (_4!547 lt!437089))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437087))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9026 a2!948) (_4!547 lt!437089))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437087))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26049 () Bool)

(assert (= bs!26049 d!100984))

(declare-fun m!440993 () Bool)

(assert (=> bs!26049 m!440993))

(assert (=> bs!26049 m!440991))

(assert (=> b!302054 d!100984))

(check-sat (not b!302142) (not b!302139) (not d!100970) (not bm!5501) (not d!100960) (not d!100962) (not b!302137) (not b!302122))
(check-sat)
