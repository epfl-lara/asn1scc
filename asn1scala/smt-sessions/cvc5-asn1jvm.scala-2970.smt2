; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70018 () Bool)

(assert start!70018)

(declare-fun res!259765 () Bool)

(declare-fun e!227540 () Bool)

(assert (=> start!70018 (=> (not res!259765) (not e!227540))))

(declare-datatypes ((array!19549 0))(
  ( (array!19550 (arr!9580 (Array (_ BitVec 32) (_ BitVec 8))) (size!8497 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19549)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19549)

(assert (=> start!70018 (= res!259765 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8497 a1!731) (size!8497 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8497 a1!731))))))))

(assert (=> start!70018 e!227540))

(assert (=> start!70018 true))

(declare-fun array_inv!8049 (array!19549) Bool)

(assert (=> start!70018 (array_inv!8049 a1!731)))

(assert (=> start!70018 (array_inv!8049 a2!731)))

(declare-fun b!316662 () Bool)

(assert (=> b!316662 (= e!227540 (not (bvsle from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))))

(declare-fun arrayBitRangesEq!0 (array!19549 array!19549 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316662 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21731 0))(
  ( (Unit!21732) )
))
(declare-fun lt!443009 () Unit!21731)

(declare-fun rec!18 (array!19549 array!19549 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21731)

(assert (=> b!316662 (= lt!443009 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun b!316660 () Bool)

(declare-fun res!259763 () Bool)

(assert (=> b!316660 (=> (not res!259763) (not e!227540))))

(declare-fun bitAt!0 (array!19549 (_ BitVec 64)) Bool)

(assert (=> b!316660 (= res!259763 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(declare-fun b!316659 () Bool)

(declare-fun res!259766 () Bool)

(assert (=> b!316659 (=> (not res!259766) (not e!227540))))

(assert (=> b!316659 (= res!259766 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316661 () Bool)

(declare-fun res!259764 () Bool)

(assert (=> b!316661 (=> (not res!259764) (not e!227540))))

(assert (=> b!316661 (= res!259764 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(assert (= (and start!70018 res!259765) b!316659))

(assert (= (and b!316659 res!259766) b!316660))

(assert (= (and b!316660 res!259763) b!316661))

(assert (= (and b!316661 res!259764) b!316662))

(declare-fun m!454523 () Bool)

(assert (=> b!316659 m!454523))

(declare-fun m!454525 () Bool)

(assert (=> b!316660 m!454525))

(declare-fun m!454527 () Bool)

(assert (=> b!316660 m!454527))

(declare-fun m!454529 () Bool)

(assert (=> b!316661 m!454529))

(declare-fun m!454531 () Bool)

(assert (=> start!70018 m!454531))

(declare-fun m!454533 () Bool)

(assert (=> start!70018 m!454533))

(declare-fun m!454535 () Bool)

(assert (=> b!316662 m!454535))

(declare-fun m!454537 () Bool)

(assert (=> b!316662 m!454537))

(push 1)

(assert (not b!316659))

(assert (not b!316660))

(assert (not b!316662))

(assert (not b!316661))

(assert (not start!70018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

