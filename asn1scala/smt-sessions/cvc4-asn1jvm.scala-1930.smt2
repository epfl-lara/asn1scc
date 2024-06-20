; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50322 () Bool)

(assert start!50322)

(declare-fun b!236040 () Bool)

(declare-fun res!197280 () Bool)

(declare-fun e!163222 () Bool)

(assert (=> b!236040 (=> (not res!197280) (not e!163222))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236040 (= res!197280 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236041 () Bool)

(declare-fun res!197277 () Bool)

(assert (=> b!236041 (=> (not res!197277) (not e!163222))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236041 (= res!197277 (= nBits!581 i!752))))

(declare-fun res!197278 () Bool)

(assert (=> start!50322 (=> (not res!197278) (not e!163222))))

(assert (=> start!50322 (= res!197278 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50322 e!163222))

(assert (=> start!50322 true))

(declare-datatypes ((array!12491 0))(
  ( (array!12492 (arr!6474 (Array (_ BitVec 32) (_ BitVec 8))) (size!5487 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9938 0))(
  ( (BitStream!9939 (buf!5962 array!12491) (currentByte!11079 (_ BitVec 32)) (currentBit!11074 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9938)

(declare-fun e!163221 () Bool)

(declare-fun inv!12 (BitStream!9938) Bool)

(assert (=> start!50322 (and (inv!12 thiss!1830) e!163221)))

(declare-fun b!236042 () Bool)

(declare-fun array_inv!5228 (array!12491) Bool)

(assert (=> b!236042 (= e!163221 (array_inv!5228 (buf!5962 thiss!1830)))))

(declare-fun b!236043 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!236043 (= e!163222 (not (invariant!0 (currentBit!11074 thiss!1830) (currentByte!11079 thiss!1830) (size!5487 (buf!5962 thiss!1830)))))))

(declare-fun b!236044 () Bool)

(declare-fun res!197279 () Bool)

(assert (=> b!236044 (=> (not res!197279) (not e!163222))))

(assert (=> b!236044 (= res!197279 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236045 () Bool)

(declare-fun res!197276 () Bool)

(assert (=> b!236045 (=> (not res!197276) (not e!163222))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236045 (= res!197276 (validate_offset_bits!1 ((_ sign_extend 32) (size!5487 (buf!5962 thiss!1830))) ((_ sign_extend 32) (currentByte!11079 thiss!1830)) ((_ sign_extend 32) (currentBit!11074 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(assert (= (and start!50322 res!197278) b!236045))

(assert (= (and b!236045 res!197276) b!236044))

(assert (= (and b!236044 res!197279) b!236040))

(assert (= (and b!236040 res!197280) b!236041))

(assert (= (and b!236041 res!197277) b!236043))

(assert (= start!50322 b!236042))

(declare-fun m!358647 () Bool)

(assert (=> b!236045 m!358647))

(declare-fun m!358649 () Bool)

(assert (=> b!236042 m!358649))

(declare-fun m!358651 () Bool)

(assert (=> b!236043 m!358651))

(declare-fun m!358653 () Bool)

(assert (=> b!236044 m!358653))

(declare-fun m!358655 () Bool)

(assert (=> b!236040 m!358655))

(declare-fun m!358657 () Bool)

(assert (=> start!50322 m!358657))

(push 1)

(assert (not b!236042))

(assert (not b!236043))

(assert (not b!236044))

(assert (not b!236040))

(assert (not start!50322))

(assert (not b!236045))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79658 () Bool)

(assert (=> d!79658 (= (array_inv!5228 (buf!5962 thiss!1830)) (bvsge (size!5487 (buf!5962 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236042 d!79658))

(declare-fun d!79666 () Bool)

(assert (=> d!79666 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11074 thiss!1830) (currentByte!11079 thiss!1830) (size!5487 (buf!5962 thiss!1830))))))

(declare-fun bs!19887 () Bool)

(assert (= bs!19887 d!79666))

(assert (=> bs!19887 m!358651))

(assert (=> start!50322 d!79666))

(declare-fun d!79672 () Bool)

(assert (=> d!79672 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236040 d!79672))

(declare-fun d!79674 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79674 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5487 (buf!5962 thiss!1830))) ((_ sign_extend 32) (currentByte!11079 thiss!1830)) ((_ sign_extend 32) (currentBit!11074 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5487 (buf!5962 thiss!1830))) ((_ sign_extend 32) (currentByte!11079 thiss!1830)) ((_ sign_extend 32) (currentBit!11074 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19888 () Bool)

(assert (= bs!19888 d!79674))

(declare-fun m!358663 () Bool)

(assert (=> bs!19888 m!358663))

(assert (=> b!236045 d!79674))

(declare-fun d!79676 () Bool)

(assert (=> d!79676 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236044 d!79676))

(declare-fun d!79678 () Bool)

