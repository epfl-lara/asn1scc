; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54518 () Bool)

(assert start!54518)

(declare-fun b!254944 () Bool)

(declare-fun res!213651 () Bool)

(declare-fun e!176651 () Bool)

(assert (=> b!254944 (=> (not res!213651) (not e!176651))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13764 0))(
  ( (array!13765 (arr!7025 (Array (_ BitVec 32) (_ BitVec 8))) (size!6038 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10998 0))(
  ( (BitStream!10999 (buf!6552 array!13764) (currentByte!12025 (_ BitVec 32)) (currentBit!12020 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10998)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!254944 (= res!213651 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 thiss!1005))) ((_ sign_extend 32) (currentByte!12025 thiss!1005)) ((_ sign_extend 32) (currentBit!12020 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!254946 () Bool)

(declare-fun e!176658 () Bool)

(assert (=> b!254946 (= e!176651 (not e!176658))))

(declare-fun res!213646 () Bool)

(assert (=> b!254946 (=> res!213646 e!176658)))

(declare-datatypes ((tuple2!21810 0))(
  ( (tuple2!21811 (_1!11839 BitStream!10998) (_2!11839 Bool)) )
))
(declare-fun lt!395834 () tuple2!21810)

(declare-datatypes ((tuple2!21812 0))(
  ( (tuple2!21813 (_1!11840 BitStream!10998) (_2!11840 BitStream!10998)) )
))
(declare-fun lt!395847 () tuple2!21812)

(assert (=> b!254946 (= res!213646 (not (= (_1!11839 lt!395834) (_2!11840 lt!395847))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10998 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21810)

(assert (=> b!254946 (= lt!395834 (checkBitsLoopPure!0 (_1!11840 lt!395847) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18278 0))(
  ( (Unit!18279) )
))
(declare-datatypes ((tuple2!21814 0))(
  ( (tuple2!21815 (_1!11841 Unit!18278) (_2!11841 BitStream!10998)) )
))
(declare-fun lt!395846 () tuple2!21814)

(declare-fun lt!395830 () tuple2!21814)

(declare-fun lt!395840 () (_ BitVec 64))

(assert (=> b!254946 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) lt!395840)))

(declare-fun lt!395824 () Unit!18278)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10998 array!13764 (_ BitVec 64)) Unit!18278)

(assert (=> b!254946 (= lt!395824 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11841 lt!395830) (buf!6552 (_2!11841 lt!395846)) lt!395840))))

(declare-fun lt!395827 () tuple2!21810)

(declare-fun lt!395838 () tuple2!21812)

(assert (=> b!254946 (= lt!395827 (checkBitsLoopPure!0 (_1!11840 lt!395838) nBits!297 bit!26 from!289))))

(assert (=> b!254946 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 thiss!1005)) ((_ sign_extend 32) (currentBit!12020 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!395841 () Unit!18278)

(assert (=> b!254946 (= lt!395841 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6552 (_2!11841 lt!395846)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10998) tuple2!21810)

(assert (=> b!254946 (= (_2!11839 (readBitPure!0 (_1!11840 lt!395838))) bit!26)))

(declare-fun reader!0 (BitStream!10998 BitStream!10998) tuple2!21812)

(assert (=> b!254946 (= lt!395847 (reader!0 (_2!11841 lt!395830) (_2!11841 lt!395846)))))

(assert (=> b!254946 (= lt!395838 (reader!0 thiss!1005 (_2!11841 lt!395846)))))

(declare-fun e!176657 () Bool)

(assert (=> b!254946 e!176657))

(declare-fun res!213649 () Bool)

(assert (=> b!254946 (=> (not res!213649) (not e!176657))))

(declare-fun lt!395828 () tuple2!21810)

(declare-fun lt!395835 () tuple2!21810)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!254946 (= res!213649 (= (bitIndex!0 (size!6038 (buf!6552 (_1!11839 lt!395828))) (currentByte!12025 (_1!11839 lt!395828)) (currentBit!12020 (_1!11839 lt!395828))) (bitIndex!0 (size!6038 (buf!6552 (_1!11839 lt!395835))) (currentByte!12025 (_1!11839 lt!395835)) (currentBit!12020 (_1!11839 lt!395835)))))))

(declare-fun lt!395839 () Unit!18278)

(declare-fun lt!395831 () BitStream!10998)

(declare-fun readBitPrefixLemma!0 (BitStream!10998 BitStream!10998) Unit!18278)

(assert (=> b!254946 (= lt!395839 (readBitPrefixLemma!0 lt!395831 (_2!11841 lt!395846)))))

(assert (=> b!254946 (= lt!395835 (readBitPure!0 (BitStream!10999 (buf!6552 (_2!11841 lt!395846)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005))))))

(assert (=> b!254946 (= lt!395828 (readBitPure!0 lt!395831))))

(assert (=> b!254946 (= lt!395831 (BitStream!10999 (buf!6552 (_2!11841 lt!395830)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)))))

(declare-fun e!176655 () Bool)

(assert (=> b!254946 e!176655))

(declare-fun res!213639 () Bool)

(assert (=> b!254946 (=> (not res!213639) (not e!176655))))

(declare-fun isPrefixOf!0 (BitStream!10998 BitStream!10998) Bool)

(assert (=> b!254946 (= res!213639 (isPrefixOf!0 thiss!1005 (_2!11841 lt!395846)))))

(declare-fun lt!395833 () Unit!18278)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10998 BitStream!10998 BitStream!10998) Unit!18278)

(assert (=> b!254946 (= lt!395833 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11841 lt!395830) (_2!11841 lt!395846)))))

(declare-fun e!176656 () Bool)

(assert (=> b!254946 e!176656))

(declare-fun res!213645 () Bool)

(assert (=> b!254946 (=> (not res!213645) (not e!176656))))

(assert (=> b!254946 (= res!213645 (= (size!6038 (buf!6552 (_2!11841 lt!395830))) (size!6038 (buf!6552 (_2!11841 lt!395846)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10998 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21814)

(assert (=> b!254946 (= lt!395846 (appendNBitsLoop!0 (_2!11841 lt!395830) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254946 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395830)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) lt!395840)))

(assert (=> b!254946 (= lt!395840 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!395829 () Unit!18278)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10998 BitStream!10998 (_ BitVec 64) (_ BitVec 64)) Unit!18278)

(assert (=> b!254946 (= lt!395829 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11841 lt!395830) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!176660 () Bool)

(assert (=> b!254946 e!176660))

(declare-fun res!213640 () Bool)

(assert (=> b!254946 (=> (not res!213640) (not e!176660))))

(assert (=> b!254946 (= res!213640 (= (size!6038 (buf!6552 thiss!1005)) (size!6038 (buf!6552 (_2!11841 lt!395830)))))))

(declare-fun appendBit!0 (BitStream!10998 Bool) tuple2!21814)

(assert (=> b!254946 (= lt!395830 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!254947 () Bool)

(declare-fun e!176653 () Bool)

(assert (=> b!254947 (= e!176660 e!176653)))

(declare-fun res!213643 () Bool)

(assert (=> b!254947 (=> (not res!213643) (not e!176653))))

(declare-fun lt!395825 () (_ BitVec 64))

(declare-fun lt!395826 () (_ BitVec 64))

(assert (=> b!254947 (= res!213643 (= lt!395825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!395826)))))

(assert (=> b!254947 (= lt!395825 (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395830))) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830))))))

(assert (=> b!254947 (= lt!395826 (bitIndex!0 (size!6038 (buf!6552 thiss!1005)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)))))

(declare-fun b!254948 () Bool)

(declare-fun e!176649 () Bool)

(assert (=> b!254948 (= e!176656 e!176649)))

(declare-fun res!213647 () Bool)

(assert (=> b!254948 (=> (not res!213647) (not e!176649))))

(declare-fun lt!395836 () (_ BitVec 64))

(assert (=> b!254948 (= res!213647 (= (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395846))) (currentByte!12025 (_2!11841 lt!395846)) (currentBit!12020 (_2!11841 lt!395846))) (bvadd (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395830))) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830))) lt!395836)))))

