; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70146 () Bool)

(assert start!70146)

(declare-fun b!317442 () Bool)

(declare-fun res!260527 () Bool)

(declare-fun e!228057 () Bool)

(assert (=> b!317442 (=> (not res!260527) (not e!228057))))

(declare-fun i!999 () (_ BitVec 64))

(declare-datatypes ((array!19644 0))(
  ( (array!19645 (arr!9629 (Array (_ BitVec 32) (_ BitVec 8))) (size!8543 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19644)

(declare-fun a1!748 () array!19644)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19644 array!19644 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317442 (= res!260527 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317443 () Bool)

(declare-fun res!260523 () Bool)

(assert (=> b!317443 (=> (not res!260523) (not e!228057))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317443 (= res!260523 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317444 () Bool)

(declare-fun res!260528 () Bool)

(assert (=> b!317444 (=> (not res!260528) (not e!228057))))

(assert (=> b!317444 (= res!260528 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317445 () Bool)

(declare-fun e!228056 () Bool)

(assert (=> b!317445 (= e!228056 (bvsle from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!317445 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21799 0))(
  ( (Unit!21800) )
))
(declare-fun lt!443193 () Unit!21799)

(declare-fun rec!18 (array!19644 array!19644 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21799)

(assert (=> b!317445 (= lt!443193 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!260522 () Bool)

(assert (=> start!70146 (=> (not res!260522) (not e!228057))))

(assert (=> start!70146 (= res!260522 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8543 a1!748) (size!8543 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8543 a1!748))))))))

(assert (=> start!70146 e!228057))

(assert (=> start!70146 true))

(declare-fun array_inv!8095 (array!19644) Bool)

(assert (=> start!70146 (array_inv!8095 a2!748)))

(assert (=> start!70146 (array_inv!8095 a1!748)))

(declare-fun b!317446 () Bool)

(declare-fun res!260524 () Bool)

(assert (=> b!317446 (=> (not res!260524) (not e!228057))))

(assert (=> b!317446 (= res!260524 (not (= i!999 from!855)))))

(declare-fun b!317447 () Bool)

(declare-fun res!260525 () Bool)

(assert (=> b!317447 (=> (not res!260525) (not e!228057))))

(declare-fun bitAt!0 (array!19644 (_ BitVec 64)) Bool)

(assert (=> b!317447 (= res!260525 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317448 () Bool)

(assert (=> b!317448 (= e!228057 (not e!228056))))

(declare-fun res!260526 () Bool)

(assert (=> b!317448 (=> res!260526 e!228056)))

(assert (=> b!317448 (= res!260526 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(assert (=> b!317448 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443194 () Unit!21799)

(declare-fun arrayBitRangesEqPrepend!0 (array!19644 array!19644 (_ BitVec 64) (_ BitVec 64)) Unit!21799)

(assert (=> b!317448 (= lt!443194 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!317448 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443195 () Unit!21799)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19644 array!19644 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21799)

(assert (=> b!317448 (= lt!443195 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(assert (= (and start!70146 res!260522) b!317443))

(assert (= (and b!317443 res!260523) b!317447))

(assert (= (and b!317447 res!260525) b!317444))

(assert (= (and b!317444 res!260528) b!317442))

(assert (= (and b!317442 res!260527) b!317446))

(assert (= (and b!317446 res!260524) b!317448))

(assert (= (and b!317448 (not res!260526)) b!317445))

(declare-fun m!455479 () Bool)

(assert (=> start!70146 m!455479))

(declare-fun m!455481 () Bool)

(assert (=> start!70146 m!455481))

(declare-fun m!455483 () Bool)

(assert (=> b!317448 m!455483))

(declare-fun m!455485 () Bool)

(assert (=> b!317448 m!455485))

(declare-fun m!455487 () Bool)

(assert (=> b!317448 m!455487))

(declare-fun m!455489 () Bool)

(assert (=> b!317448 m!455489))

(declare-fun m!455491 () Bool)

(assert (=> b!317448 m!455491))

(declare-fun m!455493 () Bool)

(assert (=> b!317445 m!455493))

(declare-fun m!455495 () Bool)

(assert (=> b!317445 m!455495))

(declare-fun m!455497 () Bool)

(assert (=> b!317442 m!455497))

(declare-fun m!455499 () Bool)

(assert (=> b!317447 m!455499))

(declare-fun m!455501 () Bool)

(assert (=> b!317447 m!455501))

(declare-fun m!455503 () Bool)

(assert (=> b!317443 m!455503))

(check-sat (not b!317447) (not b!317442) (not b!317443) (not b!317445) (not start!70146) (not b!317448))
(check-sat)
