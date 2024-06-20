; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48538 () Bool)

(assert start!48538)

(declare-fun b!229867 () Bool)

(declare-fun e!157806 () Bool)

(declare-datatypes ((array!11705 0))(
  ( (array!11706 (arr!6118 (Array (_ BitVec 32) (_ BitVec 8))) (size!5131 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9358 0))(
  ( (BitStream!9359 (buf!5672 array!11705) (currentByte!10619 (_ BitVec 32)) (currentBit!10614 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9358)

(declare-fun array_inv!4872 (array!11705) Bool)

(assert (=> b!229867 (= e!157806 (array_inv!4872 (buf!5672 b1!101)))))

(declare-fun b!229868 () Bool)

(declare-fun e!157810 () Bool)

(assert (=> b!229868 (= e!157810 false)))

(declare-fun lt!367704 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229868 (= lt!367704 (bitIndex!0 (size!5131 (buf!5672 b1!101)) (currentByte!10619 b1!101) (currentBit!10614 b1!101)))))

(declare-fun b!229869 () Bool)

(declare-fun res!192691 () Bool)

(assert (=> b!229869 (=> (not res!192691) (not e!157810))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!229869 (= res!192691 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!229870 () Bool)

(declare-fun res!192694 () Bool)

(assert (=> b!229870 (=> (not res!192694) (not e!157810))))

(declare-fun b2!99 () BitStream!9358)

(assert (=> b!229870 (= res!192694 (bvsle bits!86 (bitIndex!0 (size!5131 (buf!5672 b2!99)) (currentByte!10619 b2!99) (currentBit!10614 b2!99))))))

(declare-fun b!229871 () Bool)

(declare-fun e!157809 () Bool)

(assert (=> b!229871 (= e!157809 (array_inv!4872 (buf!5672 b2!99)))))

(declare-fun b!229872 () Bool)

(declare-fun res!192693 () Bool)

(assert (=> b!229872 (=> (not res!192693) (not e!157810))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229872 (= res!192693 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5131 (buf!5672 b1!101))) ((_ sign_extend 32) (currentByte!10619 b1!101)) ((_ sign_extend 32) (currentBit!10614 b1!101)) bytes!19))))

(declare-fun res!192692 () Bool)

(assert (=> start!48538 (=> (not res!192692) (not e!157810))))

(assert (=> start!48538 (= res!192692 (and (= (size!5131 (buf!5672 b1!101)) (size!5131 (buf!5672 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48538 e!157810))

(declare-fun inv!12 (BitStream!9358) Bool)

(assert (=> start!48538 (and (inv!12 b1!101) e!157806)))

(assert (=> start!48538 (and (inv!12 b2!99) e!157809)))

(assert (=> start!48538 true))

(assert (= (and start!48538 res!192692) b!229870))

(assert (= (and b!229870 res!192694) b!229869))

(assert (= (and b!229869 res!192691) b!229872))

(assert (= (and b!229872 res!192693) b!229868))

(assert (= start!48538 b!229867))

(assert (= start!48538 b!229871))

(declare-fun m!353407 () Bool)

(assert (=> b!229872 m!353407))

(declare-fun m!353409 () Bool)

(assert (=> b!229871 m!353409))

(declare-fun m!353411 () Bool)

(assert (=> b!229868 m!353411))

(declare-fun m!353413 () Bool)

(assert (=> b!229867 m!353413))

(declare-fun m!353415 () Bool)

(assert (=> start!48538 m!353415))

(declare-fun m!353417 () Bool)

(assert (=> start!48538 m!353417))

(declare-fun m!353419 () Bool)

(assert (=> b!229870 m!353419))

(push 1)

(assert (not b!229867))

(assert (not b!229871))

(assert (not b!229870))

(assert (not b!229872))

(assert (not b!229868))

(assert (not start!48538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

