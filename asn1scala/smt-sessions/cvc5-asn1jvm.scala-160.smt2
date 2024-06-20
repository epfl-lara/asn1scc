; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3686 () Bool)

(assert start!3686)

(declare-datatypes ((Unit!1335 0))(
  ( (Unit!1336) )
))
(declare-datatypes ((tuple2!1968 0))(
  ( (tuple2!1969 (_1!1045 Unit!1335) (_2!1045 (_ BitVec 32))) )
))
(declare-fun lt!24403 () tuple2!1968)

(declare-fun e!10005 () tuple2!1968)

(assert (=> start!3686 (= lt!24403 e!10005)))

(declare-fun c!1078 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3686 (= c!1078 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3686 false))

(assert (=> start!3686 true))

(declare-fun b!16021 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1968)

(assert (=> b!16021 (= e!10005 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16022 () Bool)

(declare-fun Unit!1337 () Unit!1335)

(assert (=> b!16022 (= e!10005 (tuple2!1969 Unit!1337 #b00000000000000000000000001000000))))

(assert (= (and start!3686 c!1078) b!16021))

(assert (= (and start!3686 (not c!1078)) b!16022))

(declare-fun m!22779 () Bool)

(assert (=> b!16021 m!22779))

(push 1)

(assert (not b!16021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

