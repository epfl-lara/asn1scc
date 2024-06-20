; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25210 () Bool)

(assert start!25210)

(declare-datatypes ((array!5823 0))(
  ( (array!5824 (arr!3252 (Array (_ BitVec 32) (_ BitVec 64))) (size!2635 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!40 0))(
  ( (Asn1ObjectIdentifier!41 (nCount!31 (_ BitVec 32)) (values!28 array!5823)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!40)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!40)

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((Unit!7885 0))(
  ( (Unit!7886) )
))
(declare-datatypes ((ControlFlow!34 0))(
  ( (Return!33 (value!4532 Bool)) (Proceed!33 (value!4533 Unit!7885)) )
))
(declare-fun Unit!7887 () Unit!7885)

(assert (=> start!25210 (and (bvsge (nCount!31 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!31 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!31 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!31 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!33 (ite (not (= (nCount!31 pVal1!5) (nCount!31 pVal2!5))) (Return!33 false) (Proceed!33 Unit!7887)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!31 pVal1!5)) (bvslt i!528 (nCount!31 pVal1!5)) (= (bvand i!528 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!528 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!528) #b10000000000000000000000000000000))))))

(declare-fun e!84461 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!40) Bool)

(assert (=> start!25210 (and (inv!11 pVal1!5) e!84461)))

(declare-fun e!84463 () Bool)

(assert (=> start!25210 (and (inv!11 pVal2!5) e!84463)))

(assert (=> start!25210 true))

(declare-fun b!127699 () Bool)

(declare-fun array_inv!2424 (array!5823) Bool)

(assert (=> b!127699 (= e!84461 (array_inv!2424 (values!28 pVal1!5)))))

(declare-fun b!127700 () Bool)

(assert (=> b!127700 (= e!84463 (array_inv!2424 (values!28 pVal2!5)))))

(assert (= start!25210 b!127699))

(assert (= start!25210 b!127700))

(declare-fun m!193437 () Bool)

(assert (=> start!25210 m!193437))

(declare-fun m!193439 () Bool)

(assert (=> start!25210 m!193439))

(declare-fun m!193441 () Bool)

(assert (=> b!127699 m!193441))

(declare-fun m!193443 () Bool)

(assert (=> b!127700 m!193443))

(push 1)

(assert (not start!25210))

(assert (not b!127699))

(assert (not b!127700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

