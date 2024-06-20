; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50770 () Bool)

(assert start!50770)

(declare-fun b!237390 () Bool)

(declare-fun res!198420 () Bool)

(declare-fun e!164102 () Bool)

(assert (=> b!237390 (=> (not res!198420) (not e!164102))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237390 (= res!198420 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!198419 () Bool)

(declare-fun e!164099 () Bool)

(assert (=> start!50770 (=> (not res!198419) (not e!164099))))

(assert (=> start!50770 (= res!198419 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50770 e!164099))

(assert (=> start!50770 true))

(declare-datatypes ((array!12615 0))(
  ( (array!12616 (arr!6524 (Array (_ BitVec 32) (_ BitVec 8))) (size!5537 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10038 0))(
  ( (BitStream!10039 (buf!6012 array!12615) (currentByte!11192 (_ BitVec 32)) (currentBit!11187 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10038)

(declare-fun e!164101 () Bool)

(declare-fun inv!12 (BitStream!10038) Bool)

(assert (=> start!50770 (and (inv!12 thiss!1830) e!164101)))

(declare-fun b!237391 () Bool)

(declare-fun res!198418 () Bool)

(assert (=> b!237391 (=> (not res!198418) (not e!164102))))

(assert (=> b!237391 (= res!198418 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237392 () Bool)

(declare-fun lt!372816 () (_ BitVec 64))

(declare-fun lt!372815 () (_ BitVec 64))

(assert (=> b!237392 (= e!164102 (and (= lt!372816 (bvadd lt!372816 lt!372815)) (bvsgt lt!372815 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237392 (= lt!372816 (bitIndex!0 (size!5537 (buf!6012 thiss!1830)) (currentByte!11192 thiss!1830) (currentBit!11187 thiss!1830)))))

(declare-fun b!237393 () Bool)

(declare-fun array_inv!5278 (array!12615) Bool)

(assert (=> b!237393 (= e!164101 (array_inv!5278 (buf!6012 thiss!1830)))))

(declare-fun b!237394 () Bool)

(assert (=> b!237394 (= e!164099 e!164102)))

(declare-fun res!198417 () Bool)

(assert (=> b!237394 (=> (not res!198417) (not e!164102))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237394 (= res!198417 (validate_offset_bits!1 ((_ sign_extend 32) (size!5537 (buf!6012 thiss!1830))) ((_ sign_extend 32) (currentByte!11192 thiss!1830)) ((_ sign_extend 32) (currentBit!11187 thiss!1830)) lt!372815))))

(assert (=> b!237394 (= lt!372815 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237395 () Bool)

(declare-fun res!198416 () Bool)

(assert (=> b!237395 (=> (not res!198416) (not e!164102))))

(assert (=> b!237395 (= res!198416 (= nBits!581 i!752))))

(assert (= (and start!50770 res!198419) b!237394))

(assert (= (and b!237394 res!198417) b!237390))

(assert (= (and b!237390 res!198420) b!237391))

(assert (= (and b!237391 res!198418) b!237395))

(assert (= (and b!237395 res!198416) b!237392))

(assert (= start!50770 b!237393))

(declare-fun m!359859 () Bool)

(assert (=> b!237392 m!359859))

(declare-fun m!359861 () Bool)

(assert (=> b!237393 m!359861))

(declare-fun m!359863 () Bool)

(assert (=> b!237390 m!359863))

(declare-fun m!359865 () Bool)

(assert (=> b!237391 m!359865))

(declare-fun m!359867 () Bool)

(assert (=> b!237394 m!359867))

(declare-fun m!359869 () Bool)

(assert (=> start!50770 m!359869))

(check-sat (not b!237394) (not b!237390) (not b!237392) (not b!237393) (not start!50770) (not b!237391))
(check-sat)
