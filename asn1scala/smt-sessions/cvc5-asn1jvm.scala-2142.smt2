; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54516 () Bool)

(assert start!54516)

(declare-fun b!254893 () Bool)

(declare-fun e!176622 () Bool)

(declare-datatypes ((array!13762 0))(
  ( (array!13763 (arr!7024 (Array (_ BitVec 32) (_ BitVec 8))) (size!6037 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10996 0))(
  ( (BitStream!10997 (buf!6551 array!13762) (currentByte!12024 (_ BitVec 32)) (currentBit!12019 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10996)

(declare-fun array_inv!5778 (array!13762) Bool)

(assert (=> b!254893 (= e!176622 (array_inv!5778 (buf!6551 thiss!1005)))))

(declare-fun b!254894 () Bool)

(declare-fun res!213597 () Bool)

(declare-fun e!176617 () Bool)

(assert (=> b!254894 (=> (not res!213597) (not e!176617))))

(declare-datatypes ((Unit!18276 0))(
  ( (Unit!18277) )
))
(declare-datatypes ((tuple2!21804 0))(
  ( (tuple2!21805 (_1!11836 Unit!18276) (_2!11836 BitStream!10996)) )
))
(declare-fun lt!395761 () tuple2!21804)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254894 (= res!213597 (invariant!0 (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005) (size!6037 (buf!6551 (_2!11836 lt!395761)))))))

(declare-fun b!254896 () Bool)

(declare-fun res!213602 () Bool)

(declare-fun e!176624 () Bool)

(assert (=> b!254896 (=> (not res!213602) (not e!176624))))

(declare-fun isPrefixOf!0 (BitStream!10996 BitStream!10996) Bool)

(assert (=> b!254896 (= res!213602 (isPrefixOf!0 thiss!1005 (_2!11836 lt!395761)))))

(declare-fun b!254897 () Bool)

(declare-fun e!176614 () Bool)

(declare-fun e!176623 () Bool)

(assert (=> b!254897 (= e!176614 e!176623)))

(declare-fun res!213591 () Bool)

(assert (=> b!254897 (=> (not res!213591) (not e!176623))))

(declare-fun lt!395759 () tuple2!21804)

(declare-fun lt!395763 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!254897 (= res!213591 (= (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395759))) (currentByte!12024 (_2!11836 lt!395759)) (currentBit!12019 (_2!11836 lt!395759))) (bvadd (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395761))) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761))) lt!395763)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!254897 (= lt!395763 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!254898 () Bool)

(declare-fun e!176616 () Bool)

(assert (=> b!254898 (= e!176624 e!176616)))

(declare-fun res!213601 () Bool)

(assert (=> b!254898 (=> (not res!213601) (not e!176616))))

(declare-datatypes ((tuple2!21806 0))(
  ( (tuple2!21807 (_1!11837 BitStream!10996) (_2!11837 Bool)) )
))
(declare-fun lt!395771 () tuple2!21806)

(declare-fun bit!26 () Bool)

(assert (=> b!254898 (= res!213601 (and (= (_2!11837 lt!395771) bit!26) (= (_1!11837 lt!395771) (_2!11836 lt!395761))))))

(declare-fun readBitPure!0 (BitStream!10996) tuple2!21806)

(declare-fun readerFrom!0 (BitStream!10996 (_ BitVec 32) (_ BitVec 32)) BitStream!10996)

(assert (=> b!254898 (= lt!395771 (readBitPure!0 (readerFrom!0 (_2!11836 lt!395761) (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005))))))

(declare-fun b!254899 () Bool)

(declare-fun e!176619 () Bool)

(declare-fun lt!395762 () tuple2!21806)

(declare-fun lt!395756 () tuple2!21806)

(assert (=> b!254899 (= e!176619 (= (_2!11837 lt!395762) (_2!11837 lt!395756)))))

(declare-fun b!254900 () Bool)

(assert (=> b!254900 (= e!176617 (invariant!0 (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005) (size!6037 (buf!6551 (_2!11836 lt!395759)))))))

(declare-fun b!254901 () Bool)

(declare-fun res!213593 () Bool)

(declare-fun e!176620 () Bool)

(assert (=> b!254901 (=> (not res!213593) (not e!176620))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!254901 (= res!213593 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 thiss!1005))) ((_ sign_extend 32) (currentByte!12024 thiss!1005)) ((_ sign_extend 32) (currentBit!12019 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!213603 () Bool)

(assert (=> start!54516 (=> (not res!213603) (not e!176620))))

(assert (=> start!54516 (= res!213603 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54516 e!176620))

(assert (=> start!54516 true))

(declare-fun inv!12 (BitStream!10996) Bool)

(assert (=> start!54516 (and (inv!12 thiss!1005) e!176622)))

(declare-fun b!254895 () Bool)

(declare-fun e!176613 () Bool)

(assert (=> b!254895 (= e!176620 (not e!176613))))

(declare-fun res!213605 () Bool)

(assert (=> b!254895 (=> res!213605 e!176613)))

(declare-fun lt!395757 () tuple2!21806)

(declare-datatypes ((tuple2!21808 0))(
  ( (tuple2!21809 (_1!11838 BitStream!10996) (_2!11838 BitStream!10996)) )
))
(declare-fun lt!395755 () tuple2!21808)

(assert (=> b!254895 (= res!213605 (not (= (_1!11837 lt!395757) (_2!11838 lt!395755))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10996 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21806)

(assert (=> b!254895 (= lt!395757 (checkBitsLoopPure!0 (_1!11838 lt!395755) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!395772 () (_ BitVec 64))

(assert (=> b!254895 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) lt!395772)))

(declare-fun lt!395752 () Unit!18276)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10996 array!13762 (_ BitVec 64)) Unit!18276)

(assert (=> b!254895 (= lt!395752 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11836 lt!395761) (buf!6551 (_2!11836 lt!395759)) lt!395772))))

(declare-fun lt!395765 () tuple2!21806)

(declare-fun lt!395766 () tuple2!21808)

(assert (=> b!254895 (= lt!395765 (checkBitsLoopPure!0 (_1!11838 lt!395766) nBits!297 bit!26 from!289))))

(assert (=> b!254895 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 thiss!1005)) ((_ sign_extend 32) (currentBit!12019 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!395770 () Unit!18276)

(assert (=> b!254895 (= lt!395770 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6551 (_2!11836 lt!395759)) (bvsub nBits!297 from!289)))))

(assert (=> b!254895 (= (_2!11837 (readBitPure!0 (_1!11838 lt!395766))) bit!26)))

(declare-fun reader!0 (BitStream!10996 BitStream!10996) tuple2!21808)

(assert (=> b!254895 (= lt!395755 (reader!0 (_2!11836 lt!395761) (_2!11836 lt!395759)))))

(assert (=> b!254895 (= lt!395766 (reader!0 thiss!1005 (_2!11836 lt!395759)))))

(assert (=> b!254895 e!176619))

(declare-fun res!213600 () Bool)

(assert (=> b!254895 (=> (not res!213600) (not e!176619))))

(assert (=> b!254895 (= res!213600 (= (bitIndex!0 (size!6037 (buf!6551 (_1!11837 lt!395762))) (currentByte!12024 (_1!11837 lt!395762)) (currentBit!12019 (_1!11837 lt!395762))) (bitIndex!0 (size!6037 (buf!6551 (_1!11837 lt!395756))) (currentByte!12024 (_1!11837 lt!395756)) (currentBit!12019 (_1!11837 lt!395756)))))))

(declare-fun lt!395760 () Unit!18276)

(declare-fun lt!395758 () BitStream!10996)

(declare-fun readBitPrefixLemma!0 (BitStream!10996 BitStream!10996) Unit!18276)

(assert (=> b!254895 (= lt!395760 (readBitPrefixLemma!0 lt!395758 (_2!11836 lt!395759)))))

(assert (=> b!254895 (= lt!395756 (readBitPure!0 (BitStream!10997 (buf!6551 (_2!11836 lt!395759)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005))))))

(assert (=> b!254895 (= lt!395762 (readBitPure!0 lt!395758))))

(assert (=> b!254895 (= lt!395758 (BitStream!10997 (buf!6551 (_2!11836 lt!395761)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)))))

(assert (=> b!254895 e!176617))

(declare-fun res!213604 () Bool)

(assert (=> b!254895 (=> (not res!213604) (not e!176617))))

(assert (=> b!254895 (= res!213604 (isPrefixOf!0 thiss!1005 (_2!11836 lt!395759)))))

(declare-fun lt!395753 () Unit!18276)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10996 BitStream!10996 BitStream!10996) Unit!18276)

(assert (=> b!254895 (= lt!395753 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11836 lt!395761) (_2!11836 lt!395759)))))

(assert (=> b!254895 e!176614))

(declare-fun res!213596 () Bool)

(assert (=> b!254895 (=> (not res!213596) (not e!176614))))

