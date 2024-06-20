; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3682 () Bool)

(assert start!3682)

(declare-datatypes ((Unit!1329 0))(
  ( (Unit!1330) )
))
(declare-datatypes ((tuple2!1964 0))(
  ( (tuple2!1965 (_1!1043 Unit!1329) (_2!1043 (_ BitVec 32))) )
))
(declare-fun lt!24397 () tuple2!1964)

(declare-fun e!9999 () tuple2!1964)

(assert (=> start!3682 (= lt!24397 e!9999)))

(declare-fun c!1072 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3682 (= c!1072 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3682 false))

(assert (=> start!3682 true))

(declare-fun b!16009 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1964)

(assert (=> b!16009 (= e!9999 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16010 () Bool)

(declare-fun Unit!1331 () Unit!1329)

(assert (=> b!16010 (= e!9999 (tuple2!1965 Unit!1331 #b00000000000000000000000001000000))))

(assert (= (and start!3682 c!1072) b!16009))

(assert (= (and start!3682 (not c!1072)) b!16010))

(declare-fun m!22775 () Bool)

(assert (=> b!16009 m!22775))

(check-sat (not b!16009))
(check-sat)
