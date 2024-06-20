; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41608 () Bool)

(assert start!41608)

(declare-fun b!195528 () Bool)

(declare-fun e!134438 () Bool)

(declare-fun e!134440 () Bool)

(assert (=> b!195528 (= e!134438 e!134440)))

(declare-fun res!163563 () Bool)

(assert (=> b!195528 (=> (not res!163563) (not e!134440))))

(declare-fun lt!303902 () (_ BitVec 64))

(declare-fun lt!303900 () (_ BitVec 64))

(assert (=> b!195528 (= res!163563 (= lt!303902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303900)))))

(declare-datatypes ((array!10045 0))(
  ( (array!10046 (arr!5360 (Array (_ BitVec 32) (_ BitVec 8))) (size!4430 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7968 0))(
  ( (BitStream!7969 (buf!4916 array!10045) (currentByte!9218 (_ BitVec 32)) (currentBit!9213 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13803 0))(
  ( (Unit!13804) )
))
(declare-datatypes ((tuple2!16908 0))(
  ( (tuple2!16909 (_1!9099 Unit!13803) (_2!9099 BitStream!7968)) )
))
(declare-fun lt!303898 () tuple2!16908)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195528 (= lt!303902 (bitIndex!0 (size!4430 (buf!4916 (_2!9099 lt!303898))) (currentByte!9218 (_2!9099 lt!303898)) (currentBit!9213 (_2!9099 lt!303898))))))

(declare-fun thiss!1204 () BitStream!7968)

(assert (=> b!195528 (= lt!303900 (bitIndex!0 (size!4430 (buf!4916 thiss!1204)) (currentByte!9218 thiss!1204) (currentBit!9213 thiss!1204)))))

(declare-fun b!195529 () Bool)

(declare-fun res!163560 () Bool)

(declare-fun e!134441 () Bool)

(assert (=> b!195529 (=> (not res!163560) (not e!134441))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!195529 (= res!163560 (not (= i!590 nBits!348)))))

(declare-fun b!195530 () Bool)

(declare-fun res!163565 () Bool)

(assert (=> b!195530 (=> (not res!163565) (not e!134440))))

(declare-fun isPrefixOf!0 (BitStream!7968 BitStream!7968) Bool)

(assert (=> b!195530 (= res!163565 (isPrefixOf!0 thiss!1204 (_2!9099 lt!303898)))))

(declare-fun b!195531 () Bool)

(declare-fun e!134437 () Bool)

(assert (=> b!195531 (= e!134440 e!134437)))

(declare-fun res!163566 () Bool)

(assert (=> b!195531 (=> (not res!163566) (not e!134437))))

(declare-fun lt!303904 () Bool)

(declare-datatypes ((tuple2!16910 0))(
  ( (tuple2!16911 (_1!9100 BitStream!7968) (_2!9100 Bool)) )
))
(declare-fun lt!303901 () tuple2!16910)

(assert (=> b!195531 (= res!163566 (and (= (_2!9100 lt!303901) lt!303904) (= (_1!9100 lt!303901) (_2!9099 lt!303898))))))

(declare-fun readBitPure!0 (BitStream!7968) tuple2!16910)

(declare-fun readerFrom!0 (BitStream!7968 (_ BitVec 32) (_ BitVec 32)) BitStream!7968)

(assert (=> b!195531 (= lt!303901 (readBitPure!0 (readerFrom!0 (_2!9099 lt!303898) (currentBit!9213 thiss!1204) (currentByte!9218 thiss!1204))))))

(declare-fun b!195532 () Bool)

(assert (=> b!195532 (= e!134441 (not true))))

(declare-fun lt!303899 () (_ BitVec 64))

(assert (=> b!195532 (= lt!303899 (bitIndex!0 (size!4430 (buf!4916 (_2!9099 lt!303898))) (currentByte!9218 (_2!9099 lt!303898)) (currentBit!9213 (_2!9099 lt!303898))))))

(declare-fun lt!303903 () (_ BitVec 64))

(assert (=> b!195532 (= lt!303903 (bitIndex!0 (size!4430 (buf!4916 thiss!1204)) (currentByte!9218 thiss!1204) (currentBit!9213 thiss!1204)))))

(assert (=> b!195532 e!134438))

(declare-fun res!163562 () Bool)

(assert (=> b!195532 (=> (not res!163562) (not e!134438))))

(assert (=> b!195532 (= res!163562 (= (size!4430 (buf!4916 thiss!1204)) (size!4430 (buf!4916 (_2!9099 lt!303898)))))))

(declare-fun appendBit!0 (BitStream!7968 Bool) tuple2!16908)

(assert (=> b!195532 (= lt!303898 (appendBit!0 thiss!1204 lt!303904))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!195532 (= lt!303904 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195533 () Bool)

(declare-fun res!163564 () Bool)

(assert (=> b!195533 (=> (not res!163564) (not e!134441))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195533 (= res!163564 (invariant!0 (currentBit!9213 thiss!1204) (currentByte!9218 thiss!1204) (size!4430 (buf!4916 thiss!1204))))))

(declare-fun b!195534 () Bool)

(declare-fun res!163561 () Bool)

(assert (=> b!195534 (=> (not res!163561) (not e!134441))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195534 (= res!163561 (validate_offset_bits!1 ((_ sign_extend 32) (size!4430 (buf!4916 thiss!1204))) ((_ sign_extend 32) (currentByte!9218 thiss!1204)) ((_ sign_extend 32) (currentBit!9213 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!163559 () Bool)

(assert (=> start!41608 (=> (not res!163559) (not e!134441))))

(assert (=> start!41608 (= res!163559 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41608 e!134441))

(assert (=> start!41608 true))

(declare-fun e!134439 () Bool)

(declare-fun inv!12 (BitStream!7968) Bool)

(assert (=> start!41608 (and (inv!12 thiss!1204) e!134439)))

(declare-fun b!195535 () Bool)

(assert (=> b!195535 (= e!134437 (= (bitIndex!0 (size!4430 (buf!4916 (_1!9100 lt!303901))) (currentByte!9218 (_1!9100 lt!303901)) (currentBit!9213 (_1!9100 lt!303901))) lt!303902))))

(declare-fun b!195536 () Bool)

(declare-fun array_inv!4171 (array!10045) Bool)

(assert (=> b!195536 (= e!134439 (array_inv!4171 (buf!4916 thiss!1204)))))

(assert (= (and start!41608 res!163559) b!195534))

(assert (= (and b!195534 res!163561) b!195533))

(assert (= (and b!195533 res!163564) b!195529))

(assert (= (and b!195529 res!163560) b!195532))

(assert (= (and b!195532 res!163562) b!195528))

(assert (= (and b!195528 res!163563) b!195530))

(assert (= (and b!195530 res!163565) b!195531))

(assert (= (and b!195531 res!163566) b!195535))

(assert (= start!41608 b!195536))

(declare-fun m!302715 () Bool)

(assert (=> b!195530 m!302715))

(declare-fun m!302717 () Bool)

(assert (=> b!195531 m!302717))

(assert (=> b!195531 m!302717))

(declare-fun m!302719 () Bool)

(assert (=> b!195531 m!302719))

(declare-fun m!302721 () Bool)

(assert (=> start!41608 m!302721))

(declare-fun m!302723 () Bool)

(assert (=> b!195535 m!302723))

(declare-fun m!302725 () Bool)

(assert (=> b!195528 m!302725))

(declare-fun m!302727 () Bool)

(assert (=> b!195528 m!302727))

(declare-fun m!302729 () Bool)

(assert (=> b!195536 m!302729))

(declare-fun m!302731 () Bool)

(assert (=> b!195533 m!302731))

(declare-fun m!302733 () Bool)

(assert (=> b!195534 m!302733))

(assert (=> b!195532 m!302725))

(assert (=> b!195532 m!302727))

(declare-fun m!302735 () Bool)

(assert (=> b!195532 m!302735))

(check-sat (not b!195530) (not start!41608) (not b!195533) (not b!195535) (not b!195536) (not b!195532) (not b!195531) (not b!195534) (not b!195528))
