; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12876 () Bool)

(assert start!12876)

(declare-fun b!65964 () Bool)

(declare-fun res!54678 () Bool)

(declare-fun e!43341 () Bool)

(assert (=> b!65964 (=> res!54678 e!43341)))

(declare-datatypes ((array!2842 0))(
  ( (array!2843 (arr!1874 (Array (_ BitVec 32) (_ BitVec 8))) (size!1310 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2254 0))(
  ( (BitStream!2255 (buf!1691 array!2842) (currentByte!3363 (_ BitVec 32)) (currentBit!3358 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5844 0))(
  ( (tuple2!5845 (_1!3033 BitStream!2254) (_2!3033 BitStream!2254)) )
))
(declare-fun lt!104761 () tuple2!5844)

(declare-datatypes ((Unit!4457 0))(
  ( (Unit!4458) )
))
(declare-datatypes ((tuple2!5846 0))(
  ( (tuple2!5847 (_1!3034 Unit!4457) (_2!3034 BitStream!2254)) )
))
(declare-fun lt!104755 () tuple2!5846)

(declare-fun isPrefixOf!0 (BitStream!2254 BitStream!2254) Bool)

(assert (=> b!65964 (= res!54678 (not (isPrefixOf!0 (_1!3033 lt!104761) (_2!3034 lt!104755))))))

(declare-fun b!65965 () Bool)

(declare-fun res!54674 () Bool)

(declare-fun e!43345 () Bool)

(assert (=> b!65965 (=> res!54674 e!43345)))

(declare-fun thiss!1379 () BitStream!2254)

(assert (=> b!65965 (= res!54674 (not (= (size!1310 (buf!1691 thiss!1379)) (size!1310 (buf!1691 (_2!3034 lt!104755))))))))

(declare-fun b!65966 () Bool)

(declare-fun res!54676 () Bool)

(declare-fun e!43349 () Bool)

(assert (=> b!65966 (=> res!54676 e!43349)))

(declare-fun lt!104750 () tuple2!5846)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!65966 (= res!54676 (not (invariant!0 (currentBit!3358 (_2!3034 lt!104750)) (currentByte!3363 (_2!3034 lt!104750)) (size!1310 (buf!1691 (_2!3034 lt!104755))))))))

(declare-fun srcBuffer!2 () array!2842)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!65967 () Bool)

(declare-fun e!43346 () Bool)

(declare-fun lt!104756 () tuple2!5844)

(declare-datatypes ((List!702 0))(
  ( (Nil!699) (Cons!698 (h!817 Bool) (t!1452 List!702)) )
))
(declare-fun head!521 (List!702) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2254 array!2842 (_ BitVec 64) (_ BitVec 64)) List!702)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2254 BitStream!2254 (_ BitVec 64)) List!702)

