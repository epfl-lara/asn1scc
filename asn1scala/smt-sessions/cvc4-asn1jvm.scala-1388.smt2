; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38350 () Bool)

(assert start!38350)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9241 0))(
  ( (array!9242 (arr!5010 (Array (_ BitVec 32) (_ BitVec 8))) (size!4080 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7268 0))(
  ( (BitStream!7269 (buf!4508 array!9241) (currentByte!8575 (_ BitVec 32)) (currentBit!8570 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7268)

(assert (=> start!38350 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4080 (buf!4508 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8575 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8570 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4080 (buf!4508 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8575 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8570 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38350 true))

(declare-fun e!120402 () Bool)

(declare-fun inv!12 (BitStream!7268) Bool)

(assert (=> start!38350 (and (inv!12 thiss!1187) e!120402)))

(declare-fun b!172320 () Bool)

(declare-fun array_inv!3821 (array!9241) Bool)

(assert (=> b!172320 (= e!120402 (array_inv!3821 (buf!4508 thiss!1187)))))

(assert (= start!38350 b!172320))

(declare-fun m!271459 () Bool)

(assert (=> start!38350 m!271459))

(declare-fun m!271461 () Bool)

(assert (=> b!172320 m!271461))

(push 1)

(assert (not start!38350))

(assert (not b!172320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61083 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61083 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8570 thiss!1187) (currentByte!8575 thiss!1187) (size!4080 (buf!4508 thiss!1187))))))

(declare-fun bs!15194 () Bool)

(assert (= bs!15194 d!61083))

(declare-fun m!271467 () Bool)

(assert (=> bs!15194 m!271467))

(assert (=> start!38350 d!61083))

(declare-fun d!61085 () Bool)

(assert (=> d!61085 (= (array_inv!3821 (buf!4508 thiss!1187)) (bvsge (size!4080 (buf!4508 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!172320 d!61085))

(push 1)

(assert (not d!61083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61091 () Bool)

