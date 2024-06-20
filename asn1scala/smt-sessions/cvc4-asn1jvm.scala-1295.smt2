; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36890 () Bool)

(assert start!36890)

(declare-fun res!140305 () Bool)

(declare-fun e!117184 () Bool)

(assert (=> start!36890 (=> (not res!140305) (not e!117184))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36890 (= res!140305 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36890 e!117184))

(assert (=> start!36890 true))

(declare-datatypes ((array!8797 0))(
  ( (array!8798 (arr!4821 (Array (_ BitVec 32) (_ BitVec 8))) (size!3900 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6956 0))(
  ( (BitStream!6957 (buf!4352 array!8797) (currentByte!8264 (_ BitVec 32)) (currentBit!8259 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6956)

(declare-fun e!117186 () Bool)

(declare-fun inv!12 (BitStream!6956) Bool)

(assert (=> start!36890 (and (inv!12 thiss!1894) e!117186)))

(declare-fun b!168625 () Bool)

(declare-fun res!140306 () Bool)

(assert (=> b!168625 (=> (not res!140306) (not e!117184))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168625 (= res!140306 (validate_offset_bits!1 ((_ sign_extend 32) (size!3900 (buf!4352 thiss!1894))) ((_ sign_extend 32) (currentByte!8264 thiss!1894)) ((_ sign_extend 32) (currentBit!8259 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168626 () Bool)

(assert (=> b!168626 (= e!117184 (and (bvsle (bvadd (currentBit!8259 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsle (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8259 thiss!1894) nBits!600)) #b00000000000000000000000000100000) (or (bvslt (currentByte!8264 thiss!1894) #b00000000000000000000000000000000) (bvsge (currentByte!8264 thiss!1894) (size!3900 (buf!4352 thiss!1894))))))))

(declare-fun b!168627 () Bool)

(declare-fun array_inv!3641 (array!8797) Bool)

(assert (=> b!168627 (= e!117186 (array_inv!3641 (buf!4352 thiss!1894)))))

(assert (= (and start!36890 res!140305) b!168625))

(assert (= (and b!168625 res!140306) b!168626))

(assert (= start!36890 b!168627))

(declare-fun m!268215 () Bool)

(assert (=> start!36890 m!268215))

(declare-fun m!268217 () Bool)

(assert (=> b!168625 m!268217))

(declare-fun m!268219 () Bool)

(assert (=> b!168627 m!268219))

(push 1)

(assert (not b!168627))

(assert (not b!168625))

(assert (not start!36890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59485 () Bool)

(assert (=> d!59485 (= (array_inv!3641 (buf!4352 thiss!1894)) (bvsge (size!3900 (buf!4352 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168627 d!59485))

(declare-fun d!59487 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59487 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3900 (buf!4352 thiss!1894))) ((_ sign_extend 32) (currentByte!8264 thiss!1894)) ((_ sign_extend 32) (currentBit!8259 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3900 (buf!4352 thiss!1894))) ((_ sign_extend 32) (currentByte!8264 thiss!1894)) ((_ sign_extend 32) (currentBit!8259 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14734 () Bool)

(assert (= bs!14734 d!59487))

(declare-fun m!268229 () Bool)

(assert (=> bs!14734 m!268229))

(assert (=> b!168625 d!59487))

(declare-fun d!59489 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59489 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8259 thiss!1894) (currentByte!8264 thiss!1894) (size!3900 (buf!4352 thiss!1894))))))

(declare-fun bs!14735 () Bool)

(assert (= bs!14735 d!59489))

(declare-fun m!268231 () Bool)

(assert (=> bs!14735 m!268231))

(assert (=> start!36890 d!59489))

(push 1)

(assert (not d!59487))

(assert (not d!59489))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59495 () Bool)

(assert (=> d!59495 (= (remainingBits!0 ((_ sign_extend 32) (size!3900 (buf!4352 thiss!1894))) ((_ sign_extend 32) (currentByte!8264 thiss!1894)) ((_ sign_extend 32) (currentBit!8259 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3900 (buf!4352 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8264 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8259 thiss!1894)))))))

(assert (=> d!59487 d!59495))

(declare-fun d!59497 () Bool)

(assert (=> d!59497 (= (invariant!0 (currentBit!8259 thiss!1894) (currentByte!8264 thiss!1894) (size!3900 (buf!4352 thiss!1894))) (and (bvsge (currentBit!8259 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8259 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8264 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8264 thiss!1894) (size!3900 (buf!4352 thiss!1894))) (and (= (currentBit!8259 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8264 thiss!1894) (size!3900 (buf!4352 thiss!1894)))))))))

(assert (=> d!59489 d!59497))

(push 1)

(check-sat)

(pop 1)

