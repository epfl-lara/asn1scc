; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38130 () Bool)

(assert start!38130)

(declare-fun res!142329 () Bool)

(declare-fun e!119996 () Bool)

(assert (=> start!38130 (=> (not res!142329) (not e!119996))))

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9174 0))(
  ( (array!9175 (arr!4984 (Array (_ BitVec 32) (_ BitVec 8))) (size!4054 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7216 0))(
  ( (BitStream!7217 (buf!4482 array!9174) (currentByte!8516 (_ BitVec 32)) (currentBit!8511 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7216)

(assert (=> start!38130 (= res!142329 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4054 (buf!4482 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8516 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8511 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4054 (buf!4482 thiss!1817))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8516 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8511 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38130 e!119996))

(assert (=> start!38130 true))

(declare-fun e!119997 () Bool)

(declare-fun inv!12 (BitStream!7216) Bool)

(assert (=> start!38130 (and (inv!12 thiss!1817) e!119997)))

(declare-fun b!171743 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!171743 (= e!119996 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8511 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8516 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4054 (buf!4482 thiss!1817)))))))))

(declare-fun b!171744 () Bool)

(declare-fun array_inv!3795 (array!9174) Bool)

(assert (=> b!171744 (= e!119997 (array_inv!3795 (buf!4482 thiss!1817)))))

(assert (= (and start!38130 res!142329) b!171743))

(assert (= start!38130 b!171744))

(declare-fun m!270995 () Bool)

(assert (=> start!38130 m!270995))

(declare-fun m!270997 () Bool)

(assert (=> b!171743 m!270997))

(declare-fun m!270999 () Bool)

(assert (=> b!171744 m!270999))

(push 1)

(assert (not start!38130))

(assert (not b!171744))

(assert (not b!171743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60869 () Bool)

(assert (=> d!60869 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8511 thiss!1817) (currentByte!8516 thiss!1817) (size!4054 (buf!4482 thiss!1817))))))

(declare-fun bs!15138 () Bool)

(assert (= bs!15138 d!60869))

(declare-fun m!271013 () Bool)

(assert (=> bs!15138 m!271013))

(assert (=> start!38130 d!60869))

(declare-fun d!60873 () Bool)

(assert (=> d!60873 (= (array_inv!3795 (buf!4482 thiss!1817)) (bvsge (size!4054 (buf!4482 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!171744 d!60873))

(declare-fun d!60877 () Bool)

(assert (=> d!60877 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8511 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8516 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4054 (buf!4482 thiss!1817))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8511 thiss!1817))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8511 thiss!1817))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8516 thiss!1817))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8516 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4054 (buf!4482 thiss!1817))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8511 thiss!1817))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8516 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4054 (buf!4482 thiss!1817)))))))))))

(assert (=> b!171743 d!60877))

(push 1)

(assert (not d!60869))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

