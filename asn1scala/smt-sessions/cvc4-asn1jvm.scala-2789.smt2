; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67306 () Bool)

(assert start!67306)

(declare-fun res!248704 () Bool)

(declare-fun e!217148 () Bool)

(assert (=> start!67306 (=> (not res!248704) (not e!217148))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18315 0))(
  ( (array!18316 (arr!9036 (Array (_ BitVec 32) (_ BitVec 8))) (size!7953 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18315)

(declare-fun a2!948 () array!18315)

(assert (=> start!67306 (= res!248704 (and (bvsle (size!7953 a1!948) (size!7953 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67306 e!217148))

(assert (=> start!67306 true))

(declare-fun array_inv!7565 (array!18315) Bool)

(assert (=> start!67306 (array_inv!7565 a1!948)))

(assert (=> start!67306 (array_inv!7565 a2!948)))

(declare-fun b!302222 () Bool)

(declare-fun e!217149 () Bool)

(assert (=> b!302222 (= e!217148 e!217149)))

(declare-fun res!248706 () Bool)

(assert (=> b!302222 (=> (not res!248706) (not e!217149))))

(declare-fun lt!437184 () (_ BitVec 64))

(assert (=> b!302222 (= res!248706 (and (bvsle toBit!258 lt!437184) (bvsle fromBit!258 lt!437184)))))

(assert (=> b!302222 (= lt!437184 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7953 a1!948))))))

(declare-fun b!302223 () Bool)

(declare-fun res!248705 () Bool)

(assert (=> b!302223 (=> (not res!248705) (not e!217149))))

(declare-fun arrayBitRangesEq!0 (array!18315 array!18315 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302223 (= res!248705 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302224 () Bool)

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!302224 (= e!217149 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (not (= ((_ sign_extend 32) (size!7953 a1!948)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!437184 ((_ sign_extend 32) (size!7953 a1!948)))))))))

(assert (= (and start!67306 res!248704) b!302222))

(assert (= (and b!302222 res!248706) b!302223))

(assert (= (and b!302223 res!248705) b!302224))

(declare-fun m!441111 () Bool)

(assert (=> start!67306 m!441111))

(declare-fun m!441113 () Bool)

(assert (=> start!67306 m!441113))

(declare-fun m!441115 () Bool)

(assert (=> b!302223 m!441115))

(push 1)

(assert (not start!67306))

(assert (not b!302223))

(check-sat)

(pop 1)

(push 1)

(check-sat)

