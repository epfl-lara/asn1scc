; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25470 () Bool)

(assert start!25470)

(declare-fun b!128772 () Bool)

(declare-fun res!106597 () Bool)

(declare-fun e!85359 () Bool)

(assert (=> b!128772 (=> (not res!106597) (not e!85359))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5955 0))(
  ( (array!5956 (arr!3310 (Array (_ BitVec 32) (_ BitVec 8))) (size!2693 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4650 0))(
  ( (BitStream!4651 (buf!3051 array!5955) (currentByte!5812 (_ BitVec 32)) (currentBit!5807 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4650)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128772 (= res!106597 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2693 (buf!3051 thiss!1634))) ((_ sign_extend 32) (currentByte!5812 thiss!1634)) ((_ sign_extend 32) (currentBit!5807 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128773 () Bool)

(declare-fun res!106596 () Bool)

(declare-fun e!85362 () Bool)

(assert (=> b!128773 (=> (not res!106596) (not e!85362))))

(declare-datatypes ((Unit!7991 0))(
  ( (Unit!7992) )
))
(declare-datatypes ((tuple2!10924 0))(
  ( (tuple2!10925 (_1!5759 Unit!7991) (_2!5759 BitStream!4650)) )
))
(declare-fun lt!199580 () tuple2!10924)

(declare-fun isPrefixOf!0 (BitStream!4650 BitStream!4650) Bool)

(assert (=> b!128773 (= res!106596 (isPrefixOf!0 thiss!1634 (_2!5759 lt!199580)))))

(declare-fun b!128774 () Bool)

(declare-fun res!106592 () Bool)

(assert (=> b!128774 (=> (not res!106592) (not e!85359))))

(assert (=> b!128774 (= res!106592 (bvslt from!447 to!404))))

(declare-fun b!128775 () Bool)

(declare-fun e!85360 () Bool)

(assert (=> b!128775 (= e!85359 (not e!85360))))

(declare-fun res!106590 () Bool)

(assert (=> b!128775 (=> res!106590 e!85360)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128775 (= res!106590 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2693 (buf!3051 (_2!5759 lt!199580))) (currentByte!5812 (_2!5759 lt!199580)) (currentBit!5807 (_2!5759 lt!199580)))))))

(assert (=> b!128775 e!85362))

(declare-fun res!106593 () Bool)

(assert (=> b!128775 (=> (not res!106593) (not e!85362))))

(assert (=> b!128775 (= res!106593 (= (size!2693 (buf!3051 thiss!1634)) (size!2693 (buf!3051 (_2!5759 lt!199580)))))))

(declare-fun arr!237 () array!5955)

(declare-fun appendByte!0 (BitStream!4650 (_ BitVec 8)) tuple2!10924)

(assert (=> b!128775 (= lt!199580 (appendByte!0 thiss!1634 (select (arr!3310 arr!237) from!447)))))

(declare-fun b!128776 () Bool)

(declare-fun res!106591 () Bool)

(assert (=> b!128776 (=> (not res!106591) (not e!85359))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128776 (= res!106591 (invariant!0 (currentBit!5807 thiss!1634) (currentByte!5812 thiss!1634) (size!2693 (buf!3051 thiss!1634))))))

(declare-fun b!128777 () Bool)

(declare-fun e!85361 () Bool)

(declare-fun array_inv!2482 (array!5955) Bool)

(assert (=> b!128777 (= e!85361 (array_inv!2482 (buf!3051 thiss!1634)))))

(declare-datatypes ((tuple2!10926 0))(
  ( (tuple2!10927 (_1!5760 BitStream!4650) (_2!5760 BitStream!4650)) )
))
(declare-fun lt!199578 () tuple2!10926)

(declare-datatypes ((tuple2!10928 0))(
  ( (tuple2!10929 (_1!5761 BitStream!4650) (_2!5761 (_ BitVec 8))) )
))
(declare-fun lt!199579 () tuple2!10928)

(declare-fun b!128778 () Bool)

(assert (=> b!128778 (= e!85362 (and (= (_2!5761 lt!199579) (select (arr!3310 arr!237) from!447)) (= (_1!5761 lt!199579) (_2!5760 lt!199578))))))

(declare-fun readBytePure!0 (BitStream!4650) tuple2!10928)

(assert (=> b!128778 (= lt!199579 (readBytePure!0 (_1!5760 lt!199578)))))

(declare-fun reader!0 (BitStream!4650 BitStream!4650) tuple2!10926)

(assert (=> b!128778 (= lt!199578 (reader!0 thiss!1634 (_2!5759 lt!199580)))))

(declare-fun b!128779 () Bool)

(declare-fun res!106594 () Bool)

(assert (=> b!128779 (=> (not res!106594) (not e!85362))))

(assert (=> b!128779 (= res!106594 (= (bitIndex!0 (size!2693 (buf!3051 (_2!5759 lt!199580))) (currentByte!5812 (_2!5759 lt!199580)) (currentBit!5807 (_2!5759 lt!199580))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2693 (buf!3051 thiss!1634)) (currentByte!5812 thiss!1634) (currentBit!5807 thiss!1634)))))))