(assert (=> b!254895 (= res!213596 (= (size!6037 (buf!6551 (_2!11836 lt!395761))) (size!6037 (buf!6551 (_2!11836 lt!395759)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10996 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21804)

(assert (=> b!254895 (= lt!395759 (appendNBitsLoop!0 (_2!11836 lt!395761) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254895 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395761)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) lt!395772)))

(assert (=> b!254895 (= lt!395772 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!395774 () Unit!18276)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10996 BitStream!10996 (_ BitVec 64) (_ BitVec 64)) Unit!18276)

(assert (=> b!254895 (= lt!395774 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11836 lt!395761) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!176618 () Bool)

(assert (=> b!254895 e!176618))

(declare-fun res!213598 () Bool)

(assert (=> b!254895 (=> (not res!213598) (not e!176618))))

(assert (=> b!254895 (= res!213598 (= (size!6037 (buf!6551 thiss!1005)) (size!6037 (buf!6551 (_2!11836 lt!395761)))))))

(declare-fun appendBit!0 (BitStream!10996 Bool) tuple2!21804)

(assert (=> b!254895 (= lt!395761 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!254902 () Bool)

(declare-fun e!176615 () Bool)

(assert (=> b!254902 (= e!176613 e!176615)))

(declare-fun res!213594 () Bool)

(assert (=> b!254902 (=> res!213594 e!176615)))

(assert (=> b!254902 (= res!213594 (not (= (size!6037 (buf!6551 thiss!1005)) (size!6037 (buf!6551 (_2!11836 lt!395759))))))))

(assert (=> b!254902 (and (= (_2!11837 lt!395765) (_2!11837 lt!395757)) (= (_1!11837 lt!395765) (_2!11838 lt!395766)))))

(declare-fun b!254903 () Bool)

(declare-fun lt!395764 () tuple2!21806)

(declare-fun lt!395767 () tuple2!21808)

(assert (=> b!254903 (= e!176623 (not (or (not (_2!11837 lt!395764)) (not (= (_1!11837 lt!395764) (_2!11838 lt!395767))))))))

(assert (=> b!254903 (= lt!395764 (checkBitsLoopPure!0 (_1!11838 lt!395767) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254903 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) lt!395763)))

(declare-fun lt!395775 () Unit!18276)

(assert (=> b!254903 (= lt!395775 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11836 lt!395761) (buf!6551 (_2!11836 lt!395759)) lt!395763))))

(assert (=> b!254903 (= lt!395767 (reader!0 (_2!11836 lt!395761) (_2!11836 lt!395759)))))

(declare-fun b!254904 () Bool)

(declare-fun res!213606 () Bool)

(assert (=> b!254904 (=> (not res!213606) (not e!176620))))

(assert (=> b!254904 (= res!213606 (bvslt from!289 nBits!297))))

(declare-fun b!254905 () Bool)

(declare-fun res!213595 () Bool)

(assert (=> b!254905 (=> res!213595 e!176613)))

(declare-fun withMovedBitIndex!0 (BitStream!10996 (_ BitVec 64)) BitStream!10996)

(assert (=> b!254905 (= res!213595 (not (= (_1!11838 lt!395755) (withMovedBitIndex!0 (_1!11838 lt!395766) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!254906 () Bool)

(declare-fun res!213599 () Bool)

(assert (=> b!254906 (=> (not res!213599) (not e!176623))))

(assert (=> b!254906 (= res!213599 (isPrefixOf!0 (_2!11836 lt!395761) (_2!11836 lt!395759)))))

(declare-fun b!254907 () Bool)

(declare-fun lt!395769 () (_ BitVec 64))

(assert (=> b!254907 (= e!176616 (= (bitIndex!0 (size!6037 (buf!6551 (_1!11837 lt!395771))) (currentByte!12024 (_1!11837 lt!395771)) (currentBit!12019 (_1!11837 lt!395771))) lt!395769))))

(declare-fun lt!395773 () (_ BitVec 64))

(declare-fun b!254908 () Bool)

(declare-fun lt!395768 () (_ BitVec 64))

(assert (=> b!254908 (= e!176615 (or (not (= lt!395773 (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!395773 (bvand (bvadd lt!395768 (bvsub nBits!297 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!254908 (= lt!395773 (bvand lt!395768 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254908 (= lt!395768 (bitIndex!0 (size!6037 (buf!6551 thiss!1005)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)))))

(declare-fun b!254909 () Bool)

(assert (=> b!254909 (= e!176618 e!176624)))

(declare-fun res!213592 () Bool)

(assert (=> b!254909 (=> (not res!213592) (not e!176624))))

(declare-fun lt!395754 () (_ BitVec 64))

(assert (=> b!254909 (= res!213592 (= lt!395769 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!395754)))))

(assert (=> b!254909 (= lt!395769 (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395761))) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761))))))

(assert (=> b!254909 (= lt!395754 (bitIndex!0 (size!6037 (buf!6551 thiss!1005)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)))))

(assert (= (and start!54516 res!213603) b!254901))

(assert (= (and b!254901 res!213593) b!254904))

(assert (= (and b!254904 res!213606) b!254895))

(assert (= (and b!254895 res!213598) b!254909))

(assert (= (and b!254909 res!213592) b!254896))

(assert (= (and b!254896 res!213602) b!254898))

(assert (= (and b!254898 res!213601) b!254907))

(assert (= (and b!254895 res!213596) b!254897))

(assert (= (and b!254897 res!213591) b!254906))

(assert (= (and b!254906 res!213599) b!254903))

(assert (= (and b!254895 res!213604) b!254894))

(assert (= (and b!254894 res!213597) b!254900))

(assert (= (and b!254895 res!213600) b!254899))

(assert (= (and b!254895 (not res!213605)) b!254905))

(assert (= (and b!254905 (not res!213595)) b!254902))

(assert (= (and b!254902 (not res!213594)) b!254908))

(assert (= start!54516 b!254893))

(declare-fun m!383901 () Bool)

(assert (=> b!254893 m!383901))

(declare-fun m!383903 () Bool)

(assert (=> b!254906 m!383903))

(declare-fun m!383905 () Bool)

(assert (=> b!254900 m!383905))

(declare-fun m!383907 () Bool)

(assert (=> b!254898 m!383907))

(assert (=> b!254898 m!383907))

(declare-fun m!383909 () Bool)

(assert (=> b!254898 m!383909))

(declare-fun m!383911 () Bool)

(assert (=> b!254903 m!383911))

(declare-fun m!383913 () Bool)

(assert (=> b!254903 m!383913))

(declare-fun m!383915 () Bool)

(assert (=> b!254903 m!383915))

(declare-fun m!383917 () Bool)

(assert (=> b!254903 m!383917))

(declare-fun m!383919 () Bool)

(assert (=> b!254894 m!383919))

(declare-fun m!383921 () Bool)

(assert (=> b!254901 m!383921))

(declare-fun m!383923 () Bool)

(assert (=> b!254909 m!383923))

(declare-fun m!383925 () Bool)

(assert (=> b!254909 m!383925))

(declare-fun m!383927 () Bool)

(assert (=> start!54516 m!383927))

(declare-fun m!383929 () Bool)

(assert (=> b!254905 m!383929))

(assert (=> b!254908 m!383925))

(declare-fun m!383931 () Bool)

(assert (=> b!254907 m!383931))

(declare-fun m!383933 () Bool)

(assert (=> b!254897 m!383933))

(assert (=> b!254897 m!383923))

(declare-fun m!383935 () Bool)

(assert (=> b!254896 m!383935))

(declare-fun m!383937 () Bool)

(assert (=> b!254895 m!383937))

(declare-fun m!383939 () Bool)

(assert (=> b!254895 m!383939))

(declare-fun m!383941 () Bool)

(assert (=> b!254895 m!383941))

(declare-fun m!383943 () Bool)

(assert (=> b!254895 m!383943))

(declare-fun m!383945 () Bool)

(assert (=> b!254895 m!383945))

(declare-fun m!383947 () Bool)

(assert (=> b!254895 m!383947))

(declare-fun m!383949 () Bool)

(assert (=> b!254895 m!383949))

(declare-fun m!383951 () Bool)

(assert (=> b!254895 m!383951))

(declare-fun m!383953 () Bool)

(assert (=> b!254895 m!383953))

(declare-fun m!383955 () Bool)

(assert (=> b!254895 m!383955))

(declare-fun m!383957 () Bool)

(assert (=> b!254895 m!383957))

(declare-fun m!383959 () Bool)

(assert (=> b!254895 m!383959))

(declare-fun m!383961 () Bool)

(assert (=> b!254895 m!383961))

(assert (=> b!254895 m!383917))

(declare-fun m!383963 () Bool)

(assert (=> b!254895 m!383963))

(declare-fun m!383965 () Bool)

(assert (=> b!254895 m!383965))

(declare-fun m!383967 () Bool)

(assert (=> b!254895 m!383967))

(declare-fun m!383969 () Bool)

(assert (=> b!254895 m!383969))

(declare-fun m!383971 () Bool)

(assert (=> b!254895 m!383971))

(declare-fun m!383973 () Bool)

(assert (=> b!254895 m!383973))

(push 1)

(assert (not b!254897))

(assert (not b!254895))

(assert (not b!254905))

(assert (not b!254907))

(assert (not b!254903))

(assert (not b!254906))

(assert (not b!254909))

(assert (not b!254898))

(assert (not b!254900))

(assert (not b!254896))

(assert (not start!54516))

(assert (not b!254893))

(assert (not b!254908))

(assert (not b!254901))

(assert (not b!254894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85774 () Bool)

(declare-fun res!213790 () Bool)

(declare-fun e!176752 () Bool)

(assert (=> d!85774 (=> (not res!213790) (not e!176752))))

(assert (=> d!85774 (= res!213790 (= (size!6037 (buf!6551 (_2!11836 lt!395761))) (size!6037 (buf!6551 (_2!11836 lt!395759)))))))

(assert (=> d!85774 (= (isPrefixOf!0 (_2!11836 lt!395761) (_2!11836 lt!395759)) e!176752)))

(declare-fun b!255106 () Bool)

(declare-fun res!213789 () Bool)

(assert (=> b!255106 (=> (not res!213789) (not e!176752))))

(assert (=> b!255106 (= res!213789 (bvsle (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395761))) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761))) (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395759))) (currentByte!12024 (_2!11836 lt!395759)) (currentBit!12019 (_2!11836 lt!395759)))))))

(declare-fun b!255107 () Bool)

(declare-fun e!176751 () Bool)

(assert (=> b!255107 (= e!176752 e!176751)))

(declare-fun res!213791 () Bool)

(assert (=> b!255107 (=> res!213791 e!176751)))

(assert (=> b!255107 (= res!213791 (= (size!6037 (buf!6551 (_2!11836 lt!395761))) #b00000000000000000000000000000000))))

(declare-fun b!255108 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13762 array!13762 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255108 (= e!176751 (arrayBitRangesEq!0 (buf!6551 (_2!11836 lt!395761)) (buf!6551 (_2!11836 lt!395759)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395761))) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761)))))))

(assert (= (and d!85774 res!213790) b!255106))

(assert (= (and b!255106 res!213789) b!255107))

(assert (= (and b!255107 (not res!213791)) b!255108))

(assert (=> b!255106 m!383923))

(assert (=> b!255106 m!383933))

(assert (=> b!255108 m!383923))

(assert (=> b!255108 m!383923))

(declare-fun m!384287 () Bool)

(assert (=> b!255108 m!384287))

(assert (=> b!254906 d!85774))

(declare-fun d!85776 () Bool)

(declare-datatypes ((tuple2!21824 0))(
  ( (tuple2!21825 (_1!11846 Bool) (_2!11846 BitStream!10996)) )
))
(declare-fun lt!396126 () tuple2!21824)

(declare-fun checkBitsLoop!0 (BitStream!10996 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21824)

(assert (=> d!85776 (= lt!396126 (checkBitsLoop!0 (_1!11838 lt!395755) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85776 (= (checkBitsLoopPure!0 (_1!11838 lt!395755) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21807 (_2!11846 lt!396126) (_1!11846 lt!396126)))))

(declare-fun bs!21637 () Bool)

(assert (= bs!21637 d!85776))

(declare-fun m!384289 () Bool)

(assert (=> bs!21637 m!384289))

(assert (=> b!254895 d!85776))

(declare-fun d!85778 () Bool)

(declare-fun lt!396127 () tuple2!21824)

(assert (=> d!85778 (= lt!396127 (checkBitsLoop!0 (_1!11838 lt!395766) nBits!297 bit!26 from!289))))

(assert (=> d!85778 (= (checkBitsLoopPure!0 (_1!11838 lt!395766) nBits!297 bit!26 from!289) (tuple2!21807 (_2!11846 lt!396127) (_1!11846 lt!396127)))))

(declare-fun bs!21638 () Bool)

(assert (= bs!21638 d!85778))

(declare-fun m!384291 () Bool)

(assert (=> bs!21638 m!384291))

(assert (=> b!254895 d!85778))

(declare-fun d!85780 () Bool)

(declare-fun lt!396130 () tuple2!21824)

(declare-fun readBit!0 (BitStream!10996) tuple2!21824)

(assert (=> d!85780 (= lt!396130 (readBit!0 lt!395758))))

(assert (=> d!85780 (= (readBitPure!0 lt!395758) (tuple2!21807 (_2!11846 lt!396130) (_1!11846 lt!396130)))))

(declare-fun bs!21639 () Bool)

(assert (= bs!21639 d!85780))

(declare-fun m!384293 () Bool)

(assert (=> bs!21639 m!384293))

(assert (=> b!254895 d!85780))

(declare-fun b!255119 () Bool)

(declare-fun e!176757 () Unit!18276)

(declare-fun Unit!18284 () Unit!18276)

(assert (=> b!255119 (= e!176757 Unit!18284)))

(declare-fun b!255120 () Bool)

(declare-fun res!213799 () Bool)

(declare-fun e!176758 () Bool)

(assert (=> b!255120 (=> (not res!213799) (not e!176758))))

(declare-fun lt!396189 () tuple2!21808)

(assert (=> b!255120 (= res!213799 (isPrefixOf!0 (_1!11838 lt!396189) (_2!11836 lt!395761)))))

(declare-fun b!255121 () Bool)

(declare-fun lt!396181 () Unit!18276)

(assert (=> b!255121 (= e!176757 lt!396181)))

(declare-fun lt!396188 () (_ BitVec 64))

(assert (=> b!255121 (= lt!396188 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!396185 () (_ BitVec 64))

(assert (=> b!255121 (= lt!396185 (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395761))) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13762 array!13762 (_ BitVec 64) (_ BitVec 64)) Unit!18276)

(assert (=> b!255121 (= lt!396181 (arrayBitRangesEqSymmetric!0 (buf!6551 (_2!11836 lt!395761)) (buf!6551 (_2!11836 lt!395759)) lt!396188 lt!396185))))

(assert (=> b!255121 (arrayBitRangesEq!0 (buf!6551 (_2!11836 lt!395759)) (buf!6551 (_2!11836 lt!395761)) lt!396188 lt!396185)))

(declare-fun d!85782 () Bool)

(assert (=> d!85782 e!176758))

(declare-fun res!213798 () Bool)

(assert (=> d!85782 (=> (not res!213798) (not e!176758))))

(assert (=> d!85782 (= res!213798 (isPrefixOf!0 (_1!11838 lt!396189) (_2!11838 lt!396189)))))

(declare-fun lt!396175 () BitStream!10996)

(assert (=> d!85782 (= lt!396189 (tuple2!21809 lt!396175 (_2!11836 lt!395759)))))

(declare-fun lt!396187 () Unit!18276)

(declare-fun lt!396184 () Unit!18276)

(assert (=> d!85782 (= lt!396187 lt!396184)))

(assert (=> d!85782 (isPrefixOf!0 lt!396175 (_2!11836 lt!395759))))

(assert (=> d!85782 (= lt!396184 (lemmaIsPrefixTransitive!0 lt!396175 (_2!11836 lt!395759) (_2!11836 lt!395759)))))

(declare-fun lt!396173 () Unit!18276)

(declare-fun lt!396190 () Unit!18276)

(assert (=> d!85782 (= lt!396173 lt!396190)))

(assert (=> d!85782 (isPrefixOf!0 lt!396175 (_2!11836 lt!395759))))

(assert (=> d!85782 (= lt!396190 (lemmaIsPrefixTransitive!0 lt!396175 (_2!11836 lt!395761) (_2!11836 lt!395759)))))

(declare-fun lt!396176 () Unit!18276)

(assert (=> d!85782 (= lt!396176 e!176757)))

(declare-fun c!11765 () Bool)

(assert (=> d!85782 (= c!11765 (not (= (size!6037 (buf!6551 (_2!11836 lt!395761))) #b00000000000000000000000000000000)))))

(declare-fun lt!396174 () Unit!18276)

(declare-fun lt!396172 () Unit!18276)

(assert (=> d!85782 (= lt!396174 lt!396172)))

(assert (=> d!85782 (isPrefixOf!0 (_2!11836 lt!395759) (_2!11836 lt!395759))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10996) Unit!18276)

(assert (=> d!85782 (= lt!396172 (lemmaIsPrefixRefl!0 (_2!11836 lt!395759)))))

(declare-fun lt!396183 () Unit!18276)

(declare-fun lt!396171 () Unit!18276)

(assert (=> d!85782 (= lt!396183 lt!396171)))

(assert (=> d!85782 (= lt!396171 (lemmaIsPrefixRefl!0 (_2!11836 lt!395759)))))

(declare-fun lt!396180 () Unit!18276)

(declare-fun lt!396178 () Unit!18276)

(assert (=> d!85782 (= lt!396180 lt!396178)))

(assert (=> d!85782 (isPrefixOf!0 lt!396175 lt!396175)))

(assert (=> d!85782 (= lt!396178 (lemmaIsPrefixRefl!0 lt!396175))))

(declare-fun lt!396186 () Unit!18276)

(declare-fun lt!396182 () Unit!18276)

(assert (=> d!85782 (= lt!396186 lt!396182)))

(assert (=> d!85782 (isPrefixOf!0 (_2!11836 lt!395761) (_2!11836 lt!395761))))

(assert (=> d!85782 (= lt!396182 (lemmaIsPrefixRefl!0 (_2!11836 lt!395761)))))

(assert (=> d!85782 (= lt!396175 (BitStream!10997 (buf!6551 (_2!11836 lt!395759)) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761))))))

(assert (=> d!85782 (isPrefixOf!0 (_2!11836 lt!395761) (_2!11836 lt!395759))))

(assert (=> d!85782 (= (reader!0 (_2!11836 lt!395761) (_2!11836 lt!395759)) lt!396189)))

(declare-fun lt!396179 () (_ BitVec 64))

(declare-fun lt!396177 () (_ BitVec 64))

(declare-fun b!255122 () Bool)

(assert (=> b!255122 (= e!176758 (= (_1!11838 lt!396189) (withMovedBitIndex!0 (_2!11838 lt!396189) (bvsub lt!396177 lt!396179))))))

(assert (=> b!255122 (or (= (bvand lt!396177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396179 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396177 lt!396179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255122 (= lt!396179 (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395759))) (currentByte!12024 (_2!11836 lt!395759)) (currentBit!12019 (_2!11836 lt!395759))))))

(assert (=> b!255122 (= lt!396177 (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395761))) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761))))))

(declare-fun b!255123 () Bool)

(declare-fun res!213800 () Bool)

(assert (=> b!255123 (=> (not res!213800) (not e!176758))))

(assert (=> b!255123 (= res!213800 (isPrefixOf!0 (_2!11838 lt!396189) (_2!11836 lt!395759)))))

(assert (= (and d!85782 c!11765) b!255121))

(assert (= (and d!85782 (not c!11765)) b!255119))

(assert (= (and d!85782 res!213798) b!255120))

(assert (= (and b!255120 res!213799) b!255123))

(assert (= (and b!255123 res!213800) b!255122))

(assert (=> b!255121 m!383923))

(declare-fun m!384295 () Bool)

(assert (=> b!255121 m!384295))

(declare-fun m!384297 () Bool)

(assert (=> b!255121 m!384297))

(declare-fun m!384299 () Bool)

(assert (=> b!255122 m!384299))

(assert (=> b!255122 m!383933))

(assert (=> b!255122 m!383923))

(declare-fun m!384301 () Bool)

(assert (=> b!255120 m!384301))

(declare-fun m!384303 () Bool)

(assert (=> d!85782 m!384303))

(declare-fun m!384305 () Bool)

(assert (=> d!85782 m!384305))

(declare-fun m!384307 () Bool)

(assert (=> d!85782 m!384307))

(declare-fun m!384309 () Bool)

(assert (=> d!85782 m!384309))

(declare-fun m!384311 () Bool)

(assert (=> d!85782 m!384311))

(declare-fun m!384313 () Bool)

(assert (=> d!85782 m!384313))

(declare-fun m!384315 () Bool)

(assert (=> d!85782 m!384315))

(declare-fun m!384317 () Bool)

(assert (=> d!85782 m!384317))

(assert (=> d!85782 m!383903))

(declare-fun m!384319 () Bool)

(assert (=> d!85782 m!384319))

(declare-fun m!384321 () Bool)

(assert (=> d!85782 m!384321))

(declare-fun m!384323 () Bool)

(assert (=> b!255123 m!384323))

(assert (=> b!254895 d!85782))

(declare-fun d!85784 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!85784 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 thiss!1005)) ((_ sign_extend 32) (currentBit!12019 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 thiss!1005)) ((_ sign_extend 32) (currentBit!12019 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21640 () Bool)

(assert (= bs!21640 d!85784))

(declare-fun m!384325 () Bool)

(assert (=> bs!21640 m!384325))

(assert (=> b!254895 d!85784))

(declare-fun d!85786 () Bool)

(declare-fun e!176761 () Bool)

(assert (=> d!85786 e!176761))

(declare-fun res!213803 () Bool)

(assert (=> d!85786 (=> (not res!213803) (not e!176761))))

(assert (=> d!85786 (= res!213803 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!396193 () Unit!18276)

(declare-fun choose!27 (BitStream!10996 BitStream!10996 (_ BitVec 64) (_ BitVec 64)) Unit!18276)

(assert (=> d!85786 (= lt!396193 (choose!27 thiss!1005 (_2!11836 lt!395761) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!85786 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!85786 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11836 lt!395761) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!396193)))

(declare-fun b!255126 () Bool)

(assert (=> b!255126 (= e!176761 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395761)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!85786 res!213803) b!255126))

(declare-fun m!384327 () Bool)

(assert (=> d!85786 m!384327))

(declare-fun m!384329 () Bool)

(assert (=> b!255126 m!384329))

(assert (=> b!254895 d!85786))

(declare-fun d!85788 () Bool)

(declare-fun lt!396194 () tuple2!21824)

(assert (=> d!85788 (= lt!396194 (readBit!0 (BitStream!10997 (buf!6551 (_2!11836 lt!395759)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005))))))

(assert (=> d!85788 (= (readBitPure!0 (BitStream!10997 (buf!6551 (_2!11836 lt!395759)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005))) (tuple2!21807 (_2!11846 lt!396194) (_1!11846 lt!396194)))))

(declare-fun bs!21641 () Bool)

(assert (= bs!21641 d!85788))

(declare-fun m!384331 () Bool)

(assert (=> bs!21641 m!384331))

(assert (=> b!254895 d!85788))

(declare-fun d!85790 () Bool)

(declare-fun e!176764 () Bool)

(assert (=> d!85790 e!176764))

(declare-fun res!213808 () Bool)

(assert (=> d!85790 (=> (not res!213808) (not e!176764))))

(declare-fun lt!396212 () (_ BitVec 64))

(declare-fun lt!396208 () (_ BitVec 64))

(declare-fun lt!396211 () (_ BitVec 64))

(assert (=> d!85790 (= res!213808 (= lt!396211 (bvsub lt!396208 lt!396212)))))

(assert (=> d!85790 (or (= (bvand lt!396208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396212 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396208 lt!396212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85790 (= lt!396212 (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 (_1!11837 lt!395762)))) ((_ sign_extend 32) (currentByte!12024 (_1!11837 lt!395762))) ((_ sign_extend 32) (currentBit!12019 (_1!11837 lt!395762)))))))

(declare-fun lt!396209 () (_ BitVec 64))

(declare-fun lt!396210 () (_ BitVec 64))

(assert (=> d!85790 (= lt!396208 (bvmul lt!396209 lt!396210))))

(assert (=> d!85790 (or (= lt!396209 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396210 (bvsdiv (bvmul lt!396209 lt!396210) lt!396209)))))

(assert (=> d!85790 (= lt!396210 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85790 (= lt!396209 ((_ sign_extend 32) (size!6037 (buf!6551 (_1!11837 lt!395762)))))))

(assert (=> d!85790 (= lt!396211 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12024 (_1!11837 lt!395762))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12019 (_1!11837 lt!395762)))))))

(assert (=> d!85790 (invariant!0 (currentBit!12019 (_1!11837 lt!395762)) (currentByte!12024 (_1!11837 lt!395762)) (size!6037 (buf!6551 (_1!11837 lt!395762))))))

(assert (=> d!85790 (= (bitIndex!0 (size!6037 (buf!6551 (_1!11837 lt!395762))) (currentByte!12024 (_1!11837 lt!395762)) (currentBit!12019 (_1!11837 lt!395762))) lt!396211)))

(declare-fun b!255131 () Bool)

(declare-fun res!213809 () Bool)

(assert (=> b!255131 (=> (not res!213809) (not e!176764))))

(assert (=> b!255131 (= res!213809 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396211))))

(declare-fun b!255132 () Bool)

(declare-fun lt!396207 () (_ BitVec 64))

(assert (=> b!255132 (= e!176764 (bvsle lt!396211 (bvmul lt!396207 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255132 (or (= lt!396207 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396207 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396207)))))

(assert (=> b!255132 (= lt!396207 ((_ sign_extend 32) (size!6037 (buf!6551 (_1!11837 lt!395762)))))))

(assert (= (and d!85790 res!213808) b!255131))

(assert (= (and b!255131 res!213809) b!255132))

(declare-fun m!384333 () Bool)

(assert (=> d!85790 m!384333))

(declare-fun m!384335 () Bool)

(assert (=> d!85790 m!384335))

(assert (=> b!254895 d!85790))

(declare-fun d!85792 () Bool)

(declare-fun res!213811 () Bool)

(declare-fun e!176766 () Bool)

(assert (=> d!85792 (=> (not res!213811) (not e!176766))))

(assert (=> d!85792 (= res!213811 (= (size!6037 (buf!6551 thiss!1005)) (size!6037 (buf!6551 (_2!11836 lt!395759)))))))

(assert (=> d!85792 (= (isPrefixOf!0 thiss!1005 (_2!11836 lt!395759)) e!176766)))

(declare-fun b!255133 () Bool)

(declare-fun res!213810 () Bool)

(assert (=> b!255133 (=> (not res!213810) (not e!176766))))

(assert (=> b!255133 (= res!213810 (bvsle (bitIndex!0 (size!6037 (buf!6551 thiss!1005)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)) (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395759))) (currentByte!12024 (_2!11836 lt!395759)) (currentBit!12019 (_2!11836 lt!395759)))))))

(declare-fun b!255134 () Bool)

(declare-fun e!176765 () Bool)

(assert (=> b!255134 (= e!176766 e!176765)))

(declare-fun res!213812 () Bool)

(assert (=> b!255134 (=> res!213812 e!176765)))

(assert (=> b!255134 (= res!213812 (= (size!6037 (buf!6551 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!255135 () Bool)

(assert (=> b!255135 (= e!176765 (arrayBitRangesEq!0 (buf!6551 thiss!1005) (buf!6551 (_2!11836 lt!395759)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6037 (buf!6551 thiss!1005)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005))))))

(assert (= (and d!85792 res!213811) b!255133))

(assert (= (and b!255133 res!213810) b!255134))

(assert (= (and b!255134 (not res!213812)) b!255135))

(assert (=> b!255133 m!383925))

(assert (=> b!255133 m!383933))

(assert (=> b!255135 m!383925))

(assert (=> b!255135 m!383925))

(declare-fun m!384337 () Bool)

(assert (=> b!255135 m!384337))

(assert (=> b!254895 d!85792))

(declare-fun d!85794 () Bool)

(declare-fun e!176767 () Bool)

(assert (=> d!85794 e!176767))

(declare-fun res!213813 () Bool)

(assert (=> d!85794 (=> (not res!213813) (not e!176767))))

(declare-fun lt!396218 () (_ BitVec 64))

(declare-fun lt!396214 () (_ BitVec 64))

(declare-fun lt!396217 () (_ BitVec 64))

(assert (=> d!85794 (= res!213813 (= lt!396217 (bvsub lt!396214 lt!396218)))))

(assert (=> d!85794 (or (= (bvand lt!396214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396218 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396214 lt!396218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85794 (= lt!396218 (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 (_1!11837 lt!395756)))) ((_ sign_extend 32) (currentByte!12024 (_1!11837 lt!395756))) ((_ sign_extend 32) (currentBit!12019 (_1!11837 lt!395756)))))))

(declare-fun lt!396215 () (_ BitVec 64))

(declare-fun lt!396216 () (_ BitVec 64))

(assert (=> d!85794 (= lt!396214 (bvmul lt!396215 lt!396216))))

(assert (=> d!85794 (or (= lt!396215 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396216 (bvsdiv (bvmul lt!396215 lt!396216) lt!396215)))))

(assert (=> d!85794 (= lt!396216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85794 (= lt!396215 ((_ sign_extend 32) (size!6037 (buf!6551 (_1!11837 lt!395756)))))))

(assert (=> d!85794 (= lt!396217 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12024 (_1!11837 lt!395756))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12019 (_1!11837 lt!395756)))))))

(assert (=> d!85794 (invariant!0 (currentBit!12019 (_1!11837 lt!395756)) (currentByte!12024 (_1!11837 lt!395756)) (size!6037 (buf!6551 (_1!11837 lt!395756))))))

(assert (=> d!85794 (= (bitIndex!0 (size!6037 (buf!6551 (_1!11837 lt!395756))) (currentByte!12024 (_1!11837 lt!395756)) (currentBit!12019 (_1!11837 lt!395756))) lt!396217)))

(declare-fun b!255136 () Bool)

(declare-fun res!213814 () Bool)

(assert (=> b!255136 (=> (not res!213814) (not e!176767))))

(assert (=> b!255136 (= res!213814 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396217))))

(declare-fun b!255137 () Bool)

(declare-fun lt!396213 () (_ BitVec 64))

(assert (=> b!255137 (= e!176767 (bvsle lt!396217 (bvmul lt!396213 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255137 (or (= lt!396213 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396213 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396213)))))

(assert (=> b!255137 (= lt!396213 ((_ sign_extend 32) (size!6037 (buf!6551 (_1!11837 lt!395756)))))))

(assert (= (and d!85794 res!213813) b!255136))

(assert (= (and b!255136 res!213814) b!255137))

(declare-fun m!384339 () Bool)

(assert (=> d!85794 m!384339))

(declare-fun m!384341 () Bool)

(assert (=> d!85794 m!384341))

(assert (=> b!254895 d!85794))

(declare-fun d!85796 () Bool)

(declare-fun e!176770 () Bool)

(assert (=> d!85796 e!176770))

(declare-fun res!213817 () Bool)

(assert (=> d!85796 (=> (not res!213817) (not e!176770))))

(declare-fun lt!396229 () tuple2!21806)

(declare-fun lt!396230 () tuple2!21806)

(assert (=> d!85796 (= res!213817 (= (bitIndex!0 (size!6037 (buf!6551 (_1!11837 lt!396229))) (currentByte!12024 (_1!11837 lt!396229)) (currentBit!12019 (_1!11837 lt!396229))) (bitIndex!0 (size!6037 (buf!6551 (_1!11837 lt!396230))) (currentByte!12024 (_1!11837 lt!396230)) (currentBit!12019 (_1!11837 lt!396230)))))))

(declare-fun lt!396228 () BitStream!10996)

(declare-fun lt!396227 () Unit!18276)

(declare-fun choose!50 (BitStream!10996 BitStream!10996 BitStream!10996 tuple2!21806 tuple2!21806 BitStream!10996 Bool tuple2!21806 tuple2!21806 BitStream!10996 Bool) Unit!18276)

(assert (=> d!85796 (= lt!396227 (choose!50 lt!395758 (_2!11836 lt!395759) lt!396228 lt!396229 (tuple2!21807 (_1!11837 lt!396229) (_2!11837 lt!396229)) (_1!11837 lt!396229) (_2!11837 lt!396229) lt!396230 (tuple2!21807 (_1!11837 lt!396230) (_2!11837 lt!396230)) (_1!11837 lt!396230) (_2!11837 lt!396230)))))

(assert (=> d!85796 (= lt!396230 (readBitPure!0 lt!396228))))

(assert (=> d!85796 (= lt!396229 (readBitPure!0 lt!395758))))

(assert (=> d!85796 (= lt!396228 (BitStream!10997 (buf!6551 (_2!11836 lt!395759)) (currentByte!12024 lt!395758) (currentBit!12019 lt!395758)))))

(assert (=> d!85796 (invariant!0 (currentBit!12019 lt!395758) (currentByte!12024 lt!395758) (size!6037 (buf!6551 (_2!11836 lt!395759))))))

(assert (=> d!85796 (= (readBitPrefixLemma!0 lt!395758 (_2!11836 lt!395759)) lt!396227)))

(declare-fun b!255140 () Bool)

(assert (=> b!255140 (= e!176770 (= (_2!11837 lt!396229) (_2!11837 lt!396230)))))

(assert (= (and d!85796 res!213817) b!255140))

(declare-fun m!384343 () Bool)

(assert (=> d!85796 m!384343))

(declare-fun m!384345 () Bool)

(assert (=> d!85796 m!384345))

(declare-fun m!384347 () Bool)

(assert (=> d!85796 m!384347))

(assert (=> d!85796 m!383937))

(declare-fun m!384349 () Bool)

(assert (=> d!85796 m!384349))

(declare-fun m!384351 () Bool)

(assert (=> d!85796 m!384351))

(assert (=> b!254895 d!85796))

(declare-fun d!85798 () Bool)

(assert (=> d!85798 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) lt!395772)))

(declare-fun lt!396233 () Unit!18276)

(declare-fun choose!9 (BitStream!10996 array!13762 (_ BitVec 64) BitStream!10996) Unit!18276)

(assert (=> d!85798 (= lt!396233 (choose!9 (_2!11836 lt!395761) (buf!6551 (_2!11836 lt!395759)) lt!395772 (BitStream!10997 (buf!6551 (_2!11836 lt!395759)) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761)))))))

(assert (=> d!85798 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11836 lt!395761) (buf!6551 (_2!11836 lt!395759)) lt!395772) lt!396233)))

