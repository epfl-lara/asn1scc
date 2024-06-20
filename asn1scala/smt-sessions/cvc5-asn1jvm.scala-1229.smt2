; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34912 () Bool)

(assert start!34912)

(declare-fun res!137308 () Bool)

(declare-fun e!113894 () Bool)

(assert (=> start!34912 (=> (not res!137308) (not e!113894))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34912 (= res!137308 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34912 e!113894))

(assert (=> start!34912 true))

(declare-datatypes ((array!8271 0))(
  ( (array!8272 (arr!4621 (Array (_ BitVec 32) (_ BitVec 8))) (size!3700 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6556 0))(
  ( (BitStream!6557 (buf!4152 array!8271) (currentByte!7745 (_ BitVec 32)) (currentBit!7740 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6556)

(declare-fun e!113895 () Bool)

(declare-fun inv!12 (BitStream!6556) Bool)

(assert (=> start!34912 (and (inv!12 thiss!1577) e!113895)))

(declare-fun b!164776 () Bool)

(declare-fun res!137309 () Bool)

(assert (=> b!164776 (=> (not res!137309) (not e!113894))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164776 (= res!137309 (validate_offset_bits!1 ((_ sign_extend 32) (size!3700 (buf!4152 thiss!1577))) ((_ sign_extend 32) (currentByte!7745 thiss!1577)) ((_ sign_extend 32) (currentBit!7740 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164777 () Bool)

(assert (=> b!164777 (= e!113894 (and (not (= #b00000000000000000000000000000000 (bvand (currentBit!7740 thiss!1577) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (currentBit!7740 thiss!1577)) #b10000000000000000000000000000000)))))))

(declare-fun b!164778 () Bool)

(declare-fun array_inv!3441 (array!8271) Bool)

(assert (=> b!164778 (= e!113895 (array_inv!3441 (buf!4152 thiss!1577)))))

(assert (= (and start!34912 res!137308) b!164776))

(assert (= (and b!164776 res!137309) b!164777))

(assert (= start!34912 b!164778))

(declare-fun m!262135 () Bool)

(assert (=> start!34912 m!262135))

(declare-fun m!262137 () Bool)

(assert (=> b!164776 m!262137))

(declare-fun m!262139 () Bool)

(assert (=> b!164778 m!262139))

(push 1)

(assert (not start!34912))

(assert (not b!164778))

(assert (not b!164776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56951 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56951 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7740 thiss!1577) (currentByte!7745 thiss!1577) (size!3700 (buf!4152 thiss!1577))))))

(declare-fun bs!14117 () Bool)

(assert (= bs!14117 d!56951))

(declare-fun m!262157 () Bool)

(assert (=> bs!14117 m!262157))

(assert (=> start!34912 d!56951))

(declare-fun d!56955 () Bool)

(assert (=> d!56955 (= (array_inv!3441 (buf!4152 thiss!1577)) (bvsge (size!3700 (buf!4152 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164778 d!56955))

(declare-fun d!56957 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56957 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3700 (buf!4152 thiss!1577))) ((_ sign_extend 32) (currentByte!7745 thiss!1577)) ((_ sign_extend 32) (currentBit!7740 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3700 (buf!4152 thiss!1577))) ((_ sign_extend 32) (currentByte!7745 thiss!1577)) ((_ sign_extend 32) (currentBit!7740 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14119 () Bool)

(assert (= bs!14119 d!56957))

(declare-fun m!262161 () Bool)

(assert (=> bs!14119 m!262161))

(assert (=> b!164776 d!56957))

(push 1)

(assert (not d!56957))

(assert (not d!56951))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56967 () Bool)

(assert (=> d!56967 (= (remainingBits!0 ((_ sign_extend 32) (size!3700 (buf!4152 thiss!1577))) ((_ sign_extend 32) (currentByte!7745 thiss!1577)) ((_ sign_extend 32) (currentBit!7740 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3700 (buf!4152 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7745 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7740 thiss!1577)))))))

(assert (=> d!56957 d!56967))

(declare-fun d!56969 () Bool)

(assert (=> d!56969 (= (invariant!0 (currentBit!7740 thiss!1577) (currentByte!7745 thiss!1577) (size!3700 (buf!4152 thiss!1577))) (and (bvsge (currentBit!7740 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7740 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7745 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7745 thiss!1577) (size!3700 (buf!4152 thiss!1577))) (and (= (currentBit!7740 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7745 thiss!1577) (size!3700 (buf!4152 thiss!1577)))))))))

(assert (=> d!56951 d!56969))

(push 1)

(check-sat)

