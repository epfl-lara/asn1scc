; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24040 () Bool)

(assert start!24040)

(declare-fun res!100812 () Bool)

(declare-fun e!79720 () Bool)

(assert (=> start!24040 (=> (not res!100812) (not e!79720))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!24040 (= res!100812 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24040 e!79720))

(assert (=> start!24040 true))

(declare-datatypes ((array!5395 0))(
  ( (array!5396 (arr!3034 (Array (_ BitVec 32) (_ BitVec 8))) (size!2441 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4356 0))(
  ( (BitStream!4357 (buf!2878 array!5395) (currentByte!5569 (_ BitVec 32)) (currentBit!5564 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4356)

(declare-fun e!79723 () Bool)

(declare-fun inv!12 (BitStream!4356) Bool)

(assert (=> start!24040 (and (inv!12 thiss!1305) e!79723)))

(declare-fun b!121695 () Bool)

(declare-fun array_inv!2243 (array!5395) Bool)

(assert (=> b!121695 (= e!79723 (array_inv!2243 (buf!2878 thiss!1305)))))

(declare-datatypes ((tuple2!10236 0))(
  ( (tuple2!10237 (_1!5383 BitStream!4356) (_2!5383 BitStream!4356)) )
))
(declare-fun lt!190749 () tuple2!10236)

(declare-fun lt!190739 () tuple2!10236)

(declare-datatypes ((tuple2!10238 0))(
  ( (tuple2!10239 (_1!5384 BitStream!4356) (_2!5384 (_ BitVec 64))) )
))
(declare-fun lt!190746 () tuple2!10238)

(declare-fun b!121696 () Bool)

(declare-fun lt!190757 () (_ BitVec 64))

(declare-fun lt!190738 () tuple2!10238)

(declare-fun lt!190750 () (_ BitVec 64))

(declare-fun e!79721 () Bool)

(declare-fun lt!190755 () BitStream!4356)

(assert (=> b!121696 (= e!79721 (and (= lt!190750 (bvsub lt!190757 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5383 lt!190739) lt!190755)) (and (= (_2!5384 lt!190738) (_2!5384 lt!190746)) (= (_1!5384 lt!190738) (_2!5383 lt!190749))))))))

(declare-fun b!121697 () Bool)

(declare-fun e!79718 () Bool)

(declare-datatypes ((tuple2!10240 0))(
  ( (tuple2!10241 (_1!5385 BitStream!4356) (_2!5385 Bool)) )
))
(declare-fun lt!190733 () tuple2!10240)

(declare-fun lt!190756 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121697 (= e!79718 (= (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!190733))) (currentByte!5569 (_1!5385 lt!190733)) (currentBit!5564 (_1!5385 lt!190733))) lt!190756))))

(declare-fun b!121698 () Bool)

(declare-fun e!79719 () Bool)

(assert (=> b!121698 (= e!79720 e!79719)))

(declare-fun res!100808 () Bool)

(assert (=> b!121698 (=> (not res!100808) (not e!79719))))

(declare-fun lt!190754 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121698 (= res!100808 (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 thiss!1305))) ((_ sign_extend 32) (currentByte!5569 thiss!1305)) ((_ sign_extend 32) (currentBit!5564 thiss!1305)) lt!190754))))

(assert (=> b!121698 (= lt!190754 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun e!79725 () Bool)

(declare-fun b!121699 () Bool)

(declare-datatypes ((Unit!7497 0))(
  ( (Unit!7498) )
))
(declare-datatypes ((tuple2!10242 0))(
  ( (tuple2!10243 (_1!5386 Unit!7497) (_2!5386 BitStream!4356)) )
))
(declare-fun lt!190748 () tuple2!10242)

(assert (=> b!121699 (= e!79725 (or (not (= (_1!5383 lt!190739) lt!190755)) (not (= (size!2441 (buf!2878 thiss!1305)) (size!2441 (buf!2878 (_2!5386 lt!190748))))) (let ((bdg!6310 (bvand lt!190750 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!6310 (bvand lt!190754 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!6310 (bvand (bvadd lt!190750 lt!190754) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!121699 e!79721))

(declare-fun res!100816 () Bool)

(assert (=> b!121699 (=> (not res!100816) (not e!79721))))

(declare-fun lt!190741 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4356 (_ BitVec 64)) BitStream!4356)

(assert (=> b!121699 (= res!100816 (= (_1!5383 lt!190739) (withMovedBitIndex!0 (_2!5383 lt!190739) (bvsub lt!190757 lt!190741))))))

(declare-fun lt!190736 () tuple2!10242)

(assert (=> b!121699 (= lt!190757 (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190736))) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))))))

(assert (=> b!121699 (= (_1!5383 lt!190749) (withMovedBitIndex!0 (_2!5383 lt!190749) (bvsub lt!190750 lt!190741)))))

(assert (=> b!121699 (= lt!190741 (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190748))) (currentByte!5569 (_2!5386 lt!190748)) (currentBit!5564 (_2!5386 lt!190748))))))

(assert (=> b!121699 (= lt!190750 (bitIndex!0 (size!2441 (buf!2878 thiss!1305)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)))))

(declare-fun lt!190732 () tuple2!10238)

(assert (=> b!121699 (and (= (_2!5384 lt!190738) (_2!5384 lt!190732)) (= (_1!5384 lt!190738) (_1!5384 lt!190732)))))

(declare-fun lt!190730 () (_ BitVec 64))

(declare-fun lt!190735 () Unit!7497)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7497)

(assert (=> b!121699 (= lt!190735 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5383 lt!190749) nBits!396 i!615 lt!190730))))

(declare-fun lt!190744 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10238)

(assert (=> b!121699 (= lt!190732 (readNLeastSignificantBitsLoopPure!0 lt!190755 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190744))))

(assert (=> b!121699 (= lt!190755 (withMovedBitIndex!0 (_1!5383 lt!190749) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!121700 () Bool)

(declare-fun e!79716 () Bool)

(declare-fun lt!190742 () tuple2!10240)

(declare-fun lt!190758 () tuple2!10240)

(assert (=> b!121700 (= e!79716 (= (_2!5385 lt!190742) (_2!5385 lt!190758)))))

(declare-fun b!121701 () Bool)

(assert (=> b!121701 (= e!79719 (not e!79725))))

(declare-fun res!100815 () Bool)

(assert (=> b!121701 (=> res!100815 e!79725)))

(assert (=> b!121701 (= res!100815 (not (= (_1!5384 lt!190746) (_2!5383 lt!190739))))))

(assert (=> b!121701 (= lt!190746 (readNLeastSignificantBitsLoopPure!0 (_1!5383 lt!190739) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190744))))

(declare-fun lt!190752 () (_ BitVec 64))

(assert (=> b!121701 (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))) ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190736))) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190736))) lt!190752)))

(declare-fun lt!190751 () Unit!7497)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4356 array!5395 (_ BitVec 64)) Unit!7497)

(assert (=> b!121701 (= lt!190751 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5386 lt!190736) (buf!2878 (_2!5386 lt!190748)) lt!190752))))

(assert (=> b!121701 (= lt!190752 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!190737 () (_ BitVec 64))

(declare-fun lt!190743 () tuple2!10240)

(assert (=> b!121701 (= lt!190744 (bvor lt!190730 (ite (_2!5385 lt!190743) lt!190737 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121701 (= lt!190738 (readNLeastSignificantBitsLoopPure!0 (_1!5383 lt!190749) nBits!396 i!615 lt!190730))))

(assert (=> b!121701 (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))) ((_ sign_extend 32) (currentByte!5569 thiss!1305)) ((_ sign_extend 32) (currentBit!5564 thiss!1305)) lt!190754)))

(declare-fun lt!190747 () Unit!7497)

(assert (=> b!121701 (= lt!190747 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2878 (_2!5386 lt!190748)) lt!190754))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121701 (= lt!190730 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!190740 () Bool)

(assert (=> b!121701 (= (_2!5385 lt!190743) lt!190740)))

(declare-fun readBitPure!0 (BitStream!4356) tuple2!10240)

(assert (=> b!121701 (= lt!190743 (readBitPure!0 (_1!5383 lt!190749)))))

(declare-fun reader!0 (BitStream!4356 BitStream!4356) tuple2!10236)

(assert (=> b!121701 (= lt!190739 (reader!0 (_2!5386 lt!190736) (_2!5386 lt!190748)))))

(assert (=> b!121701 (= lt!190749 (reader!0 thiss!1305 (_2!5386 lt!190748)))))

(assert (=> b!121701 e!79716))

(declare-fun res!100809 () Bool)

(assert (=> b!121701 (=> (not res!100809) (not e!79716))))

(assert (=> b!121701 (= res!100809 (= (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!190742))) (currentByte!5569 (_1!5385 lt!190742)) (currentBit!5564 (_1!5385 lt!190742))) (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!190758))) (currentByte!5569 (_1!5385 lt!190758)) (currentBit!5564 (_1!5385 lt!190758)))))))

(declare-fun lt!190734 () Unit!7497)

(declare-fun lt!190753 () BitStream!4356)

(declare-fun readBitPrefixLemma!0 (BitStream!4356 BitStream!4356) Unit!7497)

(assert (=> b!121701 (= lt!190734 (readBitPrefixLemma!0 lt!190753 (_2!5386 lt!190748)))))

(assert (=> b!121701 (= lt!190758 (readBitPure!0 (BitStream!4357 (buf!2878 (_2!5386 lt!190748)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305))))))

(assert (=> b!121701 (= lt!190742 (readBitPure!0 lt!190753))))

(assert (=> b!121701 (= lt!190753 (BitStream!4357 (buf!2878 (_2!5386 lt!190736)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)))))

(declare-fun e!79722 () Bool)

(assert (=> b!121701 e!79722))

(declare-fun res!100811 () Bool)

(assert (=> b!121701 (=> (not res!100811) (not e!79722))))

(declare-fun isPrefixOf!0 (BitStream!4356 BitStream!4356) Bool)

(assert (=> b!121701 (= res!100811 (isPrefixOf!0 thiss!1305 (_2!5386 lt!190748)))))

(declare-fun lt!190745 () Unit!7497)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4356 BitStream!4356 BitStream!4356) Unit!7497)

