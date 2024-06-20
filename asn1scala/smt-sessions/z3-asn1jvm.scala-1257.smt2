; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35708 () Bool)

(assert start!35708)

(declare-fun res!138547 () Bool)

(declare-fun e!115234 () Bool)

(assert (=> start!35708 (=> (not res!138547) (not e!115234))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35708 (= res!138547 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35708 e!115234))

(assert (=> start!35708 true))

(declare-datatypes ((array!8492 0))(
  ( (array!8493 (arr!4706 (Array (_ BitVec 32) (_ BitVec 8))) (size!3785 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6726 0))(
  ( (BitStream!6727 (buf!4237 array!8492) (currentByte!7968 (_ BitVec 32)) (currentBit!7963 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6726)

(declare-fun e!115236 () Bool)

(declare-fun inv!12 (BitStream!6726) Bool)

(assert (=> start!35708 (and (inv!12 thiss!1577) e!115236)))

(declare-fun b!166375 () Bool)

(declare-fun res!138548 () Bool)

(assert (=> b!166375 (=> (not res!138548) (not e!115234))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166375 (= res!138548 (validate_offset_bits!1 ((_ sign_extend 32) (size!3785 (buf!4237 thiss!1577))) ((_ sign_extend 32) (currentByte!7968 thiss!1577)) ((_ sign_extend 32) (currentBit!7963 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166376 () Bool)

(assert (=> b!166376 (= e!115234 (and (bvsgt (bvadd (currentBit!7963 thiss!1577) nBits!511) #b00000000000000000000000000001000) (= (bvand (currentByte!7968 thiss!1577) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!7968 thiss!1577) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!7968 thiss!1577)) #b10000000000000000000000000000000)))))))

(declare-fun b!166377 () Bool)

(declare-fun array_inv!3526 (array!8492) Bool)

(assert (=> b!166377 (= e!115236 (array_inv!3526 (buf!4237 thiss!1577)))))

(assert (= (and start!35708 res!138547) b!166375))

(assert (= (and b!166375 res!138548) b!166376))

(assert (= start!35708 b!166377))

(declare-fun m!264349 () Bool)

(assert (=> start!35708 m!264349))

(declare-fun m!264351 () Bool)

(assert (=> b!166375 m!264351))

(declare-fun m!264353 () Bool)

(assert (=> b!166377 m!264353))

(check-sat (not start!35708) (not b!166375) (not b!166377))
(check-sat)
(get-model)

(declare-fun d!57965 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57965 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7963 thiss!1577) (currentByte!7968 thiss!1577) (size!3785 (buf!4237 thiss!1577))))))

(declare-fun bs!14374 () Bool)

(assert (= bs!14374 d!57965))

(declare-fun m!264361 () Bool)

(assert (=> bs!14374 m!264361))

(assert (=> start!35708 d!57965))

(declare-fun d!57971 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57971 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3785 (buf!4237 thiss!1577))) ((_ sign_extend 32) (currentByte!7968 thiss!1577)) ((_ sign_extend 32) (currentBit!7963 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3785 (buf!4237 thiss!1577))) ((_ sign_extend 32) (currentByte!7968 thiss!1577)) ((_ sign_extend 32) (currentBit!7963 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14379 () Bool)

(assert (= bs!14379 d!57971))

(declare-fun m!264371 () Bool)

(assert (=> bs!14379 m!264371))

(assert (=> b!166375 d!57971))

(declare-fun d!57981 () Bool)

(assert (=> d!57981 (= (array_inv!3526 (buf!4237 thiss!1577)) (bvsge (size!3785 (buf!4237 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166377 d!57981))

(check-sat (not d!57971) (not d!57965))
(check-sat)
(get-model)

(declare-fun d!57983 () Bool)

(assert (=> d!57983 (= (remainingBits!0 ((_ sign_extend 32) (size!3785 (buf!4237 thiss!1577))) ((_ sign_extend 32) (currentByte!7968 thiss!1577)) ((_ sign_extend 32) (currentBit!7963 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3785 (buf!4237 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7968 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7963 thiss!1577)))))))

(assert (=> d!57971 d!57983))

(declare-fun d!57987 () Bool)

(assert (=> d!57987 (= (invariant!0 (currentBit!7963 thiss!1577) (currentByte!7968 thiss!1577) (size!3785 (buf!4237 thiss!1577))) (and (bvsge (currentBit!7963 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7963 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7968 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7968 thiss!1577) (size!3785 (buf!4237 thiss!1577))) (and (= (currentBit!7963 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7968 thiss!1577) (size!3785 (buf!4237 thiss!1577)))))))))

(assert (=> d!57965 d!57987))

(check-sat)
