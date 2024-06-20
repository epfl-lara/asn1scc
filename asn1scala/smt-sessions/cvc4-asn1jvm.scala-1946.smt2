; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50760 () Bool)

(assert start!50760)

(declare-fun b!237300 () Bool)

(declare-fun e!164041 () Bool)

(declare-datatypes ((array!12605 0))(
  ( (array!12606 (arr!6519 (Array (_ BitVec 32) (_ BitVec 8))) (size!5532 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10028 0))(
  ( (BitStream!10029 (buf!6007 array!12605) (currentByte!11187 (_ BitVec 32)) (currentBit!11182 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10028)

(declare-fun array_inv!5273 (array!12605) Bool)

(assert (=> b!237300 (= e!164041 (array_inv!5273 (buf!6007 thiss!1830)))))

(declare-fun b!237301 () Bool)

(declare-fun res!198341 () Bool)

(declare-fun e!164039 () Bool)

(assert (=> b!237301 (=> (not res!198341) (not e!164039))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237301 (= res!198341 (= nBits!581 i!752))))

(declare-fun b!237302 () Bool)

(declare-fun res!198345 () Bool)

(assert (=> b!237302 (=> (not res!198345) (not e!164039))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237302 (= res!198345 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun res!198344 () Bool)

(declare-fun e!164040 () Bool)

(assert (=> start!50760 (=> (not res!198344) (not e!164040))))

(assert (=> start!50760 (= res!198344 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50760 e!164040))

(assert (=> start!50760 true))

(declare-fun inv!12 (BitStream!10028) Bool)

(assert (=> start!50760 (and (inv!12 thiss!1830) e!164041)))

(declare-fun b!237303 () Bool)

(declare-fun res!198343 () Bool)

(assert (=> b!237303 (=> (not res!198343) (not e!164039))))

(assert (=> b!237303 (= res!198343 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!372785 () (_ BitVec 64))

(declare-fun b!237304 () Bool)

(declare-fun lt!372786 () (_ BitVec 64))

(declare-fun lt!372784 () (_ BitVec 64))

(assert (=> b!237304 (= e!164039 (and (= lt!372785 (bvand lt!372784 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!372785 (bvand (bvadd lt!372786 lt!372784) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!237304 (= lt!372785 (bvand lt!372786 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237304 (= lt!372786 (bitIndex!0 (size!5532 (buf!6007 thiss!1830)) (currentByte!11187 thiss!1830) (currentBit!11182 thiss!1830)))))

(declare-fun b!237305 () Bool)

(assert (=> b!237305 (= e!164040 e!164039)))

(declare-fun res!198342 () Bool)

(assert (=> b!237305 (=> (not res!198342) (not e!164039))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237305 (= res!198342 (validate_offset_bits!1 ((_ sign_extend 32) (size!5532 (buf!6007 thiss!1830))) ((_ sign_extend 32) (currentByte!11187 thiss!1830)) ((_ sign_extend 32) (currentBit!11182 thiss!1830)) lt!372784))))

(assert (=> b!237305 (= lt!372784 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(assert (= (and start!50760 res!198344) b!237305))

(assert (= (and b!237305 res!198342) b!237303))

(assert (= (and b!237303 res!198343) b!237302))

(assert (= (and b!237302 res!198345) b!237301))

(assert (= (and b!237301 res!198341) b!237304))

(assert (= start!50760 b!237300))

(declare-fun m!359799 () Bool)

(assert (=> b!237304 m!359799))

(declare-fun m!359801 () Bool)

(assert (=> b!237302 m!359801))

(declare-fun m!359803 () Bool)

(assert (=> b!237300 m!359803))

(declare-fun m!359805 () Bool)

(assert (=> b!237305 m!359805))

(declare-fun m!359807 () Bool)

(assert (=> start!50760 m!359807))

(declare-fun m!359809 () Bool)

(assert (=> b!237303 m!359809))

(push 1)

(assert (not b!237303))

(assert (not b!237305))

(assert (not b!237304))

(assert (not b!237302))

(assert (not b!237300))

(assert (not start!50760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

