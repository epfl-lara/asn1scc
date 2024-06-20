; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66658 () Bool)

(assert start!66658)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17921 0))(
  ( (array!17922 (arr!8851 (Array (_ BitVec 32) (_ BitVec 8))) (size!7768 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17921)

(assert (=> start!66658 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7768 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsdiv from!377 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66658 true))

(declare-fun array_inv!7380 (array!17921) Bool)

(assert (=> start!66658 (array_inv!7380 arr!219)))

(declare-fun bs!25743 () Bool)

(assert (= bs!25743 start!66658))

(declare-fun m!437329 () Bool)

(assert (=> bs!25743 m!437329))

(push 1)

(assert (not start!66658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

