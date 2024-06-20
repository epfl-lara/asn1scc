; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69682 () Bool)

(assert start!69682)

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19255 0))(
  ( (array!19256 (arr!9433 (Array (_ BitVec 32) (_ BitVec 8))) (size!8353 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19255)

(declare-fun a2!799 () array!19255)

(declare-fun a3!74 () array!19255)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69682 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8353 a1!799) (size!8353 a2!799)) (= (size!8353 a2!799) (size!8353 a3!74)) (not (= ((_ sign_extend 32) (size!8353 a1!799)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8353 a1!799))) ((_ sign_extend 32) (size!8353 a1!799))))))))

(assert (=> start!69682 true))

(declare-fun array_inv!7905 (array!19255) Bool)

(assert (=> start!69682 (array_inv!7905 a1!799)))

(assert (=> start!69682 (array_inv!7905 a2!799)))

(assert (=> start!69682 (array_inv!7905 a3!74)))

(declare-fun bs!26924 () Bool)

(assert (= bs!26924 start!69682))

(declare-fun m!451031 () Bool)

(assert (=> bs!26924 m!451031))

(declare-fun m!451033 () Bool)

(assert (=> bs!26924 m!451033))

(declare-fun m!451035 () Bool)

(assert (=> bs!26924 m!451035))

(push 1)

(assert (not start!69682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

