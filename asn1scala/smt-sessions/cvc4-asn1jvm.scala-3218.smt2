; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73604 () Bool)

(assert start!73604)

(declare-fun i!1031 () (_ BitVec 64))

(declare-datatypes ((array!21096 0))(
  ( (array!21097 (arr!10248 (Array (_ BitVec 32) (_ BitVec 8))) (size!9156 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21096)

(assert (=> start!73604 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031) (let ((bdg!18918 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9156 a!445))))) (and (bvsle i!1031 bdg!18918) (not (= ((_ sign_extend 32) (size!9156 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18918 ((_ sign_extend 32) (size!9156 a!445))))))))))

(assert (=> start!73604 true))

(declare-fun array_inv!8708 (array!21096) Bool)

(assert (=> start!73604 (array_inv!8708 a!445)))

(declare-fun bs!28330 () Bool)

(assert (= bs!28330 start!73604))

(declare-fun m!463757 () Bool)

(assert (=> bs!28330 m!463757))

(push 1)

(assert (not start!73604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

