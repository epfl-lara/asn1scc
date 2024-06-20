; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49030 () Bool)

(assert start!49030)

(declare-fun b!232761 () Bool)

(declare-fun res!194782 () Bool)

(declare-fun e!160286 () Bool)

(assert (=> b!232761 (=> (not res!194782) (not e!160286))))

(declare-datatypes ((array!11999 0))(
  ( (array!12000 (arr!6252 (Array (_ BitVec 32) (_ BitVec 8))) (size!5265 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9626 0))(
  ( (BitStream!9627 (buf!5806 array!11999) (currentByte!10813 (_ BitVec 32)) (currentBit!10808 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9626)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232761 (= res!194782 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5265 (buf!5806 b1!101))) ((_ sign_extend 32) (currentByte!10813 b1!101)) ((_ sign_extend 32) (currentBit!10808 b1!101)) bytes!19))))

(declare-fun b!232762 () Bool)

(assert (=> b!232762 (= e!160286 false)))

(declare-fun lt!369012 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232762 (= lt!369012 (bitIndex!0 (size!5265 (buf!5806 b1!101)) (currentByte!10813 b1!101) (currentBit!10808 b1!101)))))

(declare-fun b!232763 () Bool)

(declare-fun e!160284 () Bool)

(declare-fun b2!99 () BitStream!9626)

(declare-fun array_inv!5006 (array!11999) Bool)

(assert (=> b!232763 (= e!160284 (array_inv!5006 (buf!5806 b2!99)))))

(declare-fun b!232764 () Bool)

(declare-fun res!194781 () Bool)

(assert (=> b!232764 (=> (not res!194781) (not e!160286))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!232764 (= res!194781 (bvsle bits!86 (bitIndex!0 (size!5265 (buf!5806 b2!99)) (currentByte!10813 b2!99) (currentBit!10808 b2!99))))))

(declare-fun res!194784 () Bool)

(assert (=> start!49030 (=> (not res!194784) (not e!160286))))

(assert (=> start!49030 (= res!194784 (and (= (size!5265 (buf!5806 b1!101)) (size!5265 (buf!5806 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49030 e!160286))

(declare-fun e!160282 () Bool)

(declare-fun inv!12 (BitStream!9626) Bool)

(assert (=> start!49030 (and (inv!12 b1!101) e!160282)))

(assert (=> start!49030 (and (inv!12 b2!99) e!160284)))

(assert (=> start!49030 true))

(declare-fun b!232765 () Bool)

(assert (=> b!232765 (= e!160282 (array_inv!5006 (buf!5806 b1!101)))))

(declare-fun b!232766 () Bool)

(declare-fun res!194783 () Bool)

(assert (=> b!232766 (=> (not res!194783) (not e!160286))))

(assert (=> b!232766 (= res!194783 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!49030 res!194784) b!232764))

(assert (= (and b!232764 res!194781) b!232766))

(assert (= (and b!232766 res!194783) b!232761))

(assert (= (and b!232761 res!194782) b!232762))

(assert (= start!49030 b!232765))

(assert (= start!49030 b!232763))

(declare-fun m!355575 () Bool)

(assert (=> b!232761 m!355575))

(declare-fun m!355577 () Bool)

(assert (=> b!232763 m!355577))

(declare-fun m!355579 () Bool)

(assert (=> b!232764 m!355579))

(declare-fun m!355581 () Bool)

(assert (=> b!232762 m!355581))

(declare-fun m!355583 () Bool)

(assert (=> start!49030 m!355583))

(declare-fun m!355585 () Bool)

(assert (=> start!49030 m!355585))

(declare-fun m!355587 () Bool)

(assert (=> b!232765 m!355587))

(push 1)

(assert (not b!232764))

(assert (not b!232762))

(assert (not b!232763))

(assert (not start!49030))

(assert (not b!232761))

(assert (not b!232765))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

