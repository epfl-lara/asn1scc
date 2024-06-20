; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49002 () Bool)

(assert start!49002)

(declare-fun b!232493 () Bool)

(declare-fun e!160059 () Bool)

(declare-datatypes ((array!11971 0))(
  ( (array!11972 (arr!6238 (Array (_ BitVec 32) (_ BitVec 8))) (size!5251 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9598 0))(
  ( (BitStream!9599 (buf!5792 array!11971) (currentByte!10799 (_ BitVec 32)) (currentBit!10794 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9598)

(declare-fun array_inv!4992 (array!11971) Bool)

(assert (=> b!232493 (= e!160059 (array_inv!4992 (buf!5792 b2!99)))))

(declare-fun res!194600 () Bool)

(declare-fun e!160056 () Bool)

(assert (=> start!49002 (=> (not res!194600) (not e!160056))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b1!101 () BitStream!9598)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!49002 (= res!194600 (and (= (size!5251 (buf!5792 b1!101)) (size!5251 (buf!5792 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49002 e!160056))

(declare-fun e!160057 () Bool)

(declare-fun inv!12 (BitStream!9598) Bool)

(assert (=> start!49002 (and (inv!12 b1!101) e!160057)))

(assert (=> start!49002 (and (inv!12 b2!99) e!160059)))

(assert (=> start!49002 true))

(declare-fun b!232494 () Bool)

(assert (=> b!232494 (= e!160057 (array_inv!4992 (buf!5792 b1!101)))))

(declare-fun lt!368954 () (_ BitVec 64))

(declare-fun b!232495 () Bool)

(declare-fun lt!368955 () (_ BitVec 64))

(declare-fun e!160060 () Bool)

(assert (=> b!232495 (= e!160060 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5251 (buf!5792 b1!101)))) lt!368955) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14370 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10799 b2!99))) ((_ sign_extend 32) (currentBit!10794 b2!99))))) (and (= lt!368954 bdg!14370) (= (bvsub lt!368954 bits!86) lt!368955) (let ((bdg!14371 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5251 (buf!5792 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14371 (bvsub bdg!14370 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14372 (bvand bdg!14371 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14372 (bvand bdg!14370 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14372 (bvand (bvsub bdg!14371 bdg!14370) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))))

(assert (=> b!232495 (= lt!368955 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10799 b1!101))) ((_ sign_extend 32) (currentBit!10794 b1!101))))))

(declare-fun b!232496 () Bool)

(declare-fun res!194601 () Bool)

(assert (=> b!232496 (=> (not res!194601) (not e!160060))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232496 (= res!194601 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5251 (buf!5792 b1!101))) ((_ sign_extend 32) (currentByte!10799 b1!101)) ((_ sign_extend 32) (currentBit!10794 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232497 () Bool)

(declare-fun res!194597 () Bool)

(assert (=> b!232497 (=> (not res!194597) (not e!160060))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232497 (= res!194597 (= lt!368954 (bvadd (bitIndex!0 (size!5251 (buf!5792 b1!101)) (currentByte!10799 b1!101) (currentBit!10794 b1!101)) bits!86)))))

(declare-fun b!232498 () Bool)

(assert (=> b!232498 (= e!160056 e!160060)))

(declare-fun res!194599 () Bool)

(assert (=> b!232498 (=> (not res!194599) (not e!160060))))

(assert (=> b!232498 (= res!194599 (and (bvsle bits!86 lt!368954) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232498 (= lt!368954 (bitIndex!0 (size!5251 (buf!5792 b2!99)) (currentByte!10799 b2!99) (currentBit!10794 b2!99)))))

(declare-fun b!232499 () Bool)

(declare-fun res!194598 () Bool)

(assert (=> b!232499 (=> (not res!194598) (not e!160060))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232499 (= res!194598 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5251 (buf!5792 b1!101))) ((_ sign_extend 32) (currentByte!10799 b1!101)) ((_ sign_extend 32) (currentBit!10794 b1!101)) bytes!19))))

(assert (= (and start!49002 res!194600) b!232498))

(assert (= (and b!232498 res!194599) b!232499))

(assert (= (and b!232499 res!194598) b!232497))

(assert (= (and b!232497 res!194597) b!232496))

(assert (= (and b!232496 res!194601) b!232495))

(assert (= start!49002 b!232494))

(assert (= start!49002 b!232493))

(declare-fun m!355367 () Bool)

(assert (=> b!232493 m!355367))

(declare-fun m!355369 () Bool)

(assert (=> b!232499 m!355369))

(declare-fun m!355371 () Bool)

(assert (=> b!232496 m!355371))

(declare-fun m!355373 () Bool)

(assert (=> start!49002 m!355373))

(declare-fun m!355375 () Bool)

(assert (=> start!49002 m!355375))

(declare-fun m!355377 () Bool)

(assert (=> b!232497 m!355377))

(declare-fun m!355379 () Bool)

(assert (=> b!232498 m!355379))

(declare-fun m!355381 () Bool)

(assert (=> b!232494 m!355381))

(push 1)

(assert (not b!232499))

(assert (not b!232496))

(assert (not b!232494))

(assert (not b!232493))

(assert (not start!49002))

(assert (not b!232498))

(assert (not b!232497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

