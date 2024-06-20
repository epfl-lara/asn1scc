; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50798 () Bool)

(assert start!50798)

(declare-fun b!237643 () Bool)

(declare-fun res!198627 () Bool)

(declare-fun e!164249 () Bool)

(assert (=> b!237643 (=> (not res!198627) (not e!164249))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237643 (= res!198627 (= nBits!581 i!752))))

(declare-fun b!237644 () Bool)

(declare-fun res!198628 () Bool)

(assert (=> b!237644 (=> (not res!198628) (not e!164249))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237644 (= res!198628 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237645 () Bool)

(declare-fun e!164247 () Bool)

(declare-datatypes ((array!12643 0))(
  ( (array!12644 (arr!6538 (Array (_ BitVec 32) (_ BitVec 8))) (size!5551 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10066 0))(
  ( (BitStream!10067 (buf!6026 array!12643) (currentByte!11206 (_ BitVec 32)) (currentBit!11201 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10066)

(declare-fun array_inv!5292 (array!12643) Bool)

(assert (=> b!237645 (= e!164247 (array_inv!5292 (buf!6026 thiss!1830)))))

(declare-fun b!237646 () Bool)

(declare-fun res!198626 () Bool)

(assert (=> b!237646 (=> (not res!198626) (not e!164249))))

(assert (=> b!237646 (= res!198626 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237647 () Bool)

(declare-fun res!198630 () Bool)

(assert (=> b!237647 (=> (not res!198630) (not e!164249))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237647 (= res!198630 (validate_offset_bits!1 ((_ sign_extend 32) (size!5551 (buf!6026 thiss!1830))) ((_ sign_extend 32) (currentByte!11206 thiss!1830)) ((_ sign_extend 32) (currentBit!11201 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237642 () Bool)

(assert (=> b!237642 (= e!164249 false)))

(declare-fun lt!372879 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237642 (= lt!372879 (bitIndex!0 (size!5551 (buf!6026 thiss!1830)) (currentByte!11206 thiss!1830) (currentBit!11201 thiss!1830)))))

(declare-fun res!198629 () Bool)

(assert (=> start!50798 (=> (not res!198629) (not e!164249))))

(assert (=> start!50798 (= res!198629 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50798 e!164249))

(assert (=> start!50798 true))

(declare-fun inv!12 (BitStream!10066) Bool)

(assert (=> start!50798 (and (inv!12 thiss!1830) e!164247)))

(assert (= (and start!50798 res!198629) b!237647))

(assert (= (and b!237647 res!198630) b!237644))

(assert (= (and b!237644 res!198628) b!237646))

(assert (= (and b!237646 res!198626) b!237643))

(assert (= (and b!237643 res!198627) b!237642))

(assert (= start!50798 b!237645))

(declare-fun m!360027 () Bool)

(assert (=> b!237647 m!360027))

(declare-fun m!360029 () Bool)

(assert (=> b!237642 m!360029))

(declare-fun m!360031 () Bool)

(assert (=> b!237645 m!360031))

(declare-fun m!360033 () Bool)

(assert (=> b!237646 m!360033))

(declare-fun m!360035 () Bool)

(assert (=> b!237644 m!360035))

(declare-fun m!360037 () Bool)

(assert (=> start!50798 m!360037))

(push 1)

(assert (not start!50798))

(assert (not b!237647))

(assert (not b!237642))

(assert (not b!237644))

(assert (not b!237645))

(assert (not b!237646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

