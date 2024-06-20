; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50824 () Bool)

(assert start!50824)

(declare-fun b!237899 () Bool)

(declare-fun e!164374 () Bool)

(declare-fun lt!372918 () (_ BitVec 64))

(assert (=> b!237899 (= e!164374 (or (bvslt lt!372918 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!372918 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237899 (= lt!372918 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752)))))

(declare-fun b!237900 () Bool)

(declare-fun res!198845 () Bool)

(assert (=> b!237900 (=> (not res!198845) (not e!164374))))

(assert (=> b!237900 (= res!198845 (not (= nBits!581 i!752)))))

(declare-fun b!237901 () Bool)

(declare-fun res!198848 () Bool)

(assert (=> b!237901 (=> (not res!198848) (not e!164374))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237901 (= res!198848 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237902 () Bool)

(declare-fun res!198847 () Bool)

(assert (=> b!237902 (=> (not res!198847) (not e!164374))))

(assert (=> b!237902 (= res!198847 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237903 () Bool)

(declare-fun e!164373 () Bool)

(declare-datatypes ((array!12669 0))(
  ( (array!12670 (arr!6551 (Array (_ BitVec 32) (_ BitVec 8))) (size!5564 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10092 0))(
  ( (BitStream!10093 (buf!6039 array!12669) (currentByte!11219 (_ BitVec 32)) (currentBit!11214 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10092)

(declare-fun array_inv!5305 (array!12669) Bool)

(assert (=> b!237903 (= e!164373 (array_inv!5305 (buf!6039 thiss!1830)))))

(declare-fun b!237904 () Bool)

(declare-fun res!198846 () Bool)

(assert (=> b!237904 (=> (not res!198846) (not e!164374))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237904 (= res!198846 (validate_offset_bits!1 ((_ sign_extend 32) (size!5564 (buf!6039 thiss!1830))) ((_ sign_extend 32) (currentByte!11219 thiss!1830)) ((_ sign_extend 32) (currentBit!11214 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237905 () Bool)

(declare-fun res!198849 () Bool)

(assert (=> b!237905 (=> (not res!198849) (not e!164374))))

(declare-datatypes ((tuple2!20054 0))(
  ( (tuple2!20055 (_1!10931 Bool) (_2!10931 BitStream!10092)) )
))
(declare-fun readBit!0 (BitStream!10092) tuple2!20054)

(assert (=> b!237905 (= res!198849 (_1!10931 (readBit!0 thiss!1830)))))

(declare-fun res!198844 () Bool)

(assert (=> start!50824 (=> (not res!198844) (not e!164374))))

(assert (=> start!50824 (= res!198844 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50824 e!164374))

(assert (=> start!50824 true))

(declare-fun inv!12 (BitStream!10092) Bool)

(assert (=> start!50824 (and (inv!12 thiss!1830) e!164373)))

(assert (= (and start!50824 res!198844) b!237904))

(assert (= (and b!237904 res!198846) b!237901))

(assert (= (and b!237901 res!198848) b!237902))

(assert (= (and b!237902 res!198847) b!237900))

(assert (= (and b!237900 res!198845) b!237905))

(assert (= (and b!237905 res!198849) b!237899))

(assert (= start!50824 b!237903))

(declare-fun m!360183 () Bool)

(assert (=> b!237901 m!360183))

(declare-fun m!360185 () Bool)

(assert (=> b!237904 m!360185))

(declare-fun m!360187 () Bool)

(assert (=> b!237902 m!360187))

(declare-fun m!360189 () Bool)

(assert (=> b!237903 m!360189))

(declare-fun m!360191 () Bool)

(assert (=> b!237905 m!360191))

(declare-fun m!360193 () Bool)

(assert (=> start!50824 m!360193))

(check-sat (not b!237904) (not b!237901) (not start!50824) (not b!237902) (not b!237905) (not b!237903))
(check-sat)
