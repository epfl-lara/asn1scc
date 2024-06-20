; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70266 () Bool)

(assert start!70266)

(declare-datatypes ((array!19764 0))(
  ( (array!19765 (arr!9689 (Array (_ BitVec 32) (_ BitVec 8))) (size!8603 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19764)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19764)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70266 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8603 a1!721) (size!8603 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8603 a1!721)))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 from!846))))

(assert (=> start!70266 true))

(declare-fun array_inv!8155 (array!19764) Bool)

(assert (=> start!70266 (array_inv!8155 a1!721)))

(assert (=> start!70266 (array_inv!8155 a2!721)))

(declare-fun bs!27240 () Bool)

(assert (= bs!27240 start!70266))

(declare-fun m!456531 () Bool)

(assert (=> bs!27240 m!456531))

(declare-fun m!456533 () Bool)

(assert (=> bs!27240 m!456533))

(check-sat (not start!70266))
(check-sat)
