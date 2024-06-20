; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25194 () Bool)

(assert start!25194)

(declare-fun i!528 () (_ BitVec 32))

(declare-fun ret!79 () Bool)

(declare-datatypes ((array!5816 0))(
  ( (array!5817 (arr!3250 (Array (_ BitVec 32) (_ BitVec 64))) (size!2633 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!36 0))(
  ( (Asn1ObjectIdentifier!37 (nCount!29 (_ BitVec 32)) (values!26 array!5816)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!36)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!36)

(get-info :version)

(declare-datatypes ((Unit!7879 0))(
  ( (Unit!7880) )
))
(declare-datatypes ((ControlFlow!32 0))(
  ( (Return!31 (value!4523 Bool)) (Proceed!31 (value!4524 Unit!7879)) )
))
(declare-fun Unit!7881 () Unit!7879)

(assert (=> start!25194 (and (bvsge (nCount!29 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!29 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!29 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!29 pVal2!5) #b00000000000000000000000000010100) (not ((_ is Return!31) (ite (not (= (nCount!29 pVal1!5) (nCount!29 pVal2!5))) (Return!31 false) (Proceed!31 Unit!7881)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!29 pVal1!5)) (bvslt i!528 (nCount!29 pVal1!5)) ret!79 (bvsge i!528 (size!2633 (values!26 pVal2!5))))))

(declare-fun e!84437 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!36) Bool)

(assert (=> start!25194 (and (inv!11 pVal1!5) e!84437)))

(declare-fun e!84439 () Bool)

(assert (=> start!25194 (and (inv!11 pVal2!5) e!84439)))

(assert (=> start!25194 true))

(declare-fun b!127687 () Bool)

(declare-fun array_inv!2422 (array!5816) Bool)

(assert (=> b!127687 (= e!84437 (array_inv!2422 (values!26 pVal1!5)))))

(declare-fun b!127688 () Bool)

(assert (=> b!127688 (= e!84439 (array_inv!2422 (values!26 pVal2!5)))))

(assert (= start!25194 b!127687))

(assert (= start!25194 b!127688))

(declare-fun m!193421 () Bool)

(assert (=> start!25194 m!193421))

(declare-fun m!193423 () Bool)

(assert (=> start!25194 m!193423))

(declare-fun m!193425 () Bool)

(assert (=> b!127687 m!193425))

(declare-fun m!193427 () Bool)

(assert (=> b!127688 m!193427))

(check-sat (not start!25194) (not b!127688) (not b!127687))
(check-sat)
(get-model)

(declare-fun d!41240 () Bool)

(assert (=> d!41240 (= (inv!11 pVal1!5) (and (= (size!2633 (values!26 pVal1!5)) #b00000000000000000000000000010100) (bvsge (nCount!29 pVal1!5) #b00000000000000000000000000000000)))))

(assert (=> start!25194 d!41240))

(declare-fun d!41242 () Bool)

(assert (=> d!41242 (= (inv!11 pVal2!5) (and (= (size!2633 (values!26 pVal2!5)) #b00000000000000000000000000010100) (bvsge (nCount!29 pVal2!5) #b00000000000000000000000000000000)))))

(assert (=> start!25194 d!41242))

(declare-fun d!41244 () Bool)

(assert (=> d!41244 (= (array_inv!2422 (values!26 pVal2!5)) (bvsge (size!2633 (values!26 pVal2!5)) #b00000000000000000000000000000000))))

(assert (=> b!127688 d!41244))

(declare-fun d!41246 () Bool)

(assert (=> d!41246 (= (array_inv!2422 (values!26 pVal1!5)) (bvsge (size!2633 (values!26 pVal1!5)) #b00000000000000000000000000000000))))

(assert (=> b!127687 d!41246))

(check-sat)