(declare-fun bs!21642 () Bool)

(assert (= bs!21642 d!85798))

(assert (=> bs!21642 m!383967))

(declare-fun m!384353 () Bool)

(assert (=> bs!21642 m!384353))

(assert (=> b!254895 d!85798))

(declare-fun d!85800 () Bool)

(assert (=> d!85800 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 thiss!1005)) ((_ sign_extend 32) (currentBit!12019 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!396234 () Unit!18276)

(assert (=> d!85800 (= lt!396234 (choose!9 thiss!1005 (buf!6551 (_2!11836 lt!395759)) (bvsub nBits!297 from!289) (BitStream!10997 (buf!6551 (_2!11836 lt!395759)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005))))))

(assert (=> d!85800 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6551 (_2!11836 lt!395759)) (bvsub nBits!297 from!289)) lt!396234)))

(declare-fun bs!21643 () Bool)

(assert (= bs!21643 d!85800))

(assert (=> bs!21643 m!383939))

(declare-fun m!384355 () Bool)

(assert (=> bs!21643 m!384355))

(assert (=> b!254895 d!85800))

(declare-fun b!255153 () Bool)

(declare-fun e!176776 () Bool)

(declare-fun lt!396246 () tuple2!21806)

(declare-fun lt!396244 () tuple2!21804)

