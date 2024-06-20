; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32880 () Bool)

(assert start!32880)

(declare-fun res!133868 () Bool)

(declare-fun e!110035 () Bool)

(assert (=> start!32880 (=> (not res!133868) (not e!110035))))

(declare-datatypes ((array!7762 0))(
  ( (array!7763 (arr!4424 (Array (_ BitVec 32) (_ BitVec 8))) (size!3503 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6174 0))(
  ( (BitStream!6175 (buf!3961 array!7762) (currentByte!7292 (_ BitVec 32)) (currentBit!7287 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6174)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32880 (= res!133868 (validate_offset_byte!0 ((_ sign_extend 32) (size!3503 (buf!3961 thiss!1602))) ((_ sign_extend 32) (currentByte!7292 thiss!1602)) ((_ sign_extend 32) (currentBit!7287 thiss!1602))))))

(assert (=> start!32880 e!110035))

(declare-fun e!110036 () Bool)

(declare-fun inv!12 (BitStream!6174) Bool)

(assert (=> start!32880 (and (inv!12 thiss!1602) e!110036)))

(declare-fun b!160511 () Bool)

(assert (=> b!160511 (= e!110035 (or (bvslt (currentByte!7292 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7292 thiss!1602) (size!3503 (buf!3961 thiss!1602)))))))

(declare-fun b!160512 () Bool)

(declare-fun array_inv!3250 (array!7762) Bool)

(assert (=> b!160512 (= e!110036 (array_inv!3250 (buf!3961 thiss!1602)))))

(assert (= (and start!32880 res!133868) b!160511))

(assert (= start!32880 b!160512))

(declare-fun m!253447 () Bool)

(assert (=> start!32880 m!253447))

(declare-fun m!253449 () Bool)

(assert (=> start!32880 m!253449))

(declare-fun m!253451 () Bool)

(assert (=> b!160512 m!253451))

(check-sat (not start!32880) (not b!160512))
(check-sat)
(get-model)

(declare-fun d!54331 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54331 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3503 (buf!3961 thiss!1602))) ((_ sign_extend 32) (currentByte!7292 thiss!1602)) ((_ sign_extend 32) (currentBit!7287 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3503 (buf!3961 thiss!1602))) ((_ sign_extend 32) (currentByte!7292 thiss!1602)) ((_ sign_extend 32) (currentBit!7287 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13478 () Bool)

(assert (= bs!13478 d!54331))

(declare-fun m!253461 () Bool)

(assert (=> bs!13478 m!253461))

(assert (=> start!32880 d!54331))

(declare-fun d!54337 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54337 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7287 thiss!1602) (currentByte!7292 thiss!1602) (size!3503 (buf!3961 thiss!1602))))))

(declare-fun bs!13481 () Bool)

(assert (= bs!13481 d!54337))

(declare-fun m!253467 () Bool)

(assert (=> bs!13481 m!253467))

(assert (=> start!32880 d!54337))

(declare-fun d!54345 () Bool)

(assert (=> d!54345 (= (array_inv!3250 (buf!3961 thiss!1602)) (bvsge (size!3503 (buf!3961 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160512 d!54345))

(check-sat (not d!54337) (not d!54331))
(check-sat)
(get-model)

(declare-fun d!54349 () Bool)

(assert (=> d!54349 (= (invariant!0 (currentBit!7287 thiss!1602) (currentByte!7292 thiss!1602) (size!3503 (buf!3961 thiss!1602))) (and (bvsge (currentBit!7287 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7287 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7292 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7292 thiss!1602) (size!3503 (buf!3961 thiss!1602))) (and (= (currentBit!7287 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7292 thiss!1602) (size!3503 (buf!3961 thiss!1602)))))))))

(assert (=> d!54337 d!54349))

(declare-fun d!54353 () Bool)

(assert (=> d!54353 (= (remainingBits!0 ((_ sign_extend 32) (size!3503 (buf!3961 thiss!1602))) ((_ sign_extend 32) (currentByte!7292 thiss!1602)) ((_ sign_extend 32) (currentBit!7287 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3503 (buf!3961 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7292 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7287 thiss!1602)))))))

(assert (=> d!54331 d!54353))

(check-sat)
