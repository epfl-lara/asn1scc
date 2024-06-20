; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70016 () Bool)

(assert start!70016)

(declare-fun b!316649 () Bool)

(declare-fun res!259752 () Bool)

(declare-fun e!227531 () Bool)

(assert (=> b!316649 (=> (not res!259752) (not e!227531))))

(declare-datatypes ((array!19547 0))(
  ( (array!19548 (arr!9579 (Array (_ BitVec 32) (_ BitVec 8))) (size!8496 (_ BitVec 32))) )
))
(declare-fun a1!731 () array!19547)

(declare-fun a2!731 () array!19547)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19547 array!19547 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316649 (= res!259752 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(declare-fun b!316650 () Bool)

(assert (=> b!316650 (= e!227531 (not true))))

(declare-fun from!848 () (_ BitVec 64))

(assert (=> b!316650 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21729 0))(
  ( (Unit!21730) )
))
(declare-fun lt!443006 () Unit!21729)

(declare-fun rec!18 (array!19547 array!19547 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21729)

(assert (=> b!316650 (= lt!443006 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun b!316647 () Bool)

(declare-fun res!259753 () Bool)

(assert (=> b!316647 (=> (not res!259753) (not e!227531))))

(assert (=> b!316647 (= res!259753 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316648 () Bool)

(declare-fun res!259754 () Bool)

(assert (=> b!316648 (=> (not res!259754) (not e!227531))))

(declare-fun bitAt!0 (array!19547 (_ BitVec 64)) Bool)

(assert (=> b!316648 (= res!259754 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(declare-fun res!259751 () Bool)

(assert (=> start!70016 (=> (not res!259751) (not e!227531))))

(assert (=> start!70016 (= res!259751 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8496 a1!731) (size!8496 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8496 a1!731))))))))

(assert (=> start!70016 e!227531))

(assert (=> start!70016 true))

(declare-fun array_inv!8048 (array!19547) Bool)

(assert (=> start!70016 (array_inv!8048 a1!731)))

(assert (=> start!70016 (array_inv!8048 a2!731)))

(assert (= (and start!70016 res!259751) b!316647))

(assert (= (and b!316647 res!259753) b!316648))

(assert (= (and b!316648 res!259754) b!316649))

(assert (= (and b!316649 res!259752) b!316650))

(declare-fun m!454507 () Bool)

(assert (=> b!316649 m!454507))

(declare-fun m!454509 () Bool)

(assert (=> b!316650 m!454509))

(declare-fun m!454511 () Bool)

(assert (=> b!316650 m!454511))

(declare-fun m!454513 () Bool)

(assert (=> b!316647 m!454513))

(declare-fun m!454515 () Bool)

(assert (=> start!70016 m!454515))

(declare-fun m!454517 () Bool)

(assert (=> start!70016 m!454517))

(declare-fun m!454519 () Bool)

(assert (=> b!316648 m!454519))

(declare-fun m!454521 () Bool)

(assert (=> b!316648 m!454521))

(push 1)

(assert (not b!316650))

(assert (not b!316647))

(assert (not b!316648))

(assert (not start!70016))

(assert (not b!316649))