(assert (=> b!255153 (= e!176776 (= (bitIndex!0 (size!6037 (buf!6551 (_1!11837 lt!396246))) (currentByte!12024 (_1!11837 lt!396246)) (currentBit!12019 (_1!11837 lt!396246))) (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!396244))) (currentByte!12024 (_2!11836 lt!396244)) (currentBit!12019 (_2!11836 lt!396244)))))))

(declare-fun d!85802 () Bool)

(declare-fun e!176775 () Bool)

(assert (=> d!85802 e!176775))

(declare-fun res!213826 () Bool)

(assert (=> d!85802 (=> (not res!213826) (not e!176775))))

(assert (=> d!85802 (= res!213826 (= (size!6037 (buf!6551 thiss!1005)) (size!6037 (buf!6551 (_2!11836 lt!396244)))))))

(declare-fun choose!16 (BitStream!10996 Bool) tuple2!21804)

(assert (=> d!85802 (= lt!396244 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!85802 (validate_offset_bit!0 ((_ sign_extend 32) (size!6037 (buf!6551 thiss!1005))) ((_ sign_extend 32) (currentByte!12024 thiss!1005)) ((_ sign_extend 32) (currentBit!12019 thiss!1005)))))

(assert (=> d!85802 (= (appendBit!0 thiss!1005 bit!26) lt!396244)))

(declare-fun b!255151 () Bool)

(declare-fun res!213828 () Bool)

(assert (=> b!255151 (=> (not res!213828) (not e!176775))))

(assert (=> b!255151 (= res!213828 (isPrefixOf!0 thiss!1005 (_2!11836 lt!396244)))))

(declare-fun b!255152 () Bool)

(assert (=> b!255152 (= e!176775 e!176776)))

(declare-fun res!213827 () Bool)

(assert (=> b!255152 (=> (not res!213827) (not e!176776))))

(assert (=> b!255152 (= res!213827 (and (= (_2!11837 lt!396246) bit!26) (= (_1!11837 lt!396246) (_2!11836 lt!396244))))))

(assert (=> b!255152 (= lt!396246 (readBitPure!0 (readerFrom!0 (_2!11836 lt!396244) (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005))))))

(declare-fun b!255150 () Bool)

(declare-fun res!213829 () Bool)

(assert (=> b!255150 (=> (not res!213829) (not e!176775))))

(declare-fun lt!396245 () (_ BitVec 64))

(declare-fun lt!396243 () (_ BitVec 64))

(assert (=> b!255150 (= res!213829 (= (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!396244))) (currentByte!12024 (_2!11836 lt!396244)) (currentBit!12019 (_2!11836 lt!396244))) (bvadd lt!396243 lt!396245)))))

