; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70182 () Bool)

(assert start!70182)

(declare-fun res!260791 () Bool)

(declare-fun e!228222 () Bool)

(assert (=> start!70182 (=> (not res!260791) (not e!228222))))

(declare-datatypes ((array!19680 0))(
  ( (array!19681 (arr!9647 (Array (_ BitVec 32) (_ BitVec 8))) (size!8561 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19680)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19680)

(assert (=> start!70182 (= res!260791 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8561 a1!748) (size!8561 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8561 a1!748))))))))

(assert (=> start!70182 e!228222))

(assert (=> start!70182 true))

(declare-fun array_inv!8113 (array!19680) Bool)

(assert (=> start!70182 (array_inv!8113 a2!748)))

(assert (=> start!70182 (array_inv!8113 a1!748)))

(declare-fun b!317711 () Bool)

(declare-fun res!260795 () Bool)

(assert (=> b!317711 (=> (not res!260795) (not e!228222))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19680 array!19680 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317711 (= res!260795 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317712 () Bool)

(declare-fun res!260793 () Bool)

(assert (=> b!317712 (=> (not res!260793) (not e!228222))))

(declare-fun bitAt!0 (array!19680 (_ BitVec 64)) Bool)

(assert (=> b!317712 (= res!260793 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317713 () Bool)

(declare-fun res!260794 () Bool)

(assert (=> b!317713 (=> (not res!260794) (not e!228222))))

(assert (=> b!317713 (= res!260794 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317714 () Bool)

(declare-fun res!260792 () Bool)

(assert (=> b!317714 (=> (not res!260792) (not e!228222))))

(assert (=> b!317714 (= res!260792 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!317715 () Bool)

(assert (=> b!317715 (= e!228222 (and (not (= i!999 from!855)) (bvsgt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8561 a1!748))))))))

(assert (= (and start!70182 res!260791) b!317713))

(assert (= (and b!317713 res!260794) b!317712))

(assert (= (and b!317712 res!260793) b!317714))

(assert (= (and b!317714 res!260792) b!317711))

(assert (= (and b!317711 res!260795) b!317715))

(declare-fun m!455723 () Bool)

(assert (=> start!70182 m!455723))

(declare-fun m!455725 () Bool)

(assert (=> start!70182 m!455725))

(declare-fun m!455727 () Bool)

(assert (=> b!317711 m!455727))

(declare-fun m!455729 () Bool)

(assert (=> b!317712 m!455729))

(declare-fun m!455731 () Bool)

(assert (=> b!317712 m!455731))

(declare-fun m!455733 () Bool)

(assert (=> b!317713 m!455733))

(check-sat (not b!317713) (not start!70182) (not b!317712) (not b!317711))
(check-sat)
