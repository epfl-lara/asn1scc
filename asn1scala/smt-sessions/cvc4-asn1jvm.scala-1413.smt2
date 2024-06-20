; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38910 () Bool)

(assert start!38910)

(declare-fun res!144977 () Bool)

(declare-fun e!122084 () Bool)

(assert (=> start!38910 (=> (not res!144977) (not e!122084))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9420 0))(
  ( (array!9421 (arr!5085 (Array (_ BitVec 32) (_ BitVec 8))) (size!4155 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7418 0))(
  ( (BitStream!7419 (buf!4592 array!9420) (currentByte!8715 (_ BitVec 32)) (currentBit!8710 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7418)

(assert (=> start!38910 (= res!144977 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle ((_ sign_extend 32) (size!4155 (buf!4592 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8715 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8710 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4155 (buf!4592 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8715 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8710 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38910 e!122084))

(assert (=> start!38910 true))

(declare-fun e!122086 () Bool)

(declare-fun inv!12 (BitStream!7418) Bool)

(assert (=> start!38910 (and (inv!12 thiss!1204) e!122086)))

(declare-fun b!175078 () Bool)

(declare-fun res!144978 () Bool)

(assert (=> b!175078 (=> (not res!144978) (not e!122084))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175078 (= res!144978 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8710 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8715 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4155 (buf!4592 thiss!1204))))))))

(declare-fun b!175079 () Bool)

(assert (=> b!175079 (= e!122084 (bvslt ((_ sign_extend 32) (bvsub nBits!348 i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175080 () Bool)

(declare-fun array_inv!3896 (array!9420) Bool)

(assert (=> b!175080 (= e!122086 (array_inv!3896 (buf!4592 thiss!1204)))))

(assert (= (and start!38910 res!144977) b!175078))

(assert (= (and b!175078 res!144978) b!175079))

(assert (= start!38910 b!175080))

(declare-fun m!275323 () Bool)

(assert (=> start!38910 m!275323))

(declare-fun m!275325 () Bool)

(assert (=> b!175078 m!275325))

(declare-fun m!275327 () Bool)

(assert (=> b!175080 m!275327))

(push 1)

(assert (not start!38910))

(assert (not b!175078))

(assert (not b!175080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

