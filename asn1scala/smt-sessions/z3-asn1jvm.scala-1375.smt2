; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38050 () Bool)

(assert start!38050)

(declare-fun res!142314 () Bool)

(declare-fun e!119897 () Bool)

(assert (=> start!38050 (=> (not res!142314) (not e!119897))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!38050 (= res!142314 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100)))))

(assert (=> start!38050 e!119897))

(assert (=> start!38050 true))

(declare-datatypes ((array!9143 0))(
  ( (array!9144 (arr!4973 (Array (_ BitVec 32) (_ BitVec 64))) (size!4043 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!108 0))(
  ( (Asn1ObjectIdentifier!109 (nCount!65 (_ BitVec 32)) (values!62 array!9143)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!108)

(declare-fun e!119898 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!108) Bool)

(assert (=> start!38050 (and (inv!11 pVal!32) e!119898)))

(declare-fun b!171659 () Bool)

(declare-datatypes ((Unit!12283 0))(
  ( (Unit!12284) )
))
(declare-datatypes ((tuple3!1022 0))(
  ( (tuple3!1023 (_1!8009 Unit!12283) (_2!8009 (_ BitVec 32)) (_3!637 Asn1ObjectIdentifier!108)) )
))
(declare-fun ObjectIdentifier_InitWhile!0 ((_ BitVec 32) Asn1ObjectIdentifier!108) tuple3!1022)

(assert (=> b!171659 (= e!119897 (bvsgt (_2!8009 (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!109 (nCount!65 pVal!32) (array!9144 (store (arr!4973 (values!62 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4043 (values!62 pVal!32)))))) #b00000000000000000000000000010100))))

(declare-fun b!171660 () Bool)

(declare-fun array_inv!3784 (array!9143) Bool)

(assert (=> b!171660 (= e!119898 (array_inv!3784 (values!62 pVal!32)))))

(assert (= (and start!38050 res!142314) b!171659))

(assert (= start!38050 b!171660))

(declare-fun m!270903 () Bool)

(assert (=> start!38050 m!270903))

(declare-fun m!270905 () Bool)

(assert (=> b!171659 m!270905))

(declare-fun m!270907 () Bool)

(assert (=> b!171659 m!270907))

(declare-fun m!270909 () Bool)

(assert (=> b!171660 m!270909))

(check-sat (not b!171660) (not b!171659) (not start!38050))
(check-sat)
(get-model)

(declare-fun d!60807 () Bool)

(assert (=> d!60807 (= (array_inv!3784 (values!62 pVal!32)) (bvsge (size!4043 (values!62 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171660 d!60807))

(declare-fun d!60811 () Bool)

(declare-fun lt!264760 () tuple3!1022)

(assert (=> d!60811 (and (bvsge (_2!8009 lt!264760) #b00000000000000000000000000000000) (bvsle (_2!8009 lt!264760) #b00000000000000000000000000010100) (bvsge (_2!8009 lt!264760) #b00000000000000000000000000010100))))

(declare-fun e!119917 () tuple3!1022)

(assert (=> d!60811 (= lt!264760 e!119917)))

(declare-fun c!9021 () Bool)

(declare-fun lt!264761 () (_ BitVec 32))

(assert (=> d!60811 (= c!9021 (bvslt lt!264761 #b00000000000000000000000000010100))))

(assert (=> d!60811 (= lt!264761 (bvadd #b00000000000000000000000000000001 i!510 #b00000000000000000000000000000001))))

(declare-fun lt!264759 () Asn1ObjectIdentifier!108)

(assert (=> d!60811 (= lt!264759 (Asn1ObjectIdentifier!109 (nCount!65 (Asn1ObjectIdentifier!109 (nCount!65 pVal!32) (array!9144 (store (arr!4973 (values!62 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4043 (values!62 pVal!32))))) (array!9144 (store (arr!4973 (values!62 (Asn1ObjectIdentifier!109 (nCount!65 pVal!32) (array!9144 (store (arr!4973 (values!62 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4043 (values!62 pVal!32)))))) (bvadd #b00000000000000000000000000000001 i!510) #b0000000000000000000000000000000000000000000000000000000000000000) (size!4043 (values!62 (Asn1ObjectIdentifier!109 (nCount!65 pVal!32) (array!9144 (store (arr!4973 (values!62 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4043 (values!62 pVal!32)))))))))))

(assert (=> d!60811 (and (bvsge (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100))))

(assert (=> d!60811 (= (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!109 (nCount!65 pVal!32) (array!9144 (store (arr!4973 (values!62 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4043 (values!62 pVal!32))))) lt!264760)))

(declare-fun b!171683 () Bool)

(assert (=> b!171683 (= e!119917 (ObjectIdentifier_InitWhile!0 lt!264761 lt!264759))))

(declare-fun b!171684 () Bool)

(declare-fun Unit!12289 () Unit!12283)

(assert (=> b!171684 (= e!119917 (tuple3!1023 Unit!12289 lt!264761 lt!264759))))

(assert (= (and d!60811 c!9021) b!171683))

(assert (= (and d!60811 (not c!9021)) b!171684))

(declare-fun m!270927 () Bool)

(assert (=> d!60811 m!270927))

(declare-fun m!270929 () Bool)

(assert (=> b!171683 m!270929))

(assert (=> b!171659 d!60811))

(declare-fun d!60821 () Bool)

(assert (=> d!60821 (= (inv!11 pVal!32) (and (= (size!4043 (values!62 pVal!32)) #b00000000000000000000000000010100) (bvsge (nCount!65 pVal!32) #b00000000000000000000000000000000)))))

(assert (=> start!38050 d!60821))

(check-sat (not b!171683))
(check-sat)
