; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67326 () Bool)

(assert start!67326)

(declare-fun res!248810 () Bool)

(declare-fun e!217268 () Bool)

(assert (=> start!67326 (=> (not res!248810) (not e!217268))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18326 0))(
  ( (array!18327 (arr!9040 (Array (_ BitVec 32) (_ BitVec 8))) (size!7957 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18326)

(declare-fun a2!948 () array!18326)

(assert (=> start!67326 (= res!248810 (and (bvsle (size!7957 a1!948) (size!7957 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67326 e!217268))

(assert (=> start!67326 true))

(declare-fun array_inv!7569 (array!18326) Bool)

(assert (=> start!67326 (array_inv!7569 a1!948)))

(assert (=> start!67326 (array_inv!7569 a2!948)))

(declare-fun b!302351 () Bool)

(declare-fun e!217269 () Bool)

(assert (=> b!302351 (= e!217268 e!217269)))

(declare-fun res!248811 () Bool)

(assert (=> b!302351 (=> (not res!248811) (not e!217269))))

(declare-fun lt!437232 () (_ BitVec 64))

(assert (=> b!302351 (= res!248811 (and (bvsle toBit!258 lt!437232) (bvsle fromBit!258 lt!437232)))))

(assert (=> b!302351 (= lt!437232 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7957 a1!948))))))

(declare-fun b!302352 () Bool)

(declare-fun res!248809 () Bool)

(assert (=> b!302352 (=> (not res!248809) (not e!217269))))

(declare-fun arrayBitRangesEq!0 (array!18326 array!18326 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302352 (= res!248809 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302353 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302353 (= e!217269 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437232) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67326 res!248810) b!302351))

(assert (= (and b!302351 res!248811) b!302352))

(assert (= (and b!302352 res!248809) b!302353))

(declare-fun m!441237 () Bool)

(assert (=> start!67326 m!441237))

(declare-fun m!441239 () Bool)

(assert (=> start!67326 m!441239))

(declare-fun m!441241 () Bool)

(assert (=> b!302352 m!441241))

(push 1)

(assert (not start!67326))

(assert (not b!302352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

