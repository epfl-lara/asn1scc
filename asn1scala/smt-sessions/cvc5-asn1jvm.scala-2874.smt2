; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68804 () Bool)

(assert start!68804)

(declare-fun b!310607 () Bool)

(declare-fun e!223153 () Bool)

(declare-datatypes ((array!18911 0))(
  ( (array!18912 (arr!9289 (Array (_ BitVec 32) (_ BitVec 8))) (size!8206 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13522 0))(
  ( (BitStream!13523 (buf!7822 array!18911) (currentByte!14389 (_ BitVec 32)) (currentBit!14384 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13522)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310607 (= e!223153 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!8206 (buf!7822 bitStream!19))) ((_ sign_extend 32) (currentByte!14389 bitStream!19)) ((_ sign_extend 32) (currentBit!14384 bitStream!19)))))))

(declare-fun b!310608 () Bool)

(declare-fun e!223154 () Bool)

(declare-fun array_inv!7761 (array!18911) Bool)

(assert (=> b!310608 (= e!223154 (array_inv!7761 (buf!7822 bitStream!19)))))

(declare-fun res!254636 () Bool)

(assert (=> start!68804 (=> (not res!254636) (not e!223153))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> start!68804 (= res!254636 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68804 e!223153))

(assert (=> start!68804 true))

(declare-fun inv!12 (BitStream!13522) Bool)

(assert (=> start!68804 (and (inv!12 bitStream!19) e!223154)))

(declare-fun b!310605 () Bool)

(declare-fun res!254638 () Bool)

(assert (=> b!310605 (=> (not res!254638) (not e!223153))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310605 (= res!254638 (validate_offset_bits!1 ((_ sign_extend 32) (size!8206 (buf!7822 bitStream!19))) ((_ sign_extend 32) (currentByte!14389 bitStream!19)) ((_ sign_extend 32) (currentBit!14384 bitStream!19)) nBits!480))))

(declare-fun b!310606 () Bool)

(declare-fun res!254637 () Bool)

(assert (=> b!310606 (=> (not res!254637) (not e!223153))))

(assert (=> b!310606 (= res!254637 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!68804 res!254636) b!310605))

(assert (= (and b!310605 res!254638) b!310606))

(assert (= (and b!310606 res!254637) b!310607))

(assert (= start!68804 b!310608))

(declare-fun m!448399 () Bool)

(assert (=> b!310607 m!448399))

(declare-fun m!448401 () Bool)

(assert (=> b!310608 m!448401))

(declare-fun m!448403 () Bool)

(assert (=> start!68804 m!448403))

(declare-fun m!448405 () Bool)

(assert (=> b!310605 m!448405))

(push 1)

(assert (not b!310605))

(assert (not start!68804))

(assert (not b!310607))

(assert (not b!310608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102808 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!102808 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8206 (buf!7822 bitStream!19))) ((_ sign_extend 32) (currentByte!14389 bitStream!19)) ((_ sign_extend 32) (currentBit!14384 bitStream!19)) nBits!480) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8206 (buf!7822 bitStream!19))) ((_ sign_extend 32) (currentByte!14389 bitStream!19)) ((_ sign_extend 32) (currentBit!14384 bitStream!19))) nBits!480))))

(declare-fun bs!26605 () Bool)

(assert (= bs!26605 d!102808))

(declare-fun m!448423 () Bool)

(assert (=> bs!26605 m!448423))

(assert (=> b!310605 d!102808))

(declare-fun d!102814 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102814 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14384 bitStream!19) (currentByte!14389 bitStream!19) (size!8206 (buf!7822 bitStream!19))))))

(declare-fun bs!26607 () Bool)

(assert (= bs!26607 d!102814))

(declare-fun m!448427 () Bool)

(assert (=> bs!26607 m!448427))

(assert (=> start!68804 d!102814))

(declare-fun d!102820 () Bool)

(assert (=> d!102820 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8206 (buf!7822 bitStream!19))) ((_ sign_extend 32) (currentByte!14389 bitStream!19)) ((_ sign_extend 32) (currentBit!14384 bitStream!19))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8206 (buf!7822 bitStream!19))) ((_ sign_extend 32) (currentByte!14389 bitStream!19)) ((_ sign_extend 32) (currentBit!14384 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!26609 () Bool)

(assert (= bs!26609 d!102820))

(assert (=> bs!26609 m!448423))

(assert (=> b!310607 d!102820))

(declare-fun d!102826 () Bool)

(assert (=> d!102826 (= (array_inv!7761 (buf!7822 bitStream!19)) (bvsge (size!8206 (buf!7822 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310608 d!102826))

(push 1)

(assert (not d!102808))

(assert (not d!102814))

(assert (not d!102820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

