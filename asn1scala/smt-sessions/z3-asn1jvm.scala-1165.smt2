; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32952 () Bool)

(assert start!32952)

(declare-fun res!133886 () Bool)

(declare-fun e!110089 () Bool)

(assert (=> start!32952 (=> (not res!133886) (not e!110089))))

(declare-datatypes ((array!7780 0))(
  ( (array!7781 (arr!4430 (Array (_ BitVec 32) (_ BitVec 8))) (size!3509 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6186 0))(
  ( (BitStream!6187 (buf!3967 array!7780) (currentByte!7316 (_ BitVec 32)) (currentBit!7311 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6186)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32952 (= res!133886 (validate_offset_byte!0 ((_ sign_extend 32) (size!3509 (buf!3967 thiss!1602))) ((_ sign_extend 32) (currentByte!7316 thiss!1602)) ((_ sign_extend 32) (currentBit!7311 thiss!1602))))))

(assert (=> start!32952 e!110089))

(declare-fun e!110090 () Bool)

(declare-fun inv!12 (BitStream!6186) Bool)

(assert (=> start!32952 (and (inv!12 thiss!1602) e!110090)))

(declare-fun b!160547 () Bool)

(assert (=> b!160547 (= e!110089 (and (= (bvand (currentByte!7316 thiss!1602) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!7316 thiss!1602) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!7316 thiss!1602)) #b10000000000000000000000000000000)))))))

(declare-fun b!160548 () Bool)

(declare-fun array_inv!3256 (array!7780) Bool)

(assert (=> b!160548 (= e!110090 (array_inv!3256 (buf!3967 thiss!1602)))))

(assert (= (and start!32952 res!133886) b!160547))

(assert (= start!32952 b!160548))

(declare-fun m!253543 () Bool)

(assert (=> start!32952 m!253543))

(declare-fun m!253545 () Bool)

(assert (=> start!32952 m!253545))

(declare-fun m!253547 () Bool)

(assert (=> b!160548 m!253547))

(check-sat (not start!32952) (not b!160548))
(check-sat)
(get-model)

(declare-fun d!54407 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54407 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3509 (buf!3967 thiss!1602))) ((_ sign_extend 32) (currentByte!7316 thiss!1602)) ((_ sign_extend 32) (currentBit!7311 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3509 (buf!3967 thiss!1602))) ((_ sign_extend 32) (currentByte!7316 thiss!1602)) ((_ sign_extend 32) (currentBit!7311 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13498 () Bool)

(assert (= bs!13498 d!54407))

(declare-fun m!253555 () Bool)

(assert (=> bs!13498 m!253555))

(assert (=> start!32952 d!54407))

(declare-fun d!54411 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54411 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7311 thiss!1602) (currentByte!7316 thiss!1602) (size!3509 (buf!3967 thiss!1602))))))

(declare-fun bs!13501 () Bool)

(assert (= bs!13501 d!54411))

(declare-fun m!253561 () Bool)

(assert (=> bs!13501 m!253561))

(assert (=> start!32952 d!54411))

(declare-fun d!54419 () Bool)

(assert (=> d!54419 (= (array_inv!3256 (buf!3967 thiss!1602)) (bvsge (size!3509 (buf!3967 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160548 d!54419))

(check-sat (not d!54407) (not d!54411))
(check-sat)
(get-model)

(declare-fun d!54423 () Bool)

(assert (=> d!54423 (= (remainingBits!0 ((_ sign_extend 32) (size!3509 (buf!3967 thiss!1602))) ((_ sign_extend 32) (currentByte!7316 thiss!1602)) ((_ sign_extend 32) (currentBit!7311 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3509 (buf!3967 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7316 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7311 thiss!1602)))))))

(assert (=> d!54407 d!54423))

(declare-fun d!54427 () Bool)

(assert (=> d!54427 (= (invariant!0 (currentBit!7311 thiss!1602) (currentByte!7316 thiss!1602) (size!3509 (buf!3967 thiss!1602))) (and (bvsge (currentBit!7311 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7311 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7316 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7316 thiss!1602) (size!3509 (buf!3967 thiss!1602))) (and (= (currentBit!7311 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7316 thiss!1602) (size!3509 (buf!3967 thiss!1602)))))))))

(assert (=> d!54411 d!54427))

(check-sat)
