; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50270 () Bool)

(assert start!50270)

(declare-fun res!197151 () Bool)

(declare-fun e!163124 () Bool)

(assert (=> start!50270 (=> (not res!197151) (not e!163124))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50270 (= res!197151 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50270 e!163124))

(assert (=> start!50270 true))

(declare-datatypes ((array!12466 0))(
  ( (array!12467 (arr!6463 (Array (_ BitVec 32) (_ BitVec 8))) (size!5476 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9916 0))(
  ( (BitStream!9917 (buf!5951 array!12466) (currentByte!11062 (_ BitVec 32)) (currentBit!11057 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9916)

(declare-fun e!163122 () Bool)

(declare-fun inv!12 (BitStream!9916) Bool)

(assert (=> start!50270 (and (inv!12 thiss!1830) e!163122)))

(declare-fun b!235881 () Bool)

(declare-fun res!197150 () Bool)

(assert (=> b!235881 (=> (not res!197150) (not e!163124))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235881 (= res!197150 (validate_offset_bits!1 ((_ sign_extend 32) (size!5476 (buf!5951 thiss!1830))) ((_ sign_extend 32) (currentByte!11062 thiss!1830)) ((_ sign_extend 32) (currentBit!11057 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!235882 () Bool)

(assert (=> b!235882 (= e!163124 (bvsgt (bvsub nBits!581 i!752) #b00000000000000000000000001000000))))

(declare-fun b!235883 () Bool)

(declare-fun array_inv!5217 (array!12466) Bool)

(assert (=> b!235883 (= e!163122 (array_inv!5217 (buf!5951 thiss!1830)))))

(assert (= (and start!50270 res!197151) b!235881))

(assert (= (and b!235881 res!197150) b!235882))

(assert (= start!50270 b!235883))

(declare-fun m!358539 () Bool)

(assert (=> start!50270 m!358539))

(declare-fun m!358541 () Bool)

(assert (=> b!235881 m!358541))

(declare-fun m!358543 () Bool)

(assert (=> b!235883 m!358543))

(push 1)

(assert (not start!50270))

(assert (not b!235881))

(assert (not b!235883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

