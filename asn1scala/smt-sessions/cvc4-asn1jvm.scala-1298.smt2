; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36938 () Bool)

(assert start!36938)

(declare-fun res!140360 () Bool)

(declare-fun e!117265 () Bool)

(assert (=> start!36938 (=> (not res!140360) (not e!117265))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36938 (= res!140360 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36938 e!117265))

(assert (=> start!36938 true))

(declare-datatypes ((array!8818 0))(
  ( (array!8819 (arr!4830 (Array (_ BitVec 32) (_ BitVec 8))) (size!3909 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6974 0))(
  ( (BitStream!6975 (buf!4361 array!8818) (currentByte!8282 (_ BitVec 32)) (currentBit!8277 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6974)

(declare-fun e!117266 () Bool)

(declare-fun inv!12 (BitStream!6974) Bool)

(assert (=> start!36938 (and (inv!12 thiss!1894) e!117266)))

(declare-fun b!168706 () Bool)

(declare-fun res!140359 () Bool)

(assert (=> b!168706 (=> (not res!140359) (not e!117265))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168706 (= res!140359 (validate_offset_bits!1 ((_ sign_extend 32) (size!3909 (buf!4361 thiss!1894))) ((_ sign_extend 32) (currentByte!8282 thiss!1894)) ((_ sign_extend 32) (currentBit!8277 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168707 () Bool)

(assert (=> b!168707 (= e!117265 (and (bvsgt (bvadd (currentBit!8277 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsgt (bvsub (bvadd (currentBit!8277 thiss!1894) nBits!600) #b00000000000000000000000000001000) #b00000000000000000000000000100000)))))

(declare-fun b!168708 () Bool)

(declare-fun array_inv!3650 (array!8818) Bool)

(assert (=> b!168708 (= e!117266 (array_inv!3650 (buf!4361 thiss!1894)))))

(assert (= (and start!36938 res!140360) b!168706))

(assert (= (and b!168706 res!140359) b!168707))

(assert (= start!36938 b!168708))

(declare-fun m!268281 () Bool)

(assert (=> start!36938 m!268281))

(declare-fun m!268283 () Bool)

(assert (=> b!168706 m!268283))

(declare-fun m!268285 () Bool)

(assert (=> b!168708 m!268285))

(push 1)

(assert (not b!168706))

(assert (not b!168708))

(assert (not start!36938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59515 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59515 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3909 (buf!4361 thiss!1894))) ((_ sign_extend 32) (currentByte!8282 thiss!1894)) ((_ sign_extend 32) (currentBit!8277 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3909 (buf!4361 thiss!1894))) ((_ sign_extend 32) (currentByte!8282 thiss!1894)) ((_ sign_extend 32) (currentBit!8277 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14749 () Bool)

(assert (= bs!14749 d!59515))

(declare-fun m!268295 () Bool)

(assert (=> bs!14749 m!268295))

(assert (=> b!168706 d!59515))

(declare-fun d!59519 () Bool)

(assert (=> d!59519 (= (array_inv!3650 (buf!4361 thiss!1894)) (bvsge (size!3909 (buf!4361 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168708 d!59519))

(declare-fun d!59521 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59521 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8277 thiss!1894) (currentByte!8282 thiss!1894) (size!3909 (buf!4361 thiss!1894))))))

(declare-fun bs!14750 () Bool)

(assert (= bs!14750 d!59521))

(declare-fun m!268297 () Bool)

(assert (=> bs!14750 m!268297))

(assert (=> start!36938 d!59521))

(push 1)

(assert (not d!59515))

(assert (not d!59521))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59531 () Bool)

(assert (=> d!59531 (= (remainingBits!0 ((_ sign_extend 32) (size!3909 (buf!4361 thiss!1894))) ((_ sign_extend 32) (currentByte!8282 thiss!1894)) ((_ sign_extend 32) (currentBit!8277 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3909 (buf!4361 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8282 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8277 thiss!1894)))))))

(assert (=> d!59515 d!59531))

(declare-fun d!59533 () Bool)

(assert (=> d!59533 (= (invariant!0 (currentBit!8277 thiss!1894) (currentByte!8282 thiss!1894) (size!3909 (buf!4361 thiss!1894))) (and (bvsge (currentBit!8277 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8277 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8282 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8282 thiss!1894) (size!3909 (buf!4361 thiss!1894))) (and (= (currentBit!8277 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8282 thiss!1894) (size!3909 (buf!4361 thiss!1894)))))))))

(assert (=> d!59521 d!59533))

(push 1)

(check-sat)

