; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15206 () Bool)

(assert start!15206)

(declare-fun b!77749 () Bool)

(declare-fun res!64258 () Bool)

(declare-fun e!50962 () Bool)

(assert (=> b!77749 (=> (not res!64258) (not e!50962))))

(declare-datatypes ((array!3266 0))(
  ( (array!3267 (arr!2118 (Array (_ BitVec 32) (_ BitVec 8))) (size!1517 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2608 0))(
  ( (BitStream!2609 (buf!1913 array!3266) (currentByte!3730 (_ BitVec 32)) (currentBit!3725 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2608)

(declare-datatypes ((Unit!5131 0))(
  ( (Unit!5132) )
))
(declare-datatypes ((tuple2!6896 0))(
  ( (tuple2!6897 (_1!3582 Unit!5131) (_2!3582 BitStream!2608)) )
))
(declare-fun lt!124695 () tuple2!6896)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77749 (= res!64258 (= (bitIndex!0 (size!1517 (buf!1913 (_2!3582 lt!124695))) (currentByte!3730 (_2!3582 lt!124695)) (currentBit!3725 (_2!3582 lt!124695))) (bvadd (bitIndex!0 (size!1517 (buf!1913 thiss!1090)) (currentByte!3730 thiss!1090) (currentBit!3725 thiss!1090)) nBits!322)))))

(declare-fun b!77750 () Bool)

(declare-datatypes ((tuple2!6898 0))(
  ( (tuple2!6899 (_1!3583 BitStream!2608) (_2!3583 Bool)) )
))
(declare-fun lt!124694 () tuple2!6898)

(declare-datatypes ((tuple2!6900 0))(
  ( (tuple2!6901 (_1!3584 BitStream!2608) (_2!3584 BitStream!2608)) )
))
(declare-fun lt!124697 () tuple2!6900)

(assert (=> b!77750 (= e!50962 (not (or (not (_2!3583 lt!124694)) (not (= (_1!3583 lt!124694) (_2!3584 lt!124697))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2608 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6898)

(assert (=> b!77750 (= lt!124694 (checkBitsLoopPure!0 (_1!3584 lt!124697) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77750 (validate_offset_bits!1 ((_ sign_extend 32) (size!1517 (buf!1913 (_2!3582 lt!124695)))) ((_ sign_extend 32) (currentByte!3730 thiss!1090)) ((_ sign_extend 32) (currentBit!3725 thiss!1090)) nBits!322)))

(declare-fun lt!124701 () Unit!5131)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2608 array!3266 (_ BitVec 64)) Unit!5131)

(assert (=> b!77750 (= lt!124701 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1913 (_2!3582 lt!124695)) nBits!322))))

(declare-fun reader!0 (BitStream!2608 BitStream!2608) tuple2!6900)

(assert (=> b!77750 (= lt!124697 (reader!0 thiss!1090 (_2!3582 lt!124695)))))

(declare-fun b!77751 () Bool)

(declare-fun e!50961 () Bool)

(assert (=> b!77751 (= e!50961 (not true))))

(declare-fun lt!124696 () tuple2!6900)

(assert (=> b!77751 (= lt!124696 (reader!0 thiss!1090 (_2!3582 lt!124695)))))

(declare-fun lt!124700 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2608 BitStream!2608) Bool)

(assert (=> b!77751 (= lt!124700 (isPrefixOf!0 thiss!1090 (_2!3582 lt!124695)))))

(declare-fun lt!124699 () (_ BitVec 64))

(assert (=> b!77751 (= lt!124699 (bitIndex!0 (size!1517 (buf!1913 (_2!3582 lt!124695))) (currentByte!3730 (_2!3582 lt!124695)) (currentBit!3725 (_2!3582 lt!124695))))))

(declare-fun lt!124698 () (_ BitVec 64))

(assert (=> b!77751 (= lt!124698 (bitIndex!0 (size!1517 (buf!1913 thiss!1090)) (currentByte!3730 thiss!1090) (currentBit!3725 thiss!1090)))))

(assert (=> b!77751 e!50962))

(declare-fun res!64255 () Bool)

(assert (=> b!77751 (=> (not res!64255) (not e!50962))))

(assert (=> b!77751 (= res!64255 (= (size!1517 (buf!1913 thiss!1090)) (size!1517 (buf!1913 (_2!3582 lt!124695)))))))

(declare-fun appendNBits!0 (BitStream!2608 (_ BitVec 64) Bool) tuple2!6896)

(assert (=> b!77751 (= lt!124695 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun res!64257 () Bool)

(assert (=> start!15206 (=> (not res!64257) (not e!50961))))

(assert (=> start!15206 (= res!64257 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15206 e!50961))

(assert (=> start!15206 true))

(declare-fun e!50964 () Bool)

(declare-fun inv!12 (BitStream!2608) Bool)

(assert (=> start!15206 (and (inv!12 thiss!1090) e!50964)))

(declare-fun b!77752 () Bool)

(declare-fun array_inv!1363 (array!3266) Bool)

(assert (=> b!77752 (= e!50964 (array_inv!1363 (buf!1913 thiss!1090)))))

(declare-fun b!77753 () Bool)

(declare-fun res!64254 () Bool)

(assert (=> b!77753 (=> (not res!64254) (not e!50961))))

(assert (=> b!77753 (= res!64254 (validate_offset_bits!1 ((_ sign_extend 32) (size!1517 (buf!1913 thiss!1090))) ((_ sign_extend 32) (currentByte!3730 thiss!1090)) ((_ sign_extend 32) (currentBit!3725 thiss!1090)) nBits!322))))

(declare-fun b!77754 () Bool)

(declare-fun res!64256 () Bool)

(assert (=> b!77754 (=> (not res!64256) (not e!50962))))

(assert (=> b!77754 (= res!64256 (isPrefixOf!0 thiss!1090 (_2!3582 lt!124695)))))

(assert (= (and start!15206 res!64257) b!77753))

(assert (= (and b!77753 res!64254) b!77751))

(assert (= (and b!77751 res!64255) b!77749))

(assert (= (and b!77749 res!64258) b!77754))

(assert (= (and b!77754 res!64256) b!77750))

(assert (= start!15206 b!77752))

(declare-fun m!123335 () Bool)

(assert (=> b!77750 m!123335))

(declare-fun m!123337 () Bool)

(assert (=> b!77750 m!123337))

(declare-fun m!123339 () Bool)

(assert (=> b!77750 m!123339))

(declare-fun m!123341 () Bool)

(assert (=> b!77750 m!123341))

(declare-fun m!123343 () Bool)

(assert (=> b!77749 m!123343))

(declare-fun m!123345 () Bool)

(assert (=> b!77749 m!123345))

(declare-fun m!123347 () Bool)

(assert (=> b!77753 m!123347))

(declare-fun m!123349 () Bool)

(assert (=> start!15206 m!123349))

(declare-fun m!123351 () Bool)

(assert (=> b!77754 m!123351))

(assert (=> b!77751 m!123343))

(assert (=> b!77751 m!123341))

(assert (=> b!77751 m!123345))

(assert (=> b!77751 m!123351))

(declare-fun m!123353 () Bool)

(assert (=> b!77751 m!123353))

(declare-fun m!123355 () Bool)

(assert (=> b!77752 m!123355))

(push 1)

(assert (not start!15206))

(assert (not b!77754))

(assert (not b!77750))

(assert (not b!77753))

(assert (not b!77751))

(assert (not b!77752))

(assert (not b!77749))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

