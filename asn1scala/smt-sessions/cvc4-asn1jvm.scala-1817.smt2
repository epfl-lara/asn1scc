; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49018 () Bool)

(assert start!49018)

(declare-fun b!232644 () Bool)

(declare-fun e!160185 () Bool)

(assert (=> b!232644 (= e!160185 false)))

(declare-fun lt!368985 () (_ BitVec 64))

(declare-datatypes ((array!11987 0))(
  ( (array!11988 (arr!6246 (Array (_ BitVec 32) (_ BitVec 8))) (size!5259 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9614 0))(
  ( (BitStream!9615 (buf!5800 array!11987) (currentByte!10807 (_ BitVec 32)) (currentBit!10802 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9614)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232644 (= lt!368985 (bitIndex!0 (size!5259 (buf!5800 b1!101)) (currentByte!10807 b1!101) (currentBit!10802 b1!101)))))

(declare-fun b!232645 () Bool)

(declare-fun e!160187 () Bool)

(declare-fun b2!99 () BitStream!9614)

(declare-fun array_inv!5000 (array!11987) Bool)

(assert (=> b!232645 (= e!160187 (array_inv!5000 (buf!5800 b2!99)))))

(declare-fun b!232646 () Bool)

(declare-fun res!194702 () Bool)

(assert (=> b!232646 (=> (not res!194702) (not e!160185))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232646 (= res!194702 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5259 (buf!5800 b1!101))) ((_ sign_extend 32) (currentByte!10807 b1!101)) ((_ sign_extend 32) (currentBit!10802 b1!101)) bytes!19))))

(declare-fun res!194700 () Bool)

(assert (=> start!49018 (=> (not res!194700) (not e!160185))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> start!49018 (= res!194700 (and (= (size!5259 (buf!5800 b1!101)) (size!5259 (buf!5800 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49018 e!160185))

(declare-fun e!160184 () Bool)

(declare-fun inv!12 (BitStream!9614) Bool)

(assert (=> start!49018 (and (inv!12 b1!101) e!160184)))

(assert (=> start!49018 (and (inv!12 b2!99) e!160187)))

(assert (=> start!49018 true))

(declare-fun b!232647 () Bool)

(declare-fun res!194701 () Bool)

(assert (=> b!232647 (=> (not res!194701) (not e!160185))))

(assert (=> b!232647 (= res!194701 (bvsle bits!86 (bitIndex!0 (size!5259 (buf!5800 b2!99)) (currentByte!10807 b2!99) (currentBit!10802 b2!99))))))

(declare-fun b!232648 () Bool)

(assert (=> b!232648 (= e!160184 (array_inv!5000 (buf!5800 b1!101)))))

(declare-fun b!232649 () Bool)

(declare-fun res!194703 () Bool)

(assert (=> b!232649 (=> (not res!194703) (not e!160185))))

(assert (=> b!232649 (= res!194703 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!49018 res!194700) b!232647))

(assert (= (and b!232647 res!194701) b!232649))

(assert (= (and b!232649 res!194703) b!232646))

(assert (= (and b!232646 res!194702) b!232644))

(assert (= start!49018 b!232648))

(assert (= start!49018 b!232645))

(declare-fun m!355485 () Bool)

(assert (=> b!232647 m!355485))

(declare-fun m!355487 () Bool)

(assert (=> b!232644 m!355487))

(declare-fun m!355489 () Bool)

(assert (=> b!232646 m!355489))

(declare-fun m!355491 () Bool)

(assert (=> b!232645 m!355491))

(declare-fun m!355493 () Bool)

(assert (=> b!232648 m!355493))

(declare-fun m!355495 () Bool)

(assert (=> start!49018 m!355495))

(declare-fun m!355497 () Bool)

(assert (=> start!49018 m!355497))

(push 1)

(assert (not b!232647))

(assert (not b!232646))

(assert (not b!232644))

(assert (not b!232648))

(assert (not b!232645))

(assert (not start!49018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

