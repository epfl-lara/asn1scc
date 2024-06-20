; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54314 () Bool)

(assert start!54314)

(declare-fun b!253754 () Bool)

(declare-fun res!212623 () Bool)

(declare-fun e!175835 () Bool)

(assert (=> b!253754 (=> (not res!212623) (not e!175835))))

(declare-datatypes ((array!13749 0))(
  ( (array!13750 (arr!7019 (Array (_ BitVec 32) (_ BitVec 8))) (size!6032 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10986 0))(
  ( (BitStream!10987 (buf!6540 array!13749) (currentByte!12004 (_ BitVec 32)) (currentBit!11999 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10986)

(declare-datatypes ((Unit!18239 0))(
  ( (Unit!18240) )
))
(declare-datatypes ((tuple2!21768 0))(
  ( (tuple2!21769 (_1!11815 Unit!18239) (_2!11815 BitStream!10986)) )
))
(declare-fun lt!394055 () tuple2!21768)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253754 (= res!212623 (invariant!0 (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005) (size!6032 (buf!6540 (_2!11815 lt!394055)))))))

(declare-fun b!253755 () Bool)

(declare-fun e!175837 () Bool)

(declare-fun e!175839 () Bool)

(assert (=> b!253755 (= e!175837 e!175839)))

(declare-fun res!212629 () Bool)

(assert (=> b!253755 (=> (not res!212629) (not e!175839))))

(declare-fun lt!394065 () tuple2!21768)

(declare-fun lt!394059 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!253755 (= res!212629 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065))) (bvadd (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))) lt!394059)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!253755 (= lt!394059 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!253756 () Bool)

(declare-fun e!175840 () Bool)

(declare-fun array_inv!5773 (array!13749) Bool)

(assert (=> b!253756 (= e!175840 (array_inv!5773 (buf!6540 thiss!1005)))))

(declare-fun b!253757 () Bool)

(declare-datatypes ((tuple2!21770 0))(
  ( (tuple2!21771 (_1!11816 BitStream!10986) (_2!11816 Bool)) )
))
(declare-fun lt!394053 () tuple2!21770)

(declare-datatypes ((tuple2!21772 0))(
  ( (tuple2!21773 (_1!11817 BitStream!10986) (_2!11817 BitStream!10986)) )
))
(declare-fun lt!394057 () tuple2!21772)

(assert (=> b!253757 (= e!175839 (not (or (not (_2!11816 lt!394053)) (not (= (_1!11816 lt!394053) (_2!11817 lt!394057))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10986 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21770)

(assert (=> b!253757 (= lt!394053 (checkBitsLoopPure!0 (_1!11817 lt!394057) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!253757 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394059)))

(declare-fun lt!394046 () Unit!18239)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10986 array!13749 (_ BitVec 64)) Unit!18239)

(assert (=> b!253757 (= lt!394046 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394065)) lt!394059))))

(declare-fun reader!0 (BitStream!10986 BitStream!10986) tuple2!21772)

(assert (=> b!253757 (= lt!394057 (reader!0 (_2!11815 lt!394055) (_2!11815 lt!394065)))))

(declare-fun b!253758 () Bool)

(declare-fun res!212636 () Bool)

(declare-fun e!175832 () Bool)

(assert (=> b!253758 (=> (not res!212636) (not e!175832))))

(assert (=> b!253758 (= res!212636 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!253759 () Bool)

(declare-fun res!212625 () Bool)

(declare-fun e!175833 () Bool)

(assert (=> b!253759 (=> res!212625 e!175833)))

(declare-fun lt!394049 () tuple2!21772)

(declare-fun lt!394044 () tuple2!21772)

(declare-fun withMovedBitIndex!0 (BitStream!10986 (_ BitVec 64)) BitStream!10986)

(assert (=> b!253759 (= res!212625 (not (= (_1!11817 lt!394049) (withMovedBitIndex!0 (_1!11817 lt!394044) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!253760 () Bool)

(declare-fun res!212633 () Bool)

(assert (=> b!253760 (=> (not res!212633) (not e!175839))))

(declare-fun isPrefixOf!0 (BitStream!10986 BitStream!10986) Bool)

(assert (=> b!253760 (= res!212633 (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 lt!394065)))))

(declare-fun b!253761 () Bool)

(declare-fun e!175836 () Bool)

(declare-fun e!175834 () Bool)

(assert (=> b!253761 (= e!175836 e!175834)))

(declare-fun res!212627 () Bool)

(assert (=> b!253761 (=> (not res!212627) (not e!175834))))

(declare-fun lt!394054 () tuple2!21770)

(assert (=> b!253761 (= res!212627 (and (= (_2!11816 lt!394054) bit!26) (= (_1!11816 lt!394054) (_2!11815 lt!394055))))))

(declare-fun readBitPure!0 (BitStream!10986) tuple2!21770)

(declare-fun readerFrom!0 (BitStream!10986 (_ BitVec 32) (_ BitVec 32)) BitStream!10986)

(assert (=> b!253761 (= lt!394054 (readBitPure!0 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))))

(declare-fun b!253763 () Bool)

(declare-fun res!212635 () Bool)

(assert (=> b!253763 (=> (not res!212635) (not e!175832))))

(assert (=> b!253763 (= res!212635 (bvslt from!289 nBits!297))))

(declare-fun b!253764 () Bool)

(declare-fun lt!394061 () (_ BitVec 64))

(assert (=> b!253764 (= e!175834 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394054))) (currentByte!12004 (_1!11816 lt!394054)) (currentBit!11999 (_1!11816 lt!394054))) lt!394061))))

(declare-fun b!253765 () Bool)

(declare-fun lt!394062 () tuple2!21770)

(assert (=> b!253765 (= e!175833 (= (_1!11816 lt!394062) (_2!11817 lt!394044)))))

(declare-fun lt!394045 () tuple2!21770)

(assert (=> b!253765 (= (_2!11816 lt!394062) (_2!11816 lt!394045))))

(declare-fun b!253766 () Bool)

(declare-fun res!212624 () Bool)

(assert (=> b!253766 (=> (not res!212624) (not e!175836))))

(assert (=> b!253766 (= res!212624 (isPrefixOf!0 thiss!1005 (_2!11815 lt!394055)))))

(declare-fun b!253767 () Bool)

(assert (=> b!253767 (= e!175832 (not e!175833))))

(declare-fun res!212628 () Bool)

(assert (=> b!253767 (=> res!212628 e!175833)))

(assert (=> b!253767 (= res!212628 (not (= (_1!11816 lt!394045) (_2!11817 lt!394049))))))

(assert (=> b!253767 (= lt!394045 (checkBitsLoopPure!0 (_1!11817 lt!394049) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!394056 () (_ BitVec 64))

(assert (=> b!253767 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394056)))

(declare-fun lt!394051 () Unit!18239)

(assert (=> b!253767 (= lt!394051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394065)) lt!394056))))

(assert (=> b!253767 (= lt!394062 (checkBitsLoopPure!0 (_1!11817 lt!394044) nBits!297 bit!26 from!289))))

(assert (=> b!253767 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!394064 () Unit!18239)

(assert (=> b!253767 (= lt!394064 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6540 (_2!11815 lt!394065)) (bvsub nBits!297 from!289)))))

(assert (=> b!253767 (= (_2!11816 (readBitPure!0 (_1!11817 lt!394044))) bit!26)))

(assert (=> b!253767 (= lt!394049 (reader!0 (_2!11815 lt!394055) (_2!11815 lt!394065)))))

(assert (=> b!253767 (= lt!394044 (reader!0 thiss!1005 (_2!11815 lt!394065)))))

(declare-fun e!175841 () Bool)

(assert (=> b!253767 e!175841))

(declare-fun res!212634 () Bool)

(assert (=> b!253767 (=> (not res!212634) (not e!175841))))

(declare-fun lt!394058 () tuple2!21770)

(declare-fun lt!394063 () tuple2!21770)

(assert (=> b!253767 (= res!212634 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394058))) (currentByte!12004 (_1!11816 lt!394058)) (currentBit!11999 (_1!11816 lt!394058))) (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394063))) (currentByte!12004 (_1!11816 lt!394063)) (currentBit!11999 (_1!11816 lt!394063)))))))

(declare-fun lt!394047 () Unit!18239)

(declare-fun lt!394052 () BitStream!10986)

(declare-fun readBitPrefixLemma!0 (BitStream!10986 BitStream!10986) Unit!18239)

(assert (=> b!253767 (= lt!394047 (readBitPrefixLemma!0 lt!394052 (_2!11815 lt!394065)))))

(assert (=> b!253767 (= lt!394063 (readBitPure!0 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(assert (=> b!253767 (= lt!394058 (readBitPure!0 lt!394052))))

(assert (=> b!253767 (= lt!394052 (BitStream!10987 (buf!6540 (_2!11815 lt!394055)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))

(assert (=> b!253767 e!175835))

(declare-fun res!212637 () Bool)

(assert (=> b!253767 (=> (not res!212637) (not e!175835))))

(assert (=> b!253767 (= res!212637 (isPrefixOf!0 thiss!1005 (_2!11815 lt!394065)))))

(declare-fun lt!394050 () Unit!18239)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10986 BitStream!10986 BitStream!10986) Unit!18239)

(assert (=> b!253767 (= lt!394050 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11815 lt!394055) (_2!11815 lt!394065)))))

(assert (=> b!253767 e!175837))

(declare-fun res!212631 () Bool)

(assert (=> b!253767 (=> (not res!212631) (not e!175837))))

(assert (=> b!253767 (= res!212631 (= (size!6032 (buf!6540 (_2!11815 lt!394055))) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10986 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21768)

(assert (=> b!253767 (= lt!394065 (appendNBitsLoop!0 (_2!11815 lt!394055) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253767 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394056)))

(assert (=> b!253767 (= lt!394056 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!394060 () Unit!18239)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10986 BitStream!10986 (_ BitVec 64) (_ BitVec 64)) Unit!18239)

(assert (=> b!253767 (= lt!394060 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11815 lt!394055) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!175831 () Bool)

(assert (=> b!253767 e!175831))

(declare-fun res!212632 () Bool)

(assert (=> b!253767 (=> (not res!212632) (not e!175831))))

(assert (=> b!253767 (= res!212632 (= (size!6032 (buf!6540 thiss!1005)) (size!6032 (buf!6540 (_2!11815 lt!394055)))))))

(declare-fun appendBit!0 (BitStream!10986 Bool) tuple2!21768)

(assert (=> b!253767 (= lt!394055 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!253768 () Bool)

(assert (=> b!253768 (= e!175835 (invariant!0 (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(declare-fun b!253769 () Bool)

(assert (=> b!253769 (= e!175841 (= (_2!11816 lt!394058) (_2!11816 lt!394063)))))

(declare-fun res!212630 () Bool)

(assert (=> start!54314 (=> (not res!212630) (not e!175832))))

(assert (=> start!54314 (= res!212630 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54314 e!175832))

(assert (=> start!54314 true))

(declare-fun inv!12 (BitStream!10986) Bool)

(assert (=> start!54314 (and (inv!12 thiss!1005) e!175840)))

(declare-fun b!253762 () Bool)

(assert (=> b!253762 (= e!175831 e!175836)))

(declare-fun res!212626 () Bool)

(assert (=> b!253762 (=> (not res!212626) (not e!175836))))

(declare-fun lt!394048 () (_ BitVec 64))

(assert (=> b!253762 (= res!212626 (= lt!394061 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!394048)))))

(assert (=> b!253762 (= lt!394061 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))))))

(assert (=> b!253762 (= lt!394048 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))

(assert (= (and start!54314 res!212630) b!253758))

(assert (= (and b!253758 res!212636) b!253763))

(assert (= (and b!253763 res!212635) b!253767))

(assert (= (and b!253767 res!212632) b!253762))

(assert (= (and b!253762 res!212626) b!253766))

(assert (= (and b!253766 res!212624) b!253761))

(assert (= (and b!253761 res!212627) b!253764))

(assert (= (and b!253767 res!212631) b!253755))

(assert (= (and b!253755 res!212629) b!253760))

(assert (= (and b!253760 res!212633) b!253757))

(assert (= (and b!253767 res!212637) b!253754))

(assert (= (and b!253754 res!212623) b!253768))

(assert (= (and b!253767 res!212634) b!253769))

(assert (= (and b!253767 (not res!212628)) b!253759))

(assert (= (and b!253759 (not res!212625)) b!253765))

(assert (= start!54314 b!253756))

(declare-fun m!382007 () Bool)

(assert (=> b!253757 m!382007))

(declare-fun m!382009 () Bool)

(assert (=> b!253757 m!382009))

(declare-fun m!382011 () Bool)

(assert (=> b!253757 m!382011))

(declare-fun m!382013 () Bool)

(assert (=> b!253757 m!382013))

(declare-fun m!382015 () Bool)

(assert (=> b!253755 m!382015))

(declare-fun m!382017 () Bool)

(assert (=> b!253755 m!382017))

(declare-fun m!382019 () Bool)

(assert (=> b!253766 m!382019))

(declare-fun m!382021 () Bool)

(assert (=> b!253761 m!382021))

(assert (=> b!253761 m!382021))

(declare-fun m!382023 () Bool)

(assert (=> b!253761 m!382023))

(declare-fun m!382025 () Bool)

(assert (=> b!253760 m!382025))

(declare-fun m!382027 () Bool)

(assert (=> b!253767 m!382027))

(declare-fun m!382029 () Bool)

(assert (=> b!253767 m!382029))

(declare-fun m!382031 () Bool)

(assert (=> b!253767 m!382031))

(declare-fun m!382033 () Bool)

(assert (=> b!253767 m!382033))

(declare-fun m!382035 () Bool)

(assert (=> b!253767 m!382035))

(declare-fun m!382037 () Bool)

(assert (=> b!253767 m!382037))

(declare-fun m!382039 () Bool)

(assert (=> b!253767 m!382039))

(declare-fun m!382041 () Bool)

(assert (=> b!253767 m!382041))

(declare-fun m!382043 () Bool)

(assert (=> b!253767 m!382043))

(assert (=> b!253767 m!382013))

(declare-fun m!382045 () Bool)

(assert (=> b!253767 m!382045))

(declare-fun m!382047 () Bool)

(assert (=> b!253767 m!382047))

(declare-fun m!382049 () Bool)

(assert (=> b!253767 m!382049))

(declare-fun m!382051 () Bool)

(assert (=> b!253767 m!382051))

(declare-fun m!382053 () Bool)

(assert (=> b!253767 m!382053))

(declare-fun m!382055 () Bool)

(assert (=> b!253767 m!382055))

(declare-fun m!382057 () Bool)

(assert (=> b!253767 m!382057))

(declare-fun m!382059 () Bool)

(assert (=> b!253767 m!382059))

(declare-fun m!382061 () Bool)

(assert (=> b!253767 m!382061))

(declare-fun m!382063 () Bool)

(assert (=> b!253767 m!382063))

(declare-fun m!382065 () Bool)

(assert (=> start!54314 m!382065))

(declare-fun m!382067 () Bool)

(assert (=> b!253759 m!382067))

(declare-fun m!382069 () Bool)

(assert (=> b!253768 m!382069))

(declare-fun m!382071 () Bool)

(assert (=> b!253764 m!382071))

(declare-fun m!382073 () Bool)

(assert (=> b!253754 m!382073))

(assert (=> b!253762 m!382017))

(declare-fun m!382075 () Bool)

(assert (=> b!253762 m!382075))

(declare-fun m!382077 () Bool)

(assert (=> b!253756 m!382077))

(declare-fun m!382079 () Bool)

(assert (=> b!253758 m!382079))

(check-sat (not b!253756) (not b!253762) (not b!253766) (not b!253764) (not b!253760) (not b!253767) (not b!253758) (not b!253757) (not b!253755) (not b!253761) (not b!253759) (not start!54314) (not b!253768) (not b!253754))
(check-sat)
(get-model)

(declare-fun d!84976 () Bool)

(declare-fun e!175877 () Bool)

(assert (=> d!84976 e!175877))

(declare-fun res!212685 () Bool)

(assert (=> d!84976 (=> (not res!212685) (not e!175877))))

(declare-fun lt!394137 () (_ BitVec 64))

(declare-fun lt!394136 () BitStream!10986)

(assert (=> d!84976 (= res!212685 (= (bvadd lt!394137 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6032 (buf!6540 lt!394136)) (currentByte!12004 lt!394136) (currentBit!11999 lt!394136))))))

(assert (=> d!84976 (or (not (= (bvand lt!394137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394137 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84976 (= lt!394137 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)) (currentBit!11999 (_1!11817 lt!394044))))))

(declare-fun moveBitIndex!0 (BitStream!10986 (_ BitVec 64)) tuple2!21768)

(assert (=> d!84976 (= lt!394136 (_2!11815 (moveBitIndex!0 (_1!11817 lt!394044) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10986 (_ BitVec 64)) Bool)

(assert (=> d!84976 (moveBitIndexPrecond!0 (_1!11817 lt!394044) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!84976 (= (withMovedBitIndex!0 (_1!11817 lt!394044) #b0000000000000000000000000000000000000000000000000000000000000001) lt!394136)))

(declare-fun b!253820 () Bool)

(assert (=> b!253820 (= e!175877 (= (size!6032 (buf!6540 (_1!11817 lt!394044))) (size!6032 (buf!6540 lt!394136))))))

(assert (= (and d!84976 res!212685) b!253820))

(declare-fun m!382155 () Bool)

(assert (=> d!84976 m!382155))

(declare-fun m!382157 () Bool)

(assert (=> d!84976 m!382157))

(declare-fun m!382159 () Bool)

(assert (=> d!84976 m!382159))

(declare-fun m!382161 () Bool)

(assert (=> d!84976 m!382161))

(assert (=> b!253759 d!84976))

(declare-fun d!84978 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!84978 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21488 () Bool)

(assert (= bs!21488 d!84978))

(declare-fun m!382163 () Bool)

(assert (=> bs!21488 m!382163))

(assert (=> b!253758 d!84978))

(declare-fun d!84980 () Bool)

(assert (=> d!84980 (= (invariant!0 (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005) (size!6032 (buf!6540 (_2!11815 lt!394065)))) (and (bvsge (currentBit!11999 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11999 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12004 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12004 thiss!1005) (size!6032 (buf!6540 (_2!11815 lt!394065)))) (and (= (currentBit!11999 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12004 thiss!1005) (size!6032 (buf!6540 (_2!11815 lt!394065))))))))))

(assert (=> b!253768 d!84980))

(declare-fun d!84982 () Bool)

(assert (=> d!84982 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005) (size!6032 (buf!6540 thiss!1005))))))

(declare-fun bs!21489 () Bool)

(assert (= bs!21489 d!84982))

(declare-fun m!382165 () Bool)

(assert (=> bs!21489 m!382165))

(assert (=> start!54314 d!84982))

(declare-datatypes ((tuple2!21780 0))(
  ( (tuple2!21781 (_1!11821 Bool) (_2!11821 BitStream!10986)) )
))
(declare-fun lt!394140 () tuple2!21780)

(declare-fun d!84984 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10986 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21780)

(assert (=> d!84984 (= lt!394140 (checkBitsLoop!0 (_1!11817 lt!394057) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84984 (= (checkBitsLoopPure!0 (_1!11817 lt!394057) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21771 (_2!11821 lt!394140) (_1!11821 lt!394140)))))

(declare-fun bs!21490 () Bool)

(assert (= bs!21490 d!84984))

(declare-fun m!382167 () Bool)

(assert (=> bs!21490 m!382167))

(assert (=> b!253757 d!84984))

(declare-fun d!84986 () Bool)

(assert (=> d!84986 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394059) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055)))) lt!394059))))

(declare-fun bs!21491 () Bool)

(assert (= bs!21491 d!84986))

(declare-fun m!382169 () Bool)

(assert (=> bs!21491 m!382169))

(assert (=> b!253757 d!84986))

(declare-fun d!84988 () Bool)

(assert (=> d!84988 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394059)))

(declare-fun lt!394143 () Unit!18239)

(declare-fun choose!9 (BitStream!10986 array!13749 (_ BitVec 64) BitStream!10986) Unit!18239)

(assert (=> d!84988 (= lt!394143 (choose!9 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394065)) lt!394059 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(assert (=> d!84988 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394065)) lt!394059) lt!394143)))

(declare-fun bs!21492 () Bool)

(assert (= bs!21492 d!84988))

(assert (=> bs!21492 m!382009))

(declare-fun m!382171 () Bool)

(assert (=> bs!21492 m!382171))

(assert (=> b!253757 d!84988))

(declare-fun d!84990 () Bool)

(declare-fun e!175883 () Bool)

(assert (=> d!84990 e!175883))

(declare-fun res!212694 () Bool)

(assert (=> d!84990 (=> (not res!212694) (not e!175883))))

(declare-fun lt!394193 () tuple2!21772)

(assert (=> d!84990 (= res!212694 (isPrefixOf!0 (_1!11817 lt!394193) (_2!11817 lt!394193)))))

(declare-fun lt!394199 () BitStream!10986)

(assert (=> d!84990 (= lt!394193 (tuple2!21773 lt!394199 (_2!11815 lt!394065)))))

(declare-fun lt!394194 () Unit!18239)

(declare-fun lt!394201 () Unit!18239)

(assert (=> d!84990 (= lt!394194 lt!394201)))

(assert (=> d!84990 (isPrefixOf!0 lt!394199 (_2!11815 lt!394065))))

(assert (=> d!84990 (= lt!394201 (lemmaIsPrefixTransitive!0 lt!394199 (_2!11815 lt!394065) (_2!11815 lt!394065)))))

(declare-fun lt!394185 () Unit!18239)

(declare-fun lt!394184 () Unit!18239)

(assert (=> d!84990 (= lt!394185 lt!394184)))

(assert (=> d!84990 (isPrefixOf!0 lt!394199 (_2!11815 lt!394065))))

(assert (=> d!84990 (= lt!394184 (lemmaIsPrefixTransitive!0 lt!394199 (_2!11815 lt!394055) (_2!11815 lt!394065)))))

(declare-fun lt!394197 () Unit!18239)

(declare-fun e!175882 () Unit!18239)

(assert (=> d!84990 (= lt!394197 e!175882)))

(declare-fun c!11695 () Bool)

(assert (=> d!84990 (= c!11695 (not (= (size!6032 (buf!6540 (_2!11815 lt!394055))) #b00000000000000000000000000000000)))))

(declare-fun lt!394191 () Unit!18239)

(declare-fun lt!394188 () Unit!18239)

(assert (=> d!84990 (= lt!394191 lt!394188)))

(assert (=> d!84990 (isPrefixOf!0 (_2!11815 lt!394065) (_2!11815 lt!394065))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10986) Unit!18239)

(assert (=> d!84990 (= lt!394188 (lemmaIsPrefixRefl!0 (_2!11815 lt!394065)))))

(declare-fun lt!394187 () Unit!18239)

(declare-fun lt!394196 () Unit!18239)

(assert (=> d!84990 (= lt!394187 lt!394196)))

(assert (=> d!84990 (= lt!394196 (lemmaIsPrefixRefl!0 (_2!11815 lt!394065)))))

(declare-fun lt!394190 () Unit!18239)

(declare-fun lt!394200 () Unit!18239)

(assert (=> d!84990 (= lt!394190 lt!394200)))

(assert (=> d!84990 (isPrefixOf!0 lt!394199 lt!394199)))

(assert (=> d!84990 (= lt!394200 (lemmaIsPrefixRefl!0 lt!394199))))

(declare-fun lt!394192 () Unit!18239)

(declare-fun lt!394198 () Unit!18239)

(assert (=> d!84990 (= lt!394192 lt!394198)))

(assert (=> d!84990 (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 lt!394055))))

(assert (=> d!84990 (= lt!394198 (lemmaIsPrefixRefl!0 (_2!11815 lt!394055)))))

(assert (=> d!84990 (= lt!394199 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))))))

(assert (=> d!84990 (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 lt!394065))))

(assert (=> d!84990 (= (reader!0 (_2!11815 lt!394055) (_2!11815 lt!394065)) lt!394193)))

(declare-fun b!253831 () Bool)

(declare-fun res!212693 () Bool)

(assert (=> b!253831 (=> (not res!212693) (not e!175883))))

(assert (=> b!253831 (= res!212693 (isPrefixOf!0 (_2!11817 lt!394193) (_2!11815 lt!394065)))))

(declare-fun b!253832 () Bool)

(declare-fun lt!394203 () Unit!18239)

(assert (=> b!253832 (= e!175882 lt!394203)))

(declare-fun lt!394189 () (_ BitVec 64))

(assert (=> b!253832 (= lt!394189 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!394186 () (_ BitVec 64))

(assert (=> b!253832 (= lt!394186 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13749 array!13749 (_ BitVec 64) (_ BitVec 64)) Unit!18239)

(assert (=> b!253832 (= lt!394203 (arrayBitRangesEqSymmetric!0 (buf!6540 (_2!11815 lt!394055)) (buf!6540 (_2!11815 lt!394065)) lt!394189 lt!394186))))

(declare-fun arrayBitRangesEq!0 (array!13749 array!13749 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!253832 (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394065)) (buf!6540 (_2!11815 lt!394055)) lt!394189 lt!394186)))

(declare-fun lt!394202 () (_ BitVec 64))

(declare-fun b!253833 () Bool)

(declare-fun lt!394195 () (_ BitVec 64))

(assert (=> b!253833 (= e!175883 (= (_1!11817 lt!394193) (withMovedBitIndex!0 (_2!11817 lt!394193) (bvsub lt!394202 lt!394195))))))

(assert (=> b!253833 (or (= (bvand lt!394202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394202 lt!394195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253833 (= lt!394195 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065))))))

(assert (=> b!253833 (= lt!394202 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))))))

(declare-fun b!253834 () Bool)

(declare-fun res!212692 () Bool)

(assert (=> b!253834 (=> (not res!212692) (not e!175883))))

(assert (=> b!253834 (= res!212692 (isPrefixOf!0 (_1!11817 lt!394193) (_2!11815 lt!394055)))))

(declare-fun b!253835 () Bool)

(declare-fun Unit!18243 () Unit!18239)

(assert (=> b!253835 (= e!175882 Unit!18243)))

(assert (= (and d!84990 c!11695) b!253832))

(assert (= (and d!84990 (not c!11695)) b!253835))

(assert (= (and d!84990 res!212694) b!253834))

(assert (= (and b!253834 res!212692) b!253831))

(assert (= (and b!253831 res!212693) b!253833))

(declare-fun m!382173 () Bool)

(assert (=> b!253831 m!382173))

(declare-fun m!382175 () Bool)

(assert (=> b!253833 m!382175))

(assert (=> b!253833 m!382015))

(assert (=> b!253833 m!382017))

(assert (=> b!253832 m!382017))

(declare-fun m!382177 () Bool)

(assert (=> b!253832 m!382177))

(declare-fun m!382179 () Bool)

(assert (=> b!253832 m!382179))

(declare-fun m!382181 () Bool)

(assert (=> b!253834 m!382181))

(declare-fun m!382183 () Bool)

(assert (=> d!84990 m!382183))

(declare-fun m!382185 () Bool)

(assert (=> d!84990 m!382185))

(declare-fun m!382187 () Bool)

(assert (=> d!84990 m!382187))

(declare-fun m!382189 () Bool)

(assert (=> d!84990 m!382189))

(declare-fun m!382191 () Bool)

(assert (=> d!84990 m!382191))

(declare-fun m!382193 () Bool)

(assert (=> d!84990 m!382193))

(declare-fun m!382195 () Bool)

(assert (=> d!84990 m!382195))

(declare-fun m!382197 () Bool)

(assert (=> d!84990 m!382197))

(declare-fun m!382199 () Bool)

(assert (=> d!84990 m!382199))

(declare-fun m!382201 () Bool)

(assert (=> d!84990 m!382201))

(assert (=> d!84990 m!382025))

(assert (=> b!253757 d!84990))

(declare-fun d!84992 () Bool)

(assert (=> d!84992 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21493 () Bool)

(assert (= bs!21493 d!84992))

(declare-fun m!382203 () Bool)

(assert (=> bs!21493 m!382203))

(assert (=> b!253767 d!84992))

(declare-fun d!84994 () Bool)

(assert (=> d!84994 (isPrefixOf!0 thiss!1005 (_2!11815 lt!394065))))

(declare-fun lt!394206 () Unit!18239)

(declare-fun choose!30 (BitStream!10986 BitStream!10986 BitStream!10986) Unit!18239)

(assert (=> d!84994 (= lt!394206 (choose!30 thiss!1005 (_2!11815 lt!394055) (_2!11815 lt!394065)))))

(assert (=> d!84994 (isPrefixOf!0 thiss!1005 (_2!11815 lt!394055))))

(assert (=> d!84994 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11815 lt!394055) (_2!11815 lt!394065)) lt!394206)))

(declare-fun bs!21494 () Bool)

(assert (= bs!21494 d!84994))

(assert (=> bs!21494 m!382057))

(declare-fun m!382205 () Bool)

(assert (=> bs!21494 m!382205))

(assert (=> bs!21494 m!382019))

(assert (=> b!253767 d!84994))

(declare-fun d!84996 () Bool)

(assert (=> d!84996 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394056) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055)))) lt!394056))))

