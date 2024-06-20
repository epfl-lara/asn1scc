; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15198 () Bool)

(assert start!15198)

(declare-fun b!77677 () Bool)

(declare-fun e!50913 () Bool)

(declare-datatypes ((array!3258 0))(
  ( (array!3259 (arr!2114 (Array (_ BitVec 32) (_ BitVec 8))) (size!1513 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2600 0))(
  ( (BitStream!2601 (buf!1909 array!3258) (currentByte!3726 (_ BitVec 32)) (currentBit!3721 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6872 0))(
  ( (tuple2!6873 (_1!3570 BitStream!2600) (_2!3570 Bool)) )
))
(declare-fun lt!124600 () tuple2!6872)

(declare-datatypes ((tuple2!6874 0))(
  ( (tuple2!6875 (_1!3571 BitStream!2600) (_2!3571 BitStream!2600)) )
))
(declare-fun lt!124603 () tuple2!6874)

(assert (=> b!77677 (= e!50913 (not (or (not (_2!3570 lt!124600)) (not (= (_1!3570 lt!124600) (_2!3571 lt!124603))))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!2600 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6872)

(assert (=> b!77677 (= lt!124600 (checkBitsLoopPure!0 (_1!3571 lt!124603) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!5123 0))(
  ( (Unit!5124) )
))
(declare-datatypes ((tuple2!6876 0))(
  ( (tuple2!6877 (_1!3572 Unit!5123) (_2!3572 BitStream!2600)) )
))
(declare-fun lt!124601 () tuple2!6876)

(declare-fun thiss!1090 () BitStream!2600)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77677 (validate_offset_bits!1 ((_ sign_extend 32) (size!1513 (buf!1909 (_2!3572 lt!124601)))) ((_ sign_extend 32) (currentByte!3726 thiss!1090)) ((_ sign_extend 32) (currentBit!3721 thiss!1090)) nBits!322)))

(declare-fun lt!124598 () Unit!5123)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2600 array!3258 (_ BitVec 64)) Unit!5123)

(assert (=> b!77677 (= lt!124598 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1909 (_2!3572 lt!124601)) nBits!322))))

(declare-fun reader!0 (BitStream!2600 BitStream!2600) tuple2!6874)

(assert (=> b!77677 (= lt!124603 (reader!0 thiss!1090 (_2!3572 lt!124601)))))

(declare-fun res!64198 () Bool)

(declare-fun e!50915 () Bool)

(assert (=> start!15198 (=> (not res!64198) (not e!50915))))

(assert (=> start!15198 (= res!64198 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15198 e!50915))

(assert (=> start!15198 true))

(declare-fun e!50916 () Bool)

(declare-fun inv!12 (BitStream!2600) Bool)

(assert (=> start!15198 (and (inv!12 thiss!1090) e!50916)))

(declare-fun b!77678 () Bool)

(declare-fun res!64195 () Bool)

(assert (=> b!77678 (=> (not res!64195) (not e!50915))))

(assert (=> b!77678 (= res!64195 (validate_offset_bits!1 ((_ sign_extend 32) (size!1513 (buf!1909 thiss!1090))) ((_ sign_extend 32) (currentByte!3726 thiss!1090)) ((_ sign_extend 32) (currentBit!3721 thiss!1090)) nBits!322))))

(declare-fun b!77679 () Bool)

(declare-fun res!64194 () Bool)

(assert (=> b!77679 (=> (not res!64194) (not e!50913))))

(declare-fun isPrefixOf!0 (BitStream!2600 BitStream!2600) Bool)

(assert (=> b!77679 (= res!64194 (isPrefixOf!0 thiss!1090 (_2!3572 lt!124601)))))

(declare-fun b!77680 () Bool)

(declare-fun res!64196 () Bool)

(assert (=> b!77680 (=> (not res!64196) (not e!50913))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77680 (= res!64196 (= (bitIndex!0 (size!1513 (buf!1909 (_2!3572 lt!124601))) (currentByte!3726 (_2!3572 lt!124601)) (currentBit!3721 (_2!3572 lt!124601))) (bvadd (bitIndex!0 (size!1513 (buf!1909 thiss!1090)) (currentByte!3726 thiss!1090) (currentBit!3721 thiss!1090)) nBits!322)))))

(declare-fun b!77681 () Bool)

(declare-fun array_inv!1359 (array!3258) Bool)

(assert (=> b!77681 (= e!50916 (array_inv!1359 (buf!1909 thiss!1090)))))

(declare-fun b!77682 () Bool)

(assert (=> b!77682 (= e!50915 (not true))))

(declare-fun lt!124604 () tuple2!6874)

(assert (=> b!77682 (= lt!124604 (reader!0 thiss!1090 (_2!3572 lt!124601)))))

(declare-fun lt!124605 () Bool)

(assert (=> b!77682 (= lt!124605 (isPrefixOf!0 thiss!1090 (_2!3572 lt!124601)))))

(declare-fun lt!124602 () (_ BitVec 64))

(assert (=> b!77682 (= lt!124602 (bitIndex!0 (size!1513 (buf!1909 (_2!3572 lt!124601))) (currentByte!3726 (_2!3572 lt!124601)) (currentBit!3721 (_2!3572 lt!124601))))))

(declare-fun lt!124599 () (_ BitVec 64))

(assert (=> b!77682 (= lt!124599 (bitIndex!0 (size!1513 (buf!1909 thiss!1090)) (currentByte!3726 thiss!1090) (currentBit!3721 thiss!1090)))))

(assert (=> b!77682 e!50913))

(declare-fun res!64197 () Bool)

(assert (=> b!77682 (=> (not res!64197) (not e!50913))))

(assert (=> b!77682 (= res!64197 (= (size!1513 (buf!1909 thiss!1090)) (size!1513 (buf!1909 (_2!3572 lt!124601)))))))

(declare-fun appendNBits!0 (BitStream!2600 (_ BitVec 64) Bool) tuple2!6876)

(assert (=> b!77682 (= lt!124601 (appendNBits!0 thiss!1090 nBits!322 false))))

(assert (= (and start!15198 res!64198) b!77678))

(assert (= (and b!77678 res!64195) b!77682))

(assert (= (and b!77682 res!64197) b!77680))

(assert (= (and b!77680 res!64196) b!77679))

(assert (= (and b!77679 res!64194) b!77677))

(assert (= start!15198 b!77681))

(declare-fun m!123247 () Bool)

(assert (=> b!77678 m!123247))

(declare-fun m!123249 () Bool)

(assert (=> b!77681 m!123249))

(declare-fun m!123251 () Bool)

(assert (=> b!77677 m!123251))

(declare-fun m!123253 () Bool)

(assert (=> b!77677 m!123253))

(declare-fun m!123255 () Bool)

(assert (=> b!77677 m!123255))

(declare-fun m!123257 () Bool)

(assert (=> b!77677 m!123257))

(declare-fun m!123259 () Bool)

(assert (=> start!15198 m!123259))

(declare-fun m!123261 () Bool)

(assert (=> b!77679 m!123261))

(declare-fun m!123263 () Bool)

(assert (=> b!77680 m!123263))

(declare-fun m!123265 () Bool)

(assert (=> b!77680 m!123265))

(declare-fun m!123267 () Bool)

(assert (=> b!77682 m!123267))

(assert (=> b!77682 m!123263))

(assert (=> b!77682 m!123261))

(assert (=> b!77682 m!123257))

(assert (=> b!77682 m!123265))

(push 1)

(assert (not b!77677))

(assert (not b!77680))

(assert (not b!77681))

(assert (not b!77679))

(assert (not b!77682))

(assert (not b!77678))

(assert (not start!15198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

