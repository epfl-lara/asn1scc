; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25290 () Bool)

(assert start!25290)

(declare-datatypes ((array!5861 0))(
  ( (array!5862 (arr!3267 (Array (_ BitVec 32) (_ BitVec 64))) (size!2650 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!70 0))(
  ( (Asn1ObjectIdentifier!71 (nCount!46 (_ BitVec 32)) (values!43 array!5861)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!70)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!70)

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((Unit!7935 0))(
  ( (Unit!7936) )
))
(declare-datatypes ((ControlFlow!49 0))(
  ( (Return!48 (value!4587 Bool)) (Proceed!48 (value!4588 Unit!7935)) )
))
(declare-fun Unit!7937 () Unit!7935)

(assert (=> start!25290 (and (bvsge (nCount!46 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!46 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!46 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!46 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!48 (ite (not (= (nCount!46 pVal1!5) (nCount!46 pVal2!5))) (Return!48 false) (Proceed!48 Unit!7937)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!46 pVal1!5)) (bvslt i!528 (nCount!46 pVal1!5)) (bvsge (bvadd #b00000000000000000000000000000001 i!528) (nCount!46 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000))))

(declare-fun e!84695 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!70) Bool)

(assert (=> start!25290 (and (inv!11 pVal1!5) e!84695)))

(declare-fun e!84697 () Bool)

(assert (=> start!25290 (and (inv!11 pVal2!5) e!84697)))

(assert (=> start!25290 true))

(declare-fun b!127870 () Bool)

(declare-fun array_inv!2439 (array!5861) Bool)

(assert (=> b!127870 (= e!84695 (array_inv!2439 (values!43 pVal1!5)))))

(declare-fun b!127871 () Bool)

(assert (=> b!127871 (= e!84697 (array_inv!2439 (values!43 pVal2!5)))))

(assert (= start!25290 b!127870))

(assert (= start!25290 b!127871))

(declare-fun m!193653 () Bool)

(assert (=> start!25290 m!193653))

(declare-fun m!193655 () Bool)

(assert (=> start!25290 m!193655))

(declare-fun m!193657 () Bool)

(assert (=> b!127870 m!193657))

(declare-fun m!193659 () Bool)

(assert (=> b!127871 m!193659))

(push 1)

(assert (not b!127870))

(assert (not b!127871))

(assert (not start!25290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

