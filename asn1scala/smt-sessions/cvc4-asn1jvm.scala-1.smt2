; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26 () Bool)

(assert start!26)

(declare-datatypes ((array!16 0))(
  ( (array!17 (arr!396 (Array (_ BitVec 32) (_ BitVec 64))) (size!9 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!14 0))(
  ( (Asn1ObjectIdentifier!15 (nCount!18 (_ BitVec 32)) (values!15 array!16)) )
))
(declare-fun pVal!45 () Asn1ObjectIdentifier!14)

(assert (=> start!26 (and (bvsge (nCount!18 pVal!45) #b00000000000000000000000000000010) (bvsle (select (arr!396 (values!15 pVal!45)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000010) (bvsge #b00000000000000000000000000000001 (size!9 (values!15 pVal!45))))))

(declare-fun e!52 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!14) Bool)

(assert (=> start!26 (and (inv!11 pVal!45) e!52)))

(declare-fun b!349 () Bool)

(declare-fun array_inv!6 (array!16) Bool)

(assert (=> b!349 (= e!52 (array_inv!6 (values!15 pVal!45)))))

(assert (= start!26 b!349))

(declare-fun m!37 () Bool)

(assert (=> start!26 m!37))

(declare-fun m!39 () Bool)

(assert (=> start!26 m!39))

(declare-fun m!41 () Bool)

(assert (=> b!349 m!41))

(push 1)

(assert (not start!26))

(assert (not b!349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!702 () Bool)

(assert (=> d!702 (= (inv!11 pVal!45) (and (= (size!9 (values!15 pVal!45)) #b00000000000000000000000000010100) (bvsge (nCount!18 pVal!45) #b00000000000000000000000000000000)))))

