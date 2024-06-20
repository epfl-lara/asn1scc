; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49028 () Bool)

(assert start!49028)

(declare-fun b!232743 () Bool)

(declare-fun res!194770 () Bool)

(declare-fun e!160267 () Bool)

(assert (=> b!232743 (=> (not res!194770) (not e!160267))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!232743 (= res!194770 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232744 () Bool)

(declare-fun res!194771 () Bool)

(assert (=> b!232744 (=> (not res!194771) (not e!160267))))

(declare-datatypes ((array!11997 0))(
  ( (array!11998 (arr!6251 (Array (_ BitVec 32) (_ BitVec 8))) (size!5264 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9624 0))(
  ( (BitStream!9625 (buf!5805 array!11997) (currentByte!10812 (_ BitVec 32)) (currentBit!10807 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9624)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232744 (= res!194771 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5264 (buf!5805 b1!101))) ((_ sign_extend 32) (currentByte!10812 b1!101)) ((_ sign_extend 32) (currentBit!10807 b1!101)) bytes!19))))

(declare-fun b!232745 () Bool)

(assert (=> b!232745 (= e!160267 false)))

(declare-fun lt!369009 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232745 (= lt!369009 (bitIndex!0 (size!5264 (buf!5805 b1!101)) (currentByte!10812 b1!101) (currentBit!10807 b1!101)))))

(declare-fun b!232746 () Bool)

(declare-fun e!160269 () Bool)

(declare-fun array_inv!5005 (array!11997) Bool)

(assert (=> b!232746 (= e!160269 (array_inv!5005 (buf!5805 b1!101)))))

(declare-fun b!232747 () Bool)

(declare-fun e!160270 () Bool)

(declare-fun b2!99 () BitStream!9624)

(assert (=> b!232747 (= e!160270 (array_inv!5005 (buf!5805 b2!99)))))

(declare-fun b!232748 () Bool)

(declare-fun res!194769 () Bool)

(assert (=> b!232748 (=> (not res!194769) (not e!160267))))

(assert (=> b!232748 (= res!194769 (bvsle bits!86 (bitIndex!0 (size!5264 (buf!5805 b2!99)) (currentByte!10812 b2!99) (currentBit!10807 b2!99))))))

(declare-fun res!194772 () Bool)

(assert (=> start!49028 (=> (not res!194772) (not e!160267))))

(assert (=> start!49028 (= res!194772 (and (= (size!5264 (buf!5805 b1!101)) (size!5264 (buf!5805 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49028 e!160267))

(declare-fun inv!12 (BitStream!9624) Bool)

(assert (=> start!49028 (and (inv!12 b1!101) e!160269)))

(assert (=> start!49028 (and (inv!12 b2!99) e!160270)))

(assert (=> start!49028 true))

(assert (= (and start!49028 res!194772) b!232748))

(assert (= (and b!232748 res!194769) b!232743))

(assert (= (and b!232743 res!194770) b!232744))

(assert (= (and b!232744 res!194771) b!232745))

(assert (= start!49028 b!232746))

(assert (= start!49028 b!232747))

(declare-fun m!355561 () Bool)

(assert (=> b!232744 m!355561))

(declare-fun m!355563 () Bool)

(assert (=> b!232748 m!355563))

(declare-fun m!355565 () Bool)

(assert (=> start!49028 m!355565))

(declare-fun m!355567 () Bool)

(assert (=> start!49028 m!355567))

(declare-fun m!355569 () Bool)

(assert (=> b!232747 m!355569))

(declare-fun m!355571 () Bool)

(assert (=> b!232746 m!355571))

(declare-fun m!355573 () Bool)

(assert (=> b!232745 m!355573))

(check-sat (not start!49028) (not b!232745) (not b!232746) (not b!232748) (not b!232744) (not b!232747))
