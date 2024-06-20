; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50818 () Bool)

(assert start!50818)

(declare-fun b!237836 () Bool)

(declare-fun res!198794 () Bool)

(declare-fun e!164347 () Bool)

(assert (=> b!237836 (=> (not res!198794) (not e!164347))))

(declare-datatypes ((array!12663 0))(
  ( (array!12664 (arr!6548 (Array (_ BitVec 32) (_ BitVec 8))) (size!5561 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10086 0))(
  ( (BitStream!10087 (buf!6036 array!12663) (currentByte!11216 (_ BitVec 32)) (currentBit!11211 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10086)

(declare-datatypes ((tuple2!20048 0))(
  ( (tuple2!20049 (_1!10928 Bool) (_2!10928 BitStream!10086)) )
))
(declare-fun readBit!0 (BitStream!10086) tuple2!20048)

(assert (=> b!237836 (= res!198794 (_1!10928 (readBit!0 thiss!1830)))))

(declare-fun res!198793 () Bool)

(assert (=> start!50818 (=> (not res!198793) (not e!164347))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50818 (= res!198793 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50818 e!164347))

(assert (=> start!50818 true))

(declare-fun e!164348 () Bool)

(declare-fun inv!12 (BitStream!10086) Bool)

(assert (=> start!50818 (and (inv!12 thiss!1830) e!164348)))

(declare-fun b!237837 () Bool)

(declare-fun lt!372909 () (_ BitVec 32))

(assert (=> b!237837 (= e!164347 (and (not (= lt!372909 (bvand i!752 #b10000000000000000000000000000000))) (not (= lt!372909 (bvand (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752) #b10000000000000000000000000000000)))))))

(assert (=> b!237837 (= lt!372909 (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))

(declare-fun b!237838 () Bool)

(declare-fun res!198792 () Bool)

(assert (=> b!237838 (=> (not res!198792) (not e!164347))))

(assert (=> b!237838 (= res!198792 (not (= nBits!581 i!752)))))

(declare-fun b!237839 () Bool)

(declare-fun array_inv!5302 (array!12663) Bool)

(assert (=> b!237839 (= e!164348 (array_inv!5302 (buf!6036 thiss!1830)))))

(declare-fun b!237840 () Bool)

(declare-fun res!198790 () Bool)

(assert (=> b!237840 (=> (not res!198790) (not e!164347))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237840 (= res!198790 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237841 () Bool)

(declare-fun res!198791 () Bool)

(assert (=> b!237841 (=> (not res!198791) (not e!164347))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237841 (= res!198791 (validate_offset_bits!1 ((_ sign_extend 32) (size!5561 (buf!6036 thiss!1830))) ((_ sign_extend 32) (currentByte!11216 thiss!1830)) ((_ sign_extend 32) (currentBit!11211 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237842 () Bool)

(declare-fun res!198795 () Bool)

(assert (=> b!237842 (=> (not res!198795) (not e!164347))))

(assert (=> b!237842 (= res!198795 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50818 res!198793) b!237841))

(assert (= (and b!237841 res!198791) b!237840))

(assert (= (and b!237840 res!198790) b!237842))

(assert (= (and b!237842 res!198795) b!237838))

(assert (= (and b!237838 res!198792) b!237836))

(assert (= (and b!237836 res!198794) b!237837))

(assert (= start!50818 b!237839))

(declare-fun m!360147 () Bool)

(assert (=> b!237836 m!360147))

(declare-fun m!360149 () Bool)

(assert (=> b!237839 m!360149))

(declare-fun m!360151 () Bool)

(assert (=> b!237841 m!360151))

(declare-fun m!360153 () Bool)

(assert (=> b!237842 m!360153))

(declare-fun m!360155 () Bool)

(assert (=> start!50818 m!360155))

(declare-fun m!360157 () Bool)

(assert (=> b!237840 m!360157))

(check-sat (not start!50818) (not b!237841) (not b!237840) (not b!237836) (not b!237842) (not b!237839))
(check-sat)
