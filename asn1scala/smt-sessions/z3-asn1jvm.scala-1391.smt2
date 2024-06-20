; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38396 () Bool)

(assert start!38396)

(declare-fun res!142794 () Bool)

(declare-fun e!120473 () Bool)

(assert (=> start!38396 (=> (not res!142794) (not e!120473))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38396 (= res!142794 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38396 e!120473))

(assert (=> start!38396 true))

(declare-datatypes ((array!9262 0))(
  ( (array!9263 (arr!5018 (Array (_ BitVec 32) (_ BitVec 8))) (size!4088 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7284 0))(
  ( (BitStream!7285 (buf!4516 array!9262) (currentByte!8588 (_ BitVec 32)) (currentBit!8583 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7284)

(declare-fun e!120474 () Bool)

(declare-fun inv!12 (BitStream!7284) Bool)

(assert (=> start!38396 (and (inv!12 thiss!1187) e!120474)))

(declare-fun b!172386 () Bool)

(declare-fun res!142792 () Bool)

(assert (=> b!172386 (=> (not res!142792) (not e!120473))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172386 (= res!142792 (validate_offset_bits!1 ((_ sign_extend 32) (size!4088 (buf!4516 thiss!1187))) ((_ sign_extend 32) (currentByte!8588 thiss!1187)) ((_ sign_extend 32) (currentBit!8583 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172389 () Bool)

(declare-fun array_inv!3829 (array!9262) Bool)

(assert (=> b!172389 (= e!120474 (array_inv!3829 (buf!4516 thiss!1187)))))

(declare-fun b!172387 () Bool)

(declare-fun res!142793 () Bool)

(assert (=> b!172387 (=> (not res!142793) (not e!120473))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172387 (= res!142793 (invariant!0 (currentBit!8583 thiss!1187) (currentByte!8588 thiss!1187) (size!4088 (buf!4516 thiss!1187))))))

(declare-fun b!172388 () Bool)

(assert (=> b!172388 (= e!120473 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4088 (buf!4516 thiss!1187))) ((_ sign_extend 32) (currentByte!8588 thiss!1187)) ((_ sign_extend 32) (currentBit!8583 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(assert (= (and start!38396 res!142794) b!172386))

(assert (= (and b!172386 res!142792) b!172387))

(assert (= (and b!172387 res!142793) b!172388))

(assert (= start!38396 b!172389))

(declare-fun m!271515 () Bool)

(assert (=> start!38396 m!271515))

(declare-fun m!271517 () Bool)

(assert (=> b!172389 m!271517))

(declare-fun m!271519 () Bool)

(assert (=> b!172386 m!271519))

(assert (=> b!172388 m!271519))

(declare-fun m!271521 () Bool)

(assert (=> b!172387 m!271521))

(check-sat (not b!172388) (not start!38396) (not b!172389) (not b!172387) (not b!172386))