(assert (=> b!254948 (= lt!395836 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!254949 () Bool)

(declare-fun res!213654 () Bool)

(assert (=> b!254949 (=> (not res!213654) (not e!176651))))

(assert (=> b!254949 (= res!213654 (bvslt from!289 nBits!297))))

(declare-fun b!254950 () Bool)

(declare-fun res!213653 () Bool)

(assert (=> b!254950 (=> res!213653 e!176658)))

(declare-fun withMovedBitIndex!0 (BitStream!10998 (_ BitVec 64)) BitStream!10998)

(assert (=> b!254950 (= res!213653 (not (= (_1!11840 lt!395847) (withMovedBitIndex!0 (_1!11840 lt!395838) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!254951 () Bool)

(declare-fun res!213641 () Bool)

(assert (=> b!254951 (=> (not res!213641) (not e!176649))))

(assert (=> b!254951 (= res!213641 (isPrefixOf!0 (_2!11841 lt!395830) (_2!11841 lt!395846)))))

(declare-fun b!254952 () Bool)

(declare-fun e!176659 () Bool)

(declare-fun lt!395845 () tuple2!21810)

(assert (=> b!254952 (= e!176659 (= (bitIndex!0 (size!6038 (buf!6552 (_1!11839 lt!395845))) (currentByte!12025 (_1!11839 lt!395845)) (currentBit!12020 (_1!11839 lt!395845))) lt!395825))))

(declare-fun b!254953 () Bool)

(declare-fun res!213648 () Bool)

(assert (=> b!254953 (=> (not res!213648) (not e!176653))))

(assert (=> b!254953 (= res!213648 (isPrefixOf!0 thiss!1005 (_2!11841 lt!395830)))))

(declare-fun b!254954 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254954 (= e!176655 (invariant!0 (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005) (size!6038 (buf!6552 (_2!11841 lt!395846)))))))

(declare-fun b!254955 () Bool)

(assert (=> b!254955 (= e!176653 e!176659)))

(declare-fun res!213650 () Bool)

(assert (=> b!254955 (=> (not res!213650) (not e!176659))))

(assert (=> b!254955 (= res!213650 (and (= (_2!11839 lt!395845) bit!26) (= (_1!11839 lt!395845) (_2!11841 lt!395830))))))

(declare-fun readerFrom!0 (BitStream!10998 (_ BitVec 32) (_ BitVec 32)) BitStream!10998)

(assert (=> b!254955 (= lt!395845 (readBitPure!0 (readerFrom!0 (_2!11841 lt!395830) (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005))))))

(declare-fun b!254956 () Bool)

(declare-fun lt!395837 () tuple2!21810)

(declare-fun lt!395842 () tuple2!21812)

(assert (=> b!254956 (= e!176649 (not (or (not (_2!11839 lt!395837)) (not (= (_1!11839 lt!395837) (_2!11840 lt!395842))))))))

(assert (=> b!254956 (= lt!395837 (checkBitsLoopPure!0 (_1!11840 lt!395842) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254956 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) lt!395836)))

(declare-fun lt!395844 () Unit!18278)

(assert (=> b!254956 (= lt!395844 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11841 lt!395830) (buf!6552 (_2!11841 lt!395846)) lt!395836))))

(assert (=> b!254956 (= lt!395842 (reader!0 (_2!11841 lt!395830) (_2!11841 lt!395846)))))

(declare-fun b!254945 () Bool)

(declare-fun e!176650 () Bool)

(assert (=> b!254945 (= e!176658 e!176650)))

(declare-fun res!213642 () Bool)

(assert (=> b!254945 (=> res!213642 e!176650)))

(assert (=> b!254945 (= res!213642 (not (= (size!6038 (buf!6552 thiss!1005)) (size!6038 (buf!6552 (_2!11841 lt!395846))))))))

(assert (=> b!254945 (and (= (_2!11839 lt!395827) (_2!11839 lt!395834)) (= (_1!11839 lt!395827) (_2!11840 lt!395838)))))

(declare-fun res!213652 () Bool)

(assert (=> start!54518 (=> (not res!213652) (not e!176651))))

(assert (=> start!54518 (= res!213652 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54518 e!176651))

(assert (=> start!54518 true))

(declare-fun e!176654 () Bool)

(declare-fun inv!12 (BitStream!10998) Bool)

(assert (=> start!54518 (and (inv!12 thiss!1005) e!176654)))

(declare-fun b!254957 () Bool)

(declare-fun array_inv!5779 (array!13764) Bool)

(assert (=> b!254957 (= e!176654 (array_inv!5779 (buf!6552 thiss!1005)))))

(declare-fun b!254958 () Bool)

(assert (=> b!254958 (= e!176657 (= (_2!11839 lt!395828) (_2!11839 lt!395835)))))

(declare-fun b!254959 () Bool)

(declare-fun res!213644 () Bool)

(assert (=> b!254959 (=> (not res!213644) (not e!176655))))

(assert (=> b!254959 (= res!213644 (invariant!0 (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005) (size!6038 (buf!6552 (_2!11841 lt!395830)))))))

(declare-fun b!254960 () Bool)

(declare-fun lt!395843 () (_ BitVec 64))

(declare-fun lt!395832 () (_ BitVec 64))

(assert (=> b!254960 (= e!176650 (or (not (= lt!395832 (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!395832 (bvand (bvadd lt!395843 (bvsub nBits!297 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!254960 (= lt!395832 (bvand lt!395843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254960 (= lt!395843 (bitIndex!0 (size!6038 (buf!6552 thiss!1005)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)))))

(assert (= (and start!54518 res!213652) b!254944))

(assert (= (and b!254944 res!213651) b!254949))

(assert (= (and b!254949 res!213654) b!254946))

(assert (= (and b!254946 res!213640) b!254947))

(assert (= (and b!254947 res!213643) b!254953))

(assert (= (and b!254953 res!213648) b!254955))

(assert (= (and b!254955 res!213650) b!254952))

(assert (= (and b!254946 res!213645) b!254948))

(assert (= (and b!254948 res!213647) b!254951))

(assert (= (and b!254951 res!213641) b!254956))

(assert (= (and b!254946 res!213639) b!254959))

(assert (= (and b!254959 res!213644) b!254954))

(assert (= (and b!254946 res!213649) b!254958))

(assert (= (and b!254946 (not res!213646)) b!254950))

(assert (= (and b!254950 (not res!213653)) b!254945))

(assert (= (and b!254945 (not res!213642)) b!254960))

(assert (= start!54518 b!254957))

(declare-fun m!383975 () Bool)

(assert (=> b!254952 m!383975))

(declare-fun m!383977 () Bool)

(assert (=> b!254959 m!383977))

(declare-fun m!383979 () Bool)

(assert (=> b!254947 m!383979))

(declare-fun m!383981 () Bool)

(assert (=> b!254947 m!383981))

(declare-fun m!383983 () Bool)

(assert (=> start!54518 m!383983))

(assert (=> b!254960 m!383981))

(declare-fun m!383985 () Bool)

(assert (=> b!254950 m!383985))

(declare-fun m!383987 () Bool)

(assert (=> b!254955 m!383987))

(assert (=> b!254955 m!383987))

(declare-fun m!383989 () Bool)

(assert (=> b!254955 m!383989))

(declare-fun m!383991 () Bool)

(assert (=> b!254948 m!383991))

(assert (=> b!254948 m!383979))

(declare-fun m!383993 () Bool)

(assert (=> b!254954 m!383993))

(declare-fun m!383995 () Bool)

(assert (=> b!254946 m!383995))

(declare-fun m!383997 () Bool)

(assert (=> b!254946 m!383997))

(declare-fun m!383999 () Bool)

(assert (=> b!254946 m!383999))

(declare-fun m!384001 () Bool)

(assert (=> b!254946 m!384001))

(declare-fun m!384003 () Bool)

(assert (=> b!254946 m!384003))

(declare-fun m!384005 () Bool)

(assert (=> b!254946 m!384005))

(declare-fun m!384007 () Bool)

(assert (=> b!254946 m!384007))

(declare-fun m!384009 () Bool)

(assert (=> b!254946 m!384009))

(declare-fun m!384011 () Bool)

(assert (=> b!254946 m!384011))

(declare-fun m!384013 () Bool)

(assert (=> b!254946 m!384013))

(declare-fun m!384015 () Bool)

(assert (=> b!254946 m!384015))

(declare-fun m!384017 () Bool)

(assert (=> b!254946 m!384017))

(declare-fun m!384019 () Bool)

(assert (=> b!254946 m!384019))

(declare-fun m!384021 () Bool)

(assert (=> b!254946 m!384021))

(declare-fun m!384023 () Bool)

(assert (=> b!254946 m!384023))

(declare-fun m!384025 () Bool)

(assert (=> b!254946 m!384025))

(declare-fun m!384027 () Bool)

(assert (=> b!254946 m!384027))

(declare-fun m!384029 () Bool)

(assert (=> b!254946 m!384029))

(declare-fun m!384031 () Bool)

(assert (=> b!254946 m!384031))

(declare-fun m!384033 () Bool)

(assert (=> b!254946 m!384033))

(declare-fun m!384035 () Bool)

(assert (=> b!254953 m!384035))

(declare-fun m!384037 () Bool)

(assert (=> b!254944 m!384037))

(declare-fun m!384039 () Bool)

(assert (=> b!254956 m!384039))

(declare-fun m!384041 () Bool)

(assert (=> b!254956 m!384041))

(declare-fun m!384043 () Bool)

(assert (=> b!254956 m!384043))

(assert (=> b!254956 m!384005))

(declare-fun m!384045 () Bool)

(assert (=> b!254957 m!384045))

(declare-fun m!384047 () Bool)

(assert (=> b!254951 m!384047))

(check-sat (not b!254954) (not b!254952) (not b!254959) (not b!254957) (not b!254960) (not b!254955) (not b!254947) (not b!254946) (not b!254950) (not start!54518) (not b!254953) (not b!254951) (not b!254944) (not b!254956) (not b!254948))
(check-sat)
(get-model)

(declare-fun d!85700 () Bool)

(declare-fun e!176699 () Bool)

(assert (=> d!85700 e!176699))

(declare-fun res!213707 () Bool)

(assert (=> d!85700 (=> (not res!213707) (not e!176699))))

(declare-fun lt!395937 () (_ BitVec 64))

(declare-fun lt!395932 () (_ BitVec 64))

(declare-fun lt!395933 () (_ BitVec 64))

(assert (=> d!85700 (= res!213707 (= lt!395937 (bvsub lt!395933 lt!395932)))))

(assert (=> d!85700 (or (= (bvand lt!395933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395933 lt!395932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!85700 (= lt!395932 (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395846))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395846)))))))

(declare-fun lt!395935 () (_ BitVec 64))

(declare-fun lt!395936 () (_ BitVec 64))

(assert (=> d!85700 (= lt!395933 (bvmul lt!395935 lt!395936))))

(assert (=> d!85700 (or (= lt!395935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395936 (bvsdiv (bvmul lt!395935 lt!395936) lt!395935)))))

(assert (=> d!85700 (= lt!395936 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85700 (= lt!395935 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))))))

(assert (=> d!85700 (= lt!395937 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395846))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395846)))))))

(assert (=> d!85700 (invariant!0 (currentBit!12020 (_2!11841 lt!395846)) (currentByte!12025 (_2!11841 lt!395846)) (size!6038 (buf!6552 (_2!11841 lt!395846))))))

(assert (=> d!85700 (= (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395846))) (currentByte!12025 (_2!11841 lt!395846)) (currentBit!12020 (_2!11841 lt!395846))) lt!395937)))

(declare-fun b!255016 () Bool)

(declare-fun res!213708 () Bool)

(assert (=> b!255016 (=> (not res!213708) (not e!176699))))

(assert (=> b!255016 (= res!213708 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395937))))

(declare-fun b!255017 () Bool)

(declare-fun lt!395934 () (_ BitVec 64))

(assert (=> b!255017 (= e!176699 (bvsle lt!395937 (bvmul lt!395934 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255017 (or (= lt!395934 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395934 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395934)))))

(assert (=> b!255017 (= lt!395934 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))))))

(assert (= (and d!85700 res!213707) b!255016))

(assert (= (and b!255016 res!213708) b!255017))

(declare-fun m!384123 () Bool)

(assert (=> d!85700 m!384123))

(declare-fun m!384125 () Bool)

(assert (=> d!85700 m!384125))

(assert (=> b!254948 d!85700))

(declare-fun d!85702 () Bool)

(declare-fun e!176700 () Bool)

(assert (=> d!85702 e!176700))

(declare-fun res!213709 () Bool)

(assert (=> d!85702 (=> (not res!213709) (not e!176700))))

(declare-fun lt!395943 () (_ BitVec 64))

(declare-fun lt!395938 () (_ BitVec 64))

(declare-fun lt!395939 () (_ BitVec 64))

(assert (=> d!85702 (= res!213709 (= lt!395943 (bvsub lt!395939 lt!395938)))))

(assert (=> d!85702 (or (= (bvand lt!395939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395938 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395939 lt!395938) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85702 (= lt!395938 (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395830)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830)))))))

