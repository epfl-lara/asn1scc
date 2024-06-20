; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70264 () Bool)

(assert start!70264)

(declare-datatypes ((array!19762 0))(
  ( (array!19763 (arr!9688 (Array (_ BitVec 32) (_ BitVec 8))) (size!8602 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19762)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19762)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70264 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8602 a1!721) (size!8602 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8602 a1!721)))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 from!846))))

(assert (=> start!70264 true))

(declare-fun array_inv!8154 (array!19762) Bool)

(assert (=> start!70264 (array_inv!8154 a1!721)))

(assert (=> start!70264 (array_inv!8154 a2!721)))

(declare-fun bs!27239 () Bool)

(assert (= bs!27239 start!70264))

(declare-fun m!456527 () Bool)

(assert (=> bs!27239 m!456527))

(declare-fun m!456529 () Bool)

(assert (=> bs!27239 m!456529))

(push 1)

(assert (not start!70264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

