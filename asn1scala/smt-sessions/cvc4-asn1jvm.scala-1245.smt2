; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35256 () Bool)

(assert start!35256)

(declare-fun res!137618 () Bool)

(declare-fun e!114343 () Bool)

(assert (=> start!35256 (=> (not res!137618) (not e!114343))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35256 (= res!137618 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35256 e!114343))

(assert (=> start!35256 true))

(declare-datatypes ((array!8396 0))(
  ( (array!8397 (arr!4671 (Array (_ BitVec 32) (_ BitVec 8))) (size!3750 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6656 0))(
  ( (BitStream!6657 (buf!4202 array!8396) (currentByte!7867 (_ BitVec 32)) (currentBit!7862 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6656)

(declare-fun e!114344 () Bool)

(declare-fun inv!12 (BitStream!6656) Bool)

(assert (=> start!35256 (and (inv!12 thiss!1577) e!114344)))

(declare-fun b!165235 () Bool)

(declare-fun res!137617 () Bool)

(assert (=> b!165235 (=> (not res!137617) (not e!114343))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165235 (= res!137617 (validate_offset_bits!1 ((_ sign_extend 32) (size!3750 (buf!4202 thiss!1577))) ((_ sign_extend 32) (currentByte!7867 thiss!1577)) ((_ sign_extend 32) (currentBit!7862 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165236 () Bool)

(assert (=> b!165236 (= e!114343 (and (bvsle (bvadd (currentBit!7862 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvsgt #b00000000000000000000000000000000 (currentByte!7867 thiss!1577)) (bvsge (currentByte!7867 thiss!1577) (size!3750 (buf!4202 thiss!1577))))))))

(declare-fun b!165237 () Bool)

(declare-fun array_inv!3491 (array!8396) Bool)

(assert (=> b!165237 (= e!114344 (array_inv!3491 (buf!4202 thiss!1577)))))

(assert (= (and start!35256 res!137618) b!165235))

(assert (= (and b!165235 res!137617) b!165236))

(assert (= start!35256 b!165237))

(declare-fun m!262621 () Bool)

(assert (=> start!35256 m!262621))

(declare-fun m!262623 () Bool)

(assert (=> b!165235 m!262623))

(declare-fun m!262625 () Bool)

(assert (=> b!165237 m!262625))

(push 1)

(assert (not b!165237))

(assert (not b!165235))

(assert (not start!35256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57235 () Bool)

(assert (=> d!57235 (= (array_inv!3491 (buf!4202 thiss!1577)) (bvsge (size!3750 (buf!4202 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165237 d!57235))

(declare-fun d!57237 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57237 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3750 (buf!4202 thiss!1577))) ((_ sign_extend 32) (currentByte!7867 thiss!1577)) ((_ sign_extend 32) (currentBit!7862 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3750 (buf!4202 thiss!1577))) ((_ sign_extend 32) (currentByte!7867 thiss!1577)) ((_ sign_extend 32) (currentBit!7862 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14218 () Bool)

(assert (= bs!14218 d!57237))

(declare-fun m!262635 () Bool)

(assert (=> bs!14218 m!262635))

(assert (=> b!165235 d!57237))

(declare-fun d!57239 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57239 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7862 thiss!1577) (currentByte!7867 thiss!1577) (size!3750 (buf!4202 thiss!1577))))))

(declare-fun bs!14219 () Bool)

(assert (= bs!14219 d!57239))

(declare-fun m!262637 () Bool)

(assert (=> bs!14219 m!262637))

(assert (=> start!35256 d!57239))

(push 1)

(assert (not d!57239))

(assert (not d!57237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57249 () Bool)

(assert (=> d!57249 (= (invariant!0 (currentBit!7862 thiss!1577) (currentByte!7867 thiss!1577) (size!3750 (buf!4202 thiss!1577))) (and (bvsge (currentBit!7862 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7862 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7867 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7867 thiss!1577) (size!3750 (buf!4202 thiss!1577))) (and (= (currentBit!7862 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7867 thiss!1577) (size!3750 (buf!4202 thiss!1577)))))))))

(assert (=> d!57239 d!57249))

(declare-fun d!57251 () Bool)

(assert (=> d!57251 (= (remainingBits!0 ((_ sign_extend 32) (size!3750 (buf!4202 thiss!1577))) ((_ sign_extend 32) (currentByte!7867 thiss!1577)) ((_ sign_extend 32) (currentBit!7862 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3750 (buf!4202 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7867 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7862 thiss!1577)))))))

(assert (=> d!57237 d!57251))

(push 1)

(check-sat)

(pop 1)

