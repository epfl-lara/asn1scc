; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3274 () Bool)

(assert start!3274)

(declare-fun res!13691 () Bool)

(declare-fun e!9088 () Bool)

(assert (=> start!3274 (=> (not res!13691) (not e!9088))))

(declare-fun nBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!834 0))(
  ( (array!835 (arr!784 (Array (_ BitVec 32) (_ BitVec 8))) (size!355 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!670 0))(
  ( (BitStream!671 (buf!706 array!834) (currentByte!1849 (_ BitVec 32)) (currentBit!1844 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!670)

(assert (=> start!3274 (= res!13691 (and (bvsge nBytes!1 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!355 (buf!706 thiss!1862))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1849 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1844 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!355 (buf!706 thiss!1862))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1849 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1844 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3274 e!9088))

(assert (=> start!3274 true))

(declare-fun e!9089 () Bool)

(declare-fun inv!12 (BitStream!670) Bool)

(assert (=> start!3274 (and (inv!12 thiss!1862) e!9089)))

(declare-fun b!14602 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14602 (= e!9088 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1844 thiss!1862))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1849 thiss!1862))) ((_ extract 31 0) ((_ sign_extend 32) (size!355 (buf!706 thiss!1862)))))))))

(declare-fun b!14603 () Bool)

(declare-fun array_inv!344 (array!834) Bool)

(assert (=> b!14603 (= e!9089 (array_inv!344 (buf!706 thiss!1862)))))

(assert (= (and start!3274 res!13691) b!14602))

(assert (= start!3274 b!14603))

(declare-fun m!21037 () Bool)

(assert (=> start!3274 m!21037))

(declare-fun m!21039 () Bool)

(assert (=> b!14602 m!21039))

(declare-fun m!21041 () Bool)

(assert (=> b!14603 m!21041))

(push 1)

(assert (not start!3274))

(assert (not b!14602))

(assert (not b!14603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

