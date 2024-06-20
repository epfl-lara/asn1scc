; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48978 () Bool)

(assert start!48978)

(declare-fun b!232248 () Bool)

(declare-fun e!159851 () Bool)

(assert (=> b!232248 (= e!159851 false)))

(declare-fun lt!368889 () (_ BitVec 64))

(declare-datatypes ((array!11947 0))(
  ( (array!11948 (arr!6226 (Array (_ BitVec 32) (_ BitVec 8))) (size!5239 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9574 0))(
  ( (BitStream!9575 (buf!5780 array!11947) (currentByte!10787 (_ BitVec 32)) (currentBit!10782 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9574)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232248 (= lt!368889 (bitIndex!0 (size!5239 (buf!5780 b1!101)) (currentByte!10787 b1!101) (currentBit!10782 b1!101)))))

(declare-fun b!232249 () Bool)

(declare-fun e!159848 () Bool)

(declare-fun array_inv!4980 (array!11947) Bool)

(assert (=> b!232249 (= e!159848 (array_inv!4980 (buf!5780 b1!101)))))

(declare-fun b!232250 () Bool)

(declare-fun res!194427 () Bool)

(assert (=> b!232250 (=> (not res!194427) (not e!159851))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!232250 (= res!194427 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!232251 () Bool)

(declare-fun res!194426 () Bool)

(assert (=> b!232251 (=> (not res!194426) (not e!159851))))

(declare-fun b2!99 () BitStream!9574)

(assert (=> b!232251 (= res!194426 (bvsle bits!86 (bitIndex!0 (size!5239 (buf!5780 b2!99)) (currentByte!10787 b2!99) (currentBit!10782 b2!99))))))

(declare-fun b!232252 () Bool)

(declare-fun res!194425 () Bool)

(assert (=> b!232252 (=> (not res!194425) (not e!159851))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232252 (= res!194425 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5239 (buf!5780 b1!101))) ((_ sign_extend 32) (currentByte!10787 b1!101)) ((_ sign_extend 32) (currentBit!10782 b1!101)) bytes!19))))

(declare-fun b!232253 () Bool)

(declare-fun e!159849 () Bool)

(assert (=> b!232253 (= e!159849 (array_inv!4980 (buf!5780 b2!99)))))

(declare-fun res!194424 () Bool)

(assert (=> start!48978 (=> (not res!194424) (not e!159851))))

(assert (=> start!48978 (= res!194424 (and (= (size!5239 (buf!5780 b1!101)) (size!5239 (buf!5780 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48978 e!159851))

(declare-fun inv!12 (BitStream!9574) Bool)

(assert (=> start!48978 (and (inv!12 b1!101) e!159848)))

(assert (=> start!48978 (and (inv!12 b2!99) e!159849)))

(assert (=> start!48978 true))

(assert (= (and start!48978 res!194424) b!232251))

(assert (= (and b!232251 res!194426) b!232250))

(assert (= (and b!232250 res!194427) b!232252))

(assert (= (and b!232252 res!194425) b!232248))

(assert (= start!48978 b!232249))

(assert (= start!48978 b!232253))

(declare-fun m!355181 () Bool)

(assert (=> b!232252 m!355181))

(declare-fun m!355183 () Bool)

(assert (=> b!232248 m!355183))

(declare-fun m!355185 () Bool)

(assert (=> b!232251 m!355185))

(declare-fun m!355187 () Bool)

(assert (=> b!232253 m!355187))

(declare-fun m!355189 () Bool)

(assert (=> b!232249 m!355189))

(declare-fun m!355191 () Bool)

(assert (=> start!48978 m!355191))

(declare-fun m!355193 () Bool)

(assert (=> start!48978 m!355193))

(push 1)

(assert (not b!232249))

(assert (not start!48978))

(assert (not b!232248))

(assert (not b!232251))

(assert (not b!232253))

(assert (not b!232252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

