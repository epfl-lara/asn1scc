; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25222 () Bool)

(assert start!25222)

(declare-fun res!105817 () Bool)

(declare-fun e!84535 () Bool)

(assert (=> start!25222 (=> (not res!105817) (not e!84535))))

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((array!5835 0))(
  ( (array!5836 (arr!3258 (Array (_ BitVec 32) (_ BitVec 64))) (size!2641 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!52 0))(
  ( (Asn1ObjectIdentifier!53 (nCount!37 (_ BitVec 32)) (values!34 array!5835)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!52)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!52)

(declare-datatypes ((Unit!7903 0))(
  ( (Unit!7904) )
))
(declare-datatypes ((ControlFlow!40 0))(
  ( (Return!39 (value!4554 Bool)) (Proceed!39 (value!4555 Unit!7903)) )
))
(declare-fun Unit!7905 () Unit!7903)

(assert (=> start!25222 (= res!105817 (and (bvsge (nCount!37 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!37 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!37 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!37 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!39 (ite (not (= (nCount!37 pVal1!5) (nCount!37 pVal2!5))) (Return!39 false) (Proceed!39 Unit!7905)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!37 pVal1!5)) (bvslt i!528 (nCount!37 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!37 pVal1!5))))))

(assert (=> start!25222 e!84535))

(declare-fun e!84537 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!52) Bool)

(assert (=> start!25222 (and (inv!11 pVal1!5) e!84537)))

(declare-fun e!84538 () Bool)

(assert (=> start!25222 (and (inv!11 pVal2!5) e!84538)))

(assert (=> start!25222 true))

(declare-fun ret!79 () Bool)

(declare-fun b!127737 () Bool)

(declare-datatypes ((tuple3!466 0))(
  ( (tuple3!467 (_1!5681 Unit!7903) (_2!5681 (_ BitVec 32)) (_3!288 Bool)) )
))
(declare-fun ObjectIdentifier_equalWhile!0 (Asn1ObjectIdentifier!52 Asn1ObjectIdentifier!52 (_ BitVec 32) Bool) tuple3!466)

(assert (=> b!127737 (= e!84535 (bvslt (_2!5681 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3258 (values!34 pVal1!5)) i!528) (select (arr!3258 (values!34 pVal2!5)) i!528))))) #b00000000000000000000000000000000))))

(declare-fun b!127738 () Bool)

(declare-fun array_inv!2430 (array!5835) Bool)

(assert (=> b!127738 (= e!84537 (array_inv!2430 (values!34 pVal1!5)))))

(declare-fun b!127739 () Bool)

(assert (=> b!127739 (= e!84538 (array_inv!2430 (values!34 pVal2!5)))))

(assert (= (and start!25222 res!105817) b!127737))

(assert (= start!25222 b!127738))

(assert (= start!25222 b!127739))

(declare-fun m!193485 () Bool)

(assert (=> start!25222 m!193485))

(declare-fun m!193487 () Bool)

(assert (=> start!25222 m!193487))

(declare-fun m!193489 () Bool)

(assert (=> b!127737 m!193489))

(declare-fun m!193491 () Bool)

(assert (=> b!127737 m!193491))

(declare-fun m!193493 () Bool)

(assert (=> b!127737 m!193493))

(declare-fun m!193495 () Bool)

(assert (=> b!127738 m!193495))

(declare-fun m!193497 () Bool)

(assert (=> b!127739 m!193497))

(push 1)

(assert (not b!127738))

(assert (not b!127737))

(assert (not b!127739))

(assert (not start!25222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41274 () Bool)

(assert (=> d!41274 (= (array_inv!2430 (values!34 pVal1!5)) (bvsge (size!2641 (values!34 pVal1!5)) #b00000000000000000000000000000000))))

(assert (=> b!127738 d!41274))

(declare-fun 