; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34116 () Bool)

(assert start!34116)

(declare-datatypes ((array!8044 0))(
  ( (array!8045 (arr!4527 (Array (_ BitVec 32) (_ BitVec 64))) (size!3606 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!80 0))(
  ( (Asn1ObjectIdentifier!81 (nCount!51 (_ BitVec 32)) (values!48 array!8044)) )
))
(declare-fun inv!11 (Asn1ObjectIdentifier!80) Bool)

(assert (=> start!34116 (not (inv!11 (Asn1ObjectIdentifier!81 #b00000000000000000000000000000000 (array!8045 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))))))

(declare-fun bs!13887 () Bool)

(assert (= bs!13887 start!34116))

(declare-fun m!258453 () Bool)

(assert (=> bs!13887 m!258453))

(push 1)

(assert (not start!34116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56031 () Bool)

(assert (=> d!56031 (= (inv!11 (Asn1ObjectIdentifier!81 #b00000000000000000000000000000000 (array!8045 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))) (and (= (size!3606 (values!48 (Asn1ObjectIdentifier!81 #b00000000000000000000000000000000 (array!8045 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100)))) #b00000000000000000000000000010100) (bvsge (nCount!51 (Asn1ObjectIdentifier!81 #b00000000000000000000000000000000 (array!8045 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))) #b00000000000000000000000000000000)))))

(assert (=> start!34116 d!56031))

(push 1)

(check-sat)

