; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48484 () Bool)

(assert start!48484)

(declare-fun b!229604 () Bool)

(declare-fun res!192483 () Bool)

(declare-fun e!157587 () Bool)

(assert (=> b!229604 (=> (not res!192483) (not e!157587))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11684 0))(
  ( (array!11685 (arr!6109 (Array (_ BitVec 32) (_ BitVec 8))) (size!5122 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9340 0))(
  ( (BitStream!9341 (buf!5663 array!11684) (currentByte!10598 (_ BitVec 32)) (currentBit!10593 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9340)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229604 (= res!192483 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5122 (buf!5663 b1!101))) ((_ sign_extend 32) (currentByte!10598 b1!101)) ((_ sign_extend 32) (currentBit!10593 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229605 () Bool)

(declare-fun e!157582 () Bool)

(declare-fun b2!99 () BitStream!9340)

(declare-fun array_inv!4863 (array!11684) Bool)

(assert (=> b!229605 (= e!157582 (array_inv!4863 (buf!5663 b2!99)))))

(declare-fun b!229606 () Bool)

(declare-fun e!157585 () Bool)

(declare-fun e!157586 () Bool)

(assert (=> b!229606 (= e!157585 e!157586)))

(declare-fun res!192487 () Bool)

(assert (=> b!229606 (=> (not res!192487) (not e!157586))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367537 () (_ BitVec 64))

(assert (=> b!229606 (= res!192487 (bvsle bits!86 lt!367537))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229606 (= lt!367537 (bitIndex!0 (size!5122 (buf!5663 b2!99)) (currentByte!10598 b2!99) (currentBit!10593 b2!99)))))

(declare-fun b!229607 () Bool)

(declare-fun res!192482 () Bool)

(assert (=> b!229607 (=> (not res!192482) (not e!157587))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229607 (= res!192482 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5122 (buf!5663 b1!101))) ((_ sign_extend 32) (currentByte!10598 b1!101)) ((_ sign_extend 32) (currentBit!10593 b1!101)) bytes!19))))

(declare-fun res!192484 () Bool)

(assert (=> start!48484 (=> (not res!192484) (not e!157585))))

(assert (=> start!48484 (= res!192484 (and (= (size!5122 (buf!5663 b1!101)) (size!5122 (buf!5663 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48484 e!157585))

(declare-fun e!157584 () Bool)

(declare-fun inv!12 (BitStream!9340) Bool)

(assert (=> start!48484 (and (inv!12 b1!101) e!157584)))

(assert (=> start!48484 (and (inv!12 b2!99) e!157582)))

(assert (=> start!48484 true))

(declare-fun lt!367539 () (_ BitVec 64))

(declare-fun b!229608 () Bool)

(declare-fun lt!367538 () (_ BitVec 64))

(assert (=> b!229608 (= e!157587 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5122 (buf!5663 b1!101)))) lt!367538) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14258 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10598 b2!99))) ((_ sign_extend 32) (currentBit!10593 b2!99))))) (and (= lt!367537 bdg!14258) (= (bvsub lt!367537 bits!86) lt!367538) (let ((bdg!14259 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5122 (buf!5663 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14259 (bvsub bdg!14258 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14259 bdg!14258) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367539)) (or (bvsgt ((_ sign_extend 32) (size!5122 (buf!5663 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10598 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10593 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111))))))))))

(assert (=> b!229608 (= lt!367538 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10598 b1!101))) ((_ sign_extend 32) (currentBit!10593 b1!101))))))

(declare-fun b!229609 () Bool)

(assert (=> b!229609 (= e!157584 (array_inv!4863 (buf!5663 b1!101)))))

(declare-fun b!229610 () Bool)

(assert (=> b!229610 (= e!157586 e!157587)))

(declare-fun res!192485 () Bool)

(assert (=> b!229610 (=> (not res!192485) (not e!157587))))

(assert (=> b!229610 (= res!192485 (bvsle ((_ extract 31 0) lt!367539) bytes!19))))

(assert (=> b!229610 (= lt!367539 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!229611 () Bool)

(declare-fun res!192486 () Bool)

(assert (=> b!229611 (=> (not res!192486) (not e!157587))))

(assert (=> b!229611 (= res!192486 (= lt!367537 (bvadd (bitIndex!0 (size!5122 (buf!5663 b1!101)) (currentByte!10598 b1!101) (currentBit!10593 b1!101)) bits!86)))))

(assert (= (and start!48484 res!192484) b!229606))

(assert (= (and b!229606 res!192487) b!229610))

(assert (= (and b!229610 res!192485) b!229607))

(assert (= (and b!229607 res!192482) b!229611))

(assert (= (and b!229611 res!192486) b!229604))

(assert (= (and b!229604 res!192483) b!229608))

(assert (= start!48484 b!229609))

(assert (= start!48484 b!229605))

(declare-fun m!353239 () Bool)

(assert (=> b!229607 m!353239))

(declare-fun m!353241 () Bool)

(assert (=> b!229609 m!353241))

(declare-fun m!353243 () Bool)

(assert (=> b!229611 m!353243))

(declare-fun m!353245 () Bool)

(assert (=> b!229605 m!353245))

(declare-fun m!353247 () Bool)

(assert (=> b!229604 m!353247))

(declare-fun m!353249 () Bool)

(assert (=> b!229606 m!353249))

(declare-fun m!353251 () Bool)

(assert (=> start!48484 m!353251))

(declare-fun m!353253 () Bool)

(assert (=> start!48484 m!353253))

(push 1)

(assert (not b!229609))

(assert (not b!229611))

(assert (not b!229606))

(assert (not start!48484))

(assert (not b!229605))

(assert (not b!229604))

(assert (not b!229607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

