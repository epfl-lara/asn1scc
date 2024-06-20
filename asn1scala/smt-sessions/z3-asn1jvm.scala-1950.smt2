; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50782 () Bool)

(assert start!50782)

(declare-fun b!237498 () Bool)

(declare-fun res!198507 () Bool)

(declare-fun e!164173 () Bool)

(assert (=> b!237498 (=> (not res!198507) (not e!164173))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237498 (= res!198507 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237499 () Bool)

(declare-fun e!164172 () Bool)

(assert (=> b!237499 (= e!164172 e!164173)))

(declare-fun res!198509 () Bool)

(assert (=> b!237499 (=> (not res!198509) (not e!164173))))

(declare-datatypes ((array!12627 0))(
  ( (array!12628 (arr!6530 (Array (_ BitVec 32) (_ BitVec 8))) (size!5543 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10050 0))(
  ( (BitStream!10051 (buf!6018 array!12627) (currentByte!11198 (_ BitVec 32)) (currentBit!11193 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10050)

(declare-fun lt!372851 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237499 (= res!198509 (validate_offset_bits!1 ((_ sign_extend 32) (size!5543 (buf!6018 thiss!1830))) ((_ sign_extend 32) (currentByte!11198 thiss!1830)) ((_ sign_extend 32) (currentBit!11193 thiss!1830)) lt!372851))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237499 (= lt!372851 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237500 () Bool)

(declare-fun res!198506 () Bool)

(assert (=> b!237500 (=> (not res!198506) (not e!164173))))

(assert (=> b!237500 (= res!198506 (= nBits!581 i!752))))

(declare-fun b!237501 () Bool)

(declare-fun e!164171 () Bool)

(declare-fun array_inv!5284 (array!12627) Bool)

(assert (=> b!237501 (= e!164171 (array_inv!5284 (buf!6018 thiss!1830)))))

(declare-fun b!237502 () Bool)

(declare-fun lt!372852 () (_ BitVec 64))

(assert (=> b!237502 (= e!164173 (and (= lt!372852 (bvadd lt!372852 lt!372851)) (bvsgt lt!372851 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237502 (= lt!372852 (bitIndex!0 (size!5543 (buf!6018 thiss!1830)) (currentByte!11198 thiss!1830) (currentBit!11193 thiss!1830)))))

(declare-fun b!237503 () Bool)

(declare-fun res!198508 () Bool)

(assert (=> b!237503 (=> (not res!198508) (not e!164173))))

(assert (=> b!237503 (= res!198508 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!198510 () Bool)

(assert (=> start!50782 (=> (not res!198510) (not e!164172))))

(assert (=> start!50782 (= res!198510 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50782 e!164172))

(assert (=> start!50782 true))

(declare-fun inv!12 (BitStream!10050) Bool)

(assert (=> start!50782 (and (inv!12 thiss!1830) e!164171)))

(assert (= (and start!50782 res!198510) b!237499))

(assert (= (and b!237499 res!198509) b!237503))

(assert (= (and b!237503 res!198508) b!237498))

(assert (= (and b!237498 res!198507) b!237500))

(assert (= (and b!237500 res!198506) b!237502))

(assert (= start!50782 b!237501))

(declare-fun m!359931 () Bool)

(assert (=> start!50782 m!359931))

(declare-fun m!359933 () Bool)

(assert (=> b!237502 m!359933))

(declare-fun m!359935 () Bool)

(assert (=> b!237499 m!359935))

(declare-fun m!359937 () Bool)

(assert (=> b!237503 m!359937))

(declare-fun m!359939 () Bool)

(assert (=> b!237501 m!359939))

(declare-fun m!359941 () Bool)

(assert (=> b!237498 m!359941))

(check-sat (not b!237502) (not start!50782) (not b!237499) (not b!237498) (not b!237503) (not b!237501))
(check-sat)
