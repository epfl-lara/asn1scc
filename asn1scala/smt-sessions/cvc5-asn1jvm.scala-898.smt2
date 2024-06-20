; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25462 () Bool)

(assert start!25462)

(declare-fun b!128664 () Bool)

(declare-fun e!85292 () Bool)

(declare-datatypes ((array!5947 0))(
  ( (array!5948 (arr!3306 (Array (_ BitVec 32) (_ BitVec 8))) (size!2689 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4642 0))(
  ( (BitStream!4643 (buf!3047 array!5947) (currentByte!5808 (_ BitVec 32)) (currentBit!5803 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4642)

(declare-fun array_inv!2478 (array!5947) Bool)

(assert (=> b!128664 (= e!85292 (array_inv!2478 (buf!3047 thiss!1634)))))

(declare-fun b!128665 () Bool)

(declare-fun e!85291 () Bool)

(declare-fun e!85287 () Bool)

(assert (=> b!128665 (= e!85291 (not e!85287))))

(declare-fun res!106497 () Bool)

(assert (=> b!128665 (=> res!106497 e!85287)))

(declare-datatypes ((Unit!7983 0))(
  ( (Unit!7984) )
))
(declare-datatypes ((tuple2!10900 0))(
  ( (tuple2!10901 (_1!5747 Unit!7983) (_2!5747 BitStream!4642)) )
))
(declare-fun lt!199530 () tuple2!10900)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128665 (= res!106497 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2689 (buf!3047 (_2!5747 lt!199530))) (currentByte!5808 (_2!5747 lt!199530)) (currentBit!5803 (_2!5747 lt!199530)))))))

(declare-fun e!85289 () Bool)

(assert (=> b!128665 e!85289))

(declare-fun res!106499 () Bool)

(assert (=> b!128665 (=> (not res!106499) (not e!85289))))

(assert (=> b!128665 (= res!106499 (= (size!2689 (buf!3047 thiss!1634)) (size!2689 (buf!3047 (_2!5747 lt!199530)))))))

(declare-fun arr!237 () array!5947)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByte!0 (BitStream!4642 (_ BitVec 8)) tuple2!10900)

(assert (=> b!128665 (= lt!199530 (appendByte!0 thiss!1634 (select (arr!3306 arr!237) from!447)))))

(declare-fun b!128666 () Bool)

(declare-fun res!106500 () Bool)

(assert (=> b!128666 (=> (not res!106500) (not e!85289))))

(assert (=> b!128666 (= res!106500 (= (bitIndex!0 (size!2689 (buf!3047 (_2!5747 lt!199530))) (currentByte!5808 (_2!5747 lt!199530)) (currentBit!5803 (_2!5747 lt!199530))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2689 (buf!3047 thiss!1634)) (currentByte!5808 thiss!1634) (currentBit!5803 thiss!1634)))))))

(declare-fun res!106496 () Bool)

(assert (=> start!25462 (=> (not res!106496) (not e!85291))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!25462 (= res!106496 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2689 arr!237))))))

(assert (=> start!25462 e!85291))

(assert (=> start!25462 true))

(assert (=> start!25462 (array_inv!2478 arr!237)))

(declare-fun inv!12 (BitStream!4642) Bool)

(assert (=> start!25462 (and (inv!12 thiss!1634) e!85292)))

(declare-fun b!128667 () Bool)

(declare-fun res!106495 () Bool)

(assert (=> b!128667 (=> (not res!106495) (not e!85291))))

(assert (=> b!128667 (= res!106495 (bvslt from!447 to!404))))

(declare-fun b!128668 () Bool)

(declare-fun res!106494 () Bool)

(assert (=> b!128668 (=> (not res!106494) (not e!85289))))

(declare-fun isPrefixOf!0 (BitStream!4642 BitStream!4642) Bool)

(assert (=> b!128668 (= res!106494 (isPrefixOf!0 thiss!1634 (_2!5747 lt!199530)))))

(declare-fun b!128669 () Bool)

