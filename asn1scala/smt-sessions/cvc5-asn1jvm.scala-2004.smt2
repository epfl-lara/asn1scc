; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51264 () Bool)

(assert start!51264)

(declare-fun res!199830 () Bool)

(declare-fun e!165327 () Bool)

(assert (=> start!51264 (=> (not res!199830) (not e!165327))))

(declare-datatypes ((array!12823 0))(
  ( (array!12824 (arr!6619 (Array (_ BitVec 32) (_ BitVec 8))) (size!5632 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10186 0))(
  ( (BitStream!10187 (buf!6086 array!12823) (currentByte!11283 (_ BitVec 32)) (currentBit!11278 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10186)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51264 (= res!199830 (validate_offset_byte!0 ((_ sign_extend 32) (size!5632 (buf!6086 thiss!1857))) ((_ sign_extend 32) (currentByte!11283 thiss!1857)) ((_ sign_extend 32) (currentBit!11278 thiss!1857))))))

(assert (=> start!51264 e!165327))

(declare-fun e!165328 () Bool)

(declare-fun inv!12 (BitStream!10186) Bool)

(assert (=> start!51264 (and (inv!12 thiss!1857) e!165328)))

(declare-fun b!239134 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!239134 (= e!165327 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5632 (buf!6086 thiss!1857))) ((_ sign_extend 32) (currentByte!11283 thiss!1857)) ((_ sign_extend 32) (currentBit!11278 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!239135 () Bool)

(declare-fun array_inv!5373 (array!12823) Bool)

(assert (=> b!239135 (= e!165328 (array_inv!5373 (buf!6086 thiss!1857)))))

(assert (= (and start!51264 res!199830) b!239134))

(assert (= start!51264 b!239135))

(declare-fun m!361167 () Bool)

(assert (=> start!51264 m!361167))

(declare-fun m!361169 () Bool)

(assert (=> start!51264 m!361169))

(declare-fun m!361171 () Bool)

(assert (=> b!239134 m!361171))

(declare-fun m!361173 () Bool)

(assert (=> b!239135 m!361173))

(push 1)

(assert (not b!239134))

(assert (not b!239135))

(assert (not start!51264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80444 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80444 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5632 (buf!6086 thiss!1857))) ((_ sign_extend 32) (currentByte!11283 thiss!1857)) ((_ sign_extend 32) (currentBit!11278 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5632 (buf!6086 thiss!1857))) ((_ sign_extend 32) (currentByte!11283 thiss!1857)) ((_ sign_extend 32) (currentBit!11278 thiss!1857))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20213 () Bool)

(assert (= bs!20213 d!80444))

(declare-fun m!361191 () Bool)

(assert (=> bs!20213 m!361191))

(assert (=> b!239134 d!80444))

(declare-fun d!80448 () Bool)

(assert (=> d!80448 (= (array_inv!5373 (buf!6086 thiss!1857)) (bvsge (size!5632 (buf!6086 thiss!1857)) #b00000000000000000000000000000000))))

(assert (=> b!239135 d!80448))

(declare-fun d!80452 () Bool)

(assert (=> d!80452 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!5632 (buf!6086 thiss!1857))) ((_ sign_extend 32) (currentByte!11283 thiss!1857)) ((_ sign_extend 32) (currentBit!11278 thiss!1857))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5632 (buf!6086 thiss!1857))) ((_ sign_extend 32) (currentByte!11283 thiss!1857)) ((_ sign_extend 32) (currentBit!11278 thiss!1857))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20215 () Bool)

(assert (= bs!20215 d!80452))

(assert (=> bs!20215 m!361191))

(assert (=> start!51264 d!80452))

(declare-fun d!80456 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80456 (= (inv!12 thiss!1857) (invariant!0 (currentBit!11278 thiss!1857) (currentByte!11283 thiss!1857) (size!5632 (buf!6086 thiss!1857))))))

(declare-fun bs!20217 () Bool)

(assert (= bs!20217 d!80456))

(declare-fun m!361195 () Bool)

(assert (=> bs!20217 m!361195))

(assert (=> start!51264 d!80456))

(push 1)

(assert (not d!80456))

(assert (not d!80452))

(assert (not d!80444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

