; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70370 () Bool)

(assert start!70370)

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19835 0))(
  ( (array!19836 (arr!9726 (Array (_ BitVec 32) (_ BitVec 8))) (size!8637 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19835)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19835)

(assert (=> start!70370 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8637 a1!898) (size!8637 a2!898)) (not (= ((_ sign_extend 32) (size!8637 a1!898)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8637 a1!898))) ((_ sign_extend 32) (size!8637 a1!898))))))))

(assert (=> start!70370 true))

(declare-fun array_inv!8189 (array!19835) Bool)

(assert (=> start!70370 (array_inv!8189 a1!898)))

(assert (=> start!70370 (array_inv!8189 a2!898)))

(declare-fun bs!27298 () Bool)

(assert (= bs!27298 start!70370))

(declare-fun m!457015 () Bool)

(assert (=> bs!27298 m!457015))

(declare-fun m!457017 () Bool)

(assert (=> bs!27298 m!457017))

(push 1)

(assert (not start!70370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

