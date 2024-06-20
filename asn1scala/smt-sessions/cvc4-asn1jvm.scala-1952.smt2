; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50796 () Bool)

(assert start!50796)

(declare-fun res!198615 () Bool)

(declare-fun e!164238 () Bool)

(assert (=> start!50796 (=> (not res!198615) (not e!164238))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50796 (= res!198615 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50796 e!164238))

(assert (=> start!50796 true))

(declare-datatypes ((array!12641 0))(
  ( (array!12642 (arr!6537 (Array (_ BitVec 32) (_ BitVec 8))) (size!5550 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10064 0))(
  ( (BitStream!10065 (buf!6025 array!12641) (currentByte!11205 (_ BitVec 32)) (currentBit!11200 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10064)

(declare-fun e!164239 () Bool)

(declare-fun inv!12 (BitStream!10064) Bool)

(assert (=> start!50796 (and (inv!12 thiss!1830) e!164239)))

(declare-fun b!237624 () Bool)

(declare-fun res!198611 () Bool)

(assert (=> b!237624 (=> (not res!198611) (not e!164238))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237624 (= res!198611 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237625 () Bool)

(declare-fun res!198612 () Bool)

(assert (=> b!237625 (=> (not res!198612) (not e!164238))))

(assert (=> b!237625 (= res!198612 (= nBits!581 i!752))))

(declare-fun b!237626 () Bool)

(declare-fun res!198613 () Bool)

(assert (=> b!237626 (=> (not res!198613) (not e!164238))))

(assert (=> b!237626 (= res!198613 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237627 () Bool)

(declare-fun array_inv!5291 (array!12641) Bool)

(assert (=> b!237627 (= e!164239 (array_inv!5291 (buf!6025 thiss!1830)))))

(declare-fun b!237628 () Bool)

(assert (=> b!237628 (= e!164238 false)))

(declare-fun lt!372876 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237628 (= lt!372876 (bitIndex!0 (size!5550 (buf!6025 thiss!1830)) (currentByte!11205 thiss!1830) (currentBit!11200 thiss!1830)))))

(declare-fun b!237629 () Bool)

(declare-fun res!198614 () Bool)

(assert (=> b!237629 (=> (not res!198614) (not e!164238))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237629 (= res!198614 (validate_offset_bits!1 ((_ sign_extend 32) (size!5550 (buf!6025 thiss!1830))) ((_ sign_extend 32) (currentByte!11205 thiss!1830)) ((_ sign_extend 32) (currentBit!11200 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(assert (= (and start!50796 res!198615) b!237629))

(assert (= (and b!237629 res!198614) b!237624))

(assert (= (and b!237624 res!198611) b!237626))

(assert (= (and b!237626 res!198613) b!237625))

(assert (= (and b!237625 res!198612) b!237628))

(assert (= start!50796 b!237627))

(declare-fun m!360015 () Bool)

(assert (=> b!237626 m!360015))

(declare-fun m!360017 () Bool)

(assert (=> b!237628 m!360017))

(declare-fun m!360019 () Bool)

(assert (=> b!237629 m!360019))

(declare-fun m!360021 () Bool)

(assert (=> b!237627 m!360021))

(declare-fun m!360023 () Bool)

(assert (=> start!50796 m!360023))

(declare-fun m!360025 () Bool)

(assert (=> b!237624 m!360025))

(push 1)

(assert (not b!237629))

(assert (not b!237626))

(assert (not b!237624))

(assert (not start!50796))

(assert (not b!237628))

(assert (not b!237627))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

