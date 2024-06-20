; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6 () Bool)

(assert start!6)

(declare-datatypes ((array!5 0))(
  ( (array!6 (arr!392 (Array (_ BitVec 32) (_ BitVec 64))) (size!5 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!6 0))(
  ( (Asn1ObjectIdentifier!7 (nCount!14 (_ BitVec 32)) (values!11 array!5)) )
))
(declare-fun pVal!45 () Asn1ObjectIdentifier!6)

(assert (=> start!6 (and (bvsge (nCount!14 pVal!45) #b00000000000000000000000000000010) (bvsge #b00000000000000000000000000000000 (size!5 (values!11 pVal!45))))))

(declare-fun e!28 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!6) Bool)

(assert (=> start!6 (and (inv!11 pVal!45) e!28)))

(declare-fun b!337 () Bool)

(declare-fun array_inv!2 (array!5) Bool)

(assert (=> b!337 (= e!28 (array_inv!2 (values!11 pVal!45)))))

(assert (= start!6 b!337))

(declare-fun m!17 () Bool)

(assert (=> start!6 m!17))

(declare-fun m!19 () Bool)

(assert (=> b!337 m!19))

(check-sat (not start!6) (not b!337))
(check-sat)
(get-model)

(declare-fun d!688 () Bool)

(assert (=> d!688 (= (inv!11 pVal!45) (and (= (size!5 (values!11 pVal!45)) #b00000000000000000000000000010100) (bvsge (nCount!14 pVal!45) #b00000000000000000000000000000000)))))

(assert (=> start!6 d!688))

(declare-fun d!692 () Bool)

(assert (=> d!692 (= (array_inv!2 (values!11 pVal!45)) (bvsge (size!5 (values!11 pVal!45)) #b00000000000000000000000000000000))))

(assert (=> b!337 d!692))

(check-sat)
