; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50790 () Bool)

(assert start!50790)

(declare-fun b!237570 () Bool)

(declare-fun e!164212 () Bool)

(declare-datatypes ((array!12635 0))(
  ( (array!12636 (arr!6534 (Array (_ BitVec 32) (_ BitVec 8))) (size!5547 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10058 0))(
  ( (BitStream!10059 (buf!6022 array!12635) (currentByte!11202 (_ BitVec 32)) (currentBit!11197 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10058)

(declare-fun array_inv!5288 (array!12635) Bool)

(assert (=> b!237570 (= e!164212 (array_inv!5288 (buf!6022 thiss!1830)))))

(declare-fun b!237571 () Bool)

(declare-fun res!198570 () Bool)

(declare-fun e!164213 () Bool)

(assert (=> b!237571 (=> (not res!198570) (not e!164213))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237571 (= res!198570 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237572 () Bool)

(declare-fun res!198567 () Bool)

(assert (=> b!237572 (=> (not res!198567) (not e!164213))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237572 (= res!198567 (validate_offset_bits!1 ((_ sign_extend 32) (size!5547 (buf!6022 thiss!1830))) ((_ sign_extend 32) (currentByte!11202 thiss!1830)) ((_ sign_extend 32) (currentBit!11197 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237573 () Bool)

(declare-fun res!198568 () Bool)

(assert (=> b!237573 (=> (not res!198568) (not e!164213))))

(assert (=> b!237573 (= res!198568 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237574 () Bool)

(declare-fun res!198569 () Bool)

(assert (=> b!237574 (=> (not res!198569) (not e!164213))))

(assert (=> b!237574 (= res!198569 (= nBits!581 i!752))))

(declare-fun b!237575 () Bool)

(assert (=> b!237575 (= e!164213 false)))

(declare-fun lt!372867 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237575 (= lt!372867 (bitIndex!0 (size!5547 (buf!6022 thiss!1830)) (currentByte!11202 thiss!1830) (currentBit!11197 thiss!1830)))))

(declare-fun res!198566 () Bool)

(assert (=> start!50790 (=> (not res!198566) (not e!164213))))

(assert (=> start!50790 (= res!198566 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50790 e!164213))

(assert (=> start!50790 true))

(declare-fun inv!12 (BitStream!10058) Bool)

(assert (=> start!50790 (and (inv!12 thiss!1830) e!164212)))

(assert (= (and start!50790 res!198566) b!237572))

(assert (= (and b!237572 res!198567) b!237571))

(assert (= (and b!237571 res!198570) b!237573))

(assert (= (and b!237573 res!198568) b!237574))

(assert (= (and b!237574 res!198569) b!237575))

(assert (= start!50790 b!237570))

(declare-fun m!359979 () Bool)

(assert (=> b!237572 m!359979))

(declare-fun m!359981 () Bool)

(assert (=> b!237573 m!359981))

(declare-fun m!359983 () Bool)

(assert (=> start!50790 m!359983))

(declare-fun m!359985 () Bool)

(assert (=> b!237575 m!359985))

(declare-fun m!359987 () Bool)

(assert (=> b!237571 m!359987))

(declare-fun m!359989 () Bool)

(assert (=> b!237570 m!359989))

(push 1)

(assert (not start!50790))

(assert (not b!237572))

(assert (not b!237573))

(assert (not b!237570))

(assert (not b!237575))

(assert (not b!237571))

(check-sat)

(pop 1)

