; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35820 () Bool)

(assert start!35820)

(declare-fun res!138634 () Bool)

(declare-fun e!115353 () Bool)

(assert (=> start!35820 (=> (not res!138634) (not e!115353))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35820 (= res!138634 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35820 e!115353))

(assert (=> start!35820 true))

(declare-datatypes ((array!8527 0))(
  ( (array!8528 (arr!4719 (Array (_ BitVec 32) (_ BitVec 8))) (size!3798 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6752 0))(
  ( (BitStream!6753 (buf!4250 array!8527) (currentByte!8006 (_ BitVec 32)) (currentBit!8001 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6752)

(declare-fun e!115351 () Bool)

(declare-fun inv!12 (BitStream!6752) Bool)

(assert (=> start!35820 (and (inv!12 thiss!1577) e!115351)))

(declare-fun b!166501 () Bool)

(declare-fun res!138635 () Bool)

(assert (=> b!166501 (=> (not res!138635) (not e!115353))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166501 (= res!138635 (validate_offset_bits!1 ((_ sign_extend 32) (size!3798 (buf!4250 thiss!1577))) ((_ sign_extend 32) (currentByte!8006 thiss!1577)) ((_ sign_extend 32) (currentBit!8001 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166502 () Bool)

(assert (=> b!166502 (= e!115353 (and (bvsgt (bvadd (currentBit!8001 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8006 thiss!1577)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8006 thiss!1577)) (size!3798 (buf!4250 thiss!1577))))))))

(declare-fun b!166503 () Bool)

(declare-fun array_inv!3539 (array!8527) Bool)

(assert (=> b!166503 (= e!115351 (array_inv!3539 (buf!4250 thiss!1577)))))

(assert (= (and start!35820 res!138634) b!166501))

(assert (= (and b!166501 res!138635) b!166502))

(assert (= start!35820 b!166503))

(declare-fun m!264517 () Bool)

(assert (=> start!35820 m!264517))

(declare-fun m!264519 () Bool)

(assert (=> b!166501 m!264519))

(declare-fun m!264521 () Bool)

(assert (=> b!166503 m!264521))

(push 1)

(assert (not b!166503))

(assert (not b!166501))

(assert (not start!35820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58087 () Bool)

(assert (=> d!58087 (= (array_inv!3539 (buf!4250 thiss!1577)) (bvsge (size!3798 (buf!4250 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166503 d!58087))

(declare-fun d!58089 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58089 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3798 (buf!4250 thiss!1577))) ((_ sign_extend 32) (currentByte!8006 thiss!1577)) ((_ sign_extend 32) (currentBit!8001 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3798 (buf!4250 thiss!1577))) ((_ sign_extend 32) (currentByte!8006 thiss!1577)) ((_ sign_extend 32) (currentBit!8001 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14411 () Bool)

(assert (= bs!14411 d!58089))

(declare-fun m!264531 () Bool)

(assert (=> bs!14411 m!264531))

(assert (=> b!166501 d!58089))

(declare-fun d!58091 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58091 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8001 thiss!1577) (currentByte!8006 thiss!1577) (size!3798 (buf!4250 thiss!1577))))))

(declare-fun bs!14412 () Bool)

(assert (= bs!14412 d!58091))

(declare-fun m!264533 () Bool)

(assert (=> bs!14412 m!264533))

(assert (=> start!35820 d!58091))

(push 1)

(assert (not d!58091))

(assert (not d!58089))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58097 () Bool)

(assert (=> d!58097 (= (invariant!0 (currentBit!8001 thiss!1577) (currentByte!8006 thiss!1577) (size!3798 (buf!4250 thiss!1577))) (and (bvsge (currentBit!8001 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8001 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8006 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8006 thiss!1577) (size!3798 (buf!4250 thiss!1577))) (and (= (currentBit!8001 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8006 thiss!1577) (size!3798 (buf!4250 thiss!1577)))))))))

(assert (=> d!58091 d!58097))

(declare-fun d!58099 () Bool)

(assert (=> d!58099 (= (remainingBits!0 ((_ sign_extend 32) (size!3798 (buf!4250 thiss!1577))) ((_ sign_extend 32) (currentByte!8006 thiss!1577)) ((_ sign_extend 32) (currentBit!8001 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3798 (buf!4250 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8006 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8001 thiss!1577)))))))

(assert (=> d!58089 d!58099))

(push 1)

(check-sat)

(pop 1)

