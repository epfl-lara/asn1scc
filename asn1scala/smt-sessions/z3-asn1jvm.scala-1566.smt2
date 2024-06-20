; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44204 () Bool)

(assert start!44204)

(declare-fun b!210603 () Bool)

(declare-fun res!176838 () Bool)

(declare-fun e!143674 () Bool)

(assert (=> b!210603 (=> (not res!176838) (not e!143674))))

(declare-datatypes ((array!10492 0))(
  ( (array!10493 (arr!5540 (Array (_ BitVec 32) (_ BitVec 8))) (size!4610 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8328 0))(
  ( (BitStream!8329 (buf!5130 array!10492) (currentByte!9678 (_ BitVec 32)) (currentBit!9673 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8328)

(declare-datatypes ((Unit!15009 0))(
  ( (Unit!15010) )
))
(declare-datatypes ((tuple2!18046 0))(
  ( (tuple2!18047 (_1!9678 Unit!15009) (_2!9678 BitStream!8328)) )
))
(declare-fun lt!330745 () tuple2!18046)

(declare-fun isPrefixOf!0 (BitStream!8328 BitStream!8328) Bool)

(assert (=> b!210603 (= res!176838 (isPrefixOf!0 thiss!1204 (_2!9678 lt!330745)))))

(declare-datatypes ((tuple2!18048 0))(
  ( (tuple2!18049 (_1!9679 BitStream!8328) (_2!9679 BitStream!8328)) )
))
(declare-fun lt!330740 () tuple2!18048)

(declare-fun e!143673 () Bool)

(declare-fun lt!330737 () (_ BitVec 64))

(declare-fun lt!330754 () (_ BitVec 64))

(declare-fun b!210604 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!8328 (_ BitVec 64)) BitStream!8328)

(assert (=> b!210604 (= e!143673 (= (_1!9679 lt!330740) (withMovedBitIndex!0 (_2!9679 lt!330740) (bvsub lt!330754 lt!330737))))))

(declare-fun b!210605 () Bool)

(declare-fun res!176836 () Bool)

(declare-fun e!143670 () Bool)

(assert (=> b!210605 (=> res!176836 e!143670)))

(assert (=> b!210605 (= res!176836 (not (isPrefixOf!0 thiss!1204 (_2!9678 lt!330745))))))

(declare-fun b!210606 () Bool)

(declare-fun e!143669 () Bool)

(declare-fun array_inv!4351 (array!10492) Bool)

(assert (=> b!210606 (= e!143669 (array_inv!4351 (buf!5130 thiss!1204)))))

(declare-fun b!210607 () Bool)

(declare-fun res!176829 () Bool)

(declare-fun e!143668 () Bool)

(assert (=> b!210607 (=> (not res!176829) (not e!143668))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!210607 (= res!176829 (not (= i!590 nBits!348)))))

(declare-fun b!210608 () Bool)

(declare-fun e!143671 () Bool)

(assert (=> b!210608 (= e!143671 e!143668)))

(declare-fun res!176831 () Bool)

(assert (=> b!210608 (=> (not res!176831) (not e!143668))))

(declare-fun lt!330734 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210608 (= res!176831 (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 thiss!1204))) ((_ sign_extend 32) (currentByte!9678 thiss!1204)) ((_ sign_extend 32) (currentBit!9673 thiss!1204)) lt!330734))))

(assert (=> b!210608 (= lt!330734 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!210609 () Bool)

(declare-fun res!176840 () Bool)

(assert (=> b!210609 (=> (not res!176840) (not e!143668))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!210609 (= res!176840 (invariant!0 (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204) (size!4610 (buf!5130 thiss!1204))))))

(declare-fun b!210610 () Bool)

(declare-fun res!176846 () Bool)

(assert (=> b!210610 (=> res!176846 e!143670)))

(declare-fun lt!330753 () tuple2!18046)

(assert (=> b!210610 (= res!176846 (not (isPrefixOf!0 (_2!9678 lt!330745) (_2!9678 lt!330753))))))

(declare-fun b!210611 () Bool)

(declare-fun e!143677 () Bool)

(assert (=> b!210611 (= e!143677 e!143670)))

(declare-fun res!176841 () Bool)

(assert (=> b!210611 (=> res!176841 e!143670)))

(declare-fun lt!330749 () (_ BitVec 64))

(assert (=> b!210611 (= res!176841 (not (= lt!330737 (bvsub (bvsub (bvadd lt!330749 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210611 (= lt!330737 (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330753))) (currentByte!9678 (_2!9678 lt!330753)) (currentBit!9673 (_2!9678 lt!330753))))))

(assert (=> b!210611 (isPrefixOf!0 thiss!1204 (_2!9678 lt!330753))))

(declare-fun lt!330731 () Unit!15009)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8328 BitStream!8328 BitStream!8328) Unit!15009)

(assert (=> b!210611 (= lt!330731 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9678 lt!330745) (_2!9678 lt!330753)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8328 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18046)

(assert (=> b!210611 (= lt!330753 (appendBitsLSBFirstLoopTR!0 (_2!9678 lt!330745) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!176834 () Bool)

(assert (=> start!44204 (=> (not res!176834) (not e!143671))))

(assert (=> start!44204 (= res!176834 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44204 e!143671))

(assert (=> start!44204 true))

(declare-fun inv!12 (BitStream!8328) Bool)

(assert (=> start!44204 (and (inv!12 thiss!1204) e!143669)))

(declare-fun lt!330755 () (_ BitVec 64))

(declare-fun b!210612 () Bool)

(declare-fun e!143675 () Bool)

(assert (=> b!210612 (= e!143675 (or (= lt!330755 (bvand lt!330737 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!330755 (bvand (bvsub lt!330749 lt!330737) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210612 (= lt!330755 (bvand lt!330749 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!210612 e!143673))

(declare-fun res!176830 () Bool)

(assert (=> b!210612 (=> (not res!176830) (not e!143673))))

(declare-datatypes ((tuple2!18050 0))(
  ( (tuple2!18051 (_1!9680 BitStream!8328) (_2!9680 (_ BitVec 64))) )
))
(declare-fun lt!330738 () tuple2!18050)

(declare-fun lt!330739 () tuple2!18050)

(assert (=> b!210612 (= res!176830 (and (= (_2!9680 lt!330738) (_2!9680 lt!330739)) (= (_1!9680 lt!330738) (_1!9680 lt!330739))))))

(declare-fun lt!330744 () Unit!15009)

(declare-fun lt!330750 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15009)

(assert (=> b!210612 (= lt!330744 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9679 lt!330740) nBits!348 i!590 lt!330750))))

(declare-fun lt!330743 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18050)

(assert (=> b!210612 (= lt!330739 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9679 lt!330740) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330743))))

(declare-fun b!210613 () Bool)

(declare-fun e!143667 () Bool)

(assert (=> b!210613 (= e!143674 e!143667)))

(declare-fun res!176839 () Bool)

(assert (=> b!210613 (=> (not res!176839) (not e!143667))))

(declare-fun lt!330728 () Bool)

(declare-datatypes ((tuple2!18052 0))(
  ( (tuple2!18053 (_1!9681 BitStream!8328) (_2!9681 Bool)) )
))
(declare-fun lt!330736 () tuple2!18052)

(assert (=> b!210613 (= res!176839 (and (= (_2!9681 lt!330736) lt!330728) (= (_1!9681 lt!330736) (_2!9678 lt!330745))))))

(declare-fun readBitPure!0 (BitStream!8328) tuple2!18052)

(declare-fun readerFrom!0 (BitStream!8328 (_ BitVec 32) (_ BitVec 32)) BitStream!8328)

(assert (=> b!210613 (= lt!330736 (readBitPure!0 (readerFrom!0 (_2!9678 lt!330745) (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204))))))

(declare-fun b!210614 () Bool)

(declare-fun e!143679 () Bool)

(assert (=> b!210614 (= e!143679 (invariant!0 (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204) (size!4610 (buf!5130 (_2!9678 lt!330753)))))))

(declare-fun b!210615 () Bool)

(declare-fun res!176833 () Bool)

(assert (=> b!210615 (=> res!176833 e!143670)))

(assert (=> b!210615 (= res!176833 (not (invariant!0 (currentBit!9673 (_2!9678 lt!330753)) (currentByte!9678 (_2!9678 lt!330753)) (size!4610 (buf!5130 (_2!9678 lt!330753))))))))

(declare-fun b!210616 () Bool)

(assert (=> b!210616 (= e!143670 e!143675)))

(declare-fun res!176835 () Bool)

(assert (=> b!210616 (=> res!176835 e!143675)))

(declare-fun lt!330751 () tuple2!18048)

(assert (=> b!210616 (= res!176835 (not (= (_1!9680 (readNBitsLSBFirstsLoopPure!0 (_1!9679 lt!330751) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330743)) (_2!9679 lt!330751))))))

(declare-fun lt!330746 () (_ BitVec 64))

(assert (=> b!210616 (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330745))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330745))) lt!330746)))

(declare-fun lt!330732 () Unit!15009)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8328 array!10492 (_ BitVec 64)) Unit!15009)

(assert (=> b!210616 (= lt!330732 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9678 lt!330745) (buf!5130 (_2!9678 lt!330753)) lt!330746))))

(assert (=> b!210616 (= lt!330746 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!330741 () tuple2!18052)

(declare-fun lt!330742 () (_ BitVec 64))

(assert (=> b!210616 (= lt!330743 (bvor lt!330750 (ite (_2!9681 lt!330741) lt!330742 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210616 (= lt!330738 (readNBitsLSBFirstsLoopPure!0 (_1!9679 lt!330740) nBits!348 i!590 lt!330750))))

(assert (=> b!210616 (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))) ((_ sign_extend 32) (currentByte!9678 thiss!1204)) ((_ sign_extend 32) (currentBit!9673 thiss!1204)) lt!330734)))

(declare-fun lt!330730 () Unit!15009)

(assert (=> b!210616 (= lt!330730 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5130 (_2!9678 lt!330753)) lt!330734))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210616 (= lt!330750 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!210616 (= (_2!9681 lt!330741) lt!330728)))

(assert (=> b!210616 (= lt!330741 (readBitPure!0 (_1!9679 lt!330740)))))

(declare-fun reader!0 (BitStream!8328 BitStream!8328) tuple2!18048)

(assert (=> b!210616 (= lt!330751 (reader!0 (_2!9678 lt!330745) (_2!9678 lt!330753)))))

(assert (=> b!210616 (= lt!330740 (reader!0 thiss!1204 (_2!9678 lt!330753)))))

(declare-fun e!143676 () Bool)

(assert (=> b!210616 e!143676))

(declare-fun res!176842 () Bool)

(assert (=> b!210616 (=> (not res!176842) (not e!143676))))

(declare-fun lt!330748 () tuple2!18052)

(declare-fun lt!330729 () tuple2!18052)

(assert (=> b!210616 (= res!176842 (= (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!330748))) (currentByte!9678 (_1!9681 lt!330748)) (currentBit!9673 (_1!9681 lt!330748))) (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!330729))) (currentByte!9678 (_1!9681 lt!330729)) (currentBit!9673 (_1!9681 lt!330729)))))))

(declare-fun lt!330735 () Unit!15009)

(declare-fun lt!330747 () BitStream!8328)

(declare-fun readBitPrefixLemma!0 (BitStream!8328 BitStream!8328) Unit!15009)

(assert (=> b!210616 (= lt!330735 (readBitPrefixLemma!0 lt!330747 (_2!9678 lt!330753)))))

(assert (=> b!210616 (= lt!330729 (readBitPure!0 (BitStream!8329 (buf!5130 (_2!9678 lt!330753)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204))))))

(assert (=> b!210616 (= lt!330748 (readBitPure!0 lt!330747))))

(assert (=> b!210616 e!143679))

(declare-fun res!176845 () Bool)

(assert (=> b!210616 (=> (not res!176845) (not e!143679))))

(assert (=> b!210616 (= res!176845 (invariant!0 (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204) (size!4610 (buf!5130 (_2!9678 lt!330745)))))))

(assert (=> b!210616 (= lt!330747 (BitStream!8329 (buf!5130 (_2!9678 lt!330745)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)))))

(declare-fun b!210617 () Bool)

(assert (=> b!210617 (= e!143668 (not e!143677))))

(declare-fun res!176843 () Bool)

(assert (=> b!210617 (=> res!176843 e!143677)))

(assert (=> b!210617 (= res!176843 (not (= lt!330749 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!330754))))))

(assert (=> b!210617 (= lt!330749 (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))))))

(assert (=> b!210617 (= lt!330754 (bitIndex!0 (size!4610 (buf!5130 thiss!1204)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)))))

(declare-fun e!143672 () Bool)

(assert (=> b!210617 e!143672))

(declare-fun res!176844 () Bool)

(assert (=> b!210617 (=> (not res!176844) (not e!143672))))

(assert (=> b!210617 (= res!176844 (= (size!4610 (buf!5130 thiss!1204)) (size!4610 (buf!5130 (_2!9678 lt!330745)))))))

(declare-fun appendBit!0 (BitStream!8328 Bool) tuple2!18046)

(assert (=> b!210617 (= lt!330745 (appendBit!0 thiss!1204 lt!330728))))

