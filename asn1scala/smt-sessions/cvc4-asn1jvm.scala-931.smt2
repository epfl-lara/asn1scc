; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26364 () Bool)

(assert start!26364)

(declare-fun b!135066 () Bool)

(declare-fun res!112300 () Bool)

(declare-fun e!89646 () Bool)

(assert (=> b!135066 (=> (not res!112300) (not e!89646))))

(declare-datatypes ((array!6164 0))(
  ( (array!6165 (arr!3455 (Array (_ BitVec 32) (_ BitVec 8))) (size!2790 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4844 0))(
  ( (BitStream!4845 (buf!3183 array!6164) (currentByte!5980 (_ BitVec 32)) (currentBit!5975 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8418 0))(
  ( (Unit!8419) )
))
(declare-datatypes ((tuple2!11716 0))(
  ( (tuple2!11717 (_1!6174 Unit!8418) (_2!6174 BitStream!4844)) )
))
(declare-fun lt!209598 () tuple2!11716)

(declare-fun lt!209586 () tuple2!11716)

(declare-fun isPrefixOf!0 (BitStream!4844 BitStream!4844) Bool)

(assert (=> b!135066 (= res!112300 (isPrefixOf!0 (_2!6174 lt!209598) (_2!6174 lt!209586)))))

(declare-fun b!135067 () Bool)

(declare-fun res!112306 () Bool)

(declare-fun e!89643 () Bool)

(assert (=> b!135067 (=> (not res!112306) (not e!89643))))

(declare-fun thiss!1634 () BitStream!4844)

(assert (=> b!135067 (= res!112306 (isPrefixOf!0 thiss!1634 (_2!6174 lt!209598)))))

(declare-fun b!135068 () Bool)

(declare-fun res!112296 () Bool)

(declare-fun e!89640 () Bool)

(assert (=> b!135068 (=> (not res!112296) (not e!89640))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135068 (= res!112296 (invariant!0 (currentBit!5975 thiss!1634) (currentByte!5980 thiss!1634) (size!2790 (buf!3183 thiss!1634))))))

(declare-fun b!135069 () Bool)

(declare-fun res!112307 () Bool)

(assert (=> b!135069 (=> (not res!112307) (not e!89643))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135069 (= res!112307 (= (bitIndex!0 (size!2790 (buf!3183 (_2!6174 lt!209598))) (currentByte!5980 (_2!6174 lt!209598)) (currentBit!5975 (_2!6174 lt!209598))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2790 (buf!3183 thiss!1634)) (currentByte!5980 thiss!1634) (currentBit!5975 thiss!1634)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6164)

(declare-fun b!135070 () Bool)

(declare-fun e!89648 () Bool)

(declare-datatypes ((tuple2!11718 0))(
  ( (tuple2!11719 (_1!6175 BitStream!4844) (_2!6175 array!6164)) )
))
(declare-fun lt!209596 () tuple2!11718)

(declare-fun arrayRangesEq!193 (array!6164 array!6164 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135070 (= e!89648 (not (arrayRangesEq!193 arr!237 (_2!6175 lt!209596) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135071 () Bool)

(assert (=> b!135071 (= e!89646 (not e!89648))))

(declare-fun res!112304 () Bool)

(assert (=> b!135071 (=> res!112304 e!89648)))

(declare-datatypes ((tuple2!11720 0))(
  ( (tuple2!11721 (_1!6176 BitStream!4844) (_2!6176 BitStream!4844)) )
))
(declare-fun lt!209600 () tuple2!11720)

(assert (=> b!135071 (= res!112304 (or (not (= (size!2790 (_2!6175 lt!209596)) (size!2790 arr!237))) (not (= (_1!6175 lt!209596) (_2!6176 lt!209600)))))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4844 array!6164 (_ BitVec 32) (_ BitVec 32)) tuple2!11718)

(assert (=> b!135071 (= lt!209596 (readByteArrayLoopPure!0 (_1!6176 lt!209600) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209591 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135071 (validate_offset_bits!1 ((_ sign_extend 32) (size!2790 (buf!3183 (_2!6174 lt!209586)))) ((_ sign_extend 32) (currentByte!5980 (_2!6174 lt!209598))) ((_ sign_extend 32) (currentBit!5975 (_2!6174 lt!209598))) lt!209591)))

(declare-fun lt!209597 () Unit!8418)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4844 array!6164 (_ BitVec 64)) Unit!8418)

(assert (=> b!135071 (= lt!209597 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6174 lt!209598) (buf!3183 (_2!6174 lt!209586)) lt!209591))))

(declare-fun reader!0 (BitStream!4844 BitStream!4844) tuple2!11720)

(assert (=> b!135071 (= lt!209600 (reader!0 (_2!6174 lt!209598) (_2!6174 lt!209586)))))

(declare-fun b!135072 () Bool)

(declare-fun res!112301 () Bool)

(assert (=> b!135072 (=> (not res!112301) (not e!89640))))

(assert (=> b!135072 (= res!112301 (bvslt from!447 to!404))))

(declare-fun b!135074 () Bool)

(declare-fun e!89642 () Bool)

(assert (=> b!135074 (= e!89640 (not e!89642))))

(declare-fun res!112297 () Bool)

(assert (=> b!135074 (=> res!112297 e!89642)))

(declare-fun lt!209588 () tuple2!11718)

(declare-fun lt!209593 () tuple2!11718)

(assert (=> b!135074 (= res!112297 (not (arrayRangesEq!193 (_2!6175 lt!209588) (_2!6175 lt!209593) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209603 () tuple2!11718)

(assert (=> b!135074 (arrayRangesEq!193 (_2!6175 lt!209588) (_2!6175 lt!209603) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209581 () tuple2!11720)

(declare-fun lt!209584 () Unit!8418)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4844 array!6164 (_ BitVec 32) (_ BitVec 32)) Unit!8418)

(assert (=> b!135074 (= lt!209584 (readByteArrayLoopArrayPrefixLemma!0 (_1!6176 lt!209581) arr!237 from!447 to!404))))

(declare-fun lt!209594 () array!6164)

(declare-fun withMovedByteIndex!0 (BitStream!4844 (_ BitVec 32)) BitStream!4844)

(assert (=> b!135074 (= lt!209603 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6176 lt!209581) #b00000000000000000000000000000001) lt!209594 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209602 () tuple2!11720)

(assert (=> b!135074 (= lt!209593 (readByteArrayLoopPure!0 (_1!6176 lt!209602) lt!209594 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11722 0))(
  ( (tuple2!11723 (_1!6177 BitStream!4844) (_2!6177 (_ BitVec 8))) )
))
(declare-fun lt!209582 () tuple2!11722)

(assert (=> b!135074 (= lt!209594 (array!6165 (store (arr!3455 arr!237) from!447 (_2!6177 lt!209582)) (size!2790 arr!237)))))

(declare-fun lt!209580 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135074 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2790 (buf!3183 (_2!6174 lt!209586)))) ((_ sign_extend 32) (currentByte!5980 (_2!6174 lt!209598))) ((_ sign_extend 32) (currentBit!5975 (_2!6174 lt!209598))) lt!209580)))

(declare-fun lt!209587 () Unit!8418)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4844 array!6164 (_ BitVec 32)) Unit!8418)

(assert (=> b!135074 (= lt!209587 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6174 lt!209598) (buf!3183 (_2!6174 lt!209586)) lt!209580))))

(assert (=> b!135074 (= (_1!6175 lt!209588) (_2!6176 lt!209581))))

(assert (=> b!135074 (= lt!209588 (readByteArrayLoopPure!0 (_1!6176 lt!209581) arr!237 from!447 to!404))))

(assert (=> b!135074 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2790 (buf!3183 (_2!6174 lt!209586)))) ((_ sign_extend 32) (currentByte!5980 thiss!1634)) ((_ sign_extend 32) (currentBit!5975 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209590 () Unit!8418)

(assert (=> b!135074 (= lt!209590 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3183 (_2!6174 lt!209586)) (bvsub to!404 from!447)))))

(assert (=> b!135074 (= (_2!6177 lt!209582) (select (arr!3455 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4844) tuple2!11722)

(assert (=> b!135074 (= lt!209582 (readBytePure!0 (_1!6176 lt!209581)))))

(assert (=> b!135074 (= lt!209602 (reader!0 (_2!6174 lt!209598) (_2!6174 lt!209586)))))

(assert (=> b!135074 (= lt!209581 (reader!0 thiss!1634 (_2!6174 lt!209586)))))

(declare-fun e!89647 () Bool)

(assert (=> b!135074 e!89647))

(declare-fun res!112303 () Bool)

(assert (=> b!135074 (=> (not res!112303) (not e!89647))))

(declare-fun lt!209604 () tuple2!11722)

(declare-fun lt!209583 () tuple2!11722)

(assert (=> b!135074 (= res!112303 (= (bitIndex!0 (size!2790 (buf!3183 (_1!6177 lt!209604))) (currentByte!5980 (_1!6177 lt!209604)) (currentBit!5975 (_1!6177 lt!209604))) (bitIndex!0 (size!2790 (buf!3183 (_1!6177 lt!209583))) (currentByte!5980 (_1!6177 lt!209583)) (currentBit!5975 (_1!6177 lt!209583)))))))

(declare-fun lt!209601 () Unit!8418)

(declare-fun lt!209585 () BitStream!4844)

(declare-fun readBytePrefixLemma!0 (BitStream!4844 BitStream!4844) Unit!8418)

(assert (=> b!135074 (= lt!209601 (readBytePrefixLemma!0 lt!209585 (_2!6174 lt!209586)))))

(assert (=> b!135074 (= lt!209583 (readBytePure!0 (BitStream!4845 (buf!3183 (_2!6174 lt!209586)) (currentByte!5980 thiss!1634) (currentBit!5975 thiss!1634))))))

(assert (=> b!135074 (= lt!209604 (readBytePure!0 lt!209585))))

(assert (=> b!135074 (= lt!209585 (BitStream!4845 (buf!3183 (_2!6174 lt!209598)) (currentByte!5980 thiss!1634) (currentBit!5975 thiss!1634)))))

(declare-fun e!89645 () Bool)

(assert (=> b!135074 e!89645))

(declare-fun res!112298 () Bool)

(assert (=> b!135074 (=> (not res!112298) (not e!89645))))

(assert (=> b!135074 (= res!112298 (isPrefixOf!0 thiss!1634 (_2!6174 lt!209586)))))

(declare-fun lt!209589 () Unit!8418)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4844 BitStream!4844 BitStream!4844) Unit!8418)

(assert (=> b!135074 (= lt!209589 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6174 lt!209598) (_2!6174 lt!209586)))))

(declare-fun e!89644 () Bool)

(assert (=> b!135074 e!89644))

(declare-fun res!112295 () Bool)

(assert (=> b!135074 (=> (not res!112295) (not e!89644))))

(assert (=> b!135074 (= res!112295 (= (size!2790 (buf!3183 (_2!6174 lt!209598))) (size!2790 (buf!3183 (_2!6174 lt!209586)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4844 array!6164 (_ BitVec 32) (_ BitVec 32)) tuple2!11716)

(assert (=> b!135074 (= lt!209586 (appendByteArrayLoop!0 (_2!6174 lt!209598) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135074 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2790 (buf!3183 (_2!6174 lt!209598)))) ((_ sign_extend 32) (currentByte!5980 (_2!6174 lt!209598))) ((_ sign_extend 32) (currentBit!5975 (_2!6174 lt!209598))) lt!209580)))

(assert (=> b!135074 (= lt!209580 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209605 () Unit!8418)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4844 BitStream!4844 (_ BitVec 64) (_ BitVec 32)) Unit!8418)

(assert (=> b!135074 (= lt!209605 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6174 lt!209598) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135074 e!89643))

(declare-fun res!112305 () Bool)

(assert (=> b!135074 (=> (not res!112305) (not e!89643))))

(assert (=> b!135074 (= res!112305 (= (size!2790 (buf!3183 thiss!1634)) (size!2790 (buf!3183 (_2!6174 lt!209598)))))))

(declare-fun appendByte!0 (BitStream!4844 (_ BitVec 8)) tuple2!11716)

(assert (=> b!135074 (= lt!209598 (appendByte!0 thiss!1634 (select (arr!3455 arr!237) from!447)))))

(declare-fun b!135075 () Bool)

(declare-fun lt!209592 () tuple2!11720)

(declare-fun lt!209595 () tuple2!11722)

(assert (=> b!135075 (= e!89643 (and (= (_2!6177 lt!209595) (select (arr!3455 arr!237) from!447)) (= (_1!6177 lt!209595) (_2!6176 lt!209592))))))

(assert (=> b!135075 (= lt!209595 (readBytePure!0 (_1!6176 lt!209592)))))

(assert (=> b!135075 (= lt!209592 (reader!0 thiss!1634 (_2!6174 lt!209598)))))

(declare-fun b!135076 () Bool)

(assert (=> b!135076 (= e!89642 true)))

(assert (=> b!135076 (arrayRangesEq!193 (_2!6175 lt!209593) (_2!6175 lt!209588) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209599 () Unit!8418)

(declare-fun arrayRangesEqSymmetricLemma!6 (array!6164 array!6164 (_ BitVec 32) (_ BitVec 32)) Unit!8418)

(assert (=> b!135076 (= lt!209599 (arrayRangesEqSymmetricLemma!6 (_2!6175 lt!209588) (_2!6175 lt!209593) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135077 () Bool)

(assert (=> b!135077 (= e!89647 (= (_2!6177 lt!209604) (_2!6177 lt!209583)))))

(declare-fun b!135078 () Bool)

(declare-fun e!89639 () Bool)

(declare-fun array_inv!2579 (array!6164) Bool)

(assert (=> b!135078 (= e!89639 (array_inv!2579 (buf!3183 thiss!1634)))))

(declare-fun b!135079 () Bool)

(declare-fun res!112299 () Bool)

(assert (=> b!135079 (=> (not res!112299) (not e!89640))))

(assert (=> b!135079 (= res!112299 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2790 (buf!3183 thiss!1634))) ((_ sign_extend 32) (currentByte!5980 thiss!1634)) ((_ sign_extend 32) (currentBit!5975 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135080 () Bool)

(assert (=> b!135080 (= e!89645 (invariant!0 (currentBit!5975 thiss!1634) (currentByte!5980 thiss!1634) (size!2790 (buf!3183 (_2!6174 lt!209598)))))))

(declare-fun b!135073 () Bool)

(assert (=> b!135073 (= e!89644 e!89646)))

(declare-fun res!112302 () Bool)

(assert (=> b!135073 (=> (not res!112302) (not e!89646))))

(assert (=> b!135073 (= res!112302 (= (bitIndex!0 (size!2790 (buf!3183 (_2!6174 lt!209586))) (currentByte!5980 (_2!6174 lt!209586)) (currentBit!5975 (_2!6174 lt!209586))) (bvadd (bitIndex!0 (size!2790 (buf!3183 (_2!6174 lt!209598))) (currentByte!5980 (_2!6174 lt!209598)) (currentBit!5975 (_2!6174 lt!209598))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209591))))))

(assert (=> b!135073 (= lt!209591 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!112308 () Bool)

(assert (=> start!26364 (=> (not res!112308) (not e!89640))))

(assert (=> start!26364 (= res!112308 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2790 arr!237))))))

(assert (=> start!26364 e!89640))

(assert (=> start!26364 true))

(assert (=> start!26364 (array_inv!2579 arr!237)))

(declare-fun inv!12 (BitStream!4844) Bool)

(assert (=> start!26364 (and (inv!12 thiss!1634) e!89639)))

(assert (= (and start!26364 res!112308) b!135079))

(assert (= (and b!135079 res!112299) b!135072))

(assert (= (and b!135072 res!112301) b!135068))

(assert (= (and b!135068 res!112296) b!135074))

(assert (= (and b!135074 res!112305) b!135069))

(assert (= (and b!135069 res!112307) b!135067))

(assert (= (and b!135067 res!112306) b!135075))

(assert (= (and b!135074 res!112295) b!135073))

(assert (= (and b!135073 res!112302) b!135066))

(assert (= (and b!135066 res!112300) b!135071))

(assert (= (and b!135071 (not res!112304)) b!135070))

(assert (= (and b!135074 res!112298) b!135080))

(assert (= (and b!135074 res!112303) b!135077))

(assert (= (and b!135074 (not res!112297)) b!135076))

(assert (= start!26364 b!135078))

(declare-fun m!205859 () Bool)

(assert (=> b!135073 m!205859))

(declare-fun m!205861 () Bool)

(assert (=> b!135073 m!205861))

(assert (=> b!135069 m!205861))

(declare-fun m!205863 () Bool)

(assert (=> b!135069 m!205863))

(declare-fun m!205865 () Bool)

(assert (=> b!135070 m!205865))

(declare-fun m!205867 () Bool)

(assert (=> b!135079 m!205867))

(declare-fun m!205869 () Bool)

(assert (=> b!135071 m!205869))

(declare-fun m!205871 () Bool)

(assert (=> b!135071 m!205871))

(declare-fun m!205873 () Bool)

(assert (=> b!135071 m!205873))

(declare-fun m!205875 () Bool)

(assert (=> b!135071 m!205875))

(declare-fun m!205877 () Bool)

(assert (=> b!135074 m!205877))

(declare-fun m!205879 () Bool)

(assert (=> b!135074 m!205879))

(declare-fun m!205881 () Bool)

(assert (=> b!135074 m!205881))

(declare-fun m!205883 () Bool)

(assert (=> b!135074 m!205883))

(declare-fun m!205885 () Bool)

(assert (=> b!135074 m!205885))

(declare-fun m!205887 () Bool)

(assert (=> b!135074 m!205887))

(declare-fun m!205889 () Bool)

(assert (=> b!135074 m!205889))

(declare-fun m!205891 () Bool)

(assert (=> b!135074 m!205891))

(declare-fun m!205893 () Bool)

(assert (=> b!135074 m!205893))

(declare-fun m!205895 () Bool)

(assert (=> b!135074 m!205895))

(declare-fun m!205897 () Bool)

(assert (=> b!135074 m!205897))

(declare-fun m!205899 () Bool)

(assert (=> b!135074 m!205899))

(declare-fun m!205901 () Bool)

(assert (=> b!135074 m!205901))

(declare-fun m!205903 () Bool)

(assert (=> b!135074 m!205903))

(declare-fun m!205905 () Bool)

(assert (=> b!135074 m!205905))

(declare-fun m!205907 () Bool)

(assert (=> b!135074 m!205907))

(assert (=> b!135074 m!205875))

(declare-fun m!205909 () Bool)

(assert (=> b!135074 m!205909))

(declare-fun m!205911 () Bool)

(assert (=> b!135074 m!205911))

(declare-fun m!205913 () Bool)

(assert (=> b!135074 m!205913))

(declare-fun m!205915 () Bool)

(assert (=> b!135074 m!205915))

(declare-fun m!205917 () Bool)

(assert (=> b!135074 m!205917))

(declare-fun m!205919 () Bool)

(assert (=> b!135074 m!205919))

(declare-fun m!205921 () Bool)

(assert (=> b!135074 m!205921))

(declare-fun m!205923 () Bool)

(assert (=> b!135074 m!205923))

(assert (=> b!135074 m!205915))

(declare-fun m!205925 () Bool)

(assert (=> b!135074 m!205925))

(declare-fun m!205927 () Bool)

(assert (=> b!135074 m!205927))

(assert (=> b!135074 m!205895))

(declare-fun m!205929 () Bool)

(assert (=> b!135078 m!205929))

(declare-fun m!205931 () Bool)

(assert (=> b!135076 m!205931))

(declare-fun m!205933 () Bool)

(assert (=> b!135076 m!205933))

(declare-fun m!205935 () Bool)

(assert (=> start!26364 m!205935))

(declare-fun m!205937 () Bool)

(assert (=> start!26364 m!205937))

(declare-fun m!205939 () Bool)

(assert (=> b!135067 m!205939))

(declare-fun m!205941 () Bool)

(assert (=> b!135066 m!205941))

(declare-fun m!205943 () Bool)

(assert (=> b!135080 m!205943))

(assert (=> b!135075 m!205895))

(declare-fun m!205945 () Bool)

(assert (=> b!135075 m!205945))

(declare-fun m!205947 () Bool)

(assert (=> b!135075 m!205947))

(declare-fun m!205949 () Bool)

(assert (=> b!135068 m!205949))

(push 1)

(assert (not b!135068))

(assert (not b!135070))

(assert (not b!135079))

(assert (not b!135078))

(assert (not b!135080))

(assert (not start!26364))

(assert (not b!135075))

(assert (not b!135073))

(assert (not b!135066))

(assert (not b!135067))

(assert (not b!135074))

(assert (not b!135071))

(assert (not b!135076))

(assert (not b!135069))

(check-sat)

