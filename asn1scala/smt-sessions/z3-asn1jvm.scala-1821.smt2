; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49040 () Bool)

(assert start!49040)

(declare-fun b!232861 () Bool)

(declare-fun e!160370 () Bool)

(declare-fun e!160373 () Bool)

(assert (=> b!232861 (= e!160370 e!160373)))

(declare-fun res!194854 () Bool)

(assert (=> b!232861 (=> (not res!194854) (not e!160373))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369037 () (_ BitVec 64))

(assert (=> b!232861 (= res!194854 (bvsle bits!86 lt!369037))))

(declare-datatypes ((array!12009 0))(
  ( (array!12010 (arr!6257 (Array (_ BitVec 32) (_ BitVec 8))) (size!5270 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9636 0))(
  ( (BitStream!9637 (buf!5811 array!12009) (currentByte!10818 (_ BitVec 32)) (currentBit!10813 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9636)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232861 (= lt!369037 (bitIndex!0 (size!5270 (buf!5811 b2!99)) (currentByte!10818 b2!99) (currentBit!10813 b2!99)))))

(declare-fun b!232862 () Bool)

(declare-fun res!194852 () Bool)

(declare-fun e!160371 () Bool)

(assert (=> b!232862 (=> (not res!194852) (not e!160371))))

(declare-fun b1!101 () BitStream!9636)

(assert (=> b!232862 (= res!194852 (= lt!369037 (bvadd (bitIndex!0 (size!5270 (buf!5811 b1!101)) (currentByte!10818 b1!101) (currentBit!10813 b1!101)) bits!86)))))

(declare-fun b!232863 () Bool)

(declare-fun lt!369038 () (_ BitVec 64))

(declare-fun lt!369039 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!232863 (= e!160371 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5270 (buf!5811 b1!101)))) lt!369039) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14383 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10818 b2!99))) ((_ sign_extend 32) (currentBit!10813 b2!99))))) (and (= lt!369037 bdg!14383) (= (bvsub lt!369037 bits!86) lt!369039) (let ((bdg!14384 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5270 (buf!5811 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14384 (bvsub bdg!14383 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14385 (bvsdiv (bvsub bdg!14384 bdg!14383) #b0000000000000000000000000000000000000000000000000000000000001000))) (let ((bdg!14386 (bvand bdg!14385 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14386 (bvand lt!369038 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14386 (bvand (bvadd bdg!14385 lt!369038) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))))

(assert (=> b!232863 (= lt!369039 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10818 b1!101))) ((_ sign_extend 32) (currentBit!10813 b1!101))))))

(declare-fun b!232864 () Bool)

(declare-fun res!194856 () Bool)

(assert (=> b!232864 (=> (not res!194856) (not e!160371))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232864 (= res!194856 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5270 (buf!5811 b1!101))) ((_ sign_extend 32) (currentByte!10818 b1!101)) ((_ sign_extend 32) (currentBit!10813 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232865 () Bool)

(declare-fun res!194853 () Bool)

(assert (=> b!232865 (=> (not res!194853) (not e!160371))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232865 (= res!194853 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5270 (buf!5811 b1!101))) ((_ sign_extend 32) (currentByte!10818 b1!101)) ((_ sign_extend 32) (currentBit!10813 b1!101)) bytes!19))))

(declare-fun b!232866 () Bool)

(assert (=> b!232866 (= e!160373 e!160371)))

(declare-fun res!194851 () Bool)

(assert (=> b!232866 (=> (not res!194851) (not e!160371))))

(assert (=> b!232866 (= res!194851 (bvsle ((_ extract 31 0) lt!369038) bytes!19))))

(assert (=> b!232866 (= lt!369038 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!232868 () Bool)

(declare-fun e!160369 () Bool)

(declare-fun array_inv!5011 (array!12009) Bool)

(assert (=> b!232868 (= e!160369 (array_inv!5011 (buf!5811 b1!101)))))

(declare-fun res!194855 () Bool)

(assert (=> start!49040 (=> (not res!194855) (not e!160370))))

(assert (=> start!49040 (= res!194855 (and (= (size!5270 (buf!5811 b1!101)) (size!5270 (buf!5811 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49040 e!160370))

(declare-fun inv!12 (BitStream!9636) Bool)

(assert (=> start!49040 (and (inv!12 b1!101) e!160369)))

(declare-fun e!160368 () Bool)

(assert (=> start!49040 (and (inv!12 b2!99) e!160368)))

(assert (=> start!49040 true))

(declare-fun b!232867 () Bool)

(assert (=> b!232867 (= e!160368 (array_inv!5011 (buf!5811 b2!99)))))

(assert (= (and start!49040 res!194855) b!232861))

(assert (= (and b!232861 res!194854) b!232866))

(assert (= (and b!232866 res!194851) b!232865))

(assert (= (and b!232865 res!194853) b!232862))

(assert (= (and b!232862 res!194852) b!232864))

(assert (= (and b!232864 res!194856) b!232863))

(assert (= start!49040 b!232868))

(assert (= start!49040 b!232867))

(declare-fun m!355647 () Bool)

(assert (=> b!232861 m!355647))

(declare-fun m!355649 () Bool)

(assert (=> b!232867 m!355649))

(declare-fun m!355651 () Bool)

(assert (=> b!232864 m!355651))

(declare-fun m!355653 () Bool)

(assert (=> b!232862 m!355653))

(declare-fun m!355655 () Bool)

(assert (=> b!232868 m!355655))

(declare-fun m!355657 () Bool)

(assert (=> start!49040 m!355657))

(declare-fun m!355659 () Bool)

(assert (=> start!49040 m!355659))

(declare-fun m!355661 () Bool)

(assert (=> b!232865 m!355661))

(check-sat (not b!232862) (not b!232868) (not b!232865) (not b!232864) (not b!232861) (not b!232867) (not start!49040))
(check-sat)