(assert (=> b!121701 (= lt!190745 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5386 lt!190736) (_2!5386 lt!190748)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10242)

(assert (=> b!121701 (= lt!190748 (appendNLeastSignificantBitsLoop!0 (_2!5386 lt!190736) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!79724 () Bool)

(assert (=> b!121701 e!79724))

(declare-fun res!100807 () Bool)

(assert (=> b!121701 (=> (not res!100807) (not e!79724))))

(assert (=> b!121701 (= res!100807 (= (size!2441 (buf!2878 thiss!1305)) (size!2441 (buf!2878 (_2!5386 lt!190736)))))))

(declare-fun appendBit!0 (BitStream!4356 Bool) tuple2!10242)

(assert (=> b!121701 (= lt!190736 (appendBit!0 thiss!1305 lt!190740))))

(assert (=> b!121701 (= lt!190740 (not (= (bvand v!199 lt!190737) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121701 (= lt!190737 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!121702 () Bool)

(declare-fun res!100814 () Bool)

(assert (=> b!121702 (=> (not res!100814) (not e!79722))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!121702 (= res!100814 (invariant!0 (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305) (size!2441 (buf!2878 (_2!5386 lt!190736)))))))

(declare-fun b!121703 () Bool)

(declare-fun e!79717 () Bool)

(assert (=> b!121703 (= e!79724 e!79717)))

(declare-fun res!100813 () Bool)

(assert (=> b!121703 (=> (not res!100813) (not e!79717))))

(declare-fun lt!190731 () (_ BitVec 64))

(assert (=> b!121703 (= res!100813 (= lt!190756 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!190731)))))

(assert (=> b!121703 (= lt!190756 (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190736))) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))))))

(assert (=> b!121703 (= lt!190731 (bitIndex!0 (size!2441 (buf!2878 thiss!1305)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)))))

(declare-fun b!121704 () Bool)

(declare-fun res!100818 () Bool)

(assert (=> b!121704 (=> (not res!100818) (not e!79719))))

(assert (=> b!121704 (= res!100818 (bvslt i!615 nBits!396))))

(declare-fun b!121705 () Bool)

(assert (=> b!121705 (= e!79717 e!79718)))

(declare-fun res!100817 () Bool)

(assert (=> b!121705 (=> (not res!100817) (not e!79718))))

(assert (=> b!121705 (= res!100817 (and (= (_2!5385 lt!190733) lt!190740) (= (_1!5385 lt!190733) (_2!5386 lt!190736))))))

(declare-fun readerFrom!0 (BitStream!4356 (_ BitVec 32) (_ BitVec 32)) BitStream!4356)

(assert (=> b!121705 (= lt!190733 (readBitPure!0 (readerFrom!0 (_2!5386 lt!190736) (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305))))))

(declare-fun b!121706 () Bool)

(declare-fun res!100806 () Bool)

(assert (=> b!121706 (=> (not res!100806) (not e!79717))))

(assert (=> b!121706 (= res!100806 (isPrefixOf!0 thiss!1305 (_2!5386 lt!190736)))))

(declare-fun b!121707 () Bool)

(assert (=> b!121707 (= e!79722 (invariant!0 (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305) (size!2441 (buf!2878 (_2!5386 lt!190748)))))))

(declare-fun b!121708 () Bool)

(declare-fun res!100810 () Bool)

(assert (=> b!121708 (=> (not res!100810) (not e!79719))))

(assert (=> b!121708 (= res!100810 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!24040 res!100812) b!121698))

(assert (= (and b!121698 res!100808) b!121708))

(assert (= (and b!121708 res!100810) b!121704))

(assert (= (and b!121704 res!100818) b!121701))

(assert (= (and b!121701 res!100807) b!121703))

(assert (= (and b!121703 res!100813) b!121706))

(assert (= (and b!121706 res!100806) b!121705))

(assert (= (and b!121705 res!100817) b!121697))

(assert (= (and b!121701 res!100811) b!121702))

(assert (= (and b!121702 res!100814) b!121707))

(assert (= (and b!121701 res!100809) b!121700))

(assert (= (and b!121701 (not res!100815)) b!121699))

(assert (= (and b!121699 res!100816) b!121696))

(assert (= start!24040 b!121695))

(declare-fun m!184501 () Bool)

(assert (=> start!24040 m!184501))

(declare-fun m!184503 () Bool)

(assert (=> b!121698 m!184503))

(declare-fun m!184505 () Bool)

(assert (=> b!121695 m!184505))

(declare-fun m!184507 () Bool)

(assert (=> b!121708 m!184507))

(declare-fun m!184509 () Bool)

(assert (=> b!121706 m!184509))

(declare-fun m!184511 () Bool)

(assert (=> b!121703 m!184511))

(declare-fun m!184513 () Bool)

(assert (=> b!121703 m!184513))

(declare-fun m!184515 () Bool)

(assert (=> b!121697 m!184515))

(declare-fun m!184517 () Bool)

(assert (=> b!121705 m!184517))

(assert (=> b!121705 m!184517))

(declare-fun m!184519 () Bool)

(assert (=> b!121705 m!184519))

(declare-fun m!184521 () Bool)

(assert (=> b!121701 m!184521))

(declare-fun m!184523 () Bool)

(assert (=> b!121701 m!184523))

(declare-fun m!184525 () Bool)

(assert (=> b!121701 m!184525))

(declare-fun m!184527 () Bool)

(assert (=> b!121701 m!184527))

(declare-fun m!184529 () Bool)

(assert (=> b!121701 m!184529))

(declare-fun m!184531 () Bool)

(assert (=> b!121701 m!184531))

(declare-fun m!184533 () Bool)

(assert (=> b!121701 m!184533))

(declare-fun m!184535 () Bool)

(assert (=> b!121701 m!184535))

(declare-fun m!184537 () Bool)

(assert (=> b!121701 m!184537))

(declare-fun m!184539 () Bool)

(assert (=> b!121701 m!184539))

(declare-fun m!184541 () Bool)

(assert (=> b!121701 m!184541))

(declare-fun m!184543 () Bool)

(assert (=> b!121701 m!184543))

(declare-fun m!184545 () Bool)

(assert (=> b!121701 m!184545))

(declare-fun m!184547 () Bool)

(assert (=> b!121701 m!184547))

(declare-fun m!184549 () Bool)

(assert (=> b!121701 m!184549))

(declare-fun m!184551 () Bool)

(assert (=> b!121701 m!184551))

(declare-fun m!184553 () Bool)

(assert (=> b!121701 m!184553))

(declare-fun m!184555 () Bool)

(assert (=> b!121701 m!184555))

(declare-fun m!184557 () Bool)

(assert (=> b!121701 m!184557))

(declare-fun m!184559 () Bool)

(assert (=> b!121707 m!184559))

(declare-fun m!184561 () Bool)

(assert (=> b!121702 m!184561))

(assert (=> b!121699 m!184511))

(declare-fun m!184563 () Bool)

(assert (=> b!121699 m!184563))

(declare-fun m!184565 () Bool)

(assert (=> b!121699 m!184565))

(declare-fun m!184567 () Bool)

(assert (=> b!121699 m!184567))

(assert (=> b!121699 m!184513))

(declare-fun m!184569 () Bool)

(assert (=> b!121699 m!184569))

(declare-fun m!184571 () Bool)

(assert (=> b!121699 m!184571))

(declare-fun m!184573 () Bool)

(assert (=> b!121699 m!184573))

(check-sat (not b!121705) (not b!121701) (not b!121703) (not b!121702) (not b!121707) (not b!121699) (not b!121706) (not b!121695) (not b!121708) (not b!121698) (not b!121697) (not start!24040))
(check-sat)
(get-model)

(declare-fun d!39228 () Bool)

(assert (=> d!39228 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!121708 d!39228))

(declare-fun d!39230 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!39230 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 thiss!1305))) ((_ sign_extend 32) (currentByte!5569 thiss!1305)) ((_ sign_extend 32) (currentBit!5564 thiss!1305)) lt!190754) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2441 (buf!2878 thiss!1305))) ((_ sign_extend 32) (currentByte!5569 thiss!1305)) ((_ sign_extend 32) (currentBit!5564 thiss!1305))) lt!190754))))

(declare-fun bs!9491 () Bool)

(assert (= bs!9491 d!39230))

(declare-fun m!184649 () Bool)

(assert (=> bs!9491 m!184649))

(assert (=> b!121698 d!39230))

(declare-fun d!39232 () Bool)

(assert (=> d!39232 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305) (size!2441 (buf!2878 thiss!1305))))))

(declare-fun bs!9492 () Bool)

(assert (= bs!9492 d!39232))

(declare-fun m!184651 () Bool)

(assert (=> bs!9492 m!184651))

(assert (=> start!24040 d!39232))

(declare-fun d!39234 () Bool)

(assert (=> d!39234 (= (invariant!0 (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305) (size!2441 (buf!2878 (_2!5386 lt!190748)))) (and (bvsge (currentBit!5564 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5564 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5569 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5569 thiss!1305) (size!2441 (buf!2878 (_2!5386 lt!190748)))) (and (= (currentBit!5564 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5569 thiss!1305) (size!2441 (buf!2878 (_2!5386 lt!190748))))))))))

(assert (=> b!121707 d!39234))

(declare-fun d!39236 () Bool)

(declare-fun e!79761 () Bool)

(assert (=> d!39236 e!79761))

(declare-fun res!100862 () Bool)

(assert (=> d!39236 (=> (not res!100862) (not e!79761))))

(declare-fun lt!190858 () (_ BitVec 64))

(declare-fun lt!190861 () (_ BitVec 64))

(declare-fun lt!190863 () (_ BitVec 64))

(assert (=> d!39236 (= res!100862 (= lt!190861 (bvsub lt!190858 lt!190863)))))

(assert (=> d!39236 (or (= (bvand lt!190858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!190863 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!190858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190858 lt!190863) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39236 (= lt!190863 (remainingBits!0 ((_ sign_extend 32) (size!2441 (buf!2878 (_1!5385 lt!190733)))) ((_ sign_extend 32) (currentByte!5569 (_1!5385 lt!190733))) ((_ sign_extend 32) (currentBit!5564 (_1!5385 lt!190733)))))))

(declare-fun lt!190860 () (_ BitVec 64))

(declare-fun lt!190859 () (_ BitVec 64))

(assert (=> d!39236 (= lt!190858 (bvmul lt!190860 lt!190859))))

(assert (=> d!39236 (or (= lt!190860 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!190859 (bvsdiv (bvmul lt!190860 lt!190859) lt!190860)))))

(assert (=> d!39236 (= lt!190859 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39236 (= lt!190860 ((_ sign_extend 32) (size!2441 (buf!2878 (_1!5385 lt!190733)))))))

(assert (=> d!39236 (= lt!190861 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5569 (_1!5385 lt!190733))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5564 (_1!5385 lt!190733)))))))

(assert (=> d!39236 (invariant!0 (currentBit!5564 (_1!5385 lt!190733)) (currentByte!5569 (_1!5385 lt!190733)) (size!2441 (buf!2878 (_1!5385 lt!190733))))))

(assert (=> d!39236 (= (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!190733))) (currentByte!5569 (_1!5385 lt!190733)) (currentBit!5564 (_1!5385 lt!190733))) lt!190861)))

(declare-fun b!121755 () Bool)

(declare-fun res!100863 () Bool)

(assert (=> b!121755 (=> (not res!100863) (not e!79761))))

(assert (=> b!121755 (= res!100863 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!190861))))

(declare-fun b!121756 () Bool)

(declare-fun lt!190862 () (_ BitVec 64))

(assert (=> b!121756 (= e!79761 (bvsle lt!190861 (bvmul lt!190862 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121756 (or (= lt!190862 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!190862 #b0000000000000000000000000000000000000000000000000000000000001000) lt!190862)))))

(assert (=> b!121756 (= lt!190862 ((_ sign_extend 32) (size!2441 (buf!2878 (_1!5385 lt!190733)))))))

(assert (= (and d!39236 res!100862) b!121755))

(assert (= (and b!121755 res!100863) b!121756))

(declare-fun m!184653 () Bool)

(assert (=> d!39236 m!184653))

(declare-fun m!184655 () Bool)

(assert (=> d!39236 m!184655))

(assert (=> b!121697 d!39236))

(declare-fun d!39238 () Bool)

(assert (=> d!39238 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!121701 d!39238))

(declare-fun d!39240 () Bool)

(assert (=> d!39240 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))) ((_ sign_extend 32) (currentByte!5569 thiss!1305)) ((_ sign_extend 32) (currentBit!5564 thiss!1305)) lt!190754) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))) ((_ sign_extend 32) (currentByte!5569 thiss!1305)) ((_ sign_extend 32) (currentBit!5564 thiss!1305))) lt!190754))))

(declare-fun bs!9493 () Bool)

(assert (= bs!9493 d!39240))

(declare-fun m!184657 () Bool)

(assert (=> bs!9493 m!184657))

(assert (=> b!121701 d!39240))

(declare-fun d!39242 () Bool)

(declare-fun e!79767 () Bool)

(assert (=> d!39242 e!79767))

(declare-fun res!100872 () Bool)

(assert (=> d!39242 (=> (not res!100872) (not e!79767))))

(declare-fun lt!190909 () tuple2!10236)

(assert (=> d!39242 (= res!100872 (isPrefixOf!0 (_1!5383 lt!190909) (_2!5383 lt!190909)))))

(declare-fun lt!190919 () BitStream!4356)

(assert (=> d!39242 (= lt!190909 (tuple2!10237 lt!190919 (_2!5386 lt!190748)))))

(declare-fun lt!190912 () Unit!7497)

(declare-fun lt!190914 () Unit!7497)

(assert (=> d!39242 (= lt!190912 lt!190914)))

(assert (=> d!39242 (isPrefixOf!0 lt!190919 (_2!5386 lt!190748))))

(assert (=> d!39242 (= lt!190914 (lemmaIsPrefixTransitive!0 lt!190919 (_2!5386 lt!190748) (_2!5386 lt!190748)))))

(declare-fun lt!190904 () Unit!7497)

(declare-fun lt!190908 () Unit!7497)

(assert (=> d!39242 (= lt!190904 lt!190908)))

(assert (=> d!39242 (isPrefixOf!0 lt!190919 (_2!5386 lt!190748))))

(assert (=> d!39242 (= lt!190908 (lemmaIsPrefixTransitive!0 lt!190919 (_2!5386 lt!190736) (_2!5386 lt!190748)))))

(declare-fun lt!190906 () Unit!7497)

(declare-fun e!79766 () Unit!7497)

(assert (=> d!39242 (= lt!190906 e!79766)))

(declare-fun c!7303 () Bool)

