; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48250 () Bool)

(assert start!48250)

(declare-fun b!229027 () Bool)

(declare-fun res!192037 () Bool)

(declare-fun e!157141 () Bool)

(assert (=> b!229027 (=> (not res!192037) (not e!157141))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11622 0))(
  ( (array!11623 (arr!6087 (Array (_ BitVec 32) (_ BitVec 8))) (size!5100 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9296 0))(
  ( (BitStream!9297 (buf!5641 array!11622) (currentByte!10517 (_ BitVec 32)) (currentBit!10512 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9296)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229027 (= res!192037 (bvsle bits!86 (bitIndex!0 (size!5100 (buf!5641 b2!99)) (currentByte!10517 b2!99) (currentBit!10512 b2!99))))))

(declare-fun res!192038 () Bool)

(assert (=> start!48250 (=> (not res!192038) (not e!157141))))

(declare-fun b1!101 () BitStream!9296)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48250 (= res!192038 (and (= (size!5100 (buf!5641 b1!101)) (size!5100 (buf!5641 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48250 e!157141))

(declare-fun e!157137 () Bool)

(declare-fun inv!12 (BitStream!9296) Bool)

(assert (=> start!48250 (and (inv!12 b1!101) e!157137)))

(declare-fun e!157138 () Bool)

(assert (=> start!48250 (and (inv!12 b2!99) e!157138)))

(assert (=> start!48250 true))

(declare-fun b!229028 () Bool)

(declare-fun res!192039 () Bool)

(assert (=> b!229028 (=> (not res!192039) (not e!157141))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229028 (= res!192039 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10512 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10517 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5100 (buf!5641 b1!101))))))))

(declare-fun b!229029 () Bool)

(declare-fun array_inv!4841 (array!11622) Bool)

(assert (=> b!229029 (= e!157138 (array_inv!4841 (buf!5641 b2!99)))))

(declare-fun b!229030 () Bool)

(assert (=> b!229030 (= e!157141 (bvslt bytes!19 #b00000000000000000000000000000000))))

(declare-fun b!229031 () Bool)

(declare-fun res!192040 () Bool)

(assert (=> b!229031 (=> (not res!192040) (not e!157141))))

(assert (=> b!229031 (= res!192040 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (bvsle ((_ sign_extend 32) (size!5100 (buf!5641 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10517 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10512 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5100 (buf!5641 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10517 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10512 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!229032 () Bool)

(assert (=> b!229032 (= e!157137 (array_inv!4841 (buf!5641 b1!101)))))

(assert (= (and start!48250 res!192038) b!229027))

(assert (= (and b!229027 res!192037) b!229031))

(assert (= (and b!229031 res!192040) b!229028))

(assert (= (and b!229028 res!192039) b!229030))

(assert (= start!48250 b!229032))

(assert (= start!48250 b!229029))

(declare-fun m!352795 () Bool)

(assert (=> b!229029 m!352795))

(declare-fun m!352797 () Bool)

(assert (=> start!48250 m!352797))

(declare-fun m!352799 () Bool)

(assert (=> start!48250 m!352799))

(declare-fun m!352801 () Bool)

(assert (=> b!229027 m!352801))

(declare-fun m!352803 () Bool)

(assert (=> b!229028 m!352803))

(declare-fun m!352805 () Bool)

(assert (=> b!229032 m!352805))

(push 1)

(assert (not b!229027))

(assert (not b!229028))

(assert (not b!229032))

(assert (not start!48250))

(assert (not b!229029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