(declare-fun lt!395941 () (_ BitVec 64))

(declare-fun lt!395942 () (_ BitVec 64))

(assert (=> d!85702 (= lt!395939 (bvmul lt!395941 lt!395942))))

(assert (=> d!85702 (or (= lt!395941 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395942 (bvsdiv (bvmul lt!395941 lt!395942) lt!395941)))))

(assert (=> d!85702 (= lt!395942 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85702 (= lt!395941 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395830)))))))

(assert (=> d!85702 (= lt!395943 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830)))))))

(assert (=> d!85702 (invariant!0 (currentBit!12020 (_2!11841 lt!395830)) (currentByte!12025 (_2!11841 lt!395830)) (size!6038 (buf!6552 (_2!11841 lt!395830))))))

(assert (=> d!85702 (= (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395830))) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830))) lt!395943)))

(declare-fun b!255018 () Bool)

(declare-fun res!213710 () Bool)

(assert (=> b!255018 (=> (not res!213710) (not e!176700))))

(assert (=> b!255018 (= res!213710 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395943))))

(declare-fun b!255019 () Bool)

(declare-fun lt!395940 () (_ BitVec 64))

(assert (=> b!255019 (= e!176700 (bvsle lt!395943 (bvmul lt!395940 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255019 (or (= lt!395940 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395940 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395940)))))

(assert (=> b!255019 (= lt!395940 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395830)))))))

(assert (= (and d!85702 res!213709) b!255018))

(assert (= (and b!255018 res!213710) b!255019))

(declare-fun m!384127 () Bool)

(assert (=> d!85702 m!384127))

(declare-fun m!384129 () Bool)

(assert (=> d!85702 m!384129))

(assert (=> b!254948 d!85702))

(assert (=> b!254947 d!85702))

(declare-fun d!85704 () Bool)

(declare-fun e!176701 () Bool)

(assert (=> d!85704 e!176701))

(declare-fun res!213711 () Bool)

(assert (=> d!85704 (=> (not res!213711) (not e!176701))))

(declare-fun lt!395944 () (_ BitVec 64))

(declare-fun lt!395949 () (_ BitVec 64))

(declare-fun lt!395945 () (_ BitVec 64))

(assert (=> d!85704 (= res!213711 (= lt!395949 (bvsub lt!395945 lt!395944)))))

(assert (=> d!85704 (or (= (bvand lt!395945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395944 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395945 lt!395944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85704 (= lt!395944 (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 thiss!1005))) ((_ sign_extend 32) (currentByte!12025 thiss!1005)) ((_ sign_extend 32) (currentBit!12020 thiss!1005))))))

(declare-fun lt!395947 () (_ BitVec 64))

(declare-fun lt!395948 () (_ BitVec 64))

(assert (=> d!85704 (= lt!395945 (bvmul lt!395947 lt!395948))))

(assert (=> d!85704 (or (= lt!395947 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395948 (bvsdiv (bvmul lt!395947 lt!395948) lt!395947)))))

(assert (=> d!85704 (= lt!395948 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85704 (= lt!395947 ((_ sign_extend 32) (size!6038 (buf!6552 thiss!1005))))))

(assert (=> d!85704 (= lt!395949 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12025 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12020 thiss!1005))))))

(assert (=> d!85704 (invariant!0 (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005) (size!6038 (buf!6552 thiss!1005)))))

(assert (=> d!85704 (= (bitIndex!0 (size!6038 (buf!6552 thiss!1005)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)) lt!395949)))

(declare-fun b!255020 () Bool)

(declare-fun res!213712 () Bool)

(assert (=> b!255020 (=> (not res!213712) (not e!176701))))

(assert (=> b!255020 (= res!213712 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395949))))

(declare-fun b!255021 () Bool)

(declare-fun lt!395946 () (_ BitVec 64))