(declare-fun bs!21495 () Bool)

(assert (= bs!21495 d!84996))

(declare-fun m!382207 () Bool)

(assert (=> bs!21495 m!382207))

(assert (=> b!253767 d!84996))

(declare-fun d!84998 () Bool)

(declare-fun e!175885 () Bool)

(assert (=> d!84998 e!175885))

(declare-fun res!212697 () Bool)

(assert (=> d!84998 (=> (not res!212697) (not e!175885))))

(declare-fun lt!394216 () tuple2!21772)

(assert (=> d!84998 (= res!212697 (isPrefixOf!0 (_1!11817 lt!394216) (_2!11817 lt!394216)))))

(declare-fun lt!394222 () BitStream!10986)

(assert (=> d!84998 (= lt!394216 (tuple2!21773 lt!394222 (_2!11815 lt!394065)))))

(declare-fun lt!394217 () Unit!18239)

(declare-fun lt!394224 () Unit!18239)

(assert (=> d!84998 (= lt!394217 lt!394224)))

(assert (=> d!84998 (isPrefixOf!0 lt!394222 (_2!11815 lt!394065))))

(assert (=> d!84998 (= lt!394224 (lemmaIsPrefixTransitive!0 lt!394222 (_2!11815 lt!394065) (_2!11815 lt!394065)))))

(declare-fun lt!394208 () Unit!18239)

(declare-fun lt!394207 () Unit!18239)

(assert (=> d!84998 (= lt!394208 lt!394207)))

(assert (=> d!84998 (isPrefixOf!0 lt!394222 (_2!11815 lt!394065))))

(assert (=> d!84998 (= lt!394207 (lemmaIsPrefixTransitive!0 lt!394222 thiss!1005 (_2!11815 lt!394065)))))

(declare-fun lt!394220 () Unit!18239)

(declare-fun e!175884 () Unit!18239)

(assert (=> d!84998 (= lt!394220 e!175884)))

(declare-fun c!11696 () Bool)

(assert (=> d!84998 (= c!11696 (not (= (size!6032 (buf!6540 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!394214 () Unit!18239)

(declare-fun lt!394211 () Unit!18239)

(assert (=> d!84998 (= lt!394214 lt!394211)))

(assert (=> d!84998 (isPrefixOf!0 (_2!11815 lt!394065) (_2!11815 lt!394065))))

(assert (=> d!84998 (= lt!394211 (lemmaIsPrefixRefl!0 (_2!11815 lt!394065)))))

(declare-fun lt!394210 () Unit!18239)

(declare-fun lt!394219 () Unit!18239)

(assert (=> d!84998 (= lt!394210 lt!394219)))

(assert (=> d!84998 (= lt!394219 (lemmaIsPrefixRefl!0 (_2!11815 lt!394065)))))

(declare-fun lt!394213 () Unit!18239)

(declare-fun lt!394223 () Unit!18239)

(assert (=> d!84998 (= lt!394213 lt!394223)))

(assert (=> d!84998 (isPrefixOf!0 lt!394222 lt!394222)))

(assert (=> d!84998 (= lt!394223 (lemmaIsPrefixRefl!0 lt!394222))))

(declare-fun lt!394215 () Unit!18239)

(declare-fun lt!394221 () Unit!18239)

(assert (=> d!84998 (= lt!394215 lt!394221)))

(assert (=> d!84998 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!84998 (= lt!394221 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!84998 (= lt!394222 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))

(assert (=> d!84998 (isPrefixOf!0 thiss!1005 (_2!11815 lt!394065))))

(assert (=> d!84998 (= (reader!0 thiss!1005 (_2!11815 lt!394065)) lt!394216)))

(declare-fun b!253836 () Bool)

(declare-fun res!212696 () Bool)

(assert (=> b!253836 (=> (not res!212696) (not e!175885))))

(assert (=> b!253836 (= res!212696 (isPrefixOf!0 (_2!11817 lt!394216) (_2!11815 lt!394065)))))

(declare-fun b!253837 () Bool)

(declare-fun lt!394226 () Unit!18239)

(assert (=> b!253837 (= e!175884 lt!394226)))

(declare-fun lt!394212 () (_ BitVec 64))

(assert (=> b!253837 (= lt!394212 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!394209 () (_ BitVec 64))

(assert (=> b!253837 (= lt!394209 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))

(assert (=> b!253837 (= lt!394226 (arrayBitRangesEqSymmetric!0 (buf!6540 thiss!1005) (buf!6540 (_2!11815 lt!394065)) lt!394212 lt!394209))))

(assert (=> b!253837 (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394065)) (buf!6540 thiss!1005) lt!394212 lt!394209)))

(declare-fun lt!394225 () (_ BitVec 64))

(declare-fun b!253838 () Bool)

(declare-fun lt!394218 () (_ BitVec 64))

(assert (=> b!253838 (= e!175885 (= (_1!11817 lt!394216) (withMovedBitIndex!0 (_2!11817 lt!394216) (bvsub lt!394225 lt!394218))))))

(assert (=> b!253838 (or (= (bvand lt!394225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394218 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394225 lt!394218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253838 (= lt!394218 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065))))))

(assert (=> b!253838 (= lt!394225 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))

(declare-fun b!253839 () Bool)

(declare-fun res!212695 () Bool)

(assert (=> b!253839 (=> (not res!212695) (not e!175885))))

(assert (=> b!253839 (= res!212695 (isPrefixOf!0 (_1!11817 lt!394216) thiss!1005))))

(declare-fun b!253840 () Bool)

(declare-fun Unit!18244 () Unit!18239)

(assert (=> b!253840 (= e!175884 Unit!18244)))

(assert (= (and d!84998 c!11696) b!253837))

(assert (= (and d!84998 (not c!11696)) b!253840))

(assert (= (and d!84998 res!212697) b!253839))

(assert (= (and b!253839 res!212695) b!253836))

(assert (= (and b!253836 res!212696) b!253838))

(declare-fun m!382209 () Bool)

(assert (=> b!253836 m!382209))

(declare-fun m!382211 () Bool)

(assert (=> b!253838 m!382211))

(assert (=> b!253838 m!382015))

(assert (=> b!253838 m!382075))

(assert (=> b!253837 m!382075))

(declare-fun m!382213 () Bool)

(assert (=> b!253837 m!382213))

(declare-fun m!382215 () Bool)

(assert (=> b!253837 m!382215))

(declare-fun m!382217 () Bool)

(assert (=> b!253839 m!382217))

(declare-fun m!382219 () Bool)

(assert (=> d!84998 m!382219))

(declare-fun m!382221 () Bool)

(assert (=> d!84998 m!382221))

(declare-fun m!382223 () Bool)

(assert (=> d!84998 m!382223))

(declare-fun m!382225 () Bool)

(assert (=> d!84998 m!382225))

(declare-fun m!382227 () Bool)

(assert (=> d!84998 m!382227))

(declare-fun m!382229 () Bool)

(assert (=> d!84998 m!382229))

(assert (=> d!84998 m!382195))

(assert (=> d!84998 m!382197))

(declare-fun m!382231 () Bool)

(assert (=> d!84998 m!382231))

(declare-fun m!382233 () Bool)

(assert (=> d!84998 m!382233))

(assert (=> d!84998 m!382057))

(assert (=> b!253767 d!84998))

(declare-fun d!85000 () Bool)

(declare-fun lt!394227 () tuple2!21780)

(assert (=> d!85000 (= lt!394227 (checkBitsLoop!0 (_1!11817 lt!394044) nBits!297 bit!26 from!289))))

(assert (=> d!85000 (= (checkBitsLoopPure!0 (_1!11817 lt!394044) nBits!297 bit!26 from!289) (tuple2!21771 (_2!11821 lt!394227) (_1!11821 lt!394227)))))

(declare-fun bs!21496 () Bool)

(assert (= bs!21496 d!85000))

(declare-fun m!382235 () Bool)

(assert (=> bs!21496 m!382235))

(assert (=> b!253767 d!85000))

(declare-fun lt!394228 () tuple2!21780)

(declare-fun d!85002 () Bool)

(assert (=> d!85002 (= lt!394228 (checkBitsLoop!0 (_1!11817 lt!394049) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85002 (= (checkBitsLoopPure!0 (_1!11817 lt!394049) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21771 (_2!11821 lt!394228) (_1!11821 lt!394228)))))

(declare-fun bs!21497 () Bool)

(assert (= bs!21497 d!85002))

(declare-fun m!382237 () Bool)

(assert (=> bs!21497 m!382237))

(assert (=> b!253767 d!85002))

(declare-fun b!253850 () Bool)

(declare-fun res!212709 () Bool)

(declare-fun e!175890 () Bool)

(assert (=> b!253850 (=> (not res!212709) (not e!175890))))

(declare-fun lt!394251 () tuple2!21768)

(assert (=> b!253850 (= res!212709 (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 lt!394251)))))

(declare-fun b!253851 () Bool)

(declare-fun lt!394249 () tuple2!21770)

(declare-fun lt!394245 () tuple2!21772)

(assert (=> b!253851 (= e!175890 (and (_2!11816 lt!394249) (= (_1!11816 lt!394249) (_2!11817 lt!394245))))))

(assert (=> b!253851 (= lt!394249 (checkBitsLoopPure!0 (_1!11817 lt!394245) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!394248 () Unit!18239)

(declare-fun lt!394252 () Unit!18239)

(assert (=> b!253851 (= lt!394248 lt!394252)))

(declare-fun lt!394250 () (_ BitVec 64))

(assert (=> b!253851 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394251)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394250)))

(assert (=> b!253851 (= lt!394252 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394251)) lt!394250))))

(declare-fun e!175891 () Bool)

(assert (=> b!253851 e!175891))

(declare-fun res!212707 () Bool)

(assert (=> b!253851 (=> (not res!212707) (not e!175891))))

(assert (=> b!253851 (= res!212707 (and (= (size!6032 (buf!6540 (_2!11815 lt!394055))) (size!6032 (buf!6540 (_2!11815 lt!394251)))) (bvsge lt!394250 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253851 (= lt!394250 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253851 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253851 (= lt!394245 (reader!0 (_2!11815 lt!394055) (_2!11815 lt!394251)))))

(declare-fun b!253849 () Bool)

(declare-fun res!212708 () Bool)

(assert (=> b!253849 (=> (not res!212708) (not e!175890))))

(declare-fun lt!394246 () (_ BitVec 64))

(declare-fun lt!394247 () (_ BitVec 64))

(assert (=> b!253849 (= res!212708 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394251))) (currentByte!12004 (_2!11815 lt!394251)) (currentBit!11999 (_2!11815 lt!394251))) (bvadd lt!394247 lt!394246)))))

(assert (=> b!253849 (or (not (= (bvand lt!394247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394246 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394247 lt!394246) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253849 (= lt!394246 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253849 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253849 (= lt!394247 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))))))

(declare-fun b!253852 () Bool)

(assert (=> b!253852 (= e!175891 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394250))))

(declare-fun d!85004 () Bool)

(assert (=> d!85004 e!175890))

(declare-fun res!212706 () Bool)

(assert (=> d!85004 (=> (not res!212706) (not e!175890))))

(assert (=> d!85004 (= res!212706 (= (size!6032 (buf!6540 (_2!11815 lt!394055))) (size!6032 (buf!6540 (_2!11815 lt!394251)))))))

(declare-fun choose!51 (BitStream!10986 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21768)

(assert (=> d!85004 (= lt!394251 (choose!51 (_2!11815 lt!394055) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85004 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85004 (= (appendNBitsLoop!0 (_2!11815 lt!394055) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!394251)))

(assert (= (and d!85004 res!212706) b!253849))

(assert (= (and b!253849 res!212708) b!253850))

(assert (= (and b!253850 res!212709) b!253851))

(assert (= (and b!253851 res!212707) b!253852))

(declare-fun m!382239 () Bool)

(assert (=> b!253849 m!382239))

(assert (=> b!253849 m!382017))

(declare-fun m!382241 () Bool)

(assert (=> d!85004 m!382241))

(declare-fun m!382243 () Bool)

(assert (=> b!253851 m!382243))

(declare-fun m!382245 () Bool)

(assert (=> b!253851 m!382245))

(declare-fun m!382247 () Bool)

(assert (=> b!253851 m!382247))

(declare-fun m!382249 () Bool)

(assert (=> b!253851 m!382249))

(declare-fun m!382251 () Bool)

(assert (=> b!253850 m!382251))

(declare-fun m!382253 () Bool)

(assert (=> b!253852 m!382253))

(assert (=> b!253767 d!85004))

(declare-fun b!253862 () Bool)

(declare-fun res!212718 () Bool)

(declare-fun e!175896 () Bool)

(assert (=> b!253862 (=> (not res!212718) (not e!175896))))

(declare-fun lt!394262 () (_ BitVec 64))

(declare-fun lt!394261 () tuple2!21768)

(declare-fun lt!394263 () (_ BitVec 64))

(assert (=> b!253862 (= res!212718 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394261))) (currentByte!12004 (_2!11815 lt!394261)) (currentBit!11999 (_2!11815 lt!394261))) (bvadd lt!394263 lt!394262)))))

(assert (=> b!253862 (or (not (= (bvand lt!394263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394262 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394263 lt!394262) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253862 (= lt!394262 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253862 (= lt!394263 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))

(declare-fun b!253865 () Bool)

(declare-fun e!175897 () Bool)

(declare-fun lt!394264 () tuple2!21770)

(assert (=> b!253865 (= e!175897 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394264))) (currentByte!12004 (_1!11816 lt!394264)) (currentBit!11999 (_1!11816 lt!394264))) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394261))) (currentByte!12004 (_2!11815 lt!394261)) (currentBit!11999 (_2!11815 lt!394261)))))))

(declare-fun d!85006 () Bool)

(assert (=> d!85006 e!175896))

(declare-fun res!212719 () Bool)

(assert (=> d!85006 (=> (not res!212719) (not e!175896))))

(assert (=> d!85006 (= res!212719 (= (size!6032 (buf!6540 thiss!1005)) (size!6032 (buf!6540 (_2!11815 lt!394261)))))))

(declare-fun choose!16 (BitStream!10986 Bool) tuple2!21768)

(assert (=> d!85006 (= lt!394261 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!85006 (validate_offset_bit!0 ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005)))))

(assert (=> d!85006 (= (appendBit!0 thiss!1005 bit!26) lt!394261)))

(declare-fun b!253864 () Bool)

(assert (=> b!253864 (= e!175896 e!175897)))

(declare-fun res!212721 () Bool)

(assert (=> b!253864 (=> (not res!212721) (not e!175897))))

(assert (=> b!253864 (= res!212721 (and (= (_2!11816 lt!394264) bit!26) (= (_1!11816 lt!394264) (_2!11815 lt!394261))))))

(assert (=> b!253864 (= lt!394264 (readBitPure!0 (readerFrom!0 (_2!11815 lt!394261) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))))

(declare-fun b!253863 () Bool)

(declare-fun res!212720 () Bool)

(assert (=> b!253863 (=> (not res!212720) (not e!175896))))

(assert (=> b!253863 (= res!212720 (isPrefixOf!0 thiss!1005 (_2!11815 lt!394261)))))

(assert (= (and d!85006 res!212719) b!253862))

(assert (= (and b!253862 res!212718) b!253863))

(assert (= (and b!253863 res!212720) b!253864))

(assert (= (and b!253864 res!212721) b!253865))

(declare-fun m!382255 () Bool)

(assert (=> d!85006 m!382255))

(declare-fun m!382257 () Bool)

(assert (=> d!85006 m!382257))

(declare-fun m!382259 () Bool)

(assert (=> b!253864 m!382259))

(assert (=> b!253864 m!382259))

(declare-fun m!382261 () Bool)

(assert (=> b!253864 m!382261))

(declare-fun m!382263 () Bool)

(assert (=> b!253863 m!382263))

(declare-fun m!382265 () Bool)

(assert (=> b!253862 m!382265))

(assert (=> b!253862 m!382075))

(declare-fun m!382267 () Bool)

(assert (=> b!253865 m!382267))

(assert (=> b!253865 m!382265))

(assert (=> b!253767 d!85006))

(declare-fun d!85008 () Bool)

(declare-fun res!212728 () Bool)

(declare-fun e!175903 () Bool)

(assert (=> d!85008 (=> (not res!212728) (not e!175903))))

(assert (=> d!85008 (= res!212728 (= (size!6032 (buf!6540 thiss!1005)) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(assert (=> d!85008 (= (isPrefixOf!0 thiss!1005 (_2!11815 lt!394065)) e!175903)))

(declare-fun b!253872 () Bool)

(declare-fun res!212729 () Bool)

(assert (=> b!253872 (=> (not res!212729) (not e!175903))))

(assert (=> b!253872 (= res!212729 (bvsle (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065)))))))

(declare-fun b!253873 () Bool)

(declare-fun e!175902 () Bool)

(assert (=> b!253873 (= e!175903 e!175902)))

(declare-fun res!212730 () Bool)

(assert (=> b!253873 (=> res!212730 e!175902)))

(assert (=> b!253873 (= res!212730 (= (size!6032 (buf!6540 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253874 () Bool)

(assert (=> b!253874 (= e!175902 (arrayBitRangesEq!0 (buf!6540 thiss!1005) (buf!6540 (_2!11815 lt!394065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(assert (= (and d!85008 res!212728) b!253872))

(assert (= (and b!253872 res!212729) b!253873))

(assert (= (and b!253873 (not res!212730)) b!253874))

(assert (=> b!253872 m!382075))

(assert (=> b!253872 m!382015))

(assert (=> b!253874 m!382075))

(assert (=> b!253874 m!382075))

(declare-fun m!382269 () Bool)

(assert (=> b!253874 m!382269))

(assert (=> b!253767 d!85008))

(assert (=> b!253767 d!84990))

(declare-fun d!85010 () Bool)

(declare-fun e!175906 () Bool)

(assert (=> d!85010 e!175906))

(declare-fun res!212733 () Bool)

(assert (=> d!85010 (=> (not res!212733) (not e!175906))))

(assert (=> d!85010 (= res!212733 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!394267 () Unit!18239)

(declare-fun choose!27 (BitStream!10986 BitStream!10986 (_ BitVec 64) (_ BitVec 64)) Unit!18239)

(assert (=> d!85010 (= lt!394267 (choose!27 thiss!1005 (_2!11815 lt!394055) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!85010 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!85010 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11815 lt!394055) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!394267)))

(declare-fun b!253877 () Bool)

(assert (=> b!253877 (= e!175906 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!85010 res!212733) b!253877))

(declare-fun m!382271 () Bool)

(assert (=> d!85010 m!382271))

(declare-fun m!382273 () Bool)

(assert (=> b!253877 m!382273))

(assert (=> b!253767 d!85010))

(declare-fun d!85012 () Bool)

(assert (=> d!85012 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394056) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055)))) lt!394056))))

(declare-fun bs!21498 () Bool)

(assert (= bs!21498 d!85012))

(assert (=> bs!21498 m!382169))

(assert (=> b!253767 d!85012))

(declare-fun d!85014 () Bool)

(assert (=> d!85014 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394056)))

(declare-fun lt!394268 () Unit!18239)

(assert (=> d!85014 (= lt!394268 (choose!9 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394065)) lt!394056 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(assert (=> d!85014 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394065)) lt!394056) lt!394268)))

(declare-fun bs!21499 () Bool)

(assert (= bs!21499 d!85014))

(assert (=> bs!21499 m!382063))

(declare-fun m!382275 () Bool)

(assert (=> bs!21499 m!382275))

(assert (=> b!253767 d!85014))

(declare-fun d!85016 () Bool)

(declare-fun lt!394271 () tuple2!21780)

(declare-fun readBit!0 (BitStream!10986) tuple2!21780)

(assert (=> d!85016 (= lt!394271 (readBit!0 lt!394052))))

(assert (=> d!85016 (= (readBitPure!0 lt!394052) (tuple2!21771 (_2!11821 lt!394271) (_1!11821 lt!394271)))))

(declare-fun bs!21500 () Bool)

(assert (= bs!21500 d!85016))

(declare-fun m!382277 () Bool)

(assert (=> bs!21500 m!382277))

(assert (=> b!253767 d!85016))

(declare-fun d!85018 () Bool)

(declare-fun e!175909 () Bool)

(assert (=> d!85018 e!175909))

(declare-fun res!212736 () Bool)

(assert (=> d!85018 (=> (not res!212736) (not e!175909))))

(declare-fun lt!394282 () tuple2!21770)

(declare-fun lt!394281 () tuple2!21770)

(assert (=> d!85018 (= res!212736 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394282))) (currentByte!12004 (_1!11816 lt!394282)) (currentBit!11999 (_1!11816 lt!394282))) (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394281))) (currentByte!12004 (_1!11816 lt!394281)) (currentBit!11999 (_1!11816 lt!394281)))))))

(declare-fun lt!394283 () BitStream!10986)

(declare-fun lt!394280 () Unit!18239)

(declare-fun choose!50 (BitStream!10986 BitStream!10986 BitStream!10986 tuple2!21770 tuple2!21770 BitStream!10986 Bool tuple2!21770 tuple2!21770 BitStream!10986 Bool) Unit!18239)

(assert (=> d!85018 (= lt!394280 (choose!50 lt!394052 (_2!11815 lt!394065) lt!394283 lt!394282 (tuple2!21771 (_1!11816 lt!394282) (_2!11816 lt!394282)) (_1!11816 lt!394282) (_2!11816 lt!394282) lt!394281 (tuple2!21771 (_1!11816 lt!394281) (_2!11816 lt!394281)) (_1!11816 lt!394281) (_2!11816 lt!394281)))))

(assert (=> d!85018 (= lt!394281 (readBitPure!0 lt!394283))))

(assert (=> d!85018 (= lt!394282 (readBitPure!0 lt!394052))))

(assert (=> d!85018 (= lt!394283 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 lt!394052) (currentBit!11999 lt!394052)))))

(assert (=> d!85018 (invariant!0 (currentBit!11999 lt!394052) (currentByte!12004 lt!394052) (size!6032 (buf!6540 (_2!11815 lt!394065))))))

(assert (=> d!85018 (= (readBitPrefixLemma!0 lt!394052 (_2!11815 lt!394065)) lt!394280)))

(declare-fun b!253880 () Bool)

(assert (=> b!253880 (= e!175909 (= (_2!11816 lt!394282) (_2!11816 lt!394281)))))

(assert (= (and d!85018 res!212736) b!253880))

(declare-fun m!382279 () Bool)

(assert (=> d!85018 m!382279))

(assert (=> d!85018 m!382055))

(declare-fun m!382281 () Bool)

(assert (=> d!85018 m!382281))

(declare-fun m!382283 () Bool)

(assert (=> d!85018 m!382283))

(declare-fun m!382285 () Bool)

(assert (=> d!85018 m!382285))

(declare-fun m!382287 () Bool)

(assert (=> d!85018 m!382287))

(assert (=> b!253767 d!85018))

(declare-fun d!85020 () Bool)

(assert (=> d!85020 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!394284 () Unit!18239)

(assert (=> d!85020 (= lt!394284 (choose!9 thiss!1005 (buf!6540 (_2!11815 lt!394065)) (bvsub nBits!297 from!289) (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(assert (=> d!85020 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6540 (_2!11815 lt!394065)) (bvsub nBits!297 from!289)) lt!394284)))

(declare-fun bs!21501 () Bool)

(assert (= bs!21501 d!85020))

(assert (=> bs!21501 m!382027))

(declare-fun m!382289 () Bool)

(assert (=> bs!21501 m!382289))

(assert (=> b!253767 d!85020))

(declare-fun d!85022 () Bool)

(declare-fun lt!394285 () tuple2!21780)

(assert (=> d!85022 (= lt!394285 (readBit!0 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(assert (=> d!85022 (= (readBitPure!0 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))) (tuple2!21771 (_2!11821 lt!394285) (_1!11821 lt!394285)))))

(declare-fun bs!21502 () Bool)

(assert (= bs!21502 d!85022))

(declare-fun m!382291 () Bool)

(assert (=> bs!21502 m!382291))

(assert (=> b!253767 d!85022))

(declare-fun d!85024 () Bool)

(declare-fun e!175912 () Bool)

(assert (=> d!85024 e!175912))

(declare-fun res!212741 () Bool)

(assert (=> d!85024 (=> (not res!212741) (not e!175912))))

(declare-fun lt!394303 () (_ BitVec 64))

(declare-fun lt!394301 () (_ BitVec 64))

(declare-fun lt!394299 () (_ BitVec 64))

(assert (=> d!85024 (= res!212741 (= lt!394301 (bvsub lt!394299 lt!394303)))))

(assert (=> d!85024 (or (= (bvand lt!394299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394299 lt!394303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85024 (= lt!394303 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394058)))) ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394058))) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394058)))))))

(declare-fun lt!394302 () (_ BitVec 64))

(declare-fun lt!394300 () (_ BitVec 64))

(assert (=> d!85024 (= lt!394299 (bvmul lt!394302 lt!394300))))

(assert (=> d!85024 (or (= lt!394302 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394300 (bvsdiv (bvmul lt!394302 lt!394300) lt!394302)))))

(assert (=> d!85024 (= lt!394300 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85024 (= lt!394302 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394058)))))))

(assert (=> d!85024 (= lt!394301 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394058))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394058)))))))

(assert (=> d!85024 (invariant!0 (currentBit!11999 (_1!11816 lt!394058)) (currentByte!12004 (_1!11816 lt!394058)) (size!6032 (buf!6540 (_1!11816 lt!394058))))))

(assert (=> d!85024 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394058))) (currentByte!12004 (_1!11816 lt!394058)) (currentBit!11999 (_1!11816 lt!394058))) lt!394301)))

(declare-fun b!253885 () Bool)

(declare-fun res!212742 () Bool)

(assert (=> b!253885 (=> (not res!212742) (not e!175912))))

(assert (=> b!253885 (= res!212742 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394301))))

(declare-fun b!253886 () Bool)

(declare-fun lt!394298 () (_ BitVec 64))

(assert (=> b!253886 (= e!175912 (bvsle lt!394301 (bvmul lt!394298 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253886 (or (= lt!394298 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394298 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394298)))))

(assert (=> b!253886 (= lt!394298 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394058)))))))

(assert (= (and d!85024 res!212741) b!253885))

(assert (= (and b!253885 res!212742) b!253886))

(declare-fun m!382293 () Bool)

(assert (=> d!85024 m!382293))

(declare-fun m!382295 () Bool)

(assert (=> d!85024 m!382295))

(assert (=> b!253767 d!85024))

(declare-fun d!85026 () Bool)

(declare-fun lt!394304 () tuple2!21780)

(assert (=> d!85026 (= lt!394304 (readBit!0 (_1!11817 lt!394044)))))

(assert (=> d!85026 (= (readBitPure!0 (_1!11817 lt!394044)) (tuple2!21771 (_2!11821 lt!394304) (_1!11821 lt!394304)))))

(declare-fun bs!21503 () Bool)

(assert (= bs!21503 d!85026))

(declare-fun m!382297 () Bool)

(assert (=> bs!21503 m!382297))

(assert (=> b!253767 d!85026))

(declare-fun d!85028 () Bool)

(declare-fun e!175913 () Bool)

(assert (=> d!85028 e!175913))

(declare-fun res!212743 () Bool)

(assert (=> d!85028 (=> (not res!212743) (not e!175913))))

(declare-fun lt!394310 () (_ BitVec 64))

(declare-fun lt!394306 () (_ BitVec 64))

(declare-fun lt!394308 () (_ BitVec 64))

(assert (=> d!85028 (= res!212743 (= lt!394308 (bvsub lt!394306 lt!394310)))))

(assert (=> d!85028 (or (= (bvand lt!394306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394310 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394306 lt!394310) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85028 (= lt!394310 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394063)))) ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394063))) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394063)))))))

(declare-fun lt!394309 () (_ BitVec 64))

(declare-fun lt!394307 () (_ BitVec 64))

(assert (=> d!85028 (= lt!394306 (bvmul lt!394309 lt!394307))))

(assert (=> d!85028 (or (= lt!394309 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394307 (bvsdiv (bvmul lt!394309 lt!394307) lt!394309)))))

(assert (=> d!85028 (= lt!394307 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85028 (= lt!394309 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394063)))))))

(assert (=> d!85028 (= lt!394308 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394063))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394063)))))))

(assert (=> d!85028 (invariant!0 (currentBit!11999 (_1!11816 lt!394063)) (currentByte!12004 (_1!11816 lt!394063)) (size!6032 (buf!6540 (_1!11816 lt!394063))))))

(assert (=> d!85028 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394063))) (currentByte!12004 (_1!11816 lt!394063)) (currentBit!11999 (_1!11816 lt!394063))) lt!394308)))

(declare-fun b!253887 () Bool)

(declare-fun res!212744 () Bool)

(assert (=> b!253887 (=> (not res!212744) (not e!175913))))

(assert (=> b!253887 (= res!212744 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394308))))

(declare-fun b!253888 () Bool)

(declare-fun lt!394305 () (_ BitVec 64))

(assert (=> b!253888 (= e!175913 (bvsle lt!394308 (bvmul lt!394305 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253888 (or (= lt!394305 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394305 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394305)))))

(assert (=> b!253888 (= lt!394305 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394063)))))))

(assert (= (and d!85028 res!212743) b!253887))

