; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50750 () Bool)

(assert start!50750)

(declare-fun b!237210 () Bool)

(declare-fun e!163988 () Bool)

(declare-datatypes ((array!12595 0))(
  ( (array!12596 (arr!6514 (Array (_ BitVec 32) (_ BitVec 8))) (size!5527 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10018 0))(
  ( (BitStream!10019 (buf!6002 array!12595) (currentByte!11182 (_ BitVec 32)) (currentBit!11177 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10018)

(declare-fun array_inv!5268 (array!12595) Bool)

(assert (=> b!237210 (= e!163988 (array_inv!5268 (buf!6002 thiss!1830)))))

(declare-fun res!198270 () Bool)

(declare-fun e!163986 () Bool)

(assert (=> start!50750 (=> (not res!198270) (not e!163986))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50750 (= res!198270 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50750 e!163986))

(assert (=> start!50750 true))

(declare-fun inv!12 (BitStream!10018) Bool)

(assert (=> start!50750 (and (inv!12 thiss!1830) e!163988)))

(declare-fun b!237211 () Bool)

(declare-fun res!198269 () Bool)

(assert (=> b!237211 (=> (not res!198269) (not e!163986))))

(assert (=> b!237211 (= res!198269 (= nBits!581 i!752))))

(declare-fun b!237212 () Bool)

(declare-fun res!198266 () Bool)

(assert (=> b!237212 (=> (not res!198266) (not e!163986))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237212 (= res!198266 (validate_offset_bits!1 ((_ sign_extend 32) (size!5527 (buf!6002 thiss!1830))) ((_ sign_extend 32) (currentByte!11182 thiss!1830)) ((_ sign_extend 32) (currentBit!11177 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237213 () Bool)

(declare-fun res!198268 () Bool)

(assert (=> b!237213 (=> (not res!198268) (not e!163986))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237213 (= res!198268 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237214 () Bool)

(assert (=> b!237214 (= e!163986 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun lt!372753 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237214 (= lt!372753 (bitIndex!0 (size!5527 (buf!6002 thiss!1830)) (currentByte!11182 thiss!1830) (currentBit!11177 thiss!1830)))))

(declare-fun b!237215 () Bool)

(declare-fun res!198267 () Bool)

(assert (=> b!237215 (=> (not res!198267) (not e!163986))))

(assert (=> b!237215 (= res!198267 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50750 res!198270) b!237212))

(assert (= (and b!237212 res!198266) b!237215))

(assert (= (and b!237215 res!198267) b!237213))

(assert (= (and b!237213 res!198268) b!237211))

(assert (= (and b!237211 res!198269) b!237214))

(assert (= start!50750 b!237210))

(declare-fun m!359739 () Bool)

(assert (=> b!237210 m!359739))

(declare-fun m!359741 () Bool)

(assert (=> b!237215 m!359741))

(declare-fun m!359743 () Bool)

(assert (=> start!50750 m!359743))

(declare-fun m!359745 () Bool)

(assert (=> b!237214 m!359745))

(declare-fun m!359747 () Bool)

(assert (=> b!237212 m!359747))

(declare-fun m!359749 () Bool)

(assert (=> b!237213 m!359749))

(push 1)

(assert (not b!237215))

(assert (not b!237212))

(assert (not b!237210))

(assert (not b!237214))

(assert (not b!237213))

(assert (not start!50750))

(check-sat)

(pop 1)

