; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48998 () Bool)

(assert start!48998)

(declare-fun b!232451 () Bool)

(declare-fun res!194567 () Bool)

(declare-fun e!160020 () Bool)

(assert (=> b!232451 (=> (not res!194567) (not e!160020))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368943 () (_ BitVec 64))

(declare-datatypes ((array!11967 0))(
  ( (array!11968 (arr!6236 (Array (_ BitVec 32) (_ BitVec 8))) (size!5249 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9594 0))(
  ( (BitStream!9595 (buf!5790 array!11967) (currentByte!10797 (_ BitVec 32)) (currentBit!10792 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9594)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232451 (= res!194567 (= lt!368943 (bvadd (bitIndex!0 (size!5249 (buf!5790 b1!101)) (currentByte!10797 b1!101) (currentBit!10792 b1!101)) bits!86)))))

(declare-fun b!232453 () Bool)

(declare-fun res!194571 () Bool)

(assert (=> b!232453 (=> (not res!194571) (not e!160020))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232453 (= res!194571 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5249 (buf!5790 b1!101))) ((_ sign_extend 32) (currentByte!10797 b1!101)) ((_ sign_extend 32) (currentBit!10792 b1!101)) bytes!19))))

(declare-fun b!232454 () Bool)

(declare-fun res!194568 () Bool)

(assert (=> b!232454 (=> (not res!194568) (not e!160020))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232454 (= res!194568 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5249 (buf!5790 b1!101))) ((_ sign_extend 32) (currentByte!10797 b1!101)) ((_ sign_extend 32) (currentBit!10792 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232455 () Bool)

(declare-fun e!160025 () Bool)

(declare-fun b2!99 () BitStream!9594)

(declare-fun array_inv!4990 (array!11967) Bool)

(assert (=> b!232455 (= e!160025 (array_inv!4990 (buf!5790 b2!99)))))

(declare-fun b!232456 () Bool)

(declare-fun e!160023 () Bool)

(assert (=> b!232456 (= e!160023 e!160020)))

(declare-fun res!194570 () Bool)

(assert (=> b!232456 (=> (not res!194570) (not e!160020))))

(assert (=> b!232456 (= res!194570 (and (bvsle bits!86 lt!368943) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232456 (= lt!368943 (bitIndex!0 (size!5249 (buf!5790 b2!99)) (currentByte!10797 b2!99) (currentBit!10792 b2!99)))))

(declare-fun b!232457 () Bool)

(declare-fun e!160024 () Bool)

(assert (=> b!232457 (= e!160024 (array_inv!4990 (buf!5790 b1!101)))))

(declare-fun b!232452 () Bool)

(declare-fun lt!368942 () (_ BitVec 64))

(assert (=> b!232452 (= e!160020 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5249 (buf!5790 b1!101)))) lt!368942) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14365 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10797 b2!99))))) (let ((bdg!14366 (bvadd bdg!14365 ((_ sign_extend 32) (currentBit!10792 b2!99))))) (and (= lt!368943 bdg!14366) (= (bvsub lt!368943 bits!86) lt!368942) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5249 (buf!5790 b2!99)))) (bvsub bdg!14366 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14367 (bvand bdg!14365 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14367 (bvand ((_ sign_extend 32) (currentBit!10792 b2!99)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14367 (bvand bdg!14366 #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))

(assert (=> b!232452 (= lt!368942 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10797 b1!101))) ((_ sign_extend 32) (currentBit!10792 b1!101))))))

(declare-fun res!194569 () Bool)

(assert (=> start!48998 (=> (not res!194569) (not e!160023))))

(assert (=> start!48998 (= res!194569 (and (= (size!5249 (buf!5790 b1!101)) (size!5249 (buf!5790 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48998 e!160023))

(declare-fun inv!12 (BitStream!9594) Bool)

(assert (=> start!48998 (and (inv!12 b1!101) e!160024)))

(assert (=> start!48998 (and (inv!12 b2!99) e!160025)))

(assert (=> start!48998 true))

(assert (= (and start!48998 res!194569) b!232456))

(assert (= (and b!232456 res!194570) b!232453))

(assert (= (and b!232453 res!194571) b!232451))

(assert (= (and b!232451 res!194567) b!232454))

(assert (= (and b!232454 res!194568) b!232452))

(assert (= start!48998 b!232457))

(assert (= start!48998 b!232455))

(declare-fun m!355335 () Bool)

(assert (=> start!48998 m!355335))

(declare-fun m!355337 () Bool)

(assert (=> start!48998 m!355337))

(declare-fun m!355339 () Bool)

(assert (=> b!232451 m!355339))

(declare-fun m!355341 () Bool)

(assert (=> b!232454 m!355341))

(declare-fun m!355343 () Bool)

(assert (=> b!232453 m!355343))

(declare-fun m!355345 () Bool)

(assert (=> b!232456 m!355345))

(declare-fun m!355347 () Bool)

(assert (=> b!232457 m!355347))

(declare-fun m!355349 () Bool)

(assert (=> b!232455 m!355349))

(check-sat (not b!232456) (not b!232451) (not b!232455) (not b!232454) (not b!232453) (not start!48998) (not b!232457))
(check-sat)
