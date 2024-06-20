; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70140 () Bool)

(assert start!70140)

(declare-fun b!317379 () Bool)

(declare-fun res!260459 () Bool)

(declare-fun e!228019 () Bool)

(assert (=> b!317379 (=> (not res!260459) (not e!228019))))

(declare-datatypes ((array!19638 0))(
  ( (array!19639 (arr!9626 (Array (_ BitVec 32) (_ BitVec 8))) (size!8540 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19638)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19638)

(declare-fun bitAt!0 (array!19638 (_ BitVec 64)) Bool)

(assert (=> b!317379 (= res!260459 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317380 () Bool)

(declare-fun res!260462 () Bool)

(assert (=> b!317380 (=> (not res!260462) (not e!228019))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19638 array!19638 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317380 (= res!260462 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317381 () Bool)

(declare-fun res!260461 () Bool)

(assert (=> b!317381 (=> (not res!260461) (not e!228019))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317381 (= res!260461 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317382 () Bool)

(declare-fun e!228022 () Bool)

(assert (=> b!317382 (= e!228022 true)))

(assert (=> b!317382 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21793 0))(
  ( (Unit!21794) )
))
(declare-fun lt!443167 () Unit!21793)

(declare-fun rec!18 (array!19638 array!19638 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21793)

(assert (=> b!317382 (= lt!443167 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!260465 () Bool)

(assert (=> start!70140 (=> (not res!260465) (not e!228019))))

(assert (=> start!70140 (= res!260465 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8540 a1!748) (size!8540 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8540 a1!748))))))))

(assert (=> start!70140 e!228019))

(assert (=> start!70140 true))

(declare-fun array_inv!8092 (array!19638) Bool)

(assert (=> start!70140 (array_inv!8092 a2!748)))

(assert (=> start!70140 (array_inv!8092 a1!748)))

(declare-fun b!317383 () Bool)

(assert (=> b!317383 (= e!228019 (not e!228022))))

(declare-fun res!260463 () Bool)

(assert (=> b!317383 (=> res!260463 e!228022)))

(assert (=> b!317383 (= res!260463 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(assert (=> b!317383 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443168 () Unit!21793)

(declare-fun arrayBitRangesEqPrepend!0 (array!19638 array!19638 (_ BitVec 64) (_ BitVec 64)) Unit!21793)

(assert (=> b!317383 (= lt!443168 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!317383 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443166 () Unit!21793)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19638 array!19638 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21793)

(assert (=> b!317383 (= lt!443166 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317384 () Bool)

(declare-fun res!260460 () Bool)

(assert (=> b!317384 (=> (not res!260460) (not e!228019))))

(assert (=> b!317384 (= res!260460 (not (= i!999 from!855)))))

(declare-fun b!317385 () Bool)

(declare-fun res!260464 () Bool)

(assert (=> b!317385 (=> (not res!260464) (not e!228019))))

(assert (=> b!317385 (= res!260464 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(assert (= (and start!70140 res!260465) b!317381))

(assert (= (and b!317381 res!260461) b!317379))

(assert (= (and b!317379 res!260459) b!317385))

(assert (= (and b!317385 res!260464) b!317380))

(assert (= (and b!317380 res!260462) b!317384))

(assert (= (and b!317384 res!260460) b!317383))

(assert (= (and b!317383 (not res!260463)) b!317382))

(declare-fun m!455401 () Bool)

(assert (=> b!317381 m!455401))

(declare-fun m!455403 () Bool)

(assert (=> b!317382 m!455403))

(declare-fun m!455405 () Bool)

(assert (=> b!317382 m!455405))

(declare-fun m!455407 () Bool)

(assert (=> b!317383 m!455407))

(declare-fun m!455409 () Bool)

(assert (=> b!317383 m!455409))

(declare-fun m!455411 () Bool)

(assert (=> b!317383 m!455411))

(declare-fun m!455413 () Bool)

(assert (=> b!317383 m!455413))

(declare-fun m!455415 () Bool)

(assert (=> b!317383 m!455415))

(declare-fun m!455417 () Bool)

(assert (=> b!317380 m!455417))

(declare-fun m!455419 () Bool)

(assert (=> b!317379 m!455419))

(declare-fun m!455421 () Bool)

(assert (=> b!317379 m!455421))

(declare-fun m!455423 () Bool)

(assert (=> start!70140 m!455423))

(declare-fun m!455425 () Bool)

(assert (=> start!70140 m!455425))

(check-sat (not b!317383) (not start!70140) (not b!317379) (not b!317381) (not b!317380) (not b!317382))
