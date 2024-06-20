; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37006 () Bool)

(assert start!37006)

(declare-fun res!140403 () Bool)

(declare-fun e!117320 () Bool)

(assert (=> start!37006 (=> (not res!140403) (not e!117320))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37006 (= res!140403 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37006 e!117320))

(assert (=> start!37006 true))

(declare-datatypes ((array!8836 0))(
  ( (array!8837 (arr!4836 (Array (_ BitVec 32) (_ BitVec 8))) (size!3915 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6986 0))(
  ( (BitStream!6987 (buf!4367 array!8836) (currentByte!8304 (_ BitVec 32)) (currentBit!8299 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6986)

(declare-fun e!117319 () Bool)

(declare-fun inv!12 (BitStream!6986) Bool)

(assert (=> start!37006 (and (inv!12 thiss!1894) e!117319)))

(declare-fun b!168768 () Bool)

(declare-fun res!140405 () Bool)

(assert (=> b!168768 (=> (not res!140405) (not e!117320))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168768 (= res!140405 (validate_offset_bits!1 ((_ sign_extend 32) (size!3915 (buf!4367 thiss!1894))) ((_ sign_extend 32) (currentByte!8304 thiss!1894)) ((_ sign_extend 32) (currentBit!8299 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168769 () Bool)

(declare-fun res!140404 () Bool)

(assert (=> b!168769 (=> (not res!140404) (not e!117320))))

(assert (=> b!168769 (= res!140404 (bvsgt (bvadd (currentBit!8299 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168771 () Bool)

(declare-fun array_inv!3656 (array!8836) Bool)

(assert (=> b!168771 (= e!117319 (array_inv!3656 (buf!4367 thiss!1894)))))

(declare-fun b!168770 () Bool)

(assert (=> b!168770 (= e!117320 (not (inv!12 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894)))))))

(assert (= (and start!37006 res!140403) b!168768))

(assert (= (and b!168768 res!140405) b!168769))

(assert (= (and b!168769 res!140404) b!168770))

(assert (= start!37006 b!168771))

(declare-fun m!268345 () Bool)

(assert (=> start!37006 m!268345))

(declare-fun m!268347 () Bool)

(assert (=> b!168768 m!268347))

(declare-fun m!268349 () Bool)

(assert (=> b!168771 m!268349))

(declare-fun m!268351 () Bool)

(assert (=> b!168770 m!268351))

(push 1)

(assert (not b!168768))

(assert (not start!37006))

(assert (not b!168770))

(assert (not b!168771))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59577 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59577 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3915 (buf!4367 thiss!1894))) ((_ sign_extend 32) (currentByte!8304 thiss!1894)) ((_ sign_extend 32) (currentBit!8299 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3915 (buf!4367 thiss!1894))) ((_ sign_extend 32) (currentByte!8304 thiss!1894)) ((_ sign_extend 32) (currentBit!8299 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14768 () Bool)

(assert (= bs!14768 d!59577))

(declare-fun m!268363 () Bool)

(assert (=> bs!14768 m!268363))

(assert (=> b!168768 d!59577))

(declare-fun d!59583 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59583 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8299 thiss!1894) (currentByte!8304 thiss!1894) (size!3915 (buf!4367 thiss!1894))))))

(declare-fun bs!14770 () Bool)

(assert (= bs!14770 d!59583))

(declare-fun m!268367 () Bool)

(assert (=> bs!14770 m!268367))

(assert (=> start!37006 d!59583))

(declare-fun d!59585 () Bool)

(assert (=> d!59585 (= (inv!12 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) (invariant!0 (currentBit!8299 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) (currentByte!8304 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) (size!3915 (buf!4367 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))))))))

(declare-fun bs!14771 () Bool)

(assert (= bs!14771 d!59585))

(declare-fun m!268369 () Bool)

(assert (=> bs!14771 m!268369))

(assert (=> b!168770 d!59585))

(declare-fun d!59587 () Bool)

(assert (=> d!59587 (= (array_inv!3656 (buf!4367 thiss!1894)) (bvsge (size!3915 (buf!4367 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168771 d!59587))

(push 1)

(assert (not d!59577))

(assert (not d!59583))

(assert (not d!59585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59601 () Bool)

(assert (=> d!59601 (= (remainingBits!0 ((_ sign_extend 32) (size!3915 (buf!4367 thiss!1894))) ((_ sign_extend 32) (currentByte!8304 thiss!1894)) ((_ sign_extend 32) (currentBit!8299 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3915 (buf!4367 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8304 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8299 thiss!1894)))))))

(assert (=> d!59577 d!59601))

(declare-fun d!59603 () Bool)

(assert (=> d!59603 (= (invariant!0 (currentBit!8299 thiss!1894) (currentByte!8304 thiss!1894) (size!3915 (buf!4367 thiss!1894))) (and (bvsge (currentBit!8299 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8299 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8304 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8304 thiss!1894) (size!3915 (buf!4367 thiss!1894))) (and (= (currentBit!8299 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8304 thiss!1894) (size!3915 (buf!4367 thiss!1894)))))))))

(assert (=> d!59583 d!59603))

(declare-fun d!59605 () Bool)

(assert (=> d!59605 (= (invariant!0 (currentBit!8299 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) (currentByte!8304 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) (size!3915 (buf!4367 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))))) (and (bvsge (currentBit!8299 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) #b00000000000000000000000000000000) (bvslt (currentBit!8299 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) #b00000000000000000000000000001000) (bvsge (currentByte!8304 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) #b00000000000000000000000000000000) (or (bvslt (currentByte!8304 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) (size!3915 (buf!4367 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))))) (and (= (currentBit!8299 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) #b00000000000000000000000000000000) (= (currentByte!8304 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894))) (size!3915 (buf!4367 (BitStream!6987 (buf!4367 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8304 thiss!1894)) (currentBit!8299 thiss!1894)))))))))))

(assert (=> d!59585 d!59605))

(push 1)

(check-sat)

(pop 1)

