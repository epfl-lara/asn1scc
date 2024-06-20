; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71550 () Bool)

(assert start!71550)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20464 0))(
  ( (array!20465 (arr!10002 (Array (_ BitVec 32) (_ BitVec 8))) (size!8910 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13982 0))(
  ( (BitStream!13983 (buf!8052 array!20464) (currentByte!14849 (_ BitVec 32)) (currentBit!14844 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13982)

(assert (=> start!71550 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8910 (buf!8052 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14849 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14844 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8910 (buf!8052 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14849 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14844 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71550 true))

(declare-fun e!231770 () Bool)

(declare-fun inv!12 (BitStream!13982) Bool)

(assert (=> start!71550 (and (inv!12 thiss!1793) e!231770)))

(declare-fun b!321640 () Bool)

(declare-fun array_inv!8462 (array!20464) Bool)

(assert (=> b!321640 (= e!231770 (array_inv!8462 (buf!8052 thiss!1793)))))

(assert (= start!71550 b!321640))

(declare-fun m!459995 () Bool)

(assert (=> start!71550 m!459995))

(declare-fun m!459997 () Bool)

(assert (=> b!321640 m!459997))

(push 1)

(assert (not start!71550))

(assert (not b!321640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