(assert (=> b!255150 (or (not (= (bvand lt!396243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396245 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!396243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!396243 lt!396245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255150 (= lt!396245 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!255150 (= lt!396243 (bitIndex!0 (size!6037 (buf!6551 thiss!1005)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)))))

(assert (= (and d!85802 res!213826) b!255150))

(assert (= (and b!255150 res!213829) b!255151))

(assert (= (and b!255151 res!213828) b!255152))

(assert (= (and b!255152 res!213827) b!255153))

(declare-fun m!384357 () Bool)

(assert (=> b!255153 m!384357))

(declare-fun m!384359 () Bool)

(assert (=> b!255153 m!384359))

(declare-fun m!384361 () Bool)

(assert (=> b!255152 m!384361))

(assert (=> b!255152 m!384361))

(declare-fun m!384363 () Bool)

(assert (=> b!255152 m!384363))

(declare-fun m!384365 () Bool)

(assert (=> b!255151 m!384365))

(assert (=> b!255150 m!384359))

(assert (=> b!255150 m!383925))

(declare-fun m!384367 () Bool)

(assert (=> d!85802 m!384367))

(declare-fun m!384369 () Bool)

(assert (=> d!85802 m!384369))

(assert (=> b!254895 d!85802))

(declare-fun d!85804 () Bool)

(assert (=> d!85804 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) lt!395772) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761)))) lt!395772))))

(declare-fun bs!21644 () Bool)

(assert (= bs!21644 d!85804))

(declare-fun m!384371 () Bool)

(assert (=> bs!21644 m!384371))

(assert (=> b!254895 d!85804))

(declare-fun b!255154 () Bool)

(declare-fun e!176777 () Unit!18276)

(declare-fun Unit!18285 () Unit!18276)

(assert (=> b!255154 (= e!176777 Unit!18285)))

(declare-fun b!255155 () Bool)

(declare-fun res!213831 () Bool)

(declare-fun e!176778 () Bool)

(assert (=> b!255155 (=> (not res!213831) (not e!176778))))

(declare-fun lt!396265 () tuple2!21808)

(assert (=> b!255155 (= res!213831 (isPrefixOf!0 (_1!11838 lt!396265) thiss!1005))))

(declare-fun b!255156 () Bool)

(declare-fun lt!396257 () Unit!18276)

(assert (=> b!255156 (= e!176777 lt!396257)))

(declare-fun lt!396264 () (_ BitVec 64))

