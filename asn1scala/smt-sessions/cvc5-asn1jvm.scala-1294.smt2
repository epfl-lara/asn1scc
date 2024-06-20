; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36850 () Bool)

(assert start!36850)

(declare-fun res!140276 () Bool)

(declare-fun e!117140 () Bool)

(assert (=> start!36850 (=> (not res!140276) (not e!117140))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36850 (= res!140276 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36850 e!117140))

(assert (=> start!36850 true))

(declare-datatypes ((array!8784 0))(
  ( (array!8785 (arr!4816 (Array (_ BitVec 32) (_ BitVec 8))) (size!3895 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6946 0))(
  ( (BitStream!6947 (buf!4347 array!8784) (currentByte!8250 (_ BitVec 32)) (currentBit!8245 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6946)

(declare-fun e!117141 () Bool)

(declare-fun inv!12 (BitStream!6946) Bool)

(assert (=> start!36850 (and (inv!12 thiss!1894) e!117141)))

(declare-fun b!168580 () Bool)

(declare-fun res!140275 () Bool)

(assert (=> b!168580 (=> (not res!140275) (not e!117140))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168580 (= res!140275 (validate_offset_bits!1 ((_ sign_extend 32) (size!3895 (buf!4347 thiss!1894))) ((_ sign_extend 32) (currentByte!8250 thiss!1894)) ((_ sign_extend 32) (currentBit!8245 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168581 () Bool)

(assert (=> b!168581 (= e!117140 (and (bvsle (bvadd (currentBit!8245 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8245 thiss!1894) nBits!600)) #b00000000000000000000000000100000)))))

(declare-fun b!168582 () Bool)

(declare-fun array_inv!3636 (array!8784) Bool)

(assert (=> b!168582 (= e!117141 (array_inv!3636 (buf!4347 thiss!1894)))))

(assert (= (and start!36850 res!140276) b!168580))

(assert (= (and b!168580 res!140275) b!168581))

(assert (= start!36850 b!168582))

(declare-fun m!268173 () Bool)

(assert (=> start!36850 m!268173))

(declare-fun m!268175 () Bool)

(assert (=> b!168580 m!268175))

(declare-fun m!268177 () Bool)

(assert (=> b!168582 m!268177))

(push 1)

(assert (not start!36850))

(assert (not b!168580))

(assert (not b!168582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59443 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59443 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8245 thiss!1894) (currentByte!8250 thiss!1894) (size!3895 (buf!4347 thiss!1894))))))

(declare-fun bs!14723 () Bool)

(assert (= bs!14723 d!59443))

(declare-fun m!268195 () Bool)

(assert (=> bs!14723 m!268195))

(assert (=> start!36850 d!59443))

(declare-fun d!59445 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59445 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3895 (buf!4347 thiss!1894))) ((_ sign_extend 32) (currentByte!8250 thiss!1894)) ((_ sign_extend 32) (currentBit!8245 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3895 (buf!4347 thiss!1894))) ((_ sign_extend 32) (currentByte!8250 thiss!1894)) ((_ sign_extend 32) (currentBit!8245 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14724 () Bool)

(assert (= bs!14724 d!59445))

(declare-fun m!268197 () Bool)

(assert (=> bs!14724 m!268197))

(assert (=> b!168580 d!59445))

(declare-fun d!59447 () Bool)

(assert (=> d!59447 (= (array_inv!3636 (buf!4347 thiss!1894)) (bvsge (size!3895 (buf!4347 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168582 d!59447))

(push 1)

(assert (not d!59443))

(assert (not d!59445))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59459 () Bool)

(assert (=> d!59459 (= (invariant!0 (currentBit!8245 thiss!1894) (currentByte!8250 thiss!1894) (size!3895 (buf!4347 thiss!1894))) (and (bvsge (currentBit!8245 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8245 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8250 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8250 thiss!1894) (size!3895 (buf!4347 thiss!1894))) (and (= (currentBit!8245 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8250 thiss!1894) (size!3895 (buf!4347 thiss!1894)))))))))

(assert (=> d!59443 d!59459))

(declare-fun d!59461 () Bool)

(assert (=> d!59461 (= (remainingBits!0 ((_ sign_extend 32) (size!3895 (buf!4347 thiss!1894))) ((_ sign_extend 32) (currentByte!8250 thiss!1894)) ((_ sign_extend 32) (currentBit!8245 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3895 (buf!4347 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8250 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8245 thiss!1894)))))))

(assert (=> d!59445 d!59461))

(push 1)

(check-sat)

