; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48186 () Bool)

(assert start!48186)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun e!156985 () Bool)

(declare-datatypes ((array!11598 0))(
  ( (array!11599 (arr!6078 (Array (_ BitVec 32) (_ BitVec 8))) (size!5091 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9278 0))(
  ( (BitStream!9279 (buf!5632 array!11598) (currentByte!10497 (_ BitVec 32)) (currentBit!10492 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9278)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b!228859 () Bool)

(assert (=> b!228859 (= e!156985 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (or (bvsgt ((_ sign_extend 32) (size!5091 (buf!5632 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10497 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10492 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun b!228860 () Bool)

(declare-fun e!156987 () Bool)

(declare-fun array_inv!4832 (array!11598) Bool)

(assert (=> b!228860 (= e!156987 (array_inv!4832 (buf!5632 b1!101)))))

(declare-fun res!191923 () Bool)

(assert (=> start!48186 (=> (not res!191923) (not e!156985))))

(declare-fun b2!99 () BitStream!9278)

(assert (=> start!48186 (= res!191923 (and (= (size!5091 (buf!5632 b1!101)) (size!5091 (buf!5632 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48186 e!156985))

(declare-fun inv!12 (BitStream!9278) Bool)

(assert (=> start!48186 (and (inv!12 b1!101) e!156987)))

(declare-fun e!156984 () Bool)

(assert (=> start!48186 (and (inv!12 b2!99) e!156984)))

(assert (=> start!48186 true))

(declare-fun b!228861 () Bool)

(assert (=> b!228861 (= e!156984 (array_inv!4832 (buf!5632 b2!99)))))

(declare-fun b!228858 () Bool)

(declare-fun res!191922 () Bool)

(assert (=> b!228858 (=> (not res!191922) (not e!156985))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228858 (= res!191922 (bvsle bits!86 (bitIndex!0 (size!5091 (buf!5632 b2!99)) (currentByte!10497 b2!99) (currentBit!10492 b2!99))))))

(assert (= (and start!48186 res!191923) b!228858))

(assert (= (and b!228858 res!191922) b!228859))

(assert (= start!48186 b!228860))

(assert (= start!48186 b!228861))

(declare-fun m!352659 () Bool)

(assert (=> b!228860 m!352659))

(declare-fun m!352661 () Bool)

(assert (=> start!48186 m!352661))

(declare-fun m!352663 () Bool)

(assert (=> start!48186 m!352663))

(declare-fun m!352665 () Bool)

(assert (=> b!228861 m!352665))

(declare-fun m!352667 () Bool)

(assert (=> b!228858 m!352667))

(push 1)

(assert (not b!228858))

(assert (not b!228860))

(assert (not start!48186))

(assert (not b!228861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

