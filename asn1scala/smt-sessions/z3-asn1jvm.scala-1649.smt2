; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46108 () Bool)

(assert start!46108)

(declare-datatypes ((array!10836 0))(
  ( (array!10837 (arr!5687 (Array (_ BitVec 32) (_ BitVec 8))) (size!4757 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8622 0))(
  ( (BitStream!8623 (buf!5304 array!10836) (currentByte!9961 (_ BitVec 32)) (currentBit!9956 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8622)

(assert (=> start!46108 (and (not (= #b00000000000000000000000000000000 (bvand (currentBit!9956 thiss!1933) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (currentBit!9956 thiss!1933)) #b10000000000000000000000000000000))))))

(declare-fun e!151144 () Bool)

(declare-fun inv!12 (BitStream!8622) Bool)

(assert (=> start!46108 (and (inv!12 thiss!1933) e!151144)))

(declare-fun b!222486 () Bool)

(declare-fun array_inv!4498 (array!10836) Bool)

(assert (=> b!222486 (= e!151144 (array_inv!4498 (buf!5304 thiss!1933)))))

(assert (= start!46108 b!222486))

(declare-fun m!340715 () Bool)

(assert (=> start!46108 m!340715))

(declare-fun m!340717 () Bool)

(assert (=> b!222486 m!340717))

(check-sat (not b!222486) (not start!46108))
(check-sat)
(get-model)

(declare-fun d!75255 () Bool)

(assert (=> d!75255 (= (array_inv!4498 (buf!5304 thiss!1933)) (bvsge (size!4757 (buf!5304 thiss!1933)) #b00000000000000000000000000000000))))

(assert (=> b!222486 d!75255))

(declare-fun d!75257 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75257 (= (inv!12 thiss!1933) (invariant!0 (currentBit!9956 thiss!1933) (currentByte!9961 thiss!1933) (size!4757 (buf!5304 thiss!1933))))))

(declare-fun bs!18337 () Bool)

(assert (= bs!18337 d!75257))

(declare-fun m!340723 () Bool)

(assert (=> bs!18337 m!340723))

(assert (=> start!46108 d!75257))

(check-sat (not d!75257))
(check-sat)
(get-model)

(declare-fun d!75263 () Bool)

(assert (=> d!75263 (= (invariant!0 (currentBit!9956 thiss!1933) (currentByte!9961 thiss!1933) (size!4757 (buf!5304 thiss!1933))) (and (bvsge (currentBit!9956 thiss!1933) #b00000000000000000000000000000000) (bvslt (currentBit!9956 thiss!1933) #b00000000000000000000000000001000) (bvsge (currentByte!9961 thiss!1933) #b00000000000000000000000000000000) (or (bvslt (currentByte!9961 thiss!1933) (size!4757 (buf!5304 thiss!1933))) (and (= (currentBit!9956 thiss!1933) #b00000000000000000000000000000000) (= (currentByte!9961 thiss!1933) (size!4757 (buf!5304 thiss!1933)))))))))

(assert (=> d!75257 d!75263))

(check-sat)
