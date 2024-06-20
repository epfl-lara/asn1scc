; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50364 () Bool)

(assert start!50364)

(declare-fun b!236148 () Bool)

(declare-fun res!197367 () Bool)

(declare-fun e!163286 () Bool)

(assert (=> b!236148 (=> (not res!197367) (not e!163286))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236148 (= res!197367 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236149 () Bool)

(declare-fun res!197368 () Bool)

(assert (=> b!236149 (=> (not res!197368) (not e!163286))))

(assert (=> b!236149 (= res!197368 (= nBits!581 i!752))))

(declare-fun res!197366 () Bool)

(assert (=> start!50364 (=> (not res!197366) (not e!163286))))

(assert (=> start!50364 (= res!197366 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50364 e!163286))

(assert (=> start!50364 true))

(declare-datatypes ((array!12506 0))(
  ( (array!12507 (arr!6480 (Array (_ BitVec 32) (_ BitVec 8))) (size!5493 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9950 0))(
  ( (BitStream!9951 (buf!5968 array!12506) (currentByte!11091 (_ BitVec 32)) (currentBit!11086 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9950)

(declare-fun e!163284 () Bool)

(declare-fun inv!12 (BitStream!9950) Bool)

(assert (=> start!50364 (and (inv!12 thiss!1830) e!163284)))

(declare-fun b!236150 () Bool)

(declare-fun res!197370 () Bool)

(assert (=> b!236150 (=> (not res!197370) (not e!163286))))

(assert (=> b!236150 (= res!197370 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236151 () Bool)

(declare-fun res!197369 () Bool)

(assert (=> b!236151 (=> (not res!197369) (not e!163286))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236151 (= res!197369 (validate_offset_bits!1 ((_ sign_extend 32) (size!5493 (buf!5968 thiss!1830))) ((_ sign_extend 32) (currentByte!11091 thiss!1830)) ((_ sign_extend 32) (currentBit!11086 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236152 () Bool)

(assert (=> b!236152 (= e!163286 false)))

(declare-fun lt!371568 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236152 (= lt!371568 (bitIndex!0 (size!5493 (buf!5968 thiss!1830)) (currentByte!11091 thiss!1830) (currentBit!11086 thiss!1830)))))

(declare-fun b!236153 () Bool)

(declare-fun array_inv!5234 (array!12506) Bool)

(assert (=> b!236153 (= e!163284 (array_inv!5234 (buf!5968 thiss!1830)))))

(assert (= (and start!50364 res!197366) b!236151))

(assert (= (and b!236151 res!197369) b!236148))

(assert (= (and b!236148 res!197367) b!236150))

(assert (= (and b!236150 res!197370) b!236149))

(assert (= (and b!236149 res!197368) b!236152))

(assert (= start!50364 b!236153))

(declare-fun m!358725 () Bool)

(assert (=> b!236153 m!358725))

(declare-fun m!358727 () Bool)

(assert (=> b!236148 m!358727))

(declare-fun m!358729 () Bool)

(assert (=> b!236150 m!358729))

(declare-fun m!358731 () Bool)

(assert (=> b!236152 m!358731))

(declare-fun m!358733 () Bool)

(assert (=> start!50364 m!358733))

(declare-fun m!358735 () Bool)

(assert (=> b!236151 m!358735))

(push 1)

(assert (not b!236153))

(assert (not b!236152))

(assert (not start!50364))

(assert (not b!236150))

(assert (not b!236151))

(assert (not b!236148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

