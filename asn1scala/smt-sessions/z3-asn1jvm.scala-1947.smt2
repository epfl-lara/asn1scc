; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50764 () Bool)

(assert start!50764)

(declare-fun b!237336 () Bool)

(declare-fun res!198371 () Bool)

(declare-fun e!164066 () Bool)

(assert (=> b!237336 (=> (not res!198371) (not e!164066))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237336 (= res!198371 (= nBits!581 i!752))))

(declare-fun b!237337 () Bool)

(declare-fun res!198374 () Bool)

(assert (=> b!237337 (=> (not res!198374) (not e!164066))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237337 (= res!198374 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237338 () Bool)

(declare-fun e!164063 () Bool)

(declare-datatypes ((array!12609 0))(
  ( (array!12610 (arr!6521 (Array (_ BitVec 32) (_ BitVec 8))) (size!5534 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10032 0))(
  ( (BitStream!10033 (buf!6009 array!12609) (currentByte!11189 (_ BitVec 32)) (currentBit!11184 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10032)

(declare-fun array_inv!5275 (array!12609) Bool)

(assert (=> b!237338 (= e!164063 (array_inv!5275 (buf!6009 thiss!1830)))))

(declare-fun lt!372798 () (_ BitVec 64))

(declare-fun b!237339 () Bool)

(declare-fun lt!372797 () (_ BitVec 64))

(assert (=> b!237339 (= e!164066 (and (= lt!372798 (bvadd lt!372798 lt!372797)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237339 (= lt!372798 (bitIndex!0 (size!5534 (buf!6009 thiss!1830)) (currentByte!11189 thiss!1830) (currentBit!11184 thiss!1830)))))

(declare-fun res!198375 () Bool)

(declare-fun e!164064 () Bool)

(assert (=> start!50764 (=> (not res!198375) (not e!164064))))

(assert (=> start!50764 (= res!198375 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50764 e!164064))

(assert (=> start!50764 true))

(declare-fun inv!12 (BitStream!10032) Bool)

(assert (=> start!50764 (and (inv!12 thiss!1830) e!164063)))

(declare-fun b!237340 () Bool)

(assert (=> b!237340 (= e!164064 e!164066)))

(declare-fun res!198373 () Bool)

(assert (=> b!237340 (=> (not res!198373) (not e!164066))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237340 (= res!198373 (validate_offset_bits!1 ((_ sign_extend 32) (size!5534 (buf!6009 thiss!1830))) ((_ sign_extend 32) (currentByte!11189 thiss!1830)) ((_ sign_extend 32) (currentBit!11184 thiss!1830)) lt!372797))))

(assert (=> b!237340 (= lt!372797 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237341 () Bool)

(declare-fun res!198372 () Bool)

(assert (=> b!237341 (=> (not res!198372) (not e!164066))))

(assert (=> b!237341 (= res!198372 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50764 res!198375) b!237340))

(assert (= (and b!237340 res!198373) b!237341))

(assert (= (and b!237341 res!198372) b!237337))

(assert (= (and b!237337 res!198374) b!237336))

(assert (= (and b!237336 res!198371) b!237339))

(assert (= start!50764 b!237338))

(declare-fun m!359823 () Bool)

(assert (=> b!237341 m!359823))

(declare-fun m!359825 () Bool)

(assert (=> b!237338 m!359825))

(declare-fun m!359827 () Bool)

(assert (=> b!237339 m!359827))

(declare-fun m!359829 () Bool)

(assert (=> b!237340 m!359829))

(declare-fun m!359831 () Bool)

(assert (=> start!50764 m!359831))

(declare-fun m!359833 () Bool)

(assert (=> b!237337 m!359833))

(check-sat (not start!50764) (not b!237339) (not b!237341) (not b!237338) (not b!237337) (not b!237340))
(check-sat)
