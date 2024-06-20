; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48888 () Bool)

(assert start!48888)

(declare-fun lt!368643 () (_ BitVec 64))

(declare-fun e!159066 () Bool)

(declare-fun lt!368641 () (_ BitVec 64))

(declare-datatypes ((array!11857 0))(
  ( (array!11858 (arr!6181 (Array (_ BitVec 32) (_ BitVec 8))) (size!5194 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9484 0))(
  ( (BitStream!9485 (buf!5735 array!11857) (currentByte!10742 (_ BitVec 32)) (currentBit!10737 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9484)

(declare-fun b!231332 () Bool)

(assert (=> b!231332 (= e!159066 (and (= lt!368643 (bvand ((_ sign_extend 32) (currentBit!10737 b1!101)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!368643 (bvand (bvadd lt!368641 ((_ sign_extend 32) (currentBit!10737 b1!101))) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!231332 (= lt!368643 (bvand lt!368641 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231332 (= lt!368641 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10742 b1!101))))))

(declare-fun b!231333 () Bool)

(declare-fun e!159071 () Bool)

(declare-fun array_inv!4935 (array!11857) Bool)

(assert (=> b!231333 (= e!159071 (array_inv!4935 (buf!5735 b1!101)))))

(declare-fun b!231334 () Bool)

(declare-fun res!193782 () Bool)

(assert (=> b!231334 (=> (not res!193782) (not e!159066))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368642 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231334 (= res!193782 (= lt!368642 (bvadd (bitIndex!0 (size!5194 (buf!5735 b1!101)) (currentByte!10742 b1!101) (currentBit!10737 b1!101)) bits!86)))))

(declare-fun b!231335 () Bool)

(declare-fun res!193780 () Bool)

(assert (=> b!231335 (=> (not res!193780) (not e!159066))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231335 (= res!193780 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5194 (buf!5735 b1!101))) ((_ sign_extend 32) (currentByte!10742 b1!101)) ((_ sign_extend 32) (currentBit!10737 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231336 () Bool)

(declare-fun e!159067 () Bool)

(assert (=> b!231336 (= e!159067 e!159066)))

(declare-fun res!193779 () Bool)

(assert (=> b!231336 (=> (not res!193779) (not e!159066))))

(assert (=> b!231336 (= res!193779 (and (bvsle bits!86 lt!368642) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9484)

(assert (=> b!231336 (= lt!368642 (bitIndex!0 (size!5194 (buf!5735 b2!99)) (currentByte!10742 b2!99) (currentBit!10737 b2!99)))))

(declare-fun res!193778 () Bool)

(assert (=> start!48888 (=> (not res!193778) (not e!159067))))

(assert (=> start!48888 (= res!193778 (and (= (size!5194 (buf!5735 b1!101)) (size!5194 (buf!5735 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48888 e!159067))

(declare-fun inv!12 (BitStream!9484) Bool)

(assert (=> start!48888 (and (inv!12 b1!101) e!159071)))

(declare-fun e!159068 () Bool)

(assert (=> start!48888 (and (inv!12 b2!99) e!159068)))

(assert (=> start!48888 true))

(declare-fun b!231337 () Bool)

(assert (=> b!231337 (= e!159068 (array_inv!4935 (buf!5735 b2!99)))))

(declare-fun b!231338 () Bool)

(declare-fun res!193781 () Bool)

(assert (=> b!231338 (=> (not res!193781) (not e!159066))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231338 (= res!193781 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5194 (buf!5735 b1!101))) ((_ sign_extend 32) (currentByte!10742 b1!101)) ((_ sign_extend 32) (currentBit!10737 b1!101)) bytes!19))))

(assert (= (and start!48888 res!193778) b!231336))

(assert (= (and b!231336 res!193779) b!231338))

(assert (= (and b!231338 res!193781) b!231334))

(assert (= (and b!231334 res!193782) b!231335))

(assert (= (and b!231335 res!193780) b!231332))

(assert (= start!48888 b!231333))

(assert (= start!48888 b!231337))

(declare-fun m!354479 () Bool)

(assert (=> b!231334 m!354479))

(declare-fun m!354481 () Bool)

(assert (=> b!231337 m!354481))

(declare-fun m!354483 () Bool)

(assert (=> b!231333 m!354483))

(declare-fun m!354485 () Bool)

(assert (=> b!231336 m!354485))

(declare-fun m!354487 () Bool)

(assert (=> b!231338 m!354487))

(declare-fun m!354489 () Bool)

(assert (=> b!231335 m!354489))

(declare-fun m!354491 () Bool)

(assert (=> start!48888 m!354491))

(declare-fun m!354493 () Bool)

(assert (=> start!48888 m!354493))

(push 1)

(assert (not b!231338))

(assert (not b!231333))

(assert (not b!231336))

(assert (not b!231334))

(assert (not start!48888))

(assert (not b!231337))

(assert (not b!231335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

