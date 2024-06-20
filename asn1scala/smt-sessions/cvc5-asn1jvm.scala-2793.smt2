; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67338 () Bool)

(assert start!67338)

(declare-fun res!248863 () Bool)

(declare-fun e!217342 () Bool)

(assert (=> start!67338 (=> (not res!248863) (not e!217342))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18338 0))(
  ( (array!18339 (arr!9046 (Array (_ BitVec 32) (_ BitVec 8))) (size!7963 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18338)

(declare-fun a2!948 () array!18338)

(assert (=> start!67338 (= res!248863 (and (bvsle (size!7963 a1!948) (size!7963 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67338 e!217342))

(assert (=> start!67338 true))

(declare-fun array_inv!7575 (array!18338) Bool)

(assert (=> start!67338 (array_inv!7575 a1!948)))

(assert (=> start!67338 (array_inv!7575 a2!948)))

(declare-fun b!302405 () Bool)

(declare-fun e!217339 () Bool)

(assert (=> b!302405 (= e!217342 e!217339)))

(declare-fun res!248864 () Bool)

(assert (=> b!302405 (=> (not res!248864) (not e!217339))))

(declare-fun lt!437250 () (_ BitVec 64))

(assert (=> b!302405 (= res!248864 (and (bvsle toBit!258 lt!437250) (bvsle fromBit!258 lt!437250)))))

(assert (=> b!302405 (= lt!437250 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7963 a1!948))))))

(declare-fun b!302406 () Bool)

(declare-fun res!248865 () Bool)

(assert (=> b!302406 (=> (not res!248865) (not e!217339))))

(declare-fun arrayBitRangesEq!0 (array!18338 array!18338 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302406 (= res!248865 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302407 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302407 (= e!217339 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437250) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67338 res!248863) b!302405))

(assert (= (and b!302405 res!248864) b!302406))

(assert (= (and b!302406 res!248865) b!302407))

(declare-fun m!441273 () Bool)

(assert (=> start!67338 m!441273))

(declare-fun m!441275 () Bool)

(assert (=> start!67338 m!441275))

(declare-fun m!441277 () Bool)

(assert (=> b!302406 m!441277))

(push 1)

(assert (not start!67338))

(assert (not b!302406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

