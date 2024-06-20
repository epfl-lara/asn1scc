; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19860 () Bool)

(assert start!19860)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((array!4633 0))(
  ( (array!4634 (arr!2709 (Array (_ BitVec 32) (_ BitVec 8))) (size!2116 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3706 0))(
  ( (BitStream!3707 (buf!2473 array!4633) (currentByte!4909 (_ BitVec 32)) (currentBit!4904 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3706)

(assert (=> start!19860 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2116 (buf!2473 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4909 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4904 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2116 (buf!2473 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4909 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4904 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19860 true))

(declare-fun e!64787 () Bool)

(declare-fun inv!12 (BitStream!3706) Bool)

(assert (=> start!19860 (and (inv!12 thiss!1305) e!64787)))

(declare-fun b!99056 () Bool)

(declare-fun array_inv!1918 (array!4633) Bool)

(assert (=> b!99056 (= e!64787 (array_inv!1918 (buf!2473 thiss!1305)))))

(assert (= start!19860 b!99056))

(declare-fun m!144489 () Bool)

(assert (=> start!19860 m!144489))

(declare-fun m!144491 () Bool)

(assert (=> b!99056 m!144491))

(push 1)

(assert (not b!99056))

(assert (not start!19860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31260 () Bool)

(assert (=> d!31260 (= (array_inv!1918 (buf!2473 thiss!1305)) (bvsge (size!2116 (buf!2473 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!99056 d!31260))

(declare-fun d!31262 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

