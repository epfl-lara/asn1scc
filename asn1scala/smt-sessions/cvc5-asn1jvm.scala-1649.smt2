; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46106 () Bool)

(assert start!46106)

(declare-datatypes ((array!10834 0))(
  ( (array!10835 (arr!5686 (Array (_ BitVec 32) (_ BitVec 8))) (size!4756 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8620 0))(
  ( (BitStream!8621 (buf!5303 array!10834) (currentByte!9960 (_ BitVec 32)) (currentBit!9955 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8620)

(assert (=> start!46106 (and (not (= #b00000000000000000000000000000000 (bvand (currentBit!9955 thiss!1933) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (currentBit!9955 thiss!1933)) #b10000000000000000000000000000000))))))

(declare-fun e!151138 () Bool)

(declare-fun inv!12 (BitStream!8620) Bool)

(assert (=> start!46106 (and (inv!12 thiss!1933) e!151138)))

(declare-fun b!222483 () Bool)

(declare-fun array_inv!4497 (array!10834) Bool)

(assert (=> b!222483 (= e!151138 (array_inv!4497 (buf!5303 thiss!1933)))))

(assert (= start!46106 b!222483))

(declare-fun m!340711 () Bool)

(assert (=> start!46106 m!340711))

(declare-fun m!340713 () Bool)

(assert (=> b!222483 m!340713))

(push 1)

(assert (not b!222483))

(assert (not start!46106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75259 () Bool)

(assert (=> d!75259 (= (array_inv!4497 (buf!5303 thiss!1933)) (bvsge (size!4756 (buf!5303 thiss!1933)) #b00000000000000000000000000000000))))

(assert (=> b!222483 d!75259))

(declare-fun d!75261 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75261 (= (inv!12 thiss!1933) (invariant!0 (currentBit!9955 thiss!1933) (currentByte!9960 thiss!1933) (size!4756 (buf!5303 thiss!1933))))))

(declare-fun bs!18338 () Bool)

(assert (= bs!18338 d!75261))

(declare-fun m!340725 () Bool)

(assert (=> bs!18338 m!340725))

(assert (=> start!46106 d!75261))

(push 1)

(assert (not d!75261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75267 () Bool)

(assert (=> d!75267 (= (invariant!0 (currentBit!9955 thiss!1933) (currentByte!9960 thiss!1933) (size!4756 (buf!5303 thiss!1933))) (and (bvsge (currentBit!9955 thiss!1933) #b00000000000000000000000000000000) (bvslt (currentBit!9955 thiss!1933) #b00000000000000000000000000001000) (bvsge (currentByte!9960 thiss!1933) #b00000000000000000000000000000000) (or (bvslt (currentByte!9960 thiss!1933) (size!4756 (buf!5303 thiss!1933))) (and (= (currentBit!9955 thiss!1933) #b00000000000000000000000000000000) (= (currentByte!9960 thiss!1933) (size!4756 (buf!5303 thiss!1933)))))))))

