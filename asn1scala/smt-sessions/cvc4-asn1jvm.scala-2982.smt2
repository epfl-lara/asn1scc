; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70130 () Bool)

(assert start!70130)

(declare-fun b!317284 () Bool)

(declare-fun res!260366 () Bool)

(declare-fun e!227969 () Bool)

(assert (=> b!317284 (=> (not res!260366) (not e!227969))))

(declare-datatypes ((array!19628 0))(
  ( (array!19629 (arr!9621 (Array (_ BitVec 32) (_ BitVec 8))) (size!8535 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19628)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19628)

(declare-fun bitAt!0 (array!19628 (_ BitVec 64)) Bool)

(assert (=> b!317284 (= res!260366 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317285 () Bool)

(declare-fun res!260369 () Bool)

(assert (=> b!317285 (=> (not res!260369) (not e!227969))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317285 (= res!260369 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317286 () Bool)

(declare-fun res!260364 () Bool)

(assert (=> b!317286 (=> (not res!260364) (not e!227969))))

(declare-fun arrayBitRangesEq!0 (array!19628 array!19628 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317286 (= res!260364 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317288 () Bool)

(declare-fun res!260367 () Bool)

(assert (=> b!317288 (=> (not res!260367) (not e!227969))))

(assert (=> b!317288 (= res!260367 (not (= i!999 from!855)))))

(declare-fun b!317289 () Bool)

(assert (=> b!317289 (= e!227969 (not true))))

(assert (=> b!317289 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21783 0))(
  ( (Unit!21784) )
))
(declare-fun lt!443132 () Unit!21783)

(declare-fun arrayBitRangesEqPrepend!0 (array!19628 array!19628 (_ BitVec 64) (_ BitVec 64)) Unit!21783)

(assert (=> b!317289 (= lt!443132 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!317289 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443131 () Unit!21783)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19628 array!19628 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21783)

(assert (=> b!317289 (= lt!443131 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun res!260365 () Bool)

(assert (=> start!70130 (=> (not res!260365) (not e!227969))))

(assert (=> start!70130 (= res!260365 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8535 a1!748) (size!8535 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8535 a1!748))))))))

(assert (=> start!70130 e!227969))

(assert (=> start!70130 true))

(declare-fun array_inv!8087 (array!19628) Bool)

(assert (=> start!70130 (array_inv!8087 a2!748)))

(assert (=> start!70130 (array_inv!8087 a1!748)))

(declare-fun b!317287 () Bool)

(declare-fun res!260368 () Bool)

(assert (=> b!317287 (=> (not res!260368) (not e!227969))))

(assert (=> b!317287 (= res!260368 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70130 res!260365) b!317287))

(assert (= (and b!317287 res!260368) b!317284))

(assert (= (and b!317284 res!260366) b!317285))

(assert (= (and b!317285 res!260369) b!317286))

(assert (= (and b!317286 res!260364) b!317288))

(assert (= (and b!317288 res!260367) b!317289))

(declare-fun m!455287 () Bool)

(assert (=> b!317287 m!455287))

(declare-fun m!455289 () Bool)

(assert (=> b!317286 m!455289))

(declare-fun m!455291 () Bool)

(assert (=> b!317284 m!455291))

(declare-fun m!455293 () Bool)

(assert (=> b!317284 m!455293))

(declare-fun m!455295 () Bool)

(assert (=> start!70130 m!455295))

(declare-fun m!455297 () Bool)

(assert (=> start!70130 m!455297))

(declare-fun m!455299 () Bool)

(assert (=> b!317289 m!455299))

(declare-fun m!455301 () Bool)

(assert (=> b!317289 m!455301))

(declare-fun m!455303 () Bool)

(assert (=> b!317289 m!455303))

(declare-fun m!455305 () Bool)

(assert (=> b!317289 m!455305))

(declare-fun m!455307 () Bool)

(assert (=> b!317289 m!455307))

(push 1)

(assert (not start!70130))

(assert (not b!317287))

(assert (not b!317289))

