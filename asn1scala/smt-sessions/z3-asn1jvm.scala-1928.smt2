; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50278 () Bool)

(assert start!50278)

(declare-fun b!235924 () Bool)

(declare-fun e!163158 () Bool)

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> b!235924 (= e!163158 (bvsgt #b00000000000000000000000000000000 nBits!581))))

(declare-fun res!197179 () Bool)

(assert (=> start!50278 (=> (not res!197179) (not e!163158))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> start!50278 (= res!197179 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50278 e!163158))

(assert (=> start!50278 true))

(declare-datatypes ((array!12474 0))(
  ( (array!12475 (arr!6467 (Array (_ BitVec 32) (_ BitVec 8))) (size!5480 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9924 0))(
  ( (BitStream!9925 (buf!5955 array!12474) (currentByte!11066 (_ BitVec 32)) (currentBit!11061 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9924)

(declare-fun e!163160 () Bool)

(declare-fun inv!12 (BitStream!9924) Bool)

(assert (=> start!50278 (and (inv!12 thiss!1830) e!163160)))

(declare-fun b!235925 () Bool)

(declare-fun array_inv!5221 (array!12474) Bool)

(assert (=> b!235925 (= e!163160 (array_inv!5221 (buf!5955 thiss!1830)))))

(declare-fun b!235923 () Bool)

(declare-fun res!197180 () Bool)

(assert (=> b!235923 (=> (not res!197180) (not e!163158))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235923 (= res!197180 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235922 () Bool)

(declare-fun res!197181 () Bool)

(assert (=> b!235922 (=> (not res!197181) (not e!163158))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235922 (= res!197181 (validate_offset_bits!1 ((_ sign_extend 32) (size!5480 (buf!5955 thiss!1830))) ((_ sign_extend 32) (currentByte!11066 thiss!1830)) ((_ sign_extend 32) (currentBit!11061 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(assert (= (and start!50278 res!197179) b!235922))

(assert (= (and b!235922 res!197181) b!235923))

(assert (= (and b!235923 res!197180) b!235924))

(assert (= start!50278 b!235925))

(declare-fun m!358565 () Bool)

(assert (=> start!50278 m!358565))

(declare-fun m!358567 () Bool)

(assert (=> b!235925 m!358567))

(declare-fun m!358569 () Bool)

(assert (=> b!235923 m!358569))

(declare-fun m!358571 () Bool)

(assert (=> b!235922 m!358571))

(check-sat (not b!235923) (not b!235925) (not start!50278) (not b!235922))
(check-sat)
