; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38072 () Bool)

(assert start!38072)

(declare-fun res!142320 () Bool)

(declare-fun e!119924 () Bool)

(assert (=> start!38072 (=> (not res!142320) (not e!119924))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!38072 (= res!142320 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100)))))

(assert (=> start!38072 e!119924))

(assert (=> start!38072 true))

(declare-datatypes ((array!9150 0))(
  ( (array!9151 (arr!4975 (Array (_ BitVec 32) (_ BitVec 64))) (size!4045 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!112 0))(
  ( (Asn1ObjectIdentifier!113 (nCount!67 (_ BitVec 32)) (values!64 array!9150)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!112)

(declare-fun e!119925 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!112) Bool)

(assert (=> start!38072 (and (inv!11 pVal!32) e!119925)))

(declare-fun b!171689 () Bool)

(declare-datatypes ((Unit!12290 0))(
  ( (Unit!12291) )
))
(declare-datatypes ((tuple3!1026 0))(
  ( (tuple3!1027 (_1!8011 Unit!12290) (_2!8011 (_ BitVec 32)) (_3!639 Asn1ObjectIdentifier!112)) )
))
(declare-fun ObjectIdentifier_InitWhile!0 ((_ BitVec 32) Asn1ObjectIdentifier!112) tuple3!1026)

(assert (=> b!171689 (= e!119924 (bvslt (_2!8011 (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!113 (nCount!67 pVal!32) (array!9151 (store (arr!4975 (values!64 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4045 (values!64 pVal!32)))))) #b00000000000000000000000000010100))))

(declare-fun b!171690 () Bool)

(declare-fun array_inv!3786 (array!9150) Bool)

(assert (=> b!171690 (= e!119925 (array_inv!3786 (values!64 pVal!32)))))

(assert (= (and start!38072 res!142320) b!171689))

(assert (= start!38072 b!171690))

(declare-fun m!270931 () Bool)

(assert (=> start!38072 m!270931))

(declare-fun m!270933 () Bool)

(assert (=> b!171689 m!270933))

(declare-fun m!270935 () Bool)

(assert (=> b!171689 m!270935))

(declare-fun m!270937 () Bool)

(assert (=> b!171690 m!270937))

(push 1)

(assert (not b!171690))

(assert (not b!171689))

(assert (not start!38072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60825 () Bool)

(assert (=> d!60825 (= (array_inv!3786 (values!64 pVal!32)) (bvsge (size!4045 (values!64 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171690 d!60825))

(declare-fun d!60829 () Bool)

(declare-fun lt!264779 () tuple3!1026)

(assert (=> d!60829 (and (bvsge (_2!8011 lt!264779) #b00000000000000000000000000000000) (bvsle (_2!8011 lt!264779) #b00000000000000000000000000010100) (bvsge (_2!8011 lt!264779) #b00000000000000000000000000010100))))

(declare-fun e!119950 () tuple3!1026)

(assert (=> d!60829 (= lt!264779 e!119950)))

(declare-fun c!9027 () Bool)

(declare-fun lt!264777 () (_ BitVec 32))

(assert (=> d!60829 (= c!9027 (bvslt lt!264777 #b00000000000000000000000000010100))))

(assert (=> d!60829 (= lt!264777 (bvadd #b00000000000000000000000000000001 i!510 #b00000000000000000000000000000001))))

(declare-fun lt!264778 () Asn1ObjectIdentifier!112)

(assert (=> d!60829 (= lt!264778 (Asn1ObjectIdentifier!113 (nCount!67 (Asn1ObjectIdentifier!113 (nCount!67 pVal!32) (array!9151 (store (arr!4975 (values!64 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4045 (values!64 pVal!32))))) (array!9151 (store (arr!4975 (values!64 (Asn1ObjectIdentifier!113 (nCount!67 pVal!32) (array!9151 (store (arr!4975 (values!64 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4045 (values!64 pVal!32)))))) (bvadd #b00000000000000000000000000000001 i!510) #b0000000000000000000000000000000000000000000000000000000000000000) (size!4045 (values!64 (Asn1ObjectIdentifier!113 (nCount!67 pVal!32) (array!9151 (store (arr!4975 (values!64 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4045 (values!64 pVal!32)))))))))))

(assert (=> d!60829 (and (bvsge (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100))))

(assert (=> d!60829 (= (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!113 (nCount!67 pVal!32) (array!9151 (store (arr!4975 (values!64 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4045 (values!64 pVal!32))))) lt!264779)))

(declare-fun b!171713 () Bool)

(assert (=> b!171713 (= e!119950 (ObjectIdentifier_InitWhile!0 lt!264777 lt!264778))))

(declare-fun b!171714 () Bool)

(declare-fun Unit!12296 () Unit!12290)

(assert (=> b!171714 (= e!119950 (tuple3!1027 Unit!12296 lt!264777 lt!264778))))

(assert (= (and d!60829 c!9027) b!171713))

(assert (= (and d!60829 (not c!9027)) b!171714))

(declare-fun m!270959 () Bool)

(assert (=> d!60829 m!270959))

(declare-fun m!270961 () Bool)

(assert (=> b!171713 m!270961))

(assert (=> b!171689 d!60829))

(declare-fun d!60839 () Bool)

(assert (=> d!60839 (= (inv!11 pVal!32) (and (= (size!4045 (values!64 pVal!32)) #b00000000000000000000000000010100) (bvsge (nCount!67 pVal!32) #b00000000000000000000000000000000)))))

(assert (=> start!38072 d!60839))

(push 1)

(assert (not b!171713))

(check-sat)

