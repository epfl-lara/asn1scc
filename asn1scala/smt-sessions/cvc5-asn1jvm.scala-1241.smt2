; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35108 () Bool)

(assert start!35108)

(declare-fun res!137533 () Bool)

(declare-fun e!114217 () Bool)

(assert (=> start!35108 (=> (not res!137533) (not e!114217))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35108 (= res!137533 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35108 e!114217))

(assert (=> start!35108 true))

(declare-datatypes ((array!8356 0))(
  ( (array!8357 (arr!4657 (Array (_ BitVec 32) (_ BitVec 8))) (size!3736 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6628 0))(
  ( (BitStream!6629 (buf!4188 array!8356) (currentByte!7817 (_ BitVec 32)) (currentBit!7812 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6628)

(declare-fun e!114218 () Bool)

(declare-fun inv!12 (BitStream!6628) Bool)

(assert (=> start!35108 (and (inv!12 thiss!1577) e!114218)))

(declare-fun b!165109 () Bool)

(declare-fun res!137534 () Bool)

(assert (=> b!165109 (=> (not res!137534) (not e!114217))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165109 (= res!137534 (validate_offset_bits!1 ((_ sign_extend 32) (size!3736 (buf!4188 thiss!1577))) ((_ sign_extend 32) (currentByte!7817 thiss!1577)) ((_ sign_extend 32) (currentBit!7812 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165110 () Bool)

(assert (=> b!165110 (= e!114217 (and (bvsle (bvadd (currentBit!7812 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7817 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7817 thiss!1577) (size!3736 (buf!4188 thiss!1577))))))))

(declare-fun b!165111 () Bool)

(declare-fun array_inv!3477 (array!8356) Bool)

(assert (=> b!165111 (= e!114218 (array_inv!3477 (buf!4188 thiss!1577)))))

(assert (= (and start!35108 res!137533) b!165109))

(assert (= (and b!165109 res!137534) b!165110))

(assert (= start!35108 b!165111))

(declare-fun m!262489 () Bool)

(assert (=> start!35108 m!262489))

(declare-fun m!262491 () Bool)

(assert (=> b!165109 m!262491))

(declare-fun m!262493 () Bool)

(assert (=> b!165111 m!262493))

(push 1)

(assert (not b!165111))

(assert (not b!165109))

(assert (not start!35108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57101 () Bool)

(assert (=> d!57101 (= (array_inv!3477 (buf!4188 thiss!1577)) (bvsge (size!3736 (buf!4188 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165111 d!57101))

(declare-fun d!57103 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57103 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3736 (buf!4188 thiss!1577))) ((_ sign_extend 32) (currentByte!7817 thiss!1577)) ((_ sign_extend 32) (currentBit!7812 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3736 (buf!4188 thiss!1577))) ((_ sign_extend 32) (currentByte!7817 thiss!1577)) ((_ sign_extend 32) (currentBit!7812 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14180 () Bool)

(assert (= bs!14180 d!57103))

(declare-fun m!262511 () Bool)

(assert (=> bs!14180 m!262511))

(assert (=> b!165109 d!57103))

(declare-fun d!57105 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57105 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7812 thiss!1577) (currentByte!7817 thiss!1577) (size!3736 (buf!4188 thiss!1577))))))

(declare-fun bs!14181 () Bool)

(assert (= bs!14181 d!57105))

(declare-fun m!262513 () Bool)

(assert (=> bs!14181 m!262513))

(assert (=> start!35108 d!57105))

(push 1)

(assert (not d!57105))

(assert (not d!57103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57117 () Bool)

(assert (=> d!57117 (= (invariant!0 (currentBit!7812 thiss!1577) (currentByte!7817 thiss!1577) (size!3736 (buf!4188 thiss!1577))) (and (bvsge (currentBit!7812 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7812 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7817 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7817 thiss!1577) (size!3736 (buf!4188 thiss!1577))) (and (= (currentBit!7812 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7817 thiss!1577) (size!3736 (buf!4188 thiss!1577)))))))))

(assert (=> d!57105 d!57117))

(declare-fun d!57119 () Bool)

(assert (=> d!57119 (= (remainingBits!0 ((_ sign_extend 32) (size!3736 (buf!4188 thiss!1577))) ((_ sign_extend 32) (currentByte!7817 thiss!1577)) ((_ sign_extend 32) (currentBit!7812 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3736 (buf!4188 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7817 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7812 thiss!1577)))))))

(assert (=> d!57103 d!57119))

(push 1)

(check-sat)

(pop 1)

