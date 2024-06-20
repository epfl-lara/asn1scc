; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37004 () Bool)

(assert start!37004)

(declare-fun res!140394 () Bool)

(declare-fun e!117310 () Bool)

(assert (=> start!37004 (=> (not res!140394) (not e!117310))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37004 (= res!140394 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37004 e!117310))

(assert (=> start!37004 true))

(declare-datatypes ((array!8834 0))(
  ( (array!8835 (arr!4835 (Array (_ BitVec 32) (_ BitVec 8))) (size!3914 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6984 0))(
  ( (BitStream!6985 (buf!4366 array!8834) (currentByte!8303 (_ BitVec 32)) (currentBit!8298 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6984)

(declare-fun e!117311 () Bool)

(declare-fun inv!12 (BitStream!6984) Bool)

(assert (=> start!37004 (and (inv!12 thiss!1894) e!117311)))

(declare-fun b!168758 () Bool)

(assert (=> b!168758 (= e!117310 (not (inv!12 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894)))))))

(declare-fun b!168759 () Bool)

(declare-fun array_inv!3655 (array!8834) Bool)

(assert (=> b!168759 (= e!117311 (array_inv!3655 (buf!4366 thiss!1894)))))

(declare-fun b!168757 () Bool)

(declare-fun res!140395 () Bool)

(assert (=> b!168757 (=> (not res!140395) (not e!117310))))

(assert (=> b!168757 (= res!140395 (bvsgt (bvadd (currentBit!8298 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168756 () Bool)

(declare-fun res!140396 () Bool)

(assert (=> b!168756 (=> (not res!140396) (not e!117310))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168756 (= res!140396 (validate_offset_bits!1 ((_ sign_extend 32) (size!3914 (buf!4366 thiss!1894))) ((_ sign_extend 32) (currentByte!8303 thiss!1894)) ((_ sign_extend 32) (currentBit!8298 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and start!37004 res!140394) b!168756))

(assert (= (and b!168756 res!140396) b!168757))

(assert (= (and b!168757 res!140395) b!168758))

(assert (= start!37004 b!168759))

(declare-fun m!268337 () Bool)

(assert (=> start!37004 m!268337))

(declare-fun m!268339 () Bool)

(assert (=> b!168758 m!268339))

(declare-fun m!268341 () Bool)

(assert (=> b!168759 m!268341))

(declare-fun m!268343 () Bool)

(assert (=> b!168756 m!268343))

(check-sat (not b!168758) (not b!168759) (not b!168756) (not start!37004))
(check-sat)
(get-model)

(declare-fun d!59573 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59573 (= (inv!12 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) (invariant!0 (currentBit!8298 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) (currentByte!8303 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) (size!3914 (buf!4366 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))))))))

(declare-fun bs!14766 () Bool)

(assert (= bs!14766 d!59573))

(declare-fun m!268359 () Bool)

(assert (=> bs!14766 m!268359))

(assert (=> b!168758 d!59573))

(declare-fun d!59575 () Bool)

(assert (=> d!59575 (= (array_inv!3655 (buf!4366 thiss!1894)) (bvsge (size!3914 (buf!4366 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168759 d!59575))

(declare-fun d!59579 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59579 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3914 (buf!4366 thiss!1894))) ((_ sign_extend 32) (currentByte!8303 thiss!1894)) ((_ sign_extend 32) (currentBit!8298 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3914 (buf!4366 thiss!1894))) ((_ sign_extend 32) (currentByte!8303 thiss!1894)) ((_ sign_extend 32) (currentBit!8298 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14767 () Bool)

(assert (= bs!14767 d!59579))

(declare-fun m!268361 () Bool)

(assert (=> bs!14767 m!268361))

(assert (=> b!168756 d!59579))

(declare-fun d!59581 () Bool)

(assert (=> d!59581 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8298 thiss!1894) (currentByte!8303 thiss!1894) (size!3914 (buf!4366 thiss!1894))))))

(declare-fun bs!14769 () Bool)

(assert (= bs!14769 d!59581))

(declare-fun m!268365 () Bool)

(assert (=> bs!14769 m!268365))

(assert (=> start!37004 d!59581))

(check-sat (not d!59581) (not d!59579) (not d!59573))
(check-sat)
(get-model)

(declare-fun d!59595 () Bool)

(assert (=> d!59595 (= (invariant!0 (currentBit!8298 thiss!1894) (currentByte!8303 thiss!1894) (size!3914 (buf!4366 thiss!1894))) (and (bvsge (currentBit!8298 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8298 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8303 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8303 thiss!1894) (size!3914 (buf!4366 thiss!1894))) (and (= (currentBit!8298 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8303 thiss!1894) (size!3914 (buf!4366 thiss!1894)))))))))

(assert (=> d!59581 d!59595))

(declare-fun d!59597 () Bool)

(assert (=> d!59597 (= (remainingBits!0 ((_ sign_extend 32) (size!3914 (buf!4366 thiss!1894))) ((_ sign_extend 32) (currentByte!8303 thiss!1894)) ((_ sign_extend 32) (currentBit!8298 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3914 (buf!4366 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8303 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8298 thiss!1894)))))))

(assert (=> d!59579 d!59597))

(declare-fun d!59599 () Bool)

(assert (=> d!59599 (= (invariant!0 (currentBit!8298 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) (currentByte!8303 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) (size!3914 (buf!4366 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))))) (and (bvsge (currentBit!8298 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) #b00000000000000000000000000000000) (bvslt (currentBit!8298 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) #b00000000000000000000000000001000) (bvsge (currentByte!8303 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) #b00000000000000000000000000000000) (or (bvslt (currentByte!8303 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) (size!3914 (buf!4366 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))))) (and (= (currentBit!8298 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) #b00000000000000000000000000000000) (= (currentByte!8303 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894))) (size!3914 (buf!4366 (BitStream!6985 (buf!4366 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8303 thiss!1894)) (currentBit!8298 thiss!1894)))))))))))

(assert (=> d!59573 d!59599))

(check-sat)