(assert (= (and b!253887 res!212744) b!253888))

(declare-fun m!382299 () Bool)

(assert (=> d!85028 m!382299))

(declare-fun m!382301 () Bool)

(assert (=> d!85028 m!382301))

(assert (=> b!253767 d!85028))

(declare-fun d!85030 () Bool)

(assert (=> d!85030 (= (array_inv!5773 (buf!6540 thiss!1005)) (bvsge (size!6032 (buf!6540 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!253756 d!85030))

(declare-fun d!85032 () Bool)

(declare-fun res!212745 () Bool)

(declare-fun e!175915 () Bool)

(assert (=> d!85032 (=> (not res!212745) (not e!175915))))

(assert (=> d!85032 (= res!212745 (= (size!6032 (buf!6540 thiss!1005)) (size!6032 (buf!6540 (_2!11815 lt!394055)))))))

(assert (=> d!85032 (= (isPrefixOf!0 thiss!1005 (_2!11815 lt!394055)) e!175915)))

(declare-fun b!253889 () Bool)

(declare-fun res!212746 () Bool)

(assert (=> b!253889 (=> (not res!212746) (not e!175915))))

(assert (=> b!253889 (= res!212746 (bvsle (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(declare-fun b!253890 () Bool)

(declare-fun e!175914 () Bool)

(assert (=> b!253890 (= e!175915 e!175914)))

(declare-fun res!212747 () Bool)

(assert (=> b!253890 (=> res!212747 e!175914)))

(assert (=> b!253890 (= res!212747 (= (size!6032 (buf!6540 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253891 () Bool)

(assert (=> b!253891 (= e!175914 (arrayBitRangesEq!0 (buf!6540 thiss!1005) (buf!6540 (_2!11815 lt!394055)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(assert (= (and d!85032 res!212745) b!253889))

(assert (= (and b!253889 res!212746) b!253890))

(assert (= (and b!253890 (not res!212747)) b!253891))

(assert (=> b!253889 m!382075))

(assert (=> b!253889 m!382017))

(assert (=> b!253891 m!382075))

(assert (=> b!253891 m!382075))

(declare-fun m!382303 () Bool)

(assert (=> b!253891 m!382303))

(assert (=> b!253766 d!85032))

(declare-fun d!85034 () Bool)

(declare-fun e!175916 () Bool)

(assert (=> d!85034 e!175916))

(declare-fun res!212748 () Bool)

(assert (=> d!85034 (=> (not res!212748) (not e!175916))))

(declare-fun lt!394312 () (_ BitVec 64))

(declare-fun lt!394316 () (_ BitVec 64))

(declare-fun lt!394314 () (_ BitVec 64))

(assert (=> d!85034 (= res!212748 (= lt!394314 (bvsub lt!394312 lt!394316)))))

(assert (=> d!85034 (or (= (bvand lt!394312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394312 lt!394316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85034 (= lt!394316 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394065))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394065)))))))

(declare-fun lt!394315 () (_ BitVec 64))

(declare-fun lt!394313 () (_ BitVec 64))

(assert (=> d!85034 (= lt!394312 (bvmul lt!394315 lt!394313))))

(assert (=> d!85034 (or (= lt!394315 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394313 (bvsdiv (bvmul lt!394315 lt!394313) lt!394315)))))

(assert (=> d!85034 (= lt!394313 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85034 (= lt!394315 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(assert (=> d!85034 (= lt!394314 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394065))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394065)))))))

(assert (=> d!85034 (invariant!0 (currentBit!11999 (_2!11815 lt!394065)) (currentByte!12004 (_2!11815 lt!394065)) (size!6032 (buf!6540 (_2!11815 lt!394065))))))

(assert (=> d!85034 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065))) lt!394314)))

(declare-fun b!253892 () Bool)

(declare-fun res!212749 () Bool)

(assert (=> b!253892 (=> (not res!212749) (not e!175916))))

(assert (=> b!253892 (= res!212749 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394314))))

(declare-fun b!253893 () Bool)

(declare-fun lt!394311 () (_ BitVec 64))

(assert (=> b!253893 (= e!175916 (bvsle lt!394314 (bvmul lt!394311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253893 (or (= lt!394311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394311)))))

(assert (=> b!253893 (= lt!394311 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(assert (= (and d!85034 res!212748) b!253892))

(assert (= (and b!253892 res!212749) b!253893))

(declare-fun m!382305 () Bool)

(assert (=> d!85034 m!382305))

(declare-fun m!382307 () Bool)

(assert (=> d!85034 m!382307))

(assert (=> b!253755 d!85034))

(declare-fun d!85036 () Bool)

(declare-fun e!175917 () Bool)

(assert (=> d!85036 e!175917))

(declare-fun res!212750 () Bool)

(assert (=> d!85036 (=> (not res!212750) (not e!175917))))

(declare-fun lt!394318 () (_ BitVec 64))

(declare-fun lt!394322 () (_ BitVec 64))

(declare-fun lt!394320 () (_ BitVec 64))

(assert (=> d!85036 (= res!212750 (= lt!394320 (bvsub lt!394318 lt!394322)))))

(assert (=> d!85036 (or (= (bvand lt!394318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394322 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394318 lt!394322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85036 (= lt!394322 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055)))))))

(declare-fun lt!394321 () (_ BitVec 64))

(declare-fun lt!394319 () (_ BitVec 64))

(assert (=> d!85036 (= lt!394318 (bvmul lt!394321 lt!394319))))

(assert (=> d!85036 (or (= lt!394321 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394319 (bvsdiv (bvmul lt!394321 lt!394319) lt!394321)))))

(assert (=> d!85036 (= lt!394319 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85036 (= lt!394321 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))))))

(assert (=> d!85036 (= lt!394320 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055)))))))

(assert (=> d!85036 (invariant!0 (currentBit!11999 (_2!11815 lt!394055)) (currentByte!12004 (_2!11815 lt!394055)) (size!6032 (buf!6540 (_2!11815 lt!394055))))))

(assert (=> d!85036 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))) lt!394320)))

(declare-fun b!253894 () Bool)

(declare-fun res!212751 () Bool)

(assert (=> b!253894 (=> (not res!212751) (not e!175917))))

(assert (=> b!253894 (= res!212751 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394320))))

(declare-fun b!253895 () Bool)

(declare-fun lt!394317 () (_ BitVec 64))

(assert (=> b!253895 (= e!175917 (bvsle lt!394320 (bvmul lt!394317 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253895 (or (= lt!394317 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394317 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394317)))))

(assert (=> b!253895 (= lt!394317 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))))))

(assert (= (and d!85036 res!212750) b!253894))

(assert (= (and b!253894 res!212751) b!253895))

(assert (=> d!85036 m!382207))

(declare-fun m!382309 () Bool)

(assert (=> d!85036 m!382309))

(assert (=> b!253755 d!85036))

(declare-fun d!85038 () Bool)

(assert (=> d!85038 (= (invariant!0 (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005) (size!6032 (buf!6540 (_2!11815 lt!394055)))) (and (bvsge (currentBit!11999 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11999 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12004 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12004 thiss!1005) (size!6032 (buf!6540 (_2!11815 lt!394055)))) (and (= (currentBit!11999 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12004 thiss!1005) (size!6032 (buf!6540 (_2!11815 lt!394055))))))))))

(assert (=> b!253754 d!85038))

(declare-fun d!85040 () Bool)

(declare-fun e!175918 () Bool)

(assert (=> d!85040 e!175918))

(declare-fun res!212752 () Bool)

(assert (=> d!85040 (=> (not res!212752) (not e!175918))))

(declare-fun lt!394324 () (_ BitVec 64))

(declare-fun lt!394326 () (_ BitVec 64))

(declare-fun lt!394328 () (_ BitVec 64))

(assert (=> d!85040 (= res!212752 (= lt!394326 (bvsub lt!394324 lt!394328)))))

(assert (=> d!85040 (or (= (bvand lt!394324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394328 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394324 lt!394328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85040 (= lt!394328 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394054)))) ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394054))) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394054)))))))

(declare-fun lt!394327 () (_ BitVec 64))

(declare-fun lt!394325 () (_ BitVec 64))

(assert (=> d!85040 (= lt!394324 (bvmul lt!394327 lt!394325))))

(assert (=> d!85040 (or (= lt!394327 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394325 (bvsdiv (bvmul lt!394327 lt!394325) lt!394327)))))

(assert (=> d!85040 (= lt!394325 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85040 (= lt!394327 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394054)))))))

(assert (=> d!85040 (= lt!394326 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394054))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394054)))))))

(assert (=> d!85040 (invariant!0 (currentBit!11999 (_1!11816 lt!394054)) (currentByte!12004 (_1!11816 lt!394054)) (size!6032 (buf!6540 (_1!11816 lt!394054))))))

(assert (=> d!85040 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394054))) (currentByte!12004 (_1!11816 lt!394054)) (currentBit!11999 (_1!11816 lt!394054))) lt!394326)))

(declare-fun b!253896 () Bool)

(declare-fun res!212753 () Bool)

(assert (=> b!253896 (=> (not res!212753) (not e!175918))))

(assert (=> b!253896 (= res!212753 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394326))))

(declare-fun b!253897 () Bool)

(declare-fun lt!394323 () (_ BitVec 64))

(assert (=> b!253897 (= e!175918 (bvsle lt!394326 (bvmul lt!394323 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253897 (or (= lt!394323 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394323 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394323)))))

(assert (=> b!253897 (= lt!394323 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394054)))))))

(assert (= (and d!85040 res!212752) b!253896))

(assert (= (and b!253896 res!212753) b!253897))

(declare-fun m!382311 () Bool)

(assert (=> d!85040 m!382311))

(declare-fun m!382313 () Bool)

(assert (=> d!85040 m!382313))

(assert (=> b!253764 d!85040))

(assert (=> b!253762 d!85036))

(declare-fun d!85042 () Bool)

(declare-fun e!175919 () Bool)

(assert (=> d!85042 e!175919))

(declare-fun res!212754 () Bool)

(assert (=> d!85042 (=> (not res!212754) (not e!175919))))

(declare-fun lt!394334 () (_ BitVec 64))

(declare-fun lt!394332 () (_ BitVec 64))

(declare-fun lt!394330 () (_ BitVec 64))

(assert (=> d!85042 (= res!212754 (= lt!394332 (bvsub lt!394330 lt!394334)))))

(assert (=> d!85042 (or (= (bvand lt!394330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394334 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394330 lt!394334) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85042 (= lt!394334 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005))))))

(declare-fun lt!394333 () (_ BitVec 64))

(declare-fun lt!394331 () (_ BitVec 64))

(assert (=> d!85042 (= lt!394330 (bvmul lt!394333 lt!394331))))

(assert (=> d!85042 (or (= lt!394333 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394331 (bvsdiv (bvmul lt!394333 lt!394331) lt!394333)))))

(assert (=> d!85042 (= lt!394331 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85042 (= lt!394333 ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))))))

(assert (=> d!85042 (= lt!394332 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 thiss!1005))))))

(assert (=> d!85042 (invariant!0 (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005) (size!6032 (buf!6540 thiss!1005)))))

(assert (=> d!85042 (= (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)) lt!394332)))

(declare-fun b!253898 () Bool)

(declare-fun res!212755 () Bool)

(assert (=> b!253898 (=> (not res!212755) (not e!175919))))

(assert (=> b!253898 (= res!212755 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394332))))

(declare-fun b!253899 () Bool)

(declare-fun lt!394329 () (_ BitVec 64))

(assert (=> b!253899 (= e!175919 (bvsle lt!394332 (bvmul lt!394329 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253899 (or (= lt!394329 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394329 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394329)))))

(assert (=> b!253899 (= lt!394329 ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))))))

(assert (= (and d!85042 res!212754) b!253898))

(assert (= (and b!253898 res!212755) b!253899))

(assert (=> d!85042 m!382163))

(assert (=> d!85042 m!382165))

(assert (=> b!253762 d!85042))

(declare-fun d!85044 () Bool)

(declare-fun lt!394335 () tuple2!21780)

(assert (=> d!85044 (= lt!394335 (readBit!0 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))))

(assert (=> d!85044 (= (readBitPure!0 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))) (tuple2!21771 (_2!11821 lt!394335) (_1!11821 lt!394335)))))

(declare-fun bs!21504 () Bool)

(assert (= bs!21504 d!85044))

(assert (=> bs!21504 m!382021))

(declare-fun m!382315 () Bool)

(assert (=> bs!21504 m!382315))

(assert (=> b!253761 d!85044))

(declare-fun d!85046 () Bool)

(declare-fun e!175922 () Bool)

(assert (=> d!85046 e!175922))

(declare-fun res!212759 () Bool)

(assert (=> d!85046 (=> (not res!212759) (not e!175922))))

(assert (=> d!85046 (= res!212759 (invariant!0 (currentBit!11999 (_2!11815 lt!394055)) (currentByte!12004 (_2!11815 lt!394055)) (size!6032 (buf!6540 (_2!11815 lt!394055)))))))

(assert (=> d!85046 (= (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)) (BitStream!10987 (buf!6540 (_2!11815 lt!394055)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))

(declare-fun b!253902 () Bool)

(assert (=> b!253902 (= e!175922 (invariant!0 (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005) (size!6032 (buf!6540 (_2!11815 lt!394055)))))))

(assert (= (and d!85046 res!212759) b!253902))

(assert (=> d!85046 m!382309))

(assert (=> b!253902 m!382073))

(assert (=> b!253761 d!85046))

(declare-fun d!85048 () Bool)

(declare-fun res!212760 () Bool)

(declare-fun e!175924 () Bool)

(assert (=> d!85048 (=> (not res!212760) (not e!175924))))

(assert (=> d!85048 (= res!212760 (= (size!6032 (buf!6540 (_2!11815 lt!394055))) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(assert (=> d!85048 (= (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 lt!394065)) e!175924)))

(declare-fun b!253903 () Bool)

(declare-fun res!212761 () Bool)

(assert (=> b!253903 (=> (not res!212761) (not e!175924))))

(assert (=> b!253903 (= res!212761 (bvsle (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065)))))))

(declare-fun b!253904 () Bool)

(declare-fun e!175923 () Bool)

(assert (=> b!253904 (= e!175924 e!175923)))

(declare-fun res!212762 () Bool)

(assert (=> b!253904 (=> res!212762 e!175923)))

(assert (=> b!253904 (= res!212762 (= (size!6032 (buf!6540 (_2!11815 lt!394055))) #b00000000000000000000000000000000))))

(declare-fun b!253905 () Bool)

(assert (=> b!253905 (= e!175923 (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394055)) (buf!6540 (_2!11815 lt!394065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(assert (= (and d!85048 res!212760) b!253903))

(assert (= (and b!253903 res!212761) b!253904))

(assert (= (and b!253904 (not res!212762)) b!253905))

(assert (=> b!253903 m!382017))

(assert (=> b!253903 m!382015))

(assert (=> b!253905 m!382017))

(assert (=> b!253905 m!382017))

(declare-fun m!382317 () Bool)

(assert (=> b!253905 m!382317))

(assert (=> b!253760 d!85048))

(check-sat (not d!85006) (not d!85020) (not d!85044) (not d!85014) (not d!84994) (not d!85016) (not d!85046) (not d!85012) (not d!84992) (not b!253863) (not b!253849) (not d!85034) (not d!84976) (not d!84990) (not d!85024) (not b!253851) (not d!85018) (not d!85000) (not b!253837) (not d!84978) (not b!253862) (not b!253852) (not d!84986) (not b!253834) (not d!85042) (not d!85028) (not b!253836) (not b!253838) (not b!253872) (not d!85002) (not b!253832) (not d!85022) (not b!253833) (not b!253874) (not d!85026) (not b!253902) (not b!253877) (not b!253891) (not b!253831) (not d!84984) (not d!84982) (not b!253864) (not d!85004) (not b!253903) (not b!253905) (not b!253889) (not d!84998) (not d!85036) (not b!253839) (not d!84996) (not b!253865) (not d!85010) (not d!85040) (not b!253850) (not d!84988))
(check-sat)
(get-model)

(declare-fun d!85198 () Bool)

(declare-fun e!176025 () Bool)

(assert (=> d!85198 e!176025))

(declare-fun res!212923 () Bool)

(assert (=> d!85198 (=> (not res!212923) (not e!176025))))

(declare-fun lt!394745 () (_ BitVec 64))

(declare-fun lt!394749 () (_ BitVec 64))

(declare-fun lt!394747 () (_ BitVec 64))

(assert (=> d!85198 (= res!212923 (= lt!394747 (bvsub lt!394745 lt!394749)))))

(assert (=> d!85198 (or (= (bvand lt!394745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394745 lt!394749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85198 (= lt!394749 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 lt!394136))) ((_ sign_extend 32) (currentByte!12004 lt!394136)) ((_ sign_extend 32) (currentBit!11999 lt!394136))))))

(declare-fun lt!394748 () (_ BitVec 64))

(declare-fun lt!394746 () (_ BitVec 64))

(assert (=> d!85198 (= lt!394745 (bvmul lt!394748 lt!394746))))

(assert (=> d!85198 (or (= lt!394748 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394746 (bvsdiv (bvmul lt!394748 lt!394746) lt!394748)))))

(assert (=> d!85198 (= lt!394746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85198 (= lt!394748 ((_ sign_extend 32) (size!6032 (buf!6540 lt!394136))))))

(assert (=> d!85198 (= lt!394747 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 lt!394136)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 lt!394136))))))

(assert (=> d!85198 (invariant!0 (currentBit!11999 lt!394136) (currentByte!12004 lt!394136) (size!6032 (buf!6540 lt!394136)))))

(assert (=> d!85198 (= (bitIndex!0 (size!6032 (buf!6540 lt!394136)) (currentByte!12004 lt!394136) (currentBit!11999 lt!394136)) lt!394747)))

(declare-fun b!254082 () Bool)

(declare-fun res!212924 () Bool)

(assert (=> b!254082 (=> (not res!212924) (not e!176025))))

(assert (=> b!254082 (= res!212924 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394747))))

(declare-fun b!254083 () Bool)

(declare-fun lt!394744 () (_ BitVec 64))

(assert (=> b!254083 (= e!176025 (bvsle lt!394747 (bvmul lt!394744 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254083 (or (= lt!394744 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394744 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394744)))))

(assert (=> b!254083 (= lt!394744 ((_ sign_extend 32) (size!6032 (buf!6540 lt!394136))))))

(assert (= (and d!85198 res!212923) b!254082))

(assert (= (and b!254082 res!212924) b!254083))

(declare-fun m!382647 () Bool)

(assert (=> d!85198 m!382647))

(declare-fun m!382649 () Bool)

(assert (=> d!85198 m!382649))

(assert (=> d!84976 d!85198))

(declare-fun d!85200 () Bool)

(declare-fun e!176026 () Bool)

(assert (=> d!85200 e!176026))

(declare-fun res!212925 () Bool)

(assert (=> d!85200 (=> (not res!212925) (not e!176026))))

(declare-fun lt!394751 () (_ BitVec 64))

(declare-fun lt!394755 () (_ BitVec 64))

(declare-fun lt!394753 () (_ BitVec 64))

(assert (=> d!85200 (= res!212925 (= lt!394753 (bvsub lt!394751 lt!394755)))))

(assert (=> d!85200 (or (= (bvand lt!394751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394755 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394751 lt!394755) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85200 (= lt!394755 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11817 lt!394044)))) ((_ sign_extend 32) (currentByte!12004 (_1!11817 lt!394044))) ((_ sign_extend 32) (currentBit!11999 (_1!11817 lt!394044)))))))

(declare-fun lt!394754 () (_ BitVec 64))

(declare-fun lt!394752 () (_ BitVec 64))

(assert (=> d!85200 (= lt!394751 (bvmul lt!394754 lt!394752))))

(assert (=> d!85200 (or (= lt!394754 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394752 (bvsdiv (bvmul lt!394754 lt!394752) lt!394754)))))

(assert (=> d!85200 (= lt!394752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85200 (= lt!394754 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11817 lt!394044)))))))

(assert (=> d!85200 (= lt!394753 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_1!11817 lt!394044))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_1!11817 lt!394044)))))))

(assert (=> d!85200 (invariant!0 (currentBit!11999 (_1!11817 lt!394044)) (currentByte!12004 (_1!11817 lt!394044)) (size!6032 (buf!6540 (_1!11817 lt!394044))))))

(assert (=> d!85200 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)) (currentBit!11999 (_1!11817 lt!394044))) lt!394753)))

(declare-fun b!254084 () Bool)

(declare-fun res!212926 () Bool)

(assert (=> b!254084 (=> (not res!212926) (not e!176026))))

(assert (=> b!254084 (= res!212926 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394753))))

(declare-fun b!254085 () Bool)

(declare-fun lt!394750 () (_ BitVec 64))

(assert (=> b!254085 (= e!176026 (bvsle lt!394753 (bvmul lt!394750 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254085 (or (= lt!394750 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394750 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394750)))))

(assert (=> b!254085 (= lt!394750 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11817 lt!394044)))))))

(assert (= (and d!85200 res!212925) b!254084))

(assert (= (and b!254084 res!212926) b!254085))

(declare-fun m!382651 () Bool)

(assert (=> d!85200 m!382651))

(declare-fun m!382653 () Bool)

(assert (=> d!85200 m!382653))

(assert (=> d!84976 d!85200))

(declare-fun d!85202 () Bool)

(declare-fun lt!394771 () (_ BitVec 32))

(assert (=> d!85202 (= lt!394771 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!394772 () (_ BitVec 32))

(assert (=> d!85202 (= lt!394772 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!176032 () Bool)

(assert (=> d!85202 e!176032))

(declare-fun res!212932 () Bool)

(assert (=> d!85202 (=> (not res!212932) (not e!176032))))

(assert (=> d!85202 (= res!212932 (moveBitIndexPrecond!0 (_1!11817 lt!394044) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!18249 () Unit!18239)

(declare-fun Unit!18250 () Unit!18239)

(declare-fun Unit!18251 () Unit!18239)

(assert (=> d!85202 (= (moveBitIndex!0 (_1!11817 lt!394044) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11999 (_1!11817 lt!394044)) lt!394771) #b00000000000000000000000000000000) (tuple2!21769 Unit!18249 (BitStream!10987 (buf!6540 (_1!11817 lt!394044)) (bvsub (bvadd (currentByte!12004 (_1!11817 lt!394044)) lt!394772) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!394771 (currentBit!11999 (_1!11817 lt!394044))))) (ite (bvsge (bvadd (currentBit!11999 (_1!11817 lt!394044)) lt!394771) #b00000000000000000000000000001000) (tuple2!21769 Unit!18250 (BitStream!10987 (buf!6540 (_1!11817 lt!394044)) (bvadd (currentByte!12004 (_1!11817 lt!394044)) lt!394772 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11999 (_1!11817 lt!394044)) lt!394771) #b00000000000000000000000000001000))) (tuple2!21769 Unit!18251 (BitStream!10987 (buf!6540 (_1!11817 lt!394044)) (bvadd (currentByte!12004 (_1!11817 lt!394044)) lt!394772) (bvadd (currentBit!11999 (_1!11817 lt!394044)) lt!394771))))))))

(declare-fun b!254090 () Bool)

(declare-fun e!176031 () Bool)

(assert (=> b!254090 (= e!176032 e!176031)))

(declare-fun res!212931 () Bool)

(assert (=> b!254090 (=> (not res!212931) (not e!176031))))

(declare-fun lt!394773 () (_ BitVec 64))

(declare-fun lt!394769 () tuple2!21768)

(assert (=> b!254090 (= res!212931 (= (bvadd lt!394773 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394769))) (currentByte!12004 (_2!11815 lt!394769)) (currentBit!11999 (_2!11815 lt!394769)))))))

(assert (=> b!254090 (or (not (= (bvand lt!394773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394773 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254090 (= lt!394773 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)) (currentBit!11999 (_1!11817 lt!394044))))))

(declare-fun lt!394770 () (_ BitVec 32))

(declare-fun lt!394768 () (_ BitVec 32))

(declare-fun Unit!18252 () Unit!18239)

(declare-fun Unit!18253 () Unit!18239)

(declare-fun Unit!18254 () Unit!18239)

(assert (=> b!254090 (= lt!394769 (ite (bvslt (bvadd (currentBit!11999 (_1!11817 lt!394044)) lt!394770) #b00000000000000000000000000000000) (tuple2!21769 Unit!18252 (BitStream!10987 (buf!6540 (_1!11817 lt!394044)) (bvsub (bvadd (currentByte!12004 (_1!11817 lt!394044)) lt!394768) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!394770 (currentBit!11999 (_1!11817 lt!394044))))) (ite (bvsge (bvadd (currentBit!11999 (_1!11817 lt!394044)) lt!394770) #b00000000000000000000000000001000) (tuple2!21769 Unit!18253 (BitStream!10987 (buf!6540 (_1!11817 lt!394044)) (bvadd (currentByte!12004 (_1!11817 lt!394044)) lt!394768 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11999 (_1!11817 lt!394044)) lt!394770) #b00000000000000000000000000001000))) (tuple2!21769 Unit!18254 (BitStream!10987 (buf!6540 (_1!11817 lt!394044)) (bvadd (currentByte!12004 (_1!11817 lt!394044)) lt!394768) (bvadd (currentBit!11999 (_1!11817 lt!394044)) lt!394770))))))))

(assert (=> b!254090 (= lt!394770 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254090 (= lt!394768 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!254091 () Bool)

(assert (=> b!254091 (= e!176031 (and (= (size!6032 (buf!6540 (_1!11817 lt!394044))) (size!6032 (buf!6540 (_2!11815 lt!394769)))) (= (buf!6540 (_1!11817 lt!394044)) (buf!6540 (_2!11815 lt!394769)))))))

(assert (= (and d!85202 res!212932) b!254090))

(assert (= (and b!254090 res!212931) b!254091))

(assert (=> d!85202 m!382161))

(declare-fun m!382655 () Bool)

(assert (=> b!254090 m!382655))

(assert (=> b!254090 m!382157))

(assert (=> d!84976 d!85202))

(declare-fun d!85206 () Bool)

(declare-fun res!212935 () Bool)

(declare-fun e!176035 () Bool)

(assert (=> d!85206 (=> (not res!212935) (not e!176035))))

(assert (=> d!85206 (= res!212935 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11817 lt!394044))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11817 lt!394044))))))))))

(assert (=> d!85206 (= (moveBitIndexPrecond!0 (_1!11817 lt!394044) #b0000000000000000000000000000000000000000000000000000000000000001) e!176035)))

(declare-fun b!254095 () Bool)

(declare-fun lt!394776 () (_ BitVec 64))

(assert (=> b!254095 (= e!176035 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394776) (bvsle lt!394776 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11817 lt!394044))))))))))

(assert (=> b!254095 (= lt!394776 (bvadd (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)) (currentBit!11999 (_1!11817 lt!394044))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!85206 res!212935) b!254095))

(assert (=> b!254095 m!382157))

(assert (=> d!84976 d!85206))

(declare-fun d!85208 () Bool)

(declare-fun e!176042 () Bool)

(assert (=> d!85208 e!176042))

(declare-fun res!212938 () Bool)

(assert (=> d!85208 (=> (not res!212938) (not e!176042))))

(declare-fun increaseBitIndex!0 (BitStream!10986) tuple2!21768)

(assert (=> d!85208 (= res!212938 (= (buf!6540 (_2!11815 (increaseBitIndex!0 (_1!11817 lt!394044)))) (buf!6540 (_1!11817 lt!394044))))))

(declare-fun lt!394792 () Bool)

(assert (=> d!85208 (= lt!394792 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (_1!11817 lt!394044))))) #b00000000000000000000000000000000)))))

(declare-fun lt!394796 () tuple2!21780)

(assert (=> d!85208 (= lt!394796 (tuple2!21781 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (_1!11817 lt!394044))))) #b00000000000000000000000000000000)) (_2!11815 (increaseBitIndex!0 (_1!11817 lt!394044)))))))

(assert (=> d!85208 (validate_offset_bit!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11817 lt!394044)))) ((_ sign_extend 32) (currentByte!12004 (_1!11817 lt!394044))) ((_ sign_extend 32) (currentBit!11999 (_1!11817 lt!394044))))))

(assert (=> d!85208 (= (readBit!0 (_1!11817 lt!394044)) lt!394796)))

(declare-fun b!254098 () Bool)

(declare-fun lt!394791 () (_ BitVec 64))

(declare-fun lt!394795 () (_ BitVec 64))

(assert (=> b!254098 (= e!176042 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 (increaseBitIndex!0 (_1!11817 lt!394044))))) (currentByte!12004 (_2!11815 (increaseBitIndex!0 (_1!11817 lt!394044)))) (currentBit!11999 (_2!11815 (increaseBitIndex!0 (_1!11817 lt!394044))))) (bvadd lt!394791 lt!394795)))))

(assert (=> b!254098 (or (not (= (bvand lt!394791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394795 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394791 lt!394795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254098 (= lt!394795 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254098 (= lt!394791 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)) (currentBit!11999 (_1!11817 lt!394044))))))

(declare-fun lt!394797 () Bool)

(assert (=> b!254098 (= lt!394797 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (_1!11817 lt!394044))))) #b00000000000000000000000000000000)))))

(declare-fun lt!394794 () Bool)

(assert (=> b!254098 (= lt!394794 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (_1!11817 lt!394044))))) #b00000000000000000000000000000000)))))

