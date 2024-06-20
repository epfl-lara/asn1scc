; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37586 () Bool)

(assert start!37586)

(declare-fun lt!263333 () (_ BitVec 64))

(declare-fun exponentVal!1 () (_ BitVec 32))

(declare-fun lt!263332 () (_ BitVec 64))

(assert (=> start!37586 (= lt!263333 (bvand (bvadd ((_ sign_extend 32) exponentVal!1) lt!263332) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!37586 (= lt!263332 #b0000000000000000000000000000000000000000000000000000001111111111)))

(assert (=> start!37586 (and (= lt!263333 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!263333 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000110100 ((_ sign_extend 32) exponentVal!1) lt!263332) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!37586 true))

(push 1)

(check-sat)

(pop 1)

