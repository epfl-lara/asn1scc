; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70010 () Bool)

(assert start!70010)

(declare-fun res!259718 () Bool)

(declare-fun e!227506 () Bool)

(assert (=> start!70010 (=> (not res!259718) (not e!227506))))

(declare-datatypes ((array!19541 0))(
  ( (array!19542 (arr!9576 (Array (_ BitVec 32) (_ BitVec 8))) (size!8493 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19541)

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19541)

(declare-fun to!815 () (_ BitVec 64))

(assert (=> start!70010 (= res!259718 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8493 a1!731) (size!8493 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8493 a1!731))))))))

(assert (=> start!70010 e!227506))

(assert (=> start!70010 true))

(declare-fun array_inv!8045 (array!19541) Bool)

(assert (=> start!70010 (array_inv!8045 a1!731)))

(assert (=> start!70010 (array_inv!8045 a2!731)))

(declare-fun b!316613 () Bool)

(declare-fun res!259717 () Bool)

(assert (=> b!316613 (=> (not res!259717) (not e!227506))))

(declare-fun arrayBitRangesEq!0 (array!19541 array!19541 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316613 (= res!259717 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316614 () Bool)

(assert (=> b!316614 (= e!227506 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 to!815) (bvsge to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8493 a2!731))))))))

(assert (= (and start!70010 res!259718) b!316613))

(assert (= (and b!316613 res!259717) b!316614))

(declare-fun m!454469 () Bool)

(assert (=> start!70010 m!454469))

(declare-fun m!454471 () Bool)

(assert (=> start!70010 m!454471))

(declare-fun m!454473 () Bool)

(assert (=> b!316613 m!454473))

(push 1)

(assert (not b!316613))

(assert (not start!70010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

