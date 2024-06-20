; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48326 () Bool)

(assert start!48326)

(declare-fun b!229207 () Bool)

(declare-fun e!157283 () Bool)

(declare-datatypes ((array!11644 0))(
  ( (array!11645 (arr!6095 (Array (_ BitVec 32) (_ BitVec 8))) (size!5108 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9312 0))(
  ( (BitStream!9313 (buf!5649 array!11644) (currentByte!10543 (_ BitVec 32)) (currentBit!10538 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9312)

(declare-fun array_inv!4849 (array!11644) Bool)

(assert (=> b!229207 (= e!157283 (array_inv!4849 (buf!5649 b2!99)))))

(declare-fun res!192172 () Bool)

(declare-fun e!157281 () Bool)

(assert (=> start!48326 (=> (not res!192172) (not e!157281))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b1!101 () BitStream!9312)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48326 (= res!192172 (and (= (size!5108 (buf!5649 b1!101)) (size!5108 (buf!5649 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48326 e!157281))

(declare-fun e!157282 () Bool)

(declare-fun inv!12 (BitStream!9312) Bool)

(assert (=> start!48326 (and (inv!12 b1!101) e!157282)))

(assert (=> start!48326 (and (inv!12 b2!99) e!157283)))

(assert (=> start!48326 true))

(declare-fun b!229208 () Bool)

(assert (=> b!229208 (= e!157282 (array_inv!4849 (buf!5649 b1!101)))))

(declare-fun b!229209 () Bool)

(declare-fun e!157284 () Bool)

(assert (=> b!229209 (= e!157284 (or (bvsgt ((_ sign_extend 32) (size!5108 (buf!5649 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10543 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10538 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!229210 () Bool)

(assert (=> b!229210 (= e!157281 e!157284)))

(declare-fun res!192169 () Bool)

(assert (=> b!229210 (=> (not res!192169) (not e!157284))))

(declare-fun lt!367203 () (_ BitVec 64))

(assert (=> b!229210 (= res!192169 (and (bvsle bits!86 lt!367203) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229210 (= lt!367203 (bitIndex!0 (size!5108 (buf!5649 b2!99)) (currentByte!10543 b2!99) (currentBit!10538 b2!99)))))

(declare-fun b!229211 () Bool)

(declare-fun res!192171 () Bool)

(assert (=> b!229211 (=> (not res!192171) (not e!157284))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229211 (= res!192171 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5108 (buf!5649 b1!101))) ((_ sign_extend 32) (currentByte!10543 b1!101)) ((_ sign_extend 32) (currentBit!10538 b1!101)) bytes!19))))

(declare-fun b!229212 () Bool)

(declare-fun res!192170 () Bool)

(assert (=> b!229212 (=> (not res!192170) (not e!157284))))

(assert (=> b!229212 (= res!192170 (= lt!367203 (bvadd (bitIndex!0 (size!5108 (buf!5649 b1!101)) (currentByte!10543 b1!101) (currentBit!10538 b1!101)) bits!86)))))

(assert (= (and start!48326 res!192172) b!229210))

(assert (= (and b!229210 res!192169) b!229211))

(assert (= (and b!229211 res!192171) b!229212))

(assert (= (and b!229212 res!192170) b!229209))

(assert (= start!48326 b!229208))

(assert (= start!48326 b!229207))

(declare-fun m!352941 () Bool)

(assert (=> b!229207 m!352941))

(declare-fun m!352943 () Bool)

(assert (=> b!229208 m!352943))

(declare-fun m!352945 () Bool)

(assert (=> b!229210 m!352945))

(declare-fun m!352947 () Bool)

(assert (=> b!229211 m!352947))

(declare-fun m!352949 () Bool)

(assert (=> start!48326 m!352949))

(declare-fun m!352951 () Bool)

(assert (=> start!48326 m!352951))

(declare-fun m!352953 () Bool)

(assert (=> b!229212 m!352953))

(check-sat (not b!229210) (not b!229208) (not b!229211) (not b!229207) (not b!229212) (not start!48326))
(check-sat)
