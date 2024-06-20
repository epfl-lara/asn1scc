; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50800 () Bool)

(assert start!50800)

(declare-fun b!237660 () Bool)

(declare-fun res!198643 () Bool)

(declare-fun e!164256 () Bool)

(assert (=> b!237660 (=> (not res!198643) (not e!164256))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237660 (= res!198643 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237661 () Bool)

(declare-fun e!164258 () Bool)

(declare-datatypes ((array!12645 0))(
  ( (array!12646 (arr!6539 (Array (_ BitVec 32) (_ BitVec 8))) (size!5552 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10068 0))(
  ( (BitStream!10069 (buf!6027 array!12645) (currentByte!11207 (_ BitVec 32)) (currentBit!11202 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10068)

(declare-fun array_inv!5293 (array!12645) Bool)

(assert (=> b!237661 (= e!164258 (array_inv!5293 (buf!6027 thiss!1830)))))

(declare-fun res!198644 () Bool)

(assert (=> start!50800 (=> (not res!198644) (not e!164256))))

(assert (=> start!50800 (= res!198644 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50800 e!164256))

(assert (=> start!50800 true))

(declare-fun inv!12 (BitStream!10068) Bool)

(assert (=> start!50800 (and (inv!12 thiss!1830) e!164258)))

(declare-fun b!237662 () Bool)

(declare-fun res!198642 () Bool)

(assert (=> b!237662 (=> (not res!198642) (not e!164256))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237662 (= res!198642 (validate_offset_bits!1 ((_ sign_extend 32) (size!5552 (buf!6027 thiss!1830))) ((_ sign_extend 32) (currentByte!11207 thiss!1830)) ((_ sign_extend 32) (currentBit!11202 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237663 () Bool)

(declare-fun res!198645 () Bool)

(assert (=> b!237663 (=> (not res!198645) (not e!164256))))

(assert (=> b!237663 (= res!198645 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237664 () Bool)

(declare-fun res!198641 () Bool)

(assert (=> b!237664 (=> (not res!198641) (not e!164256))))

(assert (=> b!237664 (= res!198641 (= nBits!581 i!752))))

(declare-fun b!237665 () Bool)

(assert (=> b!237665 (= e!164256 false)))

(declare-fun lt!372882 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237665 (= lt!372882 (bitIndex!0 (size!5552 (buf!6027 thiss!1830)) (currentByte!11207 thiss!1830) (currentBit!11202 thiss!1830)))))

(assert (= (and start!50800 res!198644) b!237662))

(assert (= (and b!237662 res!198642) b!237660))

(assert (= (and b!237660 res!198643) b!237663))

(assert (= (and b!237663 res!198645) b!237664))

(assert (= (and b!237664 res!198641) b!237665))

(assert (= start!50800 b!237661))

(declare-fun m!360039 () Bool)

(assert (=> b!237665 m!360039))

(declare-fun m!360041 () Bool)

(assert (=> b!237661 m!360041))

(declare-fun m!360043 () Bool)

(assert (=> b!237662 m!360043))

(declare-fun m!360045 () Bool)

(assert (=> b!237660 m!360045))

(declare-fun m!360047 () Bool)

(assert (=> b!237663 m!360047))

(declare-fun m!360049 () Bool)

(assert (=> start!50800 m!360049))

(check-sat (not b!237663) (not b!237665) (not start!50800) (not b!237662) (not b!237660) (not b!237661))
