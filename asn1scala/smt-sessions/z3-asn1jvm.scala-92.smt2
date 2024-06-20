; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2194 () Bool)

(assert start!2194)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!599 0))(
  ( (array!600 (arr!674 (Array (_ BitVec 32) (_ BitVec 8))) (size!257 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!599)

(assert (=> start!2194 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (not (= ((_ sign_extend 32) (size!257 srcBuffer!6)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!257 srcBuffer!6))) ((_ sign_extend 32) (size!257 srcBuffer!6))))))))

(assert (=> start!2194 true))

(declare-fun array_inv!249 (array!599) Bool)

(assert (=> start!2194 (array_inv!249 srcBuffer!6)))

(declare-fun bs!972 () Bool)

(assert (= bs!972 start!2194))

(declare-fun m!15001 () Bool)

(assert (=> bs!972 m!15001))

(check-sat (not start!2194))
(check-sat)