(assert (=> b!255156 (= lt!396264 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!396261 () (_ BitVec 64))

(assert (=> b!255156 (= lt!396261 (bitIndex!0 (size!6037 (buf!6551 thiss!1005)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)))))

(assert (=> b!255156 (= lt!396257 (arrayBitRangesEqSymmetric!0 (buf!6551 thiss!1005) (buf!6551 (_2!11836 lt!395759)) lt!396264 lt!396261))))

(assert (=> b!255156 (arrayBitRangesEq!0 (buf!6551 (_2!11836 lt!395759)) (buf!6551 thiss!1005) lt!396264 lt!396261)))

(declare-fun d!85806 () Bool)

(assert (=> d!85806 e!176778))

(declare-fun res!213830 () Bool)

(assert (=> d!85806 (=> (not res!213830) (not e!176778))))

(assert (=> d!85806 (= res!213830 (isPrefixOf!0 (_1!11838 lt!396265) (_2!11838 lt!396265)))))

(declare-fun lt!396251 () BitStream!10996)

(assert (=> d!85806 (= lt!396265 (tuple2!21809 lt!396251 (_2!11836 lt!395759)))))

(declare-fun lt!396263 () Unit!18276)

(declare-fun lt!396260 () Unit!18276)

(assert (=> d!85806 (= lt!396263 lt!396260)))

(assert (=> d!85806 (isPrefixOf!0 lt!396251 (_2!11836 lt!395759))))

(assert (=> d!85806 (= lt!396260 (lemmaIsPrefixTransitive!0 lt!396251 (_2!11836 lt!395759) (_2!11836 lt!395759)))))

(declare-fun lt!396249 () Unit!18276)

(declare-fun lt!396266 () Unit!18276)

(assert (=> d!85806 (= lt!396249 lt!396266)))

(assert (=> d!85806 (isPrefixOf!0 lt!396251 (_2!11836 lt!395759))))

(assert (=> d!85806 (= lt!396266 (lemmaIsPrefixTransitive!0 lt!396251 thiss!1005 (_2!11836 lt!395759)))))

(declare-fun lt!396252 () Unit!18276)

(assert (=> d!85806 (= lt!396252 e!176777)))

(declare-fun c!11766 () Bool)

(assert (=> d!85806 (= c!11766 (not (= (size!6037 (buf!6551 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!396250 () Unit!18276)

(declare-fun lt!396248 () Unit!18276)

(assert (=> d!85806 (= lt!396250 lt!396248)))

(assert (=> d!85806 (isPrefixOf!0 (_2!11836 lt!395759) (_2!11836 lt!395759))))

(assert (=> d!85806 (= lt!396248 (lemmaIsPrefixRefl!0 (_2!11836 lt!395759)))))

(declare-fun lt!396259 () Unit!18276)

(declare-fun lt!396247 () Unit!18276)

(assert (=> d!85806 (= lt!396259 lt!396247)))

(assert (=> d!85806 (= lt!396247 (lemmaIsPrefixRefl!0 (_2!11836 lt!395759)))))

(declare-fun lt!396256 () Unit!18276)

(declare-fun lt!396254 () Unit!18276)

(assert (=> d!85806 (= lt!396256 lt!396254)))

(assert (=> d!85806 (isPrefixOf!0 lt!396251 lt!396251)))

(assert (=> d!85806 (= lt!396254 (lemmaIsPrefixRefl!0 lt!396251))))

(declare-fun lt!396262 () Unit!18276)

(declare-fun lt!396258 () Unit!18276)

(assert (=> d!85806 (= lt!396262 lt!396258)))

(assert (=> d!85806 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85806 (= lt!396258 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!85806 (= lt!396251 (BitStream!10997 (buf!6551 (_2!11836 lt!395759)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)))))

(assert (=> d!85806 (isPrefixOf!0 thiss!1005 (_2!11836 lt!395759))))

(assert (=> d!85806 (= (reader!0 thiss!1005 (_2!11836 lt!395759)) lt!396265)))

(declare-fun b!255157 () Bool)

(declare-fun lt!396255 () (_ BitVec 64))

(declare-fun lt!396253 () (_ BitVec 64))

(assert (=> b!255157 (= e!176778 (= (_1!11838 lt!396265) (withMovedBitIndex!0 (_2!11838 lt!396265) (bvsub lt!396253 lt!396255))))))

(assert (=> b!255157 (or (= (bvand lt!396253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396255 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396253 lt!396255) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255157 (= lt!396255 (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395759))) (currentByte!12024 (_2!11836 lt!395759)) (currentBit!12019 (_2!11836 lt!395759))))))

(assert (=> b!255157 (= lt!396253 (bitIndex!0 (size!6037 (buf!6551 thiss!1005)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)))))

(declare-fun b!255158 () Bool)

(declare-fun res!213832 () Bool)

(assert (=> b!255158 (=> (not res!213832) (not e!176778))))

(assert (=> b!255158 (= res!213832 (isPrefixOf!0 (_2!11838 lt!396265) (_2!11836 lt!395759)))))

(assert (= (and d!85806 c!11766) b!255156))

(assert (= (and d!85806 (not c!11766)) b!255154))

(assert (= (and d!85806 res!213830) b!255155))

(assert (= (and b!255155 res!213831) b!255158))

(assert (= (and b!255158 res!213832) b!255157))

(assert (=> b!255156 m!383925))

(declare-fun m!384373 () Bool)

(assert (=> b!255156 m!384373))

(declare-fun m!384375 () Bool)

(assert (=> b!255156 m!384375))

(declare-fun m!384377 () Bool)

(assert (=> b!255157 m!384377))

(assert (=> b!255157 m!383933))

(assert (=> b!255157 m!383925))

(declare-fun m!384379 () Bool)

(assert (=> b!255155 m!384379))

(declare-fun m!384381 () Bool)

(assert (=> d!85806 m!384381))

(declare-fun m!384383 () Bool)

(assert (=> d!85806 m!384383))

(declare-fun m!384385 () Bool)

(assert (=> d!85806 m!384385))

(declare-fun m!384387 () Bool)

(assert (=> d!85806 m!384387))

(declare-fun m!384389 () Bool)

(assert (=> d!85806 m!384389))

(declare-fun m!384391 () Bool)

(assert (=> d!85806 m!384391))

(declare-fun m!384393 () Bool)

(assert (=> d!85806 m!384393))

(declare-fun m!384395 () Bool)

(assert (=> d!85806 m!384395))

(assert (=> d!85806 m!383973))

(assert (=> d!85806 m!384319))

(assert (=> d!85806 m!384321))

(declare-fun m!384397 () Bool)

(assert (=> b!255158 m!384397))

(assert (=> b!254895 d!85806))

(declare-fun d!85808 () Bool)

(assert (=> d!85808 (isPrefixOf!0 thiss!1005 (_2!11836 lt!395759))))

(declare-fun lt!396269 () Unit!18276)

(declare-fun choose!30 (BitStream!10996 BitStream!10996 BitStream!10996) Unit!18276)

(assert (=> d!85808 (= lt!396269 (choose!30 thiss!1005 (_2!11836 lt!395761) (_2!11836 lt!395759)))))

(assert (=> d!85808 (isPrefixOf!0 thiss!1005 (_2!11836 lt!395761))))

(assert (=> d!85808 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11836 lt!395761) (_2!11836 lt!395759)) lt!396269)))

(declare-fun bs!21645 () Bool)

(assert (= bs!21645 d!85808))

(assert (=> bs!21645 m!383973))

(declare-fun m!384399 () Bool)

(assert (=> bs!21645 m!384399))

(assert (=> bs!21645 m!383935))

(assert (=> b!254895 d!85808))

(declare-fun d!85810 () Bool)

(declare-fun lt!396270 () tuple2!21824)

(assert (=> d!85810 (= lt!396270 (readBit!0 (_1!11838 lt!395766)))))

(assert (=> d!85810 (= (readBitPure!0 (_1!11838 lt!395766)) (tuple2!21807 (_2!11846 lt!396270) (_1!11846 lt!396270)))))

(declare-fun bs!21646 () Bool)

(assert (= bs!21646 d!85810))

(declare-fun m!384401 () Bool)

(assert (=> bs!21646 m!384401))

(assert (=> b!254895 d!85810))

(declare-fun b!255167 () Bool)

(declare-fun res!213842 () Bool)

(declare-fun e!176784 () Bool)

(assert (=> b!255167 (=> (not res!213842) (not e!176784))))

(declare-fun lt!396288 () (_ BitVec 64))

(declare-fun lt!396290 () tuple2!21804)

(declare-fun lt!396287 () (_ BitVec 64))

(assert (=> b!255167 (= res!213842 (= (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!396290))) (currentByte!12024 (_2!11836 lt!396290)) (currentBit!12019 (_2!11836 lt!396290))) (bvadd lt!396287 lt!396288)))))

(assert (=> b!255167 (or (not (= (bvand lt!396287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396288 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!396287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!396287 lt!396288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255167 (= lt!396288 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255167 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255167 (= lt!396287 (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395761))) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761))))))

(declare-fun b!255170 () Bool)

(declare-fun e!176783 () Bool)

(declare-fun lt!396289 () (_ BitVec 64))

(assert (=> b!255170 (= e!176783 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395761)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) lt!396289))))

(declare-fun b!255169 () Bool)

(declare-fun lt!396294 () tuple2!21806)

(declare-fun lt!396292 () tuple2!21808)

(assert (=> b!255169 (= e!176784 (and (_2!11837 lt!396294) (= (_1!11837 lt!396294) (_2!11838 lt!396292))))))

(assert (=> b!255169 (= lt!396294 (checkBitsLoopPure!0 (_1!11838 lt!396292) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396293 () Unit!18276)

(declare-fun lt!396291 () Unit!18276)

(assert (=> b!255169 (= lt!396293 lt!396291)))

(assert (=> b!255169 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!396290)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) lt!396289)))

(assert (=> b!255169 (= lt!396291 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11836 lt!395761) (buf!6551 (_2!11836 lt!396290)) lt!396289))))

(assert (=> b!255169 e!176783))

(declare-fun res!213844 () Bool)

(assert (=> b!255169 (=> (not res!213844) (not e!176783))))

(assert (=> b!255169 (= res!213844 (and (= (size!6037 (buf!6551 (_2!11836 lt!395761))) (size!6037 (buf!6551 (_2!11836 lt!396290)))) (bvsge lt!396289 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255169 (= lt!396289 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255169 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255169 (= lt!396292 (reader!0 (_2!11836 lt!395761) (_2!11836 lt!396290)))))

(declare-fun b!255168 () Bool)

(declare-fun res!213841 () Bool)

(assert (=> b!255168 (=> (not res!213841) (not e!176784))))

(assert (=> b!255168 (= res!213841 (isPrefixOf!0 (_2!11836 lt!395761) (_2!11836 lt!396290)))))

(declare-fun d!85812 () Bool)

(assert (=> d!85812 e!176784))

(declare-fun res!213843 () Bool)

(assert (=> d!85812 (=> (not res!213843) (not e!176784))))

(assert (=> d!85812 (= res!213843 (= (size!6037 (buf!6551 (_2!11836 lt!395761))) (size!6037 (buf!6551 (_2!11836 lt!396290)))))))

(declare-fun choose!51 (BitStream!10996 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21804)

(assert (=> d!85812 (= lt!396290 (choose!51 (_2!11836 lt!395761) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85812 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85812 (= (appendNBitsLoop!0 (_2!11836 lt!395761) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!396290)))

(assert (= (and d!85812 res!213843) b!255167))

(assert (= (and b!255167 res!213842) b!255168))

(assert (= (and b!255168 res!213841) b!255169))

(assert (= (and b!255169 res!213844) b!255170))

(declare-fun m!384403 () Bool)

(assert (=> b!255168 m!384403))

(declare-fun m!384405 () Bool)

(assert (=> b!255170 m!384405))

(declare-fun m!384407 () Bool)

(assert (=> d!85812 m!384407))

(declare-fun m!384409 () Bool)

(assert (=> b!255167 m!384409))

(assert (=> b!255167 m!383923))

(declare-fun m!384411 () Bool)

(assert (=> b!255169 m!384411))

(declare-fun m!384413 () Bool)

(assert (=> b!255169 m!384413))

(declare-fun m!384415 () Bool)

(assert (=> b!255169 m!384415))

(declare-fun m!384417 () Bool)

(assert (=> b!255169 m!384417))

(assert (=> b!254895 d!85812))

(declare-fun d!85814 () Bool)

(assert (=> d!85814 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395761)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) lt!395772) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395761)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761)))) lt!395772))))

(declare-fun bs!21647 () Bool)

(assert (= bs!21647 d!85814))

(declare-fun m!384419 () Bool)

(assert (=> bs!21647 m!384419))

(assert (=> b!254895 d!85814))

(declare-fun d!85816 () Bool)

(declare-fun e!176787 () Bool)

(assert (=> d!85816 e!176787))

(declare-fun res!213847 () Bool)

(assert (=> d!85816 (=> (not res!213847) (not e!176787))))

(declare-fun lt!396300 () (_ BitVec 64))

(declare-fun lt!396299 () BitStream!10996)

(assert (=> d!85816 (= res!213847 (= (bvadd lt!396300 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6037 (buf!6551 lt!396299)) (currentByte!12024 lt!396299) (currentBit!12019 lt!396299))))))

