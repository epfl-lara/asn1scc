; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67354 () Bool)

(assert start!67354)

(declare-fun res!248935 () Bool)

(declare-fun e!217435 () Bool)

(assert (=> start!67354 (=> (not res!248935) (not e!217435))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18354 0))(
  ( (array!18355 (arr!9054 (Array (_ BitVec 32) (_ BitVec 8))) (size!7971 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18354)

(declare-fun a2!948 () array!18354)

(assert (=> start!67354 (= res!248935 (and (bvsle (size!7971 a1!948) (size!7971 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67354 e!217435))

(assert (=> start!67354 true))

(declare-fun array_inv!7583 (array!18354) Bool)

(assert (=> start!67354 (array_inv!7583 a1!948)))

(assert (=> start!67354 (array_inv!7583 a2!948)))

(declare-fun b!302477 () Bool)

(declare-fun e!217438 () Bool)

(assert (=> b!302477 (= e!217435 e!217438)))

(declare-fun res!248937 () Bool)

(assert (=> b!302477 (=> (not res!248937) (not e!217438))))

(declare-fun lt!437274 () (_ BitVec 64))

(assert (=> b!302477 (= res!248937 (and (bvsle toBit!258 lt!437274) (bvsle fromBit!258 lt!437274)))))

(assert (=> b!302477 (= lt!437274 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7971 a1!948))))))

(declare-fun b!302478 () Bool)

(declare-fun res!248936 () Bool)

(assert (=> b!302478 (=> (not res!248936) (not e!217438))))

(declare-fun arrayBitRangesEq!0 (array!18354 array!18354 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302478 (= res!248936 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302479 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302479 (= e!217438 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437274) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67354 res!248935) b!302477))

(assert (= (and b!302477 res!248937) b!302478))

(assert (= (and b!302478 res!248936) b!302479))

(declare-fun m!441321 () Bool)

(assert (=> start!67354 m!441321))

(declare-fun m!441323 () Bool)

(assert (=> start!67354 m!441323))

(declare-fun m!441325 () Bool)

(assert (=> b!302478 m!441325))

(push 1)

(assert (not b!302478))

(assert (not start!67354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

