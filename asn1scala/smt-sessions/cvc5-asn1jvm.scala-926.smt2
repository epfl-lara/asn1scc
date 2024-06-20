; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26142 () Bool)

(assert start!26142)

(declare-fun b!133615 () Bool)

(declare-fun res!111009 () Bool)

(declare-fun e!88630 () Bool)

(assert (=> b!133615 (=> (not res!111009) (not e!88630))))

(declare-datatypes ((array!6127 0))(
  ( (array!6128 (arr!3423 (Array (_ BitVec 32) (_ BitVec 8))) (size!2773 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4810 0))(
  ( (BitStream!4811 (buf!3156 array!6127) (currentByte!5947 (_ BitVec 32)) (currentBit!5942 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4810)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!133615 (= res!111009 (invariant!0 (currentBit!5942 thiss!1634) (currentByte!5947 thiss!1634) (size!2773 (buf!3156 thiss!1634))))))

(declare-datatypes ((tuple2!11570 0))(
  ( (tuple2!11571 (_1!6096 BitStream!4810) (_2!6096 (_ BitVec 8))) )
))
(declare-fun lt!206769 () tuple2!11570)

(declare-fun arr!237 () array!6127)

(declare-fun e!88626 () Bool)

(declare-fun b!133617 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11572 0))(
  ( (tuple2!11573 (_1!6097 BitStream!4810) (_2!6097 BitStream!4810)) )
))
(declare-fun lt!206758 () tuple2!11572)

(assert (=> b!133617 (= e!88626 (and (= (_2!6096 lt!206769) (select (arr!3423 arr!237) from!447)) (= (_1!6096 lt!206769) (_2!6097 lt!206758))))))

(declare-fun readBytePure!0 (BitStream!4810) tuple2!11570)

(assert (=> b!133617 (= lt!206769 (readBytePure!0 (_1!6097 lt!206758)))))

(declare-datatypes ((Unit!8281 0))(
  ( (Unit!8282) )
))
(declare-datatypes ((tuple2!11574 0))(
  ( (tuple2!11575 (_1!6098 Unit!8281) (_2!6098 BitStream!4810)) )
))
(declare-fun lt!206778 () tuple2!11574)

(declare-fun reader!0 (BitStream!4810 BitStream!4810) tuple2!11572)

(assert (=> b!133617 (= lt!206758 (reader!0 thiss!1634 (_2!6098 lt!206778)))))

(declare-fun b!133618 () Bool)

(declare-fun e!88629 () Bool)

(declare-fun e!88622 () Bool)

(assert (=> b!133618 (= e!88629 e!88622)))

(declare-fun res!111010 () Bool)

(assert (=> b!133618 (=> (not res!111010) (not e!88622))))

(declare-fun lt!206772 () (_ BitVec 64))

(declare-fun lt!206760 () tuple2!11574)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!133618 (= res!111010 (= (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206760))) (currentByte!5947 (_2!6098 lt!206760)) (currentBit!5942 (_2!6098 lt!206760))) (bvadd (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206778))) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!206772))))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!133618 (= lt!206772 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!133619 () Bool)

(declare-fun res!111000 () Bool)

(assert (=> b!133619 (=> (not res!111000) (not e!88622))))

(declare-fun isPrefixOf!0 (BitStream!4810 BitStream!4810) Bool)

(assert (=> b!133619 (= res!111000 (isPrefixOf!0 (_2!6098 lt!206778) (_2!6098 lt!206760)))))

(declare-fun b!133620 () Bool)

(declare-fun res!111005 () Bool)

(assert (=> b!133620 (=> (not res!111005) (not e!88626))))

(assert (=> b!133620 (= res!111005 (= (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206778))) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)))))))

(declare-fun b!133621 () Bool)

(declare-fun e!88628 () Bool)

(declare-fun lt!206759 () tuple2!11570)

(declare-fun lt!206777 () tuple2!11570)

(assert (=> b!133621 (= e!88628 (= (_2!6096 lt!206759) (_2!6096 lt!206777)))))

(declare-fun b!133622 () Bool)

(declare-datatypes ((tuple2!11576 0))(
  ( (tuple2!11577 (_1!6099 BitStream!4810) (_2!6099 array!6127)) )
))
(declare-fun lt!206766 () tuple2!11576)

(declare-fun e!88624 () Bool)

(declare-fun arrayRangesEq!176 (array!6127 array!6127 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!133622 (= e!88624 (not (arrayRangesEq!176 arr!237 (_2!6099 lt!206766) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!133623 () Bool)

(declare-fun res!111001 () Bool)

(assert (=> b!133623 (=> (not res!111001) (not e!88630))))

(assert (=> b!133623 (= res!111001 (bvslt from!447 to!404))))

(declare-fun b!133624 () Bool)

(declare-fun e!88623 () Bool)

(declare-fun array_inv!2562 (array!6127) Bool)

(assert (=> b!133624 (= e!88623 (array_inv!2562 (buf!3156 thiss!1634)))))

(declare-fun b!133625 () Bool)

(declare-fun res!111002 () Bool)

(assert (=> b!133625 (=> (not res!111002) (not e!88630))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!133625 (= res!111002 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 thiss!1634))) ((_ sign_extend 32) (currentByte!5947 thiss!1634)) ((_ sign_extend 32) (currentBit!5942 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!133626 () Bool)

(assert (=> b!133626 (= e!88622 (not e!88624))))

(declare-fun res!111008 () Bool)

(assert (=> b!133626 (=> res!111008 e!88624)))

(declare-fun lt!206773 () tuple2!11572)

(assert (=> b!133626 (= res!111008 (or (not (= (size!2773 (_2!6099 lt!206766)) (size!2773 arr!237))) (not (= (_1!6099 lt!206766) (_2!6097 lt!206773)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4810 array!6127 (_ BitVec 32) (_ BitVec 32)) tuple2!11576)

(assert (=> b!133626 (= lt!206766 (readByteArrayLoopPure!0 (_1!6097 lt!206773) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!133626 (validate_offset_bits!1 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) lt!206772)))

(declare-fun lt!206762 () Unit!8281)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4810 array!6127 (_ BitVec 64)) Unit!8281)

(assert (=> b!133626 (= lt!206762 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6098 lt!206778) (buf!3156 (_2!6098 lt!206760)) lt!206772))))

(assert (=> b!133626 (= lt!206773 (reader!0 (_2!6098 lt!206778) (_2!6098 lt!206760)))))

(declare-fun lt!206771 () tuple2!11576)

(declare-fun b!133616 () Bool)

(declare-fun lt!206774 () tuple2!11576)

(assert (=> b!133616 (= e!88630 (not (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt (size!2773 (_2!6099 lt!206771)) (size!2773 (_2!6099 lt!206774))) (bvsle to!404 (size!2773 (_2!6099 lt!206771))))))))

(declare-fun lt!206768 () tuple2!11576)

(assert (=> b!133616 (arrayRangesEq!176 (_2!6099 lt!206771) (_2!6099 lt!206768) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!206780 () tuple2!11572)

(declare-fun lt!206763 () Unit!8281)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4810 array!6127 (_ BitVec 32) (_ BitVec 32)) Unit!8281)

(assert (=> b!133616 (= lt!206763 (readByteArrayLoopArrayPrefixLemma!0 (_1!6097 lt!206780) arr!237 from!447 to!404))))

(declare-fun lt!206781 () array!6127)

(declare-fun withMovedByteIndex!0 (BitStream!4810 (_ BitVec 32)) BitStream!4810)

(assert (=> b!133616 (= lt!206768 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6097 lt!206780) #b00000000000000000000000000000001) lt!206781 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206767 () tuple2!11572)

(assert (=> b!133616 (= lt!206774 (readByteArrayLoopPure!0 (_1!6097 lt!206767) lt!206781 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206775 () tuple2!11570)

(assert (=> b!133616 (= lt!206781 (array!6128 (store (arr!3423 arr!237) from!447 (_2!6096 lt!206775)) (size!2773 arr!237)))))

(declare-fun lt!206770 () (_ BitVec 32))

(assert (=> b!133616 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) lt!206770)))

(declare-fun lt!206757 () Unit!8281)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4810 array!6127 (_ BitVec 32)) Unit!8281)

(assert (=> b!133616 (= lt!206757 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6098 lt!206778) (buf!3156 (_2!6098 lt!206760)) lt!206770))))

(assert (=> b!133616 (= (_1!6099 lt!206771) (_2!6097 lt!206780))))

(assert (=> b!133616 (= lt!206771 (readByteArrayLoopPure!0 (_1!6097 lt!206780) arr!237 from!447 to!404))))

(assert (=> b!133616 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 thiss!1634)) ((_ sign_extend 32) (currentBit!5942 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!206779 () Unit!8281)

(assert (=> b!133616 (= lt!206779 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3156 (_2!6098 lt!206760)) (bvsub to!404 from!447)))))

(assert (=> b!133616 (= (_2!6096 lt!206775) (select (arr!3423 arr!237) from!447))))

(assert (=> b!133616 (= lt!206775 (readBytePure!0 (_1!6097 lt!206780)))))

(assert (=> b!133616 (= lt!206767 (reader!0 (_2!6098 lt!206778) (_2!6098 lt!206760)))))

(assert (=> b!133616 (= lt!206780 (reader!0 thiss!1634 (_2!6098 lt!206760)))))

(assert (=> b!133616 e!88628))

(declare-fun res!111004 () Bool)

(assert (=> b!133616 (=> (not res!111004) (not e!88628))))

(assert (=> b!133616 (= res!111004 (= (bitIndex!0 (size!2773 (buf!3156 (_1!6096 lt!206759))) (currentByte!5947 (_1!6096 lt!206759)) (currentBit!5942 (_1!6096 lt!206759))) (bitIndex!0 (size!2773 (buf!3156 (_1!6096 lt!206777))) (currentByte!5947 (_1!6096 lt!206777)) (currentBit!5942 (_1!6096 lt!206777)))))))

(declare-fun lt!206765 () Unit!8281)

(declare-fun lt!206761 () BitStream!4810)

(declare-fun readBytePrefixLemma!0 (BitStream!4810 BitStream!4810) Unit!8281)

(assert (=> b!133616 (= lt!206765 (readBytePrefixLemma!0 lt!206761 (_2!6098 lt!206760)))))

(assert (=> b!133616 (= lt!206777 (readBytePure!0 (BitStream!4811 (buf!3156 (_2!6098 lt!206760)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634))))))

(assert (=> b!133616 (= lt!206759 (readBytePure!0 lt!206761))))

(assert (=> b!133616 (= lt!206761 (BitStream!4811 (buf!3156 (_2!6098 lt!206778)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)))))

(declare-fun e!88621 () Bool)

(assert (=> b!133616 e!88621))

(declare-fun res!111011 () Bool)

(assert (=> b!133616 (=> (not res!111011) (not e!88621))))

(assert (=> b!133616 (= res!111011 (isPrefixOf!0 thiss!1634 (_2!6098 lt!206760)))))

(declare-fun lt!206764 () Unit!8281)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4810 BitStream!4810 BitStream!4810) Unit!8281)

(assert (=> b!133616 (= lt!206764 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6098 lt!206778) (_2!6098 lt!206760)))))

(assert (=> b!133616 e!88629))

(declare-fun res!110999 () Bool)

(assert (=> b!133616 (=> (not res!110999) (not e!88629))))

