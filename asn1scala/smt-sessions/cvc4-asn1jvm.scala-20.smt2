; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!568 () Bool)

(assert start!568)

(declare-fun lt!1250 () (_ BitVec 32))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!568 (= lt!1250 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!568 false))

(assert (=> start!568 true))

(declare-fun bs!473 () Bool)

(assert (= bs!473 start!568))

(declare-fun m!1209 () Bool)

(assert (=> bs!473 m!1209))

(push 1)

(assert (not start!568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

