; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36934 () Bool)

(assert start!36934)

(declare-fun res!140347 () Bool)

(declare-fun e!117247 () Bool)

(assert (=> start!36934 (=> (not res!140347) (not e!117247))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36934 (= res!140347 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36934 e!117247))

(assert (=> start!36934 true))

(declare-datatypes ((array!8814 0))(
  ( (array!8815 (arr!4828 (Array (_ BitVec 32) (_ BitVec 8))) (size!3907 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6970 0))(
  ( (BitStream!6971 (buf!4359 array!8814) (currentByte!8280 (_ BitVec 32)) (currentBit!8275 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6970)

(declare-fun e!117249 () Bool)

(declare-fun inv!12 (BitStream!6970) Bool)

(assert (=> start!36934 (and (inv!12 thiss!1894) e!117249)))

(declare-fun b!168688 () Bool)

(declare-fun res!140348 () Bool)

(assert (=> b!168688 (=> (not res!140348) (not e!117247))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168688 (= res!140348 (validate_offset_bits!1 ((_ sign_extend 32) (size!3907 (buf!4359 thiss!1894))) ((_ sign_extend 32) (currentByte!8280 thiss!1894)) ((_ sign_extend 32) (currentBit!8275 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168689 () Bool)

(assert (=> b!168689 (= e!117247 (and (bvsgt (bvadd (currentBit!8275 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsgt (bvsub (bvadd (currentBit!8275 thiss!1894) nBits!600) #b00000000000000000000000000001000) #b00000000000000000000000000100000)))))

(declare-fun b!168690 () Bool)

(declare-fun array_inv!3648 (array!8814) Bool)

(assert (=> b!168690 (= e!117249 (array_inv!3648 (buf!4359 thiss!1894)))))

(assert (= (and start!36934 res!140347) b!168688))

(assert (= (and b!168688 res!140348) b!168689))

(assert (= start!36934 b!168690))

(declare-fun m!268269 () Bool)

(assert (=> start!36934 m!268269))

(declare-fun m!268271 () Bool)

(assert (=> b!168688 m!268271))

(declare-fun m!268273 () Bool)

(assert (=> b!168690 m!268273))

(push 1)

(assert (not start!36934))

(assert (not b!168688))

(assert (not b!168690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59509 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59509 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8275 thiss!1894) (currentByte!8280 thiss!1894) (size!3907 (buf!4359 thiss!1894))))))

(declare-fun bs!14747 () Bool)

(assert (= bs!14747 d!59509))

(declare-fun m!268291 () Bool)

(assert (=> bs!14747 m!268291))

(assert (=> start!36934 d!59509))

(declare-fun d!59513 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59513 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3907 (buf!4359 thiss!1894))) ((_ sign_extend 32) (currentByte!8280 thiss!1894)) ((_ sign_extend 32) (currentBit!8275 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3907 (buf!4359 thiss!1894))) ((_ sign_extend 32) (currentByte!8280 thiss!1894)) ((_ sign_extend 32) (currentBit!8275 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14748 () Bool)

(assert (= bs!14748 d!59513))

(declare-fun m!268293 () Bool)

(assert (=> bs!14748 m!268293))

(assert (=> b!168688 d!59513))

(declare-fun d!59517 () Bool)

(assert (=> d!59517 (= (array_inv!3648 (buf!4359 thiss!1894)) (bvsge (size!3907 (buf!4359 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168690 d!59517))

(push 1)

(assert (not d!59509))

(assert (not d!59513))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59527 () Bool)

(assert (=> d!59527 (= (invariant!0 (currentBit!8275 thiss!1894) (currentByte!8280 thiss!1894) (size!3907 (buf!4359 thiss!1894))) (and (bvsge (currentBit!8275 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8275 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8280 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8280 thiss!1894) (size!3907 (buf!4359 thiss!1894))) (and (= (currentBit!8275 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8280 thiss!1894) (size!3907 (buf!4359 thiss!1894)))))))))

(assert (=> d!59509 d!59527))

(declare-fun d!59529 () Bool)

(assert (=> d!59529 (= (remainingBits!0 ((_ sign_extend 32) (size!3907 (buf!4359 thiss!1894))) ((_ sign_extend 32) (currentByte!8280 thiss!1894)) ((_ sign_extend 32) (currentBit!8275 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3907 (buf!4359 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8280 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8275 thiss!1894)))))))

(assert (=> d!59513 d!59529))

(push 1)

(check-sat)

