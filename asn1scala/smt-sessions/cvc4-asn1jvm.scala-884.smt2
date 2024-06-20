; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25294 () Bool)

(assert start!25294)

(declare-datatypes ((array!5865 0))(
  ( (array!5866 (arr!3269 (Array (_ BitVec 32) (_ BitVec 64))) (size!2652 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!74 0))(
  ( (Asn1ObjectIdentifier!75 (nCount!48 (_ BitVec 32)) (values!45 array!5865)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!74)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!74)

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((Unit!7941 0))(
  ( (Unit!7942) )
))
(declare-datatypes ((ControlFlow!51 0))(
  ( (Return!50 (value!4591 Bool)) (Proceed!50 (value!4592 Unit!7941)) )
))
(declare-fun Unit!7943 () Unit!7941)

(assert (=> start!25294 (and (bvsge (nCount!48 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!48 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!48 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!48 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!50 (ite (not (= (nCount!48 pVal1!5) (nCount!48 pVal2!5))) (Return!50 false) (Proceed!50 Unit!7943)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!48 pVal1!5)) (bvslt i!528 (nCount!48 pVal1!5)) (bvsge (bvadd #b00000000000000000000000000000001 i!528) (nCount!48 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000))))

(declare-fun e!84719 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!74) Bool)

(assert (=> start!25294 (and (inv!11 pVal1!5) e!84719)))

(declare-fun e!84721 () Bool)

(assert (=> start!25294 (and (inv!11 pVal2!5) e!84721)))

(assert (=> start!25294 true))

(declare-fun b!127882 () Bool)

(declare-fun array_inv!2441 (array!5865) Bool)

(assert (=> b!127882 (= e!84719 (array_inv!2441 (values!45 pVal1!5)))))

(declare-fun b!127883 () Bool)

(assert (=> b!127883 (= e!84721 (array_inv!2441 (values!45 pVal2!5)))))

(assert (= start!25294 b!127882))

(assert (= start!25294 b!127883))

(declare-fun m!193669 () Bool)

(assert (=> start!25294 m!193669))

(declare-fun m!193671 () Bool)

(assert (=> start!25294 m!193671))

(declare-fun m!193673 () Bool)

(assert (=> b!127882 m!193673))

(declare-fun m!193675 () Bool)

(assert (=> b!127883 m!193675))

(push 1)

(assert (not b!127883))

(assert (not start!25294))

(assert (not b!127882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

