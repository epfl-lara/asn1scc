; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37040 () Bool)

(assert start!37040)

(declare-fun res!140416 () Bool)

(declare-fun e!117337 () Bool)

(assert (=> start!37040 (=> (not res!140416) (not e!117337))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37040 (= res!140416 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37040 e!117337))

(assert (=> start!37040 true))

(declare-datatypes ((array!8843 0))(
  ( (array!8844 (arr!4838 (Array (_ BitVec 32) (_ BitVec 8))) (size!3917 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6990 0))(
  ( (BitStream!6991 (buf!4369 array!8843) (currentByte!8315 (_ BitVec 32)) (currentBit!8310 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6990)

(declare-fun e!117339 () Bool)

(declare-fun inv!12 (BitStream!6990) Bool)

(assert (=> start!37040 (and (inv!12 thiss!1894) e!117339)))

(declare-fun b!168787 () Bool)

(declare-fun res!140417 () Bool)

(assert (=> b!168787 (=> (not res!140417) (not e!117337))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168787 (= res!140417 (validate_offset_bits!1 ((_ sign_extend 32) (size!3917 (buf!4369 thiss!1894))) ((_ sign_extend 32) (currentByte!8315 thiss!1894)) ((_ sign_extend 32) (currentBit!8310 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168788 () Bool)

(assert (=> b!168788 (= e!117337 (and (bvsgt (bvadd (currentBit!8310 thiss!1894) nBits!600) #b00000000000000000000000000001000) (= (bvand (currentByte!8315 thiss!1894) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!8315 thiss!1894) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8315 thiss!1894)) #b10000000000000000000000000000000)))))))

(declare-fun b!168789 () Bool)

(declare-fun array_inv!3658 (array!8843) Bool)

(assert (=> b!168789 (= e!117339 (array_inv!3658 (buf!4369 thiss!1894)))))

(assert (= (and start!37040 res!140416) b!168787))

(assert (= (and b!168787 res!140417) b!168788))

(assert (= start!37040 b!168789))

(declare-fun m!268377 () Bool)

(assert (=> start!37040 m!268377))

(declare-fun m!268379 () Bool)

(assert (=> b!168787 m!268379))

(declare-fun m!268381 () Bool)

(assert (=> b!168789 m!268381))

(check-sat (not start!37040) (not b!168787) (not b!168789))
(check-sat)
(get-model)

(declare-fun d!59609 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59609 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8310 thiss!1894) (currentByte!8315 thiss!1894) (size!3917 (buf!4369 thiss!1894))))))

(declare-fun bs!14775 () Bool)

(assert (= bs!14775 d!59609))

(declare-fun m!268389 () Bool)

(assert (=> bs!14775 m!268389))

(assert (=> start!37040 d!59609))

(declare-fun d!59611 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59611 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3917 (buf!4369 thiss!1894))) ((_ sign_extend 32) (currentByte!8315 thiss!1894)) ((_ sign_extend 32) (currentBit!8310 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3917 (buf!4369 thiss!1894))) ((_ sign_extend 32) (currentByte!8315 thiss!1894)) ((_ sign_extend 32) (currentBit!8310 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14776 () Bool)

(assert (= bs!14776 d!59611))

(declare-fun m!268391 () Bool)

(assert (=> bs!14776 m!268391))

(assert (=> b!168787 d!59611))

(declare-fun d!59613 () Bool)

(assert (=> d!59613 (= (array_inv!3658 (buf!4369 thiss!1894)) (bvsge (size!3917 (buf!4369 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168789 d!59613))

(check-sat (not d!59609) (not d!59611))
(check-sat)
(get-model)

(declare-fun d!59623 () Bool)

(assert (=> d!59623 (= (invariant!0 (currentBit!8310 thiss!1894) (currentByte!8315 thiss!1894) (size!3917 (buf!4369 thiss!1894))) (and (bvsge (currentBit!8310 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8310 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8315 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8315 thiss!1894) (size!3917 (buf!4369 thiss!1894))) (and (= (currentBit!8310 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8315 thiss!1894) (size!3917 (buf!4369 thiss!1894)))))))))

(assert (=> d!59609 d!59623))

(declare-fun d!59627 () Bool)

(assert (=> d!59627 (= (remainingBits!0 ((_ sign_extend 32) (size!3917 (buf!4369 thiss!1894))) ((_ sign_extend 32) (currentByte!8315 thiss!1894)) ((_ sign_extend 32) (currentBit!8310 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3917 (buf!4369 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8315 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8310 thiss!1894)))))))

(assert (=> d!59611 d!59627))

(check-sat)
