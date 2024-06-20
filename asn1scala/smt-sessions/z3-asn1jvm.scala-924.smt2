; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25944 () Bool)

(assert start!25944)

(declare-fun b!132685 () Bool)

(declare-fun res!110194 () Bool)

(declare-fun e!87986 () Bool)

(assert (=> b!132685 (=> (not res!110194) (not e!87986))))

(declare-datatypes ((array!6114 0))(
  ( (array!6115 (arr!3403 (Array (_ BitVec 32) (_ BitVec 8))) (size!2768 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4800 0))(
  ( (BitStream!4801 (buf!3141 array!6114) (currentByte!5926 (_ BitVec 32)) (currentBit!5921 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4800)

(declare-datatypes ((Unit!8168 0))(
  ( (Unit!8169) )
))
(declare-datatypes ((tuple2!11520 0))(
  ( (tuple2!11521 (_1!6066 Unit!8168) (_2!6066 BitStream!4800)) )
))
(declare-fun lt!204854 () tuple2!11520)

(declare-fun isPrefixOf!0 (BitStream!4800 BitStream!4800) Bool)

(assert (=> b!132685 (= res!110194 (isPrefixOf!0 thiss!1634 (_2!6066 lt!204854)))))

(declare-fun b!132686 () Bool)

(declare-fun res!110200 () Bool)

(declare-fun e!87987 () Bool)

(assert (=> b!132686 (=> (not res!110200) (not e!87987))))

(declare-fun lt!204867 () tuple2!11520)

(assert (=> b!132686 (= res!110200 (isPrefixOf!0 (_2!6066 lt!204854) (_2!6066 lt!204867)))))

(declare-fun res!110189 () Bool)

(declare-fun e!87981 () Bool)

(assert (=> start!25944 (=> (not res!110189) (not e!87981))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6114)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25944 (= res!110189 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2768 arr!237))))))

(assert (=> start!25944 e!87981))

(assert (=> start!25944 true))

(declare-fun array_inv!2557 (array!6114) Bool)

(assert (=> start!25944 (array_inv!2557 arr!237)))

(declare-fun e!87989 () Bool)

(declare-fun inv!12 (BitStream!4800) Bool)

(assert (=> start!25944 (and (inv!12 thiss!1634) e!87989)))

(declare-fun b!132687 () Bool)

(assert (=> b!132687 (= e!87989 (array_inv!2557 (buf!3141 thiss!1634)))))

(declare-datatypes ((tuple2!11522 0))(
  ( (tuple2!11523 (_1!6067 BitStream!4800) (_2!6067 array!6114)) )
))
(declare-fun lt!204853 () tuple2!11522)

(declare-fun e!87982 () Bool)

(declare-fun b!132688 () Bool)

(declare-fun arrayRangesEq!171 (array!6114 array!6114 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132688 (= e!87982 (not (arrayRangesEq!171 arr!237 (_2!6067 lt!204853) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132689 () Bool)

(declare-fun e!87984 () Bool)

(assert (=> b!132689 (= e!87984 e!87987)))

(declare-fun res!110196 () Bool)

(assert (=> b!132689 (=> (not res!110196) (not e!87987))))

(declare-fun lt!204852 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132689 (= res!110196 (= (bitIndex!0 (size!2768 (buf!3141 (_2!6066 lt!204867))) (currentByte!5926 (_2!6066 lt!204867)) (currentBit!5921 (_2!6066 lt!204867))) (bvadd (bitIndex!0 (size!2768 (buf!3141 (_2!6066 lt!204854))) (currentByte!5926 (_2!6066 lt!204854)) (currentBit!5921 (_2!6066 lt!204854))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!204852))))))

(assert (=> b!132689 (= lt!204852 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!132690 () Bool)

(declare-fun res!110199 () Bool)

(assert (=> b!132690 (=> (not res!110199) (not e!87981))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132690 (= res!110199 (invariant!0 (currentBit!5921 thiss!1634) (currentByte!5926 thiss!1634) (size!2768 (buf!3141 thiss!1634))))))

(declare-fun b!132691 () Bool)

(declare-fun e!87980 () Bool)

(declare-datatypes ((tuple2!11524 0))(
  ( (tuple2!11525 (_1!6068 BitStream!4800) (_2!6068 (_ BitVec 8))) )
))
(declare-fun lt!204861 () tuple2!11524)

(declare-fun lt!204868 () tuple2!11524)

(assert (=> b!132691 (= e!87980 (= (_2!6068 lt!204861) (_2!6068 lt!204868)))))

(declare-fun b!132692 () Bool)

(assert (=> b!132692 (= e!87981 (not (bvsle #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!204864 () tuple2!11522)

(declare-fun lt!204855 () tuple2!11522)

(assert (=> b!132692 (arrayRangesEq!171 (_2!6067 lt!204864) (_2!6067 lt!204855) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!204860 () Unit!8168)

(declare-datatypes ((tuple2!11526 0))(
  ( (tuple2!11527 (_1!6069 BitStream!4800) (_2!6069 BitStream!4800)) )
))
(declare-fun lt!204863 () tuple2!11526)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4800 array!6114 (_ BitVec 32) (_ BitVec 32)) Unit!8168)

(assert (=> b!132692 (= lt!204860 (readByteArrayLoopArrayPrefixLemma!0 (_1!6069 lt!204863) arr!237 from!447 to!404))))

(declare-fun lt!204869 () array!6114)

(declare-fun readByteArrayLoopPure!0 (BitStream!4800 array!6114 (_ BitVec 32) (_ BitVec 32)) tuple2!11522)

(declare-fun withMovedByteIndex!0 (BitStream!4800 (_ BitVec 32)) BitStream!4800)

(assert (=> b!132692 (= lt!204855 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6069 lt!204863) #b00000000000000000000000000000001) lt!204869 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204857 () tuple2!11526)

(declare-fun lt!204873 () tuple2!11522)

(assert (=> b!132692 (= lt!204873 (readByteArrayLoopPure!0 (_1!6069 lt!204857) lt!204869 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204865 () tuple2!11524)

(assert (=> b!132692 (= lt!204869 (array!6115 (store (arr!3403 arr!237) from!447 (_2!6068 lt!204865)) (size!2768 arr!237)))))

(declare-fun lt!204870 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132692 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2768 (buf!3141 (_2!6066 lt!204867)))) ((_ sign_extend 32) (currentByte!5926 (_2!6066 lt!204854))) ((_ sign_extend 32) (currentBit!5921 (_2!6066 lt!204854))) lt!204870)))

(declare-fun lt!204866 () Unit!8168)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4800 array!6114 (_ BitVec 32)) Unit!8168)

(assert (=> b!132692 (= lt!204866 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6066 lt!204854) (buf!3141 (_2!6066 lt!204867)) lt!204870))))

(assert (=> b!132692 (= (_1!6067 lt!204864) (_2!6069 lt!204863))))

(assert (=> b!132692 (= lt!204864 (readByteArrayLoopPure!0 (_1!6069 lt!204863) arr!237 from!447 to!404))))

(assert (=> b!132692 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2768 (buf!3141 (_2!6066 lt!204867)))) ((_ sign_extend 32) (currentByte!5926 thiss!1634)) ((_ sign_extend 32) (currentBit!5921 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!204874 () Unit!8168)

(assert (=> b!132692 (= lt!204874 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3141 (_2!6066 lt!204867)) (bvsub to!404 from!447)))))

(assert (=> b!132692 (= (_2!6068 lt!204865) (select (arr!3403 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4800) tuple2!11524)

(assert (=> b!132692 (= lt!204865 (readBytePure!0 (_1!6069 lt!204863)))))

(declare-fun reader!0 (BitStream!4800 BitStream!4800) tuple2!11526)

(assert (=> b!132692 (= lt!204857 (reader!0 (_2!6066 lt!204854) (_2!6066 lt!204867)))))

(assert (=> b!132692 (= lt!204863 (reader!0 thiss!1634 (_2!6066 lt!204867)))))

(assert (=> b!132692 e!87980))

(declare-fun res!110198 () Bool)

(assert (=> b!132692 (=> (not res!110198) (not e!87980))))

(assert (=> b!132692 (= res!110198 (= (bitIndex!0 (size!2768 (buf!3141 (_1!6068 lt!204861))) (currentByte!5926 (_1!6068 lt!204861)) (currentBit!5921 (_1!6068 lt!204861))) (bitIndex!0 (size!2768 (buf!3141 (_1!6068 lt!204868))) (currentByte!5926 (_1!6068 lt!204868)) (currentBit!5921 (_1!6068 lt!204868)))))))

(declare-fun lt!204851 () Unit!8168)

(declare-fun lt!204875 () BitStream!4800)

(declare-fun readBytePrefixLemma!0 (BitStream!4800 BitStream!4800) Unit!8168)

(assert (=> b!132692 (= lt!204851 (readBytePrefixLemma!0 lt!204875 (_2!6066 lt!204867)))))

(assert (=> b!132692 (= lt!204868 (readBytePure!0 (BitStream!4801 (buf!3141 (_2!6066 lt!204867)) (currentByte!5926 thiss!1634) (currentBit!5921 thiss!1634))))))

(assert (=> b!132692 (= lt!204861 (readBytePure!0 lt!204875))))

(assert (=> b!132692 (= lt!204875 (BitStream!4801 (buf!3141 (_2!6066 lt!204854)) (currentByte!5926 thiss!1634) (currentBit!5921 thiss!1634)))))

(declare-fun e!87983 () Bool)

(assert (=> b!132692 e!87983))

(declare-fun res!110191 () Bool)

(assert (=> b!132692 (=> (not res!110191) (not e!87983))))

(assert (=> b!132692 (= res!110191 (isPrefixOf!0 thiss!1634 (_2!6066 lt!204867)))))

(declare-fun lt!204872 () Unit!8168)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4800 BitStream!4800 BitStream!4800) Unit!8168)

(assert (=> b!132692 (= lt!204872 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6066 lt!204854) (_2!6066 lt!204867)))))

(assert (=> b!132692 e!87984))

(declare-fun res!110190 () Bool)

(assert (=> b!132692 (=> (not res!110190) (not e!87984))))

(assert (=> b!132692 (= res!110190 (= (size!2768 (buf!3141 (_2!6066 lt!204854))) (size!2768 (buf!3141 (_2!6066 lt!204867)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4800 array!6114 (_ BitVec 32) (_ BitVec 32)) tuple2!11520)

(assert (=> b!132692 (= lt!204867 (appendByteArrayLoop!0 (_2!6066 lt!204854) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132692 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2768 (buf!3141 (_2!6066 lt!204854)))) ((_ sign_extend 32) (currentByte!5926 (_2!6066 lt!204854))) ((_ sign_extend 32) (currentBit!5921 (_2!6066 lt!204854))) lt!204870)))

(assert (=> b!132692 (= lt!204870 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!204858 () Unit!8168)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4800 BitStream!4800 (_ BitVec 64) (_ BitVec 32)) Unit!8168)

(assert (=> b!132692 (= lt!204858 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6066 lt!204854) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132692 e!87986))

(declare-fun res!110192 () Bool)

(assert (=> b!132692 (=> (not res!110192) (not e!87986))))

(assert (=> b!132692 (= res!110192 (= (size!2768 (buf!3141 thiss!1634)) (size!2768 (buf!3141 (_2!6066 lt!204854)))))))

(declare-fun appendByte!0 (BitStream!4800 (_ BitVec 8)) tuple2!11520)

(assert (=> b!132692 (= lt!204854 (appendByte!0 thiss!1634 (select (arr!3403 arr!237) from!447)))))

(declare-fun b!132693 () Bool)

(declare-fun res!110195 () Bool)

(assert (=> b!132693 (=> (not res!110195) (not e!87981))))

(assert (=> b!132693 (= res!110195 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2768 (buf!3141 thiss!1634))) ((_ sign_extend 32) (currentByte!5926 thiss!1634)) ((_ sign_extend 32) (currentBit!5921 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132694 () Bool)

(assert (=> b!132694 (= e!87987 (not e!87982))))

(declare-fun res!110188 () Bool)

(assert (=> b!132694 (=> res!110188 e!87982)))

(declare-fun lt!204859 () tuple2!11526)

(assert (=> b!132694 (= res!110188 (or (not (= (size!2768 (_2!6067 lt!204853)) (size!2768 arr!237))) (not (= (_1!6067 lt!204853) (_2!6069 lt!204859)))))))

(assert (=> b!132694 (= lt!204853 (readByteArrayLoopPure!0 (_1!6069 lt!204859) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132694 (validate_offset_bits!1 ((_ sign_extend 32) (size!2768 (buf!3141 (_2!6066 lt!204867)))) ((_ sign_extend 32) (currentByte!5926 (_2!6066 lt!204854))) ((_ sign_extend 32) (currentBit!5921 (_2!6066 lt!204854))) lt!204852)))

(declare-fun lt!204862 () Unit!8168)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4800 array!6114 (_ BitVec 64)) Unit!8168)

(assert (=> b!132694 (= lt!204862 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6066 lt!204854) (buf!3141 (_2!6066 lt!204867)) lt!204852))))

(assert (=> b!132694 (= lt!204859 (reader!0 (_2!6066 lt!204854) (_2!6066 lt!204867)))))

(declare-fun b!132695 () Bool)

(declare-fun lt!204871 () tuple2!11524)

(declare-fun lt!204856 () tuple2!11526)

(assert (=> b!132695 (= e!87986 (and (= (_2!6068 lt!204871) (select (arr!3403 arr!237) from!447)) (= (_1!6068 lt!204871) (_2!6069 lt!204856))))))

(assert (=> b!132695 (= lt!204871 (readBytePure!0 (_1!6069 lt!204856)))))

(assert (=> b!132695 (= lt!204856 (reader!0 thiss!1634 (_2!6066 lt!204854)))))

(declare-fun b!132696 () Bool)

(declare-fun res!110193 () Bool)

(assert (=> b!132696 (=> (not res!110193) (not e!87981))))

(assert (=> b!132696 (= res!110193 (bvslt from!447 to!404))))

(declare-fun b!132697 () Bool)

(declare-fun res!110197 () Bool)

(assert (=> b!132697 (=> (not res!110197) (not e!87986))))

(assert (=> b!132697 (= res!110197 (= (bitIndex!0 (size!2768 (buf!3141 (_2!6066 lt!204854))) (currentByte!5926 (_2!6066 lt!204854)) (currentBit!5921 (_2!6066 lt!204854))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2768 (buf!3141 thiss!1634)) (currentByte!5926 thiss!1634) (currentBit!5921 thiss!1634)))))))

(declare-fun b!132698 () Bool)

(assert (=> b!132698 (= e!87983 (invariant!0 (currentBit!5921 thiss!1634) (currentByte!5926 thiss!1634) (size!2768 (buf!3141 (_2!6066 lt!204854)))))))

(assert (= (and start!25944 res!110189) b!132693))

(assert (= (and b!132693 res!110195) b!132696))

(assert (= (and b!132696 res!110193) b!132690))

(assert (= (and b!132690 res!110199) b!132692))

(assert (= (and b!132692 res!110192) b!132697))

(assert (= (and b!132697 res!110197) b!132685))

(assert (= (and b!132685 res!110194) b!132695))

(assert (= (and b!132692 res!110190) b!132689))

(assert (= (and b!132689 res!110196) b!132686))

(assert (= (and b!132686 res!110200) b!132694))

(assert (= (and b!132694 (not res!110188)) b!132688))

(assert (= (and b!132692 res!110191) b!132698))

(assert (= (and b!132692 res!110198) b!132691))

(assert (= start!25944 b!132687))

(declare-fun m!200541 () Bool)

(assert (=> b!132689 m!200541))

(declare-fun m!200543 () Bool)

(assert (=> b!132689 m!200543))

(declare-fun m!200545 () Bool)

(assert (=> start!25944 m!200545))

(declare-fun m!200547 () Bool)

(assert (=> start!25944 m!200547))

(declare-fun m!200549 () Bool)

(assert (=> b!132687 m!200549))

(declare-fun m!200551 () Bool)

(assert (=> b!132686 m!200551))

(declare-fun m!200553 () Bool)

(assert (=> b!132693 m!200553))

(assert (=> b!132697 m!200543))

(declare-fun m!200555 () Bool)

(assert (=> b!132697 m!200555))

(declare-fun m!200557 () Bool)

(assert (=> b!132692 m!200557))

(declare-fun m!200559 () Bool)

(assert (=> b!132692 m!200559))

(declare-fun m!200561 () Bool)

(assert (=> b!132692 m!200561))

(declare-fun m!200563 () Bool)

(assert (=> b!132692 m!200563))

(declare-fun m!200565 () Bool)

(assert (=> b!132692 m!200565))

(declare-fun m!200567 () Bool)

(assert (=> b!132692 m!200567))

(declare-fun m!200569 () Bool)

(assert (=> b!132692 m!200569))

(declare-fun m!200571 () Bool)

(assert (=> b!132692 m!200571))

(declare-fun m!200573 () Bool)

(assert (=> b!132692 m!200573))

(declare-fun m!200575 () Bool)

(assert (=> b!132692 m!200575))

(declare-fun m!200577 () Bool)

(assert (=> b!132692 m!200577))

(assert (=> b!132692 m!200563))

(declare-fun m!200579 () Bool)

(assert (=> b!132692 m!200579))

(declare-fun m!200581 () Bool)

(assert (=> b!132692 m!200581))

(declare-fun m!200583 () Bool)

(assert (=> b!132692 m!200583))

(declare-fun m!200585 () Bool)

(assert (=> b!132692 m!200585))

(declare-fun m!200587 () Bool)

(assert (=> b!132692 m!200587))

(declare-fun m!200589 () Bool)

(assert (=> b!132692 m!200589))

(declare-fun m!200591 () Bool)

(assert (=> b!132692 m!200591))

(declare-fun m!200593 () Bool)

(assert (=> b!132692 m!200593))

(declare-fun m!200595 () Bool)

(assert (=> b!132692 m!200595))

(declare-fun m!200597 () Bool)

(assert (=> b!132692 m!200597))

(declare-fun m!200599 () Bool)

(assert (=> b!132692 m!200599))

(declare-fun m!200601 () Bool)

(assert (=> b!132692 m!200601))

(declare-fun m!200603 () Bool)

(assert (=> b!132692 m!200603))

(declare-fun m!200605 () Bool)

(assert (=> b!132692 m!200605))

(declare-fun m!200607 () Bool)

(assert (=> b!132692 m!200607))

(assert (=> b!132692 m!200601))

(declare-fun m!200609 () Bool)

(assert (=> b!132688 m!200609))

(assert (=> b!132695 m!200601))

(declare-fun m!200611 () Bool)

(assert (=> b!132695 m!200611))

(declare-fun m!200613 () Bool)

(assert (=> b!132695 m!200613))

(declare-fun m!200615 () Bool)

(assert (=> b!132685 m!200615))

(declare-fun m!200617 () Bool)

(assert (=> b!132698 m!200617))

(declare-fun m!200619 () Bool)

(assert (=> b!132694 m!200619))

(declare-fun m!200621 () Bool)

(assert (=> b!132694 m!200621))

(declare-fun m!200623 () Bool)

(assert (=> b!132694 m!200623))

(assert (=> b!132694 m!200573))

(declare-fun m!200625 () Bool)

(assert (=> b!132690 m!200625))

(check-sat (not b!132692) (not b!132685) (not start!25944) (not b!132689) (not b!132687) (not b!132693) (not b!132686) (not b!132690) (not b!132698) (not b!132695) (not b!132688) (not b!132697) (not b!132694))
(check-sat)
