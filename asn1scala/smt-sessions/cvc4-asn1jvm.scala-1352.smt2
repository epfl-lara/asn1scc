; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37584 () Bool)

(assert start!37584)

(declare-fun lt!263327 () (_ BitVec 64))

(declare-fun exponentVal!1 () (_ BitVec 32))

(assert (=> start!37584 (= lt!263327 (bvand ((_ sign_extend 32) exponentVal!1) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!263326 () (_ BitVec 64))

(assert (=> start!37584 (= lt!263326 #b0000000000000000000000000000000000000000000000000000001111111111)))

(assert (=> start!37584 (and (= lt!263327 (bvand lt!263326 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263327 (bvand (bvadd ((_ sign_extend 32) exponentVal!1) lt!263326) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!37584 true))

(push 1)

(check-sat)

