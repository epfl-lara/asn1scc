; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58232 () Bool)

(assert start!58232)

(declare-fun b!267455 () Bool)

(declare-fun e!187317 () Bool)

(declare-datatypes ((array!14890 0))(
  ( (array!14891 (arr!7478 (Array (_ BitVec 32) (_ BitVec 8))) (size!6491 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11796 0))(
  ( (BitStream!11797 (buf!6959 array!14890) (currentByte!12865 (_ BitVec 32)) (currentBit!12860 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11796)

(declare-fun array_inv!6215 (array!14890) Bool)

(assert (=> b!267455 (= e!187317 (array_inv!6215 (buf!6959 w3!25)))))

(declare-fun b!267452 () Bool)

(declare-fun e!187315 () Bool)

(assert (=> b!267452 (= e!187315 false)))

(declare-fun lt!407990 () Bool)

(declare-fun w2!587 () BitStream!11796)

(declare-fun isPrefixOf!0 (BitStream!11796 BitStream!11796) Bool)

(assert (=> b!267452 (= lt!407990 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267454 () Bool)

(declare-fun e!187311 () Bool)

(assert (=> b!267454 (= e!187311 (array_inv!6215 (buf!6959 w2!587)))))

(declare-fun b!267453 () Bool)

(declare-fun e!187312 () Bool)

(declare-fun w1!591 () BitStream!11796)

(assert (=> b!267453 (= e!187312 (array_inv!6215 (buf!6959 w1!591)))))

(declare-fun res!223291 () Bool)

(assert (=> start!58232 (=> (not res!223291) (not e!187315))))

(assert (=> start!58232 (= res!223291 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58232 e!187315))

(declare-fun inv!12 (BitStream!11796) Bool)

(assert (=> start!58232 (and (inv!12 w1!591) e!187312)))

(assert (=> start!58232 (and (inv!12 w2!587) e!187311)))

(assert (=> start!58232 (and (inv!12 w3!25) e!187317)))

(assert (= (and start!58232 res!223291) b!267452))

(assert (= start!58232 b!267453))

(assert (= start!58232 b!267454))

(assert (= start!58232 b!267455))

(declare-fun m!398649 () Bool)

(assert (=> start!58232 m!398649))

(declare-fun m!398651 () Bool)

(assert (=> start!58232 m!398651))

(declare-fun m!398653 () Bool)

(assert (=> start!58232 m!398653))

(declare-fun m!398655 () Bool)

(assert (=> start!58232 m!398655))

(declare-fun m!398657 () Bool)

(assert (=> b!267453 m!398657))

(declare-fun m!398659 () Bool)

(assert (=> b!267455 m!398659))

(declare-fun m!398661 () Bool)

(assert (=> b!267452 m!398661))

(declare-fun m!398663 () Bool)

(assert (=> b!267454 m!398663))

(check-sat (not b!267454) (not start!58232) (not b!267453) (not b!267455) (not b!267452))
