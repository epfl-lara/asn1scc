; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70022 () Bool)

(assert start!70022)

(declare-fun b!316686 () Bool)

(declare-fun e!227559 () Bool)

(declare-fun from!848 () (_ BitVec 64))

(declare-fun to!815 () (_ BitVec 64))

(assert (=> b!316686 (= e!227559 (not (bvsle from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))))

(declare-datatypes ((array!19553 0))(
  ( (array!19554 (arr!9582 (Array (_ BitVec 32) (_ BitVec 8))) (size!8499 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19553)

(declare-fun a1!731 () array!19553)

(declare-fun arrayBitRangesEq!0 (array!19553 array!19553 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316686 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21735 0))(
  ( (Unit!21736) )
))
(declare-fun lt!443015 () Unit!21735)

(declare-fun rec!18 (array!19553 array!19553 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21735)

(assert (=> b!316686 (= lt!443015 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun res!259788 () Bool)

(assert (=> start!70022 (=> (not res!259788) (not e!227559))))

(assert (=> start!70022 (= res!259788 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8499 a1!731) (size!8499 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8499 a1!731))))))))

(assert (=> start!70022 e!227559))

(assert (=> start!70022 true))

(declare-fun array_inv!8051 (array!19553) Bool)

(assert (=> start!70022 (array_inv!8051 a1!731)))

(assert (=> start!70022 (array_inv!8051 a2!731)))

(declare-fun b!316684 () Bool)

(declare-fun res!259787 () Bool)

(assert (=> b!316684 (=> (not res!259787) (not e!227559))))

(declare-fun bitAt!0 (array!19553 (_ BitVec 64)) Bool)

(assert (=> b!316684 (= res!259787 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(declare-fun b!316685 () Bool)

(declare-fun res!259789 () Bool)

(assert (=> b!316685 (=> (not res!259789) (not e!227559))))

(assert (=> b!316685 (= res!259789 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(declare-fun b!316683 () Bool)

(declare-fun res!259790 () Bool)

(assert (=> b!316683 (=> (not res!259790) (not e!227559))))

(assert (=> b!316683 (= res!259790 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(assert (= (and start!70022 res!259788) b!316683))

(assert (= (and b!316683 res!259790) b!316684))

(assert (= (and b!316684 res!259787) b!316685))

(assert (= (and b!316685 res!259789) b!316686))

(declare-fun m!454555 () Bool)

(assert (=> b!316685 m!454555))

(declare-fun m!454557 () Bool)

(assert (=> b!316683 m!454557))

(declare-fun m!454559 () Bool)

(assert (=> start!70022 m!454559))

(declare-fun m!454561 () Bool)

(assert (=> start!70022 m!454561))

(declare-fun m!454563 () Bool)

(assert (=> b!316684 m!454563))

(declare-fun m!454565 () Bool)

(assert (=> b!316684 m!454565))

(declare-fun m!454567 () Bool)

(assert (=> b!316686 m!454567))

(declare-fun m!454569 () Bool)

(assert (=> b!316686 m!454569))

(push 1)

(assert (not start!70022))

(assert (not b!316685))

(assert (not b!316684))

(assert (not b!316683))

(assert (not b!316686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

