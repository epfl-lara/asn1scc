; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50784 () Bool)

(assert start!50784)

(declare-fun res!198524 () Bool)

(declare-fun e!164186 () Bool)

(assert (=> start!50784 (=> (not res!198524) (not e!164186))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50784 (= res!198524 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50784 e!164186))

(assert (=> start!50784 true))

(declare-datatypes ((array!12629 0))(
  ( (array!12630 (arr!6531 (Array (_ BitVec 32) (_ BitVec 8))) (size!5544 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10052 0))(
  ( (BitStream!10053 (buf!6019 array!12629) (currentByte!11199 (_ BitVec 32)) (currentBit!11194 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10052)

(declare-fun e!164185 () Bool)

(declare-fun inv!12 (BitStream!10052) Bool)

(assert (=> start!50784 (and (inv!12 thiss!1830) e!164185)))

(declare-fun b!237516 () Bool)

(declare-fun res!198522 () Bool)

(declare-fun e!164184 () Bool)

(assert (=> b!237516 (=> (not res!198522) (not e!164184))))

(assert (=> b!237516 (= res!198522 (= nBits!581 i!752))))

(declare-fun b!237517 () Bool)

(assert (=> b!237517 (= e!164186 e!164184)))

(declare-fun res!198521 () Bool)

(assert (=> b!237517 (=> (not res!198521) (not e!164184))))

(declare-fun lt!372858 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237517 (= res!198521 (validate_offset_bits!1 ((_ sign_extend 32) (size!5544 (buf!6019 thiss!1830))) ((_ sign_extend 32) (currentByte!11199 thiss!1830)) ((_ sign_extend 32) (currentBit!11194 thiss!1830)) lt!372858))))

(assert (=> b!237517 (= lt!372858 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237518 () Bool)

(declare-fun res!198525 () Bool)

(assert (=> b!237518 (=> (not res!198525) (not e!164184))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237518 (= res!198525 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237519 () Bool)

(declare-fun array_inv!5285 (array!12629) Bool)

(assert (=> b!237519 (= e!164185 (array_inv!5285 (buf!6019 thiss!1830)))))

(declare-fun b!237520 () Bool)

(declare-fun lt!372857 () (_ BitVec 64))

(assert (=> b!237520 (= e!164184 (and (= lt!372857 (bvadd lt!372857 lt!372858)) (bvsgt lt!372858 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237520 (= lt!372857 (bitIndex!0 (size!5544 (buf!6019 thiss!1830)) (currentByte!11199 thiss!1830) (currentBit!11194 thiss!1830)))))

(declare-fun b!237521 () Bool)

(declare-fun res!198523 () Bool)

(assert (=> b!237521 (=> (not res!198523) (not e!164184))))

(assert (=> b!237521 (= res!198523 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50784 res!198524) b!237517))

(assert (= (and b!237517 res!198521) b!237518))

(assert (= (and b!237518 res!198525) b!237521))

(assert (= (and b!237521 res!198523) b!237516))

(assert (= (and b!237516 res!198522) b!237520))

(assert (= start!50784 b!237519))

(declare-fun m!359943 () Bool)

(assert (=> b!237520 m!359943))

(declare-fun m!359945 () Bool)

(assert (=> b!237518 m!359945))

(declare-fun m!359947 () Bool)

(assert (=> start!50784 m!359947))

(declare-fun m!359949 () Bool)

(assert (=> b!237519 m!359949))

(declare-fun m!359951 () Bool)

(assert (=> b!237517 m!359951))

(declare-fun m!359953 () Bool)

(assert (=> b!237521 m!359953))

(push 1)

(assert (not start!50784))

(assert (not b!237521))

(assert (not b!237519))

(assert (not b!237517))

(assert (not b!237520))

(assert (not b!237518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

