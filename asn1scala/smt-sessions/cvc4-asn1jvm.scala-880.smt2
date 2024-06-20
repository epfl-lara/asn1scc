; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25220 () Bool)

(assert start!25220)

(declare-datatypes ((array!5833 0))(
  ( (array!5834 (arr!3257 (Array (_ BitVec 32) (_ BitVec 64))) (size!2640 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!50 0))(
  ( (Asn1ObjectIdentifier!51 (nCount!36 (_ BitVec 32)) (values!33 array!5833)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!50)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!50)

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((Unit!7900 0))(
  ( (Unit!7901) )
))
(declare-datatypes ((ControlFlow!39 0))(
  ( (Return!38 (value!4547 Bool)) (Proceed!38 (value!4548 Unit!7900)) )
))
(declare-fun Unit!7902 () Unit!7900)

(assert (=> start!25220 (and (bvsge (nCount!36 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!36 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!36 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!36 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!38 (ite (not (= (nCount!36 pVal1!5) (nCount!36 pVal2!5))) (Return!38 false) (Proceed!38 Unit!7902)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!36 pVal1!5)) (bvslt i!528 (nCount!36 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!36 pVal1!5)) (bvsge (bvsub (nCount!36 pVal1!5) (bvadd #b00000000000000000000000000000001 i!528)) (bvsub (nCount!36 pVal1!5) i!528)))))

(declare-fun e!84521 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!50) Bool)

(assert (=> start!25220 (and (inv!11 pVal1!5) e!84521)))

(declare-fun e!84523 () Bool)

(assert (=> start!25220 (and (inv!11 pVal2!5) e!84523)))

(assert (=> start!25220 true))

(declare-fun b!127729 () Bool)

(declare-fun array_inv!2429 (array!5833) Bool)

(assert (=> b!127729 (= e!84521 (array_inv!2429 (values!33 pVal1!5)))))

(declare-fun b!127730 () Bool)

(assert (=> b!127730 (= e!84523 (array_inv!2429 (values!33 pVal2!5)))))

(assert (= start!25220 b!127729))

(assert (= start!25220 b!127730))

(declare-fun m!193477 () Bool)

(assert (=> start!25220 m!193477))

(declare-fun m!193479 () Bool)

(assert (=> start!25220 m!193479))

(declare-fun m!193481 () Bool)

(assert (=> b!127729 m!193481))

(declare-fun m!193483 () Bool)

(assert (=> b!127730 m!193483))

(push 1)

(assert (not b!127729))

(assert (not start!25220))

(assert (not b!127730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

