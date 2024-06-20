; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36816 () Bool)

(assert start!36816)

(declare-fun res!140263 () Bool)

(declare-fun e!117123 () Bool)

(assert (=> start!36816 (=> (not res!140263) (not e!117123))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36816 (= res!140263 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36816 e!117123))

(assert (=> start!36816 true))

(declare-datatypes ((array!8777 0))(
  ( (array!8778 (arr!4814 (Array (_ BitVec 32) (_ BitVec 8))) (size!3893 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6942 0))(
  ( (BitStream!6943 (buf!4345 array!8777) (currentByte!8239 (_ BitVec 32)) (currentBit!8234 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6942)

(declare-fun e!117122 () Bool)

(declare-fun inv!12 (BitStream!6942) Bool)

(assert (=> start!36816 (and (inv!12 thiss!1894) e!117122)))

(declare-fun b!168562 () Bool)

(declare-fun res!140264 () Bool)

(assert (=> b!168562 (=> (not res!140264) (not e!117123))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168562 (= res!140264 (validate_offset_bits!1 ((_ sign_extend 32) (size!3893 (buf!4345 thiss!1894))) ((_ sign_extend 32) (currentByte!8239 thiss!1894)) ((_ sign_extend 32) (currentBit!8234 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168563 () Bool)

(assert (=> b!168563 (= e!117123 (and (= (bvand (currentBit!8234 thiss!1894) #b10000000000000000000000000000000) (bvand nBits!600 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!8234 thiss!1894) #b10000000000000000000000000000000) (bvand (bvadd (currentBit!8234 thiss!1894) nBits!600) #b10000000000000000000000000000000)))))))

(declare-fun b!168564 () Bool)

(declare-fun array_inv!3634 (array!8777) Bool)

(assert (=> b!168564 (= e!117122 (array_inv!3634 (buf!4345 thiss!1894)))))

(assert (= (and start!36816 res!140263) b!168562))

(assert (= (and b!168562 res!140264) b!168563))

(assert (= start!36816 b!168564))

(declare-fun m!268149 () Bool)

(assert (=> start!36816 m!268149))

(declare-fun m!268151 () Bool)

(assert (=> b!168562 m!268151))

(declare-fun m!268153 () Bool)

(assert (=> b!168564 m!268153))

(check-sat (not start!36816) (not b!168562) (not b!168564))
(check-sat)
(get-model)

(declare-fun d!59409 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59409 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8234 thiss!1894) (currentByte!8239 thiss!1894) (size!3893 (buf!4345 thiss!1894))))))

(declare-fun bs!14714 () Bool)

(assert (= bs!14714 d!59409))

(declare-fun m!268165 () Bool)

(assert (=> bs!14714 m!268165))

(assert (=> start!36816 d!59409))

(declare-fun d!59413 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59413 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3893 (buf!4345 thiss!1894))) ((_ sign_extend 32) (currentByte!8239 thiss!1894)) ((_ sign_extend 32) (currentBit!8234 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3893 (buf!4345 thiss!1894))) ((_ sign_extend 32) (currentByte!8239 thiss!1894)) ((_ sign_extend 32) (currentBit!8234 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14715 () Bool)

(assert (= bs!14715 d!59413))

(declare-fun m!268167 () Bool)

(assert (=> bs!14715 m!268167))

(assert (=> b!168562 d!59413))

(declare-fun d!59415 () Bool)

(assert (=> d!59415 (= (array_inv!3634 (buf!4345 thiss!1894)) (bvsge (size!3893 (buf!4345 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168564 d!59415))

(check-sat (not d!59409) (not d!59413))
(check-sat)
(get-model)

(declare-fun d!59423 () Bool)

(assert (=> d!59423 (= (invariant!0 (currentBit!8234 thiss!1894) (currentByte!8239 thiss!1894) (size!3893 (buf!4345 thiss!1894))) (and (bvsge (currentBit!8234 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8234 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8239 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8239 thiss!1894) (size!3893 (buf!4345 thiss!1894))) (and (= (currentBit!8234 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8239 thiss!1894) (size!3893 (buf!4345 thiss!1894)))))))))

(assert (=> d!59409 d!59423))

(declare-fun d!59427 () Bool)

(assert (=> d!59427 (= (remainingBits!0 ((_ sign_extend 32) (size!3893 (buf!4345 thiss!1894))) ((_ sign_extend 32) (currentByte!8239 thiss!1894)) ((_ sign_extend 32) (currentBit!8234 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3893 (buf!4345 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8239 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8234 thiss!1894)))))))

(assert (=> d!59413 d!59427))

(check-sat)
