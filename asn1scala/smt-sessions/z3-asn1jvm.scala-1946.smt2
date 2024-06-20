; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50758 () Bool)

(assert start!50758)

(declare-fun b!237282 () Bool)

(declare-fun e!164027 () Bool)

(declare-datatypes ((array!12603 0))(
  ( (array!12604 (arr!6518 (Array (_ BitVec 32) (_ BitVec 8))) (size!5531 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10026 0))(
  ( (BitStream!10027 (buf!6006 array!12603) (currentByte!11186 (_ BitVec 32)) (currentBit!11181 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10026)

(declare-fun array_inv!5272 (array!12603) Bool)

(assert (=> b!237282 (= e!164027 (array_inv!5272 (buf!6006 thiss!1830)))))

(declare-fun e!164028 () Bool)

(declare-fun lt!372777 () (_ BitVec 64))

(declare-fun lt!372775 () (_ BitVec 64))

(declare-fun b!237283 () Bool)

(declare-fun lt!372776 () (_ BitVec 64))

(assert (=> b!237283 (= e!164028 (and (= lt!372775 (bvand lt!372777 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!372775 (bvand (bvadd lt!372776 lt!372777) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!237283 (= lt!372775 (bvand lt!372776 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237283 (= lt!372776 (bitIndex!0 (size!5531 (buf!6006 thiss!1830)) (currentByte!11186 thiss!1830) (currentBit!11181 thiss!1830)))))

(declare-fun res!198330 () Bool)

(declare-fun e!164029 () Bool)

(assert (=> start!50758 (=> (not res!198330) (not e!164029))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50758 (= res!198330 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50758 e!164029))

(assert (=> start!50758 true))

(declare-fun inv!12 (BitStream!10026) Bool)

(assert (=> start!50758 (and (inv!12 thiss!1830) e!164027)))

(declare-fun b!237284 () Bool)

(declare-fun res!198329 () Bool)

(assert (=> b!237284 (=> (not res!198329) (not e!164028))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237284 (= res!198329 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237285 () Bool)

(declare-fun res!198326 () Bool)

(assert (=> b!237285 (=> (not res!198326) (not e!164028))))

(assert (=> b!237285 (= res!198326 (= nBits!581 i!752))))

(declare-fun b!237286 () Bool)

(assert (=> b!237286 (= e!164029 e!164028)))

(declare-fun res!198328 () Bool)

(assert (=> b!237286 (=> (not res!198328) (not e!164028))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237286 (= res!198328 (validate_offset_bits!1 ((_ sign_extend 32) (size!5531 (buf!6006 thiss!1830))) ((_ sign_extend 32) (currentByte!11186 thiss!1830)) ((_ sign_extend 32) (currentBit!11181 thiss!1830)) lt!372777))))

(assert (=> b!237286 (= lt!372777 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237287 () Bool)

(declare-fun res!198327 () Bool)

(assert (=> b!237287 (=> (not res!198327) (not e!164028))))

(assert (=> b!237287 (= res!198327 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50758 res!198330) b!237286))

(assert (= (and b!237286 res!198328) b!237284))

(assert (= (and b!237284 res!198329) b!237287))

(assert (= (and b!237287 res!198327) b!237285))

(assert (= (and b!237285 res!198326) b!237283))

(assert (= start!50758 b!237282))

(declare-fun m!359787 () Bool)

(assert (=> b!237287 m!359787))

(declare-fun m!359789 () Bool)

(assert (=> start!50758 m!359789))

(declare-fun m!359791 () Bool)

(assert (=> b!237284 m!359791))

(declare-fun m!359793 () Bool)

(assert (=> b!237282 m!359793))

(declare-fun m!359795 () Bool)

(assert (=> b!237286 m!359795))

(declare-fun m!359797 () Bool)

(assert (=> b!237283 m!359797))

(check-sat (not b!237283) (not start!50758) (not b!237287) (not b!237282) (not b!237286) (not b!237284))
(check-sat)
