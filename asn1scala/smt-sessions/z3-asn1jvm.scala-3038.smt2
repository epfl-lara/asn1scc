; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70566 () Bool)

(assert start!70566)

(declare-datatypes ((array!19971 0))(
  ( (array!19972 (arr!9794 (Array (_ BitVec 32) (_ BitVec 8))) (size!8702 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19971)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19971)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70566 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8702 a1!726) (size!8702 a2!726)) (bvsle to!814 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8702 a1!726)))) (bvsgt from!847 to!814))))

(assert (=> start!70566 true))

(declare-fun array_inv!8254 (array!19971) Bool)

(assert (=> start!70566 (array_inv!8254 a1!726)))

(assert (=> start!70566 (array_inv!8254 a2!726)))

(declare-fun bs!27423 () Bool)

(assert (= bs!27423 start!70566))

(declare-fun m!457953 () Bool)

(assert (=> bs!27423 m!457953))

(declare-fun m!457955 () Bool)

(assert (=> bs!27423 m!457955))

(check-sat (not start!70566))
(check-sat)