(assert (=> d!85816 (or (not (= (bvand lt!396300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!396300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!396300 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85816 (= lt!396300 (bitIndex!0 (size!6037 (buf!6551 (_1!11838 lt!395766))) (currentByte!12024 (_1!11838 lt!395766)) (currentBit!12019 (_1!11838 lt!395766))))))

(declare-fun moveBitIndex!0 (BitStream!10996 (_ BitVec 64)) tuple2!21804)

(assert (=> d!85816 (= lt!396299 (_2!11836 (moveBitIndex!0 (_1!11838 lt!395766) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10996 (_ BitVec 64)) Bool)

(assert (=> d!85816 (moveBitIndexPrecond!0 (_1!11838 lt!395766) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!85816 (= (withMovedBitIndex!0 (_1!11838 lt!395766) #b0000000000000000000000000000000000000000000000000000000000000001) lt!396299)))

(declare-fun b!255173 () Bool)

(assert (=> b!255173 (= e!176787 (= (size!6037 (buf!6551 (_1!11838 lt!395766))) (size!6037 (buf!6551 lt!396299))))))

(assert (= (and d!85816 res!213847) b!255173))

(declare-fun m!384421 () Bool)

(assert (=> d!85816 m!384421))

(declare-fun m!384423 () Bool)

(assert (=> d!85816 m!384423))

(declare-fun m!384425 () Bool)

(assert (=> d!85816 m!384425))

(declare-fun m!384427 () Bool)

(assert (=> d!85816 m!384427))

(assert (=> b!254905 d!85816))

(declare-fun d!85818 () Bool)

(assert (=> d!85818 (= (invariant!0 (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005) (size!6037 (buf!6551 (_2!11836 lt!395761)))) (and (bvsge (currentBit!12019 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12019 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12024 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12024 thiss!1005) (size!6037 (buf!6551 (_2!11836 lt!395761)))) (and (= (currentBit!12019 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12024 thiss!1005) (size!6037 (buf!6551 (_2!11836 lt!395761))))))))))

(assert (=> b!254894 d!85818))

(declare-fun d!85820 () Bool)

(declare-fun e!176788 () Bool)

(assert (=> d!85820 e!176788))

(declare-fun res!213848 () Bool)

(assert (=> d!85820 (=> (not res!213848) (not e!176788))))

(declare-fun lt!396306 () (_ BitVec 64))

(declare-fun lt!396305 () (_ BitVec 64))

(declare-fun lt!396302 () (_ BitVec 64))

(assert (=> d!85820 (= res!213848 (= lt!396305 (bvsub lt!396302 lt!396306)))))

(assert (=> d!85820 (or (= (bvand lt!396302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396306 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396302 lt!396306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85820 (= lt!396306 (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395761)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761)))))))

(declare-fun lt!396303 () (_ BitVec 64))

(declare-fun lt!396304 () (_ BitVec 64))

(assert (=> d!85820 (= lt!396302 (bvmul lt!396303 lt!396304))))

(assert (=> d!85820 (or (= lt!396303 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396304 (bvsdiv (bvmul lt!396303 lt!396304) lt!396303)))))

(assert (=> d!85820 (= lt!396304 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85820 (= lt!396303 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395761)))))))

(assert (=> d!85820 (= lt!396305 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761)))))))

(assert (=> d!85820 (invariant!0 (currentBit!12019 (_2!11836 lt!395761)) (currentByte!12024 (_2!11836 lt!395761)) (size!6037 (buf!6551 (_2!11836 lt!395761))))))

(assert (=> d!85820 (= (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395761))) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761))) lt!396305)))

(declare-fun b!255174 () Bool)

(declare-fun res!213849 () Bool)

(assert (=> b!255174 (=> (not res!213849) (not e!176788))))

(assert (=> b!255174 (= res!213849 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396305))))

(declare-fun b!255175 () Bool)

(declare-fun lt!396301 () (_ BitVec 64))

(assert (=> b!255175 (= e!176788 (bvsle lt!396305 (bvmul lt!396301 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255175 (or (= lt!396301 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396301 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396301)))))

(assert (=> b!255175 (= lt!396301 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395761)))))))

(assert (= (and d!85820 res!213848) b!255174))

(assert (= (and b!255174 res!213849) b!255175))

(assert (=> d!85820 m!384419))

(declare-fun m!384429 () Bool)

(assert (=> d!85820 m!384429))

(assert (=> b!254909 d!85820))

(declare-fun d!85822 () Bool)

(declare-fun e!176789 () Bool)

(assert (=> d!85822 e!176789))

(declare-fun res!213850 () Bool)

(assert (=> d!85822 (=> (not res!213850) (not e!176789))))

(declare-fun lt!396312 () (_ BitVec 64))

(declare-fun lt!396308 () (_ BitVec 64))

(declare-fun lt!396311 () (_ BitVec 64))

(assert (=> d!85822 (= res!213850 (= lt!396311 (bvsub lt!396308 lt!396312)))))

(assert (=> d!85822 (or (= (bvand lt!396308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396312 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396308 lt!396312) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85822 (= lt!396312 (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 thiss!1005))) ((_ sign_extend 32) (currentByte!12024 thiss!1005)) ((_ sign_extend 32) (currentBit!12019 thiss!1005))))))

(declare-fun lt!396309 () (_ BitVec 64))

(declare-fun lt!396310 () (_ BitVec 64))

(assert (=> d!85822 (= lt!396308 (bvmul lt!396309 lt!396310))))

(assert (=> d!85822 (or (= lt!396309 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396310 (bvsdiv (bvmul lt!396309 lt!396310) lt!396309)))))

(assert (=> d!85822 (= lt!396310 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85822 (= lt!396309 ((_ sign_extend 32) (size!6037 (buf!6551 thiss!1005))))))

(assert (=> d!85822 (= lt!396311 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12024 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12019 thiss!1005))))))

(assert (=> d!85822 (invariant!0 (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005) (size!6037 (buf!6551 thiss!1005)))))

(assert (=> d!85822 (= (bitIndex!0 (size!6037 (buf!6551 thiss!1005)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)) lt!396311)))

(declare-fun b!255176 () Bool)

(declare-fun res!213851 () Bool)

(assert (=> b!255176 (=> (not res!213851) (not e!176789))))

(assert (=> b!255176 (= res!213851 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396311))))

(declare-fun b!255177 () Bool)

(declare-fun lt!396307 () (_ BitVec 64))

(assert (=> b!255177 (= e!176789 (bvsle lt!396311 (bvmul lt!396307 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255177 (or (= lt!396307 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396307 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396307)))))

(assert (=> b!255177 (= lt!396307 ((_ sign_extend 32) (size!6037 (buf!6551 thiss!1005))))))

(assert (= (and d!85822 res!213850) b!255176))

(assert (= (and b!255176 res!213851) b!255177))

(declare-fun m!384431 () Bool)

(assert (=> d!85822 m!384431))

(declare-fun m!384433 () Bool)

(assert (=> d!85822 m!384433))

(assert (=> b!254909 d!85822))

(declare-fun d!85824 () Bool)

(declare-fun lt!396313 () tuple2!21824)

(assert (=> d!85824 (= lt!396313 (readBit!0 (readerFrom!0 (_2!11836 lt!395761) (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005))))))

(assert (=> d!85824 (= (readBitPure!0 (readerFrom!0 (_2!11836 lt!395761) (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005))) (tuple2!21807 (_2!11846 lt!396313) (_1!11846 lt!396313)))))

(declare-fun bs!21648 () Bool)

(assert (= bs!21648 d!85824))

(assert (=> bs!21648 m!383907))

(declare-fun m!384435 () Bool)

(assert (=> bs!21648 m!384435))

(assert (=> b!254898 d!85824))

(declare-fun d!85826 () Bool)

(declare-fun e!176792 () Bool)

(assert (=> d!85826 e!176792))

(declare-fun res!213855 () Bool)

(assert (=> d!85826 (=> (not res!213855) (not e!176792))))

(assert (=> d!85826 (= res!213855 (invariant!0 (currentBit!12019 (_2!11836 lt!395761)) (currentByte!12024 (_2!11836 lt!395761)) (size!6037 (buf!6551 (_2!11836 lt!395761)))))))

(assert (=> d!85826 (= (readerFrom!0 (_2!11836 lt!395761) (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005)) (BitStream!10997 (buf!6551 (_2!11836 lt!395761)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)))))

(declare-fun b!255180 () Bool)

(assert (=> b!255180 (= e!176792 (invariant!0 (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005) (size!6037 (buf!6551 (_2!11836 lt!395761)))))))

(assert (= (and d!85826 res!213855) b!255180))

(assert (=> d!85826 m!384429))

(assert (=> b!255180 m!383919))

(assert (=> b!254898 d!85826))

(assert (=> b!254908 d!85822))

(declare-fun d!85828 () Bool)

(declare-fun e!176793 () Bool)

(assert (=> d!85828 e!176793))

(declare-fun res!213856 () Bool)

(assert (=> d!85828 (=> (not res!213856) (not e!176793))))

(declare-fun lt!396319 () (_ BitVec 64))

(declare-fun lt!396318 () (_ BitVec 64))

(declare-fun lt!396315 () (_ BitVec 64))

(assert (=> d!85828 (= res!213856 (= lt!396318 (bvsub lt!396315 lt!396319)))))

(assert (=> d!85828 (or (= (bvand lt!396315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396319 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396315 lt!396319) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85828 (= lt!396319 (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395759))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395759)))))))

(declare-fun lt!396316 () (_ BitVec 64))

(declare-fun lt!396317 () (_ BitVec 64))

(assert (=> d!85828 (= lt!396315 (bvmul lt!396316 lt!396317))))

(assert (=> d!85828 (or (= lt!396316 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396317 (bvsdiv (bvmul lt!396316 lt!396317) lt!396316)))))

(assert (=> d!85828 (= lt!396317 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85828 (= lt!396316 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))))))

(assert (=> d!85828 (= lt!396318 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395759))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395759)))))))

(assert (=> d!85828 (invariant!0 (currentBit!12019 (_2!11836 lt!395759)) (currentByte!12024 (_2!11836 lt!395759)) (size!6037 (buf!6551 (_2!11836 lt!395759))))))

(assert (=> d!85828 (= (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395759))) (currentByte!12024 (_2!11836 lt!395759)) (currentBit!12019 (_2!11836 lt!395759))) lt!396318)))

(declare-fun b!255181 () Bool)

(declare-fun res!213857 () Bool)

(assert (=> b!255181 (=> (not res!213857) (not e!176793))))

(assert (=> b!255181 (= res!213857 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396318))))

(declare-fun b!255182 () Bool)

(declare-fun lt!396314 () (_ BitVec 64))

(assert (=> b!255182 (= e!176793 (bvsle lt!396318 (bvmul lt!396314 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255182 (or (= lt!396314 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396314 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396314)))))

(assert (=> b!255182 (= lt!396314 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))))))

(assert (= (and d!85828 res!213856) b!255181))

