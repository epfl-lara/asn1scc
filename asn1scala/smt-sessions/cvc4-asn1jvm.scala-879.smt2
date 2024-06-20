; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25214 () Bool)

(assert start!25214)

(declare-datatypes ((array!5827 0))(
  ( (array!5828 (arr!3254 (Array (_ BitVec 32) (_ BitVec 64))) (size!2637 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!44 0))(
  ( (Asn1ObjectIdentifier!45 (nCount!33 (_ BitVec 32)) (values!30 array!5827)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!44)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!44)

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((Unit!7891 0))(
  ( (Unit!7892) )
))
(declare-datatypes ((ControlFlow!36 0))(
  ( (Return!35 (value!4536 Bool)) (Proceed!35 (value!4537 Unit!7891)) )
))
(declare-fun Unit!7893 () Unit!7891)

(assert (=> start!25214 (and (bvsge (nCount!33 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!33 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!33 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!33 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!35 (ite (not (= (nCount!33 pVal1!5) (nCount!33 pVal2!5))) (Return!35 false) (Proceed!35 Unit!7893)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!33 pVal1!5)) (bvslt i!528 (nCount!33 pVal1!5)) (= (bvand i!528 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!528 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!528) #b10000000000000000000000000000000))))))

(declare-fun e!84485 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!44) Bool)

(assert (=> start!25214 (and (inv!11 pVal1!5) e!84485)))

(declare-fun e!84487 () Bool)

(assert (=> start!25214 (and (inv!11 pVal2!5) e!84487)))

(assert (=> start!25214 true))

(declare-fun b!127711 () Bool)

(declare-fun array_inv!2426 (array!5827) Bool)

(assert (=> b!127711 (= e!84485 (array_inv!2426 (values!30 pVal1!5)))))

(declare-fun b!127712 () Bool)

(assert (=> b!127712 (= e!84487 (array_inv!2426 (values!30 pVal2!5)))))

(assert (= start!25214 b!127711))

(assert (= start!25214 b!127712))

(declare-fun m!193453 () Bool)

(assert (=> start!25214 m!193453))

(declare-fun m!193455 () Bool)

(assert (=> start!25214 m!193455))

(declare-fun m!193457 () Bool)

(assert (=> b!127711 m!193457))

(declare-fun m!193459 () Bool)

(assert (=> b!127712 m!193459))

(push 1)

(assert (not start!25214))

(assert (not b!127712))

(assert (not b!127711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

