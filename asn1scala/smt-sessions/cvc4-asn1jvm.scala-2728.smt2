; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66662 () Bool)

(assert start!66662)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17925 0))(
  ( (array!17926 (arr!8853 (Array (_ BitVec 32) (_ BitVec 8))) (size!7770 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17925)

(assert (=> start!66662 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7770 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsdiv from!377 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66662 true))

(declare-fun array_inv!7382 (array!17925) Bool)

(assert (=> start!66662 (array_inv!7382 arr!219)))

(declare-fun bs!25745 () Bool)

(assert (= bs!25745 start!66662))

(declare-fun m!437333 () Bool)

(assert (=> bs!25745 m!437333))

(push 1)

(assert (not start!66662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

