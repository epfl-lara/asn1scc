; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49276 () Bool)

(assert start!49276)

(declare-fun b!234096 () Bool)

(declare-fun res!195831 () Bool)

(declare-fun e!161388 () Bool)

(assert (=> b!234096 (=> (not res!195831) (not e!161388))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!234096 (= res!195831 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!234097 () Bool)

(declare-fun res!195829 () Bool)

(assert (=> b!234097 (=> (not res!195829) (not e!161388))))

(declare-datatypes ((array!12110 0))(
  ( (array!12111 (arr!6300 (Array (_ BitVec 32) (_ BitVec 8))) (size!5313 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9722 0))(
  ( (BitStream!9723 (buf!5854 array!12110) (currentByte!10906 (_ BitVec 32)) (currentBit!10901 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9722)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234097 (= res!195829 (bvsle bits!86 (bitIndex!0 (size!5313 (buf!5854 b2!99)) (currentByte!10906 b2!99) (currentBit!10901 b2!99))))))

(declare-fun b!234098 () Bool)

(declare-fun e!161386 () Bool)

(declare-fun b1!101 () BitStream!9722)

(declare-fun array_inv!5054 (array!12110) Bool)

(assert (=> b!234098 (= e!161386 (array_inv!5054 (buf!5854 b1!101)))))

(declare-fun b!234099 () Bool)

(declare-fun e!161390 () Bool)

(assert (=> b!234099 (= e!161390 (array_inv!5054 (buf!5854 b2!99)))))

(declare-fun res!195828 () Bool)

(assert (=> start!49276 (=> (not res!195828) (not e!161388))))

(assert (=> start!49276 (= res!195828 (and (= (size!5313 (buf!5854 b1!101)) (size!5313 (buf!5854 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49276 e!161388))

(declare-fun inv!12 (BitStream!9722) Bool)

(assert (=> start!49276 (and (inv!12 b1!101) e!161386)))

(assert (=> start!49276 (and (inv!12 b2!99) e!161390)))

(assert (=> start!49276 true))

(declare-fun b!234100 () Bool)

(assert (=> b!234100 (= e!161388 false)))

(declare-fun lt!369849 () (_ BitVec 64))

(assert (=> b!234100 (= lt!369849 (bitIndex!0 (size!5313 (buf!5854 b1!101)) (currentByte!10906 b1!101) (currentBit!10901 b1!101)))))

(declare-fun b!234101 () Bool)

(declare-fun res!195830 () Bool)

(assert (=> b!234101 (=> (not res!195830) (not e!161388))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!234101 (= res!195830 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5313 (buf!5854 b1!101))) ((_ sign_extend 32) (currentByte!10906 b1!101)) ((_ sign_extend 32) (currentBit!10901 b1!101)) bytes!19))))

(assert (= (and start!49276 res!195828) b!234097))

(assert (= (and b!234097 res!195829) b!234096))

(assert (= (and b!234096 res!195831) b!234101))

(assert (= (and b!234101 res!195830) b!234100))

(assert (= start!49276 b!234098))

(assert (= start!49276 b!234099))

(declare-fun m!356427 () Bool)

(assert (=> b!234098 m!356427))

(declare-fun m!356429 () Bool)

(assert (=> b!234097 m!356429))

(declare-fun m!356431 () Bool)

(assert (=> b!234100 m!356431))

(declare-fun m!356433 () Bool)

(assert (=> b!234099 m!356433))

(declare-fun m!356435 () Bool)

(assert (=> start!49276 m!356435))

(declare-fun m!356437 () Bool)

(assert (=> start!49276 m!356437))

(declare-fun m!356439 () Bool)

(assert (=> b!234101 m!356439))

(push 1)

(assert (not start!49276))

(assert (not b!234099))

(assert (not b!234100))

(assert (not b!234098))

(assert (not b!234101))

(assert (not b!234097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

