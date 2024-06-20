; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70020 () Bool)

(assert start!70020)

(declare-fun b!316674 () Bool)

(declare-fun e!227550 () Bool)

(declare-fun from!848 () (_ BitVec 64))

(declare-fun to!815 () (_ BitVec 64))

(assert (=> b!316674 (= e!227550 (not (bvsle from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))))

(declare-datatypes ((array!19551 0))(
  ( (array!19552 (arr!9581 (Array (_ BitVec 32) (_ BitVec 8))) (size!8498 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19551)

(declare-fun a1!731 () array!19551)

(declare-fun arrayBitRangesEq!0 (array!19551 array!19551 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316674 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21733 0))(
  ( (Unit!21734) )
))
(declare-fun lt!443012 () Unit!21733)

(declare-fun rec!18 (array!19551 array!19551 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21733)

(assert (=> b!316674 (= lt!443012 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun b!316672 () Bool)

(declare-fun res!259776 () Bool)

(assert (=> b!316672 (=> (not res!259776) (not e!227550))))

(declare-fun bitAt!0 (array!19551 (_ BitVec 64)) Bool)

(assert (=> b!316672 (= res!259776 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(declare-fun b!316671 () Bool)

(declare-fun res!259777 () Bool)

(assert (=> b!316671 (=> (not res!259777) (not e!227550))))

(assert (=> b!316671 (= res!259777 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316673 () Bool)

(declare-fun res!259778 () Bool)

(assert (=> b!316673 (=> (not res!259778) (not e!227550))))

(assert (=> b!316673 (= res!259778 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(declare-fun res!259775 () Bool)

(assert (=> start!70020 (=> (not res!259775) (not e!227550))))

(assert (=> start!70020 (= res!259775 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8498 a1!731) (size!8498 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8498 a1!731))))))))

(assert (=> start!70020 e!227550))

(assert (=> start!70020 true))

(declare-fun array_inv!8050 (array!19551) Bool)

(assert (=> start!70020 (array_inv!8050 a1!731)))

(assert (=> start!70020 (array_inv!8050 a2!731)))

(assert (= (and start!70020 res!259775) b!316671))

(assert (= (and b!316671 res!259777) b!316672))

(assert (= (and b!316672 res!259776) b!316673))

(assert (= (and b!316673 res!259778) b!316674))

(declare-fun m!454539 () Bool)

(assert (=> b!316671 m!454539))

(declare-fun m!454541 () Bool)

(assert (=> b!316672 m!454541))

(declare-fun m!454543 () Bool)

(assert (=> b!316672 m!454543))

(declare-fun m!454545 () Bool)

(assert (=> b!316674 m!454545))

(declare-fun m!454547 () Bool)

(assert (=> b!316674 m!454547))

(declare-fun m!454549 () Bool)

(assert (=> start!70020 m!454549))

(declare-fun m!454551 () Bool)

(assert (=> start!70020 m!454551))

(declare-fun m!454553 () Bool)

(assert (=> b!316673 m!454553))

(check-sat (not b!316674) (not b!316672) (not b!316673) (not start!70020) (not b!316671))
(check-sat)
