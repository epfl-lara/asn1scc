; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71026 () Bool)

(assert start!71026)

(declare-fun res!263494 () Bool)

(declare-fun e!230968 () Bool)

(assert (=> start!71026 (=> (not res!263494) (not e!230968))))

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20266 0))(
  ( (array!20267 (arr!9925 (Array (_ BitVec 32) (_ BitVec 8))) (size!8833 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13828 0))(
  ( (BitStream!13829 (buf!7975 array!20266) (currentByte!14707 (_ BitVec 32)) (currentBit!14702 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13828)

(assert (=> start!71026 (= res!263494 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8833 (buf!7975 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14707 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14702 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8833 (buf!7975 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14707 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14702 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71026 e!230968))

(assert (=> start!71026 true))

(declare-fun e!230969 () Bool)

(declare-fun inv!12 (BitStream!13828) Bool)

(assert (=> start!71026 (and (inv!12 thiss!1780) e!230969)))

(declare-fun b!320784 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320784 (= e!230968 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14702 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14707 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (size!8833 (buf!7975 thiss!1780)))))))))

(declare-fun b!320785 () Bool)

(declare-fun array_inv!8385 (array!20266) Bool)

(assert (=> b!320785 (= e!230969 (array_inv!8385 (buf!7975 thiss!1780)))))

(assert (= (and start!71026 res!263494) b!320784))

(assert (= start!71026 b!320785))

(declare-fun m!459157 () Bool)

(assert (=> start!71026 m!459157))

(declare-fun m!459159 () Bool)

(assert (=> b!320784 m!459159))

(declare-fun m!459161 () Bool)

(assert (=> b!320785 m!459161))

(push 1)

(assert (not b!320785))

(assert (not b!320784))

(assert (not start!71026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

