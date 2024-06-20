; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70004 () Bool)

(assert start!70004)

(declare-fun res!259700 () Bool)

(declare-fun e!227479 () Bool)

(assert (=> start!70004 (=> (not res!259700) (not e!227479))))

(declare-datatypes ((array!19535 0))(
  ( (array!19536 (arr!9573 (Array (_ BitVec 32) (_ BitVec 8))) (size!8490 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19535)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19535)

(assert (=> start!70004 (= res!259700 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8490 a1!731) (size!8490 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8490 a1!731))))))))

(assert (=> start!70004 e!227479))

(assert (=> start!70004 true))

(declare-fun array_inv!8042 (array!19535) Bool)

(assert (=> start!70004 (array_inv!8042 a1!731)))

(assert (=> start!70004 (array_inv!8042 a2!731)))

(declare-fun b!316595 () Bool)

(declare-fun res!259699 () Bool)

(assert (=> b!316595 (=> (not res!259699) (not e!227479))))

(declare-fun arrayBitRangesEq!0 (array!19535 array!19535 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316595 (= res!259699 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316596 () Bool)

(assert (=> b!316596 (= e!227479 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 to!815))))

(assert (= (and start!70004 res!259700) b!316595))

(assert (= (and b!316595 res!259699) b!316596))

(declare-fun m!454451 () Bool)

(assert (=> start!70004 m!454451))

(declare-fun m!454453 () Bool)

(assert (=> start!70004 m!454453))

(declare-fun m!454455 () Bool)

(assert (=> b!316595 m!454455))

(push 1)

(assert (not start!70004))

(assert (not b!316595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

