; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36888 () Bool)

(assert start!36888)

(declare-fun res!140299 () Bool)

(declare-fun e!117177 () Bool)

(assert (=> start!36888 (=> (not res!140299) (not e!117177))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36888 (= res!140299 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36888 e!117177))

(assert (=> start!36888 true))

(declare-datatypes ((array!8795 0))(
  ( (array!8796 (arr!4820 (Array (_ BitVec 32) (_ BitVec 8))) (size!3899 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6954 0))(
  ( (BitStream!6955 (buf!4351 array!8795) (currentByte!8263 (_ BitVec 32)) (currentBit!8258 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6954)

(declare-fun e!117175 () Bool)

(declare-fun inv!12 (BitStream!6954) Bool)

(assert (=> start!36888 (and (inv!12 thiss!1894) e!117175)))

(declare-fun b!168616 () Bool)

(declare-fun res!140300 () Bool)

(assert (=> b!168616 (=> (not res!140300) (not e!117177))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168616 (= res!140300 (validate_offset_bits!1 ((_ sign_extend 32) (size!3899 (buf!4351 thiss!1894))) ((_ sign_extend 32) (currentByte!8263 thiss!1894)) ((_ sign_extend 32) (currentBit!8258 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168617 () Bool)

(assert (=> b!168617 (= e!117177 (and (bvsle (bvadd (currentBit!8258 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsle (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8258 thiss!1894) nBits!600)) #b00000000000000000000000000100000) (or (bvslt (currentByte!8263 thiss!1894) #b00000000000000000000000000000000) (bvsge (currentByte!8263 thiss!1894) (size!3899 (buf!4351 thiss!1894))))))))

(declare-fun b!168618 () Bool)

(declare-fun array_inv!3640 (array!8795) Bool)

(assert (=> b!168618 (= e!117175 (array_inv!3640 (buf!4351 thiss!1894)))))

(assert (= (and start!36888 res!140299) b!168616))

(assert (= (and b!168616 res!140300) b!168617))

(assert (= start!36888 b!168618))

(declare-fun m!268209 () Bool)

(assert (=> start!36888 m!268209))

(declare-fun m!268211 () Bool)

(assert (=> b!168616 m!268211))

(declare-fun m!268213 () Bool)

(assert (=> b!168618 m!268213))

(check-sat (not b!168616) (not b!168618) (not start!36888))
(check-sat)
(get-model)

(declare-fun d!59469 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59469 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3899 (buf!4351 thiss!1894))) ((_ sign_extend 32) (currentByte!8263 thiss!1894)) ((_ sign_extend 32) (currentBit!8258 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3899 (buf!4351 thiss!1894))) ((_ sign_extend 32) (currentByte!8263 thiss!1894)) ((_ sign_extend 32) (currentBit!8258 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14730 () Bool)

(assert (= bs!14730 d!59469))

(declare-fun m!268221 () Bool)

(assert (=> bs!14730 m!268221))

(assert (=> b!168616 d!59469))

(declare-fun d!59471 () Bool)

(assert (=> d!59471 (= (array_inv!3640 (buf!4351 thiss!1894)) (bvsge (size!3899 (buf!4351 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168618 d!59471))

(declare-fun d!59473 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59473 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8258 thiss!1894) (currentByte!8263 thiss!1894) (size!3899 (buf!4351 thiss!1894))))))

(declare-fun bs!14731 () Bool)

(assert (= bs!14731 d!59473))

(declare-fun m!268223 () Bool)

(assert (=> bs!14731 m!268223))

(assert (=> start!36888 d!59473))

(check-sat (not d!59473) (not d!59469))
(check-sat)
(get-model)

(declare-fun d!59481 () Bool)

(assert (=> d!59481 (= (invariant!0 (currentBit!8258 thiss!1894) (currentByte!8263 thiss!1894) (size!3899 (buf!4351 thiss!1894))) (and (bvsge (currentBit!8258 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8258 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8263 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8263 thiss!1894) (size!3899 (buf!4351 thiss!1894))) (and (= (currentBit!8258 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8263 thiss!1894) (size!3899 (buf!4351 thiss!1894)))))))))

(assert (=> d!59473 d!59481))

(declare-fun d!59483 () Bool)

(assert (=> d!59483 (= (remainingBits!0 ((_ sign_extend 32) (size!3899 (buf!4351 thiss!1894))) ((_ sign_extend 32) (currentByte!8263 thiss!1894)) ((_ sign_extend 32) (currentBit!8258 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3899 (buf!4351 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8263 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8258 thiss!1894)))))))

(assert (=> d!59469 d!59483))

(check-sat)
