; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25246 () Bool)

(assert start!25246)

(declare-fun res!105826 () Bool)

(declare-fun e!84592 () Bool)

(assert (=> start!25246 (=> (not res!105826) (not e!84592))))

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((array!5844 0))(
  ( (array!5845 (arr!3261 (Array (_ BitVec 32) (_ BitVec 64))) (size!2644 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!58 0))(
  ( (Asn1ObjectIdentifier!59 (nCount!40 (_ BitVec 32)) (values!37 array!5844)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!58)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!58)

(declare-datatypes ((Unit!7913 0))(
  ( (Unit!7914) )
))
(declare-datatypes ((ControlFlow!43 0))(
  ( (Return!42 (value!4565 Bool)) (Proceed!42 (value!4566 Unit!7913)) )
))
(declare-fun Unit!7915 () Unit!7913)

(assert (=> start!25246 (= res!105826 (and (bvsge (nCount!40 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!40 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!40 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!40 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!42 (ite (not (= (nCount!40 pVal1!5) (nCount!40 pVal2!5))) (Return!42 false) (Proceed!42 Unit!7915)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!40 pVal1!5)) (bvslt i!528 (nCount!40 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!40 pVal1!5))))))

(assert (=> start!25246 e!84592))

(declare-fun e!84593 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!58) Bool)

(assert (=> start!25246 (and (inv!11 pVal1!5) e!84593)))

(declare-fun e!84591 () Bool)

(assert (=> start!25246 (and (inv!11 pVal2!5) e!84591)))

(assert (=> start!25246 true))

(declare-fun ret!79 () Bool)

(declare-fun b!127782 () Bool)

(declare-datatypes ((tuple3!472 0))(
  ( (tuple3!473 (_1!5684 Unit!7913) (_2!5684 (_ BitVec 32)) (_3!291 Bool)) )
))
(declare-fun ObjectIdentifier_equalWhile!0 (Asn1ObjectIdentifier!58 Asn1ObjectIdentifier!58 (_ BitVec 32) Bool) tuple3!472)

(assert (=> b!127782 (= e!84592 (bvsgt (_2!5684 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3261 (values!37 pVal1!5)) i!528) (select (arr!3261 (values!37 pVal2!5)) i!528))))) (nCount!40 pVal1!5)))))

(declare-fun b!127783 () Bool)

(declare-fun array_inv!2433 (array!5844) Bool)

(assert (=> b!127783 (= e!84593 (array_inv!2433 (values!37 pVal1!5)))))

(declare-fun b!127784 () Bool)

(assert (=> b!127784 (= e!84591 (array_inv!2433 (values!37 pVal2!5)))))

(assert (= (and start!25246 res!105826) b!127782))

(assert (= start!25246 b!127783))

(assert (= start!25246 b!127784))

(declare-fun m!193539 () Bool)

(assert (=> start!25246 m!193539))

(declare-fun m!193541 () Bool)

(assert (=> start!25246 m!193541))

(declare-fun m!193543 () Bool)

(assert (=> b!127782 m!193543))

(declare-fun m!193545 () Bool)

(assert (=> b!127782 m!193545))

(declare-fun m!193547 () Bool)

(assert (=> b!127782 m!193547))

(declare-fun m!193549 () Bool)

(assert (=> b!127783 m!193549))

(declare-fun m!193551 () Bool)

(assert (=> b!127784 m!193551))

(push 1)

(assert (not b!127782))

(assert (not start!25246))

(assert (not b!127784))

(assert (not b!127783))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41308 () Bool)

(declare-fun lt!198989 () tuple3!472)

(assert (=> d!41308 (and (bvsge (_2!5684 lt!198989) #b00000000000000000000000000000000) (bvsle (_2!5684 lt!198989) (nCount!40 pVal1!5)) (bvsge (_2!5684 lt!198989) (nCount!40 pVal1!5)))))

(declare-fun e!84626 () tuple3!472)

(assert (=> d!41308 (= lt!198989 e!84626)))

(declare-fun c!7515 () Bool)

(declare-fun lt!198987 () (_ BitVec 32))

(assert (=> d!41308 (= c!7515 (bvslt lt!198987 (nCount!40 pVal1!5)))))

(assert (=> d!41308 (= lt!198987 (bvadd #b00000000000000000000000000000001 i!528 #b00000000000000000000000000000001))))

(declare-fun lt!198988 () Bool)

(assert (=> d!41308 (= lt!198988 (and (and ret!79 (= (select (arr!3261 (values!37 pVal1!5)) i!528) (select (arr!3261 (values!37 pVal2!5)) i!528))) (= (select (arr!3261 (values!37 pVal1!5)) (bvadd #b00000000000000000000000000000001 i!528)) (select (arr!3261 (values!37 pVal2!5)) (bvadd #b00000000000000000000000000000001 i!528)))))))

(assert (=> d!41308 (and (bvsge (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!528) (nCount!40 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!40 pVal1!5)))))

(assert (=> d!41308 (= (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3261 (values!37 pVal1!5)) i!528) (select (arr!3261 (values!37 pVal2!5)) i!528)))) lt!198989)))

(declare-fun b!127807 () Bool)

(assert (=> b!127807 (= e!84626 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 lt!198987 lt!198988))))

(declare-fun b!127808 () Bool)

(declare-fun Unit!7922 () Unit!7913)

(assert (=> b!127808 (= e!84626 (tuple3!473 Unit!7922 lt!198987 lt!198988))))

(assert (= (and d!41308 c!7515) b!127807))

(assert (= (and d!41308 (not c!7515)) b!127808))

(declare-fun m!193581 () Bool)

(assert (=> d!41308 m!193581))

(declare-fun m!193583 () Bool)

(assert (=> d!41308 m!193583))

(declare-fun m!193585 () Bool)

(assert (=> b!127807 m!193585))

(assert (=> b!127782 d!41308))

(declare-fun d!41320 () Bool)

(assert (=> d!41320 (= (inv!11 pVal1!5) (and (= (size!2644 (values!37 pVal1!5)) #b00000000000000000000000000010100) (bvsge (nCount!40 pVal1!5) #b00000000000000000000000000000000)))))

(assert (=> start!25246 d!41320))

(declare-fun d!41322 () Bool)

(assert (=> d!41322 (= (inv!11 pVal2!5) (and (= (size!2644 (values!37 pVal2!5)) #b00000000000000000000000000010100) (bvsge (nCount!40 pVal2!5) #b00000000000000000000000000000000)))))

(assert (=> start!25246 d!41322))

(declare-fun d!41324 () Bool)

(assert (=> d!41324 (= (array_inv!2433 (values!37 pVal2!5)) (bvsge (size!2644 (values!37 pVal2!5)) #b00000000000000000000000000000000))))

(assert (=> b!127784 d!41324))

(declare-fun d!41326 () Bool)

(assert (=> d!41326 (= (array_inv!2433 (values!37 pVal1!5)) (bvsge (size!2644 (values!37 pVal1!5)) #b00000000000000000000000000000000))))

(assert (=> b!127783 d!41326))

(push 1)

(assert (not b!127807))

(check-sat)

