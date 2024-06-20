; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26382 () Bool)

(assert start!26382)

(declare-fun b!135471 () Bool)

(declare-fun res!112683 () Bool)

(declare-fun e!89936 () Bool)

(assert (=> b!135471 (=> (not res!112683) (not e!89936))))

(declare-datatypes ((array!6182 0))(
  ( (array!6183 (arr!3464 (Array (_ BitVec 32) (_ BitVec 8))) (size!2799 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4862 0))(
  ( (BitStream!4863 (buf!3192 array!6182) (currentByte!5989 (_ BitVec 32)) (currentBit!5984 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8436 0))(
  ( (Unit!8437) )
))
(declare-datatypes ((tuple2!11788 0))(
  ( (tuple2!11789 (_1!6210 Unit!8436) (_2!6210 BitStream!4862)) )
))
(declare-fun lt!210306 () tuple2!11788)

(declare-fun thiss!1634 () BitStream!4862)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135471 (= res!112683 (= (bitIndex!0 (size!2799 (buf!3192 (_2!6210 lt!210306))) (currentByte!5989 (_2!6210 lt!210306)) (currentBit!5984 (_2!6210 lt!210306))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2799 (buf!3192 thiss!1634)) (currentByte!5989 thiss!1634) (currentBit!5984 thiss!1634)))))))

(declare-fun b!135472 () Bool)

(declare-fun e!89944 () Bool)

(declare-datatypes ((tuple2!11790 0))(
  ( (tuple2!11791 (_1!6211 BitStream!4862) (_2!6211 (_ BitVec 8))) )
))
(declare-fun lt!210295 () tuple2!11790)

(declare-fun lt!210297 () tuple2!11790)

(assert (=> b!135472 (= e!89944 (= (_2!6211 lt!210295) (_2!6211 lt!210297)))))

(declare-fun res!112674 () Bool)

(declare-fun e!89945 () Bool)

(assert (=> start!26382 (=> (not res!112674) (not e!89945))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6182)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!26382 (= res!112674 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2799 arr!237))))))

(assert (=> start!26382 e!89945))

(assert (=> start!26382 true))

(declare-fun array_inv!2588 (array!6182) Bool)

(assert (=> start!26382 (array_inv!2588 arr!237)))

(declare-fun e!89940 () Bool)

(declare-fun inv!12 (BitStream!4862) Bool)

(assert (=> start!26382 (and (inv!12 thiss!1634) e!89940)))

(declare-fun b!135473 () Bool)

(assert (=> b!135473 (= e!89940 (array_inv!2588 (buf!3192 thiss!1634)))))

(declare-fun b!135474 () Bool)

(declare-fun res!112682 () Bool)

(assert (=> b!135474 (=> (not res!112682) (not e!89945))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135474 (= res!112682 (invariant!0 (currentBit!5984 thiss!1634) (currentByte!5989 thiss!1634) (size!2799 (buf!3192 thiss!1634))))))

(declare-fun b!135475 () Bool)

(declare-fun res!112677 () Bool)

(declare-fun e!89939 () Bool)

(assert (=> b!135475 (=> (not res!112677) (not e!89939))))

(declare-fun lt!210302 () tuple2!11788)

(declare-fun isPrefixOf!0 (BitStream!4862 BitStream!4862) Bool)

(assert (=> b!135475 (= res!112677 (isPrefixOf!0 (_2!6210 lt!210306) (_2!6210 lt!210302)))))

(declare-fun b!135476 () Bool)

(declare-fun e!89941 () Bool)

(assert (=> b!135476 (= e!89939 (not e!89941))))

(declare-fun res!112676 () Bool)

(assert (=> b!135476 (=> res!112676 e!89941)))

(declare-datatypes ((tuple2!11792 0))(
  ( (tuple2!11793 (_1!6212 BitStream!4862) (_2!6212 array!6182)) )
))
(declare-fun lt!210284 () tuple2!11792)

(declare-datatypes ((tuple2!11794 0))(
  ( (tuple2!11795 (_1!6213 BitStream!4862) (_2!6213 BitStream!4862)) )
))
(declare-fun lt!210304 () tuple2!11794)