(assert (=> b!255021 (= e!176701 (bvsle lt!395949 (bvmul lt!395946 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255021 (or (= lt!395946 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395946 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395946)))))

(assert (=> b!255021 (= lt!395946 ((_ sign_extend 32) (size!6038 (buf!6552 thiss!1005))))))

(assert (= (and d!85704 res!213711) b!255020))

(assert (= (and b!255020 res!213712) b!255021))

(declare-fun m!384131 () Bool)

(assert (=> d!85704 m!384131))

(declare-fun m!384133 () Bool)

(assert (=> d!85704 m!384133))

(assert (=> b!254947 d!85704))

(declare-fun d!85706 () Bool)

(assert (=> d!85706 (= (array_inv!5779 (buf!6552 thiss!1005)) (bvsge (size!6038 (buf!6552 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!254957 d!85706))

(declare-fun d!85708 () Bool)

(declare-datatypes ((tuple2!21822 0))(
  ( (tuple2!21823 (_1!11845 Bool) (_2!11845 BitStream!10998)) )
))
(declare-fun lt!395952 () tuple2!21822)

(declare-fun checkBitsLoop!0 (BitStream!10998 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21822)

(assert (=> d!85708 (= lt!395952 (checkBitsLoop!0 (_1!11840 lt!395847) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85708 (= (checkBitsLoopPure!0 (_1!11840 lt!395847) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21811 (_2!11845 lt!395952) (_1!11845 lt!395952)))))

(declare-fun bs!21620 () Bool)

(assert (= bs!21620 d!85708))

(declare-fun m!384135 () Bool)

(assert (=> bs!21620 m!384135))

(assert (=> b!254946 d!85708))

(declare-fun d!85710 () Bool)

(assert (=> d!85710 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 thiss!1005)) ((_ sign_extend 32) (currentBit!12020 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!395955 () Unit!18278)

(declare-fun choose!9 (BitStream!10998 array!13764 (_ BitVec 64) BitStream!10998) Unit!18278)

(assert (=> d!85710 (= lt!395955 (choose!9 thiss!1005 (buf!6552 (_2!11841 lt!395846)) (bvsub nBits!297 from!289) (BitStream!10999 (buf!6552 (_2!11841 lt!395846)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005))))))

(assert (=> d!85710 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6552 (_2!11841 lt!395846)) (bvsub nBits!297 from!289)) lt!395955)))

(declare-fun bs!21621 () Bool)

(assert (= bs!21621 d!85710))

(assert (=> bs!21621 m!383997))

(declare-fun m!384137 () Bool)

(assert (=> bs!21621 m!384137))

(assert (=> b!254946 d!85710))

(declare-fun b!255031 () Bool)

(declare-fun res!213722 () Bool)

(declare-fun e!176706 () Bool)

(assert (=> b!255031 (=> (not res!213722) (not e!176706))))

(declare-fun lt!395973 () tuple2!21814)

(assert (=> b!255031 (= res!213722 (isPrefixOf!0 (_2!11841 lt!395830) (_2!11841 lt!395973)))))

(declare-fun b!255030 () Bool)

(declare-fun res!213724 () Bool)

(assert (=> b!255030 (=> (not res!213724) (not e!176706))))

(declare-fun lt!395974 () (_ BitVec 64))

(declare-fun lt!395979 () (_ BitVec 64))

(assert (=> b!255030 (= res!213724 (= (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395973))) (currentByte!12025 (_2!11841 lt!395973)) (currentBit!12020 (_2!11841 lt!395973))) (bvadd lt!395974 lt!395979)))))

(assert (=> b!255030 (or (not (= (bvand lt!395974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395979 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395974 lt!395979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255030 (= lt!395979 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255030 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255030 (= lt!395974 (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395830))) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830))))))

(declare-fun b!255032 () Bool)

(declare-fun lt!395978 () tuple2!21810)

(declare-fun lt!395972 () tuple2!21812)

(assert (=> b!255032 (= e!176706 (and (_2!11839 lt!395978) (= (_1!11839 lt!395978) (_2!11840 lt!395972))))))

(assert (=> b!255032 (= lt!395978 (checkBitsLoopPure!0 (_1!11840 lt!395972) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!395975 () Unit!18278)

(declare-fun lt!395976 () Unit!18278)

(assert (=> b!255032 (= lt!395975 lt!395976)))

(declare-fun lt!395977 () (_ BitVec 64))

(assert (=> b!255032 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395973)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) lt!395977)))

(assert (=> b!255032 (= lt!395976 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11841 lt!395830) (buf!6552 (_2!11841 lt!395973)) lt!395977))))

(declare-fun e!176707 () Bool)

(assert (=> b!255032 e!176707))

(declare-fun res!213721 () Bool)

(assert (=> b!255032 (=> (not res!213721) (not e!176707))))

(assert (=> b!255032 (= res!213721 (and (= (size!6038 (buf!6552 (_2!11841 lt!395830))) (size!6038 (buf!6552 (_2!11841 lt!395973)))) (bvsge lt!395977 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255032 (= lt!395977 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255032 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255032 (= lt!395972 (reader!0 (_2!11841 lt!395830) (_2!11841 lt!395973)))))

(declare-fun b!255033 () Bool)

(assert (=> b!255033 (= e!176707 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395830)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) lt!395977))))

(declare-fun d!85712 () Bool)

(assert (=> d!85712 e!176706))

(declare-fun res!213723 () Bool)

(assert (=> d!85712 (=> (not res!213723) (not e!176706))))

(assert (=> d!85712 (= res!213723 (= (size!6038 (buf!6552 (_2!11841 lt!395830))) (size!6038 (buf!6552 (_2!11841 lt!395973)))))))

(declare-fun choose!51 (BitStream!10998 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21814)

(assert (=> d!85712 (= lt!395973 (choose!51 (_2!11841 lt!395830) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85712 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85712 (= (appendNBitsLoop!0 (_2!11841 lt!395830) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!395973)))

(assert (= (and d!85712 res!213723) b!255030))

(assert (= (and b!255030 res!213724) b!255031))

(assert (= (and b!255031 res!213722) b!255032))

(assert (= (and b!255032 res!213721) b!255033))

(declare-fun m!384139 () Bool)

(assert (=> b!255030 m!384139))

(assert (=> b!255030 m!383979))

(declare-fun m!384141 () Bool)

(assert (=> d!85712 m!384141))

(declare-fun m!384143 () Bool)

(assert (=> b!255033 m!384143))

(declare-fun m!384145 () Bool)

(assert (=> b!255031 m!384145))

(declare-fun m!384147 () Bool)

(assert (=> b!255032 m!384147))

(declare-fun m!384149 () Bool)

(assert (=> b!255032 m!384149))

(declare-fun m!384151 () Bool)

(assert (=> b!255032 m!384151))

(declare-fun m!384153 () Bool)

(assert (=> b!255032 m!384153))

(assert (=> b!254946 d!85712))

(declare-fun d!85714 () Bool)

(declare-fun e!176710 () Bool)

(assert (=> d!85714 e!176710))

(declare-fun res!213727 () Bool)

(assert (=> d!85714 (=> (not res!213727) (not e!176710))))

(declare-fun lt!395988 () tuple2!21810)

(declare-fun lt!395991 () tuple2!21810)

(assert (=> d!85714 (= res!213727 (= (bitIndex!0 (size!6038 (buf!6552 (_1!11839 lt!395988))) (currentByte!12025 (_1!11839 lt!395988)) (currentBit!12020 (_1!11839 lt!395988))) (bitIndex!0 (size!6038 (buf!6552 (_1!11839 lt!395991))) (currentByte!12025 (_1!11839 lt!395991)) (currentBit!12020 (_1!11839 lt!395991)))))))

(declare-fun lt!395989 () Unit!18278)

(declare-fun lt!395990 () BitStream!10998)

(declare-fun choose!50 (BitStream!10998 BitStream!10998 BitStream!10998 tuple2!21810 tuple2!21810 BitStream!10998 Bool tuple2!21810 tuple2!21810 BitStream!10998 Bool) Unit!18278)

(assert (=> d!85714 (= lt!395989 (choose!50 lt!395831 (_2!11841 lt!395846) lt!395990 lt!395988 (tuple2!21811 (_1!11839 lt!395988) (_2!11839 lt!395988)) (_1!11839 lt!395988) (_2!11839 lt!395988) lt!395991 (tuple2!21811 (_1!11839 lt!395991) (_2!11839 lt!395991)) (_1!11839 lt!395991) (_2!11839 lt!395991)))))

(assert (=> d!85714 (= lt!395991 (readBitPure!0 lt!395990))))

(assert (=> d!85714 (= lt!395988 (readBitPure!0 lt!395831))))

(assert (=> d!85714 (= lt!395990 (BitStream!10999 (buf!6552 (_2!11841 lt!395846)) (currentByte!12025 lt!395831) (currentBit!12020 lt!395831)))))

(assert (=> d!85714 (invariant!0 (currentBit!12020 lt!395831) (currentByte!12025 lt!395831) (size!6038 (buf!6552 (_2!11841 lt!395846))))))

(assert (=> d!85714 (= (readBitPrefixLemma!0 lt!395831 (_2!11841 lt!395846)) lt!395989)))

(declare-fun b!255036 () Bool)

(assert (=> b!255036 (= e!176710 (= (_2!11839 lt!395988) (_2!11839 lt!395991)))))

(assert (= (and d!85714 res!213727) b!255036))

(declare-fun m!384155 () Bool)

(assert (=> d!85714 m!384155))

(declare-fun m!384157 () Bool)

(assert (=> d!85714 m!384157))

(declare-fun m!384159 () Bool)

(assert (=> d!85714 m!384159))

(declare-fun m!384161 () Bool)

(assert (=> d!85714 m!384161))

(assert (=> d!85714 m!384017))

(declare-fun m!384163 () Bool)

(assert (=> d!85714 m!384163))

(assert (=> b!254946 d!85714))

(declare-fun d!85716 () Bool)

(declare-fun lt!395994 () tuple2!21822)

(declare-fun readBit!0 (BitStream!10998) tuple2!21822)

(assert (=> d!85716 (= lt!395994 (readBit!0 (_1!11840 lt!395838)))))

(assert (=> d!85716 (= (readBitPure!0 (_1!11840 lt!395838)) (tuple2!21811 (_2!11845 lt!395994) (_1!11845 lt!395994)))))

(declare-fun bs!21622 () Bool)

(assert (= bs!21622 d!85716))

(declare-fun m!384165 () Bool)

(assert (=> bs!21622 m!384165))

(assert (=> b!254946 d!85716))

(declare-fun d!85718 () Bool)

(declare-fun lt!395995 () tuple2!21822)

(assert (=> d!85718 (= lt!395995 (readBit!0 (BitStream!10999 (buf!6552 (_2!11841 lt!395846)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005))))))

(assert (=> d!85718 (= (readBitPure!0 (BitStream!10999 (buf!6552 (_2!11841 lt!395846)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005))) (tuple2!21811 (_2!11845 lt!395995) (_1!11845 lt!395995)))))

(declare-fun bs!21623 () Bool)

(assert (= bs!21623 d!85718))

(declare-fun m!384167 () Bool)

(assert (=> bs!21623 m!384167))

(assert (=> b!254946 d!85718))

(declare-fun d!85720 () Bool)

(assert (=> d!85720 (isPrefixOf!0 thiss!1005 (_2!11841 lt!395846))))

(declare-fun lt!395998 () Unit!18278)

(declare-fun choose!30 (BitStream!10998 BitStream!10998 BitStream!10998) Unit!18278)

(assert (=> d!85720 (= lt!395998 (choose!30 thiss!1005 (_2!11841 lt!395830) (_2!11841 lt!395846)))))

(assert (=> d!85720 (isPrefixOf!0 thiss!1005 (_2!11841 lt!395830))))

(assert (=> d!85720 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11841 lt!395830) (_2!11841 lt!395846)) lt!395998)))

(declare-fun bs!21624 () Bool)

(assert (= bs!21624 d!85720))

(assert (=> bs!21624 m!383995))

(declare-fun m!384169 () Bool)

(assert (=> bs!21624 m!384169))

(assert (=> bs!21624 m!384035))

(assert (=> b!254946 d!85720))

(declare-fun b!255047 () Bool)

(declare-fun e!176715 () Unit!18278)

(declare-fun lt!396057 () Unit!18278)

(assert (=> b!255047 (= e!176715 lt!396057)))

(declare-fun lt!396040 () (_ BitVec 64))

(assert (=> b!255047 (= lt!396040 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!396045 () (_ BitVec 64))

(assert (=> b!255047 (= lt!396045 (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395830))) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13764 array!13764 (_ BitVec 64) (_ BitVec 64)) Unit!18278)

(assert (=> b!255047 (= lt!396057 (arrayBitRangesEqSymmetric!0 (buf!6552 (_2!11841 lt!395830)) (buf!6552 (_2!11841 lt!395846)) lt!396040 lt!396045))))

(declare-fun arrayBitRangesEq!0 (array!13764 array!13764 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255047 (arrayBitRangesEq!0 (buf!6552 (_2!11841 lt!395846)) (buf!6552 (_2!11841 lt!395830)) lt!396040 lt!396045)))

(declare-fun d!85722 () Bool)

(declare-fun e!176716 () Bool)

(assert (=> d!85722 e!176716))

(declare-fun res!213736 () Bool)

(assert (=> d!85722 (=> (not res!213736) (not e!176716))))

(declare-fun lt!396055 () tuple2!21812)

(assert (=> d!85722 (= res!213736 (isPrefixOf!0 (_1!11840 lt!396055) (_2!11840 lt!396055)))))

(declare-fun lt!396041 () BitStream!10998)

(assert (=> d!85722 (= lt!396055 (tuple2!21813 lt!396041 (_2!11841 lt!395846)))))

(declare-fun lt!396047 () Unit!18278)

(declare-fun lt!396046 () Unit!18278)

(assert (=> d!85722 (= lt!396047 lt!396046)))

(assert (=> d!85722 (isPrefixOf!0 lt!396041 (_2!11841 lt!395846))))

(assert (=> d!85722 (= lt!396046 (lemmaIsPrefixTransitive!0 lt!396041 (_2!11841 lt!395846) (_2!11841 lt!395846)))))

(declare-fun lt!396058 () Unit!18278)

(declare-fun lt!396050 () Unit!18278)

(assert (=> d!85722 (= lt!396058 lt!396050)))

(assert (=> d!85722 (isPrefixOf!0 lt!396041 (_2!11841 lt!395846))))

(assert (=> d!85722 (= lt!396050 (lemmaIsPrefixTransitive!0 lt!396041 (_2!11841 lt!395830) (_2!11841 lt!395846)))))

(declare-fun lt!396049 () Unit!18278)

(assert (=> d!85722 (= lt!396049 e!176715)))

(declare-fun c!11761 () Bool)

(assert (=> d!85722 (= c!11761 (not (= (size!6038 (buf!6552 (_2!11841 lt!395830))) #b00000000000000000000000000000000)))))

(declare-fun lt!396056 () Unit!18278)

(declare-fun lt!396044 () Unit!18278)

(assert (=> d!85722 (= lt!396056 lt!396044)))

(assert (=> d!85722 (isPrefixOf!0 (_2!11841 lt!395846) (_2!11841 lt!395846))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10998) Unit!18278)

(assert (=> d!85722 (= lt!396044 (lemmaIsPrefixRefl!0 (_2!11841 lt!395846)))))

(declare-fun lt!396051 () Unit!18278)

(declare-fun lt!396048 () Unit!18278)

(assert (=> d!85722 (= lt!396051 lt!396048)))

(assert (=> d!85722 (= lt!396048 (lemmaIsPrefixRefl!0 (_2!11841 lt!395846)))))

(declare-fun lt!396043 () Unit!18278)

(declare-fun lt!396054 () Unit!18278)

(assert (=> d!85722 (= lt!396043 lt!396054)))

(assert (=> d!85722 (isPrefixOf!0 lt!396041 lt!396041)))

(assert (=> d!85722 (= lt!396054 (lemmaIsPrefixRefl!0 lt!396041))))

(declare-fun lt!396039 () Unit!18278)

(declare-fun lt!396042 () Unit!18278)

(assert (=> d!85722 (= lt!396039 lt!396042)))

(assert (=> d!85722 (isPrefixOf!0 (_2!11841 lt!395830) (_2!11841 lt!395830))))

(assert (=> d!85722 (= lt!396042 (lemmaIsPrefixRefl!0 (_2!11841 lt!395830)))))

(assert (=> d!85722 (= lt!396041 (BitStream!10999 (buf!6552 (_2!11841 lt!395846)) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830))))))

(assert (=> d!85722 (isPrefixOf!0 (_2!11841 lt!395830) (_2!11841 lt!395846))))

(assert (=> d!85722 (= (reader!0 (_2!11841 lt!395830) (_2!11841 lt!395846)) lt!396055)))

(declare-fun b!255048 () Bool)

(declare-fun res!213734 () Bool)

(assert (=> b!255048 (=> (not res!213734) (not e!176716))))

(assert (=> b!255048 (= res!213734 (isPrefixOf!0 (_2!11840 lt!396055) (_2!11841 lt!395846)))))

(declare-fun lt!396052 () (_ BitVec 64))

(declare-fun b!255049 () Bool)

(declare-fun lt!396053 () (_ BitVec 64))

(assert (=> b!255049 (= e!176716 (= (_1!11840 lt!396055) (withMovedBitIndex!0 (_2!11840 lt!396055) (bvsub lt!396052 lt!396053))))))

(assert (=> b!255049 (or (= (bvand lt!396052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396053 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396052 lt!396053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255049 (= lt!396053 (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395846))) (currentByte!12025 (_2!11841 lt!395846)) (currentBit!12020 (_2!11841 lt!395846))))))

(assert (=> b!255049 (= lt!396052 (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395830))) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830))))))

(declare-fun b!255050 () Bool)

(declare-fun res!213735 () Bool)

(assert (=> b!255050 (=> (not res!213735) (not e!176716))))

(assert (=> b!255050 (= res!213735 (isPrefixOf!0 (_1!11840 lt!396055) (_2!11841 lt!395830)))))

(declare-fun b!255051 () Bool)

(declare-fun Unit!18282 () Unit!18278)

(assert (=> b!255051 (= e!176715 Unit!18282)))

(assert (= (and d!85722 c!11761) b!255047))

(assert (= (and d!85722 (not c!11761)) b!255051))

(assert (= (and d!85722 res!213736) b!255050))

(assert (= (and b!255050 res!213735) b!255048))

(assert (= (and b!255048 res!213734) b!255049))

(declare-fun m!384171 () Bool)

(assert (=> b!255050 m!384171))

(declare-fun m!384173 () Bool)

(assert (=> b!255048 m!384173))

(declare-fun m!384175 () Bool)

(assert (=> b!255049 m!384175))

(assert (=> b!255049 m!383991))

(assert (=> b!255049 m!383979))

(declare-fun m!384177 () Bool)

(assert (=> d!85722 m!384177))

(declare-fun m!384179 () Bool)

(assert (=> d!85722 m!384179))

(declare-fun m!384181 () Bool)

(assert (=> d!85722 m!384181))

(declare-fun m!384183 () Bool)

(assert (=> d!85722 m!384183))

(declare-fun m!384185 () Bool)

(assert (=> d!85722 m!384185))

(declare-fun m!384187 () Bool)

(assert (=> d!85722 m!384187))

(declare-fun m!384189 () Bool)

(assert (=> d!85722 m!384189))

(declare-fun m!384191 () Bool)

(assert (=> d!85722 m!384191))

(assert (=> d!85722 m!384047))

(declare-fun m!384193 () Bool)

(assert (=> d!85722 m!384193))

(declare-fun m!384195 () Bool)

(assert (=> d!85722 m!384195))

(assert (=> b!255047 m!383979))

(declare-fun m!384197 () Bool)

(assert (=> b!255047 m!384197))

(declare-fun m!384199 () Bool)

(assert (=> b!255047 m!384199))

(assert (=> b!254946 d!85722))

(declare-fun b!255052 () Bool)

(declare-fun e!176717 () Unit!18278)

(declare-fun lt!396077 () Unit!18278)

(assert (=> b!255052 (= e!176717 lt!396077)))

(declare-fun lt!396060 () (_ BitVec 64))

(assert (=> b!255052 (= lt!396060 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!396065 () (_ BitVec 64))

(assert (=> b!255052 (= lt!396065 (bitIndex!0 (size!6038 (buf!6552 thiss!1005)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)))))

(assert (=> b!255052 (= lt!396077 (arrayBitRangesEqSymmetric!0 (buf!6552 thiss!1005) (buf!6552 (_2!11841 lt!395846)) lt!396060 lt!396065))))

(assert (=> b!255052 (arrayBitRangesEq!0 (buf!6552 (_2!11841 lt!395846)) (buf!6552 thiss!1005) lt!396060 lt!396065)))

(declare-fun d!85724 () Bool)

(declare-fun e!176718 () Bool)

(assert (=> d!85724 e!176718))

(declare-fun res!213739 () Bool)

(assert (=> d!85724 (=> (not res!213739) (not e!176718))))

(declare-fun lt!396075 () tuple2!21812)

(assert (=> d!85724 (= res!213739 (isPrefixOf!0 (_1!11840 lt!396075) (_2!11840 lt!396075)))))

(declare-fun lt!396061 () BitStream!10998)

(assert (=> d!85724 (= lt!396075 (tuple2!21813 lt!396061 (_2!11841 lt!395846)))))

(declare-fun lt!396067 () Unit!18278)

(declare-fun lt!396066 () Unit!18278)

(assert (=> d!85724 (= lt!396067 lt!396066)))

(assert (=> d!85724 (isPrefixOf!0 lt!396061 (_2!11841 lt!395846))))

(assert (=> d!85724 (= lt!396066 (lemmaIsPrefixTransitive!0 lt!396061 (_2!11841 lt!395846) (_2!11841 lt!395846)))))

(declare-fun lt!396078 () Unit!18278)

(declare-fun lt!396070 () Unit!18278)

(assert (=> d!85724 (= lt!396078 lt!396070)))

(assert (=> d!85724 (isPrefixOf!0 lt!396061 (_2!11841 lt!395846))))

(assert (=> d!85724 (= lt!396070 (lemmaIsPrefixTransitive!0 lt!396061 thiss!1005 (_2!11841 lt!395846)))))

(declare-fun lt!396069 () Unit!18278)

(assert (=> d!85724 (= lt!396069 e!176717)))

(declare-fun c!11762 () Bool)

(assert (=> d!85724 (= c!11762 (not (= (size!6038 (buf!6552 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!396076 () Unit!18278)

(declare-fun lt!396064 () Unit!18278)

(assert (=> d!85724 (= lt!396076 lt!396064)))

(assert (=> d!85724 (isPrefixOf!0 (_2!11841 lt!395846) (_2!11841 lt!395846))))

(assert (=> d!85724 (= lt!396064 (lemmaIsPrefixRefl!0 (_2!11841 lt!395846)))))

(declare-fun lt!396071 () Unit!18278)

(declare-fun lt!396068 () Unit!18278)

(assert (=> d!85724 (= lt!396071 lt!396068)))

(assert (=> d!85724 (= lt!396068 (lemmaIsPrefixRefl!0 (_2!11841 lt!395846)))))

(declare-fun lt!396063 () Unit!18278)

(declare-fun lt!396074 () Unit!18278)

(assert (=> d!85724 (= lt!396063 lt!396074)))

(assert (=> d!85724 (isPrefixOf!0 lt!396061 lt!396061)))

(assert (=> d!85724 (= lt!396074 (lemmaIsPrefixRefl!0 lt!396061))))

(declare-fun lt!396059 () Unit!18278)

(declare-fun lt!396062 () Unit!18278)

(assert (=> d!85724 (= lt!396059 lt!396062)))

(assert (=> d!85724 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85724 (= lt!396062 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!85724 (= lt!396061 (BitStream!10999 (buf!6552 (_2!11841 lt!395846)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)))))

(assert (=> d!85724 (isPrefixOf!0 thiss!1005 (_2!11841 lt!395846))))

(assert (=> d!85724 (= (reader!0 thiss!1005 (_2!11841 lt!395846)) lt!396075)))

(declare-fun b!255053 () Bool)

(declare-fun res!213737 () Bool)

(assert (=> b!255053 (=> (not res!213737) (not e!176718))))

(assert (=> b!255053 (= res!213737 (isPrefixOf!0 (_2!11840 lt!396075) (_2!11841 lt!395846)))))

(declare-fun lt!396073 () (_ BitVec 64))

(declare-fun b!255054 () Bool)

(declare-fun lt!396072 () (_ BitVec 64))

(assert (=> b!255054 (= e!176718 (= (_1!11840 lt!396075) (withMovedBitIndex!0 (_2!11840 lt!396075) (bvsub lt!396072 lt!396073))))))

(assert (=> b!255054 (or (= (bvand lt!396072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396072 lt!396073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255054 (= lt!396073 (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395846))) (currentByte!12025 (_2!11841 lt!395846)) (currentBit!12020 (_2!11841 lt!395846))))))

(assert (=> b!255054 (= lt!396072 (bitIndex!0 (size!6038 (buf!6552 thiss!1005)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)))))

(declare-fun b!255055 () Bool)

(declare-fun res!213738 () Bool)

(assert (=> b!255055 (=> (not res!213738) (not e!176718))))

(assert (=> b!255055 (= res!213738 (isPrefixOf!0 (_1!11840 lt!396075) thiss!1005))))

(declare-fun b!255056 () Bool)

(declare-fun Unit!18283 () Unit!18278)

(assert (=> b!255056 (= e!176717 Unit!18283)))

(assert (= (and d!85724 c!11762) b!255052))

(assert (= (and d!85724 (not c!11762)) b!255056))

(assert (= (and d!85724 res!213739) b!255055))

(assert (= (and b!255055 res!213738) b!255053))

(assert (= (and b!255053 res!213737) b!255054))

(declare-fun m!384201 () Bool)

(assert (=> b!255055 m!384201))

(declare-fun m!384203 () Bool)

(assert (=> b!255053 m!384203))

(declare-fun m!384205 () Bool)

(assert (=> b!255054 m!384205))

(assert (=> b!255054 m!383991))

(assert (=> b!255054 m!383981))

(assert (=> d!85724 m!384177))

(declare-fun m!384207 () Bool)

(assert (=> d!85724 m!384207))

(declare-fun m!384209 () Bool)

(assert (=> d!85724 m!384209))

(declare-fun m!384211 () Bool)

(assert (=> d!85724 m!384211))

(assert (=> d!85724 m!384185))

(declare-fun m!384213 () Bool)

(assert (=> d!85724 m!384213))

(declare-fun m!384215 () Bool)

(assert (=> d!85724 m!384215))

(declare-fun m!384217 () Bool)

(assert (=> d!85724 m!384217))

(assert (=> d!85724 m!383995))

(declare-fun m!384219 () Bool)

(assert (=> d!85724 m!384219))

(declare-fun m!384221 () Bool)

(assert (=> d!85724 m!384221))

(assert (=> b!255052 m!383981))

(declare-fun m!384223 () Bool)

(assert (=> b!255052 m!384223))

(declare-fun m!384225 () Bool)

(assert (=> b!255052 m!384225))

(assert (=> b!254946 d!85724))

(declare-fun d!85726 () Bool)

(declare-fun e!176719 () Bool)

(assert (=> d!85726 e!176719))

(declare-fun res!213740 () Bool)

(assert (=> d!85726 (=> (not res!213740) (not e!176719))))

(declare-fun lt!396079 () (_ BitVec 64))

(declare-fun lt!396084 () (_ BitVec 64))

(declare-fun lt!396080 () (_ BitVec 64))

(assert (=> d!85726 (= res!213740 (= lt!396084 (bvsub lt!396080 lt!396079)))))

(assert (=> d!85726 (or (= (bvand lt!396080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396079 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396080 lt!396079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85726 (= lt!396079 (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 (_1!11839 lt!395828)))) ((_ sign_extend 32) (currentByte!12025 (_1!11839 lt!395828))) ((_ sign_extend 32) (currentBit!12020 (_1!11839 lt!395828)))))))

(declare-fun lt!396082 () (_ BitVec 64))

(declare-fun lt!396083 () (_ BitVec 64))

(assert (=> d!85726 (= lt!396080 (bvmul lt!396082 lt!396083))))

(assert (=> d!85726 (or (= lt!396082 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396083 (bvsdiv (bvmul lt!396082 lt!396083) lt!396082)))))

(assert (=> d!85726 (= lt!396083 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85726 (= lt!396082 ((_ sign_extend 32) (size!6038 (buf!6552 (_1!11839 lt!395828)))))))

(assert (=> d!85726 (= lt!396084 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12025 (_1!11839 lt!395828))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12020 (_1!11839 lt!395828)))))))

(assert (=> d!85726 (invariant!0 (currentBit!12020 (_1!11839 lt!395828)) (currentByte!12025 (_1!11839 lt!395828)) (size!6038 (buf!6552 (_1!11839 lt!395828))))))

(assert (=> d!85726 (= (bitIndex!0 (size!6038 (buf!6552 (_1!11839 lt!395828))) (currentByte!12025 (_1!11839 lt!395828)) (currentBit!12020 (_1!11839 lt!395828))) lt!396084)))

(declare-fun b!255057 () Bool)

(declare-fun res!213741 () Bool)

(assert (=> b!255057 (=> (not res!213741) (not e!176719))))

(assert (=> b!255057 (= res!213741 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396084))))

(declare-fun b!255058 () Bool)

(declare-fun lt!396081 () (_ BitVec 64))

(assert (=> b!255058 (= e!176719 (bvsle lt!396084 (bvmul lt!396081 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255058 (or (= lt!396081 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396081 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396081)))))

(assert (=> b!255058 (= lt!396081 ((_ sign_extend 32) (size!6038 (buf!6552 (_1!11839 lt!395828)))))))

(assert (= (and d!85726 res!213740) b!255057))

(assert (= (and b!255057 res!213741) b!255058))

(declare-fun m!384227 () Bool)

(assert (=> d!85726 m!384227))

(declare-fun m!384229 () Bool)

(assert (=> d!85726 m!384229))

(assert (=> b!254946 d!85726))

(declare-fun d!85728 () Bool)

(assert (=> d!85728 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) lt!395840)))

(declare-fun lt!396085 () Unit!18278)

(assert (=> d!85728 (= lt!396085 (choose!9 (_2!11841 lt!395830) (buf!6552 (_2!11841 lt!395846)) lt!395840 (BitStream!10999 (buf!6552 (_2!11841 lt!395846)) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830)))))))

(assert (=> d!85728 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11841 lt!395830) (buf!6552 (_2!11841 lt!395846)) lt!395840) lt!396085)))

(declare-fun bs!21625 () Bool)

(assert (= bs!21625 d!85728))

(assert (=> bs!21625 m!384019))

(declare-fun m!384231 () Bool)

(assert (=> bs!21625 m!384231))

(assert (=> b!254946 d!85728))

(declare-fun d!85730 () Bool)

(declare-fun lt!396086 () tuple2!21822)

(assert (=> d!85730 (= lt!396086 (readBit!0 lt!395831))))

(assert (=> d!85730 (= (readBitPure!0 lt!395831) (tuple2!21811 (_2!11845 lt!396086) (_1!11845 lt!396086)))))

(declare-fun bs!21626 () Bool)

(assert (= bs!21626 d!85730))

(declare-fun m!384233 () Bool)

(assert (=> bs!21626 m!384233))

(assert (=> b!254946 d!85730))

(declare-fun d!85732 () Bool)

(declare-fun e!176720 () Bool)

(assert (=> d!85732 e!176720))

(declare-fun res!213742 () Bool)

(assert (=> d!85732 (=> (not res!213742) (not e!176720))))

(declare-fun lt!396087 () (_ BitVec 64))

(declare-fun lt!396088 () (_ BitVec 64))

(declare-fun lt!396092 () (_ BitVec 64))

(assert (=> d!85732 (= res!213742 (= lt!396092 (bvsub lt!396088 lt!396087)))))

(assert (=> d!85732 (or (= (bvand lt!396088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396087 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396088 lt!396087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85732 (= lt!396087 (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 (_1!11839 lt!395835)))) ((_ sign_extend 32) (currentByte!12025 (_1!11839 lt!395835))) ((_ sign_extend 32) (currentBit!12020 (_1!11839 lt!395835)))))))

(declare-fun lt!396090 () (_ BitVec 64))

(declare-fun lt!396091 () (_ BitVec 64))

(assert (=> d!85732 (= lt!396088 (bvmul lt!396090 lt!396091))))

(assert (=> d!85732 (or (= lt!396090 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396091 (bvsdiv (bvmul lt!396090 lt!396091) lt!396090)))))

(assert (=> d!85732 (= lt!396091 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85732 (= lt!396090 ((_ sign_extend 32) (size!6038 (buf!6552 (_1!11839 lt!395835)))))))

(assert (=> d!85732 (= lt!396092 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12025 (_1!11839 lt!395835))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12020 (_1!11839 lt!395835)))))))

