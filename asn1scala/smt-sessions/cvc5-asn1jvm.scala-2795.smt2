; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67350 () Bool)

(assert start!67350)

(declare-fun res!248919 () Bool)

(declare-fun e!217413 () Bool)

(assert (=> start!67350 (=> (not res!248919) (not e!217413))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18350 0))(
  ( (array!18351 (arr!9052 (Array (_ BitVec 32) (_ BitVec 8))) (size!7969 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18350)

(declare-fun a2!948 () array!18350)

(assert (=> start!67350 (= res!248919 (and (bvsle (size!7969 a1!948) (size!7969 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67350 e!217413))

(assert (=> start!67350 true))

(declare-fun array_inv!7581 (array!18350) Bool)

(assert (=> start!67350 (array_inv!7581 a1!948)))

(assert (=> start!67350 (array_inv!7581 a2!948)))

(declare-fun b!302459 () Bool)

(declare-fun e!217414 () Bool)

(assert (=> b!302459 (= e!217413 e!217414)))

(declare-fun res!248918 () Bool)

(assert (=> b!302459 (=> (not res!248918) (not e!217414))))

(declare-fun lt!437268 () (_ BitVec 64))

(assert (=> b!302459 (= res!248918 (and (bvsle toBit!258 lt!437268) (bvsle fromBit!258 lt!437268)))))

(assert (=> b!302459 (= lt!437268 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7969 a1!948))))))

(declare-fun b!302460 () Bool)

(declare-fun res!248917 () Bool)

(assert (=> b!302460 (=> (not res!248917) (not e!217414))))

(declare-fun arrayBitRangesEq!0 (array!18350 array!18350 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302460 (= res!248917 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302461 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302461 (= e!217414 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437268) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67350 res!248919) b!302459))

(assert (= (and b!302459 res!248918) b!302460))

(assert (= (and b!302460 res!248917) b!302461))

(declare-fun m!441309 () Bool)

(assert (=> start!67350 m!441309))

(declare-fun m!441311 () Bool)

(assert (=> start!67350 m!441311))

(declare-fun m!441313 () Bool)

(assert (=> b!302460 m!441313))

(push 1)

(assert (not b!302460))

(assert (not start!67350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

