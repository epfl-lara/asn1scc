; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8 () Bool)

(assert start!8)

(declare-datatypes ((array!7 0))(
  ( (array!8 (arr!393 (Array (_ BitVec 32) (_ BitVec 64))) (size!6 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!8 0))(
  ( (Asn1ObjectIdentifier!9 (nCount!15 (_ BitVec 32)) (values!12 array!7)) )
))
(declare-fun pVal!45 () Asn1ObjectIdentifier!8)

(assert (=> start!8 (and (bvsge (nCount!15 pVal!45) #b00000000000000000000000000000010) (bvsge #b00000000000000000000000000000000 (size!6 (values!12 pVal!45))))))

(declare-fun e!34 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!8) Bool)

(assert (=> start!8 (and (inv!11 pVal!45) e!34)))

(declare-fun b!340 () Bool)

(declare-fun array_inv!3 (array!7) Bool)

(assert (=> b!340 (= e!34 (array_inv!3 (values!12 pVal!45)))))

(assert (= start!8 b!340))

(declare-fun m!21 () Bool)

(assert (=> start!8 m!21))

(declare-fun m!23 () Bool)

(assert (=> b!340 m!23))

(push 1)

(assert (not start!8))

(assert (not b!340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!685 () Bool)

(assert (=> d!685 (= (inv!11 pVal!45) (and (= (size!6 (values!12 pVal!45)) #b00000000000000000000000000010100) (bvsge (nCount!15 pVal!45) #b00000000000000000000000000000000)))))

(assert (=> start!8 d!685))

(declare-fun d!694 () Bool)

(assert (=> d!694 (= (array_inv!3 (values!12 pVal!45)) (bvsge (size!6 (values!12 pVal!45)) #b00000000000000000000000000000000))))

(assert (=> b!340 d!694))

(push 1)

(check-sat)

(pop 1)

