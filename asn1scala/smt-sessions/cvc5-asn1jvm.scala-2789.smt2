; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67302 () Bool)

(assert start!67302)

(declare-fun res!248686 () Bool)

(declare-fun e!217124 () Bool)

(assert (=> start!67302 (=> (not res!248686) (not e!217124))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18311 0))(
  ( (array!18312 (arr!9034 (Array (_ BitVec 32) (_ BitVec 8))) (size!7951 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18311)

(declare-fun a2!948 () array!18311)

(assert (=> start!67302 (= res!248686 (and (bvsle (size!7951 a1!948) (size!7951 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67302 e!217124))

(assert (=> start!67302 true))

(declare-fun array_inv!7563 (array!18311) Bool)

(assert (=> start!67302 (array_inv!7563 a1!948)))

(assert (=> start!67302 (array_inv!7563 a2!948)))

(declare-fun b!302204 () Bool)

(declare-fun e!217126 () Bool)

(assert (=> b!302204 (= e!217124 e!217126)))

(declare-fun res!248688 () Bool)

(assert (=> b!302204 (=> (not res!248688) (not e!217126))))

(declare-fun lt!437178 () (_ BitVec 64))

(assert (=> b!302204 (= res!248688 (and (bvsle toBit!258 lt!437178) (bvsle fromBit!258 lt!437178)))))

(assert (=> b!302204 (= lt!437178 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7951 a1!948))))))

(declare-fun b!302205 () Bool)

(declare-fun res!248687 () Bool)

(assert (=> b!302205 (=> (not res!248687) (not e!217126))))

(declare-fun arrayBitRangesEq!0 (array!18311 array!18311 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302205 (= res!248687 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302206 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302206 (= e!217126 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (not (= ((_ sign_extend 32) (size!7951 a1!948)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!437178 ((_ sign_extend 32) (size!7951 a1!948)))))))))

(assert (= (and start!67302 res!248686) b!302204))

(assert (= (and b!302204 res!248688) b!302205))

(assert (= (and b!302205 res!248687) b!302206))

(declare-fun m!441099 () Bool)

(assert (=> start!67302 m!441099))

(declare-fun m!441101 () Bool)

(assert (=> start!67302 m!441101))

(declare-fun m!441103 () Bool)

(assert (=> b!302205 m!441103))

(push 1)

(assert (not b!302205))

(assert (not start!67302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

