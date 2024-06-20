; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68808 () Bool)

(assert start!68808)

(declare-fun b!310630 () Bool)

(declare-fun res!254655 () Bool)

(declare-fun e!223170 () Bool)

(assert (=> b!310630 (=> (not res!254655) (not e!223170))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> b!310630 (= res!254655 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!310631 () Bool)

(declare-datatypes ((array!18915 0))(
  ( (array!18916 (arr!9291 (Array (_ BitVec 32) (_ BitVec 8))) (size!8208 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13526 0))(
  ( (BitStream!13527 (buf!7824 array!18915) (currentByte!14391 (_ BitVec 32)) (currentBit!14386 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13526)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310631 (= e!223170 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!8208 (buf!7824 bitStream!19))) ((_ sign_extend 32) (currentByte!14391 bitStream!19)) ((_ sign_extend 32) (currentBit!14386 bitStream!19)))))))

(declare-fun res!254656 () Bool)

(assert (=> start!68808 (=> (not res!254656) (not e!223170))))

(assert (=> start!68808 (= res!254656 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68808 e!223170))

(assert (=> start!68808 true))

(declare-fun e!223171 () Bool)

(declare-fun inv!12 (BitStream!13526) Bool)

(assert (=> start!68808 (and (inv!12 bitStream!19) e!223171)))

(declare-fun b!310629 () Bool)

(declare-fun res!254654 () Bool)

(assert (=> b!310629 (=> (not res!254654) (not e!223170))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310629 (= res!254654 (validate_offset_bits!1 ((_ sign_extend 32) (size!8208 (buf!7824 bitStream!19))) ((_ sign_extend 32) (currentByte!14391 bitStream!19)) ((_ sign_extend 32) (currentBit!14386 bitStream!19)) nBits!480))))

(declare-fun b!310632 () Bool)

(declare-fun array_inv!7763 (array!18915) Bool)

(assert (=> b!310632 (= e!223171 (array_inv!7763 (buf!7824 bitStream!19)))))

(assert (= (and start!68808 res!254656) b!310629))

(assert (= (and b!310629 res!254654) b!310630))

(assert (= (and b!310630 res!254655) b!310631))

(assert (= start!68808 b!310632))

(declare-fun m!448415 () Bool)

(assert (=> b!310631 m!448415))

(declare-fun m!448417 () Bool)

(assert (=> start!68808 m!448417))

(declare-fun m!448419 () Bool)

(assert (=> b!310629 m!448419))

(declare-fun m!448421 () Bool)

(assert (=> b!310632 m!448421))

(push 1)

(assert (not b!310631))

(assert (not b!310632))

(assert (not b!310629))

(assert (not start!68808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102812 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!102812 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8208 (buf!7824 bitStream!19))) ((_ sign_extend 32) (currentByte!14391 bitStream!19)) ((_ sign_extend 32) (currentBit!14386 bitStream!19))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8208 (buf!7824 bitStream!19))) ((_ sign_extend 32) (currentByte!14391 bitStream!19)) ((_ sign_extend 32) (currentBit!14386 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!26606 () Bool)

(assert (= bs!26606 d!102812))

(declare-fun m!448425 () Bool)

(assert (=> bs!26606 m!448425))

(assert (=> b!310631 d!102812))

(declare-fun d!102818 () Bool)

(assert (=> d!102818 (= (array_inv!7763 (buf!7824 bitStream!19)) (bvsge (size!8208 (buf!7824 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310632 d!102818))

(declare-fun d!102822 () Bool)

(assert (=> d!102822 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8208 (buf!7824 bitStream!19))) ((_ sign_extend 32) (currentByte!14391 bitStream!19)) ((_ sign_extend 32) (currentBit!14386 bitStream!19)) nBits!480) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8208 (buf!7824 bitStream!19))) ((_ sign_extend 32) (currentByte!14391 bitStream!19)) ((_ sign_extend 32) (currentBit!14386 bitStream!19))) nBits!480))))

(declare-fun bs!26610 () Bool)

(assert (= bs!26610 d!102822))

(assert (=> bs!26610 m!448425))

(assert (=> b!310629 d!102822))

(declare-fun d!102828 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102828 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14386 bitStream!19) (currentByte!14391 bitStream!19) (size!8208 (buf!7824 bitStream!19))))))

(declare-fun bs!26612 () Bool)

(assert (= bs!26612 d!102828))