(assert (=> b!210617 (= lt!330728 (not (= (bvand v!189 lt!330742) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210617 (= lt!330742 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!210618 () Bool)

(assert (=> b!210618 (= e!143672 e!143674)))

(declare-fun res!176837 () Bool)

(assert (=> b!210618 (=> (not res!176837) (not e!143674))))

(declare-fun lt!330752 () (_ BitVec 64))

(declare-fun lt!330733 () (_ BitVec 64))

(assert (=> b!210618 (= res!176837 (= lt!330752 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!330733)))))

(assert (=> b!210618 (= lt!330752 (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))))))

(assert (=> b!210618 (= lt!330733 (bitIndex!0 (size!4610 (buf!5130 thiss!1204)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)))))

(declare-fun b!210619 () Bool)

(declare-fun res!176832 () Bool)

(assert (=> b!210619 (=> res!176832 e!143670)))

(assert (=> b!210619 (= res!176832 (or (not (= (size!4610 (buf!5130 (_2!9678 lt!330753))) (size!4610 (buf!5130 thiss!1204)))) (not (= lt!330737 (bvsub (bvadd lt!330754 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!210620 () Bool)

(assert (=> b!210620 (= e!143667 (= (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!330736))) (currentByte!9678 (_1!9681 lt!330736)) (currentBit!9673 (_1!9681 lt!330736))) lt!330752))))

(declare-fun b!210621 () Bool)

(assert (=> b!210621 (= e!143676 (= (_2!9681 lt!330748) (_2!9681 lt!330729)))))

(assert (= (and start!44204 res!176834) b!210608))

(assert (= (and b!210608 res!176831) b!210609))

(assert (= (and b!210609 res!176840) b!210607))

(assert (= (and b!210607 res!176829) b!210617))

(assert (= (and b!210617 res!176844) b!210618))

(assert (= (and b!210618 res!176837) b!210603))

(assert (= (and b!210603 res!176838) b!210613))

(assert (= (and b!210613 res!176839) b!210620))

(assert (= (and b!210617 (not res!176843)) b!210611))

(assert (= (and b!210611 (not res!176841)) b!210615))

(assert (= (and b!210615 (not res!176833)) b!210619))

(assert (= (and b!210619 (not res!176832)) b!210610))

(assert (= (and b!210610 (not res!176846)) b!210605))

(assert (= (and b!210605 (not res!176836)) b!210616))

(assert (= (and b!210616 res!176845) b!210614))

(assert (= (and b!210616 res!176842) b!210621))

(assert (= (and b!210616 (not res!176835)) b!210612))

(assert (= (and b!210612 res!176830) b!210604))

(assert (= start!44204 b!210606))

(declare-fun m!324313 () Bool)

(assert (=> b!210615 m!324313))

(declare-fun m!324315 () Bool)

(assert (=> b!210609 m!324315))

(declare-fun m!324317 () Bool)

(assert (=> b!210606 m!324317))

(declare-fun m!324319 () Bool)

(assert (=> b!210611 m!324319))

(declare-fun m!324321 () Bool)

(assert (=> b!210611 m!324321))

(declare-fun m!324323 () Bool)

(assert (=> b!210611 m!324323))

(declare-fun m!324325 () Bool)

(assert (=> b!210611 m!324325))

(declare-fun m!324327 () Bool)

(assert (=> b!210610 m!324327))

(declare-fun m!324329 () Bool)

(assert (=> b!210612 m!324329))

(declare-fun m!324331 () Bool)

(assert (=> b!210612 m!324331))

(assert (=> b!210612 m!324331))

(declare-fun m!324333 () Bool)

(assert (=> b!210612 m!324333))

(declare-fun m!324335 () Bool)

(assert (=> b!210617 m!324335))

(declare-fun m!324337 () Bool)

(assert (=> b!210617 m!324337))

(declare-fun m!324339 () Bool)

(assert (=> b!210617 m!324339))

(declare-fun m!324341 () Bool)

(assert (=> b!210616 m!324341))

(declare-fun m!324343 () Bool)

(assert (=> b!210616 m!324343))

(declare-fun m!324345 () Bool)

(assert (=> b!210616 m!324345))

(declare-fun m!324347 () Bool)

(assert (=> b!210616 m!324347))

(declare-fun m!324349 () Bool)

(assert (=> b!210616 m!324349))

(declare-fun m!324351 () Bool)

(assert (=> b!210616 m!324351))

(declare-fun m!324353 () Bool)

(assert (=> b!210616 m!324353))

(declare-fun m!324355 () Bool)

(assert (=> b!210616 m!324355))

(declare-fun m!324357 () Bool)

(assert (=> b!210616 m!324357))

(declare-fun m!324359 () Bool)

(assert (=> b!210616 m!324359))

(declare-fun m!324361 () Bool)

(assert (=> b!210616 m!324361))

(declare-fun m!324363 () Bool)

(assert (=> b!210616 m!324363))

(declare-fun m!324365 () Bool)

(assert (=> b!210616 m!324365))

(declare-fun m!324367 () Bool)

(assert (=> b!210616 m!324367))

(declare-fun m!324369 () Bool)

(assert (=> b!210616 m!324369))

(declare-fun m!324371 () Bool)

(assert (=> b!210616 m!324371))

(declare-fun m!324373 () Bool)

(assert (=> b!210604 m!324373))

(declare-fun m!324375 () Bool)

(assert (=> b!210603 m!324375))

(declare-fun m!324377 () Bool)

(assert (=> b!210620 m!324377))

(assert (=> b!210618 m!324335))

(assert (=> b!210618 m!324337))

(declare-fun m!324379 () Bool)

(assert (=> start!44204 m!324379))

(declare-fun m!324381 () Bool)

(assert (=> b!210614 m!324381))

(assert (=> b!210605 m!324375))

(declare-fun m!324383 () Bool)

(assert (=> b!210608 m!324383))

(declare-fun m!324385 () Bool)

(assert (=> b!210613 m!324385))

(assert (=> b!210613 m!324385))

(declare-fun m!324387 () Bool)

(assert (=> b!210613 m!324387))

(check-sat (not b!210614) (not b!210603) (not b!210613) (not b!210608) (not b!210615) (not start!44204) (not b!210612) (not b!210606) (not b!210610) (not b!210611) (not b!210618) (not b!210605) (not b!210609) (not b!210616) (not b!210620) (not b!210604) (not b!210617))
(check-sat)
(get-model)

(declare-fun d!71381 () Bool)

(declare-fun e!143797 () Bool)

(assert (=> d!71381 e!143797))

(declare-fun res!177026 () Bool)

(assert (=> d!71381 (=> (not res!177026) (not e!143797))))

(declare-fun lt!331211 () (_ BitVec 64))

(declare-fun lt!331214 () (_ BitVec 64))

(declare-fun lt!331213 () (_ BitVec 64))

(assert (=> d!71381 (= res!177026 (= lt!331214 (bvsub lt!331211 lt!331213)))))

(assert (=> d!71381 (or (= (bvand lt!331211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331213 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331211 lt!331213) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71381 (= lt!331213 (remainingBits!0 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330753))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330753)))))))

(declare-fun lt!331212 () (_ BitVec 64))

(declare-fun lt!331215 () (_ BitVec 64))

(assert (=> d!71381 (= lt!331211 (bvmul lt!331212 lt!331215))))

(assert (=> d!71381 (or (= lt!331212 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331215 (bvsdiv (bvmul lt!331212 lt!331215) lt!331212)))))

(assert (=> d!71381 (= lt!331215 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71381 (= lt!331212 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))))))

(assert (=> d!71381 (= lt!331214 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330753))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330753)))))))

(assert (=> d!71381 (invariant!0 (currentBit!9673 (_2!9678 lt!330753)) (currentByte!9678 (_2!9678 lt!330753)) (size!4610 (buf!5130 (_2!9678 lt!330753))))))

(assert (=> d!71381 (= (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330753))) (currentByte!9678 (_2!9678 lt!330753)) (currentBit!9673 (_2!9678 lt!330753))) lt!331214)))

(declare-fun b!210820 () Bool)

(declare-fun res!177025 () Bool)

(assert (=> b!210820 (=> (not res!177025) (not e!143797))))

(assert (=> b!210820 (= res!177025 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331214))))

(declare-fun b!210821 () Bool)

(declare-fun lt!331210 () (_ BitVec 64))

(assert (=> b!210821 (= e!143797 (bvsle lt!331214 (bvmul lt!331210 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210821 (or (= lt!331210 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331210 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331210)))))

(assert (=> b!210821 (= lt!331210 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))))))

(assert (= (and d!71381 res!177026) b!210820))

(assert (= (and b!210820 res!177025) b!210821))

(declare-fun m!324739 () Bool)

(assert (=> d!71381 m!324739))

(assert (=> d!71381 m!324313))

(assert (=> b!210611 d!71381))

(declare-fun d!71383 () Bool)

(declare-fun res!177035 () Bool)

(declare-fun e!143802 () Bool)

(assert (=> d!71383 (=> (not res!177035) (not e!143802))))

(assert (=> d!71383 (= res!177035 (= (size!4610 (buf!5130 thiss!1204)) (size!4610 (buf!5130 (_2!9678 lt!330753)))))))

(assert (=> d!71383 (= (isPrefixOf!0 thiss!1204 (_2!9678 lt!330753)) e!143802)))

(declare-fun b!210828 () Bool)

(declare-fun res!177033 () Bool)

(assert (=> b!210828 (=> (not res!177033) (not e!143802))))

(assert (=> b!210828 (= res!177033 (bvsle (bitIndex!0 (size!4610 (buf!5130 thiss!1204)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)) (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330753))) (currentByte!9678 (_2!9678 lt!330753)) (currentBit!9673 (_2!9678 lt!330753)))))))

(declare-fun b!210829 () Bool)

(declare-fun e!143803 () Bool)

(assert (=> b!210829 (= e!143802 e!143803)))

(declare-fun res!177034 () Bool)

(assert (=> b!210829 (=> res!177034 e!143803)))

(assert (=> b!210829 (= res!177034 (= (size!4610 (buf!5130 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210830 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10492 array!10492 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210830 (= e!143803 (arrayBitRangesEq!0 (buf!5130 thiss!1204) (buf!5130 (_2!9678 lt!330753)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4610 (buf!5130 thiss!1204)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204))))))

(assert (= (and d!71383 res!177035) b!210828))

(assert (= (and b!210828 res!177033) b!210829))

(assert (= (and b!210829 (not res!177034)) b!210830))

(assert (=> b!210828 m!324337))

(assert (=> b!210828 m!324319))

(assert (=> b!210830 m!324337))

(assert (=> b!210830 m!324337))

(declare-fun m!324741 () Bool)

(assert (=> b!210830 m!324741))

(assert (=> b!210611 d!71383))

(declare-fun d!71385 () Bool)

(assert (=> d!71385 (isPrefixOf!0 thiss!1204 (_2!9678 lt!330753))))

(declare-fun lt!331218 () Unit!15009)

(declare-fun choose!30 (BitStream!8328 BitStream!8328 BitStream!8328) Unit!15009)

(assert (=> d!71385 (= lt!331218 (choose!30 thiss!1204 (_2!9678 lt!330745) (_2!9678 lt!330753)))))

(assert (=> d!71385 (isPrefixOf!0 thiss!1204 (_2!9678 lt!330745))))

(assert (=> d!71385 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9678 lt!330745) (_2!9678 lt!330753)) lt!331218)))

(declare-fun bs!17524 () Bool)

(assert (= bs!17524 d!71385))

(assert (=> bs!17524 m!324321))

(declare-fun m!324743 () Bool)

(assert (=> bs!17524 m!324743))

(assert (=> bs!17524 m!324375))

(assert (=> b!210611 d!71385))

(declare-fun b!210970 () Bool)

(declare-fun e!143889 () Bool)

(declare-fun lt!331750 () tuple2!18052)

(declare-fun lt!331753 () tuple2!18046)

(assert (=> b!210970 (= e!143889 (= (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!331750))) (currentByte!9678 (_1!9681 lt!331750)) (currentBit!9673 (_1!9681 lt!331750))) (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!331753))) (currentByte!9678 (_2!9678 lt!331753)) (currentBit!9673 (_2!9678 lt!331753)))))))

(declare-fun d!71387 () Bool)

(declare-fun e!143890 () Bool)

(assert (=> d!71387 e!143890))

(declare-fun res!177154 () Bool)

(assert (=> d!71387 (=> (not res!177154) (not e!143890))))

(declare-fun lt!331707 () tuple2!18046)

(assert (=> d!71387 (= res!177154 (invariant!0 (currentBit!9673 (_2!9678 lt!331707)) (currentByte!9678 (_2!9678 lt!331707)) (size!4610 (buf!5130 (_2!9678 lt!331707)))))))

(declare-fun e!143884 () tuple2!18046)

(assert (=> d!71387 (= lt!331707 e!143884)))

(declare-fun c!10383 () Bool)

