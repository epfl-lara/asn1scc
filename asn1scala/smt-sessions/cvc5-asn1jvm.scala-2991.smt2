; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70180 () Bool)

(assert start!70180)

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun e!228213 () Bool)

(declare-fun b!317696 () Bool)

(declare-fun to!822 () (_ BitVec 64))

(declare-datatypes ((array!19678 0))(
  ( (array!19679 (arr!9646 (Array (_ BitVec 32) (_ BitVec 8))) (size!8560 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19678)

(assert (=> b!317696 (= e!228213 (and (not (= i!999 from!855)) (bvsgt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8560 a1!748))))))))

(declare-fun b!317697 () Bool)

(declare-fun res!260776 () Bool)

(assert (=> b!317697 (=> (not res!260776) (not e!228213))))

(assert (=> b!317697 (= res!260776 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!260779 () Bool)

(assert (=> start!70180 (=> (not res!260779) (not e!228213))))

(declare-fun a2!748 () array!19678)

(assert (=> start!70180 (= res!260779 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8560 a1!748) (size!8560 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8560 a1!748))))))))

(assert (=> start!70180 e!228213))

(assert (=> start!70180 true))

(declare-fun array_inv!8112 (array!19678) Bool)

(assert (=> start!70180 (array_inv!8112 a2!748)))

(assert (=> start!70180 (array_inv!8112 a1!748)))

(declare-fun b!317698 () Bool)

(declare-fun res!260778 () Bool)

(assert (=> b!317698 (=> (not res!260778) (not e!228213))))

(declare-fun bitAt!0 (array!19678 (_ BitVec 64)) Bool)

(assert (=> b!317698 (= res!260778 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317699 () Bool)

(declare-fun res!260780 () Bool)

(assert (=> b!317699 (=> (not res!260780) (not e!228213))))

(declare-fun arrayBitRangesEq!0 (array!19678 array!19678 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317699 (= res!260780 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317700 () Bool)

(declare-fun res!260777 () Bool)

(assert (=> b!317700 (=> (not res!260777) (not e!228213))))

(assert (=> b!317700 (= res!260777 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70180 res!260779) b!317700))

(assert (= (and b!317700 res!260777) b!317698))

(assert (= (and b!317698 res!260778) b!317697))

(assert (= (and b!317697 res!260776) b!317699))

(assert (= (and b!317699 res!260780) b!317696))

(declare-fun m!455711 () Bool)

(assert (=> start!70180 m!455711))

(declare-fun m!455713 () Bool)

(assert (=> start!70180 m!455713))

(declare-fun m!455715 () Bool)

(assert (=> b!317698 m!455715))

(declare-fun m!455717 () Bool)

(assert (=> b!317698 m!455717))

(declare-fun m!455719 () Bool)

(assert (=> b!317699 m!455719))

(declare-fun m!455721 () Bool)

(assert (=> b!317700 m!455721))

(push 1)

(assert (not b!317698))

(assert (not b!317700))

(assert (not start!70180))

(assert (not b!317699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

