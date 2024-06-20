; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38026 () Bool)

(assert start!38026)

(declare-fun res!142305 () Bool)

(declare-fun e!119861 () Bool)

(assert (=> start!38026 (=> (not res!142305) (not e!119861))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!38026 (= res!142305 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvslt (bvadd #b00000000000000000000000000000001 i!510) #b00000000000000000000000000010100)))))

(assert (=> start!38026 e!119861))

(assert (=> start!38026 true))

(declare-datatypes ((array!9134 0))(
  ( (array!9135 (arr!4970 (Array (_ BitVec 32) (_ BitVec 64))) (size!4040 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!102 0))(
  ( (Asn1ObjectIdentifier!103 (nCount!62 (_ BitVec 32)) (values!59 array!9134)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!102)

(declare-fun e!119862 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!102) Bool)

(assert (=> start!38026 (and (inv!11 pVal!32) e!119862)))

(declare-fun b!171623 () Bool)

(declare-datatypes ((Unit!12275 0))(
  ( (Unit!12276) )
))
(declare-datatypes ((tuple3!1016 0))(
  ( (tuple3!1017 (_1!8006 Unit!12275) (_2!8006 (_ BitVec 32)) (_3!634 Asn1ObjectIdentifier!102)) )
))
(declare-fun ObjectIdentifier_InitWhile!0 ((_ BitVec 32) Asn1ObjectIdentifier!102) tuple3!1016)

(assert (=> b!171623 (= e!119861 (bvslt (_2!8006 (ObjectIdentifier_InitWhile!0 (bvadd #b00000000000000000000000000000001 i!510) (Asn1ObjectIdentifier!103 (nCount!62 pVal!32) (array!9135 (store (arr!4970 (values!59 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4040 (values!59 pVal!32)))))) #b00000000000000000000000000000000))))

(declare-fun b!171624 () Bool)

(declare-fun array_inv!3781 (array!9134) Bool)

(assert (=> b!171624 (= e!119862 (array_inv!3781 (values!59 pVal!32)))))

(assert (= (and start!38026 res!142305) b!171623))

(assert (= start!38026 b!171624))

(declare-fun m!270867 () Bool)

(assert (=> start!38026 m!270867))

(declare-fun m!270869 () Bool)

(assert (=> b!171623 m!270869))

(declare-fun m!270871 () Bool)

(assert (=> b!171623 m!270871))

(declare-fun m!270873 () Bool)

(assert (=> b!171624 m!270873))

(check-sat (not b!171624) (not b!171623) (not start!38026))
(check-sat)
(get-model)

(declare-fun d!60789 () Bool)

(assert (=> d!60789 (= (array_inv!3781 (values!59 pVal!32)) (bvsge (size!4040 (values!59 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171624 d!60789))

(declare-fun d!60793 () Bool)

(declare-fun lt!264732 () tuple3!1016)

(assert (=> d!60793 (and (bvsge (_2!8006 lt!264732) #b00000000000000000000000000000000) (bvsle (_2!8006 lt!264732) #b00000000000000000000000000010100) (bvsge (_2!8006 lt!264732) #b00000000000000000000000000010100))))

(declare-fun e!119881 () tuple3!1016)

(assert (=> d!60793 (= lt!264732 e!119881)))

(declare-fun c!9012 () Bool)

(declare-fun lt!264733 () (_ BitVec 32))

(assert (=> d!60793 (= c!9012 (bvslt lt!264733 #b00000000000000000000000000010100))))

(assert (=> d!60793 (= lt!264733 (bvadd #b00000000000000000000000000000001 i!510 #b00000000000000000000000000000001))))

(declare-fun lt!264734 () Asn1ObjectIdentifier!102)

(assert (=> d!60793 (= lt!264734 (Asn1ObjectIdentifier!103 (nCount!62 (Asn1ObjectIdentifier!103 (nCount!62 pVal!32) (array!9135 (store (arr!4970 (values!59 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4040 (values!59 pVal!32))))) (array!9135 (store (arr!4970 (values!59 (Asn1ObjectIdentifier!103 (nCount!62 pVal!32) (array!9135 (store (arr!4970 (values!59 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4040 (values!59 pVal!32)))))) (bvadd #b00000000000000000000000000000001 i!510) #b0000000000000000000000000000000000000000000000000000000000000000) (size!4040 (values!59 (Asn1ObjectIdentifier!103 (nCount!62 pVal!32) (array!9135 (store (arr!4970 (values!59 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4040 (values!59 pVal!32)))))))))))

