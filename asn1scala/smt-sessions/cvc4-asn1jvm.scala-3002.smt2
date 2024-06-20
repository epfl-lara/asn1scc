; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70250 () Bool)

(assert start!70250)

(declare-fun b!318310 () Bool)

(declare-fun res!261391 () Bool)

(declare-fun e!228527 () Bool)

(assert (=> b!318310 (=> (not res!261391) (not e!228527))))

(declare-datatypes ((array!19748 0))(
  ( (array!19749 (arr!9681 (Array (_ BitVec 32) (_ BitVec 8))) (size!8595 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19748)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19748)

(declare-fun bitAt!0 (array!19748 (_ BitVec 64)) Bool)

(assert (=> b!318310 (= res!261391 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318311 () Bool)

(declare-fun res!261395 () Bool)

(assert (=> b!318311 (=> (not res!261395) (not e!228527))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19748 array!19748 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318311 (= res!261395 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318312 () Bool)

(declare-fun res!261390 () Bool)

(assert (=> b!318312 (=> (not res!261390) (not e!228527))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!318312 (= res!261390 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318313 () Bool)

(declare-fun res!261394 () Bool)

(assert (=> b!318313 (=> (not res!261394) (not e!228527))))

(assert (=> b!318313 (= res!261394 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!261392 () Bool)

(assert (=> start!70250 (=> (not res!261392) (not e!228527))))

(assert (=> start!70250 (= res!261392 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8595 a1!748) (size!8595 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8595 a1!748))))))))

(assert (=> start!70250 e!228527))

(assert (=> start!70250 true))

(declare-fun array_inv!8147 (array!19748) Bool)

(assert (=> start!70250 (array_inv!8147 a2!748)))

(assert (=> start!70250 (array_inv!8147 a1!748)))

(declare-fun b!318314 () Bool)

(assert (=> b!318314 (= e!228527 (not (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822) (bvslt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) i!999))))))

(assert (=> b!318314 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21861 0))(
  ( (Unit!21862) )
))
(declare-fun lt!443329 () Unit!21861)

(declare-fun arrayBitRangesEqPrepend!0 (array!19748 array!19748 (_ BitVec 64) (_ BitVec 64)) Unit!21861)

(assert (=> b!318314 (= lt!443329 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!318314 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443330 () Unit!21861)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19748 array!19748 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21861)

(assert (=> b!318314 (= lt!443330 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318315 () Bool)

(declare-fun res!261393 () Bool)

(assert (=> b!318315 (=> (not res!261393) (not e!228527))))

(assert (=> b!318315 (= res!261393 (not (= i!999 from!855)))))

(assert (= (and start!70250 res!261392) b!318311))

(assert (= (and b!318311 res!261395) b!318310))

(assert (= (and b!318310 res!261391) b!318313))

(assert (= (and b!318313 res!261394) b!318312))

(assert (= (and b!318312 res!261390) b!318315))

(assert (= (and b!318315 res!261393) b!318314))

(declare-fun m!456349 () Bool)

(assert (=> start!70250 m!456349))

(declare-fun m!456351 () Bool)

(assert (=> start!70250 m!456351))

(declare-fun m!456353 () Bool)

(assert (=> b!318314 m!456353))

(declare-fun m!456355 () Bool)

(assert (=> b!318314 m!456355))

(declare-fun m!456357 () Bool)

(assert (=> b!318314 m!456357))

(declare-fun m!456359 () Bool)

(assert (=> b!318314 m!456359))

(declare-fun m!456361 () Bool)

(assert (=> b!318314 m!456361))

(declare-fun m!456363 () Bool)

(assert (=> b!318312 m!456363))

(declare-fun m!456365 () Bool)

(assert (=> b!318311 m!456365))

(declare-fun m!456367 () Bool)

(assert (=> b!318310 m!456367))

(declare-fun m!456369 () Bool)

(assert (=> b!318310 m!456369))

(push 1)

(assert (not b!318311))

(assert (not b!318314))

(assert (not b!318312))

(assert (not start!70250))

(assert (not b!318310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

