; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48490 () Bool)

(assert start!48490)

(declare-fun b!229676 () Bool)

(declare-fun res!192537 () Bool)

(declare-fun e!157646 () Bool)

(assert (=> b!229676 (=> (not res!192537) (not e!157646))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11690 0))(
  ( (array!11691 (arr!6112 (Array (_ BitVec 32) (_ BitVec 8))) (size!5125 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9346 0))(
  ( (BitStream!9347 (buf!5666 array!11690) (currentByte!10601 (_ BitVec 32)) (currentBit!10596 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9346)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229676 (= res!192537 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5125 (buf!5666 b1!101))) ((_ sign_extend 32) (currentByte!10601 b1!101)) ((_ sign_extend 32) (currentBit!10596 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229678 () Bool)

(declare-fun e!157645 () Bool)

(declare-fun e!157651 () Bool)

(assert (=> b!229678 (= e!157645 e!157651)))

(declare-fun res!192538 () Bool)

(assert (=> b!229678 (=> (not res!192538) (not e!157651))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367566 () (_ BitVec 64))

(assert (=> b!229678 (= res!192538 (bvsle bits!86 lt!367566))))

(declare-fun b2!99 () BitStream!9346)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229678 (= lt!367566 (bitIndex!0 (size!5125 (buf!5666 b2!99)) (currentByte!10601 b2!99) (currentBit!10596 b2!99)))))

(declare-fun b!229679 () Bool)

(declare-fun res!192539 () Bool)

(assert (=> b!229679 (=> (not res!192539) (not e!157646))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229679 (= res!192539 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5125 (buf!5666 b1!101))) ((_ sign_extend 32) (currentByte!10601 b1!101)) ((_ sign_extend 32) (currentBit!10596 b1!101)) bytes!19))))

(declare-fun b!229680 () Bool)

(declare-fun e!157649 () Bool)

(declare-fun array_inv!4866 (array!11690) Bool)

(assert (=> b!229680 (= e!157649 (array_inv!4866 (buf!5666 b1!101)))))

(declare-fun b!229681 () Bool)

(assert (=> b!229681 (= e!157651 e!157646)))

(declare-fun res!192536 () Bool)

(assert (=> b!229681 (=> (not res!192536) (not e!157646))))

(declare-fun lt!367565 () (_ BitVec 64))

(assert (=> b!229681 (= res!192536 (bvsle ((_ extract 31 0) lt!367565) bytes!19))))

(assert (=> b!229681 (= lt!367565 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!229682 () Bool)

(declare-fun lt!367564 () (_ BitVec 64))

(assert (=> b!229682 (= e!157646 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5125 (buf!5666 b1!101)))) lt!367564) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14263 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10601 b2!99))) ((_ sign_extend 32) (currentBit!10596 b2!99))))) (and (= lt!367566 bdg!14263) (= (bvsub lt!367566 bits!86) lt!367564) (let ((bdg!14264 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5125 (buf!5666 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14264 (bvsub bdg!14263 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14264 bdg!14263) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367565)) (bvsle ((_ sign_extend 32) (size!5125 (buf!5666 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10601 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10596 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5125 (buf!5666 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10601 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10596 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!229682 (= lt!367564 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10601 b1!101))) ((_ sign_extend 32) (currentBit!10596 b1!101))))))

(declare-fun b!229683 () Bool)

(declare-fun res!192540 () Bool)

(assert (=> b!229683 (=> (not res!192540) (not e!157646))))

(assert (=> b!229683 (= res!192540 (= lt!367566 (bvadd (bitIndex!0 (size!5125 (buf!5666 b1!101)) (currentByte!10601 b1!101) (currentBit!10596 b1!101)) bits!86)))))

(declare-fun res!192541 () Bool)

(assert (=> start!48490 (=> (not res!192541) (not e!157645))))

(assert (=> start!48490 (= res!192541 (and (= (size!5125 (buf!5666 b1!101)) (size!5125 (buf!5666 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48490 e!157645))

(declare-fun inv!12 (BitStream!9346) Bool)

(assert (=> start!48490 (and (inv!12 b1!101) e!157649)))

(declare-fun e!157648 () Bool)

(assert (=> start!48490 (and (inv!12 b2!99) e!157648)))

(assert (=> start!48490 true))

(declare-fun b!229677 () Bool)

(assert (=> b!229677 (= e!157648 (array_inv!4866 (buf!5666 b2!99)))))

(assert (= (and start!48490 res!192541) b!229678))

(assert (= (and b!229678 res!192538) b!229681))

(assert (= (and b!229681 res!192536) b!229679))

(assert (= (and b!229679 res!192539) b!229683))

(assert (= (and b!229683 res!192540) b!229676))

(assert (= (and b!229676 res!192537) b!229682))

(assert (= start!48490 b!229680))

(assert (= start!48490 b!229677))

(declare-fun m!353287 () Bool)

(assert (=> b!229679 m!353287))

(declare-fun m!353289 () Bool)

(assert (=> b!229680 m!353289))

(declare-fun m!353291 () Bool)

(assert (=> b!229678 m!353291))

(declare-fun m!353293 () Bool)

(assert (=> b!229676 m!353293))

(declare-fun m!353295 () Bool)

(assert (=> b!229683 m!353295))

(declare-fun m!353297 () Bool)

(assert (=> start!48490 m!353297))

(declare-fun m!353299 () Bool)

(assert (=> start!48490 m!353299))

(declare-fun m!353301 () Bool)

(assert (=> b!229677 m!353301))

(push 1)

(assert (not b!229677))

(assert (not b!229683))

(assert (not b!229680))

(assert (not b!229676))

(assert (not start!48490))

(assert (not b!229679))

(assert (not b!229678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

