; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50910 () Bool)

(assert start!50910)

(declare-fun b!238459 () Bool)

(declare-fun res!199320 () Bool)

(declare-fun e!164710 () Bool)

(assert (=> b!238459 (=> (not res!199320) (not e!164710))))

(declare-datatypes ((array!12716 0))(
  ( (array!12717 (arr!6573 (Array (_ BitVec 32) (_ BitVec 8))) (size!5586 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10136 0))(
  ( (BitStream!10137 (buf!6061 array!12716) (currentByte!11247 (_ BitVec 32)) (currentBit!11242 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10136)

(declare-fun lt!373271 () (_ BitVec 64))

(declare-datatypes ((tuple2!20138 0))(
  ( (tuple2!20139 (_1!10973 (_ BitVec 64)) (_2!10973 BitStream!10136)) )
))
(declare-fun lt!373272 () tuple2!20138)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238459 (= res!199320 (= (bitIndex!0 (size!5586 (buf!6061 (_2!10973 lt!373272))) (currentByte!11247 (_2!10973 lt!373272)) (currentBit!11242 (_2!10973 lt!373272))) (bvadd (bitIndex!0 (size!5586 (buf!6061 thiss!1830)) (currentByte!11247 thiss!1830) (currentBit!11242 thiss!1830)) lt!373271)))))

(declare-fun b!238460 () Bool)

(declare-fun res!199324 () Bool)

(declare-fun e!164708 () Bool)

(assert (=> b!238460 (=> (not res!199324) (not e!164708))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238460 (= res!199324 (not (= nBits!581 i!752)))))

(declare-fun b!238462 () Bool)

(declare-fun res!199325 () Bool)

(assert (=> b!238462 (=> (not res!199325) (not e!164708))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238462 (= res!199325 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238463 () Bool)

(declare-fun e!164711 () Bool)

(assert (=> b!238463 (= e!164711 e!164708)))

(declare-fun res!199323 () Bool)

(assert (=> b!238463 (=> (not res!199323) (not e!164708))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238463 (= res!199323 (validate_offset_bits!1 ((_ sign_extend 32) (size!5586 (buf!6061 thiss!1830))) ((_ sign_extend 32) (currentByte!11247 thiss!1830)) ((_ sign_extend 32) (currentBit!11242 thiss!1830)) lt!373271))))

(assert (=> b!238463 (= lt!373271 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238464 () Bool)

(declare-fun e!164707 () Bool)

(declare-fun array_inv!5327 (array!12716) Bool)

(assert (=> b!238464 (= e!164707 (array_inv!5327 (buf!6061 thiss!1830)))))

(declare-fun b!238465 () Bool)

(assert (=> b!238465 (= e!164710 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!238466 () Bool)

(assert (=> b!238466 (= e!164708 e!164710)))

(declare-fun res!199326 () Bool)

(assert (=> b!238466 (=> (not res!199326) (not e!164710))))

(assert (=> b!238466 (= res!199326 (= (buf!6061 (_2!10973 lt!373272)) (buf!6061 thiss!1830)))))

(declare-datatypes ((tuple2!20140 0))(
  ( (tuple2!20141 (_1!10974 Bool) (_2!10974 BitStream!10136)) )
))
(declare-fun lt!373270 () tuple2!20140)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20138)

(assert (=> b!238466 (= lt!373272 (readNLeastSignificantBitsLoop!0 (_2!10974 lt!373270) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10974 lt!373270) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10136) tuple2!20140)

(assert (=> b!238466 (= lt!373270 (readBit!0 thiss!1830))))

(declare-fun b!238461 () Bool)

(declare-fun res!199322 () Bool)

(assert (=> b!238461 (=> (not res!199322) (not e!164708))))

(assert (=> b!238461 (= res!199322 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!199321 () Bool)

(assert (=> start!50910 (=> (not res!199321) (not e!164711))))

(assert (=> start!50910 (= res!199321 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50910 e!164711))

(assert (=> start!50910 true))

(declare-fun inv!12 (BitStream!10136) Bool)

(assert (=> start!50910 (and (inv!12 thiss!1830) e!164707)))

(assert (= (and start!50910 res!199321) b!238463))

(assert (= (and b!238463 res!199323) b!238461))

(assert (= (and b!238461 res!199322) b!238462))

(assert (= (and b!238462 res!199325) b!238460))

(assert (= (and b!238460 res!199324) b!238466))

(assert (= (and b!238466 res!199326) b!238459))

(assert (= (and b!238459 res!199320) b!238465))

(assert (= start!50910 b!238464))

(declare-fun m!360591 () Bool)

(assert (=> b!238459 m!360591))

(declare-fun m!360593 () Bool)

(assert (=> b!238459 m!360593))

(declare-fun m!360595 () Bool)

(assert (=> start!50910 m!360595))

(declare-fun m!360597 () Bool)

(assert (=> b!238464 m!360597))

(declare-fun m!360599 () Bool)

(assert (=> b!238462 m!360599))

(declare-fun m!360601 () Bool)

(assert (=> b!238466 m!360601))

(declare-fun m!360603 () Bool)

(assert (=> b!238466 m!360603))

(declare-fun m!360605 () Bool)

(assert (=> b!238461 m!360605))

(declare-fun m!360607 () Bool)

(assert (=> b!238463 m!360607))

(push 1)

(assert (not b!238466))

(assert (not b!238459))

(assert (not b!238462))

(assert (not b!238461))

(assert (not b!238463))

(assert (not start!50910))

(assert (not b!238464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

