; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37984 () Bool)

(assert start!37984)

(declare-fun res!142299 () Bool)

(declare-fun e!119825 () Bool)

(assert (=> start!37984 (=> (not res!142299) (not e!119825))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!37984 (= res!142299 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100)))))

(assert (=> start!37984 e!119825))

(assert (=> start!37984 true))

(declare-datatypes ((array!9119 0))(
  ( (array!9120 (arr!4965 (Array (_ BitVec 32) (_ BitVec 64))) (size!4035 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!92 0))(
  ( (Asn1ObjectIdentifier!93 (nCount!57 (_ BitVec 32)) (values!54 array!9119)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!92)

(declare-fun e!119826 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!92) Bool)

(assert (=> start!37984 (and (inv!11 pVal!32) e!119826)))

(declare-fun b!171602 () Bool)

(assert (=> b!171602 (= e!119825 (not (inv!11 (Asn1ObjectIdentifier!93 (nCount!57 pVal!32) (array!9120 (store (arr!4965 (values!54 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4035 (values!54 pVal!32)))))))))

(declare-fun b!171603 () Bool)

(declare-fun array_inv!3776 (array!9119) Bool)

(assert (=> b!171603 (= e!119826 (array_inv!3776 (values!54 pVal!32)))))

(assert (= (and start!37984 res!142299) b!171602))

(assert (= start!37984 b!171603))

(declare-fun m!270839 () Bool)

(assert (=> start!37984 m!270839))

(declare-fun m!270841 () Bool)

(assert (=> b!171602 m!270841))

(declare-fun m!270843 () Bool)

(assert (=> b!171602 m!270843))

(declare-fun m!270845 () Bool)

(assert (=> b!171603 m!270845))

(push 1)

(assert (not b!171603))

(assert (not b!171602))

(assert (not start!37984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60755 () Bool)

(assert (=> d!60755 (= (array_inv!3776 (values!54 pVal!32)) (bvsge (size!4035 (values!54 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171603 d!60755))

(declare-fun d!60761 () Bool)

(assert (=> d!60761 (= (inv!11 (Asn1ObjectIdentifier!93 (nCount!57 pVal!32) (array!9120 (store (arr!4965 (values!54 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4035 (values!54 pVal!32))))) (and (= (size!4035 (values!54 (Asn1ObjectIdentifier!93 (nCount!57 pVal!32) (array!9120 (store (arr!4965 (values!54 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4035 (values!54 pVal!32)))))) #b00000000000000000000000000010100) (bvsge (nCount!57 (Asn1ObjectIdentifier!93 (nCount!57 pVal!32) (array!9120 (store (arr!4965 (values!54 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4035 (values!54 pVal!32))))) #b00000000000000000000000000000000)))))

