; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25474 () Bool)

(assert start!25474)

(declare-fun b!128826 () Bool)

(declare-fun e!85398 () Bool)

(assert (=> b!128826 (= e!85398 true)))

(declare-fun lt!199601 () (_ BitVec 64))

(declare-datatypes ((array!5959 0))(
  ( (array!5960 (arr!3312 (Array (_ BitVec 32) (_ BitVec 8))) (size!2695 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4654 0))(
  ( (BitStream!4655 (buf!3053 array!5959) (currentByte!5814 (_ BitVec 32)) (currentBit!5809 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4654)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128826 (= lt!199601 (bitIndex!0 (size!2695 (buf!3053 thiss!1634)) (currentByte!5814 thiss!1634) (currentBit!5809 thiss!1634)))))

(declare-fun b!128827 () Bool)

(declare-fun e!85395 () Bool)

(assert (=> b!128827 (= e!85395 (not e!85398))))

(declare-fun res!106645 () Bool)

(assert (=> b!128827 (=> res!106645 e!85398)))

(declare-datatypes ((Unit!7995 0))(
  ( (Unit!7996) )
))
(declare-datatypes ((tuple2!10936 0))(
  ( (tuple2!10937 (_1!5765 Unit!7995) (_2!5765 BitStream!4654)) )
))
(declare-fun lt!199603 () tuple2!10936)

(assert (=> b!128827 (= res!106645 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2695 (buf!3053 (_2!5765 lt!199603))) (currentByte!5814 (_2!5765 lt!199603)) (currentBit!5809 (_2!5765 lt!199603)))))))

(declare-fun e!85400 () Bool)

(assert (=> b!128827 e!85400))

(declare-fun res!106644 () Bool)

(assert (=> b!128827 (=> (not res!106644) (not e!85400))))

(assert (=> b!128827 (= res!106644 (= (size!2695 (buf!3053 thiss!1634)) (size!2695 (buf!3053 (_2!5765 lt!199603)))))))

(declare-fun arr!237 () array!5959)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByte!0 (BitStream!4654 (_ BitVec 8)) tuple2!10936)

(assert (=> b!128827 (= lt!199603 (appendByte!0 thiss!1634 (select (arr!3312 arr!237) from!447)))))

(declare-fun b!128828 () Bool)

(declare-fun e!85396 () Bool)

(declare-fun array_inv!2484 (array!5959) Bool)

(assert (=> b!128828 (= e!85396 (array_inv!2484 (buf!3053 thiss!1634)))))

(declare-fun b!128829 () Bool)

(declare-fun res!106638 () Bool)

(assert (=> b!128829 (=> (not res!106638) (not e!85395))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128829 (= res!106638 (bvslt from!447 to!404))))

(declare-fun b!128830 () Bool)

(declare-fun res!106640 () Bool)

(assert (=> b!128830 (=> (not res!106640) (not e!85395))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128830 (= res!106640 (invariant!0 (currentBit!5809 thiss!1634) (currentByte!5814 thiss!1634) (size!2695 (buf!3053 thiss!1634))))))

(declare-fun b!128831 () Bool)

(declare-fun res!106639 () Bool)