(assert (=> b!133616 (= res!110999 (= (size!2773 (buf!3156 (_2!6098 lt!206778))) (size!2773 (buf!3156 (_2!6098 lt!206760)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4810 array!6127 (_ BitVec 32) (_ BitVec 32)) tuple2!11574)

(assert (=> b!133616 (= lt!206760 (appendByteArrayLoop!0 (_2!6098 lt!206778) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!133616 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206778)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) lt!206770)))

(assert (=> b!133616 (= lt!206770 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!206776 () Unit!8281)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4810 BitStream!4810 (_ BitVec 64) (_ BitVec 32)) Unit!8281)

(assert (=> b!133616 (= lt!206776 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6098 lt!206778) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!133616 e!88626))

(declare-fun res!111006 () Bool)

(assert (=> b!133616 (=> (not res!111006) (not e!88626))))

(assert (=> b!133616 (= res!111006 (= (size!2773 (buf!3156 thiss!1634)) (size!2773 (buf!3156 (_2!6098 lt!206778)))))))

(declare-fun appendByte!0 (BitStream!4810 (_ BitVec 8)) tuple2!11574)

(assert (=> b!133616 (= lt!206778 (appendByte!0 thiss!1634 (select (arr!3423 arr!237) from!447)))))

(declare-fun res!111007 () Bool)

(assert (=> start!26142 (=> (not res!111007) (not e!88630))))

(assert (=> start!26142 (= res!111007 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2773 arr!237))))))

(assert (=> start!26142 e!88630))

(assert (=> start!26142 true))

(assert (=> start!26142 (array_inv!2562 arr!237)))

(declare-fun inv!12 (BitStream!4810) Bool)

(assert (=> start!26142 (and (inv!12 thiss!1634) e!88623)))

(declare-fun b!133627 () Bool)

(assert (=> b!133627 (= e!88621 (invariant!0 (currentBit!5942 thiss!1634) (currentByte!5947 thiss!1634) (size!2773 (buf!3156 (_2!6098 lt!206778)))))))

(declare-fun b!133628 () Bool)

(declare-fun res!111003 () Bool)

(assert (=> b!133628 (=> (not res!111003) (not e!88626))))

(assert (=> b!133628 (= res!111003 (isPrefixOf!0 thiss!1634 (_2!6098 lt!206778)))))

(assert (= (and start!26142 res!111007) b!133625))

(assert (= (and b!133625 res!111002) b!133623))

(assert (= (and b!133623 res!111001) b!133615))

(assert (= (and b!133615 res!111009) b!133616))

(assert (= (and b!133616 res!111006) b!133620))

(assert (= (and b!133620 res!111005) b!133628))

(assert (= (and b!133628 res!111003) b!133617))

(assert (= (and b!133616 res!110999) b!133618))

(assert (= (and b!133618 res!111010) b!133619))

(assert (= (and b!133619 res!111000) b!133626))

(assert (= (and b!133626 (not res!111008)) b!133622))

(assert (= (and b!133616 res!111011) b!133627))

(assert (= (and b!133616 res!111004) b!133621))

(assert (= start!26142 b!133624))

(declare-fun m!202669 () Bool)

(assert (=> b!133615 m!202669))

(declare-fun m!202671 () Bool)

(assert (=> b!133618 m!202671))

(declare-fun m!202673 () Bool)

(assert (=> b!133618 m!202673))

(declare-fun m!202675 () Bool)

(assert (=> b!133625 m!202675))

(declare-fun m!202677 () Bool)

(assert (=> b!133626 m!202677))

(declare-fun m!202679 () Bool)

(assert (=> b!133626 m!202679))

(declare-fun m!202681 () Bool)

(assert (=> b!133626 m!202681))

(declare-fun m!202683 () Bool)

(assert (=> b!133626 m!202683))

(declare-fun m!202685 () Bool)

(assert (=> start!26142 m!202685))

(declare-fun m!202687 () Bool)

(assert (=> start!26142 m!202687))

(declare-fun m!202689 () Bool)

(assert (=> b!133622 m!202689))

(declare-fun m!202691 () Bool)

(assert (=> b!133616 m!202691))

(declare-fun m!202693 () Bool)

(assert (=> b!133616 m!202693))

(declare-fun m!202695 () Bool)

(assert (=> b!133616 m!202695))

(declare-fun m!202697 () Bool)

(assert (=> b!133616 m!202697))

(declare-fun m!202699 () Bool)

(assert (=> b!133616 m!202699))

(declare-fun m!202701 () Bool)

(assert (=> b!133616 m!202701))

(declare-fun m!202703 () Bool)

(assert (=> b!133616 m!202703))

(declare-fun m!202705 () Bool)

(assert (=> b!133616 m!202705))

(declare-fun m!202707 () Bool)

(assert (=> b!133616 m!202707))

(declare-fun m!202709 () Bool)

(assert (=> b!133616 m!202709))

(declare-fun m!202711 () Bool)

(assert (=> b!133616 m!202711))

(declare-fun m!202713 () Bool)

(assert (=> b!133616 m!202713))

(declare-fun m!202715 () Bool)

(assert (=> b!133616 m!202715))

(declare-fun m!202717 () Bool)

(assert (=> b!133616 m!202717))

(declare-fun m!202719 () Bool)

(assert (=> b!133616 m!202719))

(assert (=> b!133616 m!202693))

(declare-fun m!202721 () Bool)

(assert (=> b!133616 m!202721))

(declare-fun m!202723 () Bool)

(assert (=> b!133616 m!202723))

(declare-fun m!202725 () Bool)

(assert (=> b!133616 m!202725))

(declare-fun m!202727 () Bool)

(assert (=> b!133616 m!202727))

(declare-fun m!202729 () Bool)

(assert (=> b!133616 m!202729))

(declare-fun m!202731 () Bool)

(assert (=> b!133616 m!202731))

(declare-fun m!202733 () Bool)

(assert (=> b!133616 m!202733))

(declare-fun m!202735 () Bool)

(assert (=> b!133616 m!202735))

(assert (=> b!133616 m!202683))

(assert (=> b!133616 m!202701))

(declare-fun m!202737 () Bool)

(assert (=> b!133616 m!202737))

(declare-fun m!202739 () Bool)

(assert (=> b!133616 m!202739))

(assert (=> b!133620 m!202673))

(declare-fun m!202741 () Bool)

(assert (=> b!133620 m!202741))

(declare-fun m!202743 () Bool)

(assert (=> b!133619 m!202743))

(declare-fun m!202745 () Bool)

(assert (=> b!133628 m!202745))

(declare-fun m!202747 () Bool)

(assert (=> b!133627 m!202747))

(assert (=> b!133617 m!202701))

(declare-fun m!202749 () Bool)

(assert (=> b!133617 m!202749))

(declare-fun m!202751 () Bool)

(assert (=> b!133617 m!202751))

(declare-fun m!202753 () Bool)

(assert (=> b!133624 m!202753))

(push 1)

(assert (not b!133617))

(assert (not b!133619))

(assert (not b!133625))

(assert (not b!133618))

(assert (not b!133616))

(assert (not b!133626))

(assert (not b!133624))

(assert (not b!133628))

(assert (not b!133627))

(assert (not b!133615))

(assert (not start!26142))

(assert (not b!133622))

(assert (not b!133620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!42786 () Bool)

(declare-fun res!111098 () Bool)

(declare-fun e!88695 () Bool)

(assert (=> d!42786 (=> (not res!111098) (not e!88695))))

(assert (=> d!42786 (= res!111098 (= (size!2773 (buf!3156 thiss!1634)) (size!2773 (buf!3156 (_2!6098 lt!206778)))))))

(assert (=> d!42786 (= (isPrefixOf!0 thiss!1634 (_2!6098 lt!206778)) e!88695)))

(declare-fun b!133719 () Bool)

(declare-fun res!111097 () Bool)

(assert (=> b!133719 (=> (not res!111097) (not e!88695))))

(assert (=> b!133719 (= res!111097 (bvsle (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)) (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206778))) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778)))))))

(declare-fun b!133720 () Bool)

(declare-fun e!88696 () Bool)

(assert (=> b!133720 (= e!88695 e!88696)))

(declare-fun res!111096 () Bool)

(assert (=> b!133720 (=> res!111096 e!88696)))

