; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38024 () Bool)

(assert start!38024)

(declare-fun res!142302 () Bool)

(declare-fun e!119852 () Bool)

(assert (=> start!38024 (=> (not res!142302) (not e!119852))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!38024 (= res!142302 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100)))))

(assert (=> start!38024 e!119852))

(assert (=> start!38024 true))

(declare-datatypes ((array!9132 0))(
  ( (array!9133 (arr!4969 (Array (_ BitVec 32) (_ BitVec 64))) (size!4039 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!100 0))(
  ( (Asn1ObjectIdentifier!101 (nCount!61 (_ BitVec 32)) (values!58 array!9132)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!100)

(declare-fun e!119853 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!100) Bool)

(assert (=> start!38024 (and (inv!11 pVal!32) e!119853)))

(declare-fun b!171617 () Bool)

(declare-datatypes ((Unit!12273 0))(
  ( (Unit!12274) )
))
(declare-datatypes ((tuple3!1014 0))(
  ( (tuple3!1015 (_1!8005 Unit!12273) (_2!8005 (_ BitVec 32)) (_3!633 Asn1ObjectIdentifier!100)) )
))
(declare-fun ObjectIdentifier_InitWhile!0 ((_ BitVec 32) Asn1ObjectIdentifier!100) tuple3!1014)

(assert (=> b!171617 (= e!119852 (bvslt (_2!8005 (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!101 (nCount!61 pVal!32) (array!9133 (store (arr!4969 (values!58 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4039 (values!58 pVal!32)))))) #b00000000000000000000000000000000))))

(declare-fun b!171618 () Bool)

(declare-fun array_inv!3780 (array!9132) Bool)

(assert (=> b!171618 (= e!119853 (array_inv!3780 (values!58 pVal!32)))))

(assert (= (and start!38024 res!142302) b!171617))

(assert (= start!38024 b!171618))

(declare-fun m!270859 () Bool)

(assert (=> start!38024 m!270859))

(declare-fun m!270861 () Bool)

(assert (=> b!171617 m!270861))

(declare-fun m!270863 () Bool)

(assert (=> b!171617 m!270863))

(declare-fun m!270865 () Bool)

(assert (=> b!171618 m!270865))

(push 1)

(assert (not b!171618))

(assert (not b!171617))

(assert (not start!38024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60785 () Bool)

(assert (=> d!60785 (= (array_inv!3780 (values!58 pVal!32)) (bvsge (size!4039 (values!58 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171618 d!60785))

(declare-fun d!60787 () Bool)

(declare-fun lt!264714 () tuple3!1014)

(assert (=> d!60787 (and (bvsge (_2!8005 lt!264714) #b00000000000000000000000000000000) (bvsle (_2!8005 lt!264714) #b00000000000000000000000000010100) (bvsge (_2!8005 lt!264714) #b00000000000000000000000000010100))))

(declare-fun e!119875 () tuple3!1014)

(assert (=> d!60787 (= lt!264714 e!119875)))

(declare-fun c!9006 () Bool)

(declare-fun lt!264716 () (_ BitVec 32))

(assert (=> d!60787 (= c!9006 (bvslt lt!264716 #b00000000000000000000000000010100))))

(assert (=> d!60787 (= lt!264716 (bvadd #b00000000000000000000000000000001 i!510 #b00000000000000000000000000000001))))

(declare-fun lt!264715 () Asn1ObjectIdentifier!100)

(assert (=> d!60787 (= lt!264715 (Asn1ObjectIdentifier!101 (nCount!61 (Asn1ObjectIdentifier!101 (nCount!61 pVal!32) (array!9133 (store (arr!4969 (values!58 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4039 (values!58 pVal!32))))) (array!9133 (store (arr!4969 (values!58 (Asn1ObjectIdentifier!101 (nCount!61 pVal!32) (array!9133 (store (arr!4969 (values!58 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4039 (values!58 pVal!32)))))) (bvadd #b00000000000000000000000000000001 i!510) #b0000000000000000000000000000000000000000000000000000000000000000) (size!4039 (values!58 (Asn1ObjectIdentifier!101 (nCount!61 pVal!32) (array!9133 (store (arr!4969 (values!58 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4039 (values!58 pVal!32)))))))))))

(assert (=> d!60787 (and (bvsge (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100))))

(assert (=> d!60787 (= (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!101 (nCount!61 pVal!32) (array!9133 (store (arr!4969 (values!58 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4039 (values!58 pVal!32))))) lt!264714)))

(declare-fun b!171635 () Bool)

(assert (=> b!171635 (= e!119875 (ObjectIdentifier_InitWhile!0 lt!264716 lt!264715))))

(declare-fun b!171636 () Bool)

(declare-fun Unit!12279 () Unit!12273)

(assert (=> b!171636 (= e!119875 (tuple3!1015 Unit!12279 lt!264716 lt!264715))))

(assert (= (and d!60787 c!9006) b!171635))

(assert (= (and d!60787 (not c!9006)) b!171636))

(declare-fun m!270883 () Bool)

(assert (=> d!60787 m!270883))

(declare-fun m!270885 () Bool)

(assert (=> b!171635 m!270885))

(assert (=> b!171617 d!60787))

(declare-fun d!60795 () Bool)

(assert (=> d!60795 (= (inv!11 pVal!32) (and (= (size!4039 (values!58 pVal!32)) #b00000000000000000000000000010100) (bvsge (nCount!61 pVal!32) #b00000000000000000000000000000000)))))

(assert (=> start!38024 d!60795))

(push 1)

(assert (not b!171635))

(check-sat)