(assert (=> d!85732 (invariant!0 (currentBit!12020 (_1!11839 lt!395835)) (currentByte!12025 (_1!11839 lt!395835)) (size!6038 (buf!6552 (_1!11839 lt!395835))))))

(assert (=> d!85732 (= (bitIndex!0 (size!6038 (buf!6552 (_1!11839 lt!395835))) (currentByte!12025 (_1!11839 lt!395835)) (currentBit!12020 (_1!11839 lt!395835))) lt!396092)))

(declare-fun b!255059 () Bool)

(declare-fun res!213743 () Bool)

(assert (=> b!255059 (=> (not res!213743) (not e!176720))))

(assert (=> b!255059 (= res!213743 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396092))))

(declare-fun b!255060 () Bool)

(declare-fun lt!396089 () (_ BitVec 64))

(assert (=> b!255060 (= e!176720 (bvsle lt!396092 (bvmul lt!396089 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255060 (or (= lt!396089 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396089 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396089)))))

(assert (=> b!255060 (= lt!396089 ((_ sign_extend 32) (size!6038 (buf!6552 (_1!11839 lt!395835)))))))

(assert (= (and d!85732 res!213742) b!255059))

(assert (= (and b!255059 res!213743) b!255060))

(declare-fun m!384235 () Bool)

(assert (=> d!85732 m!384235))

(declare-fun m!384237 () Bool)

(assert (=> d!85732 m!384237))

(assert (=> b!254946 d!85732))

(declare-fun d!85734 () Bool)

(assert (=> d!85734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 thiss!1005)) ((_ sign_extend 32) (currentBit!12020 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 thiss!1005)) ((_ sign_extend 32) (currentBit!12020 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21627 () Bool)

(assert (= bs!21627 d!85734))

(declare-fun m!384239 () Bool)

(assert (=> bs!21627 m!384239))

(assert (=> b!254946 d!85734))

(declare-fun b!255070 () Bool)

(declare-fun res!213754 () Bool)

(declare-fun e!176725 () Bool)

(assert (=> b!255070 (=> (not res!213754) (not e!176725))))

(declare-fun lt!396102 () tuple2!21814)

(declare-fun lt!396101 () (_ BitVec 64))

(declare-fun lt!396103 () (_ BitVec 64))

(assert (=> b!255070 (= res!213754 (= (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!396102))) (currentByte!12025 (_2!11841 lt!396102)) (currentBit!12020 (_2!11841 lt!396102))) (bvadd lt!396103 lt!396101)))))

