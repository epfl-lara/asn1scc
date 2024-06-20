; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49050 () Bool)

(assert start!49050)

(declare-fun b!232977 () Bool)

(declare-fun res!194937 () Bool)

(declare-fun e!160470 () Bool)

(assert (=> b!232977 (=> (not res!194937) (not e!160470))))

(declare-datatypes ((array!12019 0))(
  ( (array!12020 (arr!6262 (Array (_ BitVec 32) (_ BitVec 8))) (size!5275 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9646 0))(
  ( (BitStream!9647 (buf!5816 array!12019) (currentByte!10823 (_ BitVec 32)) (currentBit!10818 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9646)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232977 (= res!194937 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5275 (buf!5816 b1!101))) ((_ sign_extend 32) (currentByte!10823 b1!101)) ((_ sign_extend 32) (currentBit!10818 b1!101)) bytes!19))))

(declare-fun b!232978 () Bool)

(declare-fun res!194938 () Bool)

(assert (=> b!232978 (=> (not res!194938) (not e!160470))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9646)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232978 (= res!194938 (bvsle bits!86 (bitIndex!0 (size!5275 (buf!5816 b2!99)) (currentByte!10823 b2!99) (currentBit!10818 b2!99))))))

(declare-fun res!194940 () Bool)

(assert (=> start!49050 (=> (not res!194940) (not e!160470))))

(assert (=> start!49050 (= res!194940 (and (= (size!5275 (buf!5816 b1!101)) (size!5275 (buf!5816 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49050 e!160470))

(declare-fun e!160472 () Bool)

(declare-fun inv!12 (BitStream!9646) Bool)

(assert (=> start!49050 (and (inv!12 b1!101) e!160472)))

(declare-fun e!160469 () Bool)

(assert (=> start!49050 (and (inv!12 b2!99) e!160469)))

(assert (=> start!49050 true))

(declare-fun b!232979 () Bool)

(declare-fun res!194939 () Bool)

(assert (=> b!232979 (=> (not res!194939) (not e!160470))))

(assert (=> b!232979 (= res!194939 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232980 () Bool)

(declare-fun array_inv!5016 (array!12019) Bool)

(assert (=> b!232980 (= e!160469 (array_inv!5016 (buf!5816 b2!99)))))

(declare-fun b!232981 () Bool)

(assert (=> b!232981 (= e!160472 (array_inv!5016 (buf!5816 b1!101)))))

(declare-fun b!232982 () Bool)

(assert (=> b!232982 (= e!160470 false)))

(declare-fun lt!369078 () (_ BitVec 64))

(assert (=> b!232982 (= lt!369078 (bitIndex!0 (size!5275 (buf!5816 b1!101)) (currentByte!10823 b1!101) (currentBit!10818 b1!101)))))

(assert (= (and start!49050 res!194940) b!232978))

(assert (= (and b!232978 res!194938) b!232979))

(assert (= (and b!232979 res!194939) b!232977))

(assert (= (and b!232977 res!194937) b!232982))

(assert (= start!49050 b!232981))

(assert (= start!49050 b!232980))

(declare-fun m!355727 () Bool)

(assert (=> start!49050 m!355727))

(declare-fun m!355729 () Bool)

(assert (=> start!49050 m!355729))

(declare-fun m!355731 () Bool)

(assert (=> b!232981 m!355731))

(declare-fun m!355733 () Bool)

(assert (=> b!232977 m!355733))

(declare-fun m!355735 () Bool)

(assert (=> b!232978 m!355735))

(declare-fun m!355737 () Bool)

(assert (=> b!232980 m!355737))

(declare-fun m!355739 () Bool)

(assert (=> b!232982 m!355739))

(push 1)

(assert (not b!232977))

(assert (not b!232978))

(assert (not b!232981))

(assert (not start!49050))

(assert (not b!232980))

(assert (not b!232982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

