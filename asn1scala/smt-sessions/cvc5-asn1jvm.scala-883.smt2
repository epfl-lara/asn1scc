; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25270 () Bool)

(assert start!25270)

(declare-fun res!105835 () Bool)

(declare-fun e!84644 () Bool)

(assert (=> start!25270 (=> (not res!105835) (not e!84644))))

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((array!5853 0))(
  ( (array!5854 (arr!3264 (Array (_ BitVec 32) (_ BitVec 64))) (size!2647 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!64 0))(
  ( (Asn1ObjectIdentifier!65 (nCount!43 (_ BitVec 32)) (values!40 array!5853)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!64)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!64)

(declare-datatypes ((Unit!7925 0))(
  ( (Unit!7926) )
))
(declare-datatypes ((ControlFlow!46 0))(
  ( (Return!45 (value!4576 Bool)) (Proceed!45 (value!4577 Unit!7925)) )
))
(declare-fun Unit!7927 () Unit!7925)

(assert (=> start!25270 (= res!105835 (and (bvsge (nCount!43 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!43 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!43 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!43 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!45 (ite (not (= (nCount!43 pVal1!5) (nCount!43 pVal2!5))) (Return!45 false) (Proceed!45 Unit!7927)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!43 pVal1!5)) (bvslt i!528 (nCount!43 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!43 pVal1!5))))))

(assert (=> start!25270 e!84644))

(declare-fun e!84647 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!64) Bool)

(assert (=> start!25270 (and (inv!11 pVal1!5) e!84647)))

(declare-fun e!84643 () Bool)

(assert (=> start!25270 (and (inv!11 pVal2!5) e!84643)))

(assert (=> start!25270 true))

(declare-fun ret!79 () Bool)

(declare-fun b!127827 () Bool)

(declare-datatypes ((tuple3!478 0))(
  ( (tuple3!479 (_1!5687 Unit!7925) (_2!5687 (_ BitVec 32)) (_3!294 Bool)) )
))
(declare-fun ObjectIdentifier_equalWhile!0 (Asn1ObjectIdentifier!64 Asn1ObjectIdentifier!64 (_ BitVec 32) Bool) tuple3!478)

(assert (=> b!127827 (= e!84644 (bvslt (_2!5687 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3264 (values!40 pVal1!5)) i!528) (select (arr!3264 (values!40 pVal2!5)) i!528))))) (nCount!43 pVal1!5)))))

(declare-fun b!127828 () Bool)

(declare-fun array_inv!2436 (array!5853) Bool)

(assert (=> b!127828 (= e!84647 (array_inv!2436 (values!40 pVal1!5)))))

(declare-fun b!127829 () Bool)

(assert (=> b!127829 (= e!84643 (array_inv!2436 (values!40 pVal2!5)))))

(assert (= (and start!25270 res!105835) b!127827))

(assert (= start!25270 b!127828))

(assert (= start!25270 b!127829))

(declare-fun m!193599 () Bool)

(assert (=> start!25270 m!193599))

(declare-fun m!193601 () Bool)

(assert (=> start!25270 m!193601))

(declare-fun m!193603 () Bool)

(assert (=> b!127827 m!193603))

(declare-fun m!193605 () Bool)

(assert (=> b!127827 m!193605))

(declare-fun m!193607 () Bool)

(assert (=> b!127827 m!193607))

(declare-fun m!193609 () Bool)

(assert (=> b!127828 m!193609))

(declare-fun m!193611 () Bool)

(assert (=> b!127829 m!193611))

(push 1)

(assert (not b!127827))

(assert (not b!127828))

(assert (not start!25270))

(assert (not b!127829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41332 () Bool)

(declare-fun lt!199024 () tuple3!478)

(assert (=> d!41332 (and (bvsge (_2!5687 lt!199024) #b00000000000000000000000000000000) (bvsle (_2!5687 lt!199024) (nCount!43 pVal1!5)) (bvsge (_2!5687 lt!199024) (nCount!43 pVal1!5)))))

(declare-fun e!84683 () tuple3!478)

(assert (=> d!41332 (= lt!199024 e!84683)))

(declare-fun c!7527 () Bool)

(declare-fun lt!199025 () (_ BitVec 32))

