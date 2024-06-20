; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38892 () Bool)

(assert start!38892)

(declare-fun res!144960 () Bool)

(declare-fun e!122057 () Bool)

(assert (=> start!38892 (=> (not res!144960) (not e!122057))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9412 0))(
  ( (array!9413 (arr!5082 (Array (_ BitVec 32) (_ BitVec 8))) (size!4152 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7412 0))(
  ( (BitStream!7413 (buf!4589 array!9412) (currentByte!8710 (_ BitVec 32)) (currentBit!8705 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7412)

(assert (=> start!38892 (= res!144960 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle ((_ sign_extend 32) (size!4152 (buf!4589 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8710 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8705 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4152 (buf!4589 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8710 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8705 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38892 e!122057))

(assert (=> start!38892 true))

(declare-fun e!122058 () Bool)

(declare-fun inv!12 (BitStream!7412) Bool)

(assert (=> start!38892 (and (inv!12 thiss!1204) e!122058)))

(declare-fun b!175052 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175052 (= e!122057 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8705 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8710 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4152 (buf!4589 thiss!1204)))))))))

(declare-fun b!175053 () Bool)

(declare-fun array_inv!3893 (array!9412) Bool)

(assert (=> b!175053 (= e!122058 (array_inv!3893 (buf!4589 thiss!1204)))))

(assert (= (and start!38892 res!144960) b!175052))

(assert (= start!38892 b!175053))

(declare-fun m!275301 () Bool)

(assert (=> start!38892 m!275301))

(declare-fun m!275303 () Bool)

(assert (=> b!175052 m!275303))

(declare-fun m!275305 () Bool)

(assert (=> b!175053 m!275305))

(push 1)

(assert (not b!175052))

(assert (not start!38892))

(assert (not b!175053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

