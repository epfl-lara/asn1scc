; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25212 () Bool)

(assert start!25212)

(declare-datatypes ((array!5825 0))(
  ( (array!5826 (arr!3253 (Array (_ BitVec 32) (_ BitVec 64))) (size!2636 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!42 0))(
  ( (Asn1ObjectIdentifier!43 (nCount!32 (_ BitVec 32)) (values!29 array!5825)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!42)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!42)

(declare-fun i!528 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!7888 0))(
  ( (Unit!7889) )
))
(declare-datatypes ((ControlFlow!35 0))(
  ( (Return!34 (value!4534 Bool)) (Proceed!34 (value!4535 Unit!7888)) )
))
(declare-fun Unit!7890 () Unit!7888)

(assert (=> start!25212 (and (bvsge (nCount!32 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!32 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!32 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!32 pVal2!5) #b00000000000000000000000000010100) (not ((_ is Return!34) (ite (not (= (nCount!32 pVal1!5) (nCount!32 pVal2!5))) (Return!34 false) (Proceed!34 Unit!7890)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!32 pVal1!5)) (bvslt i!528 (nCount!32 pVal1!5)) (= (bvand i!528 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!528 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!528) #b10000000000000000000000000000000))))))

(declare-fun e!84473 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!42) Bool)

(assert (=> start!25212 (and (inv!11 pVal1!5) e!84473)))

(declare-fun e!84475 () Bool)

(assert (=> start!25212 (and (inv!11 pVal2!5) e!84475)))

(assert (=> start!25212 true))

(declare-fun b!127705 () Bool)

(declare-fun array_inv!2425 (array!5825) Bool)

(assert (=> b!127705 (= e!84473 (array_inv!2425 (values!29 pVal1!5)))))

(declare-fun b!127706 () Bool)

(assert (=> b!127706 (= e!84475 (array_inv!2425 (values!29 pVal2!5)))))

(assert (= start!25212 b!127705))

(assert (= start!25212 b!127706))

(declare-fun m!193445 () Bool)

(assert (=> start!25212 m!193445))

(declare-fun m!193447 () Bool)

(assert (=> start!25212 m!193447))

(declare-fun m!193449 () Bool)

(assert (=> b!127705 m!193449))

(declare-fun m!193451 () Bool)

(assert (=> b!127706 m!193451))

(check-sat (not b!127705) (not b!127706) (not start!25212))
(check-sat)
