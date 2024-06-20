; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67358 () Bool)

(assert start!67358)

(declare-fun res!248954 () Bool)

(declare-fun e!217459 () Bool)

(assert (=> start!67358 (=> (not res!248954) (not e!217459))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18358 0))(
  ( (array!18359 (arr!9056 (Array (_ BitVec 32) (_ BitVec 8))) (size!7973 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18358)

(declare-fun a2!948 () array!18358)

(assert (=> start!67358 (= res!248954 (and (bvsle (size!7973 a1!948) (size!7973 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67358 e!217459))

(assert (=> start!67358 true))

(declare-fun array_inv!7585 (array!18358) Bool)

(assert (=> start!67358 (array_inv!7585 a1!948)))

(assert (=> start!67358 (array_inv!7585 a2!948)))

(declare-fun b!302495 () Bool)

(declare-fun e!217460 () Bool)

(assert (=> b!302495 (= e!217459 e!217460)))

(declare-fun res!248955 () Bool)

(assert (=> b!302495 (=> (not res!248955) (not e!217460))))

(declare-fun lt!437280 () (_ BitVec 64))

(assert (=> b!302495 (= res!248955 (and (bvsle toBit!258 lt!437280) (bvsle fromBit!258 lt!437280)))))

(assert (=> b!302495 (= lt!437280 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7973 a1!948))))))

(declare-fun b!302496 () Bool)

(declare-fun res!248953 () Bool)

(assert (=> b!302496 (=> (not res!248953) (not e!217460))))

(declare-fun arrayBitRangesEq!0 (array!18358 array!18358 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302496 (= res!248953 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302497 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302497 (= e!217460 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437280) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67358 res!248954) b!302495))

(assert (= (and b!302495 res!248955) b!302496))

(assert (= (and b!302496 res!248953) b!302497))

(declare-fun m!441333 () Bool)

(assert (=> start!67358 m!441333))

(declare-fun m!441335 () Bool)

(assert (=> start!67358 m!441335))

(declare-fun m!441337 () Bool)

(assert (=> b!302496 m!441337))

(check-sat (not start!67358) (not b!302496))
(check-sat)
