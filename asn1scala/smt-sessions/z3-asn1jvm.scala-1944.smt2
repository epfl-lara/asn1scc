; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50746 () Bool)

(assert start!50746)

(declare-fun b!237178 () Bool)

(declare-fun e!163969 () Bool)

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237178 (= e!163969 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!237179 () Bool)

(declare-fun res!198241 () Bool)

(assert (=> b!237179 (=> (not res!198241) (not e!163969))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237179 (= res!198241 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237180 () Bool)

(declare-fun e!163970 () Bool)

(declare-datatypes ((array!12591 0))(
  ( (array!12592 (arr!6512 (Array (_ BitVec 32) (_ BitVec 8))) (size!5525 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10014 0))(
  ( (BitStream!10015 (buf!6000 array!12591) (currentByte!11180 (_ BitVec 32)) (currentBit!11175 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10014)

(declare-fun array_inv!5266 (array!12591) Bool)

(assert (=> b!237180 (= e!163970 (array_inv!5266 (buf!6000 thiss!1830)))))

(declare-fun res!198240 () Bool)

(assert (=> start!50746 (=> (not res!198240) (not e!163969))))

(assert (=> start!50746 (= res!198240 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50746 e!163969))

(assert (=> start!50746 true))

(declare-fun inv!12 (BitStream!10014) Bool)

(assert (=> start!50746 (and (inv!12 thiss!1830) e!163970)))

(declare-fun b!237181 () Bool)

(declare-fun res!198243 () Bool)

(assert (=> b!237181 (=> (not res!198243) (not e!163969))))

(assert (=> b!237181 (= res!198243 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237182 () Bool)

(declare-fun res!198242 () Bool)

(assert (=> b!237182 (=> (not res!198242) (not e!163969))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237182 (= res!198242 (validate_offset_bits!1 ((_ sign_extend 32) (size!5525 (buf!6000 thiss!1830))) ((_ sign_extend 32) (currentByte!11180 thiss!1830)) ((_ sign_extend 32) (currentBit!11175 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(assert (= (and start!50746 res!198240) b!237182))

(assert (= (and b!237182 res!198242) b!237181))

(assert (= (and b!237181 res!198243) b!237179))

(assert (= (and b!237179 res!198241) b!237178))

(assert (= start!50746 b!237180))

(declare-fun m!359719 () Bool)

(assert (=> b!237181 m!359719))

(declare-fun m!359721 () Bool)

(assert (=> b!237180 m!359721))

(declare-fun m!359723 () Bool)

(assert (=> start!50746 m!359723))

(declare-fun m!359725 () Bool)

(assert (=> b!237179 m!359725))

(declare-fun m!359727 () Bool)

(assert (=> b!237182 m!359727))

(check-sat (not b!237182) (not b!237180) (not start!50746) (not b!237181) (not b!237179))
(check-sat)
