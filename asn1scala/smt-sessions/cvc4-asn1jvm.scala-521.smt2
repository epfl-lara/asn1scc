; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15216 () Bool)

(assert start!15216)

(declare-fun b!77839 () Bool)

(declare-fun res!64329 () Bool)

(declare-fun e!51021 () Bool)

(assert (=> b!77839 (=> (not res!64329) (not e!51021))))

(declare-datatypes ((array!3276 0))(
  ( (array!3277 (arr!2123 (Array (_ BitVec 32) (_ BitVec 8))) (size!1522 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2618 0))(
  ( (BitStream!2619 (buf!1918 array!3276) (currentByte!3735 (_ BitVec 32)) (currentBit!3730 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5141 0))(
  ( (Unit!5142) )
))
(declare-datatypes ((tuple2!6926 0))(
  ( (tuple2!6927 (_1!3597 Unit!5141) (_2!3597 BitStream!2618)) )
))
(declare-fun lt!124837 () tuple2!6926)

(declare-fun thiss!1090 () BitStream!2618)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77839 (= res!64329 (= (bitIndex!0 (size!1522 (buf!1918 (_2!3597 lt!124837))) (currentByte!3735 (_2!3597 lt!124837)) (currentBit!3730 (_2!3597 lt!124837))) (bvadd (bitIndex!0 (size!1522 (buf!1918 thiss!1090)) (currentByte!3735 thiss!1090) (currentBit!3730 thiss!1090)) nBits!322)))))

(declare-fun b!77840 () Bool)

(declare-fun res!64330 () Bool)

(declare-fun e!51024 () Bool)

(assert (=> b!77840 (=> (not res!64330) (not e!51024))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77840 (= res!64330 (validate_offset_bits!1 ((_ sign_extend 32) (size!1522 (buf!1918 thiss!1090))) ((_ sign_extend 32) (currentByte!3735 thiss!1090)) ((_ sign_extend 32) (currentBit!3730 thiss!1090)) nBits!322))))

(declare-fun res!64333 () Bool)

(assert (=> start!15216 (=> (not res!64333) (not e!51024))))

(assert (=> start!15216 (= res!64333 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15216 e!51024))

(assert (=> start!15216 true))

(declare-fun e!51022 () Bool)

(declare-fun inv!12 (BitStream!2618) Bool)

(assert (=> start!15216 (and (inv!12 thiss!1090) e!51022)))

(declare-fun b!77841 () Bool)

(declare-datatypes ((tuple2!6928 0))(
  ( (tuple2!6929 (_1!3598 BitStream!2618) (_2!3598 Bool)) )
))
(declare-fun lt!124832 () tuple2!6928)

(declare-datatypes ((tuple2!6930 0))(
  ( (tuple2!6931 (_1!3599 BitStream!2618) (_2!3599 BitStream!2618)) )
))
(declare-fun lt!124833 () tuple2!6930)

(assert (=> b!77841 (= e!51021 (not (or (not (_2!3598 lt!124832)) (not (= (_1!3598 lt!124832) (_2!3599 lt!124833))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2618 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6928)

(assert (=> b!77841 (= lt!124832 (checkBitsLoopPure!0 (_1!3599 lt!124833) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77841 (validate_offset_bits!1 ((_ sign_extend 32) (size!1522 (buf!1918 (_2!3597 lt!124837)))) ((_ sign_extend 32) (currentByte!3735 thiss!1090)) ((_ sign_extend 32) (currentBit!3730 thiss!1090)) nBits!322)))

(declare-fun lt!124834 () Unit!5141)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2618 array!3276 (_ BitVec 64)) Unit!5141)

(assert (=> b!77841 (= lt!124834 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1918 (_2!3597 lt!124837)) nBits!322))))

(declare-fun reader!0 (BitStream!2618 BitStream!2618) tuple2!6930)

(assert (=> b!77841 (= lt!124833 (reader!0 thiss!1090 (_2!3597 lt!124837)))))

(declare-fun b!77842 () Bool)

(declare-fun res!64331 () Bool)

(assert (=> b!77842 (=> (not res!64331) (not e!51021))))

(declare-fun isPrefixOf!0 (BitStream!2618 BitStream!2618) Bool)

(assert (=> b!77842 (= res!64331 (isPrefixOf!0 thiss!1090 (_2!3597 lt!124837)))))

(declare-fun b!77843 () Bool)

(declare-fun array_inv!1368 (array!3276) Bool)

(assert (=> b!77843 (= e!51022 (array_inv!1368 (buf!1918 thiss!1090)))))

(declare-fun b!77844 () Bool)

(declare-fun lt!124835 () tuple2!6928)

(declare-fun lt!124838 () tuple2!6930)

(assert (=> b!77844 (= e!51024 (not (and (_2!3598 lt!124835) (= (_1!3598 lt!124835) (_2!3599 lt!124838)))))))

(assert (=> b!77844 (= lt!124835 (checkBitsLoopPure!0 (_1!3599 lt!124838) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77844 (validate_offset_bits!1 ((_ sign_extend 32) (size!1522 (buf!1918 (_2!3597 lt!124837)))) ((_ sign_extend 32) (currentByte!3735 thiss!1090)) ((_ sign_extend 32) (currentBit!3730 thiss!1090)) nBits!322)))

(declare-fun lt!124831 () Unit!5141)

(assert (=> b!77844 (= lt!124831 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1918 (_2!3597 lt!124837)) nBits!322))))

(assert (=> b!77844 (= lt!124838 (reader!0 thiss!1090 (_2!3597 lt!124837)))))

(declare-fun lt!124830 () Bool)

(assert (=> b!77844 (= lt!124830 (isPrefixOf!0 thiss!1090 (_2!3597 lt!124837)))))

(declare-fun lt!124839 () (_ BitVec 64))

(assert (=> b!77844 (= lt!124839 (bitIndex!0 (size!1522 (buf!1918 (_2!3597 lt!124837))) (currentByte!3735 (_2!3597 lt!124837)) (currentBit!3730 (_2!3597 lt!124837))))))

(declare-fun lt!124836 () (_ BitVec 64))

(assert (=> b!77844 (= lt!124836 (bitIndex!0 (size!1522 (buf!1918 thiss!1090)) (currentByte!3735 thiss!1090) (currentBit!3730 thiss!1090)))))

(assert (=> b!77844 e!51021))

(declare-fun res!64332 () Bool)

(assert (=> b!77844 (=> (not res!64332) (not e!51021))))

(assert (=> b!77844 (= res!64332 (= (size!1522 (buf!1918 thiss!1090)) (size!1522 (buf!1918 (_2!3597 lt!124837)))))))

(declare-fun appendNBits!0 (BitStream!2618 (_ BitVec 64) Bool) tuple2!6926)

(assert (=> b!77844 (= lt!124837 (appendNBits!0 thiss!1090 nBits!322 false))))

(assert (= (and start!15216 res!64333) b!77840))

(assert (= (and b!77840 res!64330) b!77844))

(assert (= (and b!77844 res!64332) b!77839))

(assert (= (and b!77839 res!64329) b!77842))

(assert (= (and b!77842 res!64331) b!77841))

(assert (= start!15216 b!77843))

(declare-fun m!123449 () Bool)

(assert (=> b!77839 m!123449))

(declare-fun m!123451 () Bool)

(assert (=> b!77839 m!123451))

(declare-fun m!123453 () Bool)

(assert (=> b!77844 m!123453))

(assert (=> b!77844 m!123451))

(declare-fun m!123455 () Bool)

(assert (=> b!77844 m!123455))

(assert (=> b!77844 m!123449))

(declare-fun m!123457 () Bool)

(assert (=> b!77844 m!123457))

(declare-fun m!123459 () Bool)

(assert (=> b!77844 m!123459))

(declare-fun m!123461 () Bool)

(assert (=> b!77844 m!123461))

(declare-fun m!123463 () Bool)

(assert (=> b!77844 m!123463))

(declare-fun m!123465 () Bool)

(assert (=> start!15216 m!123465))

(declare-fun m!123467 () Bool)

(assert (=> b!77840 m!123467))

(assert (=> b!77842 m!123463))

(declare-fun m!123469 () Bool)

(assert (=> b!77841 m!123469))

(assert (=> b!77841 m!123455))

(assert (=> b!77841 m!123457))

(assert (=> b!77841 m!123461))

(declare-fun m!123471 () Bool)

(assert (=> b!77843 m!123471))

(push 1)

(assert (not b!77841))

(assert (not b!77844))

