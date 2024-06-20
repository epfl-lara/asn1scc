; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34186 () Bool)

(assert start!34186)

(declare-fun res!135715 () Bool)

(declare-fun e!112443 () Bool)

(assert (=> start!34186 (=> (not res!135715) (not e!112443))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8075 0))(
  ( (array!8076 (arr!4540 (Array (_ BitVec 32) (_ BitVec 8))) (size!3619 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6394 0))(
  ( (BitStream!6395 (buf!4071 array!8075) (currentByte!7589 (_ BitVec 32)) (currentBit!7584 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6394)

(assert (=> start!34186 (= res!135715 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3619 (buf!4071 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7589 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7584 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3619 (buf!4071 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7589 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7584 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!34186 e!112443))

(assert (=> start!34186 true))

(declare-fun e!112444 () Bool)

(declare-fun inv!12 (BitStream!6394) Bool)

(assert (=> start!34186 (and (inv!12 thiss!1577) e!112444)))

(declare-fun b!162897 () Bool)

(declare-fun res!135714 () Bool)

(assert (=> b!162897 (=> (not res!135714) (not e!112443))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162897 (= res!135714 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7584 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7589 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (size!3619 (buf!4071 thiss!1577))))))))

(declare-fun b!162898 () Bool)

(assert (=> b!162898 (= e!112443 (bvslt ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!162899 () Bool)

(declare-fun array_inv!3360 (array!8075) Bool)

(assert (=> b!162899 (= e!112444 (array_inv!3360 (buf!4071 thiss!1577)))))

(assert (= (and start!34186 res!135715) b!162897))

(assert (= (and b!162897 res!135714) b!162898))

(assert (= start!34186 b!162899))

(declare-fun m!258673 () Bool)

(assert (=> start!34186 m!258673))

(declare-fun m!258675 () Bool)

(assert (=> b!162897 m!258675))

(declare-fun m!258677 () Bool)

(assert (=> b!162899 m!258677))

(push 1)

(assert (not b!162899))

(assert (not start!34186))

(assert (not b!162897))

(check-sat)

(pop 1)

