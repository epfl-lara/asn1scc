; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20586 () Bool)

(assert start!20586)

(declare-fun b!103771 () Bool)

(declare-fun e!67931 () Bool)

(declare-datatypes ((array!4844 0))(
  ( (array!4845 (arr!2803 (Array (_ BitVec 32) (_ BitVec 8))) (size!2210 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3894 0))(
  ( (BitStream!3895 (buf!2576 array!4844) (currentByte!5061 (_ BitVec 32)) (currentBit!5056 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8526 0))(
  ( (tuple2!8527 (_1!4518 BitStream!3894) (_2!4518 Bool)) )
))
(declare-fun lt!151917 () tuple2!8526)

(declare-fun lt!151930 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103771 (= e!67931 (= (bitIndex!0 (size!2210 (buf!2576 (_1!4518 lt!151917))) (currentByte!5061 (_1!4518 lt!151917)) (currentBit!5056 (_1!4518 lt!151917))) lt!151930))))

(declare-fun b!103772 () Bool)

(declare-fun res!85397 () Bool)

(declare-fun e!67927 () Bool)

(assert (=> b!103772 (=> res!85397 e!67927)))

(declare-datatypes ((tuple2!8528 0))(
  ( (tuple2!8529 (_1!4519 BitStream!3894) (_2!4519 BitStream!3894)) )
))
(declare-fun lt!151928 () tuple2!8528)

(declare-fun lt!151918 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103772 (= res!85397 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2210 (buf!2576 (_1!4519 lt!151928)))) ((_ sign_extend 32) (currentByte!5061 (_1!4519 lt!151928))) ((_ sign_extend 32) (currentBit!5056 (_1!4519 lt!151928))) lt!151918)))))

(declare-fun b!103773 () Bool)

(declare-fun e!67935 () Bool)

(declare-fun e!67926 () Bool)

(assert (=> b!103773 (= e!67935 e!67926)))

(declare-fun res!85393 () Bool)

(assert (=> b!103773 (=> (not res!85393) (not e!67926))))

(declare-fun thiss!1305 () BitStream!3894)

