; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50808 () Bool)

(assert start!50808)

(declare-fun b!237732 () Bool)

(declare-fun e!164300 () Bool)

(declare-fun lt!372903 () (_ BitVec 64))

(declare-fun lt!372902 () (_ BitVec 64))

(assert (=> b!237732 (= e!164300 (not (= lt!372903 (bvadd lt!372903 lt!372902))))))

(declare-datatypes ((array!12653 0))(
  ( (array!12654 (arr!6543 (Array (_ BitVec 32) (_ BitVec 8))) (size!5556 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10076 0))(
  ( (BitStream!10077 (buf!6031 array!12653) (currentByte!11211 (_ BitVec 32)) (currentBit!11206 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10076)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237732 (= lt!372903 (bitIndex!0 (size!5556 (buf!6031 thiss!1830)) (currentByte!11211 thiss!1830) (currentBit!11206 thiss!1830)))))

(declare-fun b!237733 () Bool)

(declare-fun res!198701 () Bool)

(assert (=> b!237733 (=> (not res!198701) (not e!164300))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237733 (= res!198701 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237734 () Bool)

(declare-fun res!198702 () Bool)

(assert (=> b!237734 (=> (not res!198702) (not e!164300))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237734 (= res!198702 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237735 () Bool)

(declare-fun e!164301 () Bool)

(assert (=> b!237735 (= e!164301 e!164300)))

(declare-fun res!198703 () Bool)

(assert (=> b!237735 (=> (not res!198703) (not e!164300))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237735 (= res!198703 (validate_offset_bits!1 ((_ sign_extend 32) (size!5556 (buf!6031 thiss!1830))) ((_ sign_extend 32) (currentByte!11211 thiss!1830)) ((_ sign_extend 32) (currentBit!11206 thiss!1830)) lt!372902))))

(assert (=> b!237735 (= lt!372902 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237736 () Bool)

(declare-fun e!164303 () Bool)

(declare-fun array_inv!5297 (array!12653) Bool)

(assert (=> b!237736 (= e!164303 (array_inv!5297 (buf!6031 thiss!1830)))))

(declare-fun res!198705 () Bool)

(assert (=> start!50808 (=> (not res!198705) (not e!164301))))

(assert (=> start!50808 (= res!198705 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50808 e!164301))

(assert (=> start!50808 true))

(declare-fun inv!12 (BitStream!10076) Bool)

(assert (=> start!50808 (and (inv!12 thiss!1830) e!164303)))

(declare-fun b!237737 () Bool)

(declare-fun res!198704 () Bool)

(assert (=> b!237737 (=> (not res!198704) (not e!164300))))

(assert (=> b!237737 (= res!198704 (= nBits!581 i!752))))

(assert (= (and start!50808 res!198705) b!237735))

(assert (= (and b!237735 res!198703) b!237734))

(assert (= (and b!237734 res!198702) b!237733))

(assert (= (and b!237733 res!198701) b!237737))

(assert (= (and b!237737 res!198704) b!237732))

(assert (= start!50808 b!237736))

(declare-fun m!360087 () Bool)

(assert (=> b!237732 m!360087))

(declare-fun m!360089 () Bool)

(assert (=> b!237733 m!360089))

(declare-fun m!360091 () Bool)

(assert (=> start!50808 m!360091))

(declare-fun m!360093 () Bool)

(assert (=> b!237734 m!360093))

(declare-fun m!360095 () Bool)

(assert (=> b!237736 m!360095))

(declare-fun m!360097 () Bool)

(assert (=> b!237735 m!360097))

(push 1)

(assert (not b!237732))

(assert (not start!50808))

(assert (not b!237735))

(assert (not b!237736))

(assert (not b!237733))

(assert (not b!237734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

