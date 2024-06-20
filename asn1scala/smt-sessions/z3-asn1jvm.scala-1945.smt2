; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50752 () Bool)

(assert start!50752)

(declare-fun b!237228 () Bool)

(declare-fun e!163997 () Bool)

(declare-datatypes ((array!12597 0))(
  ( (array!12598 (arr!6515 (Array (_ BitVec 32) (_ BitVec 8))) (size!5528 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10020 0))(
  ( (BitStream!10021 (buf!6003 array!12597) (currentByte!11183 (_ BitVec 32)) (currentBit!11178 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10020)

(declare-fun array_inv!5269 (array!12597) Bool)

(assert (=> b!237228 (= e!163997 (array_inv!5269 (buf!6003 thiss!1830)))))

(declare-fun res!198285 () Bool)

(declare-fun e!163995 () Bool)

(assert (=> start!50752 (=> (not res!198285) (not e!163995))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50752 (= res!198285 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50752 e!163995))

(assert (=> start!50752 true))

(declare-fun inv!12 (BitStream!10020) Bool)

(assert (=> start!50752 (and (inv!12 thiss!1830) e!163997)))

(declare-fun b!237229 () Bool)

(declare-fun res!198281 () Bool)

(assert (=> b!237229 (=> (not res!198281) (not e!163995))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237229 (= res!198281 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237230 () Bool)

(assert (=> b!237230 (= e!163995 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun lt!372756 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237230 (= lt!372756 (bitIndex!0 (size!5528 (buf!6003 thiss!1830)) (currentByte!11183 thiss!1830) (currentBit!11178 thiss!1830)))))

(declare-fun b!237231 () Bool)

(declare-fun res!198284 () Bool)

(assert (=> b!237231 (=> (not res!198284) (not e!163995))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237231 (= res!198284 (validate_offset_bits!1 ((_ sign_extend 32) (size!5528 (buf!6003 thiss!1830))) ((_ sign_extend 32) (currentByte!11183 thiss!1830)) ((_ sign_extend 32) (currentBit!11178 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237232 () Bool)

(declare-fun res!198282 () Bool)

(assert (=> b!237232 (=> (not res!198282) (not e!163995))))

(assert (=> b!237232 (= res!198282 (= nBits!581 i!752))))

(declare-fun b!237233 () Bool)

(declare-fun res!198283 () Bool)

(assert (=> b!237233 (=> (not res!198283) (not e!163995))))

(assert (=> b!237233 (= res!198283 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50752 res!198285) b!237231))

(assert (= (and b!237231 res!198284) b!237229))

(assert (= (and b!237229 res!198281) b!237233))

(assert (= (and b!237233 res!198283) b!237232))

(assert (= (and b!237232 res!198282) b!237230))

(assert (= start!50752 b!237228))

(declare-fun m!359751 () Bool)

(assert (=> b!237231 m!359751))

(declare-fun m!359753 () Bool)

(assert (=> b!237233 m!359753))

(declare-fun m!359755 () Bool)

(assert (=> b!237229 m!359755))

(declare-fun m!359757 () Bool)

(assert (=> b!237228 m!359757))

(declare-fun m!359759 () Bool)

(assert (=> start!50752 m!359759))

(declare-fun m!359761 () Bool)

(assert (=> b!237230 m!359761))

(check-sat (not b!237229) (not b!237231) (not b!237228) (not start!50752) (not b!237233) (not b!237230))
