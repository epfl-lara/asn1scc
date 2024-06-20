; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38906 () Bool)

(assert start!38906)

(declare-fun res!144965 () Bool)

(declare-fun e!122068 () Bool)

(assert (=> start!38906 (=> (not res!144965) (not e!122068))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9416 0))(
  ( (array!9417 (arr!5083 (Array (_ BitVec 32) (_ BitVec 8))) (size!4153 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7414 0))(
  ( (BitStream!7415 (buf!4590 array!9416) (currentByte!8713 (_ BitVec 32)) (currentBit!8708 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7414)

(assert (=> start!38906 (= res!144965 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle ((_ sign_extend 32) (size!4153 (buf!4590 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8713 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8708 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4153 (buf!4590 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8713 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8708 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38906 e!122068))

(assert (=> start!38906 true))

(declare-fun e!122066 () Bool)

(declare-fun inv!12 (BitStream!7414) Bool)

(assert (=> start!38906 (and (inv!12 thiss!1204) e!122066)))

(declare-fun b!175060 () Bool)

(declare-fun res!144966 () Bool)

(assert (=> b!175060 (=> (not res!144966) (not e!122068))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175060 (= res!144966 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8708 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8713 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4153 (buf!4590 thiss!1204))))))))

(declare-fun b!175061 () Bool)

(assert (=> b!175061 (= e!122068 (bvslt ((_ sign_extend 32) (bvsub nBits!348 i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175062 () Bool)

(declare-fun array_inv!3894 (array!9416) Bool)

(assert (=> b!175062 (= e!122066 (array_inv!3894 (buf!4590 thiss!1204)))))

(assert (= (and start!38906 res!144965) b!175060))

(assert (= (and b!175060 res!144966) b!175061))

(assert (= start!38906 b!175062))

(declare-fun m!275311 () Bool)

(assert (=> start!38906 m!275311))

(declare-fun m!275313 () Bool)

(assert (=> b!175060 m!275313))

(declare-fun m!275315 () Bool)

(assert (=> b!175062 m!275315))

(push 1)

(assert (not start!38906))

(assert (not b!175060))

(assert (not b!175062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

