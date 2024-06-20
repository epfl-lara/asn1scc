; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48928 () Bool)

(assert start!48928)

(declare-fun b!231734 () Bool)

(declare-fun e!159410 () Bool)

(declare-fun e!159412 () Bool)

(assert (=> b!231734 (= e!159410 e!159412)))

(declare-fun res!194062 () Bool)

(assert (=> b!231734 (=> (not res!194062) (not e!159412))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368742 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!231734 (= res!194062 (and (bvsle bits!86 lt!368742) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11897 0))(
  ( (array!11898 (arr!6201 (Array (_ BitVec 32) (_ BitVec 8))) (size!5214 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9524 0))(
  ( (BitStream!9525 (buf!5755 array!11897) (currentByte!10762 (_ BitVec 32)) (currentBit!10757 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9524)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231734 (= lt!368742 (bitIndex!0 (size!5214 (buf!5755 b2!99)) (currentByte!10762 b2!99) (currentBit!10757 b2!99)))))

(declare-fun b!231735 () Bool)

(declare-fun e!159411 () Bool)

(declare-fun array_inv!4955 (array!11897) Bool)

(assert (=> b!231735 (= e!159411 (array_inv!4955 (buf!5755 b2!99)))))

(declare-fun b!231736 () Bool)

(declare-fun res!194063 () Bool)

(assert (=> b!231736 (=> (not res!194063) (not e!159412))))

(declare-fun b1!101 () BitStream!9524)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231736 (= res!194063 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5214 (buf!5755 b1!101))) ((_ sign_extend 32) (currentByte!10762 b1!101)) ((_ sign_extend 32) (currentBit!10757 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231738 () Bool)

(declare-fun res!194060 () Bool)

(assert (=> b!231738 (=> (not res!194060) (not e!159412))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231738 (= res!194060 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5214 (buf!5755 b1!101))) ((_ sign_extend 32) (currentByte!10762 b1!101)) ((_ sign_extend 32) (currentBit!10757 b1!101)) bytes!19))))

(declare-fun b!231739 () Bool)

(declare-fun res!194064 () Bool)

(assert (=> b!231739 (=> (not res!194064) (not e!159412))))

(assert (=> b!231739 (= res!194064 (= lt!368742 (bvadd (bitIndex!0 (size!5214 (buf!5755 b1!101)) (currentByte!10762 b1!101) (currentBit!10757 b1!101)) bits!86)))))

(declare-fun b!231740 () Bool)

(assert (=> b!231740 (= e!159412 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5214 (buf!5755 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10762 b1!101))) ((_ sign_extend 32) (currentBit!10757 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368742 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10762 b2!99))) ((_ sign_extend 32) (currentBit!10757 b2!99)))) (let ((bdg!14326 (bvand lt!368742 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14326 (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14326 (bvand (bvsub lt!368742 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun res!194061 () Bool)

(assert (=> start!48928 (=> (not res!194061) (not e!159410))))

(assert (=> start!48928 (= res!194061 (and (= (size!5214 (buf!5755 b1!101)) (size!5214 (buf!5755 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48928 e!159410))

(declare-fun e!159413 () Bool)

(declare-fun inv!12 (BitStream!9524) Bool)

(assert (=> start!48928 (and (inv!12 b1!101) e!159413)))

(assert (=> start!48928 (and (inv!12 b2!99) e!159411)))

(assert (=> start!48928 true))

(declare-fun b!231737 () Bool)

(assert (=> b!231737 (= e!159413 (array_inv!4955 (buf!5755 b1!101)))))

(assert (= (and start!48928 res!194061) b!231734))

(assert (= (and b!231734 res!194062) b!231738))

(assert (= (and b!231738 res!194060) b!231739))

(assert (= (and b!231739 res!194064) b!231736))

(assert (= (and b!231736 res!194063) b!231740))

(assert (= start!48928 b!231737))

(assert (= start!48928 b!231735))

(declare-fun m!354787 () Bool)

(assert (=> start!48928 m!354787))

(declare-fun m!354789 () Bool)

(assert (=> start!48928 m!354789))

(declare-fun m!354791 () Bool)

(assert (=> b!231739 m!354791))

(declare-fun m!354793 () Bool)

(assert (=> b!231738 m!354793))

(declare-fun m!354795 () Bool)

(assert (=> b!231736 m!354795))

(declare-fun m!354797 () Bool)

(assert (=> b!231734 m!354797))

(declare-fun m!354799 () Bool)

(assert (=> b!231735 m!354799))

(declare-fun m!354801 () Bool)

(assert (=> b!231737 m!354801))

(push 1)

(assert (not b!231735))

(assert (not start!48928))

(assert (not b!231739))

(assert (not b!231737))

(assert (not b!231738))

(assert (not b!231734))

(assert (not b!231736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

