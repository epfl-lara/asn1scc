; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66638 () Bool)

(assert start!66638)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17901 0))(
  ( (array!17902 (arr!8841 (Array (_ BitVec 32) (_ BitVec 8))) (size!7758 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17901)

(assert (=> start!66638 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (not (= ((_ sign_extend 32) (size!7758 arr!219)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7758 arr!219))) ((_ sign_extend 32) (size!7758 arr!219))))))))

(assert (=> start!66638 true))

(declare-fun array_inv!7370 (array!17901) Bool)

(assert (=> start!66638 (array_inv!7370 arr!219)))

(declare-fun bs!25721 () Bool)

(assert (= bs!25721 start!66638))

(declare-fun m!437309 () Bool)

(assert (=> bs!25721 m!437309))

(push 1)

(assert (not start!66638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

