; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49036 () Bool)

(assert start!49036)

(declare-fun b!232815 () Bool)

(declare-fun res!194817 () Bool)

(declare-fun e!160329 () Bool)

(assert (=> b!232815 (=> (not res!194817) (not e!160329))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!12005 0))(
  ( (array!12006 (arr!6255 (Array (_ BitVec 32) (_ BitVec 8))) (size!5268 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9632 0))(
  ( (BitStream!9633 (buf!5809 array!12005) (currentByte!10816 (_ BitVec 32)) (currentBit!10811 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9632)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232815 (= res!194817 (bvsle bits!86 (bitIndex!0 (size!5268 (buf!5809 b2!99)) (currentByte!10816 b2!99) (currentBit!10811 b2!99))))))

(declare-fun res!194819 () Bool)

(assert (=> start!49036 (=> (not res!194819) (not e!160329))))

(declare-fun b1!101 () BitStream!9632)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!49036 (= res!194819 (and (= (size!5268 (buf!5809 b1!101)) (size!5268 (buf!5809 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49036 e!160329))

(declare-fun e!160327 () Bool)

(declare-fun inv!12 (BitStream!9632) Bool)

(assert (=> start!49036 (and (inv!12 b1!101) e!160327)))

(declare-fun e!160330 () Bool)

(assert (=> start!49036 (and (inv!12 b2!99) e!160330)))

(assert (=> start!49036 true))

(declare-fun b!232816 () Bool)

(declare-fun res!194820 () Bool)

(assert (=> b!232816 (=> (not res!194820) (not e!160329))))

(assert (=> b!232816 (= res!194820 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232817 () Bool)

(declare-fun array_inv!5009 (array!12005) Bool)

(assert (=> b!232817 (= e!160327 (array_inv!5009 (buf!5809 b1!101)))))

(declare-fun b!232818 () Bool)

(declare-fun res!194818 () Bool)

(assert (=> b!232818 (=> (not res!194818) (not e!160329))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232818 (= res!194818 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5268 (buf!5809 b1!101))) ((_ sign_extend 32) (currentByte!10816 b1!101)) ((_ sign_extend 32) (currentBit!10811 b1!101)) bytes!19))))

(declare-fun b!232819 () Bool)

(assert (=> b!232819 (= e!160330 (array_inv!5009 (buf!5809 b2!99)))))

(declare-fun b!232820 () Bool)

(assert (=> b!232820 (= e!160329 false)))

(declare-fun lt!369021 () (_ BitVec 64))

(assert (=> b!232820 (= lt!369021 (bitIndex!0 (size!5268 (buf!5809 b1!101)) (currentByte!10816 b1!101) (currentBit!10811 b1!101)))))

(assert (= (and start!49036 res!194819) b!232815))

(assert (= (and b!232815 res!194817) b!232816))

(assert (= (and b!232816 res!194820) b!232818))

(assert (= (and b!232818 res!194818) b!232820))

(assert (= start!49036 b!232817))

(assert (= start!49036 b!232819))

(declare-fun m!355617 () Bool)

(assert (=> b!232819 m!355617))

(declare-fun m!355619 () Bool)

(assert (=> b!232818 m!355619))

(declare-fun m!355621 () Bool)

(assert (=> b!232817 m!355621))

(declare-fun m!355623 () Bool)

(assert (=> b!232815 m!355623))

(declare-fun m!355625 () Bool)

(assert (=> start!49036 m!355625))

(declare-fun m!355627 () Bool)

(assert (=> start!49036 m!355627))

(declare-fun m!355629 () Bool)

(assert (=> b!232820 m!355629))

(push 1)

(assert (not b!232820))

(assert (not b!232815))

(assert (not b!232817))

(assert (not start!49036))

(assert (not b!232819))

(assert (not b!232818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

