; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38048 () Bool)

(assert start!38048)

(declare-fun res!142311 () Bool)

(declare-fun e!119888 () Bool)

(assert (=> start!38048 (=> (not res!142311) (not e!119888))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!38048 (= res!142311 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100)))))

(assert (=> start!38048 e!119888))

(assert (=> start!38048 true))

(declare-datatypes ((array!9141 0))(
  ( (array!9142 (arr!4972 (Array (_ BitVec 32) (_ BitVec 64))) (size!4042 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!106 0))(
  ( (Asn1ObjectIdentifier!107 (nCount!64 (_ BitVec 32)) (values!61 array!9141)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!106)

(declare-fun e!119889 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!106) Bool)

(assert (=> start!38048 (and (inv!11 pVal!32) e!119889)))

(declare-fun b!171653 () Bool)

(declare-datatypes ((Unit!12281 0))(
  ( (Unit!12282) )
))
(declare-datatypes ((tuple3!1020 0))(
  ( (tuple3!1021 (_1!8008 Unit!12281) (_2!8008 (_ BitVec 32)) (_3!636 Asn1ObjectIdentifier!106)) )
))
(declare-fun ObjectIdentifier_InitWhile!0 ((_ BitVec 32) Asn1ObjectIdentifier!106) tuple3!1020)

(assert (=> b!171653 (= e!119888 (bvsgt (_2!8008 (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!107 (nCount!64 pVal!32) (array!9142 (store (arr!4972 (values!61 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4042 (values!61 pVal!32)))))) #b00000000000000000000000000010100))))

(declare-fun b!171654 () Bool)

(declare-fun array_inv!3783 (array!9141) Bool)

(assert (=> b!171654 (= e!119889 (array_inv!3783 (values!61 pVal!32)))))

(assert (= (and start!38048 res!142311) b!171653))

(assert (= start!38048 b!171654))

(declare-fun m!270895 () Bool)

(assert (=> start!38048 m!270895))

(declare-fun m!270897 () Bool)

(assert (=> b!171653 m!270897))

(declare-fun m!270899 () Bool)

(assert (=> b!171653 m!270899))

(declare-fun m!270901 () Bool)

(assert (=> b!171654 m!270901))

(push 1)

(assert (not b!171654))

(assert (not b!171653))

(assert (not start!38048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60805 () Bool)

(assert (=> d!60805 (= (array_inv!3783 (values!61 pVal!32)) (bvsge (size!4042 (values!61 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171654 d!60805))

(declare-fun d!60809 () Bool)

(declare-fun lt!264747 () tuple3!1020)

(assert (=> d!60809 (and (bvsge (_2!8008 lt!264747) #b00000000000000000000000000000000) (bvsle (_2!8008 lt!264747) #b00000000000000000000000000010100) (bvsge (_2!8008 lt!264747) #b00000000000000000000000000010100))))

(declare-fun e!119911 () tuple3!1020)

(assert (=> d!60809 (= lt!264747 e!119911)))

(declare-fun c!9015 () Bool)

(declare-fun lt!264742 () (_ BitVec 32))

(assert (=> d!60809 (= c!9015 (bvslt lt!264742 #b00000000000000000000000000010100))))

(assert (=> d!60809 (= lt!264742 (bvadd #b00000000000000000000000000000001 i!510 #b00000000000000000000000000000001))))

(declare-fun lt!264741 () Asn1ObjectIdentifier!106)

(assert (=> d!60809 (= lt!264741 (Asn1ObjectIdentifier!107 (nCount!64 (Asn1ObjectIdentifier!107 (nCount!64 pVal!32) (array!9142 (store (arr!4972 (values!61 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4042 (values!61 pVal!32))))) (array!9142 (store (arr!4972 (values!61 (Asn1ObjectIdentifier!107 (nCount!64 pVal!32) (array!9142 (store (arr!4972 (values!61 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4042 (values!61 pVal!32)))))) (bvadd #b00000000000000000000000000000001 i!510) #b0000000000000000000000000000000000000000000000000000000000000000) (size!4042 (values!61 (Asn1ObjectIdentifier!107 (nCount!64 pVal!32) (array!9142 (store (arr!4972 (values!61 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4042 (values!61 pVal!32)))))))))))

(assert (=> d!60809 (and (bvsge (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100))))

(assert (=> d!60809 (= (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!107 (nCount!64 pVal!32) (array!9142 (store (arr!4972 (values!61 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4042 (values!61 pVal!32))))) lt!264747)))

(declare-fun b!171671 () Bool)

(assert (=> b!171671 (= e!119911 (ObjectIdentifier_InitWhile!0 lt!264742 lt!264741))))

(declare-fun b!171672 () Bool)

(declare-fun Unit!12287 () Unit!12281)

(assert (=> b!171672 (= e!119911 (tuple3!1021 Unit!12287 lt!264742 lt!264741))))

(assert (= (and d!60809 c!9015) b!171671))

(assert (= (and d!60809 (not c!9015)) b!171672))

(declare-fun m!270919 () Bool)

(assert (=> d!60809 m!270919))

(declare-fun m!270921 () Bool)

(assert (=> b!171671 m!270921))

(assert (=> b!171653 d!60809))

(declare-fun d!60815 () Bool)

(assert (=> d!60815 (= (inv!11 pVal!32) (and (= (size!4042 (values!61 pVal!32)) #b00000000000000000000000000010100) (bvsge (nCount!64 pVal!32) #b00000000000000000000000000000000)))))

(assert (=> start!38048 d!60815))

(push 1)

(assert (not b!171671))

(check-sat)

