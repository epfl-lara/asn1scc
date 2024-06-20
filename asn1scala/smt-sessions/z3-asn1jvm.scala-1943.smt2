; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50740 () Bool)

(assert start!50740)

(declare-fun res!198213 () Bool)

(declare-fun e!163942 () Bool)

(assert (=> start!50740 (=> (not res!198213) (not e!163942))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50740 (= res!198213 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50740 e!163942))

(assert (=> start!50740 true))

(declare-datatypes ((array!12585 0))(
  ( (array!12586 (arr!6509 (Array (_ BitVec 32) (_ BitVec 8))) (size!5522 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10008 0))(
  ( (BitStream!10009 (buf!5997 array!12585) (currentByte!11177 (_ BitVec 32)) (currentBit!11172 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10008)

(declare-fun e!163941 () Bool)

(declare-fun inv!12 (BitStream!10008) Bool)

(assert (=> start!50740 (and (inv!12 thiss!1830) e!163941)))

(declare-fun b!237141 () Bool)

(declare-fun res!198212 () Bool)

(assert (=> b!237141 (=> (not res!198212) (not e!163942))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237141 (= res!198212 (validate_offset_bits!1 ((_ sign_extend 32) (size!5522 (buf!5997 thiss!1830))) ((_ sign_extend 32) (currentByte!11177 thiss!1830)) ((_ sign_extend 32) (currentBit!11172 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237142 () Bool)

(assert (=> b!237142 (= e!163942 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!237143 () Bool)

(declare-fun array_inv!5263 (array!12585) Bool)

(assert (=> b!237143 (= e!163941 (array_inv!5263 (buf!5997 thiss!1830)))))

(assert (= (and start!50740 res!198213) b!237141))

(assert (= (and b!237141 res!198212) b!237142))

(assert (= start!50740 b!237143))

(declare-fun m!359697 () Bool)

(assert (=> start!50740 m!359697))

(declare-fun m!359699 () Bool)

(assert (=> b!237141 m!359699))

(declare-fun m!359701 () Bool)

(assert (=> b!237143 m!359701))

(check-sat (not start!50740) (not b!237143) (not b!237141))
(check-sat)
