; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70238 () Bool)

(assert start!70238)

(declare-fun b!318202 () Bool)

(declare-fun res!261284 () Bool)

(declare-fun e!228475 () Bool)

(assert (=> b!318202 (=> (not res!261284) (not e!228475))))

(declare-fun i!999 () (_ BitVec 64))

(declare-datatypes ((array!19736 0))(
  ( (array!19737 (arr!9675 (Array (_ BitVec 32) (_ BitVec 8))) (size!8589 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19736)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19736)

(declare-fun arrayBitRangesEq!0 (array!19736 array!19736 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318202 (= res!261284 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318203 () Bool)

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!318203 (= e!228475 (not (and (bvsle from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))))

(assert (=> b!318203 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21849 0))(
  ( (Unit!21850) )
))
(declare-fun lt!443294 () Unit!21849)

(declare-fun arrayBitRangesEqPrepend!0 (array!19736 array!19736 (_ BitVec 64) (_ BitVec 64)) Unit!21849)

(assert (=> b!318203 (= lt!443294 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19736 (_ BitVec 64)) Bool)

(assert (=> b!318203 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443293 () Unit!21849)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19736 array!19736 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21849)

(assert (=> b!318203 (= lt!443293 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318204 () Bool)

(declare-fun res!261285 () Bool)

(assert (=> b!318204 (=> (not res!261285) (not e!228475))))

(assert (=> b!318204 (= res!261285 (not (= i!999 from!855)))))

(declare-fun b!318205 () Bool)

(declare-fun res!261286 () Bool)

(assert (=> b!318205 (=> (not res!261286) (not e!228475))))

(assert (=> b!318205 (= res!261286 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318206 () Bool)

(declare-fun res!261282 () Bool)

(assert (=> b!318206 (=> (not res!261282) (not e!228475))))

(assert (=> b!318206 (= res!261282 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!261287 () Bool)

(assert (=> start!70238 (=> (not res!261287) (not e!228475))))

(assert (=> start!70238 (= res!261287 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8589 a1!748) (size!8589 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8589 a1!748))))))))

(assert (=> start!70238 e!228475))

(assert (=> start!70238 true))

(declare-fun array_inv!8141 (array!19736) Bool)

(assert (=> start!70238 (array_inv!8141 a2!748)))

(assert (=> start!70238 (array_inv!8141 a1!748)))

(declare-fun b!318207 () Bool)

(declare-fun res!261283 () Bool)

(assert (=> b!318207 (=> (not res!261283) (not e!228475))))

(assert (=> b!318207 (= res!261283 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70238 res!261287) b!318206))

(assert (= (and b!318206 res!261282) b!318207))

(assert (= (and b!318207 res!261283) b!318205))

(assert (= (and b!318205 res!261286) b!318202))

(assert (= (and b!318202 res!261284) b!318204))

(assert (= (and b!318204 res!261285) b!318203))

(declare-fun m!456217 () Bool)

(assert (=> b!318203 m!456217))

(declare-fun m!456219 () Bool)

(assert (=> b!318203 m!456219))

(declare-fun m!456221 () Bool)

(assert (=> b!318203 m!456221))

(declare-fun m!456223 () Bool)

(assert (=> b!318203 m!456223))

(declare-fun m!456225 () Bool)

(assert (=> b!318203 m!456225))

(declare-fun m!456227 () Bool)

(assert (=> b!318206 m!456227))

(declare-fun m!456229 () Bool)

(assert (=> b!318202 m!456229))

(declare-fun m!456231 () Bool)

(assert (=> b!318207 m!456231))

(declare-fun m!456233 () Bool)

(assert (=> b!318207 m!456233))

(declare-fun m!456235 () Bool)

(assert (=> start!70238 m!456235))

(declare-fun m!456237 () Bool)

(assert (=> start!70238 m!456237))

(push 1)

(assert (not b!318203))

(assert (not b!318202))

(assert (not b!318206))

(assert (not b!318207))

(assert (not start!70238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

