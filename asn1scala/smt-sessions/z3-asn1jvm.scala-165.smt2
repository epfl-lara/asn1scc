; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3718 () Bool)

(assert start!3718)

(declare-fun b!16094 () Bool)

(declare-fun e!10041 () Bool)

(declare-datatypes ((Unit!1365 0))(
  ( (Unit!1366) )
))
(declare-datatypes ((tuple2!1988 0))(
  ( (tuple2!1989 (_1!1055 Unit!1365) (_2!1055 (_ BitVec 32))) )
))
(declare-fun lt!24433 () tuple2!1988)

(assert (=> b!16094 (= e!10041 (and (not (= (bvand (_2!1055 lt!24433) #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand (_2!1055 lt!24433) #b10000000000000000000000000000000) (bvand (bvsub (_2!1055 lt!24433) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!16093 () Bool)

(declare-fun res!14830 () Bool)

(assert (=> b!16093 (=> (not res!14830) (not e!10041))))

(declare-fun v!288 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!16093 (= res!14830 (= (bvor (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (_2!1055 lt!24433))) (bvand v!288 (onesLSBLong!0 (_2!1055 lt!24433)))) v!288))))

(declare-fun b!16091 () Bool)

(declare-fun e!10040 () tuple2!1988)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1988)

(assert (=> b!16091 (= e!10040 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun res!14831 () Bool)

(assert (=> start!3718 (=> (not res!14831) (not e!10041))))

(assert (=> start!3718 (= res!14831 (and (bvsle #b00000000000000000000000000000000 (_2!1055 lt!24433)) (bvsle (_2!1055 lt!24433) #b00000000000000000000000001000000) (bvslt v!288 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3718 (= lt!24433 e!10040)))

(declare-fun c!1108 () Bool)

(assert (=> start!3718 (= c!1108 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3718 e!10041))

(assert (=> start!3718 true))

(declare-fun b!16092 () Bool)

(declare-fun Unit!1367 () Unit!1365)

(assert (=> b!16092 (= e!10040 (tuple2!1989 Unit!1367 #b00000000000000000000000001000000))))

(assert (= (and start!3718 c!1108) b!16091))

(assert (= (and start!3718 (not c!1108)) b!16092))

(assert (= (and start!3718 res!14831) b!16093))

(assert (= (and b!16093 res!14830) b!16094))

(declare-fun m!22803 () Bool)

(assert (=> b!16093 m!22803))

(declare-fun m!22805 () Bool)

(assert (=> b!16093 m!22805))

(declare-fun m!22807 () Bool)

(assert (=> b!16091 m!22807))

(check-sat (not b!16091) (not b!16093))
(check-sat)
