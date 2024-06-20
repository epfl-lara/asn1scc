; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70142 () Bool)

(assert start!70142)

(declare-fun b!317400 () Bool)

(declare-fun e!228034 () Bool)

(declare-fun e!228033 () Bool)

(assert (=> b!317400 (= e!228034 (not e!228033))))

(declare-fun res!260485 () Bool)

(assert (=> b!317400 (=> res!260485 e!228033)))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!317400 (= res!260485 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(declare-datatypes ((array!19640 0))(
  ( (array!19641 (arr!9627 (Array (_ BitVec 32) (_ BitVec 8))) (size!8541 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19640)

(declare-fun a1!748 () array!19640)

(declare-fun arrayBitRangesEq!0 (array!19640 array!19640 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317400 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21795 0))(
  ( (Unit!21796) )
))
(declare-fun lt!443176 () Unit!21795)

(declare-fun arrayBitRangesEqPrepend!0 (array!19640 array!19640 (_ BitVec 64) (_ BitVec 64)) Unit!21795)

(assert (=> b!317400 (= lt!443176 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19640 (_ BitVec 64)) Bool)

(assert (=> b!317400 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443175 () Unit!21795)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19640 array!19640 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21795)

(assert (=> b!317400 (= lt!443175 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317401 () Bool)

(declare-fun res!260482 () Bool)

(assert (=> b!317401 (=> (not res!260482) (not e!228034))))

(assert (=> b!317401 (= res!260482 (not (= i!999 from!855)))))

(declare-fun b!317402 () Bool)

(declare-fun res!260486 () Bool)

(assert (=> b!317402 (=> (not res!260486) (not e!228034))))

(assert (=> b!317402 (= res!260486 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!260484 () Bool)

(assert (=> start!70142 (=> (not res!260484) (not e!228034))))

(assert (=> start!70142 (= res!260484 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8541 a1!748) (size!8541 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8541 a1!748))))))))

(assert (=> start!70142 e!228034))

(assert (=> start!70142 true))

(declare-fun array_inv!8093 (array!19640) Bool)

(assert (=> start!70142 (array_inv!8093 a2!748)))

(assert (=> start!70142 (array_inv!8093 a1!748)))

(declare-fun b!317403 () Bool)

(assert (=> b!317403 (= e!228033 true)))

(assert (=> b!317403 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443177 () Unit!21795)

(declare-fun rec!18 (array!19640 array!19640 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21795)

(assert (=> b!317403 (= lt!443177 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!317404 () Bool)

(declare-fun res!260481 () Bool)

(assert (=> b!317404 (=> (not res!260481) (not e!228034))))

(assert (=> b!317404 (= res!260481 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317405 () Bool)

(declare-fun res!260483 () Bool)

(assert (=> b!317405 (=> (not res!260483) (not e!228034))))

(assert (=> b!317405 (= res!260483 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317406 () Bool)

(declare-fun res!260480 () Bool)

(assert (=> b!317406 (=> (not res!260480) (not e!228034))))

(assert (=> b!317406 (= res!260480 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (= (and start!70142 res!260484) b!317402))

(assert (= (and b!317402 res!260486) b!317405))

(assert (= (and b!317405 res!260483) b!317404))

(assert (= (and b!317404 res!260481) b!317406))

(assert (= (and b!317406 res!260480) b!317401))

(assert (= (and b!317401 res!260482) b!317400))

(assert (= (and b!317400 (not res!260485)) b!317403))

(declare-fun m!455427 () Bool)

(assert (=> b!317402 m!455427))

(declare-fun m!455429 () Bool)

(assert (=> b!317403 m!455429))

(declare-fun m!455431 () Bool)

(assert (=> b!317403 m!455431))

(declare-fun m!455433 () Bool)

(assert (=> b!317406 m!455433))

(declare-fun m!455435 () Bool)

(assert (=> start!70142 m!455435))

(declare-fun m!455437 () Bool)

(assert (=> start!70142 m!455437))

(declare-fun m!455439 () Bool)

(assert (=> b!317400 m!455439))

(declare-fun m!455441 () Bool)

(assert (=> b!317400 m!455441))

(declare-fun m!455443 () Bool)

(assert (=> b!317400 m!455443))

(declare-fun m!455445 () Bool)

(assert (=> b!317400 m!455445))

(declare-fun m!455447 () Bool)

(assert (=> b!317400 m!455447))

(declare-fun m!455449 () Bool)

(assert (=> b!317405 m!455449))

(declare-fun m!455451 () Bool)

(assert (=> b!317405 m!455451))

(push 1)

(assert (not b!317405))

(assert (not b!317403))

(assert (not b!317406))

(assert (not b!317402))

(assert (not b!317400))

(assert (not start!70142))

(check-sat)

