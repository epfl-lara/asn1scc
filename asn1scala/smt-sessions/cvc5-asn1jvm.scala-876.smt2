; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25176 () Bool)

(assert start!25176)

(declare-datatypes ((array!5801 0))(
  ( (array!5802 (arr!3243 (Array (_ BitVec 32) (_ BitVec 64))) (size!2626 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!22 0))(
  ( (Asn1ObjectIdentifier!23 (nCount!22 (_ BitVec 32)) (values!19 array!5801)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!22)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!22)

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((Unit!7858 0))(
  ( (Unit!7859) )
))
(declare-datatypes ((ControlFlow!25 0))(
  ( (Return!24 (value!4499 Bool)) (Proceed!24 (value!4500 Unit!7858)) )
))
(declare-fun Unit!7860 () Unit!7858)

(assert (=> start!25176 (and (bvsge (nCount!22 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!22 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!22 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!22 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!24 (ite (not (= (nCount!22 pVal1!5) (nCount!22 pVal2!5))) (Return!24 false) (Proceed!24 Unit!7860)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!22 pVal1!5)) (bvslt i!528 (nCount!22 pVal1!5)) (not (= (bvand (nCount!22 pVal1!5) #b10000000000000000000000000000000) (bvand i!528 #b10000000000000000000000000000000))) (not (= (bvand (nCount!22 pVal1!5) #b10000000000000000000000000000000) (bvand (bvsub (nCount!22 pVal1!5) i!528) #b10000000000000000000000000000000))))))

(declare-fun e!84353 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!22) Bool)

(assert (=> start!25176 (and (inv!11 pVal1!5) e!84353)))

(declare-fun e!84355 () Bool)

(assert (=> start!25176 (and (inv!11 pVal2!5) e!84355)))

(assert (=> start!25176 true))

(declare-fun b!127645 () Bool)

(declare-fun array_inv!2415 (array!5801) Bool)

(assert (=> b!127645 (= e!84353 (array_inv!2415 (values!19 pVal1!5)))))

(declare-fun b!127646 () Bool)

(assert (=> b!127646 (= e!84355 (array_inv!2415 (values!19 pVal2!5)))))

(assert (= start!25176 b!127645))

(assert (= start!25176 b!127646))

(declare-fun m!193365 () Bool)

(assert (=> start!25176 m!193365))

(declare-fun m!193367 () Bool)

(assert (=> start!25176 m!193367))

(declare-fun m!193369 () Bool)

(assert (=> b!127645 m!193369))

(declare-fun m!193371 () Bool)

(assert (=> b!127646 m!193371))

(push 1)

(assert (not b!127645))

(assert (not start!25176))

(assert (not b!127646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

