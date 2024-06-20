; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48908 () Bool)

(assert start!48908)

(declare-fun b!231528 () Bool)

(declare-fun res!193917 () Bool)

(declare-fun e!159232 () Bool)

(assert (=> b!231528 (=> (not res!193917) (not e!159232))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!231528 (= res!193917 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231529 () Bool)

(assert (=> b!231529 (= e!159232 false)))

(declare-fun lt!368712 () (_ BitVec 64))

(declare-datatypes ((array!11877 0))(
  ( (array!11878 (arr!6191 (Array (_ BitVec 32) (_ BitVec 8))) (size!5204 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9504 0))(
  ( (BitStream!9505 (buf!5745 array!11877) (currentByte!10752 (_ BitVec 32)) (currentBit!10747 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9504)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231529 (= lt!368712 (bitIndex!0 (size!5204 (buf!5745 b1!101)) (currentByte!10752 b1!101) (currentBit!10747 b1!101)))))

(declare-fun b!231530 () Bool)

(declare-fun res!193916 () Bool)

(assert (=> b!231530 (=> (not res!193916) (not e!159232))))

(declare-fun b2!99 () BitStream!9504)

(assert (=> b!231530 (= res!193916 (bvsle bits!86 (bitIndex!0 (size!5204 (buf!5745 b2!99)) (currentByte!10752 b2!99) (currentBit!10747 b2!99))))))

(declare-fun b!231531 () Bool)

(declare-fun res!193914 () Bool)

(assert (=> b!231531 (=> (not res!193914) (not e!159232))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231531 (= res!193914 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5204 (buf!5745 b1!101))) ((_ sign_extend 32) (currentByte!10752 b1!101)) ((_ sign_extend 32) (currentBit!10747 b1!101)) bytes!19))))

(declare-fun b!231532 () Bool)

(declare-fun e!159235 () Bool)

(declare-fun array_inv!4945 (array!11877) Bool)

(assert (=> b!231532 (= e!159235 (array_inv!4945 (buf!5745 b1!101)))))

(declare-fun b!231533 () Bool)

(declare-fun e!159233 () Bool)

(assert (=> b!231533 (= e!159233 (array_inv!4945 (buf!5745 b2!99)))))

(declare-fun res!193915 () Bool)

(assert (=> start!48908 (=> (not res!193915) (not e!159232))))

(assert (=> start!48908 (= res!193915 (and (= (size!5204 (buf!5745 b1!101)) (size!5204 (buf!5745 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48908 e!159232))

(declare-fun inv!12 (BitStream!9504) Bool)

(assert (=> start!48908 (and (inv!12 b1!101) e!159235)))

(assert (=> start!48908 (and (inv!12 b2!99) e!159233)))

(assert (=> start!48908 true))

(assert (= (and start!48908 res!193915) b!231530))

(assert (= (and b!231530 res!193916) b!231528))

(assert (= (and b!231528 res!193917) b!231531))

(assert (= (and b!231531 res!193914) b!231529))

(assert (= start!48908 b!231532))

(assert (= start!48908 b!231533))

(declare-fun m!354631 () Bool)

(assert (=> b!231530 m!354631))

(declare-fun m!354633 () Bool)

(assert (=> b!231531 m!354633))

(declare-fun m!354635 () Bool)

(assert (=> b!231529 m!354635))

(declare-fun m!354637 () Bool)

(assert (=> start!48908 m!354637))

(declare-fun m!354639 () Bool)

(assert (=> start!48908 m!354639))

(declare-fun m!354641 () Bool)

(assert (=> b!231533 m!354641))

(declare-fun m!354643 () Bool)

(assert (=> b!231532 m!354643))

(check-sat (not start!48908) (not b!231532) (not b!231530) (not b!231529) (not b!231533) (not b!231531))
