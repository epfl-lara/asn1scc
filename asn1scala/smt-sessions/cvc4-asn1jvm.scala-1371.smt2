; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38002 () Bool)

(assert start!38002)

(declare-fun i!510 () (_ BitVec 32))

(declare-datatypes ((array!9128 0))(
  ( (array!9129 (arr!4968 (Array (_ BitVec 32) (_ BitVec 64))) (size!4038 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!98 0))(
  ( (Asn1ObjectIdentifier!99 (nCount!60 (_ BitVec 32)) (values!57 array!9128)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!98)

(assert (=> start!38002 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvsge i!510 (size!4038 (values!57 pVal!32))))))

(assert (=> start!38002 true))

(declare-fun e!119844 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!98) Bool)

(assert (=> start!38002 (and (inv!11 pVal!32) e!119844)))

(declare-fun b!171612 () Bool)

(declare-fun array_inv!3779 (array!9128) Bool)

(assert (=> b!171612 (= e!119844 (array_inv!3779 (values!57 pVal!32)))))

(assert (= start!38002 b!171612))

(declare-fun m!270855 () Bool)

(assert (=> start!38002 m!270855))

(declare-fun m!270857 () Bool)

(assert (=> b!171612 m!270857))

(push 1)

(assert (not b!171612))

(assert (not start!38002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

