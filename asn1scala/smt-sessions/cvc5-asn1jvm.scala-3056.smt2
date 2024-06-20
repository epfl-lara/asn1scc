; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70776 () Bool)

(assert start!70776)

(declare-fun i!979 () (_ BitVec 64))

(declare-datatypes ((array!20093 0))(
  ( (array!20094 (arr!9847 (Array (_ BitVec 32) (_ BitVec 8))) (size!8755 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20093)

(assert (=> start!70776 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979) (let ((bdg!18787 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8755 a!425))))) (and (bvsle i!979 bdg!18787) (not (= ((_ sign_extend 32) (size!8755 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18787 ((_ sign_extend 32) (size!8755 a!425))))))))))

(assert (=> start!70776 true))

(declare-fun array_inv!8307 (array!20093) Bool)

(assert (=> start!70776 (array_inv!8307 a!425)))

(declare-fun bs!27527 () Bool)

(assert (= bs!27527 start!70776))

(declare-fun m!458627 () Bool)

(assert (=> bs!27527 m!458627))

(push 1)

(assert (not start!70776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

