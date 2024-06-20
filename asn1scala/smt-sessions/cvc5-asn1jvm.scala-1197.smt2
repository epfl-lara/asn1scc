; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34112 () Bool)

(assert start!34112)

(declare-datatypes ((array!8040 0))(
  ( (array!8041 (arr!4525 (Array (_ BitVec 32) (_ BitVec 64))) (size!3604 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!76 0))(
  ( (Asn1ObjectIdentifier!77 (nCount!49 (_ BitVec 32)) (values!46 array!8040)) )
))
(declare-fun inv!11 (Asn1ObjectIdentifier!76) Bool)

(assert (=> start!34112 (not (inv!11 (Asn1ObjectIdentifier!77 #b00000000000000000000000000000000 (array!8041 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))))))

(declare-fun bs!13885 () Bool)

(assert (= bs!13885 start!34112))

(declare-fun m!258449 () Bool)

(assert (=> bs!13885 m!258449))

(push 1)

(assert (not start!34112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56029 () Bool)

(assert (=> d!56029 (= (inv!11 (Asn1ObjectIdentifier!77 #b00000000000000000000000000000000 (array!8041 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))) (and (= (size!3604 (values!46 (Asn1ObjectIdentifier!77 #b00000000000000000000000000000000 (array!8041 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100)))) #b00000000000000000000000000010100) (bvsge (nCount!49 (Asn1ObjectIdentifier!77 #b00000000000000000000000000000000 (array!8041 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))) #b00000000000000000000000000000000)))))

(assert (=> start!34112 d!56029))

(push 1)

