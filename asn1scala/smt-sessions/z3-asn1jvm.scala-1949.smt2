; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50776 () Bool)

(assert start!50776)

(declare-fun b!237444 () Bool)

(declare-fun res!198461 () Bool)

(declare-fun e!164138 () Bool)

(assert (=> b!237444 (=> (not res!198461) (not e!164138))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237444 (= res!198461 (= nBits!581 i!752))))

(declare-fun b!237445 () Bool)

(declare-fun res!198462 () Bool)

(assert (=> b!237445 (=> (not res!198462) (not e!164138))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237445 (= res!198462 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237446 () Bool)

(declare-fun e!164135 () Bool)

(assert (=> b!237446 (= e!164135 e!164138)))

(declare-fun res!198463 () Bool)

(assert (=> b!237446 (=> (not res!198463) (not e!164138))))

(declare-datatypes ((array!12621 0))(
  ( (array!12622 (arr!6527 (Array (_ BitVec 32) (_ BitVec 8))) (size!5540 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10044 0))(
  ( (BitStream!10045 (buf!6015 array!12621) (currentByte!11195 (_ BitVec 32)) (currentBit!11190 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10044)

(declare-fun lt!372833 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237446 (= res!198463 (validate_offset_bits!1 ((_ sign_extend 32) (size!5540 (buf!6015 thiss!1830))) ((_ sign_extend 32) (currentByte!11195 thiss!1830)) ((_ sign_extend 32) (currentBit!11190 thiss!1830)) lt!372833))))

(assert (=> b!237446 (= lt!372833 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237447 () Bool)

(declare-fun res!198465 () Bool)

(assert (=> b!237447 (=> (not res!198465) (not e!164138))))

(assert (=> b!237447 (= res!198465 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237448 () Bool)

(declare-fun e!164137 () Bool)

(declare-fun array_inv!5281 (array!12621) Bool)

(assert (=> b!237448 (= e!164137 (array_inv!5281 (buf!6015 thiss!1830)))))

(declare-fun lt!372834 () (_ BitVec 64))

(declare-fun b!237449 () Bool)

(assert (=> b!237449 (= e!164138 (and (= lt!372834 (bvadd lt!372834 lt!372833)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237449 (= lt!372834 (bitIndex!0 (size!5540 (buf!6015 thiss!1830)) (currentByte!11195 thiss!1830) (currentBit!11190 thiss!1830)))))

(declare-fun res!198464 () Bool)

(assert (=> start!50776 (=> (not res!198464) (not e!164135))))

(assert (=> start!50776 (= res!198464 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50776 e!164135))

(assert (=> start!50776 true))

(declare-fun inv!12 (BitStream!10044) Bool)

(assert (=> start!50776 (and (inv!12 thiss!1830) e!164137)))

(assert (= (and start!50776 res!198464) b!237446))

(assert (= (and b!237446 res!198463) b!237445))

(assert (= (and b!237445 res!198462) b!237447))

(assert (= (and b!237447 res!198465) b!237444))

(assert (= (and b!237444 res!198461) b!237449))

(assert (= start!50776 b!237448))

(declare-fun m!359895 () Bool)

(assert (=> start!50776 m!359895))

(declare-fun m!359897 () Bool)

(assert (=> b!237448 m!359897))

(declare-fun m!359899 () Bool)

(assert (=> b!237449 m!359899))

(declare-fun m!359901 () Bool)

(assert (=> b!237446 m!359901))

(declare-fun m!359903 () Bool)

(assert (=> b!237445 m!359903))

(declare-fun m!359905 () Bool)

(assert (=> b!237447 m!359905))

(check-sat (not b!237449) (not b!237447) (not b!237448) (not b!237446) (not start!50776) (not b!237445))
(check-sat)
