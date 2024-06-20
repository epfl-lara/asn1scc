; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50320 () Bool)

(assert start!50320)

(declare-fun b!236022 () Bool)

(declare-fun e!163213 () Bool)

(declare-datatypes ((array!12489 0))(
  ( (array!12490 (arr!6473 (Array (_ BitVec 32) (_ BitVec 8))) (size!5486 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9936 0))(
  ( (BitStream!9937 (buf!5961 array!12489) (currentByte!11078 (_ BitVec 32)) (currentBit!11073 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9936)

(declare-fun array_inv!5227 (array!12489) Bool)

(assert (=> b!236022 (= e!163213 (array_inv!5227 (buf!5961 thiss!1830)))))

(declare-fun b!236023 () Bool)

(declare-fun res!197261 () Bool)

(declare-fun e!163212 () Bool)

(assert (=> b!236023 (=> (not res!197261) (not e!163212))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236023 (= res!197261 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236024 () Bool)

(declare-fun res!197264 () Bool)

(assert (=> b!236024 (=> (not res!197264) (not e!163212))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236024 (= res!197264 (validate_offset_bits!1 ((_ sign_extend 32) (size!5486 (buf!5961 thiss!1830))) ((_ sign_extend 32) (currentByte!11078 thiss!1830)) ((_ sign_extend 32) (currentBit!11073 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236025 () Bool)

(declare-fun res!197262 () Bool)

(assert (=> b!236025 (=> (not res!197262) (not e!163212))))

(assert (=> b!236025 (= res!197262 (= nBits!581 i!752))))

(declare-fun res!197265 () Bool)

(assert (=> start!50320 (=> (not res!197265) (not e!163212))))

(assert (=> start!50320 (= res!197265 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50320 e!163212))

(assert (=> start!50320 true))

(declare-fun inv!12 (BitStream!9936) Bool)

(assert (=> start!50320 (and (inv!12 thiss!1830) e!163213)))

(declare-fun b!236026 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!236026 (= e!163212 (not (invariant!0 (currentBit!11073 thiss!1830) (currentByte!11078 thiss!1830) (size!5486 (buf!5961 thiss!1830)))))))

(declare-fun b!236027 () Bool)

(declare-fun res!197263 () Bool)

(assert (=> b!236027 (=> (not res!197263) (not e!163212))))

(assert (=> b!236027 (= res!197263 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50320 res!197265) b!236024))

(assert (= (and b!236024 res!197264) b!236023))

(assert (= (and b!236023 res!197261) b!236027))

(assert (= (and b!236027 res!197263) b!236025))

(assert (= (and b!236025 res!197262) b!236026))

(assert (= start!50320 b!236022))

(declare-fun m!358635 () Bool)

(assert (=> b!236024 m!358635))

(declare-fun m!358637 () Bool)

(assert (=> start!50320 m!358637))

(declare-fun m!358639 () Bool)

(assert (=> b!236027 m!358639))

(declare-fun m!358641 () Bool)

(assert (=> b!236023 m!358641))

(declare-fun m!358643 () Bool)

(assert (=> b!236022 m!358643))

(declare-fun m!358645 () Bool)

(assert (=> b!236026 m!358645))

(check-sat (not b!236022) (not b!236024) (not b!236023) (not b!236026) (not start!50320) (not b!236027))
(check-sat)
(get-model)

(declare-fun d!79644 () Bool)

(assert (=> d!79644 (= (invariant!0 (currentBit!11073 thiss!1830) (currentByte!11078 thiss!1830) (size!5486 (buf!5961 thiss!1830))) (and (bvsge (currentBit!11073 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11073 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11078 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11078 thiss!1830) (size!5486 (buf!5961 thiss!1830))) (and (= (currentBit!11073 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11078 thiss!1830) (size!5486 (buf!5961 thiss!1830)))))))))

(assert (=> b!236026 d!79644))

(declare-fun d!79646 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79646 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5486 (buf!5961 thiss!1830))) ((_ sign_extend 32) (currentByte!11078 thiss!1830)) ((_ sign_extend 32) (currentBit!11073 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5486 (buf!5961 thiss!1830))) ((_ sign_extend 32) (currentByte!11078 thiss!1830)) ((_ sign_extend 32) (currentBit!11073 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19883 () Bool)

(assert (= bs!19883 d!79646))

(declare-fun m!358659 () Bool)

(assert (=> bs!19883 m!358659))

(assert (=> b!236024 d!79646))

(declare-fun d!79650 () Bool)

(assert (=> d!79650 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236023 d!79650))

(declare-fun d!79654 () Bool)

(assert (=> d!79654 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11073 thiss!1830) (currentByte!11078 thiss!1830) (size!5486 (buf!5961 thiss!1830))))))

(declare-fun bs!19885 () Bool)

(assert (= bs!19885 d!79654))

(assert (=> bs!19885 m!358645))

(assert (=> start!50320 d!79654))

(declare-fun d!79662 () Bool)

(assert (=> d!79662 (= (array_inv!5227 (buf!5961 thiss!1830)) (bvsge (size!5486 (buf!5961 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236022 d!79662))

(declare-fun d!79668 () Bool)

(assert (=> d!79668 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236027 d!79668))

(check-sat (not d!79654) (not d!79646))
(check-sat)