(assert (=> b!135476 (= res!112676 (or (not (= (size!2799 (_2!6212 lt!210284)) (size!2799 arr!237))) (not (= (_1!6212 lt!210284) (_2!6213 lt!210304)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4862 array!6182 (_ BitVec 32) (_ BitVec 32)) tuple2!11792)

(assert (=> b!135476 (= lt!210284 (readByteArrayLoopPure!0 (_1!6213 lt!210304) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210286 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135476 (validate_offset_bits!1 ((_ sign_extend 32) (size!2799 (buf!3192 (_2!6210 lt!210302)))) ((_ sign_extend 32) (currentByte!5989 (_2!6210 lt!210306))) ((_ sign_extend 32) (currentBit!5984 (_2!6210 lt!210306))) lt!210286)))

(declare-fun lt!210283 () Unit!8436)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4862 array!6182 (_ BitVec 64)) Unit!8436)

(assert (=> b!135476 (= lt!210283 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6210 lt!210306) (buf!3192 (_2!6210 lt!210302)) lt!210286))))

(declare-fun reader!0 (BitStream!4862 BitStream!4862) tuple2!11794)

(assert (=> b!135476 (= lt!210304 (reader!0 (_2!6210 lt!210306) (_2!6210 lt!210302)))))

(declare-fun b!135477 () Bool)

(declare-fun res!112679 () Bool)

(assert (=> b!135477 (=> (not res!112679) (not e!89936))))

(assert (=> b!135477 (= res!112679 (isPrefixOf!0 thiss!1634 (_2!6210 lt!210306)))))

(declare-fun b!135478 () Bool)

(declare-fun e!89942 () Bool)

(assert (=> b!135478 (= e!89942 e!89939)))

(declare-fun res!112673 () Bool)

(assert (=> b!135478 (=> (not res!112673) (not e!89939))))

(assert (=> b!135478 (= res!112673 (= (bitIndex!0 (size!2799 (buf!3192 (_2!6210 lt!210302))) (currentByte!5989 (_2!6210 lt!210302)) (currentBit!5984 (_2!6210 lt!210302))) (bvadd (bitIndex!0 (size!2799 (buf!3192 (_2!6210 lt!210306))) (currentByte!5989 (_2!6210 lt!210306)) (currentBit!5984 (_2!6210 lt!210306))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!210286))))))

(assert (=> b!135478 (= lt!210286 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!210285 () tuple2!11794)

(declare-fun lt!210301 () tuple2!11790)

(declare-fun b!135479 () Bool)

(assert (=> b!135479 (= e!89936 (and (= (_2!6211 lt!210301) (select (arr!3464 arr!237) from!447)) (= (_1!6211 lt!210301) (_2!6213 lt!210285))))))

(declare-fun readBytePure!0 (BitStream!4862) tuple2!11790)

(assert (=> b!135479 (= lt!210301 (readBytePure!0 (_1!6213 lt!210285)))))

(assert (=> b!135479 (= lt!210285 (reader!0 thiss!1634 (_2!6210 lt!210306)))))

(declare-fun b!135480 () Bool)

(declare-fun arrayRangesEq!202 (array!6182 array!6182 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135480 (= e!89941 (not (arrayRangesEq!202 arr!237 (_2!6212 lt!210284) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135481 () Bool)

(declare-fun e!89937 () Bool)

(assert (=> b!135481 (= e!89937 true)))

(declare-fun lt!210294 () tuple2!11792)

(declare-fun lt!210293 () tuple2!11792)

(assert (=> b!135481 (arrayRangesEq!202 (_2!6212 lt!210294) (_2!6212 lt!210293) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210299 () Unit!8436)

(declare-fun arrayRangesEqSymmetricLemma!15 (array!6182 array!6182 (_ BitVec 32) (_ BitVec 32)) Unit!8436)

(assert (=> b!135481 (= lt!210299 (arrayRangesEqSymmetricLemma!15 (_2!6212 lt!210293) (_2!6212 lt!210294) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135482 () Bool)

(declare-fun res!112681 () Bool)

(assert (=> b!135482 (=> (not res!112681) (not e!89945))))

(assert (=> b!135482 (= res!112681 (bvslt from!447 to!404))))

(declare-fun b!135483 () Bool)

(declare-fun e!89943 () Bool)

(assert (=> b!135483 (= e!89943 (invariant!0 (currentBit!5984 thiss!1634) (currentByte!5989 thiss!1634) (size!2799 (buf!3192 (_2!6210 lt!210306)))))))

(declare-fun b!135484 () Bool)

(assert (=> b!135484 (= e!89945 (not e!89937))))

(declare-fun res!112685 () Bool)

(assert (=> b!135484 (=> res!112685 e!89937)))

(assert (=> b!135484 (= res!112685 (not (arrayRangesEq!202 (_2!6212 lt!210293) (_2!6212 lt!210294) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!210303 () tuple2!11792)

(assert (=> b!135484 (arrayRangesEq!202 (_2!6212 lt!210293) (_2!6212 lt!210303) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210289 () tuple2!11794)

(declare-fun lt!210282 () Unit!8436)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4862 array!6182 (_ BitVec 32) (_ BitVec 32)) Unit!8436)

(assert (=> b!135484 (= lt!210282 (readByteArrayLoopArrayPrefixLemma!0 (_1!6213 lt!210289) arr!237 from!447 to!404))))

(declare-fun lt!210296 () array!6182)

(declare-fun withMovedByteIndex!0 (BitStream!4862 (_ BitVec 32)) BitStream!4862)

(assert (=> b!135484 (= lt!210303 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6213 lt!210289) #b00000000000000000000000000000001) lt!210296 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210287 () tuple2!11794)

(assert (=> b!135484 (= lt!210294 (readByteArrayLoopPure!0 (_1!6213 lt!210287) lt!210296 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210290 () tuple2!11790)

(assert (=> b!135484 (= lt!210296 (array!6183 (store (arr!3464 arr!237) from!447 (_2!6211 lt!210290)) (size!2799 arr!237)))))

(declare-fun lt!210298 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135484 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2799 (buf!3192 (_2!6210 lt!210302)))) ((_ sign_extend 32) (currentByte!5989 (_2!6210 lt!210306))) ((_ sign_extend 32) (currentBit!5984 (_2!6210 lt!210306))) lt!210298)))

(declare-fun lt!210307 () Unit!8436)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4862 array!6182 (_ BitVec 32)) Unit!8436)

(assert (=> b!135484 (= lt!210307 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6210 lt!210306) (buf!3192 (_2!6210 lt!210302)) lt!210298))))

(assert (=> b!135484 (= (_1!6212 lt!210293) (_2!6213 lt!210289))))

(assert (=> b!135484 (= lt!210293 (readByteArrayLoopPure!0 (_1!6213 lt!210289) arr!237 from!447 to!404))))

(assert (=> b!135484 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2799 (buf!3192 (_2!6210 lt!210302)))) ((_ sign_extend 32) (currentByte!5989 thiss!1634)) ((_ sign_extend 32) (currentBit!5984 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!210305 () Unit!8436)

(assert (=> b!135484 (= lt!210305 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3192 (_2!6210 lt!210302)) (bvsub to!404 from!447)))))

(assert (=> b!135484 (= (_2!6211 lt!210290) (select (arr!3464 arr!237) from!447))))

(assert (=> b!135484 (= lt!210290 (readBytePure!0 (_1!6213 lt!210289)))))

(assert (=> b!135484 (= lt!210287 (reader!0 (_2!6210 lt!210306) (_2!6210 lt!210302)))))

(assert (=> b!135484 (= lt!210289 (reader!0 thiss!1634 (_2!6210 lt!210302)))))

(assert (=> b!135484 e!89944))

(declare-fun res!112678 () Bool)

(assert (=> b!135484 (=> (not res!112678) (not e!89944))))

(assert (=> b!135484 (= res!112678 (= (bitIndex!0 (size!2799 (buf!3192 (_1!6211 lt!210295))) (currentByte!5989 (_1!6211 lt!210295)) (currentBit!5984 (_1!6211 lt!210295))) (bitIndex!0 (size!2799 (buf!3192 (_1!6211 lt!210297))) (currentByte!5989 (_1!6211 lt!210297)) (currentBit!5984 (_1!6211 lt!210297)))))))

(declare-fun lt!210300 () Unit!8436)

(declare-fun lt!210288 () BitStream!4862)

(declare-fun readBytePrefixLemma!0 (BitStream!4862 BitStream!4862) Unit!8436)

(assert (=> b!135484 (= lt!210300 (readBytePrefixLemma!0 lt!210288 (_2!6210 lt!210302)))))

(assert (=> b!135484 (= lt!210297 (readBytePure!0 (BitStream!4863 (buf!3192 (_2!6210 lt!210302)) (currentByte!5989 thiss!1634) (currentBit!5984 thiss!1634))))))

(assert (=> b!135484 (= lt!210295 (readBytePure!0 lt!210288))))

(assert (=> b!135484 (= lt!210288 (BitStream!4863 (buf!3192 (_2!6210 lt!210306)) (currentByte!5989 thiss!1634) (currentBit!5984 thiss!1634)))))

(assert (=> b!135484 e!89943))

(declare-fun res!112684 () Bool)

(assert (=> b!135484 (=> (not res!112684) (not e!89943))))

(assert (=> b!135484 (= res!112684 (isPrefixOf!0 thiss!1634 (_2!6210 lt!210302)))))

(declare-fun lt!210291 () Unit!8436)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4862 BitStream!4862 BitStream!4862) Unit!8436)

(assert (=> b!135484 (= lt!210291 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6210 lt!210306) (_2!6210 lt!210302)))))

(assert (=> b!135484 e!89942))

(declare-fun res!112675 () Bool)

(assert (=> b!135484 (=> (not res!112675) (not e!89942))))

(assert (=> b!135484 (= res!112675 (= (size!2799 (buf!3192 (_2!6210 lt!210306))) (size!2799 (buf!3192 (_2!6210 lt!210302)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4862 array!6182 (_ BitVec 32) (_ BitVec 32)) tuple2!11788)

(assert (=> b!135484 (= lt!210302 (appendByteArrayLoop!0 (_2!6210 lt!210306) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135484 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2799 (buf!3192 (_2!6210 lt!210306)))) ((_ sign_extend 32) (currentByte!5989 (_2!6210 lt!210306))) ((_ sign_extend 32) (currentBit!5984 (_2!6210 lt!210306))) lt!210298)))

(assert (=> b!135484 (= lt!210298 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!210292 () Unit!8436)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4862 BitStream!4862 (_ BitVec 64) (_ BitVec 32)) Unit!8436)

(assert (=> b!135484 (= lt!210292 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6210 lt!210306) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135484 e!89936))

(declare-fun res!112680 () Bool)

(assert (=> b!135484 (=> (not res!112680) (not e!89936))))

(assert (=> b!135484 (= res!112680 (= (size!2799 (buf!3192 thiss!1634)) (size!2799 (buf!3192 (_2!6210 lt!210306)))))))

(declare-fun appendByte!0 (BitStream!4862 (_ BitVec 8)) tuple2!11788)

(assert (=> b!135484 (= lt!210306 (appendByte!0 thiss!1634 (select (arr!3464 arr!237) from!447)))))

(declare-fun b!135485 () Bool)

(declare-fun res!112686 () Bool)

(assert (=> b!135485 (=> (not res!112686) (not e!89945))))

(assert (=> b!135485 (= res!112686 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2799 (buf!3192 thiss!1634))) ((_ sign_extend 32) (currentByte!5989 thiss!1634)) ((_ sign_extend 32) (currentBit!5984 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!26382 res!112674) b!135485))

(assert (= (and b!135485 res!112686) b!135482))

(assert (= (and b!135482 res!112681) b!135474))

(assert (= (and b!135474 res!112682) b!135484))

(assert (= (and b!135484 res!112680) b!135471))

(assert (= (and b!135471 res!112683) b!135477))

(assert (= (and b!135477 res!112679) b!135479))

(assert (= (and b!135484 res!112675) b!135478))

(assert (= (and b!135478 res!112673) b!135475))

(assert (= (and b!135475 res!112677) b!135476))

(assert (= (and b!135476 (not res!112676)) b!135480))

(assert (= (and b!135484 res!112684) b!135483))

(assert (= (and b!135484 res!112678) b!135472))

(assert (= (and b!135484 (not res!112685)) b!135481))

(assert (= start!26382 b!135473))

(declare-fun m!206687 () Bool)

(assert (=> b!135485 m!206687))

(declare-fun m!206689 () Bool)

(assert (=> b!135475 m!206689))

(declare-fun m!206691 () Bool)

(assert (=> b!135483 m!206691))

(declare-fun m!206693 () Bool)

(assert (=> b!135484 m!206693))

(declare-fun m!206695 () Bool)

(assert (=> b!135484 m!206695))

(declare-fun m!206697 () Bool)

(assert (=> b!135484 m!206697))

(declare-fun m!206699 () Bool)

(assert (=> b!135484 m!206699))

(declare-fun m!206701 () Bool)

(assert (=> b!135484 m!206701))

(declare-fun m!206703 () Bool)

(assert (=> b!135484 m!206703))

(declare-fun m!206705 () Bool)

(assert (=> b!135484 m!206705))

(declare-fun m!206707 () Bool)

(assert (=> b!135484 m!206707))

(declare-fun m!206709 () Bool)

(assert (=> b!135484 m!206709))

(declare-fun m!206711 () Bool)

(assert (=> b!135484 m!206711))

(declare-fun m!206713 () Bool)

(assert (=> b!135484 m!206713))

(declare-fun m!206715 () Bool)

(assert (=> b!135484 m!206715))

(declare-fun m!206717 () Bool)

(assert (=> b!135484 m!206717))

(declare-fun m!206719 () Bool)

(assert (=> b!135484 m!206719))

(declare-fun m!206721 () Bool)

(assert (=> b!135484 m!206721))

(assert (=> b!135484 m!206715))

(declare-fun m!206723 () Bool)

(assert (=> b!135484 m!206723))

(declare-fun m!206725 () Bool)

(assert (=> b!135484 m!206725))

(declare-fun m!206727 () Bool)

(assert (=> b!135484 m!206727))

(declare-fun m!206729 () Bool)

(assert (=> b!135484 m!206729))

(declare-fun m!206731 () Bool)

(assert (=> b!135484 m!206731))

(declare-fun m!206733 () Bool)

(assert (=> b!135484 m!206733))

(declare-fun m!206735 () Bool)

(assert (=> b!135484 m!206735))

(declare-fun m!206737 () Bool)

(assert (=> b!135484 m!206737))

(declare-fun m!206739 () Bool)

(assert (=> b!135484 m!206739))

(declare-fun m!206741 () Bool)

(assert (=> b!135484 m!206741))

(declare-fun m!206743 () Bool)

(assert (=> b!135484 m!206743))

(assert (=> b!135484 m!206713))

(declare-fun m!206745 () Bool)

(assert (=> b!135484 m!206745))

(declare-fun m!206747 () Bool)

(assert (=> start!26382 m!206747))

(declare-fun m!206749 () Bool)

(assert (=> start!26382 m!206749))

(declare-fun m!206751 () Bool)

(assert (=> b!135477 m!206751))

(declare-fun m!206753 () Bool)

(assert (=> b!135476 m!206753))

(declare-fun m!206755 () Bool)

(assert (=> b!135476 m!206755))

(declare-fun m!206757 () Bool)

(assert (=> b!135476 m!206757))

(assert (=> b!135476 m!206743))

(declare-fun m!206759 () Bool)

(assert (=> b!135481 m!206759))

(declare-fun m!206761 () Bool)

(assert (=> b!135481 m!206761))

(assert (=> b!135479 m!206713))

(declare-fun m!206763 () Bool)

(assert (=> b!135479 m!206763))

(declare-fun m!206765 () Bool)

(assert (=> b!135479 m!206765))

(declare-fun m!206767 () Bool)

(assert (=> b!135474 m!206767))

(declare-fun m!206769 () Bool)

(assert (=> b!135480 m!206769))

(declare-fun m!206771 () Bool)

(assert (=> b!135471 m!206771))

(declare-fun m!206773 () Bool)

(assert (=> b!135471 m!206773))

(declare-fun m!206775 () Bool)

(assert (=> b!135478 m!206775))

(assert (=> b!135478 m!206771))

(declare-fun m!206777 () Bool)

(assert (=> b!135473 m!206777))

(push 1)

(assert (not b!135483))

(assert (not b!135485))

(assert (not b!135479))

(assert (not b!135484))

(assert (not b!135475))

(assert (not b!135471))

(assert (not b!135474))

(assert (not b!135478))

(assert (not b!135476))

(assert (not b!135477))

(assert (not start!26382))

(assert (not b!135481))

(assert (not b!135480))

(assert (not b!135473))

(check-sat)

