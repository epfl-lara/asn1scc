; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!574 () Bool)

(assert start!574)

(declare-fun lt!1259 () (_ BitVec 32))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!574 (= lt!1259 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!574 false))

(assert (=> start!574 true))

(declare-fun bs!479 () Bool)

(assert (= bs!479 start!574))

(declare-fun m!1215 () Bool)

(assert (=> bs!479 m!1215))

(push 1)

(assert (not start!574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

