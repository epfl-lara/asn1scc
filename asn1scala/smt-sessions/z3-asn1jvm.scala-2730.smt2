; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66672 () Bool)

(assert start!66672)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17935 0))(
  ( (array!17936 (arr!8858 (Array (_ BitVec 32) (_ BitVec 8))) (size!7775 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17935)

(assert (=> start!66672 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7775 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!17840 ((_ extract 31 0) (bvsdiv from!377 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17840 #b00000000000000000000000000000000) (bvsge bdg!17840 (size!7775 arr!219)))))))

(assert (=> start!66672 true))

(declare-fun array_inv!7387 (array!17935) Bool)

(assert (=> start!66672 (array_inv!7387 arr!219)))

(declare-fun bs!25756 () Bool)

(assert (= bs!25756 start!66672))

(declare-fun m!437343 () Bool)

(assert (=> bs!25756 m!437343))

(check-sat (not start!66672))
(check-sat)
