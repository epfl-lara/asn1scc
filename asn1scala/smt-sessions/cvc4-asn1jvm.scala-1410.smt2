; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38870 () Bool)

(assert start!38870)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!9398 0))(
  ( (array!9399 (arr!5076 (Array (_ BitVec 32) (_ BitVec 8))) (size!4146 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7400 0))(
  ( (BitStream!7401 (buf!4583 array!9398) (currentByte!8703 (_ BitVec 32)) (currentBit!8698 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7400)

(assert (=> start!38870 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (or (bvsgt ((_ sign_extend 32) (size!4146 (buf!4583 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8703 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8698 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!38870 true))

(declare-fun e!122013 () Bool)

(declare-fun inv!12 (BitStream!7400) Bool)

(assert (=> start!38870 (and (inv!12 thiss!1204) e!122013)))

(declare-fun b!175026 () Bool)

(declare-fun array_inv!3887 (array!9398) Bool)

(assert (=> b!175026 (= e!122013 (array_inv!3887 (buf!4583 thiss!1204)))))

(assert (= start!38870 b!175026))

(declare-fun m!275269 () Bool)

(assert (=> start!38870 m!275269))

(declare-fun m!275271 () Bool)

(assert (=> b!175026 m!275271))

(push 1)

(assert (not start!38870))

(assert (not b!175026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

