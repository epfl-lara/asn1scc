; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48926 () Bool)

(assert start!48926)

(declare-fun b!231713 () Bool)

(declare-fun res!194045 () Bool)

(declare-fun e!159392 () Bool)

(assert (=> b!231713 (=> (not res!194045) (not e!159392))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11895 0))(
  ( (array!11896 (arr!6200 (Array (_ BitVec 32) (_ BitVec 8))) (size!5213 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9522 0))(
  ( (BitStream!9523 (buf!5754 array!11895) (currentByte!10761 (_ BitVec 32)) (currentBit!10756 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9522)

(declare-fun lt!368739 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231713 (= res!194045 (= lt!368739 (bvadd (bitIndex!0 (size!5213 (buf!5754 b1!101)) (currentByte!10761 b1!101) (currentBit!10756 b1!101)) bits!86)))))

(declare-fun b!231715 () Bool)

(declare-fun e!159395 () Bool)

(assert (=> b!231715 (= e!159395 e!159392)))

(declare-fun res!194049 () Bool)

(assert (=> b!231715 (=> (not res!194049) (not e!159392))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!231715 (= res!194049 (and (bvsle bits!86 lt!368739) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9522)

(assert (=> b!231715 (= lt!368739 (bitIndex!0 (size!5213 (buf!5754 b2!99)) (currentByte!10761 b2!99) (currentBit!10756 b2!99)))))

(declare-fun b!231716 () Bool)

(declare-fun e!159393 () Bool)

(declare-fun array_inv!4954 (array!11895) Bool)

(assert (=> b!231716 (= e!159393 (array_inv!4954 (buf!5754 b1!101)))))

(declare-fun b!231717 () Bool)

(assert (=> b!231717 (= e!159392 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5213 (buf!5754 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10761 b1!101))) ((_ sign_extend 32) (currentBit!10756 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368739 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10761 b2!99))) ((_ sign_extend 32) (currentBit!10756 b2!99)))) (let ((bdg!14326 (bvand lt!368739 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14326 (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14326 (bvand (bvsub lt!368739 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!231718 () Bool)

(declare-fun res!194047 () Bool)

(assert (=> b!231718 (=> (not res!194047) (not e!159392))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231718 (= res!194047 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5213 (buf!5754 b1!101))) ((_ sign_extend 32) (currentByte!10761 b1!101)) ((_ sign_extend 32) (currentBit!10756 b1!101)) bytes!19))))

(declare-fun b!231719 () Bool)

(declare-fun res!194046 () Bool)

(assert (=> b!231719 (=> (not res!194046) (not e!159392))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231719 (= res!194046 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5213 (buf!5754 b1!101))) ((_ sign_extend 32) (currentByte!10761 b1!101)) ((_ sign_extend 32) (currentBit!10756 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231714 () Bool)

(declare-fun e!159390 () Bool)

(assert (=> b!231714 (= e!159390 (array_inv!4954 (buf!5754 b2!99)))))

(declare-fun res!194048 () Bool)

(assert (=> start!48926 (=> (not res!194048) (not e!159395))))

(assert (=> start!48926 (= res!194048 (and (= (size!5213 (buf!5754 b1!101)) (size!5213 (buf!5754 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48926 e!159395))

(declare-fun inv!12 (BitStream!9522) Bool)

(assert (=> start!48926 (and (inv!12 b1!101) e!159393)))

(assert (=> start!48926 (and (inv!12 b2!99) e!159390)))

(assert (=> start!48926 true))

(assert (= (and start!48926 res!194048) b!231715))

(assert (= (and b!231715 res!194049) b!231718))

(assert (= (and b!231718 res!194047) b!231713))

(assert (= (and b!231713 res!194045) b!231719))

(assert (= (and b!231719 res!194046) b!231717))

(assert (= start!48926 b!231716))

(assert (= start!48926 b!231714))

(declare-fun m!354771 () Bool)

(assert (=> b!231713 m!354771))

(declare-fun m!354773 () Bool)

(assert (=> b!231716 m!354773))

(declare-fun m!354775 () Bool)

(assert (=> b!231719 m!354775))

(declare-fun m!354777 () Bool)

(assert (=> start!48926 m!354777))

(declare-fun m!354779 () Bool)

(assert (=> start!48926 m!354779))

(declare-fun m!354781 () Bool)

(assert (=> b!231718 m!354781))

(declare-fun m!354783 () Bool)

(assert (=> b!231715 m!354783))

(declare-fun m!354785 () Bool)

(assert (=> b!231714 m!354785))

(check-sat (not b!231719) (not b!231718) (not b!231713) (not b!231715) (not b!231714) (not start!48926) (not b!231716))
(check-sat)
