; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!540 () Bool)

(assert start!540)

(declare-fun lt!1121 () (_ BitVec 32))

(declare-fun lt!1120 () (_ BitVec 32))

(assert (=> start!540 (= lt!1121 (bvand lt!1120 #b10000000000000000000000000000000))))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!540 (= lt!1120 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!540 (and (= lt!1121 #b00000000000000000000000000000000) (not (= lt!1121 (bvand (bvadd #b00000000000000000000000000001000 lt!1120) #b10000000000000000000000000000000))))))

(assert (=> start!540 true))

(declare-fun bs!459 () Bool)

(assert (= bs!459 start!540))

(declare-fun m!1181 () Bool)

(assert (=> bs!459 m!1181))

(push 1)

(assert (not start!540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1643 () Bool)

(declare-fun e!1038 () (_ BitVec 32))

(declare-datatypes ((Unit!45 0))(
  ( (Unit!46) )
))
