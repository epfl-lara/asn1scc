; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25274 () Bool)

(assert start!25274)

(declare-fun res!105841 () Bool)

(declare-fun e!84673 () Bool)

(assert (=> start!25274 (=> (not res!105841) (not e!84673))))

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((array!5857 0))(
  ( (array!5858 (arr!3266 (Array (_ BitVec 32) (_ BitVec 64))) (size!2649 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!68 0))(
  ( (Asn1ObjectIdentifier!69 (nCount!45 (_ BitVec 32)) (values!42 array!5857)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!68)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!68)

(declare-datatypes ((Unit!7931 0))(
  ( (Unit!7932) )
))
(declare-datatypes ((ControlFlow!48 0))(
  ( (Return!47 (value!4580 Bool)) (Proceed!47 (value!4581 Unit!7931)) )
))
(declare-fun Unit!7933 () Unit!7931)

(assert (=> start!25274 (= res!105841 (and (bvsge (nCount!45 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!45 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!45 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!45 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!47 (ite (not (= (nCount!45 pVal1!5) (nCount!45 pVal2!5))) (Return!47 false) (Proceed!47 Unit!7933)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!45 pVal1!5)) (bvslt i!528 (nCount!45 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!45 pVal1!5))))))

(assert (=> start!25274 e!84673))

(declare-fun e!84676 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!68) Bool)

(assert (=> start!25274 (and (inv!11 pVal1!5) e!84676)))

(declare-fun e!84675 () Bool)

(assert (=> start!25274 (and (inv!11 pVal2!5) e!84675)))

(assert (=> start!25274 true))

(declare-fun ret!79 () Bool)

(declare-fun b!127845 () Bool)

(declare-datatypes ((tuple3!482 0))(
  ( (tuple3!483 (_1!5689 Unit!7931) (_2!5689 (_ BitVec 32)) (_3!296 Bool)) )
))
(declare-fun ObjectIdentifier_equalWhile!0 (Asn1ObjectIdentifier!68 Asn1ObjectIdentifier!68 (_ BitVec 32) Bool) tuple3!482)

(assert (=> b!127845 (= e!84673 (bvslt (_2!5689 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3266 (values!42 pVal1!5)) i!528) (select (arr!3266 (values!42 pVal2!5)) i!528))))) (nCount!45 pVal1!5)))))

(declare-fun b!127846 () Bool)

(declare-fun array_inv!2438 (array!5857) Bool)

(assert (=> b!127846 (= e!84676 (array_inv!2438 (values!42 pVal1!5)))))

(declare-fun b!127847 () Bool)

(assert (=> b!127847 (= e!84675 (array_inv!2438 (values!42 pVal2!5)))))

(assert (= (and start!25274 res!105841) b!127845))

(assert (= start!25274 b!127846))

(assert (= start!25274 b!127847))

(declare-fun m!193627 () Bool)

(assert (=> start!25274 m!193627))

(declare-fun m!193629 () Bool)

(assert (=> start!25274 m!193629))

(declare-fun m!193631 () Bool)

(assert (=> b!127845 m!193631))

(declare-fun m!193633 () Bool)

(assert (=> b!127845 m!193633))

(declare-fun m!193635 () Bool)

(assert (=> b!127845 m!193635))

(declare-fun m!193637 () Bool)

(assert (=> b!127846 m!193637))

(declare-fun m!193639 () Bool)

(assert (=> b!127847 m!193639))

(push 1)

(assert (not b!127845))

(assert (not b!127846))

(assert (not start!25274))

(assert (not b!127847))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

