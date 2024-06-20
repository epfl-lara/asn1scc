; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50788 () Bool)

(assert start!50788)

(declare-fun b!237552 () Bool)

(declare-fun e!164202 () Bool)

(declare-datatypes ((array!12633 0))(
  ( (array!12634 (arr!6533 (Array (_ BitVec 32) (_ BitVec 8))) (size!5546 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10056 0))(
  ( (BitStream!10057 (buf!6021 array!12633) (currentByte!11201 (_ BitVec 32)) (currentBit!11196 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10056)

(declare-fun array_inv!5287 (array!12633) Bool)

(assert (=> b!237552 (= e!164202 (array_inv!5287 (buf!6021 thiss!1830)))))

(declare-fun b!237553 () Bool)

(declare-fun e!164203 () Bool)

(assert (=> b!237553 (= e!164203 false)))

(declare-fun lt!372864 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237553 (= lt!372864 (bitIndex!0 (size!5546 (buf!6021 thiss!1830)) (currentByte!11201 thiss!1830) (currentBit!11196 thiss!1830)))))

(declare-fun b!237554 () Bool)

(declare-fun res!198553 () Bool)

(assert (=> b!237554 (=> (not res!198553) (not e!164203))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237554 (= res!198553 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237555 () Bool)

(declare-fun res!198555 () Bool)

(assert (=> b!237555 (=> (not res!198555) (not e!164203))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237555 (= res!198555 (validate_offset_bits!1 ((_ sign_extend 32) (size!5546 (buf!6021 thiss!1830))) ((_ sign_extend 32) (currentByte!11201 thiss!1830)) ((_ sign_extend 32) (currentBit!11196 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun res!198554 () Bool)

(assert (=> start!50788 (=> (not res!198554) (not e!164203))))

(assert (=> start!50788 (= res!198554 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50788 e!164203))

(assert (=> start!50788 true))

(declare-fun inv!12 (BitStream!10056) Bool)

(assert (=> start!50788 (and (inv!12 thiss!1830) e!164202)))

(declare-fun b!237556 () Bool)

(declare-fun res!198551 () Bool)

(assert (=> b!237556 (=> (not res!198551) (not e!164203))))

(assert (=> b!237556 (= res!198551 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237557 () Bool)

(declare-fun res!198552 () Bool)

(assert (=> b!237557 (=> (not res!198552) (not e!164203))))

(assert (=> b!237557 (= res!198552 (= nBits!581 i!752))))

(assert (= (and start!50788 res!198554) b!237555))

(assert (= (and b!237555 res!198555) b!237554))

(assert (= (and b!237554 res!198553) b!237556))

(assert (= (and b!237556 res!198551) b!237557))

(assert (= (and b!237557 res!198552) b!237553))

(assert (= start!50788 b!237552))

(declare-fun m!359967 () Bool)

(assert (=> b!237555 m!359967))

(declare-fun m!359969 () Bool)

(assert (=> b!237553 m!359969))

(declare-fun m!359971 () Bool)

(assert (=> start!50788 m!359971))

(declare-fun m!359973 () Bool)

(assert (=> b!237552 m!359973))

(declare-fun m!359975 () Bool)

(assert (=> b!237554 m!359975))

(declare-fun m!359977 () Bool)

(assert (=> b!237556 m!359977))

(check-sat (not start!50788) (not b!237556) (not b!237555) (not b!237553) (not b!237552) (not b!237554))