(declare-fun lt!394793 () Bool)

(assert (=> b!254098 (= lt!394793 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (_1!11817 lt!394044))))) #b00000000000000000000000000000000)))))

(assert (= (and d!85208 res!212938) b!254098))

(declare-fun m!382657 () Bool)

(assert (=> d!85208 m!382657))

(declare-fun m!382659 () Bool)

(assert (=> d!85208 m!382659))

(declare-fun m!382661 () Bool)

(assert (=> d!85208 m!382661))

(declare-fun m!382663 () Bool)

(assert (=> d!85208 m!382663))

(assert (=> b!254098 m!382659))

(assert (=> b!254098 m!382661))

(declare-fun m!382665 () Bool)

(assert (=> b!254098 m!382665))

(assert (=> b!254098 m!382657))

(assert (=> b!254098 m!382157))

(assert (=> d!85026 d!85208))

(declare-fun b!254117 () Bool)

(declare-fun e!176054 () tuple2!21780)

(declare-fun lt!394826 () tuple2!21780)

(assert (=> b!254117 (= e!176054 (tuple2!21781 false (_2!11821 lt!394826)))))

(declare-fun d!85210 () Bool)

(declare-fun e!176056 () Bool)

(assert (=> d!85210 e!176056))

(declare-fun res!212949 () Bool)

(assert (=> d!85210 (=> (not res!212949) (not e!176056))))

(declare-fun lt!394830 () (_ BitVec 64))

(declare-fun lt!394829 () tuple2!21780)

(assert (=> d!85210 (= res!212949 (bvsge (bvsub lt!394830 from!289) (bitIndex!0 (size!6032 (buf!6540 (_2!11821 lt!394829))) (currentByte!12004 (_2!11821 lt!394829)) (currentBit!11999 (_2!11821 lt!394829)))))))

(assert (=> d!85210 (or (= (bvand lt!394830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394830 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!394827 () (_ BitVec 64))

(assert (=> d!85210 (= lt!394830 (bvadd lt!394827 nBits!297))))

(assert (=> d!85210 (or (not (= (bvand lt!394827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394827 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85210 (= lt!394827 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)) (currentBit!11999 (_1!11817 lt!394044))))))

(declare-fun e!176053 () tuple2!21780)

(assert (=> d!85210 (= lt!394829 e!176053)))

(declare-fun c!11709 () Bool)

(assert (=> d!85210 (= c!11709 (= from!289 nBits!297))))

(assert (=> d!85210 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85210 (= (checkBitsLoop!0 (_1!11817 lt!394044) nBits!297 bit!26 from!289) lt!394829)))

(declare-fun e!176055 () Bool)

(declare-fun lt!394820 () (_ BitVec 64))

(declare-fun b!254118 () Bool)

(assert (=> b!254118 (= e!176055 (= (bvsub lt!394820 from!289) (bitIndex!0 (size!6032 (buf!6540 (_2!11821 lt!394829))) (currentByte!12004 (_2!11821 lt!394829)) (currentBit!11999 (_2!11821 lt!394829)))))))

(assert (=> b!254118 (or (= (bvand lt!394820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394820 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!394825 () (_ BitVec 64))

(assert (=> b!254118 (= lt!394820 (bvadd lt!394825 nBits!297))))

(assert (=> b!254118 (or (not (= (bvand lt!394825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394825 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254118 (= lt!394825 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394044))) (currentByte!12004 (_1!11817 lt!394044)) (currentBit!11999 (_1!11817 lt!394044))))))

(declare-fun b!254119 () Bool)

(declare-fun res!212951 () Bool)

(assert (=> b!254119 (=> (not res!212951) (not e!176056))))

(assert (=> b!254119 (= res!212951 e!176055)))

(declare-fun res!212950 () Bool)

(assert (=> b!254119 (=> res!212950 e!176055)))

(assert (=> b!254119 (= res!212950 (not (_1!11821 lt!394829)))))

(declare-fun b!254120 () Bool)

(declare-fun res!212952 () Bool)

(assert (=> b!254120 (=> (not res!212952) (not e!176056))))

(assert (=> b!254120 (= res!212952 (and (= (buf!6540 (_1!11817 lt!394044)) (buf!6540 (_2!11821 lt!394829))) (or (not (= nBits!297 from!289)) (_1!11821 lt!394829))))))

(declare-fun b!254121 () Bool)

(assert (=> b!254121 (= e!176053 (tuple2!21781 true (_1!11817 lt!394044)))))

(declare-fun b!254122 () Bool)

(declare-fun lt!394828 () tuple2!21780)

(assert (=> b!254122 (= lt!394828 (checkBitsLoop!0 (_2!11821 lt!394826) nBits!297 bit!26 (bvadd from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!394823 () Unit!18239)

(declare-fun lt!394821 () Unit!18239)

(assert (=> b!254122 (= lt!394823 lt!394821)))

(declare-fun lt!394822 () (_ BitVec 64))

(declare-fun lt!394824 () (_ BitVec 64))

(assert (=> b!254122 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11821 lt!394826)))) ((_ sign_extend 32) (currentByte!12004 (_2!11821 lt!394826))) ((_ sign_extend 32) (currentBit!11999 (_2!11821 lt!394826))) (bvsub lt!394822 lt!394824))))

(assert (=> b!254122 (= lt!394821 (validateOffsetBitsIneqLemma!0 (_1!11817 lt!394044) (_2!11821 lt!394826) lt!394822 lt!394824))))

(assert (=> b!254122 (= lt!394824 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254122 (= lt!394822 (bvsub nBits!297 from!289))))

(assert (=> b!254122 (= e!176054 (tuple2!21781 (_1!11821 lt!394828) (_2!11821 lt!394828)))))

(declare-fun b!254123 () Bool)

(declare-fun e!176057 () Bool)

(assert (=> b!254123 (= e!176057 (= bit!26 (_2!11816 (readBitPure!0 (_1!11817 lt!394044)))))))

(declare-fun b!254124 () Bool)

(assert (=> b!254124 (= e!176053 e!176054)))

(assert (=> b!254124 (= lt!394826 (readBit!0 (_1!11817 lt!394044)))))

(declare-fun c!11710 () Bool)

(assert (=> b!254124 (= c!11710 (not (= (_1!11821 lt!394826) bit!26)))))

(declare-fun b!254125 () Bool)

(assert (=> b!254125 (= e!176056 e!176057)))

(declare-fun res!212953 () Bool)

(assert (=> b!254125 (=> res!212953 e!176057)))

(assert (=> b!254125 (= res!212953 (or (not (_1!11821 lt!394829)) (bvsge from!289 nBits!297)))))

(assert (= (and d!85210 c!11709) b!254121))

(assert (= (and d!85210 (not c!11709)) b!254124))

(assert (= (and b!254124 c!11710) b!254117))

(assert (= (and b!254124 (not c!11710)) b!254122))

(assert (= (and d!85210 res!212949) b!254120))

(assert (= (and b!254120 res!212952) b!254119))

(assert (= (and b!254119 (not res!212950)) b!254118))

(assert (= (and b!254119 res!212951) b!254125))

(assert (= (and b!254125 (not res!212953)) b!254123))

(declare-fun m!382667 () Bool)

(assert (=> d!85210 m!382667))

(assert (=> d!85210 m!382157))

(assert (=> b!254118 m!382667))

(assert (=> b!254118 m!382157))

(assert (=> b!254124 m!382297))

(assert (=> b!254123 m!382037))

(declare-fun m!382669 () Bool)

(assert (=> b!254122 m!382669))

(declare-fun m!382671 () Bool)

(assert (=> b!254122 m!382671))

(declare-fun m!382673 () Bool)

(assert (=> b!254122 m!382673))

(assert (=> d!85000 d!85210))

(declare-fun d!85212 () Bool)

(assert (=> d!85212 (= (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394058)))) ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394058))) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394058)))) (bvsub (bvmul ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394058)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394058))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394058))))))))

(assert (=> d!85024 d!85212))

(declare-fun d!85214 () Bool)

(assert (=> d!85214 (= (invariant!0 (currentBit!11999 (_1!11816 lt!394058)) (currentByte!12004 (_1!11816 lt!394058)) (size!6032 (buf!6540 (_1!11816 lt!394058)))) (and (bvsge (currentBit!11999 (_1!11816 lt!394058)) #b00000000000000000000000000000000) (bvslt (currentBit!11999 (_1!11816 lt!394058)) #b00000000000000000000000000001000) (bvsge (currentByte!12004 (_1!11816 lt!394058)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12004 (_1!11816 lt!394058)) (size!6032 (buf!6540 (_1!11816 lt!394058)))) (and (= (currentBit!11999 (_1!11816 lt!394058)) #b00000000000000000000000000000000) (= (currentByte!12004 (_1!11816 lt!394058)) (size!6032 (buf!6540 (_1!11816 lt!394058))))))))))

(assert (=> d!85024 d!85214))

(declare-fun d!85216 () Bool)

(assert (=> d!85216 (= (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394065))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394065)))) (bvsub (bvmul ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394065))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394065))))))))

(assert (=> d!85034 d!85216))

(declare-fun d!85218 () Bool)

(assert (=> d!85218 (= (invariant!0 (currentBit!11999 (_2!11815 lt!394065)) (currentByte!12004 (_2!11815 lt!394065)) (size!6032 (buf!6540 (_2!11815 lt!394065)))) (and (bvsge (currentBit!11999 (_2!11815 lt!394065)) #b00000000000000000000000000000000) (bvslt (currentBit!11999 (_2!11815 lt!394065)) #b00000000000000000000000000001000) (bvsge (currentByte!12004 (_2!11815 lt!394065)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12004 (_2!11815 lt!394065)) (size!6032 (buf!6540 (_2!11815 lt!394065)))) (and (= (currentBit!11999 (_2!11815 lt!394065)) #b00000000000000000000000000000000) (= (currentByte!12004 (_2!11815 lt!394065)) (size!6032 (buf!6540 (_2!11815 lt!394065))))))))))

(assert (=> d!85034 d!85218))

(declare-fun d!85220 () Bool)

(assert (=> d!85220 (= (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055)))) (bvsub (bvmul ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))))))))

(assert (=> d!85012 d!85220))

(declare-fun d!85222 () Bool)

(assert (=> d!85222 (= (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055)))) (bvsub (bvmul ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))))))))

(assert (=> d!85036 d!85222))

(declare-fun d!85224 () Bool)

