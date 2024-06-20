; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70524 () Bool)

(assert start!70524)

(declare-fun at!206 () (_ BitVec 64))

(declare-datatypes ((array!19929 0))(
  ( (array!19930 (arr!9773 (Array (_ BitVec 32) (_ BitVec 8))) (size!8681 (_ BitVec 32))) )
))
(declare-fun arr!335 () array!19929)

(assert (=> start!70524 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!206) (not (= ((_ sign_extend 32) (size!8681 arr!335)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8681 arr!335))) ((_ sign_extend 32) (size!8681 arr!335))))))))

(assert (=> start!70524 true))

(declare-fun array_inv!8233 (array!19929) Bool)

(assert (=> start!70524 (array_inv!8233 arr!335)))

(declare-fun bs!27381 () Bool)

(assert (= bs!27381 start!70524))

(declare-fun m!457909 () Bool)

(assert (=> bs!27381 m!457909))

(check-sat (not start!70524))
(check-sat)
