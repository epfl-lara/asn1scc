; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25180 () Bool)

(assert start!25180)

(declare-datatypes ((array!5805 0))(
  ( (array!5806 (arr!3245 (Array (_ BitVec 32) (_ BitVec 64))) (size!2628 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!26 0))(
  ( (Asn1ObjectIdentifier!27 (nCount!24 (_ BitVec 32)) (values!21 array!5805)) )
))
(declare-fun pVal1!5 () Asn1ObjectIdentifier!26)

(declare-fun pVal2!5 () Asn1ObjectIdentifier!26)

(declare-fun i!528 () (_ BitVec 32))

(declare-datatypes ((Unit!7864 0))(
  ( (Unit!7865) )
))
(declare-datatypes ((ControlFlow!27 0))(
  ( (Return!26 (value!4503 Bool)) (Proceed!26 (value!4504 Unit!7864)) )
))
(declare-fun Unit!7866 () Unit!7864)

(assert (=> start!25180 (and (bvsge (nCount!24 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!24 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!24 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!24 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!26 (ite (not (= (nCount!24 pVal1!5) (nCount!24 pVal2!5))) (Return!26 false) (Proceed!26 Unit!7866)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!24 pVal1!5)) (bvslt i!528 (nCount!24 pVal1!5)) (not (= (bvand (nCount!24 pVal1!5) #b10000000000000000000000000000000) (bvand i!528 #b10000000000000000000000000000000))) (not (= (bvand (nCount!24 pVal1!5) #b10000000000000000000000000000000) (bvand (bvsub (nCount!24 pVal1!5) i!528) #b10000000000000000000000000000000))))))

(declare-fun e!84377 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!26) Bool)

(assert (=> start!25180 (and (inv!11 pVal1!5) e!84377)))

(declare-fun e!84379 () Bool)

(assert (=> start!25180 (and (inv!11 pVal2!5) e!84379)))

(assert (=> start!25180 true))

(declare-fun b!127657 () Bool)

(declare-fun array_inv!2417 (array!5805) Bool)

(assert (=> b!127657 (= e!84377 (array_inv!2417 (values!21 pVal1!5)))))

(declare-fun b!127658 () Bool)

(assert (=> b!127658 (= e!84379 (array_inv!2417 (values!21 pVal2!5)))))

(assert (= start!25180 b!127657))

(assert (= start!25180 b!127658))

(declare-fun m!193381 () Bool)

(assert (=> start!25180 m!193381))

(declare-fun m!193383 () Bool)

(assert (=> start!25180 m!193383))

(declare-fun m!193385 () Bool)

(assert (=> b!127657 m!193385))

(declare-fun m!193387 () Bool)

(assert (=> b!127658 m!193387))

(push 1)

