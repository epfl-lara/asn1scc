; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49008 () Bool)

(assert start!49008)

(declare-fun b!232554 () Bool)

(declare-fun e!160109 () Bool)

(declare-datatypes ((array!11977 0))(
  ( (array!11978 (arr!6241 (Array (_ BitVec 32) (_ BitVec 8))) (size!5254 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9604 0))(
  ( (BitStream!9605 (buf!5795 array!11977) (currentByte!10802 (_ BitVec 32)) (currentBit!10797 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9604)

(declare-fun array_inv!4995 (array!11977) Bool)

(assert (=> b!232554 (= e!160109 (array_inv!4995 (buf!5795 b1!101)))))

(declare-fun res!194641 () Bool)

(declare-fun e!160108 () Bool)

(assert (=> start!49008 (=> (not res!194641) (not e!160108))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9604)

(assert (=> start!49008 (= res!194641 (and (= (size!5254 (buf!5795 b1!101)) (size!5254 (buf!5795 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49008 e!160108))

(declare-fun inv!12 (BitStream!9604) Bool)

(assert (=> start!49008 (and (inv!12 b1!101) e!160109)))

(declare-fun e!160112 () Bool)

(assert (=> start!49008 (and (inv!12 b2!99) e!160112)))

(assert (=> start!49008 true))

(declare-fun b!232555 () Bool)

(declare-fun res!194640 () Bool)

(assert (=> b!232555 (=> (not res!194640) (not e!160108))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232555 (= res!194640 (bvsle bits!86 (bitIndex!0 (size!5254 (buf!5795 b2!99)) (currentByte!10802 b2!99) (currentBit!10797 b2!99))))))

(declare-fun b!232556 () Bool)

(assert (=> b!232556 (= e!160112 (array_inv!4995 (buf!5795 b2!99)))))

(declare-fun b!232557 () Bool)

(declare-fun res!194642 () Bool)

(assert (=> b!232557 (=> (not res!194642) (not e!160108))))

(assert (=> b!232557 (= res!194642 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232558 () Bool)

(assert (=> b!232558 (= e!160108 false)))

(declare-fun lt!368970 () (_ BitVec 64))

(assert (=> b!232558 (= lt!368970 (bitIndex!0 (size!5254 (buf!5795 b1!101)) (currentByte!10802 b1!101) (currentBit!10797 b1!101)))))

(declare-fun b!232559 () Bool)

(declare-fun res!194643 () Bool)

(assert (=> b!232559 (=> (not res!194643) (not e!160108))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232559 (= res!194643 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5254 (buf!5795 b1!101))) ((_ sign_extend 32) (currentByte!10802 b1!101)) ((_ sign_extend 32) (currentBit!10797 b1!101)) bytes!19))))

(assert (= (and start!49008 res!194641) b!232555))

(assert (= (and b!232555 res!194640) b!232557))

(assert (= (and b!232557 res!194642) b!232559))

(assert (= (and b!232559 res!194643) b!232558))

(assert (= start!49008 b!232554))

(assert (= start!49008 b!232556))

(declare-fun m!355415 () Bool)

(assert (=> start!49008 m!355415))

(declare-fun m!355417 () Bool)

(assert (=> start!49008 m!355417))

(declare-fun m!355419 () Bool)

(assert (=> b!232554 m!355419))

(declare-fun m!355421 () Bool)

(assert (=> b!232559 m!355421))

(declare-fun m!355423 () Bool)

(assert (=> b!232556 m!355423))

(declare-fun m!355425 () Bool)

(assert (=> b!232558 m!355425))

(declare-fun m!355427 () Bool)

(assert (=> b!232555 m!355427))

(push 1)

(assert (not b!232554))

(assert (not b!232558))

(assert (not b!232555))

(assert (not b!232559))

(assert (not b!232556))

(assert (not start!49008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