(assert (=> b!133720 (= res!111096 (= (size!2773 (buf!3156 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133721 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6127 array!6127 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!133721 (= e!88696 (arrayBitRangesEq!0 (buf!3156 thiss!1634) (buf!3156 (_2!6098 lt!206778)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634))))))

(assert (= (and d!42786 res!111098) b!133719))

(assert (= (and b!133719 res!111097) b!133720))

(assert (= (and b!133720 (not res!111096)) b!133721))

(assert (=> b!133719 m!202741))

(assert (=> b!133719 m!202673))

(assert (=> b!133721 m!202741))

(assert (=> b!133721 m!202741))

(declare-fun m!202927 () Bool)

(assert (=> b!133721 m!202927))

(assert (=> b!133628 d!42786))

(declare-fun d!42788 () Bool)

(declare-datatypes ((tuple2!11594 0))(
  ( (tuple2!11595 (_1!6108 (_ BitVec 8)) (_2!6108 BitStream!4810)) )
))
(declare-fun lt!206934 () tuple2!11594)

(declare-fun readByte!0 (BitStream!4810) tuple2!11594)

(assert (=> d!42788 (= lt!206934 (readByte!0 (_1!6097 lt!206758)))))

(assert (=> d!42788 (= (readBytePure!0 (_1!6097 lt!206758)) (tuple2!11571 (_2!6108 lt!206934) (_1!6108 lt!206934)))))

(declare-fun bs!10438 () Bool)

(assert (= bs!10438 d!42788))

(declare-fun m!202929 () Bool)

(assert (=> bs!10438 m!202929))

(assert (=> b!133617 d!42788))

(declare-fun d!42790 () Bool)

(declare-fun e!88702 () Bool)

(assert (=> d!42790 e!88702))

(declare-fun res!111107 () Bool)

(assert (=> d!42790 (=> (not res!111107) (not e!88702))))

(declare-fun lt!206986 () tuple2!11572)

(assert (=> d!42790 (= res!111107 (isPrefixOf!0 (_1!6097 lt!206986) (_2!6097 lt!206986)))))

(declare-fun lt!206991 () BitStream!4810)

(assert (=> d!42790 (= lt!206986 (tuple2!11573 lt!206991 (_2!6098 lt!206778)))))

(declare-fun lt!206980 () Unit!8281)

(declare-fun lt!206979 () Unit!8281)

(assert (=> d!42790 (= lt!206980 lt!206979)))

(assert (=> d!42790 (isPrefixOf!0 lt!206991 (_2!6098 lt!206778))))

(assert (=> d!42790 (= lt!206979 (lemmaIsPrefixTransitive!0 lt!206991 (_2!6098 lt!206778) (_2!6098 lt!206778)))))

(declare-fun lt!206985 () Unit!8281)

(declare-fun lt!206982 () Unit!8281)

(assert (=> d!42790 (= lt!206985 lt!206982)))

(assert (=> d!42790 (isPrefixOf!0 lt!206991 (_2!6098 lt!206778))))

(assert (=> d!42790 (= lt!206982 (lemmaIsPrefixTransitive!0 lt!206991 thiss!1634 (_2!6098 lt!206778)))))

(declare-fun lt!206990 () Unit!8281)

(declare-fun e!88701 () Unit!8281)

(assert (=> d!42790 (= lt!206990 e!88701)))

(declare-fun c!7634 () Bool)

(assert (=> d!42790 (= c!7634 (not (= (size!2773 (buf!3156 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!206975 () Unit!8281)

(declare-fun lt!206984 () Unit!8281)

(assert (=> d!42790 (= lt!206975 lt!206984)))

(assert (=> d!42790 (isPrefixOf!0 (_2!6098 lt!206778) (_2!6098 lt!206778))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4810) Unit!8281)

(assert (=> d!42790 (= lt!206984 (lemmaIsPrefixRefl!0 (_2!6098 lt!206778)))))

(declare-fun lt!206977 () Unit!8281)

(declare-fun lt!206978 () Unit!8281)

(assert (=> d!42790 (= lt!206977 lt!206978)))

(assert (=> d!42790 (= lt!206978 (lemmaIsPrefixRefl!0 (_2!6098 lt!206778)))))

(declare-fun lt!206993 () Unit!8281)

(declare-fun lt!206994 () Unit!8281)

(assert (=> d!42790 (= lt!206993 lt!206994)))

(assert (=> d!42790 (isPrefixOf!0 lt!206991 lt!206991)))

(assert (=> d!42790 (= lt!206994 (lemmaIsPrefixRefl!0 lt!206991))))

(declare-fun lt!206988 () Unit!8281)

(declare-fun lt!206992 () Unit!8281)

(assert (=> d!42790 (= lt!206988 lt!206992)))

(assert (=> d!42790 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42790 (= lt!206992 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42790 (= lt!206991 (BitStream!4811 (buf!3156 (_2!6098 lt!206778)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)))))

(assert (=> d!42790 (isPrefixOf!0 thiss!1634 (_2!6098 lt!206778))))

(assert (=> d!42790 (= (reader!0 thiss!1634 (_2!6098 lt!206778)) lt!206986)))

(declare-fun lt!206976 () (_ BitVec 64))

(declare-fun b!133732 () Bool)

(declare-fun lt!206983 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4810 (_ BitVec 64)) BitStream!4810)

(assert (=> b!133732 (= e!88702 (= (_1!6097 lt!206986) (withMovedBitIndex!0 (_2!6097 lt!206986) (bvsub lt!206976 lt!206983))))))

(assert (=> b!133732 (or (= (bvand lt!206976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206983 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!206976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!206976 lt!206983) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133732 (= lt!206983 (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206778))) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778))))))

(assert (=> b!133732 (= lt!206976 (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)))))

(declare-fun b!133733 () Bool)

(declare-fun res!111105 () Bool)

(assert (=> b!133733 (=> (not res!111105) (not e!88702))))

(assert (=> b!133733 (= res!111105 (isPrefixOf!0 (_2!6097 lt!206986) (_2!6098 lt!206778)))))

(declare-fun b!133734 () Bool)

(declare-fun res!111106 () Bool)

(assert (=> b!133734 (=> (not res!111106) (not e!88702))))

(assert (=> b!133734 (= res!111106 (isPrefixOf!0 (_1!6097 lt!206986) thiss!1634))))

(declare-fun b!133735 () Bool)

(declare-fun lt!206981 () Unit!8281)

(assert (=> b!133735 (= e!88701 lt!206981)))

(declare-fun lt!206989 () (_ BitVec 64))

(assert (=> b!133735 (= lt!206989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!206987 () (_ BitVec 64))

(assert (=> b!133735 (= lt!206987 (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6127 array!6127 (_ BitVec 64) (_ BitVec 64)) Unit!8281)

(assert (=> b!133735 (= lt!206981 (arrayBitRangesEqSymmetric!0 (buf!3156 thiss!1634) (buf!3156 (_2!6098 lt!206778)) lt!206989 lt!206987))))

(assert (=> b!133735 (arrayBitRangesEq!0 (buf!3156 (_2!6098 lt!206778)) (buf!3156 thiss!1634) lt!206989 lt!206987)))

(declare-fun b!133736 () Bool)

(declare-fun Unit!8287 () Unit!8281)

(assert (=> b!133736 (= e!88701 Unit!8287)))

(assert (= (and d!42790 c!7634) b!133735))

(assert (= (and d!42790 (not c!7634)) b!133736))

(assert (= (and d!42790 res!111107) b!133734))

(assert (= (and b!133734 res!111106) b!133733))

(assert (= (and b!133733 res!111105) b!133732))

(assert (=> b!133735 m!202741))

(declare-fun m!202931 () Bool)

(assert (=> b!133735 m!202931))

(declare-fun m!202933 () Bool)

(assert (=> b!133735 m!202933))

(declare-fun m!202935 () Bool)

(assert (=> b!133732 m!202935))

(assert (=> b!133732 m!202673))

(assert (=> b!133732 m!202741))

(declare-fun m!202937 () Bool)

(assert (=> d!42790 m!202937))

(declare-fun m!202939 () Bool)

(assert (=> d!42790 m!202939))

(declare-fun m!202941 () Bool)

(assert (=> d!42790 m!202941))

(assert (=> d!42790 m!202745))

(declare-fun m!202943 () Bool)

(assert (=> d!42790 m!202943))

(declare-fun m!202945 () Bool)

(assert (=> d!42790 m!202945))

(declare-fun m!202947 () Bool)

(assert (=> d!42790 m!202947))

(declare-fun m!202949 () Bool)

(assert (=> d!42790 m!202949))

(declare-fun m!202951 () Bool)

(assert (=> d!42790 m!202951))

(declare-fun m!202953 () Bool)

(assert (=> d!42790 m!202953))

(declare-fun m!202955 () Bool)

(assert (=> d!42790 m!202955))

(declare-fun m!202957 () Bool)

(assert (=> b!133734 m!202957))

(declare-fun m!202959 () Bool)

(assert (=> b!133733 m!202959))

(assert (=> b!133617 d!42790))

(declare-fun d!42792 () Bool)

(assert (=> d!42792 (= (invariant!0 (currentBit!5942 thiss!1634) (currentByte!5947 thiss!1634) (size!2773 (buf!3156 (_2!6098 lt!206778)))) (and (bvsge (currentBit!5942 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5942 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5947 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5947 thiss!1634) (size!2773 (buf!3156 (_2!6098 lt!206778)))) (and (= (currentBit!5942 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5947 thiss!1634) (size!2773 (buf!3156 (_2!6098 lt!206778))))))))))

(assert (=> b!133627 d!42792))

(declare-fun d!42794 () Bool)

(declare-fun res!111112 () Bool)

(declare-fun e!88707 () Bool)

(assert (=> d!42794 (=> res!111112 e!88707)))

(assert (=> d!42794 (= res!111112 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42794 (= (arrayRangesEq!176 (_2!6099 lt!206771) (_2!6099 lt!206768) #b00000000000000000000000000000000 to!404) e!88707)))

(declare-fun b!133741 () Bool)

(declare-fun e!88708 () Bool)

(assert (=> b!133741 (= e!88707 e!88708)))

(declare-fun res!111113 () Bool)

(assert (=> b!133741 (=> (not res!111113) (not e!88708))))

(assert (=> b!133741 (= res!111113 (= (select (arr!3423 (_2!6099 lt!206771)) #b00000000000000000000000000000000) (select (arr!3423 (_2!6099 lt!206768)) #b00000000000000000000000000000000)))))

(declare-fun b!133742 () Bool)

(assert (=> b!133742 (= e!88708 (arrayRangesEq!176 (_2!6099 lt!206771) (_2!6099 lt!206768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42794 (not res!111112)) b!133741))

(assert (= (and b!133741 res!111113) b!133742))

(declare-fun m!202961 () Bool)

(assert (=> b!133741 m!202961))

(declare-fun m!202963 () Bool)

(assert (=> b!133741 m!202963))

(declare-fun m!202965 () Bool)

(assert (=> b!133742 m!202965))

(assert (=> b!133616 d!42794))

(declare-fun d!42796 () Bool)

(declare-fun e!88711 () Bool)

(assert (=> d!42796 e!88711))

(declare-fun res!111116 () Bool)

(assert (=> d!42796 (=> (not res!111116) (not e!88711))))

(assert (=> d!42796 (= res!111116 (and (or (let ((rhs!3114 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3114 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3114) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!42797 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!42797 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!42797 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3113 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3113 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3113) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!207001 () Unit!8281)

(declare-fun choose!57 (BitStream!4810 BitStream!4810 (_ BitVec 64) (_ BitVec 32)) Unit!8281)

(assert (=> d!42796 (= lt!207001 (choose!57 thiss!1634 (_2!6098 lt!206778) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!42796 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6098 lt!206778) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!207001)))

(declare-fun lt!207003 () (_ BitVec 32))

(declare-fun b!133745 () Bool)

(assert (=> b!133745 (= e!88711 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206778)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) (bvsub (bvsub to!404 from!447) lt!207003)))))

(assert (=> b!133745 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!207003 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!207003) #b10000000000000000000000000000000)))))

(declare-fun lt!207002 () (_ BitVec 64))

(assert (=> b!133745 (= lt!207003 ((_ extract 31 0) lt!207002))))

(assert (=> b!133745 (and (bvslt lt!207002 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!207002 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!133745 (= lt!207002 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!42796 res!111116) b!133745))

(declare-fun m!202967 () Bool)

(assert (=> d!42796 m!202967))

(declare-fun m!202969 () Bool)

(assert (=> b!133745 m!202969))

(assert (=> b!133616 d!42796))

(declare-fun d!42799 () Bool)

(declare-fun lt!207004 () tuple2!11594)

(assert (=> d!42799 (= lt!207004 (readByte!0 (BitStream!4811 (buf!3156 (_2!6098 lt!206760)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634))))))

(assert (=> d!42799 (= (readBytePure!0 (BitStream!4811 (buf!3156 (_2!6098 lt!206760)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634))) (tuple2!11571 (_2!6108 lt!207004) (_1!6108 lt!207004)))))

(declare-fun bs!10439 () Bool)

(assert (= bs!10439 d!42799))

(declare-fun m!202971 () Bool)

(assert (=> bs!10439 m!202971))

(assert (=> b!133616 d!42799))

(declare-fun d!42801 () Bool)

(declare-fun res!111119 () Bool)

(declare-fun e!88712 () Bool)

(assert (=> d!42801 (=> (not res!111119) (not e!88712))))

(assert (=> d!42801 (= res!111119 (= (size!2773 (buf!3156 thiss!1634)) (size!2773 (buf!3156 (_2!6098 lt!206760)))))))

(assert (=> d!42801 (= (isPrefixOf!0 thiss!1634 (_2!6098 lt!206760)) e!88712)))

(declare-fun b!133746 () Bool)

(declare-fun res!111118 () Bool)

(assert (=> b!133746 (=> (not res!111118) (not e!88712))))

(assert (=> b!133746 (= res!111118 (bvsle (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)) (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206760))) (currentByte!5947 (_2!6098 lt!206760)) (currentBit!5942 (_2!6098 lt!206760)))))))

(declare-fun b!133747 () Bool)

(declare-fun e!88713 () Bool)

(assert (=> b!133747 (= e!88712 e!88713)))

(declare-fun res!111117 () Bool)

(assert (=> b!133747 (=> res!111117 e!88713)))

(assert (=> b!133747 (= res!111117 (= (size!2773 (buf!3156 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133748 () Bool)

(assert (=> b!133748 (= e!88713 (arrayBitRangesEq!0 (buf!3156 thiss!1634) (buf!3156 (_2!6098 lt!206760)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634))))))

(assert (= (and d!42801 res!111119) b!133746))

(assert (= (and b!133746 res!111118) b!133747))

(assert (= (and b!133747 (not res!111117)) b!133748))

(assert (=> b!133746 m!202741))

(assert (=> b!133746 m!202671))

(assert (=> b!133748 m!202741))

(assert (=> b!133748 m!202741))

(declare-fun m!202973 () Bool)

(assert (=> b!133748 m!202973))

(assert (=> b!133616 d!42801))

(declare-fun d!42803 () Bool)

(declare-fun e!88715 () Bool)

(assert (=> d!42803 e!88715))

(declare-fun res!111122 () Bool)

(assert (=> d!42803 (=> (not res!111122) (not e!88715))))

(declare-fun lt!207016 () tuple2!11572)

(assert (=> d!42803 (= res!111122 (isPrefixOf!0 (_1!6097 lt!207016) (_2!6097 lt!207016)))))

(declare-fun lt!207021 () BitStream!4810)

(assert (=> d!42803 (= lt!207016 (tuple2!11573 lt!207021 (_2!6098 lt!206760)))))

(declare-fun lt!207010 () Unit!8281)

(declare-fun lt!207009 () Unit!8281)

(assert (=> d!42803 (= lt!207010 lt!207009)))

(assert (=> d!42803 (isPrefixOf!0 lt!207021 (_2!6098 lt!206760))))

(assert (=> d!42803 (= lt!207009 (lemmaIsPrefixTransitive!0 lt!207021 (_2!6098 lt!206760) (_2!6098 lt!206760)))))

(declare-fun lt!207015 () Unit!8281)

(declare-fun lt!207012 () Unit!8281)

(assert (=> d!42803 (= lt!207015 lt!207012)))

(assert (=> d!42803 (isPrefixOf!0 lt!207021 (_2!6098 lt!206760))))

(assert (=> d!42803 (= lt!207012 (lemmaIsPrefixTransitive!0 lt!207021 thiss!1634 (_2!6098 lt!206760)))))

(declare-fun lt!207020 () Unit!8281)

(declare-fun e!88714 () Unit!8281)

(assert (=> d!42803 (= lt!207020 e!88714)))

(declare-fun c!7635 () Bool)

(assert (=> d!42803 (= c!7635 (not (= (size!2773 (buf!3156 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!207005 () Unit!8281)

(declare-fun lt!207014 () Unit!8281)

(assert (=> d!42803 (= lt!207005 lt!207014)))

(assert (=> d!42803 (isPrefixOf!0 (_2!6098 lt!206760) (_2!6098 lt!206760))))

(assert (=> d!42803 (= lt!207014 (lemmaIsPrefixRefl!0 (_2!6098 lt!206760)))))

(declare-fun lt!207007 () Unit!8281)

(declare-fun lt!207008 () Unit!8281)

(assert (=> d!42803 (= lt!207007 lt!207008)))

(assert (=> d!42803 (= lt!207008 (lemmaIsPrefixRefl!0 (_2!6098 lt!206760)))))

(declare-fun lt!207023 () Unit!8281)

(declare-fun lt!207024 () Unit!8281)

(assert (=> d!42803 (= lt!207023 lt!207024)))

(assert (=> d!42803 (isPrefixOf!0 lt!207021 lt!207021)))

(assert (=> d!42803 (= lt!207024 (lemmaIsPrefixRefl!0 lt!207021))))

(declare-fun lt!207018 () Unit!8281)

(declare-fun lt!207022 () Unit!8281)

(assert (=> d!42803 (= lt!207018 lt!207022)))

(assert (=> d!42803 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42803 (= lt!207022 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42803 (= lt!207021 (BitStream!4811 (buf!3156 (_2!6098 lt!206760)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)))))

(assert (=> d!42803 (isPrefixOf!0 thiss!1634 (_2!6098 lt!206760))))

(assert (=> d!42803 (= (reader!0 thiss!1634 (_2!6098 lt!206760)) lt!207016)))

(declare-fun lt!207013 () (_ BitVec 64))

(declare-fun lt!207006 () (_ BitVec 64))

(declare-fun b!133749 () Bool)

(assert (=> b!133749 (= e!88715 (= (_1!6097 lt!207016) (withMovedBitIndex!0 (_2!6097 lt!207016) (bvsub lt!207006 lt!207013))))))

(assert (=> b!133749 (or (= (bvand lt!207006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207006 lt!207013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133749 (= lt!207013 (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206760))) (currentByte!5947 (_2!6098 lt!206760)) (currentBit!5942 (_2!6098 lt!206760))))))

(assert (=> b!133749 (= lt!207006 (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)))))

(declare-fun b!133750 () Bool)

(declare-fun res!111120 () Bool)

(assert (=> b!133750 (=> (not res!111120) (not e!88715))))

(assert (=> b!133750 (= res!111120 (isPrefixOf!0 (_2!6097 lt!207016) (_2!6098 lt!206760)))))

(declare-fun b!133751 () Bool)

(declare-fun res!111121 () Bool)

(assert (=> b!133751 (=> (not res!111121) (not e!88715))))

(assert (=> b!133751 (= res!111121 (isPrefixOf!0 (_1!6097 lt!207016) thiss!1634))))

(declare-fun b!133752 () Bool)

(declare-fun lt!207011 () Unit!8281)

(assert (=> b!133752 (= e!88714 lt!207011)))

(declare-fun lt!207019 () (_ BitVec 64))

(assert (=> b!133752 (= lt!207019 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!207017 () (_ BitVec 64))

(assert (=> b!133752 (= lt!207017 (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)))))

(assert (=> b!133752 (= lt!207011 (arrayBitRangesEqSymmetric!0 (buf!3156 thiss!1634) (buf!3156 (_2!6098 lt!206760)) lt!207019 lt!207017))))

(assert (=> b!133752 (arrayBitRangesEq!0 (buf!3156 (_2!6098 lt!206760)) (buf!3156 thiss!1634) lt!207019 lt!207017)))

(declare-fun b!133753 () Bool)

(declare-fun Unit!8288 () Unit!8281)

(assert (=> b!133753 (= e!88714 Unit!8288)))

(assert (= (and d!42803 c!7635) b!133752))

(assert (= (and d!42803 (not c!7635)) b!133753))

(assert (= (and d!42803 res!111122) b!133751))

(assert (= (and b!133751 res!111121) b!133750))

(assert (= (and b!133750 res!111120) b!133749))

(assert (=> b!133752 m!202741))

(declare-fun m!202975 () Bool)

(assert (=> b!133752 m!202975))

(declare-fun m!202977 () Bool)

(assert (=> b!133752 m!202977))

(declare-fun m!202979 () Bool)

(assert (=> b!133749 m!202979))

(assert (=> b!133749 m!202671))

(assert (=> b!133749 m!202741))

(declare-fun m!202981 () Bool)

(assert (=> d!42803 m!202981))

(assert (=> d!42803 m!202939))

(assert (=> d!42803 m!202941))

(assert (=> d!42803 m!202717))

(declare-fun m!202983 () Bool)

(assert (=> d!42803 m!202983))

(declare-fun m!202985 () Bool)

(assert (=> d!42803 m!202985))

(declare-fun m!202987 () Bool)

(assert (=> d!42803 m!202987))

(declare-fun m!202989 () Bool)

(assert (=> d!42803 m!202989))

(declare-fun m!202991 () Bool)

(assert (=> d!42803 m!202991))

(declare-fun m!202993 () Bool)

(assert (=> d!42803 m!202993))

(declare-fun m!202995 () Bool)

(assert (=> d!42803 m!202995))

(declare-fun m!202997 () Bool)

(assert (=> b!133751 m!202997))

(declare-fun m!202999 () Bool)

(assert (=> b!133750 m!202999))

(assert (=> b!133616 d!42803))

(declare-fun d!42805 () Bool)

(declare-fun lt!207025 () tuple2!11594)

(assert (=> d!42805 (= lt!207025 (readByte!0 lt!206761))))

(assert (=> d!42805 (= (readBytePure!0 lt!206761) (tuple2!11571 (_2!6108 lt!207025) (_1!6108 lt!207025)))))

(declare-fun bs!10440 () Bool)

(assert (= bs!10440 d!42805))

(declare-fun m!203001 () Bool)

(assert (=> bs!10440 m!203001))

(assert (=> b!133616 d!42805))

(declare-fun d!42807 () Bool)

(declare-datatypes ((tuple3!508 0))(
  ( (tuple3!509 (_1!6109 Unit!8281) (_2!6109 BitStream!4810) (_3!311 array!6127)) )
))
(declare-fun lt!207028 () tuple3!508)

(declare-fun readByteArrayLoop!0 (BitStream!4810 array!6127 (_ BitVec 32) (_ BitVec 32)) tuple3!508)

(assert (=> d!42807 (= lt!207028 (readByteArrayLoop!0 (_1!6097 lt!206780) arr!237 from!447 to!404))))

(assert (=> d!42807 (= (readByteArrayLoopPure!0 (_1!6097 lt!206780) arr!237 from!447 to!404) (tuple2!11577 (_2!6109 lt!207028) (_3!311 lt!207028)))))

(declare-fun bs!10441 () Bool)

(assert (= bs!10441 d!42807))

(declare-fun m!203003 () Bool)

(assert (=> bs!10441 m!203003))

(assert (=> b!133616 d!42807))

(declare-fun d!42809 () Bool)

(declare-fun e!88718 () Bool)

(assert (=> d!42809 e!88718))

(declare-fun res!111128 () Bool)

(assert (=> d!42809 (=> (not res!111128) (not e!88718))))

(declare-fun lt!207045 () (_ BitVec 64))

(declare-fun lt!207046 () (_ BitVec 64))

(declare-fun lt!207042 () (_ BitVec 64))

(assert (=> d!42809 (= res!111128 (= lt!207045 (bvsub lt!207042 lt!207046)))))

(assert (=> d!42809 (or (= (bvand lt!207042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207046 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207042 lt!207046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!42809 (= lt!207046 (remainingBits!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_1!6096 lt!206759)))) ((_ sign_extend 32) (currentByte!5947 (_1!6096 lt!206759))) ((_ sign_extend 32) (currentBit!5942 (_1!6096 lt!206759)))))))

(declare-fun lt!207043 () (_ BitVec 64))

(declare-fun lt!207044 () (_ BitVec 64))

(assert (=> d!42809 (= lt!207042 (bvmul lt!207043 lt!207044))))

(assert (=> d!42809 (or (= lt!207043 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207044 (bvsdiv (bvmul lt!207043 lt!207044) lt!207043)))))

(assert (=> d!42809 (= lt!207044 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42809 (= lt!207043 ((_ sign_extend 32) (size!2773 (buf!3156 (_1!6096 lt!206759)))))))

(assert (=> d!42809 (= lt!207045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5947 (_1!6096 lt!206759))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5942 (_1!6096 lt!206759)))))))

(assert (=> d!42809 (invariant!0 (currentBit!5942 (_1!6096 lt!206759)) (currentByte!5947 (_1!6096 lt!206759)) (size!2773 (buf!3156 (_1!6096 lt!206759))))))

(assert (=> d!42809 (= (bitIndex!0 (size!2773 (buf!3156 (_1!6096 lt!206759))) (currentByte!5947 (_1!6096 lt!206759)) (currentBit!5942 (_1!6096 lt!206759))) lt!207045)))

(declare-fun b!133758 () Bool)

(declare-fun res!111127 () Bool)

(assert (=> b!133758 (=> (not res!111127) (not e!88718))))

(assert (=> b!133758 (= res!111127 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207045))))

(declare-fun b!133759 () Bool)

(declare-fun lt!207041 () (_ BitVec 64))

(assert (=> b!133759 (= e!88718 (bvsle lt!207045 (bvmul lt!207041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133759 (or (= lt!207041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207041)))))

(assert (=> b!133759 (= lt!207041 ((_ sign_extend 32) (size!2773 (buf!3156 (_1!6096 lt!206759)))))))

(assert (= (and d!42809 res!111128) b!133758))

(assert (= (and b!133758 res!111127) b!133759))

(declare-fun m!203005 () Bool)

(assert (=> d!42809 m!203005))

(declare-fun m!203007 () Bool)

(assert (=> d!42809 m!203007))

(assert (=> b!133616 d!42809))

(declare-fun d!42811 () Bool)

(declare-fun lt!207055 () tuple2!11576)

(declare-fun lt!207057 () tuple2!11576)

(assert (=> d!42811 (arrayRangesEq!176 (_2!6099 lt!207055) (_2!6099 lt!207057) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!207058 () Unit!8281)

(declare-fun lt!207056 () BitStream!4810)

(declare-fun choose!35 (BitStream!4810 array!6127 (_ BitVec 32) (_ BitVec 32) tuple2!11576 array!6127 BitStream!4810 tuple2!11576 array!6127) Unit!8281)

(assert (=> d!42811 (= lt!207058 (choose!35 (_1!6097 lt!206780) arr!237 from!447 to!404 lt!207055 (_2!6099 lt!207055) lt!207056 lt!207057 (_2!6099 lt!207057)))))

(assert (=> d!42811 (= lt!207057 (readByteArrayLoopPure!0 lt!207056 (array!6128 (store (arr!3423 arr!237) from!447 (_2!6096 (readBytePure!0 (_1!6097 lt!206780)))) (size!2773 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42811 (= lt!207056 (withMovedByteIndex!0 (_1!6097 lt!206780) #b00000000000000000000000000000001))))

(assert (=> d!42811 (= lt!207055 (readByteArrayLoopPure!0 (_1!6097 lt!206780) arr!237 from!447 to!404))))

(assert (=> d!42811 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6097 lt!206780) arr!237 from!447 to!404) lt!207058)))

(declare-fun bs!10443 () Bool)

(assert (= bs!10443 d!42811))

(assert (=> bs!10443 m!202727))

(assert (=> bs!10443 m!202693))

(declare-fun m!203009 () Bool)

(assert (=> bs!10443 m!203009))

(assert (=> bs!10443 m!202719))

(declare-fun m!203011 () Bool)

(assert (=> bs!10443 m!203011))

(declare-fun m!203013 () Bool)

(assert (=> bs!10443 m!203013))

(declare-fun m!203015 () Bool)

(assert (=> bs!10443 m!203015))

(assert (=> b!133616 d!42811))

(declare-fun d!42813 () Bool)

(declare-fun e!88719 () Bool)

(assert (=> d!42813 e!88719))

(declare-fun res!111130 () Bool)

(assert (=> d!42813 (=> (not res!111130) (not e!88719))))

(declare-fun lt!207064 () (_ BitVec 64))

(declare-fun lt!207063 () (_ BitVec 64))

(declare-fun lt!207060 () (_ BitVec 64))

(assert (=> d!42813 (= res!111130 (= lt!207063 (bvsub lt!207060 lt!207064)))))

(assert (=> d!42813 (or (= (bvand lt!207060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207064 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207060 lt!207064) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42813 (= lt!207064 (remainingBits!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_1!6096 lt!206777)))) ((_ sign_extend 32) (currentByte!5947 (_1!6096 lt!206777))) ((_ sign_extend 32) (currentBit!5942 (_1!6096 lt!206777)))))))

(declare-fun lt!207061 () (_ BitVec 64))

(declare-fun lt!207062 () (_ BitVec 64))

(assert (=> d!42813 (= lt!207060 (bvmul lt!207061 lt!207062))))

(assert (=> d!42813 (or (= lt!207061 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207062 (bvsdiv (bvmul lt!207061 lt!207062) lt!207061)))))

(assert (=> d!42813 (= lt!207062 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42813 (= lt!207061 ((_ sign_extend 32) (size!2773 (buf!3156 (_1!6096 lt!206777)))))))

(assert (=> d!42813 (= lt!207063 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5947 (_1!6096 lt!206777))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5942 (_1!6096 lt!206777)))))))

(assert (=> d!42813 (invariant!0 (currentBit!5942 (_1!6096 lt!206777)) (currentByte!5947 (_1!6096 lt!206777)) (size!2773 (buf!3156 (_1!6096 lt!206777))))))

(assert (=> d!42813 (= (bitIndex!0 (size!2773 (buf!3156 (_1!6096 lt!206777))) (currentByte!5947 (_1!6096 lt!206777)) (currentBit!5942 (_1!6096 lt!206777))) lt!207063)))

(declare-fun b!133760 () Bool)

(declare-fun res!111129 () Bool)

(assert (=> b!133760 (=> (not res!111129) (not e!88719))))

(assert (=> b!133760 (= res!111129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207063))))

(declare-fun b!133761 () Bool)

(declare-fun lt!207059 () (_ BitVec 64))

(assert (=> b!133761 (= e!88719 (bvsle lt!207063 (bvmul lt!207059 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133761 (or (= lt!207059 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207059 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207059)))))

(assert (=> b!133761 (= lt!207059 ((_ sign_extend 32) (size!2773 (buf!3156 (_1!6096 lt!206777)))))))

(assert (= (and d!42813 res!111130) b!133760))

(assert (= (and b!133760 res!111129) b!133761))

(declare-fun m!203017 () Bool)

(assert (=> d!42813 m!203017))

(declare-fun m!203019 () Bool)

(assert (=> d!42813 m!203019))

(assert (=> b!133616 d!42813))

(declare-fun d!42815 () Bool)

(assert (=> d!42815 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206778)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) lt!206770) (bvsle ((_ sign_extend 32) lt!206770) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206778)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10444 () Bool)

(assert (= bs!10444 d!42815))

(declare-fun m!203021 () Bool)

(assert (=> bs!10444 m!203021))

(assert (=> b!133616 d!42815))

(declare-fun d!42817 () Bool)

(assert (=> d!42817 (isPrefixOf!0 thiss!1634 (_2!6098 lt!206760))))

(declare-fun lt!207067 () Unit!8281)

(declare-fun choose!30 (BitStream!4810 BitStream!4810 BitStream!4810) Unit!8281)

(assert (=> d!42817 (= lt!207067 (choose!30 thiss!1634 (_2!6098 lt!206778) (_2!6098 lt!206760)))))

(assert (=> d!42817 (isPrefixOf!0 thiss!1634 (_2!6098 lt!206778))))

(assert (=> d!42817 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6098 lt!206778) (_2!6098 lt!206760)) lt!207067)))

(declare-fun bs!10445 () Bool)

(assert (= bs!10445 d!42817))

(assert (=> bs!10445 m!202717))

(declare-fun m!203023 () Bool)

(assert (=> bs!10445 m!203023))

(assert (=> bs!10445 m!202745))

(assert (=> b!133616 d!42817))

(declare-fun d!42819 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4810 (_ BitVec 32)) tuple2!11574)

(assert (=> d!42819 (= (withMovedByteIndex!0 (_1!6097 lt!206780) #b00000000000000000000000000000001) (_2!6098 (moveByteIndex!0 (_1!6097 lt!206780) #b00000000000000000000000000000001)))))

(declare-fun bs!10446 () Bool)

(assert (= bs!10446 d!42819))

(declare-fun m!203025 () Bool)

(assert (=> bs!10446 m!203025))

(assert (=> b!133616 d!42819))

(declare-fun d!42821 () Bool)

(declare-fun lt!207068 () tuple3!508)

(assert (=> d!42821 (= lt!207068 (readByteArrayLoop!0 (_1!6097 lt!206767) lt!206781 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42821 (= (readByteArrayLoopPure!0 (_1!6097 lt!206767) lt!206781 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11577 (_2!6109 lt!207068) (_3!311 lt!207068)))))

(declare-fun bs!10447 () Bool)

(assert (= bs!10447 d!42821))

(declare-fun m!203027 () Bool)

(assert (=> bs!10447 m!203027))

(assert (=> b!133616 d!42821))

(declare-fun b!133791 () Bool)

(declare-fun e!88738 () Bool)

(declare-fun lt!207141 () tuple2!11576)

(assert (=> b!133791 (= e!88738 (arrayRangesEq!176 arr!237 (_2!6099 lt!207141) #b00000000000000000000000000000000 to!404))))

(declare-fun d!42823 () Bool)

(declare-fun e!88737 () Bool)

(assert (=> d!42823 e!88737))

(declare-fun res!111158 () Bool)

(assert (=> d!42823 (=> (not res!111158) (not e!88737))))

(declare-fun lt!207133 () tuple2!11574)

(assert (=> d!42823 (= res!111158 (= (size!2773 (buf!3156 (_2!6098 lt!206778))) (size!2773 (buf!3156 (_2!6098 lt!207133)))))))

(declare-fun choose!64 (BitStream!4810 array!6127 (_ BitVec 32) (_ BitVec 32)) tuple2!11574)

(assert (=> d!42823 (= lt!207133 (choose!64 (_2!6098 lt!206778) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42823 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2773 arr!237)))))

(assert (=> d!42823 (= (appendByteArrayLoop!0 (_2!6098 lt!206778) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!207133)))

(declare-fun b!133792 () Bool)

(declare-fun res!111156 () Bool)

(assert (=> b!133792 (=> (not res!111156) (not e!88737))))

(declare-fun lt!207137 () (_ BitVec 64))

(declare-fun lt!207138 () (_ BitVec 64))

(assert (=> b!133792 (= res!111156 (= (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!207133))) (currentByte!5947 (_2!6098 lt!207133)) (currentBit!5942 (_2!6098 lt!207133))) (bvadd lt!207137 lt!207138)))))

(assert (=> b!133792 (or (not (= (bvand lt!207137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207138 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207137 lt!207138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!207136 () (_ BitVec 64))

(assert (=> b!133792 (= lt!207138 (bvmul lt!207136 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!133792 (or (= lt!207136 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207136 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207136)))))

(assert (=> b!133792 (= lt!207136 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133792 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!133792 (= lt!207137 (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206778))) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778))))))

(declare-fun b!133793 () Bool)

(declare-fun e!88736 () Bool)

(declare-fun lt!207139 () (_ BitVec 64))

(assert (=> b!133793 (= e!88736 (validate_offset_bits!1 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206778)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) lt!207139))))

(declare-fun b!133794 () Bool)

(declare-fun res!111159 () Bool)

(assert (=> b!133794 (=> (not res!111159) (not e!88737))))

(assert (=> b!133794 (= res!111159 (isPrefixOf!0 (_2!6098 lt!206778) (_2!6098 lt!207133)))))

(declare-fun b!133795 () Bool)

(assert (=> b!133795 (= e!88737 e!88738)))

(declare-fun res!111157 () Bool)

(assert (=> b!133795 (=> (not res!111157) (not e!88738))))

(declare-fun lt!207135 () tuple2!11572)

(assert (=> b!133795 (= res!111157 (and (= (size!2773 (_2!6099 lt!207141)) (size!2773 arr!237)) (= (_1!6099 lt!207141) (_2!6097 lt!207135))))))

(assert (=> b!133795 (= lt!207141 (readByteArrayLoopPure!0 (_1!6097 lt!207135) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!207140 () Unit!8281)

(declare-fun lt!207134 () Unit!8281)

(assert (=> b!133795 (= lt!207140 lt!207134)))

(assert (=> b!133795 (validate_offset_bits!1 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!207133)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) lt!207139)))

(assert (=> b!133795 (= lt!207134 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6098 lt!206778) (buf!3156 (_2!6098 lt!207133)) lt!207139))))

(assert (=> b!133795 e!88736))

(declare-fun res!111160 () Bool)

(assert (=> b!133795 (=> (not res!111160) (not e!88736))))

(assert (=> b!133795 (= res!111160 (and (= (size!2773 (buf!3156 (_2!6098 lt!206778))) (size!2773 (buf!3156 (_2!6098 lt!207133)))) (bvsge lt!207139 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133795 (= lt!207139 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133795 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!133795 (= lt!207135 (reader!0 (_2!6098 lt!206778) (_2!6098 lt!207133)))))

(assert (= (and d!42823 res!111158) b!133792))

(assert (= (and b!133792 res!111156) b!133794))

(assert (= (and b!133794 res!111159) b!133795))

(assert (= (and b!133795 res!111160) b!133793))

(assert (= (and b!133795 res!111157) b!133791))

(declare-fun m!203039 () Bool)

(assert (=> b!133791 m!203039))

(declare-fun m!203041 () Bool)

(assert (=> d!42823 m!203041))

(declare-fun m!203043 () Bool)

(assert (=> b!133795 m!203043))

(declare-fun m!203045 () Bool)

(assert (=> b!133795 m!203045))

(declare-fun m!203047 () Bool)

(assert (=> b!133795 m!203047))

(declare-fun m!203049 () Bool)

(assert (=> b!133795 m!203049))

(declare-fun m!203051 () Bool)

(assert (=> b!133793 m!203051))

(declare-fun m!203053 () Bool)

(assert (=> b!133792 m!203053))

(assert (=> b!133792 m!202673))

(declare-fun m!203055 () Bool)

(assert (=> b!133794 m!203055))

(assert (=> b!133616 d!42823))

(declare-fun d!42837 () Bool)

(declare-fun e!88740 () Bool)

(assert (=> d!42837 e!88740))

(declare-fun res!111163 () Bool)

(assert (=> d!42837 (=> (not res!111163) (not e!88740))))

(declare-fun lt!207153 () tuple2!11572)

(assert (=> d!42837 (= res!111163 (isPrefixOf!0 (_1!6097 lt!207153) (_2!6097 lt!207153)))))

(declare-fun lt!207158 () BitStream!4810)

(assert (=> d!42837 (= lt!207153 (tuple2!11573 lt!207158 (_2!6098 lt!206760)))))

(declare-fun lt!207147 () Unit!8281)

(declare-fun lt!207146 () Unit!8281)

(assert (=> d!42837 (= lt!207147 lt!207146)))

(assert (=> d!42837 (isPrefixOf!0 lt!207158 (_2!6098 lt!206760))))

(assert (=> d!42837 (= lt!207146 (lemmaIsPrefixTransitive!0 lt!207158 (_2!6098 lt!206760) (_2!6098 lt!206760)))))

(declare-fun lt!207152 () Unit!8281)

(declare-fun lt!207149 () Unit!8281)

(assert (=> d!42837 (= lt!207152 lt!207149)))

(assert (=> d!42837 (isPrefixOf!0 lt!207158 (_2!6098 lt!206760))))

(assert (=> d!42837 (= lt!207149 (lemmaIsPrefixTransitive!0 lt!207158 (_2!6098 lt!206778) (_2!6098 lt!206760)))))

(declare-fun lt!207157 () Unit!8281)

(declare-fun e!88739 () Unit!8281)

(assert (=> d!42837 (= lt!207157 e!88739)))

(declare-fun c!7638 () Bool)

(assert (=> d!42837 (= c!7638 (not (= (size!2773 (buf!3156 (_2!6098 lt!206778))) #b00000000000000000000000000000000)))))

(declare-fun lt!207142 () Unit!8281)

(declare-fun lt!207151 () Unit!8281)

(assert (=> d!42837 (= lt!207142 lt!207151)))

(assert (=> d!42837 (isPrefixOf!0 (_2!6098 lt!206760) (_2!6098 lt!206760))))

(assert (=> d!42837 (= lt!207151 (lemmaIsPrefixRefl!0 (_2!6098 lt!206760)))))

(declare-fun lt!207144 () Unit!8281)

(declare-fun lt!207145 () Unit!8281)

(assert (=> d!42837 (= lt!207144 lt!207145)))

(assert (=> d!42837 (= lt!207145 (lemmaIsPrefixRefl!0 (_2!6098 lt!206760)))))

(declare-fun lt!207160 () Unit!8281)

(declare-fun lt!207161 () Unit!8281)

(assert (=> d!42837 (= lt!207160 lt!207161)))

(assert (=> d!42837 (isPrefixOf!0 lt!207158 lt!207158)))

(assert (=> d!42837 (= lt!207161 (lemmaIsPrefixRefl!0 lt!207158))))

(declare-fun lt!207155 () Unit!8281)

(declare-fun lt!207159 () Unit!8281)

(assert (=> d!42837 (= lt!207155 lt!207159)))

(assert (=> d!42837 (isPrefixOf!0 (_2!6098 lt!206778) (_2!6098 lt!206778))))

(assert (=> d!42837 (= lt!207159 (lemmaIsPrefixRefl!0 (_2!6098 lt!206778)))))

(assert (=> d!42837 (= lt!207158 (BitStream!4811 (buf!3156 (_2!6098 lt!206760)) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778))))))

(assert (=> d!42837 (isPrefixOf!0 (_2!6098 lt!206778) (_2!6098 lt!206760))))

(assert (=> d!42837 (= (reader!0 (_2!6098 lt!206778) (_2!6098 lt!206760)) lt!207153)))

(declare-fun lt!207150 () (_ BitVec 64))

(declare-fun lt!207143 () (_ BitVec 64))

(declare-fun b!133796 () Bool)

(assert (=> b!133796 (= e!88740 (= (_1!6097 lt!207153) (withMovedBitIndex!0 (_2!6097 lt!207153) (bvsub lt!207143 lt!207150))))))

(assert (=> b!133796 (or (= (bvand lt!207143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207150 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207143 lt!207150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133796 (= lt!207150 (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206760))) (currentByte!5947 (_2!6098 lt!206760)) (currentBit!5942 (_2!6098 lt!206760))))))

(assert (=> b!133796 (= lt!207143 (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206778))) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778))))))

(declare-fun b!133797 () Bool)

(declare-fun res!111161 () Bool)

(assert (=> b!133797 (=> (not res!111161) (not e!88740))))

(assert (=> b!133797 (= res!111161 (isPrefixOf!0 (_2!6097 lt!207153) (_2!6098 lt!206760)))))

(declare-fun b!133798 () Bool)

(declare-fun res!111162 () Bool)

(assert (=> b!133798 (=> (not res!111162) (not e!88740))))

(assert (=> b!133798 (= res!111162 (isPrefixOf!0 (_1!6097 lt!207153) (_2!6098 lt!206778)))))

(declare-fun b!133799 () Bool)

(declare-fun lt!207148 () Unit!8281)

(assert (=> b!133799 (= e!88739 lt!207148)))

(declare-fun lt!207156 () (_ BitVec 64))

(assert (=> b!133799 (= lt!207156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!207154 () (_ BitVec 64))

(assert (=> b!133799 (= lt!207154 (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206778))) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778))))))

(assert (=> b!133799 (= lt!207148 (arrayBitRangesEqSymmetric!0 (buf!3156 (_2!6098 lt!206778)) (buf!3156 (_2!6098 lt!206760)) lt!207156 lt!207154))))

(assert (=> b!133799 (arrayBitRangesEq!0 (buf!3156 (_2!6098 lt!206760)) (buf!3156 (_2!6098 lt!206778)) lt!207156 lt!207154)))

(declare-fun b!133800 () Bool)

(declare-fun Unit!8289 () Unit!8281)

(assert (=> b!133800 (= e!88739 Unit!8289)))

(assert (= (and d!42837 c!7638) b!133799))

(assert (= (and d!42837 (not c!7638)) b!133800))

(assert (= (and d!42837 res!111163) b!133798))

(assert (= (and b!133798 res!111162) b!133797))

(assert (= (and b!133797 res!111161) b!133796))

(assert (=> b!133799 m!202673))

(declare-fun m!203057 () Bool)

(assert (=> b!133799 m!203057))

(declare-fun m!203059 () Bool)

(assert (=> b!133799 m!203059))

(declare-fun m!203061 () Bool)

(assert (=> b!133796 m!203061))

(assert (=> b!133796 m!202671))

(assert (=> b!133796 m!202673))

(declare-fun m!203063 () Bool)

(assert (=> d!42837 m!203063))

(assert (=> d!42837 m!202945))

(assert (=> d!42837 m!202951))

(assert (=> d!42837 m!202743))

(declare-fun m!203065 () Bool)

(assert (=> d!42837 m!203065))

(assert (=> d!42837 m!202985))

(declare-fun m!203067 () Bool)

(assert (=> d!42837 m!203067))

(declare-fun m!203069 () Bool)

(assert (=> d!42837 m!203069))

(assert (=> d!42837 m!202991))

(declare-fun m!203071 () Bool)

(assert (=> d!42837 m!203071))

(declare-fun m!203073 () Bool)

(assert (=> d!42837 m!203073))

(declare-fun m!203075 () Bool)

(assert (=> b!133798 m!203075))

(declare-fun m!203077 () Bool)

(assert (=> b!133797 m!203077))

(assert (=> b!133616 d!42837))

(declare-fun d!42839 () Bool)

(assert (=> d!42839 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 thiss!1634)) ((_ sign_extend 32) (currentBit!5942 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 thiss!1634)) ((_ sign_extend 32) (currentBit!5942 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10452 () Bool)

(assert (= bs!10452 d!42839))

(declare-fun m!203079 () Bool)

(assert (=> bs!10452 m!203079))

(assert (=> b!133616 d!42839))

(declare-fun d!42841 () Bool)

(declare-fun e!88751 () Bool)

(assert (=> d!42841 e!88751))

(declare-fun res!111175 () Bool)

(assert (=> d!42841 (=> (not res!111175) (not e!88751))))

(declare-fun lt!207190 () tuple2!11570)

(declare-fun lt!207191 () tuple2!11570)

(assert (=> d!42841 (= res!111175 (= (bitIndex!0 (size!2773 (buf!3156 (_1!6096 lt!207190))) (currentByte!5947 (_1!6096 lt!207190)) (currentBit!5942 (_1!6096 lt!207190))) (bitIndex!0 (size!2773 (buf!3156 (_1!6096 lt!207191))) (currentByte!5947 (_1!6096 lt!207191)) (currentBit!5942 (_1!6096 lt!207191)))))))

(declare-fun lt!207193 () Unit!8281)

(declare-fun lt!207192 () BitStream!4810)

(declare-fun choose!14 (BitStream!4810 BitStream!4810 BitStream!4810 tuple2!11570 tuple2!11570 BitStream!4810 (_ BitVec 8) tuple2!11570 tuple2!11570 BitStream!4810 (_ BitVec 8)) Unit!8281)

(assert (=> d!42841 (= lt!207193 (choose!14 lt!206761 (_2!6098 lt!206760) lt!207192 lt!207190 (tuple2!11571 (_1!6096 lt!207190) (_2!6096 lt!207190)) (_1!6096 lt!207190) (_2!6096 lt!207190) lt!207191 (tuple2!11571 (_1!6096 lt!207191) (_2!6096 lt!207191)) (_1!6096 lt!207191) (_2!6096 lt!207191)))))

(assert (=> d!42841 (= lt!207191 (readBytePure!0 lt!207192))))

(assert (=> d!42841 (= lt!207190 (readBytePure!0 lt!206761))))

(assert (=> d!42841 (= lt!207192 (BitStream!4811 (buf!3156 (_2!6098 lt!206760)) (currentByte!5947 lt!206761) (currentBit!5942 lt!206761)))))

(assert (=> d!42841 (= (readBytePrefixLemma!0 lt!206761 (_2!6098 lt!206760)) lt!207193)))

(declare-fun b!133814 () Bool)

(assert (=> b!133814 (= e!88751 (= (_2!6096 lt!207190) (_2!6096 lt!207191)))))

(assert (= (and d!42841 res!111175) b!133814))

(declare-fun m!203117 () Bool)

(assert (=> d!42841 m!203117))

(assert (=> d!42841 m!202703))

(declare-fun m!203119 () Bool)

(assert (=> d!42841 m!203119))

(declare-fun m!203121 () Bool)

(assert (=> d!42841 m!203121))

(declare-fun m!203123 () Bool)

(assert (=> d!42841 m!203123))

(assert (=> b!133616 d!42841))

(declare-fun lt!207194 () tuple3!508)

(declare-fun d!42847 () Bool)

(assert (=> d!42847 (= lt!207194 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6097 lt!206780) #b00000000000000000000000000000001) lt!206781 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42847 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6097 lt!206780) #b00000000000000000000000000000001) lt!206781 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11577 (_2!6109 lt!207194) (_3!311 lt!207194)))))

(declare-fun bs!10453 () Bool)

(assert (= bs!10453 d!42847))

(assert (=> bs!10453 m!202693))

(declare-fun m!203125 () Bool)

(assert (=> bs!10453 m!203125))

(assert (=> b!133616 d!42847))

(declare-fun d!42849 () Bool)

(assert (=> d!42849 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 thiss!1634)) ((_ sign_extend 32) (currentBit!5942 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!207197 () Unit!8281)

(declare-fun choose!26 (BitStream!4810 array!6127 (_ BitVec 32) BitStream!4810) Unit!8281)

(assert (=> d!42849 (= lt!207197 (choose!26 thiss!1634 (buf!3156 (_2!6098 lt!206760)) (bvsub to!404 from!447) (BitStream!4811 (buf!3156 (_2!6098 lt!206760)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634))))))

(assert (=> d!42849 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3156 (_2!6098 lt!206760)) (bvsub to!404 from!447)) lt!207197)))

(declare-fun bs!10454 () Bool)

(assert (= bs!10454 d!42849))

(assert (=> bs!10454 m!202739))

(declare-fun m!203127 () Bool)

(assert (=> bs!10454 m!203127))

(assert (=> b!133616 d!42849))

(declare-fun d!42851 () Bool)

(declare-fun lt!207198 () tuple2!11594)

(assert (=> d!42851 (= lt!207198 (readByte!0 (_1!6097 lt!206780)))))

(assert (=> d!42851 (= (readBytePure!0 (_1!6097 lt!206780)) (tuple2!11571 (_2!6108 lt!207198) (_1!6108 lt!207198)))))

(declare-fun bs!10455 () Bool)

(assert (= bs!10455 d!42851))

(declare-fun m!203129 () Bool)

(assert (=> bs!10455 m!203129))

(assert (=> b!133616 d!42851))

(declare-fun d!42853 () Bool)

(declare-fun e!88763 () Bool)

(assert (=> d!42853 e!88763))

(declare-fun res!111199 () Bool)

(assert (=> d!42853 (=> (not res!111199) (not e!88763))))

(declare-fun lt!207257 () tuple2!11574)

(assert (=> d!42853 (= res!111199 (= (size!2773 (buf!3156 thiss!1634)) (size!2773 (buf!3156 (_2!6098 lt!207257)))))))

(declare-fun choose!6 (BitStream!4810 (_ BitVec 8)) tuple2!11574)

(assert (=> d!42853 (= lt!207257 (choose!6 thiss!1634 (select (arr!3423 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!42853 (validate_offset_byte!0 ((_ sign_extend 32) (size!2773 (buf!3156 thiss!1634))) ((_ sign_extend 32) (currentByte!5947 thiss!1634)) ((_ sign_extend 32) (currentBit!5942 thiss!1634)))))

(assert (=> d!42853 (= (appendByte!0 thiss!1634 (select (arr!3423 arr!237) from!447)) lt!207257)))

(declare-fun b!133836 () Bool)

(declare-fun res!111197 () Bool)

(assert (=> b!133836 (=> (not res!111197) (not e!88763))))

(declare-fun lt!207256 () (_ BitVec 64))

(declare-fun lt!207254 () (_ BitVec 64))

(assert (=> b!133836 (= res!111197 (= (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!207257))) (currentByte!5947 (_2!6098 lt!207257)) (currentBit!5942 (_2!6098 lt!207257))) (bvadd lt!207254 lt!207256)))))

(assert (=> b!133836 (or (not (= (bvand lt!207254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207256 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207254 lt!207256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133836 (= lt!207256 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133836 (= lt!207254 (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)))))

(declare-fun b!133837 () Bool)

(declare-fun res!111198 () Bool)

(assert (=> b!133837 (=> (not res!111198) (not e!88763))))

(assert (=> b!133837 (= res!111198 (isPrefixOf!0 thiss!1634 (_2!6098 lt!207257)))))

(declare-fun lt!207255 () tuple2!11570)

(declare-fun lt!207258 () tuple2!11572)

(declare-fun b!133838 () Bool)

(assert (=> b!133838 (= e!88763 (and (= (_2!6096 lt!207255) (select (arr!3423 arr!237) from!447)) (= (_1!6096 lt!207255) (_2!6097 lt!207258))))))

(assert (=> b!133838 (= lt!207255 (readBytePure!0 (_1!6097 lt!207258)))))

(assert (=> b!133838 (= lt!207258 (reader!0 thiss!1634 (_2!6098 lt!207257)))))

(assert (= (and d!42853 res!111199) b!133836))

(assert (= (and b!133836 res!111197) b!133837))

(assert (= (and b!133837 res!111198) b!133838))

(assert (=> d!42853 m!202701))

(declare-fun m!203147 () Bool)

(assert (=> d!42853 m!203147))

(declare-fun m!203149 () Bool)

(assert (=> d!42853 m!203149))

(declare-fun m!203151 () Bool)

(assert (=> b!133836 m!203151))

(assert (=> b!133836 m!202741))

(declare-fun m!203153 () Bool)

(assert (=> b!133837 m!203153))

(declare-fun m!203155 () Bool)

(assert (=> b!133838 m!203155))

(declare-fun m!203157 () Bool)

(assert (=> b!133838 m!203157))

(assert (=> b!133616 d!42853))

(declare-fun d!42866 () Bool)

(assert (=> d!42866 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) lt!206770)))

(declare-fun lt!207259 () Unit!8281)

(assert (=> d!42866 (= lt!207259 (choose!26 (_2!6098 lt!206778) (buf!3156 (_2!6098 lt!206760)) lt!206770 (BitStream!4811 (buf!3156 (_2!6098 lt!206760)) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778)))))))

(assert (=> d!42866 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6098 lt!206778) (buf!3156 (_2!6098 lt!206760)) lt!206770) lt!207259)))

(declare-fun bs!10456 () Bool)

(assert (= bs!10456 d!42866))

(assert (=> bs!10456 m!202705))

(declare-fun m!203159 () Bool)

(assert (=> bs!10456 m!203159))

(assert (=> b!133616 d!42866))

(declare-fun d!42868 () Bool)

(assert (=> d!42868 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) lt!206770) (bvsle ((_ sign_extend 32) lt!206770) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10457 () Bool)

(assert (= bs!10457 d!42868))

(declare-fun m!203161 () Bool)

(assert (=> bs!10457 m!203161))

(assert (=> b!133616 d!42868))

(declare-fun d!42870 () Bool)

(declare-fun lt!207260 () tuple3!508)

(assert (=> d!42870 (= lt!207260 (readByteArrayLoop!0 (_1!6097 lt!206773) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42870 (= (readByteArrayLoopPure!0 (_1!6097 lt!206773) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11577 (_2!6109 lt!207260) (_3!311 lt!207260)))))

(declare-fun bs!10458 () Bool)

(assert (= bs!10458 d!42870))

(declare-fun m!203163 () Bool)

(assert (=> bs!10458 m!203163))

(assert (=> b!133626 d!42870))

(declare-fun d!42872 () Bool)

(assert (=> d!42872 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) lt!206772) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778)))) lt!206772))))

(declare-fun bs!10459 () Bool)

(assert (= bs!10459 d!42872))

(assert (=> bs!10459 m!203161))

(assert (=> b!133626 d!42872))

(declare-fun d!42874 () Bool)

(assert (=> d!42874 (validate_offset_bits!1 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778))) lt!206772)))

(declare-fun lt!207263 () Unit!8281)

(declare-fun choose!9 (BitStream!4810 array!6127 (_ BitVec 64) BitStream!4810) Unit!8281)

(assert (=> d!42874 (= lt!207263 (choose!9 (_2!6098 lt!206778) (buf!3156 (_2!6098 lt!206760)) lt!206772 (BitStream!4811 (buf!3156 (_2!6098 lt!206760)) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778)))))))

(assert (=> d!42874 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6098 lt!206778) (buf!3156 (_2!6098 lt!206760)) lt!206772) lt!207263)))

(declare-fun bs!10460 () Bool)

(assert (= bs!10460 d!42874))

(assert (=> bs!10460 m!202679))

(declare-fun m!203165 () Bool)

(assert (=> bs!10460 m!203165))

(assert (=> b!133626 d!42874))

(assert (=> b!133626 d!42837))

(declare-fun d!42876 () Bool)

(assert (=> d!42876 (= (invariant!0 (currentBit!5942 thiss!1634) (currentByte!5947 thiss!1634) (size!2773 (buf!3156 thiss!1634))) (and (bvsge (currentBit!5942 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5942 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5947 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5947 thiss!1634) (size!2773 (buf!3156 thiss!1634))) (and (= (currentBit!5942 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5947 thiss!1634) (size!2773 (buf!3156 thiss!1634)))))))))

(assert (=> b!133615 d!42876))

(declare-fun d!42878 () Bool)

(declare-fun e!88764 () Bool)

(assert (=> d!42878 e!88764))

(declare-fun res!111201 () Bool)

(assert (=> d!42878 (=> (not res!111201) (not e!88764))))

(declare-fun lt!207265 () (_ BitVec 64))

(declare-fun lt!207268 () (_ BitVec 64))

(declare-fun lt!207269 () (_ BitVec 64))

(assert (=> d!42878 (= res!111201 (= lt!207268 (bvsub lt!207265 lt!207269)))))

(assert (=> d!42878 (or (= (bvand lt!207265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207269 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207265 lt!207269) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42878 (= lt!207269 (remainingBits!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206778)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778)))))))

(declare-fun lt!207266 () (_ BitVec 64))

(declare-fun lt!207267 () (_ BitVec 64))

(assert (=> d!42878 (= lt!207265 (bvmul lt!207266 lt!207267))))

(assert (=> d!42878 (or (= lt!207266 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207267 (bvsdiv (bvmul lt!207266 lt!207267) lt!207266)))))

(assert (=> d!42878 (= lt!207267 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42878 (= lt!207266 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206778)))))))

(assert (=> d!42878 (= lt!207268 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206778))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206778)))))))

(assert (=> d!42878 (invariant!0 (currentBit!5942 (_2!6098 lt!206778)) (currentByte!5947 (_2!6098 lt!206778)) (size!2773 (buf!3156 (_2!6098 lt!206778))))))

(assert (=> d!42878 (= (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206778))) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778))) lt!207268)))

