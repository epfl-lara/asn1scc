; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36852 () Bool)

(assert start!36852)

(declare-fun res!140282 () Bool)

(declare-fun e!117149 () Bool)

(assert (=> start!36852 (=> (not res!140282) (not e!117149))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36852 (= res!140282 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36852 e!117149))

(assert (=> start!36852 true))

(declare-datatypes ((array!8786 0))(
  ( (array!8787 (arr!4817 (Array (_ BitVec 32) (_ BitVec 8))) (size!3896 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6948 0))(
  ( (BitStream!6949 (buf!4348 array!8786) (currentByte!8251 (_ BitVec 32)) (currentBit!8246 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6948)

(declare-fun e!117150 () Bool)

(declare-fun inv!12 (BitStream!6948) Bool)

(assert (=> start!36852 (and (inv!12 thiss!1894) e!117150)))

(declare-fun b!168589 () Bool)

(declare-fun res!140281 () Bool)

(assert (=> b!168589 (=> (not res!140281) (not e!117149))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168589 (= res!140281 (validate_offset_bits!1 ((_ sign_extend 32) (size!3896 (buf!4348 thiss!1894))) ((_ sign_extend 32) (currentByte!8251 thiss!1894)) ((_ sign_extend 32) (currentBit!8246 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168590 () Bool)

(assert (=> b!168590 (= e!117149 (and (bvsle (bvadd (currentBit!8246 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8246 thiss!1894) nBits!600)) #b00000000000000000000000000100000)))))

(declare-fun b!168591 () Bool)

(declare-fun array_inv!3637 (array!8786) Bool)

(assert (=> b!168591 (= e!117150 (array_inv!3637 (buf!4348 thiss!1894)))))

(assert (= (and start!36852 res!140282) b!168589))

(assert (= (and b!168589 res!140281) b!168590))

(assert (= start!36852 b!168591))

(declare-fun m!268179 () Bool)

(assert (=> start!36852 m!268179))

(declare-fun m!268181 () Bool)

(assert (=> b!168589 m!268181))

(declare-fun m!268183 () Bool)

(assert (=> b!168591 m!268183))

(check-sat (not b!168589) (not start!36852) (not b!168591))
(check-sat)
(get-model)

(declare-fun d!59437 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59437 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3896 (buf!4348 thiss!1894))) ((_ sign_extend 32) (currentByte!8251 thiss!1894)) ((_ sign_extend 32) (currentBit!8246 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3896 (buf!4348 thiss!1894))) ((_ sign_extend 32) (currentByte!8251 thiss!1894)) ((_ sign_extend 32) (currentBit!8246 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14721 () Bool)

(assert (= bs!14721 d!59437))

(declare-fun m!268191 () Bool)

(assert (=> bs!14721 m!268191))

(assert (=> b!168589 d!59437))

(declare-fun d!59439 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59439 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8246 thiss!1894) (currentByte!8251 thiss!1894) (size!3896 (buf!4348 thiss!1894))))))

(declare-fun bs!14722 () Bool)

(assert (= bs!14722 d!59439))

(declare-fun m!268193 () Bool)

(assert (=> bs!14722 m!268193))

(assert (=> start!36852 d!59439))

(declare-fun d!59441 () Bool)

(assert (=> d!59441 (= (array_inv!3637 (buf!4348 thiss!1894)) (bvsge (size!3896 (buf!4348 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168591 d!59441))

(check-sat (not d!59439) (not d!59437))
(check-sat)
(get-model)

(declare-fun d!59449 () Bool)

(assert (=> d!59449 (= (invariant!0 (currentBit!8246 thiss!1894) (currentByte!8251 thiss!1894) (size!3896 (buf!4348 thiss!1894))) (and (bvsge (currentBit!8246 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8246 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8251 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8251 thiss!1894) (size!3896 (buf!4348 thiss!1894))) (and (= (currentBit!8246 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8251 thiss!1894) (size!3896 (buf!4348 thiss!1894)))))))))

(assert (=> d!59439 d!59449))

(declare-fun d!59453 () Bool)

(assert (=> d!59453 (= (remainingBits!0 ((_ sign_extend 32) (size!3896 (buf!4348 thiss!1894))) ((_ sign_extend 32) (currentByte!8251 thiss!1894)) ((_ sign_extend 32) (currentBit!8246 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3896 (buf!4348 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8251 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8246 thiss!1894)))))))

(assert (=> d!59437 d!59453))

(check-sat)
