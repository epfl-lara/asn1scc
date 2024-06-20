; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50738 () Bool)

(assert start!50738)

(declare-fun res!198207 () Bool)

(declare-fun e!163933 () Bool)

(assert (=> start!50738 (=> (not res!198207) (not e!163933))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50738 (= res!198207 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50738 e!163933))

(assert (=> start!50738 true))

(declare-datatypes ((array!12583 0))(
  ( (array!12584 (arr!6508 (Array (_ BitVec 32) (_ BitVec 8))) (size!5521 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10006 0))(
  ( (BitStream!10007 (buf!5996 array!12583) (currentByte!11176 (_ BitVec 32)) (currentBit!11171 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10006)

(declare-fun e!163932 () Bool)

(declare-fun inv!12 (BitStream!10006) Bool)

(assert (=> start!50738 (and (inv!12 thiss!1830) e!163932)))

(declare-fun b!237132 () Bool)

(declare-fun res!198206 () Bool)

(assert (=> b!237132 (=> (not res!198206) (not e!163933))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237132 (= res!198206 (validate_offset_bits!1 ((_ sign_extend 32) (size!5521 (buf!5996 thiss!1830))) ((_ sign_extend 32) (currentByte!11176 thiss!1830)) ((_ sign_extend 32) (currentBit!11171 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237133 () Bool)

(assert (=> b!237133 (= e!163933 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!237134 () Bool)

(declare-fun array_inv!5262 (array!12583) Bool)

(assert (=> b!237134 (= e!163932 (array_inv!5262 (buf!5996 thiss!1830)))))

(assert (= (and start!50738 res!198207) b!237132))

(assert (= (and b!237132 res!198206) b!237133))

(assert (= start!50738 b!237134))

(declare-fun m!359691 () Bool)

(assert (=> start!50738 m!359691))

(declare-fun m!359693 () Bool)

(assert (=> b!237132 m!359693))

(declare-fun m!359695 () Bool)

(assert (=> b!237134 m!359695))

(push 1)

(assert (not b!237134))

(assert (not b!237132))

(assert (not start!50738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

