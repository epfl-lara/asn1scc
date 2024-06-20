; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28534 () Bool)

(assert start!28534)

(declare-datatypes ((array!6651 0))(
  ( (array!6652 (arr!3778 (Array (_ BitVec 32) (_ BitVec 8))) (size!3009 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6651)

(declare-fun e!98479 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((BitStream!5276 0))(
  ( (BitStream!5277 (buf!3474 array!6651) (currentByte!6382 (_ BitVec 32)) (currentBit!6377 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13140 0))(
  ( (tuple2!13141 (_1!6929 BitStream!5276) (_2!6929 BitStream!5276)) )
))
(declare-fun lt!229811 () tuple2!13140)

(declare-datatypes ((tuple2!13142 0))(
  ( (tuple2!13143 (_1!6930 BitStream!5276) (_2!6930 (_ BitVec 8))) )
))
(declare-fun lt!229796 () tuple2!13142)

(declare-fun b!147647 () Bool)

(assert (=> b!147647 (= e!98479 (and (= (_2!6930 lt!229796) (select (arr!3778 arr!237) from!447)) (= (_1!6930 lt!229796) (_2!6929 lt!229811))))))

(declare-fun readBytePure!0 (BitStream!5276) tuple2!13142)

(assert (=> b!147647 (= lt!229796 (readBytePure!0 (_1!6929 lt!229811)))))

(declare-fun thiss!1634 () BitStream!5276)

(declare-datatypes ((Unit!9306 0))(
  ( (Unit!9307) )
))
(declare-datatypes ((tuple2!13144 0))(
  ( (tuple2!13145 (_1!6931 Unit!9306) (_2!6931 BitStream!5276)) )
))
(declare-fun lt!229788 () tuple2!13144)

(declare-fun reader!0 (BitStream!5276 BitStream!5276) tuple2!13140)

(assert (=> b!147647 (= lt!229811 (reader!0 thiss!1634 (_2!6931 lt!229788)))))

(declare-fun b!147648 () Bool)

(declare-fun e!98482 () Bool)

(declare-fun e!98481 () Bool)

(assert (=> b!147648 (= e!98482 e!98481)))

(declare-fun res!123563 () Bool)

(assert (=> b!147648 (=> (not res!123563) (not e!98481))))

(declare-fun lt!229790 () (_ BitVec 64))

(declare-fun lt!229806 () tuple2!13144)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!147648 (= res!123563 (= (bitIndex!0 (size!3009 (buf!3474 (_2!6931 lt!229806))) (currentByte!6382 (_2!6931 lt!229806)) (currentBit!6377 (_2!6931 lt!229806))) (bvadd (bitIndex!0 (size!3009 (buf!3474 (_2!6931 lt!229788))) (currentByte!6382 (_2!6931 lt!229788)) (currentBit!6377 (_2!6931 lt!229788))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!229790))))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!147648 (= lt!229790 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!123554 () Bool)

(declare-fun e!98478 () Bool)

(assert (=> start!28534 (=> (not res!123554) (not e!98478))))

(assert (=> start!28534 (= res!123554 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3009 arr!237))))))

(assert (=> start!28534 e!98478))

(assert (=> start!28534 true))

(declare-fun array_inv!2798 (array!6651) Bool)

(assert (=> start!28534 (array_inv!2798 arr!237)))

(declare-fun e!98477 () Bool)

(declare-fun inv!12 (BitStream!5276) Bool)

(assert (=> start!28534 (and (inv!12 thiss!1634) e!98477)))

(declare-fun b!147649 () Bool)

(assert (=> b!147649 (= e!98477 (array_inv!2798 (buf!3474 thiss!1634)))))

(declare-fun b!147650 () Bool)

(declare-fun res!123559 () Bool)

(assert (=> b!147650 (=> (not res!123559) (not e!98479))))

(declare-fun isPrefixOf!0 (BitStream!5276 BitStream!5276) Bool)

(assert (=> b!147650 (= res!123559 (isPrefixOf!0 thiss!1634 (_2!6931 lt!229788)))))

(declare-fun b!147651 () Bool)

(declare-fun res!123556 () Bool)

(assert (=> b!147651 (=> (not res!123556) (not e!98478))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147651 (= res!123556 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3009 (buf!3474 thiss!1634))) ((_ sign_extend 32) (currentByte!6382 thiss!1634)) ((_ sign_extend 32) (currentBit!6377 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun e!98484 () Bool)

(declare-datatypes ((tuple2!13146 0))(
  ( (tuple2!13147 (_1!6932 BitStream!5276) (_2!6932 array!6651)) )
))
(declare-fun lt!229798 () tuple2!13146)

(declare-fun b!147652 () Bool)

(declare-fun arrayRangesEq!325 (array!6651 array!6651 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147652 (= e!98484 (not (arrayRangesEq!325 arr!237 (_2!6932 lt!229798) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!147653 () Bool)

(declare-fun res!123562 () Bool)

(assert (=> b!147653 (=> (not res!123562) (not e!98478))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147653 (= res!123562 (invariant!0 (currentBit!6377 thiss!1634) (currentByte!6382 thiss!1634) (size!3009 (buf!3474 thiss!1634))))))

(declare-fun b!147654 () Bool)

(declare-fun e!98480 () Bool)

(declare-fun lt!229793 () tuple2!13142)

(declare-fun lt!229802 () tuple2!13142)

(assert (=> b!147654 (= e!98480 (= (_2!6930 lt!229793) (_2!6930 lt!229802)))))

(declare-fun b!147655 () Bool)

(declare-fun res!123558 () Bool)

(assert (=> b!147655 (=> (not res!123558) (not e!98481))))

(assert (=> b!147655 (= res!123558 (isPrefixOf!0 (_2!6931 lt!229788) (_2!6931 lt!229806)))))

(declare-fun b!147656 () Bool)

(declare-fun res!123553 () Bool)

(assert (=> b!147656 (=> (not res!123553) (not e!98479))))

(assert (=> b!147656 (= res!123553 (= (bitIndex!0 (size!3009 (buf!3474 (_2!6931 lt!229788))) (currentByte!6382 (_2!6931 lt!229788)) (currentBit!6377 (_2!6931 lt!229788))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3009 (buf!3474 thiss!1634)) (currentByte!6382 thiss!1634) (currentBit!6377 thiss!1634)))))))

(declare-fun b!147657 () Bool)

(declare-fun e!98476 () Bool)

(assert (=> b!147657 (= e!98476 (invariant!0 (currentBit!6377 thiss!1634) (currentByte!6382 thiss!1634) (size!3009 (buf!3474 (_2!6931 lt!229788)))))))

(declare-fun b!147658 () Bool)

(assert (=> b!147658 (= e!98481 (not e!98484))))

(declare-fun res!123552 () Bool)

(assert (=> b!147658 (=> res!123552 e!98484)))

(declare-fun lt!229791 () tuple2!13140)

(assert (=> b!147658 (= res!123552 (or (not (= (size!3009 (_2!6932 lt!229798)) (size!3009 arr!237))) (not (= (_1!6932 lt!229798) (_2!6929 lt!229791)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5276 array!6651 (_ BitVec 32) (_ BitVec 32)) tuple2!13146)

(assert (=> b!147658 (= lt!229798 (readByteArrayLoopPure!0 (_1!6929 lt!229791) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147658 (validate_offset_bits!1 ((_ sign_extend 32) (size!3009 (buf!3474 (_2!6931 lt!229806)))) ((_ sign_extend 32) (currentByte!6382 (_2!6931 lt!229788))) ((_ sign_extend 32) (currentBit!6377 (_2!6931 lt!229788))) lt!229790)))

(declare-fun lt!229809 () Unit!9306)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5276 array!6651 (_ BitVec 64)) Unit!9306)

(assert (=> b!147658 (= lt!229809 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6931 lt!229788) (buf!3474 (_2!6931 lt!229806)) lt!229790))))

(assert (=> b!147658 (= lt!229791 (reader!0 (_2!6931 lt!229788) (_2!6931 lt!229806)))))

(declare-fun b!147659 () Bool)

(declare-fun res!123551 () Bool)

(assert (=> b!147659 (=> (not res!123551) (not e!98478))))

(assert (=> b!147659 (= res!123551 (bvslt from!447 to!404))))

(declare-fun b!147660 () Bool)

(assert (=> b!147660 (= e!98478 (not true))))

(declare-fun lt!229801 () tuple2!13146)

(declare-fun lt!229808 () tuple2!13146)

(assert (=> b!147660 (arrayRangesEq!325 (_2!6932 lt!229801) (_2!6932 lt!229808) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!229800 () Unit!9306)

(declare-fun lt!229803 () tuple2!13140)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5276 array!6651 (_ BitVec 32) (_ BitVec 32)) Unit!9306)

(assert (=> b!147660 (= lt!229800 (readByteArrayLoopArrayPrefixLemma!0 (_1!6929 lt!229803) arr!237 from!447 to!404))))

(declare-fun lt!229792 () array!6651)

(declare-fun withMovedByteIndex!0 (BitStream!5276 (_ BitVec 32)) BitStream!5276)

(assert (=> b!147660 (= lt!229808 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6929 lt!229803) #b00000000000000000000000000000001) lt!229792 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229805 () tuple2!13146)

(declare-fun lt!229797 () tuple2!13140)

(assert (=> b!147660 (= lt!229805 (readByteArrayLoopPure!0 (_1!6929 lt!229797) lt!229792 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229795 () tuple2!13142)

(assert (=> b!147660 (= lt!229792 (array!6652 (store (arr!3778 arr!237) from!447 (_2!6930 lt!229795)) (size!3009 arr!237)))))

(declare-fun lt!229789 () (_ BitVec 32))

(assert (=> b!147660 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3009 (buf!3474 (_2!6931 lt!229806)))) ((_ sign_extend 32) (currentByte!6382 (_2!6931 lt!229788))) ((_ sign_extend 32) (currentBit!6377 (_2!6931 lt!229788))) lt!229789)))

(declare-fun lt!229804 () Unit!9306)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5276 array!6651 (_ BitVec 32)) Unit!9306)

(assert (=> b!147660 (= lt!229804 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6931 lt!229788) (buf!3474 (_2!6931 lt!229806)) lt!229789))))

(assert (=> b!147660 (= (_1!6932 lt!229801) (_2!6929 lt!229803))))

(assert (=> b!147660 (= lt!229801 (readByteArrayLoopPure!0 (_1!6929 lt!229803) arr!237 from!447 to!404))))

(assert (=> b!147660 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3009 (buf!3474 (_2!6931 lt!229806)))) ((_ sign_extend 32) (currentByte!6382 thiss!1634)) ((_ sign_extend 32) (currentBit!6377 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!229794 () Unit!9306)

(assert (=> b!147660 (= lt!229794 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3474 (_2!6931 lt!229806)) (bvsub to!404 from!447)))))

(assert (=> b!147660 (= (_2!6930 lt!229795) (select (arr!3778 arr!237) from!447))))

(assert (=> b!147660 (= lt!229795 (readBytePure!0 (_1!6929 lt!229803)))))

(assert (=> b!147660 (= lt!229797 (reader!0 (_2!6931 lt!229788) (_2!6931 lt!229806)))))

(assert (=> b!147660 (= lt!229803 (reader!0 thiss!1634 (_2!6931 lt!229806)))))

(assert (=> b!147660 e!98480))

(declare-fun res!123555 () Bool)

(assert (=> b!147660 (=> (not res!123555) (not e!98480))))

(assert (=> b!147660 (= res!123555 (= (bitIndex!0 (size!3009 (buf!3474 (_1!6930 lt!229793))) (currentByte!6382 (_1!6930 lt!229793)) (currentBit!6377 (_1!6930 lt!229793))) (bitIndex!0 (size!3009 (buf!3474 (_1!6930 lt!229802))) (currentByte!6382 (_1!6930 lt!229802)) (currentBit!6377 (_1!6930 lt!229802)))))))

(declare-fun lt!229787 () Unit!9306)

(declare-fun lt!229807 () BitStream!5276)

(declare-fun readBytePrefixLemma!0 (BitStream!5276 BitStream!5276) Unit!9306)

(assert (=> b!147660 (= lt!229787 (readBytePrefixLemma!0 lt!229807 (_2!6931 lt!229806)))))

(assert (=> b!147660 (= lt!229802 (readBytePure!0 (BitStream!5277 (buf!3474 (_2!6931 lt!229806)) (currentByte!6382 thiss!1634) (currentBit!6377 thiss!1634))))))

(assert (=> b!147660 (= lt!229793 (readBytePure!0 lt!229807))))

(assert (=> b!147660 (= lt!229807 (BitStream!5277 (buf!3474 (_2!6931 lt!229788)) (currentByte!6382 thiss!1634) (currentBit!6377 thiss!1634)))))

(assert (=> b!147660 e!98476))

(declare-fun res!123561 () Bool)

(assert (=> b!147660 (=> (not res!123561) (not e!98476))))

(assert (=> b!147660 (= res!123561 (isPrefixOf!0 thiss!1634 (_2!6931 lt!229806)))))

(declare-fun lt!229810 () Unit!9306)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5276 BitStream!5276 BitStream!5276) Unit!9306)

(assert (=> b!147660 (= lt!229810 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6931 lt!229788) (_2!6931 lt!229806)))))

(assert (=> b!147660 e!98482))

(declare-fun res!123557 () Bool)

(assert (=> b!147660 (=> (not res!123557) (not e!98482))))

(assert (=> b!147660 (= res!123557 (= (size!3009 (buf!3474 (_2!6931 lt!229788))) (size!3009 (buf!3474 (_2!6931 lt!229806)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5276 array!6651 (_ BitVec 32) (_ BitVec 32)) tuple2!13144)

(assert (=> b!147660 (= lt!229806 (appendByteArrayLoop!0 (_2!6931 lt!229788) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!147660 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3009 (buf!3474 (_2!6931 lt!229788)))) ((_ sign_extend 32) (currentByte!6382 (_2!6931 lt!229788))) ((_ sign_extend 32) (currentBit!6377 (_2!6931 lt!229788))) lt!229789)))

(assert (=> b!147660 (= lt!229789 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!229799 () Unit!9306)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5276 BitStream!5276 (_ BitVec 64) (_ BitVec 32)) Unit!9306)

(assert (=> b!147660 (= lt!229799 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6931 lt!229788) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!147660 e!98479))

(declare-fun res!123560 () Bool)

(assert (=> b!147660 (=> (not res!123560) (not e!98479))))

(assert (=> b!147660 (= res!123560 (= (size!3009 (buf!3474 thiss!1634)) (size!3009 (buf!3474 (_2!6931 lt!229788)))))))

(declare-fun appendByte!0 (BitStream!5276 (_ BitVec 8)) tuple2!13144)

(assert (=> b!147660 (= lt!229788 (appendByte!0 thiss!1634 (select (arr!3778 arr!237) from!447)))))

(assert (= (and start!28534 res!123554) b!147651))

(assert (= (and b!147651 res!123556) b!147659))

(assert (= (and b!147659 res!123551) b!147653))

(assert (= (and b!147653 res!123562) b!147660))

(assert (= (and b!147660 res!123560) b!147656))

(assert (= (and b!147656 res!123553) b!147650))

(assert (= (and b!147650 res!123559) b!147647))

(assert (= (and b!147660 res!123557) b!147648))

(assert (= (and b!147648 res!123563) b!147655))

(assert (= (and b!147655 res!123558) b!147658))

(assert (= (and b!147658 (not res!123552)) b!147652))

(assert (= (and b!147660 res!123561) b!147657))

(assert (= (and b!147660 res!123555) b!147654))

(assert (= start!28534 b!147649))

(declare-fun m!228649 () Bool)

(assert (=> b!147650 m!228649))

(declare-fun m!228651 () Bool)

(assert (=> start!28534 m!228651))

(declare-fun m!228653 () Bool)

(assert (=> start!28534 m!228653))

(declare-fun m!228655 () Bool)

(assert (=> b!147652 m!228655))

(declare-fun m!228657 () Bool)

(assert (=> b!147658 m!228657))

(declare-fun m!228659 () Bool)

(assert (=> b!147658 m!228659))

(declare-fun m!228661 () Bool)

(assert (=> b!147658 m!228661))

(declare-fun m!228663 () Bool)

(assert (=> b!147658 m!228663))

(declare-fun m!228665 () Bool)

(assert (=> b!147656 m!228665))

(declare-fun m!228667 () Bool)

(assert (=> b!147656 m!228667))

(declare-fun m!228669 () Bool)

(assert (=> b!147653 m!228669))

(declare-fun m!228671 () Bool)

(assert (=> b!147651 m!228671))

(declare-fun m!228673 () Bool)

(assert (=> b!147657 m!228673))

(declare-fun m!228675 () Bool)

(assert (=> b!147655 m!228675))

(declare-fun m!228677 () Bool)

(assert (=> b!147647 m!228677))

(declare-fun m!228679 () Bool)

(assert (=> b!147647 m!228679))

(declare-fun m!228681 () Bool)

(assert (=> b!147647 m!228681))

(declare-fun m!228683 () Bool)

(assert (=> b!147660 m!228683))

(declare-fun m!228685 () Bool)

(assert (=> b!147660 m!228685))

(declare-fun m!228687 () Bool)

(assert (=> b!147660 m!228687))

(declare-fun m!228689 () Bool)

(assert (=> b!147660 m!228689))

(declare-fun m!228691 () Bool)

(assert (=> b!147660 m!228691))

(declare-fun m!228693 () Bool)

(assert (=> b!147660 m!228693))

(declare-fun m!228695 () Bool)

(assert (=> b!147660 m!228695))

(declare-fun m!228697 () Bool)

(assert (=> b!147660 m!228697))

(assert (=> b!147660 m!228663))

(declare-fun m!228699 () Bool)

(assert (=> b!147660 m!228699))

(declare-fun m!228701 () Bool)

(assert (=> b!147660 m!228701))

(declare-fun m!228703 () Bool)

(assert (=> b!147660 m!228703))

(declare-fun m!228705 () Bool)

(assert (=> b!147660 m!228705))

(declare-fun m!228707 () Bool)

(assert (=> b!147660 m!228707))

(assert (=> b!147660 m!228677))

(declare-fun m!228709 () Bool)

(assert (=> b!147660 m!228709))

(declare-fun m!228711 () Bool)

(assert (=> b!147660 m!228711))

(assert (=> b!147660 m!228677))

(declare-fun m!228713 () Bool)

(assert (=> b!147660 m!228713))

(assert (=> b!147660 m!228699))

(declare-fun m!228715 () Bool)

(assert (=> b!147660 m!228715))

(declare-fun m!228717 () Bool)

(assert (=> b!147660 m!228717))

(declare-fun m!228719 () Bool)

(assert (=> b!147660 m!228719))

(declare-fun m!228721 () Bool)

(assert (=> b!147660 m!228721))

(declare-fun m!228723 () Bool)

(assert (=> b!147660 m!228723))

(declare-fun m!228725 () Bool)

(assert (=> b!147660 m!228725))

(declare-fun m!228727 () Bool)

(assert (=> b!147660 m!228727))

(declare-fun m!228729 () Bool)

(assert (=> b!147660 m!228729))

(declare-fun m!228731 () Bool)

(assert (=> b!147648 m!228731))

(assert (=> b!147648 m!228665))

(declare-fun m!228733 () Bool)

(assert (=> b!147649 m!228733))

(push 1)

(assert (not b!147652))

(assert (not b!147648))

(assert (not b!147660))

(assert (not b!147651))

(assert (not start!28534))

(assert (not b!147653))

(assert (not b!147658))

(assert (not b!147657))

(assert (not b!147650))

(assert (not b!147656))

(assert (not b!147647))

(assert (not b!147649))

(assert (not b!147655))

(check-sat)

