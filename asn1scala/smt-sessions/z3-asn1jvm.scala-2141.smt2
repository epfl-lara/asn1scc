; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54512 () Bool)

(assert start!54512)

(declare-fun b!254791 () Bool)

(declare-fun e!176549 () Bool)

(declare-datatypes ((array!13758 0))(
  ( (array!13759 (arr!7022 (Array (_ BitVec 32) (_ BitVec 8))) (size!6035 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10992 0))(
  ( (BitStream!10993 (buf!6549 array!13758) (currentByte!12022 (_ BitVec 32)) (currentBit!12017 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10992)

(declare-fun array_inv!5776 (array!13758) Bool)

(assert (=> b!254791 (= e!176549 (array_inv!5776 (buf!6549 thiss!1005)))))

(declare-fun b!254792 () Bool)

(declare-fun res!213508 () Bool)

(declare-fun e!176545 () Bool)

(assert (=> b!254792 (=> (not res!213508) (not e!176545))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!254792 (= res!213508 (bvslt from!289 nBits!297))))

(declare-fun b!254793 () Bool)

(declare-fun e!176548 () Bool)

(assert (=> b!254793 (= e!176545 (not e!176548))))

(declare-fun res!213505 () Bool)

(assert (=> b!254793 (=> res!213505 e!176548)))

(declare-datatypes ((tuple2!21792 0))(
  ( (tuple2!21793 (_1!11830 BitStream!10992) (_2!11830 Bool)) )
))
(declare-fun lt!395614 () tuple2!21792)

(declare-datatypes ((tuple2!21794 0))(
  ( (tuple2!21795 (_1!11831 BitStream!10992) (_2!11831 BitStream!10992)) )
))
(declare-fun lt!395628 () tuple2!21794)

(assert (=> b!254793 (= res!213505 (not (= (_1!11830 lt!395614) (_2!11831 lt!395628))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10992 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21792)

(assert (=> b!254793 (= lt!395614 (checkBitsLoopPure!0 (_1!11831 lt!395628) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18272 0))(
  ( (Unit!18273) )
))
(declare-datatypes ((tuple2!21796 0))(
  ( (tuple2!21797 (_1!11832 Unit!18272) (_2!11832 BitStream!10992)) )
))
(declare-fun lt!395620 () tuple2!21796)

(declare-fun lt!395633 () tuple2!21796)

(declare-fun lt!395617 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!254793 (validate_offset_bits!1 ((_ sign_extend 32) (size!6035 (buf!6549 (_2!11832 lt!395620)))) ((_ sign_extend 32) (currentByte!12022 (_2!11832 lt!395633))) ((_ sign_extend 32) (currentBit!12017 (_2!11832 lt!395633))) lt!395617)))

(declare-fun lt!395634 () Unit!18272)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10992 array!13758 (_ BitVec 64)) Unit!18272)

(assert (=> b!254793 (= lt!395634 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11832 lt!395633) (buf!6549 (_2!11832 lt!395620)) lt!395617))))

(declare-fun lt!395626 () tuple2!21794)

(declare-fun lt!395613 () tuple2!21792)

(assert (=> b!254793 (= lt!395613 (checkBitsLoopPure!0 (_1!11831 lt!395626) nBits!297 bit!26 from!289))))

(assert (=> b!254793 (validate_offset_bits!1 ((_ sign_extend 32) (size!6035 (buf!6549 (_2!11832 lt!395620)))) ((_ sign_extend 32) (currentByte!12022 thiss!1005)) ((_ sign_extend 32) (currentBit!12017 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!395619 () Unit!18272)

(assert (=> b!254793 (= lt!395619 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6549 (_2!11832 lt!395620)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10992) tuple2!21792)

(assert (=> b!254793 (= (_2!11830 (readBitPure!0 (_1!11831 lt!395626))) bit!26)))

(declare-fun reader!0 (BitStream!10992 BitStream!10992) tuple2!21794)

(assert (=> b!254793 (= lt!395628 (reader!0 (_2!11832 lt!395633) (_2!11832 lt!395620)))))

(assert (=> b!254793 (= lt!395626 (reader!0 thiss!1005 (_2!11832 lt!395620)))))

(declare-fun e!176542 () Bool)

(assert (=> b!254793 e!176542))

(declare-fun res!213506 () Bool)

(assert (=> b!254793 (=> (not res!213506) (not e!176542))))

(declare-fun lt!395627 () tuple2!21792)

(declare-fun lt!395624 () tuple2!21792)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!254793 (= res!213506 (= (bitIndex!0 (size!6035 (buf!6549 (_1!11830 lt!395627))) (currentByte!12022 (_1!11830 lt!395627)) (currentBit!12017 (_1!11830 lt!395627))) (bitIndex!0 (size!6035 (buf!6549 (_1!11830 lt!395624))) (currentByte!12022 (_1!11830 lt!395624)) (currentBit!12017 (_1!11830 lt!395624)))))))

(declare-fun lt!395621 () Unit!18272)

(declare-fun lt!395623 () BitStream!10992)

(declare-fun readBitPrefixLemma!0 (BitStream!10992 BitStream!10992) Unit!18272)

(assert (=> b!254793 (= lt!395621 (readBitPrefixLemma!0 lt!395623 (_2!11832 lt!395620)))))

(assert (=> b!254793 (= lt!395624 (readBitPure!0 (BitStream!10993 (buf!6549 (_2!11832 lt!395620)) (currentByte!12022 thiss!1005) (currentBit!12017 thiss!1005))))))

(assert (=> b!254793 (= lt!395627 (readBitPure!0 lt!395623))))

(assert (=> b!254793 (= lt!395623 (BitStream!10993 (buf!6549 (_2!11832 lt!395633)) (currentByte!12022 thiss!1005) (currentBit!12017 thiss!1005)))))

(declare-fun e!176541 () Bool)

(assert (=> b!254793 e!176541))

(declare-fun res!213498 () Bool)

(assert (=> b!254793 (=> (not res!213498) (not e!176541))))

(declare-fun isPrefixOf!0 (BitStream!10992 BitStream!10992) Bool)

(assert (=> b!254793 (= res!213498 (isPrefixOf!0 thiss!1005 (_2!11832 lt!395620)))))

(declare-fun lt!395616 () Unit!18272)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10992 BitStream!10992 BitStream!10992) Unit!18272)

(assert (=> b!254793 (= lt!395616 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11832 lt!395633) (_2!11832 lt!395620)))))

(declare-fun e!176550 () Bool)

(assert (=> b!254793 e!176550))

(declare-fun res!213501 () Bool)

(assert (=> b!254793 (=> (not res!213501) (not e!176550))))

(assert (=> b!254793 (= res!213501 (= (size!6035 (buf!6549 (_2!11832 lt!395633))) (size!6035 (buf!6549 (_2!11832 lt!395620)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10992 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21796)

(assert (=> b!254793 (= lt!395620 (appendNBitsLoop!0 (_2!11832 lt!395633) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254793 (validate_offset_bits!1 ((_ sign_extend 32) (size!6035 (buf!6549 (_2!11832 lt!395633)))) ((_ sign_extend 32) (currentByte!12022 (_2!11832 lt!395633))) ((_ sign_extend 32) (currentBit!12017 (_2!11832 lt!395633))) lt!395617)))

(assert (=> b!254793 (= lt!395617 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!395625 () Unit!18272)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10992 BitStream!10992 (_ BitVec 64) (_ BitVec 64)) Unit!18272)

(assert (=> b!254793 (= lt!395625 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11832 lt!395633) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!176543 () Bool)

(assert (=> b!254793 e!176543))

(declare-fun res!213503 () Bool)

(assert (=> b!254793 (=> (not res!213503) (not e!176543))))

(assert (=> b!254793 (= res!213503 (= (size!6035 (buf!6549 thiss!1005)) (size!6035 (buf!6549 (_2!11832 lt!395633)))))))

(declare-fun appendBit!0 (BitStream!10992 Bool) tuple2!21796)

(assert (=> b!254793 (= lt!395633 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!213497 () Bool)

(assert (=> start!54512 (=> (not res!213497) (not e!176545))))

(assert (=> start!54512 (= res!213497 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54512 e!176545))

(assert (=> start!54512 true))

(declare-fun inv!12 (BitStream!10992) Bool)

(assert (=> start!54512 (and (inv!12 thiss!1005) e!176549)))

(declare-fun b!254794 () Bool)

(declare-fun res!213496 () Bool)

(assert (=> b!254794 (=> (not res!213496) (not e!176545))))

(assert (=> b!254794 (= res!213496 (validate_offset_bits!1 ((_ sign_extend 32) (size!6035 (buf!6549 thiss!1005))) ((_ sign_extend 32) (currentByte!12022 thiss!1005)) ((_ sign_extend 32) (currentBit!12017 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!254795 () Bool)

(declare-fun e!176547 () Bool)

(assert (=> b!254795 (= e!176548 e!176547)))

(declare-fun res!213504 () Bool)

(assert (=> b!254795 (=> res!213504 e!176547)))

(assert (=> b!254795 (= res!213504 (not (= (size!6035 (buf!6549 thiss!1005)) (size!6035 (buf!6549 (_2!11832 lt!395620))))))))

(assert (=> b!254795 (and (= (_2!11830 lt!395613) (_2!11830 lt!395614)) (= (_1!11830 lt!395613) (_2!11831 lt!395626)))))

(declare-fun b!254796 () Bool)

(declare-fun e!176551 () Bool)

(declare-fun lt!395630 () tuple2!21792)

(declare-fun lt!395629 () tuple2!21794)

(assert (=> b!254796 (= e!176551 (not (or (not (_2!11830 lt!395630)) (not (= (_1!11830 lt!395630) (_2!11831 lt!395629))))))))

(assert (=> b!254796 (= lt!395630 (checkBitsLoopPure!0 (_1!11831 lt!395629) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!395631 () (_ BitVec 64))

(assert (=> b!254796 (validate_offset_bits!1 ((_ sign_extend 32) (size!6035 (buf!6549 (_2!11832 lt!395620)))) ((_ sign_extend 32) (currentByte!12022 (_2!11832 lt!395633))) ((_ sign_extend 32) (currentBit!12017 (_2!11832 lt!395633))) lt!395631)))

(declare-fun lt!395622 () Unit!18272)

(assert (=> b!254796 (= lt!395622 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11832 lt!395633) (buf!6549 (_2!11832 lt!395620)) lt!395631))))

(assert (=> b!254796 (= lt!395629 (reader!0 (_2!11832 lt!395633) (_2!11832 lt!395620)))))

(declare-fun b!254797 () Bool)

(assert (=> b!254797 (= e!176542 (= (_2!11830 lt!395627) (_2!11830 lt!395624)))))

(declare-fun b!254798 () Bool)

(assert (=> b!254798 (= e!176550 e!176551)))

(declare-fun res!213502 () Bool)

(assert (=> b!254798 (=> (not res!213502) (not e!176551))))

(assert (=> b!254798 (= res!213502 (= (bitIndex!0 (size!6035 (buf!6549 (_2!11832 lt!395620))) (currentByte!12022 (_2!11832 lt!395620)) (currentBit!12017 (_2!11832 lt!395620))) (bvadd (bitIndex!0 (size!6035 (buf!6549 (_2!11832 lt!395633))) (currentByte!12022 (_2!11832 lt!395633)) (currentBit!12017 (_2!11832 lt!395633))) lt!395631)))))

(assert (=> b!254798 (= lt!395631 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!254799 () Bool)

(declare-fun res!213509 () Bool)

(assert (=> b!254799 (=> res!213509 e!176548)))

(declare-fun withMovedBitIndex!0 (BitStream!10992 (_ BitVec 64)) BitStream!10992)

(assert (=> b!254799 (= res!213509 (not (= (_1!11831 lt!395628) (withMovedBitIndex!0 (_1!11831 lt!395626) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!254800 () Bool)

(declare-fun res!213510 () Bool)

(declare-fun e!176546 () Bool)

(assert (=> b!254800 (=> (not res!213510) (not e!176546))))

(assert (=> b!254800 (= res!213510 (isPrefixOf!0 thiss!1005 (_2!11832 lt!395633)))))

(declare-fun b!254801 () Bool)

(declare-fun e!176544 () Bool)

(declare-fun lt!395612 () tuple2!21792)

(declare-fun lt!395618 () (_ BitVec 64))

(assert (=> b!254801 (= e!176544 (= (bitIndex!0 (size!6035 (buf!6549 (_1!11830 lt!395612))) (currentByte!12022 (_1!11830 lt!395612)) (currentBit!12017 (_1!11830 lt!395612))) lt!395618))))

(declare-fun b!254802 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254802 (= e!176541 (invariant!0 (currentBit!12017 thiss!1005) (currentByte!12022 thiss!1005) (size!6035 (buf!6549 (_2!11832 lt!395620)))))))

(declare-fun b!254803 () Bool)

(assert (=> b!254803 (= e!176543 e!176546)))

(declare-fun res!213500 () Bool)

(assert (=> b!254803 (=> (not res!213500) (not e!176546))))

(declare-fun lt!395632 () (_ BitVec 64))

(assert (=> b!254803 (= res!213500 (= lt!395618 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!395632)))))

(assert (=> b!254803 (= lt!395618 (bitIndex!0 (size!6035 (buf!6549 (_2!11832 lt!395633))) (currentByte!12022 (_2!11832 lt!395633)) (currentBit!12017 (_2!11832 lt!395633))))))

(assert (=> b!254803 (= lt!395632 (bitIndex!0 (size!6035 (buf!6549 thiss!1005)) (currentByte!12022 thiss!1005) (currentBit!12017 thiss!1005)))))

(declare-fun b!254804 () Bool)

(assert (=> b!254804 (= e!176546 e!176544)))

(declare-fun res!213495 () Bool)

(assert (=> b!254804 (=> (not res!213495) (not e!176544))))

(assert (=> b!254804 (= res!213495 (and (= (_2!11830 lt!395612) bit!26) (= (_1!11830 lt!395612) (_2!11832 lt!395633))))))

(declare-fun readerFrom!0 (BitStream!10992 (_ BitVec 32) (_ BitVec 32)) BitStream!10992)

(assert (=> b!254804 (= lt!395612 (readBitPure!0 (readerFrom!0 (_2!11832 lt!395633) (currentBit!12017 thiss!1005) (currentByte!12022 thiss!1005))))))

(declare-fun b!254805 () Bool)

(declare-fun res!213499 () Bool)

(assert (=> b!254805 (=> (not res!213499) (not e!176551))))

(assert (=> b!254805 (= res!213499 (isPrefixOf!0 (_2!11832 lt!395633) (_2!11832 lt!395620)))))

(declare-fun b!254806 () Bool)

(declare-fun res!213507 () Bool)

(assert (=> b!254806 (=> (not res!213507) (not e!176541))))

(assert (=> b!254806 (= res!213507 (invariant!0 (currentBit!12017 thiss!1005) (currentByte!12022 thiss!1005) (size!6035 (buf!6549 (_2!11832 lt!395633)))))))

(declare-fun b!254807 () Bool)

(assert (=> b!254807 (= e!176547 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!395615 () (_ BitVec 64))

(assert (=> b!254807 (= lt!395615 (bitIndex!0 (size!6035 (buf!6549 thiss!1005)) (currentByte!12022 thiss!1005) (currentBit!12017 thiss!1005)))))

(assert (= (and start!54512 res!213497) b!254794))

(assert (= (and b!254794 res!213496) b!254792))

(assert (= (and b!254792 res!213508) b!254793))

(assert (= (and b!254793 res!213503) b!254803))

(assert (= (and b!254803 res!213500) b!254800))

(assert (= (and b!254800 res!213510) b!254804))

(assert (= (and b!254804 res!213495) b!254801))

(assert (= (and b!254793 res!213501) b!254798))

(assert (= (and b!254798 res!213502) b!254805))

(assert (= (and b!254805 res!213499) b!254796))

(assert (= (and b!254793 res!213498) b!254806))

(assert (= (and b!254806 res!213507) b!254802))

(assert (= (and b!254793 res!213506) b!254797))

(assert (= (and b!254793 (not res!213505)) b!254799))

(assert (= (and b!254799 (not res!213509)) b!254795))

(assert (= (and b!254795 (not res!213504)) b!254807))

(assert (= start!54512 b!254791))

(declare-fun m!383753 () Bool)

(assert (=> start!54512 m!383753))

(declare-fun m!383755 () Bool)

(assert (=> b!254806 m!383755))

(declare-fun m!383757 () Bool)

(assert (=> b!254796 m!383757))

(declare-fun m!383759 () Bool)

(assert (=> b!254796 m!383759))

(declare-fun m!383761 () Bool)

(assert (=> b!254796 m!383761))

(declare-fun m!383763 () Bool)

(assert (=> b!254796 m!383763))

(declare-fun m!383765 () Bool)

(assert (=> b!254794 m!383765))

(declare-fun m!383767 () Bool)

(assert (=> b!254798 m!383767))

(declare-fun m!383769 () Bool)

(assert (=> b!254798 m!383769))

(declare-fun m!383771 () Bool)

(assert (=> b!254800 m!383771))

(assert (=> b!254803 m!383769))

(declare-fun m!383773 () Bool)

(assert (=> b!254803 m!383773))

(declare-fun m!383775 () Bool)

(assert (=> b!254805 m!383775))

(declare-fun m!383777 () Bool)

(assert (=> b!254802 m!383777))

(declare-fun m!383779 () Bool)

(assert (=> b!254791 m!383779))

(declare-fun m!383781 () Bool)

(assert (=> b!254799 m!383781))

(assert (=> b!254807 m!383773))

(declare-fun m!383783 () Bool)

(assert (=> b!254793 m!383783))

(assert (=> b!254793 m!383763))

(declare-fun m!383785 () Bool)

(assert (=> b!254793 m!383785))

(declare-fun m!383787 () Bool)

(assert (=> b!254793 m!383787))

(declare-fun m!383789 () Bool)

(assert (=> b!254793 m!383789))

(declare-fun m!383791 () Bool)

(assert (=> b!254793 m!383791))

(declare-fun m!383793 () Bool)

(assert (=> b!254793 m!383793))

(declare-fun m!383795 () Bool)

(assert (=> b!254793 m!383795))

(declare-fun m!383797 () Bool)

(assert (=> b!254793 m!383797))

(declare-fun m!383799 () Bool)

(assert (=> b!254793 m!383799))

(declare-fun m!383801 () Bool)

(assert (=> b!254793 m!383801))

(declare-fun m!383803 () Bool)

(assert (=> b!254793 m!383803))

(declare-fun m!383805 () Bool)

(assert (=> b!254793 m!383805))

(declare-fun m!383807 () Bool)

(assert (=> b!254793 m!383807))

(declare-fun m!383809 () Bool)

(assert (=> b!254793 m!383809))

(declare-fun m!383811 () Bool)

(assert (=> b!254793 m!383811))

(declare-fun m!383813 () Bool)

(assert (=> b!254793 m!383813))

(declare-fun m!383815 () Bool)

(assert (=> b!254793 m!383815))

(declare-fun m!383817 () Bool)

(assert (=> b!254793 m!383817))

(declare-fun m!383819 () Bool)

(assert (=> b!254793 m!383819))

(declare-fun m!383821 () Bool)

(assert (=> b!254804 m!383821))

(assert (=> b!254804 m!383821))

(declare-fun m!383823 () Bool)

(assert (=> b!254804 m!383823))

(declare-fun m!383825 () Bool)

(assert (=> b!254801 m!383825))

(check-sat (not b!254804) (not b!254796) (not b!254791) (not b!254793) (not start!54512) (not b!254794) (not b!254801) (not b!254802) (not b!254806) (not b!254803) (not b!254805) (not b!254807) (not b!254798) (not b!254799) (not b!254800))
(check-sat)
