; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37998 () Bool)

(assert start!37998)

(declare-fun i!510 () (_ BitVec 32))

(declare-datatypes ((array!9124 0))(
  ( (array!9125 (arr!4966 (Array (_ BitVec 32) (_ BitVec 64))) (size!4036 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!94 0))(
  ( (Asn1ObjectIdentifier!95 (nCount!58 (_ BitVec 32)) (values!55 array!9124)) )
))
(declare-fun pVal!32 () Asn1ObjectIdentifier!94)

(assert (=> start!37998 (and (bvsge i!510 #b00000000000000000000000000000000) (bvsle i!510 #b00000000000000000000000000010100) (bvslt i!510 #b00000000000000000000000000010100) (bvsge i!510 (size!4036 (values!55 pVal!32))))))

(assert (=> start!37998 true))

(declare-fun e!119832 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!94) Bool)

(assert (=> start!37998 (and (inv!11 pVal!32) e!119832)))

(declare-fun b!171606 () Bool)

(declare-fun array_inv!3777 (array!9124) Bool)

(assert (=> b!171606 (= e!119832 (array_inv!3777 (values!55 pVal!32)))))

(assert (= start!37998 b!171606))

(declare-fun m!270847 () Bool)

(assert (=> start!37998 m!270847))

(declare-fun m!270849 () Bool)

(assert (=> b!171606 m!270849))

(push 1)

(assert (not b!171606))

(assert (not start!37998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60775 () Bool)

(assert (=> d!60775 (= (array_inv!3777 (values!55 pVal!32)) (bvsge (size!4036 (values!55 pVal!32)) #b00000000000000000000000000000000))))

(assert (=> b!171606 d!60775))

