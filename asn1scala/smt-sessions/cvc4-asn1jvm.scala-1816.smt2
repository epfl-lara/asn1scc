; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49012 () Bool)

(assert start!49012)

(declare-fun b!232590 () Bool)

(declare-fun res!194664 () Bool)

(declare-fun e!160138 () Bool)

(assert (=> b!232590 (=> (not res!194664) (not e!160138))))

(declare-datatypes ((array!11981 0))(
  ( (array!11982 (arr!6243 (Array (_ BitVec 32) (_ BitVec 8))) (size!5256 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9608 0))(
  ( (BitStream!9609 (buf!5797 array!11981) (currentByte!10804 (_ BitVec 32)) (currentBit!10799 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9608)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232590 (= res!194664 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5256 (buf!5797 b1!101))) ((_ sign_extend 32) (currentByte!10804 b1!101)) ((_ sign_extend 32) (currentBit!10799 b1!101)) bytes!19))))

(declare-fun res!194667 () Bool)

(assert (=> start!49012 (=> (not res!194667) (not e!160138))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9608)

(assert (=> start!49012 (= res!194667 (and (= (size!5256 (buf!5797 b1!101)) (size!5256 (buf!5797 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49012 e!160138))

(declare-fun e!160140 () Bool)

(declare-fun inv!12 (BitStream!9608) Bool)

(assert (=> start!49012 (and (inv!12 b1!101) e!160140)))

(declare-fun e!160141 () Bool)

(assert (=> start!49012 (and (inv!12 b2!99) e!160141)))

(assert (=> start!49012 true))

(declare-fun b!232591 () Bool)

(declare-fun array_inv!4997 (array!11981) Bool)

(assert (=> b!232591 (= e!160140 (array_inv!4997 (buf!5797 b1!101)))))

(declare-fun b!232592 () Bool)

(declare-fun res!194666 () Bool)

(assert (=> b!232592 (=> (not res!194666) (not e!160138))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232592 (= res!194666 (bvsle bits!86 (bitIndex!0 (size!5256 (buf!5797 b2!99)) (currentByte!10804 b2!99) (currentBit!10799 b2!99))))))

(declare-fun b!232593 () Bool)

(assert (=> b!232593 (= e!160138 false)))

(declare-fun lt!368976 () (_ BitVec 64))

(assert (=> b!232593 (= lt!368976 (bitIndex!0 (size!5256 (buf!5797 b1!101)) (currentByte!10804 b1!101) (currentBit!10799 b1!101)))))

(declare-fun b!232594 () Bool)

(declare-fun res!194665 () Bool)

(assert (=> b!232594 (=> (not res!194665) (not e!160138))))

(assert (=> b!232594 (= res!194665 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232595 () Bool)

(assert (=> b!232595 (= e!160141 (array_inv!4997 (buf!5797 b2!99)))))

(assert (= (and start!49012 res!194667) b!232592))

(assert (= (and b!232592 res!194666) b!232594))

(assert (= (and b!232594 res!194665) b!232590))

(assert (= (and b!232590 res!194664) b!232593))

(assert (= start!49012 b!232591))

(assert (= start!49012 b!232595))

(declare-fun m!355443 () Bool)

(assert (=> start!49012 m!355443))

(declare-fun m!355445 () Bool)

(assert (=> start!49012 m!355445))

(declare-fun m!355447 () Bool)

(assert (=> b!232593 m!355447))

(declare-fun m!355449 () Bool)

(assert (=> b!232591 m!355449))

(declare-fun m!355451 () Bool)

(assert (=> b!232595 m!355451))

(declare-fun m!355453 () Bool)

(assert (=> b!232590 m!355453))

(declare-fun m!355455 () Bool)

(assert (=> b!232592 m!355455))

(push 1)

(assert (not start!49012))

