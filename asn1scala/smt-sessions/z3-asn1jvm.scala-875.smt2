; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25172 () Bool)

(assert start!25172)

(declare-datatypes ((array!5797 0))(
  ( (array!5798 (arr!3241 (Array (_ BitVec 32) (_ BitVec 64))) (size!2624 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!18 0))(
  ( (Asn1ObjectIdentifier!19 (nCount!20 (_ BitVec 32)) (values!17 array!5797)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!18)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!18)

(declare-fun i!528 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!7852 0))(
  ( (Unit!7853) )
))
(declare-datatypes ((ControlFlow!23 0))(
  ( (Return!22 (value!4490 Bool)) (Proceed!22 (value!4491 Unit!7852)) )
))
(declare-fun Unit!7854 () Unit!7852)

(assert (=> start!25172 (and (bvsge (nCount!20 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!20 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!20 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!20 pVal2!5) #b00000000000000000000000000010100) (not ((_ is Return!22) (ite (not (= (nCount!20 pVal1!5) (nCount!20 pVal2!5))) (Return!22 false) (Proceed!22 Unit!7854)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!20 pVal1!5)) (bvslt i!528 (nCount!20 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!20 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) #b00000000000000000000000000000000))))

(declare-fun e!84329 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!18) Bool)

(assert (=> start!25172 (and (inv!11 pVal1!5) e!84329)))

(declare-fun e!84331 () Bool)

(assert (=> start!25172 (and (inv!11 pVal2!5) e!84331)))

(assert (=> start!25172 true))

(declare-fun b!127633 () Bool)

(declare-fun array_inv!2413 (array!5797) Bool)

(assert (=> b!127633 (= e!84329 (array_inv!2413 (values!17 pVal1!5)))))

(declare-fun b!127634 () Bool)

(assert (=> b!127634 (= e!84331 (array_inv!2413 (values!17 pVal2!5)))))

(assert (= start!25172 b!127633))

(assert (= start!25172 b!127634))

(declare-fun m!193349 () Bool)

(assert (=> start!25172 m!193349))

(declare-fun m!193351 () Bool)

(assert (=> start!25172 m!193351))

(declare-fun m!193353 () Bool)

(assert (=> b!127633 m!193353))

(declare-fun m!193355 () Bool)

(assert (=> b!127634 m!193355))

(check-sat (not start!25172) (not b!127634) (not b!127633))
(check-sat)
