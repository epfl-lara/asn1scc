; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38438 () Bool)

(assert start!38438)

(declare-fun b!172614 () Bool)

(declare-fun e!120618 () Bool)

(declare-datatypes ((array!9277 0))(
  ( (array!9278 (arr!5024 (Array (_ BitVec 32) (_ BitVec 8))) (size!4094 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7296 0))(
  ( (BitStream!7297 (buf!4522 array!9277) (currentByte!8600 (_ BitVec 32)) (currentBit!8595 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7296)

(declare-fun array_inv!3835 (array!9277) Bool)

(assert (=> b!172614 (= e!120618 (array_inv!3835 (buf!4522 thiss!1187)))))

(declare-fun res!142964 () Bool)

(declare-fun e!120617 () Bool)

(assert (=> start!38438 (=> (not res!142964) (not e!120617))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38438 (= res!142964 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38438 e!120617))

(assert (=> start!38438 true))

(declare-fun inv!12 (BitStream!7296) Bool)

(assert (=> start!38438 (and (inv!12 thiss!1187) e!120618)))

(declare-fun b!172612 () Bool)

(declare-fun res!142965 () Bool)

(assert (=> b!172612 (=> (not res!142965) (not e!120617))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172612 (= res!142965 (invariant!0 (currentBit!8595 thiss!1187) (currentByte!8600 thiss!1187) (size!4094 (buf!4522 thiss!1187))))))

(declare-fun b!172611 () Bool)

(declare-fun res!142963 () Bool)

(assert (=> b!172611 (=> (not res!142963) (not e!120617))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172611 (= res!142963 (validate_offset_bits!1 ((_ sign_extend 32) (size!4094 (buf!4522 thiss!1187))) ((_ sign_extend 32) (currentByte!8600 thiss!1187)) ((_ sign_extend 32) (currentBit!8595 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172613 () Bool)

(assert (=> b!172613 (= e!120617 false)))

(declare-datatypes ((Unit!12335 0))(
  ( (Unit!12336) )
))
(declare-datatypes ((tuple2!14838 0))(
  ( (tuple2!14839 (_1!8061 Unit!12335) (_2!8061 BitStream!7296)) )
))
(declare-fun lt!265964 () tuple2!14838)

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7296 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14838)

(assert (=> b!172613 (= lt!265964 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(assert (= (and start!38438 res!142964) b!172611))

(assert (= (and b!172611 res!142963) b!172612))

(assert (= (and b!172612 res!142965) b!172613))

(assert (= start!38438 b!172614))

(declare-fun m!271775 () Bool)

(assert (=> start!38438 m!271775))

(declare-fun m!271777 () Bool)

(assert (=> b!172611 m!271777))

(declare-fun m!271779 () Bool)

(assert (=> b!172612 m!271779))

(declare-fun m!271781 () Bool)

(assert (=> b!172613 m!271781))

(declare-fun m!271783 () Bool)

(assert (=> b!172614 m!271783))

(check-sat (not start!38438) (not b!172612) (not b!172613) (not b!172611) (not b!172614))
