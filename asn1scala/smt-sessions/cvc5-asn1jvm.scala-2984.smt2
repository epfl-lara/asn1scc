; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70138 () Bool)

(assert start!70138)

(declare-fun b!317358 () Bool)

(declare-fun res!260442 () Bool)

(declare-fun e!228010 () Bool)

(assert (=> b!317358 (=> (not res!260442) (not e!228010))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!317358 (= res!260442 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!260438 () Bool)

(assert (=> start!70138 (=> (not res!260438) (not e!228010))))

(declare-datatypes ((array!19636 0))(
  ( (array!19637 (arr!9625 (Array (_ BitVec 32) (_ BitVec 8))) (size!8539 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19636)

(declare-fun a1!748 () array!19636)

(assert (=> start!70138 (= res!260438 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8539 a1!748) (size!8539 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8539 a1!748))))))))

(assert (=> start!70138 e!228010))

(assert (=> start!70138 true))

(declare-fun array_inv!8091 (array!19636) Bool)

(assert (=> start!70138 (array_inv!8091 a2!748)))

(assert (=> start!70138 (array_inv!8091 a1!748)))

(declare-fun b!317359 () Bool)

(declare-fun res!260440 () Bool)

(assert (=> b!317359 (=> (not res!260440) (not e!228010))))

(declare-fun arrayBitRangesEq!0 (array!19636 array!19636 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317359 (= res!260440 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317360 () Bool)

(declare-fun res!260439 () Bool)

(assert (=> b!317360 (=> (not res!260439) (not e!228010))))

(assert (=> b!317360 (= res!260439 (not (= i!999 from!855)))))

(declare-fun b!317361 () Bool)

(declare-fun res!260441 () Bool)

(assert (=> b!317361 (=> (not res!260441) (not e!228010))))

(assert (=> b!317361 (= res!260441 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317362 () Bool)

(declare-fun res!260443 () Bool)

(assert (=> b!317362 (=> (not res!260443) (not e!228010))))

(declare-fun bitAt!0 (array!19636 (_ BitVec 64)) Bool)

(assert (=> b!317362 (= res!260443 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317363 () Bool)

(declare-fun e!228008 () Bool)

(assert (=> b!317363 (= e!228010 (not e!228008))))

(declare-fun res!260444 () Bool)

(assert (=> b!317363 (=> res!260444 e!228008)))

(assert (=> b!317363 (= res!260444 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(assert (=> b!317363 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21791 0))(
  ( (Unit!21792) )
))
(declare-fun lt!443159 () Unit!21791)

(declare-fun arrayBitRangesEqPrepend!0 (array!19636 array!19636 (_ BitVec 64) (_ BitVec 64)) Unit!21791)

(assert (=> b!317363 (= lt!443159 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!317363 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443157 () Unit!21791)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19636 array!19636 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21791)

(assert (=> b!317363 (= lt!443157 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317364 () Bool)

(assert (=> b!317364 (= e!228008 true)))

(assert (=> b!317364 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443158 () Unit!21791)

(declare-fun rec!18 (array!19636 array!19636 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21791)

(assert (=> b!317364 (= lt!443158 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!70138 res!260438) b!317361))

(assert (= (and b!317361 res!260441) b!317362))

(assert (= (and b!317362 res!260443) b!317358))

(assert (= (and b!317358 res!260442) b!317359))

(assert (= (and b!317359 res!260440) b!317360))

(assert (= (and b!317360 res!260439) b!317363))

(assert (= (and b!317363 (not res!260444)) b!317364))

(declare-fun m!455375 () Bool)

(assert (=> b!317363 m!455375))

(declare-fun m!455377 () Bool)

(assert (=> b!317363 m!455377))

(declare-fun m!455379 () Bool)

(assert (=> b!317363 m!455379))

(declare-fun m!455381 () Bool)

(assert (=> b!317363 m!455381))

(declare-fun m!455383 () Bool)

(assert (=> b!317363 m!455383))

(declare-fun m!455385 () Bool)

(assert (=> b!317359 m!455385))

(declare-fun m!455387 () Bool)

(assert (=> start!70138 m!455387))

(declare-fun m!455389 () Bool)

(assert (=> start!70138 m!455389))

(declare-fun m!455391 () Bool)

(assert (=> b!317364 m!455391))

(declare-fun m!455393 () Bool)

(assert (=> b!317364 m!455393))

(declare-fun m!455395 () Bool)

(assert (=> b!317362 m!455395))

(declare-fun m!455397 () Bool)

(assert (=> b!317362 m!455397))

(declare-fun m!455399 () Bool)

(assert (=> b!317361 m!455399))

(push 1)

(assert (not start!70138))

(assert (not b!317364))

(assert (not b!317363))

(assert (not b!317361))

(assert (not b!317362))

(assert (not b!317359))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

