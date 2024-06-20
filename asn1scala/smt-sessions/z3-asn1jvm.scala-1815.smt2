; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49004 () Bool)

(assert start!49004)

(declare-fun b!232514 () Bool)

(declare-fun res!194613 () Bool)

(declare-fun e!160074 () Bool)

(assert (=> b!232514 (=> (not res!194613) (not e!160074))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368961 () (_ BitVec 64))

(declare-datatypes ((array!11973 0))(
  ( (array!11974 (arr!6239 (Array (_ BitVec 32) (_ BitVec 8))) (size!5252 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9600 0))(
  ( (BitStream!9601 (buf!5793 array!11973) (currentByte!10800 (_ BitVec 32)) (currentBit!10795 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9600)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232514 (= res!194613 (= lt!368961 (bvadd (bitIndex!0 (size!5252 (buf!5793 b1!101)) (currentByte!10800 b1!101) (currentBit!10795 b1!101)) bits!86)))))

(declare-fun b!232515 () Bool)

(declare-fun res!194612 () Bool)

(assert (=> b!232515 (=> (not res!194612) (not e!160074))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232515 (= res!194612 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5252 (buf!5793 b1!101))) ((_ sign_extend 32) (currentByte!10800 b1!101)) ((_ sign_extend 32) (currentBit!10795 b1!101)) bytes!19))))

(declare-fun b!232516 () Bool)

(declare-fun lt!368960 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9600)

(assert (=> b!232516 (= e!160074 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5252 (buf!5793 b1!101)))) lt!368960) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14370 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10800 b2!99))) ((_ sign_extend 32) (currentBit!10795 b2!99))))) (and (= lt!368961 bdg!14370) (= (bvsub lt!368961 bits!86) lt!368960) (let ((bdg!14371 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5252 (buf!5793 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14371 (bvsub bdg!14370 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14372 (bvand bdg!14371 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14372 (bvand bdg!14370 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14372 (bvand (bvsub bdg!14371 bdg!14370) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))))

(assert (=> b!232516 (= lt!368960 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10800 b1!101))) ((_ sign_extend 32) (currentBit!10795 b1!101))))))

(declare-fun b!232517 () Bool)

(declare-fun e!160079 () Bool)

(assert (=> b!232517 (= e!160079 e!160074)))

(declare-fun res!194614 () Bool)

(assert (=> b!232517 (=> (not res!194614) (not e!160074))))

(assert (=> b!232517 (= res!194614 (and (bvsle bits!86 lt!368961) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232517 (= lt!368961 (bitIndex!0 (size!5252 (buf!5793 b2!99)) (currentByte!10800 b2!99) (currentBit!10795 b2!99)))))

(declare-fun b!232518 () Bool)

(declare-fun e!160076 () Bool)

(declare-fun array_inv!4993 (array!11973) Bool)

(assert (=> b!232518 (= e!160076 (array_inv!4993 (buf!5793 b1!101)))))

(declare-fun b!232519 () Bool)

(declare-fun e!160075 () Bool)

(assert (=> b!232519 (= e!160075 (array_inv!4993 (buf!5793 b2!99)))))

(declare-fun b!232520 () Bool)

(declare-fun res!194615 () Bool)

(assert (=> b!232520 (=> (not res!194615) (not e!160074))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232520 (= res!194615 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5252 (buf!5793 b1!101))) ((_ sign_extend 32) (currentByte!10800 b1!101)) ((_ sign_extend 32) (currentBit!10795 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!194616 () Bool)

(assert (=> start!49004 (=> (not res!194616) (not e!160079))))

(assert (=> start!49004 (= res!194616 (and (= (size!5252 (buf!5793 b1!101)) (size!5252 (buf!5793 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49004 e!160079))

(declare-fun inv!12 (BitStream!9600) Bool)

(assert (=> start!49004 (and (inv!12 b1!101) e!160076)))

(assert (=> start!49004 (and (inv!12 b2!99) e!160075)))

(assert (=> start!49004 true))

(assert (= (and start!49004 res!194616) b!232517))

(assert (= (and b!232517 res!194614) b!232515))

(assert (= (and b!232515 res!194612) b!232514))

(assert (= (and b!232514 res!194613) b!232520))

(assert (= (and b!232520 res!194615) b!232516))

(assert (= start!49004 b!232518))

(assert (= start!49004 b!232519))

(declare-fun m!355383 () Bool)

(assert (=> b!232518 m!355383))

(declare-fun m!355385 () Bool)

(assert (=> b!232514 m!355385))

(declare-fun m!355387 () Bool)

(assert (=> b!232517 m!355387))

(declare-fun m!355389 () Bool)

(assert (=> start!49004 m!355389))

(declare-fun m!355391 () Bool)

(assert (=> start!49004 m!355391))

(declare-fun m!355393 () Bool)

(assert (=> b!232520 m!355393))

(declare-fun m!355395 () Bool)

(assert (=> b!232515 m!355395))

(declare-fun m!355397 () Bool)

(assert (=> b!232519 m!355397))

(check-sat (not b!232518) (not b!232515) (not b!232517) (not b!232520) (not start!49004) (not b!232514) (not b!232519))
(check-sat)
