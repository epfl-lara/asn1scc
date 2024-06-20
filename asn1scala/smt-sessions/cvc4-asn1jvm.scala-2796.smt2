; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67360 () Bool)

(assert start!67360)

(declare-fun res!248963 () Bool)

(declare-fun e!217474 () Bool)

(assert (=> start!67360 (=> (not res!248963) (not e!217474))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18360 0))(
  ( (array!18361 (arr!9057 (Array (_ BitVec 32) (_ BitVec 8))) (size!7974 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18360)

(declare-fun a2!948 () array!18360)

(assert (=> start!67360 (= res!248963 (and (bvsle (size!7974 a1!948) (size!7974 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67360 e!217474))

(assert (=> start!67360 true))

(declare-fun array_inv!7586 (array!18360) Bool)

(assert (=> start!67360 (array_inv!7586 a1!948)))

(assert (=> start!67360 (array_inv!7586 a2!948)))

(declare-fun b!302504 () Bool)

(declare-fun e!217473 () Bool)

(assert (=> b!302504 (= e!217474 e!217473)))

(declare-fun res!248964 () Bool)

(assert (=> b!302504 (=> (not res!248964) (not e!217473))))

(declare-fun lt!437283 () (_ BitVec 64))

(assert (=> b!302504 (= res!248964 (and (bvsle toBit!258 lt!437283) (bvsle fromBit!258 lt!437283)))))

(assert (=> b!302504 (= lt!437283 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7974 a1!948))))))

(declare-fun b!302505 () Bool)

(declare-fun res!248962 () Bool)

(assert (=> b!302505 (=> (not res!248962) (not e!217473))))

(declare-fun arrayBitRangesEq!0 (array!18360 array!18360 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302505 (= res!248962 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302506 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302506 (= e!217473 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437283) (not (= fromSlice!52 toSlice!52)) (bvslt (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!67360 res!248963) b!302504))

(assert (= (and b!302504 res!248964) b!302505))

(assert (= (and b!302505 res!248962) b!302506))

(declare-fun m!441339 () Bool)

(assert (=> start!67360 m!441339))

(declare-fun m!441341 () Bool)

(assert (=> start!67360 m!441341))

(declare-fun m!441343 () Bool)

(assert (=> b!302505 m!441343))

(push 1)

(assert (not start!67360))

(assert (not b!302505))

(check-sat)

(pop 1)

(push 1)

(check-sat)

