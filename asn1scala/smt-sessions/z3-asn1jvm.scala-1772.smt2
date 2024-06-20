; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48486 () Bool)

(assert start!48486)

(declare-fun res!192505 () Bool)

(declare-fun e!157608 () Bool)

(assert (=> start!48486 (=> (not res!192505) (not e!157608))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11686 0))(
  ( (array!11687 (arr!6110 (Array (_ BitVec 32) (_ BitVec 8))) (size!5123 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9342 0))(
  ( (BitStream!9343 (buf!5664 array!11686) (currentByte!10599 (_ BitVec 32)) (currentBit!10594 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9342)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9342)

(assert (=> start!48486 (= res!192505 (and (= (size!5123 (buf!5664 b1!101)) (size!5123 (buf!5664 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48486 e!157608))

(declare-fun e!157603 () Bool)

(declare-fun inv!12 (BitStream!9342) Bool)

(assert (=> start!48486 (and (inv!12 b1!101) e!157603)))

(declare-fun e!157606 () Bool)

(assert (=> start!48486 (and (inv!12 b2!99) e!157606)))

(assert (=> start!48486 true))

(declare-fun b!229628 () Bool)

(declare-fun array_inv!4864 (array!11686) Bool)

(assert (=> b!229628 (= e!157603 (array_inv!4864 (buf!5664 b1!101)))))

(declare-fun lt!367546 () (_ BitVec 64))

(declare-fun lt!367547 () (_ BitVec 64))

(declare-fun lt!367548 () (_ BitVec 64))

(declare-fun b!229629 () Bool)

(declare-fun e!157607 () Bool)

(assert (=> b!229629 (= e!157607 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5123 (buf!5664 b1!101)))) lt!367548) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14258 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10599 b2!99))) ((_ sign_extend 32) (currentBit!10594 b2!99))))) (and (= lt!367547 bdg!14258) (= (bvsub lt!367547 bits!86) lt!367548) (let ((bdg!14259 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5123 (buf!5664 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14259 (bvsub bdg!14258 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14259 bdg!14258) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367546)) (or (bvsgt ((_ sign_extend 32) (size!5123 (buf!5664 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10599 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10594 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111))))))))))

(assert (=> b!229629 (= lt!367548 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10599 b1!101))) ((_ sign_extend 32) (currentBit!10594 b1!101))))))

(declare-fun b!229630 () Bool)

(declare-fun res!192502 () Bool)

(assert (=> b!229630 (=> (not res!192502) (not e!157607))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229630 (= res!192502 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5123 (buf!5664 b1!101))) ((_ sign_extend 32) (currentByte!10599 b1!101)) ((_ sign_extend 32) (currentBit!10594 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229631 () Bool)

(declare-fun e!157605 () Bool)

(assert (=> b!229631 (= e!157608 e!157605)))

(declare-fun res!192501 () Bool)

(assert (=> b!229631 (=> (not res!192501) (not e!157605))))

(assert (=> b!229631 (= res!192501 (bvsle bits!86 lt!367547))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229631 (= lt!367547 (bitIndex!0 (size!5123 (buf!5664 b2!99)) (currentByte!10599 b2!99) (currentBit!10594 b2!99)))))

(declare-fun b!229632 () Bool)

(assert (=> b!229632 (= e!157606 (array_inv!4864 (buf!5664 b2!99)))))

(declare-fun b!229633 () Bool)

(assert (=> b!229633 (= e!157605 e!157607)))

(declare-fun res!192500 () Bool)

(assert (=> b!229633 (=> (not res!192500) (not e!157607))))

(assert (=> b!229633 (= res!192500 (bvsle ((_ extract 31 0) lt!367546) bytes!19))))

(assert (=> b!229633 (= lt!367546 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!229634 () Bool)

(declare-fun res!192503 () Bool)

(assert (=> b!229634 (=> (not res!192503) (not e!157607))))

(assert (=> b!229634 (= res!192503 (= lt!367547 (bvadd (bitIndex!0 (size!5123 (buf!5664 b1!101)) (currentByte!10599 b1!101) (currentBit!10594 b1!101)) bits!86)))))

(declare-fun b!229635 () Bool)

(declare-fun res!192504 () Bool)

(assert (=> b!229635 (=> (not res!192504) (not e!157607))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229635 (= res!192504 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5123 (buf!5664 b1!101))) ((_ sign_extend 32) (currentByte!10599 b1!101)) ((_ sign_extend 32) (currentBit!10594 b1!101)) bytes!19))))

(assert (= (and start!48486 res!192505) b!229631))

(assert (= (and b!229631 res!192501) b!229633))

(assert (= (and b!229633 res!192500) b!229635))

(assert (= (and b!229635 res!192504) b!229634))

(assert (= (and b!229634 res!192503) b!229630))

(assert (= (and b!229630 res!192502) b!229629))

(assert (= start!48486 b!229628))

(assert (= start!48486 b!229632))

(declare-fun m!353255 () Bool)

(assert (=> b!229634 m!353255))

(declare-fun m!353257 () Bool)

(assert (=> b!229635 m!353257))

(declare-fun m!353259 () Bool)

(assert (=> start!48486 m!353259))

(declare-fun m!353261 () Bool)

(assert (=> start!48486 m!353261))

(declare-fun m!353263 () Bool)

(assert (=> b!229630 m!353263))

(declare-fun m!353265 () Bool)

(assert (=> b!229628 m!353265))

(declare-fun m!353267 () Bool)

(assert (=> b!229632 m!353267))

(declare-fun m!353269 () Bool)

(assert (=> b!229631 m!353269))

(check-sat (not b!229628) (not b!229635) (not b!229634) (not b!229631) (not b!229630) (not b!229632) (not start!48486))
(check-sat)
