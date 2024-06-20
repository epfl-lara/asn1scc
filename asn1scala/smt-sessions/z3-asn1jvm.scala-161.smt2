; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3694 () Bool)

(assert start!3694)

(declare-datatypes ((Unit!1347 0))(
  ( (Unit!1348) )
))
(declare-datatypes ((tuple2!1976 0))(
  ( (tuple2!1977 (_1!1049 Unit!1347) (_2!1049 (_ BitVec 32))) )
))
(declare-fun lt!24415 () tuple2!1976)

(declare-fun e!10017 () tuple2!1976)

(assert (=> start!3694 (= lt!24415 e!10017)))

(declare-fun c!1090 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3694 (= c!1090 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3694 false))

(assert (=> start!3694 true))

(declare-fun b!16045 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1976)

(assert (=> b!16045 (= e!10017 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16046 () Bool)

(declare-fun Unit!1349 () Unit!1347)

(assert (=> b!16046 (= e!10017 (tuple2!1977 Unit!1349 #b00000000000000000000000001000000))))

(assert (= (and start!3694 c!1090) b!16045))

(assert (= (and start!3694 (not c!1090)) b!16046))

(declare-fun m!22787 () Bool)

(assert (=> b!16045 m!22787))

(check-sat (not b!16045))
(check-sat)
