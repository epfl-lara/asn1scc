; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49178 () Bool)

(assert start!49178)

(declare-fun b!233520 () Bool)

(declare-fun res!195368 () Bool)

(declare-fun e!160919 () Bool)

(assert (=> b!233520 (=> (not res!195368) (not e!160919))))

(declare-datatypes ((array!12066 0))(
  ( (array!12067 (arr!6281 (Array (_ BitVec 32) (_ BitVec 8))) (size!5294 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9684 0))(
  ( (BitStream!9685 (buf!5835 array!12066) (currentByte!10869 (_ BitVec 32)) (currentBit!10864 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9684)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233520 (= res!195368 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5294 (buf!5835 b1!101))) ((_ sign_extend 32) (currentByte!10869 b1!101)) ((_ sign_extend 32) (currentBit!10864 b1!101)) bytes!19))))

(declare-fun res!195372 () Bool)

(declare-fun e!160913 () Bool)

(assert (=> start!49178 (=> (not res!195372) (not e!160913))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9684)

(assert (=> start!49178 (= res!195372 (and (= (size!5294 (buf!5835 b1!101)) (size!5294 (buf!5835 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49178 e!160913))

(declare-fun e!160922 () Bool)

(declare-fun inv!12 (BitStream!9684) Bool)

(assert (=> start!49178 (and (inv!12 b1!101) e!160922)))

(declare-fun e!160915 () Bool)

(assert (=> start!49178 (and (inv!12 b2!99) e!160915)))

(assert (=> start!49178 true))

(declare-fun b!233521 () Bool)

(declare-fun e!160916 () Bool)

(declare-fun e!160917 () Bool)

(assert (=> b!233521 (= e!160916 e!160917)))

(declare-fun res!195375 () Bool)

(assert (=> b!233521 (=> (not res!195375) (not e!160917))))

(declare-fun lt!369487 () (_ BitVec 64))

(declare-fun lt!369484 () (_ BitVec 64))

(declare-fun lt!369486 () (_ BitVec 64))

(assert (=> b!233521 (= res!195375 (and (= lt!369484 lt!369486) (= (bvsub lt!369484 bits!86) lt!369487)))))

(assert (=> b!233521 (= lt!369486 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10869 b2!99))) ((_ sign_extend 32) (currentBit!10864 b2!99))))))

(declare-fun b!233522 () Bool)

(declare-fun e!160914 () Bool)

(assert (=> b!233522 (= e!160914 (and (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!233523 () Bool)

(declare-fun array_inv!5035 (array!12066) Bool)

(assert (=> b!233523 (= e!160922 (array_inv!5035 (buf!5835 b1!101)))))

(declare-fun b!233524 () Bool)

(assert (=> b!233524 (= e!160919 e!160916)))

(declare-fun res!195374 () Bool)

(assert (=> b!233524 (=> (not res!195374) (not e!160916))))

(assert (=> b!233524 (= res!195374 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5294 (buf!5835 b1!101)))) lt!369487) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233524 (= lt!369487 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10869 b1!101))) ((_ sign_extend 32) (currentBit!10864 b1!101))))))

(declare-fun b!233525 () Bool)

(assert (=> b!233525 (= e!160917 e!160914)))

(declare-fun res!195369 () Bool)

(assert (=> b!233525 (=> (not res!195369) (not e!160914))))

(declare-fun lt!369485 () (_ BitVec 64))

(declare-fun lt!369489 () (_ BitVec 64))

(assert (=> b!233525 (= res!195369 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369485 (bvsub lt!369486 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369485 lt!369486) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369489))))))

(assert (=> b!233525 (= lt!369485 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5294 (buf!5835 b2!99)))))))

(declare-fun b!233526 () Bool)

(declare-fun e!160918 () Bool)

(assert (=> b!233526 (= e!160913 e!160918)))

(declare-fun res!195371 () Bool)

(assert (=> b!233526 (=> (not res!195371) (not e!160918))))

(assert (=> b!233526 (= res!195371 (bvsle bits!86 lt!369484))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233526 (= lt!369484 (bitIndex!0 (size!5294 (buf!5835 b2!99)) (currentByte!10869 b2!99) (currentBit!10864 b2!99)))))

(declare-fun b!233527 () Bool)

(declare-fun res!195370 () Bool)

(assert (=> b!233527 (=> (not res!195370) (not e!160919))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233527 (= res!195370 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5294 (buf!5835 b1!101))) ((_ sign_extend 32) (currentByte!10869 b1!101)) ((_ sign_extend 32) (currentBit!10864 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233528 () Bool)

(assert (=> b!233528 (= e!160915 (array_inv!5035 (buf!5835 b2!99)))))

(declare-fun b!233529 () Bool)

(declare-fun res!195367 () Bool)

(assert (=> b!233529 (=> (not res!195367) (not e!160914))))

(declare-fun lt!369488 () (_ BitVec 32))

(assert (=> b!233529 (= res!195367 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5294 (buf!5835 b2!99))) ((_ sign_extend 32) (currentByte!10869 b2!99)) ((_ sign_extend 32) (currentBit!10864 b2!99)) (bvsub bytes!19 lt!369488)))))

(declare-fun b!233530 () Bool)

(declare-fun res!195373 () Bool)

(assert (=> b!233530 (=> (not res!195373) (not e!160919))))

(assert (=> b!233530 (= res!195373 (= lt!369484 (bvadd (bitIndex!0 (size!5294 (buf!5835 b1!101)) (currentByte!10869 b1!101) (currentBit!10864 b1!101)) bits!86)))))

(declare-fun b!233531 () Bool)

(assert (=> b!233531 (= e!160918 e!160919)))

(declare-fun res!195366 () Bool)

(assert (=> b!233531 (=> (not res!195366) (not e!160919))))

(assert (=> b!233531 (= res!195366 (bvsle lt!369488 bytes!19))))

(assert (=> b!233531 (= lt!369488 ((_ extract 31 0) lt!369489))))

(assert (=> b!233531 (= lt!369489 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and start!49178 res!195372) b!233526))

(assert (= (and b!233526 res!195371) b!233531))

(assert (= (and b!233531 res!195366) b!233520))

(assert (= (and b!233520 res!195368) b!233530))

(assert (= (and b!233530 res!195373) b!233527))

(assert (= (and b!233527 res!195370) b!233524))

(assert (= (and b!233524 res!195374) b!233521))

(assert (= (and b!233521 res!195375) b!233525))

(assert (= (and b!233525 res!195369) b!233529))

(assert (= (and b!233529 res!195367) b!233522))

(assert (= start!49178 b!233523))

(assert (= start!49178 b!233528))

(declare-fun m!356081 () Bool)

(assert (=> b!233529 m!356081))

(declare-fun m!356083 () Bool)

(assert (=> start!49178 m!356083))

(declare-fun m!356085 () Bool)

(assert (=> start!49178 m!356085))

(declare-fun m!356087 () Bool)

(assert (=> b!233527 m!356087))

(declare-fun m!356089 () Bool)

(assert (=> b!233526 m!356089))

(declare-fun m!356091 () Bool)

(assert (=> b!233530 m!356091))

(declare-fun m!356093 () Bool)

(assert (=> b!233528 m!356093))

(declare-fun m!356095 () Bool)

(assert (=> b!233520 m!356095))

(declare-fun m!356097 () Bool)

(assert (=> b!233523 m!356097))

(check-sat (not b!233527) (not b!233528) (not b!233530) (not b!233520) (not b!233529) (not start!49178) (not b!233523) (not b!233526))
(check-sat)
