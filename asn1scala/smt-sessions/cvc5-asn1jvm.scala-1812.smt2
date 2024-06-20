; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48984 () Bool)

(assert start!48984)

(declare-fun b!232304 () Bool)

(declare-fun res!194465 () Bool)

(declare-fun e!159895 () Bool)

(assert (=> b!232304 (=> (not res!194465) (not e!159895))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11953 0))(
  ( (array!11954 (arr!6229 (Array (_ BitVec 32) (_ BitVec 8))) (size!5242 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9580 0))(
  ( (BitStream!9581 (buf!5783 array!11953) (currentByte!10790 (_ BitVec 32)) (currentBit!10785 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9580)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232304 (= res!194465 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5242 (buf!5783 b1!101))) ((_ sign_extend 32) (currentByte!10790 b1!101)) ((_ sign_extend 32) (currentBit!10785 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!194466 () Bool)

(declare-fun e!159896 () Bool)

(assert (=> start!48984 (=> (not res!194466) (not e!159896))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9580)

(assert (=> start!48984 (= res!194466 (and (= (size!5242 (buf!5783 b1!101)) (size!5242 (buf!5783 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48984 e!159896))

(declare-fun e!159899 () Bool)

(declare-fun inv!12 (BitStream!9580) Bool)

(assert (=> start!48984 (and (inv!12 b1!101) e!159899)))

(declare-fun e!159894 () Bool)

(assert (=> start!48984 (and (inv!12 b2!99) e!159894)))

(assert (=> start!48984 true))

(declare-fun b!232305 () Bool)

(declare-fun res!194462 () Bool)

(assert (=> b!232305 (=> (not res!194462) (not e!159895))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232305 (= res!194462 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5242 (buf!5783 b1!101))) ((_ sign_extend 32) (currentByte!10790 b1!101)) ((_ sign_extend 32) (currentBit!10785 b1!101)) bytes!19))))

(declare-fun b!232306 () Bool)

(declare-fun array_inv!4983 (array!11953) Bool)

(assert (=> b!232306 (= e!159899 (array_inv!4983 (buf!5783 b1!101)))))

(declare-fun b!232307 () Bool)

(declare-fun lt!368901 () (_ BitVec 64))

(declare-fun lt!368900 () (_ BitVec 64))

(assert (=> b!232307 (= e!159895 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5242 (buf!5783 b1!101)))) lt!368901) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14357 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10790 b2!99))) ((_ sign_extend 32) (currentBit!10785 b2!99))))) (and (= lt!368900 bdg!14357) (= (bvsub lt!368900 bits!86) lt!368901) (let ((bdg!14358 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5242 (buf!5783 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14358 (bvsub bdg!14357 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= ((_ sign_extend 32) (size!5242 (buf!5783 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!14358 ((_ sign_extend 32) (size!5242 (buf!5783 b2!99))))))))))))))

(assert (=> b!232307 (= lt!368901 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10790 b1!101))) ((_ sign_extend 32) (currentBit!10785 b1!101))))))

(declare-fun b!232308 () Bool)

(declare-fun res!194463 () Bool)

(assert (=> b!232308 (=> (not res!194463) (not e!159895))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232308 (= res!194463 (= lt!368900 (bvadd (bitIndex!0 (size!5242 (buf!5783 b1!101)) (currentByte!10790 b1!101) (currentBit!10785 b1!101)) bits!86)))))

(declare-fun b!232309 () Bool)

(assert (=> b!232309 (= e!159896 e!159895)))

(declare-fun res!194464 () Bool)

(assert (=> b!232309 (=> (not res!194464) (not e!159895))))

(assert (=> b!232309 (= res!194464 (and (bvsle bits!86 lt!368900) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232309 (= lt!368900 (bitIndex!0 (size!5242 (buf!5783 b2!99)) (currentByte!10790 b2!99) (currentBit!10785 b2!99)))))

(declare-fun b!232310 () Bool)

(assert (=> b!232310 (= e!159894 (array_inv!4983 (buf!5783 b2!99)))))

(assert (= (and start!48984 res!194466) b!232309))

(assert (= (and b!232309 res!194464) b!232305))

(assert (= (and b!232305 res!194462) b!232308))

(assert (= (and b!232308 res!194463) b!232304))

(assert (= (and b!232304 res!194465) b!232307))

(assert (= start!48984 b!232306))

(assert (= start!48984 b!232310))

(declare-fun m!355223 () Bool)

(assert (=> b!232305 m!355223))

(declare-fun m!355225 () Bool)

(assert (=> b!232308 m!355225))

(declare-fun m!355227 () Bool)

(assert (=> start!48984 m!355227))

(declare-fun m!355229 () Bool)

(assert (=> start!48984 m!355229))

(declare-fun m!355231 () Bool)

(assert (=> b!232310 m!355231))

(declare-fun m!355233 () Bool)

(assert (=> b!232306 m!355233))

(declare-fun m!355235 () Bool)

(assert (=> b!232309 m!355235))

(declare-fun m!355237 () Bool)

(assert (=> b!232304 m!355237))

(push 1)

(assert (not b!232309))

(assert (not b!232304))

(assert (not b!232306))

(assert (not b!232310))

(assert (not b!232308))

(assert (not b!232305))

(assert (not start!48984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

