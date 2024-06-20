; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50280 () Bool)

(assert start!50280)

(declare-fun b!235935 () Bool)

(declare-fun res!197189 () Bool)

(declare-fun e!163168 () Bool)

(assert (=> b!235935 (=> (not res!197189) (not e!163168))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235935 (= res!197189 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235934 () Bool)

(declare-fun res!197188 () Bool)

(assert (=> b!235934 (=> (not res!197188) (not e!163168))))

(declare-datatypes ((array!12476 0))(
  ( (array!12477 (arr!6468 (Array (_ BitVec 32) (_ BitVec 8))) (size!5481 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9926 0))(
  ( (BitStream!9927 (buf!5956 array!12476) (currentByte!11067 (_ BitVec 32)) (currentBit!11062 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9926)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235934 (= res!197188 (validate_offset_bits!1 ((_ sign_extend 32) (size!5481 (buf!5956 thiss!1830))) ((_ sign_extend 32) (currentByte!11067 thiss!1830)) ((_ sign_extend 32) (currentBit!11062 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!235936 () Bool)

(assert (=> b!235936 (= e!163168 (bvsgt #b00000000000000000000000000000000 nBits!581))))

(declare-fun res!197190 () Bool)

(assert (=> start!50280 (=> (not res!197190) (not e!163168))))

(assert (=> start!50280 (= res!197190 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50280 e!163168))

(assert (=> start!50280 true))

(declare-fun e!163169 () Bool)

(declare-fun inv!12 (BitStream!9926) Bool)

(assert (=> start!50280 (and (inv!12 thiss!1830) e!163169)))

(declare-fun b!235937 () Bool)

(declare-fun array_inv!5222 (array!12476) Bool)

(assert (=> b!235937 (= e!163169 (array_inv!5222 (buf!5956 thiss!1830)))))

(assert (= (and start!50280 res!197190) b!235934))

(assert (= (and b!235934 res!197188) b!235935))

(assert (= (and b!235935 res!197189) b!235936))

(assert (= start!50280 b!235937))

(declare-fun m!358573 () Bool)

(assert (=> b!235935 m!358573))

(declare-fun m!358575 () Bool)

(assert (=> b!235934 m!358575))

(declare-fun m!358577 () Bool)

(assert (=> start!50280 m!358577))

(declare-fun m!358579 () Bool)

(assert (=> b!235937 m!358579))

(push 1)

(assert (not start!50280))

(assert (not b!235934))

(assert (not b!235935))

(assert (not b!235937))

(check-sat)

(pop 1)

(push 1)

(check-sat)

