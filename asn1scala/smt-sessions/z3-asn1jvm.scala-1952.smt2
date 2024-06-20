; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50794 () Bool)

(assert start!50794)

(declare-fun b!237606 () Bool)

(declare-fun e!164229 () Bool)

(assert (=> b!237606 (= e!164229 false)))

(declare-fun lt!372873 () (_ BitVec 64))

(declare-datatypes ((array!12639 0))(
  ( (array!12640 (arr!6536 (Array (_ BitVec 32) (_ BitVec 8))) (size!5549 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10062 0))(
  ( (BitStream!10063 (buf!6024 array!12639) (currentByte!11204 (_ BitVec 32)) (currentBit!11199 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10062)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237606 (= lt!372873 (bitIndex!0 (size!5549 (buf!6024 thiss!1830)) (currentByte!11204 thiss!1830) (currentBit!11199 thiss!1830)))))

(declare-fun b!237607 () Bool)

(declare-fun res!198597 () Bool)

(assert (=> b!237607 (=> (not res!198597) (not e!164229))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237607 (= res!198597 (validate_offset_bits!1 ((_ sign_extend 32) (size!5549 (buf!6024 thiss!1830))) ((_ sign_extend 32) (currentByte!11204 thiss!1830)) ((_ sign_extend 32) (currentBit!11199 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237608 () Bool)

(declare-fun res!198596 () Bool)

(assert (=> b!237608 (=> (not res!198596) (not e!164229))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237608 (= res!198596 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237609 () Bool)

(declare-fun res!198599 () Bool)

(assert (=> b!237609 (=> (not res!198599) (not e!164229))))

(assert (=> b!237609 (= res!198599 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!198598 () Bool)

(assert (=> start!50794 (=> (not res!198598) (not e!164229))))

(assert (=> start!50794 (= res!198598 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50794 e!164229))

(assert (=> start!50794 true))

(declare-fun e!164230 () Bool)

(declare-fun inv!12 (BitStream!10062) Bool)

(assert (=> start!50794 (and (inv!12 thiss!1830) e!164230)))

(declare-fun b!237610 () Bool)

(declare-fun array_inv!5290 (array!12639) Bool)

(assert (=> b!237610 (= e!164230 (array_inv!5290 (buf!6024 thiss!1830)))))

(declare-fun b!237611 () Bool)

(declare-fun res!198600 () Bool)

(assert (=> b!237611 (=> (not res!198600) (not e!164229))))

(assert (=> b!237611 (= res!198600 (= nBits!581 i!752))))

(assert (= (and start!50794 res!198598) b!237607))

(assert (= (and b!237607 res!198597) b!237609))

(assert (= (and b!237609 res!198599) b!237608))

(assert (= (and b!237608 res!198596) b!237611))

(assert (= (and b!237611 res!198600) b!237606))

(assert (= start!50794 b!237610))

(declare-fun m!360003 () Bool)

(assert (=> b!237610 m!360003))

(declare-fun m!360005 () Bool)

(assert (=> b!237606 m!360005))

(declare-fun m!360007 () Bool)

(assert (=> b!237609 m!360007))

(declare-fun m!360009 () Bool)

(assert (=> b!237607 m!360009))

(declare-fun m!360011 () Bool)

(assert (=> b!237608 m!360011))

(declare-fun m!360013 () Bool)

(assert (=> start!50794 m!360013))

(check-sat (not b!237609) (not b!237610) (not b!237608) (not b!237606) (not start!50794) (not b!237607))
