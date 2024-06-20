; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25184 () Bool)

(assert start!25184)

(declare-fun i!528 () (_ BitVec 32))

(declare-fun ret!79 () Bool)

(declare-datatypes ((array!5809 0))(
  ( (array!5810 (arr!3247 (Array (_ BitVec 32) (_ BitVec 64))) (size!2630 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!30 0))(
  ( (Asn1ObjectIdentifier!31 (nCount!26 (_ BitVec 32)) (values!23 array!5809)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!30)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!30)

(get-info :version)

(declare-datatypes ((Unit!7870 0))(
  ( (Unit!7871) )
))
(declare-datatypes ((ControlFlow!29 0))(
  ( (Return!28 (value!4512 Bool)) (Proceed!28 (value!4513 Unit!7870)) )
))
(declare-fun Unit!7872 () Unit!7870)

(assert (=> start!25184 (and (bvsge (nCount!26 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!26 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!26 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!26 pVal2!5) #b00000000000000000000000000010100) (not ((_ is Return!28) (ite (not (= (nCount!26 pVal1!5) (nCount!26 pVal2!5))) (Return!28 false) (Proceed!28 Unit!7872)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!26 pVal1!5)) (bvslt i!528 (nCount!26 pVal1!5)) ret!79 (bvsge i!528 (size!2630 (values!23 pVal1!5))))))

(declare-fun e!84401 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!30) Bool)

(assert (=> start!25184 (and (inv!11 pVal1!5) e!84401)))

(declare-fun e!84403 () Bool)

(assert (=> start!25184 (and (inv!11 pVal2!5) e!84403)))

(assert (=> start!25184 true))

(declare-fun b!127669 () Bool)

(declare-fun array_inv!2419 (array!5809) Bool)

(assert (=> b!127669 (= e!84401 (array_inv!2419 (values!23 pVal1!5)))))

(declare-fun b!127670 () Bool)

(assert (=> b!127670 (= e!84403 (array_inv!2419 (values!23 pVal2!5)))))

(assert (= start!25184 b!127669))

(assert (= start!25184 b!127670))

(declare-fun m!193397 () Bool)

(assert (=> start!25184 m!193397))

(declare-fun m!193399 () Bool)

(assert (=> start!25184 m!193399))

(declare-fun m!193401 () Bool)

(assert (=> b!127669 m!193401))

(declare-fun m!193403 () Bool)

(assert (=> b!127670 m!193403))

(check-sat (not b!127670) (not b!127669) (not start!25184))
(check-sat)
(get-model)

(declare-fun d!41230 () Bool)

(assert (=> d!41230 (= (array_inv!2419 (values!23 pVal2!5)) (bvsge (size!2630 (values!23 pVal2!5)) #b00000000000000000000000000000000))))

(assert (=> b!127670 d!41230))

(declare-fun d!41232 () Bool)

(assert (=> d!41232 (= (array_inv!2419 (values!23 pVal1!5)) (bvsge (size!2630 (values!23 pVal1!5)) #b00000000000000000000000000000000))))

(assert (=> b!127669 d!41232))

(declare-fun d!41234 () Bool)

(assert (=> d!41234 (= (inv!11 pVal1!5) (and (= (size!2630 (values!23 pVal1!5)) #b00000000000000000000000000010100) (bvsge (nCount!26 pVal1!5) #b00000000000000000000000000000000)))))

(assert (=> start!25184 d!41234))

(declare-fun d!41236 () Bool)

(assert (=> d!41236 (= (inv!11 pVal2!5) (and (= (size!2630 (values!23 pVal2!5)) #b00000000000000000000000000010100) (bvsge (nCount!26 pVal2!5) #b00000000000000000000000000000000)))))

(assert (=> start!25184 d!41236))

(check-sat)