(assert (=> d!85224 (= (invariant!0 (currentBit!11999 (_2!11815 lt!394055)) (currentByte!12004 (_2!11815 lt!394055)) (size!6032 (buf!6540 (_2!11815 lt!394055)))) (and (bvsge (currentBit!11999 (_2!11815 lt!394055)) #b00000000000000000000000000000000) (bvslt (currentBit!11999 (_2!11815 lt!394055)) #b00000000000000000000000000001000) (bvsge (currentByte!12004 (_2!11815 lt!394055)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12004 (_2!11815 lt!394055)) (size!6032 (buf!6540 (_2!11815 lt!394055)))) (and (= (currentBit!11999 (_2!11815 lt!394055)) #b00000000000000000000000000000000) (= (currentByte!12004 (_2!11815 lt!394055)) (size!6032 (buf!6540 (_2!11815 lt!394055))))))))))

(assert (=> d!85036 d!85224))

(declare-fun b!254140 () Bool)

(declare-fun e!176073 () Bool)

(declare-fun e!176072 () Bool)

(assert (=> b!254140 (= e!176073 e!176072)))

(declare-fun c!11713 () Bool)

(declare-datatypes ((tuple4!302 0))(
  ( (tuple4!303 (_1!11824 (_ BitVec 32)) (_2!11824 (_ BitVec 32)) (_3!931 (_ BitVec 32)) (_4!151 (_ BitVec 32))) )
))
(declare-fun lt!394839 () tuple4!302)

(assert (=> b!254140 (= c!11713 (= (_3!931 lt!394839) (_4!151 lt!394839)))))

(declare-fun b!254141 () Bool)

(declare-fun e!176071 () Bool)

(assert (=> b!254141 (= e!176072 e!176071)))

(declare-fun res!212965 () Bool)

(declare-fun lt!394837 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254141 (= res!212965 (byteRangesEq!0 (select (arr!7019 (buf!6540 thiss!1005)) (_3!931 lt!394839)) (select (arr!7019 (buf!6540 (_2!11815 lt!394055))) (_3!931 lt!394839)) lt!394837 #b00000000000000000000000000001000))))

(assert (=> b!254141 (=> (not res!212965) (not e!176071))))

(declare-fun b!254142 () Bool)

(declare-fun e!176070 () Bool)

(assert (=> b!254142 (= e!176070 e!176073)))

(declare-fun res!212968 () Bool)

(assert (=> b!254142 (=> (not res!212968) (not e!176073))))

(declare-fun e!176074 () Bool)

(assert (=> b!254142 (= res!212968 e!176074)))

(declare-fun res!212964 () Bool)

(assert (=> b!254142 (=> res!212964 e!176074)))

(assert (=> b!254142 (= res!212964 (bvsge (_1!11824 lt!394839) (_2!11824 lt!394839)))))

(declare-fun lt!394838 () (_ BitVec 32))

(assert (=> b!254142 (= lt!394838 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254142 (= lt!394837 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!302)

(assert (=> b!254142 (= lt!394839 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(declare-fun d!85226 () Bool)

(declare-fun res!212966 () Bool)

(assert (=> d!85226 (=> res!212966 e!176070)))

(assert (=> d!85226 (= res!212966 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(assert (=> d!85226 (= (arrayBitRangesEq!0 (buf!6540 thiss!1005) (buf!6540 (_2!11815 lt!394055)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))) e!176070)))

(declare-fun b!254143 () Bool)

(declare-fun e!176075 () Bool)

(declare-fun call!3990 () Bool)

(assert (=> b!254143 (= e!176075 call!3990)))

(declare-fun b!254144 () Bool)

(declare-fun arrayRangesEq!928 (array!13749 array!13749 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254144 (= e!176074 (arrayRangesEq!928 (buf!6540 thiss!1005) (buf!6540 (_2!11815 lt!394055)) (_1!11824 lt!394839) (_2!11824 lt!394839)))))

(declare-fun b!254145 () Bool)

(declare-fun res!212967 () Bool)

(assert (=> b!254145 (= res!212967 (= lt!394838 #b00000000000000000000000000000000))))

(assert (=> b!254145 (=> res!212967 e!176075)))

(assert (=> b!254145 (= e!176071 e!176075)))

(declare-fun bm!3987 () Bool)

(assert (=> bm!3987 (= call!3990 (byteRangesEq!0 (ite c!11713 (select (arr!7019 (buf!6540 thiss!1005)) (_3!931 lt!394839)) (select (arr!7019 (buf!6540 thiss!1005)) (_4!151 lt!394839))) (ite c!11713 (select (arr!7019 (buf!6540 (_2!11815 lt!394055))) (_3!931 lt!394839)) (select (arr!7019 (buf!6540 (_2!11815 lt!394055))) (_4!151 lt!394839))) (ite c!11713 lt!394837 #b00000000000000000000000000000000) lt!394838))))

(declare-fun b!254146 () Bool)

(assert (=> b!254146 (= e!176072 call!3990)))

(assert (= (and d!85226 (not res!212966)) b!254142))

(assert (= (and b!254142 (not res!212964)) b!254144))

(assert (= (and b!254142 res!212968) b!254140))

(assert (= (and b!254140 c!11713) b!254146))

(assert (= (and b!254140 (not c!11713)) b!254141))

(assert (= (and b!254141 res!212965) b!254145))

(assert (= (and b!254145 (not res!212967)) b!254143))

(assert (= (or b!254146 b!254143) bm!3987))

(declare-fun m!382675 () Bool)

(assert (=> b!254141 m!382675))

(declare-fun m!382677 () Bool)

(assert (=> b!254141 m!382677))

(assert (=> b!254141 m!382675))

(assert (=> b!254141 m!382677))

(declare-fun m!382679 () Bool)

(assert (=> b!254141 m!382679))

(assert (=> b!254142 m!382075))

(declare-fun m!382681 () Bool)

(assert (=> b!254142 m!382681))

(declare-fun m!382683 () Bool)

(assert (=> b!254144 m!382683))

(assert (=> bm!3987 m!382675))

(assert (=> bm!3987 m!382677))

(declare-fun m!382685 () Bool)

(assert (=> bm!3987 m!382685))

(declare-fun m!382687 () Bool)

(assert (=> bm!3987 m!382687))

(declare-fun m!382689 () Bool)

(assert (=> bm!3987 m!382689))

(assert (=> b!253891 d!85226))

(assert (=> b!253891 d!85042))

(declare-fun d!85228 () Bool)

(declare-fun e!176076 () Bool)

(assert (=> d!85228 e!176076))

(declare-fun res!212969 () Bool)

(assert (=> d!85228 (=> (not res!212969) (not e!176076))))

(assert (=> d!85228 (= res!212969 (= (buf!6540 (_2!11815 (increaseBitIndex!0 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))) (buf!6540 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))))

(declare-fun lt!394841 () Bool)

(assert (=> d!85228 (= lt!394841 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))) (currentByte!12004 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!394845 () tuple2!21780)

(assert (=> d!85228 (= lt!394845 (tuple2!21781 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))) (currentByte!12004 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11815 (increaseBitIndex!0 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))))

(assert (=> d!85228 (validate_offset_bit!0 ((_ sign_extend 32) (size!6032 (buf!6540 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))) ((_ sign_extend 32) (currentByte!12004 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))) ((_ sign_extend 32) (currentBit!11999 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))))

(assert (=> d!85228 (= (readBit!0 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))) lt!394845)))

(declare-fun lt!394840 () (_ BitVec 64))

(declare-fun lt!394844 () (_ BitVec 64))

(declare-fun b!254147 () Bool)

(assert (=> b!254147 (= e!176076 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 (increaseBitIndex!0 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))) (currentByte!12004 (_2!11815 (increaseBitIndex!0 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))) (currentBit!11999 (_2!11815 (increaseBitIndex!0 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))) (bvadd lt!394840 lt!394844)))))

(assert (=> b!254147 (or (not (= (bvand lt!394840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394844 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394840 lt!394844) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254147 (= lt!394844 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254147 (= lt!394840 (bitIndex!0 (size!6032 (buf!6540 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))) (currentByte!12004 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))) (currentBit!11999 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))))

(declare-fun lt!394846 () Bool)

(assert (=> b!254147 (= lt!394846 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))) (currentByte!12004 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!394843 () Bool)

(assert (=> b!254147 (= lt!394843 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))) (currentByte!12004 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!394842 () Bool)

(assert (=> b!254147 (= lt!394842 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))) (currentByte!12004 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!85228 res!212969) b!254147))

(declare-fun m!382691 () Bool)

(assert (=> d!85228 m!382691))

(declare-fun m!382693 () Bool)

(assert (=> d!85228 m!382693))

(declare-fun m!382695 () Bool)

(assert (=> d!85228 m!382695))

(declare-fun m!382697 () Bool)

(assert (=> d!85228 m!382697))

(assert (=> b!254147 m!382693))

(assert (=> b!254147 m!382695))

(declare-fun m!382699 () Bool)

(assert (=> b!254147 m!382699))

(assert (=> b!254147 m!382691))

(declare-fun m!382701 () Bool)

(assert (=> b!254147 m!382701))

(assert (=> d!85022 d!85228))

(assert (=> b!253889 d!85042))

(assert (=> b!253889 d!85036))

(declare-fun d!85230 () Bool)

(declare-fun res!212970 () Bool)

(declare-fun e!176078 () Bool)

(assert (=> d!85230 (=> (not res!212970) (not e!176078))))

(assert (=> d!85230 (= res!212970 (= (size!6032 (buf!6540 (_1!11817 lt!394216))) (size!6032 (buf!6540 thiss!1005))))))

(assert (=> d!85230 (= (isPrefixOf!0 (_1!11817 lt!394216) thiss!1005) e!176078)))

(declare-fun b!254148 () Bool)

(declare-fun res!212971 () Bool)

(assert (=> b!254148 (=> (not res!212971) (not e!176078))))

(assert (=> b!254148 (= res!212971 (bvsle (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394216))) (currentByte!12004 (_1!11817 lt!394216)) (currentBit!11999 (_1!11817 lt!394216))) (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(declare-fun b!254149 () Bool)

(declare-fun e!176077 () Bool)

(assert (=> b!254149 (= e!176078 e!176077)))

(declare-fun res!212972 () Bool)

(assert (=> b!254149 (=> res!212972 e!176077)))

(assert (=> b!254149 (= res!212972 (= (size!6032 (buf!6540 (_1!11817 lt!394216))) #b00000000000000000000000000000000))))

(declare-fun b!254150 () Bool)

(assert (=> b!254150 (= e!176077 (arrayBitRangesEq!0 (buf!6540 (_1!11817 lt!394216)) (buf!6540 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394216))) (currentByte!12004 (_1!11817 lt!394216)) (currentBit!11999 (_1!11817 lt!394216)))))))

(assert (= (and d!85230 res!212970) b!254148))

(assert (= (and b!254148 res!212971) b!254149))

(assert (= (and b!254149 (not res!212972)) b!254150))

(declare-fun m!382703 () Bool)

(assert (=> b!254148 m!382703))

(assert (=> b!254148 m!382075))

(assert (=> b!254150 m!382703))

(assert (=> b!254150 m!382703))

(declare-fun m!382705 () Bool)

(assert (=> b!254150 m!382705))

(assert (=> b!253839 d!85230))

(declare-fun d!85232 () Bool)

(declare-fun res!212973 () Bool)

(declare-fun e!176080 () Bool)

(assert (=> d!85232 (=> (not res!212973) (not e!176080))))

(assert (=> d!85232 (= res!212973 (= (size!6032 (buf!6540 (_1!11817 lt!394193))) (size!6032 (buf!6540 (_2!11815 lt!394055)))))))

(assert (=> d!85232 (= (isPrefixOf!0 (_1!11817 lt!394193) (_2!11815 lt!394055)) e!176080)))

(declare-fun b!254151 () Bool)

(declare-fun res!212974 () Bool)

(assert (=> b!254151 (=> (not res!212974) (not e!176080))))

(assert (=> b!254151 (= res!212974 (bvsle (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394193))) (currentByte!12004 (_1!11817 lt!394193)) (currentBit!11999 (_1!11817 lt!394193))) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(declare-fun b!254152 () Bool)

(declare-fun e!176079 () Bool)

(assert (=> b!254152 (= e!176080 e!176079)))

(declare-fun res!212975 () Bool)

(assert (=> b!254152 (=> res!212975 e!176079)))

(assert (=> b!254152 (= res!212975 (= (size!6032 (buf!6540 (_1!11817 lt!394193))) #b00000000000000000000000000000000))))

(declare-fun b!254153 () Bool)

(assert (=> b!254153 (= e!176079 (arrayBitRangesEq!0 (buf!6540 (_1!11817 lt!394193)) (buf!6540 (_2!11815 lt!394055)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394193))) (currentByte!12004 (_1!11817 lt!394193)) (currentBit!11999 (_1!11817 lt!394193)))))))

(assert (= (and d!85232 res!212973) b!254151))

(assert (= (and b!254151 res!212974) b!254152))

(assert (= (and b!254152 (not res!212975)) b!254153))

(declare-fun m!382707 () Bool)

(assert (=> b!254151 m!382707))

(assert (=> b!254151 m!382017))

(assert (=> b!254153 m!382707))

(assert (=> b!254153 m!382707))

(declare-fun m!382709 () Bool)

(assert (=> b!254153 m!382709))

(assert (=> b!253834 d!85232))

(declare-fun b!254154 () Bool)

(declare-fun e!176082 () tuple2!21780)

(declare-fun lt!394853 () tuple2!21780)

(assert (=> b!254154 (= e!176082 (tuple2!21781 false (_2!11821 lt!394853)))))

(declare-fun d!85234 () Bool)

(declare-fun e!176084 () Bool)

(assert (=> d!85234 e!176084))

(declare-fun res!212976 () Bool)

(assert (=> d!85234 (=> (not res!212976) (not e!176084))))

(declare-fun lt!394856 () tuple2!21780)

(declare-fun lt!394857 () (_ BitVec 64))

(assert (=> d!85234 (= res!212976 (bvsge (bvsub lt!394857 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6032 (buf!6540 (_2!11821 lt!394856))) (currentByte!12004 (_2!11821 lt!394856)) (currentBit!11999 (_2!11821 lt!394856)))))))

(assert (=> d!85234 (or (= (bvand lt!394857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394857 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!394854 () (_ BitVec 64))

(assert (=> d!85234 (= lt!394857 (bvadd lt!394854 nBits!297))))

(assert (=> d!85234 (or (not (= (bvand lt!394854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394854 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85234 (= lt!394854 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394057))) (currentByte!12004 (_1!11817 lt!394057)) (currentBit!11999 (_1!11817 lt!394057))))))

(declare-fun e!176081 () tuple2!21780)

(assert (=> d!85234 (= lt!394856 e!176081)))

(declare-fun c!11714 () Bool)

(assert (=> d!85234 (= c!11714 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!85234 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85234 (= (checkBitsLoop!0 (_1!11817 lt!394057) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!394856)))

(declare-fun lt!394847 () (_ BitVec 64))

(declare-fun b!254155 () Bool)

(declare-fun e!176083 () Bool)

(assert (=> b!254155 (= e!176083 (= (bvsub lt!394847 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6032 (buf!6540 (_2!11821 lt!394856))) (currentByte!12004 (_2!11821 lt!394856)) (currentBit!11999 (_2!11821 lt!394856)))))))

(assert (=> b!254155 (or (= (bvand lt!394847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394847 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!394852 () (_ BitVec 64))

(assert (=> b!254155 (= lt!394847 (bvadd lt!394852 nBits!297))))

(assert (=> b!254155 (or (not (= (bvand lt!394852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394852 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254155 (= lt!394852 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394057))) (currentByte!12004 (_1!11817 lt!394057)) (currentBit!11999 (_1!11817 lt!394057))))))

(declare-fun b!254156 () Bool)

(declare-fun res!212978 () Bool)

(assert (=> b!254156 (=> (not res!212978) (not e!176084))))

(assert (=> b!254156 (= res!212978 e!176083)))

(declare-fun res!212977 () Bool)

(assert (=> b!254156 (=> res!212977 e!176083)))

(assert (=> b!254156 (= res!212977 (not (_1!11821 lt!394856)))))

(declare-fun b!254157 () Bool)

(declare-fun res!212979 () Bool)

(assert (=> b!254157 (=> (not res!212979) (not e!176084))))

(assert (=> b!254157 (= res!212979 (and (= (buf!6540 (_1!11817 lt!394057)) (buf!6540 (_2!11821 lt!394856))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11821 lt!394856))))))

(declare-fun b!254158 () Bool)

(assert (=> b!254158 (= e!176081 (tuple2!21781 true (_1!11817 lt!394057)))))

(declare-fun lt!394855 () tuple2!21780)

(declare-fun b!254159 () Bool)

(assert (=> b!254159 (= lt!394855 (checkBitsLoop!0 (_2!11821 lt!394853) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!394850 () Unit!18239)

(declare-fun lt!394848 () Unit!18239)

(assert (=> b!254159 (= lt!394850 lt!394848)))

(declare-fun lt!394849 () (_ BitVec 64))

(declare-fun lt!394851 () (_ BitVec 64))

(assert (=> b!254159 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11821 lt!394853)))) ((_ sign_extend 32) (currentByte!12004 (_2!11821 lt!394853))) ((_ sign_extend 32) (currentBit!11999 (_2!11821 lt!394853))) (bvsub lt!394849 lt!394851))))

(assert (=> b!254159 (= lt!394848 (validateOffsetBitsIneqLemma!0 (_1!11817 lt!394057) (_2!11821 lt!394853) lt!394849 lt!394851))))

(assert (=> b!254159 (= lt!394851 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254159 (= lt!394849 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254159 (= e!176082 (tuple2!21781 (_1!11821 lt!394855) (_2!11821 lt!394855)))))

(declare-fun b!254160 () Bool)

(declare-fun e!176085 () Bool)

(assert (=> b!254160 (= e!176085 (= bit!26 (_2!11816 (readBitPure!0 (_1!11817 lt!394057)))))))

(declare-fun b!254161 () Bool)

(assert (=> b!254161 (= e!176081 e!176082)))

(assert (=> b!254161 (= lt!394853 (readBit!0 (_1!11817 lt!394057)))))

(declare-fun c!11715 () Bool)

(assert (=> b!254161 (= c!11715 (not (= (_1!11821 lt!394853) bit!26)))))

(declare-fun b!254162 () Bool)

(assert (=> b!254162 (= e!176084 e!176085)))

(declare-fun res!212980 () Bool)

(assert (=> b!254162 (=> res!212980 e!176085)))

(assert (=> b!254162 (= res!212980 (or (not (_1!11821 lt!394856)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(assert (= (and d!85234 c!11714) b!254158))

(assert (= (and d!85234 (not c!11714)) b!254161))

(assert (= (and b!254161 c!11715) b!254154))

(assert (= (and b!254161 (not c!11715)) b!254159))

(assert (= (and d!85234 res!212976) b!254157))

(assert (= (and b!254157 res!212979) b!254156))

(assert (= (and b!254156 (not res!212977)) b!254155))

(assert (= (and b!254156 res!212978) b!254162))

(assert (= (and b!254162 (not res!212980)) b!254160))

(declare-fun m!382711 () Bool)

(assert (=> d!85234 m!382711))

(declare-fun m!382713 () Bool)

(assert (=> d!85234 m!382713))

(assert (=> b!254155 m!382711))

(assert (=> b!254155 m!382713))

(declare-fun m!382715 () Bool)

(assert (=> b!254161 m!382715))

(declare-fun m!382717 () Bool)

(assert (=> b!254160 m!382717))

(declare-fun m!382719 () Bool)

(assert (=> b!254159 m!382719))

(declare-fun m!382721 () Bool)

(assert (=> b!254159 m!382721))

(declare-fun m!382723 () Bool)

(assert (=> b!254159 m!382723))

(assert (=> d!84984 d!85234))

(assert (=> b!253837 d!85042))

(declare-fun d!85236 () Bool)

(assert (=> d!85236 (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394065)) (buf!6540 thiss!1005) lt!394212 lt!394209)))

(declare-fun lt!394860 () Unit!18239)

(declare-fun choose!8 (array!13749 array!13749 (_ BitVec 64) (_ BitVec 64)) Unit!18239)

(assert (=> d!85236 (= lt!394860 (choose!8 (buf!6540 thiss!1005) (buf!6540 (_2!11815 lt!394065)) lt!394212 lt!394209))))

(assert (=> d!85236 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394212) (bvsle lt!394212 lt!394209))))

(assert (=> d!85236 (= (arrayBitRangesEqSymmetric!0 (buf!6540 thiss!1005) (buf!6540 (_2!11815 lt!394065)) lt!394212 lt!394209) lt!394860)))

(declare-fun bs!21539 () Bool)

(assert (= bs!21539 d!85236))

(assert (=> bs!21539 m!382215))

(declare-fun m!382725 () Bool)

(assert (=> bs!21539 m!382725))

(assert (=> b!253837 d!85236))

(declare-fun b!254163 () Bool)

(declare-fun e!176089 () Bool)

(declare-fun e!176088 () Bool)

(assert (=> b!254163 (= e!176089 e!176088)))

(declare-fun c!11716 () Bool)

(declare-fun lt!394863 () tuple4!302)

(assert (=> b!254163 (= c!11716 (= (_3!931 lt!394863) (_4!151 lt!394863)))))

(declare-fun b!254164 () Bool)

(declare-fun e!176087 () Bool)

(assert (=> b!254164 (= e!176088 e!176087)))

(declare-fun lt!394861 () (_ BitVec 32))

(declare-fun res!212982 () Bool)

(assert (=> b!254164 (= res!212982 (byteRangesEq!0 (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_3!931 lt!394863)) (select (arr!7019 (buf!6540 thiss!1005)) (_3!931 lt!394863)) lt!394861 #b00000000000000000000000000001000))))

(assert (=> b!254164 (=> (not res!212982) (not e!176087))))

(declare-fun b!254165 () Bool)

(declare-fun e!176086 () Bool)

(assert (=> b!254165 (= e!176086 e!176089)))

(declare-fun res!212985 () Bool)

(assert (=> b!254165 (=> (not res!212985) (not e!176089))))

(declare-fun e!176090 () Bool)

(assert (=> b!254165 (= res!212985 e!176090)))

(declare-fun res!212981 () Bool)

(assert (=> b!254165 (=> res!212981 e!176090)))

(assert (=> b!254165 (= res!212981 (bvsge (_1!11824 lt!394863) (_2!11824 lt!394863)))))

(declare-fun lt!394862 () (_ BitVec 32))

(assert (=> b!254165 (= lt!394862 ((_ extract 31 0) (bvsrem lt!394209 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254165 (= lt!394861 ((_ extract 31 0) (bvsrem lt!394212 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254165 (= lt!394863 (arrayBitIndices!0 lt!394212 lt!394209))))

(declare-fun d!85238 () Bool)

(declare-fun res!212983 () Bool)

(assert (=> d!85238 (=> res!212983 e!176086)))

(assert (=> d!85238 (= res!212983 (bvsge lt!394212 lt!394209))))

(assert (=> d!85238 (= (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394065)) (buf!6540 thiss!1005) lt!394212 lt!394209) e!176086)))

(declare-fun b!254166 () Bool)

(declare-fun e!176091 () Bool)

(declare-fun call!3991 () Bool)

(assert (=> b!254166 (= e!176091 call!3991)))

(declare-fun b!254167 () Bool)

(assert (=> b!254167 (= e!176090 (arrayRangesEq!928 (buf!6540 (_2!11815 lt!394065)) (buf!6540 thiss!1005) (_1!11824 lt!394863) (_2!11824 lt!394863)))))

(declare-fun b!254168 () Bool)

(declare-fun res!212984 () Bool)

(assert (=> b!254168 (= res!212984 (= lt!394862 #b00000000000000000000000000000000))))

(assert (=> b!254168 (=> res!212984 e!176091)))

(assert (=> b!254168 (= e!176087 e!176091)))

(declare-fun bm!3988 () Bool)

(assert (=> bm!3988 (= call!3991 (byteRangesEq!0 (ite c!11716 (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_3!931 lt!394863)) (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_4!151 lt!394863))) (ite c!11716 (select (arr!7019 (buf!6540 thiss!1005)) (_3!931 lt!394863)) (select (arr!7019 (buf!6540 thiss!1005)) (_4!151 lt!394863))) (ite c!11716 lt!394861 #b00000000000000000000000000000000) lt!394862))))

(declare-fun b!254169 () Bool)

(assert (=> b!254169 (= e!176088 call!3991)))

(assert (= (and d!85238 (not res!212983)) b!254165))

(assert (= (and b!254165 (not res!212981)) b!254167))

(assert (= (and b!254165 res!212985) b!254163))

(assert (= (and b!254163 c!11716) b!254169))

(assert (= (and b!254163 (not c!11716)) b!254164))

(assert (= (and b!254164 res!212982) b!254168))

(assert (= (and b!254168 (not res!212984)) b!254166))

(assert (= (or b!254169 b!254166) bm!3988))

(declare-fun m!382727 () Bool)

(assert (=> b!254164 m!382727))

(declare-fun m!382729 () Bool)

(assert (=> b!254164 m!382729))

(assert (=> b!254164 m!382727))

(assert (=> b!254164 m!382729))

(declare-fun m!382731 () Bool)

(assert (=> b!254164 m!382731))

(declare-fun m!382733 () Bool)

(assert (=> b!254165 m!382733))

(declare-fun m!382735 () Bool)

(assert (=> b!254167 m!382735))

(assert (=> bm!3988 m!382727))

(assert (=> bm!3988 m!382729))

(declare-fun m!382737 () Bool)

(assert (=> bm!3988 m!382737))

(declare-fun m!382739 () Bool)

(assert (=> bm!3988 m!382739))

(declare-fun m!382741 () Bool)

(assert (=> bm!3988 m!382741))

(assert (=> b!253837 d!85238))

(assert (=> b!253832 d!85036))

(declare-fun d!85240 () Bool)

(assert (=> d!85240 (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394065)) (buf!6540 (_2!11815 lt!394055)) lt!394189 lt!394186)))

(declare-fun lt!394864 () Unit!18239)

(assert (=> d!85240 (= lt!394864 (choose!8 (buf!6540 (_2!11815 lt!394055)) (buf!6540 (_2!11815 lt!394065)) lt!394189 lt!394186))))

(assert (=> d!85240 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394189) (bvsle lt!394189 lt!394186))))

(assert (=> d!85240 (= (arrayBitRangesEqSymmetric!0 (buf!6540 (_2!11815 lt!394055)) (buf!6540 (_2!11815 lt!394065)) lt!394189 lt!394186) lt!394864)))

(declare-fun bs!21540 () Bool)

(assert (= bs!21540 d!85240))

(assert (=> bs!21540 m!382179))

(declare-fun m!382743 () Bool)

(assert (=> bs!21540 m!382743))

(assert (=> b!253832 d!85240))

(declare-fun b!254170 () Bool)

(declare-fun e!176095 () Bool)

(declare-fun e!176094 () Bool)

(assert (=> b!254170 (= e!176095 e!176094)))

(declare-fun c!11717 () Bool)

(declare-fun lt!394867 () tuple4!302)

(assert (=> b!254170 (= c!11717 (= (_3!931 lt!394867) (_4!151 lt!394867)))))

(declare-fun b!254171 () Bool)

(declare-fun e!176093 () Bool)

(assert (=> b!254171 (= e!176094 e!176093)))

(declare-fun res!212987 () Bool)

(declare-fun lt!394865 () (_ BitVec 32))

(assert (=> b!254171 (= res!212987 (byteRangesEq!0 (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_3!931 lt!394867)) (select (arr!7019 (buf!6540 (_2!11815 lt!394055))) (_3!931 lt!394867)) lt!394865 #b00000000000000000000000000001000))))

(assert (=> b!254171 (=> (not res!212987) (not e!176093))))

(declare-fun b!254172 () Bool)

(declare-fun e!176092 () Bool)

(assert (=> b!254172 (= e!176092 e!176095)))

(declare-fun res!212990 () Bool)

(assert (=> b!254172 (=> (not res!212990) (not e!176095))))

(declare-fun e!176096 () Bool)

(assert (=> b!254172 (= res!212990 e!176096)))

(declare-fun res!212986 () Bool)

(assert (=> b!254172 (=> res!212986 e!176096)))

(assert (=> b!254172 (= res!212986 (bvsge (_1!11824 lt!394867) (_2!11824 lt!394867)))))

(declare-fun lt!394866 () (_ BitVec 32))

(assert (=> b!254172 (= lt!394866 ((_ extract 31 0) (bvsrem lt!394186 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254172 (= lt!394865 ((_ extract 31 0) (bvsrem lt!394189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254172 (= lt!394867 (arrayBitIndices!0 lt!394189 lt!394186))))

(declare-fun d!85242 () Bool)

(declare-fun res!212988 () Bool)

(assert (=> d!85242 (=> res!212988 e!176092)))

(assert (=> d!85242 (= res!212988 (bvsge lt!394189 lt!394186))))

(assert (=> d!85242 (= (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394065)) (buf!6540 (_2!11815 lt!394055)) lt!394189 lt!394186) e!176092)))

(declare-fun b!254173 () Bool)

(declare-fun e!176097 () Bool)

(declare-fun call!3992 () Bool)

(assert (=> b!254173 (= e!176097 call!3992)))

(declare-fun b!254174 () Bool)

(assert (=> b!254174 (= e!176096 (arrayRangesEq!928 (buf!6540 (_2!11815 lt!394065)) (buf!6540 (_2!11815 lt!394055)) (_1!11824 lt!394867) (_2!11824 lt!394867)))))

(declare-fun b!254175 () Bool)

(declare-fun res!212989 () Bool)

(assert (=> b!254175 (= res!212989 (= lt!394866 #b00000000000000000000000000000000))))

(assert (=> b!254175 (=> res!212989 e!176097)))

(assert (=> b!254175 (= e!176093 e!176097)))

(declare-fun bm!3989 () Bool)

(assert (=> bm!3989 (= call!3992 (byteRangesEq!0 (ite c!11717 (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_3!931 lt!394867)) (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_4!151 lt!394867))) (ite c!11717 (select (arr!7019 (buf!6540 (_2!11815 lt!394055))) (_3!931 lt!394867)) (select (arr!7019 (buf!6540 (_2!11815 lt!394055))) (_4!151 lt!394867))) (ite c!11717 lt!394865 #b00000000000000000000000000000000) lt!394866))))

(declare-fun b!254176 () Bool)

(assert (=> b!254176 (= e!176094 call!3992)))

(assert (= (and d!85242 (not res!212988)) b!254172))

(assert (= (and b!254172 (not res!212986)) b!254174))

(assert (= (and b!254172 res!212990) b!254170))

(assert (= (and b!254170 c!11717) b!254176))

(assert (= (and b!254170 (not c!11717)) b!254171))

(assert (= (and b!254171 res!212987) b!254175))

(assert (= (and b!254175 (not res!212989)) b!254173))

(assert (= (or b!254176 b!254173) bm!3989))

(declare-fun m!382745 () Bool)

(assert (=> b!254171 m!382745))

(declare-fun m!382747 () Bool)

(assert (=> b!254171 m!382747))

(assert (=> b!254171 m!382745))

(assert (=> b!254171 m!382747))

(declare-fun m!382749 () Bool)

(assert (=> b!254171 m!382749))

(declare-fun m!382751 () Bool)

(assert (=> b!254172 m!382751))

(declare-fun m!382753 () Bool)

(assert (=> b!254174 m!382753))

(assert (=> bm!3989 m!382745))

(assert (=> bm!3989 m!382747))

(declare-fun m!382755 () Bool)

(assert (=> bm!3989 m!382755))

(declare-fun m!382757 () Bool)

(assert (=> bm!3989 m!382757))

(declare-fun m!382759 () Bool)

(assert (=> bm!3989 m!382759))

(assert (=> b!253832 d!85242))

(assert (=> d!84988 d!84986))

(declare-fun d!85244 () Bool)

(assert (=> d!85244 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394059)))

(assert (=> d!85244 true))

(declare-fun _$6!432 () Unit!18239)

(assert (=> d!85244 (= (choose!9 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394065)) lt!394059 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))) _$6!432)))

(declare-fun bs!21541 () Bool)

(assert (= bs!21541 d!85244))

(assert (=> bs!21541 m!382009))

(assert (=> d!84988 d!85244))

(declare-fun d!85246 () Bool)

(assert (=> d!85246 (= (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394054)))) ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394054))) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394054)))) (bvsub (bvmul ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394054)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394054))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394054))))))))

(assert (=> d!85040 d!85246))

(declare-fun d!85248 () Bool)

(assert (=> d!85248 (= (invariant!0 (currentBit!11999 (_1!11816 lt!394054)) (currentByte!12004 (_1!11816 lt!394054)) (size!6032 (buf!6540 (_1!11816 lt!394054)))) (and (bvsge (currentBit!11999 (_1!11816 lt!394054)) #b00000000000000000000000000000000) (bvslt (currentBit!11999 (_1!11816 lt!394054)) #b00000000000000000000000000001000) (bvsge (currentByte!12004 (_1!11816 lt!394054)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12004 (_1!11816 lt!394054)) (size!6032 (buf!6540 (_1!11816 lt!394054)))) (and (= (currentBit!11999 (_1!11816 lt!394054)) #b00000000000000000000000000000000) (= (currentByte!12004 (_1!11816 lt!394054)) (size!6032 (buf!6540 (_1!11816 lt!394054))))))))))

(assert (=> d!85040 d!85248))

(declare-fun d!85250 () Bool)

(assert (=> d!85250 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21542 () Bool)

(assert (= bs!21542 d!85250))

(assert (=> bs!21542 m!382207))

(assert (=> b!253877 d!85250))

(assert (=> d!85020 d!84992))

(declare-fun d!85252 () Bool)

(assert (=> d!85252 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005)) (bvsub nBits!297 from!289))))

(assert (=> d!85252 true))

(declare-fun _$6!433 () Unit!18239)

(assert (=> d!85252 (= (choose!9 thiss!1005 (buf!6540 (_2!11815 lt!394065)) (bvsub nBits!297 from!289) (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))) _$6!433)))

(declare-fun bs!21543 () Bool)

(assert (= bs!21543 d!85252))

(assert (=> bs!21543 m!382027))

(assert (=> d!85020 d!85252))

(declare-fun b!254177 () Bool)

(declare-fun e!176101 () Bool)

(declare-fun e!176100 () Bool)

(assert (=> b!254177 (= e!176101 e!176100)))

(declare-fun c!11718 () Bool)

(declare-fun lt!394870 () tuple4!302)

(assert (=> b!254177 (= c!11718 (= (_3!931 lt!394870) (_4!151 lt!394870)))))

(declare-fun b!254178 () Bool)

(declare-fun e!176099 () Bool)

(assert (=> b!254178 (= e!176100 e!176099)))

(declare-fun lt!394868 () (_ BitVec 32))

(declare-fun res!212992 () Bool)

(assert (=> b!254178 (= res!212992 (byteRangesEq!0 (select (arr!7019 (buf!6540 (_2!11815 lt!394055))) (_3!931 lt!394870)) (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_3!931 lt!394870)) lt!394868 #b00000000000000000000000000001000))))

(assert (=> b!254178 (=> (not res!212992) (not e!176099))))

(declare-fun b!254179 () Bool)

(declare-fun e!176098 () Bool)

(assert (=> b!254179 (= e!176098 e!176101)))

(declare-fun res!212995 () Bool)

(assert (=> b!254179 (=> (not res!212995) (not e!176101))))

(declare-fun e!176102 () Bool)

(assert (=> b!254179 (= res!212995 e!176102)))

(declare-fun res!212991 () Bool)

(assert (=> b!254179 (=> res!212991 e!176102)))

(assert (=> b!254179 (= res!212991 (bvsge (_1!11824 lt!394870) (_2!11824 lt!394870)))))

(declare-fun lt!394869 () (_ BitVec 32))

(assert (=> b!254179 (= lt!394869 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254179 (= lt!394868 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254179 (= lt!394870 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(declare-fun d!85254 () Bool)

(declare-fun res!212993 () Bool)

(assert (=> d!85254 (=> res!212993 e!176098)))

(assert (=> d!85254 (= res!212993 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(assert (=> d!85254 (= (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394055)) (buf!6540 (_2!11815 lt!394065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))) e!176098)))

(declare-fun b!254180 () Bool)

(declare-fun e!176103 () Bool)

(declare-fun call!3993 () Bool)

(assert (=> b!254180 (= e!176103 call!3993)))

(declare-fun b!254181 () Bool)

(assert (=> b!254181 (= e!176102 (arrayRangesEq!928 (buf!6540 (_2!11815 lt!394055)) (buf!6540 (_2!11815 lt!394065)) (_1!11824 lt!394870) (_2!11824 lt!394870)))))

(declare-fun b!254182 () Bool)

(declare-fun res!212994 () Bool)

(assert (=> b!254182 (= res!212994 (= lt!394869 #b00000000000000000000000000000000))))

(assert (=> b!254182 (=> res!212994 e!176103)))

(assert (=> b!254182 (= e!176099 e!176103)))

(declare-fun bm!3990 () Bool)

(assert (=> bm!3990 (= call!3993 (byteRangesEq!0 (ite c!11718 (select (arr!7019 (buf!6540 (_2!11815 lt!394055))) (_3!931 lt!394870)) (select (arr!7019 (buf!6540 (_2!11815 lt!394055))) (_4!151 lt!394870))) (ite c!11718 (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_3!931 lt!394870)) (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_4!151 lt!394870))) (ite c!11718 lt!394868 #b00000000000000000000000000000000) lt!394869))))

(declare-fun b!254183 () Bool)

(assert (=> b!254183 (= e!176100 call!3993)))

(assert (= (and d!85254 (not res!212993)) b!254179))

(assert (= (and b!254179 (not res!212991)) b!254181))

(assert (= (and b!254179 res!212995) b!254177))

(assert (= (and b!254177 c!11718) b!254183))

(assert (= (and b!254177 (not c!11718)) b!254178))

(assert (= (and b!254178 res!212992) b!254182))

(assert (= (and b!254182 (not res!212994)) b!254180))

(assert (= (or b!254183 b!254180) bm!3990))

(declare-fun m!382761 () Bool)

(assert (=> b!254178 m!382761))

(declare-fun m!382763 () Bool)

(assert (=> b!254178 m!382763))

(assert (=> b!254178 m!382761))

(assert (=> b!254178 m!382763))

(declare-fun m!382765 () Bool)

(assert (=> b!254178 m!382765))

(assert (=> b!254179 m!382017))

(declare-fun m!382767 () Bool)

(assert (=> b!254179 m!382767))

(declare-fun m!382769 () Bool)

(assert (=> b!254181 m!382769))

(assert (=> bm!3990 m!382761))

(assert (=> bm!3990 m!382763))

(declare-fun m!382771 () Bool)

(assert (=> bm!3990 m!382771))

(declare-fun m!382773 () Bool)

(assert (=> bm!3990 m!382773))

(declare-fun m!382775 () Bool)

(assert (=> bm!3990 m!382775))

(assert (=> b!253905 d!85254))

(assert (=> b!253905 d!85036))

(declare-fun d!85256 () Bool)

(assert (=> d!85256 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394250) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055)))) lt!394250))))

(declare-fun bs!21544 () Bool)

(assert (= bs!21544 d!85256))

(assert (=> bs!21544 m!382207))

(assert (=> b!253852 d!85256))

(assert (=> d!84994 d!85008))

(declare-fun d!85258 () Bool)

(assert (=> d!85258 (isPrefixOf!0 thiss!1005 (_2!11815 lt!394065))))

(assert (=> d!85258 true))

(declare-fun _$15!333 () Unit!18239)

(assert (=> d!85258 (= (choose!30 thiss!1005 (_2!11815 lt!394055) (_2!11815 lt!394065)) _$15!333)))

(declare-fun bs!21545 () Bool)

(assert (= bs!21545 d!85258))

(assert (=> bs!21545 m!382057))

(assert (=> d!84994 d!85258))

(assert (=> d!84994 d!85032))

(declare-fun d!85260 () Bool)

(assert (=> d!85260 (= (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 thiss!1005)))))))

(assert (=> d!85042 d!85260))

(declare-fun d!85262 () Bool)

(assert (=> d!85262 (= (invariant!0 (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005) (size!6032 (buf!6540 thiss!1005))) (and (bvsge (currentBit!11999 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11999 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12004 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12004 thiss!1005) (size!6032 (buf!6540 thiss!1005))) (and (= (currentBit!11999 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12004 thiss!1005) (size!6032 (buf!6540 thiss!1005)))))))))

(assert (=> d!85042 d!85262))

(declare-fun d!85264 () Bool)

(declare-fun lt!394871 () tuple2!21780)

(assert (=> d!85264 (= lt!394871 (readBit!0 (readerFrom!0 (_2!11815 lt!394261) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))))

(assert (=> d!85264 (= (readBitPure!0 (readerFrom!0 (_2!11815 lt!394261) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))) (tuple2!21771 (_2!11821 lt!394871) (_1!11821 lt!394871)))))

(declare-fun bs!21546 () Bool)

(assert (= bs!21546 d!85264))

(assert (=> bs!21546 m!382259))

(declare-fun m!382777 () Bool)

(assert (=> bs!21546 m!382777))

(assert (=> b!253864 d!85264))

(declare-fun d!85266 () Bool)

(declare-fun e!176104 () Bool)

(assert (=> d!85266 e!176104))

(declare-fun res!212996 () Bool)

(assert (=> d!85266 (=> (not res!212996) (not e!176104))))

(assert (=> d!85266 (= res!212996 (invariant!0 (currentBit!11999 (_2!11815 lt!394261)) (currentByte!12004 (_2!11815 lt!394261)) (size!6032 (buf!6540 (_2!11815 lt!394261)))))))

(assert (=> d!85266 (= (readerFrom!0 (_2!11815 lt!394261) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)) (BitStream!10987 (buf!6540 (_2!11815 lt!394261)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)))))

(declare-fun b!254184 () Bool)

(assert (=> b!254184 (= e!176104 (invariant!0 (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005) (size!6032 (buf!6540 (_2!11815 lt!394261)))))))

(assert (= (and d!85266 res!212996) b!254184))

(declare-fun m!382779 () Bool)

(assert (=> d!85266 m!382779))

(declare-fun m!382781 () Bool)

(assert (=> b!254184 m!382781))

(assert (=> b!253864 d!85266))

(assert (=> b!253903 d!85036))

(assert (=> b!253903 d!85034))

(declare-fun d!85268 () Bool)

(declare-fun res!212997 () Bool)

(declare-fun e!176106 () Bool)

(assert (=> d!85268 (=> (not res!212997) (not e!176106))))

(assert (=> d!85268 (= res!212997 (= (size!6032 (buf!6540 (_2!11815 lt!394055))) (size!6032 (buf!6540 (_2!11815 lt!394251)))))))

(assert (=> d!85268 (= (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 lt!394251)) e!176106)))

(declare-fun b!254185 () Bool)

(declare-fun res!212998 () Bool)

(assert (=> b!254185 (=> (not res!212998) (not e!176106))))

(assert (=> b!254185 (= res!212998 (bvsle (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394251))) (currentByte!12004 (_2!11815 lt!394251)) (currentBit!11999 (_2!11815 lt!394251)))))))

(declare-fun b!254186 () Bool)

(declare-fun e!176105 () Bool)

(assert (=> b!254186 (= e!176106 e!176105)))

(declare-fun res!212999 () Bool)

(assert (=> b!254186 (=> res!212999 e!176105)))

(assert (=> b!254186 (= res!212999 (= (size!6032 (buf!6540 (_2!11815 lt!394055))) #b00000000000000000000000000000000))))

(declare-fun b!254187 () Bool)

(assert (=> b!254187 (= e!176105 (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394055)) (buf!6540 (_2!11815 lt!394251)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(assert (= (and d!85268 res!212997) b!254185))

(assert (= (and b!254185 res!212998) b!254186))

(assert (= (and b!254186 (not res!212999)) b!254187))

(assert (=> b!254185 m!382017))

(assert (=> b!254185 m!382239))

(assert (=> b!254187 m!382017))

(assert (=> b!254187 m!382017))

(declare-fun m!382783 () Bool)

(assert (=> b!254187 m!382783))

(assert (=> b!253850 d!85268))

(assert (=> d!84982 d!85262))

(declare-fun d!85270 () Bool)

(declare-fun e!176107 () Bool)

(assert (=> d!85270 e!176107))

(declare-fun res!213000 () Bool)

(assert (=> d!85270 (=> (not res!213000) (not e!176107))))

(declare-fun lt!394875 () (_ BitVec 64))

(declare-fun lt!394873 () (_ BitVec 64))

(declare-fun lt!394877 () (_ BitVec 64))

(assert (=> d!85270 (= res!213000 (= lt!394875 (bvsub lt!394873 lt!394877)))))

(assert (=> d!85270 (or (= (bvand lt!394873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394877 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394873 lt!394877) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85270 (= lt!394877 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394261)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394261))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394261)))))))

(declare-fun lt!394876 () (_ BitVec 64))

(declare-fun lt!394874 () (_ BitVec 64))

(assert (=> d!85270 (= lt!394873 (bvmul lt!394876 lt!394874))))

(assert (=> d!85270 (or (= lt!394876 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394874 (bvsdiv (bvmul lt!394876 lt!394874) lt!394876)))))

(assert (=> d!85270 (= lt!394874 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85270 (= lt!394876 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394261)))))))

(assert (=> d!85270 (= lt!394875 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394261))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394261)))))))

(assert (=> d!85270 (invariant!0 (currentBit!11999 (_2!11815 lt!394261)) (currentByte!12004 (_2!11815 lt!394261)) (size!6032 (buf!6540 (_2!11815 lt!394261))))))

(assert (=> d!85270 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394261))) (currentByte!12004 (_2!11815 lt!394261)) (currentBit!11999 (_2!11815 lt!394261))) lt!394875)))

(declare-fun b!254188 () Bool)

(declare-fun res!213001 () Bool)

(assert (=> b!254188 (=> (not res!213001) (not e!176107))))

(assert (=> b!254188 (= res!213001 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394875))))

(declare-fun b!254189 () Bool)

(declare-fun lt!394872 () (_ BitVec 64))

(assert (=> b!254189 (= e!176107 (bvsle lt!394875 (bvmul lt!394872 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254189 (or (= lt!394872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394872)))))

(assert (=> b!254189 (= lt!394872 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394261)))))))

(assert (= (and d!85270 res!213000) b!254188))

(assert (= (and b!254188 res!213001) b!254189))

(declare-fun m!382785 () Bool)

(assert (=> d!85270 m!382785))

(assert (=> d!85270 m!382779))

(assert (=> b!253862 d!85270))

(assert (=> b!253862 d!85042))

(assert (=> d!85046 d!85224))

(declare-fun d!85272 () Bool)

(declare-fun e!176108 () Bool)

(assert (=> d!85272 e!176108))

(declare-fun res!213002 () Bool)

(assert (=> d!85272 (=> (not res!213002) (not e!176108))))

(assert (=> d!85272 (= res!213002 (= (buf!6540 (_2!11815 (increaseBitIndex!0 lt!394052))) (buf!6540 lt!394052)))))

(declare-fun lt!394879 () Bool)

(assert (=> d!85272 (= lt!394879 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 lt!394052)) (currentByte!12004 lt!394052))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 lt!394052)))) #b00000000000000000000000000000000)))))

(declare-fun lt!394883 () tuple2!21780)

(assert (=> d!85272 (= lt!394883 (tuple2!21781 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 lt!394052)) (currentByte!12004 lt!394052))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 lt!394052)))) #b00000000000000000000000000000000)) (_2!11815 (increaseBitIndex!0 lt!394052))))))

(assert (=> d!85272 (validate_offset_bit!0 ((_ sign_extend 32) (size!6032 (buf!6540 lt!394052))) ((_ sign_extend 32) (currentByte!12004 lt!394052)) ((_ sign_extend 32) (currentBit!11999 lt!394052)))))

(assert (=> d!85272 (= (readBit!0 lt!394052) lt!394883)))

(declare-fun b!254190 () Bool)

(declare-fun lt!394882 () (_ BitVec 64))

(declare-fun lt!394878 () (_ BitVec 64))

(assert (=> b!254190 (= e!176108 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 (increaseBitIndex!0 lt!394052)))) (currentByte!12004 (_2!11815 (increaseBitIndex!0 lt!394052))) (currentBit!11999 (_2!11815 (increaseBitIndex!0 lt!394052)))) (bvadd lt!394878 lt!394882)))))

(assert (=> b!254190 (or (not (= (bvand lt!394878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394882 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394878 lt!394882) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254190 (= lt!394882 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254190 (= lt!394878 (bitIndex!0 (size!6032 (buf!6540 lt!394052)) (currentByte!12004 lt!394052) (currentBit!11999 lt!394052)))))

(declare-fun lt!394884 () Bool)

(assert (=> b!254190 (= lt!394884 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 lt!394052)) (currentByte!12004 lt!394052))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 lt!394052)))) #b00000000000000000000000000000000)))))

(declare-fun lt!394881 () Bool)

(assert (=> b!254190 (= lt!394881 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 lt!394052)) (currentByte!12004 lt!394052))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 lt!394052)))) #b00000000000000000000000000000000)))))

(declare-fun lt!394880 () Bool)

(assert (=> b!254190 (= lt!394880 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 lt!394052)) (currentByte!12004 lt!394052))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 lt!394052)))) #b00000000000000000000000000000000)))))

(assert (= (and d!85272 res!213002) b!254190))

(declare-fun m!382787 () Bool)

(assert (=> d!85272 m!382787))

(declare-fun m!382789 () Bool)

(assert (=> d!85272 m!382789))

(declare-fun m!382791 () Bool)

(assert (=> d!85272 m!382791))

(declare-fun m!382793 () Bool)

(assert (=> d!85272 m!382793))

(assert (=> b!254190 m!382789))

(assert (=> b!254190 m!382791))

(declare-fun m!382795 () Bool)

(assert (=> b!254190 m!382795))

(assert (=> b!254190 m!382787))

(declare-fun m!382797 () Bool)

(assert (=> b!254190 m!382797))

(assert (=> d!85016 d!85272))

(declare-fun d!85274 () Bool)

(assert (=> d!85274 (isPrefixOf!0 lt!394199 (_2!11815 lt!394065))))

(declare-fun lt!394885 () Unit!18239)

(assert (=> d!85274 (= lt!394885 (choose!30 lt!394199 (_2!11815 lt!394055) (_2!11815 lt!394065)))))

(assert (=> d!85274 (isPrefixOf!0 lt!394199 (_2!11815 lt!394055))))

(assert (=> d!85274 (= (lemmaIsPrefixTransitive!0 lt!394199 (_2!11815 lt!394055) (_2!11815 lt!394065)) lt!394885)))

(declare-fun bs!21547 () Bool)

(assert (= bs!21547 d!85274))

(assert (=> bs!21547 m!382187))

(declare-fun m!382799 () Bool)

(assert (=> bs!21547 m!382799))

(declare-fun m!382801 () Bool)

(assert (=> bs!21547 m!382801))

(assert (=> d!84990 d!85274))

(declare-fun d!85276 () Bool)

(assert (=> d!85276 (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 lt!394055))))

(declare-fun lt!394888 () Unit!18239)

(declare-fun choose!11 (BitStream!10986) Unit!18239)

(assert (=> d!85276 (= lt!394888 (choose!11 (_2!11815 lt!394055)))))

(assert (=> d!85276 (= (lemmaIsPrefixRefl!0 (_2!11815 lt!394055)) lt!394888)))

(declare-fun bs!21549 () Bool)

(assert (= bs!21549 d!85276))

(assert (=> bs!21549 m!382199))

(declare-fun m!382803 () Bool)

(assert (=> bs!21549 m!382803))

(assert (=> d!84990 d!85276))

(declare-fun d!85278 () Bool)

(assert (=> d!85278 (isPrefixOf!0 lt!394199 lt!394199)))

(declare-fun lt!394889 () Unit!18239)

(assert (=> d!85278 (= lt!394889 (choose!11 lt!394199))))

(assert (=> d!85278 (= (lemmaIsPrefixRefl!0 lt!394199) lt!394889)))

(declare-fun bs!21550 () Bool)

(assert (= bs!21550 d!85278))

(assert (=> bs!21550 m!382183))

(declare-fun m!382805 () Bool)

(assert (=> bs!21550 m!382805))

(assert (=> d!84990 d!85278))

(declare-fun d!85280 () Bool)

(declare-fun res!213003 () Bool)

(declare-fun e!176110 () Bool)

(assert (=> d!85280 (=> (not res!213003) (not e!176110))))

(assert (=> d!85280 (= res!213003 (= (size!6032 (buf!6540 (_1!11817 lt!394193))) (size!6032 (buf!6540 (_2!11817 lt!394193)))))))

(assert (=> d!85280 (= (isPrefixOf!0 (_1!11817 lt!394193) (_2!11817 lt!394193)) e!176110)))

(declare-fun b!254191 () Bool)

(declare-fun res!213004 () Bool)

(assert (=> b!254191 (=> (not res!213004) (not e!176110))))

(assert (=> b!254191 (= res!213004 (bvsle (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394193))) (currentByte!12004 (_1!11817 lt!394193)) (currentBit!11999 (_1!11817 lt!394193))) (bitIndex!0 (size!6032 (buf!6540 (_2!11817 lt!394193))) (currentByte!12004 (_2!11817 lt!394193)) (currentBit!11999 (_2!11817 lt!394193)))))))

