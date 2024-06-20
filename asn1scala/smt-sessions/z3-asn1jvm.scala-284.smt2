; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5686 () Bool)

(assert start!5686)

(declare-fun b!24042 () Bool)

(declare-fun res!20725 () Bool)

(declare-fun e!16349 () Bool)

(assert (=> b!24042 (=> res!20725 e!16349)))

(declare-datatypes ((array!1609 0))(
  ( (array!1610 (arr!1146 (Array (_ BitVec 32) (_ BitVec 8))) (size!690 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1212 0))(
  ( (BitStream!1213 (buf!1011 array!1609) (currentByte!2324 (_ BitVec 32)) (currentBit!2319 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1212)

(declare-datatypes ((Unit!2023 0))(
  ( (Unit!2024) )
))
(declare-datatypes ((tuple2!2742 0))(
  ( (tuple2!2743 (_1!1458 Unit!2023) (_2!1458 BitStream!1212)) )
))
(declare-fun lt!34521 () tuple2!2742)

(assert (=> b!24042 (= res!20725 (not (= (size!690 (buf!1011 thiss!1379)) (size!690 (buf!1011 (_2!1458 lt!34521))))))))

(declare-fun b!24043 () Bool)

(declare-fun e!16344 () Bool)

(assert (=> b!24043 (= e!16344 true)))

(declare-fun lt!34518 () tuple2!2742)

(declare-fun lt!34519 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24043 (validate_offset_bits!1 ((_ sign_extend 32) (size!690 (buf!1011 (_2!1458 lt!34521)))) ((_ sign_extend 32) (currentByte!2324 (_2!1458 lt!34518))) ((_ sign_extend 32) (currentBit!2319 (_2!1458 lt!34518))) lt!34519)))

(declare-fun lt!34529 () Unit!2023)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1212 array!1609 (_ BitVec 64)) Unit!2023)

(assert (=> b!24043 (= lt!34529 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1458 lt!34518) (buf!1011 (_2!1458 lt!34521)) lt!34519))))

(declare-datatypes ((tuple2!2744 0))(
  ( (tuple2!2745 (_1!1459 BitStream!1212) (_2!1459 BitStream!1212)) )
))
(declare-fun lt!34524 () tuple2!2744)

(declare-fun reader!0 (BitStream!1212 BitStream!1212) tuple2!2744)

(assert (=> b!24043 (= lt!34524 (reader!0 (_2!1458 lt!34518) (_2!1458 lt!34521)))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!24043 (validate_offset_bits!1 ((_ sign_extend 32) (size!690 (buf!1011 (_2!1458 lt!34521)))) ((_ sign_extend 32) (currentByte!2324 thiss!1379)) ((_ sign_extend 32) (currentBit!2319 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34522 () Unit!2023)

(assert (=> b!24043 (= lt!34522 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1011 (_2!1458 lt!34521)) (bvsub to!314 i!635)))))

(declare-fun lt!34530 () tuple2!2744)

(assert (=> b!24043 (= lt!34530 (reader!0 thiss!1379 (_2!1458 lt!34521)))))

(declare-fun b!24044 () Bool)

(declare-fun e!16341 () Bool)

(declare-fun array_inv!659 (array!1609) Bool)

(assert (=> b!24044 (= e!16341 (array_inv!659 (buf!1011 thiss!1379)))))

(declare-fun b!24046 () Bool)

(declare-fun e!16351 () Bool)

(declare-fun e!16347 () Bool)

(assert (=> b!24046 (= e!16351 (not e!16347))))

(declare-fun res!20731 () Bool)

(assert (=> b!24046 (=> res!20731 e!16347)))

(assert (=> b!24046 (= res!20731 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1212 BitStream!1212) Bool)

(assert (=> b!24046 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34528 () Unit!2023)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1212) Unit!2023)

(assert (=> b!24046 (= lt!34528 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!34531 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24046 (= lt!34531 (bitIndex!0 (size!690 (buf!1011 thiss!1379)) (currentByte!2324 thiss!1379) (currentBit!2319 thiss!1379)))))

(declare-fun b!24047 () Bool)

(declare-fun res!20721 () Bool)

(assert (=> b!24047 (=> res!20721 e!16349)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24047 (= res!20721 (not (invariant!0 (currentBit!2319 (_2!1458 lt!34521)) (currentByte!2324 (_2!1458 lt!34521)) (size!690 (buf!1011 (_2!1458 lt!34521))))))))

(declare-fun b!24048 () Bool)

(declare-fun res!20724 () Bool)

(assert (=> b!24048 (=> res!20724 e!16344)))

(assert (=> b!24048 (= res!20724 (not (invariant!0 (currentBit!2319 (_2!1458 lt!34518)) (currentByte!2324 (_2!1458 lt!34518)) (size!690 (buf!1011 (_2!1458 lt!34521))))))))

(declare-fun b!24049 () Bool)

(declare-fun res!20728 () Bool)

(assert (=> b!24049 (=> (not res!20728) (not e!16351))))

(assert (=> b!24049 (= res!20728 (validate_offset_bits!1 ((_ sign_extend 32) (size!690 (buf!1011 thiss!1379))) ((_ sign_extend 32) (currentByte!2324 thiss!1379)) ((_ sign_extend 32) (currentBit!2319 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun e!16346 () Bool)

(declare-fun b!24050 () Bool)

(declare-fun lt!34526 () (_ BitVec 64))

(assert (=> b!24050 (= e!16346 (= lt!34526 (bvsub (bvsub (bvadd (bitIndex!0 (size!690 (buf!1011 (_2!1458 lt!34518))) (currentByte!2324 (_2!1458 lt!34518)) (currentBit!2319 (_2!1458 lt!34518))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!20726 () Bool)

(assert (=> start!5686 (=> (not res!20726) (not e!16351))))

(declare-fun srcBuffer!2 () array!1609)

(assert (=> start!5686 (= res!20726 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!690 srcBuffer!2))))))))

(assert (=> start!5686 e!16351))

(assert (=> start!5686 true))

(assert (=> start!5686 (array_inv!659 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1212) Bool)

(assert (=> start!5686 (and (inv!12 thiss!1379) e!16341)))

(declare-fun lt!34520 () tuple2!2744)

(declare-fun b!24045 () Bool)

(declare-fun e!16342 () Bool)

(declare-datatypes ((List!307 0))(
  ( (Nil!304) (Cons!303 (h!422 Bool) (t!1057 List!307)) )
))
(declare-fun head!144 (List!307) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1212 array!1609 (_ BitVec 64) (_ BitVec 64)) List!307)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1212 BitStream!1212 (_ BitVec 64)) List!307)

(assert (=> b!24045 (= e!16342 (= (head!144 (byteArrayBitContentToList!0 (_2!1458 lt!34518) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!144 (bitStreamReadBitsIntoList!0 (_2!1458 lt!34518) (_1!1459 lt!34520) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24051 () Bool)

(declare-fun res!20729 () Bool)

(assert (=> b!24051 (=> res!20729 e!16344)))

(assert (=> b!24051 (= res!20729 (not (invariant!0 (currentBit!2319 (_2!1458 lt!34518)) (currentByte!2324 (_2!1458 lt!34518)) (size!690 (buf!1011 (_2!1458 lt!34518))))))))

(declare-fun b!24052 () Bool)

(assert (=> b!24052 (= e!16349 e!16344)))

(declare-fun res!20727 () Bool)

(assert (=> b!24052 (=> res!20727 e!16344)))

(assert (=> b!24052 (= res!20727 (not (= (size!690 (buf!1011 (_2!1458 lt!34518))) (size!690 (buf!1011 (_2!1458 lt!34521))))))))

(assert (=> b!24052 e!16346))

(declare-fun res!20723 () Bool)

(assert (=> b!24052 (=> (not res!20723) (not e!16346))))

(assert (=> b!24052 (= res!20723 (= (size!690 (buf!1011 (_2!1458 lt!34521))) (size!690 (buf!1011 thiss!1379))))))

(declare-fun b!24053 () Bool)

(declare-fun e!16350 () Bool)

(declare-fun e!16343 () Bool)

(assert (=> b!24053 (= e!16350 e!16343)))

(declare-fun res!20733 () Bool)

(assert (=> b!24053 (=> res!20733 e!16343)))

(assert (=> b!24053 (= res!20733 (not (isPrefixOf!0 (_2!1458 lt!34518) (_2!1458 lt!34521))))))

(assert (=> b!24053 (isPrefixOf!0 thiss!1379 (_2!1458 lt!34521))))

(declare-fun lt!34525 () Unit!2023)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1212 BitStream!1212 BitStream!1212) Unit!2023)

(assert (=> b!24053 (= lt!34525 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1458 lt!34518) (_2!1458 lt!34521)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1212 array!1609 (_ BitVec 64) (_ BitVec 64)) tuple2!2742)

(assert (=> b!24053 (= lt!34521 (appendBitsMSBFirstLoop!0 (_2!1458 lt!34518) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24053 e!16342))

(declare-fun res!20722 () Bool)

(assert (=> b!24053 (=> (not res!20722) (not e!16342))))

(assert (=> b!24053 (= res!20722 (validate_offset_bits!1 ((_ sign_extend 32) (size!690 (buf!1011 (_2!1458 lt!34518)))) ((_ sign_extend 32) (currentByte!2324 thiss!1379)) ((_ sign_extend 32) (currentBit!2319 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34523 () Unit!2023)

(assert (=> b!24053 (= lt!34523 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1011 (_2!1458 lt!34518)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24053 (= lt!34520 (reader!0 thiss!1379 (_2!1458 lt!34518)))))

(declare-fun b!24054 () Bool)

(assert (=> b!24054 (= e!16343 e!16349)))

(declare-fun res!20730 () Bool)

(assert (=> b!24054 (=> res!20730 e!16349)))

(assert (=> b!24054 (= res!20730 (not (= lt!34526 (bvsub (bvadd lt!34531 to!314) i!635))))))

(assert (=> b!24054 (= lt!34526 (bitIndex!0 (size!690 (buf!1011 (_2!1458 lt!34521))) (currentByte!2324 (_2!1458 lt!34521)) (currentBit!2319 (_2!1458 lt!34521))))))

(declare-fun b!24055 () Bool)

(assert (=> b!24055 (= e!16347 e!16350)))

(declare-fun res!20732 () Bool)

(assert (=> b!24055 (=> res!20732 e!16350)))

(assert (=> b!24055 (= res!20732 (not (isPrefixOf!0 thiss!1379 (_2!1458 lt!34518))))))

(assert (=> b!24055 (validate_offset_bits!1 ((_ sign_extend 32) (size!690 (buf!1011 (_2!1458 lt!34518)))) ((_ sign_extend 32) (currentByte!2324 (_2!1458 lt!34518))) ((_ sign_extend 32) (currentBit!2319 (_2!1458 lt!34518))) lt!34519)))

(assert (=> b!24055 (= lt!34519 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34527 () Unit!2023)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1212 BitStream!1212 (_ BitVec 64) (_ BitVec 64)) Unit!2023)

(assert (=> b!24055 (= lt!34527 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1458 lt!34518) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1212 (_ BitVec 8) (_ BitVec 32)) tuple2!2742)

(assert (=> b!24055 (= lt!34518 (appendBitFromByte!0 thiss!1379 (select (arr!1146 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5686 res!20726) b!24049))

(assert (= (and b!24049 res!20728) b!24046))

(assert (= (and b!24046 (not res!20731)) b!24055))

(assert (= (and b!24055 (not res!20732)) b!24053))

(assert (= (and b!24053 res!20722) b!24045))

(assert (= (and b!24053 (not res!20733)) b!24054))

(assert (= (and b!24054 (not res!20730)) b!24047))

(assert (= (and b!24047 (not res!20721)) b!24042))

(assert (= (and b!24042 (not res!20725)) b!24052))

(assert (= (and b!24052 res!20723) b!24050))

(assert (= (and b!24052 (not res!20727)) b!24051))

(assert (= (and b!24051 (not res!20729)) b!24048))

(assert (= (and b!24048 (not res!20724)) b!24043))

(assert (= start!5686 b!24044))

(declare-fun m!33869 () Bool)

(assert (=> b!24050 m!33869))

(declare-fun m!33871 () Bool)

(assert (=> b!24049 m!33871))

(declare-fun m!33873 () Bool)

(assert (=> b!24046 m!33873))

(declare-fun m!33875 () Bool)

(assert (=> b!24046 m!33875))

(declare-fun m!33877 () Bool)

(assert (=> b!24046 m!33877))

(declare-fun m!33879 () Bool)

(assert (=> b!24047 m!33879))

(declare-fun m!33881 () Bool)

(assert (=> b!24043 m!33881))

(declare-fun m!33883 () Bool)

(assert (=> b!24043 m!33883))

(declare-fun m!33885 () Bool)

(assert (=> b!24043 m!33885))

(declare-fun m!33887 () Bool)

(assert (=> b!24043 m!33887))

(declare-fun m!33889 () Bool)

(assert (=> b!24043 m!33889))

(declare-fun m!33891 () Bool)

(assert (=> b!24043 m!33891))

(declare-fun m!33893 () Bool)

(assert (=> b!24048 m!33893))

(declare-fun m!33895 () Bool)

(assert (=> b!24053 m!33895))

(declare-fun m!33897 () Bool)

(assert (=> b!24053 m!33897))

(declare-fun m!33899 () Bool)

(assert (=> b!24053 m!33899))

(declare-fun m!33901 () Bool)

(assert (=> b!24053 m!33901))

(declare-fun m!33903 () Bool)

(assert (=> b!24053 m!33903))

(declare-fun m!33905 () Bool)

(assert (=> b!24053 m!33905))

(declare-fun m!33907 () Bool)

(assert (=> b!24053 m!33907))

(declare-fun m!33909 () Bool)

(assert (=> b!24045 m!33909))

(assert (=> b!24045 m!33909))

(declare-fun m!33911 () Bool)

(assert (=> b!24045 m!33911))

(declare-fun m!33913 () Bool)

(assert (=> b!24045 m!33913))

(assert (=> b!24045 m!33913))

(declare-fun m!33915 () Bool)

(assert (=> b!24045 m!33915))

(declare-fun m!33917 () Bool)

(assert (=> b!24044 m!33917))

(declare-fun m!33919 () Bool)

(assert (=> b!24054 m!33919))

(declare-fun m!33921 () Bool)

(assert (=> b!24051 m!33921))

(declare-fun m!33923 () Bool)

(assert (=> b!24055 m!33923))

(declare-fun m!33925 () Bool)

(assert (=> b!24055 m!33925))

(declare-fun m!33927 () Bool)

(assert (=> b!24055 m!33927))

(declare-fun m!33929 () Bool)

(assert (=> b!24055 m!33929))

(assert (=> b!24055 m!33927))

(declare-fun m!33931 () Bool)

(assert (=> b!24055 m!33931))

(declare-fun m!33933 () Bool)

(assert (=> start!5686 m!33933))

(declare-fun m!33935 () Bool)

(assert (=> start!5686 m!33935))

(check-sat (not b!24050) (not b!24054) (not b!24048) (not b!24053) (not start!5686) (not b!24044) (not b!24051) (not b!24046) (not b!24055) (not b!24047) (not b!24049) (not b!24045) (not b!24043))
