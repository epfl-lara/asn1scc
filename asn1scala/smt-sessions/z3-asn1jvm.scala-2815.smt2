; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67928 () Bool)

(assert start!67928)

(declare-datatypes ((tuple4!1202 0))(
  ( (tuple4!1203 (_1!13256 (_ BitVec 32)) (_2!13256 (_ BitVec 32)) (_3!1558 (_ BitVec 32)) (_4!601 (_ BitVec 32))) )
))
(declare-fun lt!438623 () tuple4!1202)

(declare-fun c!14666 () Bool)

(declare-datatypes ((array!18517 0))(
  ( (array!18518 (arr!9113 (Array (_ BitVec 32) (_ BitVec 8))) (size!8030 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18517)

(declare-fun lt!438616 () (_ BitVec 32))

(declare-fun a2!948 () array!18517)

(declare-fun bm!5705 () Bool)

(declare-fun lt!438620 () (_ BitVec 32))

(declare-fun call!5708 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5705 (= call!5708 (byteRangesEq!0 (ite c!14666 (select (arr!9113 a1!948) (_3!1558 lt!438623)) (select (arr!9113 a1!948) (_4!601 lt!438623))) (ite c!14666 (select (arr!9113 a2!948) (_3!1558 lt!438623)) (select (arr!9113 a2!948) (_4!601 lt!438623))) (ite c!14666 lt!438616 #b00000000000000000000000000000000) lt!438620))))

(declare-fun b!304882 () Bool)

(declare-datatypes ((Unit!21275 0))(
  ( (Unit!21276) )
))
(declare-fun e!219533 () Unit!21275)

(declare-fun lt!438622 () Unit!21275)

(assert (=> b!304882 (= e!219533 lt!438622)))

(declare-fun lt!438619 () tuple4!1202)

(declare-fun arrayRangesEqSlicedLemma!254 (array!18517 array!18517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21275)

(assert (=> b!304882 (= lt!438622 (arrayRangesEqSlicedLemma!254 a1!948 a2!948 (_1!13256 lt!438623) (_2!13256 lt!438623) (_1!13256 lt!438619) (_2!13256 lt!438619)))))

(declare-fun arrayRangesEq!1659 (array!18517 array!18517 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304882 (arrayRangesEq!1659 a1!948 a2!948 (_1!13256 lt!438619) (_2!13256 lt!438619))))

(declare-fun b!304883 () Bool)

(declare-fun e!219530 () Bool)

(assert (=> b!304883 (= e!219530 call!5708)))

(declare-fun b!304884 () Bool)

(declare-fun e!219529 () Bool)

(declare-fun e!219532 () Bool)

(assert (=> b!304884 (= e!219529 e!219532)))

(declare-fun res!250720 () Bool)

(assert (=> b!304884 (=> (not res!250720) (not e!219532))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!438618 () (_ BitVec 64))

(assert (=> b!304884 (= res!250720 (and (bvsle toBit!258 lt!438618) (bvsle fromBit!258 lt!438618)))))

(assert (=> b!304884 (= lt!438618 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8030 a1!948))))))

(declare-fun b!304885 () Bool)

(declare-fun res!250719 () Bool)

(assert (=> b!304885 (=> (not res!250719) (not e!219532))))

(declare-fun arrayBitRangesEq!0 (array!18517 array!18517 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304885 (= res!250719 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304886 () Bool)

(declare-fun res!250717 () Bool)

(assert (=> b!304886 (= res!250717 (= lt!438620 #b00000000000000000000000000000000))))

(assert (=> b!304886 (=> res!250717 e!219530)))

(declare-fun e!219531 () Bool)

(assert (=> b!304886 (= e!219531 e!219530)))

(declare-fun res!250718 () Bool)

(assert (=> start!67928 (=> (not res!250718) (not e!219529))))

(assert (=> start!67928 (= res!250718 (and (bvsle (size!8030 a1!948) (size!8030 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67928 e!219529))

(assert (=> start!67928 true))

(declare-fun array_inv!7642 (array!18517) Bool)

(assert (=> start!67928 (array_inv!7642 a1!948)))

(assert (=> start!67928 (array_inv!7642 a2!948)))

(declare-fun b!304887 () Bool)

(declare-fun res!250721 () Bool)

(assert (=> b!304887 (=> (not res!250721) (not e!219532))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!304887 (= res!250721 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438618) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!304888 () Bool)

(declare-fun e!219534 () Bool)

(assert (=> b!304888 (= e!219534 e!219531)))

(declare-fun res!250722 () Bool)

(assert (=> b!304888 (= res!250722 (byteRangesEq!0 (select (arr!9113 a1!948) (_3!1558 lt!438623)) (select (arr!9113 a2!948) (_3!1558 lt!438623)) lt!438616 #b00000000000000000000000000000111))))

(assert (=> b!304888 (=> (not res!250722) (not e!219531))))

(declare-fun b!304889 () Bool)

(declare-fun e!219535 () Bool)

(assert (=> b!304889 (= e!219535 false)))

(declare-fun lt!438621 () Unit!21275)

(declare-fun e!219536 () Unit!21275)

(assert (=> b!304889 (= lt!438621 e!219536)))

(declare-fun c!14667 () Bool)

(assert (=> b!304889 (= c!14667 (and (bvslt (_3!1558 lt!438623) (_3!1558 lt!438619)) (bvslt (_3!1558 lt!438619) (_4!601 lt!438623))))))

(declare-fun b!304890 () Bool)

(declare-fun lt!438617 () Unit!21275)

(assert (=> b!304890 (= e!219536 lt!438617)))

(declare-fun arrayRangesEqImpliesEq!263 (array!18517 array!18517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21275)

(assert (=> b!304890 (= lt!438617 (arrayRangesEqImpliesEq!263 a1!948 a2!948 (_1!13256 lt!438623) (_3!1558 lt!438619) (_2!13256 lt!438623)))))

(assert (=> b!304890 (= (select (arr!9113 a1!948) (_3!1558 lt!438619)) (select (arr!9113 a2!948) (_3!1558 lt!438619)))))

(declare-fun b!304891 () Bool)

(declare-fun Unit!21277 () Unit!21275)

(assert (=> b!304891 (= e!219536 Unit!21277)))

(declare-fun b!304892 () Bool)

(declare-fun Unit!21278 () Unit!21275)

(assert (=> b!304892 (= e!219533 Unit!21278)))

(declare-fun b!304893 () Bool)

(assert (=> b!304893 (= e!219532 e!219535)))

(declare-fun res!250716 () Bool)

(assert (=> b!304893 (=> (not res!250716) (not e!219535))))

(assert (=> b!304893 (= res!250716 e!219534)))

(assert (=> b!304893 (= c!14666 (= (_3!1558 lt!438623) (_4!601 lt!438623)))))

(declare-fun lt!438624 () Unit!21275)

(assert (=> b!304893 (= lt!438624 e!219533)))

(declare-fun c!14665 () Bool)

(assert (=> b!304893 (= c!14665 (bvslt (_1!13256 lt!438619) (_2!13256 lt!438619)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1202)

(assert (=> b!304893 (= lt!438619 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304893 (= lt!438620 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304893 (= lt!438616 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304893 (= lt!438623 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304894 () Bool)

(assert (=> b!304894 (= e!219534 call!5708)))

(assert (= (and start!67928 res!250718) b!304884))

(assert (= (and b!304884 res!250720) b!304885))

(assert (= (and b!304885 res!250719) b!304887))

(assert (= (and b!304887 res!250721) b!304893))

(assert (= (and b!304893 c!14665) b!304882))

(assert (= (and b!304893 (not c!14665)) b!304892))

(assert (= (and b!304893 c!14666) b!304894))

(assert (= (and b!304893 (not c!14666)) b!304888))

(assert (= (and b!304888 res!250722) b!304886))

(assert (= (and b!304886 (not res!250717)) b!304883))

(assert (= (or b!304894 b!304883) bm!5705))

(assert (= (and b!304893 res!250716) b!304889))

(assert (= (and b!304889 c!14667) b!304890))

(assert (= (and b!304889 (not c!14667)) b!304891))

(declare-fun m!443363 () Bool)

(assert (=> b!304885 m!443363))

(declare-fun m!443365 () Bool)

(assert (=> b!304893 m!443365))

(declare-fun m!443367 () Bool)

(assert (=> b!304893 m!443367))

(declare-fun m!443369 () Bool)

(assert (=> b!304882 m!443369))

(declare-fun m!443371 () Bool)

(assert (=> b!304882 m!443371))

(declare-fun m!443373 () Bool)

(assert (=> b!304888 m!443373))

(declare-fun m!443375 () Bool)

(assert (=> b!304888 m!443375))

(assert (=> b!304888 m!443373))

(assert (=> b!304888 m!443375))

(declare-fun m!443377 () Bool)

(assert (=> b!304888 m!443377))

(declare-fun m!443379 () Bool)

(assert (=> start!67928 m!443379))

(declare-fun m!443381 () Bool)

(assert (=> start!67928 m!443381))

(declare-fun m!443383 () Bool)

(assert (=> bm!5705 m!443383))

(assert (=> bm!5705 m!443373))

(declare-fun m!443385 () Bool)

(assert (=> bm!5705 m!443385))

(declare-fun m!443387 () Bool)

(assert (=> bm!5705 m!443387))

(assert (=> bm!5705 m!443375))

(declare-fun m!443389 () Bool)

(assert (=> b!304890 m!443389))

(declare-fun m!443391 () Bool)

(assert (=> b!304890 m!443391))

(declare-fun m!443393 () Bool)

(assert (=> b!304890 m!443393))

(check-sat (not bm!5705) (not b!304890) (not b!304893) (not start!67928) (not b!304888) (not b!304885) (not b!304882))
