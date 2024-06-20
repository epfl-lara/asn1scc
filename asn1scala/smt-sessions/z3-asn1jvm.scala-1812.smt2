; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48986 () Bool)

(assert start!48986)

(declare-fun b!232325 () Bool)

(declare-fun e!159915 () Bool)

(declare-datatypes ((array!11955 0))(
  ( (array!11956 (arr!6230 (Array (_ BitVec 32) (_ BitVec 8))) (size!5243 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9582 0))(
  ( (BitStream!9583 (buf!5784 array!11955) (currentByte!10791 (_ BitVec 32)) (currentBit!10786 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9582)

(declare-fun array_inv!4984 (array!11955) Bool)

(assert (=> b!232325 (= e!159915 (array_inv!4984 (buf!5784 b2!99)))))

(declare-fun b!232326 () Bool)

(declare-fun e!159913 () Bool)

(declare-fun e!159916 () Bool)

(assert (=> b!232326 (= e!159913 e!159916)))

(declare-fun res!194481 () Bool)

(assert (=> b!232326 (=> (not res!194481) (not e!159916))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368906 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!232326 (= res!194481 (and (bvsle bits!86 lt!368906) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232326 (= lt!368906 (bitIndex!0 (size!5243 (buf!5784 b2!99)) (currentByte!10791 b2!99) (currentBit!10786 b2!99)))))

(declare-fun b!232328 () Bool)

(declare-fun res!194479 () Bool)

(assert (=> b!232328 (=> (not res!194479) (not e!159916))))

(declare-fun b1!101 () BitStream!9582)

(assert (=> b!232328 (= res!194479 (= lt!368906 (bvadd (bitIndex!0 (size!5243 (buf!5784 b1!101)) (currentByte!10791 b1!101) (currentBit!10786 b1!101)) bits!86)))))

(declare-fun b!232329 () Bool)

(declare-fun res!194477 () Bool)

(assert (=> b!232329 (=> (not res!194477) (not e!159916))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232329 (= res!194477 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5243 (buf!5784 b1!101))) ((_ sign_extend 32) (currentByte!10791 b1!101)) ((_ sign_extend 32) (currentBit!10786 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232327 () Bool)

(declare-fun res!194478 () Bool)

(assert (=> b!232327 (=> (not res!194478) (not e!159916))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232327 (= res!194478 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5243 (buf!5784 b1!101))) ((_ sign_extend 32) (currentByte!10791 b1!101)) ((_ sign_extend 32) (currentBit!10786 b1!101)) bytes!19))))

(declare-fun res!194480 () Bool)

(assert (=> start!48986 (=> (not res!194480) (not e!159913))))

(assert (=> start!48986 (= res!194480 (and (= (size!5243 (buf!5784 b1!101)) (size!5243 (buf!5784 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48986 e!159913))

(declare-fun e!159917 () Bool)

(declare-fun inv!12 (BitStream!9582) Bool)

(assert (=> start!48986 (and (inv!12 b1!101) e!159917)))

(assert (=> start!48986 (and (inv!12 b2!99) e!159915)))

(assert (=> start!48986 true))

(declare-fun b!232330 () Bool)

(assert (=> b!232330 (= e!159917 (array_inv!4984 (buf!5784 b1!101)))))

(declare-fun b!232331 () Bool)

(declare-fun lt!368907 () (_ BitVec 64))

(assert (=> b!232331 (= e!159916 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5243 (buf!5784 b1!101)))) lt!368907) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14357 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10791 b2!99))) ((_ sign_extend 32) (currentBit!10786 b2!99))))) (and (= lt!368906 bdg!14357) (= (bvsub lt!368906 bits!86) lt!368907) (let ((bdg!14358 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5243 (buf!5784 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14358 (bvsub bdg!14357 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= ((_ sign_extend 32) (size!5243 (buf!5784 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!14358 ((_ sign_extend 32) (size!5243 (buf!5784 b2!99))))))))))))))

(assert (=> b!232331 (= lt!368907 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10791 b1!101))) ((_ sign_extend 32) (currentBit!10786 b1!101))))))

(assert (= (and start!48986 res!194480) b!232326))

(assert (= (and b!232326 res!194481) b!232327))

(assert (= (and b!232327 res!194478) b!232328))

(assert (= (and b!232328 res!194479) b!232329))

(assert (= (and b!232329 res!194477) b!232331))

(assert (= start!48986 b!232330))

(assert (= start!48986 b!232325))

(declare-fun m!355239 () Bool)

(assert (=> b!232326 m!355239))

(declare-fun m!355241 () Bool)

(assert (=> b!232327 m!355241))

(declare-fun m!355243 () Bool)

(assert (=> b!232330 m!355243))

(declare-fun m!355245 () Bool)

(assert (=> start!48986 m!355245))

(declare-fun m!355247 () Bool)

(assert (=> start!48986 m!355247))

(declare-fun m!355249 () Bool)

(assert (=> b!232325 m!355249))

(declare-fun m!355251 () Bool)

(assert (=> b!232328 m!355251))

(declare-fun m!355253 () Bool)

(assert (=> b!232329 m!355253))

(check-sat (not b!232330) (not start!48986) (not b!232329) (not b!232328) (not b!232326) (not b!232327) (not b!232325))
(check-sat)
