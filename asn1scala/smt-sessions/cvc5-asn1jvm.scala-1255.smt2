; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35634 () Bool)

(assert start!35634)

(declare-fun res!138497 () Bool)

(declare-fun e!115172 () Bool)

(assert (=> start!35634 (=> (not res!138497) (not e!115172))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35634 (= res!138497 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35634 e!115172))

(assert (=> start!35634 true))

(declare-datatypes ((array!8472 0))(
  ( (array!8473 (arr!4699 (Array (_ BitVec 32) (_ BitVec 8))) (size!3778 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6712 0))(
  ( (BitStream!6713 (buf!4230 array!8472) (currentByte!7943 (_ BitVec 32)) (currentBit!7938 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6712)

(declare-fun e!115173 () Bool)

(declare-fun inv!12 (BitStream!6712) Bool)

(assert (=> start!35634 (and (inv!12 thiss!1577) e!115173)))

(declare-fun b!166303 () Bool)

(declare-fun res!138496 () Bool)

(assert (=> b!166303 (=> (not res!138496) (not e!115172))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166303 (= res!138496 (validate_offset_bits!1 ((_ sign_extend 32) (size!3778 (buf!4230 thiss!1577))) ((_ sign_extend 32) (currentByte!7943 thiss!1577)) ((_ sign_extend 32) (currentBit!7938 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166304 () Bool)

(assert (=> b!166304 (= e!115172 (and (bvsgt (bvadd (currentBit!7938 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7943 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7943 thiss!1577) (size!3778 (buf!4230 thiss!1577))))))))

(declare-fun b!166305 () Bool)

(declare-fun array_inv!3519 (array!8472) Bool)

(assert (=> b!166305 (= e!115173 (array_inv!3519 (buf!4230 thiss!1577)))))

(assert (= (and start!35634 res!138497) b!166303))

(assert (= (and b!166303 res!138496) b!166304))

(assert (= start!35634 b!166305))

(declare-fun m!264247 () Bool)

(assert (=> start!35634 m!264247))

(declare-fun m!264249 () Bool)

(assert (=> b!166303 m!264249))

(declare-fun m!264251 () Bool)

(assert (=> b!166305 m!264251))

(push 1)

(assert (not start!35634))

(assert (not b!166303))

(assert (not b!166305))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57889 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57889 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7938 thiss!1577) (currentByte!7943 thiss!1577) (size!3778 (buf!4230 thiss!1577))))))

(declare-fun bs!14353 () Bool)

(assert (= bs!14353 d!57889))

(declare-fun m!264265 () Bool)

(assert (=> bs!14353 m!264265))

(assert (=> start!35634 d!57889))

(declare-fun d!57893 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57893 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3778 (buf!4230 thiss!1577))) ((_ sign_extend 32) (currentByte!7943 thiss!1577)) ((_ sign_extend 32) (currentBit!7938 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3778 (buf!4230 thiss!1577))) ((_ sign_extend 32) (currentByte!7943 thiss!1577)) ((_ sign_extend 32) (currentBit!7938 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14354 () Bool)

(assert (= bs!14354 d!57893))

(declare-fun m!264267 () Bool)

(assert (=> bs!14354 m!264267))

(assert (=> b!166303 d!57893))

(declare-fun d!57895 () Bool)

(assert (=> d!57895 (= (array_inv!3519 (buf!4230 thiss!1577)) (bvsge (size!3778 (buf!4230 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166305 d!57895))

(push 1)

(assert (not d!57889))

(assert (not d!57893))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57909 () Bool)

(assert (=> d!57909 (= (invariant!0 (currentBit!7938 thiss!1577) (currentByte!7943 thiss!1577) (size!3778 (buf!4230 thiss!1577))) (and (bvsge (currentBit!7938 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7938 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7943 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7943 thiss!1577) (size!3778 (buf!4230 thiss!1577))) (and (= (currentBit!7938 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7943 thiss!1577) (size!3778 (buf!4230 thiss!1577)))))))))

(assert (=> d!57889 d!57909))

(declare-fun d!57913 () Bool)

(assert (=> d!57913 (= (remainingBits!0 ((_ sign_extend 32) (size!3778 (buf!4230 thiss!1577))) ((_ sign_extend 32) (currentByte!7943 thiss!1577)) ((_ sign_extend 32) (currentBit!7938 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3778 (buf!4230 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7943 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7938 thiss!1577)))))))

(assert (=> d!57893 d!57913))

(push 1)

(check-sat)

