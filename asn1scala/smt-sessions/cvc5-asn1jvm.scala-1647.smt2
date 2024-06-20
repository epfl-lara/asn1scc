; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46078 () Bool)

(assert start!46078)

(declare-fun res!186810 () Bool)

(declare-fun e!151086 () Bool)

(assert (=> start!46078 (=> (not res!186810) (not e!151086))))

(declare-datatypes ((array!10819 0))(
  ( (array!10820 (arr!5680 (Array (_ BitVec 32) (_ BitVec 8))) (size!4750 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8608 0))(
  ( (BitStream!8609 (buf!5297 array!10819) (currentByte!9951 (_ BitVec 32)) (currentBit!9946 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8608)

(assert (=> start!46078 (= res!186810 (and (bvsle ((_ sign_extend 32) (size!4750 (buf!5297 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9951 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9946 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4750 (buf!5297 thiss!1933))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9951 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9946 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46078 e!151086))

(declare-fun e!151087 () Bool)

(declare-fun inv!12 (BitStream!8608) Bool)

(assert (=> start!46078 (and (inv!12 thiss!1933) e!151087)))

(declare-fun b!222440 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222440 (= e!151086 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9946 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9951 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4750 (buf!5297 thiss!1933)))))))))

(declare-fun b!222441 () Bool)

(declare-fun array_inv!4491 (array!10819) Bool)

(assert (=> b!222441 (= e!151087 (array_inv!4491 (buf!5297 thiss!1933)))))

(assert (= (and start!46078 res!186810) b!222440))

(assert (= start!46078 b!222441))

(declare-fun m!340671 () Bool)

(assert (=> start!46078 m!340671))

(declare-fun m!340673 () Bool)

(assert (=> b!222440 m!340673))

(declare-fun m!340675 () Bool)

(assert (=> b!222441 m!340675))

(push 1)

(assert (not b!222440))

(assert (not b!222441))

(assert (not start!46078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75239 () Bool)

(assert (=> d!75239 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9946 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9951 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4750 (buf!5297 thiss!1933))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9946 thiss!1933))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9946 thiss!1933))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9951 thiss!1933))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9951 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4750 (buf!5297 thiss!1933))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9946 thiss!1933))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9951 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4750 (buf!5297 thiss!1933)))))))))))

(assert (=> b!222440 d!75239))

(declare-fun d!75243 () Bool)

(assert (=> d!75243 (= (array_inv!4491 (buf!5297 thiss!1933)) (bvsge (size!4750 (buf!5297 thiss!1933)) #b00000000000000000000000000000000))))

(assert (=> b!222441 d!75243))

