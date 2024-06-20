; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70906 () Bool)

(assert start!70906)

(declare-datatypes ((array!20189 0))(
  ( (array!20190 (arr!9893 (Array (_ BitVec 32) (_ BitVec 8))) (size!8801 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20189)

(assert (=> start!70906 (and (not (= ((_ sign_extend 32) (size!8801 a!440)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8801 a!440))) ((_ sign_extend 32) (size!8801 a!440))))))))

(declare-fun array_inv!8353 (array!20189) Bool)

(assert (=> start!70906 (array_inv!8353 a!440)))

(declare-fun bs!27585 () Bool)

(assert (= bs!27585 start!70906))

(declare-fun m!458955 () Bool)

(assert (=> bs!27585 m!458955))

(check-sat (not start!70906))
(check-sat)
