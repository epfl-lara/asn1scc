; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38000 () Bool)

(assert start!38000)

(declare-fun i!510 () (_ BitVec 32))

(declare-datatypes ((array!9126 0))(
  ( (array!9127 (arr!4967 (Array (_ BitVec 32) (_ BitVec 64))) (size!4037 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!96 0))(
  ( (Asn1ObjectIdentifier!97 (nCount!59 (_ BitVec 32)) (values!56 array!9126)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!96)

(assert (=> start!38000 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvsge i!510 (size!4037 (values!56 pVal!32))))))

(assert (=> start!38000 true))

(declare-fun e!119838 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!96) Bool)

(assert (=> start!38000 (and (inv!11 pVal!32) e!119838)))

(declare-fun b!171609 () Bool)

(declare-fun array_inv!3778 (array!9126) Bool)

(assert (=> b!171609 (= e!119838 (array_inv!3778 (values!56 pVal!32)))))

(assert (= start!38000 b!171609))

(declare-fun m!270851 () Bool)

(assert (=> start!38000 m!270851))

(declare-fun m!270853 () Bool)

(assert (=> b!171609 m!270853))

(check-sat (not start!38000) (not b!171609))
(check-sat)
(get-model)

(declare-fun d!60771 () Bool)

(assert (=> d!60771 (= (inv!11 pVal!32) (and (= (size!4037 (values!56 pVal!32)) #b00000000000000000000000000010100) (bvsge (nCount!59 pVal!32) #b00000000000000000000000000000000)))))

(assert (=> start!38000 d!60771))

(declare-fun d!60773 () Bool)

(assert (=> d!60773 (= (array_inv!3778 (values!56 pVal!32)) (bvsge (size!4037 (values!56 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171609 d!60773))

(check-sat)
