; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69672 () Bool)

(assert start!69672)

(declare-fun b!313416 () Bool)

(declare-fun res!256593 () Bool)

(declare-fun e!225534 () Bool)

(assert (=> b!313416 (=> (not res!256593) (not e!225534))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-datatypes ((array!19245 0))(
  ( (array!19246 (arr!9428 (Array (_ BitVec 32) (_ BitVec 8))) (size!8348 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19245)

(declare-fun from!870 () (_ BitVec 64))

(declare-fun a2!799 () array!19245)

(declare-fun arrayBitRangesEq!0 (array!19245 array!19245 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313416 (= res!256593 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun b!313417 () Bool)

(declare-fun res!256594 () Bool)

(assert (=> b!313417 (=> (not res!256594) (not e!225534))))

(declare-fun to!837 () (_ BitVec 64))

(declare-fun a3!74 () array!19245)

(assert (=> b!313417 (= res!256594 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313418 () Bool)

(declare-fun res!256595 () Bool)

(assert (=> b!313418 (=> (not res!256595) (not e!225534))))

(assert (=> b!313418 (= res!256595 (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870))))

(declare-fun res!256592 () Bool)

(assert (=> start!69672 (=> (not res!256592) (not e!225534))))

(assert (=> start!69672 (= res!256592 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8348 a1!799) (size!8348 a2!799)) (= (size!8348 a2!799) (size!8348 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8348 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8348 a2!799))))))))

(assert (=> start!69672 e!225534))

(assert (=> start!69672 true))

(declare-fun array_inv!7900 (array!19245) Bool)

(assert (=> start!69672 (array_inv!7900 a1!799)))

(assert (=> start!69672 (array_inv!7900 a2!799)))

(assert (=> start!69672 (array_inv!7900 a3!74)))

(declare-fun b!313419 () Bool)

(assert (=> b!313419 (= e!225534 (not (bvsle (size!8348 a1!799) (size!8348 a3!74))))))

(assert (=> b!313419 (arrayBitRangesEq!0 a1!799 a3!74 from!870 mid!77)))

(declare-datatypes ((Unit!21535 0))(
  ( (Unit!21536) )
))
(declare-fun lt!442274 () Unit!21535)

(declare-fun rec!20 (array!19245 array!19245 array!19245 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21535)

(assert (=> b!313419 (= lt!442274 (rec!20 a1!799 a2!799 a3!74 from!870 mid!77 to!837 from!870))))

(assert (= (and start!69672 res!256592) b!313416))

(assert (= (and b!313416 res!256593) b!313417))

(assert (= (and b!313417 res!256594) b!313418))

(assert (= (and b!313418 res!256595) b!313419))

(declare-fun m!450951 () Bool)

(assert (=> b!313419 m!450951))

(declare-fun m!450953 () Bool)

(assert (=> b!313419 m!450953))

(declare-fun m!450955 () Bool)

(assert (=> b!313418 m!450955))

(declare-fun m!450957 () Bool)

(assert (=> start!69672 m!450957))

(declare-fun m!450959 () Bool)

(assert (=> start!69672 m!450959))

(declare-fun m!450961 () Bool)

(assert (=> start!69672 m!450961))

(declare-fun m!450963 () Bool)

(assert (=> b!313416 m!450963))

(declare-fun m!450965 () Bool)

(assert (=> b!313417 m!450965))

(check-sat (not b!313417) (not b!313416) (not start!69672) (not b!313418) (not b!313419))
(check-sat)
