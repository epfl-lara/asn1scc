; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68416 () Bool)

(assert start!68416)

(declare-fun b!307282 () Bool)

(declare-fun e!221416 () Bool)

(declare-fun e!221428 () Bool)

(assert (=> b!307282 (= e!221416 e!221428)))

(declare-fun res!252182 () Bool)

(declare-datatypes ((tuple4!1270 0))(
  ( (tuple4!1271 (_1!13290 (_ BitVec 32)) (_2!13290 (_ BitVec 32)) (_3!1592 (_ BitVec 32)) (_4!635 (_ BitVec 32))) )
))
(declare-fun lt!440165 () tuple4!1270)

(declare-datatypes ((array!18615 0))(
  ( (array!18616 (arr!9147 (Array (_ BitVec 32) (_ BitVec 8))) (size!8064 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18615)

(declare-fun a2!948 () array!18615)

(declare-fun lt!440171 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307282 (= res!252182 (byteRangesEq!0 (select (arr!9147 a1!948) (_3!1592 lt!440165)) (select (arr!9147 a2!948) (_3!1592 lt!440165)) lt!440171 #b00000000000000000000000000000111))))

(assert (=> b!307282 (=> (not res!252182) (not e!221428))))

(declare-fun b!307283 () Bool)

(declare-datatypes ((Unit!21434 0))(
  ( (Unit!21435) )
))
(declare-fun e!221420 () Unit!21434)

(declare-fun Unit!21436 () Unit!21434)

(assert (=> b!307283 (= e!221420 Unit!21436)))

(declare-fun b!307284 () Bool)

(declare-fun e!221425 () Bool)

(declare-fun call!5903 () Bool)

(assert (=> b!307284 (= e!221425 call!5903)))

(declare-fun b!307285 () Bool)

(declare-fun res!252180 () Bool)

(declare-fun e!221418 () Bool)

(assert (=> b!307285 (=> (not res!252180) (not e!221418))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18615 array!18615 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!307285 (= res!252180 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!307286 () Bool)

(declare-fun res!252179 () Bool)

(assert (=> b!307286 (=> (not res!252179) (not e!221418))))

(declare-fun lt!440164 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!307286 (= res!252179 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!440164) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!252186 () Bool)

(declare-fun e!221422 () Bool)

(assert (=> start!68416 (=> (not res!252186) (not e!221422))))

(assert (=> start!68416 (= res!252186 (and (bvsle (size!8064 a1!948) (size!8064 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68416 e!221422))

(assert (=> start!68416 true))

(declare-fun array_inv!7676 (array!18615) Bool)

(assert (=> start!68416 (array_inv!7676 a1!948)))

(assert (=> start!68416 (array_inv!7676 a2!948)))

(declare-fun b!307287 () Bool)

(declare-fun e!221421 () Bool)

(declare-fun e!221417 () Bool)

(assert (=> b!307287 (= e!221421 e!221417)))

(declare-fun res!252178 () Bool)

(assert (=> b!307287 (=> (not res!252178) (not e!221417))))

(declare-fun lt!440172 () tuple4!1270)

(assert (=> b!307287 (= res!252178 (not (= (_3!1592 lt!440172) (_4!635 lt!440172))))))

(declare-fun lt!440170 () Unit!21434)

(declare-fun e!221426 () Unit!21434)

(assert (=> b!307287 (= lt!440170 e!221426)))

(declare-fun c!15135 () Bool)

(assert (=> b!307287 (= c!15135 (and (bvslt (_4!635 lt!440172) (_4!635 lt!440165)) (bvslt (_3!1592 lt!440165) (_4!635 lt!440172))))))

(declare-fun lt!440168 () Unit!21434)

(declare-fun e!221419 () Unit!21434)

(assert (=> b!307287 (= lt!440168 e!221419)))

(declare-fun c!15136 () Bool)

(assert (=> b!307287 (= c!15136 (and (bvslt (_3!1592 lt!440165) (_3!1592 lt!440172)) (bvslt (_3!1592 lt!440172) (_4!635 lt!440165))))))

(declare-fun b!307288 () Bool)

(declare-fun res!252184 () Bool)

(assert (=> b!307288 (=> (not res!252184) (not e!221417))))

(assert (=> b!307288 (= res!252184 (byteRangesEq!0 (select (arr!9147 a1!948) (_3!1592 lt!440172)) (select (arr!9147 a2!948) (_3!1592 lt!440172)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!307289 () Bool)

(declare-fun res!252185 () Bool)

(assert (=> b!307289 (=> (not res!252185) (not e!221417))))

(declare-fun e!221424 () Bool)

(assert (=> b!307289 (= res!252185 e!221424)))

(declare-fun res!252183 () Bool)

(assert (=> b!307289 (=> res!252183 e!221424)))

(declare-fun lt!440169 () (_ BitVec 32))

(assert (=> b!307289 (= res!252183 (= lt!440169 #b00000000000000000000000000000000))))

(declare-fun b!307290 () Bool)

(declare-fun res!252176 () Bool)

(declare-fun lt!440166 () (_ BitVec 32))

(assert (=> b!307290 (= res!252176 (= lt!440166 #b00000000000000000000000000000000))))

(assert (=> b!307290 (=> res!252176 e!221425)))

(assert (=> b!307290 (= e!221428 e!221425)))

(declare-fun bm!5900 () Bool)

(declare-fun c!15137 () Bool)

(assert (=> bm!5900 (= call!5903 (byteRangesEq!0 (ite c!15137 (select (arr!9147 a1!948) (_3!1592 lt!440165)) (select (arr!9147 a1!948) (_4!635 lt!440165))) (ite c!15137 (select (arr!9147 a2!948) (_3!1592 lt!440165)) (select (arr!9147 a2!948) (_4!635 lt!440165))) (ite c!15137 lt!440171 #b00000000000000000000000000000000) lt!440166))))

(declare-fun b!307291 () Bool)

(assert (=> b!307291 (= e!221418 e!221421)))

(declare-fun res!252181 () Bool)

(assert (=> b!307291 (=> (not res!252181) (not e!221421))))

(assert (=> b!307291 (= res!252181 e!221416)))

(assert (=> b!307291 (= c!15137 (= (_3!1592 lt!440165) (_4!635 lt!440165)))))

(declare-fun lt!440174 () Unit!21434)

(assert (=> b!307291 (= lt!440174 e!221420)))

(declare-fun c!15138 () Bool)

(assert (=> b!307291 (= c!15138 (bvslt (_1!13290 lt!440172) (_2!13290 lt!440172)))))

(assert (=> b!307291 (= lt!440169 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1270)

(assert (=> b!307291 (= lt!440172 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!307291 (= lt!440166 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307291 (= lt!440171 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307291 (= lt!440165 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!307292 () Bool)

(declare-fun lt!440175 () Unit!21434)

(assert (=> b!307292 (= e!221426 lt!440175)))

(declare-fun arrayRangesEqImpliesEq!297 (array!18615 array!18615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21434)

(assert (=> b!307292 (= lt!440175 (arrayRangesEqImpliesEq!297 a1!948 a2!948 (_1!13290 lt!440165) (_4!635 lt!440172) (_2!13290 lt!440165)))))

(assert (=> b!307292 (= (select (arr!9147 a1!948) (_4!635 lt!440172)) (select (arr!9147 a2!948) (_4!635 lt!440172)))))

(declare-fun b!307293 () Bool)

(assert (=> b!307293 (= e!221424 (byteRangesEq!0 (select (arr!9147 a1!948) (_4!635 lt!440172)) (select (arr!9147 a2!948) (_4!635 lt!440172)) #b00000000000000000000000000000000 lt!440169))))

(declare-fun b!307294 () Bool)

(assert (=> b!307294 (= e!221422 e!221418)))

(declare-fun res!252177 () Bool)

(assert (=> b!307294 (=> (not res!252177) (not e!221418))))

(assert (=> b!307294 (= res!252177 (and (bvsle toBit!258 lt!440164) (bvsle fromBit!258 lt!440164)))))

(assert (=> b!307294 (= lt!440164 (bvmul ((_ sign_extend 32) (size!8064 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!307295 () Bool)

(assert (=> b!307295 (= e!221417 (not (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52)))))

(declare-fun b!307296 () Bool)

(declare-fun Unit!21437 () Unit!21434)

(assert (=> b!307296 (= e!221426 Unit!21437)))

(declare-fun b!307297 () Bool)

(declare-fun lt!440173 () Unit!21434)

(assert (=> b!307297 (= e!221420 lt!440173)))

(declare-fun arrayRangesEqSlicedLemma!288 (array!18615 array!18615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21434)

(assert (=> b!307297 (= lt!440173 (arrayRangesEqSlicedLemma!288 a1!948 a2!948 (_1!13290 lt!440165) (_2!13290 lt!440165) (_1!13290 lt!440172) (_2!13290 lt!440172)))))

(declare-fun arrayRangesEq!1693 (array!18615 array!18615 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307297 (arrayRangesEq!1693 a1!948 a2!948 (_1!13290 lt!440172) (_2!13290 lt!440172))))

(declare-fun b!307298 () Bool)

(declare-fun lt!440167 () Unit!21434)

(assert (=> b!307298 (= e!221419 lt!440167)))

(assert (=> b!307298 (= lt!440167 (arrayRangesEqImpliesEq!297 a1!948 a2!948 (_1!13290 lt!440165) (_3!1592 lt!440172) (_2!13290 lt!440165)))))

(assert (=> b!307298 (= (select (arr!9147 a1!948) (_3!1592 lt!440172)) (select (arr!9147 a2!948) (_3!1592 lt!440172)))))

(declare-fun b!307299 () Bool)

(declare-fun Unit!21438 () Unit!21434)

(assert (=> b!307299 (= e!221419 Unit!21438)))

(declare-fun b!307300 () Bool)

(assert (=> b!307300 (= e!221416 call!5903)))

(assert (= (and start!68416 res!252186) b!307294))

(assert (= (and b!307294 res!252177) b!307285))

(assert (= (and b!307285 res!252180) b!307286))

(assert (= (and b!307286 res!252179) b!307291))

(assert (= (and b!307291 c!15138) b!307297))

(assert (= (and b!307291 (not c!15138)) b!307283))

(assert (= (and b!307291 c!15137) b!307300))

(assert (= (and b!307291 (not c!15137)) b!307282))

(assert (= (and b!307282 res!252182) b!307290))

(assert (= (and b!307290 (not res!252176)) b!307284))

(assert (= (or b!307300 b!307284) bm!5900))

(assert (= (and b!307291 res!252181) b!307287))

(assert (= (and b!307287 c!15136) b!307298))

(assert (= (and b!307287 (not c!15136)) b!307299))

(assert (= (and b!307287 c!15135) b!307292))

(assert (= (and b!307287 (not c!15135)) b!307296))

(assert (= (and b!307287 res!252178) b!307288))

(assert (= (and b!307288 res!252184) b!307289))

(assert (= (and b!307289 (not res!252183)) b!307293))

(assert (= (and b!307289 res!252185) b!307295))

(declare-fun m!445719 () Bool)

(assert (=> bm!5900 m!445719))

(declare-fun m!445721 () Bool)

(assert (=> bm!5900 m!445721))

(declare-fun m!445723 () Bool)

(assert (=> bm!5900 m!445723))

(declare-fun m!445725 () Bool)

(assert (=> bm!5900 m!445725))

(declare-fun m!445727 () Bool)

(assert (=> bm!5900 m!445727))

(declare-fun m!445729 () Bool)

(assert (=> b!307293 m!445729))

(declare-fun m!445731 () Bool)

(assert (=> b!307293 m!445731))

(assert (=> b!307293 m!445729))

(assert (=> b!307293 m!445731))

(declare-fun m!445733 () Bool)

(assert (=> b!307293 m!445733))

(declare-fun m!445735 () Bool)

(assert (=> b!307292 m!445735))

(assert (=> b!307292 m!445729))

(assert (=> b!307292 m!445731))

(declare-fun m!445737 () Bool)

(assert (=> b!307295 m!445737))

(declare-fun m!445739 () Bool)

(assert (=> b!307298 m!445739))

(declare-fun m!445741 () Bool)

(assert (=> b!307298 m!445741))

(declare-fun m!445743 () Bool)

(assert (=> b!307298 m!445743))

(assert (=> b!307288 m!445741))

(assert (=> b!307288 m!445743))

(assert (=> b!307288 m!445741))

(assert (=> b!307288 m!445743))

(declare-fun m!445745 () Bool)

(assert (=> b!307288 m!445745))

(assert (=> b!307282 m!445727))

(assert (=> b!307282 m!445721))

(assert (=> b!307282 m!445727))

(assert (=> b!307282 m!445721))

(declare-fun m!445747 () Bool)

(assert (=> b!307282 m!445747))

(declare-fun m!445749 () Bool)

(assert (=> b!307285 m!445749))

(declare-fun m!445751 () Bool)

(assert (=> start!68416 m!445751))

(declare-fun m!445753 () Bool)

(assert (=> start!68416 m!445753))

(declare-fun m!445755 () Bool)

(assert (=> b!307297 m!445755))

(declare-fun m!445757 () Bool)

(assert (=> b!307297 m!445757))

(declare-fun m!445759 () Bool)

(assert (=> b!307291 m!445759))

(declare-fun m!445761 () Bool)

(assert (=> b!307291 m!445761))

(push 1)

(assert (not b!307295))

(assert (not b!307298))

(assert (not start!68416))

(assert (not bm!5900))

(assert (not b!307282))

(assert (not b!307292))

(assert (not b!307291))

(assert (not b!307285))

(assert (not b!307288))

(assert (not b!307297))

(assert (not b!307293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102526 () Bool)

(assert (=> d!102526 (arrayRangesEq!1693 a1!948 a2!948 (_1!13290 lt!440172) (_2!13290 lt!440172))))

(declare-fun lt!440213 () Unit!21434)

(declare-fun choose!648 (array!18615 array!18615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21434)

(assert (=> d!102526 (= lt!440213 (choose!648 a1!948 a2!948 (_1!13290 lt!440165) (_2!13290 lt!440165) (_1!13290 lt!440172) (_2!13290 lt!440172)))))

(assert (=> d!102526 (and (bvsle #b00000000000000000000000000000000 (_1!13290 lt!440165)) (bvsle (_1!13290 lt!440165) (_2!13290 lt!440165)))))

(assert (=> d!102526 (= (arrayRangesEqSlicedLemma!288 a1!948 a2!948 (_1!13290 lt!440165) (_2!13290 lt!440165) (_1!13290 lt!440172) (_2!13290 lt!440172)) lt!440213)))

(declare-fun bs!26422 () Bool)

(assert (= bs!26422 d!102526))

(assert (=> bs!26422 m!445757))

(declare-fun m!445843 () Bool)

(assert (=> bs!26422 m!445843))

(assert (=> b!307297 d!102526))

(declare-fun d!102532 () Bool)

(declare-fun res!252238 () Bool)

(declare-fun e!221487 () Bool)

(assert (=> d!102532 (=> res!252238 e!221487)))

(assert (=> d!102532 (= res!252238 (= (_1!13290 lt!440172) (_2!13290 lt!440172)))))

(assert (=> d!102532 (= (arrayRangesEq!1693 a1!948 a2!948 (_1!13290 lt!440172) (_2!13290 lt!440172)) e!221487)))

(declare-fun b!307366 () Bool)

(declare-fun e!221488 () Bool)

(assert (=> b!307366 (= e!221487 e!221488)))

(declare-fun res!252239 () Bool)

(assert (=> b!307366 (=> (not res!252239) (not e!221488))))

(assert (=> b!307366 (= res!252239 (= (select (arr!9147 a1!948) (_1!13290 lt!440172)) (select (arr!9147 a2!948) (_1!13290 lt!440172))))))

(declare-fun b!307367 () Bool)

(assert (=> b!307367 (= e!221488 (arrayRangesEq!1693 a1!948 a2!948 (bvadd (_1!13290 lt!440172) #b00000000000000000000000000000001) (_2!13290 lt!440172)))))

(assert (= (and d!102532 (not res!252238)) b!307366))

(assert (= (and b!307366 res!252239) b!307367))

(declare-fun m!445845 () Bool)

(assert (=> b!307366 m!445845))

(declare-fun m!445847 () Bool)

(assert (=> b!307366 m!445847))

(declare-fun m!445849 () Bool)

(assert (=> b!307367 m!445849))

(assert (=> b!307297 d!102532))

(declare-fun d!102534 () Bool)

(assert (=> d!102534 (= (byteRangesEq!0 (select (arr!9147 a1!948) (_3!1592 lt!440165)) (select (arr!9147 a2!948) (_3!1592 lt!440165)) lt!440171 #b00000000000000000000000000000111) (or (= lt!440171 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a1!948) (_3!1592 lt!440165))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440171)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a2!948) (_3!1592 lt!440165))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440171)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26425 () Bool)

(assert (= bs!26425 d!102534))

(declare-fun m!445873 () Bool)

(assert (=> bs!26425 m!445873))

(declare-fun m!445875 () Bool)

(assert (=> bs!26425 m!445875))

(assert (=> b!307282 d!102534))

(declare-fun d!102546 () Bool)

(assert (=> d!102546 (= (byteRangesEq!0 (select (arr!9147 a1!948) (_3!1592 lt!440172)) (select (arr!9147 a2!948) (_3!1592 lt!440172)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a1!948) (_3!1592 lt!440172))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a2!948) (_3!1592 lt!440172))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26427 () Bool)

(assert (= bs!26427 d!102546))

(assert (=> bs!26427 m!445873))

(declare-fun m!445881 () Bool)

(assert (=> bs!26427 m!445881))

(assert (=> b!307288 d!102546))

(declare-fun d!102550 () Bool)

(assert (=> d!102550 (and (bvsge (_4!635 lt!440172) #b00000000000000000000000000000000) (bvslt (_4!635 lt!440172) (size!8064 a1!948)) (bvslt (_4!635 lt!440172) (size!8064 a2!948)) (= (select (arr!9147 a1!948) (_4!635 lt!440172)) (select (arr!9147 a2!948) (_4!635 lt!440172))))))

(declare-fun lt!440219 () Unit!21434)

(declare-fun choose!649 (array!18615 array!18615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21434)

(assert (=> d!102550 (= lt!440219 (choose!649 a1!948 a2!948 (_1!13290 lt!440165) (_4!635 lt!440172) (_2!13290 lt!440165)))))

(assert (=> d!102550 (and (bvsle #b00000000000000000000000000000000 (_1!13290 lt!440165)) (bvsle (_1!13290 lt!440165) (_2!13290 lt!440165)))))

(assert (=> d!102550 (= (arrayRangesEqImpliesEq!297 a1!948 a2!948 (_1!13290 lt!440165) (_4!635 lt!440172) (_2!13290 lt!440165)) lt!440219)))

(declare-fun bs!26429 () Bool)

(assert (= bs!26429 d!102550))

(assert (=> bs!26429 m!445729))

(assert (=> bs!26429 m!445731))

(declare-fun m!445885 () Bool)

(assert (=> bs!26429 m!445885))

(assert (=> b!307292 d!102550))

(declare-fun d!102552 () Bool)

(assert (=> d!102552 (= (byteRangesEq!0 (ite c!15137 (select (arr!9147 a1!948) (_3!1592 lt!440165)) (select (arr!9147 a1!948) (_4!635 lt!440165))) (ite c!15137 (select (arr!9147 a2!948) (_3!1592 lt!440165)) (select (arr!9147 a2!948) (_4!635 lt!440165))) (ite c!15137 lt!440171 #b00000000000000000000000000000000) lt!440166) (or (= (ite c!15137 lt!440171 #b00000000000000000000000000000000) lt!440166) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15137 (select (arr!9147 a1!948) (_3!1592 lt!440165)) (select (arr!9147 a1!948) (_4!635 lt!440165)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440166))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15137 lt!440171 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!15137 (select (arr!9147 a2!948) (_3!1592 lt!440165)) (select (arr!9147 a2!948) (_4!635 lt!440165)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440166))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!15137 lt!440171 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26430 () Bool)

(assert (= bs!26430 d!102552))

(declare-fun m!445887 () Bool)

(assert (=> bs!26430 m!445887))

(declare-fun m!445889 () Bool)

(assert (=> bs!26430 m!445889))

(assert (=> bm!5900 d!102552))

(declare-fun d!102554 () Bool)

(assert (=> d!102554 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1271 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!307291 d!102554))

(declare-fun d!102556 () Bool)

(assert (=> d!102556 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1271 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!307291 d!102556))

(declare-fun bm!5911 () Bool)

(declare-fun lt!440228 () tuple4!1270)

(declare-fun lt!440227 () (_ BitVec 32))

(declare-fun c!15149 () Bool)

(declare-fun call!5914 () Bool)

(declare-fun lt!440226 () (_ BitVec 32))

(assert (=> bm!5911 (= call!5914 (byteRangesEq!0 (select (arr!9147 a1!948) (_3!1592 lt!440228)) (select (arr!9147 a2!948) (_3!1592 lt!440228)) lt!440226 (ite c!15149 lt!440227 #b00000000000000000000000000001000)))))

(declare-fun d!102558 () Bool)

(declare-fun res!252255 () Bool)

(declare-fun e!221507 () Bool)

(assert (=> d!102558 (=> res!252255 e!221507)))

(assert (=> d!102558 (= res!252255 (bvsge fromSlice!52 toSlice!52))))

(assert (=> d!102558 (= (arrayBitRangesEq!0 a1!948 a2!948 fromSlice!52 toSlice!52) e!221507)))

(declare-fun b!307389 () Bool)

(declare-fun e!221511 () Bool)

(assert (=> b!307389 (= e!221507 e!221511)))

(declare-fun res!252258 () Bool)

(assert (=> b!307389 (=> (not res!252258) (not e!221511))))

(declare-fun e!221508 () Bool)

(assert (=> b!307389 (= res!252258 e!221508)))

(declare-fun res!252259 () Bool)

(assert (=> b!307389 (=> res!252259 e!221508)))

(assert (=> b!307389 (= res!252259 (bvsge (_1!13290 lt!440228) (_2!13290 lt!440228)))))

(assert (=> b!307389 (= lt!440227 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307389 (= lt!440226 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307389 (= lt!440228 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun b!307390 () Bool)

(declare-fun res!252256 () Bool)

(assert (=> b!307390 (= res!252256 (= lt!440227 #b00000000000000000000000000000000))))

(declare-fun e!221512 () Bool)

(assert (=> b!307390 (=> res!252256 e!221512)))

(declare-fun e!221510 () Bool)

(assert (=> b!307390 (= e!221510 e!221512)))

(declare-fun b!307391 () Bool)

(declare-fun e!221509 () Bool)

(assert (=> b!307391 (= e!221509 call!5914)))

(declare-fun b!307392 () Bool)

(assert (=> b!307392 (= e!221508 (arrayRangesEq!1693 a1!948 a2!948 (_1!13290 lt!440228) (_2!13290 lt!440228)))))

(declare-fun b!307393 () Bool)

(assert (=> b!307393 (= e!221511 e!221509)))

(assert (=> b!307393 (= c!15149 (= (_3!1592 lt!440228) (_4!635 lt!440228)))))

(declare-fun b!307394 () Bool)

(assert (=> b!307394 (= e!221509 e!221510)))

(declare-fun res!252257 () Bool)

(assert (=> b!307394 (= res!252257 call!5914)))

(assert (=> b!307394 (=> (not res!252257) (not e!221510))))

(declare-fun b!307395 () Bool)

(assert (=> b!307395 (= e!221512 (byteRangesEq!0 (select (arr!9147 a1!948) (_4!635 lt!440228)) (select (arr!9147 a2!948) (_4!635 lt!440228)) #b00000000000000000000000000000000 lt!440227))))

(assert (= (and d!102558 (not res!252255)) b!307389))

(assert (= (and b!307389 (not res!252259)) b!307392))

(assert (= (and b!307389 res!252258) b!307393))

(assert (= (and b!307393 c!15149) b!307391))

(assert (= (and b!307393 (not c!15149)) b!307394))

(assert (= (and b!307394 res!252257) b!307390))

(assert (= (and b!307390 (not res!252256)) b!307395))

(assert (= (or b!307391 b!307394) bm!5911))

(declare-fun m!445891 () Bool)

(assert (=> bm!5911 m!445891))

(declare-fun m!445893 () Bool)

(assert (=> bm!5911 m!445893))

(assert (=> bm!5911 m!445891))

(assert (=> bm!5911 m!445893))

(declare-fun m!445895 () Bool)

(assert (=> bm!5911 m!445895))

(assert (=> b!307389 m!445759))

(declare-fun m!445897 () Bool)

(assert (=> b!307392 m!445897))

(declare-fun m!445899 () Bool)

(assert (=> b!307395 m!445899))

(declare-fun m!445901 () Bool)

(assert (=> b!307395 m!445901))

(assert (=> b!307395 m!445899))

(assert (=> b!307395 m!445901))

(declare-fun m!445903 () Bool)

(assert (=> b!307395 m!445903))

(assert (=> b!307295 d!102558))

(declare-fun lt!440231 () tuple4!1270)

(declare-fun lt!440230 () (_ BitVec 32))

(declare-fun lt!440229 () (_ BitVec 32))

(declare-fun bm!5912 () Bool)

(declare-fun call!5915 () Bool)

(declare-fun c!15150 () Bool)

(assert (=> bm!5912 (= call!5915 (byteRangesEq!0 (select (arr!9147 a1!948) (_3!1592 lt!440231)) (select (arr!9147 a2!948) (_3!1592 lt!440231)) lt!440229 (ite c!15150 lt!440230 #b00000000000000000000000000001000)))))

(declare-fun d!102560 () Bool)

(declare-fun res!252260 () Bool)

(declare-fun e!221513 () Bool)

(assert (=> d!102560 (=> res!252260 e!221513)))

(assert (=> d!102560 (= res!252260 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102560 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!221513)))

(declare-fun b!307396 () Bool)

(declare-fun e!221517 () Bool)

(assert (=> b!307396 (= e!221513 e!221517)))

(declare-fun res!252263 () Bool)

(assert (=> b!307396 (=> (not res!252263) (not e!221517))))

(declare-fun e!221514 () Bool)

(assert (=> b!307396 (= res!252263 e!221514)))

(declare-fun res!252264 () Bool)

(assert (=> b!307396 (=> res!252264 e!221514)))

(assert (=> b!307396 (= res!252264 (bvsge (_1!13290 lt!440231) (_2!13290 lt!440231)))))

(assert (=> b!307396 (= lt!440230 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307396 (= lt!440229 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!307396 (= lt!440231 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!307397 () Bool)

(declare-fun res!252261 () Bool)

(assert (=> b!307397 (= res!252261 (= lt!440230 #b00000000000000000000000000000000))))

(declare-fun e!221518 () Bool)

(assert (=> b!307397 (=> res!252261 e!221518)))

(declare-fun e!221516 () Bool)

(assert (=> b!307397 (= e!221516 e!221518)))

(declare-fun b!307398 () Bool)

(declare-fun e!221515 () Bool)

(assert (=> b!307398 (= e!221515 call!5915)))

(declare-fun b!307399 () Bool)

(assert (=> b!307399 (= e!221514 (arrayRangesEq!1693 a1!948 a2!948 (_1!13290 lt!440231) (_2!13290 lt!440231)))))

(declare-fun b!307400 () Bool)

(assert (=> b!307400 (= e!221517 e!221515)))

(assert (=> b!307400 (= c!15150 (= (_3!1592 lt!440231) (_4!635 lt!440231)))))

(declare-fun b!307401 () Bool)

(assert (=> b!307401 (= e!221515 e!221516)))

(declare-fun res!252262 () Bool)

(assert (=> b!307401 (= res!252262 call!5915)))

(assert (=> b!307401 (=> (not res!252262) (not e!221516))))

(declare-fun b!307402 () Bool)

(assert (=> b!307402 (= e!221518 (byteRangesEq!0 (select (arr!9147 a1!948) (_4!635 lt!440231)) (select (arr!9147 a2!948) (_4!635 lt!440231)) #b00000000000000000000000000000000 lt!440230))))

(assert (= (and d!102560 (not res!252260)) b!307396))

(assert (= (and b!307396 (not res!252264)) b!307399))

(assert (= (and b!307396 res!252263) b!307400))

(assert (= (and b!307400 c!15150) b!307398))

(assert (= (and b!307400 (not c!15150)) b!307401))

(assert (= (and b!307401 res!252262) b!307397))

(assert (= (and b!307397 (not res!252261)) b!307402))

(assert (= (or b!307398 b!307401) bm!5912))

(declare-fun m!445905 () Bool)

(assert (=> bm!5912 m!445905))

(declare-fun m!445907 () Bool)

(assert (=> bm!5912 m!445907))

(assert (=> bm!5912 m!445905))

(assert (=> bm!5912 m!445907))

(declare-fun m!445909 () Bool)

(assert (=> bm!5912 m!445909))

(assert (=> b!307396 m!445761))

(declare-fun m!445911 () Bool)

(assert (=> b!307399 m!445911))

(declare-fun m!445913 () Bool)

(assert (=> b!307402 m!445913))

(declare-fun m!445915 () Bool)

(assert (=> b!307402 m!445915))

(assert (=> b!307402 m!445913))

(assert (=> b!307402 m!445915))

(declare-fun m!445917 () Bool)

(assert (=> b!307402 m!445917))

(assert (=> b!307285 d!102560))

(declare-fun d!102564 () Bool)

(assert (=> d!102564 (= (byteRangesEq!0 (select (arr!9147 a1!948) (_4!635 lt!440172)) (select (arr!9147 a2!948) (_4!635 lt!440172)) #b00000000000000000000000000000000 lt!440169) (or (= #b00000000000000000000000000000000 lt!440169) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a1!948) (_4!635 lt!440172))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440169))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a2!948) (_4!635 lt!440172))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440169))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26431 () Bool)

(assert (= bs!26431 d!102564))

(declare-fun m!445919 () Bool)

(assert (=> bs!26431 m!445919))

(declare-fun m!445923 () Bool)

(assert (=> bs!26431 m!445923))

(assert (=> b!307293 d!102564))

(declare-fun d!102566 () Bool)

(assert (=> d!102566 (= (array_inv!7676 a1!948) (bvsge (size!8064 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68416 d!102566))

(declare-fun d!102570 () Bool)

(assert (=> d!102570 (= (array_inv!7676 a2!948) (bvsge (size!8064 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68416 d!102570))

(declare-fun d!102572 () Bool)

(assert (=> d!102572 (and (bvsge (_3!1592 lt!440172) #b00000000000000000000000000000000) (bvslt (_3!1592 lt!440172) (size!8064 a1!948)) (bvslt (_3!1592 lt!440172) (size!8064 a2!948)) (= (select (arr!9147 a1!948) (_3!1592 lt!440172)) (select (arr!9147 a2!948) (_3!1592 lt!440172))))))

(declare-fun lt!440232 () Unit!21434)

(assert (=> d!102572 (= lt!440232 (choose!649 a1!948 a2!948 (_1!13290 lt!440165) (_3!1592 lt!440172) (_2!13290 lt!440165)))))

(assert (=> d!102572 (and (bvsle #b00000000000000000000000000000000 (_1!13290 lt!440165)) (bvsle (_1!13290 lt!440165) (_2!13290 lt!440165)))))

(assert (=> d!102572 (= (arrayRangesEqImpliesEq!297 a1!948 a2!948 (_1!13290 lt!440165) (_3!1592 lt!440172) (_2!13290 lt!440165)) lt!440232)))

(declare-fun bs!26434 () Bool)

(assert (= bs!26434 d!102572))

(assert (=> bs!26434 m!445741))

(assert (=> bs!26434 m!445743))

(declare-fun m!445927 () Bool)

(assert (=> bs!26434 m!445927))

(assert (=> b!307298 d!102572))

(push 1)

(assert (not d!102526))

(assert (not d!102550))

(assert (not b!307392))

(assert (not b!307402))

(assert (not b!307396))

(assert (not b!307399))

(assert (not bm!5911))

(assert (not b!307367))

(assert (not b!307389))

(assert (not d!102572))

(assert (not bm!5912))

(assert (not b!307395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102590 () Bool)

(assert (=> d!102590 (= (byteRangesEq!0 (select (arr!9147 a1!948) (_4!635 lt!440228)) (select (arr!9147 a2!948) (_4!635 lt!440228)) #b00000000000000000000000000000000 lt!440227) (or (= #b00000000000000000000000000000000 lt!440227) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a1!948) (_4!635 lt!440228))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440227))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a2!948) (_4!635 lt!440228))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440227))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26440 () Bool)

(assert (= bs!26440 d!102590))

(declare-fun m!445955 () Bool)

(assert (=> bs!26440 m!445955))

(assert (=> bs!26440 m!445923))

(assert (=> b!307395 d!102590))

(declare-fun d!102592 () Bool)

(declare-fun res!252271 () Bool)

(declare-fun e!221525 () Bool)

(assert (=> d!102592 (=> res!252271 e!221525)))

(assert (=> d!102592 (= res!252271 (= (_1!13290 lt!440228) (_2!13290 lt!440228)))))

(assert (=> d!102592 (= (arrayRangesEq!1693 a1!948 a2!948 (_1!13290 lt!440228) (_2!13290 lt!440228)) e!221525)))

(declare-fun b!307409 () Bool)

(declare-fun e!221526 () Bool)

(assert (=> b!307409 (= e!221525 e!221526)))

(declare-fun res!252272 () Bool)

(assert (=> b!307409 (=> (not res!252272) (not e!221526))))

(assert (=> b!307409 (= res!252272 (= (select (arr!9147 a1!948) (_1!13290 lt!440228)) (select (arr!9147 a2!948) (_1!13290 lt!440228))))))

(declare-fun b!307410 () Bool)

(assert (=> b!307410 (= e!221526 (arrayRangesEq!1693 a1!948 a2!948 (bvadd (_1!13290 lt!440228) #b00000000000000000000000000000001) (_2!13290 lt!440228)))))

(assert (= (and d!102592 (not res!252271)) b!307409))

(assert (= (and b!307409 res!252272) b!307410))

(declare-fun m!445957 () Bool)

(assert (=> b!307409 m!445957))

(declare-fun m!445959 () Bool)

(assert (=> b!307409 m!445959))

(declare-fun m!445961 () Bool)

(assert (=> b!307410 m!445961))

(assert (=> b!307392 d!102592))

(declare-fun d!102594 () Bool)

(assert (=> d!102594 (= (byteRangesEq!0 (select (arr!9147 a1!948) (_4!635 lt!440231)) (select (arr!9147 a2!948) (_4!635 lt!440231)) #b00000000000000000000000000000000 lt!440230) (or (= #b00000000000000000000000000000000 lt!440230) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a1!948) (_4!635 lt!440231))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440230))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a2!948) (_4!635 lt!440231))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!440230))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26441 () Bool)

(assert (= bs!26441 d!102594))

(declare-fun m!445963 () Bool)

(assert (=> bs!26441 m!445963))

(assert (=> bs!26441 m!445923))

(assert (=> b!307402 d!102594))

(declare-fun d!102596 () Bool)

(assert (=> d!102596 (= (select (arr!9147 a1!948) (_4!635 lt!440172)) (select (arr!9147 a2!948) (_4!635 lt!440172)))))

(assert (=> d!102596 true))

(declare-fun _$12!124 () Unit!21434)

(assert (=> d!102596 (= (choose!649 a1!948 a2!948 (_1!13290 lt!440165) (_4!635 lt!440172) (_2!13290 lt!440165)) _$12!124)))

(declare-fun bs!26442 () Bool)

(assert (= bs!26442 d!102596))

(assert (=> bs!26442 m!445729))

(assert (=> bs!26442 m!445731))

(assert (=> d!102550 d!102596))

(assert (=> b!307389 d!102554))

(declare-fun d!102598 () Bool)

(declare-fun res!252273 () Bool)

(declare-fun e!221527 () Bool)

(assert (=> d!102598 (=> res!252273 e!221527)))

(assert (=> d!102598 (= res!252273 (= (_1!13290 lt!440231) (_2!13290 lt!440231)))))

(assert (=> d!102598 (= (arrayRangesEq!1693 a1!948 a2!948 (_1!13290 lt!440231) (_2!13290 lt!440231)) e!221527)))

(declare-fun b!307411 () Bool)

(declare-fun e!221528 () Bool)

(assert (=> b!307411 (= e!221527 e!221528)))

(declare-fun res!252274 () Bool)

(assert (=> b!307411 (=> (not res!252274) (not e!221528))))

(assert (=> b!307411 (= res!252274 (= (select (arr!9147 a1!948) (_1!13290 lt!440231)) (select (arr!9147 a2!948) (_1!13290 lt!440231))))))

(declare-fun b!307412 () Bool)

(assert (=> b!307412 (= e!221528 (arrayRangesEq!1693 a1!948 a2!948 (bvadd (_1!13290 lt!440231) #b00000000000000000000000000000001) (_2!13290 lt!440231)))))

(assert (= (and d!102598 (not res!252273)) b!307411))

(assert (= (and b!307411 res!252274) b!307412))

(declare-fun m!445965 () Bool)

(assert (=> b!307411 m!445965))

(declare-fun m!445967 () Bool)

(assert (=> b!307411 m!445967))

(declare-fun m!445969 () Bool)

(assert (=> b!307412 m!445969))

(assert (=> b!307399 d!102598))

(declare-fun d!102600 () Bool)

(assert (=> d!102600 (= (select (arr!9147 a1!948) (_3!1592 lt!440172)) (select (arr!9147 a2!948) (_3!1592 lt!440172)))))

(assert (=> d!102600 true))

(declare-fun _$12!125 () Unit!21434)

(assert (=> d!102600 (= (choose!649 a1!948 a2!948 (_1!13290 lt!440165) (_3!1592 lt!440172) (_2!13290 lt!440165)) _$12!125)))

(declare-fun bs!26443 () Bool)

(assert (= bs!26443 d!102600))

(assert (=> bs!26443 m!445741))

(assert (=> bs!26443 m!445743))

(assert (=> d!102572 d!102600))

(declare-fun d!102602 () Bool)

(declare-fun res!252275 () Bool)

(declare-fun e!221529 () Bool)

(assert (=> d!102602 (=> res!252275 e!221529)))

(assert (=> d!102602 (= res!252275 (= (bvadd (_1!13290 lt!440172) #b00000000000000000000000000000001) (_2!13290 lt!440172)))))

(assert (=> d!102602 (= (arrayRangesEq!1693 a1!948 a2!948 (bvadd (_1!13290 lt!440172) #b00000000000000000000000000000001) (_2!13290 lt!440172)) e!221529)))

(declare-fun b!307413 () Bool)

(declare-fun e!221530 () Bool)

(assert (=> b!307413 (= e!221529 e!221530)))

(declare-fun res!252276 () Bool)

(assert (=> b!307413 (=> (not res!252276) (not e!221530))))

(assert (=> b!307413 (= res!252276 (= (select (arr!9147 a1!948) (bvadd (_1!13290 lt!440172) #b00000000000000000000000000000001)) (select (arr!9147 a2!948) (bvadd (_1!13290 lt!440172) #b00000000000000000000000000000001))))))

(declare-fun b!307414 () Bool)

(assert (=> b!307414 (= e!221530 (arrayRangesEq!1693 a1!948 a2!948 (bvadd (_1!13290 lt!440172) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_2!13290 lt!440172)))))

(assert (= (and d!102602 (not res!252275)) b!307413))

(assert (= (and b!307413 res!252276) b!307414))

(declare-fun m!445971 () Bool)

(assert (=> b!307413 m!445971))

(declare-fun m!445973 () Bool)

(assert (=> b!307413 m!445973))

(declare-fun m!445975 () Bool)

(assert (=> b!307414 m!445975))

(assert (=> b!307367 d!102602))

(declare-fun d!102604 () Bool)

(assert (=> d!102604 (= (byteRangesEq!0 (select (arr!9147 a1!948) (_3!1592 lt!440228)) (select (arr!9147 a2!948) (_3!1592 lt!440228)) lt!440226 (ite c!15149 lt!440227 #b00000000000000000000000000001000)) (or (= lt!440226 (ite c!15149 lt!440227 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a1!948) (_3!1592 lt!440228))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15149 lt!440227 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440226)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a2!948) (_3!1592 lt!440228))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15149 lt!440227 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440226)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26444 () Bool)

(assert (= bs!26444 d!102604))

(declare-fun m!445977 () Bool)

(assert (=> bs!26444 m!445977))

(declare-fun m!445979 () Bool)

(assert (=> bs!26444 m!445979))

(assert (=> bm!5911 d!102604))

(assert (=> b!307396 d!102556))

(assert (=> d!102526 d!102532))

(declare-fun d!102606 () Bool)

(assert (=> d!102606 (arrayRangesEq!1693 a1!948 a2!948 (_1!13290 lt!440172) (_2!13290 lt!440172))))

(assert (=> d!102606 true))

(declare-fun _$10!52 () Unit!21434)

(assert (=> d!102606 (= (choose!648 a1!948 a2!948 (_1!13290 lt!440165) (_2!13290 lt!440165) (_1!13290 lt!440172) (_2!13290 lt!440172)) _$10!52)))

(declare-fun bs!26445 () Bool)

(assert (= bs!26445 d!102606))

(assert (=> bs!26445 m!445757))

(assert (=> d!102526 d!102606))

(declare-fun d!102608 () Bool)

(assert (=> d!102608 (= (byteRangesEq!0 (select (arr!9147 a1!948) (_3!1592 lt!440231)) (select (arr!9147 a2!948) (_3!1592 lt!440231)) lt!440229 (ite c!15150 lt!440230 #b00000000000000000000000000001000)) (or (= lt!440229 (ite c!15150 lt!440230 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a1!948) (_3!1592 lt!440231))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15150 lt!440230 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440229)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9147 a2!948) (_3!1592 lt!440231))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15150 lt!440230 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!440229)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26446 () Bool)

(assert (= bs!26446 d!102608))

(declare-fun m!445981 () Bool)

(assert (=> bs!26446 m!445981))

(declare-fun m!445983 () Bool)

(assert (=> bs!26446 m!445983))

(assert (=> bm!5912 d!102608))

(push 1)

(assert (not d!102606))

(assert (not b!307410))

(assert (not b!307412))

(assert (not b!307414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

