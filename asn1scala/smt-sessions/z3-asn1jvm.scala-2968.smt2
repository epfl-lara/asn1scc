; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70008 () Bool)

(assert start!70008)

(declare-fun res!259711 () Bool)

(declare-fun e!227496 () Bool)

(assert (=> start!70008 (=> (not res!259711) (not e!227496))))

(declare-datatypes ((array!19539 0))(
  ( (array!19540 (arr!9575 (Array (_ BitVec 32) (_ BitVec 8))) (size!8492 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19539)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19539)

(assert (=> start!70008 (= res!259711 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8492 a1!731) (size!8492 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8492 a1!731))))))))

(assert (=> start!70008 e!227496))

(assert (=> start!70008 true))

(declare-fun array_inv!8044 (array!19539) Bool)

(assert (=> start!70008 (array_inv!8044 a1!731)))

(assert (=> start!70008 (array_inv!8044 a2!731)))

(declare-fun b!316607 () Bool)

(declare-fun res!259712 () Bool)

(assert (=> b!316607 (=> (not res!259712) (not e!227496))))

(declare-fun arrayBitRangesEq!0 (array!19539 array!19539 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316607 (= res!259712 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316608 () Bool)

(assert (=> b!316608 (= e!227496 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 to!815) (bvsge to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8492 a2!731))))))))

(assert (= (and start!70008 res!259711) b!316607))

(assert (= (and b!316607 res!259712) b!316608))

(declare-fun m!454463 () Bool)

(assert (=> start!70008 m!454463))

(declare-fun m!454465 () Bool)

(assert (=> start!70008 m!454465))

(declare-fun m!454467 () Bool)

(assert (=> b!316607 m!454467))

(check-sat (not start!70008) (not b!316607))
(check-sat)
