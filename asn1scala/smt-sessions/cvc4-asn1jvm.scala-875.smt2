; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25174 () Bool)

(assert start!25174)

(declare-datatypes ((array!5799 0))(
  ( (array!5800 (arr!3242 (Array (_ BitVec 32) (_ BitVec 64))) (size!2625 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!20 0))(
  ( (Asn1ObjectIdentifier!21 (nCount!21 (_ BitVec 32)) (values!18 array!5799)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!20)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!20)

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((Unit!7855 0))(
  ( (Unit!7856) )
))
(declare-datatypes ((ControlFlow!24 0))(
  ( (Return!23 (value!4492 Bool)) (Proceed!23 (value!4493 Unit!7855)) )
))
(declare-fun Unit!7857 () Unit!7855)

(assert (=> start!25174 (and (bvsge (nCount!21 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!21 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!21 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!21 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!23 (ite (not (= (nCount!21 pVal1!5) (nCount!21 pVal2!5))) (Return!23 false) (Proceed!23 Unit!7857)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!21 pVal1!5)) (bvslt i!528 (nCount!21 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!21 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000))))

(declare-fun e!84341 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!20) Bool)

(assert (=> start!25174 (and (inv!11 pVal1!5) e!84341)))

(declare-fun e!84343 () Bool)

(assert (=> start!25174 (and (inv!11 pVal2!5) e!84343)))

(assert (=> start!25174 true))

(declare-fun b!127639 () Bool)

(declare-fun array_inv!2414 (array!5799) Bool)

(assert (=> b!127639 (= e!84341 (array_inv!2414 (values!18 pVal1!5)))))

(declare-fun b!127640 () Bool)

(assert (=> b!127640 (= e!84343 (array_inv!2414 (values!18 pVal2!5)))))

(assert (= start!25174 b!127639))

(assert (= start!25174 b!127640))

(declare-fun m!193357 () Bool)

(assert (=> start!25174 m!193357))

(declare-fun m!193359 () Bool)

(assert (=> start!25174 m!193359))

(declare-fun m!193361 () Bool)

(assert (=> b!127639 m!193361))

(declare-fun m!193363 () Bool)

(assert (=> b!127640 m!193363))

(push 1)

(assert (not b!127639))

(assert (not b!127640))

(assert (not start!25174))

(check-sat)

(pop 1)

(push 1)

(check-sat)

