; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3750 () Bool)

(assert start!3750)

(declare-fun b!16212 () Bool)

(declare-datatypes ((Unit!1389 0))(
  ( (Unit!1390) )
))
(declare-datatypes ((tuple2!2002 0))(
  ( (tuple2!2003 (_1!1062 Unit!1389) (_2!1062 (_ BitVec 32))) )
))
(declare-fun e!10110 () tuple2!2002)

(declare-fun Unit!1391 () Unit!1389)

(assert (=> b!16212 (= e!10110 (tuple2!2003 Unit!1391 #b00000000000000000000000001000000))))

(declare-fun b!16214 () Bool)

(declare-fun e!10109 () Bool)

(declare-fun lt!24499 () tuple2!2002)

(assert (=> b!16214 (= e!10109 (and (not (= (bvand (_2!1062 lt!24499) #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand (_2!1062 lt!24499) #b10000000000000000000000000000000) (bvand (bvsub (_2!1062 lt!24499) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!16213 () Bool)

(declare-fun res!14891 () Bool)

(assert (=> b!16213 (=> (not res!14891) (not e!10109))))

(declare-fun v!288 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!16213 (= res!14891 (= (bvand v!288 (onesLSBLong!0 (_2!1062 lt!24499))) v!288))))

(declare-fun b!16211 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!2002)

(assert (=> b!16211 (= e!10110 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun res!14890 () Bool)

(assert (=> start!3750 (=> (not res!14890) (not e!10109))))

(assert (=> start!3750 (= res!14890 (and (bvsle #b00000000000000000000000000000000 (_2!1062 lt!24499)) (bvsle (_2!1062 lt!24499) #b00000000000000000000000001000000) (bvsge v!288 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3750 (= lt!24499 e!10110)))

(declare-fun c!1138 () Bool)

(assert (=> start!3750 (= c!1138 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3750 e!10109))

(assert (=> start!3750 true))

(assert (= (and start!3750 c!1138) b!16211))

(assert (= (and start!3750 (not c!1138)) b!16212))

(assert (= (and start!3750 res!14890) b!16213))

(assert (= (and b!16213 res!14891) b!16214))

(declare-fun m!22847 () Bool)

(assert (=> b!16213 m!22847))

(declare-fun m!22849 () Bool)

(assert (=> b!16211 m!22849))

(push 1)

(assert (not b!16213))

(assert (not b!16211))

(check-sat)

(pop 1)

