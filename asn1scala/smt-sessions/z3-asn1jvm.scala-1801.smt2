; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48920 () Bool)

(assert start!48920)

(declare-fun b!231650 () Bool)

(declare-fun res!194003 () Bool)

(declare-fun e!159337 () Bool)

(assert (=> b!231650 (=> (not res!194003) (not e!159337))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11889 0))(
  ( (array!11890 (arr!6197 (Array (_ BitVec 32) (_ BitVec 8))) (size!5210 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9516 0))(
  ( (BitStream!9517 (buf!5751 array!11889) (currentByte!10758 (_ BitVec 32)) (currentBit!10753 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9516)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231650 (= res!194003 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5210 (buf!5751 b1!101))) ((_ sign_extend 32) (currentByte!10758 b1!101)) ((_ sign_extend 32) (currentBit!10753 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!194004 () Bool)

(declare-fun e!159341 () Bool)

(assert (=> start!48920 (=> (not res!194004) (not e!159341))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9516)

(assert (=> start!48920 (= res!194004 (and (= (size!5210 (buf!5751 b1!101)) (size!5210 (buf!5751 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48920 e!159341))

(declare-fun e!159340 () Bool)

(declare-fun inv!12 (BitStream!9516) Bool)

(assert (=> start!48920 (and (inv!12 b1!101) e!159340)))

(declare-fun e!159338 () Bool)

(assert (=> start!48920 (and (inv!12 b2!99) e!159338)))

(assert (=> start!48920 true))

(declare-fun b!231651 () Bool)

(declare-fun res!194002 () Bool)

(assert (=> b!231651 (=> (not res!194002) (not e!159337))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231651 (= res!194002 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5210 (buf!5751 b1!101))) ((_ sign_extend 32) (currentByte!10758 b1!101)) ((_ sign_extend 32) (currentBit!10753 b1!101)) bytes!19))))

(declare-fun b!231652 () Bool)

(assert (=> b!231652 (= e!159341 e!159337)))

(declare-fun res!194001 () Bool)

(assert (=> b!231652 (=> (not res!194001) (not e!159337))))

(declare-fun lt!368730 () (_ BitVec 64))

(assert (=> b!231652 (= res!194001 (and (bvsle bits!86 lt!368730) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231652 (= lt!368730 (bitIndex!0 (size!5210 (buf!5751 b2!99)) (currentByte!10758 b2!99) (currentBit!10753 b2!99)))))

(declare-fun b!231653 () Bool)

(declare-fun array_inv!4951 (array!11889) Bool)

(assert (=> b!231653 (= e!159340 (array_inv!4951 (buf!5751 b1!101)))))

(declare-fun b!231654 () Bool)

(declare-fun res!194000 () Bool)

(assert (=> b!231654 (=> (not res!194000) (not e!159337))))

(assert (=> b!231654 (= res!194000 (= lt!368730 (bvadd (bitIndex!0 (size!5210 (buf!5751 b1!101)) (currentByte!10758 b1!101) (currentBit!10753 b1!101)) bits!86)))))

(declare-fun b!231655 () Bool)

(assert (=> b!231655 (= e!159338 (array_inv!4951 (buf!5751 b2!99)))))

(declare-fun b!231656 () Bool)

(assert (=> b!231656 (= e!159337 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5210 (buf!5751 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10758 b1!101))) ((_ sign_extend 32) (currentBit!10753 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14323 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10758 b2!99))))) (let ((bdg!14324 (bvand bdg!14323 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14324 (bvand ((_ sign_extend 32) (currentBit!10753 b2!99)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14324 (bvand (bvadd bdg!14323 ((_ sign_extend 32) (currentBit!10753 b2!99))) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and start!48920 res!194004) b!231652))

(assert (= (and b!231652 res!194001) b!231651))

(assert (= (and b!231651 res!194002) b!231654))

(assert (= (and b!231654 res!194000) b!231650))

(assert (= (and b!231650 res!194003) b!231656))

(assert (= start!48920 b!231653))

(assert (= start!48920 b!231655))

(declare-fun m!354723 () Bool)

(assert (=> b!231653 m!354723))

(declare-fun m!354725 () Bool)

(assert (=> b!231651 m!354725))

(declare-fun m!354727 () Bool)

(assert (=> b!231654 m!354727))

(declare-fun m!354729 () Bool)

(assert (=> b!231652 m!354729))

(declare-fun m!354731 () Bool)

(assert (=> b!231650 m!354731))

(declare-fun m!354733 () Bool)

(assert (=> b!231655 m!354733))

(declare-fun m!354735 () Bool)

(assert (=> start!48920 m!354735))

(declare-fun m!354737 () Bool)

(assert (=> start!48920 m!354737))

(check-sat (not b!231652) (not b!231653) (not b!231651) (not b!231655) (not b!231654) (not start!48920) (not b!231650))
(check-sat)
