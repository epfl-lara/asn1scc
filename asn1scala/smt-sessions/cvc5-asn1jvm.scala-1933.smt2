; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50366 () Bool)

(assert start!50366)

(declare-fun res!197381 () Bool)

(declare-fun e!163294 () Bool)

(assert (=> start!50366 (=> (not res!197381) (not e!163294))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50366 (= res!197381 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50366 e!163294))

(assert (=> start!50366 true))

(declare-datatypes ((array!12508 0))(
  ( (array!12509 (arr!6481 (Array (_ BitVec 32) (_ BitVec 8))) (size!5494 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9952 0))(
  ( (BitStream!9953 (buf!5969 array!12508) (currentByte!11092 (_ BitVec 32)) (currentBit!11087 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9952)

(declare-fun e!163293 () Bool)

(declare-fun inv!12 (BitStream!9952) Bool)

(assert (=> start!50366 (and (inv!12 thiss!1830) e!163293)))

(declare-fun b!236166 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236166 (= e!163294 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5494 (buf!5969 thiss!1830))) ((_ sign_extend 32) (currentByte!11092 thiss!1830)) ((_ sign_extend 32) (currentBit!11087 thiss!1830)))))))

(declare-fun b!236167 () Bool)

(declare-fun res!197384 () Bool)

(assert (=> b!236167 (=> (not res!197384) (not e!163294))))

(assert (=> b!236167 (= res!197384 (not (= nBits!581 i!752)))))

(declare-fun b!236168 () Bool)

(declare-fun res!197382 () Bool)

(assert (=> b!236168 (=> (not res!197382) (not e!163294))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236168 (= res!197382 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236169 () Bool)

(declare-fun res!197385 () Bool)

(assert (=> b!236169 (=> (not res!197385) (not e!163294))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236169 (= res!197385 (validate_offset_bits!1 ((_ sign_extend 32) (size!5494 (buf!5969 thiss!1830))) ((_ sign_extend 32) (currentByte!11092 thiss!1830)) ((_ sign_extend 32) (currentBit!11087 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236170 () Bool)

(declare-fun res!197383 () Bool)

(assert (=> b!236170 (=> (not res!197383) (not e!163294))))

(assert (=> b!236170 (= res!197383 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236171 () Bool)

(declare-fun array_inv!5235 (array!12508) Bool)

(assert (=> b!236171 (= e!163293 (array_inv!5235 (buf!5969 thiss!1830)))))

(assert (= (and start!50366 res!197381) b!236169))

(assert (= (and b!236169 res!197385) b!236170))

(assert (= (and b!236170 res!197383) b!236168))

(assert (= (and b!236168 res!197382) b!236167))

(assert (= (and b!236167 res!197384) b!236166))

(assert (= start!50366 b!236171))

(declare-fun m!358737 () Bool)

(assert (=> b!236166 m!358737))

(declare-fun m!358739 () Bool)

(assert (=> start!50366 m!358739))

(declare-fun m!358741 () Bool)

(assert (=> b!236169 m!358741))

(declare-fun m!358743 () Bool)

(assert (=> b!236171 m!358743))

(declare-fun m!358745 () Bool)

(assert (=> b!236168 m!358745))

(declare-fun m!358747 () Bool)

(assert (=> b!236170 m!358747))

(push 1)

(assert (not b!236171))

(assert (not start!50366))

(assert (not b!236166))

(assert (not b!236168))

(assert (not b!236170))

(assert (not b!236169))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79694 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79694 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5494 (buf!5969 thiss!1830))) ((_ sign_extend 32) (currentByte!11092 thiss!1830)) ((_ sign_extend 32) (currentBit!11087 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5494 (buf!5969 thiss!1830))) ((_ sign_extend 32) (currentByte!11092 thiss!1830)) ((_ sign_extend 32) (currentBit!11087 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19900 () Bool)

(assert (= bs!19900 d!79694))

(declare-fun m!358777 () Bool)

(assert (=> bs!19900 m!358777))

(assert (=> b!236169 d!79694))

(declare-fun d!79698 () Bool)

(assert (=> d!79698 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236168 d!79698))

(declare-fun d!79702 () Bool)

(assert (=> d!79702 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5494 (buf!5969 thiss!1830))) ((_ sign_extend 32) (currentByte!11092 thiss!1830)) ((_ sign_extend 32) (currentBit!11087 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5494 (buf!5969 thiss!1830))) ((_ sign_extend 32) (currentByte!11092 thiss!1830)) ((_ sign_extend 32) (currentBit!11087 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19902 () Bool)

(assert (= bs!19902 d!79702))

(assert (=> bs!19902 m!358777))

(assert (=> b!236166 d!79702))

(declare-fun d!79704 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79704 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11087 thiss!1830) (currentByte!11092 thiss!1830) (size!5494 (buf!5969 thiss!1830))))))

(declare-fun bs!19903 () Bool)

(assert (= bs!19903 d!79704))

(declare-fun m!358779 () Bool)

(assert (=> bs!19903 m!358779))

(assert (=> start!50366 d!79704))

(declare-fun d!79706 () Bool)

(assert (=> d!79706 (= (array_inv!5235 (buf!5969 thiss!1830)) (bvsge (size!5494 (buf!5969 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236171 d!79706))

(declare-fun d!79710 () Bool)

(assert (=> d!79710 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236170 d!79710))

(push 1)

(assert (not d!79702))

(assert (not d!79704))

(assert (not d!79694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

