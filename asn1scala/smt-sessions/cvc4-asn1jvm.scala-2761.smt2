; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66902 () Bool)

(assert start!66902)

(declare-fun res!246846 () Bool)

(declare-fun e!214662 () Bool)

(assert (=> start!66902 (=> (not res!246846) (not e!214662))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18129 0))(
  ( (array!18130 (arr!8952 (Array (_ BitVec 32) (_ BitVec 8))) (size!7869 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18129)

(declare-fun a2!948 () array!18129)

(assert (=> start!66902 (= res!246846 (and (bvsle (size!7869 a1!948) (size!7869 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66902 e!214662))

(assert (=> start!66902 true))

(declare-fun array_inv!7481 (array!18129) Bool)

(assert (=> start!66902 (array_inv!7481 a1!948)))

(assert (=> start!66902 (array_inv!7481 a2!948)))

(declare-fun b!299086 () Bool)

(declare-fun e!214659 () Bool)

(assert (=> b!299086 (= e!214662 e!214659)))

(declare-fun res!246847 () Bool)

(assert (=> b!299086 (=> (not res!246847) (not e!214659))))

(declare-fun lt!434994 () (_ BitVec 64))

(assert (=> b!299086 (= res!246847 (and (bvsle toBit!258 lt!434994) (bvsle fromBit!258 lt!434994)))))

(assert (=> b!299086 (= lt!434994 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7869 a1!948))))))

(declare-fun b!299087 () Bool)

(declare-fun res!246848 () Bool)

(assert (=> b!299087 (=> (not res!246848) (not e!214659))))

(declare-fun arrayBitRangesEq!0 (array!18129 array!18129 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299087 (= res!246848 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299088 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299088 (= e!214659 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!434994) (not (= fromSlice!52 toSlice!52)) (bvsgt toBit!258 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (= (and start!66902 res!246846) b!299086))

(assert (= (and b!299086 res!246847) b!299087))

(assert (= (and b!299087 res!246848) b!299088))

(declare-fun m!438331 () Bool)

(assert (=> start!66902 m!438331))

(declare-fun m!438333 () Bool)

(assert (=> start!66902 m!438333))

(declare-fun m!438335 () Bool)

(assert (=> b!299087 m!438335))

(push 1)

(assert (not start!66902))

(assert (not b!299087))

(check-sat)

(pop 1)

(push 1)

(check-sat)

