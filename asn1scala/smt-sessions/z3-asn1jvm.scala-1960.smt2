; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50842 () Bool)

(assert start!50842)

(declare-fun b!238070 () Bool)

(declare-fun e!164459 () Bool)

(declare-datatypes ((array!12687 0))(
  ( (array!12688 (arr!6560 (Array (_ BitVec 32) (_ BitVec 8))) (size!5573 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10110 0))(
  ( (BitStream!10111 (buf!6048 array!12687) (currentByte!11228 (_ BitVec 32)) (currentBit!11223 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10110)

(declare-fun array_inv!5314 (array!12687) Bool)

(assert (=> b!238070 (= e!164459 (array_inv!5314 (buf!6048 thiss!1830)))))

(declare-fun b!238071 () Bool)

(declare-fun res!198990 () Bool)

(declare-fun e!164460 () Bool)

(assert (=> b!238071 (=> (not res!198990) (not e!164460))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238071 (= res!198990 (not (= nBits!581 i!752)))))

(declare-fun b!238072 () Bool)

(declare-fun res!198992 () Bool)

(assert (=> b!238072 (=> (not res!198992) (not e!164460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238072 (= res!198992 (validate_offset_bits!1 ((_ sign_extend 32) (size!5573 (buf!6048 thiss!1830))) ((_ sign_extend 32) (currentByte!11228 thiss!1830)) ((_ sign_extend 32) (currentBit!11223 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!238073 () Bool)

(declare-fun res!198988 () Bool)

(assert (=> b!238073 (=> (not res!198988) (not e!164460))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238073 (= res!198988 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238074 () Bool)

(declare-fun res!198993 () Bool)

(assert (=> b!238074 (=> (not res!198993) (not e!164460))))

(assert (=> b!238074 (= res!198993 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238075 () Bool)

(declare-fun e!164461 () Bool)

(assert (=> b!238075 (= e!164461 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun lt!372950 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238075 (= lt!372950 (bitIndex!0 (size!5573 (buf!6048 thiss!1830)) (currentByte!11228 thiss!1830) (currentBit!11223 thiss!1830)))))

(declare-fun res!198989 () Bool)

(assert (=> start!50842 (=> (not res!198989) (not e!164460))))

(assert (=> start!50842 (= res!198989 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50842 e!164460))

(assert (=> start!50842 true))

(declare-fun inv!12 (BitStream!10110) Bool)

(assert (=> start!50842 (and (inv!12 thiss!1830) e!164459)))

(declare-fun b!238076 () Bool)

(assert (=> b!238076 (= e!164460 e!164461)))

(declare-fun res!198991 () Bool)

(assert (=> b!238076 (=> (not res!198991) (not e!164461))))

(declare-datatypes ((tuple2!20074 0))(
  ( (tuple2!20075 (_1!10941 Bool) (_2!10941 BitStream!10110)) )
))
(declare-fun lt!372951 () tuple2!20074)

(declare-datatypes ((tuple2!20076 0))(
  ( (tuple2!20077 (_1!10942 (_ BitVec 64)) (_2!10942 BitStream!10110)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20076)

(assert (=> b!238076 (= res!198991 (= (buf!6048 (_2!10942 (readNLeastSignificantBitsLoop!0 (_2!10941 lt!372951) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10941 lt!372951) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!6048 thiss!1830)))))

(declare-fun readBit!0 (BitStream!10110) tuple2!20074)

(assert (=> b!238076 (= lt!372951 (readBit!0 thiss!1830))))

(assert (= (and start!50842 res!198989) b!238072))

(assert (= (and b!238072 res!198992) b!238073))

(assert (= (and b!238073 res!198988) b!238074))

(assert (= (and b!238074 res!198993) b!238071))

(assert (= (and b!238071 res!198990) b!238076))

(assert (= (and b!238076 res!198991) b!238075))

(assert (= start!50842 b!238070))

(declare-fun m!360295 () Bool)

(assert (=> b!238075 m!360295))

(declare-fun m!360297 () Bool)

(assert (=> b!238070 m!360297))

(declare-fun m!360299 () Bool)

(assert (=> b!238072 m!360299))

(declare-fun m!360301 () Bool)

(assert (=> start!50842 m!360301))

(declare-fun m!360303 () Bool)

(assert (=> b!238073 m!360303))

(declare-fun m!360305 () Bool)

(assert (=> b!238076 m!360305))

(declare-fun m!360307 () Bool)

(assert (=> b!238076 m!360307))

(declare-fun m!360309 () Bool)

(assert (=> b!238074 m!360309))

(check-sat (not start!50842) (not b!238076) (not b!238075) (not b!238072) (not b!238074) (not b!238070) (not b!238073))
(check-sat)
