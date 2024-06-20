; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25464 () Bool)

(assert start!25464)

(declare-fun b!128691 () Bool)

(declare-fun res!106519 () Bool)

(declare-fun e!85309 () Bool)

(assert (=> b!128691 (=> (not res!106519) (not e!85309))))

(declare-datatypes ((array!5949 0))(
  ( (array!5950 (arr!3307 (Array (_ BitVec 32) (_ BitVec 8))) (size!2690 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4644 0))(
  ( (BitStream!4645 (buf!3048 array!5949) (currentByte!5809 (_ BitVec 32)) (currentBit!5804 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4644)

(declare-datatypes ((Unit!7985 0))(
  ( (Unit!7986) )
))
(declare-datatypes ((tuple2!10906 0))(
  ( (tuple2!10907 (_1!5750 Unit!7985) (_2!5750 BitStream!4644)) )
))
(declare-fun lt!199544 () tuple2!10906)

(declare-fun isPrefixOf!0 (BitStream!4644 BitStream!4644) Bool)

(assert (=> b!128691 (= res!106519 (isPrefixOf!0 thiss!1634 (_2!5750 lt!199544)))))

(declare-fun b!128692 () Bool)

(declare-fun e!85310 () Bool)

(declare-fun e!85305 () Bool)

(assert (=> b!128692 (= e!85310 (not e!85305))))

(declare-fun res!106524 () Bool)

(assert (=> b!128692 (=> res!106524 e!85305)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128692 (= res!106524 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2690 (buf!3048 (_2!5750 lt!199544))) (currentByte!5809 (_2!5750 lt!199544)) (currentBit!5804 (_2!5750 lt!199544)))))))

(assert (=> b!128692 e!85309))

(declare-fun res!106525 () Bool)

(assert (=> b!128692 (=> (not res!106525) (not e!85309))))

(assert (=> b!128692 (= res!106525 (= (size!2690 (buf!3048 thiss!1634)) (size!2690 (buf!3048 (_2!5750 lt!199544)))))))

(declare-fun arr!237 () array!5949)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByte!0 (BitStream!4644 (_ BitVec 8)) tuple2!10906)

(assert (=> b!128692 (= lt!199544 (appendByte!0 thiss!1634 (select (arr!3307 arr!237) from!447)))))

(declare-fun b!128693 () Bool)

(declare-fun e!85306 () Bool)

(declare-fun array_inv!2479 (array!5949) Bool)

(assert (=> b!128693 (= e!85306 (array_inv!2479 (buf!3048 thiss!1634)))))

(declare-fun b!128694 () Bool)

(declare-datatypes ((tuple2!10908 0))(
  ( (tuple2!10909 (_1!5751 BitStream!4644) (_2!5751 BitStream!4644)) )
))
(declare-fun lt!199542 () tuple2!10908)

(declare-datatypes ((tuple2!10910 0))(
  ( (tuple2!10911 (_1!5752 BitStream!4644) (_2!5752 (_ BitVec 8))) )
))
(declare-fun lt!199541 () tuple2!10910)

(assert (=> b!128694 (= e!85309 (and (= (_2!5752 lt!199541) (select (arr!3307 arr!237) from!447)) (= (_1!5752 lt!199541) (_2!5751 lt!199542))))))

(declare-fun readBytePure!0 (BitStream!4644) tuple2!10910)

(assert (=> b!128694 (= lt!199541 (readBytePure!0 (_1!5751 lt!199542)))))

(declare-fun reader!0 (BitStream!4644 BitStream!4644) tuple2!10908)

(assert (=> b!128694 (= lt!199542 (reader!0 thiss!1634 (_2!5750 lt!199544)))))

(declare-fun b!128695 () Bool)

(declare-fun res!106523 () Bool)

(assert (=> b!128695 (=> (not res!106523) (not e!85310))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128695 (= res!106523 (bvslt from!447 to!404))))

(declare-fun b!128696 () Bool)

(declare-fun res!106520 () Bool)

(assert (=> b!128696 (=> (not res!106520) (not e!85310))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128696 (= res!106520 (invariant!0 (currentBit!5804 thiss!1634) (currentByte!5809 thiss!1634) (size!2690 (buf!3048 thiss!1634))))))

(declare-fun b!128697 () Bool)

(assert (=> b!128697 (= e!85305 true)))

(declare-fun lt!199543 () (_ BitVec 64))

(assert (=> b!128697 (= lt!199543 (bitIndex!0 (size!2690 (buf!3048 thiss!1634)) (currentByte!5809 thiss!1634) (currentBit!5804 thiss!1634)))))

(declare-fun res!106518 () Bool)

(assert (=> start!25464 (=> (not res!106518) (not e!85310))))

(assert (=> start!25464 (= res!106518 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2690 arr!237))))))