(declare-fun b!133839 () Bool)

(declare-fun res!111200 () Bool)

(assert (=> b!133839 (=> (not res!111200) (not e!88764))))

(assert (=> b!133839 (= res!111200 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207268))))

(declare-fun b!133840 () Bool)

(declare-fun lt!207264 () (_ BitVec 64))

(assert (=> b!133840 (= e!88764 (bvsle lt!207268 (bvmul lt!207264 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133840 (or (= lt!207264 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207264 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207264)))))

(assert (=> b!133840 (= lt!207264 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206778)))))))

(assert (= (and d!42878 res!111201) b!133839))

(assert (= (and b!133839 res!111200) b!133840))

(assert (=> d!42878 m!203021))

(declare-fun m!203167 () Bool)

(assert (=> d!42878 m!203167))

(assert (=> b!133620 d!42878))

(declare-fun d!42880 () Bool)

(declare-fun e!88765 () Bool)

(assert (=> d!42880 e!88765))

(declare-fun res!111203 () Bool)

(assert (=> d!42880 (=> (not res!111203) (not e!88765))))

(declare-fun lt!207271 () (_ BitVec 64))

(declare-fun lt!207275 () (_ BitVec 64))

(declare-fun lt!207274 () (_ BitVec 64))

(assert (=> d!42880 (= res!111203 (= lt!207274 (bvsub lt!207271 lt!207275)))))

