; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52030 () Bool)

(assert start!52030)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-datatypes ((array!13093 0))(
  ( (array!13094 (arr!6723 (Array (_ BitVec 32) (_ BitVec 8))) (size!5736 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10394 0))(
  ( (BitStream!10395 (buf!6190 array!13093) (currentByte!11529 (_ BitVec 32)) (currentBit!11524 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10394)

(assert (=> start!52030 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!5736 (buf!6190 thiss!982))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11529 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11524 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5736 (buf!6190 thiss!982))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11529 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11524 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52030 true))

(declare-fun e!166264 () Bool)

(declare-fun inv!12 (BitStream!10394) Bool)

(assert (=> start!52030 (and (inv!12 thiss!982) e!166264)))

(declare-fun b!239813 () Bool)

(declare-fun array_inv!5477 (array!13093) Bool)

(assert (=> b!239813 (= e!166264 (array_inv!5477 (buf!6190 thiss!982)))))

(assert (= start!52030 b!239813))

(declare-fun m!362127 () Bool)

(assert (=> start!52030 m!362127))

(declare-fun m!362129 () Bool)

(assert (=> b!239813 m!362129))

(push 1)

(assert (not start!52030))

(assert (not b!239813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

