; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19358 () Bool)

(assert start!19358)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4506 0))(
  ( (array!4507 (arr!2655 (Array (_ BitVec 32) (_ BitVec 8))) (size!2062 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3598 0))(
  ( (BitStream!3599 (buf!2408 array!4506) (currentByte!4811 (_ BitVec 32)) (currentBit!4806 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3598)

(assert (=> start!19358 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2062 (buf!2408 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4811 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4806 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2062 (buf!2408 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4811 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4806 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19358 true))

(declare-fun e!63437 () Bool)

(declare-fun inv!12 (BitStream!3598) Bool)

(assert (=> start!19358 (and (inv!12 thiss!1288) e!63437)))

(declare-fun b!96828 () Bool)

(declare-fun array_inv!1864 (array!4506) Bool)

(assert (=> b!96828 (= e!63437 (array_inv!1864 (buf!2408 thiss!1288)))))

(assert (= start!19358 b!96828))

(declare-fun m!140473 () Bool)

(assert (=> start!19358 m!140473))

(declare-fun m!140475 () Bool)

(assert (=> b!96828 m!140475))

(push 1)

(assert (not b!96828))

(assert (not start!19358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30380 () Bool)

(assert (=> d!30380 (= (array_inv!1864 (buf!2408 thiss!1288)) (bvsge (size!2062 (buf!2408 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!96828 d!30380))

(declare-fun d!30384 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!30384 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4806 thiss!1288) (currentByte!4811 thiss!1288) (size!2062 (buf!2408 thiss!1288))))))

(declare-fun bs!7422 () Bool)

(assert (= bs!7422 d!30384))

(declare-fun m!140485 () Bool)

(assert (=> bs!7422 m!140485))

(assert (=> start!19358 d!30384))

(push 1)

(assert (not d!30384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30392 () Bool)

(assert (=> d!30392 (= (invariant!0 (currentBit!4806 thiss!1288) (currentByte!4811 thiss!1288) (size!2062 (buf!2408 thiss!1288))) (and (bvsge (currentBit!4806 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4806 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4811 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4811 thiss!1288) (size!2062 (buf!2408 thiss!1288))) (and (= (currentBit!4806 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4811 thiss!1288) (size!2062 (buf!2408 thiss!1288)))))))))

(assert (=> d!30384 d!30392))

(push 1)

(check-sat)

