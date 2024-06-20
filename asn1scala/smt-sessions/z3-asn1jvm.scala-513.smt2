; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15058 () Bool)

(assert start!15058)

(declare-fun b!77125 () Bool)

(declare-fun e!50589 () Bool)

(declare-datatypes ((array!3220 0))(
  ( (array!3221 (arr!2098 (Array (_ BitVec 32) (_ BitVec 8))) (size!1497 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2568 0))(
  ( (BitStream!2569 (buf!1887 array!3220) (currentByte!3698 (_ BitVec 32)) (currentBit!3693 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6764 0))(
  ( (tuple2!6765 (_1!3516 BitStream!2568) (_2!3516 Bool)) )
))
(declare-fun lt!123564 () tuple2!6764)

(declare-datatypes ((tuple2!6766 0))(
  ( (tuple2!6767 (_1!3517 BitStream!2568) (_2!3517 BitStream!2568)) )
))
(declare-fun lt!123561 () tuple2!6766)

(assert (=> b!77125 (= e!50589 (not (or (not (_2!3516 lt!123564)) (not (= (_1!3516 lt!123564) (_2!3517 lt!123561))))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!2568 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6764)

(assert (=> b!77125 (= lt!123564 (checkBitsLoopPure!0 (_1!3517 lt!123561) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!5085 0))(
  ( (Unit!5086) )
))
(declare-datatypes ((tuple2!6768 0))(
  ( (tuple2!6769 (_1!3518 Unit!5085) (_2!3518 BitStream!2568)) )
))
(declare-fun lt!123563 () tuple2!6768)

(declare-fun thiss!1090 () BitStream!2568)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77125 (validate_offset_bits!1 ((_ sign_extend 32) (size!1497 (buf!1887 (_2!3518 lt!123563)))) ((_ sign_extend 32) (currentByte!3698 thiss!1090)) ((_ sign_extend 32) (currentBit!3693 thiss!1090)) nBits!322)))

(declare-fun lt!123558 () Unit!5085)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2568 array!3220 (_ BitVec 64)) Unit!5085)

(assert (=> b!77125 (= lt!123558 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1887 (_2!3518 lt!123563)) nBits!322))))

(declare-fun reader!0 (BitStream!2568 BitStream!2568) tuple2!6766)

(assert (=> b!77125 (= lt!123561 (reader!0 thiss!1090 (_2!3518 lt!123563)))))

(declare-fun b!77126 () Bool)

(declare-fun res!63729 () Bool)

(assert (=> b!77126 (=> (not res!63729) (not e!50589))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77126 (= res!63729 (= (bitIndex!0 (size!1497 (buf!1887 (_2!3518 lt!123563))) (currentByte!3698 (_2!3518 lt!123563)) (currentBit!3693 (_2!3518 lt!123563))) (bvadd (bitIndex!0 (size!1497 (buf!1887 thiss!1090)) (currentByte!3698 thiss!1090) (currentBit!3693 thiss!1090)) nBits!322)))))

(declare-fun b!77127 () Bool)

(declare-fun res!63726 () Bool)

(assert (=> b!77127 (=> (not res!63726) (not e!50589))))

(declare-fun isPrefixOf!0 (BitStream!2568 BitStream!2568) Bool)

(assert (=> b!77127 (= res!63726 (isPrefixOf!0 thiss!1090 (_2!3518 lt!123563)))))

(declare-fun b!77128 () Bool)

(declare-fun res!63727 () Bool)

(declare-fun e!50590 () Bool)

(assert (=> b!77128 (=> (not res!63727) (not e!50590))))

(assert (=> b!77128 (= res!63727 (validate_offset_bits!1 ((_ sign_extend 32) (size!1497 (buf!1887 thiss!1090))) ((_ sign_extend 32) (currentByte!3698 thiss!1090)) ((_ sign_extend 32) (currentBit!3693 thiss!1090)) nBits!322))))

(declare-fun res!63730 () Bool)

(assert (=> start!15058 (=> (not res!63730) (not e!50590))))

(assert (=> start!15058 (= res!63730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15058 e!50590))

(assert (=> start!15058 true))

(declare-fun e!50591 () Bool)

(declare-fun inv!12 (BitStream!2568) Bool)

(assert (=> start!15058 (and (inv!12 thiss!1090) e!50591)))

(declare-fun b!77129 () Bool)

(declare-fun array_inv!1343 (array!3220) Bool)

(assert (=> b!77129 (= e!50591 (array_inv!1343 (buf!1887 thiss!1090)))))

(declare-fun b!77130 () Bool)

(assert (=> b!77130 (= e!50590 (not true))))

(declare-fun lt!123559 () tuple2!6766)

(assert (=> b!77130 (= lt!123559 (reader!0 thiss!1090 (_2!3518 lt!123563)))))

(declare-fun lt!123560 () Bool)

(assert (=> b!77130 (= lt!123560 (isPrefixOf!0 thiss!1090 (_2!3518 lt!123563)))))

(declare-fun lt!123557 () (_ BitVec 64))

(assert (=> b!77130 (= lt!123557 (bitIndex!0 (size!1497 (buf!1887 (_2!3518 lt!123563))) (currentByte!3698 (_2!3518 lt!123563)) (currentBit!3693 (_2!3518 lt!123563))))))

(declare-fun lt!123562 () (_ BitVec 64))

(assert (=> b!77130 (= lt!123562 (bitIndex!0 (size!1497 (buf!1887 thiss!1090)) (currentByte!3698 thiss!1090) (currentBit!3693 thiss!1090)))))

(assert (=> b!77130 e!50589))

(declare-fun res!63728 () Bool)

(assert (=> b!77130 (=> (not res!63728) (not e!50589))))

(assert (=> b!77130 (= res!63728 (= (size!1497 (buf!1887 thiss!1090)) (size!1497 (buf!1887 (_2!3518 lt!123563)))))))

(declare-fun appendNBits!0 (BitStream!2568 (_ BitVec 64) Bool) tuple2!6768)

(assert (=> b!77130 (= lt!123563 (appendNBits!0 thiss!1090 nBits!322 false))))

(assert (= (and start!15058 res!63730) b!77128))

(assert (= (and b!77128 res!63727) b!77130))

(assert (= (and b!77130 res!63728) b!77126))

(assert (= (and b!77126 res!63729) b!77127))

(assert (= (and b!77127 res!63726) b!77125))

(assert (= start!15058 b!77129))

(declare-fun m!122523 () Bool)

(assert (=> b!77127 m!122523))

(declare-fun m!122525 () Bool)

(assert (=> b!77129 m!122525))

(declare-fun m!122527 () Bool)

(assert (=> start!15058 m!122527))

(declare-fun m!122529 () Bool)

(assert (=> b!77126 m!122529))

(declare-fun m!122531 () Bool)

(assert (=> b!77126 m!122531))

(declare-fun m!122533 () Bool)

(assert (=> b!77128 m!122533))

(assert (=> b!77130 m!122523))

(assert (=> b!77130 m!122531))

(assert (=> b!77130 m!122529))

(declare-fun m!122535 () Bool)

(assert (=> b!77130 m!122535))

(declare-fun m!122537 () Bool)

(assert (=> b!77130 m!122537))

(declare-fun m!122539 () Bool)

(assert (=> b!77125 m!122539))

(declare-fun m!122541 () Bool)

(assert (=> b!77125 m!122541))

(declare-fun m!122543 () Bool)

(assert (=> b!77125 m!122543))

(assert (=> b!77125 m!122535))

(check-sat (not b!77128) (not b!77125) (not b!77127) (not b!77126) (not b!77130) (not b!77129) (not start!15058))
