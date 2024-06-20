; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32954 () Bool)

(assert start!32954)

(declare-fun res!133889 () Bool)

(declare-fun e!110098 () Bool)

(assert (=> start!32954 (=> (not res!133889) (not e!110098))))

(declare-datatypes ((array!7782 0))(
  ( (array!7783 (arr!4431 (Array (_ BitVec 32) (_ BitVec 8))) (size!3510 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6188 0))(
  ( (BitStream!6189 (buf!3968 array!7782) (currentByte!7317 (_ BitVec 32)) (currentBit!7312 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6188)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32954 (= res!133889 (validate_offset_byte!0 ((_ sign_extend 32) (size!3510 (buf!3968 thiss!1602))) ((_ sign_extend 32) (currentByte!7317 thiss!1602)) ((_ sign_extend 32) (currentBit!7312 thiss!1602))))))

(assert (=> start!32954 e!110098))

(declare-fun e!110099 () Bool)

(declare-fun inv!12 (BitStream!6188) Bool)

(assert (=> start!32954 (and (inv!12 thiss!1602) e!110099)))

(declare-fun b!160553 () Bool)

(assert (=> b!160553 (= e!110098 (and (= (bvand (currentByte!7317 thiss!1602) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!7317 thiss!1602) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!7317 thiss!1602)) #b10000000000000000000000000000000)))))))

(declare-fun b!160554 () Bool)

(declare-fun array_inv!3257 (array!7782) Bool)

(assert (=> b!160554 (= e!110099 (array_inv!3257 (buf!3968 thiss!1602)))))

(assert (= (and start!32954 res!133889) b!160553))

(assert (= start!32954 b!160554))

(declare-fun m!253549 () Bool)

(assert (=> start!32954 m!253549))

(declare-fun m!253551 () Bool)

(assert (=> start!32954 m!253551))

(declare-fun m!253553 () Bool)

(assert (=> b!160554 m!253553))

(push 1)

(assert (not b!160554))

(assert (not start!32954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54409 () Bool)

(assert (=> d!54409 (= (array_inv!3257 (buf!3968 thiss!1602)) (bvsge (size!3510 (buf!3968 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160554 d!54409))

(declare-fun d!54413 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54413 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3510 (buf!3968 thiss!1602))) ((_ sign_extend 32) (currentByte!7317 thiss!1602)) ((_ sign_extend 32) (currentBit!7312 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3510 (buf!3968 thiss!1602))) ((_ sign_extend 32) (currentByte!7317 thiss!1602)) ((_ sign_extend 32) (currentBit!7312 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13500 () Bool)

(assert (= bs!13500 d!54413))

(declare-fun m!253559 () Bool)

(assert (=> bs!13500 m!253559))

(assert (=> start!32954 d!54413))

(declare-fun d!54417 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54417 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7312 thiss!1602) (currentByte!7317 thiss!1602) (size!3510 (buf!3968 thiss!1602))))))

(declare-fun bs!13503 () Bool)

(assert (= bs!13503 d!54417))

(declare-fun m!253565 () Bool)

(assert (=> bs!13503 m!253565))

(assert (=> start!32954 d!54417))

(push 1)

(assert (not d!54417))

(assert (not d!54413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54431 () Bool)

(assert (=> d!54431 (= (invariant!0 (currentBit!7312 thiss!1602) (currentByte!7317 thiss!1602) (size!3510 (buf!3968 thiss!1602))) (and (bvsge (currentBit!7312 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7312 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7317 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7317 thiss!1602) (size!3510 (buf!3968 thiss!1602))) (and (= (currentBit!7312 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7317 thiss!1602) (size!3510 (buf!3968 thiss!1602)))))))))

(assert (=> d!54417 d!54431))

(declare-fun d!54433 () Bool)

(assert (=> d!54433 (= (remainingBits!0 ((_ sign_extend 32) (size!3510 (buf!3968 thiss!1602))) ((_ sign_extend 32) (currentByte!7317 thiss!1602)) ((_ sign_extend 32) (currentBit!7312 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3510 (buf!3968 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7317 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7312 thiss!1602)))))))

(assert (=> d!54413 d!54433))

(push 1)

(check-sat)

