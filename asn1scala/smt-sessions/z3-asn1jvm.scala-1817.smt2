; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49016 () Bool)

(assert start!49016)

(declare-fun b!232626 () Bool)

(declare-fun res!194689 () Bool)

(declare-fun e!160172 () Bool)

(assert (=> b!232626 (=> (not res!194689) (not e!160172))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11985 0))(
  ( (array!11986 (arr!6245 (Array (_ BitVec 32) (_ BitVec 8))) (size!5258 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9612 0))(
  ( (BitStream!9613 (buf!5799 array!11985) (currentByte!10806 (_ BitVec 32)) (currentBit!10801 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9612)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232626 (= res!194689 (bvsle bits!86 (bitIndex!0 (size!5258 (buf!5799 b2!99)) (currentByte!10806 b2!99) (currentBit!10801 b2!99))))))

(declare-fun b!232627 () Bool)

(declare-fun res!194690 () Bool)

(assert (=> b!232627 (=> (not res!194690) (not e!160172))))

(declare-fun b1!101 () BitStream!9612)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232627 (= res!194690 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5258 (buf!5799 b1!101))) ((_ sign_extend 32) (currentByte!10806 b1!101)) ((_ sign_extend 32) (currentBit!10801 b1!101)) bytes!19))))

(declare-fun res!194688 () Bool)

(assert (=> start!49016 (=> (not res!194688) (not e!160172))))

(assert (=> start!49016 (= res!194688 (and (= (size!5258 (buf!5799 b1!101)) (size!5258 (buf!5799 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49016 e!160172))

(declare-fun e!160170 () Bool)

(declare-fun inv!12 (BitStream!9612) Bool)

(assert (=> start!49016 (and (inv!12 b1!101) e!160170)))

(declare-fun e!160171 () Bool)

(assert (=> start!49016 (and (inv!12 b2!99) e!160171)))

(assert (=> start!49016 true))

(declare-fun b!232628 () Bool)

(declare-fun array_inv!4999 (array!11985) Bool)

(assert (=> b!232628 (= e!160171 (array_inv!4999 (buf!5799 b2!99)))))

(declare-fun b!232629 () Bool)

(declare-fun res!194691 () Bool)

(assert (=> b!232629 (=> (not res!194691) (not e!160172))))

(assert (=> b!232629 (= res!194691 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232630 () Bool)

(assert (=> b!232630 (= e!160172 false)))

(declare-fun lt!368982 () (_ BitVec 64))

(assert (=> b!232630 (= lt!368982 (bitIndex!0 (size!5258 (buf!5799 b1!101)) (currentByte!10806 b1!101) (currentBit!10801 b1!101)))))

(declare-fun b!232631 () Bool)

(assert (=> b!232631 (= e!160170 (array_inv!4999 (buf!5799 b1!101)))))

(assert (= (and start!49016 res!194688) b!232626))

(assert (= (and b!232626 res!194689) b!232629))

(assert (= (and b!232629 res!194691) b!232627))

(assert (= (and b!232627 res!194690) b!232630))

(assert (= start!49016 b!232631))

(assert (= start!49016 b!232628))

(declare-fun m!355471 () Bool)

(assert (=> b!232627 m!355471))

(declare-fun m!355473 () Bool)

(assert (=> b!232626 m!355473))

(declare-fun m!355475 () Bool)

(assert (=> b!232631 m!355475))

(declare-fun m!355477 () Bool)

(assert (=> b!232628 m!355477))

(declare-fun m!355479 () Bool)

(assert (=> b!232630 m!355479))

(declare-fun m!355481 () Bool)

(assert (=> start!49016 m!355481))

(declare-fun m!355483 () Bool)

(assert (=> start!49016 m!355483))

(check-sat (not b!232628) (not start!49016) (not b!232626) (not b!232627) (not b!232630) (not b!232631))
