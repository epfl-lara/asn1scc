; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38076 () Bool)

(assert start!38076)

(declare-fun res!142326 () Bool)

(declare-fun e!119942 () Bool)

(assert (=> start!38076 (=> (not res!142326) (not e!119942))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!38076 (= res!142326 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100)))))

(assert (=> start!38076 e!119942))

(assert (=> start!38076 true))

(declare-datatypes ((array!9154 0))(
  ( (array!9155 (arr!4977 (Array (_ BitVec 32) (_ BitVec 64))) (size!4047 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!116 0))(
  ( (Asn1ObjectIdentifier!117 (nCount!69 (_ BitVec 32)) (values!66 array!9154)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!116)

(declare-fun e!119943 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!116) Bool)

(assert (=> start!38076 (and (inv!11 pVal!32) e!119943)))

(declare-fun b!171701 () Bool)

(declare-datatypes ((Unit!12294 0))(
  ( (Unit!12295) )
))
(declare-datatypes ((tuple3!1030 0))(
  ( (tuple3!1031 (_1!8013 Unit!12294) (_2!8013 (_ BitVec 32)) (_3!641 Asn1ObjectIdentifier!116)) )
))
(declare-fun ObjectIdentifier_InitWhile!0 ((_ BitVec 32) Asn1ObjectIdentifier!116) tuple3!1030)

(assert (=> b!171701 (= e!119942 (bvslt (_2!8013 (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!117 (nCount!69 pVal!32) (array!9155 (store (arr!4977 (values!66 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4047 (values!66 pVal!32)))))) #b00000000000000000000000000010100))))

(declare-fun b!171702 () Bool)

(declare-fun array_inv!3788 (array!9154) Bool)

(assert (=> b!171702 (= e!119943 (array_inv!3788 (values!66 pVal!32)))))

(assert (= (and start!38076 res!142326) b!171701))

(assert (= start!38076 b!171702))

(declare-fun m!270947 () Bool)

(assert (=> start!38076 m!270947))

(declare-fun m!270949 () Bool)

(assert (=> b!171701 m!270949))

(declare-fun m!270951 () Bool)

(assert (=> b!171701 m!270951))

(declare-fun m!270953 () Bool)

(assert (=> b!171702 m!270953))

(push 1)

(assert (not start!38076))

(assert (not b!171702))

(assert (not b!171701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60831 () Bool)

(assert (=> d!60831 (= (inv!11 pVal!32) (and (= (size!4047 (values!66 pVal!32)) #b00000000000000000000000000010100) (bvsge (nCount!69 pVal!32) #b00000000000000000000000000000000)))))

(assert (=> start!38076 d!60831))

(declare-fun d!60833 () Bool)

(assert (=> d!60833 (= (array_inv!3788 (values!66 pVal!32)) (bvsge (size!4047 (values!66 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171702 d!60833))

(declare-fun d!60835 () Bool)

(declare-fun lt!264787 () tuple3!1030)

(assert (=> d!60835 (and (bvsge (_2!8013 lt!264787) #b00000000000000000000000000000000) (bvsle (_2!8013 lt!264787) #b00000000000000000000000000010100) (bvsge (_2!8013 lt!264787) #b00000000000000000000000000010100))))

(declare-fun e!119953 () tuple3!1030)

(assert (=> d!60835 (= lt!264787 e!119953)))

(declare-fun c!9030 () Bool)

(declare-fun lt!264788 () (_ BitVec 32))

(assert (=> d!60835 (= c!9030 (bvslt lt!264788 #b00000000000000000000000000010100))))

(assert (=> d!60835 (= lt!264788 (bvadd #b00000000000000000000000000000001 i!510 #b00000000000000000000000000000001))))

(declare-fun lt!264786 () Asn1ObjectIdentifier!116)

(assert (=> d!60835 (= lt!264786 (Asn1ObjectIdentifier!117 (nCount!69 (Asn1ObjectIdentifier!117 (nCount!69 pVal!32) (array!9155 (store (arr!4977 (values!66 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4047 (values!66 pVal!32))))) (array!9155 (store (arr!4977 (values!66 (Asn1ObjectIdentifier!117 (nCount!69 pVal!32) (array!9155 (store (arr!4977 (values!66 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4047 (values!66 pVal!32)))))) (bvadd #b00000000000000000000000000000001 i!510) #b0000000000000000000000000000000000000000000000000000000000000000) (size!4047 (values!66 (Asn1ObjectIdentifier!117 (nCount!69 pVal!32) (array!9155 (store (arr!4977 (values!66 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4047 (values!66 pVal!32)))))))))))

(assert (=> d!60835 (and (bvsge (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100))))

(assert (=> d!60835 (= (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!117 (nCount!69 pVal!32) (array!9155 (store (arr!4977 (values!66 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4047 (values!66 pVal!32))))) lt!264787)))

(declare-fun b!171719 () Bool)

(assert (=> b!171719 (= e!119953 (ObjectIdentifier_InitWhile!0 lt!264788 lt!264786))))

(declare-fun b!171720 () Bool)

(declare-fun Unit!12298 () Unit!12294)

(assert (=> b!171720 (= e!119953 (tuple3!1031 Unit!12298 lt!264788 lt!264786))))

(assert (= (and d!60835 c!9030) b!171719))

(assert (= (and d!60835 (not c!9030)) b!171720))

(declare-fun m!270963 () Bool)

(assert (=> d!60835 m!270963))

(declare-fun m!270965 () Bool)

(assert (=> b!171719 m!270965))

(assert (=> b!171701 d!60835))

(push 1)

