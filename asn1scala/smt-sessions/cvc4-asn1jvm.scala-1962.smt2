; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50898 () Bool)

(assert start!50898)

(declare-fun b!238315 () Bool)

(declare-fun e!164620 () Bool)

(declare-datatypes ((array!12704 0))(
  ( (array!12705 (arr!6567 (Array (_ BitVec 32) (_ BitVec 8))) (size!5580 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10124 0))(
  ( (BitStream!10125 (buf!6055 array!12704) (currentByte!11241 (_ BitVec 32)) (currentBit!11236 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10124)

(declare-fun array_inv!5321 (array!12704) Bool)

(assert (=> b!238315 (= e!164620 (array_inv!5321 (buf!6055 thiss!1830)))))

(declare-fun b!238316 () Bool)

(declare-fun e!164617 () Bool)

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238316 (= e!164617 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!238317 () Bool)

(declare-fun res!199195 () Bool)

(assert (=> b!238317 (=> (not res!199195) (not e!164617))))

(declare-fun lt!373218 () (_ BitVec 64))

(declare-datatypes ((tuple2!20114 0))(
  ( (tuple2!20115 (_1!10961 (_ BitVec 64)) (_2!10961 BitStream!10124)) )
))
(declare-fun lt!373216 () tuple2!20114)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238317 (= res!199195 (= (bitIndex!0 (size!5580 (buf!6055 (_2!10961 lt!373216))) (currentByte!11241 (_2!10961 lt!373216)) (currentBit!11236 (_2!10961 lt!373216))) (bvadd (bitIndex!0 (size!5580 (buf!6055 thiss!1830)) (currentByte!11241 thiss!1830) (currentBit!11236 thiss!1830)) lt!373218)))))

(declare-fun res!199200 () Bool)

(declare-fun e!164619 () Bool)

(assert (=> start!50898 (=> (not res!199200) (not e!164619))))

(assert (=> start!50898 (= res!199200 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50898 e!164619))

(assert (=> start!50898 true))

(declare-fun inv!12 (BitStream!10124) Bool)

(assert (=> start!50898 (and (inv!12 thiss!1830) e!164620)))

(declare-fun b!238318 () Bool)

(declare-fun e!164621 () Bool)

(assert (=> b!238318 (= e!164621 e!164617)))

(declare-fun res!199199 () Bool)

(assert (=> b!238318 (=> (not res!199199) (not e!164617))))

(assert (=> b!238318 (= res!199199 (= (buf!6055 (_2!10961 lt!373216)) (buf!6055 thiss!1830)))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!20116 0))(
  ( (tuple2!20117 (_1!10962 Bool) (_2!10962 BitStream!10124)) )
))
(declare-fun lt!373217 () tuple2!20116)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20114)

(assert (=> b!238318 (= lt!373216 (readNLeastSignificantBitsLoop!0 (_2!10962 lt!373217) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10962 lt!373217) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10124) tuple2!20116)

(assert (=> b!238318 (= lt!373217 (readBit!0 thiss!1830))))

(declare-fun b!238319 () Bool)

(assert (=> b!238319 (= e!164619 e!164621)))

(declare-fun res!199194 () Bool)

(assert (=> b!238319 (=> (not res!199194) (not e!164621))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238319 (= res!199194 (validate_offset_bits!1 ((_ sign_extend 32) (size!5580 (buf!6055 thiss!1830))) ((_ sign_extend 32) (currentByte!11241 thiss!1830)) ((_ sign_extend 32) (currentBit!11236 thiss!1830)) lt!373218))))

(assert (=> b!238319 (= lt!373218 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238320 () Bool)

(declare-fun res!199197 () Bool)

(assert (=> b!238320 (=> (not res!199197) (not e!164621))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238320 (= res!199197 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238321 () Bool)

(declare-fun res!199196 () Bool)

(assert (=> b!238321 (=> (not res!199196) (not e!164621))))

(assert (=> b!238321 (= res!199196 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238322 () Bool)

(declare-fun res!199198 () Bool)

(assert (=> b!238322 (=> (not res!199198) (not e!164621))))

(assert (=> b!238322 (= res!199198 (not (= nBits!581 i!752)))))

(assert (= (and start!50898 res!199200) b!238319))

(assert (= (and b!238319 res!199194) b!238321))

(assert (= (and b!238321 res!199196) b!238320))

(assert (= (and b!238320 res!199197) b!238322))

(assert (= (and b!238322 res!199198) b!238318))

(assert (= (and b!238318 res!199199) b!238317))

(assert (= (and b!238317 res!199195) b!238316))

(assert (= start!50898 b!238315))

(declare-fun m!360483 () Bool)

(assert (=> b!238321 m!360483))

(declare-fun m!360485 () Bool)

(assert (=> b!238320 m!360485))

(declare-fun m!360487 () Bool)

(assert (=> start!50898 m!360487))

(declare-fun m!360489 () Bool)

(assert (=> b!238315 m!360489))

(declare-fun m!360491 () Bool)

(assert (=> b!238319 m!360491))

(declare-fun m!360493 () Bool)

(assert (=> b!238317 m!360493))

(declare-fun m!360495 () Bool)

(assert (=> b!238317 m!360495))

(declare-fun m!360497 () Bool)

(assert (=> b!238318 m!360497))

(declare-fun m!360499 () Bool)

(assert (=> b!238318 m!360499))

(push 1)

(assert (not b!238321))

(assert (not b!238319))

(assert (not b!238317))

(assert (not b!238315))

(assert (not b!238320))

(assert (not start!50898))

(assert (not b!238318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

