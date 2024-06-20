; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66644 () Bool)

(assert start!66644)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17907 0))(
  ( (array!17908 (arr!8844 (Array (_ BitVec 32) (_ BitVec 8))) (size!7761 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17907)

(assert (=> start!66644 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7761 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsrem from!377 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66644 true))

(declare-fun array_inv!7373 (array!17907) Bool)

(assert (=> start!66644 (array_inv!7373 arr!219)))

(declare-fun bs!25727 () Bool)

(assert (= bs!25727 start!66644))

(declare-fun m!437315 () Bool)

(assert (=> bs!25727 m!437315))

(push 1)

(assert (not start!66644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

