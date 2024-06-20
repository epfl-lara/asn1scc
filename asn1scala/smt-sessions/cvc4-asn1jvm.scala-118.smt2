; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2754 () Bool)

(assert start!2754)

(declare-datatypes ((array!727 0))(
  ( (array!728 (arr!747 (Array (_ BitVec 32) (_ BitVec 8))) (size!318 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!596 0))(
  ( (BitStream!597 (buf!669 array!727) (currentByte!1753 (_ BitVec 32)) (currentBit!1748 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!596)

(assert (=> start!2754 (and (bvsle ((_ sign_extend 32) (size!318 (buf!669 thiss!957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1753 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1748 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!318 (buf!669 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1753 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1748 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!7990 () Bool)

(declare-fun inv!12 (BitStream!596) Bool)

(assert (=> start!2754 (and (inv!12 thiss!957) e!7990)))

(declare-fun b!13128 () Bool)

(declare-fun array_inv!307 (array!727) Bool)

(assert (=> b!13128 (= e!7990 (array_inv!307 (buf!669 thiss!957)))))

(assert (= start!2754 b!13128))

(declare-fun m!19783 () Bool)

(assert (=> start!2754 m!19783))

(declare-fun m!19785 () Bool)

(assert (=> b!13128 m!19785))

(push 1)

(assert (not start!2754))

(assert (not b!13128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4192 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4192 (= (inv!12 thiss!957) (invariant!0 (currentBit!1748 thiss!957) (currentByte!1753 thiss!957) (size!318 (buf!669 thiss!957))))))

(declare-fun bs!1182 () Bool)

(assert (= bs!1182 d!4192))

(declare-fun m!19789 () Bool)

(assert (=> bs!1182 m!19789))

(assert (=> start!2754 d!4192))

(declare-fun d!4196 () Bool)

(assert (=> d!4196 (= (array_inv!307 (buf!669 thiss!957)) (bvsge (size!318 (buf!669 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13128 d!4196))

(push 1)

(assert (not d!4192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4202 () Bool)

(assert (=> d!4202 (= (invariant!0 (currentBit!1748 thiss!957) (currentByte!1753 thiss!957) (size!318 (buf!669 thiss!957))) (and (bvsge (currentBit!1748 thiss!957) #b00000000000000000000000000000000) (bvslt (currentBit!1748 thiss!957) #b00000000000000000000000000001000) (bvsge (currentByte!1753 thiss!957) #b00000000000000000000000000000000) (or (bvslt (currentByte!1753 thiss!957) (size!318 (buf!669 thiss!957))) (and (= (currentBit!1748 thiss!957) #b00000000000000000000000000000000) (= (currentByte!1753 thiss!957) (size!318 (buf!669 thiss!957)))))))))

(assert (=> d!4192 d!4202))

(push 1)

(check-sat)

