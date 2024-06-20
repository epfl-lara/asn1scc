; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70132 () Bool)

(assert start!70132)

(declare-fun res!260387 () Bool)

(declare-fun e!227978 () Bool)

(assert (=> start!70132 (=> (not res!260387) (not e!227978))))

(declare-datatypes ((array!19630 0))(
  ( (array!19631 (arr!9622 (Array (_ BitVec 32) (_ BitVec 8))) (size!8536 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19630)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19630)

(assert (=> start!70132 (= res!260387 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8536 a1!748) (size!8536 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8536 a1!748))))))))

(assert (=> start!70132 e!227978))

(assert (=> start!70132 true))

(declare-fun array_inv!8088 (array!19630) Bool)

(assert (=> start!70132 (array_inv!8088 a2!748)))

(assert (=> start!70132 (array_inv!8088 a1!748)))

(declare-fun b!317302 () Bool)

(declare-fun res!260384 () Bool)

(assert (=> b!317302 (=> (not res!260384) (not e!227978))))

(declare-fun arrayBitRangesEq!0 (array!19630 array!19630 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317302 (= res!260384 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317303 () Bool)

(declare-fun res!260383 () Bool)

(assert (=> b!317303 (=> (not res!260383) (not e!227978))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317303 (= res!260383 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317304 () Bool)

(declare-fun res!260382 () Bool)

(assert (=> b!317304 (=> (not res!260382) (not e!227978))))

(assert (=> b!317304 (= res!260382 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317305 () Bool)

(declare-fun res!260386 () Bool)

(assert (=> b!317305 (=> (not res!260386) (not e!227978))))

(assert (=> b!317305 (= res!260386 (not (= i!999 from!855)))))

(declare-fun b!317306 () Bool)

(declare-fun res!260385 () Bool)

(assert (=> b!317306 (=> (not res!260385) (not e!227978))))

(declare-fun bitAt!0 (array!19630 (_ BitVec 64)) Bool)

(assert (=> b!317306 (= res!260385 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317307 () Bool)

(assert (=> b!317307 (= e!227978 (not true))))

(assert (=> b!317307 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21785 0))(
  ( (Unit!21786) )
))
(declare-fun lt!443137 () Unit!21785)

(declare-fun arrayBitRangesEqPrepend!0 (array!19630 array!19630 (_ BitVec 64) (_ BitVec 64)) Unit!21785)

(assert (=> b!317307 (= lt!443137 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!317307 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443138 () Unit!21785)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19630 array!19630 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21785)

(assert (=> b!317307 (= lt!443138 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(assert (= (and start!70132 res!260387) b!317302))

(assert (= (and b!317302 res!260384) b!317306))

(assert (= (and b!317306 res!260385) b!317304))

(assert (= (and b!317304 res!260382) b!317303))

(assert (= (and b!317303 res!260383) b!317305))

(assert (= (and b!317305 res!260386) b!317307))

(declare-fun m!455309 () Bool)

(assert (=> b!317303 m!455309))

(declare-fun m!455311 () Bool)

(assert (=> b!317302 m!455311))

(declare-fun m!455313 () Bool)

(assert (=> b!317307 m!455313))

(declare-fun m!455315 () Bool)

(assert (=> b!317307 m!455315))

(declare-fun m!455317 () Bool)

(assert (=> b!317307 m!455317))

(declare-fun m!455319 () Bool)

(assert (=> b!317307 m!455319))

(declare-fun m!455321 () Bool)

(assert (=> b!317307 m!455321))

(declare-fun m!455323 () Bool)

(assert (=> b!317306 m!455323))

(declare-fun m!455325 () Bool)

(assert (=> b!317306 m!455325))

(declare-fun m!455327 () Bool)

(assert (=> start!70132 m!455327))

(declare-fun m!455329 () Bool)

(assert (=> start!70132 m!455329))

(push 1)

(assert (not b!317302))

(assert (not b!317306))

(assert (not start!70132))

(assert (not b!317303))

(assert (not b!317307))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

