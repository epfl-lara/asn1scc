; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15212 () Bool)

(assert start!15212)

(declare-fun b!77803 () Bool)

(declare-fun e!50997 () Bool)

(declare-datatypes ((array!3272 0))(
  ( (array!3273 (arr!2121 (Array (_ BitVec 32) (_ BitVec 8))) (size!1520 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2614 0))(
  ( (BitStream!2615 (buf!1916 array!3272) (currentByte!3733 (_ BitVec 32)) (currentBit!3728 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6914 0))(
  ( (tuple2!6915 (_1!3591 BitStream!2614) (_2!3591 Bool)) )
))
(declare-fun lt!124772 () tuple2!6914)

(declare-datatypes ((tuple2!6916 0))(
  ( (tuple2!6917 (_1!3592 BitStream!2614) (_2!3592 BitStream!2614)) )
))
(declare-fun lt!124774 () tuple2!6916)

(assert (=> b!77803 (= e!50997 (not (and (_2!3591 lt!124772) (= (_1!3591 lt!124772) (_2!3592 lt!124774)))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!2614 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6914)

(assert (=> b!77803 (= lt!124772 (checkBitsLoopPure!0 (_1!3592 lt!124774) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!5137 0))(
  ( (Unit!5138) )
))
(declare-datatypes ((tuple2!6918 0))(
  ( (tuple2!6919 (_1!3593 Unit!5137) (_2!3593 BitStream!2614)) )
))
(declare-fun lt!124776 () tuple2!6918)

(declare-fun thiss!1090 () BitStream!2614)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77803 (validate_offset_bits!1 ((_ sign_extend 32) (size!1520 (buf!1916 (_2!3593 lt!124776)))) ((_ sign_extend 32) (currentByte!3733 thiss!1090)) ((_ sign_extend 32) (currentBit!3728 thiss!1090)) nBits!322)))

(declare-fun lt!124770 () Unit!5137)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2614 array!3272 (_ BitVec 64)) Unit!5137)

(assert (=> b!77803 (= lt!124770 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1916 (_2!3593 lt!124776)) nBits!322))))

(declare-fun reader!0 (BitStream!2614 BitStream!2614) tuple2!6916)

(assert (=> b!77803 (= lt!124774 (reader!0 thiss!1090 (_2!3593 lt!124776)))))

(declare-fun lt!124771 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2614 BitStream!2614) Bool)

(assert (=> b!77803 (= lt!124771 (isPrefixOf!0 thiss!1090 (_2!3593 lt!124776)))))

(declare-fun lt!124779 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77803 (= lt!124779 (bitIndex!0 (size!1520 (buf!1916 (_2!3593 lt!124776))) (currentByte!3733 (_2!3593 lt!124776)) (currentBit!3728 (_2!3593 lt!124776))))))

(declare-fun lt!124777 () (_ BitVec 64))

(assert (=> b!77803 (= lt!124777 (bitIndex!0 (size!1520 (buf!1916 thiss!1090)) (currentByte!3733 thiss!1090) (currentBit!3728 thiss!1090)))))

(declare-fun e!51000 () Bool)

(assert (=> b!77803 e!51000))

(declare-fun res!64301 () Bool)

(assert (=> b!77803 (=> (not res!64301) (not e!51000))))

(assert (=> b!77803 (= res!64301 (= (size!1520 (buf!1916 thiss!1090)) (size!1520 (buf!1916 (_2!3593 lt!124776)))))))

(declare-fun appendNBits!0 (BitStream!2614 (_ BitVec 64) Bool) tuple2!6918)

