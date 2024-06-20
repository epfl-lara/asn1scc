; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48968 () Bool)

(assert start!48968)

(declare-fun b!232154 () Bool)

(declare-fun e!159770 () Bool)

(declare-datatypes ((array!11937 0))(
  ( (array!11938 (arr!6221 (Array (_ BitVec 32) (_ BitVec 8))) (size!5234 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9564 0))(
  ( (BitStream!9565 (buf!5775 array!11937) (currentByte!10782 (_ BitVec 32)) (currentBit!10777 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9564)

(declare-fun array_inv!4975 (array!11937) Bool)

(assert (=> b!232154 (= e!159770 (array_inv!4975 (buf!5775 b1!101)))))

(declare-fun b!232156 () Bool)

(declare-fun e!159772 () Bool)

(declare-fun b2!99 () BitStream!9564)

(assert (=> b!232156 (= e!159772 (array_inv!4975 (buf!5775 b2!99)))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun e!159769 () Bool)

(declare-fun lt!368870 () (_ BitVec 64))

(declare-fun lt!368871 () (_ BitVec 64))

(declare-fun b!232157 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!232157 (= e!159769 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5234 (buf!5775 b1!101)))) lt!368871) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14349 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10782 b2!99))) ((_ sign_extend 32) (currentBit!10777 b2!99))))) (and (= lt!368870 bdg!14349) (= (bvsub lt!368870 bits!86) lt!368871) (let ((bdg!14350 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5234 (buf!5775 b2!99)))))) (let ((bdg!14351 (bvsub bdg!14349 bits!86))) (let ((bdg!14352 (bvand bdg!14350 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14352 (bvand bdg!14351 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14352 (bvand (bvsub bdg!14350 bdg!14351) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))))

(assert (=> b!232157 (= lt!368871 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10782 b1!101))) ((_ sign_extend 32) (currentBit!10777 b1!101))))))

(declare-fun b!232158 () Bool)

(declare-fun e!159768 () Bool)

(assert (=> b!232158 (= e!159768 e!159769)))

(declare-fun res!194364 () Bool)

(assert (=> b!232158 (=> (not res!194364) (not e!159769))))

(assert (=> b!232158 (= res!194364 (and (bvsle bits!86 lt!368870) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232158 (= lt!368870 (bitIndex!0 (size!5234 (buf!5775 b2!99)) (currentByte!10782 b2!99) (currentBit!10777 b2!99)))))

(declare-fun b!232159 () Bool)

(declare-fun res!194362 () Bool)

(assert (=> b!232159 (=> (not res!194362) (not e!159769))))

(assert (=> b!232159 (= res!194362 (= lt!368870 (bvadd (bitIndex!0 (size!5234 (buf!5775 b1!101)) (currentByte!10782 b1!101) (currentBit!10777 b1!101)) bits!86)))))

(declare-fun b!232160 () Bool)

(declare-fun res!194360 () Bool)

(assert (=> b!232160 (=> (not res!194360) (not e!159769))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232160 (= res!194360 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5234 (buf!5775 b1!101))) ((_ sign_extend 32) (currentByte!10782 b1!101)) ((_ sign_extend 32) (currentBit!10777 b1!101)) bytes!19))))

(declare-fun res!194363 () Bool)

(assert (=> start!48968 (=> (not res!194363) (not e!159768))))

(assert (=> start!48968 (= res!194363 (and (= (size!5234 (buf!5775 b1!101)) (size!5234 (buf!5775 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48968 e!159768))

(declare-fun inv!12 (BitStream!9564) Bool)

(assert (=> start!48968 (and (inv!12 b1!101) e!159770)))

(assert (=> start!48968 (and (inv!12 b2!99) e!159772)))

(assert (=> start!48968 true))

(declare-fun b!232155 () Bool)

(declare-fun res!194361 () Bool)

(assert (=> b!232155 (=> (not res!194361) (not e!159769))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232155 (= res!194361 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5234 (buf!5775 b1!101))) ((_ sign_extend 32) (currentByte!10782 b1!101)) ((_ sign_extend 32) (currentBit!10777 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48968 res!194363) b!232158))

(assert (= (and b!232158 res!194364) b!232160))

(assert (= (and b!232160 res!194360) b!232159))

(assert (= (and b!232159 res!194362) b!232155))

(assert (= (and b!232155 res!194361) b!232157))

(assert (= start!48968 b!232154))

(assert (= start!48968 b!232156))

(declare-fun m!355107 () Bool)

(assert (=> b!232158 m!355107))

(declare-fun m!355109 () Bool)

(assert (=> b!232156 m!355109))

(declare-fun m!355111 () Bool)

(assert (=> b!232160 m!355111))

(declare-fun m!355113 () Bool)

(assert (=> b!232154 m!355113))

(declare-fun m!355115 () Bool)

(assert (=> start!48968 m!355115))

(declare-fun m!355117 () Bool)

(assert (=> start!48968 m!355117))

(declare-fun m!355119 () Bool)

(assert (=> b!232155 m!355119))

(declare-fun m!355121 () Bool)

(assert (=> b!232159 m!355121))

(check-sat (not start!48968) (not b!232158) (not b!232156) (not b!232155) (not b!232159) (not b!232154) (not b!232160))
(check-sat)
