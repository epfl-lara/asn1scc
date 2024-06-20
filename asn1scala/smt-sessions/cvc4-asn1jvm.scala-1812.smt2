; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48988 () Bool)

(assert start!48988)

(declare-fun b!232346 () Bool)

(declare-fun e!159935 () Bool)

(declare-datatypes ((array!11957 0))(
  ( (array!11958 (arr!6231 (Array (_ BitVec 32) (_ BitVec 8))) (size!5244 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9584 0))(
  ( (BitStream!9585 (buf!5785 array!11957) (currentByte!10792 (_ BitVec 32)) (currentBit!10787 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9584)

(declare-fun array_inv!4985 (array!11957) Bool)

(assert (=> b!232346 (= e!159935 (array_inv!4985 (buf!5785 b2!99)))))

(declare-fun b!232347 () Bool)

(declare-fun e!159932 () Bool)

(declare-fun e!159934 () Bool)

(assert (=> b!232347 (= e!159932 e!159934)))

(declare-fun res!194493 () Bool)

(assert (=> b!232347 (=> (not res!194493) (not e!159934))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!368912 () (_ BitVec 64))

(assert (=> b!232347 (= res!194493 (and (bvsle bits!86 lt!368912) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232347 (= lt!368912 (bitIndex!0 (size!5244 (buf!5785 b2!99)) (currentByte!10792 b2!99) (currentBit!10787 b2!99)))))

(declare-fun b!232348 () Bool)

(declare-fun res!194496 () Bool)

(assert (=> b!232348 (=> (not res!194496) (not e!159934))))

(declare-fun b1!101 () BitStream!9584)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232348 (= res!194496 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5244 (buf!5785 b1!101))) ((_ sign_extend 32) (currentByte!10792 b1!101)) ((_ sign_extend 32) (currentBit!10787 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!194494 () Bool)

(assert (=> start!48988 (=> (not res!194494) (not e!159932))))

(assert (=> start!48988 (= res!194494 (and (= (size!5244 (buf!5785 b1!101)) (size!5244 (buf!5785 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48988 e!159932))

(declare-fun e!159930 () Bool)

(declare-fun inv!12 (BitStream!9584) Bool)

(assert (=> start!48988 (and (inv!12 b1!101) e!159930)))

(assert (=> start!48988 (and (inv!12 b2!99) e!159935)))

(assert (=> start!48988 true))

(declare-fun b!232349 () Bool)

(declare-fun res!194495 () Bool)

(assert (=> b!232349 (=> (not res!194495) (not e!159934))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232349 (= res!194495 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5244 (buf!5785 b1!101))) ((_ sign_extend 32) (currentByte!10792 b1!101)) ((_ sign_extend 32) (currentBit!10787 b1!101)) bytes!19))))

(declare-fun lt!368913 () (_ BitVec 64))

(declare-fun b!232350 () Bool)

(assert (=> b!232350 (= e!159934 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5244 (buf!5785 b1!101)))) lt!368913) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14357 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10792 b2!99))) ((_ sign_extend 32) (currentBit!10787 b2!99))))) (and (= lt!368912 bdg!14357) (= (bvsub lt!368912 bits!86) lt!368913) (let ((bdg!14358 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5244 (buf!5785 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14358 (bvsub bdg!14357 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= ((_ sign_extend 32) (size!5244 (buf!5785 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!14358 ((_ sign_extend 32) (size!5244 (buf!5785 b2!99))))))))))))))

(assert (=> b!232350 (= lt!368913 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10792 b1!101))) ((_ sign_extend 32) (currentBit!10787 b1!101))))))

(declare-fun b!232351 () Bool)

(declare-fun res!194492 () Bool)

(assert (=> b!232351 (=> (not res!194492) (not e!159934))))

(assert (=> b!232351 (= res!194492 (= lt!368912 (bvadd (bitIndex!0 (size!5244 (buf!5785 b1!101)) (currentByte!10792 b1!101) (currentBit!10787 b1!101)) bits!86)))))

(declare-fun b!232352 () Bool)

(assert (=> b!232352 (= e!159930 (array_inv!4985 (buf!5785 b1!101)))))

(assert (= (and start!48988 res!194494) b!232347))

(assert (= (and b!232347 res!194493) b!232349))

(assert (= (and b!232349 res!194495) b!232351))

(assert (= (and b!232351 res!194492) b!232348))

(assert (= (and b!232348 res!194496) b!232350))

(assert (= start!48988 b!232352))

(assert (= start!48988 b!232346))

(declare-fun m!355255 () Bool)

(assert (=> b!232348 m!355255))

(declare-fun m!355257 () Bool)

(assert (=> b!232351 m!355257))

(declare-fun m!355259 () Bool)

(assert (=> b!232347 m!355259))

(declare-fun m!355261 () Bool)

(assert (=> b!232352 m!355261))

(declare-fun m!355263 () Bool)

(assert (=> b!232349 m!355263))

(declare-fun m!355265 () Bool)

(assert (=> start!48988 m!355265))

(declare-fun m!355267 () Bool)

(assert (=> start!48988 m!355267))

(declare-fun m!355269 () Bool)

(assert (=> b!232346 m!355269))

(push 1)

(assert (not b!232351))

(assert (not b!232349))

(assert (not b!232346))

(assert (not b!232352))

(assert (not b!232348))

(assert (not start!48988))

(assert (not b!232347))

(check-sat)

(pop 1)

(push 1)

(check-sat)

