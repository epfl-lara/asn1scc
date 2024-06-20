; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22 () Bool)

(assert start!22)

(declare-datatypes ((array!12 0))(
  ( (array!13 (arr!394 (Array (_ BitVec 32) (_ BitVec 64))) (size!7 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!10 0))(
  ( (Asn1ObjectIdentifier!11 (nCount!16 (_ BitVec 32)) (values!13 array!12)) )
))
(declare-fun pVal!45 () Asn1ObjectIdentifier!10)

(assert (=> start!22 (and (bvsge (nCount!16 pVal!45) #b00000000000000000000000000000010) (bvsle (select (arr!394 (values!13 pVal!45)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000010) (bvsge #b00000000000000000000000000000001 (size!7 (values!13 pVal!45))))))

(declare-fun e!40 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!10) Bool)

(assert (=> start!22 (and (inv!11 pVal!45) e!40)))

(declare-fun b!343 () Bool)

(declare-fun array_inv!4 (array!12) Bool)

(assert (=> b!343 (= e!40 (array_inv!4 (values!13 pVal!45)))))

(assert (= start!22 b!343))

(declare-fun m!25 () Bool)

(assert (=> start!22 m!25))

(declare-fun m!27 () Bool)

(assert (=> start!22 m!27))

(declare-fun m!29 () Bool)

(assert (=> b!343 m!29))

(push 1)

(assert (not start!22))

(assert (not b!343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!704 () Bool)

