; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70780 () Bool)

(assert start!70780)

(declare-fun i!979 () (_ BitVec 64))

(declare-datatypes ((array!20097 0))(
  ( (array!20098 (arr!9849 (Array (_ BitVec 32) (_ BitVec 8))) (size!8757 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20097)

(assert (=> start!70780 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979) (let ((bdg!18787 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8757 a!425))))) (and (bvsle i!979 bdg!18787) (not (= ((_ sign_extend 32) (size!8757 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18787 ((_ sign_extend 32) (size!8757 a!425))))))))))

(assert (=> start!70780 true))

(declare-fun array_inv!8309 (array!20097) Bool)

(assert (=> start!70780 (array_inv!8309 a!425)))

(declare-fun bs!27529 () Bool)

(assert (= bs!27529 start!70780))

(declare-fun m!458631 () Bool)

(assert (=> bs!27529 m!458631))

(push 1)

(assert (not start!70780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

