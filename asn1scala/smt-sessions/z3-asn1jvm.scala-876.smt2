; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25178 () Bool)

(assert start!25178)

(declare-datatypes ((array!5803 0))(
  ( (array!5804 (arr!3244 (Array (_ BitVec 32) (_ BitVec 64))) (size!2627 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!24 0))(
  ( (Asn1ObjectIdentifier!25 (nCount!23 (_ BitVec 32)) (values!20 array!5803)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!24)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!24)

(declare-fun i!528 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!7861 0))(
  ( (Unit!7862) )
))
(declare-datatypes ((ControlFlow!26 0))(
  ( (Return!25 (value!4501 Bool)) (Proceed!25 (value!4502 Unit!7861)) )
))
(declare-fun Unit!7863 () Unit!7861)

(assert (=> start!25178 (and (bvsge (nCount!23 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!23 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!23 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!23 pVal2!5) #b00000000000000000000000000010100) (not ((_ is Return!25) (ite (not (= (nCount!23 pVal1!5) (nCount!23 pVal2!5))) (Return!25 false) (Proceed!25 Unit!7863)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!23 pVal1!5)) (bvslt i!528 (nCount!23 pVal1!5)) (not (= (bvand (nCount!23 pVal1!5) #b10000000000000000000000000000000) (bvand i!528 #b10000000000000000000000000000000))) (not (= (bvand (nCount!23 pVal1!5) #b10000000000000000000000000000000) (bvand (bvsub (nCount!23 pVal1!5) i!528) #b10000000000000000000000000000000))))))

(declare-fun e!84365 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!24) Bool)

(assert (=> start!25178 (and (inv!11 pVal1!5) e!84365)))

(declare-fun e!84367 () Bool)

(assert (=> start!25178 (and (inv!11 pVal2!5) e!84367)))

(assert (=> start!25178 true))

(declare-fun b!127651 () Bool)

(declare-fun array_inv!2416 (array!5803) Bool)

(assert (=> b!127651 (= e!84365 (array_inv!2416 (values!20 pVal1!5)))))

(declare-fun b!127652 () Bool)

(assert (=> b!127652 (= e!84367 (array_inv!2416 (values!20 pVal2!5)))))

(assert (= start!25178 b!127651))

(assert (= start!25178 b!127652))

(declare-fun m!193373 () Bool)

(assert (=> start!25178 m!193373))

(declare-fun m!193375 () Bool)

(assert (=> start!25178 m!193375))

(declare-fun m!193377 () Bool)

(assert (=> b!127651 m!193377))

(declare-fun m!193379 () Bool)

(assert (=> b!127652 m!193379))

(check-sat (not b!127651) (not b!127652) (not start!25178))
(check-sat)
