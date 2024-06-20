; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50742 () Bool)

(assert start!50742)

(declare-fun res!198219 () Bool)

(declare-fun e!163950 () Bool)

(assert (=> start!50742 (=> (not res!198219) (not e!163950))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50742 (= res!198219 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50742 e!163950))

(assert (=> start!50742 true))

(declare-datatypes ((array!12587 0))(
  ( (array!12588 (arr!6510 (Array (_ BitVec 32) (_ BitVec 8))) (size!5523 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10010 0))(
  ( (BitStream!10011 (buf!5998 array!12587) (currentByte!11178 (_ BitVec 32)) (currentBit!11173 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10010)

(declare-fun e!163951 () Bool)

(declare-fun inv!12 (BitStream!10010) Bool)

(assert (=> start!50742 (and (inv!12 thiss!1830) e!163951)))

(declare-fun b!237150 () Bool)

(declare-fun res!198218 () Bool)

(assert (=> b!237150 (=> (not res!198218) (not e!163950))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237150 (= res!198218 (validate_offset_bits!1 ((_ sign_extend 32) (size!5523 (buf!5998 thiss!1830))) ((_ sign_extend 32) (currentByte!11178 thiss!1830)) ((_ sign_extend 32) (currentBit!11173 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237151 () Bool)

(assert (=> b!237151 (= e!163950 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!237152 () Bool)

(declare-fun array_inv!5264 (array!12587) Bool)

(assert (=> b!237152 (= e!163951 (array_inv!5264 (buf!5998 thiss!1830)))))

(assert (= (and start!50742 res!198219) b!237150))

(assert (= (and b!237150 res!198218) b!237151))

(assert (= start!50742 b!237152))

(declare-fun m!359703 () Bool)

(assert (=> start!50742 m!359703))

(declare-fun m!359705 () Bool)

(assert (=> b!237150 m!359705))

(declare-fun m!359707 () Bool)

(assert (=> b!237152 m!359707))

(push 1)

(assert (not b!237150))

(assert (not start!50742))

(assert (not b!237152))