(assert (=> d!71387 (= c!10383 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71387 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71387 (= (appendBitsLSBFirstLoopTR!0 (_2!9678 lt!330745) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!331707)))

(declare-fun b!210971 () Bool)

(declare-fun res!177150 () Bool)

(assert (=> b!210971 (=> (not res!177150) (not e!143890))))

(assert (=> b!210971 (= res!177150 (isPrefixOf!0 (_2!9678 lt!330745) (_2!9678 lt!331707)))))

(declare-fun bm!3321 () Bool)

(declare-fun call!3324 () Bool)

(assert (=> bm!3321 (= call!3324 (isPrefixOf!0 (_2!9678 lt!330745) (ite c!10383 (_2!9678 lt!330745) (_2!9678 lt!331753))))))

(declare-fun b!210972 () Bool)

(declare-fun e!143886 () Bool)

(declare-fun lt!331730 () tuple2!18050)

(declare-fun lt!331702 () tuple2!18048)

(assert (=> b!210972 (= e!143886 (= (_1!9680 lt!331730) (_2!9679 lt!331702)))))

(declare-fun b!210973 () Bool)

(declare-fun lt!331714 () tuple2!18046)

(assert (=> b!210973 (= e!143884 (tuple2!18047 (_1!9678 lt!331714) (_2!9678 lt!331714)))))

(declare-fun lt!331701 () Bool)

(assert (=> b!210973 (= lt!331701 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210973 (= lt!331753 (appendBit!0 (_2!9678 lt!330745) lt!331701))))

(declare-fun res!177144 () Bool)

(assert (=> b!210973 (= res!177144 (= (size!4610 (buf!5130 (_2!9678 lt!330745))) (size!4610 (buf!5130 (_2!9678 lt!331753)))))))

(declare-fun e!143885 () Bool)

(assert (=> b!210973 (=> (not res!177144) (not e!143885))))

(assert (=> b!210973 e!143885))

(declare-fun lt!331717 () tuple2!18046)

(assert (=> b!210973 (= lt!331717 lt!331753)))

(assert (=> b!210973 (= lt!331714 (appendBitsLSBFirstLoopTR!0 (_2!9678 lt!331717) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!331731 () Unit!15009)

(assert (=> b!210973 (= lt!331731 (lemmaIsPrefixTransitive!0 (_2!9678 lt!330745) (_2!9678 lt!331717) (_2!9678 lt!331714)))))

(assert (=> b!210973 (isPrefixOf!0 (_2!9678 lt!330745) (_2!9678 lt!331714))))

(declare-fun lt!331736 () Unit!15009)

(assert (=> b!210973 (= lt!331736 lt!331731)))

(assert (=> b!210973 (invariant!0 (currentBit!9673 (_2!9678 lt!330745)) (currentByte!9678 (_2!9678 lt!330745)) (size!4610 (buf!5130 (_2!9678 lt!331717))))))

(declare-fun lt!331718 () BitStream!8328)

(assert (=> b!210973 (= lt!331718 (BitStream!8329 (buf!5130 (_2!9678 lt!331717)) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))))))

(assert (=> b!210973 (invariant!0 (currentBit!9673 lt!331718) (currentByte!9678 lt!331718) (size!4610 (buf!5130 (_2!9678 lt!331714))))))

(declare-fun lt!331755 () BitStream!8328)

(assert (=> b!210973 (= lt!331755 (BitStream!8329 (buf!5130 (_2!9678 lt!331714)) (currentByte!9678 lt!331718) (currentBit!9673 lt!331718)))))

(declare-fun lt!331751 () tuple2!18052)

(assert (=> b!210973 (= lt!331751 (readBitPure!0 lt!331718))))

(declare-fun lt!331735 () tuple2!18052)

(assert (=> b!210973 (= lt!331735 (readBitPure!0 lt!331755))))

(declare-fun lt!331727 () Unit!15009)

(assert (=> b!210973 (= lt!331727 (readBitPrefixLemma!0 lt!331718 (_2!9678 lt!331714)))))

(declare-fun res!177146 () Bool)

(assert (=> b!210973 (= res!177146 (= (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!331751))) (currentByte!9678 (_1!9681 lt!331751)) (currentBit!9673 (_1!9681 lt!331751))) (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!331735))) (currentByte!9678 (_1!9681 lt!331735)) (currentBit!9673 (_1!9681 lt!331735)))))))

(declare-fun e!143888 () Bool)

(assert (=> b!210973 (=> (not res!177146) (not e!143888))))

(assert (=> b!210973 e!143888))

(declare-fun lt!331743 () Unit!15009)

(assert (=> b!210973 (= lt!331743 lt!331727)))

(declare-fun lt!331722 () tuple2!18048)

(assert (=> b!210973 (= lt!331722 (reader!0 (_2!9678 lt!330745) (_2!9678 lt!331714)))))

(declare-fun lt!331719 () tuple2!18048)

(assert (=> b!210973 (= lt!331719 (reader!0 (_2!9678 lt!331717) (_2!9678 lt!331714)))))

(declare-fun lt!331716 () tuple2!18052)

(assert (=> b!210973 (= lt!331716 (readBitPure!0 (_1!9679 lt!331722)))))

(assert (=> b!210973 (= (_2!9681 lt!331716) lt!331701)))

(declare-fun lt!331732 () Unit!15009)

(declare-fun Unit!15039 () Unit!15009)

(assert (=> b!210973 (= lt!331732 Unit!15039)))

(declare-fun lt!331729 () (_ BitVec 64))

(assert (=> b!210973 (= lt!331729 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331713 () (_ BitVec 64))

(assert (=> b!210973 (= lt!331713 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331742 () Unit!15009)

(assert (=> b!210973 (= lt!331742 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9678 lt!330745) (buf!5130 (_2!9678 lt!331714)) lt!331713))))

(assert (=> b!210973 (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!331714)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330745))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330745))) lt!331713)))

(declare-fun lt!331746 () Unit!15009)

(assert (=> b!210973 (= lt!331746 lt!331742)))

(declare-fun lt!331703 () tuple2!18050)

(assert (=> b!210973 (= lt!331703 (readNBitsLSBFirstsLoopPure!0 (_1!9679 lt!331722) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!331729))))

(declare-fun lt!331745 () (_ BitVec 64))

(assert (=> b!210973 (= lt!331745 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!331740 () Unit!15009)

(assert (=> b!210973 (= lt!331740 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9678 lt!331717) (buf!5130 (_2!9678 lt!331714)) lt!331745))))

(assert (=> b!210973 (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!331714)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!331717))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!331717))) lt!331745)))

(declare-fun lt!331747 () Unit!15009)

(assert (=> b!210973 (= lt!331747 lt!331740)))

(declare-fun lt!331754 () tuple2!18050)

(assert (=> b!210973 (= lt!331754 (readNBitsLSBFirstsLoopPure!0 (_1!9679 lt!331719) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!331729 (ite (_2!9681 lt!331716) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!331720 () tuple2!18050)

(assert (=> b!210973 (= lt!331720 (readNBitsLSBFirstsLoopPure!0 (_1!9679 lt!331722) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!331729))))

(declare-fun c!10384 () Bool)

(assert (=> b!210973 (= c!10384 (_2!9681 (readBitPure!0 (_1!9679 lt!331722))))))

(declare-fun e!143892 () (_ BitVec 64))

(declare-fun lt!331704 () tuple2!18050)

(assert (=> b!210973 (= lt!331704 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9679 lt!331722) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!331729 e!143892)))))

(declare-fun lt!331706 () Unit!15009)

(assert (=> b!210973 (= lt!331706 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9679 lt!331722) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!331729))))

(assert (=> b!210973 (and (= (_2!9680 lt!331720) (_2!9680 lt!331704)) (= (_1!9680 lt!331720) (_1!9680 lt!331704)))))

(declare-fun lt!331733 () Unit!15009)

(assert (=> b!210973 (= lt!331733 lt!331706)))

(assert (=> b!210973 (= (_1!9679 lt!331722) (withMovedBitIndex!0 (_2!9679 lt!331722) (bvsub (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))) (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!331714))) (currentByte!9678 (_2!9678 lt!331714)) (currentBit!9673 (_2!9678 lt!331714))))))))

(declare-fun lt!331725 () Unit!15009)

(declare-fun Unit!15040 () Unit!15009)

(assert (=> b!210973 (= lt!331725 Unit!15040)))

(assert (=> b!210973 (= (_1!9679 lt!331719) (withMovedBitIndex!0 (_2!9679 lt!331719) (bvsub (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!331717))) (currentByte!9678 (_2!9678 lt!331717)) (currentBit!9673 (_2!9678 lt!331717))) (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!331714))) (currentByte!9678 (_2!9678 lt!331714)) (currentBit!9673 (_2!9678 lt!331714))))))))

(declare-fun lt!331726 () Unit!15009)

(declare-fun Unit!15041 () Unit!15009)

(assert (=> b!210973 (= lt!331726 Unit!15041)))

(assert (=> b!210973 (= (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))) (bvsub (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!331717))) (currentByte!9678 (_2!9678 lt!331717)) (currentBit!9673 (_2!9678 lt!331717))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!331709 () Unit!15009)

(declare-fun Unit!15042 () Unit!15009)

(assert (=> b!210973 (= lt!331709 Unit!15042)))

(assert (=> b!210973 (= (_2!9680 lt!331703) (_2!9680 lt!331754))))

(declare-fun lt!331734 () Unit!15009)

(declare-fun Unit!15043 () Unit!15009)

(assert (=> b!210973 (= lt!331734 Unit!15043)))

(assert (=> b!210973 (invariant!0 (currentBit!9673 (_2!9678 lt!331714)) (currentByte!9678 (_2!9678 lt!331714)) (size!4610 (buf!5130 (_2!9678 lt!331714))))))

(declare-fun lt!331711 () Unit!15009)

(declare-fun Unit!15044 () Unit!15009)

(assert (=> b!210973 (= lt!331711 Unit!15044)))

(assert (=> b!210973 (= (size!4610 (buf!5130 (_2!9678 lt!330745))) (size!4610 (buf!5130 (_2!9678 lt!331714))))))

(declare-fun lt!331715 () Unit!15009)

(declare-fun Unit!15045 () Unit!15009)

(assert (=> b!210973 (= lt!331715 Unit!15045)))

(assert (=> b!210973 (= (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!331714))) (currentByte!9678 (_2!9678 lt!331714)) (currentBit!9673 (_2!9678 lt!331714))) (bvsub (bvadd (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331712 () Unit!15009)

(declare-fun Unit!15046 () Unit!15009)

(assert (=> b!210973 (= lt!331712 Unit!15046)))

(declare-fun lt!331728 () Unit!15009)

(declare-fun Unit!15047 () Unit!15009)

(assert (=> b!210973 (= lt!331728 Unit!15047)))

(assert (=> b!210973 (= lt!331702 (reader!0 (_2!9678 lt!330745) (_2!9678 lt!331714)))))

(declare-fun lt!331738 () (_ BitVec 64))

(assert (=> b!210973 (= lt!331738 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331724 () Unit!15009)

(assert (=> b!210973 (= lt!331724 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9678 lt!330745) (buf!5130 (_2!9678 lt!331714)) lt!331738))))

(assert (=> b!210973 (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!331714)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330745))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330745))) lt!331738)))

(declare-fun lt!331748 () Unit!15009)

(assert (=> b!210973 (= lt!331748 lt!331724)))

(assert (=> b!210973 (= lt!331730 (readNBitsLSBFirstsLoopPure!0 (_1!9679 lt!331702) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!177153 () Bool)

(assert (=> b!210973 (= res!177153 (= (_2!9680 lt!331730) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!210973 (=> (not res!177153) (not e!143886))))

(assert (=> b!210973 e!143886))

(declare-fun lt!331749 () Unit!15009)

(declare-fun Unit!15048 () Unit!15009)

(assert (=> b!210973 (= lt!331749 Unit!15048)))

(declare-fun b!210974 () Bool)

(declare-fun res!177145 () Bool)

(assert (=> b!210974 (= res!177145 call!3324)))

(assert (=> b!210974 (=> (not res!177145) (not e!143885))))

(declare-fun b!210975 () Bool)

(assert (=> b!210975 (= e!143888 (= (_2!9681 lt!331751) (_2!9681 lt!331735)))))

(declare-fun b!210976 () Bool)

(declare-fun res!177149 () Bool)

(assert (=> b!210976 (=> (not res!177149) (not e!143890))))

(declare-fun lt!331741 () (_ BitVec 64))

(declare-fun lt!331721 () (_ BitVec 64))

(assert (=> b!210976 (= res!177149 (= (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!331707))) (currentByte!9678 (_2!9678 lt!331707)) (currentBit!9673 (_2!9678 lt!331707))) (bvsub lt!331741 lt!331721)))))

(assert (=> b!210976 (or (= (bvand lt!331741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331721 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331741 lt!331721) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210976 (= lt!331721 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!331739 () (_ BitVec 64))

(declare-fun lt!331708 () (_ BitVec 64))

(assert (=> b!210976 (= lt!331741 (bvadd lt!331739 lt!331708))))

(assert (=> b!210976 (or (not (= (bvand lt!331739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331708 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!331739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!331739 lt!331708) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210976 (= lt!331708 ((_ sign_extend 32) nBits!348))))

(assert (=> b!210976 (= lt!331739 (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))))))

(declare-fun b!210977 () Bool)

(declare-fun e!143891 () Bool)

(declare-fun lt!331710 () (_ BitVec 64))

(assert (=> b!210977 (= e!143891 (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330745)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330745))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330745))) lt!331710))))

(declare-fun b!210978 () Bool)

(declare-fun e!143887 () Bool)

(declare-fun lt!331723 () tuple2!18050)

(declare-fun lt!331737 () tuple2!18048)

(assert (=> b!210978 (= e!143887 (= (_1!9680 lt!331723) (_2!9679 lt!331737)))))

(declare-fun b!210979 () Bool)

(declare-fun res!177148 () Bool)

(assert (=> b!210979 (= res!177148 (= (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!331753))) (currentByte!9678 (_2!9678 lt!331753)) (currentBit!9673 (_2!9678 lt!331753))) (bvadd (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!210979 (=> (not res!177148) (not e!143885))))

(declare-fun b!210980 () Bool)

(assert (=> b!210980 (= e!143890 e!143887)))

(declare-fun res!177152 () Bool)

(assert (=> b!210980 (=> (not res!177152) (not e!143887))))

(assert (=> b!210980 (= res!177152 (= (_2!9680 lt!331723) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!210980 (= lt!331723 (readNBitsLSBFirstsLoopPure!0 (_1!9679 lt!331737) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!331744 () Unit!15009)

(declare-fun lt!331752 () Unit!15009)

(assert (=> b!210980 (= lt!331744 lt!331752)))

(assert (=> b!210980 (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!331707)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330745))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330745))) lt!331710)))

(assert (=> b!210980 (= lt!331752 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9678 lt!330745) (buf!5130 (_2!9678 lt!331707)) lt!331710))))

