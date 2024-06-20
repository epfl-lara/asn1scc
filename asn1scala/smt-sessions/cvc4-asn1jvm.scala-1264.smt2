; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35898 () Bool)

(assert start!35898)

(declare-fun res!138688 () Bool)

(declare-fun e!115433 () Bool)

(assert (=> start!35898 (=> (not res!138688) (not e!115433))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35898 (= res!138688 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35898 e!115433))

(assert (=> start!35898 true))

(declare-datatypes ((array!8551 0))(
  ( (array!8552 (arr!4728 (Array (_ BitVec 32) (_ BitVec 8))) (size!3807 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6770 0))(
  ( (BitStream!6771 (buf!4259 array!8551) (currentByte!8033 (_ BitVec 32)) (currentBit!8028 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6770)

(declare-fun e!115434 () Bool)

(declare-fun inv!12 (BitStream!6770) Bool)

(assert (=> start!35898 (and (inv!12 thiss!1577) e!115434)))

(declare-fun b!166582 () Bool)

(declare-fun res!138689 () Bool)

(assert (=> b!166582 (=> (not res!138689) (not e!115433))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166582 (= res!138689 (validate_offset_bits!1 ((_ sign_extend 32) (size!3807 (buf!4259 thiss!1577))) ((_ sign_extend 32) (currentByte!8033 thiss!1577)) ((_ sign_extend 32) (currentBit!8028 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166583 () Bool)

(assert (=> b!166583 (= e!115433 (and (bvsgt (bvadd (currentBit!8028 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10021 (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8033 thiss!1577)) #b10000000000000000000000000000000))) (and (not (= bdg!10021 #b00000000000000000000000000000000)) (not (= bdg!10021 (bvand (currentByte!8033 thiss!1577) #b10000000000000000000000000000000)))))))))

(declare-fun b!166584 () Bool)

(declare-fun array_inv!3548 (array!8551) Bool)

(assert (=> b!166584 (= e!115434 (array_inv!3548 (buf!4259 thiss!1577)))))

(assert (= (and start!35898 res!138688) b!166582))

(assert (= (and b!166582 res!138689) b!166583))

(assert (= start!35898 b!166584))

(declare-fun m!264595 () Bool)

(assert (=> start!35898 m!264595))

(declare-fun m!264597 () Bool)

(assert (=> b!166582 m!264597))

(declare-fun m!264599 () Bool)

(assert (=> b!166584 m!264599))

(push 1)

(assert (not b!166582))

(assert (not start!35898))

(assert (not b!166584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58149 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58149 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3807 (buf!4259 thiss!1577))) ((_ sign_extend 32) (currentByte!8033 thiss!1577)) ((_ sign_extend 32) (currentBit!8028 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3807 (buf!4259 thiss!1577))) ((_ sign_extend 32) (currentByte!8033 thiss!1577)) ((_ sign_extend 32) (currentBit!8028 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14432 () Bool)

(assert (= bs!14432 d!58149))

(declare-fun m!264609 () Bool)

(assert (=> bs!14432 m!264609))

(assert (=> b!166582 d!58149))

(declare-fun d!58153 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58153 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8028 thiss!1577) (currentByte!8033 thiss!1577) (size!3807 (buf!4259 thiss!1577))))))

(declare-fun bs!14433 () Bool)

(assert (= bs!14433 d!58153))

(declare-fun m!264611 () Bool)

(assert (=> bs!14433 m!264611))

(assert (=> start!35898 d!58153))

(declare-fun d!58157 () Bool)

(assert (=> d!58157 (= (array_inv!3548 (buf!4259 thiss!1577)) (bvsge (size!3807 (buf!4259 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166584 d!58157))

(push 1)

(assert (not d!58149))

(assert (not d!58153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

