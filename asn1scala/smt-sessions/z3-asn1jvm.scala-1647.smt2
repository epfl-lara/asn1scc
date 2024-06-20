; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46080 () Bool)

(assert start!46080)

(declare-fun res!186813 () Bool)

(declare-fun e!151095 () Bool)

(assert (=> start!46080 (=> (not res!186813) (not e!151095))))

(declare-datatypes ((array!10821 0))(
  ( (array!10822 (arr!5681 (Array (_ BitVec 32) (_ BitVec 8))) (size!4751 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8610 0))(
  ( (BitStream!8611 (buf!5298 array!10821) (currentByte!9952 (_ BitVec 32)) (currentBit!9947 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8610)

(assert (=> start!46080 (= res!186813 (and (bvsle ((_ sign_extend 32) (size!4751 (buf!5298 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9952 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9947 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4751 (buf!5298 thiss!1933))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9952 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9947 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46080 e!151095))

(declare-fun e!151096 () Bool)

(declare-fun inv!12 (BitStream!8610) Bool)

(assert (=> start!46080 (and (inv!12 thiss!1933) e!151096)))

(declare-fun b!222446 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222446 (= e!151095 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9947 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9952 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4751 (buf!5298 thiss!1933)))))))))

(declare-fun b!222447 () Bool)

(declare-fun array_inv!4492 (array!10821) Bool)

(assert (=> b!222447 (= e!151096 (array_inv!4492 (buf!5298 thiss!1933)))))

(assert (= (and start!46080 res!186813) b!222446))

(assert (= start!46080 b!222447))

(declare-fun m!340677 () Bool)

(assert (=> start!46080 m!340677))

(declare-fun m!340679 () Bool)

(assert (=> b!222446 m!340679))

(declare-fun m!340681 () Bool)

(assert (=> b!222447 m!340681))

(check-sat (not start!46080) (not b!222446) (not b!222447))
(check-sat)
(get-model)

(declare-fun d!75235 () Bool)

(assert (=> d!75235 (= (inv!12 thiss!1933) (invariant!0 (currentBit!9947 thiss!1933) (currentByte!9952 thiss!1933) (size!4751 (buf!5298 thiss!1933))))))

(declare-fun bs!18329 () Bool)

(assert (= bs!18329 d!75235))

(declare-fun m!340689 () Bool)

(assert (=> bs!18329 m!340689))

(assert (=> start!46080 d!75235))

(declare-fun d!75237 () Bool)

(assert (=> d!75237 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9947 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9952 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4751 (buf!5298 thiss!1933))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9947 thiss!1933))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9947 thiss!1933))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9952 thiss!1933))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9952 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4751 (buf!5298 thiss!1933))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9947 thiss!1933))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9952 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4751 (buf!5298 thiss!1933)))))))))))

(assert (=> b!222446 d!75237))

(declare-fun d!75241 () Bool)

(assert (=> d!75241 (= (array_inv!4492 (buf!5298 thiss!1933)) (bvsge (size!4751 (buf!5298 thiss!1933)) #b00000000000000000000000000000000))))

(assert (=> b!222447 d!75241))

(check-sat (not d!75235))
(check-sat)
