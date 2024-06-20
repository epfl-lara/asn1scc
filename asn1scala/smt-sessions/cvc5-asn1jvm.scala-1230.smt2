; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34948 () Bool)

(assert start!34948)

(declare-fun res!137327 () Bool)

(declare-fun e!113921 () Bool)

(assert (=> start!34948 (=> (not res!137327) (not e!113921))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34948 (= res!137327 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34948 e!113921))

(assert (=> start!34948 true))

(declare-datatypes ((array!8280 0))(
  ( (array!8281 (arr!4624 (Array (_ BitVec 32) (_ BitVec 8))) (size!3703 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6562 0))(
  ( (BitStream!6563 (buf!4155 array!8280) (currentByte!7757 (_ BitVec 32)) (currentBit!7752 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6562)

(declare-fun e!113922 () Bool)

(declare-fun inv!12 (BitStream!6562) Bool)

(assert (=> start!34948 (and (inv!12 thiss!1577) e!113922)))

(declare-fun b!164803 () Bool)

(declare-fun res!137326 () Bool)

(assert (=> b!164803 (=> (not res!137326) (not e!113921))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164803 (= res!137326 (validate_offset_bits!1 ((_ sign_extend 32) (size!3703 (buf!4155 thiss!1577))) ((_ sign_extend 32) (currentByte!7757 thiss!1577)) ((_ sign_extend 32) (currentBit!7752 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164804 () Bool)

(assert (=> b!164804 (= e!113921 (or (bvslt (bvsub #b00000000000000000000000000001000 (currentBit!7752 thiss!1577)) #b00000000000000000000000000000000) (bvsge (bvsub #b00000000000000000000000000001000 (currentBit!7752 thiss!1577)) #b00000000000000000000000000001001)))))

(declare-fun b!164805 () Bool)

(declare-fun array_inv!3444 (array!8280) Bool)

(assert (=> b!164805 (= e!113922 (array_inv!3444 (buf!4155 thiss!1577)))))

(assert (= (and start!34948 res!137327) b!164803))

(assert (= (and b!164803 res!137326) b!164804))

(assert (= start!34948 b!164805))

(declare-fun m!262165 () Bool)

(assert (=> start!34948 m!262165))

(declare-fun m!262167 () Bool)

(assert (=> b!164803 m!262167))

(declare-fun m!262169 () Bool)

(assert (=> b!164805 m!262169))

(push 1)

(assert (not b!164803))

(assert (not start!34948))

(assert (not b!164805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56983 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56983 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3703 (buf!4155 thiss!1577))) ((_ sign_extend 32) (currentByte!7757 thiss!1577)) ((_ sign_extend 32) (currentBit!7752 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3703 (buf!4155 thiss!1577))) ((_ sign_extend 32) (currentByte!7757 thiss!1577)) ((_ sign_extend 32) (currentBit!7752 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14126 () Bool)

(assert (= bs!14126 d!56983))

(declare-fun m!262187 () Bool)

(assert (=> bs!14126 m!262187))

(assert (=> b!164803 d!56983))

(declare-fun d!56985 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56985 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7752 thiss!1577) (currentByte!7757 thiss!1577) (size!3703 (buf!4155 thiss!1577))))))

(declare-fun bs!14127 () Bool)

(assert (= bs!14127 d!56985))

(declare-fun m!262189 () Bool)

(assert (=> bs!14127 m!262189))

(assert (=> start!34948 d!56985))

(declare-fun d!56987 () Bool)

(assert (=> d!56987 (= (array_inv!3444 (buf!4155 thiss!1577)) (bvsge (size!3703 (buf!4155 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164805 d!56987))

(push 1)

(assert (not d!56983))

(assert (not d!56985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56999 () Bool)

(assert (=> d!56999 (= (remainingBits!0 ((_ sign_extend 32) (size!3703 (buf!4155 thiss!1577))) ((_ sign_extend 32) (currentByte!7757 thiss!1577)) ((_ sign_extend 32) (currentBit!7752 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3703 (buf!4155 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7757 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7752 thiss!1577)))))))

(assert (=> d!56983 d!56999))

(declare-fun d!57001 () Bool)

(assert (=> d!57001 (= (invariant!0 (currentBit!7752 thiss!1577) (currentByte!7757 thiss!1577) (size!3703 (buf!4155 thiss!1577))) (and (bvsge (currentBit!7752 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7752 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7757 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7757 thiss!1577) (size!3703 (buf!4155 thiss!1577))) (and (= (currentBit!7752 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7757 thiss!1577) (size!3703 (buf!4155 thiss!1577)))))))))

(assert (=> d!56985 d!57001))

(push 1)

(check-sat)

