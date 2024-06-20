; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66892 () Bool)

(assert start!66892)

(declare-fun res!246803 () Bool)

(declare-fun e!214602 () Bool)

(assert (=> start!66892 (=> (not res!246803) (not e!214602))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18119 0))(
  ( (array!18120 (arr!8947 (Array (_ BitVec 32) (_ BitVec 8))) (size!7864 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18119)

(declare-fun a2!948 () array!18119)

(assert (=> start!66892 (= res!246803 (and (bvsle (size!7864 a1!948) (size!7864 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66892 e!214602))

(assert (=> start!66892 true))

(declare-fun array_inv!7476 (array!18119) Bool)

(assert (=> start!66892 (array_inv!7476 a1!948)))

(assert (=> start!66892 (array_inv!7476 a2!948)))

(declare-fun b!299041 () Bool)

(declare-fun e!214601 () Bool)

(assert (=> b!299041 (= e!214602 e!214601)))

(declare-fun res!246802 () Bool)

(assert (=> b!299041 (=> (not res!246802) (not e!214601))))

(declare-fun lt!434979 () (_ BitVec 64))

(assert (=> b!299041 (= res!246802 (and (bvsle toBit!258 lt!434979) (bvsle fromBit!258 lt!434979)))))

(assert (=> b!299041 (= lt!434979 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7864 a1!948))))))

(declare-fun b!299042 () Bool)

(declare-fun res!246801 () Bool)

(assert (=> b!299042 (=> (not res!246801) (not e!214601))))

(declare-fun arrayBitRangesEq!0 (array!18119 array!18119 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299042 (= res!246801 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299043 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299043 (= e!214601 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!434979) (= fromSlice!52 toSlice!52) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 lt!434979))))))

(assert (= (and start!66892 res!246803) b!299041))

(assert (= (and b!299041 res!246802) b!299042))

(assert (= (and b!299042 res!246801) b!299043))

(declare-fun m!438301 () Bool)

(assert (=> start!66892 m!438301))

(declare-fun m!438303 () Bool)

(assert (=> start!66892 m!438303))

(declare-fun m!438305 () Bool)

(assert (=> b!299042 m!438305))

(push 1)

(assert (not b!299042))

(assert (not start!66892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

