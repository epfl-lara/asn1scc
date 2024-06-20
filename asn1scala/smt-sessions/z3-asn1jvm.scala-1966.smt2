; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50920 () Bool)

(assert start!50920)

(declare-fun b!238574 () Bool)

(declare-fun e!164789 () Bool)

(declare-fun e!164790 () Bool)

(assert (=> b!238574 (= e!164789 e!164790)))

(declare-fun res!199420 () Bool)

(assert (=> b!238574 (=> (not res!199420) (not e!164790))))

(declare-datatypes ((array!12726 0))(
  ( (array!12727 (arr!6578 (Array (_ BitVec 32) (_ BitVec 8))) (size!5591 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10146 0))(
  ( (BitStream!10147 (buf!6066 array!12726) (currentByte!11252 (_ BitVec 32)) (currentBit!11247 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10146)

(declare-fun lt!373323 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238574 (= res!199420 (validate_offset_bits!1 ((_ sign_extend 32) (size!5591 (buf!6066 thiss!1830))) ((_ sign_extend 32) (currentByte!11252 thiss!1830)) ((_ sign_extend 32) (currentBit!11247 thiss!1830)) lt!373323))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238574 (= lt!373323 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238576 () Bool)

(declare-fun e!164792 () Bool)

(declare-fun array_inv!5332 (array!12726) Bool)

(assert (=> b!238576 (= e!164792 (array_inv!5332 (buf!6066 thiss!1830)))))

(declare-fun b!238577 () Bool)

(declare-fun res!199421 () Bool)

(assert (=> b!238577 (=> (not res!199421) (not e!164790))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238577 (= res!199421 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!373322 () (_ BitVec 64))

(declare-fun e!164787 () Bool)

(declare-datatypes ((tuple2!20158 0))(
  ( (tuple2!20159 (_1!10983 (_ BitVec 64)) (_2!10983 BitStream!10146)) )
))
(declare-fun lt!373320 () tuple2!20158)

(declare-fun b!238578 () Bool)

(assert (=> b!238578 (= e!164787 (and (= (bvlshr (_1!10983 lt!373320) lt!373323) (bvlshr acc!170 lt!373323)) (= (bvand (_1!10983 lt!373320) lt!373322) (_1!10983 lt!373320)) (bvslt i!752 nBits!581) (not (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun res!199423 () Bool)

(assert (=> start!50920 (=> (not res!199423) (not e!164789))))

(assert (=> start!50920 (= res!199423 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50920 e!164789))

(assert (=> start!50920 true))

(declare-fun inv!12 (BitStream!10146) Bool)

(assert (=> start!50920 (and (inv!12 thiss!1830) e!164792)))

(declare-fun b!238575 () Bool)

(declare-fun e!164791 () Bool)

(assert (=> b!238575 (= e!164791 e!164787)))

(declare-fun res!199425 () Bool)

(assert (=> b!238575 (=> (not res!199425) (not e!164787))))

(assert (=> b!238575 (= res!199425 (= (buf!6066 (_2!10983 lt!373320)) (buf!6066 thiss!1830)))))

(declare-datatypes ((tuple2!20160 0))(
  ( (tuple2!20161 (_1!10984 Bool) (_2!10984 BitStream!10146)) )
))
(declare-fun lt!373321 () tuple2!20160)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20158)

(assert (=> b!238575 (= lt!373320 (readNLeastSignificantBitsLoop!0 (_2!10984 lt!373321) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10984 lt!373321) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10146) tuple2!20160)

(assert (=> b!238575 (= lt!373321 (readBit!0 thiss!1830))))

(declare-fun b!238579 () Bool)

(declare-fun res!199422 () Bool)

(assert (=> b!238579 (=> (not res!199422) (not e!164787))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238579 (= res!199422 (= (bitIndex!0 (size!5591 (buf!6066 (_2!10983 lt!373320))) (currentByte!11252 (_2!10983 lt!373320)) (currentBit!11247 (_2!10983 lt!373320))) (bvadd (bitIndex!0 (size!5591 (buf!6066 thiss!1830)) (currentByte!11252 thiss!1830) (currentBit!11247 thiss!1830)) lt!373323)))))

(declare-fun b!238580 () Bool)

(assert (=> b!238580 (= e!164790 e!164791)))

(declare-fun res!199424 () Bool)

(assert (=> b!238580 (=> (not res!199424) (not e!164791))))

(assert (=> b!238580 (= res!199424 (and (= (bvand acc!170 lt!373322) acc!170) (not (= nBits!581 i!752))))))

(assert (=> b!238580 (= lt!373322 (onesLSBLong!0 nBits!581))))

(assert (= (and start!50920 res!199423) b!238574))

(assert (= (and b!238574 res!199420) b!238577))

(assert (= (and b!238577 res!199421) b!238580))

(assert (= (and b!238580 res!199424) b!238575))

(assert (= (and b!238575 res!199425) b!238579))

(assert (= (and b!238579 res!199422) b!238578))

(assert (= start!50920 b!238576))

(declare-fun m!360681 () Bool)

(assert (=> b!238574 m!360681))

(declare-fun m!360683 () Bool)

(assert (=> b!238579 m!360683))

(declare-fun m!360685 () Bool)

(assert (=> b!238579 m!360685))

(declare-fun m!360687 () Bool)

(assert (=> b!238575 m!360687))

(declare-fun m!360689 () Bool)

(assert (=> b!238575 m!360689))

(declare-fun m!360691 () Bool)

(assert (=> b!238577 m!360691))

(declare-fun m!360693 () Bool)

(assert (=> b!238576 m!360693))

(declare-fun m!360695 () Bool)

(assert (=> start!50920 m!360695))

(declare-fun m!360697 () Bool)

(assert (=> b!238580 m!360697))

(check-sat (not b!238574) (not b!238579) (not start!50920) (not b!238577) (not b!238576) (not b!238575) (not b!238580))
(check-sat)
