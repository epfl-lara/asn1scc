; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3746 () Bool)

(assert start!3746)

(declare-fun b!16188 () Bool)

(declare-datatypes ((Unit!1383 0))(
  ( (Unit!1384) )
))
(declare-datatypes ((tuple2!1998 0))(
  ( (tuple2!1999 (_1!1060 Unit!1383) (_2!1060 (_ BitVec 32))) )
))
(declare-fun e!10098 () tuple2!1998)

(declare-fun Unit!1385 () Unit!1383)

(assert (=> b!16188 (= e!10098 (tuple2!1999 Unit!1385 #b00000000000000000000000001000000))))

(declare-fun b!16190 () Bool)

(declare-fun e!10097 () Bool)

(declare-fun lt!24493 () tuple2!1998)

(assert (=> b!16190 (= e!10097 (and (not (= (bvand (_2!1060 lt!24493) #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand (_2!1060 lt!24493) #b10000000000000000000000000000000) (bvand (bvsub (_2!1060 lt!24493) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!16189 () Bool)

(declare-fun res!14879 () Bool)

(assert (=> b!16189 (=> (not res!14879) (not e!10097))))

(declare-fun v!288 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!16189 (= res!14879 (= (bvand v!288 (onesLSBLong!0 (_2!1060 lt!24493))) v!288))))

(declare-fun b!16187 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1998)

(assert (=> b!16187 (= e!10098 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun res!14878 () Bool)

(assert (=> start!3746 (=> (not res!14878) (not e!10097))))

(assert (=> start!3746 (= res!14878 (and (bvsle #b00000000000000000000000000000000 (_2!1060 lt!24493)) (bvsle (_2!1060 lt!24493) #b00000000000000000000000001000000) (bvsge v!288 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3746 (= lt!24493 e!10098)))

(declare-fun c!1132 () Bool)

(assert (=> start!3746 (= c!1132 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3746 e!10097))

(assert (=> start!3746 true))

(assert (= (and start!3746 c!1132) b!16187))

(assert (= (and start!3746 (not c!1132)) b!16188))

(assert (= (and start!3746 res!14878) b!16189))

(assert (= (and b!16189 res!14879) b!16190))

(declare-fun m!22839 () Bool)

(assert (=> b!16189 m!22839))

(declare-fun m!22841 () Bool)

(assert (=> b!16187 m!22841))

(push 1)

(assert (not b!16189))

(assert (not b!16187))

(check-sat)

(pop 1)

(push 1)

(check-sat)

