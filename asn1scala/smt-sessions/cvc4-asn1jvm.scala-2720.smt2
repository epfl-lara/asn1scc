; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66614 () Bool)

(assert start!66614)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17889 0))(
  ( (array!17890 (arr!8835 (Array (_ BitVec 32) (_ BitVec 8))) (size!7752 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17889)

(assert (=> start!66614 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (bvsle (bvadd from!377 nBits!491) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7752 arr!219)))) (not (= nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!66614 true))

(declare-fun array_inv!7364 (array!17889) Bool)

(assert (=> start!66614 (array_inv!7364 arr!219)))

(declare-fun bs!25703 () Bool)

(assert (= bs!25703 start!66614))

(declare-fun m!437297 () Bool)

(assert (=> bs!25703 m!437297))

(push 1)

(assert (not start!66614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

