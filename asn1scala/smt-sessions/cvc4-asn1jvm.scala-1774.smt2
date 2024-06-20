; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48512 () Bool)

(assert start!48512)

(declare-fun b!229828 () Bool)

(declare-fun res!192658 () Bool)

(declare-fun e!157781 () Bool)

(assert (=> b!229828 (=> (not res!192658) (not e!157781))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367652 () (_ BitVec 64))

(declare-datatypes ((array!11701 0))(
  ( (array!11702 (arr!6117 (Array (_ BitVec 32) (_ BitVec 8))) (size!5130 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9356 0))(
  ( (BitStream!9357 (buf!5671 array!11701) (currentByte!10610 (_ BitVec 32)) (currentBit!10605 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9356)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229828 (= res!192658 (= lt!367652 (bvadd (bitIndex!0 (size!5130 (buf!5671 b1!101)) (currentByte!10610 b1!101) (currentBit!10605 b1!101)) bits!86)))))

(declare-fun b!229829 () Bool)

(declare-fun e!157787 () Bool)

(declare-fun e!157784 () Bool)

(assert (=> b!229829 (= e!157787 e!157784)))

(declare-fun res!192664 () Bool)

(assert (=> b!229829 (=> (not res!192664) (not e!157784))))

(declare-fun lt!367650 () (_ BitVec 64))

(declare-fun lt!367651 () (_ BitVec 64))

(assert (=> b!229829 (= res!192664 (and (= lt!367652 lt!367650) (= (bvsub lt!367652 bits!86) lt!367651)))))

(declare-fun b2!99 () BitStream!9356)

(assert (=> b!229829 (= lt!367650 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10610 b2!99))) ((_ sign_extend 32) (currentBit!10605 b2!99))))))

(declare-fun b!229830 () Bool)

(declare-fun e!157778 () Bool)

(declare-fun array_inv!4871 (array!11701) Bool)

(assert (=> b!229830 (= e!157778 (array_inv!4871 (buf!5671 b1!101)))))

(declare-fun b!229831 () Bool)

(declare-fun res!192666 () Bool)

(assert (=> b!229831 (=> (not res!192666) (not e!157781))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229831 (= res!192666 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5130 (buf!5671 b1!101))) ((_ sign_extend 32) (currentByte!10610 b1!101)) ((_ sign_extend 32) (currentBit!10605 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229832 () Bool)

(declare-fun e!157785 () Bool)

(assert (=> b!229832 (= e!157785 (array_inv!4871 (buf!5671 b2!99)))))

(declare-fun b!229833 () Bool)

(assert (=> b!229833 (= e!157781 e!157787)))

(declare-fun res!192665 () Bool)

(assert (=> b!229833 (=> (not res!192665) (not e!157787))))

(assert (=> b!229833 (= res!192665 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5130 (buf!5671 b1!101)))) lt!367651) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229833 (= lt!367651 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10610 b1!101))) ((_ sign_extend 32) (currentBit!10605 b1!101))))))

(declare-fun b!229834 () Bool)

(declare-fun e!157782 () Bool)

(declare-fun e!157780 () Bool)

(assert (=> b!229834 (= e!157782 e!157780)))

(declare-fun res!192660 () Bool)

(assert (=> b!229834 (=> (not res!192660) (not e!157780))))

(assert (=> b!229834 (= res!192660 (bvsle bits!86 lt!367652))))

(assert (=> b!229834 (= lt!367652 (bitIndex!0 (size!5130 (buf!5671 b2!99)) (currentByte!10610 b2!99) (currentBit!10605 b2!99)))))

(declare-fun res!192659 () Bool)

(assert (=> start!48512 (=> (not res!192659) (not e!157782))))

(assert (=> start!48512 (= res!192659 (and (= (size!5130 (buf!5671 b1!101)) (size!5130 (buf!5671 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48512 e!157782))

(declare-fun inv!12 (BitStream!9356) Bool)

(assert (=> start!48512 (and (inv!12 b1!101) e!157778)))

(assert (=> start!48512 (and (inv!12 b2!99) e!157785)))

(assert (=> start!48512 true))

(declare-fun b!229835 () Bool)

(declare-fun e!157786 () Bool)

(assert (=> b!229835 (= e!157784 e!157786)))

(declare-fun res!192662 () Bool)

(assert (=> b!229835 (=> (not res!192662) (not e!157786))))

(declare-fun lt!367653 () (_ BitVec 64))

(declare-fun lt!367649 () (_ BitVec 64))

(assert (=> b!229835 (= res!192662 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367653 (bvsub lt!367650 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367653 lt!367650) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367649)) (bvsle ((_ sign_extend 32) (size!5130 (buf!5671 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10610 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10605 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5130 (buf!5671 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10610 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10605 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!229835 (= lt!367653 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5130 (buf!5671 b2!99)))))))

(declare-fun b!229836 () Bool)

(declare-fun res!192663 () Bool)

(assert (=> b!229836 (=> (not res!192663) (not e!157781))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229836 (= res!192663 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5130 (buf!5671 b1!101))) ((_ sign_extend 32) (currentByte!10610 b1!101)) ((_ sign_extend 32) (currentBit!10605 b1!101)) bytes!19))))

(declare-fun b!229837 () Bool)

(assert (=> b!229837 (= e!157780 e!157781)))

(declare-fun res!192661 () Bool)

(assert (=> b!229837 (=> (not res!192661) (not e!157781))))

(assert (=> b!229837 (= res!192661 (bvsle ((_ extract 31 0) lt!367649) bytes!19))))

(assert (=> b!229837 (= lt!367649 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!229838 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229838 (= e!157786 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10605 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10610 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5130 (buf!5671 b2!99)))))))))

(assert (= (and start!48512 res!192659) b!229834))

(assert (= (and b!229834 res!192660) b!229837))

(assert (= (and b!229837 res!192661) b!229836))

(assert (= (and b!229836 res!192663) b!229828))

(assert (= (and b!229828 res!192658) b!229831))

(assert (= (and b!229831 res!192666) b!229833))

(assert (= (and b!229833 res!192665) b!229829))

(assert (= (and b!229829 res!192664) b!229835))

(assert (= (and b!229835 res!192662) b!229838))

(assert (= start!48512 b!229830))

(assert (= start!48512 b!229832))

(declare-fun m!353377 () Bool)

(assert (=> b!229838 m!353377))

(declare-fun m!353379 () Bool)

(assert (=> b!229834 m!353379))

(declare-fun m!353381 () Bool)

(assert (=> b!229830 m!353381))

(declare-fun m!353383 () Bool)

(assert (=> b!229832 m!353383))

(declare-fun m!353385 () Bool)

(assert (=> b!229828 m!353385))

(declare-fun m!353387 () Bool)

(assert (=> b!229831 m!353387))

(declare-fun m!353389 () Bool)

(assert (=> start!48512 m!353389))

(declare-fun m!353391 () Bool)

(assert (=> start!48512 m!353391))

(declare-fun m!353393 () Bool)

(assert (=> b!229836 m!353393))

(push 1)

(assert (not b!229832))

(assert (not b!229828))

(assert (not start!48512))

(assert (not b!229830))

(assert (not b!229838))

(assert (not b!229834))

(assert (not b!229831))

(assert (not b!229836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

