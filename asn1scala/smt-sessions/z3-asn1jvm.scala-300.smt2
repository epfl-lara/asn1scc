; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5974 () Bool)

(assert start!5974)

(declare-datatypes ((array!1711 0))(
  ( (array!1712 (arr!1200 (Array (_ BitVec 32) (_ BitVec 8))) (size!738 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1308 0))(
  ( (BitStream!1309 (buf!1065 array!1711) (currentByte!2390 (_ BitVec 32)) (currentBit!2385 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2179 0))(
  ( (Unit!2180) )
))
(declare-datatypes ((tuple2!2982 0))(
  ( (tuple2!2983 (_1!1578 Unit!2179) (_2!1578 BitStream!1308)) )
))
(declare-fun lt!38692 () tuple2!2982)

(declare-fun e!18345 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!38697 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!27108 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27108 (= e!18345 (= lt!38697 (bvsub (bvsub (bvadd (bitIndex!0 (size!738 (buf!1065 (_2!1578 lt!38692))) (currentByte!2390 (_2!1578 lt!38692)) (currentBit!2385 (_2!1578 lt!38692))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27109 () Bool)

(declare-fun e!18344 () Bool)

(declare-fun e!18350 () Bool)

(assert (=> b!27109 (= e!18344 (not e!18350))))

(declare-fun res!23435 () Bool)

(assert (=> b!27109 (=> res!23435 e!18350)))

(assert (=> b!27109 (= res!23435 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1308)

(declare-fun isPrefixOf!0 (BitStream!1308 BitStream!1308) Bool)

(assert (=> b!27109 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38691 () Unit!2179)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1308) Unit!2179)

(assert (=> b!27109 (= lt!38691 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!38687 () (_ BitVec 64))

(assert (=> b!27109 (= lt!38687 (bitIndex!0 (size!738 (buf!1065 thiss!1379)) (currentByte!2390 thiss!1379) (currentBit!2385 thiss!1379)))))

(declare-fun b!27110 () Bool)

(declare-fun res!23426 () Bool)

(declare-fun e!18342 () Bool)

(assert (=> b!27110 (=> res!23426 e!18342)))

(declare-fun lt!38696 () tuple2!2982)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27110 (= res!23426 (not (invariant!0 (currentBit!2385 (_2!1578 lt!38696)) (currentByte!2390 (_2!1578 lt!38696)) (size!738 (buf!1065 (_2!1578 lt!38696))))))))

(declare-fun b!27111 () Bool)

(declare-fun e!18341 () Bool)

(declare-fun e!18351 () Bool)

(assert (=> b!27111 (= e!18341 e!18351)))

(declare-fun res!23434 () Bool)

(assert (=> b!27111 (=> res!23434 e!18351)))

(assert (=> b!27111 (= res!23434 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38689 () (_ BitVec 64))

(declare-datatypes ((tuple2!2984 0))(
  ( (tuple2!2985 (_1!1579 BitStream!1308) (_2!1579 BitStream!1308)) )
))
(declare-fun lt!38694 () tuple2!2984)

(declare-datatypes ((List!355 0))(
  ( (Nil!352) (Cons!351 (h!470 Bool) (t!1105 List!355)) )
))
(declare-fun lt!38703 () List!355)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1308 BitStream!1308 (_ BitVec 64)) List!355)

(assert (=> b!27111 (= lt!38703 (bitStreamReadBitsIntoList!0 (_2!1578 lt!38696) (_1!1579 lt!38694) lt!38689))))

(declare-fun lt!38699 () tuple2!2984)

(declare-fun lt!38688 () List!355)

(assert (=> b!27111 (= lt!38688 (bitStreamReadBitsIntoList!0 (_2!1578 lt!38696) (_1!1579 lt!38699) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27111 (validate_offset_bits!1 ((_ sign_extend 32) (size!738 (buf!1065 (_2!1578 lt!38696)))) ((_ sign_extend 32) (currentByte!2390 (_2!1578 lt!38692))) ((_ sign_extend 32) (currentBit!2385 (_2!1578 lt!38692))) lt!38689)))

(declare-fun lt!38698 () Unit!2179)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1308 array!1711 (_ BitVec 64)) Unit!2179)

(assert (=> b!27111 (= lt!38698 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1578 lt!38692) (buf!1065 (_2!1578 lt!38696)) lt!38689))))

(declare-fun reader!0 (BitStream!1308 BitStream!1308) tuple2!2984)

(assert (=> b!27111 (= lt!38694 (reader!0 (_2!1578 lt!38692) (_2!1578 lt!38696)))))

(assert (=> b!27111 (validate_offset_bits!1 ((_ sign_extend 32) (size!738 (buf!1065 (_2!1578 lt!38696)))) ((_ sign_extend 32) (currentByte!2390 thiss!1379)) ((_ sign_extend 32) (currentBit!2385 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38695 () Unit!2179)

(assert (=> b!27111 (= lt!38695 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1065 (_2!1578 lt!38696)) (bvsub to!314 i!635)))))

(assert (=> b!27111 (= lt!38699 (reader!0 thiss!1379 (_2!1578 lt!38696)))))

(declare-fun b!27112 () Bool)

(declare-fun res!23423 () Bool)

(assert (=> b!27112 (=> res!23423 e!18342)))

(assert (=> b!27112 (= res!23423 (not (= (size!738 (buf!1065 thiss!1379)) (size!738 (buf!1065 (_2!1578 lt!38696))))))))

(declare-fun b!27113 () Bool)

(declare-fun res!23436 () Bool)

(assert (=> b!27113 (=> res!23436 e!18351)))

(declare-fun length!81 (List!355) Int)

(assert (=> b!27113 (= res!23436 (<= (length!81 lt!38688) 0))))

(declare-fun b!27114 () Bool)

(assert (=> b!27114 (= e!18342 e!18341)))

(declare-fun res!23422 () Bool)

(assert (=> b!27114 (=> res!23422 e!18341)))

(assert (=> b!27114 (= res!23422 (not (= (size!738 (buf!1065 (_2!1578 lt!38692))) (size!738 (buf!1065 (_2!1578 lt!38696))))))))

(assert (=> b!27114 e!18345))

(declare-fun res!23425 () Bool)

(assert (=> b!27114 (=> (not res!23425) (not e!18345))))

(assert (=> b!27114 (= res!23425 (= (size!738 (buf!1065 (_2!1578 lt!38696))) (size!738 (buf!1065 thiss!1379))))))

(declare-fun b!27115 () Bool)

(declare-fun res!23428 () Bool)

(assert (=> b!27115 (=> res!23428 e!18341)))

(assert (=> b!27115 (= res!23428 (not (invariant!0 (currentBit!2385 (_2!1578 lt!38692)) (currentByte!2390 (_2!1578 lt!38692)) (size!738 (buf!1065 (_2!1578 lt!38696))))))))

(declare-fun b!27116 () Bool)

(assert (=> b!27116 (= e!18351 true)))

(declare-fun lt!38700 () (_ BitVec 64))

(assert (=> b!27116 (= lt!38700 (bitIndex!0 (size!738 (buf!1065 (_1!1579 lt!38694))) (currentByte!2390 (_1!1579 lt!38694)) (currentBit!2385 (_1!1579 lt!38694))))))

(declare-fun lt!38701 () (_ BitVec 64))

(assert (=> b!27116 (= lt!38701 (bitIndex!0 (size!738 (buf!1065 (_1!1579 lt!38699))) (currentByte!2390 (_1!1579 lt!38699)) (currentBit!2385 (_1!1579 lt!38699))))))

(declare-fun srcBuffer!2 () array!1711)

(declare-fun b!27117 () Bool)

(declare-fun e!18343 () Bool)

(declare-fun lt!38702 () tuple2!2984)

(declare-fun head!192 (List!355) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1308 array!1711 (_ BitVec 64) (_ BitVec 64)) List!355)

(assert (=> b!27117 (= e!18343 (= (head!192 (byteArrayBitContentToList!0 (_2!1578 lt!38692) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!192 (bitStreamReadBitsIntoList!0 (_2!1578 lt!38692) (_1!1579 lt!38702) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!23433 () Bool)

(assert (=> start!5974 (=> (not res!23433) (not e!18344))))

(assert (=> start!5974 (= res!23433 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!738 srcBuffer!2))))))))

(assert (=> start!5974 e!18344))

(assert (=> start!5974 true))

(declare-fun array_inv!707 (array!1711) Bool)

(assert (=> start!5974 (array_inv!707 srcBuffer!2)))

(declare-fun e!18346 () Bool)

(declare-fun inv!12 (BitStream!1308) Bool)

(assert (=> start!5974 (and (inv!12 thiss!1379) e!18346)))

(declare-fun b!27118 () Bool)

(declare-fun res!23431 () Bool)

(assert (=> b!27118 (=> res!23431 e!18351)))

(assert (=> b!27118 (= res!23431 (not (isPrefixOf!0 (_1!1579 lt!38699) (_1!1579 lt!38694))))))

(declare-fun b!27119 () Bool)

(declare-fun e!18349 () Bool)

(assert (=> b!27119 (= e!18350 e!18349)))

(declare-fun res!23424 () Bool)

(assert (=> b!27119 (=> res!23424 e!18349)))

(assert (=> b!27119 (= res!23424 (not (isPrefixOf!0 thiss!1379 (_2!1578 lt!38692))))))

(assert (=> b!27119 (validate_offset_bits!1 ((_ sign_extend 32) (size!738 (buf!1065 (_2!1578 lt!38692)))) ((_ sign_extend 32) (currentByte!2390 (_2!1578 lt!38692))) ((_ sign_extend 32) (currentBit!2385 (_2!1578 lt!38692))) lt!38689)))

(assert (=> b!27119 (= lt!38689 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38704 () Unit!2179)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1308 BitStream!1308 (_ BitVec 64) (_ BitVec 64)) Unit!2179)

(assert (=> b!27119 (= lt!38704 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1578 lt!38692) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1308 (_ BitVec 8) (_ BitVec 32)) tuple2!2982)

(assert (=> b!27119 (= lt!38692 (appendBitFromByte!0 thiss!1379 (select (arr!1200 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27120 () Bool)

(declare-fun res!23437 () Bool)

(assert (=> b!27120 (=> res!23437 e!18351)))

(assert (=> b!27120 (= res!23437 (not (isPrefixOf!0 (_1!1579 lt!38699) (_2!1578 lt!38696))))))

(declare-fun b!27121 () Bool)

(declare-fun res!23421 () Bool)

(assert (=> b!27121 (=> (not res!23421) (not e!18344))))

(assert (=> b!27121 (= res!23421 (validate_offset_bits!1 ((_ sign_extend 32) (size!738 (buf!1065 thiss!1379))) ((_ sign_extend 32) (currentByte!2390 thiss!1379)) ((_ sign_extend 32) (currentBit!2385 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27122 () Bool)

(declare-fun e!18352 () Bool)

(assert (=> b!27122 (= e!18352 e!18342)))

(declare-fun res!23439 () Bool)

(assert (=> b!27122 (=> res!23439 e!18342)))

(assert (=> b!27122 (= res!23439 (not (= lt!38697 (bvsub (bvadd lt!38687 to!314) i!635))))))

(assert (=> b!27122 (= lt!38697 (bitIndex!0 (size!738 (buf!1065 (_2!1578 lt!38696))) (currentByte!2390 (_2!1578 lt!38696)) (currentBit!2385 (_2!1578 lt!38696))))))

(declare-fun b!27123 () Bool)

(assert (=> b!27123 (= e!18346 (array_inv!707 (buf!1065 thiss!1379)))))

(declare-fun b!27124 () Bool)

(assert (=> b!27124 (= e!18349 e!18352)))

(declare-fun res!23429 () Bool)

(assert (=> b!27124 (=> res!23429 e!18352)))

(assert (=> b!27124 (= res!23429 (not (isPrefixOf!0 (_2!1578 lt!38692) (_2!1578 lt!38696))))))

(assert (=> b!27124 (isPrefixOf!0 thiss!1379 (_2!1578 lt!38696))))

(declare-fun lt!38693 () Unit!2179)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1308 BitStream!1308 BitStream!1308) Unit!2179)

(assert (=> b!27124 (= lt!38693 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1578 lt!38692) (_2!1578 lt!38696)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1308 array!1711 (_ BitVec 64) (_ BitVec 64)) tuple2!2982)

(assert (=> b!27124 (= lt!38696 (appendBitsMSBFirstLoop!0 (_2!1578 lt!38692) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!27124 e!18343))

(declare-fun res!23432 () Bool)

(assert (=> b!27124 (=> (not res!23432) (not e!18343))))

(assert (=> b!27124 (= res!23432 (validate_offset_bits!1 ((_ sign_extend 32) (size!738 (buf!1065 (_2!1578 lt!38692)))) ((_ sign_extend 32) (currentByte!2390 thiss!1379)) ((_ sign_extend 32) (currentBit!2385 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38690 () Unit!2179)

(assert (=> b!27124 (= lt!38690 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1065 (_2!1578 lt!38692)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!27124 (= lt!38702 (reader!0 thiss!1379 (_2!1578 lt!38692)))))

(declare-fun b!27125 () Bool)

(declare-fun res!23430 () Bool)

(assert (=> b!27125 (=> res!23430 e!18351)))

(assert (=> b!27125 (= res!23430 (not (isPrefixOf!0 (_1!1579 lt!38694) (_2!1578 lt!38696))))))

(declare-fun b!27126 () Bool)

(declare-fun res!23427 () Bool)

(assert (=> b!27126 (=> res!23427 e!18341)))

(assert (=> b!27126 (= res!23427 (not (invariant!0 (currentBit!2385 (_2!1578 lt!38692)) (currentByte!2390 (_2!1578 lt!38692)) (size!738 (buf!1065 (_2!1578 lt!38692))))))))

(declare-fun b!27127 () Bool)

(declare-fun res!23438 () Bool)

(assert (=> b!27127 (=> res!23438 e!18351)))

(assert (=> b!27127 (= res!23438 (or (not (= (buf!1065 (_1!1579 lt!38699)) (buf!1065 (_1!1579 lt!38694)))) (not (= (buf!1065 (_1!1579 lt!38699)) (buf!1065 (_2!1578 lt!38696)))) (bvsge lt!38697 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(assert (= (and start!5974 res!23433) b!27121))

(assert (= (and b!27121 res!23421) b!27109))

(assert (= (and b!27109 (not res!23435)) b!27119))

(assert (= (and b!27119 (not res!23424)) b!27124))

(assert (= (and b!27124 res!23432) b!27117))

(assert (= (and b!27124 (not res!23429)) b!27122))

(assert (= (and b!27122 (not res!23439)) b!27110))

(assert (= (and b!27110 (not res!23426)) b!27112))

(assert (= (and b!27112 (not res!23423)) b!27114))

(assert (= (and b!27114 res!23425) b!27108))

(assert (= (and b!27114 (not res!23422)) b!27126))

(assert (= (and b!27126 (not res!23427)) b!27115))

(assert (= (and b!27115 (not res!23428)) b!27111))

(assert (= (and b!27111 (not res!23434)) b!27113))

(assert (= (and b!27113 (not res!23436)) b!27120))

(assert (= (and b!27120 (not res!23437)) b!27125))

(assert (= (and b!27125 (not res!23430)) b!27118))

(assert (= (and b!27118 (not res!23431)) b!27127))

(assert (= (and b!27127 (not res!23438)) b!27116))

(assert (= start!5974 b!27123))

(declare-fun m!38853 () Bool)

(assert (=> b!27123 m!38853))

(declare-fun m!38855 () Bool)

(assert (=> b!27109 m!38855))

(declare-fun m!38857 () Bool)

(assert (=> b!27109 m!38857))

(declare-fun m!38859 () Bool)

(assert (=> b!27109 m!38859))

(declare-fun m!38861 () Bool)

(assert (=> b!27125 m!38861))

(declare-fun m!38863 () Bool)

(assert (=> b!27111 m!38863))

(declare-fun m!38865 () Bool)

(assert (=> b!27111 m!38865))

(declare-fun m!38867 () Bool)

(assert (=> b!27111 m!38867))

(declare-fun m!38869 () Bool)

(assert (=> b!27111 m!38869))

(declare-fun m!38871 () Bool)

(assert (=> b!27111 m!38871))

(declare-fun m!38873 () Bool)

(assert (=> b!27111 m!38873))

(declare-fun m!38875 () Bool)

(assert (=> b!27111 m!38875))

(declare-fun m!38877 () Bool)

(assert (=> b!27111 m!38877))

(declare-fun m!38879 () Bool)

(assert (=> b!27110 m!38879))

(declare-fun m!38881 () Bool)

(assert (=> b!27124 m!38881))

(declare-fun m!38883 () Bool)

(assert (=> b!27124 m!38883))

(declare-fun m!38885 () Bool)

(assert (=> b!27124 m!38885))

(declare-fun m!38887 () Bool)

(assert (=> b!27124 m!38887))

(declare-fun m!38889 () Bool)

(assert (=> b!27124 m!38889))

(declare-fun m!38891 () Bool)

(assert (=> b!27124 m!38891))

(declare-fun m!38893 () Bool)

(assert (=> b!27124 m!38893))

(declare-fun m!38895 () Bool)

(assert (=> b!27126 m!38895))

(declare-fun m!38897 () Bool)

(assert (=> b!27120 m!38897))

(declare-fun m!38899 () Bool)

(assert (=> b!27108 m!38899))

(declare-fun m!38901 () Bool)

(assert (=> b!27118 m!38901))

(declare-fun m!38903 () Bool)

(assert (=> b!27121 m!38903))

(declare-fun m!38905 () Bool)

(assert (=> b!27116 m!38905))

(declare-fun m!38907 () Bool)

(assert (=> b!27116 m!38907))

(declare-fun m!38909 () Bool)

(assert (=> b!27115 m!38909))

(declare-fun m!38911 () Bool)

(assert (=> b!27122 m!38911))

(declare-fun m!38913 () Bool)

(assert (=> start!5974 m!38913))

(declare-fun m!38915 () Bool)

(assert (=> start!5974 m!38915))

(declare-fun m!38917 () Bool)

(assert (=> b!27119 m!38917))

(declare-fun m!38919 () Bool)

(assert (=> b!27119 m!38919))

(declare-fun m!38921 () Bool)

(assert (=> b!27119 m!38921))

(declare-fun m!38923 () Bool)

(assert (=> b!27119 m!38923))

(assert (=> b!27119 m!38917))

(declare-fun m!38925 () Bool)

(assert (=> b!27119 m!38925))

(declare-fun m!38927 () Bool)

(assert (=> b!27117 m!38927))

(assert (=> b!27117 m!38927))

(declare-fun m!38929 () Bool)

(assert (=> b!27117 m!38929))

(declare-fun m!38931 () Bool)

(assert (=> b!27117 m!38931))

(assert (=> b!27117 m!38931))

(declare-fun m!38933 () Bool)

(assert (=> b!27117 m!38933))

(declare-fun m!38935 () Bool)

(assert (=> b!27113 m!38935))

(check-sat (not b!27122) (not start!5974) (not b!27125) (not b!27119) (not b!27110) (not b!27115) (not b!27124) (not b!27126) (not b!27121) (not b!27113) (not b!27123) (not b!27117) (not b!27108) (not b!27118) (not b!27116) (not b!27120) (not b!27111) (not b!27109))
