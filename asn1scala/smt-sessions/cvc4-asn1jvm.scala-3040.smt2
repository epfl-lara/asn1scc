; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70580 () Bool)

(assert start!70580)

(declare-datatypes ((array!19985 0))(
  ( (array!19986 (arr!9801 (Array (_ BitVec 32) (_ BitVec 8))) (size!8709 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19985)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19985)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70580 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8709 a1!726) (size!8709 a2!726)) (not (= ((_ sign_extend 32) (size!8709 a1!726)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8709 a1!726))) ((_ sign_extend 32) (size!8709 a1!726))))))))

(assert (=> start!70580 true))

(declare-fun array_inv!8261 (array!19985) Bool)

(assert (=> start!70580 (array_inv!8261 a1!726)))

(assert (=> start!70580 (array_inv!8261 a2!726)))

(declare-fun bs!27433 () Bool)

(assert (= bs!27433 start!70580))

(declare-fun m!457987 () Bool)

(assert (=> bs!27433 m!457987))

(declare-fun m!457989 () Bool)

(assert (=> bs!27433 m!457989))

(push 1)

(assert (not start!70580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

