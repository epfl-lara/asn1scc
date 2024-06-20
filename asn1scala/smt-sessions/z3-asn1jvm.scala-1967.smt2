; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50926 () Bool)

(assert start!50926)

(declare-fun b!238637 () Bool)

(declare-fun e!164845 () Bool)

(declare-fun e!164843 () Bool)

(assert (=> b!238637 (= e!164845 e!164843)))

(declare-fun res!199476 () Bool)

(assert (=> b!238637 (=> (not res!199476) (not e!164843))))

(declare-datatypes ((array!12732 0))(
  ( (array!12733 (arr!6581 (Array (_ BitVec 32) (_ BitVec 8))) (size!5594 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10152 0))(
  ( (BitStream!10153 (buf!6069 array!12732) (currentByte!11255 (_ BitVec 32)) (currentBit!11250 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10152)

(declare-fun lt!373357 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238637 (= res!199476 (validate_offset_bits!1 ((_ sign_extend 32) (size!5594 (buf!6069 thiss!1830))) ((_ sign_extend 32) (currentByte!11255 thiss!1830)) ((_ sign_extend 32) (currentBit!11250 thiss!1830)) lt!373357))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238637 (= lt!373357 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun e!164844 () Bool)

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!20170 0))(
  ( (tuple2!20171 (_1!10989 (_ BitVec 64)) (_2!10989 BitStream!10152)) )
))
(declare-fun lt!373358 () tuple2!20170)

(declare-fun b!238638 () Bool)

(declare-fun lt!373359 () (_ BitVec 64))

(assert (=> b!238638 (= e!164844 (and (= (bvlshr (_1!10989 lt!373358) lt!373357) (bvlshr acc!170 lt!373357)) (= (bvand (_1!10989 lt!373358) lt!373359) (_1!10989 lt!373358)) (bvslt i!752 nBits!581) (let ((bdg!14577 (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (and (not (= bdg!14577 (bvand i!752 #b10000000000000000000000000000000))) (not (= bdg!14577 (bvand (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752) #b10000000000000000000000000000000)))))))))

(declare-fun b!238639 () Bool)

(declare-fun e!164846 () Bool)

(assert (=> b!238639 (= e!164846 e!164844)))

(declare-fun res!199478 () Bool)

(assert (=> b!238639 (=> (not res!199478) (not e!164844))))

(assert (=> b!238639 (= res!199478 (= (buf!6069 (_2!10989 lt!373358)) (buf!6069 thiss!1830)))))

(declare-datatypes ((tuple2!20172 0))(
  ( (tuple2!20173 (_1!10990 Bool) (_2!10990 BitStream!10152)) )
))
(declare-fun lt!373356 () tuple2!20172)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20170)

(assert (=> b!238639 (= lt!373358 (readNLeastSignificantBitsLoop!0 (_2!10990 lt!373356) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10990 lt!373356) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10152) tuple2!20172)

(assert (=> b!238639 (= lt!373356 (readBit!0 thiss!1830))))

(declare-fun b!238640 () Bool)

(declare-fun res!199475 () Bool)

(assert (=> b!238640 (=> (not res!199475) (not e!164844))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238640 (= res!199475 (= (bitIndex!0 (size!5594 (buf!6069 (_2!10989 lt!373358))) (currentByte!11255 (_2!10989 lt!373358)) (currentBit!11250 (_2!10989 lt!373358))) (bvadd (bitIndex!0 (size!5594 (buf!6069 thiss!1830)) (currentByte!11255 thiss!1830) (currentBit!11250 thiss!1830)) lt!373357)))))

(declare-fun res!199477 () Bool)

(assert (=> start!50926 (=> (not res!199477) (not e!164845))))

(assert (=> start!50926 (= res!199477 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50926 e!164845))

(assert (=> start!50926 true))

(declare-fun e!164841 () Bool)

(declare-fun inv!12 (BitStream!10152) Bool)

(assert (=> start!50926 (and (inv!12 thiss!1830) e!164841)))

(declare-fun b!238641 () Bool)

(declare-fun res!199479 () Bool)

(assert (=> b!238641 (=> (not res!199479) (not e!164843))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238641 (= res!199479 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238642 () Bool)

(declare-fun array_inv!5335 (array!12732) Bool)

(assert (=> b!238642 (= e!164841 (array_inv!5335 (buf!6069 thiss!1830)))))

(declare-fun b!238643 () Bool)

(assert (=> b!238643 (= e!164843 e!164846)))

(declare-fun res!199474 () Bool)

(assert (=> b!238643 (=> (not res!199474) (not e!164846))))

(assert (=> b!238643 (= res!199474 (and (= (bvand acc!170 lt!373359) acc!170) (not (= nBits!581 i!752))))))

(assert (=> b!238643 (= lt!373359 (onesLSBLong!0 nBits!581))))

(assert (= (and start!50926 res!199477) b!238637))

(assert (= (and b!238637 res!199476) b!238641))

(assert (= (and b!238641 res!199479) b!238643))

(assert (= (and b!238643 res!199474) b!238639))

(assert (= (and b!238639 res!199478) b!238640))

(assert (= (and b!238640 res!199475) b!238638))

(assert (= start!50926 b!238642))

(declare-fun m!360735 () Bool)

(assert (=> b!238643 m!360735))

(declare-fun m!360737 () Bool)

(assert (=> b!238640 m!360737))

(declare-fun m!360739 () Bool)

(assert (=> b!238640 m!360739))

(declare-fun m!360741 () Bool)

(assert (=> b!238641 m!360741))

(declare-fun m!360743 () Bool)

(assert (=> b!238642 m!360743))

(declare-fun m!360745 () Bool)

(assert (=> b!238639 m!360745))

(declare-fun m!360747 () Bool)

(assert (=> b!238639 m!360747))

(declare-fun m!360749 () Bool)

(assert (=> start!50926 m!360749))

(declare-fun m!360751 () Bool)

(assert (=> b!238637 m!360751))

(check-sat (not b!238641) (not start!50926) (not b!238642) (not b!238639) (not b!238640) (not b!238637) (not b!238643))
(check-sat)
