; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67004 () Bool)

(assert start!67004)

(declare-fun b!299985 () Bool)

(declare-fun res!247430 () Bool)

(declare-fun e!215403 () Bool)

(assert (=> b!299985 (=> (not res!247430) (not e!215403))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18204 0))(
  ( (array!18205 (arr!8988 (Array (_ BitVec 32) (_ BitVec 8))) (size!7905 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18204)

(declare-fun a2!948 () array!18204)

(declare-fun arrayBitRangesEq!0 (array!18204 array!18204 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299985 (= res!247430 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299986 () Bool)

(declare-datatypes ((Unit!20973 0))(
  ( (Unit!20974) )
))
(declare-fun e!215407 () Unit!20973)

(declare-fun lt!435678 () Unit!20973)

(assert (=> b!299986 (= e!215407 lt!435678)))

(declare-datatypes ((tuple4!1018 0))(
  ( (tuple4!1019 (_1!13164 (_ BitVec 32)) (_2!13164 (_ BitVec 32)) (_3!1466 (_ BitVec 32)) (_4!509 (_ BitVec 32))) )
))
(declare-fun lt!435674 () tuple4!1018)

(declare-fun lt!435675 () tuple4!1018)

(declare-fun arrayRangesEqImpliesEq!222 (array!18204 array!18204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20973)

(assert (=> b!299986 (= lt!435678 (arrayRangesEqImpliesEq!222 a1!948 a2!948 (_1!13164 lt!435674) (_3!1466 lt!435675) (_2!13164 lt!435674)))))

(assert (=> b!299986 (= (select (arr!8988 a1!948) (_3!1466 lt!435675)) (select (arr!8988 a2!948) (_3!1466 lt!435675)))))

(declare-fun b!299987 () Bool)

(declare-fun res!247433 () Bool)

(assert (=> b!299987 (=> (not res!247433) (not e!215403))))

(declare-fun lt!435673 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299987 (= res!247433 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435673) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299988 () Bool)

(declare-fun e!215402 () Unit!20973)

(declare-fun lt!435671 () Unit!20973)

(assert (=> b!299988 (= e!215402 lt!435671)))

(declare-fun arrayRangesEqSlicedLemma!177 (array!18204 array!18204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20973)

(assert (=> b!299988 (= lt!435671 (arrayRangesEqSlicedLemma!177 a1!948 a2!948 (_1!13164 lt!435674) (_2!13164 lt!435674) (_1!13164 lt!435675) (_2!13164 lt!435675)))))

(declare-fun arrayRangesEq!1567 (array!18204 array!18204 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299988 (arrayRangesEq!1567 a1!948 a2!948 (_1!13164 lt!435675) (_2!13164 lt!435675))))

(declare-fun b!299989 () Bool)

(declare-fun Unit!20975 () Unit!20973)

(assert (=> b!299989 (= e!215407 Unit!20975)))

(declare-fun b!299990 () Bool)

(declare-fun e!215406 () Bool)

(declare-fun call!5348 () Bool)

(assert (=> b!299990 (= e!215406 call!5348)))

(declare-fun b!299991 () Bool)

(declare-fun Unit!20976 () Unit!20973)

(assert (=> b!299991 (= e!215402 Unit!20976)))

(declare-fun lt!435676 () (_ BitVec 32))

(declare-fun b!299992 () Bool)

(declare-fun e!215405 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299992 (= e!215405 (byteRangesEq!0 (select (arr!8988 a1!948) (_4!509 lt!435674)) (select (arr!8988 a2!948) (_4!509 lt!435674)) #b00000000000000000000000000000000 lt!435676))))

(declare-fun res!247432 () Bool)

(declare-fun e!215409 () Bool)

(assert (=> start!67004 (=> (not res!247432) (not e!215409))))

(assert (=> start!67004 (= res!247432 (and (bvsle (size!7905 a1!948) (size!7905 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67004 e!215409))

(assert (=> start!67004 true))

(declare-fun array_inv!7517 (array!18204) Bool)

(assert (=> start!67004 (array_inv!7517 a1!948)))

(assert (=> start!67004 (array_inv!7517 a2!948)))

(declare-fun b!299993 () Bool)

(declare-fun res!247431 () Bool)

(assert (=> b!299993 (= res!247431 (= lt!435676 #b00000000000000000000000000000000))))

(assert (=> b!299993 (=> res!247431 e!215405)))

(declare-fun e!215408 () Bool)

(assert (=> b!299993 (= e!215408 e!215405)))

(declare-fun b!299994 () Bool)

(assert (=> b!299994 (= e!215409 e!215403)))

(declare-fun res!247429 () Bool)

(assert (=> b!299994 (=> (not res!247429) (not e!215403))))

(assert (=> b!299994 (= res!247429 (and (bvsle toBit!258 lt!435673) (bvsle fromBit!258 lt!435673)))))

(assert (=> b!299994 (= lt!435673 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7905 a1!948))))))

(declare-fun b!299995 () Bool)

(declare-fun e!215404 () Bool)

(assert (=> b!299995 (= e!215404 false)))

(declare-fun lt!435677 () Unit!20973)

(assert (=> b!299995 (= lt!435677 e!215407)))

(declare-fun c!13861 () Bool)

(assert (=> b!299995 (= c!13861 (and (bvslt (_3!1466 lt!435674) (_3!1466 lt!435675)) (bvslt (_3!1466 lt!435675) (_4!509 lt!435674))))))

(declare-fun c!13862 () Bool)

(declare-fun lt!435672 () (_ BitVec 32))

(declare-fun bm!5345 () Bool)

(assert (=> bm!5345 (= call!5348 (byteRangesEq!0 (select (arr!8988 a1!948) (_3!1466 lt!435674)) (select (arr!8988 a2!948) (_3!1466 lt!435674)) lt!435672 (ite c!13862 lt!435676 #b00000000000000000000000000000111)))))

(declare-fun b!299996 () Bool)

(assert (=> b!299996 (= e!215403 e!215404)))

(declare-fun res!247427 () Bool)

(assert (=> b!299996 (=> (not res!247427) (not e!215404))))

(assert (=> b!299996 (= res!247427 e!215406)))

(assert (=> b!299996 (= c!13862 (= (_3!1466 lt!435674) (_4!509 lt!435674)))))

(declare-fun lt!435670 () Unit!20973)

(assert (=> b!299996 (= lt!435670 e!215402)))

(declare-fun c!13863 () Bool)

(assert (=> b!299996 (= c!13863 (bvslt (_1!13164 lt!435675) (_2!13164 lt!435675)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1018)

(assert (=> b!299996 (= lt!435675 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299996 (= lt!435676 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299996 (= lt!435672 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299996 (= lt!435674 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299997 () Bool)

(assert (=> b!299997 (= e!215406 e!215408)))

(declare-fun res!247428 () Bool)

(assert (=> b!299997 (= res!247428 call!5348)))

(assert (=> b!299997 (=> (not res!247428) (not e!215408))))

(assert (= (and start!67004 res!247432) b!299994))

(assert (= (and b!299994 res!247429) b!299985))

(assert (= (and b!299985 res!247430) b!299987))

(assert (= (and b!299987 res!247433) b!299996))

(assert (= (and b!299996 c!13863) b!299988))

(assert (= (and b!299996 (not c!13863)) b!299991))

(assert (= (and b!299996 c!13862) b!299990))

(assert (= (and b!299996 (not c!13862)) b!299997))

(assert (= (and b!299997 res!247428) b!299993))

(assert (= (and b!299993 (not res!247431)) b!299992))

(assert (= (or b!299990 b!299997) bm!5345))

(assert (= (and b!299996 res!247427) b!299995))

(assert (= (and b!299995 c!13861) b!299986))

(assert (= (and b!299995 (not c!13861)) b!299989))

(declare-fun m!439031 () Bool)

(assert (=> b!299986 m!439031))

(declare-fun m!439033 () Bool)

(assert (=> b!299986 m!439033))

(declare-fun m!439035 () Bool)

(assert (=> b!299986 m!439035))

(declare-fun m!439037 () Bool)

(assert (=> start!67004 m!439037))

(declare-fun m!439039 () Bool)

(assert (=> start!67004 m!439039))

(declare-fun m!439041 () Bool)

(assert (=> b!299985 m!439041))

(declare-fun m!439043 () Bool)

(assert (=> b!299996 m!439043))

(declare-fun m!439045 () Bool)

(assert (=> b!299996 m!439045))

(declare-fun m!439047 () Bool)

(assert (=> b!299988 m!439047))

(declare-fun m!439049 () Bool)

(assert (=> b!299988 m!439049))

(declare-fun m!439051 () Bool)

(assert (=> b!299992 m!439051))

(declare-fun m!439053 () Bool)

(assert (=> b!299992 m!439053))

(assert (=> b!299992 m!439051))

(assert (=> b!299992 m!439053))

(declare-fun m!439055 () Bool)

(assert (=> b!299992 m!439055))

(declare-fun m!439057 () Bool)

(assert (=> bm!5345 m!439057))

(declare-fun m!439059 () Bool)

(assert (=> bm!5345 m!439059))

(assert (=> bm!5345 m!439057))

(assert (=> bm!5345 m!439059))

(declare-fun m!439061 () Bool)

(assert (=> bm!5345 m!439061))

(push 1)

