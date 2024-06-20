; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46054 () Bool)

(assert start!46054)

(declare-datatypes ((array!10810 0))(
  ( (array!10811 (arr!5677 (Array (_ BitVec 32) (_ BitVec 8))) (size!4747 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8602 0))(
  ( (BitStream!8603 (buf!5294 array!10810) (currentByte!9945 (_ BitVec 32)) (currentBit!9940 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8602)

(assert (=> start!46054 (and (bvsle ((_ sign_extend 32) (size!4747 (buf!5294 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9945 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9940 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4747 (buf!5294 thiss!1933))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9945 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9940 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!151066 () Bool)

(declare-fun inv!12 (BitStream!8602) Bool)

(assert (=> start!46054 (and (inv!12 thiss!1933) e!151066)))

(declare-fun b!222429 () Bool)

(declare-fun array_inv!4488 (array!10810) Bool)

(assert (=> b!222429 (= e!151066 (array_inv!4488 (buf!5294 thiss!1933)))))

(assert (= start!46054 b!222429))

(declare-fun m!340653 () Bool)

(assert (=> start!46054 m!340653))

(declare-fun m!340655 () Bool)

(assert (=> b!222429 m!340655))

(push 1)

(assert (not start!46054))

(assert (not b!222429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75217 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75217 (= (inv!12 thiss!1933) (invariant!0 (currentBit!9940 thiss!1933) (currentByte!9945 thiss!1933) (size!4747 (buf!5294 thiss!1933))))))

(declare-fun bs!18323 () Bool)

(assert (= bs!18323 d!75217))

(declare-fun m!340665 () Bool)

(assert (=> bs!18323 m!340665))

(assert (=> start!46054 d!75217))

(declare-fun d!75219 () Bool)

(assert (=> d!75219 (= (array_inv!4488 (buf!5294 thiss!1933)) (bvsge (size!4747 (buf!5294 thiss!1933)) #b00000000000000000000000000000000))))

(assert (=> b!222429 d!75219))

(push 1)

(assert (not d!75217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75227 () Bool)

(assert (=> d!75227 (= (invariant!0 (currentBit!9940 thiss!1933) (currentByte!9945 thiss!1933) (size!4747 (buf!5294 thiss!1933))) (and (bvsge (currentBit!9940 thiss!1933) #b00000000000000000000000000000000) (bvslt (currentBit!9940 thiss!1933) #b00000000000000000000000000001000) (bvsge (currentByte!9945 thiss!1933) #b00000000000000000000000000000000) (or (bvslt (currentByte!9945 thiss!1933) (size!4747 (buf!5294 thiss!1933))) (and (= (currentBit!9940 thiss!1933) #b00000000000000000000000000000000) (= (currentByte!9945 thiss!1933) (size!4747 (buf!5294 thiss!1933)))))))))

(assert (=> d!75217 d!75227))

(push 1)

(check-sat)

