; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20580 () Bool)

(assert start!20580)

(declare-fun b!103645 () Bool)

(declare-fun e!67836 () Bool)

(declare-fun e!67833 () Bool)

(assert (=> b!103645 (= e!67836 e!67833)))

(declare-fun res!85281 () Bool)

(assert (=> b!103645 (=> (not res!85281) (not e!67833))))

(declare-fun lt!151701 () (_ BitVec 64))

(declare-fun lt!151698 () (_ BitVec 64))

(assert (=> b!103645 (= res!85281 (= lt!151701 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!151698)))))

(declare-datatypes ((array!4838 0))(
  ( (array!4839 (arr!2800 (Array (_ BitVec 32) (_ BitVec 8))) (size!2207 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3888 0))(
  ( (BitStream!3889 (buf!2573 array!4838) (currentByte!5058 (_ BitVec 32)) (currentBit!5053 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6358 0))(
  ( (Unit!6359) )
))
(declare-datatypes ((tuple2!8502 0))(
  ( (tuple2!8503 (_1!4506 Unit!6358) (_2!4506 BitStream!3888)) )
))
(declare-fun lt!151704 () tuple2!8502)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103645 (= lt!151701 (bitIndex!0 (size!2207 (buf!2573 (_2!4506 lt!151704))) (currentByte!5058 (_2!4506 lt!151704)) (currentBit!5053 (_2!4506 lt!151704))))))

(declare-fun thiss!1305 () BitStream!3888)

(assert (=> b!103645 (= lt!151698 (bitIndex!0 (size!2207 (buf!2573 thiss!1305)) (currentByte!5058 thiss!1305) (currentBit!5053 thiss!1305)))))

(declare-fun b!103646 () Bool)

(declare-fun e!67827 () Bool)

(assert (=> b!103646 (= e!67827 true)))

(declare-datatypes ((tuple2!8504 0))(
  ( (tuple2!8505 (_1!4507 BitStream!3888) (_2!4507 (_ BitVec 64))) )
))
(declare-fun lt!151710 () tuple2!8504)

(declare-fun lt!151702 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((tuple2!8506 0))(
  ( (tuple2!8507 (_1!4508 BitStream!3888) (_2!4508 BitStream!3888)) )
))
(declare-fun lt!151708 () tuple2!8506)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8504)

(declare-fun withMovedBitIndex!0 (BitStream!3888 (_ BitVec 64)) BitStream!3888)

(assert (=> b!103646 (= lt!151710 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4508 lt!151708) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151702))))

(declare-fun b!103647 () Bool)

(declare-fun e!67828 () Bool)

(declare-fun lt!151714 () tuple2!8502)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103647 (= e!67828 (invariant!0 (currentBit!5053 thiss!1305) (currentByte!5058 thiss!1305) (size!2207 (buf!2573 (_2!4506 lt!151714)))))))

(declare-fun res!85278 () Bool)

(declare-fun e!67831 () Bool)

(assert (=> start!20580 (=> (not res!85278) (not e!67831))))

(assert (=> start!20580 (= res!85278 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20580 e!67831))

(assert (=> start!20580 true))

(declare-fun e!67832 () Bool)

(declare-fun inv!12 (BitStream!3888) Bool)

(assert (=> start!20580 (and (inv!12 thiss!1305) e!67832)))

(declare-fun b!103648 () Bool)

(declare-fun e!67830 () Bool)

(assert (=> b!103648 (= e!67831 e!67830)))

(declare-fun res!85277 () Bool)

(assert (=> b!103648 (=> (not res!85277) (not e!67830))))

(declare-fun lt!151709 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103648 (= res!85277 (validate_offset_bits!1 ((_ sign_extend 32) (size!2207 (buf!2573 thiss!1305))) ((_ sign_extend 32) (currentByte!5058 thiss!1305)) ((_ sign_extend 32) (currentBit!5053 thiss!1305)) lt!151709))))

