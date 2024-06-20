; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67340 () Bool)

(assert start!67340)

(declare-fun res!248874 () Bool)

(declare-fun e!217352 () Bool)

(assert (=> start!67340 (=> (not res!248874) (not e!217352))))

(declare-datatypes ((array!18340 0))(
  ( (array!18341 (arr!9047 (Array (_ BitVec 32) (_ BitVec 8))) (size!7964 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18340)

(declare-fun a2!948 () array!18340)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!67340 (= res!248874 (and (bvsle (size!7964 a1!948) (size!7964 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67340 e!217352))

(assert (=> start!67340 true))

(declare-fun array_inv!7576 (array!18340) Bool)

(assert (=> start!67340 (array_inv!7576 a1!948)))

(assert (=> start!67340 (array_inv!7576 a2!948)))

(declare-fun b!302414 () Bool)

(declare-fun e!217354 () Bool)

(assert (=> b!302414 (= e!217352 e!217354)))

(declare-fun res!248873 () Bool)

(assert (=> b!302414 (=> (not res!248873) (not e!217354))))

(declare-fun lt!437253 () (_ BitVec 64))

(assert (=> b!302414 (= res!248873 (and (bvsle toBit!258 lt!437253) (bvsle fromBit!258 lt!437253)))))

(assert (=> b!302414 (= lt!437253 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7964 a1!948))))))

(declare-fun b!302415 () Bool)

(declare-fun res!248872 () Bool)

(assert (=> b!302415 (=> (not res!248872) (not e!217354))))

(declare-fun arrayBitRangesEq!0 (array!18340 array!18340 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302415 (= res!248872 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302416 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302416 (= e!217354 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437253) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67340 res!248874) b!302414))

(assert (= (and b!302414 res!248873) b!302415))

(assert (= (and b!302415 res!248872) b!302416))

(declare-fun m!441279 () Bool)

(assert (=> start!67340 m!441279))

(declare-fun m!441281 () Bool)

(assert (=> start!67340 m!441281))

(declare-fun m!441283 () Bool)

(assert (=> b!302415 m!441283))

(check-sat (not start!67340) (not b!302415))
(check-sat)
