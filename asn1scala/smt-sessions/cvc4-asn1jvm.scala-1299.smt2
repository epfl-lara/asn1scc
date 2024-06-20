; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36974 () Bool)

(assert start!36974)

(declare-fun res!140377 () Bool)

(declare-fun e!117293 () Bool)

(assert (=> start!36974 (=> (not res!140377) (not e!117293))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36974 (= res!140377 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36974 e!117293))

(assert (=> start!36974 true))

(declare-datatypes ((array!8827 0))(
  ( (array!8828 (arr!4833 (Array (_ BitVec 32) (_ BitVec 8))) (size!3912 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6980 0))(
  ( (BitStream!6981 (buf!4364 array!8827) (currentByte!8294 (_ BitVec 32)) (currentBit!8289 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6980)

(declare-fun e!117292 () Bool)

(declare-fun inv!12 (BitStream!6980) Bool)

(assert (=> start!36974 (and (inv!12 thiss!1894) e!117292)))

(declare-fun b!168733 () Bool)

(declare-fun res!140378 () Bool)

(assert (=> b!168733 (=> (not res!140378) (not e!117293))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168733 (= res!140378 (validate_offset_bits!1 ((_ sign_extend 32) (size!3912 (buf!4364 thiss!1894))) ((_ sign_extend 32) (currentByte!8294 thiss!1894)) ((_ sign_extend 32) (currentBit!8289 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168734 () Bool)

(assert (=> b!168734 (= e!117293 (and (bvsgt (bvadd (currentBit!8289 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsle (bvsub (bvadd (currentBit!8289 thiss!1894) nBits!600) #b00000000000000000000000000001000) #b00000000000000000000000000100000) (or (bvslt (currentByte!8294 thiss!1894) #b00000000000000000000000000000000) (bvsge (currentByte!8294 thiss!1894) (size!3912 (buf!4364 thiss!1894))))))))

(declare-fun b!168735 () Bool)

(declare-fun array_inv!3653 (array!8827) Bool)

(assert (=> b!168735 (= e!117292 (array_inv!3653 (buf!4364 thiss!1894)))))

(assert (= (and start!36974 res!140377) b!168733))

(assert (= (and b!168733 res!140378) b!168734))

(assert (= start!36974 b!168735))

(declare-fun m!268311 () Bool)

(assert (=> start!36974 m!268311))

(declare-fun m!268313 () Bool)

(assert (=> b!168733 m!268313))

(declare-fun m!268315 () Bool)

(assert (=> b!168735 m!268315))

(push 1)

(assert (not b!168735))

(assert (not start!36974))

(assert (not b!168733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59553 () Bool)

(assert (=> d!59553 (= (array_inv!3653 (buf!4364 thiss!1894)) (bvsge (size!3912 (buf!4364 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168735 d!59553))

(declare-fun d!59555 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59555 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8289 thiss!1894) (currentByte!8294 thiss!1894) (size!3912 (buf!4364 thiss!1894))))))

(declare-fun bs!14758 () Bool)

(assert (= bs!14758 d!59555))

(declare-fun m!268325 () Bool)

(assert (=> bs!14758 m!268325))

(assert (=> start!36974 d!59555))

(declare-fun d!59557 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59557 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3912 (buf!4364 thiss!1894))) ((_ sign_extend 32) (currentByte!8294 thiss!1894)) ((_ sign_extend 32) (currentBit!8289 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3912 (buf!4364 thiss!1894))) ((_ sign_extend 32) (currentByte!8294 thiss!1894)) ((_ sign_extend 32) (currentBit!8289 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14759 () Bool)

(assert (= bs!14759 d!59557))

(declare-fun m!268327 () Bool)

(assert (=> bs!14759 m!268327))

(assert (=> b!168733 d!59557))

(push 1)

(assert (not d!59555))

(assert (not d!59557))

(check-sat)

(pop 1)

(push 1)

(check-sat)

