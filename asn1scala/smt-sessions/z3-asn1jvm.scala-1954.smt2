; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50806 () Bool)

(assert start!50806)

(declare-fun res!198690 () Bool)

(declare-fun e!164290 () Bool)

(assert (=> start!50806 (=> (not res!198690) (not e!164290))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50806 (= res!198690 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50806 e!164290))

(assert (=> start!50806 true))

(declare-datatypes ((array!12651 0))(
  ( (array!12652 (arr!6542 (Array (_ BitVec 32) (_ BitVec 8))) (size!5555 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10074 0))(
  ( (BitStream!10075 (buf!6030 array!12651) (currentByte!11210 (_ BitVec 32)) (currentBit!11205 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10074)

(declare-fun e!164291 () Bool)

(declare-fun inv!12 (BitStream!10074) Bool)

(assert (=> start!50806 (and (inv!12 thiss!1830) e!164291)))

(declare-fun b!237714 () Bool)

(declare-fun res!198686 () Bool)

(declare-fun e!164288 () Bool)

(assert (=> b!237714 (=> (not res!198686) (not e!164288))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237714 (= res!198686 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237715 () Bool)

(declare-fun array_inv!5296 (array!12651) Bool)

(assert (=> b!237715 (= e!164291 (array_inv!5296 (buf!6030 thiss!1830)))))

(declare-fun b!237716 () Bool)

(declare-fun res!198687 () Bool)

(assert (=> b!237716 (=> (not res!198687) (not e!164288))))

(assert (=> b!237716 (= res!198687 (= nBits!581 i!752))))

(declare-fun b!237717 () Bool)

(declare-fun res!198688 () Bool)

(assert (=> b!237717 (=> (not res!198688) (not e!164288))))

(assert (=> b!237717 (= res!198688 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237718 () Bool)

(assert (=> b!237718 (= e!164290 e!164288)))

(declare-fun res!198689 () Bool)

(assert (=> b!237718 (=> (not res!198689) (not e!164288))))

(declare-fun lt!372896 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237718 (= res!198689 (validate_offset_bits!1 ((_ sign_extend 32) (size!5555 (buf!6030 thiss!1830))) ((_ sign_extend 32) (currentByte!11210 thiss!1830)) ((_ sign_extend 32) (currentBit!11205 thiss!1830)) lt!372896))))

(assert (=> b!237718 (= lt!372896 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237719 () Bool)

(declare-fun lt!372897 () (_ BitVec 64))

(assert (=> b!237719 (= e!164288 (not (= lt!372897 (bvadd lt!372897 lt!372896))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237719 (= lt!372897 (bitIndex!0 (size!5555 (buf!6030 thiss!1830)) (currentByte!11210 thiss!1830) (currentBit!11205 thiss!1830)))))

(assert (= (and start!50806 res!198690) b!237718))

(assert (= (and b!237718 res!198689) b!237717))

(assert (= (and b!237717 res!198688) b!237714))

(assert (= (and b!237714 res!198686) b!237716))

(assert (= (and b!237716 res!198687) b!237719))

(assert (= start!50806 b!237715))

(declare-fun m!360075 () Bool)

(assert (=> b!237718 m!360075))

(declare-fun m!360077 () Bool)

(assert (=> start!50806 m!360077))

(declare-fun m!360079 () Bool)

(assert (=> b!237714 m!360079))

(declare-fun m!360081 () Bool)

(assert (=> b!237715 m!360081))

(declare-fun m!360083 () Bool)

(assert (=> b!237719 m!360083))

(declare-fun m!360085 () Bool)

(assert (=> b!237717 m!360085))

(check-sat (not start!50806) (not b!237714) (not b!237715) (not b!237718) (not b!237719) (not b!237717))
