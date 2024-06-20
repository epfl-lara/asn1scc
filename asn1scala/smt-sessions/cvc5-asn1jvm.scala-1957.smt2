; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50822 () Bool)

(assert start!50822)

(declare-fun b!237878 () Bool)

(declare-fun res!198829 () Bool)

(declare-fun e!164365 () Bool)

(assert (=> b!237878 (=> (not res!198829) (not e!164365))))

(declare-datatypes ((array!12667 0))(
  ( (array!12668 (arr!6550 (Array (_ BitVec 32) (_ BitVec 8))) (size!5563 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10090 0))(
  ( (BitStream!10091 (buf!6038 array!12667) (currentByte!11218 (_ BitVec 32)) (currentBit!11213 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10090)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237878 (= res!198829 (validate_offset_bits!1 ((_ sign_extend 32) (size!5563 (buf!6038 thiss!1830))) ((_ sign_extend 32) (currentByte!11218 thiss!1830)) ((_ sign_extend 32) (currentBit!11213 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237879 () Bool)

(declare-fun lt!372915 () (_ BitVec 64))

(assert (=> b!237879 (= e!164365 (or (bvslt lt!372915 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!372915 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(assert (=> b!237879 (= lt!372915 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752)))))

(declare-fun b!237881 () Bool)

(declare-fun e!164366 () Bool)

(declare-fun array_inv!5304 (array!12667) Bool)

(assert (=> b!237881 (= e!164366 (array_inv!5304 (buf!6038 thiss!1830)))))

(declare-fun b!237882 () Bool)

(declare-fun res!198828 () Bool)

(assert (=> b!237882 (=> (not res!198828) (not e!164365))))

(declare-datatypes ((tuple2!20052 0))(
  ( (tuple2!20053 (_1!10930 Bool) (_2!10930 BitStream!10090)) )
))
(declare-fun readBit!0 (BitStream!10090) tuple2!20052)

(assert (=> b!237882 (= res!198828 (_1!10930 (readBit!0 thiss!1830)))))

(declare-fun b!237883 () Bool)

(declare-fun res!198830 () Bool)

(assert (=> b!237883 (=> (not res!198830) (not e!164365))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237883 (= res!198830 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237884 () Bool)

(declare-fun res!198831 () Bool)

(assert (=> b!237884 (=> (not res!198831) (not e!164365))))

(assert (=> b!237884 (= res!198831 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!198826 () Bool)

(assert (=> start!50822 (=> (not res!198826) (not e!164365))))

(assert (=> start!50822 (= res!198826 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50822 e!164365))

(assert (=> start!50822 true))

(declare-fun inv!12 (BitStream!10090) Bool)

(assert (=> start!50822 (and (inv!12 thiss!1830) e!164366)))

(declare-fun b!237880 () Bool)

(declare-fun res!198827 () Bool)

(assert (=> b!237880 (=> (not res!198827) (not e!164365))))

(assert (=> b!237880 (= res!198827 (not (= nBits!581 i!752)))))

(assert (= (and start!50822 res!198826) b!237878))

(assert (= (and b!237878 res!198829) b!237884))

(assert (= (and b!237884 res!198831) b!237883))

(assert (= (and b!237883 res!198830) b!237880))

(assert (= (and b!237880 res!198827) b!237882))

(assert (= (and b!237882 res!198828) b!237879))

(assert (= start!50822 b!237881))

(declare-fun m!360171 () Bool)

(assert (=> b!237881 m!360171))

(declare-fun m!360173 () Bool)

(assert (=> start!50822 m!360173))

(declare-fun m!360175 () Bool)

(assert (=> b!237884 m!360175))

(declare-fun m!360177 () Bool)

(assert (=> b!237883 m!360177))

(declare-fun m!360179 () Bool)

(assert (=> b!237882 m!360179))

(declare-fun m!360181 () Bool)

(assert (=> b!237878 m!360181))

(push 1)

(assert (not b!237878))

(assert (not start!50822))

(assert (not b!237881))

(assert (not b!237882))

(assert (not b!237883))

(assert (not b!237884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

