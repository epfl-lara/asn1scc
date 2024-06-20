; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19568 () Bool)

(assert start!19568)

(declare-fun b!97649 () Bool)

(declare-fun res!80123 () Bool)

(declare-fun e!63960 () Bool)

(assert (=> b!97649 (=> (not res!80123) (not e!63960))))

(declare-datatypes ((array!4572 0))(
  ( (array!4573 (arr!2683 (Array (_ BitVec 32) (_ BitVec 8))) (size!2090 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3654 0))(
  ( (BitStream!3655 (buf!2438 array!4572) (currentByte!4859 (_ BitVec 32)) (currentBit!4854 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3654)

(declare-datatypes ((Unit!5950 0))(
  ( (Unit!5951) )
))
(declare-datatypes ((tuple2!7832 0))(
  ( (tuple2!7833 (_1!4168 Unit!5950) (_2!4168 BitStream!3654)) )
))
(declare-fun lt!141322 () tuple2!7832)

(declare-fun isPrefixOf!0 (BitStream!3654 BitStream!3654) Bool)

(assert (=> b!97649 (= res!80123 (isPrefixOf!0 thiss!1288 (_2!4168 lt!141322)))))

(declare-fun res!80125 () Bool)

(declare-fun e!63958 () Bool)

(assert (=> start!19568 (=> (not res!80125) (not e!63958))))

(declare-fun nBits!388 () (_ BitVec 32))

(assert (=> start!19568 (= res!80125 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19568 e!63958))

(assert (=> start!19568 true))

(declare-fun e!63959 () Bool)

(declare-fun inv!12 (BitStream!3654) Bool)

(assert (=> start!19568 (and (inv!12 thiss!1288) e!63959)))

(declare-fun b!97650 () Bool)

(declare-fun res!80126 () Bool)

(assert (=> b!97650 (=> (not res!80126) (not e!63958))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97650 (= res!80126 (validate_offset_bits!1 ((_ sign_extend 32) (size!2090 (buf!2438 thiss!1288))) ((_ sign_extend 32) (currentByte!4859 thiss!1288)) ((_ sign_extend 32) (currentBit!4854 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97651 () Bool)

(declare-fun array_inv!1892 (array!4572) Bool)

(assert (=> b!97651 (= e!63959 (array_inv!1892 (buf!2438 thiss!1288)))))

(declare-fun b!97652 () Bool)

(declare-fun res!80121 () Bool)

(assert (=> b!97652 (=> (not res!80121) (not e!63958))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97652 (= res!80121 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97653 () Bool)

(declare-fun res!80122 () Bool)

(assert (=> b!97653 (=> (not res!80122) (not e!63960))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97653 (= res!80122 (= (bitIndex!0 (size!2090 (buf!2438 (_2!4168 lt!141322))) (currentByte!4859 (_2!4168 lt!141322)) (currentBit!4854 (_2!4168 lt!141322))) (bvadd (bitIndex!0 (size!2090 (buf!2438 thiss!1288)) (currentByte!4859 thiss!1288) (currentBit!4854 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97654 () Bool)

(assert (=> b!97654 (= e!63958 e!63960)))

(declare-fun res!80124 () Bool)

(assert (=> b!97654 (=> (not res!80124) (not e!63960))))

(assert (=> b!97654 (= res!80124 (= (size!2090 (buf!2438 thiss!1288)) (size!2090 (buf!2438 (_2!4168 lt!141322)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3654 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7832)

(assert (=> b!97654 (= lt!141322 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97655 () Bool)

(assert (=> b!97655 (= e!63960 false)))

(declare-datatypes ((tuple2!7834 0))(
  ( (tuple2!7835 (_1!4169 BitStream!3654) (_2!4169 BitStream!3654)) )
))
(declare-fun lt!141321 () tuple2!7834)

(declare-fun reader!0 (BitStream!3654 BitStream!3654) tuple2!7834)

(assert (=> b!97655 (= lt!141321 (reader!0 thiss!1288 (_2!4168 lt!141322)))))

(assert (= (and start!19568 res!80125) b!97650))

(assert (= (and b!97650 res!80126) b!97652))

(assert (= (and b!97652 res!80121) b!97654))

(assert (= (and b!97654 res!80124) b!97653))

(assert (= (and b!97653 res!80122) b!97649))

(assert (= (and b!97649 res!80123) b!97655))

(assert (= start!19568 b!97651))

(declare-fun m!141907 () Bool)

(assert (=> b!97649 m!141907))

(declare-fun m!141909 () Bool)

(assert (=> b!97653 m!141909))

(declare-fun m!141911 () Bool)

(assert (=> b!97653 m!141911))

(declare-fun m!141913 () Bool)

(assert (=> start!19568 m!141913))

(declare-fun m!141915 () Bool)

(assert (=> b!97650 m!141915))

(declare-fun m!141917 () Bool)

(assert (=> b!97654 m!141917))

(declare-fun m!141919 () Bool)

(assert (=> b!97652 m!141919))

(declare-fun m!141921 () Bool)

(assert (=> b!97655 m!141921))

(declare-fun m!141923 () Bool)

(assert (=> b!97651 m!141923))

(check-sat (not b!97652) (not b!97649) (not b!97650) (not b!97653) (not b!97651) (not b!97654) (not start!19568) (not b!97655))
