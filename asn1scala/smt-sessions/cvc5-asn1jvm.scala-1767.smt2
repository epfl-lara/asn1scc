; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48324 () Bool)

(assert start!48324)

(declare-fun b!229189 () Bool)

(declare-fun res!192160 () Bool)

(declare-fun e!157267 () Bool)

(assert (=> b!229189 (=> (not res!192160) (not e!157267))))

(declare-datatypes ((array!11642 0))(
  ( (array!11643 (arr!6094 (Array (_ BitVec 32) (_ BitVec 8))) (size!5107 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9310 0))(
  ( (BitStream!9311 (buf!5648 array!11642) (currentByte!10542 (_ BitVec 32)) (currentBit!10537 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9310)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229189 (= res!192160 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5107 (buf!5648 b1!101))) ((_ sign_extend 32) (currentByte!10542 b1!101)) ((_ sign_extend 32) (currentBit!10537 b1!101)) bytes!19))))

(declare-fun b!229190 () Bool)

(declare-fun e!157266 () Bool)

(declare-fun array_inv!4848 (array!11642) Bool)

(assert (=> b!229190 (= e!157266 (array_inv!4848 (buf!5648 b1!101)))))

(declare-fun b!229191 () Bool)

(declare-fun e!157265 () Bool)

(assert (=> b!229191 (= e!157265 e!157267)))

(declare-fun res!192159 () Bool)

(assert (=> b!229191 (=> (not res!192159) (not e!157267))))

(declare-fun lt!367200 () (_ BitVec 64))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!229191 (= res!192159 (and (bvsle bits!86 lt!367200) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9310)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229191 (= lt!367200 (bitIndex!0 (size!5107 (buf!5648 b2!99)) (currentByte!10542 b2!99) (currentBit!10537 b2!99)))))

(declare-fun b!229192 () Bool)

(declare-fun e!157263 () Bool)

(assert (=> b!229192 (= e!157263 (array_inv!4848 (buf!5648 b2!99)))))

(declare-fun res!192157 () Bool)

(assert (=> start!48324 (=> (not res!192157) (not e!157265))))

(assert (=> start!48324 (= res!192157 (and (= (size!5107 (buf!5648 b1!101)) (size!5107 (buf!5648 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48324 e!157265))

(declare-fun inv!12 (BitStream!9310) Bool)

(assert (=> start!48324 (and (inv!12 b1!101) e!157266)))

(assert (=> start!48324 (and (inv!12 b2!99) e!157263)))

(assert (=> start!48324 true))

(declare-fun b!229193 () Bool)

(declare-fun res!192158 () Bool)

(assert (=> b!229193 (=> (not res!192158) (not e!157267))))

(assert (=> b!229193 (= res!192158 (= lt!367200 (bvadd (bitIndex!0 (size!5107 (buf!5648 b1!101)) (currentByte!10542 b1!101) (currentBit!10537 b1!101)) bits!86)))))

(declare-fun b!229194 () Bool)

(assert (=> b!229194 (= e!157267 (or (bvsgt ((_ sign_extend 32) (size!5107 (buf!5648 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10542 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10537 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (= (and start!48324 res!192157) b!229191))

(assert (= (and b!229191 res!192159) b!229189))

(assert (= (and b!229189 res!192160) b!229193))

(assert (= (and b!229193 res!192158) b!229194))

(assert (= start!48324 b!229190))

(assert (= start!48324 b!229192))

(declare-fun m!352927 () Bool)

(assert (=> b!229189 m!352927))

(declare-fun m!352929 () Bool)

(assert (=> b!229193 m!352929))

(declare-fun m!352931 () Bool)

(assert (=> b!229190 m!352931))

(declare-fun m!352933 () Bool)

(assert (=> b!229191 m!352933))

(declare-fun m!352935 () Bool)

(assert (=> b!229192 m!352935))

(declare-fun m!352937 () Bool)

(assert (=> start!48324 m!352937))

(declare-fun m!352939 () Bool)

(assert (=> start!48324 m!352939))

(push 1)

(assert (not b!229191))

(assert (not b!229193))

(assert (not b!229190))

(assert (not b!229192))

(assert (not start!48324))

(assert (not b!229189))

(check-sat)

(pop 1)

(push 1)

(check-sat)

