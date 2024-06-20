; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70772 () Bool)

(assert start!70772)

(declare-fun i!979 () (_ BitVec 64))

(declare-datatypes ((array!20089 0))(
  ( (array!20090 (arr!9845 (Array (_ BitVec 32) (_ BitVec 8))) (size!8753 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20089)

(assert (=> start!70772 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979) (not (= ((_ sign_extend 32) (size!8753 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8753 a!425))) ((_ sign_extend 32) (size!8753 a!425))))))))

(assert (=> start!70772 true))

(declare-fun array_inv!8305 (array!20089) Bool)

(assert (=> start!70772 (array_inv!8305 a!425)))

(declare-fun bs!27522 () Bool)

(assert (= bs!27522 start!70772))

(declare-fun m!458623 () Bool)

(assert (=> bs!27522 m!458623))

(check-sat (not start!70772))
(check-sat)
