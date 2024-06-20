; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25196 () Bool)

(assert start!25196)

(declare-fun i!528 () (_ BitVec 32))

(declare-fun ret!79 () Bool)

(declare-datatypes ((array!5818 0))(
  ( (array!5819 (arr!3251 (Array (_ BitVec 32) (_ BitVec 64))) (size!2634 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!38 0))(
  ( (Asn1ObjectIdentifier!39 (nCount!30 (_ BitVec 32)) (values!27 array!5818)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!38)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!38)

(declare-datatypes ((Unit!7882 0))(
  ( (Unit!7883) )
))
(declare-datatypes ((ControlFlow!33 0))(
  ( (Return!32 (value!4525 Bool)) (Proceed!32 (value!4526 Unit!7882)) )
))
(declare-fun Unit!7884 () Unit!7882)

(assert (=> start!25196 (and (bvsge (nCount!30 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!30 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!30 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!30 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!32 (ite (not (= (nCount!30 pVal1!5) (nCount!30 pVal2!5))) (Return!32 false) (Proceed!32 Unit!7884)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!30 pVal1!5)) (bvslt i!528 (nCount!30 pVal1!5)) ret!79 (bvsge i!528 (size!2634 (values!27 pVal2!5))))))

(declare-fun e!84449 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!38) Bool)

(assert (=> start!25196 (and (inv!11 pVal1!5) e!84449)))

(declare-fun e!84451 () Bool)

(assert (=> start!25196 (and (inv!11 pVal2!5) e!84451)))

(assert (=> start!25196 true))

(declare-fun b!127693 () Bool)

(declare-fun array_inv!2423 (array!5818) Bool)

(assert (=> b!127693 (= e!84449 (array_inv!2423 (values!27 pVal1!5)))))

(declare-fun b!127694 () Bool)

(assert (=> b!127694 (= e!84451 (array_inv!2423 (values!27 pVal2!5)))))

(assert (= start!25196 b!127693))

(assert (= start!25196 b!127694))

(declare-fun m!193429 () Bool)

(assert (=> start!25196 m!193429))

(declare-fun m!193431 () Bool)

(assert (=> start!25196 m!193431))

(declare-fun m!193433 () Bool)

(assert (=> b!127693 m!193433))

(declare-fun m!193435 () Bool)

(assert (=> b!127694 m!193435))

(push 1)

(assert (not b!127693))

(assert (not start!25196))

(assert (not b!127694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

