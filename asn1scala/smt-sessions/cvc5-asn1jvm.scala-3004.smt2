; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70258 () Bool)

(assert start!70258)

(declare-fun b!318393 () Bool)

(declare-fun res!261477 () Bool)

(declare-fun e!228576 () Bool)

(assert (=> b!318393 (=> (not res!261477) (not e!228576))))

(declare-datatypes ((array!19756 0))(
  ( (array!19757 (arr!9685 (Array (_ BitVec 32) (_ BitVec 8))) (size!8599 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19756)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19756)

(declare-fun bitAt!0 (array!19756 (_ BitVec 64)) Bool)

(assert (=> b!318393 (= res!261477 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318394 () Bool)

(declare-fun res!261475 () Bool)

(assert (=> b!318394 (=> (not res!261475) (not e!228576))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19756 array!19756 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318394 (= res!261475 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!261478 () Bool)

(assert (=> start!70258 (=> (not res!261478) (not e!228576))))

(assert (=> start!70258 (= res!261478 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8599 a1!748) (size!8599 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8599 a1!748))))))))

(assert (=> start!70258 e!228576))

(assert (=> start!70258 true))

(declare-fun array_inv!8151 (array!19756) Bool)

(assert (=> start!70258 (array_inv!8151 a2!748)))

(assert (=> start!70258 (array_inv!8151 a1!748)))

(declare-fun b!318395 () Bool)

(declare-fun res!261476 () Bool)

(assert (=> b!318395 (=> (not res!261476) (not e!228576))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!318395 (= res!261476 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318396 () Bool)

(declare-fun res!261473 () Bool)

(assert (=> b!318396 (=> (not res!261473) (not e!228576))))

(assert (=> b!318396 (= res!261473 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318397 () Bool)

(declare-fun e!228577 () Bool)

(assert (=> b!318397 (= e!228576 (not e!228577))))

(declare-fun res!261479 () Bool)

(assert (=> b!318397 (=> res!261479 e!228577)))

(assert (=> b!318397 (= res!261479 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(assert (=> b!318397 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21869 0))(
  ( (Unit!21870) )
))
(declare-fun lt!443364 () Unit!21869)

(declare-fun arrayBitRangesEqPrepend!0 (array!19756 array!19756 (_ BitVec 64) (_ BitVec 64)) Unit!21869)

(assert (=> b!318397 (= lt!443364 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!318397 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443365 () Unit!21869)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19756 array!19756 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21869)

(assert (=> b!318397 (= lt!443365 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318398 () Bool)

(declare-fun res!261474 () Bool)

(assert (=> b!318398 (=> (not res!261474) (not e!228576))))

(assert (=> b!318398 (= res!261474 (not (= i!999 from!855)))))

(declare-fun b!318399 () Bool)

(assert (=> b!318399 (= e!228577 true)))

(assert (=> b!318399 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443366 () Unit!21869)

(declare-fun rec!18 (array!19756 array!19756 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21869)

(assert (=> b!318399 (= lt!443366 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!70258 res!261478) b!318394))

(assert (= (and b!318394 res!261475) b!318393))

(assert (= (and b!318393 res!261477) b!318395))

(assert (= (and b!318395 res!261476) b!318396))

(assert (= (and b!318396 res!261473) b!318398))

(assert (= (and b!318398 res!261474) b!318397))

(assert (= (and b!318397 (not res!261479)) b!318399))

(declare-fun m!456449 () Bool)

(assert (=> b!318399 m!456449))

(declare-fun m!456451 () Bool)

(assert (=> b!318399 m!456451))

(declare-fun m!456453 () Bool)

(assert (=> b!318396 m!456453))

(declare-fun m!456455 () Bool)

(assert (=> b!318397 m!456455))

(declare-fun m!456457 () Bool)

(assert (=> b!318397 m!456457))

(declare-fun m!456459 () Bool)

(assert (=> b!318397 m!456459))

(declare-fun m!456461 () Bool)

(assert (=> b!318397 m!456461))

(declare-fun m!456463 () Bool)

(assert (=> b!318397 m!456463))

(declare-fun m!456465 () Bool)

(assert (=> b!318394 m!456465))

(declare-fun m!456467 () Bool)

(assert (=> start!70258 m!456467))

(declare-fun m!456469 () Bool)

(assert (=> start!70258 m!456469))

(declare-fun m!456471 () Bool)

(assert (=> b!318393 m!456471))

(declare-fun m!456473 () Bool)

(assert (=> b!318393 m!456473))

(push 1)

(assert (not b!318396))

(assert (not b!318393))

(assert (not start!70258))

(assert (not b!318399))

(assert (not b!318397))

(assert (not b!318394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

