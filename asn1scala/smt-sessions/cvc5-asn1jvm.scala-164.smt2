; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3710 () Bool)

(assert start!3710)

(declare-datatypes ((Unit!1353 0))(
  ( (Unit!1354) )
))
(declare-datatypes ((tuple2!1980 0))(
  ( (tuple2!1981 (_1!1051 Unit!1353) (_2!1051 (_ BitVec 32))) )
))
(declare-fun lt!24421 () tuple2!1980)

(declare-fun e!10023 () tuple2!1980)

(assert (=> start!3710 (= lt!24421 e!10023)))

(declare-fun c!1096 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3710 (= c!1096 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3710 (and (bvsle #b00000000000000000000000000000000 (_2!1051 lt!24421)) (bvsle (_2!1051 lt!24421) #b00000000000000000000000001000000) (bvslt v!288 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= #b00000000000000000000000000000000 (bvand (_2!1051 lt!24421) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 (_2!1051 lt!24421)) #b10000000000000000000000000000000))))))

(assert (=> start!3710 true))

(declare-fun b!16057 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1980)

(assert (=> b!16057 (= e!10023 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16058 () Bool)

(declare-fun Unit!1355 () Unit!1353)

(assert (=> b!16058 (= e!10023 (tuple2!1981 Unit!1355 #b00000000000000000000000001000000))))

(assert (= (and start!3710 c!1096) b!16057))

(assert (= (and start!3710 (not c!1096)) b!16058))

(declare-fun m!22791 () Bool)

(assert (=> b!16057 m!22791))

(push 1)

(assert (not b!16057))

(check-sat)

