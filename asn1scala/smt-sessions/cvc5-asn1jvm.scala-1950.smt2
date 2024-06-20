; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50780 () Bool)

(assert start!50780)

(declare-fun b!237480 () Bool)

(declare-fun res!198493 () Bool)

(declare-fun e!164161 () Bool)

(assert (=> b!237480 (=> (not res!198493) (not e!164161))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237480 (= res!198493 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237481 () Bool)

(declare-fun res!198494 () Bool)

(assert (=> b!237481 (=> (not res!198494) (not e!164161))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237481 (= res!198494 (= nBits!581 i!752))))

(declare-fun b!237482 () Bool)

(declare-fun res!198492 () Bool)

(assert (=> b!237482 (=> (not res!198492) (not e!164161))))

(assert (=> b!237482 (= res!198492 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!198495 () Bool)

(declare-fun e!164160 () Bool)

(assert (=> start!50780 (=> (not res!198495) (not e!164160))))

(assert (=> start!50780 (= res!198495 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50780 e!164160))

(assert (=> start!50780 true))

(declare-datatypes ((array!12625 0))(
  ( (array!12626 (arr!6529 (Array (_ BitVec 32) (_ BitVec 8))) (size!5542 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10048 0))(
  ( (BitStream!10049 (buf!6017 array!12625) (currentByte!11197 (_ BitVec 32)) (currentBit!11192 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10048)

(declare-fun e!164162 () Bool)

(declare-fun inv!12 (BitStream!10048) Bool)

(assert (=> start!50780 (and (inv!12 thiss!1830) e!164162)))

(declare-fun b!237483 () Bool)

(declare-fun array_inv!5283 (array!12625) Bool)

(assert (=> b!237483 (= e!164162 (array_inv!5283 (buf!6017 thiss!1830)))))

(declare-fun b!237484 () Bool)

(declare-fun lt!372845 () (_ BitVec 64))

(declare-fun lt!372846 () (_ BitVec 64))

(assert (=> b!237484 (= e!164161 (and (= lt!372845 (bvadd lt!372845 lt!372846)) (bvsgt lt!372846 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237484 (= lt!372845 (bitIndex!0 (size!5542 (buf!6017 thiss!1830)) (currentByte!11197 thiss!1830) (currentBit!11192 thiss!1830)))))

(declare-fun b!237485 () Bool)

(assert (=> b!237485 (= e!164160 e!164161)))

(declare-fun res!198491 () Bool)

(assert (=> b!237485 (=> (not res!198491) (not e!164161))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237485 (= res!198491 (validate_offset_bits!1 ((_ sign_extend 32) (size!5542 (buf!6017 thiss!1830))) ((_ sign_extend 32) (currentByte!11197 thiss!1830)) ((_ sign_extend 32) (currentBit!11192 thiss!1830)) lt!372846))))

(assert (=> b!237485 (= lt!372846 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(assert (= (and start!50780 res!198495) b!237485))

(assert (= (and b!237485 res!198491) b!237482))

(assert (= (and b!237482 res!198492) b!237480))

(assert (= (and b!237480 res!198493) b!237481))

(assert (= (and b!237481 res!198494) b!237484))

(assert (= start!50780 b!237483))

(declare-fun m!359919 () Bool)

(assert (=> b!237482 m!359919))

(declare-fun m!359921 () Bool)

(assert (=> start!50780 m!359921))

(declare-fun m!359923 () Bool)

(assert (=> b!237484 m!359923))

(declare-fun m!359925 () Bool)

(assert (=> b!237485 m!359925))

(declare-fun m!359927 () Bool)

(assert (=> b!237483 m!359927))

(declare-fun m!359929 () Bool)

(assert (=> b!237480 m!359929))

(push 1)

(assert (not b!237485))

(assert (not b!237484))

(assert (not b!237483))

(assert (not b!237482))

(assert (not start!50780))

(assert (not b!237480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

