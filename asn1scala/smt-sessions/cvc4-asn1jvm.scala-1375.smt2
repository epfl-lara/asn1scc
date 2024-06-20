; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38052 () Bool)

(assert start!38052)

(declare-fun res!142317 () Bool)

(declare-fun e!119906 () Bool)

(assert (=> start!38052 (=> (not res!142317) (not e!119906))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!38052 (= res!142317 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100)))))

(assert (=> start!38052 e!119906))

(assert (=> start!38052 true))

(declare-datatypes ((array!9145 0))(
  ( (array!9146 (arr!4974 (Array (_ BitVec 32) (_ BitVec 64))) (size!4044 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!110 0))(
  ( (Asn1ObjectIdentifier!111 (nCount!66 (_ BitVec 32)) (values!63 array!9145)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!110)

(declare-fun e!119907 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!110) Bool)

(assert (=> start!38052 (and (inv!11 pVal!32) e!119907)))

(declare-fun b!171665 () Bool)

(declare-datatypes ((Unit!12285 0))(
  ( (Unit!12286) )
))
(declare-datatypes ((tuple3!1024 0))(
  ( (tuple3!1025 (_1!8010 Unit!12285) (_2!8010 (_ BitVec 32)) (_3!638 Asn1ObjectIdentifier!110)) )
))
(declare-fun ObjectIdentifier_InitWhile!0 ((_ BitVec 32) Asn1ObjectIdentifier!110) tuple3!1024)

(assert (=> b!171665 (= e!119906 (bvsgt (_2!8010 (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!111 (nCount!66 pVal!32) (array!9146 (store (arr!4974 (values!63 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4044 (values!63 pVal!32)))))) #b00000000000000000000000000010100))))

(declare-fun b!171666 () Bool)

(declare-fun array_inv!3785 (array!9145) Bool)

(assert (=> b!171666 (= e!119907 (array_inv!3785 (values!63 pVal!32)))))

(assert (= (and start!38052 res!142317) b!171665))

(assert (= start!38052 b!171666))

(declare-fun m!270911 () Bool)

(assert (=> start!38052 m!270911))

(declare-fun m!270913 () Bool)

(assert (=> b!171665 m!270913))

(declare-fun m!270915 () Bool)

(assert (=> b!171665 m!270915))

(declare-fun m!270917 () Bool)

(assert (=> b!171666 m!270917))

(push 1)

(assert (not b!171665))

(assert (not start!38052))

(assert (not b!171666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60813 () Bool)

(declare-fun lt!264751 () tuple3!1024)

(assert (=> d!60813 (and (bvsge (_2!8010 lt!264751) #b00000000000000000000000000000000) (bvsle (_2!8010 lt!264751) #b00000000000000000000000000010100) (bvsge (_2!8010 lt!264751) #b00000000000000000000000000010100))))

(declare-fun e!119914 () tuple3!1024)

(assert (=> d!60813 (= lt!264751 e!119914)))

(declare-fun c!9018 () Bool)

(declare-fun lt!264750 () (_ BitVec 32))

(assert (=> d!60813 (= c!9018 (bvslt lt!264750 #b00000000000000000000000000010100))))

(assert (=> d!60813 (= lt!264750 (bvadd #b00000000000000000000000000000001 i!510 #b00000000000000000000000000000001))))

(declare-fun lt!264752 () Asn1ObjectIdentifier!110)

(assert (=> d!60813 (= lt!264752 (Asn1ObjectIdentifier!111 (nCount!66 (Asn1ObjectIdentifier!111 (nCount!66 pVal!32) (array!9146 (store (arr!4974 (values!63 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4044 (values!63 pVal!32))))) (array!9146 (store (arr!4974 (values!63 (Asn1ObjectIdentifier!111 (nCount!66 pVal!32) (array!9146 (store (arr!4974 (values!63 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4044 (values!63 pVal!32)))))) (bvadd #b00000000000000000000000000000001 i!510) #b0000000000000000000000000000000000000000000000000000000000000000) (size!4044 (values!63 (Asn1ObjectIdentifier!111 (nCount!66 pVal!32) (array!9146 (store (arr!4974 (values!63 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4044 (values!63 pVal!32)))))))))))

(assert (=> d!60813 (and (bvsge (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100))))

(assert (=> d!60813 (= (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!111 (nCount!66 pVal!32) (array!9146 (store (arr!4974 (values!63 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4044 (values!63 pVal!32))))) lt!264751)))

(declare-fun b!171677 () Bool)

(assert (=> b!171677 (= e!119914 (ObjectIdentifier_InitWhile!0 lt!264750 lt!264752))))

(declare-fun b!171678 () Bool)

(declare-fun Unit!12288 () Unit!12285)

(assert (=> b!171678 (= e!119914 (tuple3!1025 Unit!12288 lt!264750 lt!264752))))

(assert (= (and d!60813 c!9018) b!171677))

(assert (= (and d!60813 (not c!9018)) b!171678))

(declare-fun m!270923 () Bool)

(assert (=> d!60813 m!270923))

(declare-fun m!270925 () Bool)

(assert (=> b!171677 m!270925))

(assert (=> b!171665 d!60813))

(declare-fun d!60817 () Bool)

(assert (=> d!60817 (= (inv!11 pVal!32) (and (= (size!4044 (values!63 pVal!32)) #b00000000000000000000000000010100) (bvsge (nCount!66 pVal!32) #b00000000000000000000000000000000)))))

(assert (=> start!38052 d!60817))

(declare-fun d!60819 () Bool)

(assert (=> d!60819 (= (array_inv!3785 (values!63 pVal!32)) (bvsge (size!4044 (values!63 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171666 d!60819))

(push 1)

(assert (not b!171677))

(check-sat)

(pop 1)

