; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49184 () Bool)

(assert start!49184)

(declare-fun b!233598 () Bool)

(declare-fun res!195426 () Bool)

(declare-fun e!160979 () Bool)

(assert (=> b!233598 (=> (not res!195426) (not e!160979))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!233598 (= res!195426 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!233599 () Bool)

(assert (=> b!233599 (= e!160979 false)))

(declare-fun lt!369513 () (_ BitVec 64))

(declare-datatypes ((array!12072 0))(
  ( (array!12073 (arr!6284 (Array (_ BitVec 32) (_ BitVec 8))) (size!5297 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9690 0))(
  ( (BitStream!9691 (buf!5838 array!12072) (currentByte!10872 (_ BitVec 32)) (currentBit!10867 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9690)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233599 (= lt!369513 (bitIndex!0 (size!5297 (buf!5838 b1!101)) (currentByte!10872 b1!101) (currentBit!10867 b1!101)))))

(declare-fun b!233600 () Bool)

(declare-fun e!160978 () Bool)

(declare-fun array_inv!5038 (array!12072) Bool)

(assert (=> b!233600 (= e!160978 (array_inv!5038 (buf!5838 b1!101)))))

(declare-fun b!233601 () Bool)

(declare-fun e!160980 () Bool)

(declare-fun b2!99 () BitStream!9690)

(assert (=> b!233601 (= e!160980 (array_inv!5038 (buf!5838 b2!99)))))

(declare-fun b!233603 () Bool)

(declare-fun res!195429 () Bool)

(assert (=> b!233603 (=> (not res!195429) (not e!160979))))

(assert (=> b!233603 (= res!195429 (bvsle bits!86 (bitIndex!0 (size!5297 (buf!5838 b2!99)) (currentByte!10872 b2!99) (currentBit!10867 b2!99))))))

(declare-fun b!233602 () Bool)

(declare-fun res!195428 () Bool)

(assert (=> b!233602 (=> (not res!195428) (not e!160979))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233602 (= res!195428 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5297 (buf!5838 b1!101))) ((_ sign_extend 32) (currentByte!10872 b1!101)) ((_ sign_extend 32) (currentBit!10867 b1!101)) bytes!19))))

(declare-fun res!195427 () Bool)

(assert (=> start!49184 (=> (not res!195427) (not e!160979))))

(assert (=> start!49184 (= res!195427 (and (= (size!5297 (buf!5838 b1!101)) (size!5297 (buf!5838 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49184 e!160979))

(declare-fun inv!12 (BitStream!9690) Bool)

(assert (=> start!49184 (and (inv!12 b1!101) e!160978)))

(assert (=> start!49184 (and (inv!12 b2!99) e!160980)))

(assert (=> start!49184 true))

(assert (= (and start!49184 res!195427) b!233603))

(assert (= (and b!233603 res!195429) b!233598))

(assert (= (and b!233598 res!195426) b!233602))

(assert (= (and b!233602 res!195428) b!233599))

(assert (= start!49184 b!233600))

(assert (= start!49184 b!233601))

(declare-fun m!356131 () Bool)

(assert (=> b!233603 m!356131))

(declare-fun m!356133 () Bool)

(assert (=> b!233602 m!356133))

(declare-fun m!356135 () Bool)

(assert (=> b!233599 m!356135))

(declare-fun m!356137 () Bool)

(assert (=> b!233601 m!356137))

(declare-fun m!356139 () Bool)

(assert (=> start!49184 m!356139))

(declare-fun m!356141 () Bool)

(assert (=> start!49184 m!356141))

(declare-fun m!356143 () Bool)

(assert (=> b!233600 m!356143))

(check-sat (not b!233603) (not start!49184) (not b!233599) (not b!233600) (not b!233602) (not b!233601))
