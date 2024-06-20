; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25248 () Bool)

(assert start!25248)

(declare-fun res!105829 () Bool)

(declare-fun e!84605 () Bool)

(assert (=> start!25248 (=> (not res!105829) (not e!84605))))

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((array!5846 0))(
  ( (array!5847 (arr!3262 (Array (_ BitVec 32) (_ BitVec 64))) (size!2645 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!60 0))(
  ( (Asn1ObjectIdentifier!61 (nCount!41 (_ BitVec 32)) (values!38 array!5846)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!60)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!60)

(get-info :version)

(declare-datatypes ((Unit!7916 0))(
  ( (Unit!7917) )
))
(declare-datatypes ((ControlFlow!44 0))(
  ( (Return!43 (value!4567 Bool)) (Proceed!43 (value!4568 Unit!7916)) )
))
(declare-fun Unit!7918 () Unit!7916)

(assert (=> start!25248 (= res!105829 (and (bvsge (nCount!41 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!41 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!41 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!41 pVal2!5) #b00000000000000000000000000010100) (not ((_ is Return!43) (ite (not (= (nCount!41 pVal1!5) (nCount!41 pVal2!5))) (Return!43 false) (Proceed!43 Unit!7918)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!41 pVal1!5)) (bvslt i!528 (nCount!41 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!41 pVal1!5))))))

(assert (=> start!25248 e!84605))

(declare-fun e!84607 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!60) Bool)

(assert (=> start!25248 (and (inv!11 pVal1!5) e!84607)))

(declare-fun e!84608 () Bool)

(assert (=> start!25248 (and (inv!11 pVal2!5) e!84608)))

(assert (=> start!25248 true))

(declare-fun ret!79 () Bool)

(declare-fun b!127791 () Bool)

(declare-datatypes ((tuple3!474 0))(
  ( (tuple3!475 (_1!5685 Unit!7916) (_2!5685 (_ BitVec 32)) (_3!292 Bool)) )
))
(declare-fun ObjectIdentifier_equalWhile!0 (Asn1ObjectIdentifier!60 Asn1ObjectIdentifier!60 (_ BitVec 32) Bool) tuple3!474)

(assert (=> b!127791 (= e!84605 (bvsgt (_2!5685 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3262 (values!38 pVal1!5)) i!528) (select (arr!3262 (values!38 pVal2!5)) i!528))))) (nCount!41 pVal1!5)))))

(declare-fun b!127792 () Bool)

(declare-fun array_inv!2434 (array!5846) Bool)

(assert (=> b!127792 (= e!84607 (array_inv!2434 (values!38 pVal1!5)))))

(declare-fun b!127793 () Bool)

(assert (=> b!127793 (= e!84608 (array_inv!2434 (values!38 pVal2!5)))))

(assert (= (and start!25248 res!105829) b!127791))

(assert (= start!25248 b!127792))

(assert (= start!25248 b!127793))

(declare-fun m!193553 () Bool)

(assert (=> start!25248 m!193553))

(declare-fun m!193555 () Bool)

(assert (=> start!25248 m!193555))

(declare-fun m!193557 () Bool)

(assert (=> b!127791 m!193557))

(declare-fun m!193559 () Bool)

(assert (=> b!127791 m!193559))

(declare-fun m!193561 () Bool)

(assert (=> b!127791 m!193561))

(declare-fun m!193563 () Bool)

(assert (=> b!127792 m!193563))

(declare-fun m!193565 () Bool)

(assert (=> b!127793 m!193565))

(check-sat (not b!127793) (not start!25248) (not b!127792) (not b!127791))
(check-sat)
(get-model)

(declare-fun d!41298 () Bool)

(assert (=> d!41298 (= (array_inv!2434 (values!38 pVal2!5)) (bvsge (size!2645 (values!38 pVal2!5)) #b00000000000000000000000000000000))))

(assert (=> b!127793 d!41298))

(declare-fun d!41300 () Bool)

(assert (=> d!41300 (= (inv!11 pVal1!5) (and (= (size!2645 (values!38 pVal1!5)) #b00000000000000000000000000010100) (bvsge (nCount!41 pVal1!5) #b00000000000000000000000000000000)))))

(assert (=> start!25248 d!41300))

(declare-fun d!41302 () Bool)

(assert (=> d!41302 (= (inv!11 pVal2!5) (and (= (size!2645 (values!38 pVal2!5)) #b00000000000000000000000000010100) (bvsge (nCount!41 pVal2!5) #b00000000000000000000000000000000)))))

(assert (=> start!25248 d!41302))

(declare-fun d!41304 () Bool)

(assert (=> d!41304 (= (array_inv!2434 (values!38 pVal1!5)) (bvsge (size!2645 (values!38 pVal1!5)) #b00000000000000000000000000000000))))

(assert (=> b!127792 d!41304))

(declare-fun d!41306 () Bool)

(declare-fun lt!199007 () tuple3!474)

(assert (=> d!41306 (and (bvsge (_2!5685 lt!199007) #b00000000000000000000000000000000) (bvsle (_2!5685 lt!199007) (nCount!41 pVal1!5)) (bvsge (_2!5685 lt!199007) (nCount!41 pVal1!5)))))

(declare-fun e!84632 () tuple3!474)

(assert (=> d!41306 (= lt!199007 e!84632)))

(declare-fun c!7521 () Bool)

(declare-fun lt!199006 () (_ BitVec 32))

(assert (=> d!41306 (= c!7521 (bvslt lt!199006 (nCount!41 pVal1!5)))))

(assert (=> d!41306 (= lt!199006 (bvadd #b00000000000000000000000000000001 i!528 #b00000000000000000000000000000001))))

(declare-fun lt!199005 () Bool)

(assert (=> d!41306 (= lt!199005 (and (and ret!79 (= (select (arr!3262 (values!38 pVal1!5)) i!528) (select (arr!3262 (values!38 pVal2!5)) i!528))) (= (select (arr!3262 (values!38 pVal1!5)) (bvadd #b00000000000000000000000000000001 i!528)) (select (arr!3262 (values!38 pVal2!5)) (bvadd #b00000000000000000000000000000001 i!528)))))))

(assert (=> d!41306 (and (bvsge (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!528) (nCount!41 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!41 pVal1!5)))))

(assert (=> d!41306 (= (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3262 (values!38 pVal1!5)) i!528) (select (arr!3262 (values!38 pVal2!5)) i!528)))) lt!199007)))

(declare-fun b!127819 () Bool)

(assert (=> b!127819 (= e!84632 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 lt!199006 lt!199005))))

(declare-fun b!127820 () Bool)

(declare-fun Unit!7923 () Unit!7916)

(assert (=> b!127820 (= e!84632 (tuple3!475 Unit!7923 lt!199006 lt!199005))))

(assert (= (and d!41306 c!7521) b!127819))

(assert (= (and d!41306 (not c!7521)) b!127820))

(declare-fun m!193593 () Bool)

(assert (=> d!41306 m!193593))

(declare-fun m!193595 () Bool)

(assert (=> d!41306 m!193595))

(declare-fun m!193597 () Bool)

(assert (=> b!127819 m!193597))

(assert (=> b!127791 d!41306))

(check-sat (not b!127819))
(check-sat)
