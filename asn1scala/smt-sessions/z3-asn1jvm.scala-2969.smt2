; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70014 () Bool)

(assert start!70014)

(declare-fun b!316637 () Bool)

(declare-fun res!259742 () Bool)

(declare-fun e!227523 () Bool)

(assert (=> b!316637 (=> (not res!259742) (not e!227523))))

(declare-datatypes ((array!19545 0))(
  ( (array!19546 (arr!9578 (Array (_ BitVec 32) (_ BitVec 8))) (size!8495 (_ BitVec 32))) )
))
(declare-fun a1!731 () array!19545)

(declare-fun a2!731 () array!19545)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19545 array!19545 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316637 (= res!259742 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(declare-fun res!259741 () Bool)

(assert (=> start!70014 (=> (not res!259741) (not e!227523))))

(declare-fun from!848 () (_ BitVec 64))

(assert (=> start!70014 (= res!259741 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8495 a1!731) (size!8495 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8495 a1!731))))))))

(assert (=> start!70014 e!227523))

(assert (=> start!70014 true))

(declare-fun array_inv!8047 (array!19545) Bool)

(assert (=> start!70014 (array_inv!8047 a1!731)))

(assert (=> start!70014 (array_inv!8047 a2!731)))

(declare-fun b!316635 () Bool)

(declare-fun res!259739 () Bool)

(assert (=> b!316635 (=> (not res!259739) (not e!227523))))

(assert (=> b!316635 (= res!259739 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316638 () Bool)

(assert (=> b!316638 (= e!227523 (not true))))

(assert (=> b!316638 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21727 0))(
  ( (Unit!21728) )
))
(declare-fun lt!443003 () Unit!21727)

(declare-fun rec!18 (array!19545 array!19545 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21727)

(assert (=> b!316638 (= lt!443003 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun b!316636 () Bool)

(declare-fun res!259740 () Bool)

(assert (=> b!316636 (=> (not res!259740) (not e!227523))))

(declare-fun bitAt!0 (array!19545 (_ BitVec 64)) Bool)

(assert (=> b!316636 (= res!259740 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(assert (= (and start!70014 res!259741) b!316635))

(assert (= (and b!316635 res!259739) b!316636))

(assert (= (and b!316636 res!259740) b!316637))

(assert (= (and b!316637 res!259742) b!316638))

(declare-fun m!454491 () Bool)

(assert (=> b!316635 m!454491))

(declare-fun m!454493 () Bool)

(assert (=> b!316638 m!454493))

(declare-fun m!454495 () Bool)

(assert (=> b!316638 m!454495))

(declare-fun m!454497 () Bool)

(assert (=> b!316637 m!454497))

(declare-fun m!454499 () Bool)

(assert (=> b!316636 m!454499))

(declare-fun m!454501 () Bool)

(assert (=> b!316636 m!454501))

(declare-fun m!454503 () Bool)

(assert (=> start!70014 m!454503))

(declare-fun m!454505 () Bool)

(assert (=> start!70014 m!454505))

(check-sat (not b!316638) (not b!316635) (not b!316636) (not start!70014) (not b!316637))
