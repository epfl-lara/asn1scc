; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49032 () Bool)

(assert start!49032)

(declare-fun b!232779 () Bool)

(declare-fun e!160301 () Bool)

(assert (=> b!232779 (= e!160301 false)))

(declare-fun lt!369015 () (_ BitVec 64))

(declare-datatypes ((array!12001 0))(
  ( (array!12002 (arr!6253 (Array (_ BitVec 32) (_ BitVec 8))) (size!5266 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9628 0))(
  ( (BitStream!9629 (buf!5807 array!12001) (currentByte!10814 (_ BitVec 32)) (currentBit!10809 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9628)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232779 (= lt!369015 (bitIndex!0 (size!5266 (buf!5807 b1!101)) (currentByte!10814 b1!101) (currentBit!10809 b1!101)))))

(declare-fun res!194793 () Bool)

(assert (=> start!49032 (=> (not res!194793) (not e!160301))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9628)

(assert (=> start!49032 (= res!194793 (and (= (size!5266 (buf!5807 b1!101)) (size!5266 (buf!5807 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49032 e!160301))

(declare-fun e!160299 () Bool)

(declare-fun inv!12 (BitStream!9628) Bool)

(assert (=> start!49032 (and (inv!12 b1!101) e!160299)))

(declare-fun e!160300 () Bool)

(assert (=> start!49032 (and (inv!12 b2!99) e!160300)))

(assert (=> start!49032 true))

(declare-fun b!232780 () Bool)

(declare-fun array_inv!5007 (array!12001) Bool)

(assert (=> b!232780 (= e!160300 (array_inv!5007 (buf!5807 b2!99)))))

(declare-fun b!232781 () Bool)

(declare-fun res!194794 () Bool)

(assert (=> b!232781 (=> (not res!194794) (not e!160301))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232781 (= res!194794 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5266 (buf!5807 b1!101))) ((_ sign_extend 32) (currentByte!10814 b1!101)) ((_ sign_extend 32) (currentBit!10809 b1!101)) bytes!19))))

(declare-fun b!232782 () Bool)

(declare-fun res!194796 () Bool)

(assert (=> b!232782 (=> (not res!194796) (not e!160301))))

(assert (=> b!232782 (= res!194796 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232783 () Bool)

(assert (=> b!232783 (= e!160299 (array_inv!5007 (buf!5807 b1!101)))))

(declare-fun b!232784 () Bool)

(declare-fun res!194795 () Bool)

(assert (=> b!232784 (=> (not res!194795) (not e!160301))))

(assert (=> b!232784 (= res!194795 (bvsle bits!86 (bitIndex!0 (size!5266 (buf!5807 b2!99)) (currentByte!10814 b2!99) (currentBit!10809 b2!99))))))

(assert (= (and start!49032 res!194793) b!232784))

(assert (= (and b!232784 res!194795) b!232782))

(assert (= (and b!232782 res!194796) b!232781))

(assert (= (and b!232781 res!194794) b!232779))

(assert (= start!49032 b!232783))

(assert (= start!49032 b!232780))

(declare-fun m!355589 () Bool)

(assert (=> b!232779 m!355589))

(declare-fun m!355591 () Bool)

(assert (=> b!232783 m!355591))

(declare-fun m!355593 () Bool)

(assert (=> b!232784 m!355593))

(declare-fun m!355595 () Bool)

(assert (=> start!49032 m!355595))

(declare-fun m!355597 () Bool)

(assert (=> start!49032 m!355597))

(declare-fun m!355599 () Bool)

(assert (=> b!232780 m!355599))

(declare-fun m!355601 () Bool)

(assert (=> b!232781 m!355601))

(push 1)

(assert (not b!232783))

(assert (not start!49032))

(assert (not b!232780))

(assert (not b!232781))

(assert (not b!232779))

(assert (not b!232784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

