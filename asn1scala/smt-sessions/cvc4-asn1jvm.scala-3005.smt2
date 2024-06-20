; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70268 () Bool)

(assert start!70268)

(declare-datatypes ((array!19766 0))(
  ( (array!19767 (arr!9690 (Array (_ BitVec 32) (_ BitVec 8))) (size!8604 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19766)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19766)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70268 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8604 a1!721) (size!8604 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8604 a1!721)))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 from!846))))

(assert (=> start!70268 true))

(declare-fun array_inv!8156 (array!19766) Bool)

(assert (=> start!70268 (array_inv!8156 a1!721)))

(assert (=> start!70268 (array_inv!8156 a2!721)))

(declare-fun bs!27241 () Bool)

(assert (= bs!27241 start!70268))

(declare-fun m!456535 () Bool)

(assert (=> bs!27241 m!456535))

(declare-fun m!456537 () Bool)

(assert (=> bs!27241 m!456537))

(push 1)

(assert (not start!70268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

