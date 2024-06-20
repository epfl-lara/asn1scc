; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70000 () Bool)

(assert start!70000)

(declare-fun res!259687 () Bool)

(declare-fun e!227460 () Bool)

(assert (=> start!70000 (=> (not res!259687) (not e!227460))))

(declare-datatypes ((array!19531 0))(
  ( (array!19532 (arr!9571 (Array (_ BitVec 32) (_ BitVec 8))) (size!8488 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19531)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19531)

(assert (=> start!70000 (= res!259687 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8488 a1!731) (size!8488 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8488 a1!731))))))))

(assert (=> start!70000 e!227460))

(assert (=> start!70000 true))

(declare-fun array_inv!8040 (array!19531) Bool)

(assert (=> start!70000 (array_inv!8040 a1!731)))

(assert (=> start!70000 (array_inv!8040 a2!731)))

(declare-fun b!316583 () Bool)

(declare-fun res!259688 () Bool)

(assert (=> b!316583 (=> (not res!259688) (not e!227460))))

(declare-fun arrayBitRangesEq!0 (array!19531 array!19531 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316583 (= res!259688 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316584 () Bool)

(assert (=> b!316584 (= e!227460 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 to!815))))

(assert (= (and start!70000 res!259687) b!316583))

(assert (= (and b!316583 res!259688) b!316584))

(declare-fun m!454439 () Bool)

(assert (=> start!70000 m!454439))

(declare-fun m!454441 () Bool)

(assert (=> start!70000 m!454441))

(declare-fun m!454443 () Bool)

(assert (=> b!316583 m!454443))

(push 1)

(assert (not b!316583))

(assert (not start!70000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

