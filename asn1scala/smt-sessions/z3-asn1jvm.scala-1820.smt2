; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49034 () Bool)

(assert start!49034)

(declare-fun b!232797 () Bool)

(declare-fun e!160315 () Bool)

(assert (=> b!232797 (= e!160315 false)))

(declare-fun lt!369018 () (_ BitVec 64))

(declare-datatypes ((array!12003 0))(
  ( (array!12004 (arr!6254 (Array (_ BitVec 32) (_ BitVec 8))) (size!5267 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9630 0))(
  ( (BitStream!9631 (buf!5808 array!12003) (currentByte!10815 (_ BitVec 32)) (currentBit!10810 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9630)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232797 (= lt!369018 (bitIndex!0 (size!5267 (buf!5808 b1!101)) (currentByte!10815 b1!101) (currentBit!10810 b1!101)))))

(declare-fun b!232798 () Bool)

(declare-fun e!160312 () Bool)

(declare-fun array_inv!5008 (array!12003) Bool)

(assert (=> b!232798 (= e!160312 (array_inv!5008 (buf!5808 b1!101)))))

(declare-fun b!232799 () Bool)

(declare-fun e!160314 () Bool)

(declare-fun b2!99 () BitStream!9630)

(assert (=> b!232799 (= e!160314 (array_inv!5008 (buf!5808 b2!99)))))

(declare-fun b!232800 () Bool)

(declare-fun res!194806 () Bool)

(assert (=> b!232800 (=> (not res!194806) (not e!160315))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!232800 (= res!194806 (bvsle bits!86 (bitIndex!0 (size!5267 (buf!5808 b2!99)) (currentByte!10815 b2!99) (currentBit!10810 b2!99))))))

(declare-fun res!194808 () Bool)

(assert (=> start!49034 (=> (not res!194808) (not e!160315))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!49034 (= res!194808 (and (= (size!5267 (buf!5808 b1!101)) (size!5267 (buf!5808 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49034 e!160315))

(declare-fun inv!12 (BitStream!9630) Bool)

(assert (=> start!49034 (and (inv!12 b1!101) e!160312)))

(assert (=> start!49034 (and (inv!12 b2!99) e!160314)))

(assert (=> start!49034 true))

(declare-fun b!232801 () Bool)

(declare-fun res!194805 () Bool)

(assert (=> b!232801 (=> (not res!194805) (not e!160315))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232801 (= res!194805 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5267 (buf!5808 b1!101))) ((_ sign_extend 32) (currentByte!10815 b1!101)) ((_ sign_extend 32) (currentBit!10810 b1!101)) bytes!19))))

(declare-fun b!232802 () Bool)

(declare-fun res!194807 () Bool)

(assert (=> b!232802 (=> (not res!194807) (not e!160315))))

(assert (=> b!232802 (= res!194807 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!49034 res!194808) b!232800))

(assert (= (and b!232800 res!194806) b!232802))

(assert (= (and b!232802 res!194807) b!232801))

(assert (= (and b!232801 res!194805) b!232797))

(assert (= start!49034 b!232798))

(assert (= start!49034 b!232799))

(declare-fun m!355603 () Bool)

(assert (=> b!232800 m!355603))

(declare-fun m!355605 () Bool)

(assert (=> b!232801 m!355605))

(declare-fun m!355607 () Bool)

(assert (=> start!49034 m!355607))

(declare-fun m!355609 () Bool)

(assert (=> start!49034 m!355609))

(declare-fun m!355611 () Bool)

(assert (=> b!232799 m!355611))

(declare-fun m!355613 () Bool)

(assert (=> b!232797 m!355613))

(declare-fun m!355615 () Bool)

(assert (=> b!232798 m!355615))

(check-sat (not start!49034) (not b!232800) (not b!232801) (not b!232798) (not b!232799) (not b!232797))