(declare-fun b!254192 () Bool)

(declare-fun e!176109 () Bool)

(assert (=> b!254192 (= e!176110 e!176109)))

(declare-fun res!213005 () Bool)

(assert (=> b!254192 (=> res!213005 e!176109)))

(assert (=> b!254192 (= res!213005 (= (size!6032 (buf!6540 (_1!11817 lt!394193))) #b00000000000000000000000000000000))))

(declare-fun b!254193 () Bool)

(assert (=> b!254193 (= e!176109 (arrayBitRangesEq!0 (buf!6540 (_1!11817 lt!394193)) (buf!6540 (_2!11817 lt!394193)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394193))) (currentByte!12004 (_1!11817 lt!394193)) (currentBit!11999 (_1!11817 lt!394193)))))))

(assert (= (and d!85280 res!213003) b!254191))

(assert (= (and b!254191 res!213004) b!254192))

(assert (= (and b!254192 (not res!213005)) b!254193))

(assert (=> b!254191 m!382707))

(declare-fun m!382807 () Bool)

(assert (=> b!254191 m!382807))

(assert (=> b!254193 m!382707))

(assert (=> b!254193 m!382707))

(declare-fun m!382809 () Bool)

(assert (=> b!254193 m!382809))

(assert (=> d!84990 d!85280))

(declare-fun d!85282 () Bool)

(assert (=> d!85282 (isPrefixOf!0 lt!394199 (_2!11815 lt!394065))))

(declare-fun lt!394890 () Unit!18239)

(assert (=> d!85282 (= lt!394890 (choose!30 lt!394199 (_2!11815 lt!394065) (_2!11815 lt!394065)))))

(assert (=> d!85282 (isPrefixOf!0 lt!394199 (_2!11815 lt!394065))))

(assert (=> d!85282 (= (lemmaIsPrefixTransitive!0 lt!394199 (_2!11815 lt!394065) (_2!11815 lt!394065)) lt!394890)))

(declare-fun bs!21551 () Bool)

(assert (= bs!21551 d!85282))

(assert (=> bs!21551 m!382187))

(declare-fun m!382811 () Bool)

(assert (=> bs!21551 m!382811))

(assert (=> bs!21551 m!382187))

(assert (=> d!84990 d!85282))

(declare-fun d!85284 () Bool)

(declare-fun res!213006 () Bool)

(declare-fun e!176112 () Bool)

(assert (=> d!85284 (=> (not res!213006) (not e!176112))))

(assert (=> d!85284 (= res!213006 (= (size!6032 (buf!6540 (_2!11815 lt!394065))) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(assert (=> d!85284 (= (isPrefixOf!0 (_2!11815 lt!394065) (_2!11815 lt!394065)) e!176112)))

(declare-fun b!254194 () Bool)

(declare-fun res!213007 () Bool)

(assert (=> b!254194 (=> (not res!213007) (not e!176112))))

(assert (=> b!254194 (= res!213007 (bvsle (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065))) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065)))))))

(declare-fun b!254195 () Bool)

(declare-fun e!176111 () Bool)

(assert (=> b!254195 (= e!176112 e!176111)))

(declare-fun res!213008 () Bool)

(assert (=> b!254195 (=> res!213008 e!176111)))

(assert (=> b!254195 (= res!213008 (= (size!6032 (buf!6540 (_2!11815 lt!394065))) #b00000000000000000000000000000000))))

(declare-fun b!254196 () Bool)

(assert (=> b!254196 (= e!176111 (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394065)) (buf!6540 (_2!11815 lt!394065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065)))))))

(assert (= (and d!85284 res!213006) b!254194))

(assert (= (and b!254194 res!213007) b!254195))

(assert (= (and b!254195 (not res!213008)) b!254196))

(assert (=> b!254194 m!382015))

(assert (=> b!254194 m!382015))

(assert (=> b!254196 m!382015))

(assert (=> b!254196 m!382015))

(declare-fun m!382813 () Bool)

(assert (=> b!254196 m!382813))

(assert (=> d!84990 d!85284))

(assert (=> d!84990 d!85048))

(declare-fun d!85286 () Bool)

(declare-fun res!213009 () Bool)

(declare-fun e!176114 () Bool)

(assert (=> d!85286 (=> (not res!213009) (not e!176114))))

(assert (=> d!85286 (= res!213009 (= (size!6032 (buf!6540 (_2!11815 lt!394055))) (size!6032 (buf!6540 (_2!11815 lt!394055)))))))

(assert (=> d!85286 (= (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 lt!394055)) e!176114)))

(declare-fun b!254197 () Bool)

(declare-fun res!213010 () Bool)

(assert (=> b!254197 (=> (not res!213010) (not e!176114))))

(assert (=> b!254197 (= res!213010 (bvsle (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(declare-fun b!254198 () Bool)

(declare-fun e!176113 () Bool)

(assert (=> b!254198 (= e!176114 e!176113)))

(declare-fun res!213011 () Bool)

(assert (=> b!254198 (=> res!213011 e!176113)))

(assert (=> b!254198 (= res!213011 (= (size!6032 (buf!6540 (_2!11815 lt!394055))) #b00000000000000000000000000000000))))

(declare-fun b!254199 () Bool)

(assert (=> b!254199 (= e!176113 (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394055)) (buf!6540 (_2!11815 lt!394055)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(assert (= (and d!85286 res!213009) b!254197))

(assert (= (and b!254197 res!213010) b!254198))

(assert (= (and b!254198 (not res!213011)) b!254199))

(assert (=> b!254197 m!382017))

(assert (=> b!254197 m!382017))

(assert (=> b!254199 m!382017))

(assert (=> b!254199 m!382017))

(declare-fun m!382815 () Bool)

(assert (=> b!254199 m!382815))

(assert (=> d!84990 d!85286))

(declare-fun d!85288 () Bool)

(declare-fun res!213012 () Bool)

(declare-fun e!176116 () Bool)

(assert (=> d!85288 (=> (not res!213012) (not e!176116))))

(assert (=> d!85288 (= res!213012 (= (size!6032 (buf!6540 lt!394199)) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(assert (=> d!85288 (= (isPrefixOf!0 lt!394199 (_2!11815 lt!394065)) e!176116)))

(declare-fun b!254200 () Bool)

(declare-fun res!213013 () Bool)

(assert (=> b!254200 (=> (not res!213013) (not e!176116))))

(assert (=> b!254200 (= res!213013 (bvsle (bitIndex!0 (size!6032 (buf!6540 lt!394199)) (currentByte!12004 lt!394199) (currentBit!11999 lt!394199)) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065)))))))

(declare-fun b!254201 () Bool)

(declare-fun e!176115 () Bool)

(assert (=> b!254201 (= e!176116 e!176115)))

(declare-fun res!213014 () Bool)

(assert (=> b!254201 (=> res!213014 e!176115)))

(assert (=> b!254201 (= res!213014 (= (size!6032 (buf!6540 lt!394199)) #b00000000000000000000000000000000))))

(declare-fun b!254202 () Bool)

(assert (=> b!254202 (= e!176115 (arrayBitRangesEq!0 (buf!6540 lt!394199) (buf!6540 (_2!11815 lt!394065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 lt!394199)) (currentByte!12004 lt!394199) (currentBit!11999 lt!394199))))))

(assert (= (and d!85288 res!213012) b!254200))

(assert (= (and b!254200 res!213013) b!254201))

(assert (= (and b!254201 (not res!213014)) b!254202))

(declare-fun m!382817 () Bool)

(assert (=> b!254200 m!382817))

(assert (=> b!254200 m!382015))

(assert (=> b!254202 m!382817))

(assert (=> b!254202 m!382817))

(declare-fun m!382819 () Bool)

(assert (=> b!254202 m!382819))

(assert (=> d!84990 d!85288))

(declare-fun d!85290 () Bool)

(assert (=> d!85290 (isPrefixOf!0 (_2!11815 lt!394065) (_2!11815 lt!394065))))

(declare-fun lt!394891 () Unit!18239)

(assert (=> d!85290 (= lt!394891 (choose!11 (_2!11815 lt!394065)))))

(assert (=> d!85290 (= (lemmaIsPrefixRefl!0 (_2!11815 lt!394065)) lt!394891)))

(declare-fun bs!21552 () Bool)

(assert (= bs!21552 d!85290))

(assert (=> bs!21552 m!382195))

(declare-fun m!382821 () Bool)

(assert (=> bs!21552 m!382821))

(assert (=> d!84990 d!85290))

(declare-fun d!85292 () Bool)

(declare-fun res!213015 () Bool)

(declare-fun e!176118 () Bool)

(assert (=> d!85292 (=> (not res!213015) (not e!176118))))

(assert (=> d!85292 (= res!213015 (= (size!6032 (buf!6540 lt!394199)) (size!6032 (buf!6540 lt!394199))))))

(assert (=> d!85292 (= (isPrefixOf!0 lt!394199 lt!394199) e!176118)))

(declare-fun b!254203 () Bool)

(declare-fun res!213016 () Bool)

(assert (=> b!254203 (=> (not res!213016) (not e!176118))))

(assert (=> b!254203 (= res!213016 (bvsle (bitIndex!0 (size!6032 (buf!6540 lt!394199)) (currentByte!12004 lt!394199) (currentBit!11999 lt!394199)) (bitIndex!0 (size!6032 (buf!6540 lt!394199)) (currentByte!12004 lt!394199) (currentBit!11999 lt!394199))))))

(declare-fun b!254204 () Bool)

(declare-fun e!176117 () Bool)

(assert (=> b!254204 (= e!176118 e!176117)))

(declare-fun res!213017 () Bool)

(assert (=> b!254204 (=> res!213017 e!176117)))

(assert (=> b!254204 (= res!213017 (= (size!6032 (buf!6540 lt!394199)) #b00000000000000000000000000000000))))

(declare-fun b!254205 () Bool)

(assert (=> b!254205 (= e!176117 (arrayBitRangesEq!0 (buf!6540 lt!394199) (buf!6540 lt!394199) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 lt!394199)) (currentByte!12004 lt!394199) (currentBit!11999 lt!394199))))))

(assert (= (and d!85292 res!213015) b!254203))

(assert (= (and b!254203 res!213016) b!254204))

(assert (= (and b!254204 (not res!213017)) b!254205))

(assert (=> b!254203 m!382817))

(assert (=> b!254203 m!382817))

(assert (=> b!254205 m!382817))

(assert (=> b!254205 m!382817))

(declare-fun m!382823 () Bool)

(assert (=> b!254205 m!382823))

(assert (=> d!84990 d!85292))

(assert (=> d!84996 d!85222))

(assert (=> b!253902 d!85038))

(declare-fun d!85294 () Bool)

(declare-fun e!176119 () Bool)

(assert (=> d!85294 e!176119))

(declare-fun res!213018 () Bool)

(assert (=> d!85294 (=> (not res!213018) (not e!176119))))

(assert (=> d!85294 (= res!213018 (= (buf!6540 (_2!11815 (increaseBitIndex!0 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))) (buf!6540 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))))))

(declare-fun lt!394893 () Bool)

(assert (=> d!85294 (= lt!394893 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))) (currentByte!12004 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!394897 () tuple2!21780)

(assert (=> d!85294 (= lt!394897 (tuple2!21781 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))) (currentByte!12004 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11815 (increaseBitIndex!0 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))))))

(assert (=> d!85294 (validate_offset_bit!0 ((_ sign_extend 32) (size!6032 (buf!6540 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))) ((_ sign_extend 32) (currentByte!12004 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))) ((_ sign_extend 32) (currentBit!11999 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))))))

(assert (=> d!85294 (= (readBit!0 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))) lt!394897)))

(declare-fun lt!394892 () (_ BitVec 64))

(declare-fun b!254206 () Bool)

(declare-fun lt!394896 () (_ BitVec 64))

(assert (=> b!254206 (= e!176119 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 (increaseBitIndex!0 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))))) (currentByte!12004 (_2!11815 (increaseBitIndex!0 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))) (currentBit!11999 (_2!11815 (increaseBitIndex!0 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))))) (bvadd lt!394892 lt!394896)))))

(assert (=> b!254206 (or (not (= (bvand lt!394892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394896 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394892 lt!394896) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254206 (= lt!394896 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254206 (= lt!394892 (bitIndex!0 (size!6032 (buf!6540 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))) (currentByte!12004 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))) (currentBit!11999 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))))))

(declare-fun lt!394898 () Bool)

(assert (=> b!254206 (= lt!394898 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))) (currentByte!12004 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!394895 () Bool)

(assert (=> b!254206 (= lt!394895 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))) (currentByte!12004 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!394894 () Bool)

(assert (=> b!254206 (= lt!394894 (not (= (bvand ((_ sign_extend 24) (select (arr!7019 (buf!6540 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))) (currentByte!12004 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11999 (readerFrom!0 (_2!11815 lt!394055) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!85294 res!213018) b!254206))

(assert (=> d!85294 m!382021))

(declare-fun m!382825 () Bool)

(assert (=> d!85294 m!382825))

(declare-fun m!382827 () Bool)

(assert (=> d!85294 m!382827))

(declare-fun m!382829 () Bool)

(assert (=> d!85294 m!382829))

(declare-fun m!382831 () Bool)

(assert (=> d!85294 m!382831))

(assert (=> b!254206 m!382827))

(assert (=> b!254206 m!382829))

(declare-fun m!382833 () Bool)

(assert (=> b!254206 m!382833))

(assert (=> b!254206 m!382021))

(assert (=> b!254206 m!382825))

(declare-fun m!382835 () Bool)

(assert (=> b!254206 m!382835))

(assert (=> d!85044 d!85294))

(assert (=> d!85014 d!85012))

(declare-fun d!85296 () Bool)

(assert (=> d!85296 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394056)))

(assert (=> d!85296 true))

(declare-fun _$6!434 () Unit!18239)

(assert (=> d!85296 (= (choose!9 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394065)) lt!394056 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))) _$6!434)))

(declare-fun bs!21553 () Bool)

(assert (= bs!21553 d!85296))

(assert (=> bs!21553 m!382063))

(assert (=> d!85014 d!85296))

(declare-fun d!85298 () Bool)

(declare-fun e!176120 () Bool)

(assert (=> d!85298 e!176120))

(declare-fun res!213019 () Bool)

(assert (=> d!85298 (=> (not res!213019) (not e!176120))))

(declare-fun lt!394904 () (_ BitVec 64))

(declare-fun lt!394900 () (_ BitVec 64))

(declare-fun lt!394902 () (_ BitVec 64))

(assert (=> d!85298 (= res!213019 (= lt!394902 (bvsub lt!394900 lt!394904)))))

(assert (=> d!85298 (or (= (bvand lt!394900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394900 lt!394904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85298 (= lt!394904 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394282)))) ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394282))) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394282)))))))

(declare-fun lt!394903 () (_ BitVec 64))

(declare-fun lt!394901 () (_ BitVec 64))

(assert (=> d!85298 (= lt!394900 (bvmul lt!394903 lt!394901))))

(assert (=> d!85298 (or (= lt!394903 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394901 (bvsdiv (bvmul lt!394903 lt!394901) lt!394903)))))

(assert (=> d!85298 (= lt!394901 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85298 (= lt!394903 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394282)))))))

(assert (=> d!85298 (= lt!394902 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394282))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394282)))))))

(assert (=> d!85298 (invariant!0 (currentBit!11999 (_1!11816 lt!394282)) (currentByte!12004 (_1!11816 lt!394282)) (size!6032 (buf!6540 (_1!11816 lt!394282))))))

(assert (=> d!85298 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394282))) (currentByte!12004 (_1!11816 lt!394282)) (currentBit!11999 (_1!11816 lt!394282))) lt!394902)))

(declare-fun b!254207 () Bool)

(declare-fun res!213020 () Bool)

(assert (=> b!254207 (=> (not res!213020) (not e!176120))))

(assert (=> b!254207 (= res!213020 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394902))))

(declare-fun b!254208 () Bool)

(declare-fun lt!394899 () (_ BitVec 64))

(assert (=> b!254208 (= e!176120 (bvsle lt!394902 (bvmul lt!394899 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254208 (or (= lt!394899 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394899 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394899)))))

(assert (=> b!254208 (= lt!394899 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394282)))))))

(assert (= (and d!85298 res!213019) b!254207))

(assert (= (and b!254207 res!213020) b!254208))

(declare-fun m!382837 () Bool)

(assert (=> d!85298 m!382837))

(declare-fun m!382839 () Bool)

(assert (=> d!85298 m!382839))

(assert (=> d!85018 d!85298))

(declare-fun d!85300 () Bool)

(assert (=> d!85300 (= (invariant!0 (currentBit!11999 lt!394052) (currentByte!12004 lt!394052) (size!6032 (buf!6540 (_2!11815 lt!394065)))) (and (bvsge (currentBit!11999 lt!394052) #b00000000000000000000000000000000) (bvslt (currentBit!11999 lt!394052) #b00000000000000000000000000001000) (bvsge (currentByte!12004 lt!394052) #b00000000000000000000000000000000) (or (bvslt (currentByte!12004 lt!394052) (size!6032 (buf!6540 (_2!11815 lt!394065)))) (and (= (currentBit!11999 lt!394052) #b00000000000000000000000000000000) (= (currentByte!12004 lt!394052) (size!6032 (buf!6540 (_2!11815 lt!394065))))))))))

(assert (=> d!85018 d!85300))

(declare-fun d!85302 () Bool)

(declare-fun e!176121 () Bool)

(assert (=> d!85302 e!176121))

(declare-fun res!213021 () Bool)

(assert (=> d!85302 (=> (not res!213021) (not e!176121))))

(declare-fun lt!394908 () (_ BitVec 64))

(declare-fun lt!394910 () (_ BitVec 64))

(declare-fun lt!394906 () (_ BitVec 64))

(assert (=> d!85302 (= res!213021 (= lt!394908 (bvsub lt!394906 lt!394910)))))

(assert (=> d!85302 (or (= (bvand lt!394906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394910 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394906 lt!394910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85302 (= lt!394910 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394281)))) ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394281))) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394281)))))))

(declare-fun lt!394909 () (_ BitVec 64))

(declare-fun lt!394907 () (_ BitVec 64))

(assert (=> d!85302 (= lt!394906 (bvmul lt!394909 lt!394907))))

(assert (=> d!85302 (or (= lt!394909 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394907 (bvsdiv (bvmul lt!394909 lt!394907) lt!394909)))))

(assert (=> d!85302 (= lt!394907 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85302 (= lt!394909 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394281)))))))

(assert (=> d!85302 (= lt!394908 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394281))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394281)))))))

(assert (=> d!85302 (invariant!0 (currentBit!11999 (_1!11816 lt!394281)) (currentByte!12004 (_1!11816 lt!394281)) (size!6032 (buf!6540 (_1!11816 lt!394281))))))

(assert (=> d!85302 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394281))) (currentByte!12004 (_1!11816 lt!394281)) (currentBit!11999 (_1!11816 lt!394281))) lt!394908)))

(declare-fun b!254209 () Bool)

(declare-fun res!213022 () Bool)

(assert (=> b!254209 (=> (not res!213022) (not e!176121))))

(assert (=> b!254209 (= res!213022 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394908))))

(declare-fun b!254210 () Bool)

(declare-fun lt!394905 () (_ BitVec 64))

(assert (=> b!254210 (= e!176121 (bvsle lt!394908 (bvmul lt!394905 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254210 (or (= lt!394905 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394905 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394905)))))

(assert (=> b!254210 (= lt!394905 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394281)))))))

(assert (= (and d!85302 res!213021) b!254209))

(assert (= (and b!254209 res!213022) b!254210))

(declare-fun m!382841 () Bool)

(assert (=> d!85302 m!382841))

(declare-fun m!382843 () Bool)

(assert (=> d!85302 m!382843))

(assert (=> d!85018 d!85302))

(assert (=> d!85018 d!85016))

(declare-fun d!85304 () Bool)

(declare-fun e!176124 () Bool)

(assert (=> d!85304 e!176124))

(declare-fun res!213025 () Bool)

(assert (=> d!85304 (=> (not res!213025) (not e!176124))))

(declare-fun lt!394919 () tuple2!21770)

(declare-fun lt!394918 () tuple2!21770)

(assert (=> d!85304 (= res!213025 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394919))) (currentByte!12004 (_1!11816 lt!394919)) (currentBit!11999 (_1!11816 lt!394919))) (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394918))) (currentByte!12004 (_1!11816 lt!394918)) (currentBit!11999 (_1!11816 lt!394918)))))))

(declare-fun lt!394917 () BitStream!10986)

(assert (=> d!85304 (= lt!394918 (readBitPure!0 lt!394917))))

(assert (=> d!85304 (= lt!394919 (readBitPure!0 lt!394052))))

(assert (=> d!85304 (= lt!394917 (BitStream!10987 (buf!6540 (_2!11815 lt!394065)) (currentByte!12004 lt!394052) (currentBit!11999 lt!394052)))))

(assert (=> d!85304 (invariant!0 (currentBit!11999 lt!394052) (currentByte!12004 lt!394052) (size!6032 (buf!6540 (_2!11815 lt!394065))))))

(assert (=> d!85304 true))

(declare-fun _$9!114 () Unit!18239)

(assert (=> d!85304 (= (choose!50 lt!394052 (_2!11815 lt!394065) lt!394283 lt!394282 (tuple2!21771 (_1!11816 lt!394282) (_2!11816 lt!394282)) (_1!11816 lt!394282) (_2!11816 lt!394282) lt!394281 (tuple2!21771 (_1!11816 lt!394281) (_2!11816 lt!394281)) (_1!11816 lt!394281) (_2!11816 lt!394281)) _$9!114)))

(declare-fun b!254213 () Bool)

(assert (=> b!254213 (= e!176124 (= (_2!11816 lt!394919) (_2!11816 lt!394918)))))

(assert (= (and d!85304 res!213025) b!254213))

(assert (=> d!85304 m!382055))

(declare-fun m!382845 () Bool)

(assert (=> d!85304 m!382845))

(assert (=> d!85304 m!382281))

(declare-fun m!382847 () Bool)

(assert (=> d!85304 m!382847))

(declare-fun m!382849 () Bool)

(assert (=> d!85304 m!382849))

(assert (=> d!85018 d!85304))

(declare-fun d!85306 () Bool)

(declare-fun lt!394920 () tuple2!21780)

(assert (=> d!85306 (= lt!394920 (readBit!0 lt!394283))))

(assert (=> d!85306 (= (readBitPure!0 lt!394283) (tuple2!21771 (_2!11821 lt!394920) (_1!11821 lt!394920)))))

(declare-fun bs!21554 () Bool)

(assert (= bs!21554 d!85306))

(declare-fun m!382851 () Bool)

(assert (=> bs!21554 m!382851))

(assert (=> d!85018 d!85306))

(declare-fun d!85308 () Bool)

(assert (=> d!85308 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394055)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!85308 true))

(declare-fun _$1!336 () Unit!18239)

