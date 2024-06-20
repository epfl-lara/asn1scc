; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50802 () Bool)

(assert start!50802)

(declare-fun b!237678 () Bool)

(declare-fun res!198656 () Bool)

(declare-fun e!164266 () Bool)

(assert (=> b!237678 (=> (not res!198656) (not e!164266))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237678 (= res!198656 (= nBits!581 i!752))))

(declare-fun b!237679 () Bool)

(declare-fun res!198659 () Bool)

(assert (=> b!237679 (=> (not res!198659) (not e!164266))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237679 (= res!198659 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237680 () Bool)

(declare-fun e!164265 () Bool)

(declare-datatypes ((array!12647 0))(
  ( (array!12648 (arr!6540 (Array (_ BitVec 32) (_ BitVec 8))) (size!5553 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10070 0))(
  ( (BitStream!10071 (buf!6028 array!12647) (currentByte!11208 (_ BitVec 32)) (currentBit!11203 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10070)

(declare-fun array_inv!5294 (array!12647) Bool)

(assert (=> b!237680 (= e!164265 (array_inv!5294 (buf!6028 thiss!1830)))))

(declare-fun res!198658 () Bool)

(assert (=> start!50802 (=> (not res!198658) (not e!164266))))

(assert (=> start!50802 (= res!198658 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50802 e!164266))

(assert (=> start!50802 true))

(declare-fun inv!12 (BitStream!10070) Bool)

(assert (=> start!50802 (and (inv!12 thiss!1830) e!164265)))

(declare-fun b!237681 () Bool)

(assert (=> b!237681 (= e!164266 false)))

(declare-fun lt!372885 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237681 (= lt!372885 (bitIndex!0 (size!5553 (buf!6028 thiss!1830)) (currentByte!11208 thiss!1830) (currentBit!11203 thiss!1830)))))

(declare-fun b!237682 () Bool)

(declare-fun res!198660 () Bool)

(assert (=> b!237682 (=> (not res!198660) (not e!164266))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237682 (= res!198660 (validate_offset_bits!1 ((_ sign_extend 32) (size!5553 (buf!6028 thiss!1830))) ((_ sign_extend 32) (currentByte!11208 thiss!1830)) ((_ sign_extend 32) (currentBit!11203 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237683 () Bool)

(declare-fun res!198657 () Bool)

(assert (=> b!237683 (=> (not res!198657) (not e!164266))))

(assert (=> b!237683 (= res!198657 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50802 res!198658) b!237682))

(assert (= (and b!237682 res!198660) b!237683))

(assert (= (and b!237683 res!198657) b!237679))

(assert (= (and b!237679 res!198659) b!237678))

(assert (= (and b!237678 res!198656) b!237681))

(assert (= start!50802 b!237680))

(declare-fun m!360051 () Bool)

(assert (=> b!237680 m!360051))

(declare-fun m!360053 () Bool)

(assert (=> b!237683 m!360053))

(declare-fun m!360055 () Bool)

(assert (=> start!50802 m!360055))

(declare-fun m!360057 () Bool)

(assert (=> b!237679 m!360057))

(declare-fun m!360059 () Bool)

(assert (=> b!237681 m!360059))

(declare-fun m!360061 () Bool)

(assert (=> b!237682 m!360061))

(push 1)

(assert (not b!237683))

(assert (not b!237679))

(assert (not b!237681))

(assert (not start!50802))

(assert (not b!237680))

(assert (not b!237682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

