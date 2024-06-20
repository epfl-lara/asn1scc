; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70260 () Bool)

(assert start!70260)

(declare-fun b!318414 () Bool)

(declare-fun e!228587 () Bool)

(assert (=> b!318414 (= e!228587 true)))

(declare-datatypes ((array!19758 0))(
  ( (array!19759 (arr!9686 (Array (_ BitVec 32) (_ BitVec 8))) (size!8600 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19758)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19758)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19758 array!19758 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318414 (arrayBitRangesEq!0 a1!748 a2!748 from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun i!999 () (_ BitVec 64))

(declare-datatypes ((Unit!21871 0))(
  ( (Unit!21872) )
))
(declare-fun lt!443374 () Unit!21871)

(declare-fun rec!18 (array!19758 array!19758 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21871)

(assert (=> b!318414 (= lt!443374 (rec!18 a1!748 a2!748 from!855 to!822 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!318415 () Bool)

(declare-fun res!261498 () Bool)

(declare-fun e!228588 () Bool)

(assert (=> b!318415 (=> (not res!261498) (not e!228588))))

(assert (=> b!318415 (= res!261498 (not (= i!999 from!855)))))

(declare-fun b!318416 () Bool)

(declare-fun res!261499 () Bool)

(assert (=> b!318416 (=> (not res!261499) (not e!228588))))

(assert (=> b!318416 (= res!261499 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318417 () Bool)

(assert (=> b!318417 (= e!228588 (not e!228587))))

(declare-fun res!261500 () Bool)

(assert (=> b!318417 (=> res!261500 e!228587)))

(assert (=> b!318417 (= res!261500 (or (bvsgt from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822)))))

(assert (=> b!318417 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-fun lt!443373 () Unit!21871)

(declare-fun arrayBitRangesEqPrepend!0 (array!19758 array!19758 (_ BitVec 64) (_ BitVec 64)) Unit!21871)

(assert (=> b!318417 (= lt!443373 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19758 (_ BitVec 64)) Bool)

(assert (=> b!318417 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443375 () Unit!21871)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19758 array!19758 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21871)

(assert (=> b!318417 (= lt!443375 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318418 () Bool)

(declare-fun res!261496 () Bool)

(assert (=> b!318418 (=> (not res!261496) (not e!228588))))

(assert (=> b!318418 (= res!261496 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318420 () Bool)

(declare-fun res!261497 () Bool)

(assert (=> b!318420 (=> (not res!261497) (not e!228588))))

(assert (=> b!318420 (= res!261497 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318419 () Bool)

(declare-fun res!261495 () Bool)

(assert (=> b!318419 (=> (not res!261495) (not e!228588))))

(assert (=> b!318419 (= res!261495 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!261494 () Bool)

(assert (=> start!70260 (=> (not res!261494) (not e!228588))))

(assert (=> start!70260 (= res!261494 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8600 a1!748) (size!8600 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8600 a1!748))))))))

(assert (=> start!70260 e!228588))

(assert (=> start!70260 true))

(declare-fun array_inv!8152 (array!19758) Bool)

(assert (=> start!70260 (array_inv!8152 a2!748)))

(assert (=> start!70260 (array_inv!8152 a1!748)))

(assert (= (and start!70260 res!261494) b!318419))

(assert (= (and b!318419 res!261495) b!318420))

(assert (= (and b!318420 res!261497) b!318416))

(assert (= (and b!318416 res!261499) b!318418))

(assert (= (and b!318418 res!261496) b!318415))

(assert (= (and b!318415 res!261498) b!318417))

(assert (= (and b!318417 (not res!261500)) b!318414))

(declare-fun m!456475 () Bool)

(assert (=> b!318418 m!456475))

(declare-fun m!456477 () Bool)

(assert (=> start!70260 m!456477))

(declare-fun m!456479 () Bool)

(assert (=> start!70260 m!456479))

(declare-fun m!456481 () Bool)

(assert (=> b!318419 m!456481))

(declare-fun m!456483 () Bool)

(assert (=> b!318417 m!456483))

(declare-fun m!456485 () Bool)

(assert (=> b!318417 m!456485))

(declare-fun m!456487 () Bool)

(assert (=> b!318417 m!456487))

(declare-fun m!456489 () Bool)

(assert (=> b!318417 m!456489))

(declare-fun m!456491 () Bool)

(assert (=> b!318417 m!456491))

(declare-fun m!456493 () Bool)

(assert (=> b!318414 m!456493))

(declare-fun m!456495 () Bool)

(assert (=> b!318414 m!456495))

(declare-fun m!456497 () Bool)

(assert (=> b!318420 m!456497))

(declare-fun m!456499 () Bool)

(assert (=> b!318420 m!456499))

(check-sat (not b!318414) (not b!318417) (not b!318420) (not b!318418) (not start!70260) (not b!318419))