(assert (=> d!85308 (= (choose!27 thiss!1005 (_2!11815 lt!394055) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!336)))

(declare-fun bs!21555 () Bool)

(assert (= bs!21555 d!85308))

(assert (=> bs!21555 m!382273))

(assert (=> d!85010 d!85308))

(declare-fun d!85310 () Bool)

(declare-fun e!176125 () Bool)

(assert (=> d!85310 e!176125))

(declare-fun res!213026 () Bool)

(assert (=> d!85310 (=> (not res!213026) (not e!176125))))

(declare-fun lt!394922 () (_ BitVec 64))

(declare-fun lt!394921 () BitStream!10986)

(assert (=> d!85310 (= res!213026 (= (bvadd lt!394922 (bvsub lt!394225 lt!394218)) (bitIndex!0 (size!6032 (buf!6540 lt!394921)) (currentByte!12004 lt!394921) (currentBit!11999 lt!394921))))))

(assert (=> d!85310 (or (not (= (bvand lt!394922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394225 lt!394218) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394922 (bvsub lt!394225 lt!394218)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85310 (= lt!394922 (bitIndex!0 (size!6032 (buf!6540 (_2!11817 lt!394216))) (currentByte!12004 (_2!11817 lt!394216)) (currentBit!11999 (_2!11817 lt!394216))))))

(assert (=> d!85310 (= lt!394921 (_2!11815 (moveBitIndex!0 (_2!11817 lt!394216) (bvsub lt!394225 lt!394218))))))

(assert (=> d!85310 (moveBitIndexPrecond!0 (_2!11817 lt!394216) (bvsub lt!394225 lt!394218))))

(assert (=> d!85310 (= (withMovedBitIndex!0 (_2!11817 lt!394216) (bvsub lt!394225 lt!394218)) lt!394921)))

(declare-fun b!254214 () Bool)

(assert (=> b!254214 (= e!176125 (= (size!6032 (buf!6540 (_2!11817 lt!394216))) (size!6032 (buf!6540 lt!394921))))))

(assert (= (and d!85310 res!213026) b!254214))

(declare-fun m!382853 () Bool)

(assert (=> d!85310 m!382853))

(declare-fun m!382855 () Bool)

(assert (=> d!85310 m!382855))

(declare-fun m!382857 () Bool)

(assert (=> d!85310 m!382857))

(declare-fun m!382859 () Bool)

(assert (=> d!85310 m!382859))

(assert (=> b!253838 d!85310))

(assert (=> b!253838 d!85034))

(assert (=> b!253838 d!85042))

(declare-fun b!254223 () Bool)

(declare-fun e!176134 () Bool)

(declare-fun _$23!42 () tuple2!21768)

(assert (=> b!254223 (= e!176134 (array_inv!5773 (buf!6540 (_2!11815 _$23!42))))))

(declare-fun b!254225 () Bool)

(declare-fun res!213034 () Bool)

(declare-fun e!176133 () Bool)

(assert (=> b!254225 (=> (not res!213034) (not e!176133))))

(assert (=> b!254225 (= res!213034 (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 _$23!42)))))

(declare-fun d!85312 () Bool)

(assert (=> d!85312 e!176133))

(declare-fun res!213033 () Bool)

(assert (=> d!85312 (=> (not res!213033) (not e!176133))))

(assert (=> d!85312 (= res!213033 (= (size!6032 (buf!6540 (_2!11815 lt!394055))) (size!6032 (buf!6540 (_2!11815 _$23!42)))))))

(assert (=> d!85312 (and (inv!12 (_2!11815 _$23!42)) e!176134)))

(assert (=> d!85312 (= (choose!51 (_2!11815 lt!394055) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) _$23!42)))

(declare-fun b!254224 () Bool)

(declare-fun res!213035 () Bool)

(assert (=> b!254224 (=> (not res!213035) (not e!176133))))

(assert (=> b!254224 (= res!213035 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 _$23!42))) (currentByte!12004 (_2!11815 _$23!42)) (currentBit!11999 (_2!11815 _$23!42))) (bvadd (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))))

(declare-fun b!254226 () Bool)

(declare-fun lt!394937 () tuple2!21770)

(declare-fun lt!394936 () tuple2!21772)

(assert (=> b!254226 (= e!176133 (and (_2!11816 lt!394937) (= (_1!11816 lt!394937) (_2!11817 lt!394936))))))

(assert (=> b!254226 (= lt!394937 (checkBitsLoopPure!0 (_1!11817 lt!394936) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!394935 () Unit!18239)

(declare-fun lt!394933 () Unit!18239)

(assert (=> b!254226 (= lt!394935 lt!394933)))

(declare-fun lt!394934 () (_ BitVec 64))

(assert (=> b!254226 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 _$23!42)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394934)))

(assert (=> b!254226 (= lt!394933 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11815 lt!394055) (buf!6540 (_2!11815 _$23!42)) lt!394934))))

(assert (=> b!254226 (= lt!394934 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254226 (= lt!394936 (reader!0 (_2!11815 lt!394055) (_2!11815 _$23!42)))))

(assert (= d!85312 b!254223))

(assert (= (and d!85312 res!213033) b!254224))

(assert (= (and b!254224 res!213035) b!254225))

(assert (= (and b!254225 res!213034) b!254226))

(declare-fun m!382861 () Bool)

(assert (=> b!254223 m!382861))

(declare-fun m!382863 () Bool)

(assert (=> b!254225 m!382863))

(declare-fun m!382865 () Bool)

(assert (=> b!254226 m!382865))

(declare-fun m!382867 () Bool)

(assert (=> b!254226 m!382867))

(declare-fun m!382869 () Bool)

(assert (=> b!254226 m!382869))

(declare-fun m!382871 () Bool)

(assert (=> b!254226 m!382871))

(declare-fun m!382873 () Bool)

(assert (=> d!85312 m!382873))

(declare-fun m!382875 () Bool)

(assert (=> b!254224 m!382875))

(assert (=> b!254224 m!382017))

(assert (=> d!85004 d!85312))

(declare-fun d!85314 () Bool)

(declare-fun e!176135 () Bool)

(assert (=> d!85314 e!176135))

(declare-fun res!213036 () Bool)

(assert (=> d!85314 (=> (not res!213036) (not e!176135))))

(declare-fun lt!394939 () (_ BitVec 64))

(declare-fun lt!394938 () BitStream!10986)

(assert (=> d!85314 (= res!213036 (= (bvadd lt!394939 (bvsub lt!394202 lt!394195)) (bitIndex!0 (size!6032 (buf!6540 lt!394938)) (currentByte!12004 lt!394938) (currentBit!11999 lt!394938))))))

(assert (=> d!85314 (or (not (= (bvand lt!394939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394202 lt!394195) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394939 (bvsub lt!394202 lt!394195)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85314 (= lt!394939 (bitIndex!0 (size!6032 (buf!6540 (_2!11817 lt!394193))) (currentByte!12004 (_2!11817 lt!394193)) (currentBit!11999 (_2!11817 lt!394193))))))

(assert (=> d!85314 (= lt!394938 (_2!11815 (moveBitIndex!0 (_2!11817 lt!394193) (bvsub lt!394202 lt!394195))))))

(assert (=> d!85314 (moveBitIndexPrecond!0 (_2!11817 lt!394193) (bvsub lt!394202 lt!394195))))

(assert (=> d!85314 (= (withMovedBitIndex!0 (_2!11817 lt!394193) (bvsub lt!394202 lt!394195)) lt!394938)))

(declare-fun b!254227 () Bool)

(assert (=> b!254227 (= e!176135 (= (size!6032 (buf!6540 (_2!11817 lt!394193))) (size!6032 (buf!6540 lt!394938))))))

(assert (= (and d!85314 res!213036) b!254227))

(declare-fun m!382877 () Bool)

(assert (=> d!85314 m!382877))

(assert (=> d!85314 m!382807))

(declare-fun m!382879 () Bool)

(assert (=> d!85314 m!382879))

(declare-fun m!382881 () Bool)

(assert (=> d!85314 m!382881))

(assert (=> b!253833 d!85314))

(assert (=> b!253833 d!85034))

(assert (=> b!253833 d!85036))

(declare-fun d!85316 () Bool)

(declare-fun res!213037 () Bool)

(declare-fun e!176137 () Bool)

(assert (=> d!85316 (=> (not res!213037) (not e!176137))))

(assert (=> d!85316 (= res!213037 (= (size!6032 (buf!6540 (_2!11817 lt!394216))) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(assert (=> d!85316 (= (isPrefixOf!0 (_2!11817 lt!394216) (_2!11815 lt!394065)) e!176137)))

(declare-fun b!254228 () Bool)

(declare-fun res!213038 () Bool)

(assert (=> b!254228 (=> (not res!213038) (not e!176137))))

(assert (=> b!254228 (= res!213038 (bvsle (bitIndex!0 (size!6032 (buf!6540 (_2!11817 lt!394216))) (currentByte!12004 (_2!11817 lt!394216)) (currentBit!11999 (_2!11817 lt!394216))) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065)))))))

(declare-fun b!254229 () Bool)

(declare-fun e!176136 () Bool)

(assert (=> b!254229 (= e!176137 e!176136)))

(declare-fun res!213039 () Bool)

(assert (=> b!254229 (=> res!213039 e!176136)))

(assert (=> b!254229 (= res!213039 (= (size!6032 (buf!6540 (_2!11817 lt!394216))) #b00000000000000000000000000000000))))

(declare-fun b!254230 () Bool)

(assert (=> b!254230 (= e!176136 (arrayBitRangesEq!0 (buf!6540 (_2!11817 lt!394216)) (buf!6540 (_2!11815 lt!394065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_2!11817 lt!394216))) (currentByte!12004 (_2!11817 lt!394216)) (currentBit!11999 (_2!11817 lt!394216)))))))

(assert (= (and d!85316 res!213037) b!254228))

(assert (= (and b!254228 res!213038) b!254229))

(assert (= (and b!254229 (not res!213039)) b!254230))

(assert (=> b!254228 m!382855))

(assert (=> b!254228 m!382015))

(assert (=> b!254230 m!382855))

(assert (=> b!254230 m!382855))

(declare-fun m!382883 () Bool)

(assert (=> b!254230 m!382883))

(assert (=> b!253836 d!85316))

(declare-fun d!85318 () Bool)

(declare-fun res!213040 () Bool)

(declare-fun e!176139 () Bool)

(assert (=> d!85318 (=> (not res!213040) (not e!176139))))

(assert (=> d!85318 (= res!213040 (= (size!6032 (buf!6540 (_2!11817 lt!394193))) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(assert (=> d!85318 (= (isPrefixOf!0 (_2!11817 lt!394193) (_2!11815 lt!394065)) e!176139)))

(declare-fun b!254231 () Bool)

(declare-fun res!213041 () Bool)

(assert (=> b!254231 (=> (not res!213041) (not e!176139))))

(assert (=> b!254231 (= res!213041 (bvsle (bitIndex!0 (size!6032 (buf!6540 (_2!11817 lt!394193))) (currentByte!12004 (_2!11817 lt!394193)) (currentBit!11999 (_2!11817 lt!394193))) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065)))))))

(declare-fun b!254232 () Bool)

(declare-fun e!176138 () Bool)

(assert (=> b!254232 (= e!176139 e!176138)))

(declare-fun res!213042 () Bool)

(assert (=> b!254232 (=> res!213042 e!176138)))

(assert (=> b!254232 (= res!213042 (= (size!6032 (buf!6540 (_2!11817 lt!394193))) #b00000000000000000000000000000000))))

(declare-fun b!254233 () Bool)

(assert (=> b!254233 (= e!176138 (arrayBitRangesEq!0 (buf!6540 (_2!11817 lt!394193)) (buf!6540 (_2!11815 lt!394065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_2!11817 lt!394193))) (currentByte!12004 (_2!11817 lt!394193)) (currentBit!11999 (_2!11817 lt!394193)))))))

(assert (= (and d!85318 res!213040) b!254231))

(assert (= (and b!254231 res!213041) b!254232))

(assert (= (and b!254232 (not res!213042)) b!254233))

(assert (=> b!254231 m!382807))

(assert (=> b!254231 m!382015))

(assert (=> b!254233 m!382807))

(assert (=> b!254233 m!382807))

(declare-fun m!382885 () Bool)

(assert (=> b!254233 m!382885))

(assert (=> b!253831 d!85318))

(declare-fun b!254234 () Bool)

(declare-fun e!176143 () Bool)

(declare-fun e!176142 () Bool)

(assert (=> b!254234 (= e!176143 e!176142)))

(declare-fun c!11719 () Bool)

(declare-fun lt!394942 () tuple4!302)

(assert (=> b!254234 (= c!11719 (= (_3!931 lt!394942) (_4!151 lt!394942)))))

(declare-fun b!254235 () Bool)

(declare-fun e!176141 () Bool)

(assert (=> b!254235 (= e!176142 e!176141)))

(declare-fun lt!394940 () (_ BitVec 32))

(declare-fun res!213044 () Bool)

(assert (=> b!254235 (= res!213044 (byteRangesEq!0 (select (arr!7019 (buf!6540 thiss!1005)) (_3!931 lt!394942)) (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_3!931 lt!394942)) lt!394940 #b00000000000000000000000000001000))))

(assert (=> b!254235 (=> (not res!213044) (not e!176141))))

(declare-fun b!254236 () Bool)

(declare-fun e!176140 () Bool)

(assert (=> b!254236 (= e!176140 e!176143)))

(declare-fun res!213047 () Bool)

(assert (=> b!254236 (=> (not res!213047) (not e!176143))))

(declare-fun e!176144 () Bool)

(assert (=> b!254236 (= res!213047 e!176144)))

(declare-fun res!213043 () Bool)

(assert (=> b!254236 (=> res!213043 e!176144)))

(assert (=> b!254236 (= res!213043 (bvsge (_1!11824 lt!394942) (_2!11824 lt!394942)))))

(declare-fun lt!394941 () (_ BitVec 32))

(assert (=> b!254236 (= lt!394941 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254236 (= lt!394940 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254236 (= lt!394942 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(declare-fun d!85320 () Bool)

(declare-fun res!213045 () Bool)

(assert (=> d!85320 (=> res!213045 e!176140)))

(assert (=> d!85320 (= res!213045 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(assert (=> d!85320 (= (arrayBitRangesEq!0 (buf!6540 thiss!1005) (buf!6540 (_2!11815 lt!394065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))) e!176140)))

(declare-fun b!254237 () Bool)

(declare-fun e!176145 () Bool)

(declare-fun call!3994 () Bool)

(assert (=> b!254237 (= e!176145 call!3994)))

(declare-fun b!254238 () Bool)

(assert (=> b!254238 (= e!176144 (arrayRangesEq!928 (buf!6540 thiss!1005) (buf!6540 (_2!11815 lt!394065)) (_1!11824 lt!394942) (_2!11824 lt!394942)))))

(declare-fun b!254239 () Bool)

(declare-fun res!213046 () Bool)

(assert (=> b!254239 (= res!213046 (= lt!394941 #b00000000000000000000000000000000))))

(assert (=> b!254239 (=> res!213046 e!176145)))

(assert (=> b!254239 (= e!176141 e!176145)))

(declare-fun bm!3991 () Bool)

(assert (=> bm!3991 (= call!3994 (byteRangesEq!0 (ite c!11719 (select (arr!7019 (buf!6540 thiss!1005)) (_3!931 lt!394942)) (select (arr!7019 (buf!6540 thiss!1005)) (_4!151 lt!394942))) (ite c!11719 (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_3!931 lt!394942)) (select (arr!7019 (buf!6540 (_2!11815 lt!394065))) (_4!151 lt!394942))) (ite c!11719 lt!394940 #b00000000000000000000000000000000) lt!394941))))

(declare-fun b!254240 () Bool)

(assert (=> b!254240 (= e!176142 call!3994)))

(assert (= (and d!85320 (not res!213045)) b!254236))

(assert (= (and b!254236 (not res!213043)) b!254238))

(assert (= (and b!254236 res!213047) b!254234))

(assert (= (and b!254234 c!11719) b!254240))

(assert (= (and b!254234 (not c!11719)) b!254235))

(assert (= (and b!254235 res!213044) b!254239))

(assert (= (and b!254239 (not res!213046)) b!254237))

(assert (= (or b!254240 b!254237) bm!3991))

(declare-fun m!382887 () Bool)

(assert (=> b!254235 m!382887))

(declare-fun m!382889 () Bool)

(assert (=> b!254235 m!382889))

(assert (=> b!254235 m!382887))

(assert (=> b!254235 m!382889))

(declare-fun m!382891 () Bool)

(assert (=> b!254235 m!382891))

(assert (=> b!254236 m!382075))

(assert (=> b!254236 m!382681))

(declare-fun m!382893 () Bool)

(assert (=> b!254238 m!382893))

(assert (=> bm!3991 m!382887))

(assert (=> bm!3991 m!382889))

(declare-fun m!382895 () Bool)

(assert (=> bm!3991 m!382895))

(declare-fun m!382897 () Bool)

(assert (=> bm!3991 m!382897))

(declare-fun m!382899 () Bool)

(assert (=> bm!3991 m!382899))

(assert (=> b!253874 d!85320))

(assert (=> b!253874 d!85042))

(assert (=> d!84978 d!85260))

(declare-fun d!85322 () Bool)

(declare-fun e!176146 () Bool)

(assert (=> d!85322 e!176146))

(declare-fun res!213048 () Bool)

(assert (=> d!85322 (=> (not res!213048) (not e!176146))))

(declare-fun lt!394946 () (_ BitVec 64))

(declare-fun lt!394948 () (_ BitVec 64))

(declare-fun lt!394944 () (_ BitVec 64))

(assert (=> d!85322 (= res!213048 (= lt!394946 (bvsub lt!394944 lt!394948)))))

(assert (=> d!85322 (or (= (bvand lt!394944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394948 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394944 lt!394948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85322 (= lt!394948 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394264)))) ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394264))) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394264)))))))

(declare-fun lt!394947 () (_ BitVec 64))

(declare-fun lt!394945 () (_ BitVec 64))

(assert (=> d!85322 (= lt!394944 (bvmul lt!394947 lt!394945))))

(assert (=> d!85322 (or (= lt!394947 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394945 (bvsdiv (bvmul lt!394947 lt!394945) lt!394947)))))

(assert (=> d!85322 (= lt!394945 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85322 (= lt!394947 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394264)))))))

(assert (=> d!85322 (= lt!394946 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394264))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394264)))))))

(assert (=> d!85322 (invariant!0 (currentBit!11999 (_1!11816 lt!394264)) (currentByte!12004 (_1!11816 lt!394264)) (size!6032 (buf!6540 (_1!11816 lt!394264))))))

(assert (=> d!85322 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394264))) (currentByte!12004 (_1!11816 lt!394264)) (currentBit!11999 (_1!11816 lt!394264))) lt!394946)))

(declare-fun b!254241 () Bool)

(declare-fun res!213049 () Bool)

(assert (=> b!254241 (=> (not res!213049) (not e!176146))))

(assert (=> b!254241 (= res!213049 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394946))))

(declare-fun b!254242 () Bool)

(declare-fun lt!394943 () (_ BitVec 64))

(assert (=> b!254242 (= e!176146 (bvsle lt!394946 (bvmul lt!394943 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254242 (or (= lt!394943 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394943 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394943)))))

(assert (=> b!254242 (= lt!394943 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394264)))))))

(assert (= (and d!85322 res!213048) b!254241))

(assert (= (and b!254241 res!213049) b!254242))

(declare-fun m!382901 () Bool)

(assert (=> d!85322 m!382901))

(declare-fun m!382903 () Bool)

(assert (=> d!85322 m!382903))

(assert (=> b!253865 d!85322))

(assert (=> b!253865 d!85270))

(assert (=> b!253872 d!85042))

(assert (=> b!253872 d!85034))

(declare-fun d!85324 () Bool)

(assert (=> d!85324 (= (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394063)))) ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394063))) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394063)))) (bvsub (bvmul ((_ sign_extend 32) (size!6032 (buf!6540 (_1!11816 lt!394063)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_1!11816 lt!394063))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_1!11816 lt!394063))))))))

(assert (=> d!85028 d!85324))

(declare-fun d!85326 () Bool)

(assert (=> d!85326 (= (invariant!0 (currentBit!11999 (_1!11816 lt!394063)) (currentByte!12004 (_1!11816 lt!394063)) (size!6032 (buf!6540 (_1!11816 lt!394063)))) (and (bvsge (currentBit!11999 (_1!11816 lt!394063)) #b00000000000000000000000000000000) (bvslt (currentBit!11999 (_1!11816 lt!394063)) #b00000000000000000000000000001000) (bvsge (currentByte!12004 (_1!11816 lt!394063)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12004 (_1!11816 lt!394063)) (size!6032 (buf!6540 (_1!11816 lt!394063)))) (and (= (currentBit!11999 (_1!11816 lt!394063)) #b00000000000000000000000000000000) (= (currentByte!12004 (_1!11816 lt!394063)) (size!6032 (buf!6540 (_1!11816 lt!394063))))))))))

(assert (=> d!85028 d!85326))

(declare-fun d!85328 () Bool)

(declare-fun lt!394949 () tuple2!21780)

(assert (=> d!85328 (= lt!394949 (checkBitsLoop!0 (_1!11817 lt!394245) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85328 (= (checkBitsLoopPure!0 (_1!11817 lt!394245) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21771 (_2!11821 lt!394949) (_1!11821 lt!394949)))))

(declare-fun bs!21556 () Bool)

(assert (= bs!21556 d!85328))

(declare-fun m!382905 () Bool)

(assert (=> bs!21556 m!382905))

(assert (=> b!253851 d!85328))

(declare-fun d!85330 () Bool)

(assert (=> d!85330 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394251)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394250) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394251)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055)))) lt!394250))))

(declare-fun bs!21557 () Bool)

(assert (= bs!21557 d!85330))

(declare-fun m!382907 () Bool)

(assert (=> bs!21557 m!382907))

(assert (=> b!253851 d!85330))

(declare-fun d!85332 () Bool)

(assert (=> d!85332 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394251)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394055))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394055))) lt!394250)))

(declare-fun lt!394950 () Unit!18239)

(assert (=> d!85332 (= lt!394950 (choose!9 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394251)) lt!394250 (BitStream!10987 (buf!6540 (_2!11815 lt!394251)) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055)))))))

(assert (=> d!85332 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11815 lt!394055) (buf!6540 (_2!11815 lt!394251)) lt!394250) lt!394950)))

(declare-fun bs!21558 () Bool)

(assert (= bs!21558 d!85332))

(assert (=> bs!21558 m!382245))

(declare-fun m!382909 () Bool)

(assert (=> bs!21558 m!382909))

(assert (=> b!253851 d!85332))

(declare-fun d!85334 () Bool)

(declare-fun e!176148 () Bool)

(assert (=> d!85334 e!176148))

(declare-fun res!213052 () Bool)

(assert (=> d!85334 (=> (not res!213052) (not e!176148))))

(declare-fun lt!394960 () tuple2!21772)

(assert (=> d!85334 (= res!213052 (isPrefixOf!0 (_1!11817 lt!394960) (_2!11817 lt!394960)))))

(declare-fun lt!394966 () BitStream!10986)

(assert (=> d!85334 (= lt!394960 (tuple2!21773 lt!394966 (_2!11815 lt!394251)))))

(declare-fun lt!394961 () Unit!18239)

(declare-fun lt!394968 () Unit!18239)

(assert (=> d!85334 (= lt!394961 lt!394968)))

(assert (=> d!85334 (isPrefixOf!0 lt!394966 (_2!11815 lt!394251))))

(assert (=> d!85334 (= lt!394968 (lemmaIsPrefixTransitive!0 lt!394966 (_2!11815 lt!394251) (_2!11815 lt!394251)))))

(declare-fun lt!394952 () Unit!18239)

(declare-fun lt!394951 () Unit!18239)

(assert (=> d!85334 (= lt!394952 lt!394951)))

(assert (=> d!85334 (isPrefixOf!0 lt!394966 (_2!11815 lt!394251))))

(assert (=> d!85334 (= lt!394951 (lemmaIsPrefixTransitive!0 lt!394966 (_2!11815 lt!394055) (_2!11815 lt!394251)))))

(declare-fun lt!394964 () Unit!18239)

(declare-fun e!176147 () Unit!18239)

(assert (=> d!85334 (= lt!394964 e!176147)))

(declare-fun c!11720 () Bool)

(assert (=> d!85334 (= c!11720 (not (= (size!6032 (buf!6540 (_2!11815 lt!394055))) #b00000000000000000000000000000000)))))

(declare-fun lt!394958 () Unit!18239)

(declare-fun lt!394955 () Unit!18239)

(assert (=> d!85334 (= lt!394958 lt!394955)))

(assert (=> d!85334 (isPrefixOf!0 (_2!11815 lt!394251) (_2!11815 lt!394251))))

(assert (=> d!85334 (= lt!394955 (lemmaIsPrefixRefl!0 (_2!11815 lt!394251)))))

(declare-fun lt!394954 () Unit!18239)

(declare-fun lt!394963 () Unit!18239)

(assert (=> d!85334 (= lt!394954 lt!394963)))

(assert (=> d!85334 (= lt!394963 (lemmaIsPrefixRefl!0 (_2!11815 lt!394251)))))

(declare-fun lt!394957 () Unit!18239)

(declare-fun lt!394967 () Unit!18239)

(assert (=> d!85334 (= lt!394957 lt!394967)))

(assert (=> d!85334 (isPrefixOf!0 lt!394966 lt!394966)))

(assert (=> d!85334 (= lt!394967 (lemmaIsPrefixRefl!0 lt!394966))))

(declare-fun lt!394959 () Unit!18239)

(declare-fun lt!394965 () Unit!18239)

(assert (=> d!85334 (= lt!394959 lt!394965)))

(assert (=> d!85334 (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 lt!394055))))

(assert (=> d!85334 (= lt!394965 (lemmaIsPrefixRefl!0 (_2!11815 lt!394055)))))

(assert (=> d!85334 (= lt!394966 (BitStream!10987 (buf!6540 (_2!11815 lt!394251)) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))))))

(assert (=> d!85334 (isPrefixOf!0 (_2!11815 lt!394055) (_2!11815 lt!394251))))

(assert (=> d!85334 (= (reader!0 (_2!11815 lt!394055) (_2!11815 lt!394251)) lt!394960)))

(declare-fun b!254243 () Bool)

(declare-fun res!213051 () Bool)

(assert (=> b!254243 (=> (not res!213051) (not e!176148))))

(assert (=> b!254243 (= res!213051 (isPrefixOf!0 (_2!11817 lt!394960) (_2!11815 lt!394251)))))

(declare-fun b!254244 () Bool)

(declare-fun lt!394970 () Unit!18239)

(assert (=> b!254244 (= e!176147 lt!394970)))

(declare-fun lt!394956 () (_ BitVec 64))

(assert (=> b!254244 (= lt!394956 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!394953 () (_ BitVec 64))

(assert (=> b!254244 (= lt!394953 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))))))

(assert (=> b!254244 (= lt!394970 (arrayBitRangesEqSymmetric!0 (buf!6540 (_2!11815 lt!394055)) (buf!6540 (_2!11815 lt!394251)) lt!394956 lt!394953))))

(assert (=> b!254244 (arrayBitRangesEq!0 (buf!6540 (_2!11815 lt!394251)) (buf!6540 (_2!11815 lt!394055)) lt!394956 lt!394953)))

(declare-fun lt!394969 () (_ BitVec 64))

(declare-fun lt!394962 () (_ BitVec 64))

(declare-fun b!254245 () Bool)

(assert (=> b!254245 (= e!176148 (= (_1!11817 lt!394960) (withMovedBitIndex!0 (_2!11817 lt!394960) (bvsub lt!394969 lt!394962))))))

(assert (=> b!254245 (or (= (bvand lt!394969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394962 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394969 lt!394962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254245 (= lt!394962 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394251))) (currentByte!12004 (_2!11815 lt!394251)) (currentBit!11999 (_2!11815 lt!394251))))))

(assert (=> b!254245 (= lt!394969 (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394055))) (currentByte!12004 (_2!11815 lt!394055)) (currentBit!11999 (_2!11815 lt!394055))))))

(declare-fun b!254246 () Bool)

(declare-fun res!213050 () Bool)

(assert (=> b!254246 (=> (not res!213050) (not e!176148))))

(assert (=> b!254246 (= res!213050 (isPrefixOf!0 (_1!11817 lt!394960) (_2!11815 lt!394055)))))

(declare-fun b!254247 () Bool)

(declare-fun Unit!18255 () Unit!18239)

(assert (=> b!254247 (= e!176147 Unit!18255)))

(assert (= (and d!85334 c!11720) b!254244))

(assert (= (and d!85334 (not c!11720)) b!254247))

(assert (= (and d!85334 res!213052) b!254246))

(assert (= (and b!254246 res!213050) b!254243))

(assert (= (and b!254243 res!213051) b!254245))

(declare-fun m!382911 () Bool)

(assert (=> b!254243 m!382911))

(declare-fun m!382913 () Bool)

(assert (=> b!254245 m!382913))

(assert (=> b!254245 m!382239))

(assert (=> b!254245 m!382017))

(assert (=> b!254244 m!382017))

(declare-fun m!382915 () Bool)

(assert (=> b!254244 m!382915))

(declare-fun m!382917 () Bool)

(assert (=> b!254244 m!382917))

(declare-fun m!382919 () Bool)

(assert (=> b!254246 m!382919))

(declare-fun m!382921 () Bool)

(assert (=> d!85334 m!382921))

(declare-fun m!382923 () Bool)

(assert (=> d!85334 m!382923))

(declare-fun m!382925 () Bool)

(assert (=> d!85334 m!382925))

(declare-fun m!382927 () Bool)

(assert (=> d!85334 m!382927))

(assert (=> d!85334 m!382191))

(declare-fun m!382929 () Bool)

(assert (=> d!85334 m!382929))

