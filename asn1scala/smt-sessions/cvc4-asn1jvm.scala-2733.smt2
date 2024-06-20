; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66692 () Bool)

(assert start!66692)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17955 0))(
  ( (array!17956 (arr!8868 (Array (_ BitVec 32) (_ BitVec 8))) (size!7785 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17955)

(assert (=> start!66692 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7785 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsub nBits!491 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!491))))

(assert (=> start!66692 true))

(declare-fun array_inv!7397 (array!17955) Bool)

(assert (=> start!66692 (array_inv!7397 arr!219)))

(declare-fun bs!25775 () Bool)

(assert (= bs!25775 start!66692))

(declare-fun m!437363 () Bool)

(assert (=> bs!25775 m!437363))

(push 1)

(assert (not start!66692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

