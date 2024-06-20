; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37002 () Bool)

(assert start!37002)

(declare-fun res!140387 () Bool)

(declare-fun e!117301 () Bool)

(assert (=> start!37002 (=> (not res!140387) (not e!117301))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37002 (= res!140387 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37002 e!117301))

(assert (=> start!37002 true))

(declare-datatypes ((array!8832 0))(
  ( (array!8833 (arr!4834 (Array (_ BitVec 32) (_ BitVec 8))) (size!3913 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6982 0))(
  ( (BitStream!6983 (buf!4365 array!8832) (currentByte!8302 (_ BitVec 32)) (currentBit!8297 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6982)

(declare-fun e!117303 () Bool)

(declare-fun inv!12 (BitStream!6982) Bool)

(assert (=> start!37002 (and (inv!12 thiss!1894) e!117303)))

(declare-fun b!168747 () Bool)

(declare-fun array_inv!3654 (array!8832) Bool)

(assert (=> b!168747 (= e!117303 (array_inv!3654 (buf!4365 thiss!1894)))))

(declare-fun b!168745 () Bool)

(declare-fun res!140385 () Bool)

(assert (=> b!168745 (=> (not res!140385) (not e!117301))))

(assert (=> b!168745 (= res!140385 (bvsgt (bvadd (currentBit!8297 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168746 () Bool)

(assert (=> b!168746 (= e!117301 (not (inv!12 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894)))))))

(declare-fun b!168744 () Bool)

(declare-fun res!140386 () Bool)

(assert (=> b!168744 (=> (not res!140386) (not e!117301))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168744 (= res!140386 (validate_offset_bits!1 ((_ sign_extend 32) (size!3913 (buf!4365 thiss!1894))) ((_ sign_extend 32) (currentByte!8302 thiss!1894)) ((_ sign_extend 32) (currentBit!8297 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and start!37002 res!140387) b!168744))

(assert (= (and b!168744 res!140386) b!168745))

(assert (= (and b!168745 res!140385) b!168746))

(assert (= start!37002 b!168747))

(declare-fun m!268329 () Bool)

(assert (=> start!37002 m!268329))

(declare-fun m!268331 () Bool)

(assert (=> b!168747 m!268331))

(declare-fun m!268333 () Bool)

(assert (=> b!168746 m!268333))

(declare-fun m!268335 () Bool)

(assert (=> b!168744 m!268335))

(push 1)

(assert (not b!168744))

(assert (not start!37002))

(assert (not b!168746))

(assert (not b!168747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59565 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59565 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3913 (buf!4365 thiss!1894))) ((_ sign_extend 32) (currentByte!8302 thiss!1894)) ((_ sign_extend 32) (currentBit!8297 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3913 (buf!4365 thiss!1894))) ((_ sign_extend 32) (currentByte!8302 thiss!1894)) ((_ sign_extend 32) (currentBit!8297 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14763 () Bool)

(assert (= bs!14763 d!59565))

(declare-fun m!268353 () Bool)

(assert (=> bs!14763 m!268353))

(assert (=> b!168744 d!59565))

(declare-fun d!59567 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59567 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8297 thiss!1894) (currentByte!8302 thiss!1894) (size!3913 (buf!4365 thiss!1894))))))

(declare-fun bs!14764 () Bool)

(assert (= bs!14764 d!59567))

(declare-fun m!268355 () Bool)

(assert (=> bs!14764 m!268355))

(assert (=> start!37002 d!59567))

(declare-fun d!59569 () Bool)

(assert (=> d!59569 (= (inv!12 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) (invariant!0 (currentBit!8297 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) (currentByte!8302 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) (size!3913 (buf!4365 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))))))))

(declare-fun bs!14765 () Bool)

(assert (= bs!14765 d!59569))

(declare-fun m!268357 () Bool)

(assert (=> bs!14765 m!268357))

(assert (=> b!168746 d!59569))

(declare-fun d!59571 () Bool)

(assert (=> d!59571 (= (array_inv!3654 (buf!4365 thiss!1894)) (bvsge (size!3913 (buf!4365 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168747 d!59571))

(push 1)

(assert (not d!59567))

(assert (not d!59565))

(assert (not d!59569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59589 () Bool)

(assert (=> d!59589 (= (invariant!0 (currentBit!8297 thiss!1894) (currentByte!8302 thiss!1894) (size!3913 (buf!4365 thiss!1894))) (and (bvsge (currentBit!8297 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8297 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8302 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8302 thiss!1894) (size!3913 (buf!4365 thiss!1894))) (and (= (currentBit!8297 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8302 thiss!1894) (size!3913 (buf!4365 thiss!1894)))))))))

(assert (=> d!59567 d!59589))

(declare-fun d!59591 () Bool)

(assert (=> d!59591 (= (remainingBits!0 ((_ sign_extend 32) (size!3913 (buf!4365 thiss!1894))) ((_ sign_extend 32) (currentByte!8302 thiss!1894)) ((_ sign_extend 32) (currentBit!8297 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3913 (buf!4365 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8302 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8297 thiss!1894)))))))

(assert (=> d!59565 d!59591))

(declare-fun d!59593 () Bool)

(assert (=> d!59593 (= (invariant!0 (currentBit!8297 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) (currentByte!8302 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) (size!3913 (buf!4365 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))))) (and (bvsge (currentBit!8297 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) #b00000000000000000000000000000000) (bvslt (currentBit!8297 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) #b00000000000000000000000000001000) (bvsge (currentByte!8302 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) #b00000000000000000000000000000000) (or (bvslt (currentByte!8302 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) (size!3913 (buf!4365 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))))) (and (= (currentBit!8297 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) #b00000000000000000000000000000000) (= (currentByte!8302 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894))) (size!3913 (buf!4365 (BitStream!6983 (buf!4365 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8302 thiss!1894)) (currentBit!8297 thiss!1894)))))))))))

(assert (=> d!59569 d!59593))

(push 1)

(check-sat)

