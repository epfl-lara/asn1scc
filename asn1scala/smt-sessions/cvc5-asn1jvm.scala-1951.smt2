; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50786 () Bool)

(assert start!50786)

(declare-fun b!237534 () Bool)

(declare-fun res!198536 () Bool)

(declare-fun e!164194 () Bool)

(assert (=> b!237534 (=> (not res!198536) (not e!164194))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237534 (= res!198536 (= nBits!581 i!752))))

(declare-fun b!237535 () Bool)

(declare-fun res!198539 () Bool)

(assert (=> b!237535 (=> (not res!198539) (not e!164194))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237535 (= res!198539 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237536 () Bool)

(declare-fun res!198540 () Bool)

(assert (=> b!237536 (=> (not res!198540) (not e!164194))))

(assert (=> b!237536 (= res!198540 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237537 () Bool)

(declare-fun res!198537 () Bool)

(assert (=> b!237537 (=> (not res!198537) (not e!164194))))

(declare-datatypes ((array!12631 0))(
  ( (array!12632 (arr!6532 (Array (_ BitVec 32) (_ BitVec 8))) (size!5545 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10054 0))(
  ( (BitStream!10055 (buf!6020 array!12631) (currentByte!11200 (_ BitVec 32)) (currentBit!11195 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10054)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237537 (= res!198537 (validate_offset_bits!1 ((_ sign_extend 32) (size!5545 (buf!6020 thiss!1830))) ((_ sign_extend 32) (currentByte!11200 thiss!1830)) ((_ sign_extend 32) (currentBit!11195 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237538 () Bool)

(assert (=> b!237538 (= e!164194 false)))

(declare-fun lt!372861 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237538 (= lt!372861 (bitIndex!0 (size!5545 (buf!6020 thiss!1830)) (currentByte!11200 thiss!1830) (currentBit!11195 thiss!1830)))))

(declare-fun res!198538 () Bool)

(assert (=> start!50786 (=> (not res!198538) (not e!164194))))

(assert (=> start!50786 (= res!198538 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50786 e!164194))

(assert (=> start!50786 true))

(declare-fun e!164195 () Bool)

(declare-fun inv!12 (BitStream!10054) Bool)

(assert (=> start!50786 (and (inv!12 thiss!1830) e!164195)))

(declare-fun b!237539 () Bool)

(declare-fun array_inv!5286 (array!12631) Bool)

(assert (=> b!237539 (= e!164195 (array_inv!5286 (buf!6020 thiss!1830)))))

(assert (= (and start!50786 res!198538) b!237537))

(assert (= (and b!237537 res!198537) b!237536))

(assert (= (and b!237536 res!198540) b!237535))

(assert (= (and b!237535 res!198539) b!237534))

(assert (= (and b!237534 res!198536) b!237538))

(assert (= start!50786 b!237539))

(declare-fun m!359955 () Bool)

(assert (=> b!237538 m!359955))

(declare-fun m!359957 () Bool)

(assert (=> b!237536 m!359957))

(declare-fun m!359959 () Bool)

(assert (=> b!237535 m!359959))

(declare-fun m!359961 () Bool)

(assert (=> start!50786 m!359961))

(declare-fun m!359963 () Bool)

(assert (=> b!237537 m!359963))

(declare-fun m!359965 () Bool)

(assert (=> b!237539 m!359965))

(push 1)

(assert (not start!50786))

(assert (not b!237536))

(assert (not b!237539))

(assert (not b!237537))

(assert (not b!237538))

(assert (not b!237535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