(assert (=> d!42880 (or (= (bvand lt!207271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207275 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207271 lt!207275) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42880 (= lt!207275 (remainingBits!0 ((_ sign_extend 32) (size!2773 (buf!3156 thiss!1634))) ((_ sign_extend 32) (currentByte!5947 thiss!1634)) ((_ sign_extend 32) (currentBit!5942 thiss!1634))))))

(declare-fun lt!207272 () (_ BitVec 64))

(declare-fun lt!207273 () (_ BitVec 64))

(assert (=> d!42880 (= lt!207271 (bvmul lt!207272 lt!207273))))

(assert (=> d!42880 (or (= lt!207272 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207273 (bvsdiv (bvmul lt!207272 lt!207273) lt!207272)))))

(assert (=> d!42880 (= lt!207273 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42880 (= lt!207272 ((_ sign_extend 32) (size!2773 (buf!3156 thiss!1634))))))

(assert (=> d!42880 (= lt!207274 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5947 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5942 thiss!1634))))))

(assert (=> d!42880 (invariant!0 (currentBit!5942 thiss!1634) (currentByte!5947 thiss!1634) (size!2773 (buf!3156 thiss!1634)))))

(assert (=> d!42880 (= (bitIndex!0 (size!2773 (buf!3156 thiss!1634)) (currentByte!5947 thiss!1634) (currentBit!5942 thiss!1634)) lt!207274)))

