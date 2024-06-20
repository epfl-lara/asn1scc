; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38876 () Bool)

(assert start!38876)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!9404 0))(
  ( (array!9405 (arr!5079 (Array (_ BitVec 32) (_ BitVec 8))) (size!4149 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7406 0))(
  ( (BitStream!7407 (buf!4586 array!9404) (currentByte!8706 (_ BitVec 32)) (currentBit!8701 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7406)

(assert (=> start!38876 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle ((_ sign_extend 32) (size!4149 (buf!4586 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8706 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8701 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4149 (buf!4586 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8706 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8701 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38876 true))

(declare-fun e!122031 () Bool)

(declare-fun inv!12 (BitStream!7406) Bool)

(assert (=> start!38876 (and (inv!12 thiss!1204) e!122031)))

(declare-fun b!175035 () Bool)

(declare-fun array_inv!3890 (array!9404) Bool)

(assert (=> b!175035 (= e!122031 (array_inv!3890 (buf!4586 thiss!1204)))))

(assert (= start!38876 b!175035))

(declare-fun m!275281 () Bool)

(assert (=> start!38876 m!275281))

(declare-fun m!275283 () Bool)

(assert (=> b!175035 m!275283))

(push 1)

(assert (not start!38876))

(assert (not b!175035))

(check-sat)

(pop 1)

(push 1)

(check-sat)

