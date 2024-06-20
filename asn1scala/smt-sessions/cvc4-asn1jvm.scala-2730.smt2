; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66674 () Bool)

(assert start!66674)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17937 0))(
  ( (array!17938 (arr!8859 (Array (_ BitVec 32) (_ BitVec 8))) (size!7776 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17937)

(assert (=> start!66674 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7776 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!17840 ((_ extract 31 0) (bvsdiv from!377 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17840 #b00000000000000000000000000000000) (bvsge bdg!17840 (size!7776 arr!219)))))))

(assert (=> start!66674 true))

(declare-fun array_inv!7388 (array!17937) Bool)

(assert (=> start!66674 (array_inv!7388 arr!219)))

(declare-fun bs!25757 () Bool)

(assert (= bs!25757 start!66674))

(declare-fun m!437345 () Bool)

(assert (=> bs!25757 m!437345))

(push 1)

(assert (not start!66674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