(assert (=> start!25464 e!85310))

(assert (=> start!25464 true))

(assert (=> start!25464 (array_inv!2479 arr!237)))

(declare-fun inv!12 (BitStream!4644) Bool)

(assert (=> start!25464 (and (inv!12 thiss!1634) e!85306)))

(declare-fun b!128698 () Bool)

(declare-fun res!106521 () Bool)

(assert (=> b!128698 (=> (not res!106521) (not e!85309))))

(assert (=> b!128698 (= res!106521 (= (bitIndex!0 (size!2690 (buf!3048 (_2!5750 lt!199544))) (currentByte!5809 (_2!5750 lt!199544)) (currentBit!5804 (_2!5750 lt!199544))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2690 (buf!3048 thiss!1634)) (currentByte!5809 thiss!1634) (currentBit!5804 thiss!1634)))))))

(declare-fun b!128699 () Bool)

(declare-fun res!106522 () Bool)

(assert (=> b!128699 (=> (not res!106522) (not e!85310))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128699 (= res!106522 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2690 (buf!3048 thiss!1634))) ((_ sign_extend 32) (currentByte!5809 thiss!1634)) ((_ sign_extend 32) (currentBit!5804 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!25464 res!106518) b!128699))

(assert (= (and b!128699 res!106522) b!128695))

(assert (= (and b!128695 res!106523) b!128696))

(assert (= (and b!128696 res!106520) b!128692))

(assert (= (and b!128692 res!106525) b!128698))

(assert (= (and b!128698 res!106521) b!128691))

(assert (= (and b!128691 res!106519) b!128694))

(assert (= (and b!128692 (not res!106524)) b!128697))

(assert (= start!25464 b!128693))

(declare-fun m!194461 () Bool)

(assert (=> start!25464 m!194461))

(declare-fun m!194463 () Bool)

(assert (=> start!25464 m!194463))

(declare-fun m!194465 () Bool)

(assert (=> b!128698 m!194465))

(declare-fun m!194467 () Bool)

(assert (=> b!128698 m!194467))

(declare-fun m!194469 () Bool)

(assert (=> b!128694 m!194469))

(declare-fun m!194471 () Bool)

(assert (=> b!128694 m!194471))

(declare-fun m!194473 () Bool)

(assert (=> b!128694 m!194473))

(assert (=> b!128697 m!194467))

(assert (=> b!128692 m!194465))

(assert (=> b!128692 m!194469))

(assert (=> b!128692 m!194469))

(declare-fun m!194475 () Bool)

(assert (=> b!128692 m!194475))

(declare-fun m!194477 () Bool)

(assert (=> b!128693 m!194477))

(declare-fun m!194479 () Bool)

(assert (=> b!128691 m!194479))

(declare-fun m!194481 () Bool)

(assert (=> b!128696 m!194481))

(declare-fun m!194483 () Bool)

(assert (=> b!128699 m!194483))

(check-sat (not b!128691) (not b!128692) (not b!128698) (not b!128693) (not b!128697) (not b!128699) (not start!25464) (not b!128694) (not b!128696))
