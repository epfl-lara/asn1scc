; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49014 () Bool)

(assert start!49014)

(declare-fun b!232608 () Bool)

(declare-fun e!160155 () Bool)

(declare-datatypes ((array!11983 0))(
  ( (array!11984 (arr!6244 (Array (_ BitVec 32) (_ BitVec 8))) (size!5257 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9610 0))(
  ( (BitStream!9611 (buf!5798 array!11983) (currentByte!10805 (_ BitVec 32)) (currentBit!10800 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9610)

(declare-fun array_inv!4998 (array!11983) Bool)

(assert (=> b!232608 (= e!160155 (array_inv!4998 (buf!5798 b1!101)))))

(declare-fun b!232609 () Bool)

(declare-fun e!160157 () Bool)

(assert (=> b!232609 (= e!160157 false)))

(declare-fun lt!368979 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232609 (= lt!368979 (bitIndex!0 (size!5257 (buf!5798 b1!101)) (currentByte!10805 b1!101) (currentBit!10800 b1!101)))))

(declare-fun res!194677 () Bool)

(assert (=> start!49014 (=> (not res!194677) (not e!160157))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9610)

(assert (=> start!49014 (= res!194677 (and (= (size!5257 (buf!5798 b1!101)) (size!5257 (buf!5798 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49014 e!160157))

(declare-fun inv!12 (BitStream!9610) Bool)

(assert (=> start!49014 (and (inv!12 b1!101) e!160155)))

(declare-fun e!160154 () Bool)

(assert (=> start!49014 (and (inv!12 b2!99) e!160154)))

(assert (=> start!49014 true))

(declare-fun b!232610 () Bool)

(assert (=> b!232610 (= e!160154 (array_inv!4998 (buf!5798 b2!99)))))

(declare-fun b!232611 () Bool)

(declare-fun res!194679 () Bool)

(assert (=> b!232611 (=> (not res!194679) (not e!160157))))

(assert (=> b!232611 (= res!194679 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232612 () Bool)

(declare-fun res!194676 () Bool)

(assert (=> b!232612 (=> (not res!194676) (not e!160157))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232612 (= res!194676 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5257 (buf!5798 b1!101))) ((_ sign_extend 32) (currentByte!10805 b1!101)) ((_ sign_extend 32) (currentBit!10800 b1!101)) bytes!19))))

(declare-fun b!232613 () Bool)

(declare-fun res!194678 () Bool)

(assert (=> b!232613 (=> (not res!194678) (not e!160157))))

(assert (=> b!232613 (= res!194678 (bvsle bits!86 (bitIndex!0 (size!5257 (buf!5798 b2!99)) (currentByte!10805 b2!99) (currentBit!10800 b2!99))))))

(assert (= (and start!49014 res!194677) b!232613))

(assert (= (and b!232613 res!194678) b!232611))

(assert (= (and b!232611 res!194679) b!232612))

(assert (= (and b!232612 res!194676) b!232609))

(assert (= start!49014 b!232608))

(assert (= start!49014 b!232610))

(declare-fun m!355457 () Bool)

(assert (=> b!232613 m!355457))

(declare-fun m!355459 () Bool)

(assert (=> start!49014 m!355459))

(declare-fun m!355461 () Bool)

(assert (=> start!49014 m!355461))

(declare-fun m!355463 () Bool)

(assert (=> b!232610 m!355463))

(declare-fun m!355465 () Bool)

(assert (=> b!232612 m!355465))

(declare-fun m!355467 () Bool)

(assert (=> b!232608 m!355467))

(declare-fun m!355469 () Bool)

(assert (=> b!232609 m!355469))

(push 1)

(assert (not b!232613))

(assert (not b!232608))

(assert (not b!232609))

(assert (not start!49014))

(assert (not b!232610))

(assert (not b!232612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

