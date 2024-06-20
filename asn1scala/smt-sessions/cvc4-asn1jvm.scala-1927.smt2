; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50274 () Bool)

(assert start!50274)

(declare-fun res!197163 () Bool)

(declare-fun e!163140 () Bool)

(assert (=> start!50274 (=> (not res!197163) (not e!163140))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50274 (= res!197163 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50274 e!163140))

(assert (=> start!50274 true))

(declare-datatypes ((array!12470 0))(
  ( (array!12471 (arr!6465 (Array (_ BitVec 32) (_ BitVec 8))) (size!5478 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9920 0))(
  ( (BitStream!9921 (buf!5953 array!12470) (currentByte!11064 (_ BitVec 32)) (currentBit!11059 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9920)

(declare-fun e!163142 () Bool)

(declare-fun inv!12 (BitStream!9920) Bool)

(assert (=> start!50274 (and (inv!12 thiss!1830) e!163142)))

(declare-fun b!235899 () Bool)

(declare-fun res!197162 () Bool)

(assert (=> b!235899 (=> (not res!197162) (not e!163140))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235899 (= res!197162 (validate_offset_bits!1 ((_ sign_extend 32) (size!5478 (buf!5953 thiss!1830))) ((_ sign_extend 32) (currentByte!11064 thiss!1830)) ((_ sign_extend 32) (currentBit!11059 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!235900 () Bool)

(assert (=> b!235900 (= e!163140 (bvsgt (bvsub nBits!581 i!752) #b00000000000000000000000001000000))))

(declare-fun b!235901 () Bool)

(declare-fun array_inv!5219 (array!12470) Bool)

(assert (=> b!235901 (= e!163142 (array_inv!5219 (buf!5953 thiss!1830)))))

(assert (= (and start!50274 res!197163) b!235899))

(assert (= (and b!235899 res!197162) b!235900))

(assert (= start!50274 b!235901))

(declare-fun m!358551 () Bool)

(assert (=> start!50274 m!358551))

(declare-fun m!358553 () Bool)

(assert (=> b!235899 m!358553))

(declare-fun m!358555 () Bool)

(assert (=> b!235901 m!358555))

(push 1)

(assert (not b!235901))

(assert (not start!50274))

(assert (not b!235899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

