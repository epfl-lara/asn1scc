; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70292 () Bool)

(assert start!70292)

(declare-datatypes ((array!19790 0))(
  ( (array!19791 (arr!9702 (Array (_ BitVec 32) (_ BitVec 8))) (size!8616 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19790)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19790)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70292 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8616 a1!721) (size!8616 a2!721)) (not (= ((_ sign_extend 32) (size!8616 a1!721)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8616 a1!721))) ((_ sign_extend 32) (size!8616 a1!721))))))))

(assert (=> start!70292 true))

(declare-fun array_inv!8168 (array!19790) Bool)

(assert (=> start!70292 (array_inv!8168 a1!721)))

(assert (=> start!70292 (array_inv!8168 a2!721)))

(declare-fun bs!27256 () Bool)

(assert (= bs!27256 start!70292))

(declare-fun m!456613 () Bool)

(assert (=> bs!27256 m!456613))

(declare-fun m!456615 () Bool)

(assert (=> bs!27256 m!456615))

(push 1)

(assert (not start!70292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