(assert (=> b!128831 (=> (not res!106639) (not e!85395))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128831 (= res!106639 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2695 (buf!3053 thiss!1634))) ((_ sign_extend 32) (currentByte!5814 thiss!1634)) ((_ sign_extend 32) (currentBit!5809 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128832 () Bool)

(declare-datatypes ((tuple2!10938 0))(
  ( (tuple2!10939 (_1!5766 BitStream!4654) (_2!5766 BitStream!4654)) )
))
(declare-fun lt!199602 () tuple2!10938)

(declare-datatypes ((tuple2!10940 0))(
  ( (tuple2!10941 (_1!5767 BitStream!4654) (_2!5767 (_ BitVec 8))) )
))
(declare-fun lt!199604 () tuple2!10940)

(assert (=> b!128832 (= e!85400 (and (= (_2!5767 lt!199604) (select (arr!3312 arr!237) from!447)) (= (_1!5767 lt!199604) (_2!5766 lt!199602))))))

(declare-fun readBytePure!0 (BitStream!4654) tuple2!10940)

(assert (=> b!128832 (= lt!199604 (readBytePure!0 (_1!5766 lt!199602)))))

(declare-fun reader!0 (BitStream!4654 BitStream!4654) tuple2!10938)

(assert (=> b!128832 (= lt!199602 (reader!0 thiss!1634 (_2!5765 lt!199603)))))

(declare-fun b!128834 () Bool)

(declare-fun res!106641 () Bool)

(assert (=> b!128834 (=> (not res!106641) (not e!85400))))

(declare-fun isPrefixOf!0 (BitStream!4654 BitStream!4654) Bool)

(assert (=> b!128834 (= res!106641 (isPrefixOf!0 thiss!1634 (_2!5765 lt!199603)))))

(declare-fun b!128833 () Bool)

(declare-fun res!106642 () Bool)

(assert (=> b!128833 (=> (not res!106642) (not e!85400))))

(assert (=> b!128833 (= res!106642 (= (bitIndex!0 (size!2695 (buf!3053 (_2!5765 lt!199603))) (currentByte!5814 (_2!5765 lt!199603)) (currentBit!5809 (_2!5765 lt!199603))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2695 (buf!3053 thiss!1634)) (currentByte!5814 thiss!1634) (currentBit!5809 thiss!1634)))))))

(declare-fun res!106643 () Bool)

(assert (=> start!25474 (=> (not res!106643) (not e!85395))))

(assert (=> start!25474 (= res!106643 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2695 arr!237))))))

(assert (=> start!25474 e!85395))

(assert (=> start!25474 true))

(assert (=> start!25474 (array_inv!2484 arr!237)))

(declare-fun inv!12 (BitStream!4654) Bool)

(assert (=> start!25474 (and (inv!12 thiss!1634) e!85396)))

(assert (= (and start!25474 res!106643) b!128831))

(assert (= (and b!128831 res!106639) b!128829))

(assert (= (and b!128829 res!106638) b!128830))

(assert (= (and b!128830 res!106640) b!128827))

(assert (= (and b!128827 res!106644) b!128833))

(assert (= (and b!128833 res!106642) b!128834))

(assert (= (and b!128834 res!106641) b!128832))

(assert (= (and b!128827 (not res!106645)) b!128826))

(assert (= start!25474 b!128828))

(declare-fun m!194581 () Bool)

(assert (=> start!25474 m!194581))

(declare-fun m!194583 () Bool)

(assert (=> start!25474 m!194583))

(declare-fun m!194585 () Bool)

(assert (=> b!128831 m!194585))

(declare-fun m!194587 () Bool)

(assert (=> b!128827 m!194587))

(declare-fun m!194589 () Bool)

(assert (=> b!128827 m!194589))

(assert (=> b!128827 m!194589))

(declare-fun m!194591 () Bool)

(assert (=> b!128827 m!194591))

(assert (=> b!128832 m!194589))

(declare-fun m!194593 () Bool)

(assert (=> b!128832 m!194593))

(declare-fun m!194595 () Bool)

(assert (=> b!128832 m!194595))

(declare-fun m!194597 () Bool)

(assert (=> b!128834 m!194597))

(declare-fun m!194599 () Bool)

(assert (=> b!128826 m!194599))

(declare-fun m!194601 () Bool)

(assert (=> b!128830 m!194601))

(assert (=> b!128833 m!194587))

(assert (=> b!128833 m!194599))

(declare-fun m!194603 () Bool)

(assert (=> b!128828 m!194603))

(push 1)

(assert (not b!128827))

(assert (not b!128833))

(assert (not b!128832))

(assert (not start!25474))

(assert (not b!128834))

(assert (not b!128826))

(assert (not b!128830))

(assert (not b!128831))

(assert (not b!128828))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

