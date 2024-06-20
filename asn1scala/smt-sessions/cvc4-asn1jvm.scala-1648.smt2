; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46104 () Bool)

(assert start!46104)

(declare-fun res!186833 () Bool)

(declare-fun e!151133 () Bool)

(assert (=> start!46104 (=> (not res!186833) (not e!151133))))

(declare-datatypes ((array!10832 0))(
  ( (array!10833 (arr!5685 (Array (_ BitVec 32) (_ BitVec 8))) (size!4755 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8618 0))(
  ( (BitStream!8619 (buf!5302 array!10832) (currentByte!9959 (_ BitVec 32)) (currentBit!9954 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8618)

(assert (=> start!46104 (= res!186833 (and (bvsle ((_ sign_extend 32) (size!4755 (buf!5302 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9959 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9954 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4755 (buf!5302 thiss!1933))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9959 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9954 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46104 e!151133))

(declare-fun e!151131 () Bool)

(declare-fun inv!12 (BitStream!8618) Bool)

(assert (=> start!46104 (and (inv!12 thiss!1933) e!151131)))

(declare-fun b!222478 () Bool)

(declare-fun res!186834 () Bool)

(assert (=> b!222478 (=> (not res!186834) (not e!151133))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222478 (= res!186834 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9954 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9959 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4755 (buf!5302 thiss!1933))))))))

(declare-fun b!222479 () Bool)

(assert (=> b!222479 (= e!151133 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!9954 thiss!1933)) #b00000000000000000000000000000111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222480 () Bool)

(declare-fun array_inv!4496 (array!10832) Bool)

(assert (=> b!222480 (= e!151131 (array_inv!4496 (buf!5302 thiss!1933)))))

(assert (= (and start!46104 res!186833) b!222478))

(assert (= (and b!222478 res!186834) b!222479))

(assert (= start!46104 b!222480))

(declare-fun m!340705 () Bool)

(assert (=> start!46104 m!340705))

(declare-fun m!340707 () Bool)

(assert (=> b!222478 m!340707))

(declare-fun m!340709 () Bool)

(assert (=> b!222480 m!340709))

(push 1)

