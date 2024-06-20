; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50370 () Bool)

(assert start!50370)

(declare-fun b!236202 () Bool)

(declare-fun res!197411 () Bool)

(declare-fun e!163313 () Bool)

(assert (=> b!236202 (=> (not res!197411) (not e!163313))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236202 (= res!197411 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236203 () Bool)

(declare-fun res!197412 () Bool)

(assert (=> b!236203 (=> (not res!197412) (not e!163313))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236203 (= res!197412 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236204 () Bool)

(declare-fun res!197415 () Bool)

(assert (=> b!236204 (=> (not res!197415) (not e!163313))))

(declare-datatypes ((array!12512 0))(
  ( (array!12513 (arr!6483 (Array (_ BitVec 32) (_ BitVec 8))) (size!5496 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9956 0))(
  ( (BitStream!9957 (buf!5971 array!12512) (currentByte!11094 (_ BitVec 32)) (currentBit!11089 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9956)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236204 (= res!197415 (validate_offset_bits!1 ((_ sign_extend 32) (size!5496 (buf!5971 thiss!1830))) ((_ sign_extend 32) (currentByte!11094 thiss!1830)) ((_ sign_extend 32) (currentBit!11089 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236205 () Bool)

(declare-fun res!197413 () Bool)

(assert (=> b!236205 (=> (not res!197413) (not e!163313))))

(assert (=> b!236205 (= res!197413 (not (= nBits!581 i!752)))))

(declare-fun b!236206 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236206 (= e!163313 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5496 (buf!5971 thiss!1830))) ((_ sign_extend 32) (currentByte!11094 thiss!1830)) ((_ sign_extend 32) (currentBit!11089 thiss!1830)))))))

(declare-fun res!197414 () Bool)

(assert (=> start!50370 (=> (not res!197414) (not e!163313))))

(assert (=> start!50370 (= res!197414 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50370 e!163313))

(assert (=> start!50370 true))

(declare-fun e!163312 () Bool)

(declare-fun inv!12 (BitStream!9956) Bool)

(assert (=> start!50370 (and (inv!12 thiss!1830) e!163312)))

(declare-fun b!236207 () Bool)

(declare-fun array_inv!5237 (array!12512) Bool)

(assert (=> b!236207 (= e!163312 (array_inv!5237 (buf!5971 thiss!1830)))))

(assert (= (and start!50370 res!197414) b!236204))

(assert (= (and b!236204 res!197415) b!236203))

(assert (= (and b!236203 res!197412) b!236202))

(assert (= (and b!236202 res!197411) b!236205))

(assert (= (and b!236205 res!197413) b!236206))

(assert (= start!50370 b!236207))

(declare-fun m!358761 () Bool)

(assert (=> b!236204 m!358761))

(declare-fun m!358763 () Bool)

(assert (=> b!236207 m!358763))

(declare-fun m!358765 () Bool)

(assert (=> b!236206 m!358765))

(declare-fun m!358767 () Bool)

(assert (=> b!236203 m!358767))

(declare-fun m!358769 () Bool)

(assert (=> start!50370 m!358769))

(declare-fun m!358771 () Bool)

(assert (=> b!236202 m!358771))

(push 1)

(assert (not b!236207))

(assert (not b!236206))

(assert (not b!236203))

(assert (not b!236202))

(assert (not b!236204))

(assert (not start!50370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79708 () Bool)

(assert (=> d!79708 (= (array_inv!5237 (buf!5971 thiss!1830)) (bvsge (size!5496 (buf!5971 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236207 d!79708))

(declare-fun d!79712 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79712 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5496 (buf!5971 thiss!1830))) ((_ sign_extend 32) (currentByte!11094 thiss!1830)) ((_ sign_extend 32) (currentBit!11089 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5496 (buf!5971 thiss!1830))) ((_ sign_extend 32) (currentByte!11094 thiss!1830)) ((_ sign_extend 32) (currentBit!11089 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19904 () Bool)

(assert (= bs!19904 d!79712))

(declare-fun m!358781 () Bool)

(assert (=> bs!19904 m!358781))

(assert (=> b!236206 d!79712))

(declare-fun d!79714 () Bool)

(assert (=> d!79714 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5496 (buf!5971 thiss!1830))) ((_ sign_extend 32) (currentByte!11094 thiss!1830)) ((_ sign_extend 32) (currentBit!11089 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5496 (buf!5971 thiss!1830))) ((_ sign_extend 32) (currentByte!11094 thiss!1830)) ((_ sign_extend 32) (currentBit!11089 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19905 () Bool)

(assert (= bs!19905 d!79714))

(assert (=> bs!19905 m!358781))

(assert (=> b!236204 d!79714))

(declare-fun d!79716 () Bool)

(assert (=> d!79716 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236203 d!79716))

(declare-fun d!79718 () Bool)

(assert (=> d!79718 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236202 d!79718))

(declare-fun d!79720 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79720 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11089 thiss!1830) (currentByte!11094 thiss!1830) (size!5496 (buf!5971 thiss!1830))))))

(declare-fun bs!19906 () Bool)

(assert (= bs!19906 d!79720))

(declare-fun m!358783 () Bool)

(assert (=> bs!19906 m!358783))

(assert (=> start!50370 d!79720))

(push 1)

