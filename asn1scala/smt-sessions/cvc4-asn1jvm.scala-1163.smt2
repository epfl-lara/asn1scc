; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32882 () Bool)

(assert start!32882)

(declare-fun res!133871 () Bool)

(declare-fun e!110044 () Bool)

(assert (=> start!32882 (=> (not res!133871) (not e!110044))))

(declare-datatypes ((array!7764 0))(
  ( (array!7765 (arr!4425 (Array (_ BitVec 32) (_ BitVec 8))) (size!3504 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6176 0))(
  ( (BitStream!6177 (buf!3962 array!7764) (currentByte!7293 (_ BitVec 32)) (currentBit!7288 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6176)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32882 (= res!133871 (validate_offset_byte!0 ((_ sign_extend 32) (size!3504 (buf!3962 thiss!1602))) ((_ sign_extend 32) (currentByte!7293 thiss!1602)) ((_ sign_extend 32) (currentBit!7288 thiss!1602))))))

(assert (=> start!32882 e!110044))

(declare-fun e!110045 () Bool)

(declare-fun inv!12 (BitStream!6176) Bool)

(assert (=> start!32882 (and (inv!12 thiss!1602) e!110045)))

(declare-fun b!160517 () Bool)

(assert (=> b!160517 (= e!110044 (or (bvslt (currentByte!7293 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7293 thiss!1602) (size!3504 (buf!3962 thiss!1602)))))))

(declare-fun b!160518 () Bool)

(declare-fun array_inv!3251 (array!7764) Bool)

(assert (=> b!160518 (= e!110045 (array_inv!3251 (buf!3962 thiss!1602)))))

(assert (= (and start!32882 res!133871) b!160517))

(assert (= start!32882 b!160518))

(declare-fun m!253453 () Bool)

(assert (=> start!32882 m!253453))

(declare-fun m!253455 () Bool)

(assert (=> start!32882 m!253455))

(declare-fun m!253457 () Bool)

(assert (=> b!160518 m!253457))

(push 1)

(assert (not b!160518))

(assert (not start!32882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54335 () Bool)

(assert (=> d!54335 (= (array_inv!3251 (buf!3962 thiss!1602)) (bvsge (size!3504 (buf!3962 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160518 d!54335))

(declare-fun d!54339 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54339 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3504 (buf!3962 thiss!1602))) ((_ sign_extend 32) (currentByte!7293 thiss!1602)) ((_ sign_extend 32) (currentBit!7288 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3504 (buf!3962 thiss!1602))) ((_ sign_extend 32) (currentByte!7293 thiss!1602)) ((_ sign_extend 32) (currentBit!7288 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13480 () Bool)

(assert (= bs!13480 d!54339))

(declare-fun m!253465 () Bool)

(assert (=> bs!13480 m!253465))

(assert (=> start!32882 d!54339))

(declare-fun d!54343 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54343 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7288 thiss!1602) (currentByte!7293 thiss!1602) (size!3504 (buf!3962 thiss!1602))))))

(declare-fun bs!13482 () Bool)

(assert (= bs!13482 d!54343))

(declare-fun m!253469 () Bool)

(assert (=> bs!13482 m!253469))

(assert (=> start!32882 d!54343))

(push 1)

(assert (not d!54343))

(assert (not d!54339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54355 () Bool)

(assert (=> d!54355 (= (invariant!0 (currentBit!7288 thiss!1602) (currentByte!7293 thiss!1602) (size!3504 (buf!3962 thiss!1602))) (and (bvsge (currentBit!7288 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7288 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7293 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7293 thiss!1602) (size!3504 (buf!3962 thiss!1602))) (and (= (currentBit!7288 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7293 thiss!1602) (size!3504 (buf!3962 thiss!1602)))))))))

(assert (=> d!54343 d!54355))

(declare-fun d!54357 () Bool)

(assert (=> d!54357 (= (remainingBits!0 ((_ sign_extend 32) (size!3504 (buf!3962 thiss!1602))) ((_ sign_extend 32) (currentByte!7293 thiss!1602)) ((_ sign_extend 32) (currentBit!7288 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3504 (buf!3962 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7293 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7288 thiss!1602)))))))

(assert (=> d!54339 d!54357))

(push 1)

(check-sat)

(pop 1)

