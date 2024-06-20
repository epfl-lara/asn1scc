; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35146 () Bool)

(assert start!35146)

(declare-fun res!137557 () Bool)

(declare-fun e!114255 () Bool)

(assert (=> start!35146 (=> (not res!137557) (not e!114255))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35146 (= res!137557 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35146 e!114255))

(assert (=> start!35146 true))

(declare-datatypes ((array!8367 0))(
  ( (array!8368 (arr!4661 (Array (_ BitVec 32) (_ BitVec 8))) (size!3740 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6636 0))(
  ( (BitStream!6637 (buf!4192 array!8367) (currentByte!7830 (_ BitVec 32)) (currentBit!7825 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6636)

(declare-fun e!114254 () Bool)

(declare-fun inv!12 (BitStream!6636) Bool)

(assert (=> start!35146 (and (inv!12 thiss!1577) e!114254)))

(declare-fun b!165145 () Bool)

(declare-fun res!137558 () Bool)

(assert (=> b!165145 (=> (not res!137558) (not e!114255))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165145 (= res!137558 (validate_offset_bits!1 ((_ sign_extend 32) (size!3740 (buf!4192 thiss!1577))) ((_ sign_extend 32) (currentByte!7830 thiss!1577)) ((_ sign_extend 32) (currentBit!7825 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165146 () Bool)

(assert (=> b!165146 (= e!114255 (and (bvsle (bvadd (currentBit!7825 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7825 thiss!1577) nBits!511)) #b00000000000000000000000000100000)))))

(declare-fun b!165147 () Bool)

(declare-fun array_inv!3481 (array!8367) Bool)

(assert (=> b!165147 (= e!114254 (array_inv!3481 (buf!4192 thiss!1577)))))

(assert (= (and start!35146 res!137557) b!165145))

(assert (= (and b!165145 res!137558) b!165146))

(assert (= start!35146 b!165147))

(declare-fun m!262525 () Bool)

(assert (=> start!35146 m!262525))

(declare-fun m!262527 () Bool)

(assert (=> b!165145 m!262527))

(declare-fun m!262529 () Bool)

(assert (=> b!165147 m!262529))

(check-sat (not b!165145) (not start!35146) (not b!165147))
(check-sat)
(get-model)

(declare-fun d!57127 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57127 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3740 (buf!4192 thiss!1577))) ((_ sign_extend 32) (currentByte!7830 thiss!1577)) ((_ sign_extend 32) (currentBit!7825 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3740 (buf!4192 thiss!1577))) ((_ sign_extend 32) (currentByte!7830 thiss!1577)) ((_ sign_extend 32) (currentBit!7825 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14187 () Bool)

(assert (= bs!14187 d!57127))

(declare-fun m!262537 () Bool)

(assert (=> bs!14187 m!262537))

(assert (=> b!165145 d!57127))

(declare-fun d!57129 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57129 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7825 thiss!1577) (currentByte!7830 thiss!1577) (size!3740 (buf!4192 thiss!1577))))))

(declare-fun bs!14188 () Bool)

(assert (= bs!14188 d!57129))

(declare-fun m!262539 () Bool)

(assert (=> bs!14188 m!262539))

(assert (=> start!35146 d!57129))

(declare-fun d!57131 () Bool)

(assert (=> d!57131 (= (array_inv!3481 (buf!4192 thiss!1577)) (bvsge (size!3740 (buf!4192 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165147 d!57131))

(check-sat (not d!57129) (not d!57127))
(check-sat)
(get-model)

(declare-fun d!57141 () Bool)

(assert (=> d!57141 (= (invariant!0 (currentBit!7825 thiss!1577) (currentByte!7830 thiss!1577) (size!3740 (buf!4192 thiss!1577))) (and (bvsge (currentBit!7825 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7825 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7830 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7830 thiss!1577) (size!3740 (buf!4192 thiss!1577))) (and (= (currentBit!7825 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7830 thiss!1577) (size!3740 (buf!4192 thiss!1577)))))))))

(assert (=> d!57129 d!57141))

(declare-fun d!57147 () Bool)

(assert (=> d!57147 (= (remainingBits!0 ((_ sign_extend 32) (size!3740 (buf!4192 thiss!1577))) ((_ sign_extend 32) (currentByte!7830 thiss!1577)) ((_ sign_extend 32) (currentBit!7825 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3740 (buf!4192 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7830 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7825 thiss!1577)))))))

(assert (=> d!57127 d!57147))

(check-sat)
