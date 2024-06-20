; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2774 () Bool)

(assert start!2774)

(declare-fun res!12466 () Bool)

(declare-fun e!7998 () Bool)

(assert (=> start!2774 (=> (not res!12466) (not e!7998))))

(declare-datatypes ((array!732 0))(
  ( (array!733 (arr!748 (Array (_ BitVec 32) (_ BitVec 8))) (size!319 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!598 0))(
  ( (BitStream!599 (buf!670 array!732) (currentByte!1757 (_ BitVec 32)) (currentBit!1752 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!598)

(assert (=> start!2774 (= res!12466 (and (bvsle ((_ sign_extend 32) (size!319 (buf!670 thiss!957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1757 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1752 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!319 (buf!670 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1757 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1752 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!2774 e!7998))

(declare-fun e!7999 () Bool)

(declare-fun inv!12 (BitStream!598) Bool)

(assert (=> start!2774 (and (inv!12 thiss!957) e!7999)))

(declare-fun b!13133 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13133 (= e!7998 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1752 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1757 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (size!319 (buf!670 thiss!957)))))))))

(declare-fun b!13134 () Bool)

(declare-fun array_inv!308 (array!732) Bool)

(assert (=> b!13134 (= e!7999 (array_inv!308 (buf!670 thiss!957)))))

(assert (= (and start!2774 res!12466) b!13133))

(assert (= start!2774 b!13134))

(declare-fun m!19793 () Bool)

(assert (=> start!2774 m!19793))

(declare-fun m!19795 () Bool)

(assert (=> b!13133 m!19795))

(declare-fun m!19797 () Bool)

(assert (=> b!13134 m!19797))

(push 1)

(assert (not b!13133))

(assert (not start!2774))

(assert (not b!13134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4208 () Bool)

(assert (=> d!4208 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1752 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1757 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (size!319 (buf!670 thiss!957))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1752 thiss!957))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1752 thiss!957))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1757 thiss!957))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1757 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (size!319 (buf!670 thiss!957))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1752 thiss!957))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1757 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (size!319 (buf!670 thiss!957)))))))))))

(assert (=> b!13133 d!4208))

(declare-fun d!4214 () Bool)

(assert (=> d!4214 (= (inv!12 thiss!957) (invariant!0 (currentBit!1752 thiss!957) (currentByte!1757 thiss!957) (size!319 (buf!670 thiss!957))))))

(declare-fun bs!1187 () Bool)

(assert (= bs!1187 d!4214))

(declare-fun m!19811 () Bool)

(assert (=> bs!1187 m!19811))

(assert (=> start!2774 d!4214))

(declare-fun d!4218 () Bool)

(assert (=> d!4218 (= (array_inv!308 (buf!670 thiss!957)) (bvsge (size!319 (buf!670 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13134 d!4218))

(push 1)

(assert (not d!4214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

