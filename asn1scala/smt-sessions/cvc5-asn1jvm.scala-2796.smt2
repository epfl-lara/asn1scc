; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67356 () Bool)

(assert start!67356)

(declare-fun res!248946 () Bool)

(declare-fun e!217448 () Bool)

(assert (=> start!67356 (=> (not res!248946) (not e!217448))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18356 0))(
  ( (array!18357 (arr!9055 (Array (_ BitVec 32) (_ BitVec 8))) (size!7972 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18356)

(declare-fun a2!948 () array!18356)

(assert (=> start!67356 (= res!248946 (and (bvsle (size!7972 a1!948) (size!7972 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67356 e!217448))

(assert (=> start!67356 true))

(declare-fun array_inv!7584 (array!18356) Bool)

(assert (=> start!67356 (array_inv!7584 a1!948)))

(assert (=> start!67356 (array_inv!7584 a2!948)))

(declare-fun b!302486 () Bool)

(declare-fun e!217447 () Bool)

(assert (=> b!302486 (= e!217448 e!217447)))

(declare-fun res!248944 () Bool)

(assert (=> b!302486 (=> (not res!248944) (not e!217447))))

(declare-fun lt!437277 () (_ BitVec 64))

(assert (=> b!302486 (= res!248944 (and (bvsle toBit!258 lt!437277) (bvsle fromBit!258 lt!437277)))))

(assert (=> b!302486 (= lt!437277 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7972 a1!948))))))

(declare-fun b!302487 () Bool)

(declare-fun res!248945 () Bool)

(assert (=> b!302487 (=> (not res!248945) (not e!217447))))

(declare-fun arrayBitRangesEq!0 (array!18356 array!18356 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302487 (= res!248945 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302488 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302488 (= e!217447 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437277) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67356 res!248946) b!302486))

(assert (= (and b!302486 res!248944) b!302487))

(assert (= (and b!302487 res!248945) b!302488))

(declare-fun m!441327 () Bool)

(assert (=> start!67356 m!441327))

(declare-fun m!441329 () Bool)

(assert (=> start!67356 m!441329))

(declare-fun m!441331 () Bool)

(assert (=> b!302487 m!441331))

(push 1)

(assert (not b!302487))

(assert (not start!67356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

