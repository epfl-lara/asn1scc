; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48582 () Bool)

(assert start!48582)

(declare-fun b!230245 () Bool)

(declare-fun res!193013 () Bool)

(declare-fun e!158109 () Bool)

(assert (=> b!230245 (=> (not res!193013) (not e!158109))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367916 () (_ BitVec 64))

(declare-datatypes ((array!11729 0))(
  ( (array!11730 (arr!6129 (Array (_ BitVec 32) (_ BitVec 8))) (size!5142 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9380 0))(
  ( (BitStream!9381 (buf!5683 array!11729) (currentByte!10637 (_ BitVec 32)) (currentBit!10632 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9380)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230245 (= res!193013 (= lt!367916 (bvadd (bitIndex!0 (size!5142 (buf!5683 b1!101)) (currentByte!10637 b1!101) (currentBit!10632 b1!101)) bits!86)))))

(declare-fun b!230246 () Bool)

(declare-fun res!193011 () Bool)

(declare-fun e!158116 () Bool)

(assert (=> b!230246 (=> (not res!193011) (not e!158116))))

(declare-fun lt!367919 () (_ BitVec 32))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9380)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230246 (= res!193011 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5142 (buf!5683 b2!99))) ((_ sign_extend 32) (currentByte!10637 b2!99)) ((_ sign_extend 32) (currentBit!10632 b2!99)) (bvsub bytes!19 lt!367919)))))

(declare-fun b!230247 () Bool)

(declare-fun res!193006 () Bool)

(assert (=> b!230247 (=> (not res!193006) (not e!158109))))

(assert (=> b!230247 (= res!193006 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5142 (buf!5683 b1!101))) ((_ sign_extend 32) (currentByte!10637 b1!101)) ((_ sign_extend 32) (currentBit!10632 b1!101)) bytes!19))))

(declare-fun b!230248 () Bool)

(declare-fun e!158117 () Bool)

(assert (=> b!230248 (= e!158117 e!158116)))

(declare-fun res!193003 () Bool)

(assert (=> b!230248 (=> (not res!193003) (not e!158116))))

(declare-fun lt!367918 () (_ BitVec 64))

(declare-fun lt!367920 () (_ BitVec 64))

(declare-fun lt!367917 () (_ BitVec 64))

(assert (=> b!230248 (= res!193003 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367918 (bvsub lt!367920 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367918 lt!367920) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367917))))))

(assert (=> b!230248 (= lt!367918 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5142 (buf!5683 b2!99)))))))

(declare-fun b!230249 () Bool)

(declare-fun e!158114 () Bool)

(assert (=> b!230249 (= e!158109 e!158114)))

(declare-fun res!193009 () Bool)

(assert (=> b!230249 (=> (not res!193009) (not e!158114))))

(declare-fun lt!367915 () (_ BitVec 64))

(assert (=> b!230249 (= res!193009 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5142 (buf!5683 b1!101)))) lt!367915) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230249 (= lt!367915 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10637 b1!101))) ((_ sign_extend 32) (currentBit!10632 b1!101))))))

(declare-fun b!230250 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230250 (= e!158116 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10632 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10637 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5142 (buf!5683 b2!99)))))))))

(declare-fun b!230251 () Bool)

(declare-fun res!193008 () Bool)

(assert (=> b!230251 (=> (not res!193008) (not e!158116))))

