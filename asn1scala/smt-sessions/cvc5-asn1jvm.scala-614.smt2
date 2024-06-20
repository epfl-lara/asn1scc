; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17458 () Bool)

(assert start!17458)

(declare-fun res!69064 () Bool)

(declare-fun e!56238 () Bool)

(assert (=> start!17458 (=> (not res!69064) (not e!56238))))

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3975 0))(
  ( (array!3976 (arr!2436 (Array (_ BitVec 32) (_ BitVec 8))) (size!1799 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3160 0))(
  ( (BitStream!3161 (buf!2189 array!3975) (currentByte!4347 (_ BitVec 32)) (currentBit!4342 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3160)

(assert (=> start!17458 (= res!69064 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!1799 (buf!2189 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4347 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4342 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1799 (buf!2189 thiss!1136))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4347 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4342 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17458 e!56238))

(assert (=> start!17458 true))

(declare-fun e!56237 () Bool)

(declare-fun inv!12 (BitStream!3160) Bool)

(assert (=> start!17458 (and (inv!12 thiss!1136) e!56237)))

(declare-fun b!84119 () Bool)

(declare-fun res!69063 () Bool)

(assert (=> b!84119 (=> (not res!69063) (not e!56238))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84119 (= res!69063 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4342 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4347 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (size!1799 (buf!2189 thiss!1136))))))))

(declare-fun b!84120 () Bool)

(assert (=> b!84120 (= e!56238 (bvslt ((_ sign_extend 32) nBits!333) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!84121 () Bool)

(declare-fun array_inv!1645 (array!3975) Bool)

(assert (=> b!84121 (= e!56237 (array_inv!1645 (buf!2189 thiss!1136)))))

(assert (= (and start!17458 res!69064) b!84119))

(assert (= (and b!84119 res!69063) b!84120))

(assert (= start!17458 b!84121))

(declare-fun m!130829 () Bool)

(assert (=> start!17458 m!130829))

(declare-fun m!130831 () Bool)

(assert (=> b!84119 m!130831))

(declare-fun m!130833 () Bool)

(assert (=> b!84121 m!130833))

(push 1)

(assert (not b!84121))

(assert (not b!84119))

(assert (not start!17458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

