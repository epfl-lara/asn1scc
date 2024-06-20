; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3720 () Bool)

(assert start!3720)

(declare-fun res!14836 () Bool)

(declare-fun e!10046 () Bool)

(assert (=> start!3720 (=> (not res!14836) (not e!10046))))

(declare-datatypes ((Unit!1368 0))(
  ( (Unit!1369) )
))
(declare-datatypes ((tuple2!1990 0))(
  ( (tuple2!1991 (_1!1056 Unit!1368) (_2!1056 (_ BitVec 32))) )
))
(declare-fun lt!24436 () tuple2!1990)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3720 (= res!14836 (and (bvsle #b00000000000000000000000000000000 (_2!1056 lt!24436)) (bvsle (_2!1056 lt!24436) #b00000000000000000000000001000000) (bvslt v!288 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!10047 () tuple2!1990)

(assert (=> start!3720 (= lt!24436 e!10047)))

(declare-fun c!1111 () Bool)

(assert (=> start!3720 (= c!1111 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3720 e!10046))

(assert (=> start!3720 true))

(declare-fun b!16103 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1990)

(assert (=> b!16103 (= e!10047 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16105 () Bool)

(declare-fun res!14837 () Bool)

(assert (=> b!16105 (=> (not res!14837) (not e!10046))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!16105 (= res!14837 (= (bvor (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (_2!1056 lt!24436))) (bvand v!288 (onesLSBLong!0 (_2!1056 lt!24436)))) v!288))))

(declare-fun b!16106 () Bool)

(assert (=> b!16106 (= e!10046 (and (not (= (bvand (_2!1056 lt!24436) #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand (_2!1056 lt!24436) #b10000000000000000000000000000000) (bvand (bvsub (_2!1056 lt!24436) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!16104 () Bool)

(declare-fun Unit!1370 () Unit!1368)

(assert (=> b!16104 (= e!10047 (tuple2!1991 Unit!1370 #b00000000000000000000000001000000))))

(assert (= (and start!3720 c!1111) b!16103))

(assert (= (and start!3720 (not c!1111)) b!16104))

(assert (= (and start!3720 res!14836) b!16105))

(assert (= (and b!16105 res!14837) b!16106))

(declare-fun m!22809 () Bool)

(assert (=> b!16103 m!22809))

(declare-fun m!22811 () Bool)

(assert (=> b!16105 m!22811))

(declare-fun m!22813 () Bool)

(assert (=> b!16105 m!22813))

(push 1)

(assert (not b!16105))

(assert (not b!16103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

