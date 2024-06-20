; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37980 () Bool)

(assert start!37980)

(declare-fun res!142293 () Bool)

(declare-fun e!119807 () Bool)

(assert (=> start!37980 (=> (not res!142293) (not e!119807))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!37980 (= res!142293 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100)))))

(assert (=> start!37980 e!119807))

(assert (=> start!37980 true))

(declare-datatypes ((array!9115 0))(
  ( (array!9116 (arr!4963 (Array (_ BitVec 32) (_ BitVec 64))) (size!4033 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!88 0))(
  ( (Asn1ObjectIdentifier!89 (nCount!55 (_ BitVec 32)) (values!52 array!9115)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!88)

(declare-fun e!119808 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!88) Bool)

(assert (=> start!37980 (and (inv!11 pVal!32) e!119808)))

(declare-fun b!171590 () Bool)

(assert (=> b!171590 (= e!119807 (not (inv!11 (Asn1ObjectIdentifier!89 (nCount!55 pVal!32) (array!9116 (store (arr!4963 (values!52 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4033 (values!52 pVal!32)))))))))

(declare-fun b!171591 () Bool)

(declare-fun array_inv!3774 (array!9115) Bool)

(assert (=> b!171591 (= e!119808 (array_inv!3774 (values!52 pVal!32)))))

(assert (= (and start!37980 res!142293) b!171590))

(assert (= start!37980 b!171591))

(declare-fun m!270823 () Bool)

(assert (=> start!37980 m!270823))

(declare-fun m!270825 () Bool)

(assert (=> b!171590 m!270825))

(declare-fun m!270827 () Bool)

(assert (=> b!171590 m!270827))

(declare-fun m!270829 () Bool)

(assert (=> b!171591 m!270829))

(push 1)

(assert (not b!171591))

(assert (not b!171590))

(assert (not start!37980))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60751 () Bool)

(assert (=> d!60751 (= (array_inv!3774 (values!52 pVal!32)) (bvsge (size!4033 (values!52 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171591 d!60751))

(declare-fun d!60753 () Bool)

(assert (=> d!60753 (= (inv!11 (Asn1ObjectIdentifier!89 (nCount!55 pVal!32) (array!9116 (store (arr!4963 (values!52 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4033 (values!52 pVal!32))))) (and (= (size!4033 (values!52 (Asn1ObjectIdentifier!89 (nCount!55 pVal!32) (array!9116 (store (arr!4963 (values!52 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4033 (values!52 pVal!32)))))) #b00000000000000000000000000010100) (bvsge (nCount!55 (Asn1ObjectIdentifier!89 (nCount!55 pVal!32) (array!9116 (store (arr!4963 (values!52 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4033 (values!52 pVal!32))))) #b00000000000000000000000000000000)))))

(assert (=> b!171590 d!60753))

(declare-fun d!60757 () Bool)

(assert (=> d!60757 (= (inv!11 pVal!32) (and (= (size!4033 (values!52 pVal!32)) #b00000000000000000000000000010100) (bvsge (nCount!55 pVal!32) #b00000000000000000000000000000000)))))

(assert (=> start!37980 d!60757))

(push 1)

(check-sat)

(pop 1)

