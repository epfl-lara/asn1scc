; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35964 () Bool)

(assert start!35964)

(declare-fun res!138718 () Bool)

(declare-fun e!115479 () Bool)

(assert (=> start!35964 (=> (not res!138718) (not e!115479))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35964 (= res!138718 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35964 e!115479))

(assert (=> start!35964 true))

(declare-datatypes ((array!8567 0))(
  ( (array!8568 (arr!4733 (Array (_ BitVec 32) (_ BitVec 8))) (size!3812 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6780 0))(
  ( (BitStream!6781 (buf!4264 array!8567) (currentByte!8054 (_ BitVec 32)) (currentBit!8049 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6780)

(declare-fun e!115477 () Bool)

(declare-fun inv!12 (BitStream!6780) Bool)

(assert (=> start!35964 (and (inv!12 thiss!1577) e!115477)))

(declare-fun b!166627 () Bool)

(declare-fun res!138719 () Bool)

(assert (=> b!166627 (=> (not res!138719) (not e!115479))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166627 (= res!138719 (validate_offset_bits!1 ((_ sign_extend 32) (size!3812 (buf!4264 thiss!1577))) ((_ sign_extend 32) (currentByte!8054 thiss!1577)) ((_ sign_extend 32) (currentBit!8049 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166628 () Bool)

(assert (=> b!166628 (= e!115479 (and (bvsgt (bvadd (currentBit!8049 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!8054 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!8054 thiss!1577) (size!3812 (buf!4264 thiss!1577))))))))

(declare-fun b!166629 () Bool)

(declare-fun array_inv!3553 (array!8567) Bool)

(assert (=> b!166629 (= e!115477 (array_inv!3553 (buf!4264 thiss!1577)))))

(assert (= (and start!35964 res!138718) b!166627))

(assert (= (and b!166627 res!138719) b!166628))

(assert (= start!35964 b!166629))

(declare-fun m!264649 () Bool)

(assert (=> start!35964 m!264649))

(declare-fun m!264651 () Bool)

(assert (=> b!166627 m!264651))

(declare-fun m!264653 () Bool)

(assert (=> b!166629 m!264653))

(check-sat (not b!166629) (not b!166627) (not start!35964))
(check-sat)
(get-model)

(declare-fun d!58197 () Bool)

(assert (=> d!58197 (= (array_inv!3553 (buf!4264 thiss!1577)) (bvsge (size!3812 (buf!4264 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166629 d!58197))

(declare-fun d!58199 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58199 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3812 (buf!4264 thiss!1577))) ((_ sign_extend 32) (currentByte!8054 thiss!1577)) ((_ sign_extend 32) (currentBit!8049 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3812 (buf!4264 thiss!1577))) ((_ sign_extend 32) (currentByte!8054 thiss!1577)) ((_ sign_extend 32) (currentBit!8049 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14446 () Bool)

(assert (= bs!14446 d!58199))

(declare-fun m!264661 () Bool)

(assert (=> bs!14446 m!264661))

(assert (=> b!166627 d!58199))

(declare-fun d!58201 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58201 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8049 thiss!1577) (currentByte!8054 thiss!1577) (size!3812 (buf!4264 thiss!1577))))))

(declare-fun bs!14447 () Bool)

(assert (= bs!14447 d!58201))

(declare-fun m!264663 () Bool)

(assert (=> bs!14447 m!264663))

(assert (=> start!35964 d!58201))

(check-sat (not d!58199) (not d!58201))
(check-sat)
(get-model)

(declare-fun d!58211 () Bool)

(assert (=> d!58211 (= (remainingBits!0 ((_ sign_extend 32) (size!3812 (buf!4264 thiss!1577))) ((_ sign_extend 32) (currentByte!8054 thiss!1577)) ((_ sign_extend 32) (currentBit!8049 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3812 (buf!4264 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8054 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8049 thiss!1577)))))))

(assert (=> d!58199 d!58211))

(declare-fun d!58215 () Bool)

(assert (=> d!58215 (= (invariant!0 (currentBit!8049 thiss!1577) (currentByte!8054 thiss!1577) (size!3812 (buf!4264 thiss!1577))) (and (bvsge (currentBit!8049 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8049 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8054 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8054 thiss!1577) (size!3812 (buf!4264 thiss!1577))) (and (= (currentBit!8049 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8054 thiss!1577) (size!3812 (buf!4264 thiss!1577)))))))))

(assert (=> d!58201 d!58215))

(check-sat)
