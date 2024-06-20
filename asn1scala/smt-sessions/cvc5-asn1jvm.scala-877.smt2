; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25182 () Bool)

(assert start!25182)

(declare-fun i!528 () (_ BitVec 32))

(declare-fun ret!79 () Bool)

(declare-datatypes ((array!5807 0))(
  ( (array!5808 (arr!3246 (Array (_ BitVec 32) (_ BitVec 64))) (size!2629 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!28 0))(
  ( (Asn1ObjectIdentifier!29 (nCount!25 (_ BitVec 32)) (values!22 array!5807)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!28)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!28)

(declare-datatypes ((Unit!7867 0))(
  ( (Unit!7868) )
))
(declare-datatypes ((ControlFlow!28 0))(
  ( (Return!27 (value!4510 Bool)) (Proceed!27 (value!4511 Unit!7867)) )
))
(declare-fun Unit!7869 () Unit!7867)

(assert (=> start!25182 (and (bvsge (nCount!25 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!25 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!25 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!25 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!27 (ite (not (= (nCount!25 pVal1!5) (nCount!25 pVal2!5))) (Return!27 false) (Proceed!27 Unit!7869)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!25 pVal1!5)) (bvslt i!528 (nCount!25 pVal1!5)) ret!79 (bvsge i!528 (size!2629 (values!22 pVal1!5))))))

(declare-fun e!84389 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!28) Bool)

(assert (=> start!25182 (and (inv!11 pVal1!5) e!84389)))

(declare-fun e!84391 () Bool)

(assert (=> start!25182 (and (inv!11 pVal2!5) e!84391)))

(assert (=> start!25182 true))

(declare-fun b!127663 () Bool)

(declare-fun array_inv!2418 (array!5807) Bool)

(assert (=> b!127663 (= e!84389 (array_inv!2418 (values!22 pVal1!5)))))

(declare-fun b!127664 () Bool)

(assert (=> b!127664 (= e!84391 (array_inv!2418 (values!22 pVal2!5)))))

(assert (= start!25182 b!127663))

(assert (= start!25182 b!127664))

(declare-fun m!193389 () Bool)

(assert (=> start!25182 m!193389))

(declare-fun m!193391 () Bool)

(assert (=> start!25182 m!193391))

(declare-fun m!193393 () Bool)

(assert (=> b!127663 m!193393))

(declare-fun m!193395 () Bool)

(assert (=> b!127664 m!193395))

(push 1)

(assert (not start!25182))

(assert (not b!127664))

(assert (not b!127663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

