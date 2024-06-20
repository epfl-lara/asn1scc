; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17462 () Bool)

(assert start!17462)

(declare-fun res!69076 () Bool)

(declare-fun e!56256 () Bool)

(assert (=> start!17462 (=> (not res!69076) (not e!56256))))

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3979 0))(
  ( (array!3980 (arr!2438 (Array (_ BitVec 32) (_ BitVec 8))) (size!1801 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3164 0))(
  ( (BitStream!3165 (buf!2191 array!3979) (currentByte!4349 (_ BitVec 32)) (currentBit!4344 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3164)

(assert (=> start!17462 (= res!69076 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!1801 (buf!2191 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4349 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4344 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1801 (buf!2191 thiss!1136))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4349 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4344 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17462 e!56256))

(assert (=> start!17462 true))

(declare-fun e!56254 () Bool)

(declare-fun inv!12 (BitStream!3164) Bool)

(assert (=> start!17462 (and (inv!12 thiss!1136) e!56254)))

(declare-fun b!84137 () Bool)

(declare-fun res!69075 () Bool)

(assert (=> b!84137 (=> (not res!69075) (not e!56256))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84137 (= res!69075 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4344 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4349 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (size!1801 (buf!2191 thiss!1136))))))))

(declare-fun b!84138 () Bool)

(assert (=> b!84138 (= e!56256 (bvslt ((_ sign_extend 32) nBits!333) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!84139 () Bool)

(declare-fun array_inv!1647 (array!3979) Bool)

(assert (=> b!84139 (= e!56254 (array_inv!1647 (buf!2191 thiss!1136)))))

(assert (= (and start!17462 res!69076) b!84137))

(assert (= (and b!84137 res!69075) b!84138))

(assert (= start!17462 b!84139))

(declare-fun m!130841 () Bool)

(assert (=> start!17462 m!130841))

(declare-fun m!130843 () Bool)

(assert (=> b!84137 m!130843))

(declare-fun m!130845 () Bool)

(assert (=> b!84139 m!130845))

(push 1)

(assert (not b!84139))

(assert (not b!84137))

(assert (not start!17462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

