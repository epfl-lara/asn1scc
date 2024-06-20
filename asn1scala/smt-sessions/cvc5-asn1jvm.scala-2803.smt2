; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67476 () Bool)

(assert start!67476)

(declare-fun b!302996 () Bool)

(declare-datatypes ((Unit!21160 0))(
  ( (Unit!21161) )
))
(declare-fun e!217946 () Unit!21160)

(declare-fun Unit!21162 () Unit!21160)

(assert (=> b!302996 (= e!217946 Unit!21162)))

(declare-fun b!302997 () Bool)

(declare-fun e!217948 () Bool)

(declare-datatypes ((tuple4!1128 0))(
  ( (tuple4!1129 (_1!13219 (_ BitVec 32)) (_2!13219 (_ BitVec 32)) (_3!1521 (_ BitVec 32)) (_4!564 (_ BitVec 32))) )
))
(declare-fun lt!437530 () tuple4!1128)

(declare-datatypes ((array!18410 0))(
  ( (array!18411 (arr!9076 (Array (_ BitVec 32) (_ BitVec 8))) (size!7993 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18410)

(assert (=> b!302997 (= e!217948 (and (= (_3!1521 lt!437530) (_4!564 lt!437530)) (or (bvslt (_3!1521 lt!437530) #b00000000000000000000000000000000) (bvsge (_3!1521 lt!437530) (size!7993 a1!948)))))))

(declare-fun lt!437531 () Unit!21160)

(assert (=> b!302997 (= lt!437531 e!217946)))

(declare-fun c!14391 () Bool)

(declare-fun lt!437532 () tuple4!1128)

(assert (=> b!302997 (= c!14391 (bvslt (_1!13219 lt!437532) (_2!13219 lt!437532)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1128)

(assert (=> b!302997 (= lt!437532 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!302997 (= lt!437530 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302998 () Bool)

(declare-fun e!217945 () Bool)

(assert (=> b!302998 (= e!217945 e!217948)))

(declare-fun res!249379 () Bool)

(assert (=> b!302998 (=> (not res!249379) (not e!217948))))

(declare-fun lt!437529 () (_ BitVec 64))

(assert (=> b!302998 (= res!249379 (and (bvsle toBit!258 lt!437529) (bvsle fromBit!258 lt!437529)))))

(assert (=> b!302998 (= lt!437529 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7993 a1!948))))))

(declare-fun b!303000 () Bool)

(declare-fun res!249378 () Bool)

(assert (=> b!303000 (=> (not res!249378) (not e!217948))))

(assert (=> b!303000 (= res!249378 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437529) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303001 () Bool)

(declare-fun lt!437528 () Unit!21160)

(assert (=> b!303001 (= e!217946 lt!437528)))

(declare-fun a2!948 () array!18410)

(declare-fun arrayRangesEqSlicedLemma!217 (array!18410 array!18410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21160)

(assert (=> b!303001 (= lt!437528 (arrayRangesEqSlicedLemma!217 a1!948 a2!948 (_1!13219 lt!437530) (_2!13219 lt!437530) (_1!13219 lt!437532) (_2!13219 lt!437532)))))

(declare-fun arrayRangesEq!1622 (array!18410 array!18410 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303001 (arrayRangesEq!1622 a1!948 a2!948 (_1!13219 lt!437532) (_2!13219 lt!437532))))

(declare-fun res!249380 () Bool)

(assert (=> start!67476 (=> (not res!249380) (not e!217945))))

(assert (=> start!67476 (= res!249380 (and (bvsle (size!7993 a1!948) (size!7993 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67476 e!217945))

(assert (=> start!67476 true))

(declare-fun array_inv!7605 (array!18410) Bool)

(assert (=> start!67476 (array_inv!7605 a1!948)))

(assert (=> start!67476 (array_inv!7605 a2!948)))

(declare-fun b!302999 () Bool)

(declare-fun res!249381 () Bool)

(assert (=> b!302999 (=> (not res!249381) (not e!217948))))

(declare-fun arrayBitRangesEq!0 (array!18410 array!18410 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302999 (= res!249381 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!67476 res!249380) b!302998))

(assert (= (and b!302998 res!249379) b!302999))

(assert (= (and b!302999 res!249381) b!303000))

(assert (= (and b!303000 res!249378) b!302997))

(assert (= (and b!302997 c!14391) b!303001))

(assert (= (and b!302997 (not c!14391)) b!302996))

(declare-fun m!441693 () Bool)

(assert (=> b!302997 m!441693))

(declare-fun m!441695 () Bool)

(assert (=> b!302997 m!441695))

(declare-fun m!441697 () Bool)

(assert (=> b!303001 m!441697))

(declare-fun m!441699 () Bool)

(assert (=> b!303001 m!441699))

(declare-fun m!441701 () Bool)

(assert (=> start!67476 m!441701))

(declare-fun m!441703 () Bool)

(assert (=> start!67476 m!441703))

(declare-fun m!441705 () Bool)

(assert (=> b!302999 m!441705))

(push 1)

(assert (not b!302997))

(assert (not start!67476))

(assert (not b!303001))

(assert (not b!302999))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101236 () Bool)

(assert (=> d!101236 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1129 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302997 d!101236))

(declare-fun d!101238 () Bool)

(assert (=> d!101238 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1129 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302997 d!101238))

(declare-fun d!101240 () Bool)

(assert (=> d!101240 (= (array_inv!7605 a1!948) (bvsge (size!7993 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67476 d!101240))

(declare-fun d!101242 () Bool)

(assert (=> d!101242 (= (array_inv!7605 a2!948) (bvsge (size!7993 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67476 d!101242))

(declare-fun d!101244 () Bool)

(assert (=> d!101244 (arrayRangesEq!1622 a1!948 a2!948 (_1!13219 lt!437532) (_2!13219 lt!437532))))

(declare-fun lt!437574 () Unit!21160)

(declare-fun choose!549 (array!18410 array!18410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21160)

(assert (=> d!101244 (= lt!437574 (choose!549 a1!948 a2!948 (_1!13219 lt!437530) (_2!13219 lt!437530) (_1!13219 lt!437532) (_2!13219 lt!437532)))))

(assert (=> d!101244 (and (bvsle #b00000000000000000000000000000000 (_1!13219 lt!437530)) (bvsle (_1!13219 lt!437530) (_2!13219 lt!437530)))))

(assert (=> d!101244 (= (arrayRangesEqSlicedLemma!217 a1!948 a2!948 (_1!13219 lt!437530) (_2!13219 lt!437530) (_1!13219 lt!437532) (_2!13219 lt!437532)) lt!437574)))

(declare-fun bs!26122 () Bool)

(assert (= bs!26122 d!101244))

(assert (=> bs!26122 m!441699))

(declare-fun m!441743 () Bool)

(assert (=> bs!26122 m!441743))

(assert (=> b!303001 d!101244))

(declare-fun d!101246 () Bool)

(declare-fun res!249426 () Bool)

(declare-fun e!218001 () Bool)

(assert (=> d!101246 (=> res!249426 e!218001)))

(assert (=> d!101246 (= res!249426 (= (_1!13219 lt!437532) (_2!13219 lt!437532)))))

(assert (=> d!101246 (= (arrayRangesEq!1622 a1!948 a2!948 (_1!13219 lt!437532) (_2!13219 lt!437532)) e!218001)))

(declare-fun b!303062 () Bool)

(declare-fun e!218002 () Bool)

(assert (=> b!303062 (= e!218001 e!218002)))

(declare-fun res!249427 () Bool)

(assert (=> b!303062 (=> (not res!249427) (not e!218002))))

(assert (=> b!303062 (= res!249427 (= (select (arr!9076 a1!948) (_1!13219 lt!437532)) (select (arr!9076 a2!948) (_1!13219 lt!437532))))))

(declare-fun b!303063 () Bool)

(assert (=> b!303063 (= e!218002 (arrayRangesEq!1622 a1!948 a2!948 (bvadd (_1!13219 lt!437532) #b00000000000000000000000000000001) (_2!13219 lt!437532)))))

(assert (= (and d!101246 (not res!249426)) b!303062))

(assert (= (and b!303062 res!249427) b!303063))

(declare-fun m!441745 () Bool)

(assert (=> b!303062 m!441745))

(declare-fun m!441747 () Bool)

(assert (=> b!303062 m!441747))

(declare-fun m!441749 () Bool)

(assert (=> b!303063 m!441749))

(assert (=> b!303001 d!101246))

(declare-fun d!101248 () Bool)

(declare-fun res!249446 () Bool)

(declare-fun e!218024 () Bool)

(assert (=> d!101248 (=> res!249446 e!218024)))

(assert (=> d!101248 (= res!249446 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101248 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218024)))

(declare-fun b!303085 () Bool)

(declare-fun res!249444 () Bool)

(declare-fun lt!437586 () (_ BitVec 32))

(assert (=> b!303085 (= res!249444 (= lt!437586 #b00000000000000000000000000000000))))

(declare-fun e!218022 () Bool)

(assert (=> b!303085 (=> res!249444 e!218022)))

(declare-fun e!218023 () Bool)

(assert (=> b!303085 (= e!218023 e!218022)))

(declare-fun b!303086 () Bool)

(declare-fun e!218021 () Bool)

(assert (=> b!303086 (= e!218024 e!218021)))

(declare-fun res!249443 () Bool)

(assert (=> b!303086 (=> (not res!249443) (not e!218021))))

(declare-fun e!218026 () Bool)

(assert (=> b!303086 (= res!249443 e!218026)))

(declare-fun res!249447 () Bool)

(assert (=> b!303086 (=> res!249447 e!218026)))

(declare-fun lt!437585 () tuple4!1128)

(assert (=> b!303086 (= res!249447 (bvsge (_1!13219 lt!437585) (_2!13219 lt!437585)))))

(assert (=> b!303086 (= lt!437586 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437584 () (_ BitVec 32))

(assert (=> b!303086 (= lt!437584 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303086 (= lt!437585 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303087 () Bool)

(declare-fun call!5564 () Bool)

(assert (=> b!303087 (= e!218022 call!5564)))

(declare-fun b!303088 () Bool)

(declare-fun e!218025 () Bool)

(assert (=> b!303088 (= e!218025 call!5564)))

(declare-fun b!303089 () Bool)

(assert (=> b!303089 (= e!218026 (arrayRangesEq!1622 a1!948 a2!948 (_1!13219 lt!437585) (_2!13219 lt!437585)))))

(declare-fun bm!5561 () Bool)

(declare-fun c!14403 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5561 (= call!5564 (byteRangesEq!0 (ite c!14403 (select (arr!9076 a1!948) (_3!1521 lt!437585)) (select (arr!9076 a1!948) (_4!564 lt!437585))) (ite c!14403 (select (arr!9076 a2!948) (_3!1521 lt!437585)) (select (arr!9076 a2!948) (_4!564 lt!437585))) (ite c!14403 lt!437584 #b00000000000000000000000000000000) lt!437586))))

(declare-fun b!303090 () Bool)

(assert (=> b!303090 (= e!218021 e!218025)))

(assert (=> b!303090 (= c!14403 (= (_3!1521 lt!437585) (_4!564 lt!437585)))))

(declare-fun b!303091 () Bool)

(assert (=> b!303091 (= e!218025 e!218023)))

(declare-fun res!249445 () Bool)

(assert (=> b!303091 (= res!249445 (byteRangesEq!0 (select (arr!9076 a1!948) (_3!1521 lt!437585)) (select (arr!9076 a2!948) (_3!1521 lt!437585)) lt!437584 #b00000000000000000000000000001000))))

(assert (=> b!303091 (=> (not res!249445) (not e!218023))))

(assert (= (and d!101248 (not res!249446)) b!303086))

(assert (= (and b!303086 (not res!249447)) b!303089))

(assert (= (and b!303086 res!249443) b!303090))

(assert (= (and b!303090 c!14403) b!303088))

(assert (= (and b!303090 (not c!14403)) b!303091))

(assert (= (and b!303091 res!249445) b!303085))

(assert (= (and b!303085 (not res!249444)) b!303087))

(assert (= (or b!303088 b!303087) bm!5561))

(assert (=> b!303086 m!441695))

(declare-fun m!441765 () Bool)

(assert (=> b!303089 m!441765))

(declare-fun m!441767 () Bool)

(assert (=> bm!5561 m!441767))

(declare-fun m!441769 () Bool)

(assert (=> bm!5561 m!441769))

(declare-fun m!441771 () Bool)

(assert (=> bm!5561 m!441771))

(declare-fun m!441773 () Bool)

(assert (=> bm!5561 m!441773))

(declare-fun m!441775 () Bool)

(assert (=> bm!5561 m!441775))

(assert (=> b!303091 m!441769))

(assert (=> b!303091 m!441775))

(assert (=> b!303091 m!441769))

(assert (=> b!303091 m!441775))

(declare-fun m!441777 () Bool)

(assert (=> b!303091 m!441777))

(assert (=> b!302999 d!101248))

(push 1)

(assert (not b!303086))

(assert (not b!303063))

(assert (not b!303089))

(assert (not b!303091))

(assert (not d!101244))

(assert (not bm!5561))

(check-sat)

