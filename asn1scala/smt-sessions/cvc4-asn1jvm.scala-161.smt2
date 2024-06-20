; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3696 () Bool)

(assert start!3696)

(declare-datatypes ((Unit!1350 0))(
  ( (Unit!1351) )
))
(declare-datatypes ((tuple2!1978 0))(
  ( (tuple2!1979 (_1!1050 Unit!1350) (_2!1050 (_ BitVec 32))) )
))
(declare-fun lt!24418 () tuple2!1978)

(declare-fun e!10020 () tuple2!1978)

(assert (=> start!3696 (= lt!24418 e!10020)))

(declare-fun c!1093 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3696 (= c!1093 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3696 false))

(assert (=> start!3696 true))

(declare-fun b!16051 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1978)

(assert (=> b!16051 (= e!10020 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16052 () Bool)

(declare-fun Unit!1352 () Unit!1350)

(assert (=> b!16052 (= e!10020 (tuple2!1979 Unit!1352 #b00000000000000000000000001000000))))

(assert (= (and start!3696 c!1093) b!16051))

(assert (= (and start!3696 (not c!1093)) b!16052))

(declare-fun m!22789 () Bool)

(assert (=> b!16051 m!22789))

(push 1)

(assert (not b!16051))

(check-sat)

(pop 1)

