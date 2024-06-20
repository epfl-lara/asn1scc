; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66654 () Bool)

(assert start!66654)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17917 0))(
  ( (array!17918 (arr!8849 (Array (_ BitVec 32) (_ BitVec 8))) (size!7766 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17917)

(assert (=> start!66654 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7766 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!17839 ((_ extract 31 0) (bvsrem from!377 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17839 #b00000000000000000000000000000000) (bvsge bdg!17839 #b00000000000000000000000000001000))))))

(assert (=> start!66654 true))

(declare-fun array_inv!7378 (array!17917) Bool)

(assert (=> start!66654 (array_inv!7378 arr!219)))

(declare-fun bs!25738 () Bool)

(assert (= bs!25738 start!66654))

(declare-fun m!437325 () Bool)

(assert (=> bs!25738 m!437325))

(check-sat (not start!66654))
(check-sat)
