; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71576 () Bool)

(assert start!71576)

(declare-fun res!264045 () Bool)

(declare-fun e!231807 () Bool)

(assert (=> start!71576 (=> (not res!264045) (not e!231807))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20476 0))(
  ( (array!20477 (arr!10006 (Array (_ BitVec 32) (_ BitVec 8))) (size!8914 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13990 0))(
  ( (BitStream!13991 (buf!8056 array!20476) (currentByte!14855 (_ BitVec 32)) (currentBit!14850 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13990)

(assert (=> start!71576 (= res!264045 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8914 (buf!8056 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14855 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14850 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8914 (buf!8056 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14855 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14850 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71576 e!231807))

(assert (=> start!71576 true))

(declare-fun e!231806 () Bool)

(declare-fun inv!12 (BitStream!13990) Bool)

(assert (=> start!71576 (and (inv!12 thiss!1793) e!231806)))

(declare-fun b!321665 () Bool)

(declare-fun res!264046 () Bool)

(assert (=> b!321665 (=> (not res!264046) (not e!231807))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321665 (= res!264046 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14850 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14855 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (size!8914 (buf!8056 thiss!1793))))))))

(declare-fun b!321666 () Bool)

(assert (=> b!321666 (= e!231807 (bvslt ((_ sign_extend 32) (bvsub nBits!548 i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321667 () Bool)

(declare-fun array_inv!8466 (array!20476) Bool)

(assert (=> b!321667 (= e!231806 (array_inv!8466 (buf!8056 thiss!1793)))))

(assert (= (and start!71576 res!264045) b!321665))

(assert (= (and b!321665 res!264046) b!321666))

(assert (= start!71576 b!321667))

(declare-fun m!460023 () Bool)

(assert (=> start!71576 m!460023))

(declare-fun m!460025 () Bool)

(assert (=> b!321665 m!460025))

(declare-fun m!460027 () Bool)

(assert (=> b!321667 m!460027))

(push 1)

(assert (not b!321667))

(assert (not b!321665))

(assert (not start!71576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

