; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70026 () Bool)

(assert start!70026)

(declare-datatypes ((array!19557 0))(
  ( (array!19558 (arr!9584 (Array (_ BitVec 32) (_ BitVec 8))) (size!8501 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19557)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19557)

(assert (=> start!70026 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8501 a1!731) (size!8501 a2!731)) (not (= ((_ sign_extend 32) (size!8501 a1!731)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8501 a1!731))) ((_ sign_extend 32) (size!8501 a1!731))))))))

(assert (=> start!70026 true))

(declare-fun array_inv!8053 (array!19557) Bool)

(assert (=> start!70026 (array_inv!8053 a1!731)))

(assert (=> start!70026 (array_inv!8053 a2!731)))

(declare-fun bs!27117 () Bool)

(assert (= bs!27117 start!70026))

(declare-fun m!454575 () Bool)

(assert (=> bs!27117 m!454575))

(declare-fun m!454577 () Bool)

(assert (=> bs!27117 m!454577))

(check-sat (not start!70026))
(check-sat)
