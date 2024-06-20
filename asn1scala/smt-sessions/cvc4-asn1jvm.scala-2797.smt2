; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67366 () Bool)

(assert start!67366)

(declare-fun res!248989 () Bool)

(declare-fun e!217509 () Bool)

(assert (=> start!67366 (=> (not res!248989) (not e!217509))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18366 0))(
  ( (array!18367 (arr!9060 (Array (_ BitVec 32) (_ BitVec 8))) (size!7977 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18366)

(declare-fun a2!948 () array!18366)

(assert (=> start!67366 (= res!248989 (and (bvsle (size!7977 a1!948) (size!7977 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67366 e!217509))

(assert (=> start!67366 true))

(declare-fun array_inv!7589 (array!18366) Bool)

(assert (=> start!67366 (array_inv!7589 a1!948)))

(assert (=> start!67366 (array_inv!7589 a2!948)))

(declare-fun b!302531 () Bool)

(declare-fun e!217510 () Bool)

(assert (=> b!302531 (= e!217509 e!217510)))

(declare-fun res!248990 () Bool)

(assert (=> b!302531 (=> (not res!248990) (not e!217510))))

(declare-fun lt!437292 () (_ BitVec 64))

(assert (=> b!302531 (= res!248990 (and (bvsle toBit!258 lt!437292) (bvsle fromBit!258 lt!437292)))))

(assert (=> b!302531 (= lt!437292 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7977 a1!948))))))

(declare-fun b!302532 () Bool)

(declare-fun res!248991 () Bool)

(assert (=> b!302532 (=> (not res!248991) (not e!217510))))

(declare-fun arrayBitRangesEq!0 (array!18366 array!18366 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302532 (= res!248991 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302533 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302533 (= e!217510 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437292) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67366 res!248989) b!302531))

(assert (= (and b!302531 res!248990) b!302532))

(assert (= (and b!302532 res!248991) b!302533))

(declare-fun m!441357 () Bool)

(assert (=> start!67366 m!441357))

(declare-fun m!441359 () Bool)

(assert (=> start!67366 m!441359))

(declare-fun m!441361 () Bool)

(assert (=> b!302532 m!441361))

(push 1)

(assert (not start!67366))

(assert (not b!302532))

(check-sat)

