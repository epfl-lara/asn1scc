; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50810 () Bool)

(assert start!50810)

(declare-fun b!237752 () Bool)

(declare-fun res!198723 () Bool)

(declare-fun e!164310 () Bool)

(assert (=> b!237752 (=> (not res!198723) (not e!164310))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237752 (= res!198723 (not (= nBits!581 i!752)))))

(declare-fun b!237753 () Bool)

(declare-fun res!198720 () Bool)

(assert (=> b!237753 (=> (not res!198720) (not e!164310))))

(declare-datatypes ((array!12655 0))(
  ( (array!12656 (arr!6544 (Array (_ BitVec 32) (_ BitVec 8))) (size!5557 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10078 0))(
  ( (BitStream!10079 (buf!6032 array!12655) (currentByte!11212 (_ BitVec 32)) (currentBit!11207 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10078)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237753 (= res!198720 (validate_offset_bits!1 ((_ sign_extend 32) (size!5557 (buf!6032 thiss!1830))) ((_ sign_extend 32) (currentByte!11212 thiss!1830)) ((_ sign_extend 32) (currentBit!11207 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237754 () Bool)

(declare-fun res!198721 () Bool)

(assert (=> b!237754 (=> (not res!198721) (not e!164310))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237754 (= res!198721 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237755 () Bool)

(declare-fun res!198722 () Bool)

(assert (=> b!237755 (=> (not res!198722) (not e!164310))))

(assert (=> b!237755 (= res!198722 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!198718 () Bool)

(assert (=> start!50810 (=> (not res!198718) (not e!164310))))

(assert (=> start!50810 (= res!198718 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50810 e!164310))

(assert (=> start!50810 true))

(declare-fun e!164312 () Bool)

(declare-fun inv!12 (BitStream!10078) Bool)

(assert (=> start!50810 (and (inv!12 thiss!1830) e!164312)))

(declare-fun b!237756 () Bool)

(declare-fun res!198719 () Bool)

(assert (=> b!237756 (=> (not res!198719) (not e!164310))))

(declare-datatypes ((tuple2!20040 0))(
  ( (tuple2!20041 (_1!10924 Bool) (_2!10924 BitStream!10078)) )
))
(declare-fun readBit!0 (BitStream!10078) tuple2!20040)

(assert (=> b!237756 (= res!198719 (_1!10924 (readBit!0 thiss!1830)))))

(declare-fun b!237757 () Bool)

(declare-fun array_inv!5298 (array!12655) Bool)

(assert (=> b!237757 (= e!164312 (array_inv!5298 (buf!6032 thiss!1830)))))

(declare-fun b!237758 () Bool)

(assert (=> b!237758 (= e!164310 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(assert (= (and start!50810 res!198718) b!237753))

(assert (= (and b!237753 res!198720) b!237755))

(assert (= (and b!237755 res!198722) b!237754))

(assert (= (and b!237754 res!198721) b!237752))

(assert (= (and b!237752 res!198723) b!237756))

(assert (= (and b!237756 res!198719) b!237758))

(assert (= start!50810 b!237757))

(declare-fun m!360099 () Bool)

(assert (=> b!237754 m!360099))

(declare-fun m!360101 () Bool)

(assert (=> b!237753 m!360101))

(declare-fun m!360103 () Bool)

(assert (=> start!50810 m!360103))

(declare-fun m!360105 () Bool)

(assert (=> b!237755 m!360105))

(declare-fun m!360107 () Bool)

(assert (=> b!237756 m!360107))

(declare-fun m!360109 () Bool)

(assert (=> b!237757 m!360109))

(push 1)

(assert (not b!237755))

(assert (not b!237754))

(assert (not start!50810))

(assert (not b!237756))

(assert (not b!237757))

(assert (not b!237753))

(check-sat)

(pop 1)

(push 1)

(check-sat)

