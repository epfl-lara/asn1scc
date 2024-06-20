; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68076 () Bool)

(assert start!68076)

(declare-fun res!251157 () Bool)

(declare-fun e!220094 () Bool)

(assert (=> start!68076 (=> (not res!251157) (not e!220094))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18548 0))(
  ( (array!18549 (arr!9124 (Array (_ BitVec 32) (_ BitVec 8))) (size!8041 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18548)

(declare-fun a2!948 () array!18548)

(assert (=> start!68076 (= res!251157 (and (bvsle (size!8041 a1!948) (size!8041 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68076 e!220094))

(assert (=> start!68076 true))

(declare-fun array_inv!7653 (array!18548) Bool)

(assert (=> start!68076 (array_inv!7653 a1!948)))

(assert (=> start!68076 (array_inv!7653 a2!948)))

(declare-fun b!305573 () Bool)

(declare-datatypes ((Unit!21319 0))(
  ( (Unit!21320) )
))
(declare-fun e!220096 () Unit!21319)

(declare-fun lt!439056 () Unit!21319)

(assert (=> b!305573 (= e!220096 lt!439056)))

(declare-datatypes ((tuple4!1224 0))(
  ( (tuple4!1225 (_1!13267 (_ BitVec 32)) (_2!13267 (_ BitVec 32)) (_3!1569 (_ BitVec 32)) (_4!612 (_ BitVec 32))) )
))
(declare-fun lt!439055 () tuple4!1224)

(declare-fun lt!439057 () tuple4!1224)

(declare-fun arrayRangesEqImpliesEq!274 (array!18548 array!18548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21319)

(assert (=> b!305573 (= lt!439056 (arrayRangesEqImpliesEq!274 a1!948 a2!948 (_1!13267 lt!439057) (_3!1569 lt!439055) (_2!13267 lt!439057)))))

(assert (=> b!305573 (= (select (arr!9124 a1!948) (_3!1569 lt!439055)) (select (arr!9124 a2!948) (_3!1569 lt!439055)))))

(declare-fun b!305574 () Bool)

(declare-fun e!220100 () Unit!21319)

(declare-fun lt!439062 () Unit!21319)

(assert (=> b!305574 (= e!220100 lt!439062)))

(declare-fun arrayRangesEqSlicedLemma!265 (array!18548 array!18548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21319)

(assert (=> b!305574 (= lt!439062 (arrayRangesEqSlicedLemma!265 a1!948 a2!948 (_1!13267 lt!439057) (_2!13267 lt!439057) (_1!13267 lt!439055) (_2!13267 lt!439055)))))

(declare-fun arrayRangesEq!1670 (array!18548 array!18548 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305574 (arrayRangesEq!1670 a1!948 a2!948 (_1!13267 lt!439055) (_2!13267 lt!439055))))

(declare-fun b!305575 () Bool)

(declare-fun res!251155 () Bool)

(declare-fun lt!439061 () (_ BitVec 32))

(assert (=> b!305575 (= res!251155 (= lt!439061 #b00000000000000000000000000000000))))

(declare-fun e!220099 () Bool)

(assert (=> b!305575 (=> res!251155 e!220099)))

(declare-fun e!220095 () Bool)

(assert (=> b!305575 (= e!220095 e!220099)))

(declare-fun b!305576 () Bool)

(declare-fun res!251152 () Bool)

(declare-fun e!220101 () Bool)

(assert (=> b!305576 (=> (not res!251152) (not e!220101))))

(declare-fun lt!439053 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!305576 (= res!251152 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439053) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!305577 () Bool)

(declare-fun e!220093 () Bool)

(declare-fun call!5768 () Bool)

(assert (=> b!305577 (= e!220093 call!5768)))

(declare-fun b!305578 () Bool)

(declare-fun e!220097 () Unit!21319)

(declare-fun Unit!21321 () Unit!21319)

(assert (=> b!305578 (= e!220097 Unit!21321)))

(declare-fun b!305579 () Bool)

(declare-fun Unit!21322 () Unit!21319)

(assert (=> b!305579 (= e!220096 Unit!21322)))

(declare-fun b!305580 () Bool)

(declare-fun res!251156 () Bool)

(assert (=> b!305580 (=> (not res!251156) (not e!220101))))

(declare-fun arrayBitRangesEq!0 (array!18548 array!18548 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305580 (= res!251156 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!305581 () Bool)

(assert (=> b!305581 (= e!220093 e!220095)))

(declare-fun res!251151 () Bool)

(assert (=> b!305581 (= res!251151 call!5768)))

(assert (=> b!305581 (=> (not res!251151) (not e!220095))))

(declare-fun bm!5765 () Bool)

(declare-fun c!14793 () Bool)

(declare-fun lt!439054 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5765 (= call!5768 (byteRangesEq!0 (select (arr!9124 a1!948) (_3!1569 lt!439057)) (select (arr!9124 a2!948) (_3!1569 lt!439057)) lt!439054 (ite c!14793 lt!439061 #b00000000000000000000000000000111)))))

(declare-fun b!305582 () Bool)

(declare-fun Unit!21323 () Unit!21319)

(assert (=> b!305582 (= e!220100 Unit!21323)))

(declare-fun b!305583 () Bool)

(declare-fun e!220098 () Bool)

(assert (=> b!305583 (= e!220098 (and (= (_3!1569 lt!439055) (_4!612 lt!439055)) (or (bvslt (_3!1569 lt!439055) #b00000000000000000000000000000000) (bvsge (_3!1569 lt!439055) (size!8041 a1!948)))))))

(declare-fun lt!439060 () Unit!21319)

(assert (=> b!305583 (= lt!439060 e!220097)))

(declare-fun c!14795 () Bool)

(assert (=> b!305583 (= c!14795 (and (bvslt (_4!612 lt!439055) (_4!612 lt!439057)) (bvslt (_3!1569 lt!439057) (_4!612 lt!439055))))))

(declare-fun lt!439059 () Unit!21319)

(assert (=> b!305583 (= lt!439059 e!220096)))

(declare-fun c!14796 () Bool)

(assert (=> b!305583 (= c!14796 (and (bvslt (_3!1569 lt!439057) (_3!1569 lt!439055)) (bvslt (_3!1569 lt!439055) (_4!612 lt!439057))))))

(declare-fun b!305584 () Bool)

(assert (=> b!305584 (= e!220099 (byteRangesEq!0 (select (arr!9124 a1!948) (_4!612 lt!439057)) (select (arr!9124 a2!948) (_4!612 lt!439057)) #b00000000000000000000000000000000 lt!439061))))

(declare-fun b!305585 () Bool)

(assert (=> b!305585 (= e!220094 e!220101)))

(declare-fun res!251153 () Bool)

(assert (=> b!305585 (=> (not res!251153) (not e!220101))))

(assert (=> b!305585 (= res!251153 (and (bvsle toBit!258 lt!439053) (bvsle fromBit!258 lt!439053)))))

(assert (=> b!305585 (= lt!439053 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8041 a1!948))))))

(declare-fun b!305586 () Bool)

(assert (=> b!305586 (= e!220101 e!220098)))

(declare-fun res!251154 () Bool)

(assert (=> b!305586 (=> (not res!251154) (not e!220098))))

(assert (=> b!305586 (= res!251154 e!220093)))

(assert (=> b!305586 (= c!14793 (= (_3!1569 lt!439057) (_4!612 lt!439057)))))

(declare-fun lt!439058 () Unit!21319)

(assert (=> b!305586 (= lt!439058 e!220100)))

(declare-fun c!14794 () Bool)

(assert (=> b!305586 (= c!14794 (bvslt (_1!13267 lt!439055) (_2!13267 lt!439055)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1224)

(assert (=> b!305586 (= lt!439055 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!305586 (= lt!439061 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305586 (= lt!439054 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305586 (= lt!439057 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305587 () Bool)

(declare-fun lt!439052 () Unit!21319)

(assert (=> b!305587 (= e!220097 lt!439052)))

(assert (=> b!305587 (= lt!439052 (arrayRangesEqImpliesEq!274 a1!948 a2!948 (_1!13267 lt!439057) (_4!612 lt!439055) (_2!13267 lt!439057)))))

(assert (=> b!305587 (= (select (arr!9124 a1!948) (_4!612 lt!439055)) (select (arr!9124 a2!948) (_4!612 lt!439055)))))

(assert (= (and start!68076 res!251157) b!305585))

(assert (= (and b!305585 res!251153) b!305580))

(assert (= (and b!305580 res!251156) b!305576))

(assert (= (and b!305576 res!251152) b!305586))

(assert (= (and b!305586 c!14794) b!305574))

(assert (= (and b!305586 (not c!14794)) b!305582))

(assert (= (and b!305586 c!14793) b!305577))

(assert (= (and b!305586 (not c!14793)) b!305581))

(assert (= (and b!305581 res!251151) b!305575))

(assert (= (and b!305575 (not res!251155)) b!305584))

(assert (= (or b!305577 b!305581) bm!5765))

(assert (= (and b!305586 res!251154) b!305583))

(assert (= (and b!305583 c!14796) b!305573))

(assert (= (and b!305583 (not c!14796)) b!305579))

(assert (= (and b!305583 c!14795) b!305587))

(assert (= (and b!305583 (not c!14795)) b!305578))

(declare-fun m!444027 () Bool)

(assert (=> b!305574 m!444027))

(declare-fun m!444029 () Bool)

(assert (=> b!305574 m!444029))

(declare-fun m!444031 () Bool)

(assert (=> b!305584 m!444031))

(declare-fun m!444033 () Bool)

(assert (=> b!305584 m!444033))

(assert (=> b!305584 m!444031))

(assert (=> b!305584 m!444033))

(declare-fun m!444035 () Bool)

(assert (=> b!305584 m!444035))

(declare-fun m!444037 () Bool)

(assert (=> b!305587 m!444037))

(declare-fun m!444039 () Bool)

(assert (=> b!305587 m!444039))

(declare-fun m!444041 () Bool)

(assert (=> b!305587 m!444041))

(declare-fun m!444043 () Bool)

(assert (=> b!305580 m!444043))

(declare-fun m!444045 () Bool)

(assert (=> b!305586 m!444045))

(declare-fun m!444047 () Bool)

(assert (=> b!305586 m!444047))

(declare-fun m!444049 () Bool)

(assert (=> b!305573 m!444049))

(declare-fun m!444051 () Bool)

(assert (=> b!305573 m!444051))

(declare-fun m!444053 () Bool)

(assert (=> b!305573 m!444053))

(declare-fun m!444055 () Bool)

(assert (=> bm!5765 m!444055))

(declare-fun m!444057 () Bool)

(assert (=> bm!5765 m!444057))

(assert (=> bm!5765 m!444055))

(assert (=> bm!5765 m!444057))

(declare-fun m!444059 () Bool)

(assert (=> bm!5765 m!444059))

(declare-fun m!444061 () Bool)

(assert (=> start!68076 m!444061))

(declare-fun m!444063 () Bool)

(assert (=> start!68076 m!444063))

(push 1)

(assert (not start!68076))

(assert (not b!305580))

(assert (not b!305586))

(assert (not b!305573))

(assert (not b!305584))

(assert (not bm!5765))

(assert (not b!305587))

(assert (not b!305574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102008 () Bool)

(assert (=> d!102008 (and (bvsge (_3!1569 lt!439055) #b00000000000000000000000000000000) (bvslt (_3!1569 lt!439055) (size!8041 a1!948)) (bvslt (_3!1569 lt!439055) (size!8041 a2!948)) (= (select (arr!9124 a1!948) (_3!1569 lt!439055)) (select (arr!9124 a2!948) (_3!1569 lt!439055))))))

(declare-fun lt!439147 () Unit!21319)

(declare-fun choose!604 (array!18548 array!18548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21319)

(assert (=> d!102008 (= lt!439147 (choose!604 a1!948 a2!948 (_1!13267 lt!439057) (_3!1569 lt!439055) (_2!13267 lt!439057)))))

(assert (=> d!102008 (and (bvsle #b00000000000000000000000000000000 (_1!13267 lt!439057)) (bvsle (_1!13267 lt!439057) (_2!13267 lt!439057)))))

(assert (=> d!102008 (= (arrayRangesEqImpliesEq!274 a1!948 a2!948 (_1!13267 lt!439057) (_3!1569 lt!439055) (_2!13267 lt!439057)) lt!439147)))

(declare-fun bs!26282 () Bool)

(assert (= bs!26282 d!102008))

(assert (=> bs!26282 m!444051))

(assert (=> bs!26282 m!444053))

(declare-fun m!444175 () Bool)

(assert (=> bs!26282 m!444175))

(assert (=> b!305573 d!102008))

(declare-fun d!102010 () Bool)

(assert (=> d!102010 (and (bvsge (_4!612 lt!439055) #b00000000000000000000000000000000) (bvslt (_4!612 lt!439055) (size!8041 a1!948)) (bvslt (_4!612 lt!439055) (size!8041 a2!948)) (= (select (arr!9124 a1!948) (_4!612 lt!439055)) (select (arr!9124 a2!948) (_4!612 lt!439055))))))

(declare-fun lt!439148 () Unit!21319)

(assert (=> d!102010 (= lt!439148 (choose!604 a1!948 a2!948 (_1!13267 lt!439057) (_4!612 lt!439055) (_2!13267 lt!439057)))))

(assert (=> d!102010 (and (bvsle #b00000000000000000000000000000000 (_1!13267 lt!439057)) (bvsle (_1!13267 lt!439057) (_2!13267 lt!439057)))))

(assert (=> d!102010 (= (arrayRangesEqImpliesEq!274 a1!948 a2!948 (_1!13267 lt!439057) (_4!612 lt!439055) (_2!13267 lt!439057)) lt!439148)))

(declare-fun bs!26283 () Bool)

(assert (= bs!26283 d!102010))

(assert (=> bs!26283 m!444039))

(assert (=> bs!26283 m!444041))

(declare-fun m!444177 () Bool)

(assert (=> bs!26283 m!444177))

(assert (=> b!305587 d!102010))

(declare-fun d!102012 () Bool)

(assert (=> d!102012 (= (byteRangesEq!0 (select (arr!9124 a1!948) (_3!1569 lt!439057)) (select (arr!9124 a2!948) (_3!1569 lt!439057)) lt!439054 (ite c!14793 lt!439061 #b00000000000000000000000000000111)) (or (= lt!439054 (ite c!14793 lt!439061 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9124 a1!948) (_3!1569 lt!439057))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14793 lt!439061 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439054)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9124 a2!948) (_3!1569 lt!439057))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14793 lt!439061 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439054)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26284 () Bool)

(assert (= bs!26284 d!102012))

(declare-fun m!444179 () Bool)

(assert (=> bs!26284 m!444179))

(declare-fun m!444181 () Bool)

(assert (=> bs!26284 m!444181))

(assert (=> bm!5765 d!102012))

(declare-fun d!102014 () Bool)

(assert (=> d!102014 (= (array_inv!7653 a1!948) (bvsge (size!8041 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68076 d!102014))

(declare-fun d!102016 () Bool)

(assert (=> d!102016 (= (array_inv!7653 a2!948) (bvsge (size!8041 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68076 d!102016))

(declare-fun d!102018 () Bool)

(assert (=> d!102018 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1225 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305586 d!102018))

(declare-fun d!102020 () Bool)

(assert (=> d!102020 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1225 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305586 d!102020))

(declare-fun b!305719 () Bool)

(declare-fun e!220206 () Bool)

(declare-fun call!5780 () Bool)

(assert (=> b!305719 (= e!220206 call!5780)))

(declare-fun b!305720 () Bool)

(declare-fun e!220205 () Bool)

(declare-fun e!220209 () Bool)

(assert (=> b!305720 (= e!220205 e!220209)))

(declare-fun c!14826 () Bool)

(declare-fun lt!439156 () tuple4!1224)

(assert (=> b!305720 (= c!14826 (= (_3!1569 lt!439156) (_4!612 lt!439156)))))

(declare-fun b!305721 () Bool)

(declare-fun res!251233 () Bool)

(declare-fun lt!439157 () (_ BitVec 32))

(assert (=> b!305721 (= res!251233 (= lt!439157 #b00000000000000000000000000000000))))

(assert (=> b!305721 (=> res!251233 e!220206)))

(declare-fun e!220210 () Bool)

(assert (=> b!305721 (= e!220210 e!220206)))

(declare-fun bm!5777 () Bool)

(declare-fun lt!439155 () (_ BitVec 32))

(assert (=> bm!5777 (= call!5780 (byteRangesEq!0 (ite c!14826 (select (arr!9124 a1!948) (_3!1569 lt!439156)) (select (arr!9124 a1!948) (_4!612 lt!439156))) (ite c!14826 (select (arr!9124 a2!948) (_3!1569 lt!439156)) (select (arr!9124 a2!948) (_4!612 lt!439156))) (ite c!14826 lt!439155 #b00000000000000000000000000000000) lt!439157))))

(declare-fun d!102022 () Bool)

(declare-fun res!251235 () Bool)

(declare-fun e!220207 () Bool)

(assert (=> d!102022 (=> res!251235 e!220207)))

(assert (=> d!102022 (= res!251235 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102022 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220207)))

(declare-fun b!305722 () Bool)

(assert (=> b!305722 (= e!220207 e!220205)))

(declare-fun res!251231 () Bool)

(assert (=> b!305722 (=> (not res!251231) (not e!220205))))

(declare-fun e!220208 () Bool)

(assert (=> b!305722 (= res!251231 e!220208)))

(declare-fun res!251234 () Bool)

(assert (=> b!305722 (=> res!251234 e!220208)))

(assert (=> b!305722 (= res!251234 (bvsge (_1!13267 lt!439156) (_2!13267 lt!439156)))))

(assert (=> b!305722 (= lt!439157 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305722 (= lt!439155 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305722 (= lt!439156 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305723 () Bool)

(assert (=> b!305723 (= e!220208 (arrayRangesEq!1670 a1!948 a2!948 (_1!13267 lt!439156) (_2!13267 lt!439156)))))

(declare-fun b!305724 () Bool)

(assert (=> b!305724 (= e!220209 call!5780)))

(declare-fun b!305725 () Bool)

(assert (=> b!305725 (= e!220209 e!220210)))

(declare-fun res!251232 () Bool)

(assert (=> b!305725 (= res!251232 (byteRangesEq!0 (select (arr!9124 a1!948) (_3!1569 lt!439156)) (select (arr!9124 a2!948) (_3!1569 lt!439156)) lt!439155 #b00000000000000000000000000001000))))

(assert (=> b!305725 (=> (not res!251232) (not e!220210))))

(assert (= (and d!102022 (not res!251235)) b!305722))

(assert (= (and b!305722 (not res!251234)) b!305723))

(assert (= (and b!305722 res!251231) b!305720))

(assert (= (and b!305720 c!14826) b!305724))

(assert (= (and b!305720 (not c!14826)) b!305725))

(assert (= (and b!305725 res!251232) b!305721))

(assert (= (and b!305721 (not res!251233)) b!305719))

(assert (= (or b!305724 b!305719) bm!5777))

(declare-fun m!444183 () Bool)

(assert (=> bm!5777 m!444183))

(declare-fun m!444185 () Bool)

(assert (=> bm!5777 m!444185))

(declare-fun m!444187 () Bool)

(assert (=> bm!5777 m!444187))

(declare-fun m!444189 () Bool)

(assert (=> bm!5777 m!444189))

(declare-fun m!444191 () Bool)

(assert (=> bm!5777 m!444191))

(assert (=> b!305722 m!444047))

(declare-fun m!444193 () Bool)

(assert (=> b!305723 m!444193))

(assert (=> b!305725 m!444191))

(assert (=> b!305725 m!444187))

(assert (=> b!305725 m!444191))

(assert (=> b!305725 m!444187))

(declare-fun m!444195 () Bool)

(assert (=> b!305725 m!444195))

(assert (=> b!305580 d!102022))

(declare-fun d!102026 () Bool)

(assert (=> d!102026 (arrayRangesEq!1670 a1!948 a2!948 (_1!13267 lt!439055) (_2!13267 lt!439055))))

(declare-fun lt!439160 () Unit!21319)

(declare-fun choose!605 (array!18548 array!18548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21319)

(assert (=> d!102026 (= lt!439160 (choose!605 a1!948 a2!948 (_1!13267 lt!439057) (_2!13267 lt!439057) (_1!13267 lt!439055) (_2!13267 lt!439055)))))

(assert (=> d!102026 (and (bvsle #b00000000000000000000000000000000 (_1!13267 lt!439057)) (bvsle (_1!13267 lt!439057) (_2!13267 lt!439057)))))

(assert (=> d!102026 (= (arrayRangesEqSlicedLemma!265 a1!948 a2!948 (_1!13267 lt!439057) (_2!13267 lt!439057) (_1!13267 lt!439055) (_2!13267 lt!439055)) lt!439160)))

(declare-fun bs!26286 () Bool)

(assert (= bs!26286 d!102026))

(assert (=> bs!26286 m!444029))

(declare-fun m!444201 () Bool)

(assert (=> bs!26286 m!444201))

(assert (=> b!305574 d!102026))

(declare-fun d!102034 () Bool)

(declare-fun res!251240 () Bool)

(declare-fun e!220215 () Bool)

(assert (=> d!102034 (=> res!251240 e!220215)))

(assert (=> d!102034 (= res!251240 (= (_1!13267 lt!439055) (_2!13267 lt!439055)))))

(assert (=> d!102034 (= (arrayRangesEq!1670 a1!948 a2!948 (_1!13267 lt!439055) (_2!13267 lt!439055)) e!220215)))

(declare-fun b!305730 () Bool)

(declare-fun e!220216 () Bool)

(assert (=> b!305730 (= e!220215 e!220216)))

(declare-fun res!251241 () Bool)

(assert (=> b!305730 (=> (not res!251241) (not e!220216))))

(assert (=> b!305730 (= res!251241 (= (select (arr!9124 a1!948) (_1!13267 lt!439055)) (select (arr!9124 a2!948) (_1!13267 lt!439055))))))

(declare-fun b!305731 () Bool)

(assert (=> b!305731 (= e!220216 (arrayRangesEq!1670 a1!948 a2!948 (bvadd (_1!13267 lt!439055) #b00000000000000000000000000000001) (_2!13267 lt!439055)))))

(assert (= (and d!102034 (not res!251240)) b!305730))

(assert (= (and b!305730 res!251241) b!305731))

(declare-fun m!444203 () Bool)

(assert (=> b!305730 m!444203))

(declare-fun m!444205 () Bool)

(assert (=> b!305730 m!444205))

(declare-fun m!444207 () Bool)

(assert (=> b!305731 m!444207))

(assert (=> b!305574 d!102034))

(declare-fun d!102036 () Bool)

(assert (=> d!102036 (= (byteRangesEq!0 (select (arr!9124 a1!948) (_4!612 lt!439057)) (select (arr!9124 a2!948) (_4!612 lt!439057)) #b00000000000000000000000000000000 lt!439061) (or (= #b00000000000000000000000000000000 lt!439061) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9124 a1!948) (_4!612 lt!439057))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439061))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9124 a2!948) (_4!612 lt!439057))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439061))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26288 () Bool)

(assert (= bs!26288 d!102036))

(declare-fun m!444211 () Bool)

(assert (=> bs!26288 m!444211))

(declare-fun m!444213 () Bool)

(assert (=> bs!26288 m!444213))

(assert (=> b!305584 d!102036))

(push 1)

(assert (not b!305723))

(assert (not b!305725))

(assert (not b!305722))

(assert (not bm!5777))

(assert (not d!102010))

(assert (not d!102008))

(assert (not d!102026))

(assert (not b!305731))

(check-sat)