(assert (=> d!39242 (= c!7303 (not (= (size!2441 (buf!2878 (_2!5386 lt!190736))) #b00000000000000000000000000000000)))))

(declare-fun lt!190921 () Unit!7497)

(declare-fun lt!190917 () Unit!7497)

(assert (=> d!39242 (= lt!190921 lt!190917)))

(assert (=> d!39242 (isPrefixOf!0 (_2!5386 lt!190748) (_2!5386 lt!190748))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4356) Unit!7497)

(assert (=> d!39242 (= lt!190917 (lemmaIsPrefixRefl!0 (_2!5386 lt!190748)))))

(declare-fun lt!190915 () Unit!7497)

(declare-fun lt!190910 () Unit!7497)

(assert (=> d!39242 (= lt!190915 lt!190910)))

(assert (=> d!39242 (= lt!190910 (lemmaIsPrefixRefl!0 (_2!5386 lt!190748)))))

(declare-fun lt!190922 () Unit!7497)

(declare-fun lt!190920 () Unit!7497)

(assert (=> d!39242 (= lt!190922 lt!190920)))

(assert (=> d!39242 (isPrefixOf!0 lt!190919 lt!190919)))

(assert (=> d!39242 (= lt!190920 (lemmaIsPrefixRefl!0 lt!190919))))

(declare-fun lt!190913 () Unit!7497)

(declare-fun lt!190916 () Unit!7497)

(assert (=> d!39242 (= lt!190913 lt!190916)))

(assert (=> d!39242 (isPrefixOf!0 (_2!5386 lt!190736) (_2!5386 lt!190736))))

(assert (=> d!39242 (= lt!190916 (lemmaIsPrefixRefl!0 (_2!5386 lt!190736)))))

(assert (=> d!39242 (= lt!190919 (BitStream!4357 (buf!2878 (_2!5386 lt!190748)) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))))))

(assert (=> d!39242 (isPrefixOf!0 (_2!5386 lt!190736) (_2!5386 lt!190748))))

(assert (=> d!39242 (= (reader!0 (_2!5386 lt!190736) (_2!5386 lt!190748)) lt!190909)))

(declare-fun b!121767 () Bool)

(declare-fun res!100870 () Bool)

(assert (=> b!121767 (=> (not res!100870) (not e!79767))))

(assert (=> b!121767 (= res!100870 (isPrefixOf!0 (_2!5383 lt!190909) (_2!5386 lt!190748)))))

(declare-fun b!121768 () Bool)

(declare-fun Unit!7501 () Unit!7497)

(assert (=> b!121768 (= e!79766 Unit!7501)))

(declare-fun b!121769 () Bool)

(declare-fun res!100871 () Bool)

(assert (=> b!121769 (=> (not res!100871) (not e!79767))))

(assert (=> b!121769 (= res!100871 (isPrefixOf!0 (_1!5383 lt!190909) (_2!5386 lt!190736)))))

(declare-fun b!121770 () Bool)

(declare-fun lt!190918 () Unit!7497)

(assert (=> b!121770 (= e!79766 lt!190918)))

(declare-fun lt!190907 () (_ BitVec 64))

(assert (=> b!121770 (= lt!190907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!190905 () (_ BitVec 64))

(assert (=> b!121770 (= lt!190905 (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190736))) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5395 array!5395 (_ BitVec 64) (_ BitVec 64)) Unit!7497)

(assert (=> b!121770 (= lt!190918 (arrayBitRangesEqSymmetric!0 (buf!2878 (_2!5386 lt!190736)) (buf!2878 (_2!5386 lt!190748)) lt!190907 lt!190905))))

(declare-fun arrayBitRangesEq!0 (array!5395 array!5395 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121770 (arrayBitRangesEq!0 (buf!2878 (_2!5386 lt!190748)) (buf!2878 (_2!5386 lt!190736)) lt!190907 lt!190905)))

(declare-fun lt!190923 () (_ BitVec 64))

(declare-fun b!121771 () Bool)

(declare-fun lt!190911 () (_ BitVec 64))

(assert (=> b!121771 (= e!79767 (= (_1!5383 lt!190909) (withMovedBitIndex!0 (_2!5383 lt!190909) (bvsub lt!190911 lt!190923))))))

(assert (=> b!121771 (or (= (bvand lt!190911 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!190923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!190911 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190911 lt!190923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121771 (= lt!190923 (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190748))) (currentByte!5569 (_2!5386 lt!190748)) (currentBit!5564 (_2!5386 lt!190748))))))

(assert (=> b!121771 (= lt!190911 (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190736))) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))))))

(assert (= (and d!39242 c!7303) b!121770))

(assert (= (and d!39242 (not c!7303)) b!121768))

(assert (= (and d!39242 res!100872) b!121769))

(assert (= (and b!121769 res!100871) b!121767))

(assert (= (and b!121767 res!100870) b!121771))

(declare-fun m!184659 () Bool)

(assert (=> b!121771 m!184659))

(assert (=> b!121771 m!184573))

(assert (=> b!121771 m!184511))

(declare-fun m!184661 () Bool)

(assert (=> b!121769 m!184661))

(assert (=> b!121770 m!184511))

(declare-fun m!184663 () Bool)

(assert (=> b!121770 m!184663))

(declare-fun m!184665 () Bool)

(assert (=> b!121770 m!184665))

(declare-fun m!184667 () Bool)

(assert (=> d!39242 m!184667))

(declare-fun m!184669 () Bool)

(assert (=> d!39242 m!184669))

(declare-fun m!184671 () Bool)

(assert (=> d!39242 m!184671))

(declare-fun m!184673 () Bool)

(assert (=> d!39242 m!184673))

(declare-fun m!184675 () Bool)

(assert (=> d!39242 m!184675))

(declare-fun m!184677 () Bool)

(assert (=> d!39242 m!184677))

(declare-fun m!184679 () Bool)

(assert (=> d!39242 m!184679))

(declare-fun m!184681 () Bool)

(assert (=> d!39242 m!184681))

(declare-fun m!184683 () Bool)

(assert (=> d!39242 m!184683))

(declare-fun m!184685 () Bool)

(assert (=> d!39242 m!184685))

(declare-fun m!184687 () Bool)

(assert (=> d!39242 m!184687))

(declare-fun m!184689 () Bool)

(assert (=> b!121767 m!184689))

(assert (=> b!121701 d!39242))

(declare-fun b!121836 () Bool)

(declare-fun e!79812 () (_ BitVec 64))

(assert (=> b!121836 (= e!79812 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!121837 () Bool)

(assert (=> b!121837 (= e!79812 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!121838 () Bool)

(declare-fun res!100936 () Bool)

(declare-fun call!1592 () Bool)

(assert (=> b!121838 (= res!100936 call!1592)))

(declare-fun e!79809 () Bool)

(assert (=> b!121838 (=> (not res!100936) (not e!79809))))

(declare-fun b!121839 () Bool)

(declare-fun e!79808 () Bool)

(declare-fun lt!191132 () tuple2!10240)

(declare-fun lt!191147 () tuple2!10242)

(assert (=> b!121839 (= e!79808 (= (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!191132))) (currentByte!5569 (_1!5385 lt!191132)) (currentBit!5564 (_1!5385 lt!191132))) (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!191147))) (currentByte!5569 (_2!5386 lt!191147)) (currentBit!5564 (_2!5386 lt!191147)))))))

(declare-fun b!121840 () Bool)

(declare-fun lt!191148 () tuple2!10236)

(declare-fun lt!191121 () tuple2!10238)

(declare-fun e!79810 () Bool)

(assert (=> b!121840 (= e!79810 (and (= (_2!5384 lt!191121) v!199) (= (_1!5384 lt!191121) (_2!5383 lt!191148))))))

(declare-fun lt!191138 () (_ BitVec 64))

(assert (=> b!121840 (= lt!191121 (readNLeastSignificantBitsLoopPure!0 (_1!5383 lt!191148) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191138))))

(declare-fun lt!191150 () Unit!7497)

(declare-fun lt!191134 () Unit!7497)

(assert (=> b!121840 (= lt!191150 lt!191134)))

(declare-fun lt!191118 () tuple2!10242)

(declare-fun lt!191115 () (_ BitVec 64))

(assert (=> b!121840 (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!191118)))) ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190736))) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190736))) lt!191115)))

(assert (=> b!121840 (= lt!191134 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5386 lt!190736) (buf!2878 (_2!5386 lt!191118)) lt!191115))))

(declare-fun e!79814 () Bool)

(assert (=> b!121840 e!79814))

(declare-fun res!100932 () Bool)

(assert (=> b!121840 (=> (not res!100932) (not e!79814))))

(assert (=> b!121840 (= res!100932 (and (= (size!2441 (buf!2878 (_2!5386 lt!190736))) (size!2441 (buf!2878 (_2!5386 lt!191118)))) (bvsge lt!191115 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121840 (= lt!191115 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!121840 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121840 (= lt!191138 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!121840 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121840 (= lt!191148 (reader!0 (_2!5386 lt!190736) (_2!5386 lt!191118)))))

(declare-fun b!121841 () Bool)

(declare-fun e!79813 () tuple2!10242)

(declare-fun lt!191112 () Unit!7497)

(assert (=> b!121841 (= e!79813 (tuple2!10243 lt!191112 (_2!5386 lt!190736)))))

(declare-fun lt!191120 () BitStream!4356)

(assert (=> b!121841 (= lt!191120 (_2!5386 lt!190736))))

(assert (=> b!121841 (= lt!191112 (lemmaIsPrefixRefl!0 lt!191120))))

(assert (=> b!121841 call!1592))

(declare-fun b!121842 () Bool)

(declare-fun res!100939 () Bool)

(assert (=> b!121842 (=> (not res!100939) (not e!79810))))

(assert (=> b!121842 (= res!100939 (isPrefixOf!0 (_2!5386 lt!190736) (_2!5386 lt!191118)))))

(declare-fun b!121843 () Bool)

(assert (=> b!121843 (= lt!191132 (readBitPure!0 (readerFrom!0 (_2!5386 lt!191147) (currentBit!5564 (_2!5386 lt!190736)) (currentByte!5569 (_2!5386 lt!190736)))))))

(declare-fun res!100935 () Bool)

(declare-fun lt!191122 () Bool)

(assert (=> b!121843 (= res!100935 (and (= (_2!5385 lt!191132) lt!191122) (= (_1!5385 lt!191132) (_2!5386 lt!191147))))))

(assert (=> b!121843 (=> (not res!100935) (not e!79808))))

(assert (=> b!121843 (= e!79809 e!79808)))

(declare-fun b!121844 () Bool)

(declare-fun e!79811 () Bool)

(declare-fun lt!191123 () tuple2!10240)

(declare-fun lt!191140 () tuple2!10240)

(assert (=> b!121844 (= e!79811 (= (_2!5385 lt!191123) (_2!5385 lt!191140)))))

(declare-fun b!121845 () Bool)

(assert (=> b!121845 (= e!79814 (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190736)))) ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190736))) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190736))) lt!191115))))

(declare-fun c!7309 () Bool)

(declare-fun bm!1589 () Bool)

(assert (=> bm!1589 (= call!1592 (isPrefixOf!0 (ite c!7309 (_2!5386 lt!190736) lt!191120) (ite c!7309 (_2!5386 lt!191147) lt!191120)))))

(declare-fun b!121847 () Bool)

(declare-fun res!100938 () Bool)

(assert (=> b!121847 (= res!100938 (= (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!191147))) (currentByte!5569 (_2!5386 lt!191147)) (currentBit!5564 (_2!5386 lt!191147))) (bvadd (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190736))) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!121847 (=> (not res!100938) (not e!79809))))

(declare-fun b!121848 () Bool)

(declare-fun res!100933 () Bool)

(assert (=> b!121848 (=> (not res!100933) (not e!79810))))

(declare-fun lt!191155 () (_ BitVec 64))

(declare-fun lt!191131 () (_ BitVec 64))

(assert (=> b!121848 (= res!100933 (= (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!191118))) (currentByte!5569 (_2!5386 lt!191118)) (currentBit!5564 (_2!5386 lt!191118))) (bvadd lt!191131 lt!191155)))))

(assert (=> b!121848 (or (not (= (bvand lt!191131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191155 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191131 lt!191155) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121848 (= lt!191155 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!121848 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121848 (= lt!191131 (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190736))) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))))))

(declare-fun d!39244 () Bool)

(assert (=> d!39244 e!79810))

(declare-fun res!100934 () Bool)

(assert (=> d!39244 (=> (not res!100934) (not e!79810))))

(assert (=> d!39244 (= res!100934 (= (size!2441 (buf!2878 (_2!5386 lt!190736))) (size!2441 (buf!2878 (_2!5386 lt!191118)))))))

(assert (=> d!39244 (= lt!191118 e!79813)))

