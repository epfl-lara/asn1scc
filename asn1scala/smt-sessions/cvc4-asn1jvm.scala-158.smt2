; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3678 () Bool)

(assert start!3678)

(declare-datatypes ((Unit!1323 0))(
  ( (Unit!1324) )
))
(declare-datatypes ((tuple2!1960 0))(
  ( (tuple2!1961 (_1!1041 Unit!1323) (_2!1041 (_ BitVec 32))) )
))
(declare-fun lt!24391 () tuple2!1960)

(declare-fun e!9993 () tuple2!1960)

(assert (=> start!3678 (= lt!24391 e!9993)))

(declare-fun c!1066 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3678 (= c!1066 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3678 false))

(assert (=> start!3678 true))

(declare-fun b!15997 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1960)

(assert (=> b!15997 (= e!9993 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!15998 () Bool)

(declare-fun Unit!1325 () Unit!1323)

(assert (=> b!15998 (= e!9993 (tuple2!1961 Unit!1325 #b00000000000000000000000001000000))))

(assert (= (and start!3678 c!1066) b!15997))

(assert (= (and start!3678 (not c!1066)) b!15998))

(declare-fun m!22771 () Bool)

(assert (=> b!15997 m!22771))

(push 1)

