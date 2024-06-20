; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35994 () Bool)

(assert start!35994)

(declare-fun res!138730 () Bool)

(declare-fun e!115497 () Bool)

(assert (=> start!35994 (=> (not res!138730) (not e!115497))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35994 (= res!138730 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35994 e!115497))

(assert (=> start!35994 true))

(declare-datatypes ((array!8574 0))(
  ( (array!8575 (arr!4735 (Array (_ BitVec 32) (_ BitVec 8))) (size!3814 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6784 0))(
  ( (BitStream!6785 (buf!4266 array!8574) (currentByte!8063 (_ BitVec 32)) (currentBit!8058 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6784)

(declare-fun e!115496 () Bool)

(declare-fun inv!12 (BitStream!6784) Bool)

(assert (=> start!35994 (and (inv!12 thiss!1577) e!115496)))

(declare-fun b!166645 () Bool)

(declare-fun res!138731 () Bool)

(assert (=> b!166645 (=> (not res!138731) (not e!115497))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166645 (= res!138731 (validate_offset_bits!1 ((_ sign_extend 32) (size!3814 (buf!4266 thiss!1577))) ((_ sign_extend 32) (currentByte!8063 thiss!1577)) ((_ sign_extend 32) (currentBit!8058 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166646 () Bool)

(assert (=> b!166646 (= e!115497 (and (bvsgt (bvadd (currentBit!8058 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvsgt #b00000000000000000000000000000000 (currentByte!8063 thiss!1577)) (bvsge (currentByte!8063 thiss!1577) (size!3814 (buf!4266 thiss!1577))))))))

(declare-fun b!166647 () Bool)

(declare-fun array_inv!3555 (array!8574) Bool)

(assert (=> b!166647 (= e!115496 (array_inv!3555 (buf!4266 thiss!1577)))))

(assert (= (and start!35994 res!138730) b!166645))

(assert (= (and b!166645 res!138731) b!166646))

(assert (= start!35994 b!166647))

(declare-fun m!264673 () Bool)

(assert (=> start!35994 m!264673))

(declare-fun m!264675 () Bool)

(assert (=> b!166645 m!264675))

(declare-fun m!264677 () Bool)

(assert (=> b!166647 m!264677))

(push 1)

(assert (not start!35994))

(assert (not b!166645))

(assert (not b!166647))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58231 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58231 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8058 thiss!1577) (currentByte!8063 thiss!1577) (size!3814 (buf!4266 thiss!1577))))))

(declare-fun bs!14457 () Bool)

(assert (= bs!14457 d!58231))

(declare-fun m!264695 () Bool)

(assert (=> bs!14457 m!264695))

(assert (=> start!35994 d!58231))

(declare-fun d!58233 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58233 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3814 (buf!4266 thiss!1577))) ((_ sign_extend 32) (currentByte!8063 thiss!1577)) ((_ sign_extend 32) (currentBit!8058 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3814 (buf!4266 thiss!1577))) ((_ sign_extend 32) (currentByte!8063 thiss!1577)) ((_ sign_extend 32) (currentBit!8058 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14458 () Bool)

(assert (= bs!14458 d!58233))

(declare-fun m!264697 () Bool)

(assert (=> bs!14458 m!264697))

(assert (=> b!166645 d!58233))

(declare-fun d!58235 () Bool)

(assert (=> d!58235 (= (array_inv!3555 (buf!4266 thiss!1577)) (bvsge (size!3814 (buf!4266 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166647 d!58235))

(push 1)

(assert (not d!58231))

(assert (not d!58233))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58247 () Bool)

(assert (=> d!58247 (= (invariant!0 (currentBit!8058 thiss!1577) (currentByte!8063 thiss!1577) (size!3814 (buf!4266 thiss!1577))) (and (bvsge (currentBit!8058 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8058 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8063 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8063 thiss!1577) (size!3814 (buf!4266 thiss!1577))) (and (= (currentBit!8058 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8063 thiss!1577) (size!3814 (buf!4266 thiss!1577)))))))))

(assert (=> d!58231 d!58247))

(declare-fun d!58249 () Bool)

(assert (=> d!58249 (= (remainingBits!0 ((_ sign_extend 32) (size!3814 (buf!4266 thiss!1577))) ((_ sign_extend 32) (currentByte!8063 thiss!1577)) ((_ sign_extend 32) (currentBit!8058 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3814 (buf!4266 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8063 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8058 thiss!1577)))))))

(assert (=> d!58233 d!58249))

(push 1)

(check-sat)

