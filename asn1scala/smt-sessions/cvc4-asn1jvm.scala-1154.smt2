; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32654 () Bool)

(assert start!32654)

(declare-fun res!133790 () Bool)

(declare-fun e!109803 () Bool)

(assert (=> start!32654 (=> (not res!133790) (not e!109803))))

(declare-datatypes ((array!7691 0))(
  ( (array!7692 (arr!4398 (Array (_ BitVec 32) (_ BitVec 8))) (size!3477 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6122 0))(
  ( (BitStream!6123 (buf!3935 array!7691) (currentByte!7217 (_ BitVec 32)) (currentBit!7212 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6122)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32654 (= res!133790 (validate_offset_byte!0 ((_ sign_extend 32) (size!3477 (buf!3935 thiss!1602))) ((_ sign_extend 32) (currentByte!7217 thiss!1602)) ((_ sign_extend 32) (currentBit!7212 thiss!1602))))))

(assert (=> start!32654 e!109803))

(declare-fun e!109802 () Bool)

(declare-fun inv!12 (BitStream!6122) Bool)

(assert (=> start!32654 (and (inv!12 thiss!1602) e!109802)))

(declare-fun b!160355 () Bool)

(declare-fun lt!252957 () (_ BitVec 32))

(assert (=> b!160355 (= e!109803 (or (bvslt lt!252957 #b00000000000000000000000000000000) (bvsge lt!252957 #b00000000000000000000000000001001)))))

(assert (=> b!160355 (= lt!252957 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7212 thiss!1602)))))))))

(declare-fun b!160356 () Bool)

(declare-fun array_inv!3224 (array!7691) Bool)

(assert (=> b!160356 (= e!109802 (array_inv!3224 (buf!3935 thiss!1602)))))

(assert (= (and start!32654 res!133790) b!160355))

(assert (= start!32654 b!160356))

(declare-fun m!253141 () Bool)

(assert (=> start!32654 m!253141))

(declare-fun m!253143 () Bool)

(assert (=> start!32654 m!253143))

(declare-fun m!253145 () Bool)

(assert (=> b!160356 m!253145))

(push 1)

(assert (not start!32654))

(assert (not b!160356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54139 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54139 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3477 (buf!3935 thiss!1602))) ((_ sign_extend 32) (currentByte!7217 thiss!1602)) ((_ sign_extend 32) (currentBit!7212 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3477 (buf!3935 thiss!1602))) ((_ sign_extend 32) (currentByte!7217 thiss!1602)) ((_ sign_extend 32) (currentBit!7212 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13411 () Bool)

(assert (= bs!13411 d!54139))

(declare-fun m!253153 () Bool)

(assert (=> bs!13411 m!253153))

(assert (=> start!32654 d!54139))

(declare-fun d!54141 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54141 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7212 thiss!1602) (currentByte!7217 thiss!1602) (size!3477 (buf!3935 thiss!1602))))))

(declare-fun bs!13413 () Bool)

(assert (= bs!13413 d!54141))

(declare-fun m!253157 () Bool)

(assert (=> bs!13413 m!253157))

(assert (=> start!32654 d!54141))

(declare-fun d!54145 () Bool)

(assert (=> d!54145 (= (array_inv!3224 (buf!3935 thiss!1602)) (bvsge (size!3477 (buf!3935 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160356 d!54145))

(push 1)

(assert (not d!54141))

(assert (not d!54139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54155 () Bool)

(assert (=> d!54155 (= (invariant!0 (currentBit!7212 thiss!1602) (currentByte!7217 thiss!1602) (size!3477 (buf!3935 thiss!1602))) (and (bvsge (currentBit!7212 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7212 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7217 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7217 thiss!1602) (size!3477 (buf!3935 thiss!1602))) (and (= (currentBit!7212 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7217 thiss!1602) (size!3477 (buf!3935 thiss!1602)))))))))

