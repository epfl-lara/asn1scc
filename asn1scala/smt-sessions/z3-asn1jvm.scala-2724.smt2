; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66636 () Bool)

(assert start!66636)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17899 0))(
  ( (array!17900 (arr!8840 (Array (_ BitVec 32) (_ BitVec 8))) (size!7757 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17899)

(assert (=> start!66636 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (not (= ((_ sign_extend 32) (size!7757 arr!219)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7757 arr!219))) ((_ sign_extend 32) (size!7757 arr!219))))))))

(assert (=> start!66636 true))

(declare-fun array_inv!7369 (array!17899) Bool)

(assert (=> start!66636 (array_inv!7369 arr!219)))

(declare-fun bs!25720 () Bool)

(assert (= bs!25720 start!66636))

(declare-fun m!437307 () Bool)

(assert (=> bs!25720 m!437307))

(check-sat (not start!66636))
(check-sat)
