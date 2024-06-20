; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48906 () Bool)

(assert start!48906)

(declare-fun b!231510 () Bool)

(declare-fun e!159220 () Bool)

(declare-datatypes ((array!11875 0))(
  ( (array!11876 (arr!6190 (Array (_ BitVec 32) (_ BitVec 8))) (size!5203 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9502 0))(
  ( (BitStream!9503 (buf!5744 array!11875) (currentByte!10751 (_ BitVec 32)) (currentBit!10746 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9502)

(declare-fun array_inv!4944 (array!11875) Bool)

(assert (=> b!231510 (= e!159220 (array_inv!4944 (buf!5744 b2!99)))))

(declare-fun b!231511 () Bool)

(declare-fun res!193904 () Bool)

(declare-fun e!159219 () Bool)

(assert (=> b!231511 (=> (not res!193904) (not e!159219))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231511 (= res!193904 (bvsle bits!86 (bitIndex!0 (size!5203 (buf!5744 b2!99)) (currentByte!10751 b2!99) (currentBit!10746 b2!99))))))

(declare-fun b!231512 () Bool)

(assert (=> b!231512 (= e!159219 false)))

(declare-fun lt!368709 () (_ BitVec 64))

(declare-fun b1!101 () BitStream!9502)

(assert (=> b!231512 (= lt!368709 (bitIndex!0 (size!5203 (buf!5744 b1!101)) (currentByte!10751 b1!101) (currentBit!10746 b1!101)))))

(declare-fun res!193902 () Bool)

(assert (=> start!48906 (=> (not res!193902) (not e!159219))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48906 (= res!193902 (and (= (size!5203 (buf!5744 b1!101)) (size!5203 (buf!5744 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48906 e!159219))

(declare-fun e!159218 () Bool)

(declare-fun inv!12 (BitStream!9502) Bool)

(assert (=> start!48906 (and (inv!12 b1!101) e!159218)))

(assert (=> start!48906 (and (inv!12 b2!99) e!159220)))

(assert (=> start!48906 true))

(declare-fun b!231513 () Bool)

(declare-fun res!193905 () Bool)

(assert (=> b!231513 (=> (not res!193905) (not e!159219))))

(assert (=> b!231513 (= res!193905 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231514 () Bool)

(assert (=> b!231514 (= e!159218 (array_inv!4944 (buf!5744 b1!101)))))

(declare-fun b!231515 () Bool)

(declare-fun res!193903 () Bool)

(assert (=> b!231515 (=> (not res!193903) (not e!159219))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231515 (= res!193903 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5203 (buf!5744 b1!101))) ((_ sign_extend 32) (currentByte!10751 b1!101)) ((_ sign_extend 32) (currentBit!10746 b1!101)) bytes!19))))

(assert (= (and start!48906 res!193902) b!231511))

(assert (= (and b!231511 res!193904) b!231513))

(assert (= (and b!231513 res!193905) b!231515))

(assert (= (and b!231515 res!193903) b!231512))

(assert (= start!48906 b!231514))

(assert (= start!48906 b!231510))

(declare-fun m!354617 () Bool)

(assert (=> b!231511 m!354617))

(declare-fun m!354619 () Bool)

(assert (=> b!231510 m!354619))

(declare-fun m!354621 () Bool)

(assert (=> start!48906 m!354621))

(declare-fun m!354623 () Bool)

(assert (=> start!48906 m!354623))

(declare-fun m!354625 () Bool)

(assert (=> b!231512 m!354625))

(declare-fun m!354627 () Bool)

(assert (=> b!231515 m!354627))

(declare-fun m!354629 () Bool)

(assert (=> b!231514 m!354629))

(push 1)

(assert (not b!231510))

(assert (not b!231515))

(assert (not b!231511))

(assert (not b!231512))

(assert (not start!48906))

(assert (not b!231514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

