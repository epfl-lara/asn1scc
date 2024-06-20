; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66634 () Bool)

(assert start!66634)

(declare-fun from!377 () (_ BitVec 64))

(declare-fun nBits!491 () (_ BitVec 64))

(declare-datatypes ((array!17897 0))(
  ( (array!17898 (arr!8839 (Array (_ BitVec 32) (_ BitVec 8))) (size!7756 (_ BitVec 32))) )
))
(declare-fun arr!219 () array!17897)

(assert (=> start!66634 (and (bvsge from!377 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!491 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!377 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!491)) (not (= ((_ sign_extend 32) (size!7756 arr!219)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7756 arr!219))) ((_ sign_extend 32) (size!7756 arr!219))))))))

(assert (=> start!66634 true))

(declare-fun array_inv!7368 (array!17897) Bool)

(assert (=> start!66634 (array_inv!7368 arr!219)))

(declare-fun bs!25719 () Bool)

(assert (= bs!25719 start!66634))

(declare-fun m!437305 () Bool)

(assert (=> bs!25719 m!437305))

(push 1)

(assert (not start!66634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

