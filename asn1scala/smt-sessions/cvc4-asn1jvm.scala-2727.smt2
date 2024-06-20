; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66656 () Bool)

(assert start!66656)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17919 0))(
  ( (array!17920 (arr!8850 (Array (_ BitVec 32) (_ BitVec 8))) (size!7767 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17919)

(assert (=> start!66656 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7767 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!17839 ((_ extract 31 0) (bvsrem from!377 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17839 #b00000000000000000000000000000000) (bvsge bdg!17839 #b00000000000000000000000000001000))))))

(assert (=> start!66656 true))

(declare-fun array_inv!7379 (array!17919) Bool)

(assert (=> start!66656 (array_inv!7379 arr!219)))

(declare-fun bs!25739 () Bool)

(assert (= bs!25739 start!66656))

(declare-fun m!437327 () Bool)

(assert (=> bs!25739 m!437327))

(push 1)

(assert (not start!66656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

