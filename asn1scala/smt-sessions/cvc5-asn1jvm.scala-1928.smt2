; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50276 () Bool)

(assert start!50276)

(declare-fun b!235913 () Bool)

(declare-fun e!163149 () Bool)

(declare-datatypes ((array!12472 0))(
  ( (array!12473 (arr!6466 (Array (_ BitVec 32) (_ BitVec 8))) (size!5479 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9922 0))(
  ( (BitStream!9923 (buf!5954 array!12472) (currentByte!11065 (_ BitVec 32)) (currentBit!11060 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9922)

(declare-fun array_inv!5220 (array!12472) Bool)

(assert (=> b!235913 (= e!163149 (array_inv!5220 (buf!5954 thiss!1830)))))

(declare-fun b!235910 () Bool)

(declare-fun res!197170 () Bool)

(declare-fun e!163150 () Bool)

(assert (=> b!235910 (=> (not res!197170) (not e!163150))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235910 (= res!197170 (validate_offset_bits!1 ((_ sign_extend 32) (size!5479 (buf!5954 thiss!1830))) ((_ sign_extend 32) (currentByte!11065 thiss!1830)) ((_ sign_extend 32) (currentBit!11060 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!235911 () Bool)

(declare-fun res!197172 () Bool)

(assert (=> b!235911 (=> (not res!197172) (not e!163150))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235911 (= res!197172 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!197171 () Bool)

(assert (=> start!50276 (=> (not res!197171) (not e!163150))))

(assert (=> start!50276 (= res!197171 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50276 e!163150))

(assert (=> start!50276 true))

(declare-fun inv!12 (BitStream!9922) Bool)

(assert (=> start!50276 (and (inv!12 thiss!1830) e!163149)))

(declare-fun b!235912 () Bool)

(assert (=> b!235912 (= e!163150 (bvsgt #b00000000000000000000000000000000 nBits!581))))

(assert (= (and start!50276 res!197171) b!235910))

(assert (= (and b!235910 res!197170) b!235911))

(assert (= (and b!235911 res!197172) b!235912))

(assert (= start!50276 b!235913))

(declare-fun m!358557 () Bool)

(assert (=> b!235913 m!358557))

(declare-fun m!358559 () Bool)

(assert (=> b!235910 m!358559))

(declare-fun m!358561 () Bool)

(assert (=> b!235911 m!358561))

(declare-fun m!358563 () Bool)

(assert (=> start!50276 m!358563))

(push 1)

(assert (not b!235913))

(assert (not start!50276))

(assert (not b!235910))

(assert (not b!235911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

