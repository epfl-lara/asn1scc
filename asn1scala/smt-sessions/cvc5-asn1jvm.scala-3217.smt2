; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73594 () Bool)

(assert start!73594)

(declare-fun i!1031 () (_ BitVec 64))

(declare-datatypes ((array!21086 0))(
  ( (array!21087 (arr!10243 (Array (_ BitVec 32) (_ BitVec 8))) (size!9151 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21086)

(assert (=> start!73594 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031) (not (= ((_ sign_extend 32) (size!9151 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9151 a!445))) ((_ sign_extend 32) (size!9151 a!445))))))))

(assert (=> start!73594 true))

(declare-fun array_inv!8703 (array!21086) Bool)

(assert (=> start!73594 (array_inv!8703 a!445)))

(declare-fun bs!28322 () Bool)

(assert (= bs!28322 start!73594))

(declare-fun m!463747 () Bool)

(assert (=> bs!28322 m!463747))

(push 1)

(assert (not start!73594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

