; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34168 () Bool)

(assert start!34168)

(declare-fun res!135703 () Bool)

(declare-fun e!112416 () Bool)

(assert (=> start!34168 (=> (not res!135703) (not e!112416))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8067 0))(
  ( (array!8068 (arr!4537 (Array (_ BitVec 32) (_ BitVec 8))) (size!3616 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6388 0))(
  ( (BitStream!6389 (buf!4068 array!8067) (currentByte!7584 (_ BitVec 32)) (currentBit!7579 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6388)

(assert (=> start!34168 (= res!135703 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3616 (buf!4068 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7584 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7579 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3616 (buf!4068 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7584 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7579 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!34168 e!112416))

(assert (=> start!34168 true))

(declare-fun e!112417 () Bool)

(declare-fun inv!12 (BitStream!6388) Bool)

(assert (=> start!34168 (and (inv!12 thiss!1577) e!112417)))

(declare-fun b!162877 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162877 (= e!112416 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7579 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7584 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (size!3616 (buf!4068 thiss!1577)))))))))

(declare-fun b!162878 () Bool)

(declare-fun array_inv!3357 (array!8067) Bool)

(assert (=> b!162878 (= e!112417 (array_inv!3357 (buf!4068 thiss!1577)))))

(assert (= (and start!34168 res!135703) b!162877))

(assert (= start!34168 b!162878))

(declare-fun m!258651 () Bool)

(assert (=> start!34168 m!258651))

(declare-fun m!258653 () Bool)

(assert (=> b!162877 m!258653))

(declare-fun m!258655 () Bool)

(assert (=> b!162878 m!258655))

(push 1)

(assert (not start!34168))

(assert (not b!162877))

(assert (not b!162878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

