; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17442 () Bool)

(assert start!17442)

(declare-fun res!69058 () Bool)

(declare-fun e!56227 () Bool)

(assert (=> start!17442 (=> (not res!69058) (not e!56227))))

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3970 0))(
  ( (array!3971 (arr!2435 (Array (_ BitVec 32) (_ BitVec 8))) (size!1798 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3158 0))(
  ( (BitStream!3159 (buf!2188 array!3970) (currentByte!4344 (_ BitVec 32)) (currentBit!4339 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3158)

(assert (=> start!17442 (= res!69058 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!1798 (buf!2188 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4344 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4339 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1798 (buf!2188 thiss!1136))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4344 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4339 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17442 e!56227))

(assert (=> start!17442 true))

(declare-fun e!56228 () Bool)

(declare-fun inv!12 (BitStream!3158) Bool)

(assert (=> start!17442 (and (inv!12 thiss!1136) e!56228)))

(declare-fun b!84111 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84111 (= e!56227 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4339 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4344 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (size!1798 (buf!2188 thiss!1136)))))))))

(declare-fun b!84112 () Bool)

(declare-fun array_inv!1644 (array!3970) Bool)

(assert (=> b!84112 (= e!56228 (array_inv!1644 (buf!2188 thiss!1136)))))

(assert (= (and start!17442 res!69058) b!84111))

(assert (= start!17442 b!84112))

(declare-fun m!130819 () Bool)

(assert (=> start!17442 m!130819))

(declare-fun m!130821 () Bool)

(assert (=> b!84111 m!130821))

(declare-fun m!130823 () Bool)

(assert (=> b!84112 m!130823))

(push 1)

(assert (not b!84112))

(assert (not b!84111))

(assert (not start!17442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27096 () Bool)