(assert (=> b!103773 (= res!85393 (validate_offset_bits!1 ((_ sign_extend 32) (size!2210 (buf!2576 thiss!1305))) ((_ sign_extend 32) (currentByte!5061 thiss!1305)) ((_ sign_extend 32) (currentBit!5056 thiss!1305)) lt!151918))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!103773 (= lt!151918 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103774 () Bool)

(declare-fun e!67925 () Bool)

(declare-fun lt!151924 () tuple2!8526)

(declare-fun lt!151936 () tuple2!8526)

(assert (=> b!103774 (= e!67925 (= (_2!4518 lt!151924) (_2!4518 lt!151936)))))

(declare-fun b!103775 () Bool)

(declare-fun res!85398 () Bool)

(assert (=> b!103775 (=> res!85398 e!67927)))

(declare-fun lt!151938 () (_ BitVec 64))

(declare-fun lt!151926 () (_ BitVec 64))

(declare-fun lt!151932 () (_ BitVec 64))

(assert (=> b!103775 (= res!85398 (or (not (= (bvand lt!151932 lt!151938) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!151932 lt!151926) lt!151932))))))

(declare-fun b!103776 () Bool)

(declare-fun e!67928 () Bool)

(declare-fun array_inv!2012 (array!4844) Bool)

(assert (=> b!103776 (= e!67928 (array_inv!2012 (buf!2576 thiss!1305)))))

(declare-fun b!103777 () Bool)

(declare-fun e!67934 () Bool)

(assert (=> b!103777 (= e!67926 e!67934)))

(declare-fun res!85402 () Bool)

(assert (=> b!103777 (=> (not res!85402) (not e!67934))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!103777 (= res!85402 (and (= (bvand v!199 lt!151926) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103777 (= lt!151926 (onesLSBLong!0 nBits!396))))

(declare-fun b!103778 () Bool)

(declare-fun res!85391 () Bool)

(declare-fun e!67933 () Bool)

(assert (=> b!103778 (=> (not res!85391) (not e!67933))))

(declare-datatypes ((Unit!6364 0))(
  ( (Unit!6365) )
))
(declare-datatypes ((tuple2!8530 0))(
  ( (tuple2!8531 (_1!4520 Unit!6364) (_2!4520 BitStream!3894)) )
))
(declare-fun lt!151923 () tuple2!8530)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103778 (= res!85391 (invariant!0 (currentBit!5056 thiss!1305) (currentByte!5061 thiss!1305) (size!2210 (buf!2576 (_2!4520 lt!151923)))))))

(declare-fun b!103779 () Bool)

(assert (=> b!103779 (= e!67934 (not e!67927))))

(declare-fun res!85400 () Bool)

(assert (=> b!103779 (=> res!85400 e!67927)))

(declare-fun lt!151939 () tuple2!8528)

(declare-fun lt!151935 () (_ BitVec 64))

(declare-datatypes ((tuple2!8532 0))(
  ( (tuple2!8533 (_1!4521 BitStream!3894) (_2!4521 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8532)

(assert (=> b!103779 (= res!85400 (not (= (_1!4521 (readNLeastSignificantBitsLoopPure!0 (_1!4519 lt!151939) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151935)) (_2!4519 lt!151939))))))

(declare-fun lt!151919 () tuple2!8530)

(declare-fun lt!151927 () (_ BitVec 64))

(assert (=> b!103779 (validate_offset_bits!1 ((_ sign_extend 32) (size!2210 (buf!2576 (_2!4520 lt!151919)))) ((_ sign_extend 32) (currentByte!5061 (_2!4520 lt!151923))) ((_ sign_extend 32) (currentBit!5056 (_2!4520 lt!151923))) lt!151927)))

(declare-fun lt!151934 () Unit!6364)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3894 array!4844 (_ BitVec 64)) Unit!6364)

(assert (=> b!103779 (= lt!151934 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4520 lt!151923) (buf!2576 (_2!4520 lt!151919)) lt!151927))))

(assert (=> b!103779 (= lt!151927 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!151920 () tuple2!8526)

(declare-fun lt!151929 () (_ BitVec 64))

(assert (=> b!103779 (= lt!151935 (bvor lt!151932 (ite (_2!4518 lt!151920) lt!151929 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!151931 () tuple2!8532)

(assert (=> b!103779 (= lt!151931 (readNLeastSignificantBitsLoopPure!0 (_1!4519 lt!151928) nBits!396 i!615 lt!151932))))

(assert (=> b!103779 (validate_offset_bits!1 ((_ sign_extend 32) (size!2210 (buf!2576 (_2!4520 lt!151919)))) ((_ sign_extend 32) (currentByte!5061 thiss!1305)) ((_ sign_extend 32) (currentBit!5056 thiss!1305)) lt!151918)))

(declare-fun lt!151933 () Unit!6364)

(assert (=> b!103779 (= lt!151933 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2576 (_2!4520 lt!151919)) lt!151918))))

(assert (=> b!103779 (= lt!151932 (bvand v!199 (bvnot lt!151938)))))

(assert (=> b!103779 (= lt!151938 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!151937 () Bool)

(assert (=> b!103779 (= (_2!4518 lt!151920) lt!151937)))

(declare-fun readBitPure!0 (BitStream!3894) tuple2!8526)

(assert (=> b!103779 (= lt!151920 (readBitPure!0 (_1!4519 lt!151928)))))

(declare-fun reader!0 (BitStream!3894 BitStream!3894) tuple2!8528)

(assert (=> b!103779 (= lt!151939 (reader!0 (_2!4520 lt!151923) (_2!4520 lt!151919)))))

(assert (=> b!103779 (= lt!151928 (reader!0 thiss!1305 (_2!4520 lt!151919)))))

(assert (=> b!103779 e!67925))

(declare-fun res!85395 () Bool)

(assert (=> b!103779 (=> (not res!85395) (not e!67925))))

(assert (=> b!103779 (= res!85395 (= (bitIndex!0 (size!2210 (buf!2576 (_1!4518 lt!151924))) (currentByte!5061 (_1!4518 lt!151924)) (currentBit!5056 (_1!4518 lt!151924))) (bitIndex!0 (size!2210 (buf!2576 (_1!4518 lt!151936))) (currentByte!5061 (_1!4518 lt!151936)) (currentBit!5056 (_1!4518 lt!151936)))))))

(declare-fun lt!151921 () Unit!6364)

(declare-fun lt!151922 () BitStream!3894)

(declare-fun readBitPrefixLemma!0 (BitStream!3894 BitStream!3894) Unit!6364)

(assert (=> b!103779 (= lt!151921 (readBitPrefixLemma!0 lt!151922 (_2!4520 lt!151919)))))

(assert (=> b!103779 (= lt!151936 (readBitPure!0 (BitStream!3895 (buf!2576 (_2!4520 lt!151919)) (currentByte!5061 thiss!1305) (currentBit!5056 thiss!1305))))))

(assert (=> b!103779 (= lt!151924 (readBitPure!0 lt!151922))))

(assert (=> b!103779 (= lt!151922 (BitStream!3895 (buf!2576 (_2!4520 lt!151923)) (currentByte!5061 thiss!1305) (currentBit!5056 thiss!1305)))))

(assert (=> b!103779 e!67933))

(declare-fun res!85403 () Bool)

(assert (=> b!103779 (=> (not res!85403) (not e!67933))))

(declare-fun isPrefixOf!0 (BitStream!3894 BitStream!3894) Bool)

(assert (=> b!103779 (= res!85403 (isPrefixOf!0 thiss!1305 (_2!4520 lt!151919)))))

(declare-fun lt!151925 () Unit!6364)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3894 BitStream!3894 BitStream!3894) Unit!6364)

(assert (=> b!103779 (= lt!151925 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4520 lt!151923) (_2!4520 lt!151919)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3894 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8530)

(assert (=> b!103779 (= lt!151919 (appendNLeastSignificantBitsLoop!0 (_2!4520 lt!151923) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!67929 () Bool)

(assert (=> b!103779 e!67929))

(declare-fun res!85394 () Bool)

(assert (=> b!103779 (=> (not res!85394) (not e!67929))))

(assert (=> b!103779 (= res!85394 (= (size!2210 (buf!2576 thiss!1305)) (size!2210 (buf!2576 (_2!4520 lt!151923)))))))

(declare-fun appendBit!0 (BitStream!3894 Bool) tuple2!8530)

(assert (=> b!103779 (= lt!151923 (appendBit!0 thiss!1305 lt!151937))))

(assert (=> b!103779 (= lt!151937 (not (= (bvand v!199 lt!151929) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103779 (= lt!151929 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103780 () Bool)

(assert (=> b!103780 (= e!67927 true)))

(declare-fun lt!151916 () tuple2!8532)

(declare-fun withMovedBitIndex!0 (BitStream!3894 (_ BitVec 64)) BitStream!3894)

(assert (=> b!103780 (= lt!151916 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4519 lt!151928) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151935))))

(declare-fun res!85401 () Bool)

(assert (=> start!20586 (=> (not res!85401) (not e!67935))))

(assert (=> start!20586 (= res!85401 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20586 e!67935))

(assert (=> start!20586 true))

(declare-fun inv!12 (BitStream!3894) Bool)

(assert (=> start!20586 (and (inv!12 thiss!1305) e!67928)))

(declare-fun b!103781 () Bool)

(declare-fun res!85399 () Bool)

(declare-fun e!67932 () Bool)

(assert (=> b!103781 (=> (not res!85399) (not e!67932))))

(assert (=> b!103781 (= res!85399 (isPrefixOf!0 thiss!1305 (_2!4520 lt!151923)))))

(declare-fun b!103782 () Bool)

(assert (=> b!103782 (= e!67933 (invariant!0 (currentBit!5056 thiss!1305) (currentByte!5061 thiss!1305) (size!2210 (buf!2576 (_2!4520 lt!151919)))))))

(declare-fun b!103783 () Bool)

(assert (=> b!103783 (= e!67929 e!67932)))

(declare-fun res!85392 () Bool)

(assert (=> b!103783 (=> (not res!85392) (not e!67932))))

(declare-fun lt!151915 () (_ BitVec 64))

(assert (=> b!103783 (= res!85392 (= lt!151930 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!151915)))))

(assert (=> b!103783 (= lt!151930 (bitIndex!0 (size!2210 (buf!2576 (_2!4520 lt!151923))) (currentByte!5061 (_2!4520 lt!151923)) (currentBit!5056 (_2!4520 lt!151923))))))

(assert (=> b!103783 (= lt!151915 (bitIndex!0 (size!2210 (buf!2576 thiss!1305)) (currentByte!5061 thiss!1305) (currentBit!5056 thiss!1305)))))

(declare-fun b!103784 () Bool)

(assert (=> b!103784 (= e!67932 e!67931)))

(declare-fun res!85396 () Bool)

(assert (=> b!103784 (=> (not res!85396) (not e!67931))))

(assert (=> b!103784 (= res!85396 (and (= (_2!4518 lt!151917) lt!151937) (= (_1!4518 lt!151917) (_2!4520 lt!151923))))))

(declare-fun readerFrom!0 (BitStream!3894 (_ BitVec 32) (_ BitVec 32)) BitStream!3894)

(assert (=> b!103784 (= lt!151917 (readBitPure!0 (readerFrom!0 (_2!4520 lt!151923) (currentBit!5056 thiss!1305) (currentByte!5061 thiss!1305))))))

(assert (= (and start!20586 res!85401) b!103773))

(assert (= (and b!103773 res!85393) b!103777))

(assert (= (and b!103777 res!85402) b!103779))

(assert (= (and b!103779 res!85394) b!103783))

(assert (= (and b!103783 res!85392) b!103781))

(assert (= (and b!103781 res!85399) b!103784))

(assert (= (and b!103784 res!85396) b!103771))

(assert (= (and b!103779 res!85403) b!103778))

(assert (= (and b!103778 res!85391) b!103782))

(assert (= (and b!103779 res!85395) b!103774))

(assert (= (and b!103779 (not res!85400)) b!103772))

(assert (= (and b!103772 (not res!85397)) b!103775))

(assert (= (and b!103775 (not res!85398)) b!103780))

(assert (= start!20586 b!103776))

(declare-fun m!151569 () Bool)

(assert (=> b!103771 m!151569))

(declare-fun m!151571 () Bool)

(assert (=> b!103783 m!151571))

(declare-fun m!151573 () Bool)

(assert (=> b!103783 m!151573))

(declare-fun m!151575 () Bool)

(assert (=> b!103776 m!151575))

(declare-fun m!151577 () Bool)

(assert (=> b!103784 m!151577))

(assert (=> b!103784 m!151577))

(declare-fun m!151579 () Bool)

(assert (=> b!103784 m!151579))

(declare-fun m!151581 () Bool)

(assert (=> start!20586 m!151581))

(declare-fun m!151583 () Bool)

(assert (=> b!103781 m!151583))

(declare-fun m!151585 () Bool)

(assert (=> b!103782 m!151585))

(declare-fun m!151587 () Bool)

(assert (=> b!103779 m!151587))

(declare-fun m!151589 () Bool)

(assert (=> b!103779 m!151589))

(declare-fun m!151591 () Bool)

(assert (=> b!103779 m!151591))

(declare-fun m!151593 () Bool)

(assert (=> b!103779 m!151593))

(declare-fun m!151595 () Bool)

(assert (=> b!103779 m!151595))

(declare-fun m!151597 () Bool)

(assert (=> b!103779 m!151597))

(declare-fun m!151599 () Bool)

(assert (=> b!103779 m!151599))

(declare-fun m!151601 () Bool)

(assert (=> b!103779 m!151601))

(declare-fun m!151603 () Bool)

(assert (=> b!103779 m!151603))

(declare-fun m!151605 () Bool)

(assert (=> b!103779 m!151605))

(declare-fun m!151607 () Bool)

(assert (=> b!103779 m!151607))

(declare-fun m!151609 () Bool)

(assert (=> b!103779 m!151609))

(declare-fun m!151611 () Bool)

(assert (=> b!103779 m!151611))

(declare-fun m!151613 () Bool)

(assert (=> b!103779 m!151613))

(declare-fun m!151615 () Bool)

(assert (=> b!103779 m!151615))

(declare-fun m!151617 () Bool)

(assert (=> b!103779 m!151617))

(declare-fun m!151619 () Bool)

(assert (=> b!103779 m!151619))

(declare-fun m!151621 () Bool)

(assert (=> b!103779 m!151621))

(declare-fun m!151623 () Bool)

(assert (=> b!103779 m!151623))

(declare-fun m!151625 () Bool)

(assert (=> b!103773 m!151625))

(declare-fun m!151627 () Bool)

(assert (=> b!103772 m!151627))

(declare-fun m!151629 () Bool)

(assert (=> b!103778 m!151629))

(declare-fun m!151631 () Bool)

(assert (=> b!103780 m!151631))

(assert (=> b!103780 m!151631))

(declare-fun m!151633 () Bool)

(assert (=> b!103780 m!151633))

(declare-fun m!151635 () Bool)

(assert (=> b!103777 m!151635))

(check-sat (not b!103780) (not b!103772) (not b!103781) (not b!103784) (not b!103782) (not b!103778) (not b!103777) (not start!20586) (not b!103776) (not b!103783) (not b!103773) (not b!103779) (not b!103771))
