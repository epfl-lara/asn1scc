; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40192 () Bool)

(assert start!40192)

(declare-fun b!183718 () Bool)

(declare-fun res!152774 () Bool)

(declare-fun e!127343 () Bool)

(assert (=> b!183718 (=> (not res!152774) (not e!127343))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!183718 (= res!152774 (not (= i!590 nBits!348)))))

(declare-fun b!183719 () Bool)

(declare-fun e!127346 () Bool)

(declare-fun e!127354 () Bool)

(assert (=> b!183719 (= e!127346 e!127354)))

(declare-fun res!152773 () Bool)

(assert (=> b!183719 (=> (not res!152773) (not e!127354))))

(declare-fun lt!282703 () (_ BitVec 64))

(declare-fun lt!282707 () (_ BitVec 64))

(assert (=> b!183719 (= res!152773 (= lt!282703 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282707)))))

(declare-datatypes ((array!9760 0))(
  ( (array!9761 (arr!5234 (Array (_ BitVec 32) (_ BitVec 8))) (size!4304 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7716 0))(
  ( (BitStream!7717 (buf!4759 array!9760) (currentByte!8993 (_ BitVec 32)) (currentBit!8988 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13183 0))(
  ( (Unit!13184) )
))
(declare-datatypes ((tuple2!15868 0))(
  ( (tuple2!15869 (_1!8579 Unit!13183) (_2!8579 BitStream!7716)) )
))
(declare-fun lt!282719 () tuple2!15868)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183719 (= lt!282703 (bitIndex!0 (size!4304 (buf!4759 (_2!8579 lt!282719))) (currentByte!8993 (_2!8579 lt!282719)) (currentBit!8988 (_2!8579 lt!282719))))))

(declare-fun thiss!1204 () BitStream!7716)

(assert (=> b!183719 (= lt!282707 (bitIndex!0 (size!4304 (buf!4759 thiss!1204)) (currentByte!8993 thiss!1204) (currentBit!8988 thiss!1204)))))

(declare-fun b!183720 () Bool)

(declare-fun e!127351 () Bool)

(declare-fun array_inv!4045 (array!9760) Bool)

(assert (=> b!183720 (= e!127351 (array_inv!4045 (buf!4759 thiss!1204)))))

(declare-fun b!183721 () Bool)

(declare-fun res!152762 () Bool)

(declare-fun e!127353 () Bool)

(assert (=> b!183721 (=> res!152762 e!127353)))

(assert (=> b!183721 (= res!152762 (bvsge i!590 nBits!348))))

(declare-fun b!183722 () Bool)

(declare-fun e!127352 () Bool)

(declare-fun e!127349 () Bool)

(assert (=> b!183722 (= e!127352 e!127349)))

(declare-fun res!152780 () Bool)

(assert (=> b!183722 (=> res!152780 e!127349)))

(declare-fun lt!282716 () (_ BitVec 64))

(declare-fun lt!282718 () (_ BitVec 64))

(assert (=> b!183722 (= res!152780 (not (= lt!282718 (bvsub (bvsub (bvadd lt!282716 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!282698 () tuple2!15868)

(assert (=> b!183722 (= lt!282718 (bitIndex!0 (size!4304 (buf!4759 (_2!8579 lt!282698))) (currentByte!8993 (_2!8579 lt!282698)) (currentBit!8988 (_2!8579 lt!282698))))))

(declare-fun isPrefixOf!0 (BitStream!7716 BitStream!7716) Bool)

(assert (=> b!183722 (isPrefixOf!0 thiss!1204 (_2!8579 lt!282698))))

(declare-fun lt!282721 () Unit!13183)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7716 BitStream!7716 BitStream!7716) Unit!13183)

(assert (=> b!183722 (= lt!282721 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8579 lt!282719) (_2!8579 lt!282698)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7716 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15868)

(assert (=> b!183722 (= lt!282698 (appendBitsLSBFirstLoopTR!0 (_2!8579 lt!282719) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183723 () Bool)

(declare-fun res!152767 () Bool)

(assert (=> b!183723 (=> res!152767 e!127349)))

(assert (=> b!183723 (= res!152767 (not (isPrefixOf!0 (_2!8579 lt!282719) (_2!8579 lt!282698))))))

(declare-fun b!183724 () Bool)

(declare-fun e!127350 () Bool)

(assert (=> b!183724 (= e!127350 e!127343)))

(declare-fun res!152766 () Bool)

(assert (=> b!183724 (=> (not res!152766) (not e!127343))))

(declare-fun lt!282701 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183724 (= res!152766 (validate_offset_bits!1 ((_ sign_extend 32) (size!4304 (buf!4759 thiss!1204))) ((_ sign_extend 32) (currentByte!8993 thiss!1204)) ((_ sign_extend 32) (currentBit!8988 thiss!1204)) lt!282701))))

(assert (=> b!183724 (= lt!282701 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183725 () Bool)

(assert (=> b!183725 (= e!127353 true)))

(declare-datatypes ((tuple2!15870 0))(
  ( (tuple2!15871 (_1!8580 BitStream!7716) (_2!8580 (_ BitVec 64))) )
))
(declare-fun lt!282714 () tuple2!15870)

(declare-fun lt!282722 () (_ BitVec 64))

(declare-datatypes ((tuple2!15872 0))(
  ( (tuple2!15873 (_1!8581 BitStream!7716) (_2!8581 BitStream!7716)) )
))
(declare-fun lt!282709 () tuple2!15872)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15870)

(declare-fun withMovedBitIndex!0 (BitStream!7716 (_ BitVec 64)) BitStream!7716)

(assert (=> b!183725 (= lt!282714 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8581 lt!282709) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282722))))

(declare-fun b!183726 () Bool)

(declare-fun e!127348 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183726 (= e!127348 (invariant!0 (currentBit!8988 thiss!1204) (currentByte!8993 thiss!1204) (size!4304 (buf!4759 (_2!8579 lt!282698)))))))

(declare-fun b!183727 () Bool)

(declare-fun res!152770 () Bool)

(assert (=> b!183727 (=> (not res!152770) (not e!127343))))

(assert (=> b!183727 (= res!152770 (invariant!0 (currentBit!8988 thiss!1204) (currentByte!8993 thiss!1204) (size!4304 (buf!4759 thiss!1204))))))

(declare-fun b!183728 () Bool)

(declare-fun res!152781 () Bool)

(assert (=> b!183728 (=> res!152781 e!127349)))

(assert (=> b!183728 (= res!152781 (not (invariant!0 (currentBit!8988 (_2!8579 lt!282698)) (currentByte!8993 (_2!8579 lt!282698)) (size!4304 (buf!4759 (_2!8579 lt!282698))))))))

(declare-fun b!183729 () Bool)

(declare-fun res!152765 () Bool)

(assert (=> b!183729 (=> res!152765 e!127353)))

(declare-fun lt!282708 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183729 (= res!152765 (not (= (bvand lt!282708 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183730 () Bool)

(assert (=> b!183730 (= e!127349 e!127353)))

(declare-fun res!152771 () Bool)

(assert (=> b!183730 (=> res!152771 e!127353)))

(declare-fun lt!282697 () tuple2!15872)

(assert (=> b!183730 (= res!152771 (not (= (_1!8580 (readNBitsLSBFirstsLoopPure!0 (_1!8581 lt!282697) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282722)) (_2!8581 lt!282697))))))

(declare-fun lt!282710 () (_ BitVec 64))

(assert (=> b!183730 (validate_offset_bits!1 ((_ sign_extend 32) (size!4304 (buf!4759 (_2!8579 lt!282698)))) ((_ sign_extend 32) (currentByte!8993 (_2!8579 lt!282719))) ((_ sign_extend 32) (currentBit!8988 (_2!8579 lt!282719))) lt!282710)))

(declare-fun lt!282720 () Unit!13183)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7716 array!9760 (_ BitVec 64)) Unit!13183)

(assert (=> b!183730 (= lt!282720 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8579 lt!282719) (buf!4759 (_2!8579 lt!282698)) lt!282710))))

(assert (=> b!183730 (= lt!282710 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!15874 0))(
  ( (tuple2!15875 (_1!8582 BitStream!7716) (_2!8582 Bool)) )
))
(declare-fun lt!282705 () tuple2!15874)

(declare-fun lt!282711 () (_ BitVec 64))

(assert (=> b!183730 (= lt!282722 (bvor lt!282708 (ite (_2!8582 lt!282705) lt!282711 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!282699 () tuple2!15870)

(assert (=> b!183730 (= lt!282699 (readNBitsLSBFirstsLoopPure!0 (_1!8581 lt!282709) nBits!348 i!590 lt!282708))))

(assert (=> b!183730 (validate_offset_bits!1 ((_ sign_extend 32) (size!4304 (buf!4759 (_2!8579 lt!282698)))) ((_ sign_extend 32) (currentByte!8993 thiss!1204)) ((_ sign_extend 32) (currentBit!8988 thiss!1204)) lt!282701)))

(declare-fun lt!282715 () Unit!13183)

(assert (=> b!183730 (= lt!282715 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4759 (_2!8579 lt!282698)) lt!282701))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183730 (= lt!282708 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!282706 () Bool)

(assert (=> b!183730 (= (_2!8582 lt!282705) lt!282706)))

(declare-fun readBitPure!0 (BitStream!7716) tuple2!15874)

(assert (=> b!183730 (= lt!282705 (readBitPure!0 (_1!8581 lt!282709)))))

(declare-fun reader!0 (BitStream!7716 BitStream!7716) tuple2!15872)

(assert (=> b!183730 (= lt!282697 (reader!0 (_2!8579 lt!282719) (_2!8579 lt!282698)))))

(assert (=> b!183730 (= lt!282709 (reader!0 thiss!1204 (_2!8579 lt!282698)))))

(declare-fun e!127345 () Bool)

(assert (=> b!183730 e!127345))

(declare-fun res!152764 () Bool)

(assert (=> b!183730 (=> (not res!152764) (not e!127345))))

(declare-fun lt!282702 () tuple2!15874)

(declare-fun lt!282704 () tuple2!15874)

(assert (=> b!183730 (= res!152764 (= (bitIndex!0 (size!4304 (buf!4759 (_1!8582 lt!282702))) (currentByte!8993 (_1!8582 lt!282702)) (currentBit!8988 (_1!8582 lt!282702))) (bitIndex!0 (size!4304 (buf!4759 (_1!8582 lt!282704))) (currentByte!8993 (_1!8582 lt!282704)) (currentBit!8988 (_1!8582 lt!282704)))))))

(declare-fun lt!282717 () Unit!13183)

(declare-fun lt!282712 () BitStream!7716)

(declare-fun readBitPrefixLemma!0 (BitStream!7716 BitStream!7716) Unit!13183)

(assert (=> b!183730 (= lt!282717 (readBitPrefixLemma!0 lt!282712 (_2!8579 lt!282698)))))

(assert (=> b!183730 (= lt!282704 (readBitPure!0 (BitStream!7717 (buf!4759 (_2!8579 lt!282698)) (currentByte!8993 thiss!1204) (currentBit!8988 thiss!1204))))))

(assert (=> b!183730 (= lt!282702 (readBitPure!0 lt!282712))))

(assert (=> b!183730 e!127348))

(declare-fun res!152778 () Bool)

(assert (=> b!183730 (=> (not res!152778) (not e!127348))))

(assert (=> b!183730 (= res!152778 (invariant!0 (currentBit!8988 thiss!1204) (currentByte!8993 thiss!1204) (size!4304 (buf!4759 (_2!8579 lt!282719)))))))

(assert (=> b!183730 (= lt!282712 (BitStream!7717 (buf!4759 (_2!8579 lt!282719)) (currentByte!8993 thiss!1204) (currentBit!8988 thiss!1204)))))

(declare-fun res!152777 () Bool)

(assert (=> start!40192 (=> (not res!152777) (not e!127350))))

(assert (=> start!40192 (= res!152777 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40192 e!127350))

(assert (=> start!40192 true))

(declare-fun inv!12 (BitStream!7716) Bool)

(assert (=> start!40192 (and (inv!12 thiss!1204) e!127351)))

(declare-fun b!183717 () Bool)

(declare-fun e!127344 () Bool)

(assert (=> b!183717 (= e!127354 e!127344)))

(declare-fun res!152779 () Bool)

(assert (=> b!183717 (=> (not res!152779) (not e!127344))))

(declare-fun lt!282700 () tuple2!15874)

(assert (=> b!183717 (= res!152779 (and (= (_2!8582 lt!282700) lt!282706) (= (_1!8582 lt!282700) (_2!8579 lt!282719))))))

(declare-fun readerFrom!0 (BitStream!7716 (_ BitVec 32) (_ BitVec 32)) BitStream!7716)

(assert (=> b!183717 (= lt!282700 (readBitPure!0 (readerFrom!0 (_2!8579 lt!282719) (currentBit!8988 thiss!1204) (currentByte!8993 thiss!1204))))))

(declare-fun b!183731 () Bool)

(declare-fun res!152769 () Bool)

(assert (=> b!183731 (=> res!152769 e!127353)))

(assert (=> b!183731 (= res!152769 (not (= (bvand lt!282708 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282708)))))

(declare-fun b!183732 () Bool)

(assert (=> b!183732 (= e!127343 (not e!127352))))

(declare-fun res!152775 () Bool)

(assert (=> b!183732 (=> res!152775 e!127352)))

(declare-fun lt!282713 () (_ BitVec 64))

(assert (=> b!183732 (= res!152775 (not (= lt!282716 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282713))))))

(assert (=> b!183732 (= lt!282716 (bitIndex!0 (size!4304 (buf!4759 (_2!8579 lt!282719))) (currentByte!8993 (_2!8579 lt!282719)) (currentBit!8988 (_2!8579 lt!282719))))))

(assert (=> b!183732 (= lt!282713 (bitIndex!0 (size!4304 (buf!4759 thiss!1204)) (currentByte!8993 thiss!1204) (currentBit!8988 thiss!1204)))))

(assert (=> b!183732 e!127346))

(declare-fun res!152768 () Bool)

(assert (=> b!183732 (=> (not res!152768) (not e!127346))))

(assert (=> b!183732 (= res!152768 (= (size!4304 (buf!4759 thiss!1204)) (size!4304 (buf!4759 (_2!8579 lt!282719)))))))

(declare-fun appendBit!0 (BitStream!7716 Bool) tuple2!15868)

(assert (=> b!183732 (= lt!282719 (appendBit!0 thiss!1204 lt!282706))))

(assert (=> b!183732 (= lt!282706 (not (= (bvand v!189 lt!282711) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183732 (= lt!282711 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183733 () Bool)

(declare-fun res!152763 () Bool)

(assert (=> b!183733 (=> (not res!152763) (not e!127354))))

(assert (=> b!183733 (= res!152763 (isPrefixOf!0 thiss!1204 (_2!8579 lt!282719)))))

(declare-fun b!183734 () Bool)

(declare-fun res!152776 () Bool)

(assert (=> b!183734 (=> res!152776 e!127349)))

(assert (=> b!183734 (= res!152776 (not (isPrefixOf!0 thiss!1204 (_2!8579 lt!282719))))))

(declare-fun b!183735 () Bool)

(declare-fun res!152761 () Bool)

(assert (=> b!183735 (=> res!152761 e!127349)))

(assert (=> b!183735 (= res!152761 (or (not (= (size!4304 (buf!4759 (_2!8579 lt!282698))) (size!4304 (buf!4759 thiss!1204)))) (not (= lt!282718 (bvsub (bvadd lt!282713 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183736 () Bool)

(assert (=> b!183736 (= e!127344 (= (bitIndex!0 (size!4304 (buf!4759 (_1!8582 lt!282700))) (currentByte!8993 (_1!8582 lt!282700)) (currentBit!8988 (_1!8582 lt!282700))) lt!282703))))

(declare-fun b!183737 () Bool)

(declare-fun res!152772 () Bool)

(assert (=> b!183737 (=> res!152772 e!127353)))

(assert (=> b!183737 (= res!152772 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4304 (buf!4759 (_1!8581 lt!282709)))) ((_ sign_extend 32) (currentByte!8993 (_1!8581 lt!282709))) ((_ sign_extend 32) (currentBit!8988 (_1!8581 lt!282709))) lt!282701)))))

(declare-fun b!183738 () Bool)

(assert (=> b!183738 (= e!127345 (= (_2!8582 lt!282702) (_2!8582 lt!282704)))))

(assert (= (and start!40192 res!152777) b!183724))

(assert (= (and b!183724 res!152766) b!183727))

(assert (= (and b!183727 res!152770) b!183718))

(assert (= (and b!183718 res!152774) b!183732))

(assert (= (and b!183732 res!152768) b!183719))

(assert (= (and b!183719 res!152773) b!183733))

(assert (= (and b!183733 res!152763) b!183717))

(assert (= (and b!183717 res!152779) b!183736))

(assert (= (and b!183732 (not res!152775)) b!183722))

(assert (= (and b!183722 (not res!152780)) b!183728))

(assert (= (and b!183728 (not res!152781)) b!183735))

(assert (= (and b!183735 (not res!152761)) b!183723))

(assert (= (and b!183723 (not res!152767)) b!183734))

(assert (= (and b!183734 (not res!152776)) b!183730))

(assert (= (and b!183730 res!152778) b!183726))

(assert (= (and b!183730 res!152764) b!183738))

(assert (= (and b!183730 (not res!152771)) b!183721))

(assert (= (and b!183721 (not res!152762)) b!183737))

(assert (= (and b!183737 (not res!152772)) b!183729))

(assert (= (and b!183729 (not res!152765)) b!183731))

(assert (= (and b!183731 (not res!152769)) b!183725))

(assert (= start!40192 b!183720))

(declare-fun m!285677 () Bool)

(assert (=> b!183725 m!285677))

(assert (=> b!183725 m!285677))

(declare-fun m!285679 () Bool)

(assert (=> b!183725 m!285679))

(declare-fun m!285681 () Bool)

(assert (=> b!183729 m!285681))

(declare-fun m!285683 () Bool)

(assert (=> b!183732 m!285683))

(declare-fun m!285685 () Bool)

(assert (=> b!183732 m!285685))

(declare-fun m!285687 () Bool)

(assert (=> b!183732 m!285687))

(declare-fun m!285689 () Bool)

(assert (=> b!183736 m!285689))

(assert (=> b!183719 m!285683))

(assert (=> b!183719 m!285685))

(declare-fun m!285691 () Bool)

(assert (=> b!183727 m!285691))

(declare-fun m!285693 () Bool)

(assert (=> b!183733 m!285693))

(declare-fun m!285695 () Bool)

(assert (=> start!40192 m!285695))

(declare-fun m!285697 () Bool)

(assert (=> b!183717 m!285697))

(assert (=> b!183717 m!285697))

(declare-fun m!285699 () Bool)

(assert (=> b!183717 m!285699))

(declare-fun m!285701 () Bool)

(assert (=> b!183728 m!285701))

(declare-fun m!285703 () Bool)

(assert (=> b!183720 m!285703))

(declare-fun m!285705 () Bool)

(assert (=> b!183722 m!285705))

(declare-fun m!285707 () Bool)

(assert (=> b!183722 m!285707))

(declare-fun m!285709 () Bool)

(assert (=> b!183722 m!285709))

(declare-fun m!285711 () Bool)

(assert (=> b!183722 m!285711))

(assert (=> b!183734 m!285693))

(declare-fun m!285713 () Bool)

(assert (=> b!183724 m!285713))

(declare-fun m!285715 () Bool)

(assert (=> b!183737 m!285715))

(declare-fun m!285717 () Bool)

(assert (=> b!183723 m!285717))

(declare-fun m!285719 () Bool)

(assert (=> b!183730 m!285719))

(declare-fun m!285721 () Bool)

(assert (=> b!183730 m!285721))

(declare-fun m!285723 () Bool)

(assert (=> b!183730 m!285723))

(declare-fun m!285725 () Bool)

(assert (=> b!183730 m!285725))

(declare-fun m!285727 () Bool)

(assert (=> b!183730 m!285727))

(declare-fun m!285729 () Bool)

(assert (=> b!183730 m!285729))

(declare-fun m!285731 () Bool)

(assert (=> b!183730 m!285731))

(declare-fun m!285733 () Bool)

(assert (=> b!183730 m!285733))

(declare-fun m!285735 () Bool)

(assert (=> b!183730 m!285735))

(declare-fun m!285737 () Bool)

(assert (=> b!183730 m!285737))

(declare-fun m!285739 () Bool)

(assert (=> b!183730 m!285739))

(declare-fun m!285741 () Bool)

(assert (=> b!183730 m!285741))

(declare-fun m!285743 () Bool)

(assert (=> b!183730 m!285743))

(declare-fun m!285745 () Bool)

(assert (=> b!183730 m!285745))

(declare-fun m!285747 () Bool)

(assert (=> b!183730 m!285747))

(declare-fun m!285749 () Bool)

(assert (=> b!183730 m!285749))

(declare-fun m!285751 () Bool)

(assert (=> b!183726 m!285751))

(check-sat (not b!183722) (not b!183728) (not start!40192) (not b!183719) (not b!183723) (not b!183724) (not b!183734) (not b!183717) (not b!183720) (not b!183730) (not b!183732) (not b!183736) (not b!183729) (not b!183733) (not b!183727) (not b!183725) (not b!183737) (not b!183726))
