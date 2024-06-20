; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24 () Bool)

(assert start!24)

(declare-datatypes ((array!14 0))(
  ( (array!15 (arr!395 (Array (_ BitVec 32) (_ BitVec 64))) (size!8 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!12 0))(
  ( (Asn1ObjectIdentifier!13 (nCount!17 (_ BitVec 32)) (values!14 array!14)) )
))
(declare-fun pVal!45 () Asn1ObjectIdentifier!12)

(assert (=> start!24 (and (bvsge (nCount!17 pVal!45) #b00000000000000000000000000000010) (bvsle (select (arr!395 (values!14 pVal!45)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000010) (bvsge #b00000000000000000000000000000001 (size!8 (values!14 pVal!45))))))

(declare-fun e!46 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!12) Bool)

(assert (=> start!24 (and (inv!11 pVal!45) e!46)))

(declare-fun b!346 () Bool)

(declare-fun array_inv!5 (array!14) Bool)

(assert (=> b!346 (= e!46 (array_inv!5 (values!14 pVal!45)))))

(assert (= start!24 b!346))

(declare-fun m!31 () Bool)

(assert (=> start!24 m!31))

(declare-fun m!33 () Bool)

(assert (=> start!24 m!33))

(declare-fun m!35 () Bool)

(assert (=> b!346 m!35))

(check-sat (not start!24) (not b!346))
(check-sat)
(get-model)

(declare-fun d!698 () Bool)

(assert (=> d!698 (= (inv!11 pVal!45) (and (= (size!8 (values!14 pVal!45)) #b00000000000000000000000000010100) (bvsge (nCount!17 pVal!45) #b00000000000000000000000000000000)))))

(assert (=> start!24 d!698))

(declare-fun d!700 () Bool)

(assert (=> d!700 (= (array_inv!5 (values!14 pVal!45)) (bvsge (size!8 (values!14 pVal!45)) #b00000000000000000000000000000000))))

(assert (=> b!346 d!700))

(check-sat)
