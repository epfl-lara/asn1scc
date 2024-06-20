; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3690 () Bool)

(assert start!3690)

(declare-datatypes ((Unit!1341 0))(
  ( (Unit!1342) )
))
(declare-datatypes ((tuple2!1972 0))(
  ( (tuple2!1973 (_1!1047 Unit!1341) (_2!1047 (_ BitVec 32))) )
))
(declare-fun lt!24409 () tuple2!1972)

(declare-fun e!10011 () tuple2!1972)

(assert (=> start!3690 (= lt!24409 e!10011)))

(declare-fun c!1084 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3690 (= c!1084 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3690 false))

(assert (=> start!3690 true))

(declare-fun b!16033 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1972)

(assert (=> b!16033 (= e!10011 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16034 () Bool)

(declare-fun Unit!1343 () Unit!1341)

(assert (=> b!16034 (= e!10011 (tuple2!1973 Unit!1343 #b00000000000000000000000001000000))))

(assert (= (and start!3690 c!1084) b!16033))

(assert (= (and start!3690 (not c!1084)) b!16034))

(declare-fun m!22783 () Bool)

(assert (=> b!16033 m!22783))

(push 1)

(assert (not b!16033))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