(assert (=> d!39244 (= c!7309 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!39244 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39244 (= (appendNLeastSignificantBitsLoop!0 (_2!5386 lt!190736) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!191118)))

(declare-fun b!121846 () Bool)

(declare-fun lt!191128 () tuple2!10242)

(declare-fun Unit!7502 () Unit!7497)

(assert (=> b!121846 (= e!79813 (tuple2!10243 Unit!7502 (_2!5386 lt!191128)))))

(assert (=> b!121846 (= lt!191122 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121846 (= lt!191147 (appendBit!0 (_2!5386 lt!190736) lt!191122))))

(declare-fun res!100931 () Bool)

(assert (=> b!121846 (= res!100931 (= (size!2441 (buf!2878 (_2!5386 lt!190736))) (size!2441 (buf!2878 (_2!5386 lt!191147)))))))

(assert (=> b!121846 (=> (not res!100931) (not e!79809))))

(assert (=> b!121846 e!79809))

(declare-fun lt!191139 () tuple2!10242)

(assert (=> b!121846 (= lt!191139 lt!191147)))

(assert (=> b!121846 (= lt!191128 (appendNLeastSignificantBitsLoop!0 (_2!5386 lt!191139) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!191129 () Unit!7497)

(assert (=> b!121846 (= lt!191129 (lemmaIsPrefixTransitive!0 (_2!5386 lt!190736) (_2!5386 lt!191139) (_2!5386 lt!191128)))))

(assert (=> b!121846 (isPrefixOf!0 (_2!5386 lt!190736) (_2!5386 lt!191128))))

(declare-fun lt!191149 () Unit!7497)

(assert (=> b!121846 (= lt!191149 lt!191129)))

(assert (=> b!121846 (invariant!0 (currentBit!5564 (_2!5386 lt!190736)) (currentByte!5569 (_2!5386 lt!190736)) (size!2441 (buf!2878 (_2!5386 lt!191139))))))

(declare-fun lt!191142 () BitStream!4356)

(assert (=> b!121846 (= lt!191142 (BitStream!4357 (buf!2878 (_2!5386 lt!191139)) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))))))

(assert (=> b!121846 (invariant!0 (currentBit!5564 lt!191142) (currentByte!5569 lt!191142) (size!2441 (buf!2878 (_2!5386 lt!191128))))))

(declare-fun lt!191156 () BitStream!4356)

(assert (=> b!121846 (= lt!191156 (BitStream!4357 (buf!2878 (_2!5386 lt!191128)) (currentByte!5569 lt!191142) (currentBit!5564 lt!191142)))))

(assert (=> b!121846 (= lt!191123 (readBitPure!0 lt!191142))))

(assert (=> b!121846 (= lt!191140 (readBitPure!0 lt!191156))))

(declare-fun lt!191144 () Unit!7497)

(assert (=> b!121846 (= lt!191144 (readBitPrefixLemma!0 lt!191142 (_2!5386 lt!191128)))))

(declare-fun res!100937 () Bool)

(assert (=> b!121846 (= res!100937 (= (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!191123))) (currentByte!5569 (_1!5385 lt!191123)) (currentBit!5564 (_1!5385 lt!191123))) (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!191140))) (currentByte!5569 (_1!5385 lt!191140)) (currentBit!5564 (_1!5385 lt!191140)))))))

(assert (=> b!121846 (=> (not res!100937) (not e!79811))))

(assert (=> b!121846 e!79811))

(declare-fun lt!191146 () Unit!7497)

(assert (=> b!121846 (= lt!191146 lt!191144)))

(declare-fun lt!191125 () tuple2!10236)

(assert (=> b!121846 (= lt!191125 (reader!0 (_2!5386 lt!190736) (_2!5386 lt!191128)))))

(declare-fun lt!191153 () tuple2!10236)

(assert (=> b!121846 (= lt!191153 (reader!0 (_2!5386 lt!191139) (_2!5386 lt!191128)))))

(declare-fun lt!191141 () tuple2!10240)

(assert (=> b!121846 (= lt!191141 (readBitPure!0 (_1!5383 lt!191125)))))

(assert (=> b!121846 (= (_2!5385 lt!191141) lt!191122)))

(declare-fun lt!191133 () Unit!7497)

(declare-fun Unit!7503 () Unit!7497)

(assert (=> b!121846 (= lt!191133 Unit!7503)))

(declare-fun lt!191113 () (_ BitVec 64))

(assert (=> b!121846 (= lt!191113 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!191127 () (_ BitVec 64))

(assert (=> b!121846 (= lt!191127 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!191117 () Unit!7497)

(assert (=> b!121846 (= lt!191117 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5386 lt!190736) (buf!2878 (_2!5386 lt!191128)) lt!191127))))

(assert (=> b!121846 (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!191128)))) ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190736))) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190736))) lt!191127)))

(declare-fun lt!191116 () Unit!7497)

(assert (=> b!121846 (= lt!191116 lt!191117)))

(declare-fun lt!191152 () tuple2!10238)

(assert (=> b!121846 (= lt!191152 (readNLeastSignificantBitsLoopPure!0 (_1!5383 lt!191125) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191113))))

(declare-fun lt!191151 () (_ BitVec 64))

(assert (=> b!121846 (= lt!191151 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!191126 () Unit!7497)

(assert (=> b!121846 (= lt!191126 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5386 lt!191139) (buf!2878 (_2!5386 lt!191128)) lt!191151))))

(assert (=> b!121846 (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!191128)))) ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!191139))) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!191139))) lt!191151)))

(declare-fun lt!191124 () Unit!7497)

(assert (=> b!121846 (= lt!191124 lt!191126)))

(declare-fun lt!191143 () tuple2!10238)

(assert (=> b!121846 (= lt!191143 (readNLeastSignificantBitsLoopPure!0 (_1!5383 lt!191153) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!191113 (ite (_2!5385 lt!191141) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!191135 () tuple2!10238)

(assert (=> b!121846 (= lt!191135 (readNLeastSignificantBitsLoopPure!0 (_1!5383 lt!191125) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191113))))

(declare-fun c!7308 () Bool)

(assert (=> b!121846 (= c!7308 (_2!5385 (readBitPure!0 (_1!5383 lt!191125))))))

(declare-fun lt!191137 () tuple2!10238)

(assert (=> b!121846 (= lt!191137 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5383 lt!191125) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!191113 e!79812)))))

(declare-fun lt!191145 () Unit!7497)

(assert (=> b!121846 (= lt!191145 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5383 lt!191125) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191113))))

(assert (=> b!121846 (and (= (_2!5384 lt!191135) (_2!5384 lt!191137)) (= (_1!5384 lt!191135) (_1!5384 lt!191137)))))

(declare-fun lt!191114 () Unit!7497)

(assert (=> b!121846 (= lt!191114 lt!191145)))

(assert (=> b!121846 (= (_1!5383 lt!191125) (withMovedBitIndex!0 (_2!5383 lt!191125) (bvsub (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190736))) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))) (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!191128))) (currentByte!5569 (_2!5386 lt!191128)) (currentBit!5564 (_2!5386 lt!191128))))))))

(declare-fun lt!191136 () Unit!7497)

(declare-fun Unit!7504 () Unit!7497)

(assert (=> b!121846 (= lt!191136 Unit!7504)))

(assert (=> b!121846 (= (_1!5383 lt!191153) (withMovedBitIndex!0 (_2!5383 lt!191153) (bvsub (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!191139))) (currentByte!5569 (_2!5386 lt!191139)) (currentBit!5564 (_2!5386 lt!191139))) (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!191128))) (currentByte!5569 (_2!5386 lt!191128)) (currentBit!5564 (_2!5386 lt!191128))))))))

(declare-fun lt!191154 () Unit!7497)

(declare-fun Unit!7505 () Unit!7497)

(assert (=> b!121846 (= lt!191154 Unit!7505)))

(assert (=> b!121846 (= (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190736))) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))) (bvsub (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!191139))) (currentByte!5569 (_2!5386 lt!191139)) (currentBit!5564 (_2!5386 lt!191139))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!191130 () Unit!7497)

(declare-fun Unit!7506 () Unit!7497)

(assert (=> b!121846 (= lt!191130 Unit!7506)))

(assert (=> b!121846 (= (_2!5384 lt!191152) (_2!5384 lt!191143))))

(declare-fun lt!191119 () Unit!7497)

(declare-fun Unit!7507 () Unit!7497)

(assert (=> b!121846 (= lt!191119 Unit!7507)))

(assert (=> b!121846 (= (_1!5384 lt!191152) (_2!5383 lt!191125))))

(assert (= (and d!39244 c!7309) b!121846))

(assert (= (and d!39244 (not c!7309)) b!121841))

(assert (= (and b!121846 res!100931) b!121847))

(assert (= (and b!121847 res!100938) b!121838))

(assert (= (and b!121838 res!100936) b!121843))

(assert (= (and b!121843 res!100935) b!121839))

(assert (= (and b!121846 res!100937) b!121844))

(assert (= (and b!121846 c!7308) b!121836))

(assert (= (and b!121846 (not c!7308)) b!121837))

(assert (= (or b!121838 b!121841) bm!1589))

(assert (= (and d!39244 res!100934) b!121848))

(assert (= (and b!121848 res!100933) b!121842))

(assert (= (and b!121842 res!100939) b!121840))

(assert (= (and b!121840 res!100932) b!121845))

(declare-fun m!184763 () Bool)

(assert (=> bm!1589 m!184763))

(declare-fun m!184765 () Bool)

(assert (=> b!121843 m!184765))

(assert (=> b!121843 m!184765))

(declare-fun m!184767 () Bool)

(assert (=> b!121843 m!184767))

(declare-fun m!184769 () Bool)

(assert (=> b!121842 m!184769))

(declare-fun m!184771 () Bool)

(assert (=> b!121848 m!184771))

(assert (=> b!121848 m!184511))

(declare-fun m!184773 () Bool)

(assert (=> b!121847 m!184773))

(assert (=> b!121847 m!184511))

(declare-fun m!184775 () Bool)

(assert (=> b!121845 m!184775))

(declare-fun m!184777 () Bool)

(assert (=> b!121841 m!184777))

(declare-fun m!184779 () Bool)

(assert (=> b!121839 m!184779))

(assert (=> b!121839 m!184773))

(declare-fun m!184781 () Bool)

(assert (=> b!121840 m!184781))

(declare-fun m!184783 () Bool)

(assert (=> b!121840 m!184783))

(declare-fun m!184785 () Bool)

(assert (=> b!121840 m!184785))

(declare-fun m!184787 () Bool)

(assert (=> b!121840 m!184787))

(declare-fun m!184789 () Bool)

(assert (=> b!121840 m!184789))

(declare-fun m!184791 () Bool)

(assert (=> b!121846 m!184791))

(declare-fun m!184793 () Bool)

(assert (=> b!121846 m!184793))

(declare-fun m!184795 () Bool)

(assert (=> b!121846 m!184795))

(declare-fun m!184797 () Bool)

(assert (=> b!121846 m!184797))

(declare-fun m!184799 () Bool)

(assert (=> b!121846 m!184799))

(declare-fun m!184801 () Bool)

(assert (=> b!121846 m!184801))

(declare-fun m!184803 () Bool)

(assert (=> b!121846 m!184803))

(declare-fun m!184805 () Bool)

(assert (=> b!121846 m!184805))

(declare-fun m!184807 () Bool)

(assert (=> b!121846 m!184807))

(declare-fun m!184809 () Bool)

(assert (=> b!121846 m!184809))

(declare-fun m!184811 () Bool)

(assert (=> b!121846 m!184811))

(declare-fun m!184813 () Bool)

(assert (=> b!121846 m!184813))

(declare-fun m!184815 () Bool)

(assert (=> b!121846 m!184815))

(declare-fun m!184817 () Bool)

(assert (=> b!121846 m!184817))

(assert (=> b!121846 m!184811))

(declare-fun m!184819 () Bool)

(assert (=> b!121846 m!184819))

(declare-fun m!184821 () Bool)

(assert (=> b!121846 m!184821))

(declare-fun m!184823 () Bool)

(assert (=> b!121846 m!184823))

(declare-fun m!184825 () Bool)

(assert (=> b!121846 m!184825))

(declare-fun m!184827 () Bool)

(assert (=> b!121846 m!184827))

(declare-fun m!184829 () Bool)

(assert (=> b!121846 m!184829))

(declare-fun m!184831 () Bool)

(assert (=> b!121846 m!184831))

(declare-fun m!184833 () Bool)

(assert (=> b!121846 m!184833))

(declare-fun m!184835 () Bool)

(assert (=> b!121846 m!184835))

(assert (=> b!121846 m!184783))

(declare-fun m!184837 () Bool)

(assert (=> b!121846 m!184837))

(declare-fun m!184839 () Bool)

(assert (=> b!121846 m!184839))

(assert (=> b!121846 m!184511))

(declare-fun m!184841 () Bool)

(assert (=> b!121846 m!184841))

(declare-fun m!184843 () Bool)

(assert (=> b!121846 m!184843))

(assert (=> b!121701 d!39244))

(declare-fun b!121861 () Bool)

(declare-fun e!79819 () Bool)

(declare-fun lt!191167 () tuple2!10240)

(declare-fun lt!191165 () tuple2!10242)

(assert (=> b!121861 (= e!79819 (= (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!191167))) (currentByte!5569 (_1!5385 lt!191167)) (currentBit!5564 (_1!5385 lt!191167))) (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!191165))) (currentByte!5569 (_2!5386 lt!191165)) (currentBit!5564 (_2!5386 lt!191165)))))))

(declare-fun b!121860 () Bool)

(declare-fun e!79820 () Bool)

(assert (=> b!121860 (= e!79820 e!79819)))

