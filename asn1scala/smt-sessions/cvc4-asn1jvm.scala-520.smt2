; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15210 () Bool)

(assert start!15210)

(declare-fun b!77785 () Bool)

(declare-fun e!50988 () Bool)

(declare-datatypes ((array!3270 0))(
  ( (array!3271 (arr!2120 (Array (_ BitVec 32) (_ BitVec 8))) (size!1519 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2612 0))(
  ( (BitStream!2613 (buf!1915 array!3270) (currentByte!3732 (_ BitVec 32)) (currentBit!3727 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6908 0))(
  ( (tuple2!6909 (_1!3588 BitStream!2612) (_2!3588 Bool)) )
))
(declare-fun lt!124745 () tuple2!6908)

(declare-datatypes ((tuple2!6910 0))(
  ( (tuple2!6911 (_1!3589 BitStream!2612) (_2!3589 BitStream!2612)) )
))
(declare-fun lt!124748 () tuple2!6910)

(assert (=> b!77785 (= e!50988 (not (or (not (_2!3588 lt!124745)) (not (= (_1!3588 lt!124745) (_2!3589 lt!124748))))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!2612 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6908)

(assert (=> b!77785 (= lt!124745 (checkBitsLoopPure!0 (_1!3589 lt!124748) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!5135 0))(
  ( (Unit!5136) )
))
(declare-datatypes ((tuple2!6912 0))(
  ( (tuple2!6913 (_1!3590 Unit!5135) (_2!3590 BitStream!2612)) )
))
(declare-fun lt!124749 () tuple2!6912)

(declare-fun thiss!1090 () BitStream!2612)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77785 (validate_offset_bits!1 ((_ sign_extend 32) (size!1519 (buf!1915 (_2!3590 lt!124749)))) ((_ sign_extend 32) (currentByte!3732 thiss!1090)) ((_ sign_extend 32) (currentBit!3727 thiss!1090)) nBits!322)))

(declare-fun lt!124747 () Unit!5135)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2612 array!3270 (_ BitVec 64)) Unit!5135)

(assert (=> b!77785 (= lt!124747 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1915 (_2!3590 lt!124749)) nBits!322))))

(declare-fun reader!0 (BitStream!2612 BitStream!2612) tuple2!6910)

(assert (=> b!77785 (= lt!124748 (reader!0 thiss!1090 (_2!3590 lt!124749)))))

(declare-fun b!77786 () Bool)

(declare-fun res!64287 () Bool)

(assert (=> b!77786 (=> (not res!64287) (not e!50988))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77786 (= res!64287 (= (bitIndex!0 (size!1519 (buf!1915 (_2!3590 lt!124749))) (currentByte!3732 (_2!3590 lt!124749)) (currentBit!3727 (_2!3590 lt!124749))) (bvadd (bitIndex!0 (size!1519 (buf!1915 thiss!1090)) (currentByte!3732 thiss!1090) (currentBit!3727 thiss!1090)) nBits!322)))))

(declare-fun res!64286 () Bool)

(declare-fun e!50985 () Bool)

(assert (=> start!15210 (=> (not res!64286) (not e!50985))))

(assert (=> start!15210 (= res!64286 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15210 e!50985))

(assert (=> start!15210 true))

(declare-fun e!50987 () Bool)

(declare-fun inv!12 (BitStream!2612) Bool)

(assert (=> start!15210 (and (inv!12 thiss!1090) e!50987)))

(declare-fun b!77787 () Bool)

(assert (=> b!77787 (= e!50985 (not true))))

(declare-fun lt!124743 () tuple2!6910)

(assert (=> b!77787 (= lt!124743 (reader!0 thiss!1090 (_2!3590 lt!124749)))))

(declare-fun lt!124744 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2612 BitStream!2612) Bool)

(assert (=> b!77787 (= lt!124744 (isPrefixOf!0 thiss!1090 (_2!3590 lt!124749)))))

(declare-fun lt!124742 () (_ BitVec 64))

(assert (=> b!77787 (= lt!124742 (bitIndex!0 (size!1519 (buf!1915 (_2!3590 lt!124749))) (currentByte!3732 (_2!3590 lt!124749)) (currentBit!3727 (_2!3590 lt!124749))))))

(declare-fun lt!124746 () (_ BitVec 64))

(assert (=> b!77787 (= lt!124746 (bitIndex!0 (size!1519 (buf!1915 thiss!1090)) (currentByte!3732 thiss!1090) (currentBit!3727 thiss!1090)))))

(assert (=> b!77787 e!50988))

(declare-fun res!64285 () Bool)

(assert (=> b!77787 (=> (not res!64285) (not e!50988))))

(assert (=> b!77787 (= res!64285 (= (size!1519 (buf!1915 thiss!1090)) (size!1519 (buf!1915 (_2!3590 lt!124749)))))))

(declare-fun appendNBits!0 (BitStream!2612 (_ BitVec 64) Bool) tuple2!6912)

(assert (=> b!77787 (= lt!124749 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77788 () Bool)

(declare-fun res!64284 () Bool)

(assert (=> b!77788 (=> (not res!64284) (not e!50988))))

(assert (=> b!77788 (= res!64284 (isPrefixOf!0 thiss!1090 (_2!3590 lt!124749)))))

(declare-fun b!77789 () Bool)

(declare-fun array_inv!1365 (array!3270) Bool)

(assert (=> b!77789 (= e!50987 (array_inv!1365 (buf!1915 thiss!1090)))))

(declare-fun b!77790 () Bool)

(declare-fun res!64288 () Bool)

(assert (=> b!77790 (=> (not res!64288) (not e!50985))))

(assert (=> b!77790 (= res!64288 (validate_offset_bits!1 ((_ sign_extend 32) (size!1519 (buf!1915 thiss!1090))) ((_ sign_extend 32) (currentByte!3732 thiss!1090)) ((_ sign_extend 32) (currentBit!3727 thiss!1090)) nBits!322))))

(assert (= (and start!15210 res!64286) b!77790))

(assert (= (and b!77790 res!64288) b!77787))

(assert (= (and b!77787 res!64285) b!77786))

(assert (= (and b!77786 res!64287) b!77788))

(assert (= (and b!77788 res!64284) b!77785))

(assert (= start!15210 b!77789))

(declare-fun m!123379 () Bool)

(assert (=> b!77788 m!123379))

(declare-fun m!123381 () Bool)

(assert (=> b!77785 m!123381))

(declare-fun m!123383 () Bool)

(assert (=> b!77785 m!123383))

(declare-fun m!123385 () Bool)

(assert (=> b!77785 m!123385))

(declare-fun m!123387 () Bool)

(assert (=> b!77785 m!123387))

(declare-fun m!123389 () Bool)

(assert (=> b!77786 m!123389))

(declare-fun m!123391 () Bool)

(assert (=> b!77786 m!123391))

(assert (=> b!77787 m!123387))

(assert (=> b!77787 m!123379))

(assert (=> b!77787 m!123391))

(declare-fun m!123393 () Bool)

(assert (=> b!77787 m!123393))

(assert (=> b!77787 m!123389))

(declare-fun m!123395 () Bool)

(assert (=> start!15210 m!123395))

(declare-fun m!123397 () Bool)

(assert (=> b!77790 m!123397))

(declare-fun m!123399 () Bool)

(assert (=> b!77789 m!123399))

(push 1)

(assert (not b!77788))

(assert (not b!77787))

(assert (not b!77786))

(assert (not b!77785))

(assert (not b!77789))

(assert (not start!15210))

(assert (not b!77790))

(check-sat)

(pop 1)

(push 1)

