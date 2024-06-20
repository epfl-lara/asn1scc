; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49022 () Bool)

(assert start!49022)

(declare-fun b!232685 () Bool)

(declare-fun e!160223 () Bool)

(declare-datatypes ((array!11991 0))(
  ( (array!11992 (arr!6248 (Array (_ BitVec 32) (_ BitVec 8))) (size!5261 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9618 0))(
  ( (BitStream!9619 (buf!5802 array!11991) (currentByte!10809 (_ BitVec 32)) (currentBit!10804 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9618)

(declare-fun array_inv!5002 (array!11991) Bool)

(assert (=> b!232685 (= e!160223 (array_inv!5002 (buf!5802 b2!99)))))

(declare-fun res!194731 () Bool)

(declare-fun e!160222 () Bool)

(assert (=> start!49022 (=> (not res!194731) (not e!160222))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b1!101 () BitStream!9618)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!49022 (= res!194731 (and (= (size!5261 (buf!5802 b1!101)) (size!5261 (buf!5802 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49022 e!160222))

(declare-fun e!160218 () Bool)

(declare-fun inv!12 (BitStream!9618) Bool)

(assert (=> start!49022 (and (inv!12 b1!101) e!160218)))

(assert (=> start!49022 (and (inv!12 b2!99) e!160223)))

(assert (=> start!49022 true))

(declare-fun lt!368996 () (_ BitVec 64))

(declare-fun e!160219 () Bool)

(declare-fun b!232686 () Bool)

(declare-fun lt!368997 () (_ BitVec 64))

(assert (=> b!232686 (= e!160219 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5261 (buf!5802 b1!101)))) lt!368997) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14377 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10809 b2!99))) ((_ sign_extend 32) (currentBit!10804 b2!99))))) (and (= lt!368996 bdg!14377) (= (bvsub lt!368996 bits!86) lt!368997) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5261 (buf!5802 b2!99)))) (bvsub bdg!14377 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!232686 (= lt!368997 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10809 b1!101))) ((_ sign_extend 32) (currentBit!10804 b1!101))))))

(declare-fun b!232687 () Bool)

(declare-fun res!194733 () Bool)

(assert (=> b!232687 (=> (not res!194733) (not e!160219))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232687 (= res!194733 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5261 (buf!5802 b1!101))) ((_ sign_extend 32) (currentByte!10809 b1!101)) ((_ sign_extend 32) (currentBit!10804 b1!101)) bytes!19))))

(declare-fun b!232688 () Bool)

(declare-fun res!194730 () Bool)

(assert (=> b!232688 (=> (not res!194730) (not e!160219))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232688 (= res!194730 (= lt!368996 (bvadd (bitIndex!0 (size!5261 (buf!5802 b1!101)) (currentByte!10809 b1!101) (currentBit!10804 b1!101)) bits!86)))))

(declare-fun b!232689 () Bool)

(declare-fun res!194729 () Bool)

(assert (=> b!232689 (=> (not res!194729) (not e!160219))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232689 (= res!194729 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5261 (buf!5802 b1!101))) ((_ sign_extend 32) (currentByte!10809 b1!101)) ((_ sign_extend 32) (currentBit!10804 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232690 () Bool)

(assert (=> b!232690 (= e!160218 (array_inv!5002 (buf!5802 b1!101)))))

(declare-fun b!232691 () Bool)

(assert (=> b!232691 (= e!160222 e!160219)))

(declare-fun res!194732 () Bool)

(assert (=> b!232691 (=> (not res!194732) (not e!160219))))

(assert (=> b!232691 (= res!194732 (and (bvsle bits!86 lt!368996) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232691 (= lt!368996 (bitIndex!0 (size!5261 (buf!5802 b2!99)) (currentByte!10809 b2!99) (currentBit!10804 b2!99)))))

(assert (= (and start!49022 res!194731) b!232691))

(assert (= (and b!232691 res!194732) b!232687))

(assert (= (and b!232687 res!194733) b!232688))

(assert (= (and b!232688 res!194730) b!232689))

(assert (= (and b!232689 res!194729) b!232686))

(assert (= start!49022 b!232690))

(assert (= start!49022 b!232685))

(declare-fun m!355515 () Bool)

(assert (=> b!232689 m!355515))

(declare-fun m!355517 () Bool)

(assert (=> start!49022 m!355517))

(declare-fun m!355519 () Bool)

(assert (=> start!49022 m!355519))

(declare-fun m!355521 () Bool)

(assert (=> b!232688 m!355521))

(declare-fun m!355523 () Bool)

(assert (=> b!232687 m!355523))

(declare-fun m!355525 () Bool)

(assert (=> b!232685 m!355525))

(declare-fun m!355527 () Bool)

(assert (=> b!232691 m!355527))

(declare-fun m!355529 () Bool)

(assert (=> b!232690 m!355529))

(check-sat (not b!232685) (not b!232689) (not b!232687) (not b!232690) (not start!49022) (not b!232688) (not b!232691))
(check-sat)
