; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38866 () Bool)

(assert start!38866)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!9394 0))(
  ( (array!9395 (arr!5074 (Array (_ BitVec 32) (_ BitVec 8))) (size!4144 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7396 0))(
  ( (BitStream!7397 (buf!4581 array!9394) (currentByte!8701 (_ BitVec 32)) (currentBit!8696 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7396)

(assert (=> start!38866 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (or (bvsgt ((_ sign_extend 32) (size!4144 (buf!4581 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8701 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8696 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!38866 true))

(declare-fun e!122001 () Bool)

(declare-fun inv!12 (BitStream!7396) Bool)

(assert (=> start!38866 (and (inv!12 thiss!1204) e!122001)))

(declare-fun b!175020 () Bool)

(declare-fun array_inv!3885 (array!9394) Bool)

(assert (=> b!175020 (= e!122001 (array_inv!3885 (buf!4581 thiss!1204)))))

(assert (= start!38866 b!175020))

(declare-fun m!275261 () Bool)

(assert (=> start!38866 m!275261))

(declare-fun m!275263 () Bool)

(assert (=> b!175020 m!275263))

(push 1)

(assert (not b!175020))

(assert (not start!38866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