(assert (=> b!103648 (= lt!151709 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103649 () Bool)

(declare-fun res!85274 () Bool)

(assert (=> b!103649 (=> res!85274 e!67827)))

(declare-fun lt!151712 () (_ BitVec 64))

(declare-fun lt!151700 () (_ BitVec 64))

(declare-fun lt!151703 () (_ BitVec 64))

(assert (=> b!103649 (= res!85274 (or (not (= (bvand lt!151700 lt!151703) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!151700 lt!151712) lt!151700))))))

(declare-fun b!103650 () Bool)

(declare-fun e!67834 () Bool)

(assert (=> b!103650 (= e!67830 e!67834)))

(declare-fun res!85285 () Bool)

(assert (=> b!103650 (=> (not res!85285) (not e!67834))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!103650 (= res!85285 (and (= (bvand v!199 lt!151712) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103650 (= lt!151712 (onesLSBLong!0 nBits!396))))

(declare-fun b!103651 () Bool)

(declare-fun e!67829 () Bool)

(assert (=> b!103651 (= e!67833 e!67829)))

(declare-fun res!85284 () Bool)

(assert (=> b!103651 (=> (not res!85284) (not e!67829))))

(declare-datatypes ((tuple2!8508 0))(
  ( (tuple2!8509 (_1!4509 BitStream!3888) (_2!4509 Bool)) )
))
(declare-fun lt!151696 () tuple2!8508)

(declare-fun lt!151707 () Bool)

(assert (=> b!103651 (= res!85284 (and (= (_2!4509 lt!151696) lt!151707) (= (_1!4509 lt!151696) (_2!4506 lt!151704))))))

(declare-fun readBitPure!0 (BitStream!3888) tuple2!8508)

(declare-fun readerFrom!0 (BitStream!3888 (_ BitVec 32) (_ BitVec 32)) BitStream!3888)

(assert (=> b!103651 (= lt!151696 (readBitPure!0 (readerFrom!0 (_2!4506 lt!151704) (currentBit!5053 thiss!1305) (currentByte!5058 thiss!1305))))))

(declare-fun b!103652 () Bool)

(declare-fun res!85279 () Bool)

(assert (=> b!103652 (=> res!85279 e!67827)))

(assert (=> b!103652 (= res!85279 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2207 (buf!2573 (_1!4508 lt!151708)))) ((_ sign_extend 32) (currentByte!5058 (_1!4508 lt!151708))) ((_ sign_extend 32) (currentBit!5053 (_1!4508 lt!151708))) lt!151709)))))

(declare-fun b!103653 () Bool)

(declare-fun array_inv!2009 (array!4838) Bool)

(assert (=> b!103653 (= e!67832 (array_inv!2009 (buf!2573 thiss!1305)))))

(declare-fun b!103654 () Bool)

(declare-fun res!85275 () Bool)

(assert (=> b!103654 (=> (not res!85275) (not e!67828))))

(assert (=> b!103654 (= res!85275 (invariant!0 (currentBit!5053 thiss!1305) (currentByte!5058 thiss!1305) (size!2207 (buf!2573 (_2!4506 lt!151704)))))))

(declare-fun b!103655 () Bool)

(declare-fun res!85286 () Bool)

(assert (=> b!103655 (=> (not res!85286) (not e!67833))))

(declare-fun isPrefixOf!0 (BitStream!3888 BitStream!3888) Bool)

(assert (=> b!103655 (= res!85286 (isPrefixOf!0 thiss!1305 (_2!4506 lt!151704)))))

(declare-fun b!103656 () Bool)

(assert (=> b!103656 (= e!67829 (= (bitIndex!0 (size!2207 (buf!2573 (_1!4509 lt!151696))) (currentByte!5058 (_1!4509 lt!151696)) (currentBit!5053 (_1!4509 lt!151696))) lt!151701))))

(declare-fun b!103657 () Bool)

(declare-fun e!67835 () Bool)

(declare-fun lt!151711 () tuple2!8508)

(declare-fun lt!151695 () tuple2!8508)

(assert (=> b!103657 (= e!67835 (= (_2!4509 lt!151711) (_2!4509 lt!151695)))))

(declare-fun b!103658 () Bool)

(assert (=> b!103658 (= e!67834 (not e!67827))))

(declare-fun res!85282 () Bool)

(assert (=> b!103658 (=> res!85282 e!67827)))

(declare-fun lt!151697 () tuple2!8506)

(assert (=> b!103658 (= res!85282 (not (= (_1!4507 (readNLeastSignificantBitsLoopPure!0 (_1!4508 lt!151697) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151702)) (_2!4508 lt!151697))))))

(declare-fun lt!151713 () (_ BitVec 64))

(assert (=> b!103658 (validate_offset_bits!1 ((_ sign_extend 32) (size!2207 (buf!2573 (_2!4506 lt!151714)))) ((_ sign_extend 32) (currentByte!5058 (_2!4506 lt!151704))) ((_ sign_extend 32) (currentBit!5053 (_2!4506 lt!151704))) lt!151713)))

