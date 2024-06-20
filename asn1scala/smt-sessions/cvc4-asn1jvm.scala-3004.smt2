; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70262 () Bool)

(assert start!70262)

(declare-fun b!318435 () Bool)

(declare-fun res!261520 () Bool)

(declare-fun e!228601 () Bool)

(assert (=> b!318435 (=> (not res!261520) (not e!228601))))

(declare-datatypes ((array!19760 0))(
  ( (array!19761 (arr!9687 (Array (_ BitVec 32) (_ BitVec 8))) (size!8601 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19760)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19760)

(declare-fun arrayBitRangesEq!0 (array!19760 array!19760 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318435 (= res!261520 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318436 () Bool)

(declare-fun e!228598 () Bool)

(assert (=> b!318436 (= e!228601 (not e!228598))))

(declare-fun res!261521 () Bool)

(assert (=> b!318436 (=> res!261521 e!228598)))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!318436 (= res!261521 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(assert (=> b!318436 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21873 0))(
  ( (Unit!21874) )
))
(declare-fun lt!443383 () Unit!21873)

(declare-fun arrayBitRangesEqPrepend!0 (array!19760 array!19760 (_ BitVec 64) (_ BitVec 64)) Unit!21873)

(assert (=> b!318436 (= lt!443383 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19760 (_ BitVec 64)) Bool)

(assert (=> b!318436 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443382 () Unit!21873)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19760 array!19760 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21873)

(assert (=> b!318436 (= lt!443382 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318437 () Bool)

(declare-fun res!261517 () Bool)

(assert (=> b!318437 (=> (not res!261517) (not e!228601))))

(assert (=> b!318437 (= res!261517 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318438 () Bool)

(declare-fun res!261515 () Bool)

(assert (=> b!318438 (=> (not res!261515) (not e!228601))))

(assert (=> b!318438 (= res!261515 (not (= i!999 from!855)))))

(declare-fun res!261518 () Bool)

(assert (=> start!70262 (=> (not res!261518) (not e!228601))))

(assert (=> start!70262 (= res!261518 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8601 a1!748) (size!8601 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8601 a1!748))))))))

(assert (=> start!70262 e!228601))

(assert (=> start!70262 true))

(declare-fun array_inv!8153 (array!19760) Bool)

(assert (=> start!70262 (array_inv!8153 a2!748)))

(assert (=> start!70262 (array_inv!8153 a1!748)))

(declare-fun b!318439 () Bool)

(declare-fun res!261519 () Bool)

(assert (=> b!318439 (=> (not res!261519) (not e!228601))))

(assert (=> b!318439 (= res!261519 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318440 () Bool)

(assert (=> b!318440 (= e!228598 true)))

(assert (=> b!318440 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443384 () Unit!21873)

(declare-fun rec!18 (array!19760 array!19760 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21873)

(assert (=> b!318440 (= lt!443384 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!318441 () Bool)

(declare-fun res!261516 () Bool)

(assert (=> b!318441 (=> (not res!261516) (not e!228601))))

(assert (=> b!318441 (= res!261516 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70262 res!261518) b!318435))

(assert (= (and b!318435 res!261520) b!318441))

(assert (= (and b!318441 res!261516) b!318437))

(assert (= (and b!318437 res!261517) b!318439))

(assert (= (and b!318439 res!261519) b!318438))

(assert (= (and b!318438 res!261515) b!318436))

(assert (= (and b!318436 (not res!261521)) b!318440))

(declare-fun m!456501 () Bool)

(assert (=> b!318439 m!456501))

(declare-fun m!456503 () Bool)

(assert (=> b!318440 m!456503))

(declare-fun m!456505 () Bool)

(assert (=> b!318440 m!456505))

(declare-fun m!456507 () Bool)

(assert (=> b!318441 m!456507))

(declare-fun m!456509 () Bool)

(assert (=> b!318441 m!456509))

(declare-fun m!456511 () Bool)

(assert (=> b!318436 m!456511))

(declare-fun m!456513 () Bool)

(assert (=> b!318436 m!456513))

(declare-fun m!456515 () Bool)

(assert (=> b!318436 m!456515))

(declare-fun m!456517 () Bool)

(assert (=> b!318436 m!456517))

(declare-fun m!456519 () Bool)

(assert (=> b!318436 m!456519))

(declare-fun m!456521 () Bool)

(assert (=> start!70262 m!456521))

(declare-fun m!456523 () Bool)

(assert (=> start!70262 m!456523))

(declare-fun m!456525 () Bool)

(assert (=> b!318435 m!456525))

(push 1)

(assert (not b!318441))

(assert (not b!318440))

(assert (not b!318436))

(assert (not start!70262))

(assert (not b!318439))

(assert (not b!318435))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

