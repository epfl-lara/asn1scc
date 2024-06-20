; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66978 () Bool)

(assert start!66978)

(declare-fun b!299569 () Bool)

(declare-fun res!247193 () Bool)

(declare-fun e!215075 () Bool)

(assert (=> b!299569 (=> (not res!247193) (not e!215075))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18178 0))(
  ( (array!18179 (arr!8975 (Array (_ BitVec 32) (_ BitVec 8))) (size!7892 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18178)

(declare-fun a2!948 () array!18178)

(declare-fun arrayBitRangesEq!0 (array!18178 array!18178 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299569 (= res!247193 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299571 () Bool)

(declare-datatypes ((Unit!20926 0))(
  ( (Unit!20927) )
))
(declare-fun e!215078 () Unit!20926)

(declare-fun Unit!20928 () Unit!20926)

(assert (=> b!299571 (= e!215078 Unit!20928)))

(declare-fun b!299572 () Bool)

(declare-fun lt!435375 () Unit!20926)

(assert (=> b!299572 (= e!215078 lt!435375)))

(declare-datatypes ((tuple4!992 0))(
  ( (tuple4!993 (_1!13151 (_ BitVec 32)) (_2!13151 (_ BitVec 32)) (_3!1453 (_ BitVec 32)) (_4!496 (_ BitVec 32))) )
))
(declare-fun lt!435374 () tuple4!992)

(declare-fun lt!435371 () tuple4!992)

(declare-fun arrayRangesEqSlicedLemma!164 (array!18178 array!18178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20926)

(assert (=> b!299572 (= lt!435375 (arrayRangesEqSlicedLemma!164 a1!948 a2!948 (_1!13151 lt!435371) (_2!13151 lt!435371) (_1!13151 lt!435374) (_2!13151 lt!435374)))))

(declare-fun arrayRangesEq!1554 (array!18178 array!18178 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299572 (arrayRangesEq!1554 a1!948 a2!948 (_1!13151 lt!435374) (_2!13151 lt!435374))))

(declare-fun b!299573 () Bool)

(assert (=> b!299573 (= e!215075 false)))

(declare-fun lt!435372 () Unit!20926)

(assert (=> b!299573 (= lt!435372 e!215078)))

(declare-fun c!13770 () Bool)

(assert (=> b!299573 (= c!13770 (bvslt (_1!13151 lt!435374) (_2!13151 lt!435374)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!992)

(assert (=> b!299573 (= lt!435374 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299573 (= lt!435371 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299574 () Bool)

(declare-fun e!215077 () Bool)

(assert (=> b!299574 (= e!215077 e!215075)))

(declare-fun res!247195 () Bool)

(assert (=> b!299574 (=> (not res!247195) (not e!215075))))

(declare-fun lt!435373 () (_ BitVec 64))

(assert (=> b!299574 (= res!247195 (and (bvsle toBit!258 lt!435373) (bvsle fromBit!258 lt!435373)))))

(assert (=> b!299574 (= lt!435373 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7892 a1!948))))))

(declare-fun b!299570 () Bool)

(declare-fun res!247196 () Bool)

(assert (=> b!299570 (=> (not res!247196) (not e!215075))))

(assert (=> b!299570 (= res!247196 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435373) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247194 () Bool)

(assert (=> start!66978 (=> (not res!247194) (not e!215077))))

(assert (=> start!66978 (= res!247194 (and (bvsle (size!7892 a1!948) (size!7892 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66978 e!215077))

(assert (=> start!66978 true))

(declare-fun array_inv!7504 (array!18178) Bool)

(assert (=> start!66978 (array_inv!7504 a1!948)))

(assert (=> start!66978 (array_inv!7504 a2!948)))

(assert (= (and start!66978 res!247194) b!299574))

(assert (= (and b!299574 res!247195) b!299569))

(assert (= (and b!299569 res!247193) b!299570))

(assert (= (and b!299570 res!247196) b!299573))

(assert (= (and b!299573 c!13770) b!299572))

(assert (= (and b!299573 (not c!13770)) b!299571))

(declare-fun m!438705 () Bool)

(assert (=> b!299569 m!438705))

(declare-fun m!438707 () Bool)

(assert (=> b!299572 m!438707))

(declare-fun m!438709 () Bool)

(assert (=> b!299572 m!438709))

(declare-fun m!438711 () Bool)

(assert (=> b!299573 m!438711))

(declare-fun m!438713 () Bool)

(assert (=> b!299573 m!438713))

(declare-fun m!438715 () Bool)

(assert (=> start!66978 m!438715))

(declare-fun m!438717 () Bool)

(assert (=> start!66978 m!438717))

(check-sat (not b!299572) (not b!299573) (not start!66978) (not b!299569))
