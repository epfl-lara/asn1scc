; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49190 () Bool)

(assert start!49190)

(declare-fun res!195465 () Bool)

(declare-fun e!161027 () Bool)

(assert (=> start!49190 (=> (not res!195465) (not e!161027))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!12078 0))(
  ( (array!12079 (arr!6287 (Array (_ BitVec 32) (_ BitVec 8))) (size!5300 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9696 0))(
  ( (BitStream!9697 (buf!5841 array!12078) (currentByte!10875 (_ BitVec 32)) (currentBit!10870 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9696)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9696)

(assert (=> start!49190 (= res!195465 (and (= (size!5300 (buf!5841 b1!101)) (size!5300 (buf!5841 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49190 e!161027))

(declare-fun e!161026 () Bool)

(declare-fun inv!12 (BitStream!9696) Bool)

(assert (=> start!49190 (and (inv!12 b1!101) e!161026)))

(declare-fun e!161025 () Bool)

(assert (=> start!49190 (and (inv!12 b2!99) e!161025)))

(assert (=> start!49190 true))

(declare-fun b!233652 () Bool)

(assert (=> b!233652 (= e!161027 false)))

(declare-fun lt!369522 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233652 (= lt!369522 (bitIndex!0 (size!5300 (buf!5841 b1!101)) (currentByte!10875 b1!101) (currentBit!10870 b1!101)))))

(declare-fun b!233653 () Bool)

(declare-fun res!195464 () Bool)

(assert (=> b!233653 (=> (not res!195464) (not e!161027))))

(assert (=> b!233653 (= res!195464 (bvsle bits!86 (bitIndex!0 (size!5300 (buf!5841 b2!99)) (currentByte!10875 b2!99) (currentBit!10870 b2!99))))))

(declare-fun b!233654 () Bool)

(declare-fun res!195463 () Bool)

(assert (=> b!233654 (=> (not res!195463) (not e!161027))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233654 (= res!195463 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5300 (buf!5841 b1!101))) ((_ sign_extend 32) (currentByte!10875 b1!101)) ((_ sign_extend 32) (currentBit!10870 b1!101)) bytes!19))))

(declare-fun b!233655 () Bool)

(declare-fun res!195462 () Bool)

(assert (=> b!233655 (=> (not res!195462) (not e!161027))))

(assert (=> b!233655 (= res!195462 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!233656 () Bool)

(declare-fun array_inv!5041 (array!12078) Bool)

(assert (=> b!233656 (= e!161025 (array_inv!5041 (buf!5841 b2!99)))))

(declare-fun b!233657 () Bool)

(assert (=> b!233657 (= e!161026 (array_inv!5041 (buf!5841 b1!101)))))

(assert (= (and start!49190 res!195465) b!233653))

(assert (= (and b!233653 res!195464) b!233655))

(assert (= (and b!233655 res!195462) b!233654))

(assert (= (and b!233654 res!195463) b!233652))

(assert (= start!49190 b!233657))

(assert (= start!49190 b!233656))

(declare-fun m!356173 () Bool)

(assert (=> b!233656 m!356173))

(declare-fun m!356175 () Bool)

(assert (=> b!233654 m!356175))

(declare-fun m!356177 () Bool)

(assert (=> b!233653 m!356177))

(declare-fun m!356179 () Bool)

(assert (=> b!233657 m!356179))

(declare-fun m!356181 () Bool)

(assert (=> start!49190 m!356181))

(declare-fun m!356183 () Bool)

(assert (=> start!49190 m!356183))

(declare-fun m!356185 () Bool)

(assert (=> b!233652 m!356185))

(check-sat (not b!233657) (not b!233652) (not b!233653) (not start!49190) (not b!233656) (not b!233654))
