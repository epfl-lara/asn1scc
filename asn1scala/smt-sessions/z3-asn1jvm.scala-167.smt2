; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3748 () Bool)

(assert start!3748)

(declare-fun b!16201 () Bool)

(declare-fun res!14885 () Bool)

(declare-fun e!10103 () Bool)

(assert (=> b!16201 (=> (not res!14885) (not e!10103))))

(declare-fun v!288 () (_ BitVec 64))

(declare-datatypes ((Unit!1386 0))(
  ( (Unit!1387) )
))
(declare-datatypes ((tuple2!2000 0))(
  ( (tuple2!2001 (_1!1061 Unit!1386) (_2!1061 (_ BitVec 32))) )
))
(declare-fun lt!24496 () tuple2!2000)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!16201 (= res!14885 (= (bvand v!288 (onesLSBLong!0 (_2!1061 lt!24496))) v!288))))

(declare-fun b!16199 () Bool)

(declare-fun e!10104 () tuple2!2000)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!2000)

(assert (=> b!16199 (= e!10104 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16202 () Bool)

(assert (=> b!16202 (= e!10103 (and (not (= (bvand (_2!1061 lt!24496) #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand (_2!1061 lt!24496) #b10000000000000000000000000000000) (bvand (bvsub (_2!1061 lt!24496) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!16200 () Bool)

(declare-fun Unit!1388 () Unit!1386)

(assert (=> b!16200 (= e!10104 (tuple2!2001 Unit!1388 #b00000000000000000000000001000000))))

(declare-fun res!14884 () Bool)

(assert (=> start!3748 (=> (not res!14884) (not e!10103))))

(assert (=> start!3748 (= res!14884 (and (bvsle #b00000000000000000000000000000000 (_2!1061 lt!24496)) (bvsle (_2!1061 lt!24496) #b00000000000000000000000001000000) (bvsge v!288 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3748 (= lt!24496 e!10104)))

(declare-fun c!1135 () Bool)

(assert (=> start!3748 (= c!1135 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3748 e!10103))

(assert (=> start!3748 true))

(assert (= (and start!3748 c!1135) b!16199))

(assert (= (and start!3748 (not c!1135)) b!16200))

(assert (= (and start!3748 res!14884) b!16201))

(assert (= (and b!16201 res!14885) b!16202))

(declare-fun m!22843 () Bool)

(assert (=> b!16201 m!22843))

(declare-fun m!22845 () Bool)

(assert (=> b!16199 m!22845))

(check-sat (not b!16201) (not b!16199))
(check-sat)
