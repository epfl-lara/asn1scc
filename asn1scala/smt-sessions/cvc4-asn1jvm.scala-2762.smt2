; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66908 () Bool)

(assert start!66908)

(declare-fun res!246874 () Bool)

(declare-fun e!214698 () Bool)

(assert (=> start!66908 (=> (not res!246874) (not e!214698))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18135 0))(
  ( (array!18136 (arr!8955 (Array (_ BitVec 32) (_ BitVec 8))) (size!7872 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18135)

(declare-fun a2!948 () array!18135)

(assert (=> start!66908 (= res!246874 (and (bvsle (size!7872 a1!948) (size!7872 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66908 e!214698))

(assert (=> start!66908 true))

(declare-fun array_inv!7484 (array!18135) Bool)

(assert (=> start!66908 (array_inv!7484 a1!948)))

(assert (=> start!66908 (array_inv!7484 a2!948)))

(declare-fun b!299113 () Bool)

(declare-fun e!214696 () Bool)

(assert (=> b!299113 (= e!214698 e!214696)))

(declare-fun res!246875 () Bool)

(assert (=> b!299113 (=> (not res!246875) (not e!214696))))

(declare-fun lt!435003 () (_ BitVec 64))

(assert (=> b!299113 (= res!246875 (and (bvsle toBit!258 lt!435003) (bvsle fromBit!258 lt!435003)))))

(assert (=> b!299113 (= lt!435003 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7872 a1!948))))))

(declare-fun b!299114 () Bool)

(declare-fun res!246873 () Bool)

(assert (=> b!299114 (=> (not res!246873) (not e!214696))))

(declare-fun arrayBitRangesEq!0 (array!18135 array!18135 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299114 (= res!246873 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299115 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299115 (= e!214696 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435003) (not (= fromSlice!52 toSlice!52)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 #b0000000000000000000000000000001111111111111111111111111111111000))))))

(assert (= (and start!66908 res!246874) b!299113))

(assert (= (and b!299113 res!246875) b!299114))

(assert (= (and b!299114 res!246873) b!299115))

(declare-fun m!438349 () Bool)

(assert (=> start!66908 m!438349))

(declare-fun m!438351 () Bool)

(assert (=> start!66908 m!438351))

(declare-fun m!438353 () Bool)

(assert (=> b!299114 m!438353))

(push 1)

(assert (not start!66908))

(assert (not b!299114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

