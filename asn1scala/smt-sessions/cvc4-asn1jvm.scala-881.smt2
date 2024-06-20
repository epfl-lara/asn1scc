; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25226 () Bool)

(assert start!25226)

(declare-fun res!105823 () Bool)

(declare-fun e!84566 () Bool)

(assert (=> start!25226 (=> (not res!105823) (not e!84566))))

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((array!5839 0))(
  ( (array!5840 (arr!3260 (Array (_ BitVec 32) (_ BitVec 64))) (size!2643 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!56 0))(
  ( (Asn1ObjectIdentifier!57 (nCount!39 (_ BitVec 32)) (values!36 array!5839)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!56)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!56)

(declare-datatypes ((Unit!7909 0))(
  ( (Unit!7910) )
))
(declare-datatypes ((ControlFlow!42 0))(
  ( (Return!41 (value!4558 Bool)) (Proceed!41 (value!4559 Unit!7909)) )
))
(declare-fun Unit!7911 () Unit!7909)

(assert (=> start!25226 (= res!105823 (and (bvsge (nCount!39 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!39 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!39 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!39 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!41 (ite (not (= (nCount!39 pVal1!5) (nCount!39 pVal2!5))) (Return!41 false) (Proceed!41 Unit!7911)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!39 pVal1!5)) (bvslt i!528 (nCount!39 pVal1!5)) (bvslt (bvadd #b00000000000000000000000000000001 i!528) (nCount!39 pVal1!5))))))

(assert (=> start!25226 e!84566))

(declare-fun e!84567 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!56) Bool)

(assert (=> start!25226 (and (inv!11 pVal1!5) e!84567)))

(declare-fun e!84568 () Bool)

(assert (=> start!25226 (and (inv!11 pVal2!5) e!84568)))

(assert (=> start!25226 true))

(declare-fun ret!79 () Bool)

(declare-fun b!127755 () Bool)

(declare-datatypes ((tuple3!470 0))(
  ( (tuple3!471 (_1!5683 Unit!7909) (_2!5683 (_ BitVec 32)) (_3!290 Bool)) )
))
(declare-fun ObjectIdentifier_equalWhile!0 (Asn1ObjectIdentifier!56 Asn1ObjectIdentifier!56 (_ BitVec 32) Bool) tuple3!470)

(assert (=> b!127755 (= e!84566 (bvslt (_2!5683 (ObjectIdentifier_equalWhile!0 pVal1!5 pVal2!5 (bvadd #b00000000000000000000000000000001 i!528) (and ret!79 (= (select (arr!3260 (values!36 pVal1!5)) i!528) (select (arr!3260 (values!36 pVal2!5)) i!528))))) #b00000000000000000000000000000000))))

(declare-fun b!127756 () Bool)

(declare-fun array_inv!2432 (array!5839) Bool)

(assert (=> b!127756 (= e!84567 (array_inv!2432 (values!36 pVal1!5)))))

(declare-fun b!127757 () Bool)

(assert (=> b!127757 (= e!84568 (array_inv!2432 (values!36 pVal2!5)))))

(assert (= (and start!25226 res!105823) b!127755))

(assert (= start!25226 b!127756))

(assert (= start!25226 b!127757))

(declare-fun m!193513 () Bool)

(assert (=> start!25226 m!193513))

(declare-fun m!193515 () Bool)

(assert (=> start!25226 m!193515))

(declare-fun m!193517 () Bool)

(assert (=> b!127755 m!193517))

(declare-fun m!193519 () Bool)

(assert (=> b!127755 m!193519))

(declare-fun m!193521 () Bool)

(assert (=> b!127755 m!193521))

(declare-fun m!193523 () Bool)

(assert (=> b!127756 m!193523))

(declare-fun m!193525 () Bool)

(assert (=> b!127757 m!193525))

(push 1)

(assert (not start!25226))

(assert (not b!127756))

(assert (not b!127757))

(assert (not b!127755))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

