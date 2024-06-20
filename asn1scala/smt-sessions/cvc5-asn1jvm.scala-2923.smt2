; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69688 () Bool)

(assert start!69688)

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19261 0))(
  ( (array!19262 (arr!9436 (Array (_ BitVec 32) (_ BitVec 8))) (size!8356 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19261)

(declare-fun a2!799 () array!19261)

(declare-fun a3!74 () array!19261)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69688 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8356 a1!799) (size!8356 a2!799)) (= (size!8356 a2!799) (size!8356 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8356 a1!799)))) (not (= ((_ sign_extend 32) (size!8356 a2!799)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8356 a2!799))) ((_ sign_extend 32) (size!8356 a2!799))))))))

(assert (=> start!69688 true))

(declare-fun array_inv!7908 (array!19261) Bool)

(assert (=> start!69688 (array_inv!7908 a1!799)))

(assert (=> start!69688 (array_inv!7908 a2!799)))

(assert (=> start!69688 (array_inv!7908 a3!74)))

(declare-fun bs!26930 () Bool)

(assert (= bs!26930 start!69688))

(declare-fun m!451049 () Bool)

(assert (=> bs!26930 m!451049))

(declare-fun m!451051 () Bool)

(assert (=> bs!26930 m!451051))

(declare-fun m!451053 () Bool)

(assert (=> bs!26930 m!451053))

(push 1)

(assert (not start!69688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

