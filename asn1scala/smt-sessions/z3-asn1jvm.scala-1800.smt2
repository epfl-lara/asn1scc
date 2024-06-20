; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48914 () Bool)

(assert start!48914)

(declare-fun b!231587 () Bool)

(declare-fun res!193957 () Bool)

(declare-fun e!159283 () Bool)

(assert (=> b!231587 (=> (not res!193957) (not e!159283))))

(declare-datatypes ((array!11883 0))(
  ( (array!11884 (arr!6194 (Array (_ BitVec 32) (_ BitVec 8))) (size!5207 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9510 0))(
  ( (BitStream!9511 (buf!5748 array!11883) (currentByte!10755 (_ BitVec 32)) (currentBit!10750 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9510)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231587 (= res!193957 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5207 (buf!5748 b1!101))) ((_ sign_extend 32) (currentByte!10755 b1!101)) ((_ sign_extend 32) (currentBit!10750 b1!101)) bytes!19))))

(declare-fun b!231588 () Bool)

(declare-fun e!159287 () Bool)

(assert (=> b!231588 (= e!159287 e!159283)))

(declare-fun res!193958 () Bool)

(assert (=> b!231588 (=> (not res!193958) (not e!159283))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368721 () (_ BitVec 64))

(assert (=> b!231588 (= res!193958 (and (bvsle bits!86 lt!368721) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9510)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231588 (= lt!368721 (bitIndex!0 (size!5207 (buf!5748 b2!99)) (currentByte!10755 b2!99) (currentBit!10750 b2!99)))))

(declare-fun b!231589 () Bool)

(declare-fun res!193955 () Bool)

(assert (=> b!231589 (=> (not res!193955) (not e!159283))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231589 (= res!193955 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5207 (buf!5748 b1!101))) ((_ sign_extend 32) (currentByte!10755 b1!101)) ((_ sign_extend 32) (currentBit!10750 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231590 () Bool)

(declare-fun res!193956 () Bool)

(assert (=> b!231590 (=> (not res!193956) (not e!159283))))

(assert (=> b!231590 (= res!193956 (= lt!368721 (bvadd (bitIndex!0 (size!5207 (buf!5748 b1!101)) (currentByte!10755 b1!101) (currentBit!10750 b1!101)) bits!86)))))

(declare-fun res!193959 () Bool)

(assert (=> start!48914 (=> (not res!193959) (not e!159287))))

(assert (=> start!48914 (= res!193959 (and (= (size!5207 (buf!5748 b1!101)) (size!5207 (buf!5748 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48914 e!159287))

(declare-fun e!159285 () Bool)

(declare-fun inv!12 (BitStream!9510) Bool)

(assert (=> start!48914 (and (inv!12 b1!101) e!159285)))

(declare-fun e!159282 () Bool)

(assert (=> start!48914 (and (inv!12 b2!99) e!159282)))

(assert (=> start!48914 true))

(declare-fun b!231591 () Bool)

(declare-fun array_inv!4948 (array!11883) Bool)

(assert (=> b!231591 (= e!159285 (array_inv!4948 (buf!5748 b1!101)))))

(declare-fun b!231592 () Bool)

(assert (=> b!231592 (= e!159282 (array_inv!4948 (buf!5748 b2!99)))))

(declare-fun b!231593 () Bool)

(assert (=> b!231593 (= e!159283 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5207 (buf!5748 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10755 b1!101))) ((_ sign_extend 32) (currentBit!10750 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= ((_ sign_extend 32) (currentByte!10755 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10755 b2!99))) ((_ sign_extend 32) (currentByte!10755 b2!99)))))))))

(assert (= (and start!48914 res!193959) b!231588))

(assert (= (and b!231588 res!193958) b!231587))

(assert (= (and b!231587 res!193957) b!231590))

(assert (= (and b!231590 res!193956) b!231589))

(assert (= (and b!231589 res!193955) b!231593))

(assert (= start!48914 b!231591))

(assert (= start!48914 b!231592))

(declare-fun m!354675 () Bool)

(assert (=> start!48914 m!354675))

(declare-fun m!354677 () Bool)

(assert (=> start!48914 m!354677))

(declare-fun m!354679 () Bool)

(assert (=> b!231588 m!354679))

(declare-fun m!354681 () Bool)

(assert (=> b!231592 m!354681))

(declare-fun m!354683 () Bool)

(assert (=> b!231590 m!354683))

(declare-fun m!354685 () Bool)

(assert (=> b!231591 m!354685))

(declare-fun m!354687 () Bool)

(assert (=> b!231587 m!354687))

(declare-fun m!354689 () Bool)

(assert (=> b!231589 m!354689))

(check-sat (not b!231587) (not b!231592) (not b!231589) (not b!231590) (not b!231591) (not start!48914) (not b!231588))
(check-sat)
