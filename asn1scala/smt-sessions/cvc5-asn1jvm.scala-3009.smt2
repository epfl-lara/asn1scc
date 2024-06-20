; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70288 () Bool)

(assert start!70288)

(declare-datatypes ((array!19786 0))(
  ( (array!19787 (arr!9700 (Array (_ BitVec 32) (_ BitVec 8))) (size!8614 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19786)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19786)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70288 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8614 a1!721) (size!8614 a2!721)) (not (= ((_ sign_extend 32) (size!8614 a1!721)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8614 a1!721))) ((_ sign_extend 32) (size!8614 a1!721))))))))

(assert (=> start!70288 true))

(declare-fun array_inv!8166 (array!19786) Bool)

(assert (=> start!70288 (array_inv!8166 a1!721)))

(assert (=> start!70288 (array_inv!8166 a2!721)))

(declare-fun bs!27254 () Bool)

(assert (= bs!27254 start!70288))

(declare-fun m!456605 () Bool)

(assert (=> bs!27254 m!456605))

(declare-fun m!456607 () Bool)

(assert (=> bs!27254 m!456607))

(push 1)

(assert (not start!70288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

