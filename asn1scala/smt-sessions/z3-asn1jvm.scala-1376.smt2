; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38074 () Bool)

(assert start!38074)

(declare-fun res!142323 () Bool)

(declare-fun e!119933 () Bool)

(assert (=> start!38074 (=> (not res!142323) (not e!119933))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!38074 (= res!142323 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100)))))

(assert (=> start!38074 e!119933))

(assert (=> start!38074 true))

(declare-datatypes ((array!9152 0))(
  ( (array!9153 (arr!4976 (Array (_ BitVec 32) (_ BitVec 64))) (size!4046 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!114 0))(
  ( (Asn1ObjectIdentifier!115 (nCount!68 (_ BitVec 32)) (values!65 array!9152)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!114)

(declare-fun e!119934 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!114) Bool)

(assert (=> start!38074 (and (inv!11 pVal!32) e!119934)))

(declare-fun b!171695 () Bool)

(declare-datatypes ((Unit!12292 0))(
  ( (Unit!12293) )
))
(declare-datatypes ((tuple3!1028 0))(
  ( (tuple3!1029 (_1!8012 Unit!12292) (_2!8012 (_ BitVec 32)) (_3!640 Asn1ObjectIdentifier!114)) )
))
(declare-fun ObjectIdentifier_InitWhile!0 ((_ BitVec 32) Asn1ObjectIdentifier!114) tuple3!1028)

(assert (=> b!171695 (= e!119933 (bvslt (_2!8012 (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!115 (nCount!68 pVal!32) (array!9153 (store (arr!4976 (values!65 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4046 (values!65 pVal!32)))))) #b00000000000000000000000000010100))))

(declare-fun b!171696 () Bool)

(declare-fun array_inv!3787 (array!9152) Bool)

(assert (=> b!171696 (= e!119934 (array_inv!3787 (values!65 pVal!32)))))

(assert (= (and start!38074 res!142323) b!171695))

(assert (= start!38074 b!171696))

(declare-fun m!270939 () Bool)

(assert (=> start!38074 m!270939))

(declare-fun m!270941 () Bool)

(assert (=> b!171695 m!270941))

(declare-fun m!270943 () Bool)

(assert (=> b!171695 m!270943))

(declare-fun m!270945 () Bool)

(assert (=> b!171696 m!270945))

(check-sat (not b!171695) (not start!38074) (not b!171696))
(check-sat)
(get-model)

(declare-fun d!60827 () Bool)

(declare-fun lt!264775 () tuple3!1028)

(assert (=> d!60827 (and (bvsge (_2!8012 lt!264775) #b00000000000000000000000000000000) (bvsle (_2!8012 lt!264775) #b00000000000000000000000000010100) (bvsge (_2!8012 lt!264775) #b00000000000000000000000000010100))))

(declare-fun e!119949 () tuple3!1028)

(assert (=> d!60827 (= lt!264775 e!119949)))

(declare-fun c!9026 () Bool)

(declare-fun lt!264776 () (_ BitVec 32))

(assert (=> d!60827 (= c!9026 (bvslt lt!264776 #b00000000000000000000000000010100))))

(assert (=> d!60827 (= lt!264776 (bvadd #b00000000000000000000000000000001 i!510 #b00000000000000000000000000000001))))

(declare-fun lt!264774 () Asn1ObjectIdentifier!114)

(assert (=> d!60827 (= lt!264774 (Asn1ObjectIdentifier!115 (nCount!68 (Asn1ObjectIdentifier!115 (nCount!68 pVal!32) (array!9153 (store (arr!4976 (values!65 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4046 (values!65 pVal!32))))) (array!9153 (store (arr!4976 (values!65 (Asn1ObjectIdentifier!115 (nCount!68 pVal!32) (array!9153 (store (arr!4976 (values!65 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4046 (values!65 pVal!32)))))) (bvadd #b00000000000000000000000000000001 i!510) #b0000000000000000000000000000000000000000000000000000000000000000) (size!4046 (values!65 (Asn1ObjectIdentifier!115 (nCount!68 pVal!32) (array!9153 (store (arr!4976 (values!65 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4046 (values!65 pVal!32)))))))))))

(assert (=> d!60827 (and (bvsge (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100))))

(assert (=> d!60827 (= (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!115 (nCount!68 pVal!32) (array!9153 (store (arr!4976 (values!65 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4046 (values!65 pVal!32))))) lt!264775)))

(declare-fun b!171711 () Bool)

(assert (=> b!171711 (= e!119949 (ObjectIdentifier_InitWhile!0 lt!264776 lt!264774))))

(declare-fun b!171712 () Bool)

(declare-fun Unit!12297 () Unit!12292)

(assert (=> b!171712 (= e!119949 (tuple3!1029 Unit!12297 lt!264776 lt!264774))))

(assert (= (and d!60827 c!9026) b!171711))

(assert (= (and d!60827 (not c!9026)) b!171712))

(declare-fun m!270955 () Bool)

(assert (=> d!60827 m!270955))

(declare-fun m!270957 () Bool)

(assert (=> b!171711 m!270957))

(assert (=> b!171695 d!60827))

(declare-fun d!60837 () Bool)

(assert (=> d!60837 (= (inv!11 pVal!32) (and (= (size!4046 (values!65 pVal!32)) #b00000000000000000000000000010100) (bvsge (nCount!68 pVal!32) #b00000000000000000000000000000000)))))

(assert (=> start!38074 d!60837))

(declare-fun d!60841 () Bool)

(assert (=> d!60841 (= (array_inv!3787 (values!65 pVal!32)) (bvsge (size!4046 (values!65 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171696 d!60841))

(check-sat (not b!171711))
(check-sat)
