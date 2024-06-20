; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!564 () Bool)

(assert start!564)

(declare-fun lt!1244 () (_ BitVec 32))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!564 (= lt!1244 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!564 false))

(assert (=> start!564 true))

(declare-fun bs!471 () Bool)

(assert (= bs!471 start!564))

(declare-fun m!1205 () Bool)

(assert (=> bs!471 m!1205))

(push 1)

(assert (not start!564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

