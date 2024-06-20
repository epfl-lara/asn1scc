; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66896 () Bool)

(assert start!66896)

(declare-fun res!246821 () Bool)

(declare-fun e!214624 () Bool)

(assert (=> start!66896 (=> (not res!246821) (not e!214624))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18123 0))(
  ( (array!18124 (arr!8949 (Array (_ BitVec 32) (_ BitVec 8))) (size!7866 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18123)

(declare-fun a2!948 () array!18123)

(assert (=> start!66896 (= res!246821 (and (bvsle (size!7866 a1!948) (size!7866 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66896 e!214624))

(assert (=> start!66896 true))

(declare-fun array_inv!7478 (array!18123) Bool)

(assert (=> start!66896 (array_inv!7478 a1!948)))

(assert (=> start!66896 (array_inv!7478 a2!948)))

(declare-fun b!299059 () Bool)

(declare-fun e!214623 () Bool)

(assert (=> b!299059 (= e!214624 e!214623)))

(declare-fun res!246820 () Bool)

(assert (=> b!299059 (=> (not res!246820) (not e!214623))))

(declare-fun lt!434985 () (_ BitVec 64))

(assert (=> b!299059 (= res!246820 (and (bvsle toBit!258 lt!434985) (bvsle fromBit!258 lt!434985)))))

(assert (=> b!299059 (= lt!434985 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7866 a1!948))))))

(declare-fun b!299060 () Bool)

(declare-fun res!246819 () Bool)

(assert (=> b!299060 (=> (not res!246819) (not e!214623))))

(declare-fun arrayBitRangesEq!0 (array!18123 array!18123 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299060 (= res!246819 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299061 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299061 (= e!214623 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!434985) (= fromSlice!52 toSlice!52) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 lt!434985))))))

(assert (= (and start!66896 res!246821) b!299059))

(assert (= (and b!299059 res!246820) b!299060))

(assert (= (and b!299060 res!246819) b!299061))

(declare-fun m!438313 () Bool)

(assert (=> start!66896 m!438313))

(declare-fun m!438315 () Bool)

(assert (=> start!66896 m!438315))

(declare-fun m!438317 () Bool)

(assert (=> b!299060 m!438317))

(push 1)

(assert (not start!66896))

(assert (not b!299060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

