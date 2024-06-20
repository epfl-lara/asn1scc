; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15046 () Bool)

(assert start!15046)

(declare-fun res!63640 () Bool)

(declare-fun e!50517 () Bool)

(assert (=> start!15046 (=> (not res!63640) (not e!50517))))

(declare-fun nBits!322 () (_ BitVec 64))

(assert (=> start!15046 (= res!63640 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15046 e!50517))

(assert (=> start!15046 true))

(declare-datatypes ((array!3208 0))(
  ( (array!3209 (arr!2092 (Array (_ BitVec 32) (_ BitVec 8))) (size!1491 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2556 0))(
  ( (BitStream!2557 (buf!1881 array!3208) (currentByte!3692 (_ BitVec 32)) (currentBit!3687 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2556)

(declare-fun e!50520 () Bool)

(declare-fun inv!12 (BitStream!2556) Bool)

(assert (=> start!15046 (and (inv!12 thiss!1090) e!50520)))

(declare-fun b!77017 () Bool)

(declare-fun res!63638 () Bool)

(assert (=> b!77017 (=> (not res!63638) (not e!50517))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77017 (= res!63638 (validate_offset_bits!1 ((_ sign_extend 32) (size!1491 (buf!1881 thiss!1090))) ((_ sign_extend 32) (currentByte!3692 thiss!1090)) ((_ sign_extend 32) (currentBit!3687 thiss!1090)) nBits!322))))

(declare-fun b!77018 () Bool)

(declare-fun res!63636 () Bool)

(declare-fun e!50519 () Bool)

(assert (=> b!77018 (=> (not res!63636) (not e!50519))))

(declare-datatypes ((Unit!5073 0))(
  ( (Unit!5074) )
))
(declare-datatypes ((tuple2!6728 0))(
  ( (tuple2!6729 (_1!3498 Unit!5073) (_2!3498 BitStream!2556)) )
))
(declare-fun lt!123414 () tuple2!6728)

(declare-fun isPrefixOf!0 (BitStream!2556 BitStream!2556) Bool)

(assert (=> b!77018 (= res!63636 (isPrefixOf!0 thiss!1090 (_2!3498 lt!123414)))))

(declare-fun b!77019 () Bool)

(declare-fun res!63637 () Bool)

(assert (=> b!77019 (=> (not res!63637) (not e!50519))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77019 (= res!63637 (= (bitIndex!0 (size!1491 (buf!1881 (_2!3498 lt!123414))) (currentByte!3692 (_2!3498 lt!123414)) (currentBit!3687 (_2!3498 lt!123414))) (bvadd (bitIndex!0 (size!1491 (buf!1881 thiss!1090)) (currentByte!3692 thiss!1090) (currentBit!3687 thiss!1090)) nBits!322)))))

(declare-fun b!77020 () Bool)

(declare-datatypes ((tuple2!6730 0))(
  ( (tuple2!6731 (_1!3499 BitStream!2556) (_2!3499 Bool)) )
))
(declare-fun lt!123413 () tuple2!6730)

(declare-datatypes ((tuple2!6732 0))(
  ( (tuple2!6733 (_1!3500 BitStream!2556) (_2!3500 BitStream!2556)) )
))
(declare-fun lt!123417 () tuple2!6732)

(assert (=> b!77020 (= e!50519 (not (or (not (_2!3499 lt!123413)) (not (= (_1!3499 lt!123413) (_2!3500 lt!123417))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2556 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6730)

(assert (=> b!77020 (= lt!123413 (checkBitsLoopPure!0 (_1!3500 lt!123417) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77020 (validate_offset_bits!1 ((_ sign_extend 32) (size!1491 (buf!1881 (_2!3498 lt!123414)))) ((_ sign_extend 32) (currentByte!3692 thiss!1090)) ((_ sign_extend 32) (currentBit!3687 thiss!1090)) nBits!322)))

(declare-fun lt!123418 () Unit!5073)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2556 array!3208 (_ BitVec 64)) Unit!5073)

(assert (=> b!77020 (= lt!123418 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1881 (_2!3498 lt!123414)) nBits!322))))

(declare-fun reader!0 (BitStream!2556 BitStream!2556) tuple2!6732)

(assert (=> b!77020 (= lt!123417 (reader!0 thiss!1090 (_2!3498 lt!123414)))))

(declare-fun b!77021 () Bool)

(declare-fun array_inv!1337 (array!3208) Bool)

(assert (=> b!77021 (= e!50520 (array_inv!1337 (buf!1881 thiss!1090)))))

(declare-fun b!77022 () Bool)

(assert (=> b!77022 (= e!50517 (not true))))

(declare-fun lt!123416 () tuple2!6732)

(assert (=> b!77022 (= lt!123416 (reader!0 thiss!1090 (_2!3498 lt!123414)))))

(declare-fun lt!123415 () Bool)

(assert (=> b!77022 (= lt!123415 (isPrefixOf!0 thiss!1090 (_2!3498 lt!123414)))))

(declare-fun lt!123420 () (_ BitVec 64))

(assert (=> b!77022 (= lt!123420 (bitIndex!0 (size!1491 (buf!1881 (_2!3498 lt!123414))) (currentByte!3692 (_2!3498 lt!123414)) (currentBit!3687 (_2!3498 lt!123414))))))

(declare-fun lt!123419 () (_ BitVec 64))

(assert (=> b!77022 (= lt!123419 (bitIndex!0 (size!1491 (buf!1881 thiss!1090)) (currentByte!3692 thiss!1090) (currentBit!3687 thiss!1090)))))

(assert (=> b!77022 e!50519))

(declare-fun res!63639 () Bool)

(assert (=> b!77022 (=> (not res!63639) (not e!50519))))

(assert (=> b!77022 (= res!63639 (= (size!1491 (buf!1881 thiss!1090)) (size!1491 (buf!1881 (_2!3498 lt!123414)))))))

(declare-fun appendNBits!0 (BitStream!2556 (_ BitVec 64) Bool) tuple2!6728)

(assert (=> b!77022 (= lt!123414 (appendNBits!0 thiss!1090 nBits!322 false))))

(assert (= (and start!15046 res!63640) b!77017))

(assert (= (and b!77017 res!63638) b!77022))

(assert (= (and b!77022 res!63639) b!77019))

(assert (= (and b!77019 res!63637) b!77018))

(assert (= (and b!77018 res!63636) b!77020))

(assert (= start!15046 b!77021))

(declare-fun m!122391 () Bool)

(assert (=> b!77021 m!122391))

(declare-fun m!122393 () Bool)

(assert (=> b!77017 m!122393))

(declare-fun m!122395 () Bool)

(assert (=> b!77018 m!122395))

(declare-fun m!122397 () Bool)

(assert (=> b!77022 m!122397))

(declare-fun m!122399 () Bool)

(assert (=> b!77022 m!122399))

(declare-fun m!122401 () Bool)

(assert (=> b!77022 m!122401))

(declare-fun m!122403 () Bool)

(assert (=> b!77022 m!122403))

(assert (=> b!77022 m!122395))

(declare-fun m!122405 () Bool)

(assert (=> start!15046 m!122405))

(declare-fun m!122407 () Bool)

(assert (=> b!77020 m!122407))

(declare-fun m!122409 () Bool)

(assert (=> b!77020 m!122409))

(declare-fun m!122411 () Bool)

(assert (=> b!77020 m!122411))

(assert (=> b!77020 m!122399))

(assert (=> b!77019 m!122403))

(assert (=> b!77019 m!122397))

(check-sat (not b!77022) (not b!77017) (not b!77021) (not start!15046) (not b!77019) (not b!77020) (not b!77018))
