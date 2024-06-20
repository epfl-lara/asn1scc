; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48182 () Bool)

(assert start!48182)

(declare-fun b!228837 () Bool)

(declare-fun e!156954 () Bool)

(declare-datatypes ((array!11594 0))(
  ( (array!11595 (arr!6076 (Array (_ BitVec 32) (_ BitVec 8))) (size!5089 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9274 0))(
  ( (BitStream!9275 (buf!5630 array!11594) (currentByte!10495 (_ BitVec 32)) (currentBit!10490 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9274)

(declare-fun array_inv!4830 (array!11594) Bool)

(assert (=> b!228837 (= e!156954 (array_inv!4830 (buf!5630 b2!99)))))

(declare-fun res!191911 () Bool)

(declare-fun e!156958 () Bool)

(assert (=> start!48182 (=> (not res!191911) (not e!156958))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b1!101 () BitStream!9274)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48182 (= res!191911 (and (= (size!5089 (buf!5630 b1!101)) (size!5089 (buf!5630 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48182 e!156958))

(declare-fun e!156957 () Bool)

(declare-fun inv!12 (BitStream!9274) Bool)

(assert (=> start!48182 (and (inv!12 b1!101) e!156957)))

(assert (=> start!48182 (and (inv!12 b2!99) e!156954)))

(assert (=> start!48182 true))

(declare-fun b!228834 () Bool)

(declare-fun res!191910 () Bool)

(assert (=> b!228834 (=> (not res!191910) (not e!156958))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228834 (= res!191910 (bvsle bits!86 (bitIndex!0 (size!5089 (buf!5630 b2!99)) (currentByte!10495 b2!99) (currentBit!10490 b2!99))))))

(declare-fun b!228836 () Bool)

(assert (=> b!228836 (= e!156957 (array_inv!4830 (buf!5630 b1!101)))))

(declare-fun b!228835 () Bool)

(assert (=> b!228835 (= e!156958 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (or (bvsgt ((_ sign_extend 32) (size!5089 (buf!5630 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10495 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10490 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(assert (= (and start!48182 res!191911) b!228834))

(assert (= (and b!228834 res!191910) b!228835))

(assert (= start!48182 b!228836))

(assert (= start!48182 b!228837))

(declare-fun m!352639 () Bool)

(assert (=> b!228837 m!352639))

(declare-fun m!352641 () Bool)

(assert (=> start!48182 m!352641))

(declare-fun m!352643 () Bool)

(assert (=> start!48182 m!352643))

(declare-fun m!352645 () Bool)

(assert (=> b!228834 m!352645))

(declare-fun m!352647 () Bool)

(assert (=> b!228836 m!352647))

(push 1)

(assert (not b!228837))

(assert (not b!228834))

(assert (not b!228836))

(assert (not start!48182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

