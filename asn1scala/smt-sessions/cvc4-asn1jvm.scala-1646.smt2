; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46058 () Bool)

(assert start!46058)

(declare-datatypes ((array!10814 0))(
  ( (array!10815 (arr!5679 (Array (_ BitVec 32) (_ BitVec 8))) (size!4749 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8606 0))(
  ( (BitStream!8607 (buf!5296 array!10814) (currentByte!9947 (_ BitVec 32)) (currentBit!9942 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8606)

(assert (=> start!46058 (and (bvsle ((_ sign_extend 32) (size!4749 (buf!5296 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9947 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9942 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4749 (buf!5296 thiss!1933))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9947 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9942 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!151078 () Bool)

(declare-fun inv!12 (BitStream!8606) Bool)

(assert (=> start!46058 (and (inv!12 thiss!1933) e!151078)))

(declare-fun b!222435 () Bool)

(declare-fun array_inv!4490 (array!10814) Bool)

(assert (=> b!222435 (= e!151078 (array_inv!4490 (buf!5296 thiss!1933)))))

(assert (= start!46058 b!222435))

(declare-fun m!340661 () Bool)

(assert (=> start!46058 m!340661))

(declare-fun m!340663 () Bool)

(assert (=> b!222435 m!340663))

(push 1)

(assert (not b!222435))

(assert (not start!46058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75223 () Bool)

(assert (=> d!75223 (= (array_inv!4490 (buf!5296 thiss!1933)) (bvsge (size!4749 (buf!5296 thiss!1933)) #b00000000000000000000000000000000))))

(assert (=> b!222435 d!75223))

(declare-fun d!75225 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75225 (= (inv!12 thiss!1933) (invariant!0 (currentBit!9942 thiss!1933) (currentByte!9947 thiss!1933) (size!4749 (buf!5296 thiss!1933))))))

(declare-fun bs!18325 () Bool)

(assert (= bs!18325 d!75225))

(declare-fun m!340669 () Bool)

(assert (=> bs!18325 m!340669))

(assert (=> start!46058 d!75225))

(push 1)

(assert (not d!75225))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75231 () Bool)

(assert (=> d!75231 (= (invariant!0 (currentBit!9942 thiss!1933) (currentByte!9947 thiss!1933) (size!4749 (buf!5296 thiss!1933))) (and (bvsge (currentBit!9942 thiss!1933) #b00000000000000000000000000000000) (bvslt (currentBit!9942 thiss!1933) #b00000000000000000000000000001000) (bvsge (currentByte!9947 thiss!1933) #b00000000000000000000000000000000) (or (bvslt (currentByte!9947 thiss!1933) (size!4749 (buf!5296 thiss!1933))) (and (= (currentBit!9942 thiss!1933) #b00000000000000000000000000000000) (= (currentByte!9947 thiss!1933) (size!4749 (buf!5296 thiss!1933)))))))))

