; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36626 () Bool)

(assert start!36626)

(declare-fun res!140048 () Bool)

(declare-fun e!116832 () Bool)

(assert (=> start!36626 (=> (not res!140048) (not e!116832))))

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8718 0))(
  ( (array!8719 (arr!4791 (Array (_ BitVec 32) (_ BitVec 8))) (size!3870 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6896 0))(
  ( (BitStream!6897 (buf!4322 array!8718) (currentByte!8182 (_ BitVec 32)) (currentBit!8177 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6896)

(assert (=> start!36626 (= res!140048 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3870 (buf!4322 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8182 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8177 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3870 (buf!4322 thiss!1909))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8182 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8177 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36626 e!116832))

(assert (=> start!36626 true))

(declare-fun e!116830 () Bool)

(declare-fun inv!12 (BitStream!6896) Bool)

(assert (=> start!36626 (and (inv!12 thiss!1909) e!116830)))

(declare-fun b!168235 () Bool)

(declare-fun res!140047 () Bool)

(assert (=> b!168235 (=> (not res!140047) (not e!116832))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168235 (= res!140047 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8177 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8182 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (size!3870 (buf!4322 thiss!1909))))))))

(declare-fun b!168236 () Bool)

(assert (=> b!168236 (= e!116832 (bvslt ((_ sign_extend 32) nBits!601) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!168237 () Bool)

(declare-fun array_inv!3611 (array!8718) Bool)

(assert (=> b!168237 (= e!116830 (array_inv!3611 (buf!4322 thiss!1909)))))

(assert (= (and start!36626 res!140048) b!168235))

(assert (= (and b!168235 res!140047) b!168236))

(assert (= start!36626 b!168237))

(declare-fun m!267867 () Bool)

(assert (=> start!36626 m!267867))

(declare-fun m!267869 () Bool)

(assert (=> b!168235 m!267869))

(declare-fun m!267871 () Bool)

(assert (=> b!168237 m!267871))

(push 1)

