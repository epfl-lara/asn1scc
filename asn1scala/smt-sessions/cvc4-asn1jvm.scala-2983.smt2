; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70136 () Bool)

(assert start!70136)

(declare-fun b!317338 () Bool)

(declare-fun res!260420 () Bool)

(declare-fun e!227997 () Bool)

(assert (=> b!317338 (=> (not res!260420) (not e!227997))))

(declare-datatypes ((array!19634 0))(
  ( (array!19635 (arr!9624 (Array (_ BitVec 32) (_ BitVec 8))) (size!8538 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19634)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19634)

(declare-fun bitAt!0 (array!19634 (_ BitVec 64)) Bool)

(assert (=> b!317338 (= res!260420 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317339 () Bool)

(declare-fun res!260423 () Bool)

(assert (=> b!317339 (=> (not res!260423) (not e!227997))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317339 (= res!260423 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317340 () Bool)

(declare-fun res!260422 () Bool)

(assert (=> b!317340 (=> (not res!260422) (not e!227997))))

(assert (=> b!317340 (= res!260422 (not (= i!999 from!855)))))

(declare-fun b!317341 () Bool)

(declare-fun res!260421 () Bool)

(assert (=> b!317341 (=> (not res!260421) (not e!227997))))

(declare-fun arrayBitRangesEq!0 (array!19634 array!19634 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317341 (= res!260421 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317342 () Bool)

(declare-fun res!260419 () Bool)

(assert (=> b!317342 (=> (not res!260419) (not e!227997))))

(assert (=> b!317342 (= res!260419 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!260418 () Bool)

(assert (=> start!70136 (=> (not res!260418) (not e!227997))))

(assert (=> start!70136 (= res!260418 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8538 a1!748) (size!8538 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8538 a1!748))))))))

(assert (=> start!70136 e!227997))

(assert (=> start!70136 true))

(declare-fun array_inv!8090 (array!19634) Bool)

(assert (=> start!70136 (array_inv!8090 a2!748)))

(assert (=> start!70136 (array_inv!8090 a1!748)))

(declare-fun b!317343 () Bool)

(assert (=> b!317343 (= e!227997 (not true))))

(assert (=> b!317343 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21789 0))(
  ( (Unit!21790) )
))
(declare-fun lt!443149 () Unit!21789)

(declare-fun arrayBitRangesEqPrepend!0 (array!19634 array!19634 (_ BitVec 64) (_ BitVec 64)) Unit!21789)

(assert (=> b!317343 (= lt!443149 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!317343 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443150 () Unit!21789)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19634 array!19634 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21789)

(assert (=> b!317343 (= lt!443150 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(assert (= (and start!70136 res!260418) b!317341))

(assert (= (and b!317341 res!260421) b!317338))

(assert (= (and b!317338 res!260420) b!317339))

(assert (= (and b!317339 res!260423) b!317342))

(assert (= (and b!317342 res!260419) b!317340))

(assert (= (and b!317340 res!260422) b!317343))

(declare-fun m!455353 () Bool)

(assert (=> b!317338 m!455353))

(declare-fun m!455355 () Bool)

(assert (=> b!317338 m!455355))

(declare-fun m!455357 () Bool)

(assert (=> b!317342 m!455357))

(declare-fun m!455359 () Bool)

(assert (=> b!317341 m!455359))

(declare-fun m!455361 () Bool)

(assert (=> start!70136 m!455361))

(declare-fun m!455363 () Bool)

(assert (=> start!70136 m!455363))

(declare-fun m!455365 () Bool)

(assert (=> b!317343 m!455365))

(declare-fun m!455367 () Bool)

(assert (=> b!317343 m!455367))

(declare-fun m!455369 () Bool)

(assert (=> b!317343 m!455369))

(declare-fun m!455371 () Bool)

(assert (=> b!317343 m!455371))

(declare-fun m!455373 () Bool)

(assert (=> b!317343 m!455373))

(push 1)

(assert (not b!317343))

(assert (not b!317342))

(assert (not b!317338))

