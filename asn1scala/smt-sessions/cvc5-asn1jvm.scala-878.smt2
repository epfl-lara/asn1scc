; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25192 () Bool)

(assert start!25192)

(declare-fun i!528 () (_ BitVec 32))

(declare-fun ret!79 () Bool)

(declare-datatypes ((array!5814 0))(
  ( (array!5815 (arr!3249 (Array (_ BitVec 32) (_ BitVec 64))) (size!2632 (_ BitVec 32))) )
))
(declare-datatypes ((Asn1ObjectIdentifier!34 0))(
  ( (Asn1ObjectIdentifier!35 (nCount!28 (_ BitVec 32)) (values!25 array!5814)) )
))
(declare-fun pVal2!5 () Asn1ObjectIdentifier!34)

(declare-fun pVal1!5 () Asn1ObjectIdentifier!34)

(declare-datatypes ((Unit!7876 0))(
  ( (Unit!7877) )
))
(declare-datatypes ((ControlFlow!31 0))(
  ( (Return!30 (value!4521 Bool)) (Proceed!30 (value!4522 Unit!7876)) )
))
(declare-fun Unit!7878 () Unit!7876)

(assert (=> start!25192 (and (bvsge (nCount!28 pVal1!5) #b00000000000000000000000000000000) (bvsle (nCount!28 pVal1!5) #b00000000000000000000000000010100) (bvsge (nCount!28 pVal2!5) #b00000000000000000000000000000000) (bvsle (nCount!28 pVal2!5) #b00000000000000000000000000010100) (not (is-Return!30 (ite (not (= (nCount!28 pVal1!5) (nCount!28 pVal2!5))) (Return!30 false) (Proceed!30 Unit!7878)))) (bvsge i!528 #b00000000000000000000000000000000) (bvsle i!528 (nCount!28 pVal1!5)) (bvslt i!528 (nCount!28 pVal1!5)) ret!79 (bvsge i!528 (size!2632 (values!25 pVal2!5))))))

(declare-fun e!84425 () Bool)

(declare-fun inv!11 (Asn1ObjectIdentifier!34) Bool)

(assert (=> start!25192 (and (inv!11 pVal1!5) e!84425)))

(declare-fun e!84427 () Bool)

(assert (=> start!25192 (and (inv!11 pVal2!5) e!84427)))

(assert (=> start!25192 true))

(declare-fun b!127681 () Bool)

(declare-fun array_inv!2421 (array!5814) Bool)

(assert (=> b!127681 (= e!84425 (array_inv!2421 (values!25 pVal1!5)))))

(declare-fun b!127682 () Bool)

(assert (=> b!127682 (= e!84427 (array_inv!2421 (values!25 pVal2!5)))))

(assert (= start!25192 b!127681))

(assert (= start!25192 b!127682))

(declare-fun m!193413 () Bool)

(assert (=> start!25192 m!193413))

(declare-fun m!193415 () Bool)

(assert (=> start!25192 m!193415))

(declare-fun m!193417 () Bool)

(assert (=> b!127681 m!193417))

(declare-fun m!193419 () Bool)

(assert (=> b!127682 m!193419))

(push 1)

(assert (not start!25192))

(assert (not b!127681))

(assert (not b!127682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41248 () Bool)

(assert (=> d!41248 (= (inv!11 pVal1!5) (and (= (size!2632 (values!25 pVal1!5)) #b00000000000000000000000000010100) (bvsge (nCount!28 pVal1!5) #b00000000000000000000000000000000)))))

(assert (=> start!25192 d!41248))

(declare-fun d!41250 () Bool)

(assert (=> d!41250 (= (inv!11 pVal2!5) (and (= (size!2632 (values!25 pVal2!5)) #b00000000000000000000000000010100) (bvsge (nCount!28 pVal2!5) #b00000000000000000000000000000000)))))

(assert (=> start!25192 d!41250))

(declare-fun d!41252 () Bool)

(assert (=> d!41252 (= (array_inv!2421 (values!25 pVal1!5)) (bvsge (size!2632 (values!25 pVal1!5)) #b00000000000000000000000000000000))))

