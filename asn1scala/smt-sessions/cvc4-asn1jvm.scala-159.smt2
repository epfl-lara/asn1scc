; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3684 () Bool)

(assert start!3684)

(declare-datatypes ((Unit!1332 0))(
  ( (Unit!1333) )
))
(declare-datatypes ((tuple2!1966 0))(
  ( (tuple2!1967 (_1!1044 Unit!1332) (_2!1044 (_ BitVec 32))) )
))
(declare-fun lt!24400 () tuple2!1966)

(declare-fun e!10002 () tuple2!1966)

(assert (=> start!3684 (= lt!24400 e!10002)))

(declare-fun c!1075 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3684 (= c!1075 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3684 false))

(assert (=> start!3684 true))

(declare-fun b!16015 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1966)

(assert (=> b!16015 (= e!10002 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16016 () Bool)

(declare-fun Unit!1334 () Unit!1332)

(assert (=> b!16016 (= e!10002 (tuple2!1967 Unit!1334 #b00000000000000000000000001000000))))

(assert (= (and start!3684 c!1075) b!16015))

(assert (= (and start!3684 (not c!1075)) b!16016))

(declare-fun m!22777 () Bool)

(assert (=> b!16015 m!22777))

(push 1)

(assert (not b!16015))

(check-sat)

(pop 1)