(declare-fun res!100950 () Bool)

(assert (=> b!121860 (=> (not res!100950) (not e!79819))))

(assert (=> b!121860 (= res!100950 (and (= (_2!5385 lt!191167) lt!190740) (= (_1!5385 lt!191167) (_2!5386 lt!191165))))))

(assert (=> b!121860 (= lt!191167 (readBitPure!0 (readerFrom!0 (_2!5386 lt!191165) (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305))))))

(declare-fun b!121859 () Bool)

(declare-fun res!100951 () Bool)

(assert (=> b!121859 (=> (not res!100951) (not e!79820))))

(assert (=> b!121859 (= res!100951 (isPrefixOf!0 thiss!1305 (_2!5386 lt!191165)))))

(declare-fun d!39304 () Bool)

(assert (=> d!39304 e!79820))

(declare-fun res!100949 () Bool)

(assert (=> d!39304 (=> (not res!100949) (not e!79820))))

(assert (=> d!39304 (= res!100949 (= (size!2441 (buf!2878 thiss!1305)) (size!2441 (buf!2878 (_2!5386 lt!191165)))))))

(declare-fun choose!16 (BitStream!4356 Bool) tuple2!10242)

(assert (=> d!39304 (= lt!191165 (choose!16 thiss!1305 lt!190740))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!39304 (validate_offset_bit!0 ((_ sign_extend 32) (size!2441 (buf!2878 thiss!1305))) ((_ sign_extend 32) (currentByte!5569 thiss!1305)) ((_ sign_extend 32) (currentBit!5564 thiss!1305)))))

(assert (=> d!39304 (= (appendBit!0 thiss!1305 lt!190740) lt!191165)))

(declare-fun b!121858 () Bool)

(declare-fun res!100948 () Bool)

(assert (=> b!121858 (=> (not res!100948) (not e!79820))))

(declare-fun lt!191168 () (_ BitVec 64))

(declare-fun lt!191166 () (_ BitVec 64))

(assert (=> b!121858 (= res!100948 (= (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!191165))) (currentByte!5569 (_2!5386 lt!191165)) (currentBit!5564 (_2!5386 lt!191165))) (bvadd lt!191166 lt!191168)))))

(assert (=> b!121858 (or (not (= (bvand lt!191166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191168 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191166 lt!191168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121858 (= lt!191168 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!121858 (= lt!191166 (bitIndex!0 (size!2441 (buf!2878 thiss!1305)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)))))

(assert (= (and d!39304 res!100949) b!121858))

(assert (= (and b!121858 res!100948) b!121859))

(assert (= (and b!121859 res!100951) b!121860))

(assert (= (and b!121860 res!100950) b!121861))

(declare-fun m!184845 () Bool)

(assert (=> b!121859 m!184845))

(declare-fun m!184847 () Bool)

(assert (=> b!121860 m!184847))

(assert (=> b!121860 m!184847))

(declare-fun m!184849 () Bool)

(assert (=> b!121860 m!184849))

(declare-fun m!184851 () Bool)

(assert (=> d!39304 m!184851))

(declare-fun m!184853 () Bool)

(assert (=> d!39304 m!184853))

(declare-fun m!184855 () Bool)

(assert (=> b!121858 m!184855))

(assert (=> b!121858 m!184513))

(declare-fun m!184857 () Bool)

(assert (=> b!121861 m!184857))

(assert (=> b!121861 m!184855))

(assert (=> b!121701 d!39304))

(declare-fun d!39306 () Bool)

(declare-datatypes ((tuple2!10252 0))(
  ( (tuple2!10253 (_1!5391 Bool) (_2!5391 BitStream!4356)) )
))
(declare-fun lt!191173 () tuple2!10252)

(declare-fun readBit!0 (BitStream!4356) tuple2!10252)

(assert (=> d!39306 (= lt!191173 (readBit!0 (BitStream!4357 (buf!2878 (_2!5386 lt!190748)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305))))))

(assert (=> d!39306 (= (readBitPure!0 (BitStream!4357 (buf!2878 (_2!5386 lt!190748)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305))) (tuple2!10241 (_2!5391 lt!191173) (_1!5391 lt!191173)))))

(declare-fun bs!9507 () Bool)

(assert (= bs!9507 d!39306))

(declare-fun m!184859 () Bool)

(assert (=> bs!9507 m!184859))

(assert (=> b!121701 d!39306))

(declare-fun d!39308 () Bool)

(declare-fun e!79824 () Bool)

(assert (=> d!39308 e!79824))

(declare-fun res!100954 () Bool)

(assert (=> d!39308 (=> (not res!100954) (not e!79824))))

(declare-fun lt!191179 () tuple2!10236)

(assert (=> d!39308 (= res!100954 (isPrefixOf!0 (_1!5383 lt!191179) (_2!5383 lt!191179)))))

(declare-fun lt!191189 () BitStream!4356)

(assert (=> d!39308 (= lt!191179 (tuple2!10237 lt!191189 (_2!5386 lt!190748)))))

(declare-fun lt!191182 () Unit!7497)

(declare-fun lt!191184 () Unit!7497)

(assert (=> d!39308 (= lt!191182 lt!191184)))

(assert (=> d!39308 (isPrefixOf!0 lt!191189 (_2!5386 lt!190748))))

(assert (=> d!39308 (= lt!191184 (lemmaIsPrefixTransitive!0 lt!191189 (_2!5386 lt!190748) (_2!5386 lt!190748)))))

(declare-fun lt!191174 () Unit!7497)

(declare-fun lt!191178 () Unit!7497)

(assert (=> d!39308 (= lt!191174 lt!191178)))

(assert (=> d!39308 (isPrefixOf!0 lt!191189 (_2!5386 lt!190748))))

(assert (=> d!39308 (= lt!191178 (lemmaIsPrefixTransitive!0 lt!191189 thiss!1305 (_2!5386 lt!190748)))))

(declare-fun lt!191176 () Unit!7497)

(declare-fun e!79823 () Unit!7497)

(assert (=> d!39308 (= lt!191176 e!79823)))

(declare-fun c!7312 () Bool)

(assert (=> d!39308 (= c!7312 (not (= (size!2441 (buf!2878 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!191191 () Unit!7497)

(declare-fun lt!191187 () Unit!7497)

(assert (=> d!39308 (= lt!191191 lt!191187)))

(assert (=> d!39308 (isPrefixOf!0 (_2!5386 lt!190748) (_2!5386 lt!190748))))

(assert (=> d!39308 (= lt!191187 (lemmaIsPrefixRefl!0 (_2!5386 lt!190748)))))

(declare-fun lt!191185 () Unit!7497)

(declare-fun lt!191180 () Unit!7497)

(assert (=> d!39308 (= lt!191185 lt!191180)))

(assert (=> d!39308 (= lt!191180 (lemmaIsPrefixRefl!0 (_2!5386 lt!190748)))))

(declare-fun lt!191194 () Unit!7497)

(declare-fun lt!191190 () Unit!7497)

(assert (=> d!39308 (= lt!191194 lt!191190)))

(assert (=> d!39308 (isPrefixOf!0 lt!191189 lt!191189)))

(assert (=> d!39308 (= lt!191190 (lemmaIsPrefixRefl!0 lt!191189))))

(declare-fun lt!191183 () Unit!7497)

(declare-fun lt!191186 () Unit!7497)

(assert (=> d!39308 (= lt!191183 lt!191186)))

(assert (=> d!39308 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!39308 (= lt!191186 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!39308 (= lt!191189 (BitStream!4357 (buf!2878 (_2!5386 lt!190748)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)))))

(assert (=> d!39308 (isPrefixOf!0 thiss!1305 (_2!5386 lt!190748))))

(assert (=> d!39308 (= (reader!0 thiss!1305 (_2!5386 lt!190748)) lt!191179)))

(declare-fun b!121866 () Bool)

(declare-fun res!100952 () Bool)

(assert (=> b!121866 (=> (not res!100952) (not e!79824))))

(assert (=> b!121866 (= res!100952 (isPrefixOf!0 (_2!5383 lt!191179) (_2!5386 lt!190748)))))

(declare-fun b!121867 () Bool)

(declare-fun Unit!7508 () Unit!7497)

(assert (=> b!121867 (= e!79823 Unit!7508)))

(declare-fun b!121868 () Bool)

(declare-fun res!100953 () Bool)

(assert (=> b!121868 (=> (not res!100953) (not e!79824))))

(assert (=> b!121868 (= res!100953 (isPrefixOf!0 (_1!5383 lt!191179) thiss!1305))))

(declare-fun b!121869 () Bool)

(declare-fun lt!191188 () Unit!7497)

(assert (=> b!121869 (= e!79823 lt!191188)))

(declare-fun lt!191177 () (_ BitVec 64))

(assert (=> b!121869 (= lt!191177 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!191175 () (_ BitVec 64))

(assert (=> b!121869 (= lt!191175 (bitIndex!0 (size!2441 (buf!2878 thiss!1305)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)))))

(assert (=> b!121869 (= lt!191188 (arrayBitRangesEqSymmetric!0 (buf!2878 thiss!1305) (buf!2878 (_2!5386 lt!190748)) lt!191177 lt!191175))))

(assert (=> b!121869 (arrayBitRangesEq!0 (buf!2878 (_2!5386 lt!190748)) (buf!2878 thiss!1305) lt!191177 lt!191175)))

(declare-fun lt!191195 () (_ BitVec 64))

(declare-fun lt!191181 () (_ BitVec 64))

(declare-fun b!121870 () Bool)

(assert (=> b!121870 (= e!79824 (= (_1!5383 lt!191179) (withMovedBitIndex!0 (_2!5383 lt!191179) (bvsub lt!191181 lt!191195))))))

(assert (=> b!121870 (or (= (bvand lt!191181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191181 lt!191195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121870 (= lt!191195 (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190748))) (currentByte!5569 (_2!5386 lt!190748)) (currentBit!5564 (_2!5386 lt!190748))))))

(assert (=> b!121870 (= lt!191181 (bitIndex!0 (size!2441 (buf!2878 thiss!1305)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)))))

(assert (= (and d!39308 c!7312) b!121869))

(assert (= (and d!39308 (not c!7312)) b!121867))

(assert (= (and d!39308 res!100954) b!121868))

(assert (= (and b!121868 res!100953) b!121866))

(assert (= (and b!121866 res!100952) b!121870))

(declare-fun m!184861 () Bool)

(assert (=> b!121870 m!184861))

(assert (=> b!121870 m!184573))

(assert (=> b!121870 m!184513))

(declare-fun m!184863 () Bool)

(assert (=> b!121868 m!184863))

(assert (=> b!121869 m!184513))

(declare-fun m!184865 () Bool)

(assert (=> b!121869 m!184865))

(declare-fun m!184867 () Bool)

(assert (=> b!121869 m!184867))

(declare-fun m!184869 () Bool)

(assert (=> d!39308 m!184869))

(declare-fun m!184871 () Bool)

(assert (=> d!39308 m!184871))

(declare-fun m!184873 () Bool)

(assert (=> d!39308 m!184873))

(declare-fun m!184875 () Bool)

(assert (=> d!39308 m!184875))

(declare-fun m!184877 () Bool)

(assert (=> d!39308 m!184877))

(assert (=> d!39308 m!184677))

(declare-fun m!184879 () Bool)

(assert (=> d!39308 m!184879))

(assert (=> d!39308 m!184681))

(declare-fun m!184881 () Bool)

(assert (=> d!39308 m!184881))

(declare-fun m!184883 () Bool)

(assert (=> d!39308 m!184883))

(assert (=> d!39308 m!184521))

(declare-fun m!184885 () Bool)

(assert (=> b!121866 m!184885))

(assert (=> b!121701 d!39308))

(declare-fun d!39310 () Bool)

(declare-datatypes ((tuple2!10254 0))(
  ( (tuple2!10255 (_1!5392 (_ BitVec 64)) (_2!5392 BitStream!4356)) )
))
(declare-fun lt!191232 () tuple2!10254)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10254)

(assert (=> d!39310 (= lt!191232 (readNLeastSignificantBitsLoop!0 (_1!5383 lt!190749) nBits!396 i!615 lt!190730))))

(assert (=> d!39310 (= (readNLeastSignificantBitsLoopPure!0 (_1!5383 lt!190749) nBits!396 i!615 lt!190730) (tuple2!10239 (_2!5392 lt!191232) (_1!5392 lt!191232)))))

(declare-fun bs!9508 () Bool)

(assert (= bs!9508 d!39310))

(declare-fun m!184887 () Bool)

(assert (=> bs!9508 m!184887))

(assert (=> b!121701 d!39310))

(declare-fun d!39312 () Bool)

(declare-fun res!100971 () Bool)

(declare-fun e!79838 () Bool)

(assert (=> d!39312 (=> (not res!100971) (not e!79838))))

(assert (=> d!39312 (= res!100971 (= (size!2441 (buf!2878 thiss!1305)) (size!2441 (buf!2878 (_2!5386 lt!190748)))))))

(assert (=> d!39312 (= (isPrefixOf!0 thiss!1305 (_2!5386 lt!190748)) e!79838)))

(declare-fun b!121891 () Bool)

(declare-fun res!100973 () Bool)

(assert (=> b!121891 (=> (not res!100973) (not e!79838))))

(assert (=> b!121891 (= res!100973 (bvsle (bitIndex!0 (size!2441 (buf!2878 thiss!1305)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)) (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190748))) (currentByte!5569 (_2!5386 lt!190748)) (currentBit!5564 (_2!5386 lt!190748)))))))

(declare-fun b!121892 () Bool)

(declare-fun e!79837 () Bool)

(assert (=> b!121892 (= e!79838 e!79837)))

(declare-fun res!100972 () Bool)

(assert (=> b!121892 (=> res!100972 e!79837)))

(assert (=> b!121892 (= res!100972 (= (size!2441 (buf!2878 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!121893 () Bool)

(assert (=> b!121893 (= e!79837 (arrayBitRangesEq!0 (buf!2878 thiss!1305) (buf!2878 (_2!5386 lt!190748)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2441 (buf!2878 thiss!1305)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305))))))

(assert (= (and d!39312 res!100971) b!121891))

(assert (= (and b!121891 res!100973) b!121892))

(assert (= (and b!121892 (not res!100972)) b!121893))

(assert (=> b!121891 m!184513))

(assert (=> b!121891 m!184573))

(assert (=> b!121893 m!184513))

(assert (=> b!121893 m!184513))

(declare-fun m!184889 () Bool)

(assert (=> b!121893 m!184889))

(assert (=> b!121701 d!39312))

(declare-fun lt!191269 () tuple2!10254)

(declare-fun d!39314 () Bool)

(assert (=> d!39314 (= lt!191269 (readNLeastSignificantBitsLoop!0 (_1!5383 lt!190739) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190744))))

(assert (=> d!39314 (= (readNLeastSignificantBitsLoopPure!0 (_1!5383 lt!190739) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190744) (tuple2!10239 (_2!5392 lt!191269) (_1!5392 lt!191269)))))

(declare-fun bs!9509 () Bool)

(assert (= bs!9509 d!39314))

(declare-fun m!184891 () Bool)

(assert (=> bs!9509 m!184891))

(assert (=> b!121701 d!39314))

(declare-fun d!39316 () Bool)

(assert (=> d!39316 (isPrefixOf!0 thiss!1305 (_2!5386 lt!190748))))

(declare-fun lt!191288 () Unit!7497)

(declare-fun choose!30 (BitStream!4356 BitStream!4356 BitStream!4356) Unit!7497)

(assert (=> d!39316 (= lt!191288 (choose!30 thiss!1305 (_2!5386 lt!190736) (_2!5386 lt!190748)))))

(assert (=> d!39316 (isPrefixOf!0 thiss!1305 (_2!5386 lt!190736))))

(assert (=> d!39316 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5386 lt!190736) (_2!5386 lt!190748)) lt!191288)))

(declare-fun bs!9510 () Bool)

(assert (= bs!9510 d!39316))

(assert (=> bs!9510 m!184521))

(declare-fun m!184893 () Bool)

(assert (=> bs!9510 m!184893))

(assert (=> bs!9510 m!184509))

(assert (=> b!121701 d!39316))

(declare-fun d!39318 () Bool)

(declare-fun lt!191289 () tuple2!10252)

(assert (=> d!39318 (= lt!191289 (readBit!0 (_1!5383 lt!190749)))))

(assert (=> d!39318 (= (readBitPure!0 (_1!5383 lt!190749)) (tuple2!10241 (_2!5391 lt!191289) (_1!5391 lt!191289)))))

(declare-fun bs!9511 () Bool)

(assert (= bs!9511 d!39318))

(declare-fun m!184895 () Bool)

(assert (=> bs!9511 m!184895))

(assert (=> b!121701 d!39318))

(declare-fun d!39320 () Bool)

(assert (=> d!39320 (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))) ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190736))) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190736))) lt!190752)))

(declare-fun lt!191292 () Unit!7497)

(declare-fun choose!9 (BitStream!4356 array!5395 (_ BitVec 64) BitStream!4356) Unit!7497)

(assert (=> d!39320 (= lt!191292 (choose!9 (_2!5386 lt!190736) (buf!2878 (_2!5386 lt!190748)) lt!190752 (BitStream!4357 (buf!2878 (_2!5386 lt!190748)) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736)))))))

