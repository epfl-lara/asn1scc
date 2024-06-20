; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34172 () Bool)

(assert start!34172)

(declare-fun res!135709 () Bool)

(declare-fun e!112434 () Bool)

(assert (=> start!34172 (=> (not res!135709) (not e!112434))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8071 0))(
  ( (array!8072 (arr!4539 (Array (_ BitVec 32) (_ BitVec 8))) (size!3618 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6392 0))(
  ( (BitStream!6393 (buf!4070 array!8071) (currentByte!7586 (_ BitVec 32)) (currentBit!7581 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6392)

(assert (=> start!34172 (= res!135709 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3618 (buf!4070 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7586 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7581 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3618 (buf!4070 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7586 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7581 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!34172 e!112434))

(assert (=> start!34172 true))

(declare-fun e!112435 () Bool)

(declare-fun inv!12 (BitStream!6392) Bool)

(assert (=> start!34172 (and (inv!12 thiss!1577) e!112435)))

(declare-fun b!162889 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162889 (= e!112434 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7581 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7586 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (size!3618 (buf!4070 thiss!1577)))))))))

(declare-fun b!162890 () Bool)

(declare-fun array_inv!3359 (array!8071) Bool)

(assert (=> b!162890 (= e!112435 (array_inv!3359 (buf!4070 thiss!1577)))))

(assert (= (and start!34172 res!135709) b!162889))

(assert (= start!34172 b!162890))

(declare-fun m!258663 () Bool)

(assert (=> start!34172 m!258663))

(declare-fun m!258665 () Bool)

(assert (=> b!162889 m!258665))

(declare-fun m!258667 () Bool)

(assert (=> b!162890 m!258667))

(push 1)

(assert (not b!162890))

(assert (not start!34172))

(assert (not b!162889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56151 () Bool)

