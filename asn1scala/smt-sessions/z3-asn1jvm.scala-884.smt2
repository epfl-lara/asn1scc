; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25292 () Bool)

(assert start!25292)

(declare-datatypes ((array!5863 0))(
  ( (array!5864 (arr!3268 (Array (_ BitVec 32) (_ BitVec 64))) (size!2651 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!72 0))(
  ( (Asn1ObjectIdentifier!73 (nCount!47 (_ BitVec 32)) (values!44 array!5863)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!72)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!72)

(declare-fun i!528 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!7938 0))(
  ( (Unit!7939) )
))
(declare-datatypes ((ControlFlow!50 0))(
  ( (Return!49 (value!4589 Bool)) (Proceed!49 (value!4590 Unit!7938)) )
))
(declare-fun Unit!7940 () Unit!7938)

(assert (=> start!25292 (and (bvsge (nCount!47 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!47 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!47 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!47 pVal2!5) #b00000000000000000000000000010100) (not ((_ is Return!49) (ite (not (= (nCount!47 pVal1!5) (nCount!47 pVal2!5))) (Return!49 false) (Proceed!49 Unit!7940)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!47 pVal1!5)) (bvslt i!528 (nCount!47 pVal1!5)) (bvsge (bvadd #b00000000000000000000000000000001 i!528) (nCount!47 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000))))

(declare-fun e!84707 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!72) Bool)

(assert (=> start!25292 (and (inv!11 pVal1!5) e!84707)))

(declare-fun e!84709 () Bool)

(assert (=> start!25292 (and (inv!11 pVal2!5) e!84709)))

(assert (=> start!25292 true))

(declare-fun b!127876 () Bool)

(declare-fun array_inv!2440 (array!5863) Bool)

(assert (=> b!127876 (= e!84707 (array_inv!2440 (values!44 pVal1!5)))))

(declare-fun b!127877 () Bool)

(assert (=> b!127877 (= e!84709 (array_inv!2440 (values!44 pVal2!5)))))

(assert (= start!25292 b!127876))

(assert (= start!25292 b!127877))

(declare-fun m!193661 () Bool)

(assert (=> start!25292 m!193661))

(declare-fun m!193663 () Bool)

(assert (=> start!25292 m!193663))

(declare-fun m!193665 () Bool)

(assert (=> b!127876 m!193665))

(declare-fun m!193667 () Bool)

(assert (=> b!127877 m!193667))

(check-sat (not start!25292) (not b!127876) (not b!127877))
(check-sat)
