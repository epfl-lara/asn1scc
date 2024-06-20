; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50762 () Bool)

(assert start!50762)

(declare-fun lt!372791 () (_ BitVec 64))

(declare-fun e!164052 () Bool)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun b!237318 () Bool)

(declare-fun lt!372792 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> b!237318 (= e!164052 (and (= lt!372792 (bvadd lt!372792 lt!372791)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-datatypes ((array!12607 0))(
  ( (array!12608 (arr!6520 (Array (_ BitVec 32) (_ BitVec 8))) (size!5533 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10030 0))(
  ( (BitStream!10031 (buf!6008 array!12607) (currentByte!11188 (_ BitVec 32)) (currentBit!11183 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10030)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237318 (= lt!372792 (bitIndex!0 (size!5533 (buf!6008 thiss!1830)) (currentByte!11188 thiss!1830) (currentBit!11183 thiss!1830)))))

(declare-fun b!237319 () Bool)

(declare-fun e!164051 () Bool)

(declare-fun array_inv!5274 (array!12607) Bool)

(assert (=> b!237319 (= e!164051 (array_inv!5274 (buf!6008 thiss!1830)))))

(declare-fun res!198356 () Bool)

(declare-fun e!164053 () Bool)

(assert (=> start!50762 (=> (not res!198356) (not e!164053))))

(assert (=> start!50762 (= res!198356 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50762 e!164053))

(assert (=> start!50762 true))

(declare-fun inv!12 (BitStream!10030) Bool)

(assert (=> start!50762 (and (inv!12 thiss!1830) e!164051)))

(declare-fun b!237320 () Bool)

(declare-fun res!198359 () Bool)

(assert (=> b!237320 (=> (not res!198359) (not e!164052))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237320 (= res!198359 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237321 () Bool)

(declare-fun res!198360 () Bool)

(assert (=> b!237321 (=> (not res!198360) (not e!164052))))

(assert (=> b!237321 (= res!198360 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237322 () Bool)

(assert (=> b!237322 (= e!164053 e!164052)))

(declare-fun res!198358 () Bool)

(assert (=> b!237322 (=> (not res!198358) (not e!164052))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237322 (= res!198358 (validate_offset_bits!1 ((_ sign_extend 32) (size!5533 (buf!6008 thiss!1830))) ((_ sign_extend 32) (currentByte!11188 thiss!1830)) ((_ sign_extend 32) (currentBit!11183 thiss!1830)) lt!372791))))

(assert (=> b!237322 (= lt!372791 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237323 () Bool)

(declare-fun res!198357 () Bool)

(assert (=> b!237323 (=> (not res!198357) (not e!164052))))

(assert (=> b!237323 (= res!198357 (= nBits!581 i!752))))

(assert (= (and start!50762 res!198356) b!237322))

(assert (= (and b!237322 res!198358) b!237321))

(assert (= (and b!237321 res!198360) b!237320))

(assert (= (and b!237320 res!198359) b!237323))

(assert (= (and b!237323 res!198357) b!237318))

(assert (= start!50762 b!237319))

(declare-fun m!359811 () Bool)

(assert (=> b!237318 m!359811))

(declare-fun m!359813 () Bool)

(assert (=> b!237322 m!359813))

(declare-fun m!359815 () Bool)

(assert (=> b!237319 m!359815))

(declare-fun m!359817 () Bool)

(assert (=> start!50762 m!359817))

(declare-fun m!359819 () Bool)

(assert (=> b!237321 m!359819))

(declare-fun m!359821 () Bool)

(assert (=> b!237320 m!359821))

(push 1)

(assert (not b!237318))

(assert (not start!50762))

(assert (not b!237321))

(assert (not b!237320))

(assert (not b!237322))

(assert (not b!237319))

(check-sat)

(pop 1)

(push 1)

(check-sat)

