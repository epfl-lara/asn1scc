; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70676 () Bool)

(assert start!70676)

(declare-datatypes ((array!20035 0))(
  ( (array!20036 (arr!9821 (Array (_ BitVec 32) (_ BitVec 8))) (size!8729 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20035)

(assert (=> start!70676 (and (not (= ((_ sign_extend 32) (size!8729 a!422)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8729 a!422))) ((_ sign_extend 32) (size!8729 a!422))))))))

(declare-fun array_inv!8281 (array!20035) Bool)

(assert (=> start!70676 (array_inv!8281 a!422)))

(declare-fun bs!27477 () Bool)

(assert (= bs!27477 start!70676))

(declare-fun m!458299 () Bool)

(assert (=> bs!27477 m!458299))

(check-sat (not start!70676))
(check-sat)