(assert (=> b!210980 e!143891))

(declare-fun res!177155 () Bool)

(assert (=> b!210980 (=> (not res!177155) (not e!143891))))

(assert (=> b!210980 (= res!177155 (and (= (size!4610 (buf!5130 (_2!9678 lt!330745))) (size!4610 (buf!5130 (_2!9678 lt!331707)))) (bvsge lt!331710 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210980 (= lt!331710 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!210980 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!210980 (= lt!331737 (reader!0 (_2!9678 lt!330745) (_2!9678 lt!331707)))))

(declare-fun b!210981 () Bool)

(declare-fun Unit!15049 () Unit!15009)

(assert (=> b!210981 (= e!143884 (tuple2!18047 Unit!15049 (_2!9678 lt!330745)))))

(declare-fun lt!331705 () Unit!15009)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8328) Unit!15009)

(assert (=> b!210981 (= lt!331705 (lemmaIsPrefixRefl!0 (_2!9678 lt!330745)))))

(assert (=> b!210981 call!3324))

(declare-fun lt!331756 () Unit!15009)

(assert (=> b!210981 (= lt!331756 lt!331705)))

(declare-fun b!210982 () Bool)

(assert (=> b!210982 (= e!143892 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!210983 () Bool)

(assert (=> b!210983 (= lt!331750 (readBitPure!0 (readerFrom!0 (_2!9678 lt!331753) (currentBit!9673 (_2!9678 lt!330745)) (currentByte!9678 (_2!9678 lt!330745)))))))

(declare-fun res!177151 () Bool)

(assert (=> b!210983 (= res!177151 (and (= (_2!9681 lt!331750) lt!331701) (= (_1!9681 lt!331750) (_2!9678 lt!331753))))))

(assert (=> b!210983 (=> (not res!177151) (not e!143889))))

(assert (=> b!210983 (= e!143885 e!143889)))

(declare-fun b!210984 () Bool)

(assert (=> b!210984 (= e!143892 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!210985 () Bool)

(declare-fun res!177147 () Bool)

(assert (=> b!210985 (=> (not res!177147) (not e!143890))))

(assert (=> b!210985 (= res!177147 (= (size!4610 (buf!5130 (_2!9678 lt!330745))) (size!4610 (buf!5130 (_2!9678 lt!331707)))))))

(assert (= (and d!71387 c!10383) b!210981))

(assert (= (and d!71387 (not c!10383)) b!210973))

(assert (= (and b!210973 res!177144) b!210979))

(assert (= (and b!210979 res!177148) b!210974))

(assert (= (and b!210974 res!177145) b!210983))

(assert (= (and b!210983 res!177151) b!210970))

(assert (= (and b!210973 res!177146) b!210975))

(assert (= (and b!210973 c!10384) b!210984))

(assert (= (and b!210973 (not c!10384)) b!210982))

(assert (= (and b!210973 res!177153) b!210972))

(assert (= (or b!210981 b!210974) bm!3321))

(assert (= (and d!71387 res!177154) b!210985))

(assert (= (and b!210985 res!177147) b!210976))

(assert (= (and b!210976 res!177149) b!210971))

(assert (= (and b!210971 res!177150) b!210980))

(assert (= (and b!210980 res!177155) b!210977))

(assert (= (and b!210980 res!177152) b!210978))

(declare-fun m!324955 () Bool)

(assert (=> b!210970 m!324955))

(declare-fun m!324957 () Bool)

(assert (=> b!210970 m!324957))

(declare-fun m!324959 () Bool)

(assert (=> bm!3321 m!324959))

(declare-fun m!324961 () Bool)

(assert (=> d!71387 m!324961))

(declare-fun m!324963 () Bool)

(assert (=> b!210976 m!324963))

(assert (=> b!210976 m!324335))

(assert (=> b!210979 m!324957))

(assert (=> b!210979 m!324335))

(declare-fun m!324965 () Bool)

(assert (=> b!210977 m!324965))

(declare-fun m!324967 () Bool)

(assert (=> b!210973 m!324967))

(declare-fun m!324969 () Bool)

(assert (=> b!210973 m!324969))

(declare-fun m!324971 () Bool)

(assert (=> b!210973 m!324971))

(declare-fun m!324973 () Bool)

(assert (=> b!210973 m!324973))

(declare-fun m!324975 () Bool)

(assert (=> b!210973 m!324975))

(declare-fun m!324977 () Bool)

(assert (=> b!210973 m!324977))

(declare-fun m!324979 () Bool)

(assert (=> b!210973 m!324979))

(declare-fun m!324981 () Bool)

(assert (=> b!210973 m!324981))

(declare-fun m!324983 () Bool)

(assert (=> b!210973 m!324983))

(declare-fun m!324985 () Bool)

(assert (=> b!210973 m!324985))

(declare-fun m!324987 () Bool)

(assert (=> b!210973 m!324987))

(declare-fun m!324989 () Bool)

(assert (=> b!210973 m!324989))

(declare-fun m!324991 () Bool)

(assert (=> b!210973 m!324991))

(declare-fun m!324993 () Bool)

(assert (=> b!210973 m!324993))

(declare-fun m!324995 () Bool)

(assert (=> b!210973 m!324995))

(declare-fun m!324997 () Bool)

(assert (=> b!210973 m!324997))

(assert (=> b!210973 m!324985))

(declare-fun m!324999 () Bool)

(assert (=> b!210973 m!324999))

(declare-fun m!325001 () Bool)

(assert (=> b!210973 m!325001))

(declare-fun m!325003 () Bool)

(assert (=> b!210973 m!325003))

(declare-fun m!325005 () Bool)

(assert (=> b!210973 m!325005))

(assert (=> b!210973 m!324335))

(declare-fun m!325007 () Bool)

(assert (=> b!210973 m!325007))

(declare-fun m!325009 () Bool)

(assert (=> b!210973 m!325009))

(declare-fun m!325011 () Bool)

(assert (=> b!210973 m!325011))

(declare-fun m!325013 () Bool)

(assert (=> b!210973 m!325013))

(declare-fun m!325015 () Bool)

(assert (=> b!210973 m!325015))

(declare-fun m!325017 () Bool)

(assert (=> b!210973 m!325017))

(declare-fun m!325019 () Bool)

(assert (=> b!210973 m!325019))

(declare-fun m!325021 () Bool)

(assert (=> b!210973 m!325021))

(declare-fun m!325023 () Bool)

(assert (=> b!210973 m!325023))

(declare-fun m!325025 () Bool)

(assert (=> b!210973 m!325025))

(declare-fun m!325027 () Bool)

(assert (=> b!210973 m!325027))

(declare-fun m!325029 () Bool)

(assert (=> b!210973 m!325029))

(declare-fun m!325031 () Bool)

(assert (=> b!210973 m!325031))

(declare-fun m!325033 () Bool)

(assert (=> b!210981 m!325033))

(declare-fun m!325035 () Bool)

(assert (=> b!210983 m!325035))

(assert (=> b!210983 m!325035))

(declare-fun m!325037 () Bool)

(assert (=> b!210983 m!325037))

(declare-fun m!325039 () Bool)

(assert (=> b!210980 m!325039))

(declare-fun m!325041 () Bool)

(assert (=> b!210980 m!325041))

(declare-fun m!325043 () Bool)

(assert (=> b!210980 m!325043))

(declare-fun m!325045 () Bool)

(assert (=> b!210980 m!325045))

(assert (=> b!210980 m!325027))

(assert (=> b!210980 m!325031))

(declare-fun m!325047 () Bool)

(assert (=> b!210971 m!325047))

(assert (=> b!210611 d!71387))

(declare-fun d!71417 () Bool)

(assert (=> d!71417 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204) (size!4610 (buf!5130 thiss!1204))))))

(declare-fun bs!17532 () Bool)

(assert (= bs!17532 d!71417))

(assert (=> bs!17532 m!324315))

(assert (=> start!44204 d!71417))

(declare-fun d!71419 () Bool)

(declare-fun lt!331771 () tuple2!18050)

(declare-fun lt!331769 () tuple2!18050)

(assert (=> d!71419 (and (= (_2!9680 lt!331771) (_2!9680 lt!331769)) (= (_1!9680 lt!331771) (_1!9680 lt!331769)))))

(declare-fun lt!331772 () Bool)

(declare-fun lt!331773 () BitStream!8328)

(declare-fun lt!331774 () (_ BitVec 64))

(declare-fun lt!331770 () Unit!15009)

(declare-fun choose!56 (BitStream!8328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18050 tuple2!18050 BitStream!8328 (_ BitVec 64) Bool BitStream!8328 (_ BitVec 64) tuple2!18050 tuple2!18050 BitStream!8328 (_ BitVec 64)) Unit!15009)

(assert (=> d!71419 (= lt!331770 (choose!56 (_1!9679 lt!330740) nBits!348 i!590 lt!330750 lt!331771 (tuple2!18051 (_1!9680 lt!331771) (_2!9680 lt!331771)) (_1!9680 lt!331771) (_2!9680 lt!331771) lt!331772 lt!331773 lt!331774 lt!331769 (tuple2!18051 (_1!9680 lt!331769) (_2!9680 lt!331769)) (_1!9680 lt!331769) (_2!9680 lt!331769)))))

(assert (=> d!71419 (= lt!331769 (readNBitsLSBFirstsLoopPure!0 lt!331773 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!331774))))

(assert (=> d!71419 (= lt!331774 (bvor lt!330750 (ite lt!331772 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71419 (= lt!331773 (withMovedBitIndex!0 (_1!9679 lt!330740) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71419 (= lt!331772 (_2!9681 (readBitPure!0 (_1!9679 lt!330740))))))

(assert (=> d!71419 (= lt!331771 (readNBitsLSBFirstsLoopPure!0 (_1!9679 lt!330740) nBits!348 i!590 lt!330750))))

(assert (=> d!71419 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9679 lt!330740) nBits!348 i!590 lt!330750) lt!331770)))

(declare-fun bs!17534 () Bool)

(assert (= bs!17534 d!71419))

(assert (=> bs!17534 m!324341))

(declare-fun m!325049 () Bool)

(assert (=> bs!17534 m!325049))

(assert (=> bs!17534 m!324331))

(assert (=> bs!17534 m!324369))

(declare-fun m!325051 () Bool)

(assert (=> bs!17534 m!325051))

(assert (=> b!210612 d!71419))

(declare-fun d!71421 () Bool)

(declare-datatypes ((tuple2!18070 0))(
  ( (tuple2!18071 (_1!9690 (_ BitVec 64)) (_2!9690 BitStream!8328)) )
))
(declare-fun lt!331777 () tuple2!18070)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18070)

(assert (=> d!71421 (= lt!331777 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9679 lt!330740) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330743))))

(assert (=> d!71421 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9679 lt!330740) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330743) (tuple2!18051 (_2!9690 lt!331777) (_1!9690 lt!331777)))))

(declare-fun bs!17535 () Bool)

(assert (= bs!17535 d!71421))

(assert (=> bs!17535 m!324331))

(declare-fun m!325053 () Bool)

(assert (=> bs!17535 m!325053))

(assert (=> b!210612 d!71421))

(declare-fun d!71423 () Bool)

(declare-fun e!143895 () Bool)

(assert (=> d!71423 e!143895))

(declare-fun res!177158 () Bool)

(assert (=> d!71423 (=> (not res!177158) (not e!143895))))

(declare-fun lt!331783 () (_ BitVec 64))

(declare-fun lt!331782 () BitStream!8328)

(assert (=> d!71423 (= res!177158 (= (bvadd lt!331783 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4610 (buf!5130 lt!331782)) (currentByte!9678 lt!331782) (currentBit!9673 lt!331782))))))

