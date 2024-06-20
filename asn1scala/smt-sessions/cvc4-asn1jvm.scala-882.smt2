; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25250 () Bool)

(assert start!25250)

(declare-fun res!105832 () Bool)

(declare-fun e!84620 () Bool)

(assert (=> start!25250 (=> (not res!105832) (not e!84620))))

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((array!5848 0))(
  ( (array!5849 (arr!3263 (Array (_ BitVec 32) (_ BitVec 64))) (size!2646 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!62 0))(
  ( (Asn1ObjectIdentifier!63 (nCount!42 (_ BitVec 32)) (values!39 array!5848)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!62)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!62)

(declare-datatypes ((Unit!7919 0))(
  ( (Unit!7920) )
))
(declare-datatypes ((ControlFlow!45 0))(
  ( (Return!44 (value!4569 Bool)) (Proceed!44 (value!4570 Unit!7919)) )
))
(declare-fun Unit!7921 () Unit!7919)

(assert (=> start!25250 (= res!105832 (and (bvsge (nCount!42 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!42 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!42 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!42 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!44 (ite (not (= (nCount!42 pVal1!5) (nCount!42 pVal2!5))) (Return!44 false) (Proceed!44 Unit!7921)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!42 pVal1!5)) (bvslt i!528 (nCount!42 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!42 pVal1!5))))))

(assert (=> start!25250 e!84620))

(declare-fun e!84622 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!62) Bool)

(assert (=> start!25250 (and (inv!11 pVal1!5) e!84622)))

(declare-fun e!84621 () Bool)

(assert (=> start!25250 (and (inv!11 pVal2!5) e!84621)))

(assert (=> start!25250 true))

(declare-fun ret!79 () Bool)

(declare-fun b!127800 () Bool)

(declare-datatypes ((tuple3!476 0))(
  ( (tuple3!477 (_1!5686 Unit!7919) (_2!5686 (_ BitVec 32)) (_3!293 Bool)) )
))
(declare-fun ObjectIdentifier_equalWhile!0 (Asn1ObjectIdentifier!62 Asn1ObjectIdentifier!62 (_ BitVec 32) Bool) tuple3!476)

(assert (=> b!127800 (= e!84620 (bvsgt (_2!5686 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3263 (values!39 pVal1!5)) i!528) (select (arr!3263 (values!39 pVal2!5)) i!528))))) (nCount!42 pVal1!5)))))

(declare-fun b!127801 () Bool)

(declare-fun array_inv!2435 (array!5848) Bool)

(assert (=> b!127801 (= e!84622 (array_inv!2435 (values!39 pVal1!5)))))

(declare-fun b!127802 () Bool)

(assert (=> b!127802 (= e!84621 (array_inv!2435 (values!39 pVal2!5)))))

(assert (= (and start!25250 res!105832) b!127800))

(assert (= start!25250 b!127801))

(assert (= start!25250 b!127802))

(declare-fun m!193567 () Bool)

(assert (=> start!25250 m!193567))

(declare-fun m!193569 () Bool)

(assert (=> start!25250 m!193569))

(declare-fun m!193571 () Bool)

(assert (=> b!127800 m!193571))

(declare-fun m!193573 () Bool)

(assert (=> b!127800 m!193573))

(declare-fun m!193575 () Bool)

(assert (=> b!127800 m!193575))

(declare-fun m!193577 () Bool)

(assert (=> b!127801 m!193577))

(declare-fun m!193579 () Bool)

(assert (=> b!127802 m!193579))

(push 1)

(assert (not b!127801))

(assert (not start!25250))

(assert (not b!127802))

(assert (not b!127800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41310 () Bool)

(assert (=> d!41310 (= (array_inv!2435 (values!39 pVal1!5)) (bvsge (size!2646 (values!39 pVal1!5)) #b00000000000000000000000000000000))))

(assert (=> b!127801 d!41310))

(declare-fun d!41312 () Bool)

(assert (=> d!41312 (= (inv!11 pVal1!5) (and (= (size!2646 (values!39 pVal1!5)) #b00000000000000000000000000010100) (bvsge (nCount!42 pVal1!5) #b00000000000000000000000000000000)))))

(assert (=> start!25250 d!41312))

(declare-fun d!41314 () Bool)

(assert (=> d!41314 (= (inv!11 pVal2!5) (and (= (size!2646 (values!39 pVal2!5)) #b00000000000000000000000000010100) (bvsge (nCount!42 pVal2!5) #b00000000000000000000000000000000)))))

(assert (=> start!25250 d!41314))

(declare-fun d!41316 () Bool)

(assert (=> d!41316 (= (array_inv!2435 (values!39 pVal2!5)) (bvsge (size!2646 (values!39 pVal2!5)) #b00000000000000000000000000000000))))

(assert (=> b!127802 d!41316))

(declare-fun d!41318 () Bool)

(declare-fun lt!199003 () tuple3!476)

(assert (=> d!41318 (and (bvsge (_2!5686 lt!199003) #b00000000000000000000000000000000) (bvsle (_2!5686 lt!199003) (nCount!42 pVal1!5)) (bvsge (_2!5686 lt!199003) (nCount!42 pVal1!5)))))

(declare-fun e!84631 () tuple3!476)

(assert (=> d!41318 (= lt!199003 e!84631)))

(declare-fun c!7520 () Bool)

(declare-fun lt!199004 () (_ BitVec 32))

(assert (=> d!41318 (= c!7520 (bvslt lt!199004 (nCount!42 pVal1!5)))))

(assert (=> d!41318 (= lt!199004 (bvadd #b00000000000000000000000000000001 i!528 #b00000000000000000000000000000001))))

(declare-fun lt!199002 () Bool)

(assert (=> d!41318 (= lt!199002 (and (and ret!79 (= (select (arr!3263 (values!39 pVal1!5)) i!528) (select (arr!3263 (values!39 pVal2!5)) i!528))) (= (select (arr!3263 (values!39 pVal1!5)) (bvadd #b00000000000000000000000000000001 i!528)) (select (arr!3263 (values!39 pVal2!5)) (bvadd #b00000000000000000000000000000001 i!528)))))))

(assert (=> d!41318 (and (bvsge (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!528) (nCount!42 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!42 pVal1!5)))))

(assert (=> d!41318 (= (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3263 (values!39 pVal1!5)) i!528) (select (arr!3263 (values!39 pVal2!5)) i!528)))) lt!199003)))

(declare-fun b!127817 () Bool)

(assert (=> b!127817 (= e!84631 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 lt!199004 lt!199002))))

(declare-fun b!127818 () Bool)

(declare-fun Unit!7924 () Unit!7919)

(assert (=> b!127818 (= e!84631 (tuple3!477 Unit!7924 lt!199004 lt!199002))))

(assert (= (and d!41318 c!7520) b!127817))

(assert (= (and d!41318 (not c!7520)) b!127818))

(declare-fun m!193587 () Bool)

(assert (=> d!41318 m!193587))

(declare-fun m!193589 () Bool)

(assert (=> d!41318 m!193589))

(declare-fun m!193591 () Bool)

(assert (=> b!127817 m!193591))

(assert (=> b!127800 d!41318))

(push 1)

(assert (not b!127817))