(assert (=> b!230251 (= res!193008 (and (bvsle ((_ sign_extend 32) (size!5142 (buf!5683 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10637 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10632 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5142 (buf!5683 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10637 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10632 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!230252 () Bool)

(declare-fun e!158111 () Bool)

(declare-fun e!158110 () Bool)

(assert (=> b!230252 (= e!158111 e!158110)))

(declare-fun res!193010 () Bool)

(assert (=> b!230252 (=> (not res!193010) (not e!158110))))

(assert (=> b!230252 (= res!193010 (bvsle bits!86 lt!367916))))

(assert (=> b!230252 (= lt!367916 (bitIndex!0 (size!5142 (buf!5683 b2!99)) (currentByte!10637 b2!99) (currentBit!10632 b2!99)))))

(declare-fun b!230253 () Bool)

(assert (=> b!230253 (= e!158110 e!158109)))

(declare-fun res!193004 () Bool)

(assert (=> b!230253 (=> (not res!193004) (not e!158109))))

(assert (=> b!230253 (= res!193004 (bvsle lt!367919 bytes!19))))

(assert (=> b!230253 (= lt!367919 ((_ extract 31 0) lt!367917))))

(assert (=> b!230253 (= lt!367917 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!230254 () Bool)

(assert (=> b!230254 (= e!158114 e!158117)))

(declare-fun res!193012 () Bool)

(assert (=> b!230254 (=> (not res!193012) (not e!158117))))

(assert (=> b!230254 (= res!193012 (and (= lt!367916 lt!367920) (= (bvsub lt!367916 bits!86) lt!367915)))))

(assert (=> b!230254 (= lt!367920 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10637 b2!99))) ((_ sign_extend 32) (currentBit!10632 b2!99))))))

(declare-fun b!230255 () Bool)

(declare-fun e!158112 () Bool)

(declare-fun array_inv!4883 (array!11729) Bool)

(assert (=> b!230255 (= e!158112 (array_inv!4883 (buf!5683 b1!101)))))

(declare-fun res!193005 () Bool)

(assert (=> start!48582 (=> (not res!193005) (not e!158111))))

(assert (=> start!48582 (= res!193005 (and (= (size!5142 (buf!5683 b1!101)) (size!5142 (buf!5683 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48582 e!158111))

(declare-fun inv!12 (BitStream!9380) Bool)

(assert (=> start!48582 (and (inv!12 b1!101) e!158112)))

(declare-fun e!158113 () Bool)

(assert (=> start!48582 (and (inv!12 b2!99) e!158113)))

(assert (=> start!48582 true))

(declare-fun b!230256 () Bool)

(declare-fun res!193007 () Bool)

(assert (=> b!230256 (=> (not res!193007) (not e!158109))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230256 (= res!193007 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5142 (buf!5683 b1!101))) ((_ sign_extend 32) (currentByte!10637 b1!101)) ((_ sign_extend 32) (currentBit!10632 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230257 () Bool)

(assert (=> b!230257 (= e!158113 (array_inv!4883 (buf!5683 b2!99)))))

(assert (= (and start!48582 res!193005) b!230252))

(assert (= (and b!230252 res!193010) b!230253))

(assert (= (and b!230253 res!193004) b!230247))

(assert (= (and b!230247 res!193006) b!230245))

(assert (= (and b!230245 res!193013) b!230256))

(assert (= (and b!230256 res!193007) b!230249))

(assert (= (and b!230249 res!193009) b!230254))

(assert (= (and b!230254 res!193012) b!230248))

(assert (= (and b!230248 res!193003) b!230246))

(assert (= (and b!230246 res!193011) b!230251))

(assert (= (and b!230251 res!193008) b!230250))

(assert (= start!48582 b!230255))

(assert (= start!48582 b!230257))

(declare-fun m!353609 () Bool)

(assert (=> b!230252 m!353609))

(declare-fun m!353611 () Bool)

(assert (=> b!230245 m!353611))

(declare-fun m!353613 () Bool)

(assert (=> b!230250 m!353613))

(declare-fun m!353615 () Bool)

(assert (=> b!230257 m!353615))

(declare-fun m!353617 () Bool)

(assert (=> b!230255 m!353617))

(declare-fun m!353619 () Bool)

(assert (=> b!230256 m!353619))

(declare-fun m!353621 () Bool)

(assert (=> b!230246 m!353621))

(declare-fun m!353623 () Bool)

(assert (=> b!230247 m!353623))

(declare-fun m!353625 () Bool)

(assert (=> start!48582 m!353625))

(declare-fun m!353627 () Bool)

(assert (=> start!48582 m!353627))

(push 1)

(assert (not b!230257))

(assert (not b!230246))

(assert (not start!48582))

(assert (not b!230255))

(assert (not b!230245))

(assert (not b!230256))

(assert (not b!230247))

(assert (not b!230250))

(assert (not b!230252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

