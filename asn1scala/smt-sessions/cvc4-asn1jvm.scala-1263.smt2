; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35862 () Bool)

(assert start!35862)

(declare-fun res!138670 () Bool)

(declare-fun e!115406 () Bool)

(assert (=> start!35862 (=> (not res!138670) (not e!115406))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35862 (= res!138670 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35862 e!115406))

(assert (=> start!35862 true))

(declare-datatypes ((array!8542 0))(
  ( (array!8543 (arr!4725 (Array (_ BitVec 32) (_ BitVec 8))) (size!3804 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6764 0))(
  ( (BitStream!6765 (buf!4256 array!8542) (currentByte!8021 (_ BitVec 32)) (currentBit!8016 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6764)

(declare-fun e!115405 () Bool)

(declare-fun inv!12 (BitStream!6764) Bool)

(assert (=> start!35862 (and (inv!12 thiss!1577) e!115405)))

(declare-fun b!166555 () Bool)

(declare-fun res!138671 () Bool)

(assert (=> b!166555 (=> (not res!138671) (not e!115406))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166555 (= res!138671 (validate_offset_bits!1 ((_ sign_extend 32) (size!3804 (buf!4256 thiss!1577))) ((_ sign_extend 32) (currentByte!8021 thiss!1577)) ((_ sign_extend 32) (currentBit!8016 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166556 () Bool)

(assert (=> b!166556 (= e!115406 (and (bvsgt (bvadd (currentBit!8016 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8021 thiss!1577)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8021 thiss!1577)) (size!3804 (buf!4256 thiss!1577))))))))

(declare-fun b!166557 () Bool)

(declare-fun array_inv!3545 (array!8542) Bool)

(assert (=> b!166557 (= e!115405 (array_inv!3545 (buf!4256 thiss!1577)))))

(assert (= (and start!35862 res!138670) b!166555))

(assert (= (and b!166555 res!138671) b!166556))

(assert (= start!35862 b!166557))

(declare-fun m!264565 () Bool)

(assert (=> start!35862 m!264565))

(declare-fun m!264567 () Bool)

(assert (=> b!166555 m!264567))

(declare-fun m!264569 () Bool)

(assert (=> b!166557 m!264569))

(push 1)

(assert (not b!166555))

(assert (not start!35862))

(assert (not b!166557))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58117 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58117 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3804 (buf!4256 thiss!1577))) ((_ sign_extend 32) (currentByte!8021 thiss!1577)) ((_ sign_extend 32) (currentBit!8016 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3804 (buf!4256 thiss!1577))) ((_ sign_extend 32) (currentByte!8021 thiss!1577)) ((_ sign_extend 32) (currentBit!8016 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14423 () Bool)

(assert (= bs!14423 d!58117))

(declare-fun m!264579 () Bool)

(assert (=> bs!14423 m!264579))

(assert (=> b!166555 d!58117))

(declare-fun d!58119 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58119 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8016 thiss!1577) (currentByte!8021 thiss!1577) (size!3804 (buf!4256 thiss!1577))))))

(declare-fun bs!14424 () Bool)

(assert (= bs!14424 d!58119))

(declare-fun m!264581 () Bool)

(assert (=> bs!14424 m!264581))

(assert (=> start!35862 d!58119))

(declare-fun d!58125 () Bool)

(assert (=> d!58125 (= (array_inv!3545 (buf!4256 thiss!1577)) (bvsge (size!3804 (buf!4256 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166557 d!58125))

(push 1)

(assert (not d!58117))

(assert (not d!58119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58131 () Bool)

(assert (=> d!58131 (= (remainingBits!0 ((_ sign_extend 32) (size!3804 (buf!4256 thiss!1577))) ((_ sign_extend 32) (currentByte!8021 thiss!1577)) ((_ sign_extend 32) (currentBit!8016 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3804 (buf!4256 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8021 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8016 thiss!1577)))))))

(assert (=> d!58117 d!58131))

(declare-fun d!58133 () Bool)

(assert (=> d!58133 (= (invariant!0 (currentBit!8016 thiss!1577) (currentByte!8021 thiss!1577) (size!3804 (buf!4256 thiss!1577))) (and (bvsge (currentBit!8016 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8016 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8021 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8021 thiss!1577) (size!3804 (buf!4256 thiss!1577))) (and (= (currentBit!8016 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8021 thiss!1577) (size!3804 (buf!4256 thiss!1577)))))))))

(assert (=> d!58119 d!58133))

(push 1)

(check-sat)

(pop 1)

