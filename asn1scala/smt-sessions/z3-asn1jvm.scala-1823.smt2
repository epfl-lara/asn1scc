; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49052 () Bool)

(assert start!49052)

(declare-fun b!232995 () Bool)

(declare-fun e!160485 () Bool)

(assert (=> b!232995 (= e!160485 false)))

(declare-fun lt!369081 () (_ BitVec 64))

(declare-datatypes ((array!12021 0))(
  ( (array!12022 (arr!6263 (Array (_ BitVec 32) (_ BitVec 8))) (size!5276 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9648 0))(
  ( (BitStream!9649 (buf!5817 array!12021) (currentByte!10824 (_ BitVec 32)) (currentBit!10819 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9648)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232995 (= lt!369081 (bitIndex!0 (size!5276 (buf!5817 b1!101)) (currentByte!10824 b1!101) (currentBit!10819 b1!101)))))

(declare-fun b!232996 () Bool)

(declare-fun res!194949 () Bool)

(assert (=> b!232996 (=> (not res!194949) (not e!160485))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232996 (= res!194949 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5276 (buf!5817 b1!101))) ((_ sign_extend 32) (currentByte!10824 b1!101)) ((_ sign_extend 32) (currentBit!10819 b1!101)) bytes!19))))

(declare-fun res!194951 () Bool)

(assert (=> start!49052 (=> (not res!194951) (not e!160485))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9648)

(assert (=> start!49052 (= res!194951 (and (= (size!5276 (buf!5817 b1!101)) (size!5276 (buf!5817 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49052 e!160485))

(declare-fun e!160484 () Bool)

(declare-fun inv!12 (BitStream!9648) Bool)

(assert (=> start!49052 (and (inv!12 b1!101) e!160484)))

(declare-fun e!160483 () Bool)

(assert (=> start!49052 (and (inv!12 b2!99) e!160483)))

(assert (=> start!49052 true))

(declare-fun b!232997 () Bool)

(declare-fun res!194952 () Bool)

(assert (=> b!232997 (=> (not res!194952) (not e!160485))))

(assert (=> b!232997 (= res!194952 (bvsle bits!86 (bitIndex!0 (size!5276 (buf!5817 b2!99)) (currentByte!10824 b2!99) (currentBit!10819 b2!99))))))

(declare-fun b!232998 () Bool)

(declare-fun array_inv!5017 (array!12021) Bool)

(assert (=> b!232998 (= e!160483 (array_inv!5017 (buf!5817 b2!99)))))

(declare-fun b!232999 () Bool)

(declare-fun res!194950 () Bool)

(assert (=> b!232999 (=> (not res!194950) (not e!160485))))

(assert (=> b!232999 (= res!194950 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!233000 () Bool)

(assert (=> b!233000 (= e!160484 (array_inv!5017 (buf!5817 b1!101)))))

(assert (= (and start!49052 res!194951) b!232997))

(assert (= (and b!232997 res!194952) b!232999))

(assert (= (and b!232999 res!194950) b!232996))

(assert (= (and b!232996 res!194949) b!232995))

(assert (= start!49052 b!233000))

(assert (= start!49052 b!232998))

(declare-fun m!355741 () Bool)

(assert (=> b!232998 m!355741))

(declare-fun m!355743 () Bool)

(assert (=> b!232997 m!355743))

(declare-fun m!355745 () Bool)

(assert (=> start!49052 m!355745))

(declare-fun m!355747 () Bool)

(assert (=> start!49052 m!355747))

(declare-fun m!355749 () Bool)

(assert (=> b!232995 m!355749))

(declare-fun m!355751 () Bool)

(assert (=> b!233000 m!355751))

(declare-fun m!355753 () Bool)

(assert (=> b!232996 m!355753))

(check-sat (not b!232995) (not b!232996) (not b!232998) (not b!232997) (not b!233000) (not start!49052))
