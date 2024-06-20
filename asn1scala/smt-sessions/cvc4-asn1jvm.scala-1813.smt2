; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48994 () Bool)

(assert start!48994)

(declare-fun res!194539 () Bool)

(declare-fun e!159988 () Bool)

(assert (=> start!48994 (=> (not res!194539) (not e!159988))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11963 0))(
  ( (array!11964 (arr!6234 (Array (_ BitVec 32) (_ BitVec 8))) (size!5247 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9590 0))(
  ( (BitStream!9591 (buf!5788 array!11963) (currentByte!10795 (_ BitVec 32)) (currentBit!10790 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9590)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9590)

(assert (=> start!48994 (= res!194539 (and (= (size!5247 (buf!5788 b1!101)) (size!5247 (buf!5788 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48994 e!159988))

(declare-fun e!159984 () Bool)

(declare-fun inv!12 (BitStream!9590) Bool)

(assert (=> start!48994 (and (inv!12 b1!101) e!159984)))

(declare-fun e!159986 () Bool)

(assert (=> start!48994 (and (inv!12 b2!99) e!159986)))

(assert (=> start!48994 true))

(declare-fun b!232409 () Bool)

(declare-fun array_inv!4988 (array!11963) Bool)

(assert (=> b!232409 (= e!159984 (array_inv!4988 (buf!5788 b1!101)))))

(declare-fun b!232410 () Bool)

(declare-fun res!194541 () Bool)

(declare-fun e!159987 () Bool)

(assert (=> b!232410 (=> (not res!194541) (not e!159987))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232410 (= res!194541 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5247 (buf!5788 b1!101))) ((_ sign_extend 32) (currentByte!10795 b1!101)) ((_ sign_extend 32) (currentBit!10790 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232411 () Bool)

(declare-fun res!194537 () Bool)

(assert (=> b!232411 (=> (not res!194537) (not e!159987))))

(declare-fun lt!368931 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232411 (= res!194537 (= lt!368931 (bvadd (bitIndex!0 (size!5247 (buf!5788 b1!101)) (currentByte!10795 b1!101) (currentBit!10790 b1!101)) bits!86)))))

(declare-fun lt!368930 () (_ BitVec 64))

(declare-fun b!232412 () Bool)

(assert (=> b!232412 (= e!159987 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5247 (buf!5788 b1!101)))) lt!368930) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14361 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10795 b2!99))))) (let ((bdg!14362 (bvadd bdg!14361 ((_ sign_extend 32) (currentBit!10790 b2!99))))) (and (= lt!368931 bdg!14362) (= (bvsub lt!368931 bits!86) lt!368930) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5247 (buf!5788 b2!99)))) (bvsub bdg!14362 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= ((_ sign_extend 32) (currentByte!10795 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!14361 ((_ sign_extend 32) (currentByte!10795 b2!99))))))))))))

(assert (=> b!232412 (= lt!368930 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10795 b1!101))) ((_ sign_extend 32) (currentBit!10790 b1!101))))))

(declare-fun b!232413 () Bool)

(assert (=> b!232413 (= e!159988 e!159987)))

(declare-fun res!194540 () Bool)

(assert (=> b!232413 (=> (not res!194540) (not e!159987))))

(assert (=> b!232413 (= res!194540 (and (bvsle bits!86 lt!368931) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232413 (= lt!368931 (bitIndex!0 (size!5247 (buf!5788 b2!99)) (currentByte!10795 b2!99) (currentBit!10790 b2!99)))))

(declare-fun b!232414 () Bool)

(declare-fun res!194538 () Bool)

(assert (=> b!232414 (=> (not res!194538) (not e!159987))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232414 (= res!194538 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5247 (buf!5788 b1!101))) ((_ sign_extend 32) (currentByte!10795 b1!101)) ((_ sign_extend 32) (currentBit!10790 b1!101)) bytes!19))))

(declare-fun b!232415 () Bool)

(assert (=> b!232415 (= e!159986 (array_inv!4988 (buf!5788 b2!99)))))

(assert (= (and start!48994 res!194539) b!232413))

(assert (= (and b!232413 res!194540) b!232414))

(assert (= (and b!232414 res!194538) b!232411))

(assert (= (and b!232411 res!194537) b!232410))

(assert (= (and b!232410 res!194541) b!232412))

(assert (= start!48994 b!232409))

(assert (= start!48994 b!232415))

(declare-fun m!355303 () Bool)

(assert (=> b!232415 m!355303))

(declare-fun m!355305 () Bool)

(assert (=> b!232410 m!355305))

(declare-fun m!355307 () Bool)

(assert (=> start!48994 m!355307))

(declare-fun m!355309 () Bool)

(assert (=> start!48994 m!355309))

(declare-fun m!355311 () Bool)

(assert (=> b!232411 m!355311))

(declare-fun m!355313 () Bool)

(assert (=> b!232413 m!355313))

(declare-fun m!355315 () Bool)

(assert (=> b!232409 m!355315))

(declare-fun m!355317 () Bool)

(assert (=> b!232414 m!355317))

(push 1)

(assert (not b!232414))

(assert (not b!232410))

(assert (not start!48994))

(assert (not b!232413))

(assert (not b!232411))

(assert (not b!232415))

(assert (not b!232409))

(check-sat)

(pop 1)

(push 1)

(check-sat)

