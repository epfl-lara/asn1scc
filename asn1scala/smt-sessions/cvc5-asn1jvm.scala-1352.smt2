; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37580 () Bool)

(assert start!37580)

(declare-fun lt!263315 () (_ BitVec 64))

(declare-fun exponentVal!1 () (_ BitVec 32))

(assert (=> start!37580 (= lt!263315 (bvand ((_ sign_extend 32) exponentVal!1) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!263314 () (_ BitVec 64))

(assert (=> start!37580 (= lt!263314 #b0000000000000000000000000000000000000000000000000000001111111111)))

(assert (=> start!37580 (and (= lt!263315 (bvand lt!263314 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263315 (bvand (bvadd ((_ sign_extend 32) exponentVal!1) lt!263314) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!37580 true))

(push 1)

(check-sat)

(pop 1)

