; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32024 () Bool)

(assert start!32024)

(declare-fun res!132542 () Bool)

(declare-fun e!108151 () Bool)

(assert (=> start!32024 (=> (not res!132542) (not e!108151))))

(declare-datatypes ((array!7488 0))(
  ( (array!7489 (arr!4314 (Array (_ BitVec 32) (_ BitVec 8))) (size!3393 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5954 0))(
  ( (BitStream!5955 (buf!3851 array!7488) (currentByte!7065 (_ BitVec 32)) (currentBit!7060 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5954)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32024 (= res!132542 (validate_offset_byte!0 ((_ sign_extend 32) (size!3393 (buf!3851 thiss!1602))) ((_ sign_extend 32) (currentByte!7065 thiss!1602)) ((_ sign_extend 32) (currentBit!7060 thiss!1602))))))

(assert (=> start!32024 e!108151))

(declare-fun e!108152 () Bool)

(declare-fun inv!12 (BitStream!5954) Bool)

(assert (=> start!32024 (and (inv!12 thiss!1602) e!108152)))

(declare-fun b!158765 () Bool)

(assert (=> b!158765 (= e!108151 (and (bvslt (currentByte!7065 thiss!1602) (size!3393 (buf!3851 thiss!1602))) (or (bvsgt #b00000000000000000000000000000000 (currentBit!7060 thiss!1602)) (bvsgt (currentBit!7060 thiss!1602) #b00000000000000000000000000001000))))))

(declare-fun b!158766 () Bool)

(declare-fun array_inv!3140 (array!7488) Bool)

(assert (=> b!158766 (= e!108152 (array_inv!3140 (buf!3851 thiss!1602)))))

(assert (= (and start!32024 res!132542) b!158765))

(assert (= start!32024 b!158766))

(declare-fun m!249331 () Bool)

(assert (=> start!32024 m!249331))

(declare-fun m!249333 () Bool)

(assert (=> start!32024 m!249333))

(declare-fun m!249335 () Bool)

(assert (=> b!158766 m!249335))

(push 1)

(assert (not b!158766))

(assert (not start!32024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53381 () Bool)

(assert (=> d!53381 (= (array_inv!3140 (buf!3851 thiss!1602)) (bvsge (size!3393 (buf!3851 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!158766 d!53381))

(declare-fun d!53383 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53383 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3393 (buf!3851 thiss!1602))) ((_ sign_extend 32) (currentByte!7065 thiss!1602)) ((_ sign_extend 32) (currentBit!7060 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3393 (buf!3851 thiss!1602))) ((_ sign_extend 32) (currentByte!7065 thiss!1602)) ((_ sign_extend 32) (currentBit!7060 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13212 () Bool)

(assert (= bs!13212 d!53383))

(declare-fun m!249343 () Bool)

(assert (=> bs!13212 m!249343))

(assert (=> start!32024 d!53383))

(declare-fun d!53387 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53387 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7060 thiss!1602) (currentByte!7065 thiss!1602) (size!3393 (buf!3851 thiss!1602))))))

(declare-fun bs!13214 () Bool)

(assert (= bs!13214 d!53387))

(declare-fun m!249347 () Bool)

(assert (=> bs!13214 m!249347))

(assert (=> start!32024 d!53387))

(push 1)

(assert (not d!53383))

(assert (not d!53387))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53395 () Bool)

(assert (=> d!53395 (= (remainingBits!0 ((_ sign_extend 32) (size!3393 (buf!3851 thiss!1602))) ((_ sign_extend 32) (currentByte!7065 thiss!1602)) ((_ sign_extend 32) (currentBit!7060 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3393 (buf!3851 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7065 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7060 thiss!1602)))))))

(assert (=> d!53383 d!53395))

(declare-fun d!53399 () Bool)

