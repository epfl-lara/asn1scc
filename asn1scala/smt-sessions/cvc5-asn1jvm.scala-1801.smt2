; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48918 () Bool)

(assert start!48918)

(declare-fun b!231629 () Bool)

(declare-fun e!159320 () Bool)

(declare-fun e!159322 () Bool)

(assert (=> b!231629 (= e!159320 e!159322)))

(declare-fun res!193986 () Bool)

(assert (=> b!231629 (=> (not res!193986) (not e!159322))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368727 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!231629 (= res!193986 (and (bvsle bits!86 lt!368727) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11887 0))(
  ( (array!11888 (arr!6196 (Array (_ BitVec 32) (_ BitVec 8))) (size!5209 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9514 0))(
  ( (BitStream!9515 (buf!5750 array!11887) (currentByte!10757 (_ BitVec 32)) (currentBit!10752 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9514)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231629 (= lt!368727 (bitIndex!0 (size!5209 (buf!5750 b2!99)) (currentByte!10757 b2!99) (currentBit!10752 b2!99)))))

(declare-fun b!231630 () Bool)

(declare-fun e!159319 () Bool)

(declare-fun b1!101 () BitStream!9514)

(declare-fun array_inv!4950 (array!11887) Bool)

(assert (=> b!231630 (= e!159319 (array_inv!4950 (buf!5750 b1!101)))))

(declare-fun res!193985 () Bool)

(assert (=> start!48918 (=> (not res!193985) (not e!159320))))

(assert (=> start!48918 (= res!193985 (and (= (size!5209 (buf!5750 b1!101)) (size!5209 (buf!5750 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48918 e!159320))

(declare-fun inv!12 (BitStream!9514) Bool)

(assert (=> start!48918 (and (inv!12 b1!101) e!159319)))

(declare-fun e!159323 () Bool)

(assert (=> start!48918 (and (inv!12 b2!99) e!159323)))

(assert (=> start!48918 true))

(declare-fun b!231631 () Bool)

(declare-fun res!193987 () Bool)

(assert (=> b!231631 (=> (not res!193987) (not e!159322))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231631 (= res!193987 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5209 (buf!5750 b1!101))) ((_ sign_extend 32) (currentByte!10757 b1!101)) ((_ sign_extend 32) (currentBit!10752 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231632 () Bool)

(assert (=> b!231632 (= e!159322 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5209 (buf!5750 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10757 b1!101))) ((_ sign_extend 32) (currentBit!10752 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14323 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10757 b2!99))))) (let ((bdg!14324 (bvand bdg!14323 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14324 (bvand ((_ sign_extend 32) (currentBit!10752 b2!99)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14324 (bvand (bvadd bdg!14323 ((_ sign_extend 32) (currentBit!10752 b2!99))) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!231633 () Bool)

(assert (=> b!231633 (= e!159323 (array_inv!4950 (buf!5750 b2!99)))))

(declare-fun b!231634 () Bool)

(declare-fun res!193988 () Bool)

(assert (=> b!231634 (=> (not res!193988) (not e!159322))))

(assert (=> b!231634 (= res!193988 (= lt!368727 (bvadd (bitIndex!0 (size!5209 (buf!5750 b1!101)) (currentByte!10757 b1!101) (currentBit!10752 b1!101)) bits!86)))))

(declare-fun b!231635 () Bool)

(declare-fun res!193989 () Bool)

(assert (=> b!231635 (=> (not res!193989) (not e!159322))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231635 (= res!193989 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5209 (buf!5750 b1!101))) ((_ sign_extend 32) (currentByte!10757 b1!101)) ((_ sign_extend 32) (currentBit!10752 b1!101)) bytes!19))))

(assert (= (and start!48918 res!193985) b!231629))

(assert (= (and b!231629 res!193986) b!231635))

(assert (= (and b!231635 res!193989) b!231634))

(assert (= (and b!231634 res!193988) b!231631))

(assert (= (and b!231631 res!193987) b!231632))

(assert (= start!48918 b!231630))

(assert (= start!48918 b!231633))

(declare-fun m!354707 () Bool)

(assert (=> b!231631 m!354707))

(declare-fun m!354709 () Bool)

(assert (=> b!231630 m!354709))

(declare-fun m!354711 () Bool)

(assert (=> b!231633 m!354711))

(declare-fun m!354713 () Bool)

(assert (=> start!48918 m!354713))

(declare-fun m!354715 () Bool)

(assert (=> start!48918 m!354715))

(declare-fun m!354717 () Bool)

(assert (=> b!231634 m!354717))

(declare-fun m!354719 () Bool)

(assert (=> b!231629 m!354719))

(declare-fun m!354721 () Bool)

(assert (=> b!231635 m!354721))

(push 1)

(assert (not b!231635))

(assert (not b!231631))

(assert (not b!231630))

(assert (not b!231633))

(assert (not start!48918))

(assert (not b!231629))

(assert (not b!231634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

