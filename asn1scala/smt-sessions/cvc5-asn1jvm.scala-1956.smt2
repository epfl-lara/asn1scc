; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50816 () Bool)

(assert start!50816)

(declare-fun b!237815 () Bool)

(declare-fun res!198773 () Bool)

(declare-fun e!164339 () Bool)

(assert (=> b!237815 (=> (not res!198773) (not e!164339))))

(declare-datatypes ((array!12661 0))(
  ( (array!12662 (arr!6547 (Array (_ BitVec 32) (_ BitVec 8))) (size!5560 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10084 0))(
  ( (BitStream!10085 (buf!6035 array!12661) (currentByte!11215 (_ BitVec 32)) (currentBit!11210 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10084)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237815 (= res!198773 (validate_offset_bits!1 ((_ sign_extend 32) (size!5560 (buf!6035 thiss!1830))) ((_ sign_extend 32) (currentByte!11215 thiss!1830)) ((_ sign_extend 32) (currentBit!11210 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237816 () Bool)

(declare-fun res!198772 () Bool)

(assert (=> b!237816 (=> (not res!198772) (not e!164339))))

(declare-datatypes ((tuple2!20046 0))(
  ( (tuple2!20047 (_1!10927 Bool) (_2!10927 BitStream!10084)) )
))
(declare-fun readBit!0 (BitStream!10084) tuple2!20046)

(assert (=> b!237816 (= res!198772 (_1!10927 (readBit!0 thiss!1830)))))

(declare-fun lt!372906 () (_ BitVec 32))

(declare-fun b!237818 () Bool)

(assert (=> b!237818 (= e!164339 (and (not (= lt!372906 (bvand i!752 #b10000000000000000000000000000000))) (not (= lt!372906 (bvand (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752) #b10000000000000000000000000000000)))))))

(assert (=> b!237818 (= lt!372906 (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))

(declare-fun b!237819 () Bool)

(declare-fun e!164337 () Bool)

(declare-fun array_inv!5301 (array!12661) Bool)

(assert (=> b!237819 (= e!164337 (array_inv!5301 (buf!6035 thiss!1830)))))

(declare-fun b!237820 () Bool)

(declare-fun res!198777 () Bool)

(assert (=> b!237820 (=> (not res!198777) (not e!164339))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237820 (= res!198777 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237821 () Bool)

(declare-fun res!198774 () Bool)

(assert (=> b!237821 (=> (not res!198774) (not e!164339))))

(assert (=> b!237821 (= res!198774 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!198775 () Bool)

(assert (=> start!50816 (=> (not res!198775) (not e!164339))))

(assert (=> start!50816 (= res!198775 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50816 e!164339))

(assert (=> start!50816 true))

(declare-fun inv!12 (BitStream!10084) Bool)

(assert (=> start!50816 (and (inv!12 thiss!1830) e!164337)))

(declare-fun b!237817 () Bool)

(declare-fun res!198776 () Bool)

(assert (=> b!237817 (=> (not res!198776) (not e!164339))))

(assert (=> b!237817 (= res!198776 (not (= nBits!581 i!752)))))

(assert (= (and start!50816 res!198775) b!237815))

(assert (= (and b!237815 res!198773) b!237821))

(assert (= (and b!237821 res!198774) b!237820))

(assert (= (and b!237820 res!198777) b!237817))

(assert (= (and b!237817 res!198776) b!237816))

(assert (= (and b!237816 res!198772) b!237818))

(assert (= start!50816 b!237819))

(declare-fun m!360135 () Bool)

(assert (=> b!237820 m!360135))

(declare-fun m!360137 () Bool)

(assert (=> b!237815 m!360137))

(declare-fun m!360139 () Bool)

(assert (=> b!237821 m!360139))

(declare-fun m!360141 () Bool)

(assert (=> b!237816 m!360141))

(declare-fun m!360143 () Bool)

(assert (=> b!237819 m!360143))

(declare-fun m!360145 () Bool)

(assert (=> start!50816 m!360145))

(push 1)

(assert (not b!237821))

(assert (not b!237816))

(assert (not start!50816))

(assert (not b!237820))

(assert (not b!237815))

(assert (not b!237819))

(check-sat)

(pop 1)

(push 1)

(check-sat)

