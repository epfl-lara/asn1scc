; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50828 () Bool)

(assert start!50828)

(declare-fun b!237939 () Bool)

(declare-fun e!164392 () Bool)

(declare-datatypes ((array!12673 0))(
  ( (array!12674 (arr!6553 (Array (_ BitVec 32) (_ BitVec 8))) (size!5566 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10096 0))(
  ( (BitStream!10097 (buf!6041 array!12673) (currentByte!11221 (_ BitVec 32)) (currentBit!11216 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10096)

(declare-fun array_inv!5307 (array!12673) Bool)

(assert (=> b!237939 (= e!164392 (array_inv!5307 (buf!6041 thiss!1830)))))

(declare-fun res!198882 () Bool)

(declare-fun e!164393 () Bool)

(assert (=> start!50828 (=> (not res!198882) (not e!164393))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50828 (= res!198882 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50828 e!164393))

(assert (=> start!50828 true))

(declare-fun inv!12 (BitStream!10096) Bool)

(assert (=> start!50828 (and (inv!12 thiss!1830) e!164392)))

(declare-fun b!237940 () Bool)

(declare-fun res!198881 () Bool)

(assert (=> b!237940 (=> (not res!198881) (not e!164393))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237940 (= res!198881 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237941 () Bool)

(declare-fun res!198880 () Bool)

(assert (=> b!237941 (=> (not res!198880) (not e!164393))))

(assert (=> b!237941 (= res!198880 (not (= nBits!581 i!752)))))

(declare-fun b!237942 () Bool)

(declare-fun res!198879 () Bool)

(assert (=> b!237942 (=> (not res!198879) (not e!164393))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237942 (= res!198879 (validate_offset_bits!1 ((_ sign_extend 32) (size!5566 (buf!6041 thiss!1830))) ((_ sign_extend 32) (currentByte!11221 thiss!1830)) ((_ sign_extend 32) (currentBit!11216 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237943 () Bool)

(assert (=> b!237943 (= e!164393 (and (= (bvand i!752 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!752 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!20058 0))(
  ( (tuple2!20059 (_1!10933 Bool) (_2!10933 BitStream!10096)) )
))
(declare-fun lt!372924 () tuple2!20058)

(declare-fun readBit!0 (BitStream!10096) tuple2!20058)

(assert (=> b!237943 (= lt!372924 (readBit!0 thiss!1830))))

(declare-fun b!237944 () Bool)

(declare-fun res!198878 () Bool)

(assert (=> b!237944 (=> (not res!198878) (not e!164393))))

(assert (=> b!237944 (= res!198878 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50828 res!198882) b!237942))

(assert (= (and b!237942 res!198879) b!237944))

(assert (= (and b!237944 res!198878) b!237940))

(assert (= (and b!237940 res!198881) b!237941))

(assert (= (and b!237941 res!198880) b!237943))

(assert (= start!50828 b!237939))

(declare-fun m!360207 () Bool)

(assert (=> start!50828 m!360207))

(declare-fun m!360209 () Bool)

(assert (=> b!237944 m!360209))

(declare-fun m!360211 () Bool)

(assert (=> b!237942 m!360211))

(declare-fun m!360213 () Bool)

(assert (=> b!237939 m!360213))

(declare-fun m!360215 () Bool)

(assert (=> b!237943 m!360215))

(declare-fun m!360217 () Bool)

(assert (=> b!237940 m!360217))

(push 1)

(assert (not b!237940))

(assert (not b!237944))

(assert (not start!50828))

(assert (not b!237943))

(assert (not b!237939))

(assert (not b!237942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