(declare-fun b!133841 () Bool)

(declare-fun res!111202 () Bool)

(assert (=> b!133841 (=> (not res!111202) (not e!88765))))

(assert (=> b!133841 (= res!111202 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207274))))

(declare-fun b!133842 () Bool)

(declare-fun lt!207270 () (_ BitVec 64))

(assert (=> b!133842 (= e!88765 (bvsle lt!207274 (bvmul lt!207270 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133842 (or (= lt!207270 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207270 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207270)))))

(assert (=> b!133842 (= lt!207270 ((_ sign_extend 32) (size!2773 (buf!3156 thiss!1634))))))

(assert (= (and d!42880 res!111203) b!133841))

(assert (= (and b!133841 res!111202) b!133842))

(declare-fun m!203169 () Bool)

(assert (=> d!42880 m!203169))

(assert (=> d!42880 m!202669))

(assert (=> b!133620 d!42880))

(declare-fun d!42882 () Bool)

(declare-fun res!111206 () Bool)

(declare-fun e!88766 () Bool)

(assert (=> d!42882 (=> (not res!111206) (not e!88766))))

(assert (=> d!42882 (= res!111206 (= (size!2773 (buf!3156 (_2!6098 lt!206778))) (size!2773 (buf!3156 (_2!6098 lt!206760)))))))

(assert (=> d!42882 (= (isPrefixOf!0 (_2!6098 lt!206778) (_2!6098 lt!206760)) e!88766)))

(declare-fun b!133843 () Bool)

(declare-fun res!111205 () Bool)

(assert (=> b!133843 (=> (not res!111205) (not e!88766))))

(assert (=> b!133843 (= res!111205 (bvsle (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206778))) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778))) (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206760))) (currentByte!5947 (_2!6098 lt!206760)) (currentBit!5942 (_2!6098 lt!206760)))))))

