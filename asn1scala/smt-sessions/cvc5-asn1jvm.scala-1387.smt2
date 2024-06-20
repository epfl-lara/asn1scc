; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38340 () Bool)

(assert start!38340)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9231 0))(
  ( (array!9232 (arr!5005 (Array (_ BitVec 32) (_ BitVec 8))) (size!4075 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7258 0))(
  ( (BitStream!7259 (buf!4503 array!9231) (currentByte!8570 (_ BitVec 32)) (currentBit!8565 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7258)

(assert (=> start!38340 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!4075 (buf!4503 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8570 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8565 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!38340 true))

(declare-fun e!120372 () Bool)

(declare-fun inv!12 (BitStream!7258) Bool)

(assert (=> start!38340 (and (inv!12 thiss!1187) e!120372)))

(declare-fun b!172305 () Bool)

(declare-fun array_inv!3816 (array!9231) Bool)

(assert (=> b!172305 (= e!120372 (array_inv!3816 (buf!4503 thiss!1187)))))

(assert (= start!38340 b!172305))

(declare-fun m!271439 () Bool)

(assert (=> start!38340 m!271439))

(declare-fun m!271441 () Bool)

(assert (=> b!172305 m!271441))

(push 1)

(assert (not b!172305))

(assert (not start!38340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