(assert (=> d!39320 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5386 lt!190736) (buf!2878 (_2!5386 lt!190748)) lt!190752) lt!191292)))

(declare-fun bs!9512 () Bool)

(assert (= bs!9512 d!39320))

(assert (=> bs!9512 m!184525))

(declare-fun m!184897 () Bool)

(assert (=> bs!9512 m!184897))

(assert (=> b!121701 d!39320))

(declare-fun d!39322 () Bool)

(assert (=> d!39322 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))) ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190736))) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190736))) lt!190752) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))) ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190736))) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190736)))) lt!190752))))

(declare-fun bs!9513 () Bool)

(assert (= bs!9513 d!39322))

(declare-fun m!184899 () Bool)

(assert (=> bs!9513 m!184899))

(assert (=> b!121701 d!39322))

(declare-fun d!39324 () Bool)

(declare-fun e!79845 () Bool)

(assert (=> d!39324 e!79845))

(declare-fun res!100984 () Bool)

(assert (=> d!39324 (=> (not res!100984) (not e!79845))))

(declare-fun lt!191303 () tuple2!10240)

(declare-fun lt!191302 () tuple2!10240)

(assert (=> d!39324 (= res!100984 (= (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!191303))) (currentByte!5569 (_1!5385 lt!191303)) (currentBit!5564 (_1!5385 lt!191303))) (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!191302))) (currentByte!5569 (_1!5385 lt!191302)) (currentBit!5564 (_1!5385 lt!191302)))))))

(declare-fun lt!191304 () BitStream!4356)

(declare-fun lt!191301 () Unit!7497)

(declare-fun choose!50 (BitStream!4356 BitStream!4356 BitStream!4356 tuple2!10240 tuple2!10240 BitStream!4356 Bool tuple2!10240 tuple2!10240 BitStream!4356 Bool) Unit!7497)

(assert (=> d!39324 (= lt!191301 (choose!50 lt!190753 (_2!5386 lt!190748) lt!191304 lt!191303 (tuple2!10241 (_1!5385 lt!191303) (_2!5385 lt!191303)) (_1!5385 lt!191303) (_2!5385 lt!191303) lt!191302 (tuple2!10241 (_1!5385 lt!191302) (_2!5385 lt!191302)) (_1!5385 lt!191302) (_2!5385 lt!191302)))))

(assert (=> d!39324 (= lt!191302 (readBitPure!0 lt!191304))))

(assert (=> d!39324 (= lt!191303 (readBitPure!0 lt!190753))))

(assert (=> d!39324 (= lt!191304 (BitStream!4357 (buf!2878 (_2!5386 lt!190748)) (currentByte!5569 lt!190753) (currentBit!5564 lt!190753)))))

(assert (=> d!39324 (invariant!0 (currentBit!5564 lt!190753) (currentByte!5569 lt!190753) (size!2441 (buf!2878 (_2!5386 lt!190748))))))

(assert (=> d!39324 (= (readBitPrefixLemma!0 lt!190753 (_2!5386 lt!190748)) lt!191301)))

(declare-fun b!121904 () Bool)

(assert (=> b!121904 (= e!79845 (= (_2!5385 lt!191303) (_2!5385 lt!191302)))))

(assert (= (and d!39324 res!100984) b!121904))

(declare-fun m!184901 () Bool)

(assert (=> d!39324 m!184901))

(declare-fun m!184903 () Bool)

(assert (=> d!39324 m!184903))

(assert (=> d!39324 m!184555))

(declare-fun m!184905 () Bool)

(assert (=> d!39324 m!184905))

(declare-fun m!184907 () Bool)

(assert (=> d!39324 m!184907))

(declare-fun m!184909 () Bool)

(assert (=> d!39324 m!184909))

(assert (=> b!121701 d!39324))

(declare-fun d!39326 () Bool)

(assert (=> d!39326 (validate_offset_bits!1 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))) ((_ sign_extend 32) (currentByte!5569 thiss!1305)) ((_ sign_extend 32) (currentBit!5564 thiss!1305)) lt!190754)))

(declare-fun lt!191350 () Unit!7497)

(assert (=> d!39326 (= lt!191350 (choose!9 thiss!1305 (buf!2878 (_2!5386 lt!190748)) lt!190754 (BitStream!4357 (buf!2878 (_2!5386 lt!190748)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305))))))

(assert (=> d!39326 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2878 (_2!5386 lt!190748)) lt!190754) lt!191350)))

(declare-fun bs!9514 () Bool)

(assert (= bs!9514 d!39326))

(assert (=> bs!9514 m!184551))

(declare-fun m!184911 () Bool)

(assert (=> bs!9514 m!184911))

(assert (=> b!121701 d!39326))

(declare-fun d!39328 () Bool)

(declare-fun e!79853 () Bool)

(assert (=> d!39328 e!79853))

(declare-fun res!100994 () Bool)

(assert (=> d!39328 (=> (not res!100994) (not e!79853))))

(declare-fun lt!191356 () (_ BitVec 64))

(declare-fun lt!191351 () (_ BitVec 64))

(declare-fun lt!191354 () (_ BitVec 64))

(assert (=> d!39328 (= res!100994 (= lt!191354 (bvsub lt!191351 lt!191356)))))

(assert (=> d!39328 (or (= (bvand lt!191351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191356 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191351 lt!191356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39328 (= lt!191356 (remainingBits!0 ((_ sign_extend 32) (size!2441 (buf!2878 (_1!5385 lt!190758)))) ((_ sign_extend 32) (currentByte!5569 (_1!5385 lt!190758))) ((_ sign_extend 32) (currentBit!5564 (_1!5385 lt!190758)))))))

(declare-fun lt!191353 () (_ BitVec 64))

(declare-fun lt!191352 () (_ BitVec 64))

(assert (=> d!39328 (= lt!191351 (bvmul lt!191353 lt!191352))))

(assert (=> d!39328 (or (= lt!191353 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191352 (bvsdiv (bvmul lt!191353 lt!191352) lt!191353)))))

(assert (=> d!39328 (= lt!191352 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39328 (= lt!191353 ((_ sign_extend 32) (size!2441 (buf!2878 (_1!5385 lt!190758)))))))

(assert (=> d!39328 (= lt!191354 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5569 (_1!5385 lt!190758))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5564 (_1!5385 lt!190758)))))))

(assert (=> d!39328 (invariant!0 (currentBit!5564 (_1!5385 lt!190758)) (currentByte!5569 (_1!5385 lt!190758)) (size!2441 (buf!2878 (_1!5385 lt!190758))))))

(assert (=> d!39328 (= (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!190758))) (currentByte!5569 (_1!5385 lt!190758)) (currentBit!5564 (_1!5385 lt!190758))) lt!191354)))

(declare-fun b!121918 () Bool)

(declare-fun res!100995 () Bool)

(assert (=> b!121918 (=> (not res!100995) (not e!79853))))

(assert (=> b!121918 (= res!100995 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191354))))

(declare-fun b!121919 () Bool)

(declare-fun lt!191355 () (_ BitVec 64))

