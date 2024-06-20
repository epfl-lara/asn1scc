; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67362 () Bool)

(assert start!67362)

(declare-fun res!248971 () Bool)

(declare-fun e!217485 () Bool)

(assert (=> start!67362 (=> (not res!248971) (not e!217485))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18362 0))(
  ( (array!18363 (arr!9058 (Array (_ BitVec 32) (_ BitVec 8))) (size!7975 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18362)

(declare-fun a2!948 () array!18362)

(assert (=> start!67362 (= res!248971 (and (bvsle (size!7975 a1!948) (size!7975 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67362 e!217485))

(assert (=> start!67362 true))

(declare-fun array_inv!7587 (array!18362) Bool)

(assert (=> start!67362 (array_inv!7587 a1!948)))

(assert (=> start!67362 (array_inv!7587 a2!948)))

(declare-fun b!302513 () Bool)

(declare-fun e!217484 () Bool)

(assert (=> b!302513 (= e!217485 e!217484)))

(declare-fun res!248973 () Bool)

(assert (=> b!302513 (=> (not res!248973) (not e!217484))))

(declare-fun lt!437286 () (_ BitVec 64))

(assert (=> b!302513 (= res!248973 (and (bvsle toBit!258 lt!437286) (bvsle fromBit!258 lt!437286)))))

(assert (=> b!302513 (= lt!437286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7975 a1!948))))))

(declare-fun b!302514 () Bool)

(declare-fun res!248972 () Bool)

(assert (=> b!302514 (=> (not res!248972) (not e!217484))))

(declare-fun arrayBitRangesEq!0 (array!18362 array!18362 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302514 (= res!248972 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302515 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302515 (= e!217484 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437286) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67362 res!248971) b!302513))

(assert (= (and b!302513 res!248973) b!302514))

(assert (= (and b!302514 res!248972) b!302515))

(declare-fun m!441345 () Bool)

(assert (=> start!67362 m!441345))

(declare-fun m!441347 () Bool)

(assert (=> start!67362 m!441347))

(declare-fun m!441349 () Bool)

(assert (=> b!302514 m!441349))

(push 1)

(assert (not b!302514))

(assert (not start!67362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