(assert (=> d!71423 (or (not (= (bvand lt!331783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!331783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!331783 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71423 (= lt!331783 (bitIndex!0 (size!4610 (buf!5130 (_1!9679 lt!330740))) (currentByte!9678 (_1!9679 lt!330740)) (currentBit!9673 (_1!9679 lt!330740))))))

(declare-fun moveBitIndex!0 (BitStream!8328 (_ BitVec 64)) tuple2!18046)

(assert (=> d!71423 (= lt!331782 (_2!9678 (moveBitIndex!0 (_1!9679 lt!330740) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8328 (_ BitVec 64)) Bool)

(assert (=> d!71423 (moveBitIndexPrecond!0 (_1!9679 lt!330740) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71423 (= (withMovedBitIndex!0 (_1!9679 lt!330740) #b0000000000000000000000000000000000000000000000000000000000000001) lt!331782)))

(declare-fun b!210988 () Bool)

(assert (=> b!210988 (= e!143895 (= (size!4610 (buf!5130 (_1!9679 lt!330740))) (size!4610 (buf!5130 lt!331782))))))

(assert (= (and d!71423 res!177158) b!210988))

(declare-fun m!325055 () Bool)

(assert (=> d!71423 m!325055))

(declare-fun m!325057 () Bool)

(assert (=> d!71423 m!325057))

(declare-fun m!325059 () Bool)

(assert (=> d!71423 m!325059))

(declare-fun m!325061 () Bool)

(assert (=> d!71423 m!325061))

(assert (=> b!210612 d!71423))

(declare-fun d!71425 () Bool)

(declare-datatypes ((tuple2!18072 0))(
  ( (tuple2!18073 (_1!9691 Bool) (_2!9691 BitStream!8328)) )
))
(declare-fun lt!331786 () tuple2!18072)

(declare-fun readBit!0 (BitStream!8328) tuple2!18072)

(assert (=> d!71425 (= lt!331786 (readBit!0 (readerFrom!0 (_2!9678 lt!330745) (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204))))))

(assert (=> d!71425 (= (readBitPure!0 (readerFrom!0 (_2!9678 lt!330745) (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204))) (tuple2!18053 (_2!9691 lt!331786) (_1!9691 lt!331786)))))

(declare-fun bs!17536 () Bool)

(assert (= bs!17536 d!71425))

(assert (=> bs!17536 m!324385))

(declare-fun m!325063 () Bool)

(assert (=> bs!17536 m!325063))

(assert (=> b!210613 d!71425))

(declare-fun d!71427 () Bool)

(declare-fun e!143898 () Bool)

(assert (=> d!71427 e!143898))

(declare-fun res!177162 () Bool)

(assert (=> d!71427 (=> (not res!177162) (not e!143898))))

(assert (=> d!71427 (= res!177162 (invariant!0 (currentBit!9673 (_2!9678 lt!330745)) (currentByte!9678 (_2!9678 lt!330745)) (size!4610 (buf!5130 (_2!9678 lt!330745)))))))

(assert (=> d!71427 (= (readerFrom!0 (_2!9678 lt!330745) (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204)) (BitStream!8329 (buf!5130 (_2!9678 lt!330745)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)))))

(declare-fun b!210991 () Bool)

(assert (=> b!210991 (= e!143898 (invariant!0 (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204) (size!4610 (buf!5130 (_2!9678 lt!330745)))))))

(assert (= (and d!71427 res!177162) b!210991))

(declare-fun m!325065 () Bool)

(assert (=> d!71427 m!325065))

(assert (=> b!210991 m!324357))

(assert (=> b!210613 d!71427))

(declare-fun d!71429 () Bool)

(assert (=> d!71429 (= (invariant!0 (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204) (size!4610 (buf!5130 (_2!9678 lt!330753)))) (and (bvsge (currentBit!9673 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9673 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9678 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9678 thiss!1204) (size!4610 (buf!5130 (_2!9678 lt!330753)))) (and (= (currentBit!9673 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9678 thiss!1204) (size!4610 (buf!5130 (_2!9678 lt!330753))))))))))

(assert (=> b!210614 d!71429))

(declare-fun d!71431 () Bool)

(declare-fun res!177165 () Bool)

(declare-fun e!143899 () Bool)

(assert (=> d!71431 (=> (not res!177165) (not e!143899))))

(assert (=> d!71431 (= res!177165 (= (size!4610 (buf!5130 thiss!1204)) (size!4610 (buf!5130 (_2!9678 lt!330745)))))))

(assert (=> d!71431 (= (isPrefixOf!0 thiss!1204 (_2!9678 lt!330745)) e!143899)))

(declare-fun b!210992 () Bool)

(declare-fun res!177163 () Bool)

(assert (=> b!210992 (=> (not res!177163) (not e!143899))))

(assert (=> b!210992 (= res!177163 (bvsle (bitIndex!0 (size!4610 (buf!5130 thiss!1204)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)) (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745)))))))

(declare-fun b!210993 () Bool)

(declare-fun e!143900 () Bool)

(assert (=> b!210993 (= e!143899 e!143900)))

(declare-fun res!177164 () Bool)

(assert (=> b!210993 (=> res!177164 e!143900)))

(assert (=> b!210993 (= res!177164 (= (size!4610 (buf!5130 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210994 () Bool)

(assert (=> b!210994 (= e!143900 (arrayBitRangesEq!0 (buf!5130 thiss!1204) (buf!5130 (_2!9678 lt!330745)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4610 (buf!5130 thiss!1204)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204))))))

(assert (= (and d!71431 res!177165) b!210992))

(assert (= (and b!210992 res!177163) b!210993))

(assert (= (and b!210993 (not res!177164)) b!210994))

(assert (=> b!210992 m!324337))

(assert (=> b!210992 m!324335))

(assert (=> b!210994 m!324337))

(assert (=> b!210994 m!324337))

(declare-fun m!325067 () Bool)

(assert (=> b!210994 m!325067))

(assert (=> b!210603 d!71431))

(declare-fun d!71433 () Bool)

(declare-fun e!143901 () Bool)

(assert (=> d!71433 e!143901))

(declare-fun res!177166 () Bool)

(assert (=> d!71433 (=> (not res!177166) (not e!143901))))

(declare-fun lt!331787 () BitStream!8328)

(declare-fun lt!331788 () (_ BitVec 64))

(assert (=> d!71433 (= res!177166 (= (bvadd lt!331788 (bvsub lt!330754 lt!330737)) (bitIndex!0 (size!4610 (buf!5130 lt!331787)) (currentByte!9678 lt!331787) (currentBit!9673 lt!331787))))))

(assert (=> d!71433 (or (not (= (bvand lt!331788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330754 lt!330737) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!331788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!331788 (bvsub lt!330754 lt!330737)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71433 (= lt!331788 (bitIndex!0 (size!4610 (buf!5130 (_2!9679 lt!330740))) (currentByte!9678 (_2!9679 lt!330740)) (currentBit!9673 (_2!9679 lt!330740))))))

(assert (=> d!71433 (= lt!331787 (_2!9678 (moveBitIndex!0 (_2!9679 lt!330740) (bvsub lt!330754 lt!330737))))))

(assert (=> d!71433 (moveBitIndexPrecond!0 (_2!9679 lt!330740) (bvsub lt!330754 lt!330737))))

(assert (=> d!71433 (= (withMovedBitIndex!0 (_2!9679 lt!330740) (bvsub lt!330754 lt!330737)) lt!331787)))

(declare-fun b!210995 () Bool)

(assert (=> b!210995 (= e!143901 (= (size!4610 (buf!5130 (_2!9679 lt!330740))) (size!4610 (buf!5130 lt!331787))))))

(assert (= (and d!71433 res!177166) b!210995))

(declare-fun m!325069 () Bool)

(assert (=> d!71433 m!325069))

(declare-fun m!325071 () Bool)

(assert (=> d!71433 m!325071))

(declare-fun m!325073 () Bool)

(assert (=> d!71433 m!325073))

(declare-fun m!325075 () Bool)

(assert (=> d!71433 m!325075))

(assert (=> b!210604 d!71433))

(declare-fun d!71435 () Bool)

(assert (=> d!71435 (= (invariant!0 (currentBit!9673 (_2!9678 lt!330753)) (currentByte!9678 (_2!9678 lt!330753)) (size!4610 (buf!5130 (_2!9678 lt!330753)))) (and (bvsge (currentBit!9673 (_2!9678 lt!330753)) #b00000000000000000000000000000000) (bvslt (currentBit!9673 (_2!9678 lt!330753)) #b00000000000000000000000000001000) (bvsge (currentByte!9678 (_2!9678 lt!330753)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9678 (_2!9678 lt!330753)) (size!4610 (buf!5130 (_2!9678 lt!330753)))) (and (= (currentBit!9673 (_2!9678 lt!330753)) #b00000000000000000000000000000000) (= (currentByte!9678 (_2!9678 lt!330753)) (size!4610 (buf!5130 (_2!9678 lt!330753))))))))))

(assert (=> b!210615 d!71435))

(declare-fun d!71437 () Bool)

(declare-fun e!143902 () Bool)

(assert (=> d!71437 e!143902))

(declare-fun res!177168 () Bool)

(assert (=> d!71437 (=> (not res!177168) (not e!143902))))

(declare-fun lt!331792 () (_ BitVec 64))

(declare-fun lt!331793 () (_ BitVec 64))

(declare-fun lt!331790 () (_ BitVec 64))

(assert (=> d!71437 (= res!177168 (= lt!331793 (bvsub lt!331790 lt!331792)))))

(assert (=> d!71437 (or (= (bvand lt!331790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331792 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331790 lt!331792) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71437 (= lt!331792 (remainingBits!0 ((_ sign_extend 32) (size!4610 (buf!5130 (_1!9681 lt!330729)))) ((_ sign_extend 32) (currentByte!9678 (_1!9681 lt!330729))) ((_ sign_extend 32) (currentBit!9673 (_1!9681 lt!330729)))))))

(declare-fun lt!331791 () (_ BitVec 64))

(declare-fun lt!331794 () (_ BitVec 64))

(assert (=> d!71437 (= lt!331790 (bvmul lt!331791 lt!331794))))

(assert (=> d!71437 (or (= lt!331791 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331794 (bvsdiv (bvmul lt!331791 lt!331794) lt!331791)))))

(assert (=> d!71437 (= lt!331794 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71437 (= lt!331791 ((_ sign_extend 32) (size!4610 (buf!5130 (_1!9681 lt!330729)))))))

(assert (=> d!71437 (= lt!331793 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9678 (_1!9681 lt!330729))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9673 (_1!9681 lt!330729)))))))

(assert (=> d!71437 (invariant!0 (currentBit!9673 (_1!9681 lt!330729)) (currentByte!9678 (_1!9681 lt!330729)) (size!4610 (buf!5130 (_1!9681 lt!330729))))))

(assert (=> d!71437 (= (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!330729))) (currentByte!9678 (_1!9681 lt!330729)) (currentBit!9673 (_1!9681 lt!330729))) lt!331793)))

(declare-fun b!210996 () Bool)

(declare-fun res!177167 () Bool)

(assert (=> b!210996 (=> (not res!177167) (not e!143902))))

(assert (=> b!210996 (= res!177167 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331793))))

(declare-fun b!210997 () Bool)

(declare-fun lt!331789 () (_ BitVec 64))

(assert (=> b!210997 (= e!143902 (bvsle lt!331793 (bvmul lt!331789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210997 (or (= lt!331789 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331789 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331789)))))

(assert (=> b!210997 (= lt!331789 ((_ sign_extend 32) (size!4610 (buf!5130 (_1!9681 lt!330729)))))))

(assert (= (and d!71437 res!177168) b!210996))

(assert (= (and b!210996 res!177167) b!210997))

(declare-fun m!325077 () Bool)

(assert (=> d!71437 m!325077))

(declare-fun m!325079 () Bool)

(assert (=> d!71437 m!325079))

(assert (=> b!210616 d!71437))

(declare-fun lt!331836 () (_ BitVec 64))

(declare-fun lt!331847 () (_ BitVec 64))

(declare-fun b!211008 () Bool)

(declare-fun e!143907 () Bool)

(declare-fun lt!331852 () tuple2!18048)

(assert (=> b!211008 (= e!143907 (= (_1!9679 lt!331852) (withMovedBitIndex!0 (_2!9679 lt!331852) (bvsub lt!331836 lt!331847))))))

(assert (=> b!211008 (or (= (bvand lt!331836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331836 lt!331847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211008 (= lt!331847 (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330753))) (currentByte!9678 (_2!9678 lt!330753)) (currentBit!9673 (_2!9678 lt!330753))))))

(assert (=> b!211008 (= lt!331836 (bitIndex!0 (size!4610 (buf!5130 thiss!1204)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)))))

(declare-fun b!211009 () Bool)

(declare-fun res!177176 () Bool)

(assert (=> b!211009 (=> (not res!177176) (not e!143907))))

(assert (=> b!211009 (= res!177176 (isPrefixOf!0 (_2!9679 lt!331852) (_2!9678 lt!330753)))))

(declare-fun d!71439 () Bool)

(assert (=> d!71439 e!143907))

(declare-fun res!177175 () Bool)

(assert (=> d!71439 (=> (not res!177175) (not e!143907))))

(assert (=> d!71439 (= res!177175 (isPrefixOf!0 (_1!9679 lt!331852) (_2!9679 lt!331852)))))

(declare-fun lt!331837 () BitStream!8328)

(assert (=> d!71439 (= lt!331852 (tuple2!18049 lt!331837 (_2!9678 lt!330753)))))

(declare-fun lt!331843 () Unit!15009)

(declare-fun lt!331841 () Unit!15009)

(assert (=> d!71439 (= lt!331843 lt!331841)))

(assert (=> d!71439 (isPrefixOf!0 lt!331837 (_2!9678 lt!330753))))

(assert (=> d!71439 (= lt!331841 (lemmaIsPrefixTransitive!0 lt!331837 (_2!9678 lt!330753) (_2!9678 lt!330753)))))

(declare-fun lt!331846 () Unit!15009)

(declare-fun lt!331838 () Unit!15009)

(assert (=> d!71439 (= lt!331846 lt!331838)))

(assert (=> d!71439 (isPrefixOf!0 lt!331837 (_2!9678 lt!330753))))

(assert (=> d!71439 (= lt!331838 (lemmaIsPrefixTransitive!0 lt!331837 thiss!1204 (_2!9678 lt!330753)))))

(declare-fun lt!331851 () Unit!15009)

(declare-fun e!143908 () Unit!15009)

(assert (=> d!71439 (= lt!331851 e!143908)))

(declare-fun c!10387 () Bool)

(assert (=> d!71439 (= c!10387 (not (= (size!4610 (buf!5130 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!331835 () Unit!15009)

(declare-fun lt!331853 () Unit!15009)

(assert (=> d!71439 (= lt!331835 lt!331853)))

(assert (=> d!71439 (isPrefixOf!0 (_2!9678 lt!330753) (_2!9678 lt!330753))))

(assert (=> d!71439 (= lt!331853 (lemmaIsPrefixRefl!0 (_2!9678 lt!330753)))))

(declare-fun lt!331849 () Unit!15009)

(declare-fun lt!331848 () Unit!15009)

(assert (=> d!71439 (= lt!331849 lt!331848)))

(assert (=> d!71439 (= lt!331848 (lemmaIsPrefixRefl!0 (_2!9678 lt!330753)))))

(declare-fun lt!331842 () Unit!15009)

(declare-fun lt!331840 () Unit!15009)

(assert (=> d!71439 (= lt!331842 lt!331840)))

(assert (=> d!71439 (isPrefixOf!0 lt!331837 lt!331837)))

(assert (=> d!71439 (= lt!331840 (lemmaIsPrefixRefl!0 lt!331837))))

(declare-fun lt!331854 () Unit!15009)

(declare-fun lt!331839 () Unit!15009)

(assert (=> d!71439 (= lt!331854 lt!331839)))

(assert (=> d!71439 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71439 (= lt!331839 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71439 (= lt!331837 (BitStream!8329 (buf!5130 (_2!9678 lt!330753)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)))))

(assert (=> d!71439 (isPrefixOf!0 thiss!1204 (_2!9678 lt!330753))))

(assert (=> d!71439 (= (reader!0 thiss!1204 (_2!9678 lt!330753)) lt!331852)))

(declare-fun b!211010 () Bool)

(declare-fun res!177177 () Bool)

(assert (=> b!211010 (=> (not res!177177) (not e!143907))))

(assert (=> b!211010 (= res!177177 (isPrefixOf!0 (_1!9679 lt!331852) thiss!1204))))

(declare-fun b!211011 () Bool)

(declare-fun lt!331844 () Unit!15009)

(assert (=> b!211011 (= e!143908 lt!331844)))

(declare-fun lt!331845 () (_ BitVec 64))

(assert (=> b!211011 (= lt!331845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!331850 () (_ BitVec 64))

(assert (=> b!211011 (= lt!331850 (bitIndex!0 (size!4610 (buf!5130 thiss!1204)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10492 array!10492 (_ BitVec 64) (_ BitVec 64)) Unit!15009)

(assert (=> b!211011 (= lt!331844 (arrayBitRangesEqSymmetric!0 (buf!5130 thiss!1204) (buf!5130 (_2!9678 lt!330753)) lt!331845 lt!331850))))

(assert (=> b!211011 (arrayBitRangesEq!0 (buf!5130 (_2!9678 lt!330753)) (buf!5130 thiss!1204) lt!331845 lt!331850)))

(declare-fun b!211012 () Bool)

(declare-fun Unit!15050 () Unit!15009)

(assert (=> b!211012 (= e!143908 Unit!15050)))

(assert (= (and d!71439 c!10387) b!211011))

(assert (= (and d!71439 (not c!10387)) b!211012))

(assert (= (and d!71439 res!177175) b!211010))

(assert (= (and b!211010 res!177177) b!211009))

(assert (= (and b!211009 res!177176) b!211008))

(declare-fun m!325081 () Bool)

(assert (=> b!211010 m!325081))

(declare-fun m!325083 () Bool)

(assert (=> d!71439 m!325083))

(declare-fun m!325085 () Bool)

(assert (=> d!71439 m!325085))

(declare-fun m!325087 () Bool)

(assert (=> d!71439 m!325087))

(declare-fun m!325089 () Bool)

(assert (=> d!71439 m!325089))

(assert (=> d!71439 m!324321))

(declare-fun m!325091 () Bool)

(assert (=> d!71439 m!325091))

(declare-fun m!325093 () Bool)

(assert (=> d!71439 m!325093))

(declare-fun m!325095 () Bool)

(assert (=> d!71439 m!325095))

(declare-fun m!325097 () Bool)

(assert (=> d!71439 m!325097))

(declare-fun m!325099 () Bool)

(assert (=> d!71439 m!325099))

(declare-fun m!325101 () Bool)

(assert (=> d!71439 m!325101))

(declare-fun m!325103 () Bool)

(assert (=> b!211008 m!325103))

(assert (=> b!211008 m!324319))

(assert (=> b!211008 m!324337))

(assert (=> b!211011 m!324337))

(declare-fun m!325105 () Bool)

(assert (=> b!211011 m!325105))

(declare-fun m!325107 () Bool)

(assert (=> b!211011 m!325107))

(declare-fun m!325109 () Bool)

(assert (=> b!211009 m!325109))

(assert (=> b!210616 d!71439))

(declare-fun lt!331855 () tuple2!18070)

(declare-fun d!71441 () Bool)

(assert (=> d!71441 (= lt!331855 (readNBitsLSBFirstsLoop!0 (_1!9679 lt!330740) nBits!348 i!590 lt!330750))))

(assert (=> d!71441 (= (readNBitsLSBFirstsLoopPure!0 (_1!9679 lt!330740) nBits!348 i!590 lt!330750) (tuple2!18051 (_2!9690 lt!331855) (_1!9690 lt!331855)))))

(declare-fun bs!17537 () Bool)

(assert (= bs!17537 d!71441))

(declare-fun m!325111 () Bool)

(assert (=> bs!17537 m!325111))

(assert (=> b!210616 d!71441))

(declare-fun d!71443 () Bool)

(assert (=> d!71443 (= (invariant!0 (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204) (size!4610 (buf!5130 (_2!9678 lt!330745)))) (and (bvsge (currentBit!9673 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9673 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9678 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9678 thiss!1204) (size!4610 (buf!5130 (_2!9678 lt!330745)))) (and (= (currentBit!9673 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9678 thiss!1204) (size!4610 (buf!5130 (_2!9678 lt!330745))))))))))

(assert (=> b!210616 d!71443))

(declare-fun d!71445 () Bool)

(declare-fun e!143911 () Bool)

(assert (=> d!71445 e!143911))

(declare-fun res!177180 () Bool)

(assert (=> d!71445 (=> (not res!177180) (not e!143911))))

(declare-fun lt!331864 () tuple2!18052)

(declare-fun lt!331867 () tuple2!18052)

(assert (=> d!71445 (= res!177180 (= (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!331864))) (currentByte!9678 (_1!9681 lt!331864)) (currentBit!9673 (_1!9681 lt!331864))) (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!331867))) (currentByte!9678 (_1!9681 lt!331867)) (currentBit!9673 (_1!9681 lt!331867)))))))

(declare-fun lt!331866 () Unit!15009)

(declare-fun lt!331865 () BitStream!8328)

(declare-fun choose!50 (BitStream!8328 BitStream!8328 BitStream!8328 tuple2!18052 tuple2!18052 BitStream!8328 Bool tuple2!18052 tuple2!18052 BitStream!8328 Bool) Unit!15009)

(assert (=> d!71445 (= lt!331866 (choose!50 lt!330747 (_2!9678 lt!330753) lt!331865 lt!331864 (tuple2!18053 (_1!9681 lt!331864) (_2!9681 lt!331864)) (_1!9681 lt!331864) (_2!9681 lt!331864) lt!331867 (tuple2!18053 (_1!9681 lt!331867) (_2!9681 lt!331867)) (_1!9681 lt!331867) (_2!9681 lt!331867)))))

(assert (=> d!71445 (= lt!331867 (readBitPure!0 lt!331865))))

(assert (=> d!71445 (= lt!331864 (readBitPure!0 lt!330747))))

(assert (=> d!71445 (= lt!331865 (BitStream!8329 (buf!5130 (_2!9678 lt!330753)) (currentByte!9678 lt!330747) (currentBit!9673 lt!330747)))))

(assert (=> d!71445 (invariant!0 (currentBit!9673 lt!330747) (currentByte!9678 lt!330747) (size!4610 (buf!5130 (_2!9678 lt!330753))))))

(assert (=> d!71445 (= (readBitPrefixLemma!0 lt!330747 (_2!9678 lt!330753)) lt!331866)))

(declare-fun b!211015 () Bool)

(assert (=> b!211015 (= e!143911 (= (_2!9681 lt!331864) (_2!9681 lt!331867)))))

(assert (= (and d!71445 res!177180) b!211015))

(assert (=> d!71445 m!324355))

(declare-fun m!325113 () Bool)

(assert (=> d!71445 m!325113))

(declare-fun m!325115 () Bool)

(assert (=> d!71445 m!325115))

(declare-fun m!325117 () Bool)

(assert (=> d!71445 m!325117))

(declare-fun m!325119 () Bool)

(assert (=> d!71445 m!325119))

(declare-fun m!325121 () Bool)

(assert (=> d!71445 m!325121))

(assert (=> b!210616 d!71445))

(declare-fun d!71447 () Bool)

(declare-fun lt!331868 () tuple2!18072)

(assert (=> d!71447 (= lt!331868 (readBit!0 (BitStream!8329 (buf!5130 (_2!9678 lt!330753)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204))))))

(assert (=> d!71447 (= (readBitPure!0 (BitStream!8329 (buf!5130 (_2!9678 lt!330753)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204))) (tuple2!18053 (_2!9691 lt!331868) (_1!9691 lt!331868)))))

(declare-fun bs!17538 () Bool)

(assert (= bs!17538 d!71447))

(declare-fun m!325123 () Bool)

(assert (=> bs!17538 m!325123))

(assert (=> b!210616 d!71447))

(declare-fun d!71449 () Bool)

(assert (=> d!71449 (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))) ((_ sign_extend 32) (currentByte!9678 thiss!1204)) ((_ sign_extend 32) (currentBit!9673 thiss!1204)) lt!330734)))

(declare-fun lt!331871 () Unit!15009)

(declare-fun choose!9 (BitStream!8328 array!10492 (_ BitVec 64) BitStream!8328) Unit!15009)

(assert (=> d!71449 (= lt!331871 (choose!9 thiss!1204 (buf!5130 (_2!9678 lt!330753)) lt!330734 (BitStream!8329 (buf!5130 (_2!9678 lt!330753)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204))))))

(assert (=> d!71449 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5130 (_2!9678 lt!330753)) lt!330734) lt!331871)))

(declare-fun bs!17539 () Bool)

(assert (= bs!17539 d!71449))

(assert (=> bs!17539 m!324347))

(declare-fun m!325125 () Bool)

(assert (=> bs!17539 m!325125))

(assert (=> b!210616 d!71449))

(declare-fun d!71451 () Bool)

(declare-fun e!143912 () Bool)

(assert (=> d!71451 e!143912))

(declare-fun res!177182 () Bool)

(assert (=> d!71451 (=> (not res!177182) (not e!143912))))

(declare-fun lt!331876 () (_ BitVec 64))

(declare-fun lt!331873 () (_ BitVec 64))

(declare-fun lt!331875 () (_ BitVec 64))

(assert (=> d!71451 (= res!177182 (= lt!331876 (bvsub lt!331873 lt!331875)))))

(assert (=> d!71451 (or (= (bvand lt!331873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331875 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331873 lt!331875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71451 (= lt!331875 (remainingBits!0 ((_ sign_extend 32) (size!4610 (buf!5130 (_1!9681 lt!330748)))) ((_ sign_extend 32) (currentByte!9678 (_1!9681 lt!330748))) ((_ sign_extend 32) (currentBit!9673 (_1!9681 lt!330748)))))))

(declare-fun lt!331874 () (_ BitVec 64))

(declare-fun lt!331877 () (_ BitVec 64))

(assert (=> d!71451 (= lt!331873 (bvmul lt!331874 lt!331877))))

(assert (=> d!71451 (or (= lt!331874 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331877 (bvsdiv (bvmul lt!331874 lt!331877) lt!331874)))))

(assert (=> d!71451 (= lt!331877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71451 (= lt!331874 ((_ sign_extend 32) (size!4610 (buf!5130 (_1!9681 lt!330748)))))))

(assert (=> d!71451 (= lt!331876 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9678 (_1!9681 lt!330748))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9673 (_1!9681 lt!330748)))))))

(assert (=> d!71451 (invariant!0 (currentBit!9673 (_1!9681 lt!330748)) (currentByte!9678 (_1!9681 lt!330748)) (size!4610 (buf!5130 (_1!9681 lt!330748))))))

(assert (=> d!71451 (= (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!330748))) (currentByte!9678 (_1!9681 lt!330748)) (currentBit!9673 (_1!9681 lt!330748))) lt!331876)))

(declare-fun b!211016 () Bool)

(declare-fun res!177181 () Bool)

(assert (=> b!211016 (=> (not res!177181) (not e!143912))))

(assert (=> b!211016 (= res!177181 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331876))))

(declare-fun b!211017 () Bool)

(declare-fun lt!331872 () (_ BitVec 64))

(assert (=> b!211017 (= e!143912 (bvsle lt!331876 (bvmul lt!331872 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211017 (or (= lt!331872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331872)))))

(assert (=> b!211017 (= lt!331872 ((_ sign_extend 32) (size!4610 (buf!5130 (_1!9681 lt!330748)))))))

(assert (= (and d!71451 res!177182) b!211016))

(assert (= (and b!211016 res!177181) b!211017))

(declare-fun m!325127 () Bool)

(assert (=> d!71451 m!325127))

(declare-fun m!325129 () Bool)

(assert (=> d!71451 m!325129))

(assert (=> b!210616 d!71451))

(declare-fun d!71453 () Bool)

(assert (=> d!71453 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))) ((_ sign_extend 32) (currentByte!9678 thiss!1204)) ((_ sign_extend 32) (currentBit!9673 thiss!1204)) lt!330734) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))) ((_ sign_extend 32) (currentByte!9678 thiss!1204)) ((_ sign_extend 32) (currentBit!9673 thiss!1204))) lt!330734))))

(declare-fun bs!17540 () Bool)

(assert (= bs!17540 d!71453))

(declare-fun m!325131 () Bool)

(assert (=> bs!17540 m!325131))

(assert (=> b!210616 d!71453))

(declare-fun d!71455 () Bool)

(assert (=> d!71455 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!210616 d!71455))

(declare-fun d!71457 () Bool)

(assert (=> d!71457 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330745))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330745))) lt!330746) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330745))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330745)))) lt!330746))))