(assert (=> b!121919 (= e!79853 (bvsle lt!191354 (bvmul lt!191355 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121919 (or (= lt!191355 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191355 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191355)))))

(assert (=> b!121919 (= lt!191355 ((_ sign_extend 32) (size!2441 (buf!2878 (_1!5385 lt!190758)))))))

(assert (= (and d!39328 res!100994) b!121918))

(assert (= (and b!121918 res!100995) b!121919))

(declare-fun m!184913 () Bool)

(assert (=> d!39328 m!184913))

(declare-fun m!184915 () Bool)

(assert (=> d!39328 m!184915))

(assert (=> b!121701 d!39328))

(declare-fun d!39330 () Bool)

(declare-fun lt!191357 () tuple2!10252)

(assert (=> d!39330 (= lt!191357 (readBit!0 lt!190753))))

(assert (=> d!39330 (= (readBitPure!0 lt!190753) (tuple2!10241 (_2!5391 lt!191357) (_1!5391 lt!191357)))))

(declare-fun bs!9515 () Bool)

(assert (= bs!9515 d!39330))

(declare-fun m!184917 () Bool)

(assert (=> bs!9515 m!184917))

(assert (=> b!121701 d!39330))

(declare-fun d!39332 () Bool)

(declare-fun e!79854 () Bool)

(assert (=> d!39332 e!79854))

(declare-fun res!100996 () Bool)

(assert (=> d!39332 (=> (not res!100996) (not e!79854))))

(declare-fun lt!191361 () (_ BitVec 64))

(declare-fun lt!191358 () (_ BitVec 64))

(declare-fun lt!191363 () (_ BitVec 64))

(assert (=> d!39332 (= res!100996 (= lt!191361 (bvsub lt!191358 lt!191363)))))

(assert (=> d!39332 (or (= (bvand lt!191358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191363 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191358 lt!191363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39332 (= lt!191363 (remainingBits!0 ((_ sign_extend 32) (size!2441 (buf!2878 (_1!5385 lt!190742)))) ((_ sign_extend 32) (currentByte!5569 (_1!5385 lt!190742))) ((_ sign_extend 32) (currentBit!5564 (_1!5385 lt!190742)))))))

(declare-fun lt!191360 () (_ BitVec 64))

(declare-fun lt!191359 () (_ BitVec 64))

(assert (=> d!39332 (= lt!191358 (bvmul lt!191360 lt!191359))))

(assert (=> d!39332 (or (= lt!191360 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191359 (bvsdiv (bvmul lt!191360 lt!191359) lt!191360)))))

(assert (=> d!39332 (= lt!191359 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39332 (= lt!191360 ((_ sign_extend 32) (size!2441 (buf!2878 (_1!5385 lt!190742)))))))

(assert (=> d!39332 (= lt!191361 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5569 (_1!5385 lt!190742))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5564 (_1!5385 lt!190742)))))))

(assert (=> d!39332 (invariant!0 (currentBit!5564 (_1!5385 lt!190742)) (currentByte!5569 (_1!5385 lt!190742)) (size!2441 (buf!2878 (_1!5385 lt!190742))))))

(assert (=> d!39332 (= (bitIndex!0 (size!2441 (buf!2878 (_1!5385 lt!190742))) (currentByte!5569 (_1!5385 lt!190742)) (currentBit!5564 (_1!5385 lt!190742))) lt!191361)))

(declare-fun b!121920 () Bool)

(declare-fun res!100997 () Bool)

(assert (=> b!121920 (=> (not res!100997) (not e!79854))))

(assert (=> b!121920 (= res!100997 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191361))))

(declare-fun b!121921 () Bool)

(declare-fun lt!191362 () (_ BitVec 64))

(assert (=> b!121921 (= e!79854 (bvsle lt!191361 (bvmul lt!191362 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121921 (or (= lt!191362 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191362 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191362)))))

(assert (=> b!121921 (= lt!191362 ((_ sign_extend 32) (size!2441 (buf!2878 (_1!5385 lt!190742)))))))

(assert (= (and d!39332 res!100996) b!121920))

(assert (= (and b!121920 res!100997) b!121921))

(declare-fun m!184919 () Bool)

(assert (=> d!39332 m!184919))

(declare-fun m!184921 () Bool)

(assert (=> d!39332 m!184921))

(assert (=> b!121701 d!39332))

(declare-fun d!39334 () Bool)

(declare-fun e!79861 () Bool)

(assert (=> d!39334 e!79861))

(declare-fun res!101006 () Bool)

(assert (=> d!39334 (=> (not res!101006) (not e!79861))))

(declare-fun lt!191370 () (_ BitVec 64))

(declare-fun lt!191369 () BitStream!4356)

(assert (=> d!39334 (= res!101006 (= (bvadd lt!191370 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2441 (buf!2878 lt!191369)) (currentByte!5569 lt!191369) (currentBit!5564 lt!191369))))))

(assert (=> d!39334 (or (not (= (bvand lt!191370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191370 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39334 (= lt!191370 (bitIndex!0 (size!2441 (buf!2878 (_1!5383 lt!190749))) (currentByte!5569 (_1!5383 lt!190749)) (currentBit!5564 (_1!5383 lt!190749))))))

(declare-fun moveBitIndex!0 (BitStream!4356 (_ BitVec 64)) tuple2!10242)

(assert (=> d!39334 (= lt!191369 (_2!5386 (moveBitIndex!0 (_1!5383 lt!190749) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4356 (_ BitVec 64)) Bool)

(assert (=> d!39334 (moveBitIndexPrecond!0 (_1!5383 lt!190749) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!39334 (= (withMovedBitIndex!0 (_1!5383 lt!190749) #b0000000000000000000000000000000000000000000000000000000000000001) lt!191369)))

(declare-fun b!121930 () Bool)

(assert (=> b!121930 (= e!79861 (= (size!2441 (buf!2878 (_1!5383 lt!190749))) (size!2441 (buf!2878 lt!191369))))))

(assert (= (and d!39334 res!101006) b!121930))

(declare-fun m!185007 () Bool)

(assert (=> d!39334 m!185007))

(declare-fun m!185009 () Bool)

(assert (=> d!39334 m!185009))

(declare-fun m!185011 () Bool)

(assert (=> d!39334 m!185011))

(declare-fun m!185013 () Bool)

(assert (=> d!39334 m!185013))

(assert (=> b!121699 d!39334))

(declare-fun d!39340 () Bool)

(declare-fun e!79862 () Bool)

(assert (=> d!39340 e!79862))

(declare-fun res!101007 () Bool)

(assert (=> d!39340 (=> (not res!101007) (not e!79862))))

(declare-fun lt!191374 () (_ BitVec 64))

(declare-fun lt!191376 () (_ BitVec 64))

(declare-fun lt!191371 () (_ BitVec 64))

(assert (=> d!39340 (= res!101007 (= lt!191374 (bvsub lt!191371 lt!191376)))))

(assert (=> d!39340 (or (= (bvand lt!191371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191376 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191371 lt!191376) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39340 (= lt!191376 (remainingBits!0 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190736)))) ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190736))) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190736)))))))

(declare-fun lt!191373 () (_ BitVec 64))

(declare-fun lt!191372 () (_ BitVec 64))

(assert (=> d!39340 (= lt!191371 (bvmul lt!191373 lt!191372))))

(assert (=> d!39340 (or (= lt!191373 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191372 (bvsdiv (bvmul lt!191373 lt!191372) lt!191373)))))

(assert (=> d!39340 (= lt!191372 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39340 (= lt!191373 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190736)))))))

(assert (=> d!39340 (= lt!191374 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190736))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190736)))))))

(assert (=> d!39340 (invariant!0 (currentBit!5564 (_2!5386 lt!190736)) (currentByte!5569 (_2!5386 lt!190736)) (size!2441 (buf!2878 (_2!5386 lt!190736))))))

(assert (=> d!39340 (= (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190736))) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736))) lt!191374)))

(declare-fun b!121931 () Bool)

(declare-fun res!101008 () Bool)

(assert (=> b!121931 (=> (not res!101008) (not e!79862))))

(assert (=> b!121931 (= res!101008 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191374))))

(declare-fun b!121932 () Bool)

(declare-fun lt!191375 () (_ BitVec 64))

(assert (=> b!121932 (= e!79862 (bvsle lt!191374 (bvmul lt!191375 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121932 (or (= lt!191375 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191375 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191375)))))

(assert (=> b!121932 (= lt!191375 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190736)))))))

(assert (= (and d!39340 res!101007) b!121931))

(assert (= (and b!121931 res!101008) b!121932))

(declare-fun m!185015 () Bool)

(assert (=> d!39340 m!185015))

(declare-fun m!185017 () Bool)

(assert (=> d!39340 m!185017))

(assert (=> b!121699 d!39340))

(declare-fun d!39342 () Bool)

(declare-fun e!79863 () Bool)

(assert (=> d!39342 e!79863))

(declare-fun res!101009 () Bool)

(assert (=> d!39342 (=> (not res!101009) (not e!79863))))

(declare-fun lt!191377 () BitStream!4356)

(declare-fun lt!191378 () (_ BitVec 64))

(assert (=> d!39342 (= res!101009 (= (bvadd lt!191378 (bvsub lt!190757 lt!190741)) (bitIndex!0 (size!2441 (buf!2878 lt!191377)) (currentByte!5569 lt!191377) (currentBit!5564 lt!191377))))))

(assert (=> d!39342 (or (not (= (bvand lt!191378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190757 lt!190741) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191378 (bvsub lt!190757 lt!190741)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39342 (= lt!191378 (bitIndex!0 (size!2441 (buf!2878 (_2!5383 lt!190739))) (currentByte!5569 (_2!5383 lt!190739)) (currentBit!5564 (_2!5383 lt!190739))))))

(assert (=> d!39342 (= lt!191377 (_2!5386 (moveBitIndex!0 (_2!5383 lt!190739) (bvsub lt!190757 lt!190741))))))

(assert (=> d!39342 (moveBitIndexPrecond!0 (_2!5383 lt!190739) (bvsub lt!190757 lt!190741))))

(assert (=> d!39342 (= (withMovedBitIndex!0 (_2!5383 lt!190739) (bvsub lt!190757 lt!190741)) lt!191377)))

(declare-fun b!121933 () Bool)

(assert (=> b!121933 (= e!79863 (= (size!2441 (buf!2878 (_2!5383 lt!190739))) (size!2441 (buf!2878 lt!191377))))))

(assert (= (and d!39342 res!101009) b!121933))

(declare-fun m!185019 () Bool)

(assert (=> d!39342 m!185019))

(declare-fun m!185021 () Bool)

(assert (=> d!39342 m!185021))

(declare-fun m!185023 () Bool)

(assert (=> d!39342 m!185023))

(declare-fun m!185025 () Bool)

(assert (=> d!39342 m!185025))

(assert (=> b!121699 d!39342))

(declare-fun d!39344 () Bool)

(declare-fun e!79866 () Bool)

(assert (=> d!39344 e!79866))

(declare-fun res!101013 () Bool)

(assert (=> d!39344 (=> (not res!101013) (not e!79866))))

(declare-fun lt!191382 () (_ BitVec 64))

(declare-fun lt!191379 () (_ BitVec 64))

(declare-fun lt!191384 () (_ BitVec 64))

(assert (=> d!39344 (= res!101013 (= lt!191382 (bvsub lt!191379 lt!191384)))))

(assert (=> d!39344 (or (= (bvand lt!191379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191384 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191379 lt!191384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39344 (= lt!191384 (remainingBits!0 ((_ sign_extend 32) (size!2441 (buf!2878 thiss!1305))) ((_ sign_extend 32) (currentByte!5569 thiss!1305)) ((_ sign_extend 32) (currentBit!5564 thiss!1305))))))

(declare-fun lt!191381 () (_ BitVec 64))

(declare-fun lt!191380 () (_ BitVec 64))

(assert (=> d!39344 (= lt!191379 (bvmul lt!191381 lt!191380))))

(assert (=> d!39344 (or (= lt!191381 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191380 (bvsdiv (bvmul lt!191381 lt!191380) lt!191381)))))

(assert (=> d!39344 (= lt!191380 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39344 (= lt!191381 ((_ sign_extend 32) (size!2441 (buf!2878 thiss!1305))))))

(assert (=> d!39344 (= lt!191382 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5569 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5564 thiss!1305))))))

(assert (=> d!39344 (invariant!0 (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305) (size!2441 (buf!2878 thiss!1305)))))

(assert (=> d!39344 (= (bitIndex!0 (size!2441 (buf!2878 thiss!1305)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)) lt!191382)))

(declare-fun b!121937 () Bool)

(declare-fun res!101014 () Bool)

(assert (=> b!121937 (=> (not res!101014) (not e!79866))))

(assert (=> b!121937 (= res!101014 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191382))))

(declare-fun b!121938 () Bool)

(declare-fun lt!191383 () (_ BitVec 64))

(assert (=> b!121938 (= e!79866 (bvsle lt!191382 (bvmul lt!191383 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121938 (or (= lt!191383 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191383 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191383)))))

(assert (=> b!121938 (= lt!191383 ((_ sign_extend 32) (size!2441 (buf!2878 thiss!1305))))))

(assert (= (and d!39344 res!101013) b!121937))

(assert (= (and b!121937 res!101014) b!121938))

(assert (=> d!39344 m!184649))

(assert (=> d!39344 m!184651))

(assert (=> b!121699 d!39344))

(declare-fun d!39348 () Bool)

(declare-fun lt!191398 () tuple2!10238)

(declare-fun lt!191401 () tuple2!10238)

(assert (=> d!39348 (and (= (_2!5384 lt!191398) (_2!5384 lt!191401)) (= (_1!5384 lt!191398) (_1!5384 lt!191401)))))

(declare-fun lt!191402 () Unit!7497)

(declare-fun lt!191397 () (_ BitVec 64))

(declare-fun lt!191399 () BitStream!4356)

(declare-fun lt!191400 () Bool)

(declare-fun choose!45 (BitStream!4356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10238 tuple2!10238 BitStream!4356 (_ BitVec 64) Bool BitStream!4356 (_ BitVec 64) tuple2!10238 tuple2!10238 BitStream!4356 (_ BitVec 64)) Unit!7497)

(assert (=> d!39348 (= lt!191402 (choose!45 (_1!5383 lt!190749) nBits!396 i!615 lt!190730 lt!191398 (tuple2!10239 (_1!5384 lt!191398) (_2!5384 lt!191398)) (_1!5384 lt!191398) (_2!5384 lt!191398) lt!191400 lt!191399 lt!191397 lt!191401 (tuple2!10239 (_1!5384 lt!191401) (_2!5384 lt!191401)) (_1!5384 lt!191401) (_2!5384 lt!191401)))))

(assert (=> d!39348 (= lt!191401 (readNLeastSignificantBitsLoopPure!0 lt!191399 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!191397))))

(assert (=> d!39348 (= lt!191397 (bvor lt!190730 (ite lt!191400 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39348 (= lt!191399 (withMovedBitIndex!0 (_1!5383 lt!190749) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!39348 (= lt!191400 (_2!5385 (readBitPure!0 (_1!5383 lt!190749))))))

(assert (=> d!39348 (= lt!191398 (readNLeastSignificantBitsLoopPure!0 (_1!5383 lt!190749) nBits!396 i!615 lt!190730))))

(assert (=> d!39348 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5383 lt!190749) nBits!396 i!615 lt!190730) lt!191402)))

(declare-fun bs!9518 () Bool)

(assert (= bs!9518 d!39348))

(assert (=> bs!9518 m!184569))

(declare-fun m!185029 () Bool)

(assert (=> bs!9518 m!185029))

(assert (=> bs!9518 m!184537))

(assert (=> bs!9518 m!184543))

(declare-fun m!185031 () Bool)

(assert (=> bs!9518 m!185031))

(assert (=> b!121699 d!39348))

(declare-fun d!39350 () Bool)

(declare-fun lt!191403 () tuple2!10254)

(assert (=> d!39350 (= lt!191403 (readNLeastSignificantBitsLoop!0 lt!190755 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190744))))

(assert (=> d!39350 (= (readNLeastSignificantBitsLoopPure!0 lt!190755 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190744) (tuple2!10239 (_2!5392 lt!191403) (_1!5392 lt!191403)))))

(declare-fun bs!9519 () Bool)

(assert (= bs!9519 d!39350))

(declare-fun m!185033 () Bool)

(assert (=> bs!9519 m!185033))

(assert (=> b!121699 d!39350))

(declare-fun d!39352 () Bool)

(declare-fun e!79867 () Bool)

(assert (=> d!39352 e!79867))

(declare-fun res!101015 () Bool)

(assert (=> d!39352 (=> (not res!101015) (not e!79867))))

(declare-fun lt!191407 () (_ BitVec 64))

(declare-fun lt!191409 () (_ BitVec 64))

(declare-fun lt!191404 () (_ BitVec 64))

(assert (=> d!39352 (= res!101015 (= lt!191407 (bvsub lt!191404 lt!191409)))))

(assert (=> d!39352 (or (= (bvand lt!191404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191409 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191404 lt!191409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39352 (= lt!191409 (remainingBits!0 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))) ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190748))) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190748)))))))

(declare-fun lt!191406 () (_ BitVec 64))

(declare-fun lt!191405 () (_ BitVec 64))

(assert (=> d!39352 (= lt!191404 (bvmul lt!191406 lt!191405))))

(assert (=> d!39352 (or (= lt!191406 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191405 (bvsdiv (bvmul lt!191406 lt!191405) lt!191406)))))

(assert (=> d!39352 (= lt!191405 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39352 (= lt!191406 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))))))