(declare-fun b!128780 () Bool)

(assert (=> b!128780 (= e!85360 true)))

(declare-fun lt!199577 () (_ BitVec 64))

(assert (=> b!128780 (= lt!199577 (bitIndex!0 (size!2693 (buf!3051 thiss!1634)) (currentByte!5812 thiss!1634) (currentBit!5807 thiss!1634)))))

(declare-fun res!106595 () Bool)

(assert (=> start!25470 (=> (not res!106595) (not e!85359))))

(assert (=> start!25470 (= res!106595 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2693 arr!237))))))

(assert (=> start!25470 e!85359))

(assert (=> start!25470 true))

(assert (=> start!25470 (array_inv!2482 arr!237)))

(declare-fun inv!12 (BitStream!4650) Bool)

(assert (=> start!25470 (and (inv!12 thiss!1634) e!85361)))

(assert (= (and start!25470 res!106595) b!128772))

(assert (= (and b!128772 res!106597) b!128774))

(assert (= (and b!128774 res!106592) b!128776))

(assert (= (and b!128776 res!106591) b!128775))

(assert (= (and b!128775 res!106593) b!128779))

(assert (= (and b!128779 res!106594) b!128773))

(assert (= (and b!128773 res!106596) b!128778))

(assert (= (and b!128775 (not res!106590)) b!128780))

(assert (= start!25470 b!128777))

(declare-fun m!194533 () Bool)

(assert (=> b!128780 m!194533))

(declare-fun m!194535 () Bool)

(assert (=> b!128777 m!194535))

(declare-fun m!194537 () Bool)

(assert (=> b!128778 m!194537))

(declare-fun m!194539 () Bool)

(assert (=> b!128778 m!194539))

(declare-fun m!194541 () Bool)

(assert (=> b!128778 m!194541))

(declare-fun m!194543 () Bool)

(assert (=> b!128779 m!194543))

(assert (=> b!128779 m!194533))

(declare-fun m!194545 () Bool)

(assert (=> b!128773 m!194545))

(declare-fun m!194547 () Bool)

(assert (=> b!128776 m!194547))

(declare-fun m!194549 () Bool)

(assert (=> start!25470 m!194549))

(declare-fun m!194551 () Bool)

(assert (=> start!25470 m!194551))

(declare-fun m!194553 () Bool)

(assert (=> b!128772 m!194553))

(assert (=> b!128775 m!194543))

(assert (=> b!128775 m!194537))

(assert (=> b!128775 m!194537))

(declare-fun m!194555 () Bool)

(assert (=> b!128775 m!194555))

(check-sat (not b!128772) (not b!128777) (not start!25470) (not b!128778) (not b!128780) (not b!128775) (not b!128776) (not b!128779) (not b!128773))
