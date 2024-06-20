; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37582 () Bool)

(assert start!37582)

(declare-fun lt!263321 () (_ BitVec 64))

(declare-fun exponentVal!1 () (_ BitVec 32))

(assert (=> start!37582 (= lt!263321 (bvand ((_ sign_extend 32) exponentVal!1) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!263320 () (_ BitVec 64))

(assert (=> start!37582 (= lt!263320 #b0000000000000000000000000000000000000000000000000000001111111111)))

(assert (=> start!37582 (and (= lt!263321 (bvand lt!263320 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263321 (bvand (bvadd ((_ sign_extend 32) exponentVal!1) lt!263320) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!37582 true))

(check-sat)
