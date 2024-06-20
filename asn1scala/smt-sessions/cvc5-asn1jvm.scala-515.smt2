; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15068 () Bool)

(assert start!15068)

(declare-fun b!77215 () Bool)

(declare-fun res!63804 () Bool)

(declare-fun e!50649 () Bool)

(assert (=> b!77215 (=> (not res!63804) (not e!50649))))

(declare-datatypes ((array!3230 0))(
  ( (array!3231 (arr!2103 (Array (_ BitVec 32) (_ BitVec 8))) (size!1502 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2578 0))(
  ( (BitStream!2579 (buf!1892 array!3230) (currentByte!3703 (_ BitVec 32)) (currentBit!3698 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2578)

(declare-datatypes ((Unit!5095 0))(
  ( (Unit!5096) )
))
(declare-datatypes ((tuple2!6794 0))(
  ( (tuple2!6795 (_1!3531 Unit!5095) (_2!3531 BitStream!2578)) )
))
(declare-fun lt!123691 () tuple2!6794)

(declare-fun isPrefixOf!0 (BitStream!2578 BitStream!2578) Bool)

(assert (=> b!77215 (= res!63804 (isPrefixOf!0 thiss!1090 (_2!3531 lt!123691)))))

(declare-fun b!77216 () Bool)

(declare-fun res!63802 () Bool)

(declare-fun e!50652 () Bool)

(assert (=> b!77216 (=> (not res!63802) (not e!50652))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77216 (= res!63802 (validate_offset_bits!1 ((_ sign_extend 32) (size!1502 (buf!1892 thiss!1090))) ((_ sign_extend 32) (currentByte!3703 thiss!1090)) ((_ sign_extend 32) (currentBit!3698 thiss!1090)) nBits!322))))

(declare-fun b!77217 () Bool)

(assert (=> b!77217 (= e!50652 (not true))))

(assert (=> b!77217 (validate_offset_bits!1 ((_ sign_extend 32) (size!1502 (buf!1892 (_2!3531 lt!123691)))) ((_ sign_extend 32) (currentByte!3703 thiss!1090)) ((_ sign_extend 32) (currentBit!3698 thiss!1090)) nBits!322)))

(declare-fun lt!123690 () Unit!5095)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2578 array!3230 (_ BitVec 64)) Unit!5095)

(assert (=> b!77217 (= lt!123690 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1892 (_2!3531 lt!123691)) nBits!322))))

(declare-datatypes ((tuple2!6796 0))(
  ( (tuple2!6797 (_1!3532 BitStream!2578) (_2!3532 BitStream!2578)) )
))
(declare-fun lt!123692 () tuple2!6796)

(declare-fun reader!0 (BitStream!2578 BitStream!2578) tuple2!6796)

(assert (=> b!77217 (= lt!123692 (reader!0 thiss!1090 (_2!3531 lt!123691)))))

(declare-fun lt!123696 () Bool)

(assert (=> b!77217 (= lt!123696 (isPrefixOf!0 thiss!1090 (_2!3531 lt!123691)))))

(declare-fun lt!123693 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77217 (= lt!123693 (bitIndex!0 (size!1502 (buf!1892 (_2!3531 lt!123691))) (currentByte!3703 (_2!3531 lt!123691)) (currentBit!3698 (_2!3531 lt!123691))))))

(declare-fun lt!123688 () (_ BitVec 64))

(assert (=> b!77217 (= lt!123688 (bitIndex!0 (size!1502 (buf!1892 thiss!1090)) (currentByte!3703 thiss!1090) (currentBit!3698 thiss!1090)))))

(assert (=> b!77217 e!50649))

(declare-fun res!63803 () Bool)

(assert (=> b!77217 (=> (not res!63803) (not e!50649))))

(assert (=> b!77217 (= res!63803 (= (size!1502 (buf!1892 thiss!1090)) (size!1502 (buf!1892 (_2!3531 lt!123691)))))))

(declare-fun appendNBits!0 (BitStream!2578 (_ BitVec 64) Bool) tuple2!6794)

(assert (=> b!77217 (= lt!123691 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun res!63801 () Bool)

(assert (=> start!15068 (=> (not res!63801) (not e!50652))))

(assert (=> start!15068 (= res!63801 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15068 e!50652))

(assert (=> start!15068 true))

(declare-fun e!50650 () Bool)

(declare-fun inv!12 (BitStream!2578) Bool)

(assert (=> start!15068 (and (inv!12 thiss!1090) e!50650)))

(declare-fun b!77218 () Bool)

(declare-datatypes ((tuple2!6798 0))(
  ( (tuple2!6799 (_1!3533 BitStream!2578) (_2!3533 Bool)) )
))
(declare-fun lt!123695 () tuple2!6798)

(declare-fun lt!123694 () tuple2!6796)

(assert (=> b!77218 (= e!50649 (not (or (not (_2!3533 lt!123695)) (not (= (_1!3533 lt!123695) (_2!3532 lt!123694))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2578 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6798)

(assert (=> b!77218 (= lt!123695 (checkBitsLoopPure!0 (_1!3532 lt!123694) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77218 (validate_offset_bits!1 ((_ sign_extend 32) (size!1502 (buf!1892 (_2!3531 lt!123691)))) ((_ sign_extend 32) (currentByte!3703 thiss!1090)) ((_ sign_extend 32) (currentBit!3698 thiss!1090)) nBits!322)))

(declare-fun lt!123689 () Unit!5095)

(assert (=> b!77218 (= lt!123689 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1892 (_2!3531 lt!123691)) nBits!322))))

(assert (=> b!77218 (= lt!123694 (reader!0 thiss!1090 (_2!3531 lt!123691)))))

(declare-fun b!77219 () Bool)

(declare-fun res!63805 () Bool)

(assert (=> b!77219 (=> (not res!63805) (not e!50649))))

(assert (=> b!77219 (= res!63805 (= (bitIndex!0 (size!1502 (buf!1892 (_2!3531 lt!123691))) (currentByte!3703 (_2!3531 lt!123691)) (currentBit!3698 (_2!3531 lt!123691))) (bvadd (bitIndex!0 (size!1502 (buf!1892 thiss!1090)) (currentByte!3703 thiss!1090) (currentBit!3698 thiss!1090)) nBits!322)))))

(declare-fun b!77220 () Bool)

(declare-fun array_inv!1348 (array!3230) Bool)

(assert (=> b!77220 (= e!50650 (array_inv!1348 (buf!1892 thiss!1090)))))

(assert (= (and start!15068 res!63801) b!77216))

(assert (= (and b!77216 res!63802) b!77217))

(assert (= (and b!77217 res!63803) b!77219))

(assert (= (and b!77219 res!63805) b!77215))

(assert (= (and b!77215 res!63804) b!77218))

(assert (= start!15068 b!77220))

(declare-fun m!122633 () Bool)

(assert (=> b!77218 m!122633))

(declare-fun m!122635 () Bool)

(assert (=> b!77218 m!122635))

(declare-fun m!122637 () Bool)

(assert (=> b!77218 m!122637))

(declare-fun m!122639 () Bool)

(assert (=> b!77218 m!122639))

(declare-fun m!122641 () Bool)

(assert (=> b!77220 m!122641))

(declare-fun m!122643 () Bool)

(assert (=> b!77216 m!122643))

(declare-fun m!122645 () Bool)

(assert (=> b!77219 m!122645))

(declare-fun m!122647 () Bool)

(assert (=> b!77219 m!122647))

(declare-fun m!122649 () Bool)

(assert (=> start!15068 m!122649))

(declare-fun m!122651 () Bool)

(assert (=> b!77215 m!122651))

(assert (=> b!77217 m!122639))

(assert (=> b!77217 m!122647))

(assert (=> b!77217 m!122645))

(declare-fun m!122653 () Bool)

(assert (=> b!77217 m!122653))

(assert (=> b!77217 m!122635))

(assert (=> b!77217 m!122637))

(assert (=> b!77217 m!122651))

(push 1)

(assert (not b!77216))

(assert (not b!77217))

(assert (not start!15068))

(assert (not b!77215))

(assert (not b!77218))

(assert (not b!77219))

(assert (not b!77220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

