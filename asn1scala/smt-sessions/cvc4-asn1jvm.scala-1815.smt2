; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49006 () Bool)

(assert start!49006)

(declare-fun b!232535 () Bool)

(declare-fun res!194631 () Bool)

(declare-fun e!160095 () Bool)

(assert (=> b!232535 (=> (not res!194631) (not e!160095))))

(declare-datatypes ((array!11975 0))(
  ( (array!11976 (arr!6240 (Array (_ BitVec 32) (_ BitVec 8))) (size!5253 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9602 0))(
  ( (BitStream!9603 (buf!5794 array!11975) (currentByte!10801 (_ BitVec 32)) (currentBit!10796 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9602)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232535 (= res!194631 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5253 (buf!5794 b1!101))) ((_ sign_extend 32) (currentByte!10801 b1!101)) ((_ sign_extend 32) (currentBit!10796 b1!101)) bytes!19))))

(declare-fun b!232536 () Bool)

(declare-fun e!160092 () Bool)

(declare-fun array_inv!4994 (array!11975) Bool)

(assert (=> b!232536 (= e!160092 (array_inv!4994 (buf!5794 b1!101)))))

(declare-fun b!232537 () Bool)

(declare-fun e!160093 () Bool)

(assert (=> b!232537 (= e!160093 e!160095)))

(declare-fun res!194627 () Bool)

(assert (=> b!232537 (=> (not res!194627) (not e!160095))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368967 () (_ BitVec 64))

(assert (=> b!232537 (= res!194627 (and (bvsle bits!86 lt!368967) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9602)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232537 (= lt!368967 (bitIndex!0 (size!5253 (buf!5794 b2!99)) (currentByte!10801 b2!99) (currentBit!10796 b2!99)))))

(declare-fun b!232538 () Bool)

(declare-fun res!194629 () Bool)

(assert (=> b!232538 (=> (not res!194629) (not e!160095))))

(assert (=> b!232538 (= res!194629 (= lt!368967 (bvadd (bitIndex!0 (size!5253 (buf!5794 b1!101)) (currentByte!10801 b1!101) (currentBit!10796 b1!101)) bits!86)))))

(declare-fun b!232539 () Bool)

(declare-fun res!194628 () Bool)

(assert (=> b!232539 (=> (not res!194628) (not e!160095))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232539 (= res!194628 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5253 (buf!5794 b1!101))) ((_ sign_extend 32) (currentByte!10801 b1!101)) ((_ sign_extend 32) (currentBit!10796 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232540 () Bool)

(declare-fun lt!368966 () (_ BitVec 64))

(assert (=> b!232540 (= e!160095 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5253 (buf!5794 b1!101)))) lt!368966) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14370 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10801 b2!99))) ((_ sign_extend 32) (currentBit!10796 b2!99))))) (and (= lt!368967 bdg!14370) (= (bvsub lt!368967 bits!86) lt!368966) (let ((bdg!14371 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5253 (buf!5794 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14371 (bvsub bdg!14370 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14372 (bvand bdg!14371 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14372 (bvand bdg!14370 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14372 (bvand (bvsub bdg!14371 bdg!14370) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))))

(assert (=> b!232540 (= lt!368966 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10801 b1!101))) ((_ sign_extend 32) (currentBit!10796 b1!101))))))

(declare-fun b!232541 () Bool)

(declare-fun e!160094 () Bool)

(assert (=> b!232541 (= e!160094 (array_inv!4994 (buf!5794 b2!99)))))

(declare-fun res!194630 () Bool)

(assert (=> start!49006 (=> (not res!194630) (not e!160093))))

(assert (=> start!49006 (= res!194630 (and (= (size!5253 (buf!5794 b1!101)) (size!5253 (buf!5794 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49006 e!160093))

(declare-fun inv!12 (BitStream!9602) Bool)

(assert (=> start!49006 (and (inv!12 b1!101) e!160092)))

(assert (=> start!49006 (and (inv!12 b2!99) e!160094)))

(assert (=> start!49006 true))

(assert (= (and start!49006 res!194630) b!232537))

(assert (= (and b!232537 res!194627) b!232535))

(assert (= (and b!232535 res!194631) b!232538))

(assert (= (and b!232538 res!194629) b!232539))

(assert (= (and b!232539 res!194628) b!232540))

(assert (= start!49006 b!232536))

(assert (= start!49006 b!232541))

(declare-fun m!355399 () Bool)

(assert (=> start!49006 m!355399))

(declare-fun m!355401 () Bool)

(assert (=> start!49006 m!355401))

(declare-fun m!355403 () Bool)

(assert (=> b!232539 m!355403))

(declare-fun m!355405 () Bool)

(assert (=> b!232535 m!355405))

(declare-fun m!355407 () Bool)

(assert (=> b!232536 m!355407))

(declare-fun m!355409 () Bool)

(assert (=> b!232541 m!355409))

(declare-fun m!355411 () Bool)

(assert (=> b!232537 m!355411))

(declare-fun m!355413 () Bool)

(assert (=> b!232538 m!355413))

(push 1)

(assert (not b!232541))

(assert (not b!232538))

(assert (not start!49006))

(assert (not b!232535))

(assert (not b!232536))

(assert (not b!232539))

(assert (not b!232537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

