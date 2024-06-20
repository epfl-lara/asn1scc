; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3688 () Bool)

(assert start!3688)

(declare-datatypes ((Unit!1338 0))(
  ( (Unit!1339) )
))
(declare-datatypes ((tuple2!1970 0))(
  ( (tuple2!1971 (_1!1046 Unit!1338) (_2!1046 (_ BitVec 32))) )
))
(declare-fun lt!24406 () tuple2!1970)

(declare-fun e!10008 () tuple2!1970)

(assert (=> start!3688 (= lt!24406 e!10008)))

(declare-fun c!1081 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3688 (= c!1081 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3688 false))

(assert (=> start!3688 true))

(declare-fun b!16027 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1970)

(assert (=> b!16027 (= e!10008 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16028 () Bool)

(declare-fun Unit!1340 () Unit!1338)

(assert (=> b!16028 (= e!10008 (tuple2!1971 Unit!1340 #b00000000000000000000000001000000))))

(assert (= (and start!3688 c!1081) b!16027))

(assert (= (and start!3688 (not c!1081)) b!16028))

(declare-fun m!22781 () Bool)

(assert (=> b!16027 m!22781))

(check-sat (not b!16027))
