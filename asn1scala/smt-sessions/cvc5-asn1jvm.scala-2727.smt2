; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66652 () Bool)

(assert start!66652)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17915 0))(
  ( (array!17916 (arr!8848 (Array (_ BitVec 32) (_ BitVec 8))) (size!7765 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17915)

(assert (=> start!66652 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7765 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (let ((bdg!17839 ((_ extract 31 0) (bvsrem from!377 #b0000000000000000000000000000000000000000000000000000000000001000)))) (or (bvslt bdg!17839 #b00000000000000000000000000000000) (bvsge bdg!17839 #b00000000000000000000000000001000))))))

(assert (=> start!66652 true))

(declare-fun array_inv!7377 (array!17915) Bool)

(assert (=> start!66652 (array_inv!7377 arr!219)))

(declare-fun bs!25737 () Bool)

(assert (= bs!25737 start!66652))

(declare-fun m!437323 () Bool)

(assert (=> bs!25737 m!437323))

(push 1)

(assert (not start!66652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

