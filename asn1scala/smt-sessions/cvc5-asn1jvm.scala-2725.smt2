; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66640 () Bool)

(assert start!66640)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17903 0))(
  ( (array!17904 (arr!8842 (Array (_ BitVec 32) (_ BitVec 8))) (size!7759 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17903)

(assert (=> start!66640 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7759 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvsrem from!377 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (=> start!66640 true))

(declare-fun array_inv!7371 (array!17903) Bool)

(assert (=> start!66640 (array_inv!7371 arr!219)))

(declare-fun bs!25725 () Bool)

(assert (= bs!25725 start!66640))

(declare-fun m!437311 () Bool)

(assert (=> bs!25725 m!437311))

(push 1)

(assert (not start!66640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

