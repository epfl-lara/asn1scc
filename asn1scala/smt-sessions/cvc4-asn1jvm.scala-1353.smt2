; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37590 () Bool)

(assert start!37590)

(declare-fun lt!263345 () (_ BitVec 64))

(declare-fun exponentVal!1 () (_ BitVec 32))

(declare-fun lt!263344 () (_ BitVec 64))

(assert (=> start!37590 (= lt!263345 (bvand (bvadd ((_ sign_extend 32) exponentVal!1) lt!263344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!37590 (= lt!263344 #b0000000000000000000000000000000000000000000000000000001111111111)))

(assert (=> start!37590 (and (= lt!263345 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!263345 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000110100 ((_ sign_extend 32) exponentVal!1) lt!263344) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!37590 true))

(push 1)

(check-sat)

