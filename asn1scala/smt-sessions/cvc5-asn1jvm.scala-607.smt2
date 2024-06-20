; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17330 () Bool)

(assert start!17330)

(declare-datatypes ((array!3918 0))(
  ( (array!3919 (arr!2415 (Array (_ BitVec 32) (_ BitVec 8))) (size!1778 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3118 0))(
  ( (BitStream!3119 (buf!2168 array!3918) (currentByte!4311 (_ BitVec 32)) (currentBit!4306 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3118)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!17330 (not (invariant!0 (currentBit!4306 b!169) (currentByte!4311 b!169) (size!1778 (buf!2168 b!169))))))

(declare-fun e!56081 () Bool)

(declare-fun inv!12 (BitStream!3118) Bool)

(assert (=> start!17330 (and (inv!12 b!169) e!56081)))

(declare-fun b!84007 () Bool)

(declare-fun array_inv!1624 (array!3918) Bool)

(assert (=> b!84007 (= e!56081 (array_inv!1624 (buf!2168 b!169)))))

(assert (= start!17330 b!84007))

(declare-fun m!130689 () Bool)

(assert (=> start!17330 m!130689))

(declare-fun m!130691 () Bool)

(assert (=> start!17330 m!130691))

(declare-fun m!130693 () Bool)

(assert (=> b!84007 m!130693))

(push 1)

(assert (not start!17330))

(assert (not b!84007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27002 () Bool)

(assert (=> d!27002 (= (invariant!0 (currentBit!4306 b!169) (currentByte!4311 b!169) (size!1778 (buf!2168 b!169))) (and (bvsge (currentBit!4306 b!169) #b00000000000000000000000000000000) (bvslt (currentBit!4306 b!169) #b00000000000000000000000000001000) (bvsge (currentByte!4311 b!169) #b00000000000000000000000000000000) (or (bvslt (currentByte!4311 b!169) (size!1778 (buf!2168 b!169))) (and (= (currentBit!4306 b!169) #b00000000000000000000000000000000) (= (currentByte!4311 b!169) (size!1778 (buf!2168 b!169)))))))))

(assert (=> start!17330 d!27002))

(declare-fun d!27008 () Bool)

(assert (=> d!27008 (= (inv!12 b!169) (invariant!0 (currentBit!4306 b!169) (currentByte!4311 b!169) (size!1778 (buf!2168 b!169))))))

(declare-fun bs!6668 () Bool)

(assert (= bs!6668 d!27008))

(assert (=> bs!6668 m!130689))

(assert (=> start!17330 d!27008))

(declare-fun d!27014 () Bool)

(assert (=> d!27014 (= (array_inv!1624 (buf!2168 b!169)) (bvsge (size!1778 (buf!2168 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!84007 d!27014))

(push 1)