(assert (=> b!255070 (or (not (= (bvand lt!396103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396101 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!396103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!396103 lt!396101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!255070 (= lt!396101 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!255070 (= lt!396103 (bitIndex!0 (size!6038 (buf!6552 thiss!1005)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)))))

(declare-fun b!255073 () Bool)

(declare-fun e!176726 () Bool)

(declare-fun lt!396104 () tuple2!21810)

(assert (=> b!255073 (= e!176726 (= (bitIndex!0 (size!6038 (buf!6552 (_1!11839 lt!396104))) (currentByte!12025 (_1!11839 lt!396104)) (currentBit!12020 (_1!11839 lt!396104))) (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!396102))) (currentByte!12025 (_2!11841 lt!396102)) (currentBit!12020 (_2!11841 lt!396102)))))))

(declare-fun b!255072 () Bool)

(assert (=> b!255072 (= e!176725 e!176726)))

(declare-fun res!213755 () Bool)

(assert (=> b!255072 (=> (not res!213755) (not e!176726))))

(assert (=> b!255072 (= res!213755 (and (= (_2!11839 lt!396104) bit!26) (= (_1!11839 lt!396104) (_2!11841 lt!396102))))))

(assert (=> b!255072 (= lt!396104 (readBitPure!0 (readerFrom!0 (_2!11841 lt!396102) (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005))))))

(declare-fun d!85736 () Bool)

(assert (=> d!85736 e!176725))

(declare-fun res!213752 () Bool)

(assert (=> d!85736 (=> (not res!213752) (not e!176725))))

(assert (=> d!85736 (= res!213752 (= (size!6038 (buf!6552 thiss!1005)) (size!6038 (buf!6552 (_2!11841 lt!396102)))))))

(declare-fun choose!16 (BitStream!10998 Bool) tuple2!21814)

(assert (=> d!85736 (= lt!396102 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!85736 (validate_offset_bit!0 ((_ sign_extend 32) (size!6038 (buf!6552 thiss!1005))) ((_ sign_extend 32) (currentByte!12025 thiss!1005)) ((_ sign_extend 32) (currentBit!12020 thiss!1005)))))

(assert (=> d!85736 (= (appendBit!0 thiss!1005 bit!26) lt!396102)))

(declare-fun b!255071 () Bool)

(declare-fun res!213753 () Bool)

(assert (=> b!255071 (=> (not res!213753) (not e!176725))))

(assert (=> b!255071 (= res!213753 (isPrefixOf!0 thiss!1005 (_2!11841 lt!396102)))))

(assert (= (and d!85736 res!213752) b!255070))

(assert (= (and b!255070 res!213754) b!255071))

(assert (= (and b!255071 res!213753) b!255072))

(assert (= (and b!255072 res!213755) b!255073))

(declare-fun m!384241 () Bool)

(assert (=> b!255073 m!384241))

(declare-fun m!384243 () Bool)

(assert (=> b!255073 m!384243))

(assert (=> b!255070 m!384243))

(assert (=> b!255070 m!383981))

(declare-fun m!384245 () Bool)

(assert (=> b!255072 m!384245))

(assert (=> b!255072 m!384245))

(declare-fun m!384247 () Bool)

(assert (=> b!255072 m!384247))

(declare-fun m!384249 () Bool)

(assert (=> b!255071 m!384249))

(declare-fun m!384251 () Bool)

(assert (=> d!85736 m!384251))

(declare-fun m!384253 () Bool)

(assert (=> d!85736 m!384253))

(assert (=> b!254946 d!85736))

(declare-fun d!85738 () Bool)

(declare-fun e!176729 () Bool)

(assert (=> d!85738 e!176729))

(declare-fun res!213758 () Bool)

(assert (=> d!85738 (=> (not res!213758) (not e!176729))))

(assert (=> d!85738 (= res!213758 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!396107 () Unit!18278)

(declare-fun choose!27 (BitStream!10998 BitStream!10998 (_ BitVec 64) (_ BitVec 64)) Unit!18278)

(assert (=> d!85738 (= lt!396107 (choose!27 thiss!1005 (_2!11841 lt!395830) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!85738 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!85738 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11841 lt!395830) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!396107)))

(declare-fun b!255076 () Bool)

(assert (=> b!255076 (= e!176729 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395830)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!85738 res!213758) b!255076))

(declare-fun m!384255 () Bool)

(assert (=> d!85738 m!384255))

(declare-fun m!384257 () Bool)

(assert (=> b!255076 m!384257))

(assert (=> b!254946 d!85738))

(declare-fun lt!396108 () tuple2!21822)

(declare-fun d!85740 () Bool)

(assert (=> d!85740 (= lt!396108 (checkBitsLoop!0 (_1!11840 lt!395838) nBits!297 bit!26 from!289))))

(assert (=> d!85740 (= (checkBitsLoopPure!0 (_1!11840 lt!395838) nBits!297 bit!26 from!289) (tuple2!21811 (_2!11845 lt!396108) (_1!11845 lt!396108)))))

(declare-fun bs!21628 () Bool)

(assert (= bs!21628 d!85740))

(declare-fun m!384259 () Bool)

(assert (=> bs!21628 m!384259))

(assert (=> b!254946 d!85740))

(declare-fun d!85742 () Bool)

(assert (=> d!85742 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395830)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) lt!395840) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395830)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830)))) lt!395840))))