(declare-datatypes ((tuple2!10902 0))(
  ( (tuple2!10903 (_1!5748 BitStream!4642) (_2!5748 (_ BitVec 8))) )
))
(declare-fun lt!199529 () tuple2!10902)

(declare-datatypes ((tuple2!10904 0))(
  ( (tuple2!10905 (_1!5749 BitStream!4642) (_2!5749 BitStream!4642)) )
))
(declare-fun lt!199532 () tuple2!10904)

(assert (=> b!128669 (= e!85289 (and (= (_2!5748 lt!199529) (select (arr!3306 arr!237) from!447)) (= (_1!5748 lt!199529) (_2!5749 lt!199532))))))

(declare-fun readBytePure!0 (BitStream!4642) tuple2!10902)

(assert (=> b!128669 (= lt!199529 (readBytePure!0 (_1!5749 lt!199532)))))

(declare-fun reader!0 (BitStream!4642 BitStream!4642) tuple2!10904)

(assert (=> b!128669 (= lt!199532 (reader!0 thiss!1634 (_2!5747 lt!199530)))))

(declare-fun b!128670 () Bool)

(declare-fun res!106501 () Bool)

(assert (=> b!128670 (=> (not res!106501) (not e!85291))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128670 (= res!106501 (invariant!0 (currentBit!5803 thiss!1634) (currentByte!5808 thiss!1634) (size!2689 (buf!3047 thiss!1634))))))

(declare-fun b!128671 () Bool)

(assert (=> b!128671 (= e!85287 true)))

(declare-fun lt!199531 () (_ BitVec 64))

(assert (=> b!128671 (= lt!199531 (bitIndex!0 (size!2689 (buf!3047 thiss!1634)) (currentByte!5808 thiss!1634) (currentBit!5803 thiss!1634)))))

(declare-fun b!128672 () Bool)

(declare-fun res!106498 () Bool)

(assert (=> b!128672 (=> (not res!106498) (not e!85291))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128672 (= res!106498 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2689 (buf!3047 thiss!1634))) ((_ sign_extend 32) (currentByte!5808 thiss!1634)) ((_ sign_extend 32) (currentBit!5803 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!25462 res!106496) b!128672))

(assert (= (and b!128672 res!106498) b!128667))

(assert (= (and b!128667 res!106495) b!128670))

(assert (= (and b!128670 res!106501) b!128665))

(assert (= (and b!128665 res!106499) b!128666))

(assert (= (and b!128666 res!106500) b!128668))

(assert (= (and b!128668 res!106494) b!128669))

(assert (= (and b!128665 (not res!106497)) b!128671))

(assert (= start!25462 b!128664))

(declare-fun m!194437 () Bool)

(assert (=> b!128665 m!194437))

(declare-fun m!194439 () Bool)

(assert (=> b!128665 m!194439))

(assert (=> b!128665 m!194439))

(declare-fun m!194441 () Bool)

(assert (=> b!128665 m!194441))

(declare-fun m!194443 () Bool)

(assert (=> b!128668 m!194443))

(assert (=> b!128669 m!194439))

(declare-fun m!194445 () Bool)

(assert (=> b!128669 m!194445))

(declare-fun m!194447 () Bool)

(assert (=> b!128669 m!194447))

(declare-fun m!194449 () Bool)

(assert (=> start!25462 m!194449))

(declare-fun m!194451 () Bool)

(assert (=> start!25462 m!194451))

(assert (=> b!128666 m!194437))

(declare-fun m!194453 () Bool)

(assert (=> b!128666 m!194453))

(declare-fun m!194455 () Bool)

(assert (=> b!128664 m!194455))

(assert (=> b!128671 m!194453))

(declare-fun m!194457 () Bool)

(assert (=> b!128672 m!194457))

(declare-fun m!194459 () Bool)

(assert (=> b!128670 m!194459))

(push 1)

(assert (not start!25462))

(assert (not b!128668))

(assert (not b!128670))

(assert (not b!128672))

(assert (not b!128669))

(assert (not b!128666))

(assert (not b!128664))

(assert (not b!128671))

(assert (not b!128665))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

