; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70002 () Bool)

(assert start!70002)

(declare-fun res!259694 () Bool)

(declare-fun e!227469 () Bool)

(assert (=> start!70002 (=> (not res!259694) (not e!227469))))

(declare-datatypes ((array!19533 0))(
  ( (array!19534 (arr!9572 (Array (_ BitVec 32) (_ BitVec 8))) (size!8489 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19533)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19533)

(assert (=> start!70002 (= res!259694 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8489 a1!731) (size!8489 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8489 a1!731))))))))

(assert (=> start!70002 e!227469))

(assert (=> start!70002 true))

(declare-fun array_inv!8041 (array!19533) Bool)

(assert (=> start!70002 (array_inv!8041 a1!731)))

(assert (=> start!70002 (array_inv!8041 a2!731)))

(declare-fun b!316589 () Bool)

(declare-fun res!259693 () Bool)

(assert (=> b!316589 (=> (not res!259693) (not e!227469))))

(declare-fun arrayBitRangesEq!0 (array!19533 array!19533 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316589 (= res!259693 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316590 () Bool)

(assert (=> b!316590 (= e!227469 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 to!815))))

(assert (= (and start!70002 res!259694) b!316589))

(assert (= (and b!316589 res!259693) b!316590))

(declare-fun m!454445 () Bool)

(assert (=> start!70002 m!454445))

(declare-fun m!454447 () Bool)

(assert (=> start!70002 m!454447))

(declare-fun m!454449 () Bool)

(assert (=> b!316589 m!454449))

(check-sat (not start!70002) (not b!316589))
(check-sat)
