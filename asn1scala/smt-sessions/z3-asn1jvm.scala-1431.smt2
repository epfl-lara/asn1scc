; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39352 () Bool)

(assert start!39352)

(declare-fun b!176833 () Bool)

(declare-fun res!146539 () Bool)

(declare-fun e!123239 () Bool)

(assert (=> b!176833 (=> (not res!146539) (not e!123239))))

(declare-datatypes ((array!9544 0))(
  ( (array!9545 (arr!5138 (Array (_ BitVec 32) (_ BitVec 8))) (size!4208 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7524 0))(
  ( (BitStream!7525 (buf!4651 array!9544) (currentByte!8822 (_ BitVec 32)) (currentBit!8817 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7524)

(declare-datatypes ((Unit!12730 0))(
  ( (Unit!12731) )
))
(declare-datatypes ((tuple2!15222 0))(
  ( (tuple2!15223 (_1!8256 Unit!12730) (_2!8256 BitStream!7524)) )
))
(declare-fun lt!272043 () tuple2!15222)

(declare-fun isPrefixOf!0 (BitStream!7524 BitStream!7524) Bool)

(assert (=> b!176833 (= res!146539 (isPrefixOf!0 thiss!1204 (_2!8256 lt!272043)))))

(declare-fun b!176835 () Bool)

(declare-fun e!123243 () Bool)

(assert (=> b!176835 (= e!123243 e!123239)))

(declare-fun res!146543 () Bool)

(assert (=> b!176835 (=> (not res!146543) (not e!123239))))

(declare-fun lt!272041 () (_ BitVec 64))

(declare-fun lt!272044 () (_ BitVec 64))

(assert (=> b!176835 (= res!146543 (= lt!272041 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272044)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176835 (= lt!272041 (bitIndex!0 (size!4208 (buf!4651 (_2!8256 lt!272043))) (currentByte!8822 (_2!8256 lt!272043)) (currentBit!8817 (_2!8256 lt!272043))))))

(assert (=> b!176835 (= lt!272044 (bitIndex!0 (size!4208 (buf!4651 thiss!1204)) (currentByte!8822 thiss!1204) (currentBit!8817 thiss!1204)))))

(declare-fun b!176836 () Bool)

(declare-fun e!123244 () Bool)

(assert (=> b!176836 (= e!123239 e!123244)))

(declare-fun res!146542 () Bool)

(assert (=> b!176836 (=> (not res!146542) (not e!123244))))

(declare-fun lt!272045 () Bool)

(declare-datatypes ((tuple2!15224 0))(
  ( (tuple2!15225 (_1!8257 BitStream!7524) (_2!8257 Bool)) )
))
(declare-fun lt!272040 () tuple2!15224)

(assert (=> b!176836 (= res!146542 (and (= (_2!8257 lt!272040) lt!272045) (= (_1!8257 lt!272040) (_2!8256 lt!272043))))))

(declare-fun readBitPure!0 (BitStream!7524) tuple2!15224)

(declare-fun readerFrom!0 (BitStream!7524 (_ BitVec 32) (_ BitVec 32)) BitStream!7524)

(assert (=> b!176836 (= lt!272040 (readBitPure!0 (readerFrom!0 (_2!8256 lt!272043) (currentBit!8817 thiss!1204) (currentByte!8822 thiss!1204))))))

(declare-fun b!176837 () Bool)

(declare-fun res!146540 () Bool)

(declare-fun e!123241 () Bool)

(assert (=> b!176837 (=> (not res!146540) (not e!123241))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176837 (= res!146540 (invariant!0 (currentBit!8817 thiss!1204) (currentByte!8822 thiss!1204) (size!4208 (buf!4651 thiss!1204))))))

(declare-fun b!176838 () Bool)

(assert (=> b!176838 (= e!123244 (= (bitIndex!0 (size!4208 (buf!4651 (_1!8257 lt!272040))) (currentByte!8822 (_1!8257 lt!272040)) (currentBit!8817 (_1!8257 lt!272040))) lt!272041))))

(declare-fun b!176839 () Bool)

(declare-fun e!123242 () Bool)

(declare-fun array_inv!3949 (array!9544) Bool)

(assert (=> b!176839 (= e!123242 (array_inv!3949 (buf!4651 thiss!1204)))))

(declare-fun b!176840 () Bool)

(declare-fun res!146544 () Bool)

(assert (=> b!176840 (=> (not res!146544) (not e!123241))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!176840 (= res!146544 (not (= i!590 nBits!348)))))

(declare-fun b!176841 () Bool)

(assert (=> b!176841 (= e!123241 (not true))))

(declare-fun lt!272039 () (_ BitVec 64))

(assert (=> b!176841 (= lt!272039 (bitIndex!0 (size!4208 (buf!4651 (_2!8256 lt!272043))) (currentByte!8822 (_2!8256 lt!272043)) (currentBit!8817 (_2!8256 lt!272043))))))

(declare-fun lt!272042 () (_ BitVec 64))

(assert (=> b!176841 (= lt!272042 (bitIndex!0 (size!4208 (buf!4651 thiss!1204)) (currentByte!8822 thiss!1204) (currentBit!8817 thiss!1204)))))

(assert (=> b!176841 e!123243))

(declare-fun res!146541 () Bool)

(assert (=> b!176841 (=> (not res!146541) (not e!123243))))

(assert (=> b!176841 (= res!146541 (= (size!4208 (buf!4651 thiss!1204)) (size!4208 (buf!4651 (_2!8256 lt!272043)))))))

(declare-fun appendBit!0 (BitStream!7524 Bool) tuple2!15222)

(assert (=> b!176841 (= lt!272043 (appendBit!0 thiss!1204 lt!272045))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176841 (= lt!272045 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176834 () Bool)

(declare-fun res!146537 () Bool)

(assert (=> b!176834 (=> (not res!146537) (not e!123241))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176834 (= res!146537 (validate_offset_bits!1 ((_ sign_extend 32) (size!4208 (buf!4651 thiss!1204))) ((_ sign_extend 32) (currentByte!8822 thiss!1204)) ((_ sign_extend 32) (currentBit!8817 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!146538 () Bool)

(assert (=> start!39352 (=> (not res!146538) (not e!123241))))

(assert (=> start!39352 (= res!146538 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39352 e!123241))

(assert (=> start!39352 true))

(declare-fun inv!12 (BitStream!7524) Bool)

(assert (=> start!39352 (and (inv!12 thiss!1204) e!123242)))

(assert (= (and start!39352 res!146538) b!176834))

(assert (= (and b!176834 res!146537) b!176837))

(assert (= (and b!176837 res!146540) b!176840))

(assert (= (and b!176840 res!146544) b!176841))

(assert (= (and b!176841 res!146541) b!176835))

(assert (= (and b!176835 res!146543) b!176833))

(assert (= (and b!176833 res!146539) b!176836))

(assert (= (and b!176836 res!146542) b!176838))

(assert (= start!39352 b!176839))

(declare-fun m!276863 () Bool)

(assert (=> b!176841 m!276863))

(declare-fun m!276865 () Bool)

(assert (=> b!176841 m!276865))

(declare-fun m!276867 () Bool)

(assert (=> b!176841 m!276867))

(declare-fun m!276869 () Bool)

(assert (=> b!176839 m!276869))

(declare-fun m!276871 () Bool)

(assert (=> start!39352 m!276871))

(declare-fun m!276873 () Bool)

(assert (=> b!176837 m!276873))

(declare-fun m!276875 () Bool)

(assert (=> b!176838 m!276875))

(declare-fun m!276877 () Bool)

(assert (=> b!176833 m!276877))

(declare-fun m!276879 () Bool)

(assert (=> b!176834 m!276879))

(declare-fun m!276881 () Bool)

(assert (=> b!176836 m!276881))

(assert (=> b!176836 m!276881))

(declare-fun m!276883 () Bool)

(assert (=> b!176836 m!276883))

(assert (=> b!176835 m!276863))

(assert (=> b!176835 m!276865))

(check-sat (not b!176833) (not b!176841) (not start!39352) (not b!176838) (not b!176836) (not b!176835) (not b!176834) (not b!176839) (not b!176837))
