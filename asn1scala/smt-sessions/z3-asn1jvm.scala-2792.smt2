; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67334 () Bool)

(assert start!67334)

(declare-fun res!248847 () Bool)

(declare-fun e!217318 () Bool)

(assert (=> start!67334 (=> (not res!248847) (not e!217318))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18334 0))(
  ( (array!18335 (arr!9044 (Array (_ BitVec 32) (_ BitVec 8))) (size!7961 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18334)

(declare-fun a2!948 () array!18334)

(assert (=> start!67334 (= res!248847 (and (bvsle (size!7961 a1!948) (size!7961 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67334 e!217318))

(assert (=> start!67334 true))

(declare-fun array_inv!7573 (array!18334) Bool)

(assert (=> start!67334 (array_inv!7573 a1!948)))

(assert (=> start!67334 (array_inv!7573 a2!948)))

(declare-fun b!302387 () Bool)

(declare-fun e!217316 () Bool)

(assert (=> b!302387 (= e!217318 e!217316)))

(declare-fun res!248845 () Bool)

(assert (=> b!302387 (=> (not res!248845) (not e!217316))))

(declare-fun lt!437244 () (_ BitVec 64))

(assert (=> b!302387 (= res!248845 (and (bvsle toBit!258 lt!437244) (bvsle fromBit!258 lt!437244)))))

(assert (=> b!302387 (= lt!437244 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7961 a1!948))))))

(declare-fun b!302388 () Bool)

(declare-fun res!248846 () Bool)

(assert (=> b!302388 (=> (not res!248846) (not e!217316))))

(declare-fun arrayBitRangesEq!0 (array!18334 array!18334 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302388 (= res!248846 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302389 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302389 (= e!217316 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437244) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67334 res!248847) b!302387))

(assert (= (and b!302387 res!248845) b!302388))

(assert (= (and b!302388 res!248846) b!302389))

(declare-fun m!441261 () Bool)

(assert (=> start!67334 m!441261))

(declare-fun m!441263 () Bool)

(assert (=> start!67334 m!441263))

(declare-fun m!441265 () Bool)

(assert (=> b!302388 m!441265))

(check-sat (not b!302388) (not start!67334))
(check-sat)
