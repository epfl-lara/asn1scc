; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54076 () Bool)

(assert start!54076)

(declare-fun b!251872 () Bool)

(declare-fun e!174530 () Bool)

(assert (=> b!251872 (= e!174530 (not true))))

(declare-datatypes ((array!13700 0))(
  ( (array!13701 (arr!6996 (Array (_ BitVec 32) (_ BitVec 8))) (size!6009 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10940 0))(
  ( (BitStream!10941 (buf!6511 array!13700) (currentByte!11966 (_ BitVec 32)) (currentBit!11961 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21624 0))(
  ( (tuple2!21625 (_1!11740 BitStream!10940) (_2!11740 BitStream!10940)) )
))
(declare-fun lt!391292 () tuple2!21624)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21626 0))(
  ( (tuple2!21627 (_1!11741 BitStream!10940) (_2!11741 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10940) tuple2!21626)

(assert (=> b!251872 (= (_2!11741 (readBitPure!0 (_1!11740 lt!391292))) bit!26)))

(declare-fun lt!391302 () tuple2!21624)

(declare-datatypes ((Unit!18166 0))(
  ( (Unit!18167) )
))
(declare-datatypes ((tuple2!21628 0))(
  ( (tuple2!21629 (_1!11742 Unit!18166) (_2!11742 BitStream!10940)) )
))
(declare-fun lt!391300 () tuple2!21628)

(declare-fun lt!391298 () tuple2!21628)

(declare-fun reader!0 (BitStream!10940 BitStream!10940) tuple2!21624)

(assert (=> b!251872 (= lt!391302 (reader!0 (_2!11742 lt!391300) (_2!11742 lt!391298)))))

(declare-fun thiss!1005 () BitStream!10940)

(assert (=> b!251872 (= lt!391292 (reader!0 thiss!1005 (_2!11742 lt!391298)))))

(declare-fun e!174522 () Bool)

(assert (=> b!251872 e!174522))

(declare-fun res!210978 () Bool)

(assert (=> b!251872 (=> (not res!210978) (not e!174522))))

(declare-fun lt!391296 () tuple2!21626)

(declare-fun lt!391297 () tuple2!21626)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251872 (= res!210978 (= (bitIndex!0 (size!6009 (buf!6511 (_1!11741 lt!391296))) (currentByte!11966 (_1!11741 lt!391296)) (currentBit!11961 (_1!11741 lt!391296))) (bitIndex!0 (size!6009 (buf!6511 (_1!11741 lt!391297))) (currentByte!11966 (_1!11741 lt!391297)) (currentBit!11961 (_1!11741 lt!391297)))))))

(declare-fun lt!391303 () Unit!18166)

(declare-fun lt!391305 () BitStream!10940)

(declare-fun readBitPrefixLemma!0 (BitStream!10940 BitStream!10940) Unit!18166)

(assert (=> b!251872 (= lt!391303 (readBitPrefixLemma!0 lt!391305 (_2!11742 lt!391298)))))

(assert (=> b!251872 (= lt!391297 (readBitPure!0 (BitStream!10941 (buf!6511 (_2!11742 lt!391298)) (currentByte!11966 thiss!1005) (currentBit!11961 thiss!1005))))))

(assert (=> b!251872 (= lt!391296 (readBitPure!0 lt!391305))))

(assert (=> b!251872 (= lt!391305 (BitStream!10941 (buf!6511 (_2!11742 lt!391300)) (currentByte!11966 thiss!1005) (currentBit!11961 thiss!1005)))))

(declare-fun e!174523 () Bool)

(assert (=> b!251872 e!174523))

(declare-fun res!210974 () Bool)

(assert (=> b!251872 (=> (not res!210974) (not e!174523))))

(declare-fun isPrefixOf!0 (BitStream!10940 BitStream!10940) Bool)

(assert (=> b!251872 (= res!210974 (isPrefixOf!0 thiss!1005 (_2!11742 lt!391298)))))

(declare-fun lt!391304 () Unit!18166)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10940 BitStream!10940 BitStream!10940) Unit!18166)

(assert (=> b!251872 (= lt!391304 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11742 lt!391300) (_2!11742 lt!391298)))))

