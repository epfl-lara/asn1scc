; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15072 () Bool)

(assert start!15072)

(declare-fun b!77251 () Bool)

(declare-fun res!63833 () Bool)

(declare-fun e!50675 () Bool)

(assert (=> b!77251 (=> (not res!63833) (not e!50675))))

(declare-datatypes ((array!3234 0))(
  ( (array!3235 (arr!2105 (Array (_ BitVec 32) (_ BitVec 8))) (size!1504 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2582 0))(
  ( (BitStream!2583 (buf!1894 array!3234) (currentByte!3705 (_ BitVec 32)) (currentBit!3700 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2582)

(declare-datatypes ((Unit!5099 0))(
  ( (Unit!5100) )
))
(declare-datatypes ((tuple2!6806 0))(
  ( (tuple2!6807 (_1!3537 Unit!5099) (_2!3537 BitStream!2582)) )
))
(declare-fun lt!123742 () tuple2!6806)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77251 (= res!63833 (= (bitIndex!0 (size!1504 (buf!1894 (_2!3537 lt!123742))) (currentByte!3705 (_2!3537 lt!123742)) (currentBit!3700 (_2!3537 lt!123742))) (bvadd (bitIndex!0 (size!1504 (buf!1894 thiss!1090)) (currentByte!3705 thiss!1090) (currentBit!3700 thiss!1090)) nBits!322)))))

(declare-fun b!77252 () Bool)

(declare-fun e!50674 () Bool)

(declare-fun array_inv!1350 (array!3234) Bool)

(assert (=> b!77252 (= e!50674 (array_inv!1350 (buf!1894 thiss!1090)))))

(declare-fun res!63834 () Bool)

(declare-fun e!50676 () Bool)

(assert (=> start!15072 (=> (not res!63834) (not e!50676))))

(assert (=> start!15072 (= res!63834 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15072 e!50676))

(assert (=> start!15072 true))

(declare-fun inv!12 (BitStream!2582) Bool)

(assert (=> start!15072 (and (inv!12 thiss!1090) e!50674)))

(declare-fun b!77253 () Bool)

(declare-fun res!63835 () Bool)

(assert (=> b!77253 (=> (not res!63835) (not e!50675))))

(declare-fun isPrefixOf!0 (BitStream!2582 BitStream!2582) Bool)

(assert (=> b!77253 (= res!63835 (isPrefixOf!0 thiss!1090 (_2!3537 lt!123742)))))

(declare-fun b!77254 () Bool)

(assert (=> b!77254 (= e!50676 (not true))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77254 (validate_offset_bits!1 ((_ sign_extend 32) (size!1504 (buf!1894 (_2!3537 lt!123742)))) ((_ sign_extend 32) (currentByte!3705 thiss!1090)) ((_ sign_extend 32) (currentBit!3700 thiss!1090)) nBits!322)))

(declare-fun lt!123744 () Unit!5099)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2582 array!3234 (_ BitVec 64)) Unit!5099)

(assert (=> b!77254 (= lt!123744 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1894 (_2!3537 lt!123742)) nBits!322))))

(declare-datatypes ((tuple2!6808 0))(
  ( (tuple2!6809 (_1!3538 BitStream!2582) (_2!3538 BitStream!2582)) )
))
(declare-fun lt!123750 () tuple2!6808)

(declare-fun reader!0 (BitStream!2582 BitStream!2582) tuple2!6808)

(assert (=> b!77254 (= lt!123750 (reader!0 thiss!1090 (_2!3537 lt!123742)))))

(declare-fun lt!123743 () Bool)

(assert (=> b!77254 (= lt!123743 (isPrefixOf!0 thiss!1090 (_2!3537 lt!123742)))))

(declare-fun lt!123747 () (_ BitVec 64))

(assert (=> b!77254 (= lt!123747 (bitIndex!0 (size!1504 (buf!1894 (_2!3537 lt!123742))) (currentByte!3705 (_2!3537 lt!123742)) (currentBit!3700 (_2!3537 lt!123742))))))

(declare-fun lt!123745 () (_ BitVec 64))

(assert (=> b!77254 (= lt!123745 (bitIndex!0 (size!1504 (buf!1894 thiss!1090)) (currentByte!3705 thiss!1090) (currentBit!3700 thiss!1090)))))

(assert (=> b!77254 e!50675))

(declare-fun res!63831 () Bool)

(assert (=> b!77254 (=> (not res!63831) (not e!50675))))

(assert (=> b!77254 (= res!63831 (= (size!1504 (buf!1894 thiss!1090)) (size!1504 (buf!1894 (_2!3537 lt!123742)))))))

(declare-fun appendNBits!0 (BitStream!2582 (_ BitVec 64) Bool) tuple2!6806)

(assert (=> b!77254 (= lt!123742 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77255 () Bool)

(declare-datatypes ((tuple2!6810 0))(
  ( (tuple2!6811 (_1!3539 BitStream!2582) (_2!3539 Bool)) )
))
(declare-fun lt!123749 () tuple2!6810)

(declare-fun lt!123748 () tuple2!6808)

(assert (=> b!77255 (= e!50675 (not (or (not (_2!3539 lt!123749)) (not (= (_1!3539 lt!123749) (_2!3538 lt!123748))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2582 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6810)

(assert (=> b!77255 (= lt!123749 (checkBitsLoopPure!0 (_1!3538 lt!123748) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77255 (validate_offset_bits!1 ((_ sign_extend 32) (size!1504 (buf!1894 (_2!3537 lt!123742)))) ((_ sign_extend 32) (currentByte!3705 thiss!1090)) ((_ sign_extend 32) (currentBit!3700 thiss!1090)) nBits!322)))

(declare-fun lt!123746 () Unit!5099)

(assert (=> b!77255 (= lt!123746 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1894 (_2!3537 lt!123742)) nBits!322))))

(assert (=> b!77255 (= lt!123748 (reader!0 thiss!1090 (_2!3537 lt!123742)))))

(declare-fun b!77256 () Bool)

(declare-fun res!63832 () Bool)

(assert (=> b!77256 (=> (not res!63832) (not e!50676))))

(assert (=> b!77256 (= res!63832 (validate_offset_bits!1 ((_ sign_extend 32) (size!1504 (buf!1894 thiss!1090))) ((_ sign_extend 32) (currentByte!3705 thiss!1090)) ((_ sign_extend 32) (currentBit!3700 thiss!1090)) nBits!322))))

(assert (= (and start!15072 res!63834) b!77256))

(assert (= (and b!77256 res!63832) b!77254))

(assert (= (and b!77254 res!63831) b!77251))

(assert (= (and b!77251 res!63833) b!77253))

(assert (= (and b!77253 res!63835) b!77255))

(assert (= start!15072 b!77252))

(declare-fun m!122677 () Bool)

(assert (=> b!77252 m!122677))

(declare-fun m!122679 () Bool)

(assert (=> b!77254 m!122679))

(declare-fun m!122681 () Bool)

(assert (=> b!77254 m!122681))

(declare-fun m!122683 () Bool)

(assert (=> b!77254 m!122683))

(declare-fun m!122685 () Bool)

(assert (=> b!77254 m!122685))

(declare-fun m!122687 () Bool)

(assert (=> b!77254 m!122687))

(declare-fun m!122689 () Bool)

(assert (=> b!77254 m!122689))

(declare-fun m!122691 () Bool)

(assert (=> b!77254 m!122691))

(declare-fun m!122693 () Bool)

(assert (=> b!77255 m!122693))

(assert (=> b!77255 m!122687))

(assert (=> b!77255 m!122681))

(assert (=> b!77255 m!122683))

(declare-fun m!122695 () Bool)

(assert (=> b!77256 m!122695))

(assert (=> b!77251 m!122691))

(assert (=> b!77251 m!122679))

(assert (=> b!77253 m!122689))

(declare-fun m!122697 () Bool)

(assert (=> start!15072 m!122697))

(push 1)

(assert (not start!15072))

(assert (not b!77252))

(assert (not b!77251))

(assert (not b!77253))

(assert (not b!77256))

(assert (not b!77254))

(assert (not b!77255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

