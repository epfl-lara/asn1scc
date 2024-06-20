; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35144 () Bool)

(assert start!35144)

(declare-fun res!137551 () Bool)

(declare-fun e!114245 () Bool)

(assert (=> start!35144 (=> (not res!137551) (not e!114245))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35144 (= res!137551 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35144 e!114245))

(assert (=> start!35144 true))

(declare-datatypes ((array!8365 0))(
  ( (array!8366 (arr!4660 (Array (_ BitVec 32) (_ BitVec 8))) (size!3739 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6634 0))(
  ( (BitStream!6635 (buf!4191 array!8365) (currentByte!7829 (_ BitVec 32)) (currentBit!7824 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6634)

(declare-fun e!114244 () Bool)

(declare-fun inv!12 (BitStream!6634) Bool)

(assert (=> start!35144 (and (inv!12 thiss!1577) e!114244)))

(declare-fun b!165136 () Bool)

(declare-fun res!137552 () Bool)

(assert (=> b!165136 (=> (not res!137552) (not e!114245))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165136 (= res!137552 (validate_offset_bits!1 ((_ sign_extend 32) (size!3739 (buf!4191 thiss!1577))) ((_ sign_extend 32) (currentByte!7829 thiss!1577)) ((_ sign_extend 32) (currentBit!7824 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165137 () Bool)

(assert (=> b!165137 (= e!114245 (and (bvsle (bvadd (currentBit!7824 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7824 thiss!1577) nBits!511)) #b00000000000000000000000000100000)))))

(declare-fun b!165138 () Bool)

(declare-fun array_inv!3480 (array!8365) Bool)

(assert (=> b!165138 (= e!114244 (array_inv!3480 (buf!4191 thiss!1577)))))

(assert (= (and start!35144 res!137551) b!165136))

(assert (= (and b!165136 res!137552) b!165137))

(assert (= start!35144 b!165138))

(declare-fun m!262519 () Bool)

(assert (=> start!35144 m!262519))

(declare-fun m!262521 () Bool)

(assert (=> b!165136 m!262521))

(declare-fun m!262523 () Bool)

(assert (=> b!165138 m!262523))

(push 1)

(assert (not start!35144))

(assert (not b!165136))

(assert (not b!165138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57133 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57133 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7824 thiss!1577) (currentByte!7829 thiss!1577) (size!3739 (buf!4191 thiss!1577))))))

(declare-fun bs!14189 () Bool)

(assert (= bs!14189 d!57133))

(declare-fun m!262541 () Bool)

(assert (=> bs!14189 m!262541))

(assert (=> start!35144 d!57133))

(declare-fun d!57135 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57135 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3739 (buf!4191 thiss!1577))) ((_ sign_extend 32) (currentByte!7829 thiss!1577)) ((_ sign_extend 32) (currentBit!7824 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3739 (buf!4191 thiss!1577))) ((_ sign_extend 32) (currentByte!7829 thiss!1577)) ((_ sign_extend 32) (currentBit!7824 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14190 () Bool)

(assert (= bs!14190 d!57135))

(declare-fun m!262543 () Bool)

(assert (=> bs!14190 m!262543))

(assert (=> b!165136 d!57135))

(declare-fun d!57137 () Bool)

(assert (=> d!57137 (= (array_inv!3480 (buf!4191 thiss!1577)) (bvsge (size!3739 (buf!4191 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165138 d!57137))

(push 1)

(assert (not d!57135))

(assert (not d!57133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57149 () Bool)

(assert (=> d!57149 (= (remainingBits!0 ((_ sign_extend 32) (size!3739 (buf!4191 thiss!1577))) ((_ sign_extend 32) (currentByte!7829 thiss!1577)) ((_ sign_extend 32) (currentBit!7824 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3739 (buf!4191 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7829 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7824 thiss!1577)))))))

(assert (=> d!57135 d!57149))

(declare-fun d!57151 () Bool)

(assert (=> d!57151 (= (invariant!0 (currentBit!7824 thiss!1577) (currentByte!7829 thiss!1577) (size!3739 (buf!4191 thiss!1577))) (and (bvsge (currentBit!7824 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7824 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7829 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7829 thiss!1577) (size!3739 (buf!4191 thiss!1577))) (and (= (currentBit!7824 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7829 thiss!1577) (size!3739 (buf!4191 thiss!1577)))))))))

(assert (=> d!57133 d!57151))

(push 1)

(check-sat)

