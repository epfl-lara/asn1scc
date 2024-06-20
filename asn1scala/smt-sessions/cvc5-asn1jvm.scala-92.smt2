; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2192 () Bool)

(assert start!2192)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!597 0))(
  ( (array!598 (arr!673 (Array (_ BitVec 32) (_ BitVec 8))) (size!256 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!597)

(assert (=> start!2192 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (not (= ((_ sign_extend 32) (size!256 srcBuffer!6)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!256 srcBuffer!6))) ((_ sign_extend 32) (size!256 srcBuffer!6))))))))

(assert (=> start!2192 true))

(declare-fun array_inv!248 (array!597) Bool)

(assert (=> start!2192 (array_inv!248 srcBuffer!6)))

(declare-fun bs!971 () Bool)

(assert (= bs!971 start!2192))

(declare-fun m!14999 () Bool)

(assert (=> bs!971 m!14999))

(push 1)

(assert (not start!2192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

