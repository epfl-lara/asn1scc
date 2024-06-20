; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50744 () Bool)

(assert start!50744)

(declare-fun b!237163 () Bool)

(declare-fun e!163961 () Bool)

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237163 (= e!163961 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!237164 () Bool)

(declare-fun res!198228 () Bool)

(assert (=> b!237164 (=> (not res!198228) (not e!163961))))

(declare-datatypes ((array!12589 0))(
  ( (array!12590 (arr!6511 (Array (_ BitVec 32) (_ BitVec 8))) (size!5524 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10012 0))(
  ( (BitStream!10013 (buf!5999 array!12589) (currentByte!11179 (_ BitVec 32)) (currentBit!11174 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10012)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237164 (= res!198228 (validate_offset_bits!1 ((_ sign_extend 32) (size!5524 (buf!5999 thiss!1830))) ((_ sign_extend 32) (currentByte!11179 thiss!1830)) ((_ sign_extend 32) (currentBit!11174 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237166 () Bool)

(declare-fun res!198230 () Bool)

(assert (=> b!237166 (=> (not res!198230) (not e!163961))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237166 (= res!198230 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237167 () Bool)

(declare-fun res!198231 () Bool)

(assert (=> b!237167 (=> (not res!198231) (not e!163961))))

(assert (=> b!237167 (= res!198231 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237165 () Bool)

(declare-fun e!163959 () Bool)

(declare-fun array_inv!5265 (array!12589) Bool)

(assert (=> b!237165 (= e!163959 (array_inv!5265 (buf!5999 thiss!1830)))))

(declare-fun res!198229 () Bool)

(assert (=> start!50744 (=> (not res!198229) (not e!163961))))

(assert (=> start!50744 (= res!198229 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50744 e!163961))

(assert (=> start!50744 true))

(declare-fun inv!12 (BitStream!10012) Bool)

(assert (=> start!50744 (and (inv!12 thiss!1830) e!163959)))

(assert (= (and start!50744 res!198229) b!237164))

(assert (= (and b!237164 res!198228) b!237166))

(assert (= (and b!237166 res!198230) b!237167))

(assert (= (and b!237167 res!198231) b!237163))

(assert (= start!50744 b!237165))

(declare-fun m!359709 () Bool)

(assert (=> start!50744 m!359709))

(declare-fun m!359711 () Bool)

(assert (=> b!237166 m!359711))

(declare-fun m!359713 () Bool)

(assert (=> b!237167 m!359713))

(declare-fun m!359715 () Bool)

(assert (=> b!237165 m!359715))

(declare-fun m!359717 () Bool)

(assert (=> b!237164 m!359717))

(push 1)

(assert (not b!237165))

(assert (not b!237167))

(assert (not b!237166))

(assert (not start!50744))

(assert (not b!237164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

