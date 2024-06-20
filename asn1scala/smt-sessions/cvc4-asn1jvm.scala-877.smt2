; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25186 () Bool)

(assert start!25186)

(declare-fun i!528 () (_ BitVec 32))

(declare-fun ret!79 () Bool)

(declare-datatypes ((array!5811 0))(
  ( (array!5812 (arr!3248 (Array (_ BitVec 32) (_ BitVec 64))) (size!2631 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!32 0))(
  ( (Asn1ObjectIdentifier!33 (nCount!27 (_ BitVec 32)) (values!24 array!5811)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!32)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!32)

(declare-datatypes ((Unit!7873 0))(
  ( (Unit!7874) )
))
(declare-datatypes ((ControlFlow!30 0))(
  ( (Return!29 (value!4514 Bool)) (Proceed!29 (value!4515 Unit!7873)) )
))
(declare-fun Unit!7875 () Unit!7873)

(assert (=> start!25186 (and (bvsge (nCount!27 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!27 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!27 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!27 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!29 (ite (not (= (nCount!27 pVal1!5) (nCount!27 pVal2!5))) (Return!29 false) (Proceed!29 Unit!7875)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!27 pVal1!5)) (bvslt i!528 (nCount!27 pVal1!5)) ret!79 (bvsge i!528 (size!2631 (values!24 pVal1!5))))))

(declare-fun e!84413 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!32) Bool)

(assert (=> start!25186 (and (inv!11 pVal1!5) e!84413)))

(declare-fun e!84415 () Bool)

(assert (=> start!25186 (and (inv!11 pVal2!5) e!84415)))

(assert (=> start!25186 true))

(declare-fun b!127675 () Bool)

(declare-fun array_inv!2420 (array!5811) Bool)

(assert (=> b!127675 (= e!84413 (array_inv!2420 (values!24 pVal1!5)))))

(declare-fun b!127676 () Bool)

(assert (=> b!127676 (= e!84415 (array_inv!2420 (values!24 pVal2!5)))))

(assert (= start!25186 b!127675))

(assert (= start!25186 b!127676))

(declare-fun m!193405 () Bool)

(assert (=> start!25186 m!193405))

(declare-fun m!193407 () Bool)

(assert (=> start!25186 m!193407))

(declare-fun m!193409 () Bool)

(assert (=> b!127675 m!193409))

(declare-fun m!193411 () Bool)

(assert (=> b!127676 m!193411))

(push 1)

(assert (not start!25186))

(assert (not b!127675))

(assert (not b!127676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

