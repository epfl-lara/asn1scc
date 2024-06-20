; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17310 () Bool)

(assert start!17310)

(declare-fun res!69007 () Bool)

(declare-fun e!56056 () Bool)

(assert (=> start!17310 (=> (not res!69007) (not e!56056))))

(declare-datatypes ((array!3911 0))(
  ( (array!3912 (arr!2412 (Array (_ BitVec 32) (_ BitVec 8))) (size!1775 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3112 0))(
  ( (BitStream!3113 (buf!2165 array!3911) (currentByte!4305 (_ BitVec 32)) (currentBit!4300 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3112)

(assert (=> start!17310 (= res!69007 (and (bvsle ((_ sign_extend 32) (size!1775 (buf!2165 b!169))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4305 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4300 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1775 (buf!2165 b!169))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4305 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4300 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17310 e!56056))

(declare-fun e!56057 () Bool)

(declare-fun inv!12 (BitStream!3112) Bool)

(assert (=> start!17310 (and (inv!12 b!169) e!56057)))

(declare-fun b!83991 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!83991 (= e!56056 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4300 b!169))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4305 b!169))) ((_ extract 31 0) ((_ sign_extend 32) (size!1775 (buf!2165 b!169)))))))))

(declare-fun b!83992 () Bool)

(declare-fun array_inv!1621 (array!3911) Bool)

(assert (=> b!83992 (= e!56057 (array_inv!1621 (buf!2165 b!169)))))

(assert (= (and start!17310 res!69007) b!83991))

(assert (= start!17310 b!83992))

(declare-fun m!130665 () Bool)

(assert (=> start!17310 m!130665))

(declare-fun m!130667 () Bool)

(assert (=> b!83991 m!130667))

(declare-fun m!130669 () Bool)

(assert (=> b!83992 m!130669))

(push 1)

(assert (not start!17310))

(assert (not b!83991))

(assert (not b!83992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

