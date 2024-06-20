; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66904 () Bool)

(assert start!66904)

(declare-fun res!246855 () Bool)

(declare-fun e!214674 () Bool)

(assert (=> start!66904 (=> (not res!246855) (not e!214674))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18131 0))(
  ( (array!18132 (arr!8953 (Array (_ BitVec 32) (_ BitVec 8))) (size!7870 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18131)

(declare-fun a2!948 () array!18131)

(assert (=> start!66904 (= res!246855 (and (bvsle (size!7870 a1!948) (size!7870 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66904 e!214674))

(assert (=> start!66904 true))

(declare-fun array_inv!7482 (array!18131) Bool)

(assert (=> start!66904 (array_inv!7482 a1!948)))

(assert (=> start!66904 (array_inv!7482 a2!948)))

(declare-fun b!299095 () Bool)

(declare-fun e!214673 () Bool)

(assert (=> b!299095 (= e!214674 e!214673)))

(declare-fun res!246856 () Bool)

(assert (=> b!299095 (=> (not res!246856) (not e!214673))))

(declare-fun lt!434997 () (_ BitVec 64))

(assert (=> b!299095 (= res!246856 (and (bvsle toBit!258 lt!434997) (bvsle fromBit!258 lt!434997)))))

(assert (=> b!299095 (= lt!434997 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7870 a1!948))))))

(declare-fun b!299096 () Bool)

(declare-fun res!246857 () Bool)

(assert (=> b!299096 (=> (not res!246857) (not e!214673))))

(declare-fun arrayBitRangesEq!0 (array!18131 array!18131 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299096 (= res!246857 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299097 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299097 (= e!214673 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!434997) (not (= fromSlice!52 toSlice!52)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 #b0000000000000000000000000000001111111111111111111111111111111000))))))

(assert (= (and start!66904 res!246855) b!299095))

(assert (= (and b!299095 res!246856) b!299096))

(assert (= (and b!299096 res!246857) b!299097))

(declare-fun m!438337 () Bool)

(assert (=> start!66904 m!438337))

(declare-fun m!438339 () Bool)

(assert (=> start!66904 m!438339))

(declare-fun m!438341 () Bool)

(assert (=> b!299096 m!438341))

(push 1)

(assert (not b!299096))

(assert (not start!66904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

