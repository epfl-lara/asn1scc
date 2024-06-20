; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17438 () Bool)

(assert start!17438)

(declare-fun res!69052 () Bool)

(declare-fun e!56209 () Bool)

(assert (=> start!17438 (=> (not res!69052) (not e!56209))))

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3966 0))(
  ( (array!3967 (arr!2433 (Array (_ BitVec 32) (_ BitVec 8))) (size!1796 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3154 0))(
  ( (BitStream!3155 (buf!2186 array!3966) (currentByte!4342 (_ BitVec 32)) (currentBit!4337 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3154)

(assert (=> start!17438 (= res!69052 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!1796 (buf!2186 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4342 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4337 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1796 (buf!2186 thiss!1136))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4342 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4337 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17438 e!56209))

(assert (=> start!17438 true))

(declare-fun e!56210 () Bool)

(declare-fun inv!12 (BitStream!3154) Bool)

(assert (=> start!17438 (and (inv!12 thiss!1136) e!56210)))

(declare-fun b!84099 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84099 (= e!56209 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4337 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4342 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (size!1796 (buf!2186 thiss!1136)))))))))

(declare-fun b!84100 () Bool)

(declare-fun array_inv!1642 (array!3966) Bool)

(assert (=> b!84100 (= e!56210 (array_inv!1642 (buf!2186 thiss!1136)))))

(assert (= (and start!17438 res!69052) b!84099))

(assert (= start!17438 b!84100))

(declare-fun m!130807 () Bool)

(assert (=> start!17438 m!130807))

(declare-fun m!130809 () Bool)

(assert (=> b!84099 m!130809))

(declare-fun m!130811 () Bool)

(assert (=> b!84100 m!130811))

(push 1)

(assert (not b!84099))

(assert (not start!17438))

(assert (not b!84100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27090 () Bool)