(assert (= (and b!255181 res!213857) b!255182))

(declare-fun m!384437 () Bool)

(assert (=> d!85828 m!384437))

(declare-fun m!384439 () Bool)

(assert (=> d!85828 m!384439))

(assert (=> b!254897 d!85828))

(assert (=> b!254897 d!85820))

(declare-fun d!85830 () Bool)

(declare-fun e!176794 () Bool)

(assert (=> d!85830 e!176794))

(declare-fun res!213858 () Bool)

(assert (=> d!85830 (=> (not res!213858) (not e!176794))))

(declare-fun lt!396325 () (_ BitVec 64))

(declare-fun lt!396324 () (_ BitVec 64))

(declare-fun lt!396321 () (_ BitVec 64))

(assert (=> d!85830 (= res!213858 (= lt!396324 (bvsub lt!396321 lt!396325)))))

(assert (=> d!85830 (or (= (bvand lt!396321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396325 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396321 lt!396325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85830 (= lt!396325 (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 (_1!11837 lt!395771)))) ((_ sign_extend 32) (currentByte!12024 (_1!11837 lt!395771))) ((_ sign_extend 32) (currentBit!12019 (_1!11837 lt!395771)))))))

(declare-fun lt!396322 () (_ BitVec 64))

(declare-fun lt!396323 () (_ BitVec 64))

(assert (=> d!85830 (= lt!396321 (bvmul lt!396322 lt!396323))))

(assert (=> d!85830 (or (= lt!396322 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396323 (bvsdiv (bvmul lt!396322 lt!396323) lt!396322)))))

(assert (=> d!85830 (= lt!396323 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85830 (= lt!396322 ((_ sign_extend 32) (size!6037 (buf!6551 (_1!11837 lt!395771)))))))

(assert (=> d!85830 (= lt!396324 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12024 (_1!11837 lt!395771))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12019 (_1!11837 lt!395771)))))))

(assert (=> d!85830 (invariant!0 (currentBit!12019 (_1!11837 lt!395771)) (currentByte!12024 (_1!11837 lt!395771)) (size!6037 (buf!6551 (_1!11837 lt!395771))))))

(assert (=> d!85830 (= (bitIndex!0 (size!6037 (buf!6551 (_1!11837 lt!395771))) (currentByte!12024 (_1!11837 lt!395771)) (currentBit!12019 (_1!11837 lt!395771))) lt!396324)))

(declare-fun b!255183 () Bool)

(declare-fun res!213859 () Bool)

(assert (=> b!255183 (=> (not res!213859) (not e!176794))))

(assert (=> b!255183 (= res!213859 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396324))))

(declare-fun b!255184 () Bool)

(declare-fun lt!396320 () (_ BitVec 64))

(assert (=> b!255184 (= e!176794 (bvsle lt!396324 (bvmul lt!396320 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255184 (or (= lt!396320 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396320 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396320)))))

(assert (=> b!255184 (= lt!396320 ((_ sign_extend 32) (size!6037 (buf!6551 (_1!11837 lt!395771)))))))

(assert (= (and d!85830 res!213858) b!255183))

(assert (= (and b!255183 res!213859) b!255184))

(declare-fun m!384441 () Bool)

(assert (=> d!85830 m!384441))

(declare-fun m!384443 () Bool)

(assert (=> d!85830 m!384443))

(assert (=> b!254907 d!85830))

(declare-fun d!85832 () Bool)

(declare-fun res!213861 () Bool)

(declare-fun e!176796 () Bool)

(assert (=> d!85832 (=> (not res!213861) (not e!176796))))

(assert (=> d!85832 (= res!213861 (= (size!6037 (buf!6551 thiss!1005)) (size!6037 (buf!6551 (_2!11836 lt!395761)))))))

(assert (=> d!85832 (= (isPrefixOf!0 thiss!1005 (_2!11836 lt!395761)) e!176796)))

(declare-fun b!255185 () Bool)

(declare-fun res!213860 () Bool)

(assert (=> b!255185 (=> (not res!213860) (not e!176796))))

(assert (=> b!255185 (= res!213860 (bvsle (bitIndex!0 (size!6037 (buf!6551 thiss!1005)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005)) (bitIndex!0 (size!6037 (buf!6551 (_2!11836 lt!395761))) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761)))))))

(declare-fun b!255186 () Bool)

(declare-fun e!176795 () Bool)

(assert (=> b!255186 (= e!176796 e!176795)))

(declare-fun res!213862 () Bool)

(assert (=> b!255186 (=> res!213862 e!176795)))

(assert (=> b!255186 (= res!213862 (= (size!6037 (buf!6551 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!255187 () Bool)

(assert (=> b!255187 (= e!176795 (arrayBitRangesEq!0 (buf!6551 thiss!1005) (buf!6551 (_2!11836 lt!395761)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6037 (buf!6551 thiss!1005)) (currentByte!12024 thiss!1005) (currentBit!12019 thiss!1005))))))

(assert (= (and d!85832 res!213861) b!255185))

(assert (= (and b!255185 res!213860) b!255186))

(assert (= (and b!255186 (not res!213862)) b!255187))

(assert (=> b!255185 m!383925))

(assert (=> b!255185 m!383923))

(assert (=> b!255187 m!383925))

(assert (=> b!255187 m!383925))

(declare-fun m!384445 () Bool)

(assert (=> b!255187 m!384445))

(assert (=> b!254896 d!85832))

(declare-fun d!85834 () Bool)

(assert (=> d!85834 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 thiss!1005))) ((_ sign_extend 32) (currentByte!12024 thiss!1005)) ((_ sign_extend 32) (currentBit!12019 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 thiss!1005))) ((_ sign_extend 32) (currentByte!12024 thiss!1005)) ((_ sign_extend 32) (currentBit!12019 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21649 () Bool)

(assert (= bs!21649 d!85834))

(assert (=> bs!21649 m!384431))

(assert (=> b!254901 d!85834))

(declare-fun d!85836 () Bool)

(assert (=> d!85836 (= (invariant!0 (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005) (size!6037 (buf!6551 (_2!11836 lt!395759)))) (and (bvsge (currentBit!12019 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12019 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12024 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12024 thiss!1005) (size!6037 (buf!6551 (_2!11836 lt!395759)))) (and (= (currentBit!12019 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12024 thiss!1005) (size!6037 (buf!6551 (_2!11836 lt!395759))))))))))

(assert (=> b!254900 d!85836))

(declare-fun d!85838 () Bool)

(assert (=> d!85838 (= (array_inv!5778 (buf!6551 thiss!1005)) (bvsge (size!6037 (buf!6551 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!254893 d!85838))

(declare-fun d!85840 () Bool)

(assert (=> d!85840 (= (inv!12 thiss!1005) (invariant!0 (currentBit!12019 thiss!1005) (currentByte!12024 thiss!1005) (size!6037 (buf!6551 thiss!1005))))))

(declare-fun bs!21650 () Bool)

(assert (= bs!21650 d!85840))

(assert (=> bs!21650 m!384433))

(assert (=> start!54516 d!85840))

(declare-fun d!85842 () Bool)

(declare-fun lt!396326 () tuple2!21824)

(assert (=> d!85842 (= lt!396326 (checkBitsLoop!0 (_1!11838 lt!395767) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85842 (= (checkBitsLoopPure!0 (_1!11838 lt!395767) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21807 (_2!11846 lt!396326) (_1!11846 lt!396326)))))

(declare-fun bs!21651 () Bool)

(assert (= bs!21651 d!85842))

(declare-fun m!384447 () Bool)

(assert (=> bs!21651 m!384447))

(assert (=> b!254903 d!85842))

(declare-fun d!85844 () Bool)

(assert (=> d!85844 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) lt!395763) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761)))) lt!395763))))

(declare-fun bs!21652 () Bool)

(assert (= bs!21652 d!85844))

(assert (=> bs!21652 m!384371))

(assert (=> b!254903 d!85844))

(declare-fun d!85846 () Bool)

(assert (=> d!85846 (validate_offset_bits!1 ((_ sign_extend 32) (size!6037 (buf!6551 (_2!11836 lt!395759)))) ((_ sign_extend 32) (currentByte!12024 (_2!11836 lt!395761))) ((_ sign_extend 32) (currentBit!12019 (_2!11836 lt!395761))) lt!395763)))

(declare-fun lt!396327 () Unit!18276)

(assert (=> d!85846 (= lt!396327 (choose!9 (_2!11836 lt!395761) (buf!6551 (_2!11836 lt!395759)) lt!395763 (BitStream!10997 (buf!6551 (_2!11836 lt!395759)) (currentByte!12024 (_2!11836 lt!395761)) (currentBit!12019 (_2!11836 lt!395761)))))))

(assert (=> d!85846 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11836 lt!395761) (buf!6551 (_2!11836 lt!395759)) lt!395763) lt!396327)))

(declare-fun bs!21653 () Bool)

(assert (= bs!21653 d!85846))

(assert (=> bs!21653 m!383913))

(declare-fun m!384449 () Bool)

(assert (=> bs!21653 m!384449))

(assert (=> b!254903 d!85846))

(assert (=> b!254903 d!85782))

(push 1)

(assert (not b!255150))

(assert (not d!85816))

(assert (not b!255168))

(assert (not b!255135))

(assert (not b!255108))

(assert (not d!85800))

(assert (not d!85790))

(assert (not d!85826))

(assert (not d!85810))

(assert (not d!85808))

(assert (not d!85804))

(assert (not b!255180))

(assert (not b!255153))

(assert (not d!85782))

(assert (not d!85834))

(assert (not d!85806))

(assert (not d!85830))

(assert (not d!85778))

(assert (not b!255133))

(assert (not d!85822))

(assert (not b!255126))

(assert (not d!85846))

(assert (not b!255120))

(assert (not d!85842))

(assert (not b!255157))

(assert (not b!255185))

(assert (not b!255158))

(assert (not d!85776))

(assert (not b!255155))

(assert (not d!85844))

(assert (not d!85824))

(assert (not d!85828))

(assert (not b!255151))

(assert (not b!255156))

(assert (not d!85794))

(assert (not d!85796))

(assert (not b!255152))

(assert (not d!85820))

(assert (not d!85786))

(assert (not d!85840))

(assert (not b!255122))

(assert (not d!85780))

(assert (not b!255121))

(assert (not b!255106))

(assert (not b!255169))

(assert (not d!85814))

(assert (not d!85788))

(assert (not b!255187))

(assert (not b!255167))

(assert (not b!255170))

(assert (not d!85812))

(assert (not d!85802))

(assert (not d!85784))

(assert (not d!85798))

(assert (not b!255123))

(check-sat)

(pop 1)

(push 1)

(check-sat)

