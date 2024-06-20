; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70568 () Bool)

(assert start!70568)

(declare-datatypes ((array!19973 0))(
  ( (array!19974 (arr!9795 (Array (_ BitVec 32) (_ BitVec 8))) (size!8703 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19973)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19973)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70568 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8703 a1!726) (size!8703 a2!726)) (bvsle to!814 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8703 a1!726)))) (bvsgt from!847 to!814))))

(assert (=> start!70568 true))

(declare-fun array_inv!8255 (array!19973) Bool)

(assert (=> start!70568 (array_inv!8255 a1!726)))

(assert (=> start!70568 (array_inv!8255 a2!726)))

(declare-fun bs!27424 () Bool)

(assert (= bs!27424 start!70568))

(declare-fun m!457957 () Bool)

(assert (=> bs!27424 m!457957))

(declare-fun m!457959 () Bool)

(assert (=> bs!27424 m!457959))

(push 1)

(assert (not start!70568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

