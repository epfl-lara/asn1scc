; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68080 () Bool)

(assert start!68080)

(declare-fun b!305663 () Bool)

(declare-datatypes ((Unit!21329 0))(
  ( (Unit!21330) )
))
(declare-fun e!220168 () Unit!21329)

(declare-fun Unit!21331 () Unit!21329)

(assert (=> b!305663 (= e!220168 Unit!21331)))

(declare-fun b!305664 () Bool)

(declare-fun e!220165 () Bool)

(declare-fun e!220161 () Bool)

(assert (=> b!305664 (= e!220165 e!220161)))

(declare-fun res!251198 () Bool)

(assert (=> b!305664 (=> (not res!251198) (not e!220161))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!439120 () (_ BitVec 64))

(assert (=> b!305664 (= res!251198 (and (bvsle toBit!258 lt!439120) (bvsle fromBit!258 lt!439120)))))

(declare-datatypes ((array!18552 0))(
  ( (array!18553 (arr!9126 (Array (_ BitVec 32) (_ BitVec 8))) (size!8043 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18552)

(assert (=> b!305664 (= lt!439120 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8043 a1!948))))))

(declare-fun b!305665 () Bool)

(declare-fun e!220166 () Unit!21329)

(declare-fun Unit!21332 () Unit!21329)

(assert (=> b!305665 (= e!220166 Unit!21332)))

(declare-datatypes ((tuple4!1228 0))(
  ( (tuple4!1229 (_1!13269 (_ BitVec 32)) (_2!13269 (_ BitVec 32)) (_3!1571 (_ BitVec 32)) (_4!614 (_ BitVec 32))) )
))
(declare-fun lt!439121 () tuple4!1228)

(declare-fun e!220158 () Bool)

(declare-fun lt!439127 () (_ BitVec 32))

(declare-fun b!305666 () Bool)

(declare-fun a2!948 () array!18552)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305666 (= e!220158 (byteRangesEq!0 (select (arr!9126 a1!948) (_4!614 lt!439121)) (select (arr!9126 a2!948) (_4!614 lt!439121)) #b00000000000000000000000000000000 lt!439127))))

(declare-fun b!305667 () Bool)

(declare-fun lt!439118 () Unit!21329)

(assert (=> b!305667 (= e!220166 lt!439118)))

(declare-fun lt!439119 () tuple4!1228)

(declare-fun arrayRangesEqImpliesEq!276 (array!18552 array!18552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21329)

(assert (=> b!305667 (= lt!439118 (arrayRangesEqImpliesEq!276 a1!948 a2!948 (_1!13269 lt!439121) (_3!1571 lt!439119) (_2!13269 lt!439121)))))

(assert (=> b!305667 (= (select (arr!9126 a1!948) (_3!1571 lt!439119)) (select (arr!9126 a2!948) (_3!1571 lt!439119)))))

(declare-fun b!305668 () Bool)

(declare-fun e!220160 () Bool)

(declare-fun call!5774 () Bool)

(assert (=> b!305668 (= e!220160 call!5774)))

(declare-fun b!305669 () Bool)

(declare-fun res!251195 () Bool)

(assert (=> b!305669 (=> (not res!251195) (not e!220161))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!305669 (= res!251195 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439120) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!305670 () Bool)

(declare-fun e!220164 () Bool)

(assert (=> b!305670 (= e!220161 e!220164)))

(declare-fun res!251197 () Bool)

(assert (=> b!305670 (=> (not res!251197) (not e!220164))))

(assert (=> b!305670 (= res!251197 e!220160)))

(declare-fun c!14820 () Bool)

(assert (=> b!305670 (= c!14820 (= (_3!1571 lt!439121) (_4!614 lt!439121)))))

(declare-fun lt!439124 () Unit!21329)

(declare-fun e!220159 () Unit!21329)

(assert (=> b!305670 (= lt!439124 e!220159)))

(declare-fun c!14818 () Bool)

(assert (=> b!305670 (= c!14818 (bvslt (_1!13269 lt!439119) (_2!13269 lt!439119)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1228)

(assert (=> b!305670 (= lt!439119 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!305670 (= lt!439127 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439125 () (_ BitVec 32))

(assert (=> b!305670 (= lt!439125 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305670 (= lt!439121 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305671 () Bool)

(declare-fun e!220163 () Bool)

(assert (=> b!305671 (= e!220160 e!220163)))

(declare-fun res!251194 () Bool)

(assert (=> b!305671 (= res!251194 call!5774)))

(assert (=> b!305671 (=> (not res!251194) (not e!220163))))

(declare-fun bm!5771 () Bool)

(assert (=> bm!5771 (= call!5774 (byteRangesEq!0 (select (arr!9126 a1!948) (_3!1571 lt!439121)) (select (arr!9126 a2!948) (_3!1571 lt!439121)) lt!439125 (ite c!14820 lt!439127 #b00000000000000000000000000000111)))))

(declare-fun b!305672 () Bool)

(assert (=> b!305672 (= e!220164 (and (= (_3!1571 lt!439119) (_4!614 lt!439119)) (or (bvslt (_3!1571 lt!439119) #b00000000000000000000000000000000) (bvsge (_3!1571 lt!439119) (size!8043 a1!948)))))))

(declare-fun lt!439123 () Unit!21329)

(assert (=> b!305672 (= lt!439123 e!220168)))

(declare-fun c!14819 () Bool)

(assert (=> b!305672 (= c!14819 (and (bvslt (_4!614 lt!439119) (_4!614 lt!439121)) (bvslt (_3!1571 lt!439121) (_4!614 lt!439119))))))

(declare-fun lt!439128 () Unit!21329)

(assert (=> b!305672 (= lt!439128 e!220166)))

(declare-fun c!14817 () Bool)

(assert (=> b!305672 (= c!14817 (and (bvslt (_3!1571 lt!439121) (_3!1571 lt!439119)) (bvslt (_3!1571 lt!439119) (_4!614 lt!439121))))))

(declare-fun b!305673 () Bool)

(declare-fun Unit!21333 () Unit!21329)

(assert (=> b!305673 (= e!220159 Unit!21333)))

(declare-fun res!251199 () Bool)

(assert (=> start!68080 (=> (not res!251199) (not e!220165))))

(assert (=> start!68080 (= res!251199 (and (bvsle (size!8043 a1!948) (size!8043 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68080 e!220165))

(assert (=> start!68080 true))

(declare-fun array_inv!7655 (array!18552) Bool)

(assert (=> start!68080 (array_inv!7655 a1!948)))

(assert (=> start!68080 (array_inv!7655 a2!948)))

(declare-fun b!305674 () Bool)

(declare-fun res!251196 () Bool)

(assert (=> b!305674 (= res!251196 (= lt!439127 #b00000000000000000000000000000000))))

(assert (=> b!305674 (=> res!251196 e!220158)))

(assert (=> b!305674 (= e!220163 e!220158)))

(declare-fun b!305675 () Bool)

(declare-fun lt!439126 () Unit!21329)

(assert (=> b!305675 (= e!220168 lt!439126)))

(assert (=> b!305675 (= lt!439126 (arrayRangesEqImpliesEq!276 a1!948 a2!948 (_1!13269 lt!439121) (_4!614 lt!439119) (_2!13269 lt!439121)))))

(assert (=> b!305675 (= (select (arr!9126 a1!948) (_4!614 lt!439119)) (select (arr!9126 a2!948) (_4!614 lt!439119)))))

(declare-fun b!305676 () Bool)

(declare-fun lt!439122 () Unit!21329)

(assert (=> b!305676 (= e!220159 lt!439122)))

(declare-fun arrayRangesEqSlicedLemma!267 (array!18552 array!18552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21329)

(assert (=> b!305676 (= lt!439122 (arrayRangesEqSlicedLemma!267 a1!948 a2!948 (_1!13269 lt!439121) (_2!13269 lt!439121) (_1!13269 lt!439119) (_2!13269 lt!439119)))))

(declare-fun arrayRangesEq!1672 (array!18552 array!18552 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305676 (arrayRangesEq!1672 a1!948 a2!948 (_1!13269 lt!439119) (_2!13269 lt!439119))))

(declare-fun b!305677 () Bool)

(declare-fun res!251193 () Bool)

(assert (=> b!305677 (=> (not res!251193) (not e!220161))))

(declare-fun arrayBitRangesEq!0 (array!18552 array!18552 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305677 (= res!251193 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!68080 res!251199) b!305664))

(assert (= (and b!305664 res!251198) b!305677))

(assert (= (and b!305677 res!251193) b!305669))

(assert (= (and b!305669 res!251195) b!305670))

(assert (= (and b!305670 c!14818) b!305676))

(assert (= (and b!305670 (not c!14818)) b!305673))

(assert (= (and b!305670 c!14820) b!305668))

(assert (= (and b!305670 (not c!14820)) b!305671))

(assert (= (and b!305671 res!251194) b!305674))

(assert (= (and b!305674 (not res!251196)) b!305666))

(assert (= (or b!305668 b!305671) bm!5771))

(assert (= (and b!305670 res!251197) b!305672))

(assert (= (and b!305672 c!14817) b!305667))

(assert (= (and b!305672 (not c!14817)) b!305665))

(assert (= (and b!305672 c!14819) b!305675))

(assert (= (and b!305672 (not c!14819)) b!305663))

(declare-fun m!444103 () Bool)

(assert (=> start!68080 m!444103))

(declare-fun m!444105 () Bool)

(assert (=> start!68080 m!444105))

(declare-fun m!444107 () Bool)

(assert (=> bm!5771 m!444107))

(declare-fun m!444109 () Bool)

(assert (=> bm!5771 m!444109))

(assert (=> bm!5771 m!444107))

(assert (=> bm!5771 m!444109))

(declare-fun m!444111 () Bool)

(assert (=> bm!5771 m!444111))

(declare-fun m!444113 () Bool)

(assert (=> b!305676 m!444113))

(declare-fun m!444115 () Bool)

(assert (=> b!305676 m!444115))

(declare-fun m!444117 () Bool)

(assert (=> b!305670 m!444117))

(declare-fun m!444119 () Bool)

(assert (=> b!305670 m!444119))

(declare-fun m!444121 () Bool)

(assert (=> b!305667 m!444121))

(declare-fun m!444123 () Bool)

(assert (=> b!305667 m!444123))

(declare-fun m!444125 () Bool)

(assert (=> b!305667 m!444125))

(declare-fun m!444127 () Bool)

(assert (=> b!305677 m!444127))

(declare-fun m!444129 () Bool)

(assert (=> b!305666 m!444129))

(declare-fun m!444131 () Bool)

(assert (=> b!305666 m!444131))

(assert (=> b!305666 m!444129))

(assert (=> b!305666 m!444131))

(declare-fun m!444133 () Bool)

(assert (=> b!305666 m!444133))

(declare-fun m!444135 () Bool)

(assert (=> b!305675 m!444135))

(declare-fun m!444137 () Bool)

(assert (=> b!305675 m!444137))

(declare-fun m!444139 () Bool)

(assert (=> b!305675 m!444139))

(push 1)

(assert (not b!305677))

(assert (not b!305670))

(assert (not b!305675))

(assert (not start!68080))

(assert (not b!305667))

(assert (not bm!5771))

(assert (not b!305666))

(assert (not b!305676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102024 () Bool)

(assert (=> d!102024 (= (byteRangesEq!0 (select (arr!9126 a1!948) (_3!1571 lt!439121)) (select (arr!9126 a2!948) (_3!1571 lt!439121)) lt!439125 (ite c!14820 lt!439127 #b00000000000000000000000000000111)) (or (= lt!439125 (ite c!14820 lt!439127 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9126 a1!948) (_3!1571 lt!439121))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14820 lt!439127 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439125)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9126 a2!948) (_3!1571 lt!439121))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14820 lt!439127 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439125)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26285 () Bool)

(assert (= bs!26285 d!102024))

(declare-fun m!444197 () Bool)

(assert (=> bs!26285 m!444197))

(declare-fun m!444199 () Bool)

(assert (=> bs!26285 m!444199))

(assert (=> bm!5771 d!102024))

(declare-fun d!102028 () Bool)

(assert (=> d!102028 (= (array_inv!7655 a1!948) (bvsge (size!8043 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68080 d!102028))

(declare-fun d!102030 () Bool)

(assert (=> d!102030 (= (array_inv!7655 a2!948) (bvsge (size!8043 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68080 d!102030))

(declare-fun d!102032 () Bool)

(assert (=> d!102032 (and (bvsge (_3!1571 lt!439119) #b00000000000000000000000000000000) (bvslt (_3!1571 lt!439119) (size!8043 a1!948)) (bvslt (_3!1571 lt!439119) (size!8043 a2!948)) (= (select (arr!9126 a1!948) (_3!1571 lt!439119)) (select (arr!9126 a2!948) (_3!1571 lt!439119))))))

(declare-fun lt!439163 () Unit!21329)

(declare-fun choose!606 (array!18552 array!18552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21329)

(assert (=> d!102032 (= lt!439163 (choose!606 a1!948 a2!948 (_1!13269 lt!439121) (_3!1571 lt!439119) (_2!13269 lt!439121)))))

(assert (=> d!102032 (and (bvsle #b00000000000000000000000000000000 (_1!13269 lt!439121)) (bvsle (_1!13269 lt!439121) (_2!13269 lt!439121)))))

(assert (=> d!102032 (= (arrayRangesEqImpliesEq!276 a1!948 a2!948 (_1!13269 lt!439121) (_3!1571 lt!439119) (_2!13269 lt!439121)) lt!439163)))

(declare-fun bs!26287 () Bool)

(assert (= bs!26287 d!102032))

(assert (=> bs!26287 m!444123))

(assert (=> bs!26287 m!444125))

(declare-fun m!444209 () Bool)

(assert (=> bs!26287 m!444209))

(assert (=> b!305667 d!102032))

(declare-fun d!102038 () Bool)

(assert (=> d!102038 (= (byteRangesEq!0 (select (arr!9126 a1!948) (_4!614 lt!439121)) (select (arr!9126 a2!948) (_4!614 lt!439121)) #b00000000000000000000000000000000 lt!439127) (or (= #b00000000000000000000000000000000 lt!439127) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9126 a1!948) (_4!614 lt!439121))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439127))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9126 a2!948) (_4!614 lt!439121))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439127))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26289 () Bool)

(assert (= bs!26289 d!102038))

(declare-fun m!444215 () Bool)

(assert (=> bs!26289 m!444215))

(declare-fun m!444217 () Bool)

(assert (=> bs!26289 m!444217))

(assert (=> b!305666 d!102038))

(declare-fun d!102040 () Bool)

(assert (=> d!102040 (arrayRangesEq!1672 a1!948 a2!948 (_1!13269 lt!439119) (_2!13269 lt!439119))))

(declare-fun lt!439166 () Unit!21329)

(declare-fun choose!607 (array!18552 array!18552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21329)

(assert (=> d!102040 (= lt!439166 (choose!607 a1!948 a2!948 (_1!13269 lt!439121) (_2!13269 lt!439121) (_1!13269 lt!439119) (_2!13269 lt!439119)))))

(assert (=> d!102040 (and (bvsle #b00000000000000000000000000000000 (_1!13269 lt!439121)) (bvsle (_1!13269 lt!439121) (_2!13269 lt!439121)))))

(assert (=> d!102040 (= (arrayRangesEqSlicedLemma!267 a1!948 a2!948 (_1!13269 lt!439121) (_2!13269 lt!439121) (_1!13269 lt!439119) (_2!13269 lt!439119)) lt!439166)))

(declare-fun bs!26290 () Bool)

(assert (= bs!26290 d!102040))

(assert (=> bs!26290 m!444115))

(declare-fun m!444219 () Bool)

(assert (=> bs!26290 m!444219))

(assert (=> b!305676 d!102040))

(declare-fun d!102042 () Bool)

(declare-fun res!251246 () Bool)

(declare-fun e!220221 () Bool)

(assert (=> d!102042 (=> res!251246 e!220221)))

(assert (=> d!102042 (= res!251246 (= (_1!13269 lt!439119) (_2!13269 lt!439119)))))

(assert (=> d!102042 (= (arrayRangesEq!1672 a1!948 a2!948 (_1!13269 lt!439119) (_2!13269 lt!439119)) e!220221)))

(declare-fun b!305736 () Bool)

(declare-fun e!220222 () Bool)

(assert (=> b!305736 (= e!220221 e!220222)))

(declare-fun res!251247 () Bool)

(assert (=> b!305736 (=> (not res!251247) (not e!220222))))

(assert (=> b!305736 (= res!251247 (= (select (arr!9126 a1!948) (_1!13269 lt!439119)) (select (arr!9126 a2!948) (_1!13269 lt!439119))))))

(declare-fun b!305737 () Bool)

(assert (=> b!305737 (= e!220222 (arrayRangesEq!1672 a1!948 a2!948 (bvadd (_1!13269 lt!439119) #b00000000000000000000000000000001) (_2!13269 lt!439119)))))

(assert (= (and d!102042 (not res!251246)) b!305736))

(assert (= (and b!305736 res!251247) b!305737))

(declare-fun m!444221 () Bool)

(assert (=> b!305736 m!444221))

(declare-fun m!444223 () Bool)

(assert (=> b!305736 m!444223))

(declare-fun m!444225 () Bool)

(assert (=> b!305737 m!444225))

(assert (=> b!305676 d!102042))

(declare-fun d!102044 () Bool)

(assert (=> d!102044 (and (bvsge (_4!614 lt!439119) #b00000000000000000000000000000000) (bvslt (_4!614 lt!439119) (size!8043 a1!948)) (bvslt (_4!614 lt!439119) (size!8043 a2!948)) (= (select (arr!9126 a1!948) (_4!614 lt!439119)) (select (arr!9126 a2!948) (_4!614 lt!439119))))))

(declare-fun lt!439167 () Unit!21329)

(assert (=> d!102044 (= lt!439167 (choose!606 a1!948 a2!948 (_1!13269 lt!439121) (_4!614 lt!439119) (_2!13269 lt!439121)))))

(assert (=> d!102044 (and (bvsle #b00000000000000000000000000000000 (_1!13269 lt!439121)) (bvsle (_1!13269 lt!439121) (_2!13269 lt!439121)))))

(assert (=> d!102044 (= (arrayRangesEqImpliesEq!276 a1!948 a2!948 (_1!13269 lt!439121) (_4!614 lt!439119) (_2!13269 lt!439121)) lt!439167)))

(declare-fun bs!26291 () Bool)

(assert (= bs!26291 d!102044))

(assert (=> bs!26291 m!444137))

(assert (=> bs!26291 m!444139))

(declare-fun m!444227 () Bool)

(assert (=> bs!26291 m!444227))

(assert (=> b!305675 d!102044))

(declare-fun d!102046 () Bool)

(assert (=> d!102046 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1229 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305670 d!102046))

(declare-fun d!102048 () Bool)

(assert (=> d!102048 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1229 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305670 d!102048))

(declare-fun b!305752 () Bool)

(declare-fun e!220237 () Bool)

(declare-fun call!5783 () Bool)

(assert (=> b!305752 (= e!220237 call!5783)))

(declare-fun b!305753 () Bool)

(declare-fun lt!439175 () tuple4!1228)

(declare-fun e!220239 () Bool)

(assert (=> b!305753 (= e!220239 (arrayRangesEq!1672 a1!948 a2!948 (_1!13269 lt!439175) (_2!13269 lt!439175)))))

(declare-fun b!305754 () Bool)

(declare-fun e!220235 () Bool)

(assert (=> b!305754 (= e!220237 e!220235)))

(declare-fun res!251260 () Bool)

(assert (=> b!305754 (= res!251260 call!5783)))

(assert (=> b!305754 (=> (not res!251260) (not e!220235))))

(declare-fun lt!439176 () (_ BitVec 32))

(declare-fun bm!5780 () Bool)

(declare-fun c!14829 () Bool)

(declare-fun lt!439174 () (_ BitVec 32))

(assert (=> bm!5780 (= call!5783 (byteRangesEq!0 (select (arr!9126 a1!948) (_3!1571 lt!439175)) (select (arr!9126 a2!948) (_3!1571 lt!439175)) lt!439176 (ite c!14829 lt!439174 #b00000000000000000000000000001000)))))

(declare-fun d!102050 () Bool)

(declare-fun res!251262 () Bool)

(declare-fun e!220240 () Bool)

(assert (=> d!102050 (=> res!251262 e!220240)))

(assert (=> d!102050 (= res!251262 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102050 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220240)))

(declare-fun b!305755 () Bool)

(declare-fun e!220238 () Bool)

(assert (=> b!305755 (= e!220238 (byteRangesEq!0 (select (arr!9126 a1!948) (_4!614 lt!439175)) (select (arr!9126 a2!948) (_4!614 lt!439175)) #b00000000000000000000000000000000 lt!439174))))

(declare-fun b!305756 () Bool)

(declare-fun e!220236 () Bool)

(assert (=> b!305756 (= e!220240 e!220236)))

(declare-fun res!251258 () Bool)

(assert (=> b!305756 (=> (not res!251258) (not e!220236))))

(assert (=> b!305756 (= res!251258 e!220239)))

(declare-fun res!251259 () Bool)

(assert (=> b!305756 (=> res!251259 e!220239)))

(assert (=> b!305756 (= res!251259 (bvsge (_1!13269 lt!439175) (_2!13269 lt!439175)))))

(assert (=> b!305756 (= lt!439174 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305756 (= lt!439176 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305756 (= lt!439175 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305757 () Bool)

(declare-fun res!251261 () Bool)

(assert (=> b!305757 (= res!251261 (= lt!439174 #b00000000000000000000000000000000))))

(assert (=> b!305757 (=> res!251261 e!220238)))

(assert (=> b!305757 (= e!220235 e!220238)))

(declare-fun b!305758 () Bool)

(assert (=> b!305758 (= e!220236 e!220237)))

(assert (=> b!305758 (= c!14829 (= (_3!1571 lt!439175) (_4!614 lt!439175)))))

(assert (= (and d!102050 (not res!251262)) b!305756))

(assert (= (and b!305756 (not res!251259)) b!305753))

(assert (= (and b!305756 res!251258) b!305758))

(assert (= (and b!305758 c!14829) b!305752))

(assert (= (and b!305758 (not c!14829)) b!305754))

(assert (= (and b!305754 res!251260) b!305757))

(assert (= (and b!305757 (not res!251261)) b!305755))

(assert (= (or b!305752 b!305754) bm!5780))

(declare-fun m!444229 () Bool)

(assert (=> b!305753 m!444229))

(declare-fun m!444231 () Bool)

(assert (=> bm!5780 m!444231))

(declare-fun m!444233 () Bool)

(assert (=> bm!5780 m!444233))

(assert (=> bm!5780 m!444231))

(assert (=> bm!5780 m!444233))

(declare-fun m!444235 () Bool)

(assert (=> bm!5780 m!444235))

(declare-fun m!444237 () Bool)

(assert (=> b!305755 m!444237))

(declare-fun m!444239 () Bool)

(assert (=> b!305755 m!444239))

(assert (=> b!305755 m!444237))

(assert (=> b!305755 m!444239))

(declare-fun m!444241 () Bool)

(assert (=> b!305755 m!444241))

(assert (=> b!305756 m!444119))

(assert (=> b!305677 d!102050))

(push 1)

(assert (not bm!5780))

(assert (not b!305756))

(assert (not b!305737))

(assert (not b!305755))

(assert (not d!102032))

(assert (not d!102044))

(assert (not d!102040))

(assert (not b!305753))

(check-sat)

(pop 1)

(push 1)

(check-sat)