(assert (=> b!77803 (= lt!124776 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77804 () Bool)

(declare-fun lt!124775 () tuple2!6914)

(declare-fun lt!124773 () tuple2!6916)

(assert (=> b!77804 (= e!51000 (not (or (not (_2!3591 lt!124775)) (not (= (_1!3591 lt!124775) (_2!3592 lt!124773))))))))

(assert (=> b!77804 (= lt!124775 (checkBitsLoopPure!0 (_1!3592 lt!124773) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77804 (validate_offset_bits!1 ((_ sign_extend 32) (size!1520 (buf!1916 (_2!3593 lt!124776)))) ((_ sign_extend 32) (currentByte!3733 thiss!1090)) ((_ sign_extend 32) (currentBit!3728 thiss!1090)) nBits!322)))

(declare-fun lt!124778 () Unit!5137)

(assert (=> b!77804 (= lt!124778 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1916 (_2!3593 lt!124776)) nBits!322))))

(assert (=> b!77804 (= lt!124773 (reader!0 thiss!1090 (_2!3593 lt!124776)))))

(declare-fun b!77806 () Bool)

(declare-fun res!64302 () Bool)

(assert (=> b!77806 (=> (not res!64302) (not e!51000))))

(assert (=> b!77806 (= res!64302 (isPrefixOf!0 thiss!1090 (_2!3593 lt!124776)))))

(declare-fun b!77807 () Bool)

(declare-fun res!64299 () Bool)

(assert (=> b!77807 (=> (not res!64299) (not e!51000))))

(assert (=> b!77807 (= res!64299 (= (bitIndex!0 (size!1520 (buf!1916 (_2!3593 lt!124776))) (currentByte!3733 (_2!3593 lt!124776)) (currentBit!3728 (_2!3593 lt!124776))) (bvadd (bitIndex!0 (size!1520 (buf!1916 thiss!1090)) (currentByte!3733 thiss!1090) (currentBit!3728 thiss!1090)) nBits!322)))))

(declare-fun b!77808 () Bool)

(declare-fun e!50999 () Bool)

(declare-fun array_inv!1366 (array!3272) Bool)

(assert (=> b!77808 (= e!50999 (array_inv!1366 (buf!1916 thiss!1090)))))

(declare-fun b!77805 () Bool)

(declare-fun res!64300 () Bool)

(assert (=> b!77805 (=> (not res!64300) (not e!50997))))

(assert (=> b!77805 (= res!64300 (validate_offset_bits!1 ((_ sign_extend 32) (size!1520 (buf!1916 thiss!1090))) ((_ sign_extend 32) (currentByte!3733 thiss!1090)) ((_ sign_extend 32) (currentBit!3728 thiss!1090)) nBits!322))))

(declare-fun res!64303 () Bool)

(assert (=> start!15212 (=> (not res!64303) (not e!50997))))

(assert (=> start!15212 (= res!64303 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15212 e!50997))

(assert (=> start!15212 true))

(declare-fun inv!12 (BitStream!2614) Bool)

(assert (=> start!15212 (and (inv!12 thiss!1090) e!50999)))

(assert (= (and start!15212 res!64303) b!77805))

(assert (= (and b!77805 res!64300) b!77803))

(assert (= (and b!77803 res!64301) b!77807))

(assert (= (and b!77807 res!64299) b!77806))

(assert (= (and b!77806 res!64302) b!77804))

(assert (= start!15212 b!77808))

(declare-fun m!123401 () Bool)

(assert (=> b!77808 m!123401))

(declare-fun m!123403 () Bool)

(assert (=> b!77805 m!123403))

(declare-fun m!123405 () Bool)

(assert (=> b!77803 m!123405))

(declare-fun m!123407 () Bool)

(assert (=> b!77803 m!123407))

(declare-fun m!123409 () Bool)

(assert (=> b!77803 m!123409))

(declare-fun m!123411 () Bool)

(assert (=> b!77803 m!123411))

(declare-fun m!123413 () Bool)

(assert (=> b!77803 m!123413))

(declare-fun m!123415 () Bool)

(assert (=> b!77803 m!123415))

(declare-fun m!123417 () Bool)

(assert (=> b!77803 m!123417))

(declare-fun m!123419 () Bool)

(assert (=> b!77803 m!123419))

(declare-fun m!123421 () Bool)

(assert (=> start!15212 m!123421))

(assert (=> b!77807 m!123413))

(assert (=> b!77807 m!123407))

(declare-fun m!123423 () Bool)

(assert (=> b!77804 m!123423))

(assert (=> b!77804 m!123405))

(assert (=> b!77804 m!123409))

(assert (=> b!77804 m!123419))

(assert (=> b!77806 m!123417))

(push 1)

(assert (not b!77807))

(assert (not b!77804))

(assert (not start!15212))

(assert (not b!77803))

(assert (not b!77806))

(assert (not b!77808))

(assert (not b!77805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

