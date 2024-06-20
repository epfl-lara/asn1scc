; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!570 () Bool)

(assert start!570)

(declare-fun lt!1253 () (_ BitVec 32))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!570 (= lt!1253 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!570 false))

(assert (=> start!570 true))

(declare-fun bs!477 () Bool)

(assert (= bs!477 start!570))

(declare-fun m!1211 () Bool)

(assert (=> bs!477 m!1211))

(push 1)

(assert (not start!570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

