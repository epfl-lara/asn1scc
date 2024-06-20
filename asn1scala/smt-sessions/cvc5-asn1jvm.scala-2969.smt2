; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70012 () Bool)

(assert start!70012)

(declare-fun b!316626 () Bool)

(declare-fun e!227513 () Bool)

(assert (=> b!316626 (= e!227513 (not true))))

(declare-datatypes ((array!19543 0))(
  ( (array!19544 (arr!9577 (Array (_ BitVec 32) (_ BitVec 8))) (size!8494 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19543)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19543)

(declare-fun arrayBitRangesEq!0 (array!19543 array!19543 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316626 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21725 0))(
  ( (Unit!21726) )
))
(declare-fun lt!443000 () Unit!21725)

(declare-fun rec!18 (array!19543 array!19543 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21725)

(assert (=> b!316626 (= lt!443000 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun b!316625 () Bool)

(declare-fun res!259729 () Bool)

(assert (=> b!316625 (=> (not res!259729) (not e!227513))))

(assert (=> b!316625 (= res!259729 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(declare-fun b!316624 () Bool)

(declare-fun res!259730 () Bool)

(assert (=> b!316624 (=> (not res!259730) (not e!227513))))

(declare-fun bitAt!0 (array!19543 (_ BitVec 64)) Bool)

(assert (=> b!316624 (= res!259730 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(declare-fun res!259727 () Bool)

(assert (=> start!70012 (=> (not res!259727) (not e!227513))))

(assert (=> start!70012 (= res!259727 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8494 a1!731) (size!8494 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8494 a1!731))))))))

(assert (=> start!70012 e!227513))

(assert (=> start!70012 true))

(declare-fun array_inv!8046 (array!19543) Bool)

(assert (=> start!70012 (array_inv!8046 a1!731)))

(assert (=> start!70012 (array_inv!8046 a2!731)))

(declare-fun b!316623 () Bool)

(declare-fun res!259728 () Bool)

(assert (=> b!316623 (=> (not res!259728) (not e!227513))))

(assert (=> b!316623 (= res!259728 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(assert (= (and start!70012 res!259727) b!316623))

(assert (= (and b!316623 res!259728) b!316624))

(assert (= (and b!316624 res!259730) b!316625))

(assert (= (and b!316625 res!259729) b!316626))

(declare-fun m!454475 () Bool)

(assert (=> b!316625 m!454475))

(declare-fun m!454477 () Bool)

(assert (=> start!70012 m!454477))

(declare-fun m!454479 () Bool)

(assert (=> start!70012 m!454479))

(declare-fun m!454481 () Bool)

(assert (=> b!316623 m!454481))

(declare-fun m!454483 () Bool)

(assert (=> b!316626 m!454483))

(declare-fun m!454485 () Bool)

(assert (=> b!316626 m!454485))

(declare-fun m!454487 () Bool)

(assert (=> b!316624 m!454487))

(declare-fun m!454489 () Bool)

(assert (=> b!316624 m!454489))

(push 1)

(assert (not b!316623))

(assert (not b!316626))

(assert (not b!316624))

(assert (not b!316625))

(assert (not start!70012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

