; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48494 () Bool)

(assert start!48494)

(declare-fun b!229724 () Bool)

(declare-fun res!192577 () Bool)

(declare-fun e!157689 () Bool)

(assert (=> b!229724 (=> (not res!192577) (not e!157689))))

(declare-datatypes ((array!11694 0))(
  ( (array!11695 (arr!6114 (Array (_ BitVec 32) (_ BitVec 8))) (size!5127 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9350 0))(
  ( (BitStream!9351 (buf!5668 array!11694) (currentByte!10603 (_ BitVec 32)) (currentBit!10598 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9350)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229724 (= res!192577 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5127 (buf!5668 b1!101))) ((_ sign_extend 32) (currentByte!10603 b1!101)) ((_ sign_extend 32) (currentBit!10598 b1!101)) bytes!19))))

(declare-fun b!229725 () Bool)

(declare-fun e!157688 () Bool)

(declare-fun b2!99 () BitStream!9350)

(declare-fun array_inv!4868 (array!11694) Bool)

(assert (=> b!229725 (= e!157688 (array_inv!4868 (buf!5668 b2!99)))))

(declare-fun b!229726 () Bool)

(declare-fun e!157687 () Bool)

(assert (=> b!229726 (= e!157687 e!157689)))

(declare-fun res!192576 () Bool)

(assert (=> b!229726 (=> (not res!192576) (not e!157689))))

(declare-fun lt!367582 () (_ BitVec 64))

(assert (=> b!229726 (= res!192576 (bvsle ((_ extract 31 0) lt!367582) bytes!19))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!229726 (= lt!367582 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun res!192574 () Bool)

(declare-fun e!157693 () Bool)

(assert (=> start!48494 (=> (not res!192574) (not e!157693))))

(assert (=> start!48494 (= res!192574 (and (= (size!5127 (buf!5668 b1!101)) (size!5127 (buf!5668 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48494 e!157693))

(declare-fun e!157692 () Bool)

(declare-fun inv!12 (BitStream!9350) Bool)

(assert (=> start!48494 (and (inv!12 b1!101) e!157692)))

(assert (=> start!48494 (and (inv!12 b2!99) e!157688)))

(assert (=> start!48494 true))

(declare-fun b!229727 () Bool)

(assert (=> b!229727 (= e!157693 e!157687)))

(declare-fun res!192575 () Bool)

(assert (=> b!229727 (=> (not res!192575) (not e!157687))))

(declare-fun lt!367583 () (_ BitVec 64))

(assert (=> b!229727 (= res!192575 (bvsle bits!86 lt!367583))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229727 (= lt!367583 (bitIndex!0 (size!5127 (buf!5668 b2!99)) (currentByte!10603 b2!99) (currentBit!10598 b2!99)))))

(declare-fun b!229728 () Bool)

(declare-fun res!192572 () Bool)

(assert (=> b!229728 (=> (not res!192572) (not e!157689))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229728 (= res!192572 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5127 (buf!5668 b1!101))) ((_ sign_extend 32) (currentByte!10603 b1!101)) ((_ sign_extend 32) (currentBit!10598 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229729 () Bool)

(declare-fun res!192573 () Bool)

(assert (=> b!229729 (=> (not res!192573) (not e!157689))))

(assert (=> b!229729 (= res!192573 (= lt!367583 (bvadd (bitIndex!0 (size!5127 (buf!5668 b1!101)) (currentByte!10603 b1!101) (currentBit!10598 b1!101)) bits!86)))))

(declare-fun lt!367584 () (_ BitVec 64))

(declare-fun b!229730 () Bool)

(assert (=> b!229730 (= e!157689 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5127 (buf!5668 b1!101)))) lt!367584) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14263 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10603 b2!99))) ((_ sign_extend 32) (currentBit!10598 b2!99))))) (and (= lt!367583 bdg!14263) (= (bvsub lt!367583 bits!86) lt!367584) (let ((bdg!14264 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5127 (buf!5668 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14264 (bvsub bdg!14263 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14264 bdg!14263) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367582)) (bvsle ((_ sign_extend 32) (size!5127 (buf!5668 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10603 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10598 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5127 (buf!5668 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10603 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10598 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!229730 (= lt!367584 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10603 b1!101))) ((_ sign_extend 32) (currentBit!10598 b1!101))))))

(declare-fun b!229731 () Bool)

(assert (=> b!229731 (= e!157692 (array_inv!4868 (buf!5668 b1!101)))))

(assert (= (and start!48494 res!192574) b!229727))

(assert (= (and b!229727 res!192575) b!229726))

(assert (= (and b!229726 res!192576) b!229724))

(assert (= (and b!229724 res!192577) b!229729))

(assert (= (and b!229729 res!192573) b!229728))

(assert (= (and b!229728 res!192572) b!229730))

(assert (= start!48494 b!229731))

(assert (= start!48494 b!229725))

(declare-fun m!353319 () Bool)

(assert (=> b!229724 m!353319))

(declare-fun m!353321 () Bool)

(assert (=> b!229727 m!353321))

(declare-fun m!353323 () Bool)

(assert (=> b!229728 m!353323))

(declare-fun m!353325 () Bool)

(assert (=> b!229729 m!353325))

(declare-fun m!353327 () Bool)

(assert (=> b!229725 m!353327))

(declare-fun m!353329 () Bool)

(assert (=> b!229731 m!353329))

(declare-fun m!353331 () Bool)

(assert (=> start!48494 m!353331))

(declare-fun m!353333 () Bool)

(assert (=> start!48494 m!353333))

(push 1)

(assert (not b!229728))

(assert (not b!229727))

(assert (not b!229725))

(assert (not b!229729))

(assert (not b!229724))

(assert (not start!48494))

(assert (not b!229731))

(check-sat)

(pop 1)

(push 1)

(check-sat)

