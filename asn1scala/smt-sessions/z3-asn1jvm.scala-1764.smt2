; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48248 () Bool)

(assert start!48248)

(declare-fun b!229009 () Bool)

(declare-fun res!192027 () Bool)

(declare-fun e!157123 () Bool)

(assert (=> b!229009 (=> (not res!192027) (not e!157123))))

(declare-datatypes ((array!11620 0))(
  ( (array!11621 (arr!6086 (Array (_ BitVec 32) (_ BitVec 8))) (size!5099 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9294 0))(
  ( (BitStream!9295 (buf!5640 array!11620) (currentByte!10516 (_ BitVec 32)) (currentBit!10511 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9294)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229009 (= res!192027 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10511 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10516 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5099 (buf!5640 b1!101))))))))

(declare-fun b!229010 () Bool)

(declare-fun res!192026 () Bool)

(assert (=> b!229010 (=> (not res!192026) (not e!157123))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!229010 (= res!192026 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (bvsle ((_ sign_extend 32) (size!5099 (buf!5640 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10516 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10511 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5099 (buf!5640 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10516 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10511 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!229011 () Bool)

(assert (=> b!229011 (= e!157123 (bvslt bytes!19 #b00000000000000000000000000000000))))

(declare-fun b!229012 () Bool)

(declare-fun e!157122 () Bool)

(declare-fun b2!99 () BitStream!9294)

(declare-fun array_inv!4840 (array!11620) Bool)

(assert (=> b!229012 (= e!157122 (array_inv!4840 (buf!5640 b2!99)))))

(declare-fun res!192025 () Bool)

(assert (=> start!48248 (=> (not res!192025) (not e!157123))))

(assert (=> start!48248 (= res!192025 (and (= (size!5099 (buf!5640 b1!101)) (size!5099 (buf!5640 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48248 e!157123))

(declare-fun e!157125 () Bool)

(declare-fun inv!12 (BitStream!9294) Bool)

(assert (=> start!48248 (and (inv!12 b1!101) e!157125)))

(assert (=> start!48248 (and (inv!12 b2!99) e!157122)))

(assert (=> start!48248 true))

(declare-fun b!229013 () Bool)

(declare-fun res!192028 () Bool)

(assert (=> b!229013 (=> (not res!192028) (not e!157123))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229013 (= res!192028 (bvsle bits!86 (bitIndex!0 (size!5099 (buf!5640 b2!99)) (currentByte!10516 b2!99) (currentBit!10511 b2!99))))))

(declare-fun b!229014 () Bool)

(assert (=> b!229014 (= e!157125 (array_inv!4840 (buf!5640 b1!101)))))

(assert (= (and start!48248 res!192025) b!229013))

(assert (= (and b!229013 res!192028) b!229010))

(assert (= (and b!229010 res!192026) b!229009))

(assert (= (and b!229009 res!192027) b!229011))

(assert (= start!48248 b!229014))

(assert (= start!48248 b!229012))

(declare-fun m!352783 () Bool)

(assert (=> b!229009 m!352783))

(declare-fun m!352785 () Bool)

(assert (=> b!229013 m!352785))

(declare-fun m!352787 () Bool)

(assert (=> b!229012 m!352787))

(declare-fun m!352789 () Bool)

(assert (=> b!229014 m!352789))

(declare-fun m!352791 () Bool)

(assert (=> start!48248 m!352791))

(declare-fun m!352793 () Bool)

(assert (=> start!48248 m!352793))

(check-sat (not b!229013) (not start!48248) (not b!229012) (not b!229014) (not b!229009))
(check-sat)
