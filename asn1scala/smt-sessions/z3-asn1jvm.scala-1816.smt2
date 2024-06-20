; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49010 () Bool)

(assert start!49010)

(declare-fun res!194654 () Bool)

(declare-fun e!160127 () Bool)

(assert (=> start!49010 (=> (not res!194654) (not e!160127))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11979 0))(
  ( (array!11980 (arr!6242 (Array (_ BitVec 32) (_ BitVec 8))) (size!5255 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9606 0))(
  ( (BitStream!9607 (buf!5796 array!11979) (currentByte!10803 (_ BitVec 32)) (currentBit!10798 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9606)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9606)

(assert (=> start!49010 (= res!194654 (and (= (size!5255 (buf!5796 b1!101)) (size!5255 (buf!5796 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49010 e!160127))

(declare-fun e!160125 () Bool)

(declare-fun inv!12 (BitStream!9606) Bool)

(assert (=> start!49010 (and (inv!12 b1!101) e!160125)))

(declare-fun e!160124 () Bool)

(assert (=> start!49010 (and (inv!12 b2!99) e!160124)))

(assert (=> start!49010 true))

(declare-fun b!232572 () Bool)

(declare-fun array_inv!4996 (array!11979) Bool)

(assert (=> b!232572 (= e!160124 (array_inv!4996 (buf!5796 b2!99)))))

(declare-fun b!232573 () Bool)

(assert (=> b!232573 (= e!160127 false)))

(declare-fun lt!368973 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232573 (= lt!368973 (bitIndex!0 (size!5255 (buf!5796 b1!101)) (currentByte!10803 b1!101) (currentBit!10798 b1!101)))))

(declare-fun b!232574 () Bool)

(declare-fun res!194652 () Bool)

(assert (=> b!232574 (=> (not res!194652) (not e!160127))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232574 (= res!194652 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5255 (buf!5796 b1!101))) ((_ sign_extend 32) (currentByte!10803 b1!101)) ((_ sign_extend 32) (currentBit!10798 b1!101)) bytes!19))))

(declare-fun b!232575 () Bool)

(declare-fun res!194655 () Bool)

(assert (=> b!232575 (=> (not res!194655) (not e!160127))))

(assert (=> b!232575 (= res!194655 (bvsle bits!86 (bitIndex!0 (size!5255 (buf!5796 b2!99)) (currentByte!10803 b2!99) (currentBit!10798 b2!99))))))

(declare-fun b!232576 () Bool)

(assert (=> b!232576 (= e!160125 (array_inv!4996 (buf!5796 b1!101)))))

(declare-fun b!232577 () Bool)

(declare-fun res!194653 () Bool)

(assert (=> b!232577 (=> (not res!194653) (not e!160127))))

(assert (=> b!232577 (= res!194653 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!49010 res!194654) b!232575))

(assert (= (and b!232575 res!194655) b!232577))

(assert (= (and b!232577 res!194653) b!232574))

(assert (= (and b!232574 res!194652) b!232573))

(assert (= start!49010 b!232576))

(assert (= start!49010 b!232572))

(declare-fun m!355429 () Bool)

(assert (=> b!232573 m!355429))

(declare-fun m!355431 () Bool)

(assert (=> b!232576 m!355431))

(declare-fun m!355433 () Bool)

(assert (=> start!49010 m!355433))

(declare-fun m!355435 () Bool)

(assert (=> start!49010 m!355435))

(declare-fun m!355437 () Bool)

(assert (=> b!232572 m!355437))

(declare-fun m!355439 () Bool)

(assert (=> b!232574 m!355439))

(declare-fun m!355441 () Bool)

(assert (=> b!232575 m!355441))

(check-sat (not b!232575) (not b!232574) (not b!232576) (not start!49010) (not b!232573) (not b!232572))
