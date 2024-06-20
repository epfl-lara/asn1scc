; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67372 () Bool)

(assert start!67372)

(declare-fun res!249016 () Bool)

(declare-fun e!217546 () Bool)

(assert (=> start!67372 (=> (not res!249016) (not e!217546))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18372 0))(
  ( (array!18373 (arr!9063 (Array (_ BitVec 32) (_ BitVec 8))) (size!7980 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18372)

(declare-fun a2!948 () array!18372)

(assert (=> start!67372 (= res!249016 (and (bvsle (size!7980 a1!948) (size!7980 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67372 e!217546))

(assert (=> start!67372 true))

(declare-fun array_inv!7592 (array!18372) Bool)

(assert (=> start!67372 (array_inv!7592 a1!948)))

(assert (=> start!67372 (array_inv!7592 a2!948)))

(declare-fun b!302558 () Bool)

(declare-fun e!217545 () Bool)

(assert (=> b!302558 (= e!217546 e!217545)))

(declare-fun res!249018 () Bool)

(assert (=> b!302558 (=> (not res!249018) (not e!217545))))

(declare-fun lt!437301 () (_ BitVec 64))

(assert (=> b!302558 (= res!249018 (and (bvsle toBit!258 lt!437301) (bvsle fromBit!258 lt!437301)))))

(assert (=> b!302558 (= lt!437301 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7980 a1!948))))))

(declare-fun b!302559 () Bool)

(declare-fun res!249017 () Bool)

(assert (=> b!302559 (=> (not res!249017) (not e!217545))))

(declare-fun arrayBitRangesEq!0 (array!18372 array!18372 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302559 (= res!249017 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302560 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302560 (= e!217545 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437301) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67372 res!249016) b!302558))

(assert (= (and b!302558 res!249018) b!302559))

(assert (= (and b!302559 res!249017) b!302560))

(declare-fun m!441375 () Bool)

(assert (=> start!67372 m!441375))

(declare-fun m!441377 () Bool)

(assert (=> start!67372 m!441377))

(declare-fun m!441379 () Bool)

(assert (=> b!302559 m!441379))

(push 1)

(assert (not start!67372))

(assert (not b!302559))

(check-sat)

(pop 1)

(push 1)

(check-sat)

