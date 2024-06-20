; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70564 () Bool)

(assert start!70564)

(declare-datatypes ((array!19969 0))(
  ( (array!19970 (arr!9793 (Array (_ BitVec 32) (_ BitVec 8))) (size!8701 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19969)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19969)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70564 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8701 a1!726) (size!8701 a2!726)) (bvsle to!814 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8701 a1!726)))) (bvsgt from!847 to!814))))

(assert (=> start!70564 true))

(declare-fun array_inv!8253 (array!19969) Bool)

(assert (=> start!70564 (array_inv!8253 a1!726)))

(assert (=> start!70564 (array_inv!8253 a2!726)))

(declare-fun bs!27422 () Bool)

(assert (= bs!27422 start!70564))

(declare-fun m!457949 () Bool)

(assert (=> bs!27422 m!457949))

(declare-fun m!457951 () Bool)

(assert (=> bs!27422 m!457951))

(push 1)

(assert (not start!70564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

