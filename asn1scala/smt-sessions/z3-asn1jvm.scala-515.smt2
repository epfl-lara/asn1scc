; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15070 () Bool)

(assert start!15070)

(declare-fun b!77233 () Bool)

(declare-fun e!50662 () Bool)

(declare-datatypes ((array!3232 0))(
  ( (array!3233 (arr!2104 (Array (_ BitVec 32) (_ BitVec 8))) (size!1503 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2580 0))(
  ( (BitStream!2581 (buf!1893 array!3232) (currentByte!3704 (_ BitVec 32)) (currentBit!3699 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2580)

(declare-fun array_inv!1349 (array!3232) Bool)

(assert (=> b!77233 (= e!50662 (array_inv!1349 (buf!1893 thiss!1090)))))

(declare-fun b!77234 () Bool)

(declare-fun e!50661 () Bool)

(declare-datatypes ((tuple2!6800 0))(
  ( (tuple2!6801 (_1!3534 BitStream!2580) (_2!3534 Bool)) )
))
(declare-fun lt!123720 () tuple2!6800)

(declare-datatypes ((tuple2!6802 0))(
  ( (tuple2!6803 (_1!3535 BitStream!2580) (_2!3535 BitStream!2580)) )
))
(declare-fun lt!123722 () tuple2!6802)

(assert (=> b!77234 (= e!50661 (not (or (not (_2!3534 lt!123720)) (not (= (_1!3534 lt!123720) (_2!3535 lt!123722))))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!2580 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6800)

(assert (=> b!77234 (= lt!123720 (checkBitsLoopPure!0 (_1!3535 lt!123722) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!5097 0))(
  ( (Unit!5098) )
))
(declare-datatypes ((tuple2!6804 0))(
  ( (tuple2!6805 (_1!3536 Unit!5097) (_2!3536 BitStream!2580)) )
))
(declare-fun lt!123717 () tuple2!6804)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77234 (validate_offset_bits!1 ((_ sign_extend 32) (size!1503 (buf!1893 (_2!3536 lt!123717)))) ((_ sign_extend 32) (currentByte!3704 thiss!1090)) ((_ sign_extend 32) (currentBit!3699 thiss!1090)) nBits!322)))

(declare-fun lt!123723 () Unit!5097)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2580 array!3232 (_ BitVec 64)) Unit!5097)

(assert (=> b!77234 (= lt!123723 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1893 (_2!3536 lt!123717)) nBits!322))))

(declare-fun reader!0 (BitStream!2580 BitStream!2580) tuple2!6802)

(assert (=> b!77234 (= lt!123722 (reader!0 thiss!1090 (_2!3536 lt!123717)))))

(declare-fun b!77235 () Bool)

(declare-fun res!63820 () Bool)

(assert (=> b!77235 (=> (not res!63820) (not e!50661))))

(declare-fun isPrefixOf!0 (BitStream!2580 BitStream!2580) Bool)

(assert (=> b!77235 (= res!63820 (isPrefixOf!0 thiss!1090 (_2!3536 lt!123717)))))

(declare-fun res!63818 () Bool)

(declare-fun e!50664 () Bool)

(assert (=> start!15070 (=> (not res!63818) (not e!50664))))

(assert (=> start!15070 (= res!63818 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15070 e!50664))

(assert (=> start!15070 true))

(declare-fun inv!12 (BitStream!2580) Bool)

(assert (=> start!15070 (and (inv!12 thiss!1090) e!50662)))

(declare-fun b!77236 () Bool)

(declare-fun res!63819 () Bool)

(assert (=> b!77236 (=> (not res!63819) (not e!50664))))

(assert (=> b!77236 (= res!63819 (validate_offset_bits!1 ((_ sign_extend 32) (size!1503 (buf!1893 thiss!1090))) ((_ sign_extend 32) (currentByte!3704 thiss!1090)) ((_ sign_extend 32) (currentBit!3699 thiss!1090)) nBits!322))))

(declare-fun b!77237 () Bool)

(assert (=> b!77237 (= e!50664 (not true))))

(assert (=> b!77237 (validate_offset_bits!1 ((_ sign_extend 32) (size!1503 (buf!1893 (_2!3536 lt!123717)))) ((_ sign_extend 32) (currentByte!3704 thiss!1090)) ((_ sign_extend 32) (currentBit!3699 thiss!1090)) nBits!322)))

(declare-fun lt!123721 () Unit!5097)

(assert (=> b!77237 (= lt!123721 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1893 (_2!3536 lt!123717)) nBits!322))))

(declare-fun lt!123716 () tuple2!6802)

(assert (=> b!77237 (= lt!123716 (reader!0 thiss!1090 (_2!3536 lt!123717)))))

(declare-fun lt!123718 () Bool)

(assert (=> b!77237 (= lt!123718 (isPrefixOf!0 thiss!1090 (_2!3536 lt!123717)))))

(declare-fun lt!123719 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77237 (= lt!123719 (bitIndex!0 (size!1503 (buf!1893 (_2!3536 lt!123717))) (currentByte!3704 (_2!3536 lt!123717)) (currentBit!3699 (_2!3536 lt!123717))))))

(declare-fun lt!123715 () (_ BitVec 64))

(assert (=> b!77237 (= lt!123715 (bitIndex!0 (size!1503 (buf!1893 thiss!1090)) (currentByte!3704 thiss!1090) (currentBit!3699 thiss!1090)))))

(assert (=> b!77237 e!50661))

(declare-fun res!63816 () Bool)

(assert (=> b!77237 (=> (not res!63816) (not e!50661))))

(assert (=> b!77237 (= res!63816 (= (size!1503 (buf!1893 thiss!1090)) (size!1503 (buf!1893 (_2!3536 lt!123717)))))))

(declare-fun appendNBits!0 (BitStream!2580 (_ BitVec 64) Bool) tuple2!6804)

(assert (=> b!77237 (= lt!123717 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77238 () Bool)

(declare-fun res!63817 () Bool)

(assert (=> b!77238 (=> (not res!63817) (not e!50661))))

(assert (=> b!77238 (= res!63817 (= (bitIndex!0 (size!1503 (buf!1893 (_2!3536 lt!123717))) (currentByte!3704 (_2!3536 lt!123717)) (currentBit!3699 (_2!3536 lt!123717))) (bvadd (bitIndex!0 (size!1503 (buf!1893 thiss!1090)) (currentByte!3704 thiss!1090) (currentBit!3699 thiss!1090)) nBits!322)))))

(assert (= (and start!15070 res!63818) b!77236))

(assert (= (and b!77236 res!63819) b!77237))

(assert (= (and b!77237 res!63816) b!77238))

(assert (= (and b!77238 res!63817) b!77235))

(assert (= (and b!77235 res!63820) b!77234))

(assert (= start!15070 b!77233))

(declare-fun m!122655 () Bool)

(assert (=> b!77235 m!122655))

(declare-fun m!122657 () Bool)

(assert (=> start!15070 m!122657))

(declare-fun m!122659 () Bool)

(assert (=> b!77234 m!122659))

(declare-fun m!122661 () Bool)

(assert (=> b!77234 m!122661))

(declare-fun m!122663 () Bool)

(assert (=> b!77234 m!122663))

(declare-fun m!122665 () Bool)

(assert (=> b!77234 m!122665))

(declare-fun m!122667 () Bool)

(assert (=> b!77233 m!122667))

(declare-fun m!122669 () Bool)

(assert (=> b!77238 m!122669))

(declare-fun m!122671 () Bool)

(assert (=> b!77238 m!122671))

(assert (=> b!77237 m!122661))

(assert (=> b!77237 m!122671))

(assert (=> b!77237 m!122655))

(assert (=> b!77237 m!122669))

(assert (=> b!77237 m!122663))

(assert (=> b!77237 m!122665))

(declare-fun m!122673 () Bool)

(assert (=> b!77237 m!122673))

(declare-fun m!122675 () Bool)

(assert (=> b!77236 m!122675))

(check-sat (not b!77233) (not b!77237) (not b!77238) (not start!15070) (not b!77236) (not b!77235) (not b!77234))
