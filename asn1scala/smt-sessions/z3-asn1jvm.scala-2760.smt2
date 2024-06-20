; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66894 () Bool)

(assert start!66894)

(declare-fun res!246811 () Bool)

(declare-fun e!214613 () Bool)

(assert (=> start!66894 (=> (not res!246811) (not e!214613))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18121 0))(
  ( (array!18122 (arr!8948 (Array (_ BitVec 32) (_ BitVec 8))) (size!7865 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18121)

(declare-fun a2!948 () array!18121)

(assert (=> start!66894 (= res!246811 (and (bvsle (size!7865 a1!948) (size!7865 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66894 e!214613))

(assert (=> start!66894 true))

(declare-fun array_inv!7477 (array!18121) Bool)

(assert (=> start!66894 (array_inv!7477 a1!948)))

(assert (=> start!66894 (array_inv!7477 a2!948)))

(declare-fun b!299050 () Bool)

(declare-fun e!214614 () Bool)

(assert (=> b!299050 (= e!214613 e!214614)))

(declare-fun res!246810 () Bool)

(assert (=> b!299050 (=> (not res!246810) (not e!214614))))

(declare-fun lt!434982 () (_ BitVec 64))

(assert (=> b!299050 (= res!246810 (and (bvsle toBit!258 lt!434982) (bvsle fromBit!258 lt!434982)))))

(assert (=> b!299050 (= lt!434982 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7865 a1!948))))))

(declare-fun b!299051 () Bool)

(declare-fun res!246812 () Bool)

(assert (=> b!299051 (=> (not res!246812) (not e!214614))))

(declare-fun arrayBitRangesEq!0 (array!18121 array!18121 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299051 (= res!246812 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299052 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299052 (= e!214614 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!434982) (= fromSlice!52 toSlice!52) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 lt!434982))))))

(assert (= (and start!66894 res!246811) b!299050))

(assert (= (and b!299050 res!246810) b!299051))

(assert (= (and b!299051 res!246812) b!299052))

(declare-fun m!438307 () Bool)

(assert (=> start!66894 m!438307))

(declare-fun m!438309 () Bool)

(assert (=> start!66894 m!438309))

(declare-fun m!438311 () Bool)

(assert (=> b!299051 m!438311))

(check-sat (not start!66894) (not b!299051))
(check-sat)
