; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70144 () Bool)

(assert start!70144)

(declare-fun res!260502 () Bool)

(declare-fun e!228044 () Bool)

(assert (=> start!70144 (=> (not res!260502) (not e!228044))))

(declare-datatypes ((array!19642 0))(
  ( (array!19643 (arr!9628 (Array (_ BitVec 32) (_ BitVec 8))) (size!8542 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19642)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19642)

(assert (=> start!70144 (= res!260502 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8542 a1!748) (size!8542 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8542 a1!748))))))))

(assert (=> start!70144 e!228044))

(assert (=> start!70144 true))

(declare-fun array_inv!8094 (array!19642) Bool)

(assert (=> start!70144 (array_inv!8094 a2!748)))

(assert (=> start!70144 (array_inv!8094 a1!748)))

(declare-fun b!317421 () Bool)

(declare-fun e!228043 () Bool)

(assert (=> b!317421 (= e!228044 (not e!228043))))

(declare-fun res!260507 () Bool)

(assert (=> b!317421 (=> res!260507 e!228043)))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317421 (= res!260507 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(declare-fun arrayBitRangesEq!0 (array!19642 array!19642 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317421 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21797 0))(
  ( (Unit!21798) )
))
(declare-fun lt!443185 () Unit!21797)

(declare-fun arrayBitRangesEqPrepend!0 (array!19642 array!19642 (_ BitVec 64) (_ BitVec 64)) Unit!21797)

(assert (=> b!317421 (= lt!443185 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19642 (_ BitVec 64)) Bool)

(assert (=> b!317421 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443184 () Unit!21797)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19642 array!19642 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21797)

(assert (=> b!317421 (= lt!443184 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317422 () Bool)

(declare-fun res!260504 () Bool)

(assert (=> b!317422 (=> (not res!260504) (not e!228044))))

(assert (=> b!317422 (= res!260504 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317423 () Bool)

(declare-fun res!260506 () Bool)

(assert (=> b!317423 (=> (not res!260506) (not e!228044))))

(assert (=> b!317423 (= res!260506 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317424 () Bool)

(declare-fun res!260503 () Bool)

(assert (=> b!317424 (=> (not res!260503) (not e!228044))))

(assert (=> b!317424 (= res!260503 (not (= i!999 from!855)))))

(declare-fun b!317425 () Bool)

(declare-fun res!260505 () Bool)

(assert (=> b!317425 (=> (not res!260505) (not e!228044))))

(assert (=> b!317425 (= res!260505 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317426 () Bool)

(assert (=> b!317426 (= e!228043 (bvsle from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!317426 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443186 () Unit!21797)

(declare-fun rec!18 (array!19642 array!19642 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21797)

(assert (=> b!317426 (= lt!443186 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!317427 () Bool)

(declare-fun res!260501 () Bool)

(assert (=> b!317427 (=> (not res!260501) (not e!228044))))

(assert (=> b!317427 (= res!260501 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70144 res!260502) b!317423))

(assert (= (and b!317423 res!260506) b!317427))

(assert (= (and b!317427 res!260501) b!317422))

(assert (= (and b!317422 res!260504) b!317425))

(assert (= (and b!317425 res!260505) b!317424))

(assert (= (and b!317424 res!260503) b!317421))

(assert (= (and b!317421 (not res!260507)) b!317426))

(declare-fun m!455453 () Bool)

(assert (=> b!317427 m!455453))

(declare-fun m!455455 () Bool)

(assert (=> b!317427 m!455455))

(declare-fun m!455457 () Bool)

(assert (=> b!317421 m!455457))

(declare-fun m!455459 () Bool)

(assert (=> b!317421 m!455459))

(declare-fun m!455461 () Bool)

(assert (=> b!317421 m!455461))

(declare-fun m!455463 () Bool)

(assert (=> b!317421 m!455463))

(declare-fun m!455465 () Bool)

(assert (=> b!317421 m!455465))

(declare-fun m!455467 () Bool)

(assert (=> b!317426 m!455467))

(declare-fun m!455469 () Bool)

(assert (=> b!317426 m!455469))

(declare-fun m!455471 () Bool)

(assert (=> b!317423 m!455471))

(declare-fun m!455473 () Bool)

(assert (=> start!70144 m!455473))

(declare-fun m!455475 () Bool)

(assert (=> start!70144 m!455475))

(declare-fun m!455477 () Bool)

(assert (=> b!317425 m!455477))

(push 1)

(assert (not b!317426))

(assert (not b!317421))

(assert (not start!70144))

(assert (not b!317425))

(assert (not b!317423))

(assert (not b!317427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

