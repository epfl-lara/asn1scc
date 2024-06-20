; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25272 () Bool)

(assert start!25272)

(declare-fun res!105838 () Bool)

(declare-fun e!84662 () Bool)

(assert (=> start!25272 (=> (not res!105838) (not e!84662))))

(declare-datatypes ((array!5855 0))(
  ( (array!5856 (arr!3265 (Array (_ BitVec 32) (_ BitVec 64))) (size!2648 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!66 0))(
  ( (Asn1ObjectIdentifier!67 (nCount!44 (_ BitVec 32)) (values!41 array!5855)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!66)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!66)

(declare-fun i!528 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!7928 0))(
  ( (Unit!7929) )
))
(declare-datatypes ((ControlFlow!47 0))(
  ( (Return!46 (value!4578 Bool)) (Proceed!46 (value!4579 Unit!7928)) )
))
(declare-fun Unit!7930 () Unit!7928)

(assert (=> start!25272 (= res!105838 (and (bvsge (nCount!44 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!44 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!44 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!44 pVal2!5) #b00000000000000000000000000010100) (not ((_ is Return!46) (ite (not (= (nCount!44 pVal1!5) (nCount!44 pVal2!5))) (Return!46 false) (Proceed!46 Unit!7930)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!44 pVal1!5)) (bvslt i!528 (nCount!44 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!44 pVal1!5))))))

(assert (=> start!25272 e!84662))

(declare-fun e!84661 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!66) Bool)

(assert (=> start!25272 (and (inv!11 pVal1!5) e!84661)))

(declare-fun e!84660 () Bool)

(assert (=> start!25272 (and (inv!11 pVal2!5) e!84660)))

(assert (=> start!25272 true))

(declare-fun ret!79 () Bool)

(declare-fun b!127836 () Bool)

(declare-datatypes ((tuple3!480 0))(
  ( (tuple3!481 (_1!5688 Unit!7928) (_2!5688 (_ BitVec 32)) (_3!295 Bool)) )
))
(declare-fun ObjectIdentifier_equalWhile!0 (Asn1ObjectIdentifier!66 Asn1ObjectIdentifier!66 (_ BitVec 32) Bool) tuple3!480)

(assert (=> b!127836 (= e!84662 (bvslt (_2!5688 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3265 (values!41 pVal1!5)) i!528) (select (arr!3265 (values!41 pVal2!5)) i!528))))) (nCount!44 pVal1!5)))))

(declare-fun b!127837 () Bool)

(declare-fun array_inv!2437 (array!5855) Bool)

(assert (=> b!127837 (= e!84661 (array_inv!2437 (values!41 pVal1!5)))))

(declare-fun b!127838 () Bool)

(assert (=> b!127838 (= e!84660 (array_inv!2437 (values!41 pVal2!5)))))

(assert (= (and start!25272 res!105838) b!127836))

(assert (= start!25272 b!127837))

(assert (= start!25272 b!127838))

(declare-fun m!193613 () Bool)

(assert (=> start!25272 m!193613))

(declare-fun m!193615 () Bool)

(assert (=> start!25272 m!193615))

(declare-fun m!193617 () Bool)

(assert (=> b!127836 m!193617))

(declare-fun m!193619 () Bool)

(assert (=> b!127836 m!193619))

(declare-fun m!193621 () Bool)

(assert (=> b!127836 m!193621))

(declare-fun m!193623 () Bool)

(assert (=> b!127837 m!193623))

(declare-fun m!193625 () Bool)

(assert (=> b!127838 m!193625))

(check-sat (not b!127836) (not b!127837) (not b!127838) (not start!25272))
(check-sat)
(get-model)

(declare-fun d!41330 () Bool)

(declare-fun lt!199015 () tuple3!480)

(assert (=> d!41330 (and (bvsge (_2!5688 lt!199015) #b00000000000000000000000000000000) (bvsle (_2!5688 lt!199015) (nCount!44 pVal1!5)) (bvsge (_2!5688 lt!199015) (nCount!44 pVal1!5)))))

(declare-fun e!84680 () tuple3!480)

(assert (=> d!41330 (= lt!199015 e!84680)))

(declare-fun c!7524 () Bool)

(declare-fun lt!199014 () (_ BitVec 32))

(assert (=> d!41330 (= c!7524 (bvslt lt!199014 (nCount!44 pVal1!5)))))

(assert (=> d!41330 (= lt!199014 (bvadd #b00000000000000000000000000000001 i!528 #b00000000000000000000000000000001))))

(declare-fun lt!199016 () Bool)

(assert (=> d!41330 (= lt!199016 (and (and ret!79 (= (select (arr!3265 (values!41 pVal1!5)) i!528) (select (arr!3265 (values!41 pVal2!5)) i!528))) (= (select (arr!3265 (values!41 pVal1!5)) (bvadd #b00000000000000000000000000000001 i!528)) (select (arr!3265 (values!41 pVal2!5)) (bvadd #b00000000000000000000000000000001 i!528)))))))

(assert (=> d!41330 (and (bvsge (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!528) (nCount!44 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!44 pVal1!5)))))

(assert (=> d!41330 (= (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3265 (values!41 pVal1!5)) i!528) (select (arr!3265 (values!41 pVal2!5)) i!528)))) lt!199015)))

(declare-fun b!127852 () Bool)

(assert (=> b!127852 (= e!84680 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 lt!199014 lt!199016))))

(declare-fun b!127853 () Bool)

(declare-fun Unit!7934 () Unit!7928)

(assert (=> b!127853 (= e!84680 (tuple3!481 Unit!7934 lt!199014 lt!199016))))

(assert (= (and d!41330 c!7524) b!127852))

(assert (= (and d!41330 (not c!7524)) b!127853))

(declare-fun m!193641 () Bool)

(assert (=> d!41330 m!193641))

(declare-fun m!193643 () Bool)

(assert (=> d!41330 m!193643))

(declare-fun m!193645 () Bool)

(assert (=> b!127852 m!193645))

(assert (=> b!127836 d!41330))

(declare-fun d!41334 () Bool)

(assert (=> d!41334 (= (array_inv!2437 (values!41 pVal1!5)) (bvsge (size!2648 (values!41 pVal1!5)) #b00000000000000000000000000000000))))

(assert (=> b!127837 d!41334))

(declare-fun d!41336 () Bool)

(assert (=> d!41336 (= (array_inv!2437 (values!41 pVal2!5)) (bvsge (size!2648 (values!41 pVal2!5)) #b00000000000000000000000000000000))))

(assert (=> b!127838 d!41336))

(declare-fun d!41338 () Bool)

(assert (=> d!41338 (= (inv!11 pVal1!5) (and (= (size!2648 (values!41 pVal1!5)) #b00000000000000000000000000010100) (bvsge (nCount!44 pVal1!5) #b00000000000000000000000000000000)))))

(assert (=> start!25272 d!41338))

(declare-fun d!41340 () Bool)

(assert (=> d!41340 (= (inv!11 pVal2!5) (and (= (size!2648 (values!41 pVal2!5)) #b00000000000000000000000000010100) (bvsge (nCount!44 pVal2!5) #b00000000000000000000000000000000)))))

(assert (=> start!25272 d!41340))

(check-sat (not b!127852))
(check-sat)
