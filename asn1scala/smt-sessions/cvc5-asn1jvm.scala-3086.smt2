; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71044 () Bool)

(assert start!71044)

(declare-fun res!263505 () Bool)

(declare-fun e!230996 () Bool)

(assert (=> start!71044 (=> (not res!263505) (not e!230996))))

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20274 0))(
  ( (array!20275 (arr!9928 (Array (_ BitVec 32) (_ BitVec 8))) (size!8836 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13834 0))(
  ( (BitStream!13835 (buf!7978 array!20274) (currentByte!14713 (_ BitVec 32)) (currentBit!14708 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13834)

(assert (=> start!71044 (= res!263505 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8836 (buf!7978 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14713 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14708 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8836 (buf!7978 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14713 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14708 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71044 e!230996))

(assert (=> start!71044 true))

(declare-fun e!230995 () Bool)

(declare-fun inv!12 (BitStream!13834) Bool)

(assert (=> start!71044 (and (inv!12 thiss!1780) e!230995)))

(declare-fun b!320804 () Bool)

(declare-fun res!263506 () Bool)

(assert (=> b!320804 (=> (not res!263506) (not e!230996))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320804 (= res!263506 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14708 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14713 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (size!8836 (buf!7978 thiss!1780))))))))

(declare-fun b!320805 () Bool)

(assert (=> b!320805 (= e!230996 (bvslt ((_ sign_extend 32) nBits!542) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320806 () Bool)

(declare-fun array_inv!8388 (array!20274) Bool)

(assert (=> b!320806 (= e!230995 (array_inv!8388 (buf!7978 thiss!1780)))))

(assert (= (and start!71044 res!263505) b!320804))

(assert (= (and b!320804 res!263506) b!320805))

(assert (= start!71044 b!320806))

(declare-fun m!459177 () Bool)

(assert (=> start!71044 m!459177))

(declare-fun m!459179 () Bool)

(assert (=> b!320804 m!459179))

(declare-fun m!459181 () Bool)

(assert (=> b!320806 m!459181))

(push 1)

(assert (not b!320804))

