; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70006 () Bool)

(assert start!70006)

(declare-fun res!259705 () Bool)

(declare-fun e!227487 () Bool)

(assert (=> start!70006 (=> (not res!259705) (not e!227487))))

(declare-datatypes ((array!19537 0))(
  ( (array!19538 (arr!9574 (Array (_ BitVec 32) (_ BitVec 8))) (size!8491 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19537)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19537)

(assert (=> start!70006 (= res!259705 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8491 a1!731) (size!8491 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8491 a1!731))))))))

(assert (=> start!70006 e!227487))

(assert (=> start!70006 true))

(declare-fun array_inv!8043 (array!19537) Bool)

(assert (=> start!70006 (array_inv!8043 a1!731)))

(assert (=> start!70006 (array_inv!8043 a2!731)))

(declare-fun b!316601 () Bool)

(declare-fun res!259706 () Bool)

(assert (=> b!316601 (=> (not res!259706) (not e!227487))))

(declare-fun arrayBitRangesEq!0 (array!19537 array!19537 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316601 (= res!259706 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316602 () Bool)

(assert (=> b!316602 (= e!227487 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 to!815) (bvsge to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8491 a2!731))))))))

(assert (= (and start!70006 res!259705) b!316601))

(assert (= (and b!316601 res!259706) b!316602))

(declare-fun m!454457 () Bool)

(assert (=> start!70006 m!454457))

(declare-fun m!454459 () Bool)

(assert (=> start!70006 m!454459))

(declare-fun m!454461 () Bool)

(assert (=> b!316601 m!454461))

(push 1)

(assert (not b!316601))

(assert (not start!70006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

