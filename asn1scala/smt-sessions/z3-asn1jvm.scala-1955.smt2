; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50812 () Bool)

(assert start!50812)

(declare-fun b!237773 () Bool)

(declare-fun res!198740 () Bool)

(declare-fun e!164320 () Bool)

(assert (=> b!237773 (=> (not res!198740) (not e!164320))))

(declare-datatypes ((array!12657 0))(
  ( (array!12658 (arr!6545 (Array (_ BitVec 32) (_ BitVec 8))) (size!5558 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10080 0))(
  ( (BitStream!10081 (buf!6033 array!12657) (currentByte!11213 (_ BitVec 32)) (currentBit!11208 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10080)

(declare-datatypes ((tuple2!20042 0))(
  ( (tuple2!20043 (_1!10925 Bool) (_2!10925 BitStream!10080)) )
))
(declare-fun readBit!0 (BitStream!10080) tuple2!20042)

(assert (=> b!237773 (= res!198740 (_1!10925 (readBit!0 thiss!1830)))))

(declare-fun b!237774 () Bool)

(declare-fun res!198736 () Bool)

(assert (=> b!237774 (=> (not res!198736) (not e!164320))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237774 (= res!198736 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237775 () Bool)

(declare-fun res!198737 () Bool)

(assert (=> b!237775 (=> (not res!198737) (not e!164320))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237775 (= res!198737 (validate_offset_bits!1 ((_ sign_extend 32) (size!5558 (buf!6033 thiss!1830))) ((_ sign_extend 32) (currentByte!11213 thiss!1830)) ((_ sign_extend 32) (currentBit!11208 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun res!198739 () Bool)

(assert (=> start!50812 (=> (not res!198739) (not e!164320))))

(assert (=> start!50812 (= res!198739 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50812 e!164320))

(assert (=> start!50812 true))

(declare-fun e!164319 () Bool)

(declare-fun inv!12 (BitStream!10080) Bool)

(assert (=> start!50812 (and (inv!12 thiss!1830) e!164319)))

(declare-fun b!237776 () Bool)

(declare-fun res!198741 () Bool)

(assert (=> b!237776 (=> (not res!198741) (not e!164320))))

(assert (=> b!237776 (= res!198741 (not (= nBits!581 i!752)))))

(declare-fun b!237777 () Bool)

(assert (=> b!237777 (= e!164320 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!237778 () Bool)

(declare-fun array_inv!5299 (array!12657) Bool)

(assert (=> b!237778 (= e!164319 (array_inv!5299 (buf!6033 thiss!1830)))))

(declare-fun b!237779 () Bool)

(declare-fun res!198738 () Bool)

(assert (=> b!237779 (=> (not res!198738) (not e!164320))))

(assert (=> b!237779 (= res!198738 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50812 res!198739) b!237775))

(assert (= (and b!237775 res!198737) b!237779))

(assert (= (and b!237779 res!198738) b!237774))

(assert (= (and b!237774 res!198736) b!237776))

(assert (= (and b!237776 res!198741) b!237773))

(assert (= (and b!237773 res!198740) b!237777))

(assert (= start!50812 b!237778))

(declare-fun m!360111 () Bool)

(assert (=> b!237774 m!360111))

(declare-fun m!360113 () Bool)

(assert (=> b!237773 m!360113))

(declare-fun m!360115 () Bool)

(assert (=> start!50812 m!360115))

(declare-fun m!360117 () Bool)

(assert (=> b!237779 m!360117))

(declare-fun m!360119 () Bool)

(assert (=> b!237775 m!360119))

(declare-fun m!360121 () Bool)

(assert (=> b!237778 m!360121))

(check-sat (not b!237778) (not start!50812) (not b!237775) (not b!237774) (not b!237779) (not b!237773))
(check-sat)
