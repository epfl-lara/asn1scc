; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3676 () Bool)

(assert start!3676)

(declare-datatypes ((Unit!1320 0))(
  ( (Unit!1321) )
))
(declare-datatypes ((tuple2!1958 0))(
  ( (tuple2!1959 (_1!1040 Unit!1320) (_2!1040 (_ BitVec 32))) )
))
(declare-fun lt!24388 () tuple2!1958)

(declare-fun e!9990 () tuple2!1958)

(assert (=> start!3676 (= lt!24388 e!9990)))

(declare-fun c!1063 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3676 (= c!1063 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3676 false))

(assert (=> start!3676 true))

(declare-fun b!15991 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1958)

(assert (=> b!15991 (= e!9990 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!15992 () Bool)

(declare-fun Unit!1322 () Unit!1320)

(assert (=> b!15992 (= e!9990 (tuple2!1959 Unit!1322 #b00000000000000000000000001000000))))

(assert (= (and start!3676 c!1063) b!15991))

(assert (= (and start!3676 (not c!1063)) b!15992))

(declare-fun m!22769 () Bool)

(assert (=> b!15991 m!22769))

(check-sat (not b!15991))
(check-sat)
