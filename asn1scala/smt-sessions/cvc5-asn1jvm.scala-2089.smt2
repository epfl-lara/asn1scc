; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53090 () Bool)

(assert start!53090)

(declare-fun b!245794 () Bool)

(declare-fun e!170282 () Bool)

(declare-fun e!170279 () Bool)

(assert (=> b!245794 (= e!170282 e!170279)))

(declare-fun res!205553 () Bool)

(assert (=> b!245794 (=> (not res!205553) (not e!170279))))

(declare-fun lt!383550 () (_ BitVec 64))

(declare-datatypes ((array!13418 0))(
  ( (array!13419 (arr!6868 (Array (_ BitVec 32) (_ BitVec 8))) (size!5881 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10684 0))(
  ( (BitStream!10685 (buf!6362 array!13418) (currentByte!11758 (_ BitVec 32)) (currentBit!11753 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17874 0))(
  ( (Unit!17875) )
))
(declare-datatypes ((tuple2!21066 0))(
  ( (tuple2!21067 (_1!11455 Unit!17874) (_2!11455 BitStream!10684)) )
))
(declare-fun lt!383542 () tuple2!21066)

(declare-fun lt!383545 () tuple2!21066)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!245794 (= res!205553 (= (bitIndex!0 (size!5881 (buf!6362 (_2!11455 lt!383542))) (currentByte!11758 (_2!11455 lt!383542)) (currentBit!11753 (_2!11455 lt!383542))) (bvadd (bitIndex!0 (size!5881 (buf!6362 (_2!11455 lt!383545))) (currentByte!11758 (_2!11455 lt!383545)) (currentBit!11753 (_2!11455 lt!383545))) lt!383550)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!245794 (= lt!383550 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!245795 () Bool)

(declare-fun e!170285 () Bool)

(declare-fun e!170284 () Bool)

(assert (=> b!245795 (= e!170285 e!170284)))

(declare-fun res!205563 () Bool)

(assert (=> b!245795 (=> res!205563 e!170284)))

(declare-fun thiss!1005 () BitStream!10684)

(assert (=> b!245795 (= res!205563 (not (= (size!5881 (buf!6362 thiss!1005)) (size!5881 (buf!6362 (_2!11455 lt!383542))))))))

(declare-datatypes ((tuple2!21068 0))(
  ( (tuple2!21069 (_1!11456 BitStream!10684) (_2!11456 Bool)) )
))
(declare-fun lt!383544 () tuple2!21068)

(declare-fun lt!383546 () tuple2!21068)

(declare-datatypes ((tuple2!21070 0))(
  ( (tuple2!21071 (_1!11457 BitStream!10684) (_2!11457 BitStream!10684)) )
))
(declare-fun lt!383561 () tuple2!21070)

(assert (=> b!245795 (and (= (_2!11456 lt!383544) (_2!11456 lt!383546)) (= (_1!11456 lt!383544) (_2!11457 lt!383561)))))

(declare-fun b!245796 () Bool)

(declare-fun res!205554 () Bool)

(declare-fun e!170280 () Bool)

(assert (=> b!245796 (=> (not res!205554) (not e!170280))))

(assert (=> b!245796 (= res!205554 (bvslt from!289 nBits!297))))

(declare-fun b!245797 () Bool)

(declare-fun e!170281 () Bool)

(declare-fun lt!383548 () tuple2!21068)

(declare-fun lt!383560 () (_ BitVec 64))

(assert (=> b!245797 (= e!170281 (= (bitIndex!0 (size!5881 (buf!6362 (_1!11456 lt!383548))) (currentByte!11758 (_1!11456 lt!383548)) (currentBit!11753 (_1!11456 lt!383548))) lt!383560))))

(declare-fun b!245798 () Bool)

(declare-fun res!205556 () Bool)

(assert (=> b!245798 (=> (not res!205556) (not e!170279))))

(declare-fun isPrefixOf!0 (BitStream!10684 BitStream!10684) Bool)

(assert (=> b!245798 (= res!205556 (isPrefixOf!0 (_2!11455 lt!383545) (_2!11455 lt!383542)))))

(declare-fun b!245799 () Bool)

(declare-fun e!170275 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245799 (= e!170275 (invariant!0 (currentBit!11753 thiss!1005) (currentByte!11758 thiss!1005) (size!5881 (buf!6362 (_2!11455 lt!383542)))))))

(declare-fun b!245800 () Bool)

(declare-fun e!170277 () Bool)

(declare-fun array_inv!5622 (array!13418) Bool)

(assert (=> b!245800 (= e!170277 (array_inv!5622 (buf!6362 thiss!1005)))))

(declare-fun b!245801 () Bool)

(declare-fun res!205557 () Bool)

(declare-fun e!170283 () Bool)

(assert (=> b!245801 (=> (not res!205557) (not e!170283))))

(assert (=> b!245801 (= res!205557 (isPrefixOf!0 thiss!1005 (_2!11455 lt!383545)))))

(declare-fun b!245802 () Bool)

(declare-fun lt!383562 () tuple2!21068)

(declare-fun lt!383551 () tuple2!21070)

(assert (=> b!245802 (= e!170279 (not (or (not (_2!11456 lt!383562)) (not (= (_1!11456 lt!383562) (_2!11457 lt!383551))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10684 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21068)

(assert (=> b!245802 (= lt!383562 (checkBitsLoopPure!0 (_1!11457 lt!383551) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245802 (validate_offset_bits!1 ((_ sign_extend 32) (size!5881 (buf!6362 (_2!11455 lt!383542)))) ((_ sign_extend 32) (currentByte!11758 (_2!11455 lt!383545))) ((_ sign_extend 32) (currentBit!11753 (_2!11455 lt!383545))) lt!383550)))

(declare-fun lt!383557 () Unit!17874)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10684 array!13418 (_ BitVec 64)) Unit!17874)

(assert (=> b!245802 (= lt!383557 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11455 lt!383545) (buf!6362 (_2!11455 lt!383542)) lt!383550))))

(declare-fun reader!0 (BitStream!10684 BitStream!10684) tuple2!21070)

(assert (=> b!245802 (= lt!383551 (reader!0 (_2!11455 lt!383545) (_2!11455 lt!383542)))))

(declare-fun b!245803 () Bool)

(declare-fun res!205548 () Bool)

(assert (=> b!245803 (=> (not res!205548) (not e!170280))))

(assert (=> b!245803 (= res!205548 (validate_offset_bits!1 ((_ sign_extend 32) (size!5881 (buf!6362 thiss!1005))) ((_ sign_extend 32) (currentByte!11758 thiss!1005)) ((_ sign_extend 32) (currentBit!11753 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!245804 () Bool)

(declare-fun e!170274 () Bool)

(assert (=> b!245804 (= e!170274 e!170283)))

(declare-fun res!205552 () Bool)

(assert (=> b!245804 (=> (not res!205552) (not e!170283))))

(declare-fun lt!383552 () (_ BitVec 64))

(assert (=> b!245804 (= res!205552 (= lt!383560 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!383552)))))

(assert (=> b!245804 (= lt!383560 (bitIndex!0 (size!5881 (buf!6362 (_2!11455 lt!383545))) (currentByte!11758 (_2!11455 lt!383545)) (currentBit!11753 (_2!11455 lt!383545))))))

(assert (=> b!245804 (= lt!383552 (bitIndex!0 (size!5881 (buf!6362 thiss!1005)) (currentByte!11758 thiss!1005) (currentBit!11753 thiss!1005)))))

(declare-fun b!245805 () Bool)

(assert (=> b!245805 (= e!170284 (invariant!0 (currentBit!11753 thiss!1005) (currentByte!11758 thiss!1005) (size!5881 (buf!6362 thiss!1005))))))

(declare-fun res!205555 () Bool)

(assert (=> start!53090 (=> (not res!205555) (not e!170280))))

(assert (=> start!53090 (= res!205555 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53090 e!170280))

(assert (=> start!53090 true))

(declare-fun inv!12 (BitStream!10684) Bool)

(assert (=> start!53090 (and (inv!12 thiss!1005) e!170277)))

(declare-fun b!245806 () Bool)

(declare-fun e!170276 () Bool)

(declare-fun lt!383543 () tuple2!21068)

(declare-fun lt!383541 () tuple2!21068)

(assert (=> b!245806 (= e!170276 (= (_2!11456 lt!383543) (_2!11456 lt!383541)))))

(declare-fun b!245807 () Bool)

(declare-fun res!205551 () Bool)

(assert (=> b!245807 (=> res!205551 e!170285)))

(declare-fun lt!383547 () tuple2!21070)

(declare-fun withMovedBitIndex!0 (BitStream!10684 (_ BitVec 64)) BitStream!10684)

(assert (=> b!245807 (= res!205551 (not (= (_1!11457 lt!383547) (withMovedBitIndex!0 (_1!11457 lt!383561) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!245808 () Bool)

(assert (=> b!245808 (= e!170283 e!170281)))

(declare-fun res!205561 () Bool)

(assert (=> b!245808 (=> (not res!205561) (not e!170281))))

(assert (=> b!245808 (= res!205561 (and (= (_2!11456 lt!383548) bit!26) (= (_1!11456 lt!383548) (_2!11455 lt!383545))))))

(declare-fun readBitPure!0 (BitStream!10684) tuple2!21068)

(declare-fun readerFrom!0 (BitStream!10684 (_ BitVec 32) (_ BitVec 32)) BitStream!10684)

(assert (=> b!245808 (= lt!383548 (readBitPure!0 (readerFrom!0 (_2!11455 lt!383545) (currentBit!11753 thiss!1005) (currentByte!11758 thiss!1005))))))

(declare-fun b!245809 () Bool)

(declare-fun res!205559 () Bool)

(assert (=> b!245809 (=> (not res!205559) (not e!170275))))

(assert (=> b!245809 (= res!205559 (invariant!0 (currentBit!11753 thiss!1005) (currentByte!11758 thiss!1005) (size!5881 (buf!6362 (_2!11455 lt!383545)))))))

(declare-fun b!245810 () Bool)

(assert (=> b!245810 (= e!170280 (not e!170285))))

(declare-fun res!205549 () Bool)

(assert (=> b!245810 (=> res!205549 e!170285)))

(assert (=> b!245810 (= res!205549 (not (= (_1!11456 lt!383546) (_2!11457 lt!383547))))))

(assert (=> b!245810 (= lt!383546 (checkBitsLoopPure!0 (_1!11457 lt!383547) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383555 () (_ BitVec 64))

(assert (=> b!245810 (validate_offset_bits!1 ((_ sign_extend 32) (size!5881 (buf!6362 (_2!11455 lt!383542)))) ((_ sign_extend 32) (currentByte!11758 (_2!11455 lt!383545))) ((_ sign_extend 32) (currentBit!11753 (_2!11455 lt!383545))) lt!383555)))

(declare-fun lt!383556 () Unit!17874)

(assert (=> b!245810 (= lt!383556 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11455 lt!383545) (buf!6362 (_2!11455 lt!383542)) lt!383555))))

(assert (=> b!245810 (= lt!383544 (checkBitsLoopPure!0 (_1!11457 lt!383561) nBits!297 bit!26 from!289))))

(assert (=> b!245810 (validate_offset_bits!1 ((_ sign_extend 32) (size!5881 (buf!6362 (_2!11455 lt!383542)))) ((_ sign_extend 32) (currentByte!11758 thiss!1005)) ((_ sign_extend 32) (currentBit!11753 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!383559 () Unit!17874)

(assert (=> b!245810 (= lt!383559 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6362 (_2!11455 lt!383542)) (bvsub nBits!297 from!289)))))

(assert (=> b!245810 (= (_2!11456 (readBitPure!0 (_1!11457 lt!383561))) bit!26)))

(assert (=> b!245810 (= lt!383547 (reader!0 (_2!11455 lt!383545) (_2!11455 lt!383542)))))

(assert (=> b!245810 (= lt!383561 (reader!0 thiss!1005 (_2!11455 lt!383542)))))

(assert (=> b!245810 e!170276))

(declare-fun res!205550 () Bool)

(assert (=> b!245810 (=> (not res!205550) (not e!170276))))

(assert (=> b!245810 (= res!205550 (= (bitIndex!0 (size!5881 (buf!6362 (_1!11456 lt!383543))) (currentByte!11758 (_1!11456 lt!383543)) (currentBit!11753 (_1!11456 lt!383543))) (bitIndex!0 (size!5881 (buf!6362 (_1!11456 lt!383541))) (currentByte!11758 (_1!11456 lt!383541)) (currentBit!11753 (_1!11456 lt!383541)))))))

(declare-fun lt!383549 () Unit!17874)

(declare-fun lt!383554 () BitStream!10684)

(declare-fun readBitPrefixLemma!0 (BitStream!10684 BitStream!10684) Unit!17874)

(assert (=> b!245810 (= lt!383549 (readBitPrefixLemma!0 lt!383554 (_2!11455 lt!383542)))))

(assert (=> b!245810 (= lt!383541 (readBitPure!0 (BitStream!10685 (buf!6362 (_2!11455 lt!383542)) (currentByte!11758 thiss!1005) (currentBit!11753 thiss!1005))))))

(assert (=> b!245810 (= lt!383543 (readBitPure!0 lt!383554))))

(assert (=> b!245810 (= lt!383554 (BitStream!10685 (buf!6362 (_2!11455 lt!383545)) (currentByte!11758 thiss!1005) (currentBit!11753 thiss!1005)))))

(assert (=> b!245810 e!170275))

(declare-fun res!205562 () Bool)

(assert (=> b!245810 (=> (not res!205562) (not e!170275))))

(assert (=> b!245810 (= res!205562 (isPrefixOf!0 thiss!1005 (_2!11455 lt!383542)))))

(declare-fun lt!383558 () Unit!17874)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10684 BitStream!10684 BitStream!10684) Unit!17874)

(assert (=> b!245810 (= lt!383558 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11455 lt!383545) (_2!11455 lt!383542)))))

(assert (=> b!245810 e!170282))

(declare-fun res!205560 () Bool)

(assert (=> b!245810 (=> (not res!205560) (not e!170282))))

(assert (=> b!245810 (= res!205560 (= (size!5881 (buf!6362 (_2!11455 lt!383545))) (size!5881 (buf!6362 (_2!11455 lt!383542)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10684 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21066)

(assert (=> b!245810 (= lt!383542 (appendNBitsLoop!0 (_2!11455 lt!383545) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245810 (validate_offset_bits!1 ((_ sign_extend 32) (size!5881 (buf!6362 (_2!11455 lt!383545)))) ((_ sign_extend 32) (currentByte!11758 (_2!11455 lt!383545))) ((_ sign_extend 32) (currentBit!11753 (_2!11455 lt!383545))) lt!383555)))

(assert (=> b!245810 (= lt!383555 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!383553 () Unit!17874)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10684 BitStream!10684 (_ BitVec 64) (_ BitVec 64)) Unit!17874)

(assert (=> b!245810 (= lt!383553 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11455 lt!383545) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!245810 e!170274))

(declare-fun res!205558 () Bool)

(assert (=> b!245810 (=> (not res!205558) (not e!170274))))

(assert (=> b!245810 (= res!205558 (= (size!5881 (buf!6362 thiss!1005)) (size!5881 (buf!6362 (_2!11455 lt!383545)))))))

(declare-fun appendBit!0 (BitStream!10684 Bool) tuple2!21066)

(assert (=> b!245810 (= lt!383545 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!53090 res!205555) b!245803))

(assert (= (and b!245803 res!205548) b!245796))

(assert (= (and b!245796 res!205554) b!245810))

(assert (= (and b!245810 res!205558) b!245804))

(assert (= (and b!245804 res!205552) b!245801))

(assert (= (and b!245801 res!205557) b!245808))

(assert (= (and b!245808 res!205561) b!245797))

(assert (= (and b!245810 res!205560) b!245794))

(assert (= (and b!245794 res!205553) b!245798))

(assert (= (and b!245798 res!205556) b!245802))

(assert (= (and b!245810 res!205562) b!245809))

(assert (= (and b!245809 res!205559) b!245799))

(assert (= (and b!245810 res!205550) b!245806))

(assert (= (and b!245810 (not res!205549)) b!245807))

(assert (= (and b!245807 (not res!205551)) b!245795))

(assert (= (and b!245795 (not res!205563)) b!245805))

(assert (= start!53090 b!245800))

(declare-fun m!370733 () Bool)

(assert (=> b!245809 m!370733))

(declare-fun m!370735 () Bool)

(assert (=> b!245801 m!370735))

(declare-fun m!370737 () Bool)

(assert (=> b!245810 m!370737))

(declare-fun m!370739 () Bool)

(assert (=> b!245810 m!370739))

(declare-fun m!370741 () Bool)

(assert (=> b!245810 m!370741))

(declare-fun m!370743 () Bool)

(assert (=> b!245810 m!370743))

(declare-fun m!370745 () Bool)

(assert (=> b!245810 m!370745))

(declare-fun m!370747 () Bool)

(assert (=> b!245810 m!370747))

(declare-fun m!370749 () Bool)

(assert (=> b!245810 m!370749))

(declare-fun m!370751 () Bool)

(assert (=> b!245810 m!370751))

(declare-fun m!370753 () Bool)

(assert (=> b!245810 m!370753))

(declare-fun m!370755 () Bool)

(assert (=> b!245810 m!370755))

(declare-fun m!370757 () Bool)

(assert (=> b!245810 m!370757))

(declare-fun m!370759 () Bool)

(assert (=> b!245810 m!370759))

(declare-fun m!370761 () Bool)

(assert (=> b!245810 m!370761))

(declare-fun m!370763 () Bool)

(assert (=> b!245810 m!370763))

(declare-fun m!370765 () Bool)

(assert (=> b!245810 m!370765))

(declare-fun m!370767 () Bool)

(assert (=> b!245810 m!370767))

(declare-fun m!370769 () Bool)

(assert (=> b!245810 m!370769))

(declare-fun m!370771 () Bool)

(assert (=> b!245810 m!370771))

(declare-fun m!370773 () Bool)

(assert (=> b!245810 m!370773))

(declare-fun m!370775 () Bool)

(assert (=> b!245810 m!370775))

(declare-fun m!370777 () Bool)

(assert (=> b!245797 m!370777))

(declare-fun m!370779 () Bool)

(assert (=> b!245803 m!370779))

(declare-fun m!370781 () Bool)

(assert (=> b!245799 m!370781))

(declare-fun m!370783 () Bool)

(assert (=> b!245804 m!370783))

(declare-fun m!370785 () Bool)

(assert (=> b!245804 m!370785))

(declare-fun m!370787 () Bool)

(assert (=> b!245807 m!370787))

(declare-fun m!370789 () Bool)

(assert (=> b!245808 m!370789))

(assert (=> b!245808 m!370789))

(declare-fun m!370791 () Bool)

(assert (=> b!245808 m!370791))

(declare-fun m!370793 () Bool)

(assert (=> b!245794 m!370793))

(assert (=> b!245794 m!370783))

(declare-fun m!370795 () Bool)

(assert (=> b!245805 m!370795))

(declare-fun m!370797 () Bool)

(assert (=> b!245800 m!370797))

(declare-fun m!370799 () Bool)

(assert (=> b!245798 m!370799))

(declare-fun m!370801 () Bool)

(assert (=> b!245802 m!370801))

(declare-fun m!370803 () Bool)

(assert (=> b!245802 m!370803))

(declare-fun m!370805 () Bool)

(assert (=> b!245802 m!370805))

(assert (=> b!245802 m!370749))

(declare-fun m!370807 () Bool)

(assert (=> start!53090 m!370807))

(push 1)

(assert (not b!245799))

(assert (not b!245800))

(assert (not b!245797))

(assert (not b!245802))

(assert (not b!245807))

(assert (not b!245805))

(assert (not b!245798))

(assert (not b!245809))

(assert (not start!53090))

