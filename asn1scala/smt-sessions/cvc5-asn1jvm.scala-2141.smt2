; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54510 () Bool)

(assert start!54510)

(declare-fun b!254740 () Bool)

(declare-fun e!176508 () Bool)

(declare-datatypes ((array!13756 0))(
  ( (array!13757 (arr!7021 (Array (_ BitVec 32) (_ BitVec 8))) (size!6034 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10990 0))(
  ( (BitStream!10991 (buf!6548 array!13756) (currentByte!12021 (_ BitVec 32)) (currentBit!12016 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21786 0))(
  ( (tuple2!21787 (_1!11827 BitStream!10990) (_2!11827 Bool)) )
))
(declare-fun lt!395543 () tuple2!21786)

(declare-fun lt!395557 () tuple2!21786)

(assert (=> b!254740 (= e!176508 (= (_2!11827 lt!395543) (_2!11827 lt!395557)))))

(declare-fun b!254741 () Bool)

(declare-fun e!176512 () Bool)

(declare-fun e!176511 () Bool)

(assert (=> b!254741 (= e!176512 e!176511)))

(declare-fun res!213453 () Bool)

(assert (=> b!254741 (=> (not res!213453) (not e!176511))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((Unit!18270 0))(
  ( (Unit!18271) )
))
(declare-datatypes ((tuple2!21788 0))(
  ( (tuple2!21789 (_1!11828 Unit!18270) (_2!11828 BitStream!10990)) )
))
(declare-fun lt!395555 () tuple2!21788)

(declare-fun lt!395563 () tuple2!21786)

(assert (=> b!254741 (= res!213453 (and (= (_2!11827 lt!395563) bit!26) (= (_1!11827 lt!395563) (_2!11828 lt!395555))))))

(declare-fun thiss!1005 () BitStream!10990)

(declare-fun readBitPure!0 (BitStream!10990) tuple2!21786)

(declare-fun readerFrom!0 (BitStream!10990 (_ BitVec 32) (_ BitVec 32)) BitStream!10990)

(assert (=> b!254741 (= lt!395563 (readBitPure!0 (readerFrom!0 (_2!11828 lt!395555) (currentBit!12016 thiss!1005) (currentByte!12021 thiss!1005))))))

(declare-fun b!254743 () Bool)

(declare-fun e!176513 () Bool)

(declare-fun lt!395550 () tuple2!21786)

(declare-datatypes ((tuple2!21790 0))(
  ( (tuple2!21791 (_1!11829 BitStream!10990) (_2!11829 BitStream!10990)) )
))
(declare-fun lt!395551 () tuple2!21790)

(assert (=> b!254743 (= e!176513 (not (or (not (_2!11827 lt!395550)) (not (= (_1!11827 lt!395550) (_2!11829 lt!395551))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10990 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21786)

(assert (=> b!254743 (= lt!395550 (checkBitsLoopPure!0 (_1!11829 lt!395551) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!395559 () tuple2!21788)

(declare-fun lt!395544 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!254743 (validate_offset_bits!1 ((_ sign_extend 32) (size!6034 (buf!6548 (_2!11828 lt!395559)))) ((_ sign_extend 32) (currentByte!12021 (_2!11828 lt!395555))) ((_ sign_extend 32) (currentBit!12016 (_2!11828 lt!395555))) lt!395544)))

(declare-fun lt!395561 () Unit!18270)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10990 array!13756 (_ BitVec 64)) Unit!18270)

(assert (=> b!254743 (= lt!395561 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11828 lt!395555) (buf!6548 (_2!11828 lt!395559)) lt!395544))))

(declare-fun reader!0 (BitStream!10990 BitStream!10990) tuple2!21790)

(assert (=> b!254743 (= lt!395551 (reader!0 (_2!11828 lt!395555) (_2!11828 lt!395559)))))

(declare-fun b!254744 () Bool)

(declare-fun e!176510 () Bool)

(declare-fun e!176506 () Bool)

(assert (=> b!254744 (= e!176510 (not e!176506))))

(declare-fun res!213459 () Bool)

(assert (=> b!254744 (=> res!213459 e!176506)))

(declare-fun lt!395565 () tuple2!21786)

(declare-fun lt!395546 () tuple2!21790)

(assert (=> b!254744 (= res!213459 (not (= (_1!11827 lt!395565) (_2!11829 lt!395546))))))

(assert (=> b!254744 (= lt!395565 (checkBitsLoopPure!0 (_1!11829 lt!395546) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!395545 () (_ BitVec 64))

(assert (=> b!254744 (validate_offset_bits!1 ((_ sign_extend 32) (size!6034 (buf!6548 (_2!11828 lt!395559)))) ((_ sign_extend 32) (currentByte!12021 (_2!11828 lt!395555))) ((_ sign_extend 32) (currentBit!12016 (_2!11828 lt!395555))) lt!395545)))

(declare-fun lt!395553 () Unit!18270)

(assert (=> b!254744 (= lt!395553 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11828 lt!395555) (buf!6548 (_2!11828 lt!395559)) lt!395545))))

(declare-fun lt!395547 () tuple2!21790)

(declare-fun lt!395548 () tuple2!21786)

(assert (=> b!254744 (= lt!395548 (checkBitsLoopPure!0 (_1!11829 lt!395547) nBits!297 bit!26 from!289))))

(assert (=> b!254744 (validate_offset_bits!1 ((_ sign_extend 32) (size!6034 (buf!6548 (_2!11828 lt!395559)))) ((_ sign_extend 32) (currentByte!12021 thiss!1005)) ((_ sign_extend 32) (currentBit!12016 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!395558 () Unit!18270)

(assert (=> b!254744 (= lt!395558 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6548 (_2!11828 lt!395559)) (bvsub nBits!297 from!289)))))

(assert (=> b!254744 (= (_2!11827 (readBitPure!0 (_1!11829 lt!395547))) bit!26)))

(assert (=> b!254744 (= lt!395546 (reader!0 (_2!11828 lt!395555) (_2!11828 lt!395559)))))

(assert (=> b!254744 (= lt!395547 (reader!0 thiss!1005 (_2!11828 lt!395559)))))

(assert (=> b!254744 e!176508))

(declare-fun res!213457 () Bool)

(assert (=> b!254744 (=> (not res!213457) (not e!176508))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!254744 (= res!213457 (= (bitIndex!0 (size!6034 (buf!6548 (_1!11827 lt!395543))) (currentByte!12021 (_1!11827 lt!395543)) (currentBit!12016 (_1!11827 lt!395543))) (bitIndex!0 (size!6034 (buf!6548 (_1!11827 lt!395557))) (currentByte!12021 (_1!11827 lt!395557)) (currentBit!12016 (_1!11827 lt!395557)))))))

(declare-fun lt!395552 () Unit!18270)

(declare-fun lt!395554 () BitStream!10990)

(declare-fun readBitPrefixLemma!0 (BitStream!10990 BitStream!10990) Unit!18270)

(assert (=> b!254744 (= lt!395552 (readBitPrefixLemma!0 lt!395554 (_2!11828 lt!395559)))))

(assert (=> b!254744 (= lt!395557 (readBitPure!0 (BitStream!10991 (buf!6548 (_2!11828 lt!395559)) (currentByte!12021 thiss!1005) (currentBit!12016 thiss!1005))))))

(assert (=> b!254744 (= lt!395543 (readBitPure!0 lt!395554))))

(assert (=> b!254744 (= lt!395554 (BitStream!10991 (buf!6548 (_2!11828 lt!395555)) (currentByte!12021 thiss!1005) (currentBit!12016 thiss!1005)))))

(declare-fun e!176514 () Bool)

(assert (=> b!254744 e!176514))

(declare-fun res!213451 () Bool)

(assert (=> b!254744 (=> (not res!213451) (not e!176514))))

(declare-fun isPrefixOf!0 (BitStream!10990 BitStream!10990) Bool)

(assert (=> b!254744 (= res!213451 (isPrefixOf!0 thiss!1005 (_2!11828 lt!395559)))))

(declare-fun lt!395556 () Unit!18270)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10990 BitStream!10990 BitStream!10990) Unit!18270)

(assert (=> b!254744 (= lt!395556 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11828 lt!395555) (_2!11828 lt!395559)))))

(declare-fun e!176509 () Bool)

(assert (=> b!254744 e!176509))

(declare-fun res!213461 () Bool)

(assert (=> b!254744 (=> (not res!213461) (not e!176509))))

(assert (=> b!254744 (= res!213461 (= (size!6034 (buf!6548 (_2!11828 lt!395555))) (size!6034 (buf!6548 (_2!11828 lt!395559)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10990 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21788)

(assert (=> b!254744 (= lt!395559 (appendNBitsLoop!0 (_2!11828 lt!395555) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254744 (validate_offset_bits!1 ((_ sign_extend 32) (size!6034 (buf!6548 (_2!11828 lt!395555)))) ((_ sign_extend 32) (currentByte!12021 (_2!11828 lt!395555))) ((_ sign_extend 32) (currentBit!12016 (_2!11828 lt!395555))) lt!395545)))

(assert (=> b!254744 (= lt!395545 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!395562 () Unit!18270)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10990 BitStream!10990 (_ BitVec 64) (_ BitVec 64)) Unit!18270)

(assert (=> b!254744 (= lt!395562 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11828 lt!395555) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!176505 () Bool)

(assert (=> b!254744 e!176505))

(declare-fun res!213450 () Bool)

(assert (=> b!254744 (=> (not res!213450) (not e!176505))))

(assert (=> b!254744 (= res!213450 (= (size!6034 (buf!6548 thiss!1005)) (size!6034 (buf!6548 (_2!11828 lt!395555)))))))

(declare-fun appendBit!0 (BitStream!10990 Bool) tuple2!21788)

(assert (=> b!254744 (= lt!395555 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!254745 () Bool)

(declare-fun e!176515 () Bool)

(assert (=> b!254745 (= e!176515 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!395560 () (_ BitVec 64))

(assert (=> b!254745 (= lt!395560 (bitIndex!0 (size!6034 (buf!6548 thiss!1005)) (currentByte!12021 thiss!1005) (currentBit!12016 thiss!1005)))))

(declare-fun b!254746 () Bool)

(declare-fun res!213452 () Bool)

(assert (=> b!254746 (=> (not res!213452) (not e!176512))))

(assert (=> b!254746 (= res!213452 (isPrefixOf!0 thiss!1005 (_2!11828 lt!395555)))))

(declare-fun b!254747 () Bool)

(declare-fun lt!395564 () (_ BitVec 64))

(assert (=> b!254747 (= e!176511 (= (bitIndex!0 (size!6034 (buf!6548 (_1!11827 lt!395563))) (currentByte!12021 (_1!11827 lt!395563)) (currentBit!12016 (_1!11827 lt!395563))) lt!395564))))

(declare-fun b!254748 () Bool)

(assert (=> b!254748 (= e!176505 e!176512)))

(declare-fun res!213460 () Bool)

(assert (=> b!254748 (=> (not res!213460) (not e!176512))))

(declare-fun lt!395549 () (_ BitVec 64))

(assert (=> b!254748 (= res!213460 (= lt!395564 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!395549)))))

(assert (=> b!254748 (= lt!395564 (bitIndex!0 (size!6034 (buf!6548 (_2!11828 lt!395555))) (currentByte!12021 (_2!11828 lt!395555)) (currentBit!12016 (_2!11828 lt!395555))))))

(assert (=> b!254748 (= lt!395549 (bitIndex!0 (size!6034 (buf!6548 thiss!1005)) (currentByte!12021 thiss!1005) (currentBit!12016 thiss!1005)))))

(declare-fun b!254749 () Bool)

(declare-fun res!213458 () Bool)

(assert (=> b!254749 (=> (not res!213458) (not e!176514))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254749 (= res!213458 (invariant!0 (currentBit!12016 thiss!1005) (currentByte!12021 thiss!1005) (size!6034 (buf!6548 (_2!11828 lt!395555)))))))

(declare-fun b!254750 () Bool)

(assert (=> b!254750 (= e!176509 e!176513)))

(declare-fun res!213447 () Bool)

(assert (=> b!254750 (=> (not res!213447) (not e!176513))))

(assert (=> b!254750 (= res!213447 (= (bitIndex!0 (size!6034 (buf!6548 (_2!11828 lt!395559))) (currentByte!12021 (_2!11828 lt!395559)) (currentBit!12016 (_2!11828 lt!395559))) (bvadd (bitIndex!0 (size!6034 (buf!6548 (_2!11828 lt!395555))) (currentByte!12021 (_2!11828 lt!395555)) (currentBit!12016 (_2!11828 lt!395555))) lt!395544)))))

(assert (=> b!254750 (= lt!395544 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!254751 () Bool)

(declare-fun e!176507 () Bool)

(declare-fun array_inv!5775 (array!13756) Bool)

(assert (=> b!254751 (= e!176507 (array_inv!5775 (buf!6548 thiss!1005)))))

(declare-fun b!254752 () Bool)

(assert (=> b!254752 (= e!176506 e!176515)))

(declare-fun res!213448 () Bool)

(assert (=> b!254752 (=> res!213448 e!176515)))

(assert (=> b!254752 (= res!213448 (not (= (size!6034 (buf!6548 thiss!1005)) (size!6034 (buf!6548 (_2!11828 lt!395559))))))))

(assert (=> b!254752 (and (= (_2!11827 lt!395548) (_2!11827 lt!395565)) (= (_1!11827 lt!395548) (_2!11829 lt!395547)))))

(declare-fun res!213454 () Bool)

(assert (=> start!54510 (=> (not res!213454) (not e!176510))))

(assert (=> start!54510 (= res!213454 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54510 e!176510))

(assert (=> start!54510 true))

(declare-fun inv!12 (BitStream!10990) Bool)

(assert (=> start!54510 (and (inv!12 thiss!1005) e!176507)))

(declare-fun b!254742 () Bool)

(declare-fun res!213456 () Bool)

(assert (=> b!254742 (=> res!213456 e!176506)))

(declare-fun withMovedBitIndex!0 (BitStream!10990 (_ BitVec 64)) BitStream!10990)

(assert (=> b!254742 (= res!213456 (not (= (_1!11829 lt!395546) (withMovedBitIndex!0 (_1!11829 lt!395547) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!254753 () Bool)

(declare-fun res!213449 () Bool)

(assert (=> b!254753 (=> (not res!213449) (not e!176510))))

(assert (=> b!254753 (= res!213449 (validate_offset_bits!1 ((_ sign_extend 32) (size!6034 (buf!6548 thiss!1005))) ((_ sign_extend 32) (currentByte!12021 thiss!1005)) ((_ sign_extend 32) (currentBit!12016 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!254754 () Bool)

(declare-fun res!213462 () Bool)

(assert (=> b!254754 (=> (not res!213462) (not e!176510))))

(assert (=> b!254754 (= res!213462 (bvslt from!289 nBits!297))))

(declare-fun b!254755 () Bool)

(assert (=> b!254755 (= e!176514 (invariant!0 (currentBit!12016 thiss!1005) (currentByte!12021 thiss!1005) (size!6034 (buf!6548 (_2!11828 lt!395559)))))))

(declare-fun b!254756 () Bool)

(declare-fun res!213455 () Bool)

(assert (=> b!254756 (=> (not res!213455) (not e!176513))))

(assert (=> b!254756 (= res!213455 (isPrefixOf!0 (_2!11828 lt!395555) (_2!11828 lt!395559)))))

(assert (= (and start!54510 res!213454) b!254753))

(assert (= (and b!254753 res!213449) b!254754))

(assert (= (and b!254754 res!213462) b!254744))

(assert (= (and b!254744 res!213450) b!254748))

(assert (= (and b!254748 res!213460) b!254746))

(assert (= (and b!254746 res!213452) b!254741))

(assert (= (and b!254741 res!213453) b!254747))

(assert (= (and b!254744 res!213461) b!254750))

(assert (= (and b!254750 res!213447) b!254756))

(assert (= (and b!254756 res!213455) b!254743))

(assert (= (and b!254744 res!213451) b!254749))

(assert (= (and b!254749 res!213458) b!254755))

(assert (= (and b!254744 res!213457) b!254740))

(assert (= (and b!254744 (not res!213459)) b!254742))

(assert (= (and b!254742 (not res!213456)) b!254752))

(assert (= (and b!254752 (not res!213448)) b!254745))

(assert (= start!54510 b!254751))

(declare-fun m!383679 () Bool)

(assert (=> b!254743 m!383679))

(declare-fun m!383681 () Bool)

(assert (=> b!254743 m!383681))

(declare-fun m!383683 () Bool)

(assert (=> b!254743 m!383683))

(declare-fun m!383685 () Bool)

(assert (=> b!254743 m!383685))

(declare-fun m!383687 () Bool)

(assert (=> b!254753 m!383687))

(declare-fun m!383689 () Bool)

(assert (=> start!54510 m!383689))

(declare-fun m!383691 () Bool)

(assert (=> b!254749 m!383691))

(declare-fun m!383693 () Bool)

(assert (=> b!254748 m!383693))

(declare-fun m!383695 () Bool)

(assert (=> b!254748 m!383695))

(declare-fun m!383697 () Bool)

(assert (=> b!254746 m!383697))

(declare-fun m!383699 () Bool)

(assert (=> b!254741 m!383699))

(assert (=> b!254741 m!383699))

(declare-fun m!383701 () Bool)

(assert (=> b!254741 m!383701))

(assert (=> b!254745 m!383695))

(declare-fun m!383703 () Bool)

(assert (=> b!254742 m!383703))

(declare-fun m!383705 () Bool)

(assert (=> b!254755 m!383705))

(declare-fun m!383707 () Bool)

(assert (=> b!254756 m!383707))

(declare-fun m!383709 () Bool)

(assert (=> b!254750 m!383709))

(assert (=> b!254750 m!383693))

(declare-fun m!383711 () Bool)

(assert (=> b!254747 m!383711))

(declare-fun m!383713 () Bool)

(assert (=> b!254751 m!383713))

(assert (=> b!254744 m!383685))

(declare-fun m!383715 () Bool)

(assert (=> b!254744 m!383715))

(declare-fun m!383717 () Bool)

(assert (=> b!254744 m!383717))

(declare-fun m!383719 () Bool)

(assert (=> b!254744 m!383719))

(declare-fun m!383721 () Bool)

(assert (=> b!254744 m!383721))

(declare-fun m!383723 () Bool)

(assert (=> b!254744 m!383723))

(declare-fun m!383725 () Bool)

(assert (=> b!254744 m!383725))

(declare-fun m!383727 () Bool)

(assert (=> b!254744 m!383727))

(declare-fun m!383729 () Bool)

(assert (=> b!254744 m!383729))

(declare-fun m!383731 () Bool)

(assert (=> b!254744 m!383731))

(declare-fun m!383733 () Bool)

(assert (=> b!254744 m!383733))

(declare-fun m!383735 () Bool)

(assert (=> b!254744 m!383735))

(declare-fun m!383737 () Bool)

(assert (=> b!254744 m!383737))

(declare-fun m!383739 () Bool)

(assert (=> b!254744 m!383739))

(declare-fun m!383741 () Bool)

(assert (=> b!254744 m!383741))

(declare-fun m!383743 () Bool)

(assert (=> b!254744 m!383743))

(declare-fun m!383745 () Bool)

(assert (=> b!254744 m!383745))

(declare-fun m!383747 () Bool)

(assert (=> b!254744 m!383747))

(declare-fun m!383749 () Bool)

(assert (=> b!254744 m!383749))

(declare-fun m!383751 () Bool)

(assert (=> b!254744 m!383751))

(push 1)

(assert (not b!254755))

(assert (not start!54510))

(assert (not b!254748))

(assert (not b!254745))

(assert (not b!254753))

(assert (not b!254742))

(assert (not b!254744))

(assert (not b!254751))

(assert (not b!254743))

(assert (not b!254750))

(assert (not b!254741))

(assert (not b!254746))

(assert (not b!254749))

(assert (not b!254747))

(assert (not b!254756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

