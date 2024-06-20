; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70362 () Bool)

(assert start!70362)

(declare-fun res!261813 () Bool)

(declare-fun e!228991 () Bool)

(assert (=> start!70362 (=> (not res!261813) (not e!228991))))

(declare-fun at!296 () (_ BitVec 64))

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19827 0))(
  ( (array!19828 (arr!9722 (Array (_ BitVec 32) (_ BitVec 8))) (size!8633 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19827)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19827)

(assert (=> start!70362 (= res!261813 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8633 a1!898) (size!8633 a2!898)) (bvsle to!864 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8633 a1!898)))) (bvsle from!897 at!296) (bvslt at!296 to!864)))))

(assert (=> start!70362 e!228991))

(assert (=> start!70362 true))

(declare-fun array_inv!8185 (array!19827) Bool)

(assert (=> start!70362 (array_inv!8185 a1!898)))

(assert (=> start!70362 (array_inv!8185 a2!898)))

(declare-fun b!318757 () Bool)

(declare-fun res!261814 () Bool)

(assert (=> b!318757 (=> (not res!261814) (not e!228991))))

(declare-fun arrayBitRangesEq!0 (array!19827 array!19827 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318757 (= res!261814 (arrayBitRangesEq!0 a1!898 a2!898 from!897 to!864))))

(declare-fun b!318758 () Bool)

(assert (=> b!318758 (= e!228991 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!296) (bvslt at!296 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8633 a2!898)))))))))

(declare-fun bitAt!0 (array!19827 (_ BitVec 64)) Bool)

(assert (=> b!318758 (= (bitAt!0 a1!898 at!296) (bitAt!0 a2!898 at!296))))

(declare-datatypes ((Unit!21883 0))(
  ( (Unit!21884) )
))
(declare-fun lt!443453 () Unit!21883)

(declare-fun rec!22 (array!19827 array!19827 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21883)

(assert (=> b!318758 (= lt!443453 (rec!22 a1!898 a2!898 at!296 from!897 to!864 from!897))))

(assert (= (and start!70362 res!261813) b!318757))

(assert (= (and b!318757 res!261814) b!318758))

(declare-fun m!456983 () Bool)

(assert (=> start!70362 m!456983))

(declare-fun m!456985 () Bool)

(assert (=> start!70362 m!456985))

(declare-fun m!456987 () Bool)

(assert (=> b!318757 m!456987))

(declare-fun m!456989 () Bool)

(assert (=> b!318758 m!456989))

(declare-fun m!456991 () Bool)

(assert (=> b!318758 m!456991))

(declare-fun m!456993 () Bool)

(assert (=> b!318758 m!456993))

(check-sat (not start!70362) (not b!318757) (not b!318758))
(check-sat)
