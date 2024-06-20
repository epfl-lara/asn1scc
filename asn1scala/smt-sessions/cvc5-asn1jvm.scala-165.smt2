; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3716 () Bool)

(assert start!3716)

(declare-fun b!16082 () Bool)

(declare-fun e!10035 () Bool)

(declare-datatypes ((Unit!1362 0))(
  ( (Unit!1363) )
))
(declare-datatypes ((tuple2!1986 0))(
  ( (tuple2!1987 (_1!1054 Unit!1362) (_2!1054 (_ BitVec 32))) )
))
(declare-fun lt!24430 () tuple2!1986)

(assert (=> b!16082 (= e!10035 (and (not (= (bvand (_2!1054 lt!24430) #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand (_2!1054 lt!24430) #b10000000000000000000000000000000) (bvand (bvsub (_2!1054 lt!24430) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!16080 () Bool)

(declare-fun e!10034 () tuple2!1986)

(declare-fun Unit!1364 () Unit!1362)

(assert (=> b!16080 (= e!10034 (tuple2!1987 Unit!1364 #b00000000000000000000000001000000))))

(declare-fun b!16079 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1986)

(assert (=> b!16079 (= e!10034 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun res!14825 () Bool)

(assert (=> start!3716 (=> (not res!14825) (not e!10035))))

(assert (=> start!3716 (= res!14825 (and (bvsle #b00000000000000000000000000000000 (_2!1054 lt!24430)) (bvsle (_2!1054 lt!24430) #b00000000000000000000000001000000) (bvslt v!288 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3716 (= lt!24430 e!10034)))

(declare-fun c!1105 () Bool)

(assert (=> start!3716 (= c!1105 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3716 e!10035))

(assert (=> start!3716 true))

(declare-fun b!16081 () Bool)

(declare-fun res!14824 () Bool)

(assert (=> b!16081 (=> (not res!14824) (not e!10035))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!16081 (= res!14824 (= (bvor (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (_2!1054 lt!24430))) (bvand v!288 (onesLSBLong!0 (_2!1054 lt!24430)))) v!288))))

(assert (= (and start!3716 c!1105) b!16079))

(assert (= (and start!3716 (not c!1105)) b!16080))

(assert (= (and start!3716 res!14825) b!16081))

(assert (= (and b!16081 res!14824) b!16082))

(declare-fun m!22797 () Bool)

(assert (=> b!16079 m!22797))

(declare-fun m!22799 () Bool)

(assert (=> b!16081 m!22799))

(declare-fun m!22801 () Bool)

(assert (=> b!16081 m!22801))

(push 1)

(assert (not b!16081))

(assert (not b!16079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

