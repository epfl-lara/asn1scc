; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67930 () Bool)

(assert start!67930)

(declare-fun res!250743 () Bool)

(declare-fun e!219562 () Bool)

(assert (=> start!67930 (=> (not res!250743) (not e!219562))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18519 0))(
  ( (array!18520 (arr!9114 (Array (_ BitVec 32) (_ BitVec 8))) (size!8031 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18519)

(declare-fun a2!948 () array!18519)

(assert (=> start!67930 (= res!250743 (and (bvsle (size!8031 a1!948) (size!8031 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67930 e!219562))

(assert (=> start!67930 true))

(declare-fun array_inv!7643 (array!18519) Bool)

(assert (=> start!67930 (array_inv!7643 a1!948)))

(assert (=> start!67930 (array_inv!7643 a2!948)))

(declare-fun lt!438648 () (_ BitVec 32))

(declare-fun e!219563 () Bool)

(declare-datatypes ((tuple4!1204 0))(
  ( (tuple4!1205 (_1!13257 (_ BitVec 32)) (_2!13257 (_ BitVec 32)) (_3!1559 (_ BitVec 32)) (_4!602 (_ BitVec 32))) )
))
(declare-fun lt!438647 () tuple4!1204)

(declare-fun b!304921 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304921 (= e!219563 (byteRangesEq!0 (select (arr!9114 a1!948) (_4!602 lt!438647)) (select (arr!9114 a2!948) (_4!602 lt!438647)) #b00000000000000000000000000000000 lt!438648))))

(declare-fun b!304922 () Bool)

(declare-fun res!250742 () Bool)

(assert (=> b!304922 (= res!250742 (= lt!438648 #b00000000000000000000000000000000))))

(assert (=> b!304922 (=> res!250742 e!219563)))

(declare-fun e!219560 () Bool)

(assert (=> b!304922 (= e!219560 e!219563)))

(declare-fun b!304923 () Bool)

(declare-fun res!250737 () Bool)

(declare-fun e!219568 () Bool)

(assert (=> b!304923 (=> (not res!250737) (not e!219568))))

(declare-fun lt!438649 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!304923 (= res!250737 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438649) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!304924 () Bool)

(assert (=> b!304924 (= e!219562 e!219568)))

(declare-fun res!250738 () Bool)

(assert (=> b!304924 (=> (not res!250738) (not e!219568))))

(assert (=> b!304924 (= res!250738 (and (bvsle toBit!258 lt!438649) (bvsle fromBit!258 lt!438649)))))

(assert (=> b!304924 (= lt!438649 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8031 a1!948))))))

(declare-fun b!304925 () Bool)

(declare-fun e!219564 () Bool)

(assert (=> b!304925 (= e!219564 e!219560)))

(declare-fun res!250740 () Bool)

(declare-fun call!5711 () Bool)

(assert (=> b!304925 (= res!250740 call!5711)))

(assert (=> b!304925 (=> (not res!250740) (not e!219560))))

(declare-fun b!304926 () Bool)

(declare-datatypes ((Unit!21279 0))(
  ( (Unit!21280) )
))
(declare-fun e!219565 () Unit!21279)

(declare-fun lt!438646 () Unit!21279)

(assert (=> b!304926 (= e!219565 lt!438646)))

(declare-fun lt!438644 () tuple4!1204)

(declare-fun arrayRangesEqSlicedLemma!255 (array!18519 array!18519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21279)

(assert (=> b!304926 (= lt!438646 (arrayRangesEqSlicedLemma!255 a1!948 a2!948 (_1!13257 lt!438647) (_2!13257 lt!438647) (_1!13257 lt!438644) (_2!13257 lt!438644)))))

(declare-fun arrayRangesEq!1660 (array!18519 array!18519 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304926 (arrayRangesEq!1660 a1!948 a2!948 (_1!13257 lt!438644) (_2!13257 lt!438644))))

(declare-fun b!304927 () Bool)

(declare-fun Unit!21281 () Unit!21279)

(assert (=> b!304927 (= e!219565 Unit!21281)))

(declare-fun b!304928 () Bool)

(declare-fun e!219559 () Unit!21279)

(declare-fun lt!438645 () Unit!21279)

(assert (=> b!304928 (= e!219559 lt!438645)))

(declare-fun arrayRangesEqImpliesEq!264 (array!18519 array!18519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21279)

(assert (=> b!304928 (= lt!438645 (arrayRangesEqImpliesEq!264 a1!948 a2!948 (_1!13257 lt!438647) (_3!1559 lt!438644) (_2!13257 lt!438647)))))

(assert (=> b!304928 (= (select (arr!9114 a1!948) (_3!1559 lt!438644)) (select (arr!9114 a2!948) (_3!1559 lt!438644)))))

(declare-fun b!304929 () Bool)

(declare-fun e!219561 () Bool)

(assert (=> b!304929 (= e!219568 e!219561)))

(declare-fun res!250741 () Bool)

(assert (=> b!304929 (=> (not res!250741) (not e!219561))))

(assert (=> b!304929 (= res!250741 e!219564)))

(declare-fun c!14676 () Bool)

(assert (=> b!304929 (= c!14676 (= (_3!1559 lt!438647) (_4!602 lt!438647)))))

(declare-fun lt!438650 () Unit!21279)

(assert (=> b!304929 (= lt!438650 e!219565)))

(declare-fun c!14674 () Bool)

(assert (=> b!304929 (= c!14674 (bvslt (_1!13257 lt!438644) (_2!13257 lt!438644)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1204)

(assert (=> b!304929 (= lt!438644 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304929 (= lt!438648 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438643 () (_ BitVec 32))

(assert (=> b!304929 (= lt!438643 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304929 (= lt!438647 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304930 () Bool)

(declare-fun Unit!21282 () Unit!21279)

(assert (=> b!304930 (= e!219559 Unit!21282)))

(declare-fun bm!5708 () Bool)

(assert (=> bm!5708 (= call!5711 (byteRangesEq!0 (select (arr!9114 a1!948) (_3!1559 lt!438647)) (select (arr!9114 a2!948) (_3!1559 lt!438647)) lt!438643 (ite c!14676 lt!438648 #b00000000000000000000000000000111)))))

(declare-fun b!304931 () Bool)

(assert (=> b!304931 (= e!219561 false)))

(declare-fun lt!438651 () Unit!21279)

(assert (=> b!304931 (= lt!438651 e!219559)))

(declare-fun c!14675 () Bool)

(assert (=> b!304931 (= c!14675 (and (bvslt (_3!1559 lt!438647) (_3!1559 lt!438644)) (bvslt (_3!1559 lt!438644) (_4!602 lt!438647))))))

(declare-fun b!304932 () Bool)

(assert (=> b!304932 (= e!219564 call!5711)))

(declare-fun b!304933 () Bool)

(declare-fun res!250739 () Bool)

(assert (=> b!304933 (=> (not res!250739) (not e!219568))))

(declare-fun arrayBitRangesEq!0 (array!18519 array!18519 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304933 (= res!250739 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!67930 res!250743) b!304924))

(assert (= (and b!304924 res!250738) b!304933))

(assert (= (and b!304933 res!250739) b!304923))

(assert (= (and b!304923 res!250737) b!304929))

(assert (= (and b!304929 c!14674) b!304926))

(assert (= (and b!304929 (not c!14674)) b!304927))

(assert (= (and b!304929 c!14676) b!304932))

(assert (= (and b!304929 (not c!14676)) b!304925))

(assert (= (and b!304925 res!250740) b!304922))

(assert (= (and b!304922 (not res!250742)) b!304921))

(assert (= (or b!304932 b!304925) bm!5708))

(assert (= (and b!304929 res!250741) b!304931))

(assert (= (and b!304931 c!14675) b!304928))

(assert (= (and b!304931 (not c!14675)) b!304930))

(declare-fun m!443395 () Bool)

(assert (=> b!304929 m!443395))

(declare-fun m!443397 () Bool)

(assert (=> b!304929 m!443397))

(declare-fun m!443399 () Bool)

(assert (=> start!67930 m!443399))

(declare-fun m!443401 () Bool)

(assert (=> start!67930 m!443401))

(declare-fun m!443403 () Bool)

(assert (=> b!304921 m!443403))

(declare-fun m!443405 () Bool)

(assert (=> b!304921 m!443405))

(assert (=> b!304921 m!443403))

(assert (=> b!304921 m!443405))

(declare-fun m!443407 () Bool)

(assert (=> b!304921 m!443407))

(declare-fun m!443409 () Bool)

(assert (=> b!304926 m!443409))

(declare-fun m!443411 () Bool)

(assert (=> b!304926 m!443411))

(declare-fun m!443413 () Bool)

(assert (=> b!304933 m!443413))

(declare-fun m!443415 () Bool)

(assert (=> b!304928 m!443415))

(declare-fun m!443417 () Bool)

(assert (=> b!304928 m!443417))

(declare-fun m!443419 () Bool)

(assert (=> b!304928 m!443419))

(declare-fun m!443421 () Bool)

(assert (=> bm!5708 m!443421))

(declare-fun m!443423 () Bool)

(assert (=> bm!5708 m!443423))

(assert (=> bm!5708 m!443421))

(assert (=> bm!5708 m!443423))

(declare-fun m!443425 () Bool)

(assert (=> bm!5708 m!443425))

(push 1)