(declare-fun bs!17541 () Bool)

(assert (= bs!17541 d!71457))

(declare-fun m!325133 () Bool)

(assert (=> bs!17541 m!325133))

(assert (=> b!210616 d!71457))

(declare-fun lt!331878 () tuple2!18070)

(declare-fun d!71459 () Bool)

(assert (=> d!71459 (= lt!331878 (readNBitsLSBFirstsLoop!0 (_1!9679 lt!330751) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330743))))

(assert (=> d!71459 (= (readNBitsLSBFirstsLoopPure!0 (_1!9679 lt!330751) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330743) (tuple2!18051 (_2!9690 lt!331878) (_1!9690 lt!331878)))))

(declare-fun bs!17542 () Bool)

(assert (= bs!17542 d!71459))

(declare-fun m!325135 () Bool)

(assert (=> bs!17542 m!325135))

(assert (=> b!210616 d!71459))

(declare-fun lt!331891 () (_ BitVec 64))

(declare-fun b!211018 () Bool)

(declare-fun lt!331880 () (_ BitVec 64))

(declare-fun e!143913 () Bool)

(declare-fun lt!331896 () tuple2!18048)

(assert (=> b!211018 (= e!143913 (= (_1!9679 lt!331896) (withMovedBitIndex!0 (_2!9679 lt!331896) (bvsub lt!331880 lt!331891))))))

