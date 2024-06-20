; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34952 () Bool)

(assert start!34952)

(declare-fun res!137338 () Bool)

(declare-fun e!113938 () Bool)

(assert (=> start!34952 (=> (not res!137338) (not e!113938))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34952 (= res!137338 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34952 e!113938))

(assert (=> start!34952 true))

(declare-datatypes ((array!8284 0))(
  ( (array!8285 (arr!4626 (Array (_ BitVec 32) (_ BitVec 8))) (size!3705 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6566 0))(
  ( (BitStream!6567 (buf!4157 array!8284) (currentByte!7759 (_ BitVec 32)) (currentBit!7754 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6566)

(declare-fun e!113940 () Bool)

(declare-fun inv!12 (BitStream!6566) Bool)

(assert (=> start!34952 (and (inv!12 thiss!1577) e!113940)))

(declare-fun b!164821 () Bool)

(declare-fun res!137339 () Bool)

(assert (=> b!164821 (=> (not res!137339) (not e!113938))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164821 (= res!137339 (validate_offset_bits!1 ((_ sign_extend 32) (size!3705 (buf!4157 thiss!1577))) ((_ sign_extend 32) (currentByte!7759 thiss!1577)) ((_ sign_extend 32) (currentBit!7754 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164822 () Bool)

(assert (=> b!164822 (= e!113938 (or (bvslt (bvsub #b00000000000000000000000000001000 (currentBit!7754 thiss!1577)) #b00000000000000000000000000000000) (bvsge (bvsub #b00000000000000000000000000001000 (currentBit!7754 thiss!1577)) #b00000000000000000000000000001001)))))

(declare-fun b!164823 () Bool)

(declare-fun array_inv!3446 (array!8284) Bool)

(assert (=> b!164823 (= e!113940 (array_inv!3446 (buf!4157 thiss!1577)))))

(assert (= (and start!34952 res!137338) b!164821))

(assert (= (and b!164821 res!137339) b!164822))

(assert (= start!34952 b!164823))

(declare-fun m!262177 () Bool)

(assert (=> start!34952 m!262177))

(declare-fun m!262179 () Bool)

(assert (=> b!164821 m!262179))

(declare-fun m!262181 () Bool)

(assert (=> b!164823 m!262181))

(push 1)

(assert (not b!164821))

(assert (not start!34952))

(assert (not b!164823))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56991 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56991 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3705 (buf!4157 thiss!1577))) ((_ sign_extend 32) (currentByte!7759 thiss!1577)) ((_ sign_extend 32) (currentBit!7754 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3705 (buf!4157 thiss!1577))) ((_ sign_extend 32) (currentByte!7759 thiss!1577)) ((_ sign_extend 32) (currentBit!7754 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14128 () Bool)

(assert (= bs!14128 d!56991))

(declare-fun m!262191 () Bool)

(assert (=> bs!14128 m!262191))

(assert (=> b!164821 d!56991))

(declare-fun d!56993 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56993 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7754 thiss!1577) (currentByte!7759 thiss!1577) (size!3705 (buf!4157 thiss!1577))))))

(declare-fun bs!14129 () Bool)

(assert (= bs!14129 d!56993))

(declare-fun m!262193 () Bool)

(assert (=> bs!14129 m!262193))

(assert (=> start!34952 d!56993))

(declare-fun d!56997 () Bool)

(assert (=> d!56997 (= (array_inv!3446 (buf!4157 thiss!1577)) (bvsge (size!3705 (buf!4157 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164823 d!56997))

(push 1)

(assert (not d!56993))

(assert (not d!56991))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

