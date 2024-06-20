; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70576 () Bool)

(assert start!70576)

(declare-datatypes ((array!19981 0))(
  ( (array!19982 (arr!9799 (Array (_ BitVec 32) (_ BitVec 8))) (size!8707 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19981)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19981)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70576 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8707 a1!726) (size!8707 a2!726)) (not (= ((_ sign_extend 32) (size!8707 a1!726)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8707 a1!726))) ((_ sign_extend 32) (size!8707 a1!726))))))))

(assert (=> start!70576 true))

(declare-fun array_inv!8259 (array!19981) Bool)

(assert (=> start!70576 (array_inv!8259 a1!726)))

(assert (=> start!70576 (array_inv!8259 a2!726)))

(declare-fun bs!27431 () Bool)

(assert (= bs!27431 start!70576))

(declare-fun m!457979 () Bool)

(assert (=> bs!27431 m!457979))

(declare-fun m!457981 () Bool)

(assert (=> bs!27431 m!457981))

(push 1)

(assert (not start!70576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

