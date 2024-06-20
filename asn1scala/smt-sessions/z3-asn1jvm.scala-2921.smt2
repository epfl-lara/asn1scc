; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69678 () Bool)

(assert start!69678)

(declare-fun b!313455 () Bool)

(declare-fun e!225569 () Bool)

(assert (=> b!313455 (= e!225569 (not true))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-datatypes ((array!19251 0))(
  ( (array!19252 (arr!9431 (Array (_ BitVec 32) (_ BitVec 8))) (size!8351 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19251)

(declare-fun a3!74 () array!19251)

(declare-fun from!870 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19251 array!19251 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313455 (arrayBitRangesEq!0 a1!799 a3!74 from!870 mid!77)))

(declare-fun to!837 () (_ BitVec 64))

(declare-fun a2!799 () array!19251)

(declare-datatypes ((Unit!21541 0))(
  ( (Unit!21542) )
))
(declare-fun lt!442283 () Unit!21541)

(declare-fun rec!20 (array!19251 array!19251 array!19251 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21541)

(assert (=> b!313455 (= lt!442283 (rec!20 a1!799 a2!799 a3!74 from!870 mid!77 to!837 from!870))))

(declare-fun b!313453 () Bool)

(declare-fun res!256631 () Bool)

(assert (=> b!313453 (=> (not res!256631) (not e!225569))))

(assert (=> b!313453 (= res!256631 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313452 () Bool)

(declare-fun res!256628 () Bool)

(assert (=> b!313452 (=> (not res!256628) (not e!225569))))

(assert (=> b!313452 (= res!256628 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun res!256629 () Bool)

(assert (=> start!69678 (=> (not res!256629) (not e!225569))))

(assert (=> start!69678 (= res!256629 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8351 a1!799) (size!8351 a2!799)) (= (size!8351 a2!799) (size!8351 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8351 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8351 a2!799))))))))

(assert (=> start!69678 e!225569))

(assert (=> start!69678 true))

(declare-fun array_inv!7903 (array!19251) Bool)

(assert (=> start!69678 (array_inv!7903 a1!799)))

(assert (=> start!69678 (array_inv!7903 a2!799)))

(assert (=> start!69678 (array_inv!7903 a3!74)))

(declare-fun b!313454 () Bool)

(declare-fun res!256630 () Bool)

(assert (=> b!313454 (=> (not res!256630) (not e!225569))))

(assert (=> b!313454 (= res!256630 (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870))))

(assert (= (and start!69678 res!256629) b!313452))

(assert (= (and b!313452 res!256628) b!313453))

(assert (= (and b!313453 res!256631) b!313454))

(assert (= (and b!313454 res!256630) b!313455))

(declare-fun m!450999 () Bool)

(assert (=> b!313455 m!450999))

(declare-fun m!451001 () Bool)

(assert (=> b!313455 m!451001))

(declare-fun m!451003 () Bool)

(assert (=> b!313453 m!451003))

(declare-fun m!451005 () Bool)

(assert (=> start!69678 m!451005))

(declare-fun m!451007 () Bool)

(assert (=> start!69678 m!451007))

(declare-fun m!451009 () Bool)

(assert (=> start!69678 m!451009))

(declare-fun m!451011 () Bool)

(assert (=> b!313454 m!451011))

(declare-fun m!451013 () Bool)

(assert (=> b!313452 m!451013))

(check-sat (not b!313453) (not start!69678) (not b!313455) (not b!313452) (not b!313454))