(declare-fun e!174524 () Bool)

(assert (=> b!251872 e!174524))

(declare-fun res!210966 () Bool)

(assert (=> b!251872 (=> (not res!210966) (not e!174524))))

(assert (=> b!251872 (= res!210966 (= (size!6009 (buf!6511 (_2!11742 lt!391300))) (size!6009 (buf!6511 (_2!11742 lt!391298)))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun appendNBitsLoop!0 (BitStream!10940 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21628)

(assert (=> b!251872 (= lt!391298 (appendNBitsLoop!0 (_2!11742 lt!391300) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251872 (validate_offset_bits!1 ((_ sign_extend 32) (size!6009 (buf!6511 (_2!11742 lt!391300)))) ((_ sign_extend 32) (currentByte!11966 (_2!11742 lt!391300))) ((_ sign_extend 32) (currentBit!11961 (_2!11742 lt!391300))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391307 () Unit!18166)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10940 BitStream!10940 (_ BitVec 64) (_ BitVec 64)) Unit!18166)

(assert (=> b!251872 (= lt!391307 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11742 lt!391300) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174527 () Bool)

(assert (=> b!251872 e!174527))

(declare-fun res!210973 () Bool)

(assert (=> b!251872 (=> (not res!210973) (not e!174527))))

(assert (=> b!251872 (= res!210973 (= (size!6009 (buf!6511 thiss!1005)) (size!6009 (buf!6511 (_2!11742 lt!391300)))))))

(declare-fun appendBit!0 (BitStream!10940 Bool) tuple2!21628)

(assert (=> b!251872 (= lt!391300 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251873 () Bool)

(declare-fun e!174529 () Bool)

(assert (=> b!251873 (= e!174527 e!174529)))

(declare-fun res!210967 () Bool)

(assert (=> b!251873 (=> (not res!210967) (not e!174529))))

(declare-fun lt!391301 () (_ BitVec 64))

(declare-fun lt!391294 () (_ BitVec 64))

(assert (=> b!251873 (= res!210967 (= lt!391301 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391294)))))

(assert (=> b!251873 (= lt!391301 (bitIndex!0 (size!6009 (buf!6511 (_2!11742 lt!391300))) (currentByte!11966 (_2!11742 lt!391300)) (currentBit!11961 (_2!11742 lt!391300))))))

(assert (=> b!251873 (= lt!391294 (bitIndex!0 (size!6009 (buf!6511 thiss!1005)) (currentByte!11966 thiss!1005) (currentBit!11961 thiss!1005)))))

(declare-fun b!251874 () Bool)

(declare-fun res!210977 () Bool)

(assert (=> b!251874 (=> (not res!210977) (not e!174530))))

(assert (=> b!251874 (= res!210977 (validate_offset_bits!1 ((_ sign_extend 32) (size!6009 (buf!6511 thiss!1005))) ((_ sign_extend 32) (currentByte!11966 thiss!1005)) ((_ sign_extend 32) (currentBit!11961 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251875 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251875 (= e!174523 (invariant!0 (currentBit!11961 thiss!1005) (currentByte!11966 thiss!1005) (size!6009 (buf!6511 (_2!11742 lt!391298)))))))

(declare-fun b!251876 () Bool)

(declare-fun res!210969 () Bool)

(assert (=> b!251876 (=> (not res!210969) (not e!174529))))

(assert (=> b!251876 (= res!210969 (isPrefixOf!0 thiss!1005 (_2!11742 lt!391300)))))

(declare-fun b!251877 () Bool)

(declare-fun e!174525 () Bool)

(declare-fun lt!391293 () tuple2!21626)

(declare-fun lt!391299 () tuple2!21624)

(assert (=> b!251877 (= e!174525 (not (or (not (_2!11741 lt!391293)) (not (= (_1!11741 lt!391293) (_2!11740 lt!391299))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10940 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21626)

(assert (=> b!251877 (= lt!391293 (checkBitsLoopPure!0 (_1!11740 lt!391299) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!391306 () (_ BitVec 64))

(assert (=> b!251877 (validate_offset_bits!1 ((_ sign_extend 32) (size!6009 (buf!6511 (_2!11742 lt!391298)))) ((_ sign_extend 32) (currentByte!11966 (_2!11742 lt!391300))) ((_ sign_extend 32) (currentBit!11961 (_2!11742 lt!391300))) lt!391306)))

(declare-fun lt!391308 () Unit!18166)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10940 array!13700 (_ BitVec 64)) Unit!18166)

(assert (=> b!251877 (= lt!391308 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11742 lt!391300) (buf!6511 (_2!11742 lt!391298)) lt!391306))))

(assert (=> b!251877 (= lt!391299 (reader!0 (_2!11742 lt!391300) (_2!11742 lt!391298)))))

(declare-fun b!251878 () Bool)

(declare-fun e!174521 () Bool)

(declare-fun array_inv!5750 (array!13700) Bool)

(assert (=> b!251878 (= e!174521 (array_inv!5750 (buf!6511 thiss!1005)))))

(declare-fun b!251879 () Bool)

(assert (=> b!251879 (= e!174524 e!174525)))

(declare-fun res!210972 () Bool)

(assert (=> b!251879 (=> (not res!210972) (not e!174525))))

(assert (=> b!251879 (= res!210972 (= (bitIndex!0 (size!6009 (buf!6511 (_2!11742 lt!391298))) (currentByte!11966 (_2!11742 lt!391298)) (currentBit!11961 (_2!11742 lt!391298))) (bvadd (bitIndex!0 (size!6009 (buf!6511 (_2!11742 lt!391300))) (currentByte!11966 (_2!11742 lt!391300)) (currentBit!11961 (_2!11742 lt!391300))) lt!391306)))))

(assert (=> b!251879 (= lt!391306 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!210976 () Bool)

(assert (=> start!54076 (=> (not res!210976) (not e!174530))))

(assert (=> start!54076 (= res!210976 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54076 e!174530))

(assert (=> start!54076 true))

(declare-fun inv!12 (BitStream!10940) Bool)

(assert (=> start!54076 (and (inv!12 thiss!1005) e!174521)))

(declare-fun b!251880 () Bool)

(assert (=> b!251880 (= e!174522 (= (_2!11741 lt!391296) (_2!11741 lt!391297)))))

(declare-fun b!251881 () Bool)

(declare-fun e!174528 () Bool)

(assert (=> b!251881 (= e!174529 e!174528)))

(declare-fun res!210968 () Bool)

(assert (=> b!251881 (=> (not res!210968) (not e!174528))))

(declare-fun lt!391295 () tuple2!21626)

(assert (=> b!251881 (= res!210968 (and (= (_2!11741 lt!391295) bit!26) (= (_1!11741 lt!391295) (_2!11742 lt!391300))))))

(declare-fun readerFrom!0 (BitStream!10940 (_ BitVec 32) (_ BitVec 32)) BitStream!10940)

(assert (=> b!251881 (= lt!391295 (readBitPure!0 (readerFrom!0 (_2!11742 lt!391300) (currentBit!11961 thiss!1005) (currentByte!11966 thiss!1005))))))

(declare-fun b!251882 () Bool)

(declare-fun res!210970 () Bool)

(assert (=> b!251882 (=> (not res!210970) (not e!174530))))

(assert (=> b!251882 (= res!210970 (bvslt from!289 nBits!297))))

(declare-fun b!251883 () Bool)

(declare-fun res!210975 () Bool)

(assert (=> b!251883 (=> (not res!210975) (not e!174523))))

(assert (=> b!251883 (= res!210975 (invariant!0 (currentBit!11961 thiss!1005) (currentByte!11966 thiss!1005) (size!6009 (buf!6511 (_2!11742 lt!391300)))))))

(declare-fun b!251884 () Bool)

(declare-fun res!210971 () Bool)

(assert (=> b!251884 (=> (not res!210971) (not e!174525))))

(assert (=> b!251884 (= res!210971 (isPrefixOf!0 (_2!11742 lt!391300) (_2!11742 lt!391298)))))

(declare-fun b!251885 () Bool)

(assert (=> b!251885 (= e!174528 (= (bitIndex!0 (size!6009 (buf!6511 (_1!11741 lt!391295))) (currentByte!11966 (_1!11741 lt!391295)) (currentBit!11961 (_1!11741 lt!391295))) lt!391301))))

(assert (= (and start!54076 res!210976) b!251874))

(assert (= (and b!251874 res!210977) b!251882))

(assert (= (and b!251882 res!210970) b!251872))

(assert (= (and b!251872 res!210973) b!251873))

(assert (= (and b!251873 res!210967) b!251876))

(assert (= (and b!251876 res!210969) b!251881))

(assert (= (and b!251881 res!210968) b!251885))

(assert (= (and b!251872 res!210966) b!251879))

(assert (= (and b!251879 res!210972) b!251884))

(assert (= (and b!251884 res!210971) b!251877))

(assert (= (and b!251872 res!210974) b!251883))

(assert (= (and b!251883 res!210975) b!251875))

(assert (= (and b!251872 res!210978) b!251880))

(assert (= start!54076 b!251878))

(declare-fun m!378927 () Bool)

(assert (=> start!54076 m!378927))

(declare-fun m!378929 () Bool)

(assert (=> b!251881 m!378929))

(assert (=> b!251881 m!378929))

(declare-fun m!378931 () Bool)

(assert (=> b!251881 m!378931))

(declare-fun m!378933 () Bool)

(assert (=> b!251884 m!378933))

(declare-fun m!378935 () Bool)

(assert (=> b!251878 m!378935))

(declare-fun m!378937 () Bool)

(assert (=> b!251872 m!378937))

(declare-fun m!378939 () Bool)

(assert (=> b!251872 m!378939))

(declare-fun m!378941 () Bool)

(assert (=> b!251872 m!378941))

(declare-fun m!378943 () Bool)

(assert (=> b!251872 m!378943))

(declare-fun m!378945 () Bool)

(assert (=> b!251872 m!378945))

(declare-fun m!378947 () Bool)

(assert (=> b!251872 m!378947))

(declare-fun m!378949 () Bool)

(assert (=> b!251872 m!378949))

(declare-fun m!378951 () Bool)

(assert (=> b!251872 m!378951))

(declare-fun m!378953 () Bool)

(assert (=> b!251872 m!378953))

(declare-fun m!378955 () Bool)

(assert (=> b!251872 m!378955))

(declare-fun m!378957 () Bool)

(assert (=> b!251872 m!378957))

(declare-fun m!378959 () Bool)

(assert (=> b!251872 m!378959))

(declare-fun m!378961 () Bool)

(assert (=> b!251872 m!378961))

(declare-fun m!378963 () Bool)

(assert (=> b!251872 m!378963))

(declare-fun m!378965 () Bool)

(assert (=> b!251883 m!378965))

(declare-fun m!378967 () Bool)

(assert (=> b!251874 m!378967))

(declare-fun m!378969 () Bool)

(assert (=> b!251876 m!378969))

(declare-fun m!378971 () Bool)

(assert (=> b!251879 m!378971))

(declare-fun m!378973 () Bool)

(assert (=> b!251879 m!378973))

(declare-fun m!378975 () Bool)

(assert (=> b!251875 m!378975))

(assert (=> b!251873 m!378973))

(declare-fun m!378977 () Bool)

(assert (=> b!251873 m!378977))

(declare-fun m!378979 () Bool)

(assert (=> b!251885 m!378979))

(declare-fun m!378981 () Bool)

(assert (=> b!251877 m!378981))

(declare-fun m!378983 () Bool)

(assert (=> b!251877 m!378983))

(declare-fun m!378985 () Bool)

(assert (=> b!251877 m!378985))

(assert (=> b!251877 m!378961))

(push 1)

(assert (not b!251872))

(assert (not b!251873))

(assert (not b!251879))

(assert (not b!251885))

(assert (not start!54076))

(assert (not b!251877))

(assert (not b!251874))

(assert (not b!251876))

(assert (not b!251881))

(assert (not b!251878))

(assert (not b!251883))

(assert (not b!251884))

(assert (not b!251875))

(check-sat)

