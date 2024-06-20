; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36818 () Bool)

(assert start!36818)

(declare-fun res!140270 () Bool)

(declare-fun e!117132 () Bool)

(assert (=> start!36818 (=> (not res!140270) (not e!117132))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36818 (= res!140270 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36818 e!117132))

(assert (=> start!36818 true))

(declare-datatypes ((array!8779 0))(
  ( (array!8780 (arr!4815 (Array (_ BitVec 32) (_ BitVec 8))) (size!3894 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6944 0))(
  ( (BitStream!6945 (buf!4346 array!8779) (currentByte!8240 (_ BitVec 32)) (currentBit!8235 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6944)

(declare-fun e!117131 () Bool)

(declare-fun inv!12 (BitStream!6944) Bool)

(assert (=> start!36818 (and (inv!12 thiss!1894) e!117131)))

(declare-fun b!168571 () Bool)

(declare-fun res!140269 () Bool)

(assert (=> b!168571 (=> (not res!140269) (not e!117132))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168571 (= res!140269 (validate_offset_bits!1 ((_ sign_extend 32) (size!3894 (buf!4346 thiss!1894))) ((_ sign_extend 32) (currentByte!8240 thiss!1894)) ((_ sign_extend 32) (currentBit!8235 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168572 () Bool)

(assert (=> b!168572 (= e!117132 (and (= (bvand (currentBit!8235 thiss!1894) #b10000000000000000000000000000000) (bvand nBits!600 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!8235 thiss!1894) #b10000000000000000000000000000000) (bvand (bvadd (currentBit!8235 thiss!1894) nBits!600) #b10000000000000000000000000000000)))))))

(declare-fun b!168573 () Bool)

(declare-fun array_inv!3635 (array!8779) Bool)

(assert (=> b!168573 (= e!117131 (array_inv!3635 (buf!4346 thiss!1894)))))

(assert (= (and start!36818 res!140270) b!168571))

(assert (= (and b!168571 res!140269) b!168572))

(assert (= start!36818 b!168573))

(declare-fun m!268155 () Bool)

(assert (=> start!36818 m!268155))

(declare-fun m!268157 () Bool)

(assert (=> b!168571 m!268157))

(declare-fun m!268159 () Bool)

(assert (=> b!168573 m!268159))

(push 1)

(assert (not b!168571))

(assert (not start!36818))

(assert (not b!168573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59417 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59417 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3894 (buf!4346 thiss!1894))) ((_ sign_extend 32) (currentByte!8240 thiss!1894)) ((_ sign_extend 32) (currentBit!8235 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3894 (buf!4346 thiss!1894))) ((_ sign_extend 32) (currentByte!8240 thiss!1894)) ((_ sign_extend 32) (currentBit!8235 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14716 () Bool)

(assert (= bs!14716 d!59417))

(declare-fun m!268169 () Bool)

(assert (=> bs!14716 m!268169))

(assert (=> b!168571 d!59417))

(declare-fun d!59419 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59419 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8235 thiss!1894) (currentByte!8240 thiss!1894) (size!3894 (buf!4346 thiss!1894))))))

(declare-fun bs!14717 () Bool)

(assert (= bs!14717 d!59419))

(declare-fun m!268171 () Bool)

(assert (=> bs!14717 m!268171))

(assert (=> start!36818 d!59419))

(declare-fun d!59421 () Bool)

(assert (=> d!59421 (= (array_inv!3635 (buf!4346 thiss!1894)) (bvsge (size!3894 (buf!4346 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168573 d!59421))

(push 1)

(assert (not d!59419))

(assert (not d!59417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59431 () Bool)

(assert (=> d!59431 (= (invariant!0 (currentBit!8235 thiss!1894) (currentByte!8240 thiss!1894) (size!3894 (buf!4346 thiss!1894))) (and (bvsge (currentBit!8235 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8235 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8240 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8240 thiss!1894) (size!3894 (buf!4346 thiss!1894))) (and (= (currentBit!8235 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8240 thiss!1894) (size!3894 (buf!4346 thiss!1894)))))))))

(assert (=> d!59419 d!59431))

(declare-fun d!59433 () Bool)

(assert (=> d!59433 (= (remainingBits!0 ((_ sign_extend 32) (size!3894 (buf!4346 thiss!1894))) ((_ sign_extend 32) (currentByte!8240 thiss!1894)) ((_ sign_extend 32) (currentBit!8235 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3894 (buf!4346 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8240 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8235 thiss!1894)))))))

(assert (=> d!59417 d!59433))

(push 1)

(check-sat)

