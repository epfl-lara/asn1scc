; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48886 () Bool)

(assert start!48886)

(declare-fun b!231311 () Bool)

(declare-fun e!159049 () Bool)

(declare-datatypes ((array!11855 0))(
  ( (array!11856 (arr!6180 (Array (_ BitVec 32) (_ BitVec 8))) (size!5193 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9482 0))(
  ( (BitStream!9483 (buf!5734 array!11855) (currentByte!10741 (_ BitVec 32)) (currentBit!10736 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9482)

(assert (=> b!231311 (= e!159049 (and (not (= ((_ sign_extend 32) (currentByte!10741 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10741 b1!101))) ((_ sign_extend 32) (currentByte!10741 b1!101)))))))))

(declare-fun b!231312 () Bool)

(declare-fun e!159052 () Bool)

(declare-fun b2!99 () BitStream!9482)

(declare-fun array_inv!4934 (array!11855) Bool)

(assert (=> b!231312 (= e!159052 (array_inv!4934 (buf!5734 b2!99)))))

(declare-fun b!231313 () Bool)

(declare-fun res!193763 () Bool)

(assert (=> b!231313 (=> (not res!193763) (not e!159049))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231313 (= res!193763 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5193 (buf!5734 b1!101))) ((_ sign_extend 32) (currentByte!10741 b1!101)) ((_ sign_extend 32) (currentBit!10736 b1!101)) bytes!19))))

(declare-fun b!231314 () Bool)

(declare-fun res!193765 () Bool)

(assert (=> b!231314 (=> (not res!193765) (not e!159049))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368634 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231314 (= res!193765 (= lt!368634 (bvadd (bitIndex!0 (size!5193 (buf!5734 b1!101)) (currentByte!10741 b1!101) (currentBit!10736 b1!101)) bits!86)))))

(declare-fun b!231315 () Bool)

(declare-fun e!159048 () Bool)

(assert (=> b!231315 (= e!159048 e!159049)))

(declare-fun res!193767 () Bool)

(assert (=> b!231315 (=> (not res!193767) (not e!159049))))

(assert (=> b!231315 (= res!193767 (and (bvsle bits!86 lt!368634) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231315 (= lt!368634 (bitIndex!0 (size!5193 (buf!5734 b2!99)) (currentByte!10741 b2!99) (currentBit!10736 b2!99)))))

(declare-fun b!231316 () Bool)

(declare-fun res!193764 () Bool)

(assert (=> b!231316 (=> (not res!193764) (not e!159049))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231316 (= res!193764 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5193 (buf!5734 b1!101))) ((_ sign_extend 32) (currentByte!10741 b1!101)) ((_ sign_extend 32) (currentBit!10736 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!193766 () Bool)

(assert (=> start!48886 (=> (not res!193766) (not e!159048))))

(assert (=> start!48886 (= res!193766 (and (= (size!5193 (buf!5734 b1!101)) (size!5193 (buf!5734 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48886 e!159048))

(declare-fun e!159053 () Bool)

(declare-fun inv!12 (BitStream!9482) Bool)

(assert (=> start!48886 (and (inv!12 b1!101) e!159053)))

(assert (=> start!48886 (and (inv!12 b2!99) e!159052)))

(assert (=> start!48886 true))

(declare-fun b!231317 () Bool)

(assert (=> b!231317 (= e!159053 (array_inv!4934 (buf!5734 b1!101)))))

(assert (= (and start!48886 res!193766) b!231315))

(assert (= (and b!231315 res!193767) b!231313))

(assert (= (and b!231313 res!193763) b!231314))

(assert (= (and b!231314 res!193765) b!231316))

(assert (= (and b!231316 res!193764) b!231311))

(assert (= start!48886 b!231317))

(assert (= start!48886 b!231312))

(declare-fun m!354463 () Bool)

(assert (=> b!231312 m!354463))

(declare-fun m!354465 () Bool)

(assert (=> b!231317 m!354465))

(declare-fun m!354467 () Bool)

(assert (=> b!231316 m!354467))

(declare-fun m!354469 () Bool)

(assert (=> start!48886 m!354469))

(declare-fun m!354471 () Bool)

(assert (=> start!48886 m!354471))

(declare-fun m!354473 () Bool)

(assert (=> b!231315 m!354473))

(declare-fun m!354475 () Bool)

(assert (=> b!231314 m!354475))

(declare-fun m!354477 () Bool)

(assert (=> b!231313 m!354477))

(push 1)

(assert (not b!231312))

(assert (not b!231317))

(assert (not b!231314))

(assert (not b!231313))

(assert (not start!48886))

(assert (not b!231316))

(assert (not b!231315))

(check-sat)

(pop 1)

(push 1)

(check-sat)

