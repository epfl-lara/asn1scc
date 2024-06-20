; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15204 () Bool)

(assert start!15204)

(declare-fun b!77731 () Bool)

(declare-fun res!64242 () Bool)

(declare-fun e!50949 () Bool)

(assert (=> b!77731 (=> (not res!64242) (not e!50949))))

(declare-datatypes ((array!3264 0))(
  ( (array!3265 (arr!2117 (Array (_ BitVec 32) (_ BitVec 8))) (size!1516 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2606 0))(
  ( (BitStream!2607 (buf!1912 array!3264) (currentByte!3729 (_ BitVec 32)) (currentBit!3724 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2606)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77731 (= res!64242 (validate_offset_bits!1 ((_ sign_extend 32) (size!1516 (buf!1912 thiss!1090))) ((_ sign_extend 32) (currentByte!3729 thiss!1090)) ((_ sign_extend 32) (currentBit!3724 thiss!1090)) nBits!322))))

(declare-fun b!77732 () Bool)

(declare-fun res!64241 () Bool)

(declare-fun e!50952 () Bool)

(assert (=> b!77732 (=> (not res!64241) (not e!50952))))

(declare-datatypes ((Unit!5129 0))(
  ( (Unit!5130) )
))
(declare-datatypes ((tuple2!6890 0))(
  ( (tuple2!6891 (_1!3579 Unit!5129) (_2!3579 BitStream!2606)) )
))
(declare-fun lt!124677 () tuple2!6890)

(declare-fun isPrefixOf!0 (BitStream!2606 BitStream!2606) Bool)

(assert (=> b!77732 (= res!64241 (isPrefixOf!0 thiss!1090 (_2!3579 lt!124677)))))

(declare-fun b!77733 () Bool)

(declare-datatypes ((tuple2!6892 0))(
  ( (tuple2!6893 (_1!3580 BitStream!2606) (_2!3580 Bool)) )
))
(declare-fun lt!124671 () tuple2!6892)

(declare-datatypes ((tuple2!6894 0))(
  ( (tuple2!6895 (_1!3581 BitStream!2606) (_2!3581 BitStream!2606)) )
))
(declare-fun lt!124672 () tuple2!6894)

(assert (=> b!77733 (= e!50952 (not (or (not (_2!3580 lt!124671)) (not (= (_1!3580 lt!124671) (_2!3581 lt!124672))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2606 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6892)

(assert (=> b!77733 (= lt!124671 (checkBitsLoopPure!0 (_1!3581 lt!124672) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77733 (validate_offset_bits!1 ((_ sign_extend 32) (size!1516 (buf!1912 (_2!3579 lt!124677)))) ((_ sign_extend 32) (currentByte!3729 thiss!1090)) ((_ sign_extend 32) (currentBit!3724 thiss!1090)) nBits!322)))

(declare-fun lt!124673 () Unit!5129)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2606 array!3264 (_ BitVec 64)) Unit!5129)

(assert (=> b!77733 (= lt!124673 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1912 (_2!3579 lt!124677)) nBits!322))))

(declare-fun reader!0 (BitStream!2606 BitStream!2606) tuple2!6894)

(assert (=> b!77733 (= lt!124672 (reader!0 thiss!1090 (_2!3579 lt!124677)))))

(declare-fun b!77734 () Bool)

(declare-fun e!50951 () Bool)

(declare-fun array_inv!1362 (array!3264) Bool)

(assert (=> b!77734 (= e!50951 (array_inv!1362 (buf!1912 thiss!1090)))))

(declare-fun b!77735 () Bool)

(declare-fun res!64240 () Bool)

(assert (=> b!77735 (=> (not res!64240) (not e!50952))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77735 (= res!64240 (= (bitIndex!0 (size!1516 (buf!1912 (_2!3579 lt!124677))) (currentByte!3729 (_2!3579 lt!124677)) (currentBit!3724 (_2!3579 lt!124677))) (bvadd (bitIndex!0 (size!1516 (buf!1912 thiss!1090)) (currentByte!3729 thiss!1090) (currentBit!3724 thiss!1090)) nBits!322)))))

(declare-fun res!64239 () Bool)

(assert (=> start!15204 (=> (not res!64239) (not e!50949))))

(assert (=> start!15204 (= res!64239 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15204 e!50949))

(assert (=> start!15204 true))

(declare-fun inv!12 (BitStream!2606) Bool)

(assert (=> start!15204 (and (inv!12 thiss!1090) e!50951)))

(declare-fun b!77736 () Bool)

(assert (=> b!77736 (= e!50949 (not true))))

(declare-fun lt!124670 () tuple2!6894)

(assert (=> b!77736 (= lt!124670 (reader!0 thiss!1090 (_2!3579 lt!124677)))))

(declare-fun lt!124674 () Bool)

(assert (=> b!77736 (= lt!124674 (isPrefixOf!0 thiss!1090 (_2!3579 lt!124677)))))

(declare-fun lt!124675 () (_ BitVec 64))

(assert (=> b!77736 (= lt!124675 (bitIndex!0 (size!1516 (buf!1912 (_2!3579 lt!124677))) (currentByte!3729 (_2!3579 lt!124677)) (currentBit!3724 (_2!3579 lt!124677))))))

(declare-fun lt!124676 () (_ BitVec 64))

(assert (=> b!77736 (= lt!124676 (bitIndex!0 (size!1516 (buf!1912 thiss!1090)) (currentByte!3729 thiss!1090) (currentBit!3724 thiss!1090)))))

(assert (=> b!77736 e!50952))

(declare-fun res!64243 () Bool)

(assert (=> b!77736 (=> (not res!64243) (not e!50952))))

(assert (=> b!77736 (= res!64243 (= (size!1516 (buf!1912 thiss!1090)) (size!1516 (buf!1912 (_2!3579 lt!124677)))))))

(declare-fun appendNBits!0 (BitStream!2606 (_ BitVec 64) Bool) tuple2!6890)

(assert (=> b!77736 (= lt!124677 (appendNBits!0 thiss!1090 nBits!322 false))))

(assert (= (and start!15204 res!64239) b!77731))

(assert (= (and b!77731 res!64242) b!77736))

(assert (= (and b!77736 res!64243) b!77735))

(assert (= (and b!77735 res!64240) b!77732))

(assert (= (and b!77732 res!64241) b!77733))

(assert (= start!15204 b!77734))

(declare-fun m!123313 () Bool)

(assert (=> start!15204 m!123313))

(declare-fun m!123315 () Bool)

(assert (=> b!77733 m!123315))

(declare-fun m!123317 () Bool)

(assert (=> b!77733 m!123317))

(declare-fun m!123319 () Bool)

(assert (=> b!77733 m!123319))

(declare-fun m!123321 () Bool)

(assert (=> b!77733 m!123321))

(declare-fun m!123323 () Bool)

(assert (=> b!77732 m!123323))

(declare-fun m!123325 () Bool)

(assert (=> b!77731 m!123325))

(assert (=> b!77736 m!123323))

(declare-fun m!123327 () Bool)

(assert (=> b!77736 m!123327))

(declare-fun m!123329 () Bool)

(assert (=> b!77736 m!123329))

(declare-fun m!123331 () Bool)

(assert (=> b!77736 m!123331))

(assert (=> b!77736 m!123321))

(declare-fun m!123333 () Bool)

(assert (=> b!77734 m!123333))

(assert (=> b!77735 m!123329))

(assert (=> b!77735 m!123327))

(push 1)

(assert (not b!77736))

(assert (not b!77734))

(assert (not b!77731))

(assert (not start!15204))

(assert (not b!77732))

(assert (not b!77735))

(assert (not b!77733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

