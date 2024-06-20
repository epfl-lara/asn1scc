; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34114 () Bool)

(assert start!34114)

(declare-datatypes ((array!8042 0))(
  ( (array!8043 (arr!4526 (Array (_ BitVec 32) (_ BitVec 64))) (size!3605 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!78 0))(
  ( (Asn1ObjectIdentifier!79 (nCount!50 (_ BitVec 32)) (values!47 array!8042)) )
))
(declare-fun inv!11 (Asn1ObjectIdentifier!78) Bool)

(assert (=> start!34114 (not (inv!11 (Asn1ObjectIdentifier!79 #b00000000000000000000000000000000 (array!8043 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))))))

(declare-fun bs!13886 () Bool)

(assert (= bs!13886 start!34114))

(declare-fun m!258451 () Bool)

(assert (=> bs!13886 m!258451))

(check-sat (not start!34114))
(check-sat)
(get-model)

(declare-fun d!56033 () Bool)

(assert (=> d!56033 (= (inv!11 (Asn1ObjectIdentifier!79 #b00000000000000000000000000000000 (array!8043 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))) (and (= (size!3605 (values!47 (Asn1ObjectIdentifier!79 #b00000000000000000000000000000000 (array!8043 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100)))) #b00000000000000000000000000010100) (bvsge (nCount!50 (Asn1ObjectIdentifier!79 #b00000000000000000000000000000000 (array!8043 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000010100))) #b00000000000000000000000000000000)))))

(assert (=> start!34114 d!56033))

(check-sat)
