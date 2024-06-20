; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25216 () Bool)

(assert start!25216)

(declare-datatypes ((array!5829 0))(
  ( (array!5830 (arr!3255 (Array (_ BitVec 32) (_ BitVec 64))) (size!2638 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!46 0))(
  ( (Asn1ObjectIdentifier!47 (nCount!34 (_ BitVec 32)) (values!31 array!5829)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!46)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!46)

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((Unit!7894 0))(
  ( (Unit!7895) )
))
(declare-datatypes ((ControlFlow!37 0))(
  ( (Return!36 (value!4543 Bool)) (Proceed!36 (value!4544 Unit!7894)) )
))
(declare-fun Unit!7896 () Unit!7894)

(assert (=> start!25216 (and (bvsge (nCount!34 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!34 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!34 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!34 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!36 (ite (not (= (nCount!34 pVal1!5) (nCount!34 pVal2!5))) (Return!36 false) (Proceed!36 Unit!7896)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!34 pVal1!5)) (bvslt i!528 (nCount!34 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!34 pVal1!5)) (bvsge (bvsub (nCount!34 pVal1!5) (bvadd #b00000000000000000000000000000001 i!528)) (bvsub (nCount!34 pVal1!5) i!528)))))

(declare-fun e!84497 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!46) Bool)

(assert (=> start!25216 (and (inv!11 pVal1!5) e!84497)))

(declare-fun e!84499 () Bool)

(assert (=> start!25216 (and (inv!11 pVal2!5) e!84499)))

(assert (=> start!25216 true))

(declare-fun b!127717 () Bool)

(declare-fun array_inv!2427 (array!5829) Bool)

(assert (=> b!127717 (= e!84497 (array_inv!2427 (values!31 pVal1!5)))))

(declare-fun b!127718 () Bool)

(assert (=> b!127718 (= e!84499 (array_inv!2427 (values!31 pVal2!5)))))

(assert (= start!25216 b!127717))

(assert (= start!25216 b!127718))

(declare-fun m!193461 () Bool)

(assert (=> start!25216 m!193461))

(declare-fun m!193463 () Bool)

(assert (=> start!25216 m!193463))

(declare-fun m!193465 () Bool)

(assert (=> b!127717 m!193465))

(declare-fun m!193467 () Bool)

(assert (=> b!127718 m!193467))

(push 1)

(assert (not b!127718))

(assert (not start!25216))

(assert (not b!127717))

(check-sat)

(pop 1)

(push 1)

(check-sat)