(declare-fun m!382931 () Bool)

(assert (=> d!85334 m!382931))

(declare-fun m!382933 () Bool)

(assert (=> d!85334 m!382933))

(assert (=> d!85334 m!382199))

(declare-fun m!382935 () Bool)

(assert (=> d!85334 m!382935))

(assert (=> d!85334 m!382251))

(assert (=> b!253851 d!85334))

(declare-fun d!85336 () Bool)

(declare-fun res!213053 () Bool)

(declare-fun e!176150 () Bool)

(assert (=> d!85336 (=> (not res!213053) (not e!176150))))

(assert (=> d!85336 (= res!213053 (= (size!6032 (buf!6540 thiss!1005)) (size!6032 (buf!6540 (_2!11815 lt!394261)))))))

(assert (=> d!85336 (= (isPrefixOf!0 thiss!1005 (_2!11815 lt!394261)) e!176150)))

(declare-fun b!254248 () Bool)

(declare-fun res!213054 () Bool)

(assert (=> b!254248 (=> (not res!213054) (not e!176150))))

(assert (=> b!254248 (= res!213054 (bvsle (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394261))) (currentByte!12004 (_2!11815 lt!394261)) (currentBit!11999 (_2!11815 lt!394261)))))))

(declare-fun b!254249 () Bool)

(declare-fun e!176149 () Bool)

(assert (=> b!254249 (= e!176150 e!176149)))

(declare-fun res!213055 () Bool)

(assert (=> b!254249 (=> res!213055 e!176149)))

(assert (=> b!254249 (= res!213055 (= (size!6032 (buf!6540 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!254250 () Bool)

(assert (=> b!254250 (= e!176149 (arrayBitRangesEq!0 (buf!6540 thiss!1005) (buf!6540 (_2!11815 lt!394261)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(assert (= (and d!85336 res!213053) b!254248))

(assert (= (and b!254248 res!213054) b!254249))

(assert (= (and b!254249 (not res!213055)) b!254250))

(assert (=> b!254248 m!382075))

(assert (=> b!254248 m!382265))

(assert (=> b!254250 m!382075))

(assert (=> b!254250 m!382075))

(declare-fun m!382937 () Bool)

(assert (=> b!254250 m!382937))

(assert (=> b!253863 d!85336))

(declare-fun b!254251 () Bool)

(declare-fun e!176152 () tuple2!21780)

(declare-fun lt!394977 () tuple2!21780)

(assert (=> b!254251 (= e!176152 (tuple2!21781 false (_2!11821 lt!394977)))))

(declare-fun d!85338 () Bool)

(declare-fun e!176154 () Bool)

(assert (=> d!85338 e!176154))

(declare-fun res!213056 () Bool)

(assert (=> d!85338 (=> (not res!213056) (not e!176154))))

(declare-fun lt!394981 () (_ BitVec 64))

(declare-fun lt!394980 () tuple2!21780)

(assert (=> d!85338 (= res!213056 (bvsge (bvsub lt!394981 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6032 (buf!6540 (_2!11821 lt!394980))) (currentByte!12004 (_2!11821 lt!394980)) (currentBit!11999 (_2!11821 lt!394980)))))))

(assert (=> d!85338 (or (= (bvand lt!394981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394981 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!394978 () (_ BitVec 64))

(assert (=> d!85338 (= lt!394981 (bvadd lt!394978 nBits!297))))

(assert (=> d!85338 (or (not (= (bvand lt!394978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394978 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85338 (= lt!394978 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394049))) (currentByte!12004 (_1!11817 lt!394049)) (currentBit!11999 (_1!11817 lt!394049))))))

(declare-fun e!176151 () tuple2!21780)

(assert (=> d!85338 (= lt!394980 e!176151)))

(declare-fun c!11721 () Bool)

(assert (=> d!85338 (= c!11721 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!85338 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85338 (= (checkBitsLoop!0 (_1!11817 lt!394049) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!394980)))

(declare-fun lt!394971 () (_ BitVec 64))

(declare-fun e!176153 () Bool)

(declare-fun b!254252 () Bool)

(assert (=> b!254252 (= e!176153 (= (bvsub lt!394971 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6032 (buf!6540 (_2!11821 lt!394980))) (currentByte!12004 (_2!11821 lt!394980)) (currentBit!11999 (_2!11821 lt!394980)))))))

(assert (=> b!254252 (or (= (bvand lt!394971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394971 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!394976 () (_ BitVec 64))

(assert (=> b!254252 (= lt!394971 (bvadd lt!394976 nBits!297))))

(assert (=> b!254252 (or (not (= (bvand lt!394976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394976 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254252 (= lt!394976 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394049))) (currentByte!12004 (_1!11817 lt!394049)) (currentBit!11999 (_1!11817 lt!394049))))))

(declare-fun b!254253 () Bool)

(declare-fun res!213058 () Bool)

(assert (=> b!254253 (=> (not res!213058) (not e!176154))))

(assert (=> b!254253 (= res!213058 e!176153)))

(declare-fun res!213057 () Bool)

(assert (=> b!254253 (=> res!213057 e!176153)))

(assert (=> b!254253 (= res!213057 (not (_1!11821 lt!394980)))))

(declare-fun b!254254 () Bool)

(declare-fun res!213059 () Bool)

(assert (=> b!254254 (=> (not res!213059) (not e!176154))))

(assert (=> b!254254 (= res!213059 (and (= (buf!6540 (_1!11817 lt!394049)) (buf!6540 (_2!11821 lt!394980))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11821 lt!394980))))))

(declare-fun b!254255 () Bool)

(assert (=> b!254255 (= e!176151 (tuple2!21781 true (_1!11817 lt!394049)))))

(declare-fun lt!394979 () tuple2!21780)

(declare-fun b!254256 () Bool)

(assert (=> b!254256 (= lt!394979 (checkBitsLoop!0 (_2!11821 lt!394977) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!394974 () Unit!18239)

(declare-fun lt!394972 () Unit!18239)

(assert (=> b!254256 (= lt!394974 lt!394972)))

(declare-fun lt!394973 () (_ BitVec 64))

(declare-fun lt!394975 () (_ BitVec 64))

(assert (=> b!254256 (validate_offset_bits!1 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11821 lt!394977)))) ((_ sign_extend 32) (currentByte!12004 (_2!11821 lt!394977))) ((_ sign_extend 32) (currentBit!11999 (_2!11821 lt!394977))) (bvsub lt!394973 lt!394975))))

(assert (=> b!254256 (= lt!394972 (validateOffsetBitsIneqLemma!0 (_1!11817 lt!394049) (_2!11821 lt!394977) lt!394973 lt!394975))))

(assert (=> b!254256 (= lt!394975 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254256 (= lt!394973 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254256 (= e!176152 (tuple2!21781 (_1!11821 lt!394979) (_2!11821 lt!394979)))))

(declare-fun b!254257 () Bool)

(declare-fun e!176155 () Bool)

(assert (=> b!254257 (= e!176155 (= bit!26 (_2!11816 (readBitPure!0 (_1!11817 lt!394049)))))))

(declare-fun b!254258 () Bool)

(assert (=> b!254258 (= e!176151 e!176152)))

(assert (=> b!254258 (= lt!394977 (readBit!0 (_1!11817 lt!394049)))))

(declare-fun c!11722 () Bool)

(assert (=> b!254258 (= c!11722 (not (= (_1!11821 lt!394977) bit!26)))))

(declare-fun b!254259 () Bool)

(assert (=> b!254259 (= e!176154 e!176155)))

(declare-fun res!213060 () Bool)

(assert (=> b!254259 (=> res!213060 e!176155)))

(assert (=> b!254259 (= res!213060 (or (not (_1!11821 lt!394980)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(assert (= (and d!85338 c!11721) b!254255))

(assert (= (and d!85338 (not c!11721)) b!254258))

(assert (= (and b!254258 c!11722) b!254251))

(assert (= (and b!254258 (not c!11722)) b!254256))

(assert (= (and d!85338 res!213056) b!254254))

(assert (= (and b!254254 res!213059) b!254253))

(assert (= (and b!254253 (not res!213057)) b!254252))

(assert (= (and b!254253 res!213058) b!254259))

(assert (= (and b!254259 (not res!213060)) b!254257))

(declare-fun m!382939 () Bool)

(assert (=> d!85338 m!382939))

(declare-fun m!382941 () Bool)

(assert (=> d!85338 m!382941))

(assert (=> b!254252 m!382939))

(assert (=> b!254252 m!382941))

(declare-fun m!382943 () Bool)

(assert (=> b!254258 m!382943))

(declare-fun m!382945 () Bool)

(assert (=> b!254257 m!382945))

(declare-fun m!382947 () Bool)

(assert (=> b!254256 m!382947))

(declare-fun m!382949 () Bool)

(assert (=> b!254256 m!382949))

(declare-fun m!382951 () Bool)

(assert (=> b!254256 m!382951))

(assert (=> d!85002 d!85338))

(assert (=> d!84986 d!85220))

(declare-fun b!254271 () Bool)

(declare-fun e!176166 () Bool)

(declare-fun e!176165 () Bool)

(assert (=> b!254271 (= e!176166 e!176165)))

(declare-fun res!213070 () Bool)

(assert (=> b!254271 (=> (not res!213070) (not e!176165))))

(declare-fun lt!394984 () tuple2!21770)

(declare-fun _$19!198 () tuple2!21768)

(assert (=> b!254271 (= res!213070 (and (= (_2!11816 lt!394984) bit!26) (= (_1!11816 lt!394984) (_2!11815 _$19!198))))))

(assert (=> b!254271 (= lt!394984 (readBitPure!0 (readerFrom!0 (_2!11815 _$19!198) (currentBit!11999 thiss!1005) (currentByte!12004 thiss!1005))))))

(declare-fun b!254272 () Bool)

(declare-fun res!213072 () Bool)

(assert (=> b!254272 (=> (not res!213072) (not e!176166))))

(assert (=> b!254272 (= res!213072 (isPrefixOf!0 thiss!1005 (_2!11815 _$19!198)))))

(declare-fun b!254273 () Bool)

(declare-fun e!176164 () Bool)

(assert (=> b!254273 (= e!176164 (array_inv!5773 (buf!6540 (_2!11815 _$19!198))))))

(declare-fun d!85340 () Bool)

(assert (=> d!85340 e!176166))

(declare-fun res!213071 () Bool)

(assert (=> d!85340 (=> (not res!213071) (not e!176166))))

(assert (=> d!85340 (= res!213071 (= (size!6032 (buf!6540 thiss!1005)) (size!6032 (buf!6540 (_2!11815 _$19!198)))))))

(assert (=> d!85340 (and (inv!12 (_2!11815 _$19!198)) e!176164)))

(assert (=> d!85340 (= (choose!16 thiss!1005 bit!26) _$19!198)))

(declare-fun b!254274 () Bool)

(declare-fun res!213069 () Bool)

(assert (=> b!254274 (=> (not res!213069) (not e!176166))))

(assert (=> b!254274 (= res!213069 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 _$19!198))) (currentByte!12004 (_2!11815 _$19!198)) (currentBit!11999 (_2!11815 _$19!198))) (bvadd (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!254275 () Bool)

(assert (=> b!254275 (= e!176165 (= (bitIndex!0 (size!6032 (buf!6540 (_1!11816 lt!394984))) (currentByte!12004 (_1!11816 lt!394984)) (currentBit!11999 (_1!11816 lt!394984))) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 _$19!198))) (currentByte!12004 (_2!11815 _$19!198)) (currentBit!11999 (_2!11815 _$19!198)))))))

(assert (= d!85340 b!254273))

(assert (= (and d!85340 res!213071) b!254274))

(assert (= (and b!254274 res!213069) b!254272))

(assert (= (and b!254272 res!213072) b!254271))

(assert (= (and b!254271 res!213070) b!254275))

(declare-fun m!382953 () Bool)

(assert (=> b!254275 m!382953))

(declare-fun m!382955 () Bool)

(assert (=> b!254275 m!382955))

(declare-fun m!382957 () Bool)

(assert (=> b!254271 m!382957))

(assert (=> b!254271 m!382957))

(declare-fun m!382959 () Bool)

(assert (=> b!254271 m!382959))

(declare-fun m!382961 () Bool)

(assert (=> b!254272 m!382961))

(declare-fun m!382963 () Bool)

(assert (=> d!85340 m!382963))

(assert (=> b!254274 m!382955))

(assert (=> b!254274 m!382075))

(declare-fun m!382965 () Bool)

(assert (=> b!254273 m!382965))

(assert (=> d!85006 d!85340))

(declare-fun d!85342 () Bool)

(assert (=> d!85342 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 thiss!1005))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21559 () Bool)

(assert (= bs!21559 d!85342))

(assert (=> bs!21559 m!382163))

(assert (=> d!85006 d!85342))

(declare-fun d!85344 () Bool)

(declare-fun e!176168 () Bool)

(assert (=> d!85344 e!176168))

(declare-fun res!213073 () Bool)

(assert (=> d!85344 (=> (not res!213073) (not e!176168))))

(declare-fun lt!394988 () (_ BitVec 64))

(declare-fun lt!394990 () (_ BitVec 64))

(declare-fun lt!394986 () (_ BitVec 64))

(assert (=> d!85344 (= res!213073 (= lt!394988 (bvsub lt!394986 lt!394990)))))

(assert (=> d!85344 (or (= (bvand lt!394986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394990 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394986 lt!394990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85344 (= lt!394990 (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394251)))) ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394251))) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394251)))))))

(declare-fun lt!394989 () (_ BitVec 64))

(declare-fun lt!394987 () (_ BitVec 64))

(assert (=> d!85344 (= lt!394986 (bvmul lt!394989 lt!394987))))

(assert (=> d!85344 (or (= lt!394989 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394987 (bvsdiv (bvmul lt!394989 lt!394987) lt!394989)))))

(assert (=> d!85344 (= lt!394987 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85344 (= lt!394989 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394251)))))))

(assert (=> d!85344 (= lt!394988 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 (_2!11815 lt!394251))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 (_2!11815 lt!394251)))))))

(assert (=> d!85344 (invariant!0 (currentBit!11999 (_2!11815 lt!394251)) (currentByte!12004 (_2!11815 lt!394251)) (size!6032 (buf!6540 (_2!11815 lt!394251))))))

(assert (=> d!85344 (= (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394251))) (currentByte!12004 (_2!11815 lt!394251)) (currentBit!11999 (_2!11815 lt!394251))) lt!394988)))

(declare-fun b!254276 () Bool)

(declare-fun res!213074 () Bool)

(assert (=> b!254276 (=> (not res!213074) (not e!176168))))

(assert (=> b!254276 (= res!213074 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394988))))

(declare-fun b!254277 () Bool)

(declare-fun lt!394985 () (_ BitVec 64))

(assert (=> b!254277 (= e!176168 (bvsle lt!394988 (bvmul lt!394985 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254277 (or (= lt!394985 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394985 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394985)))))

(assert (=> b!254277 (= lt!394985 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394251)))))))

(assert (= (and d!85344 res!213073) b!254276))

(assert (= (and b!254276 res!213074) b!254277))

(declare-fun m!382967 () Bool)

(assert (=> d!85344 m!382967))

(declare-fun m!382969 () Bool)

(assert (=> d!85344 m!382969))

(assert (=> b!253849 d!85344))

(assert (=> b!253849 d!85036))

(declare-fun d!85346 () Bool)

(assert (=> d!85346 (isPrefixOf!0 lt!394222 (_2!11815 lt!394065))))

(declare-fun lt!394991 () Unit!18239)

(assert (=> d!85346 (= lt!394991 (choose!30 lt!394222 thiss!1005 (_2!11815 lt!394065)))))

(assert (=> d!85346 (isPrefixOf!0 lt!394222 thiss!1005)))

(assert (=> d!85346 (= (lemmaIsPrefixTransitive!0 lt!394222 thiss!1005 (_2!11815 lt!394065)) lt!394991)))

(declare-fun bs!21560 () Bool)

(assert (= bs!21560 d!85346))

(assert (=> bs!21560 m!382223))

(declare-fun m!382971 () Bool)

(assert (=> bs!21560 m!382971))

(declare-fun m!382973 () Bool)

(assert (=> bs!21560 m!382973))

(assert (=> d!84998 d!85346))

(assert (=> d!84998 d!85008))

(declare-fun d!85348 () Bool)

(assert (=> d!85348 (isPrefixOf!0 lt!394222 (_2!11815 lt!394065))))

(declare-fun lt!394992 () Unit!18239)

(assert (=> d!85348 (= lt!394992 (choose!30 lt!394222 (_2!11815 lt!394065) (_2!11815 lt!394065)))))

(assert (=> d!85348 (isPrefixOf!0 lt!394222 (_2!11815 lt!394065))))

(assert (=> d!85348 (= (lemmaIsPrefixTransitive!0 lt!394222 (_2!11815 lt!394065) (_2!11815 lt!394065)) lt!394992)))

(declare-fun bs!21561 () Bool)

(assert (= bs!21561 d!85348))

(assert (=> bs!21561 m!382223))

(declare-fun m!382975 () Bool)

(assert (=> bs!21561 m!382975))

(assert (=> bs!21561 m!382223))

(assert (=> d!84998 d!85348))

(declare-fun d!85350 () Bool)

(declare-fun res!213075 () Bool)

(declare-fun e!176170 () Bool)

(assert (=> d!85350 (=> (not res!213075) (not e!176170))))

(assert (=> d!85350 (= res!213075 (= (size!6032 (buf!6540 thiss!1005)) (size!6032 (buf!6540 thiss!1005))))))

(assert (=> d!85350 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!176170)))

(declare-fun b!254278 () Bool)

(declare-fun res!213076 () Bool)

(assert (=> b!254278 (=> (not res!213076) (not e!176170))))

(assert (=> b!254278 (= res!213076 (bvsle (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005)) (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(declare-fun b!254279 () Bool)

(declare-fun e!176169 () Bool)

(assert (=> b!254279 (= e!176170 e!176169)))

(declare-fun res!213077 () Bool)

(assert (=> b!254279 (=> res!213077 e!176169)))

(assert (=> b!254279 (= res!213077 (= (size!6032 (buf!6540 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!254280 () Bool)

(assert (=> b!254280 (= e!176169 (arrayBitRangesEq!0 (buf!6540 thiss!1005) (buf!6540 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 thiss!1005)) (currentByte!12004 thiss!1005) (currentBit!11999 thiss!1005))))))

(assert (= (and d!85350 res!213075) b!254278))

(assert (= (and b!254278 res!213076) b!254279))

(assert (= (and b!254279 (not res!213077)) b!254280))

(assert (=> b!254278 m!382075))

(assert (=> b!254278 m!382075))

(assert (=> b!254280 m!382075))

(assert (=> b!254280 m!382075))

(declare-fun m!382977 () Bool)

(assert (=> b!254280 m!382977))

(assert (=> d!84998 d!85350))

(declare-fun d!85352 () Bool)

(declare-fun res!213078 () Bool)

(declare-fun e!176172 () Bool)

(assert (=> d!85352 (=> (not res!213078) (not e!176172))))

(assert (=> d!85352 (= res!213078 (= (size!6032 (buf!6540 (_1!11817 lt!394216))) (size!6032 (buf!6540 (_2!11817 lt!394216)))))))

(assert (=> d!85352 (= (isPrefixOf!0 (_1!11817 lt!394216) (_2!11817 lt!394216)) e!176172)))

(declare-fun b!254281 () Bool)

(declare-fun res!213079 () Bool)

(assert (=> b!254281 (=> (not res!213079) (not e!176172))))

(assert (=> b!254281 (= res!213079 (bvsle (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394216))) (currentByte!12004 (_1!11817 lt!394216)) (currentBit!11999 (_1!11817 lt!394216))) (bitIndex!0 (size!6032 (buf!6540 (_2!11817 lt!394216))) (currentByte!12004 (_2!11817 lt!394216)) (currentBit!11999 (_2!11817 lt!394216)))))))

(declare-fun b!254282 () Bool)

(declare-fun e!176171 () Bool)

(assert (=> b!254282 (= e!176172 e!176171)))

(declare-fun res!213080 () Bool)

(assert (=> b!254282 (=> res!213080 e!176171)))

(assert (=> b!254282 (= res!213080 (= (size!6032 (buf!6540 (_1!11817 lt!394216))) #b00000000000000000000000000000000))))

(declare-fun b!254283 () Bool)

(assert (=> b!254283 (= e!176171 (arrayBitRangesEq!0 (buf!6540 (_1!11817 lt!394216)) (buf!6540 (_2!11817 lt!394216)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 (_1!11817 lt!394216))) (currentByte!12004 (_1!11817 lt!394216)) (currentBit!11999 (_1!11817 lt!394216)))))))

(assert (= (and d!85352 res!213078) b!254281))

(assert (= (and b!254281 res!213079) b!254282))

(assert (= (and b!254282 (not res!213080)) b!254283))

(assert (=> b!254281 m!382703))

(assert (=> b!254281 m!382855))

(assert (=> b!254283 m!382703))

(assert (=> b!254283 m!382703))

(declare-fun m!382979 () Bool)

(assert (=> b!254283 m!382979))

(assert (=> d!84998 d!85352))

(assert (=> d!84998 d!85284))

(assert (=> d!84998 d!85290))

(declare-fun d!85354 () Bool)

(declare-fun res!213081 () Bool)

(declare-fun e!176174 () Bool)

(assert (=> d!85354 (=> (not res!213081) (not e!176174))))

(assert (=> d!85354 (= res!213081 (= (size!6032 (buf!6540 lt!394222)) (size!6032 (buf!6540 lt!394222))))))

(assert (=> d!85354 (= (isPrefixOf!0 lt!394222 lt!394222) e!176174)))

(declare-fun b!254284 () Bool)

(declare-fun res!213082 () Bool)

(assert (=> b!254284 (=> (not res!213082) (not e!176174))))

(assert (=> b!254284 (= res!213082 (bvsle (bitIndex!0 (size!6032 (buf!6540 lt!394222)) (currentByte!12004 lt!394222) (currentBit!11999 lt!394222)) (bitIndex!0 (size!6032 (buf!6540 lt!394222)) (currentByte!12004 lt!394222) (currentBit!11999 lt!394222))))))

(declare-fun b!254285 () Bool)

(declare-fun e!176173 () Bool)

(assert (=> b!254285 (= e!176174 e!176173)))

(declare-fun res!213083 () Bool)

(assert (=> b!254285 (=> res!213083 e!176173)))

(assert (=> b!254285 (= res!213083 (= (size!6032 (buf!6540 lt!394222)) #b00000000000000000000000000000000))))

(declare-fun b!254286 () Bool)

(assert (=> b!254286 (= e!176173 (arrayBitRangesEq!0 (buf!6540 lt!394222) (buf!6540 lt!394222) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 lt!394222)) (currentByte!12004 lt!394222) (currentBit!11999 lt!394222))))))

(assert (= (and d!85354 res!213081) b!254284))

(assert (= (and b!254284 res!213082) b!254285))

(assert (= (and b!254285 (not res!213083)) b!254286))

(declare-fun m!382981 () Bool)

(assert (=> b!254284 m!382981))

(assert (=> b!254284 m!382981))

(assert (=> b!254286 m!382981))

(assert (=> b!254286 m!382981))

(declare-fun m!382983 () Bool)

(assert (=> b!254286 m!382983))

(assert (=> d!84998 d!85354))

(declare-fun d!85356 () Bool)

(declare-fun res!213084 () Bool)

(declare-fun e!176176 () Bool)

(assert (=> d!85356 (=> (not res!213084) (not e!176176))))

(assert (=> d!85356 (= res!213084 (= (size!6032 (buf!6540 lt!394222)) (size!6032 (buf!6540 (_2!11815 lt!394065)))))))

(assert (=> d!85356 (= (isPrefixOf!0 lt!394222 (_2!11815 lt!394065)) e!176176)))

(declare-fun b!254287 () Bool)

(declare-fun res!213085 () Bool)

(assert (=> b!254287 (=> (not res!213085) (not e!176176))))

(assert (=> b!254287 (= res!213085 (bvsle (bitIndex!0 (size!6032 (buf!6540 lt!394222)) (currentByte!12004 lt!394222) (currentBit!11999 lt!394222)) (bitIndex!0 (size!6032 (buf!6540 (_2!11815 lt!394065))) (currentByte!12004 (_2!11815 lt!394065)) (currentBit!11999 (_2!11815 lt!394065)))))))

(declare-fun b!254288 () Bool)

(declare-fun e!176175 () Bool)

(assert (=> b!254288 (= e!176176 e!176175)))

(declare-fun res!213086 () Bool)

(assert (=> b!254288 (=> res!213086 e!176175)))

(assert (=> b!254288 (= res!213086 (= (size!6032 (buf!6540 lt!394222)) #b00000000000000000000000000000000))))

(declare-fun b!254289 () Bool)

(assert (=> b!254289 (= e!176175 (arrayBitRangesEq!0 (buf!6540 lt!394222) (buf!6540 (_2!11815 lt!394065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6032 (buf!6540 lt!394222)) (currentByte!12004 lt!394222) (currentBit!11999 lt!394222))))))

(assert (= (and d!85356 res!213084) b!254287))

(assert (= (and b!254287 res!213085) b!254288))

(assert (= (and b!254288 (not res!213086)) b!254289))

(assert (=> b!254287 m!382981))

(assert (=> b!254287 m!382015))

(assert (=> b!254289 m!382981))

(assert (=> b!254289 m!382981))

(declare-fun m!382985 () Bool)

(assert (=> b!254289 m!382985))

(assert (=> d!84998 d!85356))

(declare-fun d!85358 () Bool)

(assert (=> d!85358 (isPrefixOf!0 lt!394222 lt!394222)))

(declare-fun lt!394993 () Unit!18239)

(assert (=> d!85358 (= lt!394993 (choose!11 lt!394222))))

(assert (=> d!85358 (= (lemmaIsPrefixRefl!0 lt!394222) lt!394993)))

(declare-fun bs!21562 () Bool)

(assert (= bs!21562 d!85358))

(assert (=> bs!21562 m!382219))

(declare-fun m!382987 () Bool)

(assert (=> bs!21562 m!382987))

(assert (=> d!84998 d!85358))

(declare-fun d!85360 () Bool)

(assert (=> d!85360 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!394994 () Unit!18239)

(assert (=> d!85360 (= lt!394994 (choose!11 thiss!1005))))

(assert (=> d!85360 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!394994)))

(declare-fun bs!21563 () Bool)

(assert (= bs!21563 d!85360))

(assert (=> bs!21563 m!382231))

(declare-fun m!382989 () Bool)

(assert (=> bs!21563 m!382989))

(assert (=> d!84998 d!85360))

(declare-fun d!85362 () Bool)

(assert (=> d!85362 (= (remainingBits!0 ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) ((_ sign_extend 32) (currentByte!12004 thiss!1005)) ((_ sign_extend 32) (currentBit!11999 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6032 (buf!6540 (_2!11815 lt!394065)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12004 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11999 thiss!1005)))))))

(assert (=> d!84992 d!85362))

(check-sat (not b!254164) (not b!254280) (not b!254095) (not d!85328) (not d!85258) (not d!85270) (not d!85330) (not b!254238) (not d!85332) (not d!85342) (not d!85252) (not b!254271) (not b!254284) (not b!254147) (not d!85228) (not b!254200) (not b!254172) (not d!85344) (not d!85340) (not b!254174) (not b!254150) (not b!254124) (not d!85266) (not d!85240) (not d!85360) (not b!254274) (not b!254236) (not b!254178) (not b!254289) (not bm!3988) (not d!85348) (not b!254196) (not b!254248) (not bm!3987) (not b!254287) (not d!85306) (not b!254185) (not b!254272) (not b!254202) (not bm!3989) (not bm!3990) (not b!254256) (not b!254187) (not b!254197) (not b!254184) (not b!254098) (not d!85278) (not b!254278) (not b!254159) (not b!254179) (not b!254123) (not b!254245) (not d!85314) (not d!85346) (not b!254224) (not d!85210) (not d!85294) (not d!85302) (not b!254257) (not b!254153) (not b!254275) (not d!85198) (not d!85256) (not d!85312) (not b!254193) (not b!254203) (not d!85234) (not d!85236) (not b!254250) (not b!254160) (not b!254171) (not d!85208) (not b!254223) (not d!85282) (not b!254273) (not b!254090) (not b!254283) (not b!254228) (not b!254167) (not b!254225) (not b!254148) (not d!85202) (not d!85264) (not b!254244) (not b!254165) (not b!254235) (not d!85310) (not b!254181) (not d!85272) (not d!85338) (not b!254252) (not b!254190) (not b!254144) (not d!85276) (not b!254206) (not d!85358) (not b!254161) (not b!254226) (not d!85322) (not b!254142) (not b!254205) (not d!85244) (not b!254191) (not b!254151) (not d!85304) (not d!85308) (not b!254281) (not b!254286) (not d!85250) (not b!254231) (not b!254141) (not d!85200) (not d!85274) (not bm!3991) (not b!254199) (not b!254230) (not d!85296) (not d!85334) (not b!254258) (not b!254246) (not d!85290) (not b!254194) (not b!254122) (not b!254233) (not b!254118) (not d!85298) (not b!254155) (not b!254243))
(check-sat)
