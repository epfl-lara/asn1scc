; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25218 () Bool)

(assert start!25218)

(declare-datatypes ((array!5831 0))(
  ( (array!5832 (arr!3256 (Array (_ BitVec 32) (_ BitVec 64))) (size!2639 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!48 0))(
  ( (Asn1ObjectIdentifier!49 (nCount!35 (_ BitVec 32)) (values!32 array!5831)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!48)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!48)

(declare-fun i!528 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((Unit!7897 0))(
  ( (Unit!7898) )
))
(declare-datatypes ((ControlFlow!38 0))(
  ( (Return!37 (value!4545 Bool)) (Proceed!37 (value!4546 Unit!7897)) )
))
(declare-fun Unit!7899 () Unit!7897)

(assert (=> start!25218 (and (bvsge (nCount!35 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!35 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!35 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!35 pVal2!5) #b00000000000000000000000000010100) (not ((_ is Return!37) (ite (not (= (nCount!35 pVal1!5) (nCount!35 pVal2!5))) (Return!37 false) (Proceed!37 Unit!7899)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!35 pVal1!5)) (bvslt i!528 (nCount!35 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!35 pVal1!5)) (bvsge (bvsub (nCount!35 pVal1!5) (bvadd #b00000000000000000000000000000001 i!528)) (bvsub (nCount!35 pVal1!5) i!528)))))

(declare-fun e!84509 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!48) Bool)

(assert (=> start!25218 (and (inv!11 pVal1!5) e!84509)))

(declare-fun e!84511 () Bool)

(assert (=> start!25218 (and (inv!11 pVal2!5) e!84511)))

(assert (=> start!25218 true))

(declare-fun b!127723 () Bool)

(declare-fun array_inv!2428 (array!5831) Bool)

(assert (=> b!127723 (= e!84509 (array_inv!2428 (values!32 pVal1!5)))))

(declare-fun b!127724 () Bool)

(assert (=> b!127724 (= e!84511 (array_inv!2428 (values!32 pVal2!5)))))

(assert (= start!25218 b!127723))

(assert (= start!25218 b!127724))

(declare-fun m!193469 () Bool)

(assert (=> start!25218 m!193469))

(declare-fun m!193471 () Bool)

(assert (=> start!25218 m!193471))

(declare-fun m!193473 () Bool)

(assert (=> b!127723 m!193473))

(declare-fun m!193475 () Bool)

(assert (=> b!127724 m!193475))

(check-sat (not start!25218) (not b!127724) (not b!127723))
(check-sat)
