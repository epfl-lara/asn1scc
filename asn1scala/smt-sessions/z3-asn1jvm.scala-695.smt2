; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19562 () Bool)

(assert start!19562)

(declare-fun b!97586 () Bool)

(declare-fun res!80070 () Bool)

(declare-fun e!63921 () Bool)

(assert (=> b!97586 (=> (not res!80070) (not e!63921))))

(declare-datatypes ((array!4566 0))(
  ( (array!4567 (arr!2680 (Array (_ BitVec 32) (_ BitVec 8))) (size!2087 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3648 0))(
  ( (BitStream!3649 (buf!2435 array!4566) (currentByte!4856 (_ BitVec 32)) (currentBit!4851 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5944 0))(
  ( (Unit!5945) )
))
(declare-datatypes ((tuple2!7820 0))(
  ( (tuple2!7821 (_1!4162 Unit!5944) (_2!4162 BitStream!3648)) )
))
(declare-fun lt!141303 () tuple2!7820)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun thiss!1288 () BitStream!3648)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97586 (= res!80070 (= (bitIndex!0 (size!2087 (buf!2435 (_2!4162 lt!141303))) (currentByte!4856 (_2!4162 lt!141303)) (currentBit!4851 (_2!4162 lt!141303))) (bvadd (bitIndex!0 (size!2087 (buf!2435 thiss!1288)) (currentByte!4856 thiss!1288) (currentBit!4851 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97587 () Bool)

(declare-fun res!80071 () Bool)

(assert (=> b!97587 (=> (not res!80071) (not e!63921))))

(declare-fun isPrefixOf!0 (BitStream!3648 BitStream!3648) Bool)

(assert (=> b!97587 (= res!80071 (isPrefixOf!0 thiss!1288 (_2!4162 lt!141303)))))

(declare-fun b!97588 () Bool)

(assert (=> b!97588 (= e!63921 false)))

(declare-datatypes ((tuple2!7822 0))(
  ( (tuple2!7823 (_1!4163 BitStream!3648) (_2!4163 BitStream!3648)) )
))
(declare-fun lt!141304 () tuple2!7822)

(declare-fun reader!0 (BitStream!3648 BitStream!3648) tuple2!7822)

(assert (=> b!97588 (= lt!141304 (reader!0 thiss!1288 (_2!4162 lt!141303)))))

(declare-fun res!80068 () Bool)

(declare-fun e!63924 () Bool)

(assert (=> start!19562 (=> (not res!80068) (not e!63924))))

(assert (=> start!19562 (= res!80068 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19562 e!63924))

(assert (=> start!19562 true))

(declare-fun e!63923 () Bool)

(declare-fun inv!12 (BitStream!3648) Bool)

(assert (=> start!19562 (and (inv!12 thiss!1288) e!63923)))

(declare-fun b!97589 () Bool)

(declare-fun res!80069 () Bool)

(assert (=> b!97589 (=> (not res!80069) (not e!63924))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97589 (= res!80069 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97590 () Bool)

(declare-fun res!80067 () Bool)

(assert (=> b!97590 (=> (not res!80067) (not e!63924))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97590 (= res!80067 (validate_offset_bits!1 ((_ sign_extend 32) (size!2087 (buf!2435 thiss!1288))) ((_ sign_extend 32) (currentByte!4856 thiss!1288)) ((_ sign_extend 32) (currentBit!4851 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97591 () Bool)

(declare-fun array_inv!1889 (array!4566) Bool)

(assert (=> b!97591 (= e!63923 (array_inv!1889 (buf!2435 thiss!1288)))))

(declare-fun b!97592 () Bool)

(assert (=> b!97592 (= e!63924 e!63921)))

(declare-fun res!80072 () Bool)

(assert (=> b!97592 (=> (not res!80072) (not e!63921))))

(assert (=> b!97592 (= res!80072 (= (size!2087 (buf!2435 thiss!1288)) (size!2087 (buf!2435 (_2!4162 lt!141303)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3648 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7820)

(assert (=> b!97592 (= lt!141303 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(assert (= (and start!19562 res!80068) b!97590))

(assert (= (and b!97590 res!80067) b!97589))

(assert (= (and b!97589 res!80069) b!97592))

(assert (= (and b!97592 res!80072) b!97586))

(assert (= (and b!97586 res!80070) b!97587))

(assert (= (and b!97587 res!80071) b!97588))

(assert (= start!19562 b!97591))

(declare-fun m!141853 () Bool)

(assert (=> start!19562 m!141853))

(declare-fun m!141855 () Bool)

(assert (=> b!97592 m!141855))

(declare-fun m!141857 () Bool)

(assert (=> b!97590 m!141857))

(declare-fun m!141859 () Bool)

(assert (=> b!97591 m!141859))

(declare-fun m!141861 () Bool)

(assert (=> b!97587 m!141861))

(declare-fun m!141863 () Bool)

(assert (=> b!97588 m!141863))

(declare-fun m!141865 () Bool)

(assert (=> b!97589 m!141865))

(declare-fun m!141867 () Bool)

(assert (=> b!97586 m!141867))

(declare-fun m!141869 () Bool)

(assert (=> b!97586 m!141869))

(check-sat (not b!97589) (not b!97591) (not b!97590) (not b!97588) (not start!19562) (not b!97587) (not b!97586) (not b!97592))
