; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4 () Bool)

(assert start!4)

(declare-datatypes ((array!3 0))(
  ( (array!4 (arr!391 (Array (_ BitVec 32) (_ BitVec 64))) (size!4 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!4 0))(
  ( (Asn1ObjectIdentifier!5 (nCount!13 (_ BitVec 32)) (values!10 array!3)) )
))
(declare-fun pVal!45 () Asn1ObjectIdentifier!4)

(assert (=> start!4 (and (bvsge (nCount!13 pVal!45) #b00000000000000000000000000000010) (bvsge #b00000000000000000000000000000000 (size!4 (values!10 pVal!45))))))

(declare-fun e!22 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!4) Bool)

(assert (=> start!4 (and (inv!11 pVal!45) e!22)))

(declare-fun b!334 () Bool)

(declare-fun array_inv!1 (array!3) Bool)

(assert (=> b!334 (= e!22 (array_inv!1 (values!10 pVal!45)))))

(assert (= start!4 b!334))

(declare-fun m!13 () Bool)

(assert (=> start!4 m!13))

(declare-fun m!15 () Bool)

(assert (=> b!334 m!15))

(push 1)

(assert (not start!4))

(assert (not b!334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!686 () Bool)

(assert (=> d!686 (= (inv!11 pVal!45) (and (= (size!4 (values!10 pVal!45)) #b00000000000000000000000000010100) (bvsge (nCount!13 pVal!45) #b00000000000000000000000000000000)))))

(assert (=> start!4 d!686))

(declare-fun d!690 () Bool)

(assert (=> d!690 (= (array_inv!1 (values!10 pVal!45)) (bvsge (size!4 (values!10 pVal!45)) #b00000000000000000000000000000000))))

(assert (=> b!334 d!690))

(push 1)

(check-sat)

(pop 1)

