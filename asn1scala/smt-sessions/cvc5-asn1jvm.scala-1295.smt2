; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36886 () Bool)

(assert start!36886)

(declare-fun res!140294 () Bool)

(declare-fun e!117167 () Bool)

(assert (=> start!36886 (=> (not res!140294) (not e!117167))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36886 (= res!140294 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36886 e!117167))

(assert (=> start!36886 true))

(declare-datatypes ((array!8793 0))(
  ( (array!8794 (arr!4819 (Array (_ BitVec 32) (_ BitVec 8))) (size!3898 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6952 0))(
  ( (BitStream!6953 (buf!4350 array!8793) (currentByte!8262 (_ BitVec 32)) (currentBit!8257 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6952)

(declare-fun e!117168 () Bool)

(declare-fun inv!12 (BitStream!6952) Bool)

(assert (=> start!36886 (and (inv!12 thiss!1894) e!117168)))

(declare-fun b!168607 () Bool)

(declare-fun res!140293 () Bool)

(assert (=> b!168607 (=> (not res!140293) (not e!117167))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168607 (= res!140293 (validate_offset_bits!1 ((_ sign_extend 32) (size!3898 (buf!4350 thiss!1894))) ((_ sign_extend 32) (currentByte!8262 thiss!1894)) ((_ sign_extend 32) (currentBit!8257 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168608 () Bool)

(assert (=> b!168608 (= e!117167 (and (bvsle (bvadd (currentBit!8257 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsle (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8257 thiss!1894) nBits!600)) #b00000000000000000000000000100000) (or (bvslt (currentByte!8262 thiss!1894) #b00000000000000000000000000000000) (bvsge (currentByte!8262 thiss!1894) (size!3898 (buf!4350 thiss!1894))))))))

(declare-fun b!168609 () Bool)

(declare-fun array_inv!3639 (array!8793) Bool)

(assert (=> b!168609 (= e!117168 (array_inv!3639 (buf!4350 thiss!1894)))))

(assert (= (and start!36886 res!140294) b!168607))

(assert (= (and b!168607 res!140293) b!168608))

(assert (= start!36886 b!168609))

(declare-fun m!268203 () Bool)

(assert (=> start!36886 m!268203))

(declare-fun m!268205 () Bool)

(assert (=> b!168607 m!268205))

(declare-fun m!268207 () Bool)

(assert (=> b!168609 m!268207))

(push 1)

(assert (not b!168607))

(assert (not start!36886))

(assert (not b!168609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59475 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59475 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3898 (buf!4350 thiss!1894))) ((_ sign_extend 32) (currentByte!8262 thiss!1894)) ((_ sign_extend 32) (currentBit!8257 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3898 (buf!4350 thiss!1894))) ((_ sign_extend 32) (currentByte!8262 thiss!1894)) ((_ sign_extend 32) (currentBit!8257 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14732 () Bool)

(assert (= bs!14732 d!59475))

(declare-fun m!268225 () Bool)

(assert (=> bs!14732 m!268225))

(assert (=> b!168607 d!59475))

(declare-fun d!59477 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59477 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8257 thiss!1894) (currentByte!8262 thiss!1894) (size!3898 (buf!4350 thiss!1894))))))

(declare-fun bs!14733 () Bool)

(assert (= bs!14733 d!59477))

(declare-fun m!268227 () Bool)

(assert (=> bs!14733 m!268227))

(assert (=> start!36886 d!59477))

(declare-fun d!59479 () Bool)

(assert (=> d!59479 (= (array_inv!3639 (buf!4350 thiss!1894)) (bvsge (size!3898 (buf!4350 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168609 d!59479))

(push 1)

(assert (not d!59475))

(assert (not d!59477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59491 () Bool)

(assert (=> d!59491 (= (remainingBits!0 ((_ sign_extend 32) (size!3898 (buf!4350 thiss!1894))) ((_ sign_extend 32) (currentByte!8262 thiss!1894)) ((_ sign_extend 32) (currentBit!8257 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3898 (buf!4350 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8262 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8257 thiss!1894)))))))

(assert (=> d!59475 d!59491))

(declare-fun d!59493 () Bool)

(assert (=> d!59493 (= (invariant!0 (currentBit!8257 thiss!1894) (currentByte!8262 thiss!1894) (size!3898 (buf!4350 thiss!1894))) (and (bvsge (currentBit!8257 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8257 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8262 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8262 thiss!1894) (size!3898 (buf!4350 thiss!1894))) (and (= (currentBit!8257 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8262 thiss!1894) (size!3898 (buf!4350 thiss!1894)))))))))

(assert (=> d!59477 d!59493))

(push 1)

(check-sat)

