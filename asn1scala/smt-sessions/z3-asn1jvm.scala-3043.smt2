; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70626 () Bool)

(assert start!70626)

(declare-datatypes ((array!20004 0))(
  ( (array!20005 (arr!9809 (Array (_ BitVec 32) (_ BitVec 8))) (size!8717 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20004)

(assert (=> start!70626 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8717 a!422))))))

(declare-fun array_inv!8269 (array!20004) Bool)

(assert (=> start!70626 (array_inv!8269 a!422)))

(declare-fun bs!27456 () Bool)

(assert (= bs!27456 start!70626))

(declare-fun m!458209 () Bool)

(assert (=> bs!27456 m!458209))

(check-sat (not start!70626))
(check-sat)
(get-model)

