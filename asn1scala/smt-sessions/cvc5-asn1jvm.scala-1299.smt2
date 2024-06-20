; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36970 () Bool)

(assert start!36970)

(declare-fun res!140366 () Bool)

(declare-fun e!117276 () Bool)

(assert (=> start!36970 (=> (not res!140366) (not e!117276))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36970 (= res!140366 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36970 e!117276))

(assert (=> start!36970 true))

(declare-datatypes ((array!8823 0))(
  ( (array!8824 (arr!4831 (Array (_ BitVec 32) (_ BitVec 8))) (size!3910 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6976 0))(
  ( (BitStream!6977 (buf!4362 array!8823) (currentByte!8292 (_ BitVec 32)) (currentBit!8287 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6976)

(declare-fun e!117274 () Bool)

(declare-fun inv!12 (BitStream!6976) Bool)

(assert (=> start!36970 (and (inv!12 thiss!1894) e!117274)))

(declare-fun b!168715 () Bool)

(declare-fun res!140365 () Bool)

(assert (=> b!168715 (=> (not res!140365) (not e!117276))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168715 (= res!140365 (validate_offset_bits!1 ((_ sign_extend 32) (size!3910 (buf!4362 thiss!1894))) ((_ sign_extend 32) (currentByte!8292 thiss!1894)) ((_ sign_extend 32) (currentBit!8287 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168716 () Bool)

(assert (=> b!168716 (= e!117276 (and (bvsgt (bvadd (currentBit!8287 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsle (bvsub (bvadd (currentBit!8287 thiss!1894) nBits!600) #b00000000000000000000000000001000) #b00000000000000000000000000100000) (or (bvslt (currentByte!8292 thiss!1894) #b00000000000000000000000000000000) (bvsge (currentByte!8292 thiss!1894) (size!3910 (buf!4362 thiss!1894))))))))

(declare-fun b!168717 () Bool)

(declare-fun array_inv!3651 (array!8823) Bool)

(assert (=> b!168717 (= e!117274 (array_inv!3651 (buf!4362 thiss!1894)))))

(assert (= (and start!36970 res!140366) b!168715))

(assert (= (and b!168715 res!140365) b!168716))

(assert (= start!36970 b!168717))

(declare-fun m!268299 () Bool)

(assert (=> start!36970 m!268299))

(declare-fun m!268301 () Bool)

(assert (=> b!168715 m!268301))

(declare-fun m!268303 () Bool)

(assert (=> b!168717 m!268303))

(push 1)

(assert (not start!36970))

(assert (not b!168715))

(assert (not b!168717))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59543 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59543 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8287 thiss!1894) (currentByte!8292 thiss!1894) (size!3910 (buf!4362 thiss!1894))))))

(declare-fun bs!14756 () Bool)

(assert (= bs!14756 d!59543))

(declare-fun m!268321 () Bool)

(assert (=> bs!14756 m!268321))

(assert (=> start!36970 d!59543))

(declare-fun d!59545 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59545 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3910 (buf!4362 thiss!1894))) ((_ sign_extend 32) (currentByte!8292 thiss!1894)) ((_ sign_extend 32) (currentBit!8287 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3910 (buf!4362 thiss!1894))) ((_ sign_extend 32) (currentByte!8292 thiss!1894)) ((_ sign_extend 32) (currentBit!8287 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14757 () Bool)

(assert (= bs!14757 d!59545))

(declare-fun m!268323 () Bool)

(assert (=> bs!14757 m!268323))

(assert (=> b!168715 d!59545))

(declare-fun d!59547 () Bool)

(assert (=> d!59547 (= (array_inv!3651 (buf!4362 thiss!1894)) (bvsge (size!3910 (buf!4362 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168717 d!59547))

(push 1)

(assert (not d!59543))

(assert (not d!59545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59559 () Bool)

(assert (=> d!59559 (= (invariant!0 (currentBit!8287 thiss!1894) (currentByte!8292 thiss!1894) (size!3910 (buf!4362 thiss!1894))) (and (bvsge (currentBit!8287 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8287 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8292 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8292 thiss!1894) (size!3910 (buf!4362 thiss!1894))) (and (= (currentBit!8287 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8292 thiss!1894) (size!3910 (buf!4362 thiss!1894)))))))))

(assert (=> d!59543 d!59559))

(declare-fun d!59561 () Bool)

(assert (=> d!59561 (= (remainingBits!0 ((_ sign_extend 32) (size!3910 (buf!4362 thiss!1894))) ((_ sign_extend 32) (currentByte!8292 thiss!1894)) ((_ sign_extend 32) (currentBit!8287 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3910 (buf!4362 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8292 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8287 thiss!1894)))))))

(assert (=> d!59545 d!59561))

(push 1)

(check-sat)

