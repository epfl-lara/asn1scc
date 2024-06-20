; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19876 () Bool)

(assert start!19876)

(declare-fun res!81254 () Bool)

(declare-fun e!64807 () Bool)

(assert (=> start!19876 (=> (not res!81254) (not e!64807))))

(declare-datatypes ((array!4641 0))(
  ( (array!4642 (arr!2712 (Array (_ BitVec 32) (_ BitVec 8))) (size!2119 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3712 0))(
  ( (BitStream!3713 (buf!2476 array!4641) (currentByte!4913 (_ BitVec 32)) (currentBit!4908 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3712)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!19876 (= res!81254 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2119 (buf!2476 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4913 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4908 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2119 (buf!2476 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4913 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4908 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19876 e!64807))

(assert (=> start!19876 true))

(declare-fun e!64808 () Bool)

(declare-fun inv!12 (BitStream!3712) Bool)

(assert (=> start!19876 (and (inv!12 thiss!1305) e!64808)))

(declare-fun b!99067 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99067 (= e!64807 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4908 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4913 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2119 (buf!2476 thiss!1305)))))))))

(declare-fun b!99068 () Bool)

(declare-fun array_inv!1921 (array!4641) Bool)

(assert (=> b!99068 (= e!64808 (array_inv!1921 (buf!2476 thiss!1305)))))

(assert (= (and start!19876 res!81254) b!99067))

(assert (= start!19876 b!99068))

(declare-fun m!144505 () Bool)

(assert (=> start!19876 m!144505))

(declare-fun m!144507 () Bool)

(assert (=> b!99067 m!144507))

(declare-fun m!144509 () Bool)

(assert (=> b!99068 m!144509))

(push 1)

(assert (not b!99068))

(assert (not start!19876))

(assert (not b!99067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31272 () Bool)

(assert (=> d!31272 (= (array_inv!1921 (buf!2476 thiss!1305)) (bvsge (size!2119 (buf!2476 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!99068 d!31272))

(declare-fun d!31274 () Bool)

(assert (=> d!31274 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4908 thiss!1305) (currentByte!4913 thiss!1305) (size!2119 (buf!2476 thiss!1305))))))

(declare-fun bs!7655 () Bool)

(assert (= bs!7655 d!31274))

(declare-fun m!144525 () Bool)

(assert (=> bs!7655 m!144525))

(assert (=> start!19876 d!31274))

(declare-fun d!31276 () Bool)

(assert (=> d!31276 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4908 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4913 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2119 (buf!2476 thiss!1305))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4908 thiss!1305))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4908 thiss!1305))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4913 thiss!1305))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4913 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2119 (buf!2476 thiss!1305))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4908 thiss!1305))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4913 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2119 (buf!2476 thiss!1305)))))))))))

