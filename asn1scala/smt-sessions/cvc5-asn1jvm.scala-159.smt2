; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3680 () Bool)

(assert start!3680)

(declare-datatypes ((Unit!1326 0))(
  ( (Unit!1327) )
))
(declare-datatypes ((tuple2!1962 0))(
  ( (tuple2!1963 (_1!1042 Unit!1326) (_2!1042 (_ BitVec 32))) )
))
(declare-fun lt!24394 () tuple2!1962)

(declare-fun e!9996 () tuple2!1962)

(assert (=> start!3680 (= lt!24394 e!9996)))

(declare-fun c!1069 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3680 (= c!1069 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3680 false))

(assert (=> start!3680 true))

(declare-fun b!16003 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1962)

(assert (=> b!16003 (= e!9996 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16004 () Bool)

(declare-fun Unit!1328 () Unit!1326)

(assert (=> b!16004 (= e!9996 (tuple2!1963 Unit!1328 #b00000000000000000000000001000000))))

(assert (= (and start!3680 c!1069) b!16003))

(assert (= (and start!3680 (not c!1069)) b!16004))

(declare-fun m!22773 () Bool)

(assert (=> b!16003 m!22773))

(push 1)

(assert (not b!16003))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

