; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2750 () Bool)

(assert start!2750)

(declare-datatypes ((array!723 0))(
  ( (array!724 (arr!745 (Array (_ BitVec 32) (_ BitVec 8))) (size!316 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!592 0))(
  ( (BitStream!593 (buf!667 array!723) (currentByte!1751 (_ BitVec 32)) (currentBit!1746 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!592)

(assert (=> start!2750 (and (bvsle ((_ sign_extend 32) (size!316 (buf!667 thiss!957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1751 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1746 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!316 (buf!667 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1751 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1746 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!7978 () Bool)

(declare-fun inv!12 (BitStream!592) Bool)

(assert (=> start!2750 (and (inv!12 thiss!957) e!7978)))

(declare-fun b!13122 () Bool)

(declare-fun array_inv!305 (array!723) Bool)

(assert (=> b!13122 (= e!7978 (array_inv!305 (buf!667 thiss!957)))))

(assert (= start!2750 b!13122))

(declare-fun m!19775 () Bool)

(assert (=> start!2750 m!19775))

(declare-fun m!19777 () Bool)

(assert (=> b!13122 m!19777))

(push 1)

(assert (not b!13122))

(assert (not start!2750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4188 () Bool)

(assert (=> d!4188 (= (array_inv!305 (buf!667 thiss!957)) (bvsge (size!316 (buf!667 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13122 d!4188))

(declare-fun d!4190 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4190 (= (inv!12 thiss!957) (invariant!0 (currentBit!1746 thiss!957) (currentByte!1751 thiss!957) (size!316 (buf!667 thiss!957))))))

(declare-fun bs!1181 () Bool)

(assert (= bs!1181 d!4190))

(declare-fun m!19787 () Bool)

(assert (=> bs!1181 m!19787))

(assert (=> start!2750 d!4190))

(push 1)

(assert (not d!4190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4200 () Bool)

(assert (=> d!4200 (= (invariant!0 (currentBit!1746 thiss!957) (currentByte!1751 thiss!957) (size!316 (buf!667 thiss!957))) (and (bvsge (currentBit!1746 thiss!957) #b00000000000000000000000000000000) (bvslt (currentBit!1746 thiss!957) #b00000000000000000000000000001000) (bvsge (currentByte!1751 thiss!957) #b00000000000000000000000000000000) (or (bvslt (currentByte!1751 thiss!957) (size!316 (buf!667 thiss!957))) (and (= (currentBit!1746 thiss!957) #b00000000000000000000000000000000) (= (currentByte!1751 thiss!957) (size!316 (buf!667 thiss!957)))))))))

(assert (=> d!4190 d!4200))

(push 1)

(check-sat)

(pop 1)