(assert (=> b!211018 (or (= (bvand lt!331880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331891 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331880 lt!331891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211018 (= lt!331891 (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330753))) (currentByte!9678 (_2!9678 lt!330753)) (currentBit!9673 (_2!9678 lt!330753))))))

(assert (=> b!211018 (= lt!331880 (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))))))

(declare-fun b!211019 () Bool)

(declare-fun res!177184 () Bool)

(assert (=> b!211019 (=> (not res!177184) (not e!143913))))

(assert (=> b!211019 (= res!177184 (isPrefixOf!0 (_2!9679 lt!331896) (_2!9678 lt!330753)))))

(declare-fun d!71461 () Bool)

(assert (=> d!71461 e!143913))

(declare-fun res!177183 () Bool)

(assert (=> d!71461 (=> (not res!177183) (not e!143913))))

(assert (=> d!71461 (= res!177183 (isPrefixOf!0 (_1!9679 lt!331896) (_2!9679 lt!331896)))))

(declare-fun lt!331881 () BitStream!8328)

(assert (=> d!71461 (= lt!331896 (tuple2!18049 lt!331881 (_2!9678 lt!330753)))))

(declare-fun lt!331887 () Unit!15009)

(declare-fun lt!331885 () Unit!15009)

(assert (=> d!71461 (= lt!331887 lt!331885)))

(assert (=> d!71461 (isPrefixOf!0 lt!331881 (_2!9678 lt!330753))))

(assert (=> d!71461 (= lt!331885 (lemmaIsPrefixTransitive!0 lt!331881 (_2!9678 lt!330753) (_2!9678 lt!330753)))))

(declare-fun lt!331890 () Unit!15009)

(declare-fun lt!331882 () Unit!15009)

(assert (=> d!71461 (= lt!331890 lt!331882)))

(assert (=> d!71461 (isPrefixOf!0 lt!331881 (_2!9678 lt!330753))))

(assert (=> d!71461 (= lt!331882 (lemmaIsPrefixTransitive!0 lt!331881 (_2!9678 lt!330745) (_2!9678 lt!330753)))))

(declare-fun lt!331895 () Unit!15009)

(declare-fun e!143914 () Unit!15009)

(assert (=> d!71461 (= lt!331895 e!143914)))

(declare-fun c!10388 () Bool)

(assert (=> d!71461 (= c!10388 (not (= (size!4610 (buf!5130 (_2!9678 lt!330745))) #b00000000000000000000000000000000)))))

(declare-fun lt!331879 () Unit!15009)

(declare-fun lt!331897 () Unit!15009)

(assert (=> d!71461 (= lt!331879 lt!331897)))

(assert (=> d!71461 (isPrefixOf!0 (_2!9678 lt!330753) (_2!9678 lt!330753))))

(assert (=> d!71461 (= lt!331897 (lemmaIsPrefixRefl!0 (_2!9678 lt!330753)))))

(declare-fun lt!331893 () Unit!15009)

(declare-fun lt!331892 () Unit!15009)

(assert (=> d!71461 (= lt!331893 lt!331892)))

(assert (=> d!71461 (= lt!331892 (lemmaIsPrefixRefl!0 (_2!9678 lt!330753)))))

(declare-fun lt!331886 () Unit!15009)

(declare-fun lt!331884 () Unit!15009)

(assert (=> d!71461 (= lt!331886 lt!331884)))

(assert (=> d!71461 (isPrefixOf!0 lt!331881 lt!331881)))

(assert (=> d!71461 (= lt!331884 (lemmaIsPrefixRefl!0 lt!331881))))

(declare-fun lt!331898 () Unit!15009)

(declare-fun lt!331883 () Unit!15009)

(assert (=> d!71461 (= lt!331898 lt!331883)))

(assert (=> d!71461 (isPrefixOf!0 (_2!9678 lt!330745) (_2!9678 lt!330745))))

(assert (=> d!71461 (= lt!331883 (lemmaIsPrefixRefl!0 (_2!9678 lt!330745)))))

(assert (=> d!71461 (= lt!331881 (BitStream!8329 (buf!5130 (_2!9678 lt!330753)) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))))))

(assert (=> d!71461 (isPrefixOf!0 (_2!9678 lt!330745) (_2!9678 lt!330753))))

(assert (=> d!71461 (= (reader!0 (_2!9678 lt!330745) (_2!9678 lt!330753)) lt!331896)))

(declare-fun b!211020 () Bool)

(declare-fun res!177185 () Bool)

(assert (=> b!211020 (=> (not res!177185) (not e!143913))))

(assert (=> b!211020 (= res!177185 (isPrefixOf!0 (_1!9679 lt!331896) (_2!9678 lt!330745)))))

(declare-fun b!211021 () Bool)

(declare-fun lt!331888 () Unit!15009)

(assert (=> b!211021 (= e!143914 lt!331888)))

(declare-fun lt!331889 () (_ BitVec 64))

(assert (=> b!211021 (= lt!331889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!331894 () (_ BitVec 64))

(assert (=> b!211021 (= lt!331894 (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))))))

(assert (=> b!211021 (= lt!331888 (arrayBitRangesEqSymmetric!0 (buf!5130 (_2!9678 lt!330745)) (buf!5130 (_2!9678 lt!330753)) lt!331889 lt!331894))))

(assert (=> b!211021 (arrayBitRangesEq!0 (buf!5130 (_2!9678 lt!330753)) (buf!5130 (_2!9678 lt!330745)) lt!331889 lt!331894)))

(declare-fun b!211022 () Bool)

(declare-fun Unit!15051 () Unit!15009)

(assert (=> b!211022 (= e!143914 Unit!15051)))

(assert (= (and d!71461 c!10388) b!211021))

(assert (= (and d!71461 (not c!10388)) b!211022))

(assert (= (and d!71461 res!177183) b!211020))

(assert (= (and b!211020 res!177185) b!211019))

(assert (= (and b!211019 res!177184) b!211018))

(declare-fun m!325137 () Bool)

(assert (=> b!211020 m!325137))

(declare-fun m!325139 () Bool)

(assert (=> d!71461 m!325139))

(declare-fun m!325141 () Bool)

(assert (=> d!71461 m!325141))

(declare-fun m!325143 () Bool)

(assert (=> d!71461 m!325143))

(declare-fun m!325145 () Bool)

(assert (=> d!71461 m!325145))

(assert (=> d!71461 m!324327))

(declare-fun m!325147 () Bool)

(assert (=> d!71461 m!325147))

(assert (=> d!71461 m!325033))

(declare-fun m!325149 () Bool)

(assert (=> d!71461 m!325149))

(declare-fun m!325151 () Bool)

(assert (=> d!71461 m!325151))

(assert (=> d!71461 m!325099))

(assert (=> d!71461 m!325101))

(declare-fun m!325153 () Bool)

(assert (=> b!211018 m!325153))

(assert (=> b!211018 m!324319))

(assert (=> b!211018 m!324335))

(assert (=> b!211021 m!324335))

(declare-fun m!325155 () Bool)

(assert (=> b!211021 m!325155))

(declare-fun m!325157 () Bool)

(assert (=> b!211021 m!325157))

(declare-fun m!325159 () Bool)

(assert (=> b!211019 m!325159))

(assert (=> b!210616 d!71461))

(declare-fun d!71463 () Bool)

(assert (=> d!71463 (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330753)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330745))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330745))) lt!330746)))

(declare-fun lt!331899 () Unit!15009)

(assert (=> d!71463 (= lt!331899 (choose!9 (_2!9678 lt!330745) (buf!5130 (_2!9678 lt!330753)) lt!330746 (BitStream!8329 (buf!5130 (_2!9678 lt!330753)) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745)))))))

(assert (=> d!71463 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9678 lt!330745) (buf!5130 (_2!9678 lt!330753)) lt!330746) lt!331899)))

(declare-fun bs!17543 () Bool)

(assert (= bs!17543 d!71463))

(assert (=> bs!17543 m!324345))

(declare-fun m!325161 () Bool)

(assert (=> bs!17543 m!325161))

(assert (=> b!210616 d!71463))

(declare-fun d!71465 () Bool)

(declare-fun lt!331900 () tuple2!18072)

(assert (=> d!71465 (= lt!331900 (readBit!0 (_1!9679 lt!330740)))))

(assert (=> d!71465 (= (readBitPure!0 (_1!9679 lt!330740)) (tuple2!18053 (_2!9691 lt!331900) (_1!9691 lt!331900)))))

(declare-fun bs!17544 () Bool)

(assert (= bs!17544 d!71465))

(declare-fun m!325163 () Bool)

(assert (=> bs!17544 m!325163))

(assert (=> b!210616 d!71465))

(declare-fun d!71467 () Bool)

(declare-fun lt!331901 () tuple2!18072)

(assert (=> d!71467 (= lt!331901 (readBit!0 lt!330747))))

(assert (=> d!71467 (= (readBitPure!0 lt!330747) (tuple2!18053 (_2!9691 lt!331901) (_1!9691 lt!331901)))))

(declare-fun bs!17545 () Bool)

(assert (= bs!17545 d!71467))

(declare-fun m!325165 () Bool)

(assert (=> bs!17545 m!325165))

(assert (=> b!210616 d!71467))

(assert (=> b!210605 d!71431))

(declare-fun d!71469 () Bool)

(assert (=> d!71469 (= (array_inv!4351 (buf!5130 thiss!1204)) (bvsge (size!4610 (buf!5130 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!210606 d!71469))

(declare-fun d!71471 () Bool)

(declare-fun e!143915 () Bool)

(assert (=> d!71471 e!143915))

(declare-fun res!177187 () Bool)

(assert (=> d!71471 (=> (not res!177187) (not e!143915))))

(declare-fun lt!331905 () (_ BitVec 64))

(declare-fun lt!331903 () (_ BitVec 64))

(declare-fun lt!331906 () (_ BitVec 64))

(assert (=> d!71471 (= res!177187 (= lt!331906 (bvsub lt!331903 lt!331905)))))

(assert (=> d!71471 (or (= (bvand lt!331903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331905 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331903 lt!331905) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71471 (= lt!331905 (remainingBits!0 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330745)))) ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330745))) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330745)))))))

(declare-fun lt!331904 () (_ BitVec 64))

(declare-fun lt!331907 () (_ BitVec 64))

(assert (=> d!71471 (= lt!331903 (bvmul lt!331904 lt!331907))))

(assert (=> d!71471 (or (= lt!331904 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331907 (bvsdiv (bvmul lt!331904 lt!331907) lt!331904)))))

(assert (=> d!71471 (= lt!331907 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71471 (= lt!331904 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330745)))))))

(assert (=> d!71471 (= lt!331906 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9678 (_2!9678 lt!330745))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9673 (_2!9678 lt!330745)))))))

(assert (=> d!71471 (invariant!0 (currentBit!9673 (_2!9678 lt!330745)) (currentByte!9678 (_2!9678 lt!330745)) (size!4610 (buf!5130 (_2!9678 lt!330745))))))

(assert (=> d!71471 (= (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))) lt!331906)))

(declare-fun b!211023 () Bool)

(declare-fun res!177186 () Bool)

(assert (=> b!211023 (=> (not res!177186) (not e!143915))))

(assert (=> b!211023 (= res!177186 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331906))))

(declare-fun b!211024 () Bool)

(declare-fun lt!331902 () (_ BitVec 64))

