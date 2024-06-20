; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50826 () Bool)

(assert start!50826)

(declare-fun b!237920 () Bool)

(declare-fun res!198862 () Bool)

(declare-fun e!164384 () Bool)

(assert (=> b!237920 (=> (not res!198862) (not e!164384))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237920 (= res!198862 (not (= nBits!581 i!752)))))

(declare-fun b!237921 () Bool)

(declare-fun res!198864 () Bool)

(assert (=> b!237921 (=> (not res!198864) (not e!164384))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237921 (= res!198864 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237922 () Bool)

(declare-fun e!164383 () Bool)

(declare-datatypes ((array!12671 0))(
  ( (array!12672 (arr!6552 (Array (_ BitVec 32) (_ BitVec 8))) (size!5565 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10094 0))(
  ( (BitStream!10095 (buf!6040 array!12671) (currentByte!11220 (_ BitVec 32)) (currentBit!11215 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10094)

(declare-fun array_inv!5306 (array!12671) Bool)

(assert (=> b!237922 (= e!164383 (array_inv!5306 (buf!6040 thiss!1830)))))

(declare-fun b!237923 () Bool)

(declare-fun lt!372921 () (_ BitVec 64))

(assert (=> b!237923 (= e!164384 (or (bvslt lt!372921 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!372921 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(assert (=> b!237923 (= lt!372921 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752)))))

(declare-fun res!198865 () Bool)

(assert (=> start!50826 (=> (not res!198865) (not e!164384))))

(assert (=> start!50826 (= res!198865 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50826 e!164384))

(assert (=> start!50826 true))

(declare-fun inv!12 (BitStream!10094) Bool)

(assert (=> start!50826 (and (inv!12 thiss!1830) e!164383)))

(declare-fun b!237924 () Bool)

(declare-fun res!198867 () Bool)

(assert (=> b!237924 (=> (not res!198867) (not e!164384))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237924 (= res!198867 (validate_offset_bits!1 ((_ sign_extend 32) (size!5565 (buf!6040 thiss!1830))) ((_ sign_extend 32) (currentByte!11220 thiss!1830)) ((_ sign_extend 32) (currentBit!11215 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237925 () Bool)

(declare-fun res!198866 () Bool)

(assert (=> b!237925 (=> (not res!198866) (not e!164384))))

(declare-datatypes ((tuple2!20056 0))(
  ( (tuple2!20057 (_1!10932 Bool) (_2!10932 BitStream!10094)) )
))
(declare-fun readBit!0 (BitStream!10094) tuple2!20056)

(assert (=> b!237925 (= res!198866 (_1!10932 (readBit!0 thiss!1830)))))

(declare-fun b!237926 () Bool)

(declare-fun res!198863 () Bool)

(assert (=> b!237926 (=> (not res!198863) (not e!164384))))

(assert (=> b!237926 (= res!198863 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50826 res!198865) b!237924))

(assert (= (and b!237924 res!198867) b!237926))

(assert (= (and b!237926 res!198863) b!237921))

(assert (= (and b!237921 res!198864) b!237920))

(assert (= (and b!237920 res!198862) b!237925))

(assert (= (and b!237925 res!198866) b!237923))

(assert (= start!50826 b!237922))

(declare-fun m!360195 () Bool)

(assert (=> b!237926 m!360195))

(declare-fun m!360197 () Bool)

(assert (=> b!237924 m!360197))

(declare-fun m!360199 () Bool)

(assert (=> b!237922 m!360199))

(declare-fun m!360201 () Bool)

(assert (=> b!237921 m!360201))

(declare-fun m!360203 () Bool)

(assert (=> b!237925 m!360203))

(declare-fun m!360205 () Bool)

(assert (=> start!50826 m!360205))

(push 1)

(assert (not b!237926))

(assert (not b!237924))

(assert (not b!237925))

(assert (not b!237921))

(assert (not b!237922))

(assert (not start!50826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

