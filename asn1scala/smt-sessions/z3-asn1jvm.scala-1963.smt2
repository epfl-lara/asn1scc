; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50902 () Bool)

(assert start!50902)

(declare-fun res!199237 () Bool)

(declare-fun e!164649 () Bool)

(assert (=> start!50902 (=> (not res!199237) (not e!164649))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50902 (= res!199237 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50902 e!164649))

(assert (=> start!50902 true))

(declare-datatypes ((array!12708 0))(
  ( (array!12709 (arr!6569 (Array (_ BitVec 32) (_ BitVec 8))) (size!5582 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10128 0))(
  ( (BitStream!10129 (buf!6057 array!12708) (currentByte!11243 (_ BitVec 32)) (currentBit!11238 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10128)

(declare-fun e!164648 () Bool)

(declare-fun inv!12 (BitStream!10128) Bool)

(assert (=> start!50902 (and (inv!12 thiss!1830) e!164648)))

(declare-fun b!238363 () Bool)

(declare-fun array_inv!5323 (array!12708) Bool)

(assert (=> b!238363 (= e!164648 (array_inv!5323 (buf!6057 thiss!1830)))))

(declare-fun b!238364 () Bool)

(declare-fun e!164651 () Bool)

(declare-fun e!164650 () Bool)

(assert (=> b!238364 (= e!164651 e!164650)))

(declare-fun res!199236 () Bool)

(assert (=> b!238364 (=> (not res!199236) (not e!164650))))

(declare-datatypes ((tuple2!20122 0))(
  ( (tuple2!20123 (_1!10965 (_ BitVec 64)) (_2!10965 BitStream!10128)) )
))
(declare-fun lt!373235 () tuple2!20122)

(assert (=> b!238364 (= res!199236 (= (buf!6057 (_2!10965 lt!373235)) (buf!6057 thiss!1830)))))

(declare-datatypes ((tuple2!20124 0))(
  ( (tuple2!20125 (_1!10966 Bool) (_2!10966 BitStream!10128)) )
))
(declare-fun lt!373234 () tuple2!20124)

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20122)

(assert (=> b!238364 (= lt!373235 (readNLeastSignificantBitsLoop!0 (_2!10966 lt!373234) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10966 lt!373234) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10128) tuple2!20124)

(assert (=> b!238364 (= lt!373234 (readBit!0 thiss!1830))))

(declare-fun b!238365 () Bool)

(declare-fun res!199238 () Bool)

(assert (=> b!238365 (=> (not res!199238) (not e!164651))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238365 (= res!199238 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238366 () Bool)

(declare-fun res!199239 () Bool)

(assert (=> b!238366 (=> (not res!199239) (not e!164650))))

(declare-fun lt!373236 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238366 (= res!199239 (= (bitIndex!0 (size!5582 (buf!6057 (_2!10965 lt!373235))) (currentByte!11243 (_2!10965 lt!373235)) (currentBit!11238 (_2!10965 lt!373235))) (bvadd (bitIndex!0 (size!5582 (buf!6057 thiss!1830)) (currentByte!11243 thiss!1830) (currentBit!11238 thiss!1830)) lt!373236)))))

(declare-fun b!238367 () Bool)

(declare-fun res!199242 () Bool)

(assert (=> b!238367 (=> (not res!199242) (not e!164651))))

(assert (=> b!238367 (= res!199242 (not (= nBits!581 i!752)))))

(declare-fun b!238368 () Bool)

(declare-fun res!199241 () Bool)

(assert (=> b!238368 (=> (not res!199241) (not e!164651))))

(assert (=> b!238368 (= res!199241 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238369 () Bool)

(assert (=> b!238369 (= e!164650 (or (bvslt lt!373236 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!373236 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun b!238370 () Bool)

(assert (=> b!238370 (= e!164649 e!164651)))

(declare-fun res!199240 () Bool)

(assert (=> b!238370 (=> (not res!199240) (not e!164651))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238370 (= res!199240 (validate_offset_bits!1 ((_ sign_extend 32) (size!5582 (buf!6057 thiss!1830))) ((_ sign_extend 32) (currentByte!11243 thiss!1830)) ((_ sign_extend 32) (currentBit!11238 thiss!1830)) lt!373236))))

(assert (=> b!238370 (= lt!373236 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(assert (= (and start!50902 res!199237) b!238370))

(assert (= (and b!238370 res!199240) b!238368))

(assert (= (and b!238368 res!199241) b!238365))

(assert (= (and b!238365 res!199238) b!238367))

(assert (= (and b!238367 res!199242) b!238364))

(assert (= (and b!238364 res!199236) b!238366))

(assert (= (and b!238366 res!199239) b!238369))

(assert (= start!50902 b!238363))

(declare-fun m!360519 () Bool)

(assert (=> b!238363 m!360519))

(declare-fun m!360521 () Bool)

(assert (=> b!238368 m!360521))

(declare-fun m!360523 () Bool)

(assert (=> b!238366 m!360523))

(declare-fun m!360525 () Bool)

(assert (=> b!238366 m!360525))

(declare-fun m!360527 () Bool)

(assert (=> b!238365 m!360527))

(declare-fun m!360529 () Bool)

(assert (=> b!238370 m!360529))

(declare-fun m!360531 () Bool)

(assert (=> b!238364 m!360531))

(declare-fun m!360533 () Bool)

(assert (=> b!238364 m!360533))

(declare-fun m!360535 () Bool)

(assert (=> start!50902 m!360535))

(check-sat (not start!50902) (not b!238365) (not b!238363) (not b!238368) (not b!238366) (not b!238364) (not b!238370))
(check-sat)
