; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66670 () Bool)

(assert start!66670)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17933 0))(
  ( (array!17934 (arr!8857 (Array (_ BitVec 32) (_ BitVec 8))) (size!7774 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17933)

(assert (=> start!66670 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7774 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!17840 ((_ extract 31 0) (bvsdiv from!377 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17840 #b00000000000000000000000000000000) (bvsge bdg!17840 (size!7774 arr!219)))))))

(assert (=> start!66670 true))

(declare-fun array_inv!7386 (array!17933) Bool)

(assert (=> start!66670 (array_inv!7386 arr!219)))

(declare-fun bs!25755 () Bool)

(assert (= bs!25755 start!66670))

(declare-fun m!437341 () Bool)

(assert (=> bs!25755 m!437341))

(push 1)

(assert (not start!66670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

