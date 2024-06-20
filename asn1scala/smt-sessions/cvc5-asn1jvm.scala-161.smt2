; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3692 () Bool)

(assert start!3692)

(declare-datatypes ((Unit!1344 0))(
  ( (Unit!1345) )
))
(declare-datatypes ((tuple2!1974 0))(
  ( (tuple2!1975 (_1!1048 Unit!1344) (_2!1048 (_ BitVec 32))) )
))
(declare-fun lt!24412 () tuple2!1974)

(declare-fun e!10014 () tuple2!1974)

(assert (=> start!3692 (= lt!24412 e!10014)))

(declare-fun c!1087 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3692 (= c!1087 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3692 false))

(assert (=> start!3692 true))

(declare-fun b!16039 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1974)

(assert (=> b!16039 (= e!10014 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16040 () Bool)

(declare-fun Unit!1346 () Unit!1344)

(assert (=> b!16040 (= e!10014 (tuple2!1975 Unit!1346 #b00000000000000000000000001000000))))

(assert (= (and start!3692 c!1087) b!16039))

(assert (= (and start!3692 (not c!1087)) b!16040))

(declare-fun m!22785 () Bool)

(assert (=> b!16039 m!22785))

(push 1)

(assert (not b!16039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

