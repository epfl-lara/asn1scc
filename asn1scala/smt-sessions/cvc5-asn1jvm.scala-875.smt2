; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25170 () Bool)

(assert start!25170)

(declare-datatypes ((array!5795 0))(
  ( (array!5796 (arr!3240 (Array (_ BitVec 32) (_ BitVec 64))) (size!2623 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!16 0))(
  ( (Asn1ObjectIdentifier!17 (nCount!19 (_ BitVec 32)) (values!16 array!5795)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!16)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!16)

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((Unit!7849 0))(
  ( (Unit!7850) )
))
(declare-datatypes ((ControlFlow!22 0))(
  ( (Return!21 (value!4488 Bool)) (Proceed!21 (value!4489 Unit!7849)) )
))
(declare-fun Unit!7851 () Unit!7849)

(assert (=> start!25170 (and (bvsge (nCount!19 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!19 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!19 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!19 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!21 (ite (not (= (nCount!19 pVal1!5) (nCount!19 pVal2!5))) (Return!21 false) (Proceed!21 Unit!7851)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!19 pVal1!5)) (bvslt i!528 (nCount!19 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!19 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000))))

(declare-fun e!84317 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!16) Bool)

(assert (=> start!25170 (and (inv!11 pVal1!5) e!84317)))

(declare-fun e!84319 () Bool)

(assert (=> start!25170 (and (inv!11 pVal2!5) e!84319)))

(assert (=> start!25170 true))

(declare-fun b!127627 () Bool)

(declare-fun array_inv!2412 (array!5795) Bool)

(assert (=> b!127627 (= e!84317 (array_inv!2412 (values!16 pVal1!5)))))

(declare-fun b!127628 () Bool)

(assert (=> b!127628 (= e!84319 (array_inv!2412 (values!16 pVal2!5)))))

(assert (= start!25170 b!127627))

(assert (= start!25170 b!127628))

(declare-fun m!193341 () Bool)

(assert (=> start!25170 m!193341))

(declare-fun m!193343 () Bool)

(assert (=> start!25170 m!193343))

(declare-fun m!193345 () Bool)

(assert (=> b!127627 m!193345))

(declare-fun m!193347 () Bool)

(assert (=> b!127628 m!193347))

(push 1)

(assert (not b!127628))

(assert (not b!127627))

(assert (not start!25170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

