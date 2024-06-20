; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48992 () Bool)

(assert start!48992)

(declare-fun b!232388 () Bool)

(declare-fun e!159971 () Bool)

(declare-fun e!159969 () Bool)

(assert (=> b!232388 (= e!159971 e!159969)))

(declare-fun res!194523 () Bool)

(assert (=> b!232388 (=> (not res!194523) (not e!159969))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368925 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!232388 (= res!194523 (and (bvsle bits!86 lt!368925) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11961 0))(
  ( (array!11962 (arr!6233 (Array (_ BitVec 32) (_ BitVec 8))) (size!5246 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9588 0))(
  ( (BitStream!9589 (buf!5787 array!11961) (currentByte!10794 (_ BitVec 32)) (currentBit!10789 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9588)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232388 (= lt!368925 (bitIndex!0 (size!5246 (buf!5787 b2!99)) (currentByte!10794 b2!99) (currentBit!10789 b2!99)))))

(declare-fun b!232389 () Bool)

(declare-fun res!194524 () Bool)

(assert (=> b!232389 (=> (not res!194524) (not e!159969))))

(declare-fun b1!101 () BitStream!9588)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232389 (= res!194524 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5246 (buf!5787 b1!101))) ((_ sign_extend 32) (currentByte!10794 b1!101)) ((_ sign_extend 32) (currentBit!10789 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!194525 () Bool)

(assert (=> start!48992 (=> (not res!194525) (not e!159971))))

(assert (=> start!48992 (= res!194525 (and (= (size!5246 (buf!5787 b1!101)) (size!5246 (buf!5787 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48992 e!159971))

(declare-fun e!159967 () Bool)

(declare-fun inv!12 (BitStream!9588) Bool)

(assert (=> start!48992 (and (inv!12 b1!101) e!159967)))

(declare-fun e!159970 () Bool)

(assert (=> start!48992 (and (inv!12 b2!99) e!159970)))

(assert (=> start!48992 true))

(declare-fun b!232390 () Bool)

(declare-fun array_inv!4987 (array!11961) Bool)

(assert (=> b!232390 (= e!159967 (array_inv!4987 (buf!5787 b1!101)))))

(declare-fun b!232391 () Bool)

(declare-fun res!194526 () Bool)

(assert (=> b!232391 (=> (not res!194526) (not e!159969))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232391 (= res!194526 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5246 (buf!5787 b1!101))) ((_ sign_extend 32) (currentByte!10794 b1!101)) ((_ sign_extend 32) (currentBit!10789 b1!101)) bytes!19))))

(declare-fun b!232392 () Bool)

(declare-fun res!194522 () Bool)

(assert (=> b!232392 (=> (not res!194522) (not e!159969))))

(assert (=> b!232392 (= res!194522 (= lt!368925 (bvadd (bitIndex!0 (size!5246 (buf!5787 b1!101)) (currentByte!10794 b1!101) (currentBit!10789 b1!101)) bits!86)))))

(declare-fun b!232393 () Bool)

(declare-fun lt!368924 () (_ BitVec 64))

(assert (=> b!232393 (= e!159969 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5246 (buf!5787 b1!101)))) lt!368924) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14361 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10794 b2!99))))) (let ((bdg!14362 (bvadd bdg!14361 ((_ sign_extend 32) (currentBit!10789 b2!99))))) (and (= lt!368925 bdg!14362) (= (bvsub lt!368925 bits!86) lt!368924) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5246 (buf!5787 b2!99)))) (bvsub bdg!14362 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= ((_ sign_extend 32) (currentByte!10794 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!14361 ((_ sign_extend 32) (currentByte!10794 b2!99))))))))))))

(assert (=> b!232393 (= lt!368924 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10794 b1!101))) ((_ sign_extend 32) (currentBit!10789 b1!101))))))

(declare-fun b!232394 () Bool)

(assert (=> b!232394 (= e!159970 (array_inv!4987 (buf!5787 b2!99)))))

(assert (= (and start!48992 res!194525) b!232388))

(assert (= (and b!232388 res!194523) b!232391))

(assert (= (and b!232391 res!194526) b!232392))

(assert (= (and b!232392 res!194522) b!232389))

(assert (= (and b!232389 res!194524) b!232393))

(assert (= start!48992 b!232390))

(assert (= start!48992 b!232394))

(declare-fun m!355287 () Bool)

(assert (=> b!232388 m!355287))

(declare-fun m!355289 () Bool)

(assert (=> b!232390 m!355289))

(declare-fun m!355291 () Bool)

(assert (=> b!232391 m!355291))

(declare-fun m!355293 () Bool)

(assert (=> b!232392 m!355293))

(declare-fun m!355295 () Bool)

(assert (=> b!232389 m!355295))

(declare-fun m!355297 () Bool)

(assert (=> start!48992 m!355297))

(declare-fun m!355299 () Bool)

(assert (=> start!48992 m!355299))

(declare-fun m!355301 () Bool)

(assert (=> b!232394 m!355301))

(check-sat (not b!232392) (not start!48992) (not b!232388) (not b!232389) (not b!232391) (not b!232394) (not b!232390))
(check-sat)