(declare-fun bs!21629 () Bool)

(assert (= bs!21629 d!85742))

(assert (=> bs!21629 m!384127))

(assert (=> b!254946 d!85742))

(declare-fun d!85744 () Bool)

(assert (=> d!85744 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) lt!395840) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830)))) lt!395840))))

(declare-fun bs!21630 () Bool)

(assert (= bs!21630 d!85744))

(declare-fun m!384261 () Bool)

(assert (=> bs!21630 m!384261))

(assert (=> b!254946 d!85744))

(declare-fun d!85746 () Bool)

(declare-fun res!213766 () Bool)

(declare-fun e!176735 () Bool)

(assert (=> d!85746 (=> (not res!213766) (not e!176735))))

(assert (=> d!85746 (= res!213766 (= (size!6038 (buf!6552 thiss!1005)) (size!6038 (buf!6552 (_2!11841 lt!395846)))))))

(assert (=> d!85746 (= (isPrefixOf!0 thiss!1005 (_2!11841 lt!395846)) e!176735)))

(declare-fun b!255083 () Bool)

(declare-fun res!213765 () Bool)

(assert (=> b!255083 (=> (not res!213765) (not e!176735))))

(assert (=> b!255083 (= res!213765 (bvsle (bitIndex!0 (size!6038 (buf!6552 thiss!1005)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)) (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395846))) (currentByte!12025 (_2!11841 lt!395846)) (currentBit!12020 (_2!11841 lt!395846)))))))

(declare-fun b!255084 () Bool)

(declare-fun e!176734 () Bool)

(assert (=> b!255084 (= e!176735 e!176734)))

(declare-fun res!213767 () Bool)

(assert (=> b!255084 (=> res!213767 e!176734)))

(assert (=> b!255084 (= res!213767 (= (size!6038 (buf!6552 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!255085 () Bool)

(assert (=> b!255085 (= e!176734 (arrayBitRangesEq!0 (buf!6552 thiss!1005) (buf!6552 (_2!11841 lt!395846)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6038 (buf!6552 thiss!1005)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005))))))

(assert (= (and d!85746 res!213766) b!255083))

(assert (= (and b!255083 res!213765) b!255084))

(assert (= (and b!255084 (not res!213767)) b!255085))

(assert (=> b!255083 m!383981))

(assert (=> b!255083 m!383991))

(assert (=> b!255085 m!383981))

(assert (=> b!255085 m!383981))

(declare-fun m!384263 () Bool)

(assert (=> b!255085 m!384263))

(assert (=> b!254946 d!85746))

(declare-fun d!85748 () Bool)

(declare-fun e!176738 () Bool)

(assert (=> d!85748 e!176738))

(declare-fun res!213770 () Bool)

(assert (=> d!85748 (=> (not res!213770) (not e!176738))))

(declare-fun lt!396114 () (_ BitVec 64))

(declare-fun lt!396113 () BitStream!10998)

(assert (=> d!85748 (= res!213770 (= (bvadd lt!396114 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6038 (buf!6552 lt!396113)) (currentByte!12025 lt!396113) (currentBit!12020 lt!396113))))))

(assert (=> d!85748 (or (not (= (bvand lt!396114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!396114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!396114 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85748 (= lt!396114 (bitIndex!0 (size!6038 (buf!6552 (_1!11840 lt!395838))) (currentByte!12025 (_1!11840 lt!395838)) (currentBit!12020 (_1!11840 lt!395838))))))

(declare-fun moveBitIndex!0 (BitStream!10998 (_ BitVec 64)) tuple2!21814)

(assert (=> d!85748 (= lt!396113 (_2!11841 (moveBitIndex!0 (_1!11840 lt!395838) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10998 (_ BitVec 64)) Bool)

(assert (=> d!85748 (moveBitIndexPrecond!0 (_1!11840 lt!395838) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!85748 (= (withMovedBitIndex!0 (_1!11840 lt!395838) #b0000000000000000000000000000000000000000000000000000000000000001) lt!396113)))

(declare-fun b!255088 () Bool)

(assert (=> b!255088 (= e!176738 (= (size!6038 (buf!6552 (_1!11840 lt!395838))) (size!6038 (buf!6552 lt!396113))))))

(assert (= (and d!85748 res!213770) b!255088))

(declare-fun m!384265 () Bool)

(assert (=> d!85748 m!384265))

(declare-fun m!384267 () Bool)

(assert (=> d!85748 m!384267))

(declare-fun m!384269 () Bool)

(assert (=> d!85748 m!384269))

(declare-fun m!384271 () Bool)

(assert (=> d!85748 m!384271))

(assert (=> b!254950 d!85748))

(assert (=> b!254960 d!85704))

(declare-fun d!85750 () Bool)

(assert (=> d!85750 (= (invariant!0 (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005) (size!6038 (buf!6552 (_2!11841 lt!395830)))) (and (bvsge (currentBit!12020 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12020 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12025 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12025 thiss!1005) (size!6038 (buf!6552 (_2!11841 lt!395830)))) (and (= (currentBit!12020 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12025 thiss!1005) (size!6038 (buf!6552 (_2!11841 lt!395830))))))))))

(assert (=> b!254959 d!85750))

(declare-fun d!85752 () Bool)

(declare-fun res!213772 () Bool)

(declare-fun e!176740 () Bool)

(assert (=> d!85752 (=> (not res!213772) (not e!176740))))

(assert (=> d!85752 (= res!213772 (= (size!6038 (buf!6552 thiss!1005)) (size!6038 (buf!6552 (_2!11841 lt!395830)))))))

(assert (=> d!85752 (= (isPrefixOf!0 thiss!1005 (_2!11841 lt!395830)) e!176740)))

(declare-fun b!255089 () Bool)

(declare-fun res!213771 () Bool)

(assert (=> b!255089 (=> (not res!213771) (not e!176740))))

(assert (=> b!255089 (= res!213771 (bvsle (bitIndex!0 (size!6038 (buf!6552 thiss!1005)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)) (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395830))) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830)))))))

(declare-fun b!255090 () Bool)

(declare-fun e!176739 () Bool)

(assert (=> b!255090 (= e!176740 e!176739)))

(declare-fun res!213773 () Bool)

(assert (=> b!255090 (=> res!213773 e!176739)))

(assert (=> b!255090 (= res!213773 (= (size!6038 (buf!6552 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!255091 () Bool)

(assert (=> b!255091 (= e!176739 (arrayBitRangesEq!0 (buf!6552 thiss!1005) (buf!6552 (_2!11841 lt!395830)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6038 (buf!6552 thiss!1005)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005))))))

(assert (= (and d!85752 res!213772) b!255089))

(assert (= (and b!255089 res!213771) b!255090))

(assert (= (and b!255090 (not res!213773)) b!255091))

(assert (=> b!255089 m!383981))

(assert (=> b!255089 m!383979))

(assert (=> b!255091 m!383981))

(assert (=> b!255091 m!383981))

(declare-fun m!384273 () Bool)

(assert (=> b!255091 m!384273))

(assert (=> b!254953 d!85752))

(declare-fun d!85754 () Bool)

(declare-fun e!176741 () Bool)

(assert (=> d!85754 e!176741))

(declare-fun res!213774 () Bool)

(assert (=> d!85754 (=> (not res!213774) (not e!176741))))

(declare-fun lt!396116 () (_ BitVec 64))

(declare-fun lt!396120 () (_ BitVec 64))

(declare-fun lt!396115 () (_ BitVec 64))

(assert (=> d!85754 (= res!213774 (= lt!396120 (bvsub lt!396116 lt!396115)))))

(assert (=> d!85754 (or (= (bvand lt!396116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!396115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396116 lt!396115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85754 (= lt!396115 (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 (_1!11839 lt!395845)))) ((_ sign_extend 32) (currentByte!12025 (_1!11839 lt!395845))) ((_ sign_extend 32) (currentBit!12020 (_1!11839 lt!395845)))))))

(declare-fun lt!396118 () (_ BitVec 64))

(declare-fun lt!396119 () (_ BitVec 64))

(assert (=> d!85754 (= lt!396116 (bvmul lt!396118 lt!396119))))

(assert (=> d!85754 (or (= lt!396118 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!396119 (bvsdiv (bvmul lt!396118 lt!396119) lt!396118)))))

(assert (=> d!85754 (= lt!396119 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85754 (= lt!396118 ((_ sign_extend 32) (size!6038 (buf!6552 (_1!11839 lt!395845)))))))

(assert (=> d!85754 (= lt!396120 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12025 (_1!11839 lt!395845))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12020 (_1!11839 lt!395845)))))))

(assert (=> d!85754 (invariant!0 (currentBit!12020 (_1!11839 lt!395845)) (currentByte!12025 (_1!11839 lt!395845)) (size!6038 (buf!6552 (_1!11839 lt!395845))))))

(assert (=> d!85754 (= (bitIndex!0 (size!6038 (buf!6552 (_1!11839 lt!395845))) (currentByte!12025 (_1!11839 lt!395845)) (currentBit!12020 (_1!11839 lt!395845))) lt!396120)))

(declare-fun b!255092 () Bool)

(declare-fun res!213775 () Bool)

(assert (=> b!255092 (=> (not res!213775) (not e!176741))))

(assert (=> b!255092 (= res!213775 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!396120))))

(declare-fun b!255093 () Bool)

(declare-fun lt!396117 () (_ BitVec 64))

(assert (=> b!255093 (= e!176741 (bvsle lt!396120 (bvmul lt!396117 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!255093 (or (= lt!396117 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!396117 #b0000000000000000000000000000000000000000000000000000000000001000) lt!396117)))))

(assert (=> b!255093 (= lt!396117 ((_ sign_extend 32) (size!6038 (buf!6552 (_1!11839 lt!395845)))))))

(assert (= (and d!85754 res!213774) b!255092))

(assert (= (and b!255092 res!213775) b!255093))

(declare-fun m!384275 () Bool)

(assert (=> d!85754 m!384275))

(declare-fun m!384277 () Bool)

(assert (=> d!85754 m!384277))

(assert (=> b!254952 d!85754))

(declare-fun d!85756 () Bool)

(declare-fun res!213777 () Bool)

(declare-fun e!176743 () Bool)

(assert (=> d!85756 (=> (not res!213777) (not e!176743))))

(assert (=> d!85756 (= res!213777 (= (size!6038 (buf!6552 (_2!11841 lt!395830))) (size!6038 (buf!6552 (_2!11841 lt!395846)))))))

(assert (=> d!85756 (= (isPrefixOf!0 (_2!11841 lt!395830) (_2!11841 lt!395846)) e!176743)))

(declare-fun b!255094 () Bool)

(declare-fun res!213776 () Bool)

(assert (=> b!255094 (=> (not res!213776) (not e!176743))))

(assert (=> b!255094 (= res!213776 (bvsle (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395830))) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830))) (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395846))) (currentByte!12025 (_2!11841 lt!395846)) (currentBit!12020 (_2!11841 lt!395846)))))))

(declare-fun b!255095 () Bool)

(declare-fun e!176742 () Bool)

(assert (=> b!255095 (= e!176743 e!176742)))

(declare-fun res!213778 () Bool)

(assert (=> b!255095 (=> res!213778 e!176742)))

(assert (=> b!255095 (= res!213778 (= (size!6038 (buf!6552 (_2!11841 lt!395830))) #b00000000000000000000000000000000))))

(declare-fun b!255096 () Bool)

(assert (=> b!255096 (= e!176742 (arrayBitRangesEq!0 (buf!6552 (_2!11841 lt!395830)) (buf!6552 (_2!11841 lt!395846)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6038 (buf!6552 (_2!11841 lt!395830))) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830)))))))

(assert (= (and d!85756 res!213777) b!255094))

(assert (= (and b!255094 res!213776) b!255095))

(assert (= (and b!255095 (not res!213778)) b!255096))

(assert (=> b!255094 m!383979))

(assert (=> b!255094 m!383991))

(assert (=> b!255096 m!383979))

(assert (=> b!255096 m!383979))

(declare-fun m!384279 () Bool)

(assert (=> b!255096 m!384279))

(assert (=> b!254951 d!85756))

(declare-fun lt!396121 () tuple2!21822)

(declare-fun d!85758 () Bool)

(assert (=> d!85758 (= lt!396121 (checkBitsLoop!0 (_1!11840 lt!395842) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85758 (= (checkBitsLoopPure!0 (_1!11840 lt!395842) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21811 (_2!11845 lt!396121) (_1!11845 lt!396121)))))

(declare-fun bs!21631 () Bool)

(assert (= bs!21631 d!85758))

(declare-fun m!384281 () Bool)

(assert (=> bs!21631 m!384281))

(assert (=> b!254956 d!85758))

(declare-fun d!85760 () Bool)

(assert (=> d!85760 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) lt!395836) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830)))) lt!395836))))

(declare-fun bs!21632 () Bool)

(assert (= bs!21632 d!85760))

(assert (=> bs!21632 m!384261))

(assert (=> b!254956 d!85760))

(declare-fun d!85762 () Bool)

(assert (=> d!85762 (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 (_2!11841 lt!395846)))) ((_ sign_extend 32) (currentByte!12025 (_2!11841 lt!395830))) ((_ sign_extend 32) (currentBit!12020 (_2!11841 lt!395830))) lt!395836)))

