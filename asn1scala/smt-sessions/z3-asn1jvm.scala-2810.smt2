; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67748 () Bool)

(assert start!67748)

(declare-fun b!304040 () Bool)

(declare-fun res!250147 () Bool)

(declare-fun e!218832 () Bool)

(assert (=> b!304040 (=> (not res!250147) (not e!218832))))

(declare-fun lt!438129 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!304040 (= res!250147 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438129) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!304041 () Bool)

(declare-datatypes ((Unit!21226 0))(
  ( (Unit!21227) )
))
(declare-fun e!218834 () Unit!21226)

(declare-fun lt!438128 () Unit!21226)

(assert (=> b!304041 (= e!218834 lt!438128)))

(declare-datatypes ((array!18475 0))(
  ( (array!18476 (arr!9098 (Array (_ BitVec 32) (_ BitVec 8))) (size!8015 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18475)

(declare-fun a2!948 () array!18475)

(declare-datatypes ((tuple4!1172 0))(
  ( (tuple4!1173 (_1!13241 (_ BitVec 32)) (_2!13241 (_ BitVec 32)) (_3!1543 (_ BitVec 32)) (_4!586 (_ BitVec 32))) )
))
(declare-fun lt!438130 () tuple4!1172)

(declare-fun lt!438131 () tuple4!1172)

(declare-fun arrayRangesEqSlicedLemma!239 (array!18475 array!18475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21226)

(assert (=> b!304041 (= lt!438128 (arrayRangesEqSlicedLemma!239 a1!948 a2!948 (_1!13241 lt!438130) (_2!13241 lt!438130) (_1!13241 lt!438131) (_2!13241 lt!438131)))))

(declare-fun arrayRangesEq!1644 (array!18475 array!18475 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304041 (arrayRangesEq!1644 a1!948 a2!948 (_1!13241 lt!438131) (_2!13241 lt!438131))))

(declare-fun b!304042 () Bool)

(declare-fun res!250146 () Bool)

(assert (=> b!304042 (=> (not res!250146) (not e!218832))))

(declare-fun arrayBitRangesEq!0 (array!18475 array!18475 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304042 (= res!250146 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304043 () Bool)

(assert (=> b!304043 (= e!218832 false)))

(declare-fun lt!438132 () Unit!21226)

(assert (=> b!304043 (= lt!438132 e!218834)))

(declare-fun c!14529 () Bool)

(assert (=> b!304043 (= c!14529 (bvslt (_1!13241 lt!438131) (_2!13241 lt!438131)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1172)

(assert (=> b!304043 (= lt!438131 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304043 (= lt!438130 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun res!250149 () Bool)

(declare-fun e!218836 () Bool)

(assert (=> start!67748 (=> (not res!250149) (not e!218836))))

(assert (=> start!67748 (= res!250149 (and (bvsle (size!8015 a1!948) (size!8015 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67748 e!218836))

(assert (=> start!67748 true))

(declare-fun array_inv!7627 (array!18475) Bool)

(assert (=> start!67748 (array_inv!7627 a1!948)))

(assert (=> start!67748 (array_inv!7627 a2!948)))

(declare-fun b!304044 () Bool)

(assert (=> b!304044 (= e!218836 e!218832)))

(declare-fun res!250148 () Bool)

(assert (=> b!304044 (=> (not res!250148) (not e!218832))))

(assert (=> b!304044 (= res!250148 (and (bvsle toBit!258 lt!438129) (bvsle fromBit!258 lt!438129)))))

(assert (=> b!304044 (= lt!438129 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8015 a1!948))))))

(declare-fun b!304045 () Bool)

(declare-fun Unit!21228 () Unit!21226)

(assert (=> b!304045 (= e!218834 Unit!21228)))

(assert (= (and start!67748 res!250149) b!304044))

(assert (= (and b!304044 res!250148) b!304042))

(assert (= (and b!304042 res!250146) b!304040))

(assert (= (and b!304040 res!250147) b!304043))

(assert (= (and b!304043 c!14529) b!304041))

(assert (= (and b!304043 (not c!14529)) b!304045))

(declare-fun m!442583 () Bool)

(assert (=> b!304041 m!442583))

(declare-fun m!442585 () Bool)

(assert (=> b!304041 m!442585))

(declare-fun m!442587 () Bool)

(assert (=> b!304042 m!442587))

(declare-fun m!442589 () Bool)

(assert (=> b!304043 m!442589))

(declare-fun m!442591 () Bool)

(assert (=> b!304043 m!442591))

(declare-fun m!442593 () Bool)

(assert (=> start!67748 m!442593))

(declare-fun m!442595 () Bool)

(assert (=> start!67748 m!442595))

(check-sat (not start!67748) (not b!304041) (not b!304042) (not b!304043))