(declare-fun b!133844 () Bool)

(declare-fun e!88767 () Bool)

(assert (=> b!133844 (= e!88766 e!88767)))

(declare-fun res!111204 () Bool)

(assert (=> b!133844 (=> res!111204 e!88767)))

(assert (=> b!133844 (= res!111204 (= (size!2773 (buf!3156 (_2!6098 lt!206778))) #b00000000000000000000000000000000))))

(declare-fun b!133845 () Bool)

(assert (=> b!133845 (= e!88767 (arrayBitRangesEq!0 (buf!3156 (_2!6098 lt!206778)) (buf!3156 (_2!6098 lt!206760)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206778))) (currentByte!5947 (_2!6098 lt!206778)) (currentBit!5942 (_2!6098 lt!206778)))))))

(assert (= (and d!42882 res!111206) b!133843))

(assert (= (and b!133843 res!111205) b!133844))

(assert (= (and b!133844 (not res!111204)) b!133845))

(assert (=> b!133843 m!202673))

(assert (=> b!133843 m!202671))

(assert (=> b!133845 m!202673))

(assert (=> b!133845 m!202673))

(declare-fun m!203171 () Bool)

(assert (=> b!133845 m!203171))

(assert (=> b!133619 d!42882))

(declare-fun d!42884 () Bool)

(declare-fun e!88768 () Bool)

(assert (=> d!42884 e!88768))

(declare-fun res!111208 () Bool)

(assert (=> d!42884 (=> (not res!111208) (not e!88768))))

(declare-fun lt!207280 () (_ BitVec 64))

(declare-fun lt!207281 () (_ BitVec 64))

(declare-fun lt!207277 () (_ BitVec 64))

(assert (=> d!42884 (= res!111208 (= lt!207280 (bvsub lt!207277 lt!207281)))))

(assert (=> d!42884 (or (= (bvand lt!207277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207281 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207277 lt!207281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42884 (= lt!207281 (remainingBits!0 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))) ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206760))) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206760)))))))

