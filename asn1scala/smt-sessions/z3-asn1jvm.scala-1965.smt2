; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50914 () Bool)

(assert start!50914)

(declare-fun b!238507 () Bool)

(declare-fun res!199368 () Bool)

(declare-fun e!164740 () Bool)

(assert (=> b!238507 (=> (not res!199368) (not e!164740))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238507 (= res!199368 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238508 () Bool)

(declare-fun e!164739 () Bool)

(assert (=> b!238508 (= e!164740 e!164739)))

(declare-fun res!199366 () Bool)

(assert (=> b!238508 (=> (not res!199366) (not e!164739))))

(declare-datatypes ((array!12720 0))(
  ( (array!12721 (arr!6575 (Array (_ BitVec 32) (_ BitVec 8))) (size!5588 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10140 0))(
  ( (BitStream!10141 (buf!6063 array!12720) (currentByte!11249 (_ BitVec 32)) (currentBit!11244 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20146 0))(
  ( (tuple2!20147 (_1!10977 (_ BitVec 64)) (_2!10977 BitStream!10140)) )
))
(declare-fun lt!373290 () tuple2!20146)

(declare-fun thiss!1830 () BitStream!10140)

(assert (=> b!238508 (= res!199366 (= (buf!6063 (_2!10977 lt!373290)) (buf!6063 thiss!1830)))))

(declare-datatypes ((tuple2!20148 0))(
  ( (tuple2!20149 (_1!10978 Bool) (_2!10978 BitStream!10140)) )
))
(declare-fun lt!373288 () tuple2!20148)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20146)

(assert (=> b!238508 (= lt!373290 (readNLeastSignificantBitsLoop!0 (_2!10978 lt!373288) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10978 lt!373288) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10140) tuple2!20148)

(assert (=> b!238508 (= lt!373288 (readBit!0 thiss!1830))))

(declare-fun b!238509 () Bool)

(declare-fun e!164737 () Bool)

(declare-fun array_inv!5329 (array!12720) Bool)

(assert (=> b!238509 (= e!164737 (array_inv!5329 (buf!6063 thiss!1830)))))

(declare-fun b!238510 () Bool)

(declare-fun e!164738 () Bool)

(assert (=> b!238510 (= e!164738 e!164740)))

(declare-fun res!199367 () Bool)

(assert (=> b!238510 (=> (not res!199367) (not e!164740))))

(declare-fun lt!373289 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238510 (= res!199367 (validate_offset_bits!1 ((_ sign_extend 32) (size!5588 (buf!6063 thiss!1830))) ((_ sign_extend 32) (currentByte!11249 thiss!1830)) ((_ sign_extend 32) (currentBit!11244 thiss!1830)) lt!373289))))

(assert (=> b!238510 (= lt!373289 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238511 () Bool)

(assert (=> b!238511 (= e!164739 (or (bvslt lt!373289 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!373289 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun b!238512 () Bool)

(declare-fun res!199365 () Bool)

(assert (=> b!238512 (=> (not res!199365) (not e!164739))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238512 (= res!199365 (= (bitIndex!0 (size!5588 (buf!6063 (_2!10977 lt!373290))) (currentByte!11249 (_2!10977 lt!373290)) (currentBit!11244 (_2!10977 lt!373290))) (bvadd (bitIndex!0 (size!5588 (buf!6063 thiss!1830)) (currentByte!11249 thiss!1830) (currentBit!11244 thiss!1830)) lt!373289)))))

(declare-fun b!238513 () Bool)

(declare-fun res!199364 () Bool)

(assert (=> b!238513 (=> (not res!199364) (not e!164740))))

(assert (=> b!238513 (= res!199364 (not (= nBits!581 i!752)))))

(declare-fun res!199362 () Bool)

(assert (=> start!50914 (=> (not res!199362) (not e!164738))))

(assert (=> start!50914 (= res!199362 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50914 e!164738))

(assert (=> start!50914 true))

(declare-fun inv!12 (BitStream!10140) Bool)

(assert (=> start!50914 (and (inv!12 thiss!1830) e!164737)))

(declare-fun b!238514 () Bool)

(declare-fun res!199363 () Bool)

(assert (=> b!238514 (=> (not res!199363) (not e!164740))))

(assert (=> b!238514 (= res!199363 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50914 res!199362) b!238510))

(assert (= (and b!238510 res!199367) b!238507))

(assert (= (and b!238507 res!199368) b!238514))

(assert (= (and b!238514 res!199363) b!238513))

(assert (= (and b!238513 res!199364) b!238508))

(assert (= (and b!238508 res!199366) b!238512))

(assert (= (and b!238512 res!199365) b!238511))

(assert (= start!50914 b!238509))

(declare-fun m!360627 () Bool)

(assert (=> b!238507 m!360627))

(declare-fun m!360629 () Bool)

(assert (=> b!238512 m!360629))

(declare-fun m!360631 () Bool)

(assert (=> b!238512 m!360631))

(declare-fun m!360633 () Bool)

(assert (=> b!238514 m!360633))

(declare-fun m!360635 () Bool)

(assert (=> b!238509 m!360635))

(declare-fun m!360637 () Bool)

(assert (=> start!50914 m!360637))

(declare-fun m!360639 () Bool)

(assert (=> b!238510 m!360639))

(declare-fun m!360641 () Bool)

(assert (=> b!238508 m!360641))

(declare-fun m!360643 () Bool)

(assert (=> b!238508 m!360643))

(check-sat (not b!238510) (not b!238507) (not b!238512) (not b!238509) (not start!50914) (not b!238508) (not b!238514))
(check-sat)