(assert (=> b!211024 (= e!143915 (bvsle lt!331906 (bvmul lt!331902 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211024 (or (= lt!331902 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331902 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331902)))))

(assert (=> b!211024 (= lt!331902 ((_ sign_extend 32) (size!4610 (buf!5130 (_2!9678 lt!330745)))))))

(assert (= (and d!71471 res!177187) b!211023))

(assert (= (and b!211023 res!177186) b!211024))

(declare-fun m!325167 () Bool)

(assert (=> d!71471 m!325167))

(assert (=> d!71471 m!325065))

(assert (=> b!210617 d!71471))

(declare-fun d!71473 () Bool)

(declare-fun e!143916 () Bool)

(assert (=> d!71473 e!143916))

(declare-fun res!177189 () Bool)

(assert (=> d!71473 (=> (not res!177189) (not e!143916))))

(declare-fun lt!331909 () (_ BitVec 64))

(declare-fun lt!331911 () (_ BitVec 64))

(declare-fun lt!331912 () (_ BitVec 64))

(assert (=> d!71473 (= res!177189 (= lt!331912 (bvsub lt!331909 lt!331911)))))

(assert (=> d!71473 (or (= (bvand lt!331909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331909 lt!331911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71473 (= lt!331911 (remainingBits!0 ((_ sign_extend 32) (size!4610 (buf!5130 thiss!1204))) ((_ sign_extend 32) (currentByte!9678 thiss!1204)) ((_ sign_extend 32) (currentBit!9673 thiss!1204))))))

(declare-fun lt!331910 () (_ BitVec 64))

(declare-fun lt!331913 () (_ BitVec 64))

(assert (=> d!71473 (= lt!331909 (bvmul lt!331910 lt!331913))))

(assert (=> d!71473 (or (= lt!331910 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331913 (bvsdiv (bvmul lt!331910 lt!331913) lt!331910)))))

(assert (=> d!71473 (= lt!331913 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71473 (= lt!331910 ((_ sign_extend 32) (size!4610 (buf!5130 thiss!1204))))))

(assert (=> d!71473 (= lt!331912 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9678 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9673 thiss!1204))))))

(assert (=> d!71473 (invariant!0 (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204) (size!4610 (buf!5130 thiss!1204)))))

(assert (=> d!71473 (= (bitIndex!0 (size!4610 (buf!5130 thiss!1204)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)) lt!331912)))

(declare-fun b!211025 () Bool)

(declare-fun res!177188 () Bool)

(assert (=> b!211025 (=> (not res!177188) (not e!143916))))

(assert (=> b!211025 (= res!177188 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331912))))

(declare-fun b!211026 () Bool)

(declare-fun lt!331908 () (_ BitVec 64))

(assert (=> b!211026 (= e!143916 (bvsle lt!331912 (bvmul lt!331908 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211026 (or (= lt!331908 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331908 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331908)))))

(assert (=> b!211026 (= lt!331908 ((_ sign_extend 32) (size!4610 (buf!5130 thiss!1204))))))

(assert (= (and d!71473 res!177189) b!211025))

(assert (= (and b!211025 res!177188) b!211026))

(declare-fun m!325169 () Bool)

(assert (=> d!71473 m!325169))

(assert (=> d!71473 m!324315))

(assert (=> b!210617 d!71473))

(declare-fun b!211038 () Bool)

(declare-fun e!143921 () Bool)

(declare-fun e!143922 () Bool)

(assert (=> b!211038 (= e!143921 e!143922)))

(declare-fun res!177199 () Bool)

(assert (=> b!211038 (=> (not res!177199) (not e!143922))))

(declare-fun lt!331923 () tuple2!18052)

(declare-fun lt!331924 () tuple2!18046)

(assert (=> b!211038 (= res!177199 (and (= (_2!9681 lt!331923) lt!330728) (= (_1!9681 lt!331923) (_2!9678 lt!331924))))))

(assert (=> b!211038 (= lt!331923 (readBitPure!0 (readerFrom!0 (_2!9678 lt!331924) (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204))))))

(declare-fun b!211037 () Bool)

(declare-fun res!177198 () Bool)

(assert (=> b!211037 (=> (not res!177198) (not e!143921))))

(assert (=> b!211037 (= res!177198 (isPrefixOf!0 thiss!1204 (_2!9678 lt!331924)))))

(declare-fun b!211039 () Bool)

(assert (=> b!211039 (= e!143922 (= (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!331923))) (currentByte!9678 (_1!9681 lt!331923)) (currentBit!9673 (_1!9681 lt!331923))) (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!331924))) (currentByte!9678 (_2!9678 lt!331924)) (currentBit!9673 (_2!9678 lt!331924)))))))

(declare-fun b!211036 () Bool)

(declare-fun res!177201 () Bool)

(assert (=> b!211036 (=> (not res!177201) (not e!143921))))

(declare-fun lt!331922 () (_ BitVec 64))

(declare-fun lt!331925 () (_ BitVec 64))

(assert (=> b!211036 (= res!177201 (= (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!331924))) (currentByte!9678 (_2!9678 lt!331924)) (currentBit!9673 (_2!9678 lt!331924))) (bvadd lt!331922 lt!331925)))))

(assert (=> b!211036 (or (not (= (bvand lt!331922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331925 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!331922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!331922 lt!331925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211036 (= lt!331925 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!211036 (= lt!331922 (bitIndex!0 (size!4610 (buf!5130 thiss!1204)) (currentByte!9678 thiss!1204) (currentBit!9673 thiss!1204)))))

(declare-fun d!71475 () Bool)

(assert (=> d!71475 e!143921))

(declare-fun res!177200 () Bool)

(assert (=> d!71475 (=> (not res!177200) (not e!143921))))

(assert (=> d!71475 (= res!177200 (= (size!4610 (buf!5130 thiss!1204)) (size!4610 (buf!5130 (_2!9678 lt!331924)))))))

(declare-fun choose!16 (BitStream!8328 Bool) tuple2!18046)

(assert (=> d!71475 (= lt!331924 (choose!16 thiss!1204 lt!330728))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71475 (validate_offset_bit!0 ((_ sign_extend 32) (size!4610 (buf!5130 thiss!1204))) ((_ sign_extend 32) (currentByte!9678 thiss!1204)) ((_ sign_extend 32) (currentBit!9673 thiss!1204)))))

(assert (=> d!71475 (= (appendBit!0 thiss!1204 lt!330728) lt!331924)))

(assert (= (and d!71475 res!177200) b!211036))

(assert (= (and b!211036 res!177201) b!211037))

(assert (= (and b!211037 res!177198) b!211038))

(assert (= (and b!211038 res!177199) b!211039))

(declare-fun m!325171 () Bool)

(assert (=> b!211038 m!325171))

(assert (=> b!211038 m!325171))

(declare-fun m!325173 () Bool)

(assert (=> b!211038 m!325173))

(declare-fun m!325175 () Bool)

(assert (=> b!211037 m!325175))

(declare-fun m!325177 () Bool)

(assert (=> b!211036 m!325177))

(assert (=> b!211036 m!324337))

(declare-fun m!325179 () Bool)

(assert (=> b!211039 m!325179))

(assert (=> b!211039 m!325177))

(declare-fun m!325181 () Bool)

(assert (=> d!71475 m!325181))

(declare-fun m!325183 () Bool)

(assert (=> d!71475 m!325183))

(assert (=> b!210617 d!71475))

(assert (=> b!210618 d!71471))

(assert (=> b!210618 d!71473))

(declare-fun d!71477 () Bool)

(assert (=> d!71477 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4610 (buf!5130 thiss!1204))) ((_ sign_extend 32) (currentByte!9678 thiss!1204)) ((_ sign_extend 32) (currentBit!9673 thiss!1204)) lt!330734) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4610 (buf!5130 thiss!1204))) ((_ sign_extend 32) (currentByte!9678 thiss!1204)) ((_ sign_extend 32) (currentBit!9673 thiss!1204))) lt!330734))))

(declare-fun bs!17546 () Bool)

(assert (= bs!17546 d!71477))

(assert (=> bs!17546 m!325169))

(assert (=> b!210608 d!71477))

(declare-fun d!71479 () Bool)

(declare-fun e!143923 () Bool)

(assert (=> d!71479 e!143923))

(declare-fun res!177203 () Bool)

(assert (=> d!71479 (=> (not res!177203) (not e!143923))))

(declare-fun lt!331929 () (_ BitVec 64))

(declare-fun lt!331930 () (_ BitVec 64))

(declare-fun lt!331927 () (_ BitVec 64))

(assert (=> d!71479 (= res!177203 (= lt!331930 (bvsub lt!331927 lt!331929)))))

(assert (=> d!71479 (or (= (bvand lt!331927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331929 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331927 lt!331929) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71479 (= lt!331929 (remainingBits!0 ((_ sign_extend 32) (size!4610 (buf!5130 (_1!9681 lt!330736)))) ((_ sign_extend 32) (currentByte!9678 (_1!9681 lt!330736))) ((_ sign_extend 32) (currentBit!9673 (_1!9681 lt!330736)))))))

(declare-fun lt!331928 () (_ BitVec 64))

(declare-fun lt!331931 () (_ BitVec 64))

(assert (=> d!71479 (= lt!331927 (bvmul lt!331928 lt!331931))))

(assert (=> d!71479 (or (= lt!331928 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331931 (bvsdiv (bvmul lt!331928 lt!331931) lt!331928)))))

(assert (=> d!71479 (= lt!331931 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71479 (= lt!331928 ((_ sign_extend 32) (size!4610 (buf!5130 (_1!9681 lt!330736)))))))

(assert (=> d!71479 (= lt!331930 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9678 (_1!9681 lt!330736))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9673 (_1!9681 lt!330736)))))))

(assert (=> d!71479 (invariant!0 (currentBit!9673 (_1!9681 lt!330736)) (currentByte!9678 (_1!9681 lt!330736)) (size!4610 (buf!5130 (_1!9681 lt!330736))))))

(assert (=> d!71479 (= (bitIndex!0 (size!4610 (buf!5130 (_1!9681 lt!330736))) (currentByte!9678 (_1!9681 lt!330736)) (currentBit!9673 (_1!9681 lt!330736))) lt!331930)))

(declare-fun b!211040 () Bool)

(declare-fun res!177202 () Bool)

(assert (=> b!211040 (=> (not res!177202) (not e!143923))))

(assert (=> b!211040 (= res!177202 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331930))))

(declare-fun b!211041 () Bool)

(declare-fun lt!331926 () (_ BitVec 64))

(assert (=> b!211041 (= e!143923 (bvsle lt!331930 (bvmul lt!331926 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211041 (or (= lt!331926 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331926 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331926)))))

(assert (=> b!211041 (= lt!331926 ((_ sign_extend 32) (size!4610 (buf!5130 (_1!9681 lt!330736)))))))

(assert (= (and d!71479 res!177203) b!211040))

(assert (= (and b!211040 res!177202) b!211041))

(declare-fun m!325185 () Bool)

(assert (=> d!71479 m!325185))

(declare-fun m!325187 () Bool)

(assert (=> d!71479 m!325187))

(assert (=> b!210620 d!71479))

(declare-fun d!71481 () Bool)

(assert (=> d!71481 (= (invariant!0 (currentBit!9673 thiss!1204) (currentByte!9678 thiss!1204) (size!4610 (buf!5130 thiss!1204))) (and (bvsge (currentBit!9673 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9673 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9678 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9678 thiss!1204) (size!4610 (buf!5130 thiss!1204))) (and (= (currentBit!9673 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9678 thiss!1204) (size!4610 (buf!5130 thiss!1204)))))))))

(assert (=> b!210609 d!71481))

(declare-fun d!71483 () Bool)

(declare-fun res!177206 () Bool)

(declare-fun e!143924 () Bool)

(assert (=> d!71483 (=> (not res!177206) (not e!143924))))

(assert (=> d!71483 (= res!177206 (= (size!4610 (buf!5130 (_2!9678 lt!330745))) (size!4610 (buf!5130 (_2!9678 lt!330753)))))))

(assert (=> d!71483 (= (isPrefixOf!0 (_2!9678 lt!330745) (_2!9678 lt!330753)) e!143924)))

(declare-fun b!211042 () Bool)

(declare-fun res!177204 () Bool)

(assert (=> b!211042 (=> (not res!177204) (not e!143924))))

(assert (=> b!211042 (= res!177204 (bvsle (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745))) (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330753))) (currentByte!9678 (_2!9678 lt!330753)) (currentBit!9673 (_2!9678 lt!330753)))))))

(declare-fun b!211043 () Bool)

(declare-fun e!143925 () Bool)

(assert (=> b!211043 (= e!143924 e!143925)))

(declare-fun res!177205 () Bool)

(assert (=> b!211043 (=> res!177205 e!143925)))

(assert (=> b!211043 (= res!177205 (= (size!4610 (buf!5130 (_2!9678 lt!330745))) #b00000000000000000000000000000000))))

(declare-fun b!211044 () Bool)

(assert (=> b!211044 (= e!143925 (arrayBitRangesEq!0 (buf!5130 (_2!9678 lt!330745)) (buf!5130 (_2!9678 lt!330753)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4610 (buf!5130 (_2!9678 lt!330745))) (currentByte!9678 (_2!9678 lt!330745)) (currentBit!9673 (_2!9678 lt!330745)))))))

(assert (= (and d!71483 res!177206) b!211042))

(assert (= (and b!211042 res!177204) b!211043))

(assert (= (and b!211043 (not res!177205)) b!211044))

(assert (=> b!211042 m!324335))

(assert (=> b!211042 m!324319))

(assert (=> b!211044 m!324335))

(assert (=> b!211044 m!324335))

(declare-fun m!325189 () Bool)

(assert (=> b!211044 m!325189))

(assert (=> b!210610 d!71483))

(check-sat (not d!71465) (not b!211036) (not b!211010) (not b!211019) (not d!71463) (not b!210970) (not b!210980) (not d!71385) (not d!71419) (not b!210991) (not b!211021) (not d!71477) (not b!211020) (not d!71453) (not b!210979) (not d!71439) (not b!211037) (not d!71425) (not d!71447) (not d!71471) (not bm!3321) (not d!71417) (not d!71459) (not b!210992) (not d!71427) (not b!211039) (not b!210828) (not b!211011) (not d!71433) (not b!211038) (not b!210830) (not b!211009) (not d!71461) (not d!71423) (not b!211044) (not d!71473) (not d!71451) (not d!71445) (not d!71479) (not d!71449) (not d!71457) (not b!210976) (not b!210981) (not b!210973) (not b!211008) (not d!71387) (not d!71467) (not d!71437) (not b!211018) (not b!210994) (not d!71421) (not b!210977) (not d!71441) (not d!71381) (not b!210983) (not b!211042) (not d!71475) (not b!210971))
