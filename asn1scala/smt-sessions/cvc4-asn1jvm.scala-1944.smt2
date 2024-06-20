; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50748 () Bool)

(assert start!50748)

(declare-fun b!237193 () Bool)

(declare-fun res!198254 () Bool)

(declare-fun e!163979 () Bool)

(assert (=> b!237193 (=> (not res!198254) (not e!163979))))

(declare-datatypes ((array!12593 0))(
  ( (array!12594 (arr!6513 (Array (_ BitVec 32) (_ BitVec 8))) (size!5526 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10016 0))(
  ( (BitStream!10017 (buf!6001 array!12593) (currentByte!11181 (_ BitVec 32)) (currentBit!11176 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10016)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237193 (= res!198254 (validate_offset_bits!1 ((_ sign_extend 32) (size!5526 (buf!6001 thiss!1830))) ((_ sign_extend 32) (currentByte!11181 thiss!1830)) ((_ sign_extend 32) (currentBit!11176 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237194 () Bool)

(declare-fun e!163977 () Bool)

(declare-fun array_inv!5267 (array!12593) Bool)

(assert (=> b!237194 (= e!163977 (array_inv!5267 (buf!6001 thiss!1830)))))

(declare-fun b!237195 () Bool)

(declare-fun res!198253 () Bool)

(assert (=> b!237195 (=> (not res!198253) (not e!163979))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237195 (= res!198253 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237196 () Bool)

(declare-fun res!198252 () Bool)

(assert (=> b!237196 (=> (not res!198252) (not e!163979))))

(assert (=> b!237196 (= res!198252 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237197 () Bool)

(assert (=> b!237197 (= e!163979 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun res!198255 () Bool)

(assert (=> start!50748 (=> (not res!198255) (not e!163979))))

(assert (=> start!50748 (= res!198255 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50748 e!163979))

(assert (=> start!50748 true))

(declare-fun inv!12 (BitStream!10016) Bool)

(assert (=> start!50748 (and (inv!12 thiss!1830) e!163977)))

(assert (= (and start!50748 res!198255) b!237193))

(assert (= (and b!237193 res!198254) b!237196))

(assert (= (and b!237196 res!198252) b!237195))

(assert (= (and b!237195 res!198253) b!237197))

(assert (= start!50748 b!237194))

(declare-fun m!359729 () Bool)

(assert (=> b!237195 m!359729))

(declare-fun m!359731 () Bool)

(assert (=> b!237194 m!359731))

(declare-fun m!359733 () Bool)

(assert (=> start!50748 m!359733))

(declare-fun m!359735 () Bool)

(assert (=> b!237196 m!359735))

(declare-fun m!359737 () Bool)

(assert (=> b!237193 m!359737))

(push 1)

