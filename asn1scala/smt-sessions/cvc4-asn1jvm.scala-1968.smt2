; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50934 () Bool)

(assert start!50934)

(declare-fun b!238721 () Bool)

(declare-fun res!199547 () Bool)

(declare-fun e!164918 () Bool)

(assert (=> b!238721 (=> (not res!199547) (not e!164918))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238721 (= res!199547 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238722 () Bool)

(declare-fun e!164916 () Bool)

(declare-datatypes ((array!12740 0))(
  ( (array!12741 (arr!6585 (Array (_ BitVec 32) (_ BitVec 8))) (size!5598 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10160 0))(
  ( (BitStream!10161 (buf!6073 array!12740) (currentByte!11259 (_ BitVec 32)) (currentBit!11254 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10160)

(declare-fun array_inv!5339 (array!12740) Bool)

(assert (=> b!238722 (= e!164916 (array_inv!5339 (buf!6073 thiss!1830)))))

(declare-fun res!199546 () Bool)

(declare-fun e!164915 () Bool)

(assert (=> start!50934 (=> (not res!199546) (not e!164915))))

(assert (=> start!50934 (= res!199546 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50934 e!164915))

(assert (=> start!50934 true))

(declare-fun inv!12 (BitStream!10160) Bool)

(assert (=> start!50934 (and (inv!12 thiss!1830) e!164916)))

(declare-fun b!238723 () Bool)

(declare-fun e!164917 () Bool)

(assert (=> b!238723 (= e!164918 e!164917)))

(declare-fun res!199550 () Bool)

(assert (=> b!238723 (=> (not res!199550) (not e!164917))))

(declare-fun lt!373405 () (_ BitVec 64))

(assert (=> b!238723 (= res!199550 (and (= (bvand acc!170 lt!373405) acc!170) (not (= nBits!581 i!752))))))

(assert (=> b!238723 (= lt!373405 (onesLSBLong!0 nBits!581))))

(declare-fun b!238724 () Bool)

(assert (=> b!238724 (= e!164915 e!164918)))

(declare-fun res!199549 () Bool)

(assert (=> b!238724 (=> (not res!199549) (not e!164918))))

(declare-fun lt!373407 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238724 (= res!199549 (validate_offset_bits!1 ((_ sign_extend 32) (size!5598 (buf!6073 thiss!1830))) ((_ sign_extend 32) (currentByte!11259 thiss!1830)) ((_ sign_extend 32) (currentBit!11254 thiss!1830)) lt!373407))))

(assert (=> b!238724 (= lt!373407 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-datatypes ((tuple2!20186 0))(
  ( (tuple2!20187 (_1!10997 (_ BitVec 64)) (_2!10997 BitStream!10160)) )
))
(declare-fun lt!373406 () tuple2!20186)

(declare-fun e!164913 () Bool)

(declare-fun b!238725 () Bool)

(assert (=> b!238725 (= e!164913 (and (= (bvlshr (_1!10997 lt!373406) lt!373407) (bvlshr acc!170 lt!373407)) (= (bvand (_1!10997 lt!373406) lt!373405) (_1!10997 lt!373406)) (bvslt i!752 nBits!581) (let ((bdg!14583 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752)))) (or (bvslt bdg!14583 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!14583 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun b!238726 () Bool)

(assert (=> b!238726 (= e!164917 e!164913)))

(declare-fun res!199551 () Bool)

(assert (=> b!238726 (=> (not res!199551) (not e!164913))))

(assert (=> b!238726 (= res!199551 (= (buf!6073 (_2!10997 lt!373406)) (buf!6073 thiss!1830)))))

(declare-datatypes ((tuple2!20188 0))(
  ( (tuple2!20189 (_1!10998 Bool) (_2!10998 BitStream!10160)) )
))
(declare-fun lt!373404 () tuple2!20188)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20186)

(assert (=> b!238726 (= lt!373406 (readNLeastSignificantBitsLoop!0 (_2!10998 lt!373404) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10998 lt!373404) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10160) tuple2!20188)

(assert (=> b!238726 (= lt!373404 (readBit!0 thiss!1830))))

(declare-fun b!238727 () Bool)

(declare-fun res!199548 () Bool)

(assert (=> b!238727 (=> (not res!199548) (not e!164913))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238727 (= res!199548 (= (bitIndex!0 (size!5598 (buf!6073 (_2!10997 lt!373406))) (currentByte!11259 (_2!10997 lt!373406)) (currentBit!11254 (_2!10997 lt!373406))) (bvadd (bitIndex!0 (size!5598 (buf!6073 thiss!1830)) (currentByte!11259 thiss!1830) (currentBit!11254 thiss!1830)) lt!373407)))))

(assert (= (and start!50934 res!199546) b!238724))

(assert (= (and b!238724 res!199549) b!238721))

(assert (= (and b!238721 res!199547) b!238723))

(assert (= (and b!238723 res!199550) b!238726))

(assert (= (and b!238726 res!199551) b!238727))

(assert (= (and b!238727 res!199548) b!238725))

(assert (= start!50934 b!238722))

(declare-fun m!360807 () Bool)

(assert (=> b!238726 m!360807))

(declare-fun m!360809 () Bool)

(assert (=> b!238726 m!360809))

(declare-fun m!360811 () Bool)

(assert (=> b!238722 m!360811))

(declare-fun m!360813 () Bool)

(assert (=> b!238724 m!360813))

(declare-fun m!360815 () Bool)

(assert (=> b!238727 m!360815))

(declare-fun m!360817 () Bool)

(assert (=> b!238727 m!360817))

(declare-fun m!360819 () Bool)

(assert (=> start!50934 m!360819))

(declare-fun m!360821 () Bool)

(assert (=> b!238723 m!360821))

(declare-fun m!360823 () Bool)

(assert (=> b!238721 m!360823))

(push 1)

(assert (not b!238727))

(assert (not b!238723))

(assert (not start!50934))

(assert (not b!238721))

(assert (not b!238726))

(assert (not b!238724))

(assert (not b!238722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

