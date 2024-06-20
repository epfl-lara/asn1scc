; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67342 () Bool)

(assert start!67342)

(declare-fun res!248883 () Bool)

(declare-fun e!217365 () Bool)

(assert (=> start!67342 (=> (not res!248883) (not e!217365))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18342 0))(
  ( (array!18343 (arr!9048 (Array (_ BitVec 32) (_ BitVec 8))) (size!7965 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18342)

(declare-fun a2!948 () array!18342)

(assert (=> start!67342 (= res!248883 (and (bvsle (size!7965 a1!948) (size!7965 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67342 e!217365))

(assert (=> start!67342 true))

(declare-fun array_inv!7577 (array!18342) Bool)

(assert (=> start!67342 (array_inv!7577 a1!948)))

(assert (=> start!67342 (array_inv!7577 a2!948)))

(declare-fun b!302423 () Bool)

(declare-fun e!217366 () Bool)

(assert (=> b!302423 (= e!217365 e!217366)))

(declare-fun res!248881 () Bool)

(assert (=> b!302423 (=> (not res!248881) (not e!217366))))

(declare-fun lt!437256 () (_ BitVec 64))

(assert (=> b!302423 (= res!248881 (and (bvsle toBit!258 lt!437256) (bvsle fromBit!258 lt!437256)))))

(assert (=> b!302423 (= lt!437256 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7965 a1!948))))))

(declare-fun b!302424 () Bool)

(declare-fun res!248882 () Bool)

(assert (=> b!302424 (=> (not res!248882) (not e!217366))))

(declare-fun arrayBitRangesEq!0 (array!18342 array!18342 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302424 (= res!248882 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302425 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302425 (= e!217366 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437256) (not (= fromSlice!52 toSlice!52)) (bvsge (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!67342 res!248883) b!302423))

(assert (= (and b!302423 res!248881) b!302424))

(assert (= (and b!302424 res!248882) b!302425))

(declare-fun m!441285 () Bool)

(assert (=> start!67342 m!441285))

(declare-fun m!441287 () Bool)

(assert (=> start!67342 m!441287))

(declare-fun m!441289 () Bool)

(assert (=> b!302424 m!441289))

(push 1)

(assert (not b!302424))

(assert (not start!67342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

