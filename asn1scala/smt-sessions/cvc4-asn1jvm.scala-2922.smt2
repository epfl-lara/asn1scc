; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69686 () Bool)

(assert start!69686)

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19259 0))(
  ( (array!19260 (arr!9435 (Array (_ BitVec 32) (_ BitVec 8))) (size!8355 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19259)

(declare-fun a2!799 () array!19259)

(declare-fun a3!74 () array!19259)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69686 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8355 a1!799) (size!8355 a2!799)) (= (size!8355 a2!799) (size!8355 a3!74)) (not (= ((_ sign_extend 32) (size!8355 a1!799)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8355 a1!799))) ((_ sign_extend 32) (size!8355 a1!799))))))))

(assert (=> start!69686 true))

(declare-fun array_inv!7907 (array!19259) Bool)

(assert (=> start!69686 (array_inv!7907 a1!799)))

(assert (=> start!69686 (array_inv!7907 a2!799)))

(assert (=> start!69686 (array_inv!7907 a3!74)))

(declare-fun bs!26926 () Bool)

(assert (= bs!26926 start!69686))

(declare-fun m!451043 () Bool)

(assert (=> bs!26926 m!451043))

(declare-fun m!451045 () Bool)

(assert (=> bs!26926 m!451045))

(declare-fun m!451047 () Bool)

(assert (=> bs!26926 m!451047))

(push 1)

(assert (not start!69686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

