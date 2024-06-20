; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70778 () Bool)

(assert start!70778)

(declare-fun i!979 () (_ BitVec 64))

(declare-datatypes ((array!20095 0))(
  ( (array!20096 (arr!9848 (Array (_ BitVec 32) (_ BitVec 8))) (size!8756 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20095)

(assert (=> start!70778 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979) (let ((bdg!18787 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8756 a!425))))) (and (bvsle i!979 bdg!18787) (not (= ((_ sign_extend 32) (size!8756 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18787 ((_ sign_extend 32) (size!8756 a!425))))))))))

(assert (=> start!70778 true))

(declare-fun array_inv!8308 (array!20095) Bool)

(assert (=> start!70778 (array_inv!8308 a!425)))

(declare-fun bs!27528 () Bool)

(assert (= bs!27528 start!70778))

(declare-fun m!458629 () Bool)

(assert (=> bs!27528 m!458629))

(check-sat (not start!70778))
(check-sat)