(declare-fun lt!396122 () Unit!18278)

(assert (=> d!85762 (= lt!396122 (choose!9 (_2!11841 lt!395830) (buf!6552 (_2!11841 lt!395846)) lt!395836 (BitStream!10999 (buf!6552 (_2!11841 lt!395846)) (currentByte!12025 (_2!11841 lt!395830)) (currentBit!12020 (_2!11841 lt!395830)))))))

(assert (=> d!85762 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11841 lt!395830) (buf!6552 (_2!11841 lt!395846)) lt!395836) lt!396122)))

(declare-fun bs!21633 () Bool)

(assert (= bs!21633 d!85762))

(assert (=> bs!21633 m!384041))

(declare-fun m!384283 () Bool)

(assert (=> bs!21633 m!384283))

(assert (=> b!254956 d!85762))

(assert (=> b!254956 d!85722))

(declare-fun d!85764 () Bool)

(declare-fun lt!396123 () tuple2!21822)

(assert (=> d!85764 (= lt!396123 (readBit!0 (readerFrom!0 (_2!11841 lt!395830) (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005))))))

(assert (=> d!85764 (= (readBitPure!0 (readerFrom!0 (_2!11841 lt!395830) (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005))) (tuple2!21811 (_2!11845 lt!396123) (_1!11845 lt!396123)))))

(declare-fun bs!21634 () Bool)

(assert (= bs!21634 d!85764))

(assert (=> bs!21634 m!383987))

(declare-fun m!384285 () Bool)

(assert (=> bs!21634 m!384285))

(assert (=> b!254955 d!85764))

(declare-fun d!85766 () Bool)

(declare-fun e!176746 () Bool)

(assert (=> d!85766 e!176746))

(declare-fun res!213782 () Bool)

(assert (=> d!85766 (=> (not res!213782) (not e!176746))))

(assert (=> d!85766 (= res!213782 (invariant!0 (currentBit!12020 (_2!11841 lt!395830)) (currentByte!12025 (_2!11841 lt!395830)) (size!6038 (buf!6552 (_2!11841 lt!395830)))))))

(assert (=> d!85766 (= (readerFrom!0 (_2!11841 lt!395830) (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005)) (BitStream!10999 (buf!6552 (_2!11841 lt!395830)) (currentByte!12025 thiss!1005) (currentBit!12020 thiss!1005)))))

(declare-fun b!255099 () Bool)

(assert (=> b!255099 (= e!176746 (invariant!0 (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005) (size!6038 (buf!6552 (_2!11841 lt!395830)))))))

(assert (= (and d!85766 res!213782) b!255099))

(assert (=> d!85766 m!384129))

(assert (=> b!255099 m!383977))

(assert (=> b!254955 d!85766))

(declare-fun d!85768 () Bool)

(assert (=> d!85768 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6038 (buf!6552 thiss!1005))) ((_ sign_extend 32) (currentByte!12025 thiss!1005)) ((_ sign_extend 32) (currentBit!12020 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6038 (buf!6552 thiss!1005))) ((_ sign_extend 32) (currentByte!12025 thiss!1005)) ((_ sign_extend 32) (currentBit!12020 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21635 () Bool)

(assert (= bs!21635 d!85768))

(assert (=> bs!21635 m!384131))

(assert (=> b!254944 d!85768))

(declare-fun d!85770 () Bool)

(assert (=> d!85770 (= (inv!12 thiss!1005) (invariant!0 (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005) (size!6038 (buf!6552 thiss!1005))))))

(declare-fun bs!21636 () Bool)

(assert (= bs!21636 d!85770))

(assert (=> bs!21636 m!384133))

(assert (=> start!54518 d!85770))

(declare-fun d!85772 () Bool)

(assert (=> d!85772 (= (invariant!0 (currentBit!12020 thiss!1005) (currentByte!12025 thiss!1005) (size!6038 (buf!6552 (_2!11841 lt!395846)))) (and (bvsge (currentBit!12020 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12020 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12025 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12025 thiss!1005) (size!6038 (buf!6552 (_2!11841 lt!395846)))) (and (= (currentBit!12020 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12025 thiss!1005) (size!6038 (buf!6552 (_2!11841 lt!395846))))))))))

(assert (=> b!254954 d!85772))

(check-sat (not d!85722) (not b!255031) (not b!255071) (not d!85748) (not b!255030) (not d!85726) (not b!255072) (not d!85702) (not b!255055) (not d!85708) (not d!85700) (not d!85730) (not b!255094) (not b!255070) (not d!85738) (not b!255049) (not b!255032) (not d!85764) (not d!85736) (not d!85716) (not b!255083) (not d!85710) (not d!85768) (not b!255091) (not b!255053) (not d!85740) (not d!85732) (not b!255050) (not b!255033) (not d!85718) (not d!85744) (not d!85712) (not b!255089) (not d!85766) (not d!85734) (not d!85704) (not d!85714) (not d!85720) (not d!85762) (not b!255099) (not b!255052) (not b!255096) (not d!85770) (not d!85728) (not d!85754) (not b!255085) (not b!255047) (not b!255076) (not d!85758) (not b!255054) (not d!85724) (not b!255048) (not b!255073) (not d!85760) (not d!85742))
(check-sat)