(assert (=> b!65967 (= e!43346 (= (head!521 (byteArrayBitContentToList!0 (_2!3034 lt!104750) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!521 (bitStreamReadBitsIntoList!0 (_2!3034 lt!104750) (_1!3033 lt!104756) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!65968 () Bool)

(declare-fun res!54682 () Bool)

(assert (=> b!65968 (=> res!54682 e!43345)))

(assert (=> b!65968 (= res!54682 (not (invariant!0 (currentBit!3358 (_2!3034 lt!104755)) (currentByte!3363 (_2!3034 lt!104755)) (size!1310 (buf!1691 (_2!3034 lt!104755))))))))

(declare-fun b!65969 () Bool)

(declare-fun lt!104765 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun e!43339 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!65969 (= e!43339 (= lt!104765 (bvsub (bvsub (bvadd (bitIndex!0 (size!1310 (buf!1691 (_2!3034 lt!104750))) (currentByte!3363 (_2!3034 lt!104750)) (currentBit!3358 (_2!3034 lt!104750))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!65971 () Bool)

(declare-fun e!43342 () Bool)

(declare-fun array_inv!1186 (array!2842) Bool)

(assert (=> b!65971 (= e!43342 (array_inv!1186 (buf!1691 thiss!1379)))))

(declare-fun b!65972 () Bool)

(declare-fun e!43344 () Bool)

(declare-fun e!43347 () Bool)

(assert (=> b!65972 (= e!43344 e!43347)))

(declare-fun res!54667 () Bool)

(assert (=> b!65972 (=> res!54667 e!43347)))

(assert (=> b!65972 (= res!54667 (not (isPrefixOf!0 thiss!1379 (_2!3034 lt!104750))))))

(declare-fun lt!104766 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65972 (validate_offset_bits!1 ((_ sign_extend 32) (size!1310 (buf!1691 (_2!3034 lt!104750)))) ((_ sign_extend 32) (currentByte!3363 (_2!3034 lt!104750))) ((_ sign_extend 32) (currentBit!3358 (_2!3034 lt!104750))) lt!104766)))

(assert (=> b!65972 (= lt!104766 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104760 () Unit!4457)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2254 BitStream!2254 (_ BitVec 64) (_ BitVec 64)) Unit!4457)

(assert (=> b!65972 (= lt!104760 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3034 lt!104750) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2254 (_ BitVec 8) (_ BitVec 32)) tuple2!5846)

(assert (=> b!65972 (= lt!104750 (appendBitFromByte!0 thiss!1379 (select (arr!1874 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!65973 () Bool)

(declare-fun e!43338 () Bool)

(assert (=> b!65973 (= e!43338 (not e!43344))))

(declare-fun res!54679 () Bool)

(assert (=> b!65973 (=> res!54679 e!43344)))

(assert (=> b!65973 (= res!54679 (bvsge i!635 to!314))))

(assert (=> b!65973 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!104759 () Unit!4457)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2254) Unit!4457)

(assert (=> b!65973 (= lt!104759 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!104751 () (_ BitVec 64))

(assert (=> b!65973 (= lt!104751 (bitIndex!0 (size!1310 (buf!1691 thiss!1379)) (currentByte!3363 thiss!1379) (currentBit!3358 thiss!1379)))))

(declare-fun b!65974 () Bool)

(declare-fun res!54681 () Bool)

(assert (=> b!65974 (=> res!54681 e!43341)))

(declare-fun lt!104764 () tuple2!5844)

(assert (=> b!65974 (= res!54681 (not (isPrefixOf!0 (_1!3033 lt!104764) (_2!3034 lt!104755))))))

(declare-fun b!65975 () Bool)

(declare-fun e!43340 () Bool)

(assert (=> b!65975 (= e!43340 e!43345)))

(declare-fun res!54677 () Bool)

(assert (=> b!65975 (=> res!54677 e!43345)))

(assert (=> b!65975 (= res!54677 (not (= lt!104765 (bvsub (bvadd lt!104751 to!314) i!635))))))

(assert (=> b!65975 (= lt!104765 (bitIndex!0 (size!1310 (buf!1691 (_2!3034 lt!104755))) (currentByte!3363 (_2!3034 lt!104755)) (currentBit!3358 (_2!3034 lt!104755))))))

(declare-fun b!65976 () Bool)

(declare-fun res!54672 () Bool)

(assert (=> b!65976 (=> (not res!54672) (not e!43338))))

(assert (=> b!65976 (= res!54672 (validate_offset_bits!1 ((_ sign_extend 32) (size!1310 (buf!1691 thiss!1379))) ((_ sign_extend 32) (currentByte!3363 thiss!1379)) ((_ sign_extend 32) (currentBit!3358 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!65977 () Bool)

(assert (=> b!65977 (= e!43341 true)))

(declare-fun lt!104763 () (_ BitVec 64))

(assert (=> b!65977 (= lt!104763 (bitIndex!0 (size!1310 (buf!1691 (_1!3033 lt!104761))) (currentByte!3363 (_1!3033 lt!104761)) (currentBit!3358 (_1!3033 lt!104761))))))

(declare-fun lt!104758 () (_ BitVec 64))

(assert (=> b!65977 (= lt!104758 (bitIndex!0 (size!1310 (buf!1691 (_1!3033 lt!104764))) (currentByte!3363 (_1!3033 lt!104764)) (currentBit!3358 (_1!3033 lt!104764))))))

(declare-fun b!65978 () Bool)

(assert (=> b!65978 (= e!43345 e!43349)))

(declare-fun res!54680 () Bool)

(assert (=> b!65978 (=> res!54680 e!43349)))

(assert (=> b!65978 (= res!54680 (not (= (size!1310 (buf!1691 (_2!3034 lt!104750))) (size!1310 (buf!1691 (_2!3034 lt!104755))))))))

(assert (=> b!65978 e!43339))

(declare-fun res!54673 () Bool)

(assert (=> b!65978 (=> (not res!54673) (not e!43339))))

(assert (=> b!65978 (= res!54673 (= (size!1310 (buf!1691 (_2!3034 lt!104755))) (size!1310 (buf!1691 thiss!1379))))))

(declare-fun b!65979 () Bool)

(declare-fun res!54669 () Bool)

(assert (=> b!65979 (=> res!54669 e!43341)))

(assert (=> b!65979 (= res!54669 (not (isPrefixOf!0 (_1!3033 lt!104764) (_1!3033 lt!104761))))))

(declare-fun b!65980 () Bool)

(assert (=> b!65980 (= e!43347 e!43340)))

(declare-fun res!54683 () Bool)

(assert (=> b!65980 (=> res!54683 e!43340)))

(assert (=> b!65980 (= res!54683 (not (isPrefixOf!0 (_2!3034 lt!104750) (_2!3034 lt!104755))))))

(assert (=> b!65980 (isPrefixOf!0 thiss!1379 (_2!3034 lt!104755))))

(declare-fun lt!104757 () Unit!4457)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2254 BitStream!2254 BitStream!2254) Unit!4457)

(assert (=> b!65980 (= lt!104757 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3034 lt!104750) (_2!3034 lt!104755)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2254 array!2842 (_ BitVec 64) (_ BitVec 64)) tuple2!5846)

(assert (=> b!65980 (= lt!104755 (appendBitsMSBFirstLoop!0 (_2!3034 lt!104750) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!65980 e!43346))

(declare-fun res!54684 () Bool)

(assert (=> b!65980 (=> (not res!54684) (not e!43346))))

(assert (=> b!65980 (= res!54684 (validate_offset_bits!1 ((_ sign_extend 32) (size!1310 (buf!1691 (_2!3034 lt!104750)))) ((_ sign_extend 32) (currentByte!3363 thiss!1379)) ((_ sign_extend 32) (currentBit!3358 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104754 () Unit!4457)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2254 array!2842 (_ BitVec 64)) Unit!4457)

(assert (=> b!65980 (= lt!104754 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1691 (_2!3034 lt!104750)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2254 BitStream!2254) tuple2!5844)

(assert (=> b!65980 (= lt!104756 (reader!0 thiss!1379 (_2!3034 lt!104750)))))

(declare-fun b!65981 () Bool)

(declare-fun res!54666 () Bool)

(assert (=> b!65981 (=> res!54666 e!43341)))

(declare-fun lt!104753 () List!702)

(declare-fun length!330 (List!702) Int)

(assert (=> b!65981 (= res!54666 (<= (length!330 lt!104753) 0))))

(declare-fun b!65982 () Bool)

(declare-fun res!54668 () Bool)

(assert (=> b!65982 (=> res!54668 e!43349)))

(assert (=> b!65982 (= res!54668 (not (invariant!0 (currentBit!3358 (_2!3034 lt!104750)) (currentByte!3363 (_2!3034 lt!104750)) (size!1310 (buf!1691 (_2!3034 lt!104750))))))))

(declare-fun b!65983 () Bool)

(assert (=> b!65983 (= e!43349 e!43341)))

(declare-fun res!54675 () Bool)

(assert (=> b!65983 (=> res!54675 e!43341)))

(assert (=> b!65983 (= res!54675 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104762 () List!702)

(assert (=> b!65983 (= lt!104762 (bitStreamReadBitsIntoList!0 (_2!3034 lt!104755) (_1!3033 lt!104761) lt!104766))))

(assert (=> b!65983 (= lt!104753 (bitStreamReadBitsIntoList!0 (_2!3034 lt!104755) (_1!3033 lt!104764) (bvsub to!314 i!635)))))

(assert (=> b!65983 (validate_offset_bits!1 ((_ sign_extend 32) (size!1310 (buf!1691 (_2!3034 lt!104755)))) ((_ sign_extend 32) (currentByte!3363 (_2!3034 lt!104750))) ((_ sign_extend 32) (currentBit!3358 (_2!3034 lt!104750))) lt!104766)))

(declare-fun lt!104767 () Unit!4457)

(assert (=> b!65983 (= lt!104767 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3034 lt!104750) (buf!1691 (_2!3034 lt!104755)) lt!104766))))

(assert (=> b!65983 (= lt!104761 (reader!0 (_2!3034 lt!104750) (_2!3034 lt!104755)))))

(assert (=> b!65983 (validate_offset_bits!1 ((_ sign_extend 32) (size!1310 (buf!1691 (_2!3034 lt!104755)))) ((_ sign_extend 32) (currentByte!3363 thiss!1379)) ((_ sign_extend 32) (currentBit!3358 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!104752 () Unit!4457)

(assert (=> b!65983 (= lt!104752 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1691 (_2!3034 lt!104755)) (bvsub to!314 i!635)))))

(assert (=> b!65983 (= lt!104764 (reader!0 thiss!1379 (_2!3034 lt!104755)))))

(declare-fun res!54670 () Bool)

(assert (=> start!12876 (=> (not res!54670) (not e!43338))))

(assert (=> start!12876 (= res!54670 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1310 srcBuffer!2))))))))

(assert (=> start!12876 e!43338))

(assert (=> start!12876 true))

(assert (=> start!12876 (array_inv!1186 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2254) Bool)

(assert (=> start!12876 (and (inv!12 thiss!1379) e!43342)))

(declare-fun b!65970 () Bool)

(declare-fun res!54671 () Bool)

(assert (=> b!65970 (=> res!54671 e!43341)))

(assert (=> b!65970 (= res!54671 (or (not (= (buf!1691 (_1!3033 lt!104764)) (buf!1691 (_1!3033 lt!104761)))) (not (= (buf!1691 (_1!3033 lt!104764)) (buf!1691 (_2!3034 lt!104755)))) (bvsge lt!104765 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(assert (= (and start!12876 res!54670) b!65976))

(assert (= (and b!65976 res!54672) b!65973))

(assert (= (and b!65973 (not res!54679)) b!65972))

(assert (= (and b!65972 (not res!54667)) b!65980))

(assert (= (and b!65980 res!54684) b!65967))

(assert (= (and b!65980 (not res!54683)) b!65975))

(assert (= (and b!65975 (not res!54677)) b!65968))

(assert (= (and b!65968 (not res!54682)) b!65965))

(assert (= (and b!65965 (not res!54674)) b!65978))

(assert (= (and b!65978 res!54673) b!65969))

(assert (= (and b!65978 (not res!54680)) b!65982))

(assert (= (and b!65982 (not res!54668)) b!65966))

(assert (= (and b!65966 (not res!54676)) b!65983))

(assert (= (and b!65983 (not res!54675)) b!65981))

(assert (= (and b!65981 (not res!54666)) b!65974))

(assert (= (and b!65974 (not res!54681)) b!65964))

(assert (= (and b!65964 (not res!54678)) b!65979))

(assert (= (and b!65979 (not res!54669)) b!65970))

(assert (= (and b!65970 (not res!54671)) b!65977))

(assert (= start!12876 b!65971))

(declare-fun m!104821 () Bool)

(assert (=> b!65966 m!104821))

(declare-fun m!104823 () Bool)

(assert (=> b!65983 m!104823))

(declare-fun m!104825 () Bool)

(assert (=> b!65983 m!104825))

(declare-fun m!104827 () Bool)

(assert (=> b!65983 m!104827))

(declare-fun m!104829 () Bool)

(assert (=> b!65983 m!104829))

(declare-fun m!104831 () Bool)

(assert (=> b!65983 m!104831))

(declare-fun m!104833 () Bool)

(assert (=> b!65983 m!104833))

(declare-fun m!104835 () Bool)

(assert (=> b!65983 m!104835))

(declare-fun m!104837 () Bool)

(assert (=> b!65983 m!104837))

(declare-fun m!104839 () Bool)

(assert (=> b!65969 m!104839))

(declare-fun m!104841 () Bool)

(assert (=> b!65980 m!104841))

(declare-fun m!104843 () Bool)

(assert (=> b!65980 m!104843))

(declare-fun m!104845 () Bool)

(assert (=> b!65980 m!104845))

(declare-fun m!104847 () Bool)

(assert (=> b!65980 m!104847))

(declare-fun m!104849 () Bool)

(assert (=> b!65980 m!104849))

(declare-fun m!104851 () Bool)

(assert (=> b!65980 m!104851))

(declare-fun m!104853 () Bool)

(assert (=> b!65980 m!104853))

(declare-fun m!104855 () Bool)

(assert (=> b!65979 m!104855))

(declare-fun m!104857 () Bool)

(assert (=> b!65982 m!104857))

(declare-fun m!104859 () Bool)

(assert (=> start!12876 m!104859))

(declare-fun m!104861 () Bool)

(assert (=> start!12876 m!104861))

(declare-fun m!104863 () Bool)

(assert (=> b!65974 m!104863))

(declare-fun m!104865 () Bool)

(assert (=> b!65976 m!104865))

(declare-fun m!104867 () Bool)

(assert (=> b!65964 m!104867))

(declare-fun m!104869 () Bool)

(assert (=> b!65968 m!104869))

(declare-fun m!104871 () Bool)

(assert (=> b!65973 m!104871))

(declare-fun m!104873 () Bool)

(assert (=> b!65973 m!104873))

(declare-fun m!104875 () Bool)

(assert (=> b!65973 m!104875))

(declare-fun m!104877 () Bool)

(assert (=> b!65975 m!104877))

(declare-fun m!104879 () Bool)

(assert (=> b!65981 m!104879))

(declare-fun m!104881 () Bool)

(assert (=> b!65971 m!104881))

(declare-fun m!104883 () Bool)

(assert (=> b!65967 m!104883))

(assert (=> b!65967 m!104883))

(declare-fun m!104885 () Bool)

(assert (=> b!65967 m!104885))

(declare-fun m!104887 () Bool)

(assert (=> b!65967 m!104887))

(assert (=> b!65967 m!104887))

(declare-fun m!104889 () Bool)

(assert (=> b!65967 m!104889))

(declare-fun m!104891 () Bool)

(assert (=> b!65972 m!104891))

(declare-fun m!104893 () Bool)

(assert (=> b!65972 m!104893))

(declare-fun m!104895 () Bool)

(assert (=> b!65972 m!104895))

(assert (=> b!65972 m!104893))

(declare-fun m!104897 () Bool)

(assert (=> b!65972 m!104897))

(declare-fun m!104899 () Bool)

(assert (=> b!65972 m!104899))

(declare-fun m!104901 () Bool)

(assert (=> b!65977 m!104901))

(declare-fun m!104903 () Bool)

(assert (=> b!65977 m!104903))

(push 1)

