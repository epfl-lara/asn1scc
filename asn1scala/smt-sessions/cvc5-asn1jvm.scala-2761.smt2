; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66898 () Bool)

(assert start!66898)

(declare-fun res!246829 () Bool)

(declare-fun e!214636 () Bool)

(assert (=> start!66898 (=> (not res!246829) (not e!214636))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18125 0))(
  ( (array!18126 (arr!8950 (Array (_ BitVec 32) (_ BitVec 8))) (size!7867 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18125)

(declare-fun a2!948 () array!18125)

(assert (=> start!66898 (= res!246829 (and (bvsle (size!7867 a1!948) (size!7867 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66898 e!214636))

(assert (=> start!66898 true))

(declare-fun array_inv!7479 (array!18125) Bool)

(assert (=> start!66898 (array_inv!7479 a1!948)))

(assert (=> start!66898 (array_inv!7479 a2!948)))

(declare-fun b!299068 () Bool)

(declare-fun e!214637 () Bool)

(assert (=> b!299068 (= e!214636 e!214637)))

(declare-fun res!246830 () Bool)

(assert (=> b!299068 (=> (not res!246830) (not e!214637))))

(declare-fun lt!434988 () (_ BitVec 64))

(assert (=> b!299068 (= res!246830 (and (bvsle toBit!258 lt!434988) (bvsle fromBit!258 lt!434988)))))

(assert (=> b!299068 (= lt!434988 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7867 a1!948))))))

(declare-fun b!299069 () Bool)

(declare-fun res!246828 () Bool)

(assert (=> b!299069 (=> (not res!246828) (not e!214637))))

(declare-fun arrayBitRangesEq!0 (array!18125 array!18125 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299069 (= res!246828 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299070 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299070 (= e!214637 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!434988) (not (= fromSlice!52 toSlice!52)) (bvsgt toBit!258 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (= (and start!66898 res!246829) b!299068))

(assert (= (and b!299068 res!246830) b!299069))

(assert (= (and b!299069 res!246828) b!299070))

(declare-fun m!438319 () Bool)

(assert (=> start!66898 m!438319))

(declare-fun m!438321 () Bool)

(assert (=> start!66898 m!438321))

(declare-fun m!438323 () Bool)

(assert (=> b!299069 m!438323))

(push 1)

(assert (not b!299069))

(assert (not start!66898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

