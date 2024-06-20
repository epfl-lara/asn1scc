; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69840 () Bool)

(assert start!69840)

(declare-fun b!315003 () Bool)

(declare-fun res!258153 () Bool)

(declare-fun e!226559 () Bool)

(assert (=> b!315003 (=> (not res!258153) (not e!226559))))

(declare-datatypes ((array!19404 0))(
  ( (array!19405 (arr!9506 (Array (_ BitVec 32) (_ BitVec 8))) (size!8426 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19404)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19404)

(declare-fun arrayBitRangesEq!0 (array!19404 array!19404 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315003 (= res!258153 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315004 () Bool)

(declare-fun res!258155 () Bool)

(assert (=> b!315004 (=> (not res!258155) (not e!226559))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19404)

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!315004 (= res!258155 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315005 () Bool)

(declare-fun res!258152 () Bool)

(assert (=> b!315005 (=> (not res!258152) (not e!226559))))

(assert (=> b!315005 (= res!258152 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315006 () Bool)

(declare-fun res!258154 () Bool)

(assert (=> b!315006 (=> (not res!258154) (not e!226559))))

(assert (=> b!315006 (= res!258154 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315007 () Bool)

(assert (=> b!315007 (= e!226559 (bvslt (bvsub to!845 i!1020) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!258149 () Bool)

(assert (=> start!69840 (=> (not res!258149) (not e!226559))))

(assert (=> start!69840 (= res!258149 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8426 a1!825) (size!8426 a2!825)) (= (size!8426 a2!825) (size!8426 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8426 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8426 a2!825))))))))

(assert (=> start!69840 e!226559))

(assert (=> start!69840 true))

(declare-fun array_inv!7978 (array!19404) Bool)

(assert (=> start!69840 (array_inv!7978 a1!825)))

(assert (=> start!69840 (array_inv!7978 a3!79)))

(assert (=> start!69840 (array_inv!7978 a2!825)))

(declare-fun b!315008 () Bool)

(declare-fun res!258151 () Bool)

(assert (=> b!315008 (=> (not res!258151) (not e!226559))))

(assert (=> b!315008 (= res!258151 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315009 () Bool)

(declare-fun res!258150 () Bool)

(assert (=> b!315009 (=> (not res!258150) (not e!226559))))

(assert (=> b!315009 (= res!258150 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69840 res!258149) b!315005))

(assert (= (and b!315005 res!258152) b!315003))

(assert (= (and b!315003 res!258153) b!315009))

(assert (= (and b!315009 res!258150) b!315004))

(assert (= (and b!315004 res!258155) b!315008))

(assert (= (and b!315008 res!258151) b!315006))

(assert (= (and b!315006 res!258154) b!315007))

(declare-fun m!452613 () Bool)

(assert (=> b!315005 m!452613))

(declare-fun m!452615 () Bool)

(assert (=> b!315006 m!452615))

(declare-fun m!452617 () Bool)

(assert (=> start!69840 m!452617))

(declare-fun m!452619 () Bool)

(assert (=> start!69840 m!452619))

(declare-fun m!452621 () Bool)

(assert (=> start!69840 m!452621))

(declare-fun m!452623 () Bool)

(assert (=> b!315004 m!452623))

(declare-fun m!452625 () Bool)

(assert (=> b!315008 m!452625))

(declare-fun m!452627 () Bool)

(assert (=> b!315003 m!452627))

(check-sat (not start!69840) (not b!315006) (not b!315003) (not b!315008) (not b!315005) (not b!315004))
(check-sat)
