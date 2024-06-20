; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49272 () Bool)

(assert start!49272)

(declare-fun b!234060 () Bool)

(declare-fun e!161358 () Bool)

(assert (=> b!234060 (= e!161358 false)))

(declare-fun lt!369843 () (_ BitVec 64))

(declare-datatypes ((array!12106 0))(
  ( (array!12107 (arr!6298 (Array (_ BitVec 32) (_ BitVec 8))) (size!5311 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9718 0))(
  ( (BitStream!9719 (buf!5852 array!12106) (currentByte!10904 (_ BitVec 32)) (currentBit!10899 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9718)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234060 (= lt!369843 (bitIndex!0 (size!5311 (buf!5852 b1!101)) (currentByte!10904 b1!101) (currentBit!10899 b1!101)))))

(declare-fun b!234061 () Bool)

(declare-fun res!195805 () Bool)

(assert (=> b!234061 (=> (not res!195805) (not e!161358))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!234061 (= res!195805 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5311 (buf!5852 b1!101))) ((_ sign_extend 32) (currentByte!10904 b1!101)) ((_ sign_extend 32) (currentBit!10899 b1!101)) bytes!19))))

(declare-fun b!234062 () Bool)

(declare-fun e!161359 () Bool)

(declare-fun b2!99 () BitStream!9718)

(declare-fun array_inv!5052 (array!12106) Bool)

(assert (=> b!234062 (= e!161359 (array_inv!5052 (buf!5852 b2!99)))))

(declare-fun b!234063 () Bool)

(declare-fun res!195806 () Bool)

(assert (=> b!234063 (=> (not res!195806) (not e!161358))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!234063 (= res!195806 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!234064 () Bool)

(declare-fun e!161357 () Bool)

(assert (=> b!234064 (= e!161357 (array_inv!5052 (buf!5852 b1!101)))))

(declare-fun b!234065 () Bool)

(declare-fun res!195804 () Bool)

(assert (=> b!234065 (=> (not res!195804) (not e!161358))))

(assert (=> b!234065 (= res!195804 (bvsle bits!86 (bitIndex!0 (size!5311 (buf!5852 b2!99)) (currentByte!10904 b2!99) (currentBit!10899 b2!99))))))

(declare-fun res!195807 () Bool)

(assert (=> start!49272 (=> (not res!195807) (not e!161358))))

(assert (=> start!49272 (= res!195807 (and (= (size!5311 (buf!5852 b1!101)) (size!5311 (buf!5852 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49272 e!161358))

(declare-fun inv!12 (BitStream!9718) Bool)

(assert (=> start!49272 (and (inv!12 b1!101) e!161357)))

(assert (=> start!49272 (and (inv!12 b2!99) e!161359)))

(assert (=> start!49272 true))

(assert (= (and start!49272 res!195807) b!234065))

(assert (= (and b!234065 res!195804) b!234063))

(assert (= (and b!234063 res!195806) b!234061))

(assert (= (and b!234061 res!195805) b!234060))

(assert (= start!49272 b!234064))

(assert (= start!49272 b!234062))

(declare-fun m!356399 () Bool)

(assert (=> b!234061 m!356399))

(declare-fun m!356401 () Bool)

(assert (=> b!234062 m!356401))

(declare-fun m!356403 () Bool)

(assert (=> b!234065 m!356403))

(declare-fun m!356405 () Bool)

(assert (=> start!49272 m!356405))

(declare-fun m!356407 () Bool)

(assert (=> start!49272 m!356407))

(declare-fun m!356409 () Bool)

(assert (=> b!234060 m!356409))

(declare-fun m!356411 () Bool)

(assert (=> b!234064 m!356411))

(push 1)

(assert (not b!234062))

(assert (not b!234064))

(assert (not b!234061))

(assert (not start!49272))

(assert (not b!234060))

(assert (not b!234065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

