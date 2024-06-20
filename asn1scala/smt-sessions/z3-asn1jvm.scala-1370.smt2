; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37982 () Bool)

(assert start!37982)

(declare-fun res!142296 () Bool)

(declare-fun e!119816 () Bool)

(assert (=> start!37982 (=> (not res!142296) (not e!119816))))

(declare-fun i!510 () (_ BitVec 32))

(assert (=> start!37982 (= res!142296 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100)))))

(assert (=> start!37982 e!119816))

(assert (=> start!37982 true))

(declare-datatypes ((array!9117 0))(
  ( (array!9118 (arr!4964 (Array (_ BitVec 32) (_ BitVec 64))) (size!4034 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!90 0))(
  ( (Asn1ObjectIdentifier!91 (nCount!56 (_ BitVec 32)) (values!53 array!9117)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!90)

(declare-fun e!119817 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!90) Bool)

(assert (=> start!37982 (and (inv!11 pVal!32) e!119817)))

(declare-fun b!171596 () Bool)

(assert (=> b!171596 (= e!119816 (not (inv!11 (Asn1ObjectIdentifier!91 (nCount!56 pVal!32) (array!9118 (store (arr!4964 (values!53 pVal!32)) i!510 #b0000000000000000000000000000000000000000000000000000000000000000) (size!4034 (values!53 pVal!32)))))))))

(declare-fun b!171597 () Bool)

(declare-fun array_inv!3775 (array!9117) Bool)

(assert (=> b!171597 (= e!119817 (array_inv!3775 (values!53 pVal!32)))))

(assert (= (and start!37982 res!142296) b!171596))

(assert (= start!37982 b!171597))

(declare-fun m!270831 () Bool)

(assert (=> start!37982 m!270831))

(declare-fun m!270833 () Bool)

(assert (=> b!171596 m!270833))

(declare-fun m!270835 () Bool)

(assert (=> b!171596 m!270835))

(declare-fun m!270837 () Bool)

(assert (=> b!171597 m!270837))

(check-sat (not b!171597) (not b!171596) (not start!37982))
(check-sat)
(get-model)

(declare-fun d!60759 () Bool)

(assert (=> d!60759 (= (array_inv!3775 (values!53 pVal!32)) (bvsge (size!4034 (values!53 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171597 d!60759))

(declare-fun d!60763 () Bool)

