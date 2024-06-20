; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48184 () Bool)

(assert start!48184)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun e!156971 () Bool)

(declare-datatypes ((array!11596 0))(
  ( (array!11597 (arr!6077 (Array (_ BitVec 32) (_ BitVec 8))) (size!5090 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9276 0))(
  ( (BitStream!9277 (buf!5631 array!11596) (currentByte!10496 (_ BitVec 32)) (currentBit!10491 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9276)

(declare-fun b!228847 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!228847 (= e!156971 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (or (bvsgt ((_ sign_extend 32) (size!5090 (buf!5631 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10496 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10491 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun b!228849 () Bool)

(declare-fun e!156970 () Bool)

(declare-fun b2!99 () BitStream!9276)

(declare-fun array_inv!4831 (array!11596) Bool)

(assert (=> b!228849 (= e!156970 (array_inv!4831 (buf!5631 b2!99)))))

(declare-fun b!228846 () Bool)

(declare-fun res!191917 () Bool)

(assert (=> b!228846 (=> (not res!191917) (not e!156971))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228846 (= res!191917 (bvsle bits!86 (bitIndex!0 (size!5090 (buf!5631 b2!99)) (currentByte!10496 b2!99) (currentBit!10491 b2!99))))))

(declare-fun b!228848 () Bool)

(declare-fun e!156972 () Bool)

(assert (=> b!228848 (= e!156972 (array_inv!4831 (buf!5631 b1!101)))))

(declare-fun res!191916 () Bool)

(assert (=> start!48184 (=> (not res!191916) (not e!156971))))

(assert (=> start!48184 (= res!191916 (and (= (size!5090 (buf!5631 b1!101)) (size!5090 (buf!5631 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48184 e!156971))

(declare-fun inv!12 (BitStream!9276) Bool)

(assert (=> start!48184 (and (inv!12 b1!101) e!156972)))

(assert (=> start!48184 (and (inv!12 b2!99) e!156970)))

(assert (=> start!48184 true))

(assert (= (and start!48184 res!191916) b!228846))

(assert (= (and b!228846 res!191917) b!228847))

(assert (= start!48184 b!228848))

(assert (= start!48184 b!228849))

(declare-fun m!352649 () Bool)

(assert (=> b!228849 m!352649))

(declare-fun m!352651 () Bool)

(assert (=> b!228846 m!352651))

(declare-fun m!352653 () Bool)

(assert (=> b!228848 m!352653))

(declare-fun m!352655 () Bool)

(assert (=> start!48184 m!352655))

(declare-fun m!352657 () Bool)

(assert (=> start!48184 m!352657))

(check-sat (not b!228849) (not b!228848) (not start!48184) (not b!228846))
(check-sat)
