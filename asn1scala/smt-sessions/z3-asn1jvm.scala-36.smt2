; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!730 () Bool)

(assert start!730)

(declare-fun b!2385 () Bool)

(declare-fun res!4106 () Bool)

(declare-fun e!1693 () Bool)

(assert (=> b!2385 (=> (not res!4106) (not e!1693))))

(declare-datatypes ((array!227 0))(
  ( (array!228 (arr!479 (Array (_ BitVec 32) (_ BitVec 8))) (size!92 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!162 0))(
  ( (BitStream!163 (buf!401 array!227) (currentByte!1356 (_ BitVec 32)) (currentBit!1351 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!162)

(declare-datatypes ((Unit!138 0))(
  ( (Unit!139) )
))
(declare-datatypes ((tuple2!188 0))(
  ( (tuple2!189 (_1!101 Unit!138) (_2!101 BitStream!162)) )
))
(declare-fun lt!1817 () tuple2!188)

(assert (=> b!2385 (= res!4106 (= (size!92 (buf!401 thiss!1486)) (size!92 (buf!401 (_2!101 lt!1817)))))))

(declare-fun b!2387 () Bool)

(declare-fun res!4111 () Bool)

(declare-fun e!1691 () Bool)

(assert (=> b!2387 (=> (not res!4111) (not e!1691))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2387 (= res!4111 (validate_offset_bits!1 ((_ sign_extend 32) (size!92 (buf!401 thiss!1486))) ((_ sign_extend 32) (currentByte!1356 thiss!1486)) ((_ sign_extend 32) (currentBit!1351 thiss!1486)) nBits!460))))

(declare-fun b!2388 () Bool)

(declare-fun e!1692 () Bool)

(declare-fun array_inv!87 (array!227) Bool)

(assert (=> b!2388 (= e!1692 (array_inv!87 (buf!401 thiss!1486)))))

(declare-fun b!2389 () Bool)

(assert (=> b!2389 (= e!1693 (not (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> b!2389 (validate_offset_bits!1 ((_ sign_extend 32) (size!92 (buf!401 (_2!101 lt!1817)))) ((_ sign_extend 32) (currentByte!1356 thiss!1486)) ((_ sign_extend 32) (currentBit!1351 thiss!1486)) nBits!460)))

(declare-fun lt!1815 () Unit!138)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!162 array!227 (_ BitVec 64)) Unit!138)

(assert (=> b!2389 (= lt!1815 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!401 (_2!101 lt!1817)) nBits!460))))

(declare-datatypes ((tuple2!190 0))(
  ( (tuple2!191 (_1!102 BitStream!162) (_2!102 BitStream!162)) )
))
(declare-fun lt!1816 () tuple2!190)

(declare-fun reader!0 (BitStream!162 BitStream!162) tuple2!190)

(assert (=> b!2389 (= lt!1816 (reader!0 thiss!1486 (_2!101 lt!1817)))))

(declare-fun b!2386 () Bool)

(declare-fun res!4109 () Bool)

(assert (=> b!2386 (=> (not res!4109) (not e!1693))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2386 (= res!4109 (= (bitIndex!0 (size!92 (buf!401 (_2!101 lt!1817))) (currentByte!1356 (_2!101 lt!1817)) (currentBit!1351 (_2!101 lt!1817))) (bvadd (bitIndex!0 (size!92 (buf!401 thiss!1486)) (currentByte!1356 thiss!1486) (currentBit!1351 thiss!1486)) nBits!460)))))

(declare-fun res!4110 () Bool)

(assert (=> start!730 (=> (not res!4110) (not e!1691))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!227)

(assert (=> start!730 (= res!4110 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!92 srcBuffer!6))))))))

(assert (=> start!730 e!1691))

(assert (=> start!730 true))

(assert (=> start!730 (array_inv!87 srcBuffer!6)))

(declare-fun inv!12 (BitStream!162) Bool)

(assert (=> start!730 (and (inv!12 thiss!1486) e!1692)))

(declare-fun b!2390 () Bool)

(assert (=> b!2390 (= e!1691 e!1693)))

(declare-fun res!4107 () Bool)

(assert (=> b!2390 (=> (not res!4107) (not e!1693))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2390 (= res!4107 (invariant!0 (currentBit!1351 (_2!101 lt!1817)) (currentByte!1356 (_2!101 lt!1817)) (size!92 (buf!401 (_2!101 lt!1817)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!162 array!227 (_ BitVec 64) (_ BitVec 64)) tuple2!188)

(assert (=> b!2390 (= lt!1817 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2391 () Bool)

(declare-fun res!4108 () Bool)

(assert (=> b!2391 (=> (not res!4108) (not e!1693))))

(declare-fun isPrefixOf!0 (BitStream!162 BitStream!162) Bool)

(assert (=> b!2391 (= res!4108 (isPrefixOf!0 thiss!1486 (_2!101 lt!1817)))))

(assert (= (and start!730 res!4110) b!2387))

(assert (= (and b!2387 res!4111) b!2390))

(assert (= (and b!2390 res!4107) b!2385))

(assert (= (and b!2385 res!4106) b!2386))

(assert (= (and b!2386 res!4109) b!2391))

(assert (= (and b!2391 res!4108) b!2389))

(assert (= start!730 b!2388))

(declare-fun m!2019 () Bool)

(assert (=> b!2387 m!2019))

(declare-fun m!2021 () Bool)

(assert (=> b!2386 m!2021))

(declare-fun m!2023 () Bool)

(assert (=> b!2386 m!2023))

(declare-fun m!2025 () Bool)

(assert (=> b!2391 m!2025))

(declare-fun m!2027 () Bool)

(assert (=> b!2390 m!2027))

(declare-fun m!2029 () Bool)

(assert (=> b!2390 m!2029))

(declare-fun m!2031 () Bool)

(assert (=> b!2389 m!2031))

(declare-fun m!2033 () Bool)

(assert (=> b!2389 m!2033))

(declare-fun m!2035 () Bool)

(assert (=> b!2389 m!2035))

(declare-fun m!2037 () Bool)

(assert (=> start!730 m!2037))

(declare-fun m!2039 () Bool)

(assert (=> start!730 m!2039))

(declare-fun m!2041 () Bool)

(assert (=> b!2388 m!2041))

(check-sat (not start!730) (not b!2386) (not b!2388) (not b!2391) (not b!2387) (not b!2390) (not b!2389))
(check-sat)
