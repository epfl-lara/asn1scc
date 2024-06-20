; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38868 () Bool)

(assert start!38868)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!9396 0))(
  ( (array!9397 (arr!5075 (Array (_ BitVec 32) (_ BitVec 8))) (size!4145 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7398 0))(
  ( (BitStream!7399 (buf!4582 array!9396) (currentByte!8702 (_ BitVec 32)) (currentBit!8697 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7398)

(assert (=> start!38868 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (or (bvsgt ((_ sign_extend 32) (size!4145 (buf!4582 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8702 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8697 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!38868 true))

(declare-fun e!122007 () Bool)

(declare-fun inv!12 (BitStream!7398) Bool)

(assert (=> start!38868 (and (inv!12 thiss!1204) e!122007)))

(declare-fun b!175023 () Bool)

(declare-fun array_inv!3886 (array!9396) Bool)

(assert (=> b!175023 (= e!122007 (array_inv!3886 (buf!4582 thiss!1204)))))

(assert (= start!38868 b!175023))

(declare-fun m!275265 () Bool)

(assert (=> start!38868 m!275265))

(declare-fun m!275267 () Bool)

(assert (=> b!175023 m!275267))

(check-sat (not b!175023) (not start!38868))
(check-sat)
