; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15060 () Bool)

(assert start!15060)

(declare-fun b!77143 () Bool)

(declare-fun e!50603 () Bool)

(assert (=> b!77143 (= e!50603 (not true))))

(declare-datatypes ((array!3222 0))(
  ( (array!3223 (arr!2099 (Array (_ BitVec 32) (_ BitVec 8))) (size!1498 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2570 0))(
  ( (BitStream!2571 (buf!1888 array!3222) (currentByte!3699 (_ BitVec 32)) (currentBit!3694 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6770 0))(
  ( (tuple2!6771 (_1!3519 BitStream!2570) (_2!3519 BitStream!2570)) )
))
(declare-fun lt!123584 () tuple2!6770)

(declare-fun thiss!1090 () BitStream!2570)

(declare-datatypes ((Unit!5087 0))(
  ( (Unit!5088) )
))
(declare-datatypes ((tuple2!6772 0))(
  ( (tuple2!6773 (_1!3520 Unit!5087) (_2!3520 BitStream!2570)) )
))
(declare-fun lt!123586 () tuple2!6772)

(declare-fun reader!0 (BitStream!2570 BitStream!2570) tuple2!6770)

(assert (=> b!77143 (= lt!123584 (reader!0 thiss!1090 (_2!3520 lt!123586)))))

(declare-fun lt!123587 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2570 BitStream!2570) Bool)

(assert (=> b!77143 (= lt!123587 (isPrefixOf!0 thiss!1090 (_2!3520 lt!123586)))))

(declare-fun lt!123583 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77143 (= lt!123583 (bitIndex!0 (size!1498 (buf!1888 (_2!3520 lt!123586))) (currentByte!3699 (_2!3520 lt!123586)) (currentBit!3694 (_2!3520 lt!123586))))))

(declare-fun lt!123582 () (_ BitVec 64))

(assert (=> b!77143 (= lt!123582 (bitIndex!0 (size!1498 (buf!1888 thiss!1090)) (currentByte!3699 thiss!1090) (currentBit!3694 thiss!1090)))))

(declare-fun e!50601 () Bool)

(assert (=> b!77143 e!50601))

(declare-fun res!63745 () Bool)

(assert (=> b!77143 (=> (not res!63745) (not e!50601))))

(assert (=> b!77143 (= res!63745 (= (size!1498 (buf!1888 thiss!1090)) (size!1498 (buf!1888 (_2!3520 lt!123586)))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun appendNBits!0 (BitStream!2570 (_ BitVec 64) Bool) tuple2!6772)

(assert (=> b!77143 (= lt!123586 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77144 () Bool)

(declare-fun e!50602 () Bool)

(declare-fun array_inv!1344 (array!3222) Bool)

(assert (=> b!77144 (= e!50602 (array_inv!1344 (buf!1888 thiss!1090)))))

(declare-fun b!77145 () Bool)

(declare-fun res!63744 () Bool)

(assert (=> b!77145 (=> (not res!63744) (not e!50603))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77145 (= res!63744 (validate_offset_bits!1 ((_ sign_extend 32) (size!1498 (buf!1888 thiss!1090))) ((_ sign_extend 32) (currentByte!3699 thiss!1090)) ((_ sign_extend 32) (currentBit!3694 thiss!1090)) nBits!322))))

(declare-fun b!77146 () Bool)

(declare-fun res!63742 () Bool)

(assert (=> b!77146 (=> (not res!63742) (not e!50601))))

(assert (=> b!77146 (= res!63742 (isPrefixOf!0 thiss!1090 (_2!3520 lt!123586)))))

(declare-fun b!77147 () Bool)

(declare-datatypes ((tuple2!6774 0))(
  ( (tuple2!6775 (_1!3521 BitStream!2570) (_2!3521 Bool)) )
))
(declare-fun lt!123581 () tuple2!6774)

(declare-fun lt!123588 () tuple2!6770)

(assert (=> b!77147 (= e!50601 (not (or (not (_2!3521 lt!123581)) (not (= (_1!3521 lt!123581) (_2!3519 lt!123588))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2570 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6774)

(assert (=> b!77147 (= lt!123581 (checkBitsLoopPure!0 (_1!3519 lt!123588) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77147 (validate_offset_bits!1 ((_ sign_extend 32) (size!1498 (buf!1888 (_2!3520 lt!123586)))) ((_ sign_extend 32) (currentByte!3699 thiss!1090)) ((_ sign_extend 32) (currentBit!3694 thiss!1090)) nBits!322)))

(declare-fun lt!123585 () Unit!5087)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2570 array!3222 (_ BitVec 64)) Unit!5087)

(assert (=> b!77147 (= lt!123585 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1888 (_2!3520 lt!123586)) nBits!322))))

(assert (=> b!77147 (= lt!123588 (reader!0 thiss!1090 (_2!3520 lt!123586)))))

(declare-fun b!77148 () Bool)

(declare-fun res!63741 () Bool)

(assert (=> b!77148 (=> (not res!63741) (not e!50601))))

(assert (=> b!77148 (= res!63741 (= (bitIndex!0 (size!1498 (buf!1888 (_2!3520 lt!123586))) (currentByte!3699 (_2!3520 lt!123586)) (currentBit!3694 (_2!3520 lt!123586))) (bvadd (bitIndex!0 (size!1498 (buf!1888 thiss!1090)) (currentByte!3699 thiss!1090) (currentBit!3694 thiss!1090)) nBits!322)))))

(declare-fun res!63743 () Bool)

(assert (=> start!15060 (=> (not res!63743) (not e!50603))))

(assert (=> start!15060 (= res!63743 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15060 e!50603))

(assert (=> start!15060 true))

(declare-fun inv!12 (BitStream!2570) Bool)

(assert (=> start!15060 (and (inv!12 thiss!1090) e!50602)))

(assert (= (and start!15060 res!63743) b!77145))

(assert (= (and b!77145 res!63744) b!77143))

(assert (= (and b!77143 res!63745) b!77148))

(assert (= (and b!77148 res!63741) b!77146))

(assert (= (and b!77146 res!63742) b!77147))

(assert (= start!15060 b!77144))

(declare-fun m!122545 () Bool)

(assert (=> b!77147 m!122545))

(declare-fun m!122547 () Bool)

(assert (=> b!77147 m!122547))

(declare-fun m!122549 () Bool)

(assert (=> b!77147 m!122549))

(declare-fun m!122551 () Bool)

(assert (=> b!77147 m!122551))

(declare-fun m!122553 () Bool)

(assert (=> b!77146 m!122553))

(declare-fun m!122555 () Bool)

(assert (=> b!77148 m!122555))

(declare-fun m!122557 () Bool)

(assert (=> b!77148 m!122557))

(declare-fun m!122559 () Bool)

(assert (=> b!77145 m!122559))

(declare-fun m!122561 () Bool)

(assert (=> b!77144 m!122561))

(assert (=> b!77143 m!122557))

(assert (=> b!77143 m!122551))

(declare-fun m!122563 () Bool)

(assert (=> b!77143 m!122563))

(assert (=> b!77143 m!122553))

(assert (=> b!77143 m!122555))

(declare-fun m!122565 () Bool)

(assert (=> start!15060 m!122565))

(push 1)

(assert (not start!15060))

(assert (not b!77148))

(assert (not b!77145))

(assert (not b!77147))

(assert (not b!77146))

(assert (not b!77143))

(assert (not b!77144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

