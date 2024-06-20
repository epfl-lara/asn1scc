; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67426 () Bool)

(assert start!67426)

(declare-fun b!302792 () Bool)

(declare-fun res!249216 () Bool)

(declare-fun e!217762 () Bool)

(assert (=> b!302792 (=> (not res!249216) (not e!217762))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18396 0))(
  ( (array!18397 (arr!9072 (Array (_ BitVec 32) (_ BitVec 8))) (size!7989 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18396)

(declare-fun a2!948 () array!18396)

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18396 array!18396 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302792 (= res!249216 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun res!249214 () Bool)

(declare-fun e!217761 () Bool)

(assert (=> start!67426 (=> (not res!249214) (not e!217761))))

(assert (=> start!67426 (= res!249214 (and (bvsle (size!7989 a1!948) (size!7989 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67426 e!217761))

(assert (=> start!67426 true))

(declare-fun array_inv!7601 (array!18396) Bool)

(assert (=> start!67426 (array_inv!7601 a1!948)))

(assert (=> start!67426 (array_inv!7601 a2!948)))

(declare-fun b!302793 () Bool)

(declare-fun res!249215 () Bool)

(assert (=> b!302793 (=> (not res!249215) (not e!217762))))

(declare-fun lt!437436 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302793 (= res!249215 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437436) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!302791 () Bool)

(assert (=> b!302791 (= e!217761 e!217762)))

(declare-fun res!249213 () Bool)

(assert (=> b!302791 (=> (not res!249213) (not e!217762))))

(assert (=> b!302791 (= res!249213 (and (bvsle toBit!258 lt!437436) (bvsle fromBit!258 lt!437436)))))

(assert (=> b!302791 (= lt!437436 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7989 a1!948))))))

(declare-datatypes ((tuple4!1120 0))(
  ( (tuple4!1121 (_1!13215 (_ BitVec 32)) (_2!13215 (_ BitVec 32)) (_3!1517 (_ BitVec 32)) (_4!560 (_ BitVec 32))) )
))
(declare-fun lt!437434 () tuple4!1120)

(declare-fun lt!437435 () tuple4!1120)

(declare-fun b!302794 () Bool)

(assert (=> b!302794 (= e!217762 (and (bvslt (_1!13215 lt!437434) (_2!13215 lt!437434)) (bvsle #b00000000000000000000000000000000 (_1!13215 lt!437435)) (bvsle (_1!13215 lt!437435) (_2!13215 lt!437435)) (bvsle (_2!13215 lt!437435) (size!7989 a1!948)) (or (bvsgt (_1!13215 lt!437435) (_1!13215 lt!437434)) (bvsgt (_1!13215 lt!437434) (_2!13215 lt!437434)) (bvsgt (_2!13215 lt!437434) (_2!13215 lt!437435)))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1120)

(assert (=> b!302794 (= lt!437434 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302794 (= lt!437435 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!67426 res!249214) b!302791))

(assert (= (and b!302791 res!249213) b!302792))

(assert (= (and b!302792 res!249216) b!302793))

(assert (= (and b!302793 res!249215) b!302794))

(declare-fun m!441545 () Bool)

(assert (=> b!302792 m!441545))

(declare-fun m!441547 () Bool)

(assert (=> start!67426 m!441547))

(declare-fun m!441549 () Bool)

(assert (=> start!67426 m!441549))

(declare-fun m!441551 () Bool)

(assert (=> b!302794 m!441551))

(declare-fun m!441553 () Bool)

(assert (=> b!302794 m!441553))

(push 1)

(assert (not b!302794))

(assert (not b!302792))

(assert (not start!67426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101168 () Bool)

(assert (=> d!101168 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1121 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302794 d!101168))

(declare-fun d!101170 () Bool)

(assert (=> d!101170 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1121 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302794 d!101170))

(declare-fun b!302852 () Bool)

(declare-fun e!217813 () Bool)

(declare-fun lt!437461 () tuple4!1120)

(declare-fun arrayRangesEq!1618 (array!18396 array!18396 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302852 (= e!217813 (arrayRangesEq!1618 a1!948 a2!948 (_1!13215 lt!437461) (_2!13215 lt!437461)))))

(declare-fun b!302853 () Bool)

(declare-fun e!217816 () Bool)

(declare-fun e!217815 () Bool)

(assert (=> b!302853 (= e!217816 e!217815)))

(declare-fun res!249259 () Bool)

(assert (=> b!302853 (=> (not res!249259) (not e!217815))))

(assert (=> b!302853 (= res!249259 e!217813)))

(declare-fun res!249258 () Bool)

(assert (=> b!302853 (=> res!249258 e!217813)))

(assert (=> b!302853 (= res!249258 (bvsge (_1!13215 lt!437461) (_2!13215 lt!437461)))))

(declare-fun lt!437462 () (_ BitVec 32))

(assert (=> b!302853 (= lt!437462 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437463 () (_ BitVec 32))

(assert (=> b!302853 (= lt!437463 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302853 (= lt!437461 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302854 () Bool)

(declare-fun e!217812 () Bool)

(assert (=> b!302854 (= e!217815 e!217812)))

(declare-fun c!14379 () Bool)

(assert (=> b!302854 (= c!14379 (= (_3!1517 lt!437461) (_4!560 lt!437461)))))

(declare-fun d!101172 () Bool)

(declare-fun res!249257 () Bool)

(assert (=> d!101172 (=> res!249257 e!217816)))

(assert (=> d!101172 (= res!249257 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101172 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217816)))

(declare-fun b!302851 () Bool)

(declare-fun call!5549 () Bool)

(assert (=> b!302851 (= e!217812 call!5549)))

(declare-fun b!302855 () Bool)

(declare-fun e!217814 () Bool)

(assert (=> b!302855 (= e!217812 e!217814)))

(declare-fun res!249261 () Bool)

(assert (=> b!302855 (= res!249261 call!5549)))

(assert (=> b!302855 (=> (not res!249261) (not e!217814))))

(declare-fun bm!5546 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5546 (= call!5549 (byteRangesEq!0 (select (arr!9072 a1!948) (_3!1517 lt!437461)) (select (arr!9072 a2!948) (_3!1517 lt!437461)) lt!437463 (ite c!14379 lt!437462 #b00000000000000000000000000001000)))))

(declare-fun e!217811 () Bool)

(declare-fun b!302856 () Bool)

(assert (=> b!302856 (= e!217811 (byteRangesEq!0 (select (arr!9072 a1!948) (_4!560 lt!437461)) (select (arr!9072 a2!948) (_4!560 lt!437461)) #b00000000000000000000000000000000 lt!437462))))

(declare-fun b!302857 () Bool)

(declare-fun res!249260 () Bool)

(assert (=> b!302857 (= res!249260 (= lt!437462 #b00000000000000000000000000000000))))

(assert (=> b!302857 (=> res!249260 e!217811)))

(assert (=> b!302857 (= e!217814 e!217811)))

(assert (= (and d!101172 (not res!249257)) b!302853))

(assert (= (and b!302853 (not res!249258)) b!302852))

(assert (= (and b!302853 res!249259) b!302854))

(assert (= (and b!302854 c!14379) b!302851))

(assert (= (and b!302854 (not c!14379)) b!302855))

(assert (= (and b!302855 res!249261) b!302857))

(assert (= (and b!302857 (not res!249260)) b!302856))

(assert (= (or b!302851 b!302855) bm!5546))

(declare-fun m!441583 () Bool)

(assert (=> b!302852 m!441583))

(assert (=> b!302853 m!441553))

(declare-fun m!441585 () Bool)

(assert (=> bm!5546 m!441585))

(declare-fun m!441587 () Bool)

(assert (=> bm!5546 m!441587))

(assert (=> bm!5546 m!441585))

(assert (=> bm!5546 m!441587))

(declare-fun m!441589 () Bool)

(assert (=> bm!5546 m!441589))

(declare-fun m!441591 () Bool)

(assert (=> b!302856 m!441591))

(declare-fun m!441593 () Bool)

(assert (=> b!302856 m!441593))

(assert (=> b!302856 m!441591))

(assert (=> b!302856 m!441593))

(declare-fun m!441595 () Bool)

(assert (=> b!302856 m!441595))

(assert (=> b!302792 d!101172))

(declare-fun d!101178 () Bool)

(assert (=> d!101178 (= (array_inv!7601 a1!948) (bvsge (size!7989 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67426 d!101178))

(declare-fun d!101180 () Bool)

(assert (=> d!101180 (= (array_inv!7601 a2!948) (bvsge (size!7989 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67426 d!101180))

(push 1)

(assert (not b!302852))

(assert (not b!302856))

(assert (not bm!5546))

(assert (not b!302853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