(declare-fun lt!151691 () Unit!6358)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3888 array!4838 (_ BitVec 64)) Unit!6358)

(assert (=> b!103658 (= lt!151691 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4506 lt!151704) (buf!2573 (_2!4506 lt!151714)) lt!151713))))

(assert (=> b!103658 (= lt!151713 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!151693 () (_ BitVec 64))

(declare-fun lt!151705 () tuple2!8508)

(assert (=> b!103658 (= lt!151702 (bvor lt!151700 (ite (_2!4509 lt!151705) lt!151693 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!151690 () tuple2!8504)

(assert (=> b!103658 (= lt!151690 (readNLeastSignificantBitsLoopPure!0 (_1!4508 lt!151708) nBits!396 i!615 lt!151700))))

(assert (=> b!103658 (validate_offset_bits!1 ((_ sign_extend 32) (size!2207 (buf!2573 (_2!4506 lt!151714)))) ((_ sign_extend 32) (currentByte!5058 thiss!1305)) ((_ sign_extend 32) (currentBit!5053 thiss!1305)) lt!151709)))

(declare-fun lt!151706 () Unit!6358)

(assert (=> b!103658 (= lt!151706 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2573 (_2!4506 lt!151714)) lt!151709))))

(assert (=> b!103658 (= lt!151700 (bvand v!199 (bvnot lt!151703)))))

(assert (=> b!103658 (= lt!151703 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!103658 (= (_2!4509 lt!151705) lt!151707)))

(assert (=> b!103658 (= lt!151705 (readBitPure!0 (_1!4508 lt!151708)))))

(declare-fun reader!0 (BitStream!3888 BitStream!3888) tuple2!8506)

(assert (=> b!103658 (= lt!151697 (reader!0 (_2!4506 lt!151704) (_2!4506 lt!151714)))))

(assert (=> b!103658 (= lt!151708 (reader!0 thiss!1305 (_2!4506 lt!151714)))))

(assert (=> b!103658 e!67835))

(declare-fun res!85276 () Bool)

(assert (=> b!103658 (=> (not res!85276) (not e!67835))))

(assert (=> b!103658 (= res!85276 (= (bitIndex!0 (size!2207 (buf!2573 (_1!4509 lt!151711))) (currentByte!5058 (_1!4509 lt!151711)) (currentBit!5053 (_1!4509 lt!151711))) (bitIndex!0 (size!2207 (buf!2573 (_1!4509 lt!151695))) (currentByte!5058 (_1!4509 lt!151695)) (currentBit!5053 (_1!4509 lt!151695)))))))

(declare-fun lt!151699 () Unit!6358)

(declare-fun lt!151694 () BitStream!3888)

(declare-fun readBitPrefixLemma!0 (BitStream!3888 BitStream!3888) Unit!6358)

(assert (=> b!103658 (= lt!151699 (readBitPrefixLemma!0 lt!151694 (_2!4506 lt!151714)))))

(assert (=> b!103658 (= lt!151695 (readBitPure!0 (BitStream!3889 (buf!2573 (_2!4506 lt!151714)) (currentByte!5058 thiss!1305) (currentBit!5053 thiss!1305))))))

(assert (=> b!103658 (= lt!151711 (readBitPure!0 lt!151694))))

(assert (=> b!103658 (= lt!151694 (BitStream!3889 (buf!2573 (_2!4506 lt!151704)) (currentByte!5058 thiss!1305) (currentBit!5053 thiss!1305)))))

(assert (=> b!103658 e!67828))

(declare-fun res!85283 () Bool)

(assert (=> b!103658 (=> (not res!85283) (not e!67828))))

(assert (=> b!103658 (= res!85283 (isPrefixOf!0 thiss!1305 (_2!4506 lt!151714)))))

(declare-fun lt!151692 () Unit!6358)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3888 BitStream!3888 BitStream!3888) Unit!6358)

(assert (=> b!103658 (= lt!151692 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4506 lt!151704) (_2!4506 lt!151714)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3888 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8502)

(assert (=> b!103658 (= lt!151714 (appendNLeastSignificantBitsLoop!0 (_2!4506 lt!151704) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!103658 e!67836))

(declare-fun res!85280 () Bool)

(assert (=> b!103658 (=> (not res!85280) (not e!67836))))

(assert (=> b!103658 (= res!85280 (= (size!2207 (buf!2573 thiss!1305)) (size!2207 (buf!2573 (_2!4506 lt!151704)))))))

(declare-fun appendBit!0 (BitStream!3888 Bool) tuple2!8502)

(assert (=> b!103658 (= lt!151704 (appendBit!0 thiss!1305 lt!151707))))

(assert (=> b!103658 (= lt!151707 (not (= (bvand v!199 lt!151693) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103658 (= lt!151693 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!20580 res!85278) b!103648))

(assert (= (and b!103648 res!85277) b!103650))

(assert (= (and b!103650 res!85285) b!103658))

(assert (= (and b!103658 res!85280) b!103645))

(assert (= (and b!103645 res!85281) b!103655))

(assert (= (and b!103655 res!85286) b!103651))

(assert (= (and b!103651 res!85284) b!103656))

(assert (= (and b!103658 res!85283) b!103654))

(assert (= (and b!103654 res!85275) b!103647))

(assert (= (and b!103658 res!85276) b!103657))

(assert (= (and b!103658 (not res!85282)) b!103652))

(assert (= (and b!103652 (not res!85279)) b!103649))

(assert (= (and b!103649 (not res!85274)) b!103646))

(assert (= start!20580 b!103653))

(declare-fun m!151365 () Bool)

(assert (=> start!20580 m!151365))

(declare-fun m!151367 () Bool)

(assert (=> b!103645 m!151367))

(declare-fun m!151369 () Bool)

(assert (=> b!103645 m!151369))

(declare-fun m!151371 () Bool)

(assert (=> b!103647 m!151371))

(declare-fun m!151373 () Bool)

(assert (=> b!103646 m!151373))

(assert (=> b!103646 m!151373))

(declare-fun m!151375 () Bool)

(assert (=> b!103646 m!151375))

(declare-fun m!151377 () Bool)

(assert (=> b!103652 m!151377))

(declare-fun m!151379 () Bool)

(assert (=> b!103653 m!151379))

(declare-fun m!151381 () Bool)

(assert (=> b!103658 m!151381))

(declare-fun m!151383 () Bool)

(assert (=> b!103658 m!151383))

(declare-fun m!151385 () Bool)

(assert (=> b!103658 m!151385))

(declare-fun m!151387 () Bool)

(assert (=> b!103658 m!151387))

(declare-fun m!151389 () Bool)

(assert (=> b!103658 m!151389))

(declare-fun m!151391 () Bool)

(assert (=> b!103658 m!151391))

(declare-fun m!151393 () Bool)

(assert (=> b!103658 m!151393))

(declare-fun m!151395 () Bool)

(assert (=> b!103658 m!151395))

(declare-fun m!151397 () Bool)

(assert (=> b!103658 m!151397))

(declare-fun m!151399 () Bool)

(assert (=> b!103658 m!151399))

(declare-fun m!151401 () Bool)

(assert (=> b!103658 m!151401))

(declare-fun m!151403 () Bool)

(assert (=> b!103658 m!151403))

(declare-fun m!151405 () Bool)

(assert (=> b!103658 m!151405))

(declare-fun m!151407 () Bool)

(assert (=> b!103658 m!151407))

(declare-fun m!151409 () Bool)

(assert (=> b!103658 m!151409))

(declare-fun m!151411 () Bool)

(assert (=> b!103658 m!151411))

(declare-fun m!151413 () Bool)

(assert (=> b!103658 m!151413))

(declare-fun m!151415 () Bool)

(assert (=> b!103658 m!151415))

(declare-fun m!151417 () Bool)

(assert (=> b!103658 m!151417))

(declare-fun m!151419 () Bool)

(assert (=> b!103648 m!151419))

(declare-fun m!151421 () Bool)

(assert (=> b!103656 m!151421))

(declare-fun m!151423 () Bool)

(assert (=> b!103651 m!151423))

(assert (=> b!103651 m!151423))

(declare-fun m!151425 () Bool)

(assert (=> b!103651 m!151425))

(declare-fun m!151427 () Bool)

(assert (=> b!103655 m!151427))

(declare-fun m!151429 () Bool)

(assert (=> b!103650 m!151429))

(declare-fun m!151431 () Bool)

(assert (=> b!103654 m!151431))

(check-sat (not b!103652) (not b!103645) (not b!103646) (not b!103648) (not b!103656) (not b!103654) (not b!103650) (not b!103647) (not b!103655) (not b!103658) (not b!103651) (not start!20580) (not b!103653))
