; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!552 () Bool)

(assert start!552)

(declare-fun lt!1184 () (_ BitVec 32))

(declare-fun lt!1183 () (_ BitVec 32))

(assert (=> start!552 (= lt!1184 (bvand (bvadd #b00000000000000000000000000001000 lt!1183) #b10000000000000000000000000000000))))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!552 (= lt!1183 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!552 (and (not (= lt!1184 #b00000000000000000000000000000000)) (not (= lt!1184 (bvand (bvadd lt!1183 #b00000000000000000000000000000111) #b10000000000000000000000000000000))))))

(assert (=> start!552 true))

(declare-fun bs!465 () Bool)

(assert (= bs!465 start!552))

(declare-fun m!1193 () Bool)

(assert (=> bs!465 m!1193))

(push 1)

(assert (not start!552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1706 () Bool)

(declare-fun c!55 () Bool)

(declare-fun lt!1227 () (_ BitVec 32))

(assert (=> b!1706 (= c!55 (and (bvslt lt!1227 #b00000000000000000000000000111111) (not (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1706 (= lt!1227 #b00000000000000000000000000000000)))

(declare-fun e!1077 () (_ BitVec 32))

(declare-datatypes ((Unit!55 0))(
  ( (Unit!56) )
))
(declare-datatypes ((tuple3!8 0))(
  ( (tuple3!9 (_1!63 Unit!55) (_2!63 (_ BitVec 64)) (_3!4 (_ BitVec 32))) )
))
