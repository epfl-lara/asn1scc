; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36814 () Bool)

(assert start!36814)

(declare-fun res!140258 () Bool)

(declare-fun e!117114 () Bool)

(assert (=> start!36814 (=> (not res!140258) (not e!117114))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36814 (= res!140258 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36814 e!117114))

(assert (=> start!36814 true))

(declare-datatypes ((array!8775 0))(
  ( (array!8776 (arr!4813 (Array (_ BitVec 32) (_ BitVec 8))) (size!3892 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6940 0))(
  ( (BitStream!6941 (buf!4344 array!8775) (currentByte!8238 (_ BitVec 32)) (currentBit!8233 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6940)

(declare-fun e!117112 () Bool)

(declare-fun inv!12 (BitStream!6940) Bool)

(assert (=> start!36814 (and (inv!12 thiss!1894) e!117112)))

(declare-fun b!168553 () Bool)

(declare-fun res!140257 () Bool)

(assert (=> b!168553 (=> (not res!140257) (not e!117114))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168553 (= res!140257 (validate_offset_bits!1 ((_ sign_extend 32) (size!3892 (buf!4344 thiss!1894))) ((_ sign_extend 32) (currentByte!8238 thiss!1894)) ((_ sign_extend 32) (currentBit!8233 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168554 () Bool)

(assert (=> b!168554 (= e!117114 (and (= (bvand (currentBit!8233 thiss!1894) #b10000000000000000000000000000000) (bvand nBits!600 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!8233 thiss!1894) #b10000000000000000000000000000000) (bvand (bvadd (currentBit!8233 thiss!1894) nBits!600) #b10000000000000000000000000000000)))))))

(declare-fun b!168555 () Bool)

(declare-fun array_inv!3633 (array!8775) Bool)

(assert (=> b!168555 (= e!117112 (array_inv!3633 (buf!4344 thiss!1894)))))

(assert (= (and start!36814 res!140258) b!168553))

(assert (= (and b!168553 res!140257) b!168554))

(assert (= start!36814 b!168555))

(declare-fun m!268143 () Bool)

(assert (=> start!36814 m!268143))

(declare-fun m!268145 () Bool)

(assert (=> b!168553 m!268145))

(declare-fun m!268147 () Bool)

(assert (=> b!168555 m!268147))

(push 1)

(assert (not b!168553))

(assert (not start!36814))

(assert (not b!168555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59405 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59405 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3892 (buf!4344 thiss!1894))) ((_ sign_extend 32) (currentByte!8238 thiss!1894)) ((_ sign_extend 32) (currentBit!8233 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3892 (buf!4344 thiss!1894))) ((_ sign_extend 32) (currentByte!8238 thiss!1894)) ((_ sign_extend 32) (currentBit!8233 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14712 () Bool)

(assert (= bs!14712 d!59405))

(declare-fun m!268161 () Bool)

(assert (=> bs!14712 m!268161))

(assert (=> b!168553 d!59405))

(declare-fun d!59407 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59407 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8233 thiss!1894) (currentByte!8238 thiss!1894) (size!3892 (buf!4344 thiss!1894))))))

(declare-fun bs!14713 () Bool)

(assert (= bs!14713 d!59407))

(declare-fun m!268163 () Bool)

(assert (=> bs!14713 m!268163))

(assert (=> start!36814 d!59407))

(declare-fun d!59411 () Bool)

(assert (=> d!59411 (= (array_inv!3633 (buf!4344 thiss!1894)) (bvsge (size!3892 (buf!4344 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168555 d!59411))

(push 1)

(assert (not d!59407))

(assert (not d!59405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59425 () Bool)

(assert (=> d!59425 (= (invariant!0 (currentBit!8233 thiss!1894) (currentByte!8238 thiss!1894) (size!3892 (buf!4344 thiss!1894))) (and (bvsge (currentBit!8233 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8233 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8238 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8238 thiss!1894) (size!3892 (buf!4344 thiss!1894))) (and (= (currentBit!8233 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8238 thiss!1894) (size!3892 (buf!4344 thiss!1894)))))))))

(assert (=> d!59407 d!59425))

(declare-fun d!59429 () Bool)

(assert (=> d!59429 (= (remainingBits!0 ((_ sign_extend 32) (size!3892 (buf!4344 thiss!1894))) ((_ sign_extend 32) (currentByte!8238 thiss!1894)) ((_ sign_extend 32) (currentBit!8233 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3892 (buf!4344 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8238 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8233 thiss!1894)))))))

(assert (=> d!59405 d!59429))

(push 1)

(check-sat)