(declare-fun lt!207278 () (_ BitVec 64))

(declare-fun lt!207279 () (_ BitVec 64))

(assert (=> d!42884 (= lt!207277 (bvmul lt!207278 lt!207279))))

(assert (=> d!42884 (or (= lt!207278 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207279 (bvsdiv (bvmul lt!207278 lt!207279) lt!207278)))))

(assert (=> d!42884 (= lt!207279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42884 (= lt!207278 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))))))

(assert (=> d!42884 (= lt!207280 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5947 (_2!6098 lt!206760))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5942 (_2!6098 lt!206760)))))))

(assert (=> d!42884 (invariant!0 (currentBit!5942 (_2!6098 lt!206760)) (currentByte!5947 (_2!6098 lt!206760)) (size!2773 (buf!3156 (_2!6098 lt!206760))))))

(assert (=> d!42884 (= (bitIndex!0 (size!2773 (buf!3156 (_2!6098 lt!206760))) (currentByte!5947 (_2!6098 lt!206760)) (currentBit!5942 (_2!6098 lt!206760))) lt!207280)))

(declare-fun b!133846 () Bool)

(declare-fun res!111207 () Bool)

(assert (=> b!133846 (=> (not res!111207) (not e!88768))))

(assert (=> b!133846 (= res!111207 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207280))))

(declare-fun b!133847 () Bool)

(declare-fun lt!207276 () (_ BitVec 64))

(assert (=> b!133847 (= e!88768 (bvsle lt!207280 (bvmul lt!207276 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133847 (or (= lt!207276 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207276 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207276)))))

(assert (=> b!133847 (= lt!207276 ((_ sign_extend 32) (size!2773 (buf!3156 (_2!6098 lt!206760)))))))

(assert (= (and d!42884 res!111208) b!133846))

(assert (= (and b!133846 res!111207) b!133847))

(declare-fun m!203173 () Bool)

(assert (=> d!42884 m!203173))

(declare-fun m!203175 () Bool)

(assert (=> d!42884 m!203175))

(assert (=> b!133618 d!42884))

(assert (=> b!133618 d!42878))

(declare-fun d!42886 () Bool)

(assert (=> d!42886 (= (array_inv!2562 arr!237) (bvsge (size!2773 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26142 d!42886))

(declare-fun d!42888 () Bool)

(assert (=> d!42888 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5942 thiss!1634) (currentByte!5947 thiss!1634) (size!2773 (buf!3156 thiss!1634))))))

(declare-fun bs!10461 () Bool)

(assert (= bs!10461 d!42888))

(assert (=> bs!10461 m!202669))

(assert (=> start!26142 d!42888))

(declare-fun d!42890 () Bool)

(declare-fun res!111209 () Bool)

(declare-fun e!88769 () Bool)

(assert (=> d!42890 (=> res!111209 e!88769)))

(assert (=> d!42890 (= res!111209 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42890 (= (arrayRangesEq!176 arr!237 (_2!6099 lt!206766) #b00000000000000000000000000000000 to!404) e!88769)))

(declare-fun b!133848 () Bool)

(declare-fun e!88770 () Bool)

(assert (=> b!133848 (= e!88769 e!88770)))

(declare-fun res!111210 () Bool)

(assert (=> b!133848 (=> (not res!111210) (not e!88770))))

(assert (=> b!133848 (= res!111210 (= (select (arr!3423 arr!237) #b00000000000000000000000000000000) (select (arr!3423 (_2!6099 lt!206766)) #b00000000000000000000000000000000)))))

(declare-fun b!133849 () Bool)

(assert (=> b!133849 (= e!88770 (arrayRangesEq!176 arr!237 (_2!6099 lt!206766) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42890 (not res!111209)) b!133848))

(assert (= (and b!133848 res!111210) b!133849))

(declare-fun m!203177 () Bool)

(assert (=> b!133848 m!203177))

(declare-fun m!203179 () Bool)

(assert (=> b!133848 m!203179))

(declare-fun m!203181 () Bool)

(assert (=> b!133849 m!203181))

(assert (=> b!133622 d!42890))

(declare-fun d!42892 () Bool)

(assert (=> d!42892 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2773 (buf!3156 thiss!1634))) ((_ sign_extend 32) (currentByte!5947 thiss!1634)) ((_ sign_extend 32) (currentBit!5942 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2773 (buf!3156 thiss!1634))) ((_ sign_extend 32) (currentByte!5947 thiss!1634)) ((_ sign_extend 32) (currentBit!5942 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10462 () Bool)

(assert (= bs!10462 d!42892))

(assert (=> bs!10462 m!203169))

(assert (=> b!133625 d!42892))

(declare-fun d!42894 () Bool)

(assert (=> d!42894 (= (array_inv!2562 (buf!3156 thiss!1634)) (bvsge (size!2773 (buf!3156 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!133624 d!42894))

(push 1)

(assert (not d!42823))

(assert (not b!133793))

(assert (not b!133849))

(assert (not d!42878))

(assert (not b!133732))

(assert (not d!42884))

(assert (not d!42839))

(assert (not b!133751))

(assert (not b!133795))

(assert (not d!42809))

(assert (not b!133843))

(assert (not b!133719))

(assert (not b!133746))

(assert (not d!42837))

(assert (not b!133742))

(assert (not d!42841))

(assert (not b!133838))

(assert (not d!42803))

(assert (not d!42880))

(assert (not d!42851))

(assert (not d!42788))

(assert (not d!42868))

(assert (not d!42811))

(assert (not b!133745))

(assert (not d!42799))

(assert (not b!133749))

(assert (not b!133798))

(assert (not d!42813))

(assert (not b!133733))

(assert (not d!42866))

(assert (not d!42874))

(assert (not d!42819))

(assert (not b!133791))

(assert (not b!133797))

(assert (not b!133836))

(assert (not d!42853))

(assert (not b!133734))

(assert (not b!133837))

(assert (not b!133748))

(assert (not b!133721))

(assert (not d!42847))

(assert (not d!42796))

(assert (not d!42817))

(assert (not d!42872))

(assert (not b!133792))

(assert (not b!133752))

(assert (not b!133794))

(assert (not b!133735))

(assert (not d!42849))

(assert (not d!42815))

(assert (not d!42805))

(assert (not b!133799))

(assert (not d!42888))

(assert (not b!133845))

(assert (not d!42892))

(assert (not d!42807))

(assert (not d!42790))

(assert (not d!42821))

(assert (not d!42870))

(assert (not b!133796))

(assert (not b!133750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

