; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48542 () Bool)

(assert start!48542)

(declare-fun res!192715 () Bool)

(declare-fun e!157837 () Bool)

(assert (=> start!48542 (=> (not res!192715) (not e!157837))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11709 0))(
  ( (array!11710 (arr!6120 (Array (_ BitVec 32) (_ BitVec 8))) (size!5133 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9362 0))(
  ( (BitStream!9363 (buf!5674 array!11709) (currentByte!10621 (_ BitVec 32)) (currentBit!10616 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9362)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9362)

(assert (=> start!48542 (= res!192715 (and (= (size!5133 (buf!5674 b1!101)) (size!5133 (buf!5674 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48542 e!157837))

(declare-fun e!157840 () Bool)

(declare-fun inv!12 (BitStream!9362) Bool)

(assert (=> start!48542 (and (inv!12 b1!101) e!157840)))

(declare-fun e!157839 () Bool)

(assert (=> start!48542 (and (inv!12 b2!99) e!157839)))

(assert (=> start!48542 true))

(declare-fun b!229903 () Bool)

(assert (=> b!229903 (= e!157837 false)))

(declare-fun lt!367710 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229903 (= lt!367710 (bitIndex!0 (size!5133 (buf!5674 b1!101)) (currentByte!10621 b1!101) (currentBit!10616 b1!101)))))

(declare-fun b!229904 () Bool)

(declare-fun res!192718 () Bool)

(assert (=> b!229904 (=> (not res!192718) (not e!157837))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229904 (= res!192718 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5133 (buf!5674 b1!101))) ((_ sign_extend 32) (currentByte!10621 b1!101)) ((_ sign_extend 32) (currentBit!10616 b1!101)) bytes!19))))

(declare-fun b!229905 () Bool)

(declare-fun array_inv!4874 (array!11709) Bool)

(assert (=> b!229905 (= e!157840 (array_inv!4874 (buf!5674 b1!101)))))

(declare-fun b!229906 () Bool)

(assert (=> b!229906 (= e!157839 (array_inv!4874 (buf!5674 b2!99)))))

(declare-fun b!229907 () Bool)

(declare-fun res!192717 () Bool)

(assert (=> b!229907 (=> (not res!192717) (not e!157837))))

(assert (=> b!229907 (= res!192717 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!229908 () Bool)

(declare-fun res!192716 () Bool)

(assert (=> b!229908 (=> (not res!192716) (not e!157837))))

(assert (=> b!229908 (= res!192716 (bvsle bits!86 (bitIndex!0 (size!5133 (buf!5674 b2!99)) (currentByte!10621 b2!99) (currentBit!10616 b2!99))))))

(assert (= (and start!48542 res!192715) b!229908))

(assert (= (and b!229908 res!192716) b!229907))

(assert (= (and b!229907 res!192717) b!229904))

(assert (= (and b!229904 res!192718) b!229903))

(assert (= start!48542 b!229905))

(assert (= start!48542 b!229906))

(declare-fun m!353435 () Bool)

(assert (=> b!229904 m!353435))

(declare-fun m!353437 () Bool)

(assert (=> b!229908 m!353437))

(declare-fun m!353439 () Bool)

(assert (=> b!229905 m!353439))

(declare-fun m!353441 () Bool)

(assert (=> b!229906 m!353441))

(declare-fun m!353443 () Bool)

(assert (=> b!229903 m!353443))

(declare-fun m!353445 () Bool)

(assert (=> start!48542 m!353445))

(declare-fun m!353447 () Bool)

(assert (=> start!48542 m!353447))

(push 1)

(assert (not b!229906))

(assert (not b!229908))

(assert (not b!229904))

(assert (not b!229905))

(assert (not start!48542))

(assert (not b!229903))

