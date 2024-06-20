; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73598 () Bool)

(assert start!73598)

(declare-fun i!1031 () (_ BitVec 64))

(declare-datatypes ((array!21090 0))(
  ( (array!21091 (arr!10245 (Array (_ BitVec 32) (_ BitVec 8))) (size!9153 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21090)

(assert (=> start!73598 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031) (not (= ((_ sign_extend 32) (size!9153 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9153 a!445))) ((_ sign_extend 32) (size!9153 a!445))))))))

(assert (=> start!73598 true))

(declare-fun array_inv!8705 (array!21090) Bool)

(assert (=> start!73598 (array_inv!8705 a!445)))

(declare-fun bs!28324 () Bool)

(assert (= bs!28324 start!73598))

(declare-fun m!463751 () Bool)

(assert (=> bs!28324 m!463751))

(push 1)

(assert (not start!73598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

