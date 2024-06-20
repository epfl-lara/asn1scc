; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38112 () Bool)

(assert start!38112)

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9169 0))(
  ( (array!9170 (arr!4983 (Array (_ BitVec 32) (_ BitVec 8))) (size!4053 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7214 0))(
  ( (BitStream!7215 (buf!4481 array!9169) (currentByte!8513 (_ BitVec 32)) (currentBit!8508 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7214)

(assert (=> start!38112 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4053 (buf!4481 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8513 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8508 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4053 (buf!4481 thiss!1817))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8513 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8508 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38112 true))

(declare-fun e!119988 () Bool)

(declare-fun inv!12 (BitStream!7214) Bool)

(assert (=> start!38112 (and (inv!12 thiss!1817) e!119988)))

(declare-fun b!171738 () Bool)

(declare-fun array_inv!3794 (array!9169) Bool)

(assert (=> b!171738 (= e!119988 (array_inv!3794 (buf!4481 thiss!1817)))))

(assert (= start!38112 b!171738))

(declare-fun m!270987 () Bool)

(assert (=> start!38112 m!270987))

(declare-fun m!270989 () Bool)

(assert (=> b!171738 m!270989))

(push 1)

(assert (not b!171738))

(assert (not start!38112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

