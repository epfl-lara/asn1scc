; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48962 () Bool)

(assert start!48962)

(declare-fun res!194318 () Bool)

(declare-fun e!159714 () Bool)

(assert (=> start!48962 (=> (not res!194318) (not e!159714))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11931 0))(
  ( (array!11932 (arr!6218 (Array (_ BitVec 32) (_ BitVec 8))) (size!5231 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9558 0))(
  ( (BitStream!9559 (buf!5772 array!11931) (currentByte!10779 (_ BitVec 32)) (currentBit!10774 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9558)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9558)

(assert (=> start!48962 (= res!194318 (and (= (size!5231 (buf!5772 b1!101)) (size!5231 (buf!5772 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48962 e!159714))

(declare-fun e!159718 () Bool)

(declare-fun inv!12 (BitStream!9558) Bool)

(assert (=> start!48962 (and (inv!12 b1!101) e!159718)))

(declare-fun e!159716 () Bool)

(assert (=> start!48962 (and (inv!12 b2!99) e!159716)))

(assert (=> start!48962 true))

(declare-fun b!232091 () Bool)

(declare-fun array_inv!4972 (array!11931) Bool)

(assert (=> b!232091 (= e!159716 (array_inv!4972 (buf!5772 b2!99)))))

(declare-fun b!232092 () Bool)

(declare-fun res!194315 () Bool)

(declare-fun e!159717 () Bool)

(assert (=> b!232092 (=> (not res!194315) (not e!159717))))

(declare-fun lt!368852 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232092 (= res!194315 (= lt!368852 (bvadd (bitIndex!0 (size!5231 (buf!5772 b1!101)) (currentByte!10779 b1!101) (currentBit!10774 b1!101)) bits!86)))))

(declare-fun b!232093 () Bool)

(assert (=> b!232093 (= e!159714 e!159717)))

(declare-fun res!194316 () Bool)

(assert (=> b!232093 (=> (not res!194316) (not e!159717))))

(assert (=> b!232093 (= res!194316 (and (bvsle bits!86 lt!368852) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232093 (= lt!368852 (bitIndex!0 (size!5231 (buf!5772 b2!99)) (currentByte!10779 b2!99) (currentBit!10774 b2!99)))))

(declare-fun b!232094 () Bool)

(declare-fun res!194317 () Bool)

(assert (=> b!232094 (=> (not res!194317) (not e!159717))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232094 (= res!194317 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5231 (buf!5772 b1!101))) ((_ sign_extend 32) (currentByte!10779 b1!101)) ((_ sign_extend 32) (currentBit!10774 b1!101)) bytes!19))))

(declare-fun b!232095 () Bool)

(declare-fun res!194319 () Bool)

(assert (=> b!232095 (=> (not res!194319) (not e!159717))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232095 (= res!194319 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5231 (buf!5772 b1!101))) ((_ sign_extend 32) (currentByte!10779 b1!101)) ((_ sign_extend 32) (currentBit!10774 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232096 () Bool)

(declare-fun lt!368853 () (_ BitVec 64))

(assert (=> b!232096 (= e!159717 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5231 (buf!5772 b1!101)))) lt!368853) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14345 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10779 b2!99))) ((_ sign_extend 32) (currentBit!10774 b2!99))))) (and (= lt!368852 bdg!14345) (= (bvsub lt!368852 bits!86) lt!368853) (let ((bdg!14346 (bvand bdg!14345 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14346 (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14346 (bvand (bvsub bdg!14345 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (=> b!232096 (= lt!368853 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10779 b1!101))) ((_ sign_extend 32) (currentBit!10774 b1!101))))))

(declare-fun b!232097 () Bool)

(assert (=> b!232097 (= e!159718 (array_inv!4972 (buf!5772 b1!101)))))

(assert (= (and start!48962 res!194318) b!232093))

(assert (= (and b!232093 res!194316) b!232094))

(assert (= (and b!232094 res!194317) b!232092))

(assert (= (and b!232092 res!194315) b!232095))

(assert (= (and b!232095 res!194319) b!232096))

(assert (= start!48962 b!232097))

(assert (= start!48962 b!232091))

(declare-fun m!355059 () Bool)

(assert (=> b!232095 m!355059))

(declare-fun m!355061 () Bool)

(assert (=> b!232092 m!355061))

(declare-fun m!355063 () Bool)

(assert (=> start!48962 m!355063))

(declare-fun m!355065 () Bool)

(assert (=> start!48962 m!355065))

(declare-fun m!355067 () Bool)

(assert (=> b!232093 m!355067))

(declare-fun m!355069 () Bool)

(assert (=> b!232094 m!355069))

(declare-fun m!355071 () Bool)

(assert (=> b!232091 m!355071))

(declare-fun m!355073 () Bool)

(assert (=> b!232097 m!355073))

(check-sat (not b!232092) (not b!232095) (not start!48962) (not b!232091) (not b!232094) (not b!232093) (not b!232097))
(check-sat)
