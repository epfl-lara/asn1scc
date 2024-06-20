; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38028 () Bool)

(assert start!38028)

(declare-fun res!142308 () Bool)

(declare-fun e!119870 () Bool)

(assert (=> start!38028 (=> (not res!142308) (not e!119870))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!38028 (= res!142308 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100)))))

(assert (=> start!38028 e!119870))

(assert (=> start!38028 true))

(declare-datatypes ((array!9136 0))(
  ( (array!9137 (arr!4971 (Array (_ BitVec 32) (_ BitVec 64))) (size!4041 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!104 0))(
  ( (Asn1ObjectIdentifier!105 (nCount!63 (_ BitVec 32)) (values!60 array!9136)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!104)

(declare-fun e!119871 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!104) Bool)

(assert (=> start!38028 (and (inv!11 pVal!32) e!119871)))

(declare-fun b!171629 () Bool)

(declare-datatypes ((Unit!12277 0))(
  ( (Unit!12278) )
))
(declare-datatypes ((tuple3!1018 0))(
  ( (tuple3!1019 (_1!8007 Unit!12277) (_2!8007 (_ BitVec 32)) (_3!635 Asn1ObjectIdentifier!104)) )
))
(declare-fun ObjectIdentifier_InitWhile!0 ((_ BitVec 32) Asn1ObjectIdentifier!104) tuple3!1018)

(assert (=> b!171629 (= e!119870 (bvslt (_2!8007 (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!105 (nCount!63 pVal!32) (array!9137 (store (arr!4971 (values!60 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4041 (values!60 pVal!32)))))) #b00000000000000000000000000000000))))

(declare-fun b!171630 () Bool)

(declare-fun array_inv!3782 (array!9136) Bool)

(assert (=> b!171630 (= e!119871 (array_inv!3782 (values!60 pVal!32)))))

(assert (= (and start!38028 res!142308) b!171629))

(assert (= start!38028 b!171630))

(declare-fun m!270875 () Bool)

(assert (=> start!38028 m!270875))

(declare-fun m!270877 () Bool)

(assert (=> b!171629 m!270877))

(declare-fun m!270879 () Bool)

(assert (=> b!171629 m!270879))

(declare-fun m!270881 () Bool)

(assert (=> b!171630 m!270881))

(push 1)

(assert (not b!171629))

(assert (not start!38028))

(assert (not b!171630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60791 () Bool)

(declare-fun lt!264725 () tuple3!1018)

(assert (=> d!60791 (and (bvsge (_2!8007 lt!264725) #b00000000000000000000000000000000) (bvsle (_2!8007 lt!264725) #b00000000000000000000000000010100) (bvsge (_2!8007 lt!264725) #b00000000000000000000000000010100))))

(declare-fun e!119878 () tuple3!1018)

(assert (=> d!60791 (= lt!264725 e!119878)))

(declare-fun c!9009 () Bool)

(declare-fun lt!264724 () (_ BitVec 32))

(assert (=> d!60791 (= c!9009 (bvslt lt!264724 #b00000000000000000000000000010100))))

(assert (=> d!60791 (= lt!264724 (bvadd #b00000000000000000000000000000001 i!510 #b00000000000000000000000000000001))))

(declare-fun lt!264723 () Asn1ObjectIdentifier!104)

(assert (=> d!60791 (= lt!264723 (Asn1ObjectIdentifier!105 (nCount!63 (Asn1ObjectIdentifier!105 (nCount!63 pVal!32) (array!9137 (store (arr!4971 (values!60 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4041 (values!60 pVal!32))))) (array!9137 (store (arr!4971 (values!60 (Asn1ObjectIdentifier!105 (nCount!63 pVal!32) (array!9137 (store (arr!4971 (values!60 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4041 (values!60 pVal!32)))))) (bvadd #b00000000000000000000000000000001 i!510) #b0000000000000000000000000000000000000000000000000000000000000000) (size!4041 (values!60 (Asn1ObjectIdentifier!105 (nCount!63 pVal!32) (array!9137 (store (arr!4971 (values!60 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4041 (values!60 pVal!32)))))))))))

(assert (=> d!60791 (and (bvsge (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100))))

(assert (=> d!60791 (= (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!105 (nCount!63 pVal!32) (array!9137 (store (arr!4971 (values!60 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4041 (values!60 pVal!32))))) lt!264725)))

(declare-fun b!171641 () Bool)

(assert (=> b!171641 (= e!119878 (ObjectIdentifier_InitWhile!0 lt!264724 lt!264723))))

(declare-fun b!171642 () Bool)

(declare-fun Unit!12280 () Unit!12277)

(assert (=> b!171642 (= e!119878 (tuple3!1019 Unit!12280 lt!264724 lt!264723))))

(assert (= (and d!60791 c!9009) b!171641))

(assert (= (and d!60791 (not c!9009)) b!171642))

(declare-fun m!270887 () Bool)

(assert (=> d!60791 m!270887))

(declare-fun m!270889 () Bool)

(assert (=> b!171641 m!270889))

(assert (=> b!171629 d!60791))

(declare-fun d!60797 () Bool)

(assert (=> d!60797 (= (inv!11 pVal!32) (and (= (size!4041 (values!60 pVal!32)) #b00000000000000000000000000010100) (bvsge (nCount!63 pVal!32) #b00000000000000000000000000000000)))))

(assert (=> start!38028 d!60797))

(declare-fun d!60799 () Bool)

(assert (=> d!60799 (= (array_inv!3782 (values!60 pVal!32)) (bvsge (size!4041 (values!60 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171630 d!60799))

(push 1)

(assert (not b!171641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

