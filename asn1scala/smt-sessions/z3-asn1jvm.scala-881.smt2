; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25224 () Bool)

(assert start!25224)

(declare-fun res!105820 () Bool)

(declare-fun e!84553 () Bool)

(assert (=> start!25224 (=> (not res!105820) (not e!84553))))

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((array!5837 0))(
  ( (array!5838 (arr!3259 (Array (_ BitVec 32) (_ BitVec 64))) (size!2642 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!54 0))(
  ( (Asn1ObjectIdentifier!55 (nCount!38 (_ BitVec 32)) (values!35 array!5837)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!54)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!54)

(get-info :version)

(declare-datatypes ((Unit!7906 0))(
  ( (Unit!7907) )
))
(declare-datatypes ((ControlFlow!41 0))(
  ( (Return!40 (value!4556 Bool)) (Proceed!40 (value!4557 Unit!7906)) )
))
(declare-fun Unit!7908 () Unit!7906)

(assert (=> start!25224 (= res!105820 (and (bvsge (nCount!38 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!38 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!38 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!38 pVal2!5) #b00000000000000000000000000010100) (not ((_ is Return!40) (ite (not (= (nCount!38 pVal1!5) (nCount!38 pVal2!5))) (Return!40 false) (Proceed!40 Unit!7908)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!38 pVal1!5)) (bvslt i!528 (nCount!38 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!38 pVal1!5))))))

(assert (=> start!25224 e!84553))

(declare-fun e!84551 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!54) Bool)

(assert (=> start!25224 (and (inv!11 pVal1!5) e!84551)))

(declare-fun e!84550 () Bool)

(assert (=> start!25224 (and (inv!11 pVal2!5) e!84550)))

(assert (=> start!25224 true))

(declare-fun ret!79 () Bool)

(declare-fun b!127746 () Bool)

(declare-datatypes ((tuple3!468 0))(
  ( (tuple3!469 (_1!5682 Unit!7906) (_2!5682 (_ BitVec 32)) (_3!289 Bool)) )
))
(declare-fun ObjectIdentifier_equalWhile!0 (Asn1ObjectIdentifier!54 Asn1ObjectIdentifier!54 (_ BitVec 32) Bool) tuple3!468)

(assert (=> b!127746 (= e!84553 (bvslt (_2!5682 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3259 (values!35 pVal1!5)) i!528) (select (arr!3259 (values!35 pVal2!5)) i!528))))) #b00000000000000000000000000000000))))

(declare-fun b!127747 () Bool)

(declare-fun array_inv!2431 (array!5837) Bool)

(assert (=> b!127747 (= e!84551 (array_inv!2431 (values!35 pVal1!5)))))

(declare-fun b!127748 () Bool)

(assert (=> b!127748 (= e!84550 (array_inv!2431 (values!35 pVal2!5)))))

(assert (= (and start!25224 res!105820) b!127746))

(assert (= start!25224 b!127747))

(assert (= start!25224 b!127748))

(declare-fun m!193499 () Bool)

(assert (=> start!25224 m!193499))

(declare-fun m!193501 () Bool)

(assert (=> start!25224 m!193501))

(declare-fun m!193503 () Bool)

(assert (=> b!127746 m!193503))

(declare-fun m!193505 () Bool)

(assert (=> b!127746 m!193505))

(declare-fun m!193507 () Bool)

(assert (=> b!127746 m!193507))

(declare-fun m!193509 () Bool)

(assert (=> b!127747 m!193509))

(declare-fun m!193511 () Bool)

(assert (=> b!127748 m!193511))

(check-sat (not start!25224) (not b!127748) (not b!127746) (not b!127747))
(check-sat)
(get-model)

(declare-fun d!41266 () Bool)

(assert (=> d!41266 (= (inv!11 pVal1!5) (and (= (size!2642 (values!35 pVal1!5)) #b00000000000000000000000000010100) (bvsge (nCount!38 pVal1!5) #b00000000000000000000000000000000)))))

(assert (=> start!25224 d!41266))

(declare-fun d!41268 () Bool)

(assert (=> d!41268 (= (inv!11 pVal2!5) (and (= (size!2642 (values!35 pVal2!5)) #b00000000000000000000000000010100) (bvsge (nCount!38 pVal2!5) #b00000000000000000000000000000000)))))

(assert (=> start!25224 d!41268))

(declare-fun d!41270 () Bool)

(assert (=> d!41270 (= (array_inv!2431 (values!35 pVal2!5)) (bvsge (size!2642 (values!35 pVal2!5)) #b00000000000000000000000000000000))))

(assert (=> b!127748 d!41270))

(declare-fun d!41272 () Bool)

(declare-fun lt!198962 () tuple3!468)

(assert (=> d!41272 (and (bvsge (_2!5682 lt!198962) #b00000000000000000000000000000000) (bvsle (_2!5682 lt!198962) (nCount!38 pVal1!5)) (bvsge (_2!5682 lt!198962) (nCount!38 pVal1!5)))))

(declare-fun e!84572 () tuple3!468)

(assert (=> d!41272 (= lt!198962 e!84572)))

(declare-fun c!7506 () Bool)

(declare-fun lt!198960 () (_ BitVec 32))

(assert (=> d!41272 (= c!7506 (bvslt lt!198960 (nCount!38 pVal1!5)))))

(assert (=> d!41272 (= lt!198960 (bvadd #b00000000000000000000000000000001 i!528 #b00000000000000000000000000000001))))

(declare-fun lt!198961 () Bool)

(assert (=> d!41272 (= lt!198961 (and (and ret!79 (= (select (arr!3259 (values!35 pVal1!5)) i!528) (select (arr!3259 (values!35 pVal2!5)) i!528))) (= (select (arr!3259 (values!35 pVal1!5)) (bvadd #b00000000000000000000000000000001 i!528)) (select (arr!3259 (values!35 pVal2!5)) (bvadd #b00000000000000000000000000000001 i!528)))))))

(assert (=> d!41272 (and (bvsge (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!528) (nCount!38 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!38 pVal1!5)))))

(assert (=> d!41272 (= (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3259 (values!35 pVal1!5)) i!528) (select (arr!3259 (values!35 pVal2!5)) i!528)))) lt!198962)))

(declare-fun b!127762 () Bool)

(assert (=> b!127762 (= e!84572 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 lt!198960 lt!198961))))

(declare-fun b!127763 () Bool)

(declare-fun Unit!7912 () Unit!7906)

(assert (=> b!127763 (= e!84572 (tuple3!469 Unit!7912 lt!198960 lt!198961))))

(assert (= (and d!41272 c!7506) b!127762))

(assert (= (and d!41272 (not c!7506)) b!127763))

(declare-fun m!193527 () Bool)

(assert (=> d!41272 m!193527))

(declare-fun m!193529 () Bool)

(assert (=> d!41272 m!193529))

(declare-fun m!193531 () Bool)

(assert (=> b!127762 m!193531))

(assert (=> b!127746 d!41272))

(declare-fun d!41278 () Bool)

(assert (=> d!41278 (= (array_inv!2431 (values!35 pVal1!5)) (bvsge (size!2642 (values!35 pVal1!5)) #b00000000000000000000000000000000))))

(assert (=> b!127747 d!41278))

(check-sat (not b!127762))
(check-sat)
