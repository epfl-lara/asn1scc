; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50756 () Bool)

(assert start!50756)

(declare-fun b!237264 () Bool)

(declare-fun e!164015 () Bool)

(declare-fun e!164016 () Bool)

(assert (=> b!237264 (= e!164015 e!164016)))

(declare-fun res!198313 () Bool)

(assert (=> b!237264 (=> (not res!198313) (not e!164016))))

(declare-datatypes ((array!12601 0))(
  ( (array!12602 (arr!6517 (Array (_ BitVec 32) (_ BitVec 8))) (size!5530 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10024 0))(
  ( (BitStream!10025 (buf!6005 array!12601) (currentByte!11185 (_ BitVec 32)) (currentBit!11180 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10024)

(declare-fun lt!372766 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237264 (= res!198313 (validate_offset_bits!1 ((_ sign_extend 32) (size!5530 (buf!6005 thiss!1830))) ((_ sign_extend 32) (currentByte!11185 thiss!1830)) ((_ sign_extend 32) (currentBit!11180 thiss!1830)) lt!372766))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237264 (= lt!372766 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237265 () Bool)

(declare-fun res!198311 () Bool)

(assert (=> b!237265 (=> (not res!198311) (not e!164016))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237265 (= res!198311 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237266 () Bool)

(declare-fun lt!372768 () (_ BitVec 64))

(declare-fun lt!372767 () (_ BitVec 64))

(assert (=> b!237266 (= e!164016 (and (= lt!372767 (bvand lt!372766 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!372767 (bvand (bvadd lt!372768 lt!372766) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!237266 (= lt!372767 (bvand lt!372768 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237266 (= lt!372768 (bitIndex!0 (size!5530 (buf!6005 thiss!1830)) (currentByte!11185 thiss!1830) (currentBit!11180 thiss!1830)))))

(declare-fun b!237267 () Bool)

(declare-fun res!198315 () Bool)

(assert (=> b!237267 (=> (not res!198315) (not e!164016))))

(assert (=> b!237267 (= res!198315 (= nBits!581 i!752))))

(declare-fun res!198314 () Bool)

(assert (=> start!50756 (=> (not res!198314) (not e!164015))))

(assert (=> start!50756 (= res!198314 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50756 e!164015))

(assert (=> start!50756 true))

(declare-fun e!164018 () Bool)

(declare-fun inv!12 (BitStream!10024) Bool)

(assert (=> start!50756 (and (inv!12 thiss!1830) e!164018)))

(declare-fun b!237268 () Bool)

(declare-fun array_inv!5271 (array!12601) Bool)

(assert (=> b!237268 (= e!164018 (array_inv!5271 (buf!6005 thiss!1830)))))

(declare-fun b!237269 () Bool)

(declare-fun res!198312 () Bool)

(assert (=> b!237269 (=> (not res!198312) (not e!164016))))

(assert (=> b!237269 (= res!198312 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50756 res!198314) b!237264))

(assert (= (and b!237264 res!198313) b!237265))

(assert (= (and b!237265 res!198311) b!237269))

(assert (= (and b!237269 res!198312) b!237267))

(assert (= (and b!237267 res!198315) b!237266))

(assert (= start!50756 b!237268))

(declare-fun m!359775 () Bool)

(assert (=> b!237264 m!359775))

(declare-fun m!359777 () Bool)

(assert (=> b!237269 m!359777))

(declare-fun m!359779 () Bool)

(assert (=> b!237266 m!359779))

(declare-fun m!359781 () Bool)

(assert (=> b!237265 m!359781))

(declare-fun m!359783 () Bool)

(assert (=> start!50756 m!359783))

(declare-fun m!359785 () Bool)

(assert (=> b!237268 m!359785))

(push 1)

(assert (not b!237269))

(assert (not b!237268))

(assert (not start!50756))

(assert (not b!237266))

(assert (not b!237264))

(assert (not b!237265))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

