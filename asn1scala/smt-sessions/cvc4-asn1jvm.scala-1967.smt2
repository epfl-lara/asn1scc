; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50928 () Bool)

(assert start!50928)

(declare-fun b!238658 () Bool)

(declare-fun e!164860 () Bool)

(declare-datatypes ((array!12734 0))(
  ( (array!12735 (arr!6582 (Array (_ BitVec 32) (_ BitVec 8))) (size!5595 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10154 0))(
  ( (BitStream!10155 (buf!6070 array!12734) (currentByte!11256 (_ BitVec 32)) (currentBit!11251 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10154)

(declare-fun array_inv!5336 (array!12734) Bool)

(assert (=> b!238658 (= e!164860 (array_inv!5336 (buf!6070 thiss!1830)))))

(declare-fun b!238659 () Bool)

(declare-fun e!164864 () Bool)

(declare-fun e!164862 () Bool)

(assert (=> b!238659 (= e!164864 e!164862)))

(declare-fun res!199495 () Bool)

(assert (=> b!238659 (=> (not res!199495) (not e!164862))))

(declare-fun lt!373371 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238659 (= res!199495 (validate_offset_bits!1 ((_ sign_extend 32) (size!5595 (buf!6070 thiss!1830))) ((_ sign_extend 32) (currentByte!11256 thiss!1830)) ((_ sign_extend 32) (currentBit!11251 thiss!1830)) lt!373371))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238659 (= lt!373371 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238660 () Bool)

(declare-fun e!164863 () Bool)

(declare-fun e!164859 () Bool)

(assert (=> b!238660 (= e!164863 e!164859)))

(declare-fun res!199497 () Bool)

(assert (=> b!238660 (=> (not res!199497) (not e!164859))))

(declare-datatypes ((tuple2!20174 0))(
  ( (tuple2!20175 (_1!10991 (_ BitVec 64)) (_2!10991 BitStream!10154)) )
))
(declare-fun lt!373369 () tuple2!20174)

(assert (=> b!238660 (= res!199497 (= (buf!6070 (_2!10991 lt!373369)) (buf!6070 thiss!1830)))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!20176 0))(
  ( (tuple2!20177 (_1!10992 Bool) (_2!10992 BitStream!10154)) )
))
(declare-fun lt!373368 () tuple2!20176)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20174)

(assert (=> b!238660 (= lt!373369 (readNLeastSignificantBitsLoop!0 (_2!10992 lt!373368) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10992 lt!373368) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10154) tuple2!20176)

(assert (=> b!238660 (= lt!373368 (readBit!0 thiss!1830))))

(declare-fun b!238661 () Bool)

(assert (=> b!238661 (= e!164862 e!164863)))

(declare-fun res!199496 () Bool)

(assert (=> b!238661 (=> (not res!199496) (not e!164863))))

(declare-fun lt!373370 () (_ BitVec 64))

(assert (=> b!238661 (= res!199496 (and (= (bvand acc!170 lt!373370) acc!170) (not (= nBits!581 i!752))))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238661 (= lt!373370 (onesLSBLong!0 nBits!581))))

(declare-fun b!238662 () Bool)

(assert (=> b!238662 (= e!164859 (and (= (bvlshr (_1!10991 lt!373369) lt!373371) (bvlshr acc!170 lt!373371)) (= (bvand (_1!10991 lt!373369) lt!373370) (_1!10991 lt!373369)) (bvslt i!752 nBits!581) (let ((bdg!14577 (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (and (not (= bdg!14577 (bvand i!752 #b10000000000000000000000000000000))) (not (= bdg!14577 (bvand (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752) #b10000000000000000000000000000000)))))))))

(declare-fun res!199492 () Bool)

(assert (=> start!50928 (=> (not res!199492) (not e!164864))))

(assert (=> start!50928 (= res!199492 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50928 e!164864))

(assert (=> start!50928 true))

(declare-fun inv!12 (BitStream!10154) Bool)

(assert (=> start!50928 (and (inv!12 thiss!1830) e!164860)))

(declare-fun b!238663 () Bool)

(declare-fun res!199494 () Bool)

(assert (=> b!238663 (=> (not res!199494) (not e!164862))))

(assert (=> b!238663 (= res!199494 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238664 () Bool)

(declare-fun res!199493 () Bool)

(assert (=> b!238664 (=> (not res!199493) (not e!164859))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238664 (= res!199493 (= (bitIndex!0 (size!5595 (buf!6070 (_2!10991 lt!373369))) (currentByte!11256 (_2!10991 lt!373369)) (currentBit!11251 (_2!10991 lt!373369))) (bvadd (bitIndex!0 (size!5595 (buf!6070 thiss!1830)) (currentByte!11256 thiss!1830) (currentBit!11251 thiss!1830)) lt!373371)))))

(assert (= (and start!50928 res!199492) b!238659))

(assert (= (and b!238659 res!199495) b!238663))

(assert (= (and b!238663 res!199494) b!238661))

(assert (= (and b!238661 res!199496) b!238660))

(assert (= (and b!238660 res!199497) b!238664))

(assert (= (and b!238664 res!199493) b!238662))

(assert (= start!50928 b!238658))

(declare-fun m!360753 () Bool)

(assert (=> b!238663 m!360753))

(declare-fun m!360755 () Bool)

(assert (=> start!50928 m!360755))

(declare-fun m!360757 () Bool)

(assert (=> b!238659 m!360757))

(declare-fun m!360759 () Bool)

(assert (=> b!238664 m!360759))

(declare-fun m!360761 () Bool)

(assert (=> b!238664 m!360761))

(declare-fun m!360763 () Bool)

(assert (=> b!238661 m!360763))

(declare-fun m!360765 () Bool)

(assert (=> b!238658 m!360765))

(declare-fun m!360767 () Bool)

(assert (=> b!238660 m!360767))

(declare-fun m!360769 () Bool)

(assert (=> b!238660 m!360769))

(push 1)

(assert (not b!238659))

(assert (not b!238663))

(assert (not b!238664))

(assert (not b!238661))

(assert (not b!238660))

(assert (not b!238658))

(assert (not start!50928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

