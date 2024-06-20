; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48892 () Bool)

(assert start!48892)

(declare-fun b!231374 () Bool)

(declare-fun e!159105 () Bool)

(declare-datatypes ((array!11861 0))(
  ( (array!11862 (arr!6183 (Array (_ BitVec 32) (_ BitVec 8))) (size!5196 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9488 0))(
  ( (BitStream!9489 (buf!5737 array!11861) (currentByte!10744 (_ BitVec 32)) (currentBit!10739 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9488)

(declare-fun array_inv!4937 (array!11861) Bool)

(assert (=> b!231374 (= e!159105 (array_inv!4937 (buf!5737 b2!99)))))

(declare-fun b!231376 () Bool)

(declare-fun e!159103 () Bool)

(declare-fun b1!101 () BitStream!9488)

(assert (=> b!231376 (= e!159103 (array_inv!4937 (buf!5737 b1!101)))))

(declare-fun b!231377 () Bool)

(declare-fun e!159104 () Bool)

(declare-fun lt!368660 () (_ BitVec 64))

(declare-fun lt!368659 () (_ BitVec 64))

(assert (=> b!231377 (= e!159104 (and (= lt!368660 (bvand ((_ sign_extend 32) (currentBit!10739 b1!101)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!368660 (bvand (bvadd lt!368659 ((_ sign_extend 32) (currentBit!10739 b1!101))) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!231377 (= lt!368660 (bvand lt!368659 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231377 (= lt!368659 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10744 b1!101))))))

(declare-fun b!231378 () Bool)

(declare-fun e!159107 () Bool)

(assert (=> b!231378 (= e!159107 e!159104)))

(declare-fun res!193809 () Bool)

(assert (=> b!231378 (=> (not res!193809) (not e!159104))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!368661 () (_ BitVec 64))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!231378 (= res!193809 (and (bvsle bits!86 lt!368661) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231378 (= lt!368661 (bitIndex!0 (size!5196 (buf!5737 b2!99)) (currentByte!10744 b2!99) (currentBit!10739 b2!99)))))

(declare-fun b!231379 () Bool)

(declare-fun res!193811 () Bool)

(assert (=> b!231379 (=> (not res!193811) (not e!159104))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231379 (= res!193811 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5196 (buf!5737 b1!101))) ((_ sign_extend 32) (currentByte!10744 b1!101)) ((_ sign_extend 32) (currentBit!10739 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231380 () Bool)

(declare-fun res!193808 () Bool)

(assert (=> b!231380 (=> (not res!193808) (not e!159104))))

(assert (=> b!231380 (= res!193808 (= lt!368661 (bvadd (bitIndex!0 (size!5196 (buf!5737 b1!101)) (currentByte!10744 b1!101) (currentBit!10739 b1!101)) bits!86)))))

(declare-fun b!231375 () Bool)

(declare-fun res!193810 () Bool)

(assert (=> b!231375 (=> (not res!193810) (not e!159104))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231375 (= res!193810 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5196 (buf!5737 b1!101))) ((_ sign_extend 32) (currentByte!10744 b1!101)) ((_ sign_extend 32) (currentBit!10739 b1!101)) bytes!19))))

(declare-fun res!193812 () Bool)

(assert (=> start!48892 (=> (not res!193812) (not e!159107))))

(assert (=> start!48892 (= res!193812 (and (= (size!5196 (buf!5737 b1!101)) (size!5196 (buf!5737 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48892 e!159107))

(declare-fun inv!12 (BitStream!9488) Bool)

(assert (=> start!48892 (and (inv!12 b1!101) e!159103)))

(assert (=> start!48892 (and (inv!12 b2!99) e!159105)))

(assert (=> start!48892 true))

(assert (= (and start!48892 res!193812) b!231378))

(assert (= (and b!231378 res!193809) b!231375))

(assert (= (and b!231375 res!193810) b!231380))

(assert (= (and b!231380 res!193808) b!231379))

(assert (= (and b!231379 res!193811) b!231377))

(assert (= start!48892 b!231376))

(assert (= start!48892 b!231374))

(declare-fun m!354511 () Bool)

(assert (=> b!231380 m!354511))

(declare-fun m!354513 () Bool)

(assert (=> b!231375 m!354513))

(declare-fun m!354515 () Bool)

(assert (=> b!231378 m!354515))

(declare-fun m!354517 () Bool)

(assert (=> start!48892 m!354517))

(declare-fun m!354519 () Bool)

(assert (=> start!48892 m!354519))

(declare-fun m!354521 () Bool)

(assert (=> b!231374 m!354521))

(declare-fun m!354523 () Bool)

(assert (=> b!231379 m!354523))

(declare-fun m!354525 () Bool)

(assert (=> b!231376 m!354525))

(push 1)

(assert (not b!231375))

(assert (not b!231379))

(assert (not b!231378))

(assert (not b!231380))

(assert (not b!231376))

(assert (not start!48892))

(assert (not b!231374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

