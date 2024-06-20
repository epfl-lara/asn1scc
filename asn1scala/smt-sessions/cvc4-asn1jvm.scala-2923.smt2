; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69692 () Bool)

(assert start!69692)

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19265 0))(
  ( (array!19266 (arr!9438 (Array (_ BitVec 32) (_ BitVec 8))) (size!8358 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19265)

(declare-fun a2!799 () array!19265)

(declare-fun a3!74 () array!19265)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69692 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8358 a1!799) (size!8358 a2!799)) (= (size!8358 a2!799) (size!8358 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8358 a1!799)))) (not (= ((_ sign_extend 32) (size!8358 a2!799)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8358 a2!799))) ((_ sign_extend 32) (size!8358 a2!799))))))))

(assert (=> start!69692 true))

(declare-fun array_inv!7910 (array!19265) Bool)

(assert (=> start!69692 (array_inv!7910 a1!799)))

(assert (=> start!69692 (array_inv!7910 a2!799)))

(assert (=> start!69692 (array_inv!7910 a3!74)))

(declare-fun bs!26932 () Bool)

(assert (= bs!26932 start!69692))

(declare-fun m!451061 () Bool)

(assert (=> bs!26932 m!451061))

(declare-fun m!451063 () Bool)

(assert (=> bs!26932 m!451063))

(declare-fun m!451065 () Bool)

(assert (=> bs!26932 m!451065))

(push 1)

(assert (not start!69692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

