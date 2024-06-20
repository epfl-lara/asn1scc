; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48972 () Bool)

(assert start!48972)

(declare-fun b!232194 () Bool)

(declare-fun res!194389 () Bool)

(declare-fun e!159804 () Bool)

(assert (=> b!232194 (=> (not res!194389) (not e!159804))))

(declare-datatypes ((array!11941 0))(
  ( (array!11942 (arr!6223 (Array (_ BitVec 32) (_ BitVec 8))) (size!5236 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9568 0))(
  ( (BitStream!9569 (buf!5777 array!11941) (currentByte!10784 (_ BitVec 32)) (currentBit!10779 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9568)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232194 (= res!194389 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5236 (buf!5777 b1!101))) ((_ sign_extend 32) (currentByte!10784 b1!101)) ((_ sign_extend 32) (currentBit!10779 b1!101)) bytes!19))))

(declare-fun b!232195 () Bool)

(declare-fun res!194390 () Bool)

(assert (=> b!232195 (=> (not res!194390) (not e!159804))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!232195 (= res!194390 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232196 () Bool)

(assert (=> b!232196 (= e!159804 false)))

(declare-fun lt!368880 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232196 (= lt!368880 (bitIndex!0 (size!5236 (buf!5777 b1!101)) (currentByte!10784 b1!101) (currentBit!10779 b1!101)))))

(declare-fun b!232197 () Bool)

(declare-fun e!159802 () Bool)

(declare-fun array_inv!4977 (array!11941) Bool)

(assert (=> b!232197 (= e!159802 (array_inv!4977 (buf!5777 b1!101)))))

(declare-fun b!232198 () Bool)

(declare-fun e!159805 () Bool)

(declare-fun b2!99 () BitStream!9568)

(assert (=> b!232198 (= e!159805 (array_inv!4977 (buf!5777 b2!99)))))

(declare-fun res!194388 () Bool)

(assert (=> start!48972 (=> (not res!194388) (not e!159804))))

(assert (=> start!48972 (= res!194388 (and (= (size!5236 (buf!5777 b1!101)) (size!5236 (buf!5777 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48972 e!159804))

(declare-fun inv!12 (BitStream!9568) Bool)

(assert (=> start!48972 (and (inv!12 b1!101) e!159802)))

(assert (=> start!48972 (and (inv!12 b2!99) e!159805)))

(assert (=> start!48972 true))

(declare-fun b!232199 () Bool)

(declare-fun res!194391 () Bool)

(assert (=> b!232199 (=> (not res!194391) (not e!159804))))

(assert (=> b!232199 (= res!194391 (bvsle bits!86 (bitIndex!0 (size!5236 (buf!5777 b2!99)) (currentByte!10784 b2!99) (currentBit!10779 b2!99))))))

(assert (= (and start!48972 res!194388) b!232199))

(assert (= (and b!232199 res!194391) b!232195))

(assert (= (and b!232195 res!194390) b!232194))

(assert (= (and b!232194 res!194389) b!232196))

(assert (= start!48972 b!232197))

(assert (= start!48972 b!232198))

(declare-fun m!355139 () Bool)

(assert (=> b!232199 m!355139))

(declare-fun m!355141 () Bool)

(assert (=> b!232198 m!355141))

(declare-fun m!355143 () Bool)

(assert (=> b!232196 m!355143))

(declare-fun m!355145 () Bool)

(assert (=> b!232197 m!355145))

(declare-fun m!355147 () Bool)

(assert (=> start!48972 m!355147))

(declare-fun m!355149 () Bool)

(assert (=> start!48972 m!355149))

(declare-fun m!355151 () Bool)

(assert (=> b!232194 m!355151))

(push 1)

(assert (not b!232199))

(assert (not b!232194))

(assert (not b!232198))

(assert (not b!232196))

(assert (not start!48972))

(assert (not b!232197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

