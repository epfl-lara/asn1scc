; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50908 () Bool)

(assert start!50908)

(declare-fun b!238436 () Bool)

(declare-fun res!199305 () Bool)

(declare-fun e!164693 () Bool)

(assert (=> b!238436 (=> (not res!199305) (not e!164693))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238436 (= res!199305 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238437 () Bool)

(declare-fun e!164695 () Bool)

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238437 (= e!164695 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!238438 () Bool)

(declare-fun res!199304 () Bool)

(assert (=> b!238438 (=> (not res!199304) (not e!164693))))

(assert (=> b!238438 (= res!199304 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238439 () Bool)

(declare-fun res!199300 () Bool)

(assert (=> b!238439 (=> (not res!199300) (not e!164695))))

(declare-datatypes ((array!12714 0))(
  ( (array!12715 (arr!6572 (Array (_ BitVec 32) (_ BitVec 8))) (size!5585 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10134 0))(
  ( (BitStream!10135 (buf!6060 array!12714) (currentByte!11246 (_ BitVec 32)) (currentBit!11241 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10134)

(declare-datatypes ((tuple2!20134 0))(
  ( (tuple2!20135 (_1!10971 (_ BitVec 64)) (_2!10971 BitStream!10134)) )
))
(declare-fun lt!373261 () tuple2!20134)

(declare-fun lt!373262 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238439 (= res!199300 (= (bitIndex!0 (size!5585 (buf!6060 (_2!10971 lt!373261))) (currentByte!11246 (_2!10971 lt!373261)) (currentBit!11241 (_2!10971 lt!373261))) (bvadd (bitIndex!0 (size!5585 (buf!6060 thiss!1830)) (currentByte!11246 thiss!1830) (currentBit!11241 thiss!1830)) lt!373262)))))

(declare-fun b!238440 () Bool)

(declare-fun e!164694 () Bool)

(declare-fun array_inv!5326 (array!12714) Bool)

(assert (=> b!238440 (= e!164694 (array_inv!5326 (buf!6060 thiss!1830)))))

(declare-fun b!238441 () Bool)

(declare-fun e!164692 () Bool)

(assert (=> b!238441 (= e!164692 e!164693)))

(declare-fun res!199301 () Bool)

(assert (=> b!238441 (=> (not res!199301) (not e!164693))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238441 (= res!199301 (validate_offset_bits!1 ((_ sign_extend 32) (size!5585 (buf!6060 thiss!1830))) ((_ sign_extend 32) (currentByte!11246 thiss!1830)) ((_ sign_extend 32) (currentBit!11241 thiss!1830)) lt!373262))))

(assert (=> b!238441 (= lt!373262 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238442 () Bool)

(assert (=> b!238442 (= e!164693 e!164695)))

(declare-fun res!199299 () Bool)

(assert (=> b!238442 (=> (not res!199299) (not e!164695))))

(assert (=> b!238442 (= res!199299 (= (buf!6060 (_2!10971 lt!373261)) (buf!6060 thiss!1830)))))

(declare-datatypes ((tuple2!20136 0))(
  ( (tuple2!20137 (_1!10972 Bool) (_2!10972 BitStream!10134)) )
))
(declare-fun lt!373263 () tuple2!20136)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20134)

(assert (=> b!238442 (= lt!373261 (readNLeastSignificantBitsLoop!0 (_2!10972 lt!373263) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10972 lt!373263) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10134) tuple2!20136)

(assert (=> b!238442 (= lt!373263 (readBit!0 thiss!1830))))

(declare-fun res!199303 () Bool)

(assert (=> start!50908 (=> (not res!199303) (not e!164692))))

(assert (=> start!50908 (= res!199303 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50908 e!164692))

(assert (=> start!50908 true))

(declare-fun inv!12 (BitStream!10134) Bool)

(assert (=> start!50908 (and (inv!12 thiss!1830) e!164694)))

(declare-fun b!238435 () Bool)

(declare-fun res!199302 () Bool)

(assert (=> b!238435 (=> (not res!199302) (not e!164693))))

(assert (=> b!238435 (= res!199302 (not (= nBits!581 i!752)))))

(assert (= (and start!50908 res!199303) b!238441))

(assert (= (and b!238441 res!199301) b!238438))

(assert (= (and b!238438 res!199304) b!238436))

(assert (= (and b!238436 res!199305) b!238435))

(assert (= (and b!238435 res!199302) b!238442))

(assert (= (and b!238442 res!199299) b!238439))

(assert (= (and b!238439 res!199300) b!238437))

(assert (= start!50908 b!238440))

(declare-fun m!360573 () Bool)

(assert (=> b!238439 m!360573))

(declare-fun m!360575 () Bool)

(assert (=> b!238439 m!360575))

(declare-fun m!360577 () Bool)

(assert (=> start!50908 m!360577))

(declare-fun m!360579 () Bool)

(assert (=> b!238442 m!360579))

(declare-fun m!360581 () Bool)

(assert (=> b!238442 m!360581))

(declare-fun m!360583 () Bool)

(assert (=> b!238438 m!360583))

(declare-fun m!360585 () Bool)

(assert (=> b!238441 m!360585))

(declare-fun m!360587 () Bool)

(assert (=> b!238436 m!360587))

(declare-fun m!360589 () Bool)

(assert (=> b!238440 m!360589))

(check-sat (not b!238438) (not b!238440) (not b!238442) (not b!238441) (not b!238439) (not b!238436) (not start!50908))
(check-sat)