(assert (=> d!39352 (= lt!191407 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5569 (_2!5386 lt!190748))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5564 (_2!5386 lt!190748)))))))

(assert (=> d!39352 (invariant!0 (currentBit!5564 (_2!5386 lt!190748)) (currentByte!5569 (_2!5386 lt!190748)) (size!2441 (buf!2878 (_2!5386 lt!190748))))))

(assert (=> d!39352 (= (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190748))) (currentByte!5569 (_2!5386 lt!190748)) (currentBit!5564 (_2!5386 lt!190748))) lt!191407)))

(declare-fun b!121939 () Bool)

(declare-fun res!101016 () Bool)

(assert (=> b!121939 (=> (not res!101016) (not e!79867))))

(assert (=> b!121939 (= res!101016 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191407))))

(declare-fun b!121940 () Bool)

(declare-fun lt!191408 () (_ BitVec 64))

(assert (=> b!121940 (= e!79867 (bvsle lt!191407 (bvmul lt!191408 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121940 (or (= lt!191408 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191408 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191408)))))

(assert (=> b!121940 (= lt!191408 ((_ sign_extend 32) (size!2441 (buf!2878 (_2!5386 lt!190748)))))))

(assert (= (and d!39352 res!101015) b!121939))

(assert (= (and b!121939 res!101016) b!121940))

(declare-fun m!185035 () Bool)

(assert (=> d!39352 m!185035))

(declare-fun m!185037 () Bool)

(assert (=> d!39352 m!185037))

(assert (=> b!121699 d!39352))

(declare-fun d!39354 () Bool)

(declare-fun e!79868 () Bool)

(assert (=> d!39354 e!79868))

(declare-fun res!101017 () Bool)

(assert (=> d!39354 (=> (not res!101017) (not e!79868))))

(declare-fun lt!191411 () (_ BitVec 64))

(declare-fun lt!191410 () BitStream!4356)

(assert (=> d!39354 (= res!101017 (= (bvadd lt!191411 (bvsub lt!190750 lt!190741)) (bitIndex!0 (size!2441 (buf!2878 lt!191410)) (currentByte!5569 lt!191410) (currentBit!5564 lt!191410))))))

(assert (=> d!39354 (or (not (= (bvand lt!191411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190750 lt!190741) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191411 (bvsub lt!190750 lt!190741)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39354 (= lt!191411 (bitIndex!0 (size!2441 (buf!2878 (_2!5383 lt!190749))) (currentByte!5569 (_2!5383 lt!190749)) (currentBit!5564 (_2!5383 lt!190749))))))

(assert (=> d!39354 (= lt!191410 (_2!5386 (moveBitIndex!0 (_2!5383 lt!190749) (bvsub lt!190750 lt!190741))))))

(assert (=> d!39354 (moveBitIndexPrecond!0 (_2!5383 lt!190749) (bvsub lt!190750 lt!190741))))

(assert (=> d!39354 (= (withMovedBitIndex!0 (_2!5383 lt!190749) (bvsub lt!190750 lt!190741)) lt!191410)))

(declare-fun b!121941 () Bool)

(assert (=> b!121941 (= e!79868 (= (size!2441 (buf!2878 (_2!5383 lt!190749))) (size!2441 (buf!2878 lt!191410))))))

(assert (= (and d!39354 res!101017) b!121941))

(declare-fun m!185039 () Bool)

(assert (=> d!39354 m!185039))

(declare-fun m!185041 () Bool)

(assert (=> d!39354 m!185041))

(declare-fun m!185043 () Bool)

(assert (=> d!39354 m!185043))

(declare-fun m!185045 () Bool)

(assert (=> d!39354 m!185045))

(assert (=> b!121699 d!39354))

(assert (=> b!121703 d!39340))

(assert (=> b!121703 d!39344))

(declare-fun d!39356 () Bool)

(assert (=> d!39356 (= (invariant!0 (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305) (size!2441 (buf!2878 (_2!5386 lt!190736)))) (and (bvsge (currentBit!5564 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5564 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5569 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5569 thiss!1305) (size!2441 (buf!2878 (_2!5386 lt!190736)))) (and (= (currentBit!5564 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5569 thiss!1305) (size!2441 (buf!2878 (_2!5386 lt!190736))))))))))

(assert (=> b!121702 d!39356))

(declare-fun d!39358 () Bool)

(assert (=> d!39358 (= (array_inv!2243 (buf!2878 thiss!1305)) (bvsge (size!2441 (buf!2878 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!121695 d!39358))

(declare-fun d!39360 () Bool)

(declare-fun res!101018 () Bool)

(declare-fun e!79870 () Bool)

(assert (=> d!39360 (=> (not res!101018) (not e!79870))))

(assert (=> d!39360 (= res!101018 (= (size!2441 (buf!2878 thiss!1305)) (size!2441 (buf!2878 (_2!5386 lt!190736)))))))

(assert (=> d!39360 (= (isPrefixOf!0 thiss!1305 (_2!5386 lt!190736)) e!79870)))

(declare-fun b!121942 () Bool)

(declare-fun res!101020 () Bool)

(assert (=> b!121942 (=> (not res!101020) (not e!79870))))

(assert (=> b!121942 (= res!101020 (bvsle (bitIndex!0 (size!2441 (buf!2878 thiss!1305)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)) (bitIndex!0 (size!2441 (buf!2878 (_2!5386 lt!190736))) (currentByte!5569 (_2!5386 lt!190736)) (currentBit!5564 (_2!5386 lt!190736)))))))

(declare-fun b!121943 () Bool)

(declare-fun e!79869 () Bool)

(assert (=> b!121943 (= e!79870 e!79869)))

(declare-fun res!101019 () Bool)

(assert (=> b!121943 (=> res!101019 e!79869)))

(assert (=> b!121943 (= res!101019 (= (size!2441 (buf!2878 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!121944 () Bool)

(assert (=> b!121944 (= e!79869 (arrayBitRangesEq!0 (buf!2878 thiss!1305) (buf!2878 (_2!5386 lt!190736)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2441 (buf!2878 thiss!1305)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305))))))

(assert (= (and d!39360 res!101018) b!121942))

(assert (= (and b!121942 res!101020) b!121943))

(assert (= (and b!121943 (not res!101019)) b!121944))

(assert (=> b!121942 m!184513))

(assert (=> b!121942 m!184511))

(assert (=> b!121944 m!184513))

(assert (=> b!121944 m!184513))

(declare-fun m!185047 () Bool)

(assert (=> b!121944 m!185047))

(assert (=> b!121706 d!39360))

(declare-fun d!39362 () Bool)

(declare-fun lt!191412 () tuple2!10252)

(assert (=> d!39362 (= lt!191412 (readBit!0 (readerFrom!0 (_2!5386 lt!190736) (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305))))))

(assert (=> d!39362 (= (readBitPure!0 (readerFrom!0 (_2!5386 lt!190736) (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305))) (tuple2!10241 (_2!5391 lt!191412) (_1!5391 lt!191412)))))

(declare-fun bs!9520 () Bool)

(assert (= bs!9520 d!39362))

(assert (=> bs!9520 m!184517))

(declare-fun m!185049 () Bool)

(assert (=> bs!9520 m!185049))

(assert (=> b!121705 d!39362))

(declare-fun d!39364 () Bool)

(declare-fun e!79873 () Bool)

(assert (=> d!39364 e!79873))

(declare-fun res!101024 () Bool)

(assert (=> d!39364 (=> (not res!101024) (not e!79873))))

(assert (=> d!39364 (= res!101024 (invariant!0 (currentBit!5564 (_2!5386 lt!190736)) (currentByte!5569 (_2!5386 lt!190736)) (size!2441 (buf!2878 (_2!5386 lt!190736)))))))

(assert (=> d!39364 (= (readerFrom!0 (_2!5386 lt!190736) (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305)) (BitStream!4357 (buf!2878 (_2!5386 lt!190736)) (currentByte!5569 thiss!1305) (currentBit!5564 thiss!1305)))))

(declare-fun b!121947 () Bool)

(assert (=> b!121947 (= e!79873 (invariant!0 (currentBit!5564 thiss!1305) (currentByte!5569 thiss!1305) (size!2441 (buf!2878 (_2!5386 lt!190736)))))))

(assert (= (and d!39364 res!101024) b!121947))

(assert (=> d!39364 m!185017))

(assert (=> b!121947 m!184561))

(assert (=> b!121705 d!39364))

(check-sat (not d!39310) (not d!39326) (not d!39304) (not b!121842) (not d!39348) (not d!39236) (not d!39322) (not bm!1589) (not d!39316) (not b!121859) (not b!121893) (not b!121858) (not d!39350) (not d!39332) (not d!39308) (not d!39334) (not d!39320) (not d!39318) (not d!39328) (not d!39306) (not b!121769) (not b!121942) (not b!121840) (not b!121891) (not d!39364) (not b!121841) (not b!121839) (not b!121843) (not d!39324) (not d!39230) (not b!121848) (not b!121771) (not d!39344) (not b!121866) (not d!39242) (not d!39352) (not d!39314) (not d!39330) (not b!121861) (not b!121947) (not d!39232) (not d!39354) (not b!121860) (not b!121870) (not d!39340) (not d!39240) (not b!121767) (not b!121868) (not b!121869) (not b!121846) (not d!39342) (not b!121845) (not b!121770) (not b!121944) (not b!121847) (not d!39362))
