; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50924 () Bool)

(assert start!50924)

(declare-fun b!238616 () Bool)

(declare-fun e!164823 () Bool)

(declare-fun e!164827 () Bool)

(assert (=> b!238616 (= e!164823 e!164827)))

(declare-fun res!199459 () Bool)

(assert (=> b!238616 (=> (not res!199459) (not e!164827))))

(declare-datatypes ((array!12730 0))(
  ( (array!12731 (arr!6580 (Array (_ BitVec 32) (_ BitVec 8))) (size!5593 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10150 0))(
  ( (BitStream!10151 (buf!6068 array!12730) (currentByte!11254 (_ BitVec 32)) (currentBit!11249 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20166 0))(
  ( (tuple2!20167 (_1!10987 (_ BitVec 64)) (_2!10987 BitStream!10150)) )
))
(declare-fun lt!373345 () tuple2!20166)

(declare-fun thiss!1830 () BitStream!10150)

(assert (=> b!238616 (= res!199459 (= (buf!6068 (_2!10987 lt!373345)) (buf!6068 thiss!1830)))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!20168 0))(
  ( (tuple2!20169 (_1!10988 Bool) (_2!10988 BitStream!10150)) )
))
(declare-fun lt!373346 () tuple2!20168)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20166)

(assert (=> b!238616 (= lt!373345 (readNLeastSignificantBitsLoop!0 (_2!10988 lt!373346) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10988 lt!373346) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10150) tuple2!20168)

(assert (=> b!238616 (= lt!373346 (readBit!0 thiss!1830))))

(declare-fun b!238617 () Bool)

(declare-fun e!164825 () Bool)

(declare-fun array_inv!5334 (array!12730) Bool)

(assert (=> b!238617 (= e!164825 (array_inv!5334 (buf!6068 thiss!1830)))))

(declare-fun b!238618 () Bool)

(declare-fun e!164826 () Bool)

(declare-fun e!164828 () Bool)

(assert (=> b!238618 (= e!164826 e!164828)))

(declare-fun res!199460 () Bool)

(assert (=> b!238618 (=> (not res!199460) (not e!164828))))

(declare-fun lt!373347 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238618 (= res!199460 (validate_offset_bits!1 ((_ sign_extend 32) (size!5593 (buf!6068 thiss!1830))) ((_ sign_extend 32) (currentByte!11254 thiss!1830)) ((_ sign_extend 32) (currentBit!11249 thiss!1830)) lt!373347))))

(assert (=> b!238618 (= lt!373347 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238619 () Bool)

(declare-fun res!199458 () Bool)

(assert (=> b!238619 (=> (not res!199458) (not e!164827))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238619 (= res!199458 (= (bitIndex!0 (size!5593 (buf!6068 (_2!10987 lt!373345))) (currentByte!11254 (_2!10987 lt!373345)) (currentBit!11249 (_2!10987 lt!373345))) (bvadd (bitIndex!0 (size!5593 (buf!6068 thiss!1830)) (currentByte!11254 thiss!1830) (currentBit!11249 thiss!1830)) lt!373347)))))

(declare-fun b!238620 () Bool)

(declare-fun res!199461 () Bool)

(assert (=> b!238620 (=> (not res!199461) (not e!164828))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238620 (= res!199461 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!373344 () (_ BitVec 64))

(declare-fun b!238621 () Bool)

(assert (=> b!238621 (= e!164827 (and (= (bvlshr (_1!10987 lt!373345) lt!373347) (bvlshr acc!170 lt!373347)) (= (bvand (_1!10987 lt!373345) lt!373344) (_1!10987 lt!373345)) (bvslt i!752 nBits!581) (let ((bdg!14577 (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (and (not (= bdg!14577 (bvand i!752 #b10000000000000000000000000000000))) (not (= bdg!14577 (bvand (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752) #b10000000000000000000000000000000)))))))))

(declare-fun b!238622 () Bool)

(assert (=> b!238622 (= e!164828 e!164823)))

(declare-fun res!199457 () Bool)

(assert (=> b!238622 (=> (not res!199457) (not e!164823))))

(assert (=> b!238622 (= res!199457 (and (= (bvand acc!170 lt!373344) acc!170) (not (= nBits!581 i!752))))))

(assert (=> b!238622 (= lt!373344 (onesLSBLong!0 nBits!581))))

(declare-fun res!199456 () Bool)

(assert (=> start!50924 (=> (not res!199456) (not e!164826))))

(assert (=> start!50924 (= res!199456 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50924 e!164826))

(assert (=> start!50924 true))

(declare-fun inv!12 (BitStream!10150) Bool)

(assert (=> start!50924 (and (inv!12 thiss!1830) e!164825)))

(assert (= (and start!50924 res!199456) b!238618))

(assert (= (and b!238618 res!199460) b!238620))

(assert (= (and b!238620 res!199461) b!238622))

(assert (= (and b!238622 res!199457) b!238616))

(assert (= (and b!238616 res!199459) b!238619))

(assert (= (and b!238619 res!199458) b!238621))

(assert (= start!50924 b!238617))

(declare-fun m!360717 () Bool)

(assert (=> b!238617 m!360717))

(declare-fun m!360719 () Bool)

(assert (=> start!50924 m!360719))

(declare-fun m!360721 () Bool)

(assert (=> b!238620 m!360721))

(declare-fun m!360723 () Bool)

(assert (=> b!238616 m!360723))

(declare-fun m!360725 () Bool)

(assert (=> b!238616 m!360725))

(declare-fun m!360727 () Bool)

(assert (=> b!238618 m!360727))

(declare-fun m!360729 () Bool)

(assert (=> b!238622 m!360729))

(declare-fun m!360731 () Bool)

(assert (=> b!238619 m!360731))

(declare-fun m!360733 () Bool)

(assert (=> b!238619 m!360733))

(push 1)

(assert (not b!238616))

(assert (not b!238622))

(assert (not start!50924))

(assert (not b!238617))

(assert (not b!238619))

(assert (not b!238618))

(assert (not b!238620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

