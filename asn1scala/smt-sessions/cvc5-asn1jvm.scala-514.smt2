; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15062 () Bool)

(assert start!15062)

(declare-fun b!77161 () Bool)

(declare-fun res!63756 () Bool)

(declare-fun e!50613 () Bool)

(assert (=> b!77161 (=> (not res!63756) (not e!50613))))

(declare-datatypes ((array!3224 0))(
  ( (array!3225 (arr!2100 (Array (_ BitVec 32) (_ BitVec 8))) (size!1499 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2572 0))(
  ( (BitStream!2573 (buf!1889 array!3224) (currentByte!3700 (_ BitVec 32)) (currentBit!3695 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2572)

(declare-datatypes ((Unit!5089 0))(
  ( (Unit!5090) )
))
(declare-datatypes ((tuple2!6776 0))(
  ( (tuple2!6777 (_1!3522 Unit!5089) (_2!3522 BitStream!2572)) )
))
(declare-fun lt!123608 () tuple2!6776)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77161 (= res!63756 (= (bitIndex!0 (size!1499 (buf!1889 (_2!3522 lt!123608))) (currentByte!3700 (_2!3522 lt!123608)) (currentBit!3695 (_2!3522 lt!123608))) (bvadd (bitIndex!0 (size!1499 (buf!1889 thiss!1090)) (currentByte!3700 thiss!1090) (currentBit!3695 thiss!1090)) nBits!322)))))

(declare-fun b!77162 () Bool)

(declare-datatypes ((tuple2!6778 0))(
  ( (tuple2!6779 (_1!3523 BitStream!2572) (_2!3523 Bool)) )
))
(declare-fun lt!123612 () tuple2!6778)

(declare-datatypes ((tuple2!6780 0))(
  ( (tuple2!6781 (_1!3524 BitStream!2572) (_2!3524 BitStream!2572)) )
))
(declare-fun lt!123610 () tuple2!6780)

(assert (=> b!77162 (= e!50613 (not (or (not (_2!3523 lt!123612)) (not (= (_1!3523 lt!123612) (_2!3524 lt!123610))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2572 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6778)

(assert (=> b!77162 (= lt!123612 (checkBitsLoopPure!0 (_1!3524 lt!123610) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77162 (validate_offset_bits!1 ((_ sign_extend 32) (size!1499 (buf!1889 (_2!3522 lt!123608)))) ((_ sign_extend 32) (currentByte!3700 thiss!1090)) ((_ sign_extend 32) (currentBit!3695 thiss!1090)) nBits!322)))

(declare-fun lt!123613 () Unit!5089)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2572 array!3224 (_ BitVec 64)) Unit!5089)

(assert (=> b!77162 (= lt!123613 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1889 (_2!3522 lt!123608)) nBits!322))))

(declare-fun reader!0 (BitStream!2572 BitStream!2572) tuple2!6780)

(assert (=> b!77162 (= lt!123610 (reader!0 thiss!1090 (_2!3522 lt!123608)))))

(declare-fun b!77163 () Bool)

(declare-fun res!63758 () Bool)

(declare-fun e!50616 () Bool)

(assert (=> b!77163 (=> (not res!63758) (not e!50616))))

(assert (=> b!77163 (= res!63758 (validate_offset_bits!1 ((_ sign_extend 32) (size!1499 (buf!1889 thiss!1090))) ((_ sign_extend 32) (currentByte!3700 thiss!1090)) ((_ sign_extend 32) (currentBit!3695 thiss!1090)) nBits!322))))

(declare-fun b!77164 () Bool)

(declare-fun e!50614 () Bool)

(declare-fun array_inv!1345 (array!3224) Bool)

(assert (=> b!77164 (= e!50614 (array_inv!1345 (buf!1889 thiss!1090)))))

(declare-fun res!63757 () Bool)

(assert (=> start!15062 (=> (not res!63757) (not e!50616))))

(assert (=> start!15062 (= res!63757 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15062 e!50616))

(assert (=> start!15062 true))

(declare-fun inv!12 (BitStream!2572) Bool)

(assert (=> start!15062 (and (inv!12 thiss!1090) e!50614)))

(declare-fun b!77165 () Bool)

(declare-fun res!63760 () Bool)

(assert (=> b!77165 (=> (not res!63760) (not e!50613))))

(declare-fun isPrefixOf!0 (BitStream!2572 BitStream!2572) Bool)

(assert (=> b!77165 (= res!63760 (isPrefixOf!0 thiss!1090 (_2!3522 lt!123608)))))

(declare-fun b!77166 () Bool)

(assert (=> b!77166 (= e!50616 (not true))))

(assert (=> b!77166 (validate_offset_bits!1 ((_ sign_extend 32) (size!1499 (buf!1889 (_2!3522 lt!123608)))) ((_ sign_extend 32) (currentByte!3700 thiss!1090)) ((_ sign_extend 32) (currentBit!3695 thiss!1090)) nBits!322)))

(declare-fun lt!123607 () Unit!5089)

(assert (=> b!77166 (= lt!123607 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1889 (_2!3522 lt!123608)) nBits!322))))

(declare-fun lt!123609 () tuple2!6780)

(assert (=> b!77166 (= lt!123609 (reader!0 thiss!1090 (_2!3522 lt!123608)))))

(declare-fun lt!123611 () Bool)

(assert (=> b!77166 (= lt!123611 (isPrefixOf!0 thiss!1090 (_2!3522 lt!123608)))))

(declare-fun lt!123614 () (_ BitVec 64))

(assert (=> b!77166 (= lt!123614 (bitIndex!0 (size!1499 (buf!1889 (_2!3522 lt!123608))) (currentByte!3700 (_2!3522 lt!123608)) (currentBit!3695 (_2!3522 lt!123608))))))

(declare-fun lt!123615 () (_ BitVec 64))

(assert (=> b!77166 (= lt!123615 (bitIndex!0 (size!1499 (buf!1889 thiss!1090)) (currentByte!3700 thiss!1090) (currentBit!3695 thiss!1090)))))

(assert (=> b!77166 e!50613))

(declare-fun res!63759 () Bool)

(assert (=> b!77166 (=> (not res!63759) (not e!50613))))

(assert (=> b!77166 (= res!63759 (= (size!1499 (buf!1889 thiss!1090)) (size!1499 (buf!1889 (_2!3522 lt!123608)))))))

(declare-fun appendNBits!0 (BitStream!2572 (_ BitVec 64) Bool) tuple2!6776)

(assert (=> b!77166 (= lt!123608 (appendNBits!0 thiss!1090 nBits!322 false))))

(assert (= (and start!15062 res!63757) b!77163))

(assert (= (and b!77163 res!63758) b!77166))

(assert (= (and b!77166 res!63759) b!77161))

(assert (= (and b!77161 res!63756) b!77165))

(assert (= (and b!77165 res!63760) b!77162))

(assert (= start!15062 b!77164))

(declare-fun m!122567 () Bool)

(assert (=> b!77163 m!122567))

(declare-fun m!122569 () Bool)

(assert (=> b!77165 m!122569))

(declare-fun m!122571 () Bool)

(assert (=> b!77162 m!122571))

(declare-fun m!122573 () Bool)

(assert (=> b!77162 m!122573))

(declare-fun m!122575 () Bool)

(assert (=> b!77162 m!122575))

(declare-fun m!122577 () Bool)

(assert (=> b!77162 m!122577))

(declare-fun m!122579 () Bool)

(assert (=> b!77161 m!122579))

(declare-fun m!122581 () Bool)

(assert (=> b!77161 m!122581))

(declare-fun m!122583 () Bool)

(assert (=> start!15062 m!122583))

(assert (=> b!77166 m!122577))

(assert (=> b!77166 m!122581))

(assert (=> b!77166 m!122575))

(assert (=> b!77166 m!122573))

(declare-fun m!122585 () Bool)

(assert (=> b!77166 m!122585))

(assert (=> b!77166 m!122569))

(assert (=> b!77166 m!122579))

(declare-fun m!122587 () Bool)

(assert (=> b!77164 m!122587))

(push 1)

(assert (not b!77165))

(assert (not b!77164))

(assert (not b!77163))

(assert (not b!77161))

(assert (not start!15062))

(assert (not b!77166))

(assert (not b!77162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

