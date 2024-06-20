; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46714 () Bool)

(assert start!46714)

(declare-fun b!224065 () Bool)

(declare-fun e!152604 () Bool)

(assert (=> b!224065 (= e!152604 (not true))))

(declare-datatypes ((array!11030 0))(
  ( (array!11031 (arr!5786 (Array (_ BitVec 32) (_ BitVec 8))) (size!4838 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11030)

(declare-fun lt!355358 () array!11030)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!734 (array!11030 array!11030 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224065 (arrayRangesEq!734 arr!308 lt!355358 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((BitStream!8778 0))(
  ( (BitStream!8779 (buf!5382 array!11030) (currentByte!10110 (_ BitVec 32)) (currentBit!10105 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19164 0))(
  ( (tuple2!19165 (_1!10325 (_ BitVec 8)) (_2!10325 BitStream!8778)) )
))
(declare-fun lt!355359 () tuple2!19164)

(declare-datatypes ((Unit!16345 0))(
  ( (Unit!16346) )
))
(declare-fun lt!355355 () Unit!16345)

(declare-fun arrayUpdatedAtPrefixLemma!326 (array!11030 (_ BitVec 32) (_ BitVec 8)) Unit!16345)

(assert (=> b!224065 (= lt!355355 (arrayUpdatedAtPrefixLemma!326 arr!308 i!761 (_1!10325 lt!355359)))))

(declare-datatypes ((tuple3!1202 0))(
  ( (tuple3!1203 (_1!10326 Unit!16345) (_2!10326 BitStream!8778) (_3!743 array!11030)) )
))
(declare-fun lt!355353 () tuple3!1202)

(declare-fun lt!355354 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!8778)

(declare-fun lt!355357 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!355356 () (_ BitVec 32))

(declare-fun lt!355352 () (_ BitVec 64))

(assert (=> b!224065 (and (= (bvadd lt!355357 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355356))) lt!355354) (= (bvadd lt!355352 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355354) (= (buf!5382 thiss!1870) (buf!5382 (_2!10326 lt!355353))) (= (size!4838 arr!308) (size!4838 (_3!743 lt!355353))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224065 (= lt!355354 (bitIndex!0 (size!4838 (buf!5382 (_2!10326 lt!355353))) (currentByte!10110 (_2!10326 lt!355353)) (currentBit!10105 (_2!10326 lt!355353))))))

(assert (=> b!224065 (= lt!355357 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355352))))

(assert (=> b!224065 (= lt!355357 (bitIndex!0 (size!4838 (buf!5382 (_2!10325 lt!355359))) (currentByte!10110 (_2!10325 lt!355359)) (currentBit!10105 (_2!10325 lt!355359))))))

(assert (=> b!224065 (= lt!355352 (bitIndex!0 (size!4838 (buf!5382 thiss!1870)) (currentByte!10110 thiss!1870) (currentBit!10105 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8778 array!11030 (_ BitVec 32) (_ BitVec 32)) tuple3!1202)

(assert (=> b!224065 (= lt!355353 (readByteArrayLoop!0 (_2!10325 lt!355359) lt!355358 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224065 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4838 (buf!5382 (_2!10325 lt!355359)))) ((_ sign_extend 32) (currentByte!10110 (_2!10325 lt!355359))) ((_ sign_extend 32) (currentBit!10105 (_2!10325 lt!355359))) lt!355356)))

(assert (=> b!224065 (= lt!355356 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355351 () Unit!16345)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8778 BitStream!8778 (_ BitVec 64) (_ BitVec 32)) Unit!16345)

(assert (=> b!224065 (= lt!355351 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10325 lt!355359) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224065 (= lt!355358 (array!11031 (store (arr!5786 arr!308) i!761 (_1!10325 lt!355359)) (size!4838 arr!308)))))

(declare-fun readByte!0 (BitStream!8778) tuple2!19164)

(assert (=> b!224065 (= lt!355359 (readByte!0 thiss!1870))))

(declare-fun res!188082 () Bool)

(assert (=> start!46714 (=> (not res!188082) (not e!152604))))

(assert (=> start!46714 (= res!188082 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4838 arr!308))))))

(assert (=> start!46714 e!152604))

(assert (=> start!46714 true))

(declare-fun array_inv!4579 (array!11030) Bool)

(assert (=> start!46714 (array_inv!4579 arr!308)))

(declare-fun e!152606 () Bool)

(declare-fun inv!12 (BitStream!8778) Bool)

(assert (=> start!46714 (and (inv!12 thiss!1870) e!152606)))

(declare-fun b!224064 () Bool)

(declare-fun res!188080 () Bool)

(assert (=> b!224064 (=> (not res!188080) (not e!152604))))

(assert (=> b!224064 (= res!188080 (bvslt i!761 to!496))))

(declare-fun b!224066 () Bool)

(assert (=> b!224066 (= e!152606 (array_inv!4579 (buf!5382 thiss!1870)))))

(declare-fun b!224063 () Bool)

(declare-fun res!188081 () Bool)

(assert (=> b!224063 (=> (not res!188081) (not e!152604))))

(assert (=> b!224063 (= res!188081 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4838 (buf!5382 thiss!1870))) ((_ sign_extend 32) (currentByte!10110 thiss!1870)) ((_ sign_extend 32) (currentBit!10105 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46714 res!188082) b!224063))

(assert (= (and b!224063 res!188081) b!224064))

(assert (= (and b!224064 res!188080) b!224065))

(assert (= start!46714 b!224066))

(declare-fun m!343647 () Bool)

(assert (=> b!224065 m!343647))

(declare-fun m!343649 () Bool)

(assert (=> b!224065 m!343649))

(declare-fun m!343651 () Bool)

(assert (=> b!224065 m!343651))

(declare-fun m!343653 () Bool)

(assert (=> b!224065 m!343653))

(declare-fun m!343655 () Bool)

(assert (=> b!224065 m!343655))

(declare-fun m!343657 () Bool)

(assert (=> b!224065 m!343657))

(declare-fun m!343659 () Bool)

(assert (=> b!224065 m!343659))

(declare-fun m!343661 () Bool)

(assert (=> b!224065 m!343661))

(declare-fun m!343663 () Bool)

(assert (=> b!224065 m!343663))

(declare-fun m!343665 () Bool)

(assert (=> b!224065 m!343665))

(declare-fun m!343667 () Bool)

(assert (=> start!46714 m!343667))

(declare-fun m!343669 () Bool)

(assert (=> start!46714 m!343669))

(declare-fun m!343671 () Bool)

(assert (=> b!224066 m!343671))

(declare-fun m!343673 () Bool)

(assert (=> b!224063 m!343673))

(check-sat (not b!224063) (not b!224065) (not start!46714) (not b!224066))
