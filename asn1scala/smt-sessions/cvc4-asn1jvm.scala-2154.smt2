; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54694 () Bool)

(assert start!54694)

(declare-fun b!256413 () Bool)

(declare-fun res!214974 () Bool)

(declare-fun e!177682 () Bool)

(assert (=> b!256413 (=> (not res!214974) (not e!177682))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13841 0))(
  ( (array!13842 (arr!7062 (Array (_ BitVec 32) (_ BitVec 8))) (size!6075 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11072 0))(
  ( (BitStream!11073 (buf!6592 array!13841) (currentByte!12071 (_ BitVec 32)) (currentBit!12066 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11072)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256413 (= res!214974 (validate_offset_bits!1 ((_ sign_extend 32) (size!6075 (buf!6592 thiss!1005))) ((_ sign_extend 32) (currentByte!12071 thiss!1005)) ((_ sign_extend 32) (currentBit!12066 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256414 () Bool)

(declare-fun res!214973 () Bool)

(assert (=> b!256414 (=> (not res!214973) (not e!177682))))

(assert (=> b!256414 (= res!214973 (bvsge from!289 nBits!297))))

(declare-fun b!256415 () Bool)

(declare-fun e!177681 () Bool)

(declare-datatypes ((tuple2!21950 0))(
  ( (tuple2!21951 (_1!11909 BitStream!11072) (_2!11909 Bool)) )
))
(declare-fun lt!397771 () tuple2!21950)

(declare-datatypes ((tuple2!21952 0))(
  ( (tuple2!21953 (_1!11910 BitStream!11072) (_2!11910 BitStream!11072)) )
))
(declare-fun lt!397773 () tuple2!21952)

(assert (=> b!256415 (= e!177681 (and (_2!11909 lt!397771) (= (_1!11909 lt!397771) (_2!11910 lt!397773))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11072 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21950)

(assert (=> b!256415 (= lt!397771 (checkBitsLoopPure!0 (_1!11910 lt!397773) nBits!297 bit!26 from!289))))

(declare-datatypes ((Unit!18358 0))(
  ( (Unit!18359) )
))
(declare-fun lt!397772 () Unit!18358)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11072 array!13841 (_ BitVec 64)) Unit!18358)

(assert (=> b!256415 (= lt!397772 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6592 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-fun reader!0 (BitStream!11072 BitStream!11072) tuple2!21952)

(assert (=> b!256415 (= lt!397773 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256416 () Bool)

(declare-fun e!177679 () Bool)

(assert (=> b!256416 (= e!177682 (not e!177679))))

(declare-fun res!214976 () Bool)

(assert (=> b!256416 (=> res!214976 e!177679)))

(assert (=> b!256416 (= res!214976 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11072 BitStream!11072) Bool)

(assert (=> b!256416 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!397769 () Unit!18358)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11072) Unit!18358)

(assert (=> b!256416 (= lt!397769 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun res!214975 () Bool)

(assert (=> start!54694 (=> (not res!214975) (not e!177682))))

(assert (=> start!54694 (= res!214975 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54694 e!177682))

(assert (=> start!54694 true))

(declare-fun e!177683 () Bool)

(declare-fun inv!12 (BitStream!11072) Bool)

(assert (=> start!54694 (and (inv!12 thiss!1005) e!177683)))

(declare-fun b!256417 () Bool)

(declare-fun array_inv!5816 (array!13841) Bool)

(assert (=> b!256417 (= e!177683 (array_inv!5816 (buf!6592 thiss!1005)))))

(declare-fun b!256418 () Bool)

(assert (=> b!256418 (= e!177679 e!177681)))

(declare-fun res!214977 () Bool)

(assert (=> b!256418 (=> (not res!214977) (not e!177681))))

(declare-fun lt!397770 () (_ BitVec 64))

(assert (=> b!256418 (= res!214977 (= lt!397770 (bvadd lt!397770 (bvsub nBits!297 from!289))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256418 (= lt!397770 (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005)))))

(assert (= (and start!54694 res!214975) b!256413))

(assert (= (and b!256413 res!214974) b!256414))

(assert (= (and b!256414 res!214973) b!256416))

(assert (= (and b!256416 (not res!214976)) b!256418))

(assert (= (and b!256418 res!214977) b!256415))

(assert (= start!54694 b!256417))

(declare-fun m!386001 () Bool)

(assert (=> b!256416 m!386001))

(declare-fun m!386003 () Bool)

(assert (=> b!256416 m!386003))

(declare-fun m!386005 () Bool)

(assert (=> b!256418 m!386005))

(declare-fun m!386007 () Bool)

(assert (=> start!54694 m!386007))

(declare-fun m!386009 () Bool)

(assert (=> b!256415 m!386009))

(declare-fun m!386011 () Bool)

(assert (=> b!256415 m!386011))

(declare-fun m!386013 () Bool)

(assert (=> b!256415 m!386013))

(declare-fun m!386015 () Bool)

(assert (=> b!256417 m!386015))

(declare-fun m!386017 () Bool)

(assert (=> b!256413 m!386017))

(push 1)

(assert (not b!256417))

(assert (not b!256416))

(assert (not b!256415))

(assert (not b!256418))

(assert (not b!256413))

(assert (not start!54694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85950 () Bool)

(declare-fun res!214984 () Bool)

(declare-fun e!177688 () Bool)

(assert (=> d!85950 (=> (not res!214984) (not e!177688))))

(assert (=> d!85950 (= res!214984 (= (size!6075 (buf!6592 thiss!1005)) (size!6075 (buf!6592 thiss!1005))))))

(assert (=> d!85950 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!177688)))

(declare-fun b!256425 () Bool)

(declare-fun res!214986 () Bool)

(assert (=> b!256425 (=> (not res!214986) (not e!177688))))

(assert (=> b!256425 (= res!214986 (bvsle (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005)) (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005))))))

(declare-fun b!256426 () Bool)

(declare-fun e!177689 () Bool)

(assert (=> b!256426 (= e!177688 e!177689)))

(declare-fun res!214985 () Bool)

(assert (=> b!256426 (=> res!214985 e!177689)))

(assert (=> b!256426 (= res!214985 (= (size!6075 (buf!6592 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!256427 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13841 array!13841 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256427 (= e!177689 (arrayBitRangesEq!0 (buf!6592 thiss!1005) (buf!6592 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005))))))

(assert (= (and d!85950 res!214984) b!256425))

(assert (= (and b!256425 res!214986) b!256426))

(assert (= (and b!256426 (not res!214985)) b!256427))

(assert (=> b!256425 m!386005))

(assert (=> b!256425 m!386005))

(assert (=> b!256427 m!386005))

(assert (=> b!256427 m!386005))

(declare-fun m!386025 () Bool)

(assert (=> b!256427 m!386025))

(assert (=> b!256416 d!85950))

(declare-fun d!85956 () Bool)

(assert (=> d!85956 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!397782 () Unit!18358)

(declare-fun choose!11 (BitStream!11072) Unit!18358)

(assert (=> d!85956 (= lt!397782 (choose!11 thiss!1005))))

(assert (=> d!85956 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!397782)))

(declare-fun bs!21711 () Bool)

(assert (= bs!21711 d!85956))

(assert (=> bs!21711 m!386001))

(declare-fun m!386027 () Bool)

(assert (=> bs!21711 m!386027))

(assert (=> b!256416 d!85956))

(declare-fun d!85958 () Bool)

(declare-datatypes ((tuple2!21956 0))(
  ( (tuple2!21957 (_1!11912 Bool) (_2!11912 BitStream!11072)) )
))
(declare-fun lt!397785 () tuple2!21956)

(declare-fun checkBitsLoop!0 (BitStream!11072 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21956)

(assert (=> d!85958 (= lt!397785 (checkBitsLoop!0 (_1!11910 lt!397773) nBits!297 bit!26 from!289))))

(assert (=> d!85958 (= (checkBitsLoopPure!0 (_1!11910 lt!397773) nBits!297 bit!26 from!289) (tuple2!21951 (_2!11912 lt!397785) (_1!11912 lt!397785)))))

(declare-fun bs!21712 () Bool)

(assert (= bs!21712 d!85958))

(declare-fun m!386029 () Bool)

(assert (=> bs!21712 m!386029))

(assert (=> b!256415 d!85958))

(declare-fun d!85960 () Bool)

(assert (=> d!85960 (validate_offset_bits!1 ((_ sign_extend 32) (size!6075 (buf!6592 thiss!1005))) ((_ sign_extend 32) (currentByte!12071 thiss!1005)) ((_ sign_extend 32) (currentBit!12066 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397788 () Unit!18358)

(declare-fun choose!9 (BitStream!11072 array!13841 (_ BitVec 64) BitStream!11072) Unit!18358)

(assert (=> d!85960 (= lt!397788 (choose!9 thiss!1005 (buf!6592 thiss!1005) (bvsub nBits!297 from!289) (BitStream!11073 (buf!6592 thiss!1005) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005))))))

(assert (=> d!85960 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6592 thiss!1005) (bvsub nBits!297 from!289)) lt!397788)))

(declare-fun bs!21713 () Bool)

(assert (= bs!21713 d!85960))

(assert (=> bs!21713 m!386017))

(declare-fun m!386031 () Bool)

(assert (=> bs!21713 m!386031))

(assert (=> b!256415 d!85960))

(declare-fun lt!397906 () (_ BitVec 64))

(declare-fun lt!397895 () tuple2!21952)

(declare-fun lt!397899 () (_ BitVec 64))

(declare-fun e!177700 () Bool)

(declare-fun b!256453 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!11072 (_ BitVec 64)) BitStream!11072)

(assert (=> b!256453 (= e!177700 (= (_1!11910 lt!397895) (withMovedBitIndex!0 (_2!11910 lt!397895) (bvsub lt!397899 lt!397906))))))

(assert (=> b!256453 (or (= (bvand lt!397899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!397906 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!397899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!397899 lt!397906) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!256453 (= lt!397906 (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005)))))

(assert (=> b!256453 (= lt!397899 (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005)))))

(declare-fun b!256454 () Bool)

(declare-fun res!215003 () Bool)

(assert (=> b!256454 (=> (not res!215003) (not e!177700))))

(assert (=> b!256454 (= res!215003 (isPrefixOf!0 (_1!11910 lt!397895) thiss!1005))))

(declare-fun b!256455 () Bool)

(declare-fun e!177701 () Unit!18358)

(declare-fun Unit!18361 () Unit!18358)

(assert (=> b!256455 (= e!177701 Unit!18361)))

(declare-fun b!256456 () Bool)

(declare-fun lt!397890 () Unit!18358)

(assert (=> b!256456 (= e!177701 lt!397890)))

(declare-fun lt!397892 () (_ BitVec 64))

(assert (=> b!256456 (= lt!397892 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!397904 () (_ BitVec 64))

(assert (=> b!256456 (= lt!397904 (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13841 array!13841 (_ BitVec 64) (_ BitVec 64)) Unit!18358)

(assert (=> b!256456 (= lt!397890 (arrayBitRangesEqSymmetric!0 (buf!6592 thiss!1005) (buf!6592 thiss!1005) lt!397892 lt!397904))))

(assert (=> b!256456 (arrayBitRangesEq!0 (buf!6592 thiss!1005) (buf!6592 thiss!1005) lt!397892 lt!397904)))

(declare-fun d!85962 () Bool)

(assert (=> d!85962 e!177700))

(declare-fun res!215002 () Bool)

(assert (=> d!85962 (=> (not res!215002) (not e!177700))))

(assert (=> d!85962 (= res!215002 (isPrefixOf!0 (_1!11910 lt!397895) (_2!11910 lt!397895)))))

(declare-fun lt!397901 () BitStream!11072)

(assert (=> d!85962 (= lt!397895 (tuple2!21953 lt!397901 thiss!1005))))

(declare-fun lt!397894 () Unit!18358)

(declare-fun lt!397905 () Unit!18358)

(assert (=> d!85962 (= lt!397894 lt!397905)))

(assert (=> d!85962 (isPrefixOf!0 lt!397901 thiss!1005)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11072 BitStream!11072 BitStream!11072) Unit!18358)

(assert (=> d!85962 (= lt!397905 (lemmaIsPrefixTransitive!0 lt!397901 thiss!1005 thiss!1005))))

(declare-fun lt!397897 () Unit!18358)

(declare-fun lt!397898 () Unit!18358)

(assert (=> d!85962 (= lt!397897 lt!397898)))

(assert (=> d!85962 (isPrefixOf!0 lt!397901 thiss!1005)))

(assert (=> d!85962 (= lt!397898 (lemmaIsPrefixTransitive!0 lt!397901 thiss!1005 thiss!1005))))

(declare-fun lt!397900 () Unit!18358)

(assert (=> d!85962 (= lt!397900 e!177701)))

(declare-fun c!11776 () Bool)

(assert (=> d!85962 (= c!11776 (not (= (size!6075 (buf!6592 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!397903 () Unit!18358)

(declare-fun lt!397896 () Unit!18358)

(assert (=> d!85962 (= lt!397903 lt!397896)))

(assert (=> d!85962 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85962 (= lt!397896 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!397908 () Unit!18358)

(declare-fun lt!397889 () Unit!18358)

(assert (=> d!85962 (= lt!397908 lt!397889)))

(assert (=> d!85962 (= lt!397889 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!397893 () Unit!18358)

(declare-fun lt!397907 () Unit!18358)

(assert (=> d!85962 (= lt!397893 lt!397907)))

(assert (=> d!85962 (isPrefixOf!0 lt!397901 lt!397901)))

(assert (=> d!85962 (= lt!397907 (lemmaIsPrefixRefl!0 lt!397901))))

(declare-fun lt!397891 () Unit!18358)

(declare-fun lt!397902 () Unit!18358)

(assert (=> d!85962 (= lt!397891 lt!397902)))

(assert (=> d!85962 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85962 (= lt!397902 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!85962 (= lt!397901 (BitStream!11073 (buf!6592 thiss!1005) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005)))))

(assert (=> d!85962 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85962 (= (reader!0 thiss!1005 thiss!1005) lt!397895)))

(declare-fun b!256457 () Bool)

(declare-fun res!215004 () Bool)

(assert (=> b!256457 (=> (not res!215004) (not e!177700))))

(assert (=> b!256457 (= res!215004 (isPrefixOf!0 (_2!11910 lt!397895) thiss!1005))))

(assert (= (and d!85962 c!11776) b!256456))

(assert (= (and d!85962 (not c!11776)) b!256455))

(assert (= (and d!85962 res!215002) b!256454))

(assert (= (and b!256454 res!215003) b!256457))

(assert (= (and b!256457 res!215004) b!256453))

(declare-fun m!386055 () Bool)

(assert (=> d!85962 m!386055))

(assert (=> d!85962 m!386003))

(assert (=> d!85962 m!386001))

(declare-fun m!386057 () Bool)

(assert (=> d!85962 m!386057))

(declare-fun m!386059 () Bool)

(assert (=> d!85962 m!386059))

(assert (=> d!85962 m!386001))

(declare-fun m!386061 () Bool)

(assert (=> d!85962 m!386061))

(assert (=> d!85962 m!386001))

(assert (=> d!85962 m!386003))

(declare-fun m!386063 () Bool)

(assert (=> d!85962 m!386063))

(assert (=> d!85962 m!386057))

(declare-fun m!386065 () Bool)

(assert (=> b!256454 m!386065))

(declare-fun m!386067 () Bool)

(assert (=> b!256457 m!386067))

(assert (=> b!256456 m!386005))

(declare-fun m!386069 () Bool)

(assert (=> b!256456 m!386069))

(declare-fun m!386071 () Bool)

(assert (=> b!256456 m!386071))

(declare-fun m!386073 () Bool)

(assert (=> b!256453 m!386073))

(assert (=> b!256453 m!386005))

(assert (=> b!256453 m!386005))

(assert (=> b!256415 d!85962))

(declare-fun d!85968 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!85968 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6075 (buf!6592 thiss!1005))) ((_ sign_extend 32) (currentByte!12071 thiss!1005)) ((_ sign_extend 32) (currentBit!12066 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6075 (buf!6592 thiss!1005))) ((_ sign_extend 32) (currentByte!12071 thiss!1005)) ((_ sign_extend 32) (currentBit!12066 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21715 () Bool)

(assert (= bs!21715 d!85968))

(declare-fun m!386075 () Bool)

(assert (=> bs!21715 m!386075))

(assert (=> b!256413 d!85968))

(declare-fun d!85970 () Bool)

(declare-fun e!177713 () Bool)

(assert (=> d!85970 e!177713))

(declare-fun res!215025 () Bool)

(assert (=> d!85970 (=> (not res!215025) (not e!177713))))

(declare-fun lt!397945 () (_ BitVec 64))

(declare-fun lt!397944 () (_ BitVec 64))

(declare-fun lt!397943 () (_ BitVec 64))

(assert (=> d!85970 (= res!215025 (= lt!397943 (bvsub lt!397944 lt!397945)))))

(assert (=> d!85970 (or (= (bvand lt!397944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!397945 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!397944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!397944 lt!397945) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85970 (= lt!397945 (remainingBits!0 ((_ sign_extend 32) (size!6075 (buf!6592 thiss!1005))) ((_ sign_extend 32) (currentByte!12071 thiss!1005)) ((_ sign_extend 32) (currentBit!12066 thiss!1005))))))

(declare-fun lt!397946 () (_ BitVec 64))

(declare-fun lt!397947 () (_ BitVec 64))

(assert (=> d!85970 (= lt!397944 (bvmul lt!397946 lt!397947))))

(assert (=> d!85970 (or (= lt!397946 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!397947 (bvsdiv (bvmul lt!397946 lt!397947) lt!397946)))))

(assert (=> d!85970 (= lt!397947 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85970 (= lt!397946 ((_ sign_extend 32) (size!6075 (buf!6592 thiss!1005))))))

(assert (=> d!85970 (= lt!397943 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12071 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12066 thiss!1005))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!85970 (invariant!0 (currentBit!12066 thiss!1005) (currentByte!12071 thiss!1005) (size!6075 (buf!6592 thiss!1005)))))

(assert (=> d!85970 (= (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005)) lt!397943)))

(declare-fun b!256477 () Bool)

(declare-fun res!215024 () Bool)

(assert (=> b!256477 (=> (not res!215024) (not e!177713))))

(assert (=> b!256477 (= res!215024 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!397943))))

(declare-fun b!256478 () Bool)

(declare-fun lt!397942 () (_ BitVec 64))

(assert (=> b!256478 (= e!177713 (bvsle lt!397943 (bvmul lt!397942 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256478 (or (= lt!397942 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!397942 #b0000000000000000000000000000000000000000000000000000000000001000) lt!397942)))))

(assert (=> b!256478 (= lt!397942 ((_ sign_extend 32) (size!6075 (buf!6592 thiss!1005))))))

(assert (= (and d!85970 res!215025) b!256477))

(assert (= (and b!256477 res!215024) b!256478))

(assert (=> d!85970 m!386075))

(declare-fun m!386081 () Bool)

(assert (=> d!85970 m!386081))

(assert (=> b!256418 d!85970))

(declare-fun d!85978 () Bool)

(assert (=> d!85978 (= (inv!12 thiss!1005) (invariant!0 (currentBit!12066 thiss!1005) (currentByte!12071 thiss!1005) (size!6075 (buf!6592 thiss!1005))))))

(declare-fun bs!21718 () Bool)

(assert (= bs!21718 d!85978))

(assert (=> bs!21718 m!386081))

(assert (=> start!54694 d!85978))

(declare-fun d!85980 () Bool)

(assert (=> d!85980 (= (array_inv!5816 (buf!6592 thiss!1005)) (bvsge (size!6075 (buf!6592 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!256417 d!85980))

(push 1)

(assert (not d!85956))

(assert (not d!85958))

(assert (not b!256453))

(assert (not b!256425))

(assert (not b!256457))

(assert (not b!256456))

(assert (not d!85968))

(assert (not d!85978))

(assert (not d!85960))

(assert (not b!256454))

(assert (not d!85962))

(assert (not d!85970))

(assert (not b!256427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86030 () Bool)

(assert (=> d!86030 (= (remainingBits!0 ((_ sign_extend 32) (size!6075 (buf!6592 thiss!1005))) ((_ sign_extend 32) (currentByte!12071 thiss!1005)) ((_ sign_extend 32) (currentBit!12066 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6075 (buf!6592 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12071 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12066 thiss!1005)))))))

(assert (=> d!85970 d!86030))

(declare-fun d!86032 () Bool)

(assert (=> d!86032 (= (invariant!0 (currentBit!12066 thiss!1005) (currentByte!12071 thiss!1005) (size!6075 (buf!6592 thiss!1005))) (and (bvsge (currentBit!12066 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12066 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12071 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12071 thiss!1005) (size!6075 (buf!6592 thiss!1005))) (and (= (currentBit!12066 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12071 thiss!1005) (size!6075 (buf!6592 thiss!1005)))))))))

(assert (=> d!85970 d!86032))

(declare-fun d!86034 () Bool)

(declare-fun res!215093 () Bool)

(declare-fun e!177770 () Bool)

(assert (=> d!86034 (=> (not res!215093) (not e!177770))))

(assert (=> d!86034 (= res!215093 (= (size!6075 (buf!6592 (_1!11910 lt!397895))) (size!6075 (buf!6592 thiss!1005))))))

(assert (=> d!86034 (= (isPrefixOf!0 (_1!11910 lt!397895) thiss!1005) e!177770)))

(declare-fun b!256566 () Bool)

(declare-fun res!215095 () Bool)

(assert (=> b!256566 (=> (not res!215095) (not e!177770))))

(assert (=> b!256566 (= res!215095 (bvsle (bitIndex!0 (size!6075 (buf!6592 (_1!11910 lt!397895))) (currentByte!12071 (_1!11910 lt!397895)) (currentBit!12066 (_1!11910 lt!397895))) (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005))))))

(declare-fun b!256567 () Bool)

(declare-fun e!177771 () Bool)

(assert (=> b!256567 (= e!177770 e!177771)))

(declare-fun res!215094 () Bool)

(assert (=> b!256567 (=> res!215094 e!177771)))

(assert (=> b!256567 (= res!215094 (= (size!6075 (buf!6592 (_1!11910 lt!397895))) #b00000000000000000000000000000000))))

(declare-fun b!256568 () Bool)

(assert (=> b!256568 (= e!177771 (arrayBitRangesEq!0 (buf!6592 (_1!11910 lt!397895)) (buf!6592 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6075 (buf!6592 (_1!11910 lt!397895))) (currentByte!12071 (_1!11910 lt!397895)) (currentBit!12066 (_1!11910 lt!397895)))))))

(assert (= (and d!86034 res!215093) b!256566))

(assert (= (and b!256566 res!215095) b!256567))

(assert (= (and b!256567 (not res!215094)) b!256568))

(declare-fun m!386155 () Bool)

(assert (=> b!256566 m!386155))

(assert (=> b!256566 m!386005))

(assert (=> b!256568 m!386155))

(assert (=> b!256568 m!386155))

(declare-fun m!386157 () Bool)

(assert (=> b!256568 m!386157))

(assert (=> b!256454 d!86034))

(declare-fun d!86036 () Bool)

(declare-fun res!215101 () Bool)

(declare-fun e!177777 () Bool)

(assert (=> d!86036 (=> (not res!215101) (not e!177777))))

(assert (=> d!86036 (= res!215101 (= (size!6075 (buf!6592 (_1!11910 lt!397895))) (size!6075 (buf!6592 (_2!11910 lt!397895)))))))

(assert (=> d!86036 (= (isPrefixOf!0 (_1!11910 lt!397895) (_2!11910 lt!397895)) e!177777)))

(declare-fun b!256578 () Bool)

(declare-fun res!215103 () Bool)

(assert (=> b!256578 (=> (not res!215103) (not e!177777))))

(assert (=> b!256578 (= res!215103 (bvsle (bitIndex!0 (size!6075 (buf!6592 (_1!11910 lt!397895))) (currentByte!12071 (_1!11910 lt!397895)) (currentBit!12066 (_1!11910 lt!397895))) (bitIndex!0 (size!6075 (buf!6592 (_2!11910 lt!397895))) (currentByte!12071 (_2!11910 lt!397895)) (currentBit!12066 (_2!11910 lt!397895)))))))

(declare-fun b!256579 () Bool)

(declare-fun e!177778 () Bool)

(assert (=> b!256579 (= e!177777 e!177778)))

(declare-fun res!215102 () Bool)

(assert (=> b!256579 (=> res!215102 e!177778)))

(assert (=> b!256579 (= res!215102 (= (size!6075 (buf!6592 (_1!11910 lt!397895))) #b00000000000000000000000000000000))))

(declare-fun b!256580 () Bool)

(assert (=> b!256580 (= e!177778 (arrayBitRangesEq!0 (buf!6592 (_1!11910 lt!397895)) (buf!6592 (_2!11910 lt!397895)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6075 (buf!6592 (_1!11910 lt!397895))) (currentByte!12071 (_1!11910 lt!397895)) (currentBit!12066 (_1!11910 lt!397895)))))))

(assert (= (and d!86036 res!215101) b!256578))

(assert (= (and b!256578 res!215103) b!256579))

(assert (= (and b!256579 (not res!215102)) b!256580))

(assert (=> b!256578 m!386155))

(declare-fun m!386161 () Bool)

(assert (=> b!256578 m!386161))

(assert (=> b!256580 m!386155))

(assert (=> b!256580 m!386155))

(declare-fun m!386169 () Bool)

(assert (=> b!256580 m!386169))

(assert (=> d!85962 d!86036))

(assert (=> d!85962 d!85950))

(declare-fun d!86038 () Bool)

(assert (=> d!86038 (isPrefixOf!0 lt!397901 thiss!1005)))

(declare-fun lt!398095 () Unit!18358)

(declare-fun choose!30 (BitStream!11072 BitStream!11072 BitStream!11072) Unit!18358)

(assert (=> d!86038 (= lt!398095 (choose!30 lt!397901 thiss!1005 thiss!1005))))

(assert (=> d!86038 (isPrefixOf!0 lt!397901 thiss!1005)))

(assert (=> d!86038 (= (lemmaIsPrefixTransitive!0 lt!397901 thiss!1005 thiss!1005) lt!398095)))

(declare-fun bs!21731 () Bool)

(assert (= bs!21731 d!86038))

(assert (=> bs!21731 m!386055))

(declare-fun m!386189 () Bool)

(assert (=> bs!21731 m!386189))

(assert (=> bs!21731 m!386055))

(assert (=> d!85962 d!86038))

(declare-fun d!86042 () Bool)

(assert (=> d!86042 (isPrefixOf!0 lt!397901 lt!397901)))

(declare-fun lt!398096 () Unit!18358)

(assert (=> d!86042 (= lt!398096 (choose!11 lt!397901))))

(assert (=> d!86042 (= (lemmaIsPrefixRefl!0 lt!397901) lt!398096)))

(declare-fun bs!21732 () Bool)

(assert (= bs!21732 d!86042))

(assert (=> bs!21732 m!386063))

(declare-fun m!386191 () Bool)

(assert (=> bs!21732 m!386191))

(assert (=> d!85962 d!86042))

(declare-fun d!86044 () Bool)

(declare-fun res!215109 () Bool)

(declare-fun e!177785 () Bool)

(assert (=> d!86044 (=> (not res!215109) (not e!177785))))

(assert (=> d!86044 (= res!215109 (= (size!6075 (buf!6592 lt!397901)) (size!6075 (buf!6592 lt!397901))))))

(assert (=> d!86044 (= (isPrefixOf!0 lt!397901 lt!397901) e!177785)))

(declare-fun b!256588 () Bool)

(declare-fun res!215111 () Bool)

(assert (=> b!256588 (=> (not res!215111) (not e!177785))))

(assert (=> b!256588 (= res!215111 (bvsle (bitIndex!0 (size!6075 (buf!6592 lt!397901)) (currentByte!12071 lt!397901) (currentBit!12066 lt!397901)) (bitIndex!0 (size!6075 (buf!6592 lt!397901)) (currentByte!12071 lt!397901) (currentBit!12066 lt!397901))))))

(declare-fun b!256589 () Bool)

(declare-fun e!177786 () Bool)

(assert (=> b!256589 (= e!177785 e!177786)))

(declare-fun res!215110 () Bool)

(assert (=> b!256589 (=> res!215110 e!177786)))

(assert (=> b!256589 (= res!215110 (= (size!6075 (buf!6592 lt!397901)) #b00000000000000000000000000000000))))

(declare-fun b!256590 () Bool)

(assert (=> b!256590 (= e!177786 (arrayBitRangesEq!0 (buf!6592 lt!397901) (buf!6592 lt!397901) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6075 (buf!6592 lt!397901)) (currentByte!12071 lt!397901) (currentBit!12066 lt!397901))))))

(assert (= (and d!86044 res!215109) b!256588))

(assert (= (and b!256588 res!215111) b!256589))

(assert (= (and b!256589 (not res!215110)) b!256590))

(declare-fun m!386193 () Bool)

(assert (=> b!256588 m!386193))

(assert (=> b!256588 m!386193))

(assert (=> b!256590 m!386193))

(assert (=> b!256590 m!386193))

(declare-fun m!386195 () Bool)

(assert (=> b!256590 m!386195))

(assert (=> d!85962 d!86044))

(declare-fun d!86046 () Bool)

(declare-fun res!215112 () Bool)

(declare-fun e!177787 () Bool)

(assert (=> d!86046 (=> (not res!215112) (not e!177787))))

(assert (=> d!86046 (= res!215112 (= (size!6075 (buf!6592 lt!397901)) (size!6075 (buf!6592 thiss!1005))))))

(assert (=> d!86046 (= (isPrefixOf!0 lt!397901 thiss!1005) e!177787)))

(declare-fun b!256591 () Bool)

(declare-fun res!215114 () Bool)

(assert (=> b!256591 (=> (not res!215114) (not e!177787))))

(assert (=> b!256591 (= res!215114 (bvsle (bitIndex!0 (size!6075 (buf!6592 lt!397901)) (currentByte!12071 lt!397901) (currentBit!12066 lt!397901)) (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005))))))

(declare-fun b!256592 () Bool)

(declare-fun e!177788 () Bool)

(assert (=> b!256592 (= e!177787 e!177788)))

(declare-fun res!215113 () Bool)

(assert (=> b!256592 (=> res!215113 e!177788)))

(assert (=> b!256592 (= res!215113 (= (size!6075 (buf!6592 lt!397901)) #b00000000000000000000000000000000))))

(declare-fun b!256593 () Bool)

(assert (=> b!256593 (= e!177788 (arrayBitRangesEq!0 (buf!6592 lt!397901) (buf!6592 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6075 (buf!6592 lt!397901)) (currentByte!12071 lt!397901) (currentBit!12066 lt!397901))))))

(assert (= (and d!86046 res!215112) b!256591))

(assert (= (and b!256591 res!215114) b!256592))

(assert (= (and b!256592 (not res!215113)) b!256593))

(assert (=> b!256591 m!386193))

(assert (=> b!256591 m!386005))

(assert (=> b!256593 m!386193))

(assert (=> b!256593 m!386193))

(declare-fun m!386197 () Bool)

(assert (=> b!256593 m!386197))

(assert (=> d!85962 d!86046))

(assert (=> d!85962 d!85956))

(declare-fun b!256608 () Bool)

(declare-fun e!177806 () Bool)

(declare-fun e!177802 () Bool)

(assert (=> b!256608 (= e!177806 e!177802)))

(declare-fun res!215127 () Bool)

(assert (=> b!256608 (=> (not res!215127) (not e!177802))))

(declare-fun e!177803 () Bool)

(assert (=> b!256608 (= res!215127 e!177803)))

(declare-fun res!215125 () Bool)

(assert (=> b!256608 (=> res!215125 e!177803)))

(declare-datatypes ((tuple4!310 0))(
  ( (tuple4!311 (_1!11916 (_ BitVec 32)) (_2!11916 (_ BitVec 32)) (_3!935 (_ BitVec 32)) (_4!155 (_ BitVec 32))) )
))
(declare-fun lt!398105 () tuple4!310)

(assert (=> b!256608 (= res!215125 (bvsge (_1!11916 lt!398105) (_2!11916 lt!398105)))))

(declare-fun lt!398103 () (_ BitVec 32))

(assert (=> b!256608 (= lt!398103 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!398104 () (_ BitVec 32))

(assert (=> b!256608 (= lt!398104 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!310)

(assert (=> b!256608 (= lt!398105 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6075 (buf!6592 thiss!1005)) (currentByte!12071 thiss!1005) (currentBit!12066 thiss!1005))))))

(declare-fun bm!4012 () Bool)

(declare-fun c!11792 () Bool)

(declare-fun call!4015 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4012 (= call!4015 (byteRangesEq!0 (ite c!11792 (select (arr!7062 (buf!6592 thiss!1005)) (_3!935 lt!398105)) (select (arr!7062 (buf!6592 thiss!1005)) (_4!155 lt!398105))) (ite c!11792 (select (arr!7062 (buf!6592 thiss!1005)) (_3!935 lt!398105)) (select (arr!7062 (buf!6592 thiss!1005)) (_4!155 lt!398105))) (ite c!11792 lt!398104 #b00000000000000000000000000000000) lt!398103))))

