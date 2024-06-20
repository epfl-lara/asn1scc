; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26740 () Bool)

(assert start!26740)

(declare-fun b!137879 () Bool)

(declare-fun e!91675 () Bool)

(declare-fun e!91677 () Bool)

(assert (=> b!137879 (= e!91675 e!91677)))

(declare-fun res!114873 () Bool)

(assert (=> b!137879 (=> (not res!114873) (not e!91677))))

(declare-fun lt!214952 () (_ BitVec 64))

(declare-datatypes ((array!6249 0))(
  ( (array!6250 (arr!3516 (Array (_ BitVec 32) (_ BitVec 8))) (size!2830 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4924 0))(
  ( (BitStream!4925 (buf!3237 array!6249) (currentByte!6044 (_ BitVec 32)) (currentBit!6039 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8607 0))(
  ( (Unit!8608) )
))
(declare-datatypes ((tuple2!12050 0))(
  ( (tuple2!12051 (_1!6348 Unit!8607) (_2!6348 BitStream!4924)) )
))
(declare-fun lt!214944 () tuple2!12050)

(declare-fun lt!214953 () tuple2!12050)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!137879 (= res!114873 (= (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214953))) (currentByte!6044 (_2!6348 lt!214953)) (currentBit!6039 (_2!6348 lt!214953))) (bvadd (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214944))) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!214952))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!137879 (= lt!214952 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!137880 () Bool)

(declare-fun e!91676 () Bool)

(declare-fun e!91667 () Bool)

(assert (=> b!137880 (= e!91676 e!91667)))

(declare-fun res!114876 () Bool)

(assert (=> b!137880 (=> res!114876 e!91667)))

(declare-fun thiss!1634 () BitStream!4924)

(declare-fun lt!214946 () (_ BitVec 64))

(assert (=> b!137880 (= res!114876 (not (= (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214953))) (currentByte!6044 (_2!6348 lt!214953)) (currentBit!6039 (_2!6348 lt!214953))) (bvadd (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!214946)))))))

(assert (=> b!137880 (= lt!214946 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!137881 () Bool)

(declare-fun res!114864 () Bool)

(declare-fun e!91665 () Bool)

(assert (=> b!137881 (=> (not res!114864) (not e!91665))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137881 (= res!114864 (invariant!0 (currentBit!6039 thiss!1634) (currentByte!6044 thiss!1634) (size!2830 (buf!3237 thiss!1634))))))

(declare-fun b!137882 () Bool)

(declare-fun res!114879 () Bool)

(assert (=> b!137882 (=> (not res!114879) (not e!91665))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137882 (= res!114879 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 thiss!1634))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!137883 () Bool)

(declare-fun res!114870 () Bool)

(assert (=> b!137883 (=> (not res!114870) (not e!91677))))

(declare-fun isPrefixOf!0 (BitStream!4924 BitStream!4924) Bool)

(assert (=> b!137883 (= res!114870 (isPrefixOf!0 (_2!6348 lt!214944) (_2!6348 lt!214953)))))

(declare-fun b!137884 () Bool)

(declare-fun e!91666 () Bool)

(assert (=> b!137884 (= e!91677 (not e!91666))))

(declare-fun res!114872 () Bool)

(assert (=> b!137884 (=> res!114872 e!91666)))

(declare-datatypes ((tuple2!12052 0))(
  ( (tuple2!12053 (_1!6349 BitStream!4924) (_2!6349 array!6249)) )
))
(declare-fun lt!214937 () tuple2!12052)

(declare-datatypes ((tuple2!12054 0))(
  ( (tuple2!12055 (_1!6350 BitStream!4924) (_2!6350 BitStream!4924)) )
))
(declare-fun lt!214949 () tuple2!12054)

(declare-fun arr!237 () array!6249)

(assert (=> b!137884 (= res!114872 (or (not (= (size!2830 (_2!6349 lt!214937)) (size!2830 arr!237))) (not (= (_1!6349 lt!214937) (_2!6350 lt!214949)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4924 array!6249 (_ BitVec 32) (_ BitVec 32)) tuple2!12052)

(assert (=> b!137884 (= lt!214937 (readByteArrayLoopPure!0 (_1!6350 lt!214949) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!137884 (validate_offset_bits!1 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) lt!214952)))

(declare-fun lt!214928 () Unit!8607)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4924 array!6249 (_ BitVec 64)) Unit!8607)

(assert (=> b!137884 (= lt!214928 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6348 lt!214944) (buf!3237 (_2!6348 lt!214953)) lt!214952))))

(declare-fun reader!0 (BitStream!4924 BitStream!4924) tuple2!12054)

(assert (=> b!137884 (= lt!214949 (reader!0 (_2!6348 lt!214944) (_2!6348 lt!214953)))))

(declare-fun b!137885 () Bool)

(declare-fun arrayRangesEq!233 (array!6249 array!6249 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137885 (= e!91666 (not (arrayRangesEq!233 arr!237 (_2!6349 lt!214937) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!137886 () Bool)

(declare-fun res!114865 () Bool)

(declare-fun e!91673 () Bool)

(assert (=> b!137886 (=> (not res!114865) (not e!91673))))

(assert (=> b!137886 (= res!114865 (= (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214944))) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)))))))

(declare-fun res!114869 () Bool)

(assert (=> start!26740 (=> (not res!114869) (not e!91665))))

(assert (=> start!26740 (= res!114869 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2830 arr!237))))))

(assert (=> start!26740 e!91665))

(assert (=> start!26740 true))

(declare-fun array_inv!2619 (array!6249) Bool)

(assert (=> start!26740 (array_inv!2619 arr!237)))

(declare-fun e!91671 () Bool)

(declare-fun inv!12 (BitStream!4924) Bool)

(assert (=> start!26740 (and (inv!12 thiss!1634) e!91671)))

(declare-fun lt!214938 () tuple2!12054)

(declare-fun b!137887 () Bool)

(declare-datatypes ((tuple2!12056 0))(
  ( (tuple2!12057 (_1!6351 BitStream!4924) (_2!6351 (_ BitVec 8))) )
))
(declare-fun lt!214941 () tuple2!12056)

(assert (=> b!137887 (= e!91673 (and (= (_2!6351 lt!214941) (select (arr!3516 arr!237) from!447)) (= (_1!6351 lt!214941) (_2!6350 lt!214938))))))

(declare-fun readBytePure!0 (BitStream!4924) tuple2!12056)

(assert (=> b!137887 (= lt!214941 (readBytePure!0 (_1!6350 lt!214938)))))

(assert (=> b!137887 (= lt!214938 (reader!0 thiss!1634 (_2!6348 lt!214944)))))

(declare-fun b!137888 () Bool)

(declare-fun e!91674 () Bool)

(assert (=> b!137888 (= e!91674 (invariant!0 (currentBit!6039 thiss!1634) (currentByte!6044 thiss!1634) (size!2830 (buf!3237 (_2!6348 lt!214944)))))))

(declare-fun b!137889 () Bool)

(declare-fun e!91672 () Bool)

(declare-fun lt!214951 () tuple2!12056)

(declare-fun lt!214926 () tuple2!12056)

(assert (=> b!137889 (= e!91672 (= (_2!6351 lt!214951) (_2!6351 lt!214926)))))

(declare-fun b!137890 () Bool)

(declare-fun e!91669 () Bool)

(assert (=> b!137890 (= e!91665 (not e!91669))))

(declare-fun res!114875 () Bool)

(assert (=> b!137890 (=> res!114875 e!91669)))

(declare-fun lt!214929 () tuple2!12052)

(declare-fun lt!214931 () tuple2!12052)

(assert (=> b!137890 (= res!114875 (not (arrayRangesEq!233 (_2!6349 lt!214931) (_2!6349 lt!214929) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!214943 () tuple2!12052)

(assert (=> b!137890 (arrayRangesEq!233 (_2!6349 lt!214931) (_2!6349 lt!214943) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214935 () Unit!8607)

(declare-fun lt!214925 () tuple2!12054)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4924 array!6249 (_ BitVec 32) (_ BitVec 32)) Unit!8607)

(assert (=> b!137890 (= lt!214935 (readByteArrayLoopArrayPrefixLemma!0 (_1!6350 lt!214925) arr!237 from!447 to!404))))

(declare-fun lt!214934 () array!6249)

(declare-fun withMovedByteIndex!0 (BitStream!4924 (_ BitVec 32)) BitStream!4924)

(assert (=> b!137890 (= lt!214943 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6350 lt!214925) #b00000000000000000000000000000001) lt!214934 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!214927 () tuple2!12054)

(assert (=> b!137890 (= lt!214929 (readByteArrayLoopPure!0 (_1!6350 lt!214927) lt!214934 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!214936 () tuple2!12056)

(assert (=> b!137890 (= lt!214934 (array!6250 (store (arr!3516 arr!237) from!447 (_2!6351 lt!214936)) (size!2830 arr!237)))))

(declare-fun lt!214932 () (_ BitVec 32))

(assert (=> b!137890 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) lt!214932)))

(declare-fun lt!214939 () Unit!8607)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4924 array!6249 (_ BitVec 32)) Unit!8607)

(assert (=> b!137890 (= lt!214939 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6348 lt!214944) (buf!3237 (_2!6348 lt!214953)) lt!214932))))

(assert (=> b!137890 (= (_1!6349 lt!214931) (_2!6350 lt!214925))))

(assert (=> b!137890 (= lt!214931 (readByteArrayLoopPure!0 (_1!6350 lt!214925) arr!237 from!447 to!404))))

(assert (=> b!137890 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!214947 () Unit!8607)

(assert (=> b!137890 (= lt!214947 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3237 (_2!6348 lt!214953)) (bvsub to!404 from!447)))))

(assert (=> b!137890 (= (_2!6351 lt!214936) (select (arr!3516 arr!237) from!447))))

(assert (=> b!137890 (= lt!214936 (readBytePure!0 (_1!6350 lt!214925)))))

(assert (=> b!137890 (= lt!214927 (reader!0 (_2!6348 lt!214944) (_2!6348 lt!214953)))))

(assert (=> b!137890 (= lt!214925 (reader!0 thiss!1634 (_2!6348 lt!214953)))))

(assert (=> b!137890 e!91672))

(declare-fun res!114866 () Bool)

(assert (=> b!137890 (=> (not res!114866) (not e!91672))))

(assert (=> b!137890 (= res!114866 (= (bitIndex!0 (size!2830 (buf!3237 (_1!6351 lt!214951))) (currentByte!6044 (_1!6351 lt!214951)) (currentBit!6039 (_1!6351 lt!214951))) (bitIndex!0 (size!2830 (buf!3237 (_1!6351 lt!214926))) (currentByte!6044 (_1!6351 lt!214926)) (currentBit!6039 (_1!6351 lt!214926)))))))

(declare-fun lt!214940 () Unit!8607)

(declare-fun lt!214945 () BitStream!4924)

(declare-fun readBytePrefixLemma!0 (BitStream!4924 BitStream!4924) Unit!8607)

(assert (=> b!137890 (= lt!214940 (readBytePrefixLemma!0 lt!214945 (_2!6348 lt!214953)))))

(assert (=> b!137890 (= lt!214926 (readBytePure!0 (BitStream!4925 (buf!3237 (_2!6348 lt!214953)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634))))))

(assert (=> b!137890 (= lt!214951 (readBytePure!0 lt!214945))))

(assert (=> b!137890 (= lt!214945 (BitStream!4925 (buf!3237 (_2!6348 lt!214944)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)))))

(assert (=> b!137890 e!91674))

(declare-fun res!114871 () Bool)

(assert (=> b!137890 (=> (not res!114871) (not e!91674))))

(assert (=> b!137890 (= res!114871 (isPrefixOf!0 thiss!1634 (_2!6348 lt!214953)))))

(declare-fun lt!214950 () Unit!8607)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4924 BitStream!4924 BitStream!4924) Unit!8607)

(assert (=> b!137890 (= lt!214950 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6348 lt!214944) (_2!6348 lt!214953)))))

(assert (=> b!137890 e!91675))

(declare-fun res!114874 () Bool)

(assert (=> b!137890 (=> (not res!114874) (not e!91675))))

(assert (=> b!137890 (= res!114874 (= (size!2830 (buf!3237 (_2!6348 lt!214944))) (size!2830 (buf!3237 (_2!6348 lt!214953)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4924 array!6249 (_ BitVec 32) (_ BitVec 32)) tuple2!12050)

(assert (=> b!137890 (= lt!214953 (appendByteArrayLoop!0 (_2!6348 lt!214944) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!137890 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214944)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) lt!214932)))

(assert (=> b!137890 (= lt!214932 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!214942 () Unit!8607)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4924 BitStream!4924 (_ BitVec 64) (_ BitVec 32)) Unit!8607)

(assert (=> b!137890 (= lt!214942 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6348 lt!214944) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!137890 e!91673))

(declare-fun res!114867 () Bool)

(assert (=> b!137890 (=> (not res!114867) (not e!91673))))

(assert (=> b!137890 (= res!114867 (= (size!2830 (buf!3237 thiss!1634)) (size!2830 (buf!3237 (_2!6348 lt!214944)))))))

(declare-fun appendByte!0 (BitStream!4924 (_ BitVec 8)) tuple2!12050)

(assert (=> b!137890 (= lt!214944 (appendByte!0 thiss!1634 (select (arr!3516 arr!237) from!447)))))

(declare-fun b!137891 () Bool)

(assert (=> b!137891 (= e!91671 (array_inv!2619 (buf!3237 thiss!1634)))))

(declare-fun b!137892 () Bool)

(assert (=> b!137892 (= e!91667 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_1!6350 lt!214925)))) ((_ sign_extend 32) (currentByte!6044 (_1!6350 lt!214925))) ((_ sign_extend 32) (currentBit!6039 (_1!6350 lt!214925))) (bvsub to!404 from!447)))))

(assert (=> b!137892 (validate_offset_bits!1 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634)) lt!214946)))

(declare-fun lt!214948 () Unit!8607)

(assert (=> b!137892 (= lt!214948 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3237 (_2!6348 lt!214953)) lt!214946))))

(declare-fun b!137893 () Bool)

(declare-fun res!114868 () Bool)

(assert (=> b!137893 (=> (not res!114868) (not e!91673))))

(assert (=> b!137893 (= res!114868 (isPrefixOf!0 thiss!1634 (_2!6348 lt!214944)))))

(declare-fun b!137894 () Bool)

(assert (=> b!137894 (= e!91669 e!91676)))

(declare-fun res!114877 () Bool)

(assert (=> b!137894 (=> res!114877 e!91676)))

(assert (=> b!137894 (= res!114877 (not (= (size!2830 (buf!3237 thiss!1634)) (size!2830 (buf!3237 (_2!6348 lt!214953))))))))

(assert (=> b!137894 (arrayRangesEq!233 arr!237 (_2!6349 lt!214931) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214930 () Unit!8607)

(declare-fun arrayRangesEqTransitive!35 (array!6249 array!6249 array!6249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8607)

(assert (=> b!137894 (= lt!214930 (arrayRangesEqTransitive!35 arr!237 (_2!6349 lt!214929) (_2!6349 lt!214931) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!137894 (arrayRangesEq!233 (_2!6349 lt!214929) (_2!6349 lt!214931) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214933 () Unit!8607)

(declare-fun arrayRangesEqSymmetricLemma!46 (array!6249 array!6249 (_ BitVec 32) (_ BitVec 32)) Unit!8607)

(assert (=> b!137894 (= lt!214933 (arrayRangesEqSymmetricLemma!46 (_2!6349 lt!214931) (_2!6349 lt!214929) #b00000000000000000000000000000000 to!404))))

(declare-fun b!137895 () Bool)

(declare-fun res!114878 () Bool)

(assert (=> b!137895 (=> (not res!114878) (not e!91665))))

(assert (=> b!137895 (= res!114878 (bvslt from!447 to!404))))

(assert (= (and start!26740 res!114869) b!137882))

(assert (= (and b!137882 res!114879) b!137895))

(assert (= (and b!137895 res!114878) b!137881))

(assert (= (and b!137881 res!114864) b!137890))

(assert (= (and b!137890 res!114867) b!137886))

(assert (= (and b!137886 res!114865) b!137893))

(assert (= (and b!137893 res!114868) b!137887))

(assert (= (and b!137890 res!114874) b!137879))

(assert (= (and b!137879 res!114873) b!137883))

(assert (= (and b!137883 res!114870) b!137884))

(assert (= (and b!137884 (not res!114872)) b!137885))

(assert (= (and b!137890 res!114871) b!137888))

(assert (= (and b!137890 res!114866) b!137889))

(assert (= (and b!137890 (not res!114875)) b!137894))

(assert (= (and b!137894 (not res!114877)) b!137880))

(assert (= (and b!137880 (not res!114876)) b!137892))

(assert (= start!26740 b!137891))

(declare-fun m!211835 () Bool)

(assert (=> b!137888 m!211835))

(declare-fun m!211837 () Bool)

(assert (=> b!137892 m!211837))

(declare-fun m!211839 () Bool)

(assert (=> b!137892 m!211839))

(declare-fun m!211841 () Bool)

(assert (=> b!137892 m!211841))

(declare-fun m!211843 () Bool)

(assert (=> b!137894 m!211843))

(declare-fun m!211845 () Bool)

(assert (=> b!137894 m!211845))

(declare-fun m!211847 () Bool)

(assert (=> b!137894 m!211847))

(declare-fun m!211849 () Bool)

(assert (=> b!137894 m!211849))

(declare-fun m!211851 () Bool)

(assert (=> b!137881 m!211851))

(declare-fun m!211853 () Bool)

(assert (=> b!137882 m!211853))

(declare-fun m!211855 () Bool)

(assert (=> b!137887 m!211855))

(declare-fun m!211857 () Bool)

(assert (=> b!137887 m!211857))

(declare-fun m!211859 () Bool)

(assert (=> b!137887 m!211859))

(declare-fun m!211861 () Bool)

(assert (=> b!137883 m!211861))

(declare-fun m!211863 () Bool)

(assert (=> b!137893 m!211863))

(declare-fun m!211865 () Bool)

(assert (=> b!137886 m!211865))

(declare-fun m!211867 () Bool)

(assert (=> b!137886 m!211867))

(declare-fun m!211869 () Bool)

(assert (=> b!137891 m!211869))

(declare-fun m!211871 () Bool)

(assert (=> b!137879 m!211871))

(assert (=> b!137879 m!211865))

(declare-fun m!211873 () Bool)

(assert (=> b!137890 m!211873))

(declare-fun m!211875 () Bool)

(assert (=> b!137890 m!211875))

(declare-fun m!211877 () Bool)

(assert (=> b!137890 m!211877))

(declare-fun m!211879 () Bool)

(assert (=> b!137890 m!211879))

(declare-fun m!211881 () Bool)

(assert (=> b!137890 m!211881))

(declare-fun m!211883 () Bool)

(assert (=> b!137890 m!211883))

(declare-fun m!211885 () Bool)

(assert (=> b!137890 m!211885))

(declare-fun m!211887 () Bool)

(assert (=> b!137890 m!211887))

(declare-fun m!211889 () Bool)

(assert (=> b!137890 m!211889))

(assert (=> b!137890 m!211855))

(declare-fun m!211891 () Bool)

(assert (=> b!137890 m!211891))

(declare-fun m!211893 () Bool)

(assert (=> b!137890 m!211893))

(declare-fun m!211895 () Bool)

(assert (=> b!137890 m!211895))

(declare-fun m!211897 () Bool)

(assert (=> b!137890 m!211897))

(declare-fun m!211899 () Bool)

(assert (=> b!137890 m!211899))

(declare-fun m!211901 () Bool)

(assert (=> b!137890 m!211901))

(declare-fun m!211903 () Bool)

(assert (=> b!137890 m!211903))

(declare-fun m!211905 () Bool)

(assert (=> b!137890 m!211905))

(declare-fun m!211907 () Bool)

(assert (=> b!137890 m!211907))

(declare-fun m!211909 () Bool)

(assert (=> b!137890 m!211909))

(declare-fun m!211911 () Bool)

(assert (=> b!137890 m!211911))

(declare-fun m!211913 () Bool)

(assert (=> b!137890 m!211913))

(declare-fun m!211915 () Bool)

(assert (=> b!137890 m!211915))

(declare-fun m!211917 () Bool)

(assert (=> b!137890 m!211917))

(assert (=> b!137890 m!211901))

(declare-fun m!211919 () Bool)

(assert (=> b!137890 m!211919))

(assert (=> b!137890 m!211855))

(declare-fun m!211921 () Bool)

(assert (=> b!137890 m!211921))

(declare-fun m!211923 () Bool)

(assert (=> b!137890 m!211923))

(declare-fun m!211925 () Bool)

(assert (=> b!137884 m!211925))

(declare-fun m!211927 () Bool)

(assert (=> b!137884 m!211927))

(declare-fun m!211929 () Bool)

(assert (=> b!137884 m!211929))

(assert (=> b!137884 m!211873))

(declare-fun m!211931 () Bool)

(assert (=> b!137885 m!211931))

(assert (=> b!137880 m!211871))

(assert (=> b!137880 m!211867))

(declare-fun m!211933 () Bool)

(assert (=> start!26740 m!211933))

(declare-fun m!211935 () Bool)

(assert (=> start!26740 m!211935))

(push 1)

(assert (not start!26740))

(assert (not b!137881))

(assert (not b!137880))

(assert (not b!137890))

(assert (not b!137885))

(assert (not b!137891))

(assert (not b!137888))

(assert (not b!137883))

(assert (not b!137879))

(assert (not b!137892))

(assert (not b!137893))

(assert (not b!137887))

(assert (not b!137882))

(assert (not b!137884))

(assert (not b!137894))

(assert (not b!137886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44298 () Bool)

(assert (=> d!44298 (= (invariant!0 (currentBit!6039 thiss!1634) (currentByte!6044 thiss!1634) (size!2830 (buf!3237 (_2!6348 lt!214944)))) (and (bvsge (currentBit!6039 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6039 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6044 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6044 thiss!1634) (size!2830 (buf!3237 (_2!6348 lt!214944)))) (and (= (currentBit!6039 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6044 thiss!1634) (size!2830 (buf!3237 (_2!6348 lt!214944))))))))))

(assert (=> b!137888 d!44298))

(declare-fun d!44300 () Bool)

(declare-datatypes ((tuple2!12074 0))(
  ( (tuple2!12075 (_1!6360 (_ BitVec 8)) (_2!6360 BitStream!4924)) )
))
(declare-fun lt!215130 () tuple2!12074)

(declare-fun readByte!0 (BitStream!4924) tuple2!12074)

(assert (=> d!44300 (= lt!215130 (readByte!0 (_1!6350 lt!214938)))))

(assert (=> d!44300 (= (readBytePure!0 (_1!6350 lt!214938)) (tuple2!12057 (_2!6360 lt!215130) (_1!6360 lt!215130)))))

(declare-fun bs!10805 () Bool)

(assert (= bs!10805 d!44300))

(declare-fun m!212141 () Bool)

(assert (=> bs!10805 m!212141))

(assert (=> b!137887 d!44300))

(declare-fun b!138008 () Bool)

(declare-fun lt!215174 () (_ BitVec 64))

(declare-fun lt!215173 () (_ BitVec 64))

(declare-fun e!91761 () Bool)

(declare-fun lt!215184 () tuple2!12054)

(declare-fun withMovedBitIndex!0 (BitStream!4924 (_ BitVec 64)) BitStream!4924)

(assert (=> b!138008 (= e!91761 (= (_1!6350 lt!215184) (withMovedBitIndex!0 (_2!6350 lt!215184) (bvsub lt!215173 lt!215174))))))

(assert (=> b!138008 (or (= (bvand lt!215173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215173 lt!215174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138008 (= lt!215174 (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214944))) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944))))))

(assert (=> b!138008 (= lt!215173 (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)))))

(declare-fun b!138009 () Bool)

(declare-fun res!114983 () Bool)

(assert (=> b!138009 (=> (not res!114983) (not e!91761))))

(assert (=> b!138009 (= res!114983 (isPrefixOf!0 (_1!6350 lt!215184) thiss!1634))))

(declare-fun d!44302 () Bool)

(assert (=> d!44302 e!91761))

(declare-fun res!114982 () Bool)

(assert (=> d!44302 (=> (not res!114982) (not e!91761))))

(assert (=> d!44302 (= res!114982 (isPrefixOf!0 (_1!6350 lt!215184) (_2!6350 lt!215184)))))

(declare-fun lt!215181 () BitStream!4924)

(assert (=> d!44302 (= lt!215184 (tuple2!12055 lt!215181 (_2!6348 lt!214944)))))

(declare-fun lt!215190 () Unit!8607)

(declare-fun lt!215189 () Unit!8607)

(assert (=> d!44302 (= lt!215190 lt!215189)))

(assert (=> d!44302 (isPrefixOf!0 lt!215181 (_2!6348 lt!214944))))

(assert (=> d!44302 (= lt!215189 (lemmaIsPrefixTransitive!0 lt!215181 (_2!6348 lt!214944) (_2!6348 lt!214944)))))

(declare-fun lt!215177 () Unit!8607)

(declare-fun lt!215185 () Unit!8607)

(assert (=> d!44302 (= lt!215177 lt!215185)))

(assert (=> d!44302 (isPrefixOf!0 lt!215181 (_2!6348 lt!214944))))

(assert (=> d!44302 (= lt!215185 (lemmaIsPrefixTransitive!0 lt!215181 thiss!1634 (_2!6348 lt!214944)))))

(declare-fun lt!215180 () Unit!8607)

(declare-fun e!91760 () Unit!8607)

(assert (=> d!44302 (= lt!215180 e!91760)))

(declare-fun c!7738 () Bool)

(assert (=> d!44302 (= c!7738 (not (= (size!2830 (buf!3237 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!215172 () Unit!8607)

(declare-fun lt!215178 () Unit!8607)

(assert (=> d!44302 (= lt!215172 lt!215178)))

(assert (=> d!44302 (isPrefixOf!0 (_2!6348 lt!214944) (_2!6348 lt!214944))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4924) Unit!8607)

(assert (=> d!44302 (= lt!215178 (lemmaIsPrefixRefl!0 (_2!6348 lt!214944)))))

(declare-fun lt!215186 () Unit!8607)

(declare-fun lt!215183 () Unit!8607)

(assert (=> d!44302 (= lt!215186 lt!215183)))

(assert (=> d!44302 (= lt!215183 (lemmaIsPrefixRefl!0 (_2!6348 lt!214944)))))

(declare-fun lt!215188 () Unit!8607)

(declare-fun lt!215176 () Unit!8607)

(assert (=> d!44302 (= lt!215188 lt!215176)))

(assert (=> d!44302 (isPrefixOf!0 lt!215181 lt!215181)))

(assert (=> d!44302 (= lt!215176 (lemmaIsPrefixRefl!0 lt!215181))))

(declare-fun lt!215182 () Unit!8607)

(declare-fun lt!215187 () Unit!8607)

(assert (=> d!44302 (= lt!215182 lt!215187)))

(assert (=> d!44302 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44302 (= lt!215187 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44302 (= lt!215181 (BitStream!4925 (buf!3237 (_2!6348 lt!214944)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)))))

(assert (=> d!44302 (isPrefixOf!0 thiss!1634 (_2!6348 lt!214944))))

(assert (=> d!44302 (= (reader!0 thiss!1634 (_2!6348 lt!214944)) lt!215184)))

(declare-fun b!138010 () Bool)

(declare-fun lt!215171 () Unit!8607)

(assert (=> b!138010 (= e!91760 lt!215171)))

(declare-fun lt!215179 () (_ BitVec 64))

(assert (=> b!138010 (= lt!215179 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215175 () (_ BitVec 64))

(assert (=> b!138010 (= lt!215175 (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6249 array!6249 (_ BitVec 64) (_ BitVec 64)) Unit!8607)

(assert (=> b!138010 (= lt!215171 (arrayBitRangesEqSymmetric!0 (buf!3237 thiss!1634) (buf!3237 (_2!6348 lt!214944)) lt!215179 lt!215175))))

(declare-fun arrayBitRangesEq!0 (array!6249 array!6249 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138010 (arrayBitRangesEq!0 (buf!3237 (_2!6348 lt!214944)) (buf!3237 thiss!1634) lt!215179 lt!215175)))

(declare-fun b!138011 () Bool)

(declare-fun Unit!8613 () Unit!8607)

(assert (=> b!138011 (= e!91760 Unit!8613)))

(declare-fun b!138012 () Bool)

(declare-fun res!114984 () Bool)

(assert (=> b!138012 (=> (not res!114984) (not e!91761))))

(assert (=> b!138012 (= res!114984 (isPrefixOf!0 (_2!6350 lt!215184) (_2!6348 lt!214944)))))

(assert (= (and d!44302 c!7738) b!138010))

(assert (= (and d!44302 (not c!7738)) b!138011))

(assert (= (and d!44302 res!114982) b!138009))

(assert (= (and b!138009 res!114983) b!138012))

(assert (= (and b!138012 res!114984) b!138008))

(declare-fun m!212143 () Bool)

(assert (=> b!138008 m!212143))

(assert (=> b!138008 m!211865))

(assert (=> b!138008 m!211867))

(declare-fun m!212145 () Bool)

(assert (=> b!138009 m!212145))

(declare-fun m!212147 () Bool)

(assert (=> b!138012 m!212147))

(assert (=> b!138010 m!211867))

(declare-fun m!212149 () Bool)

(assert (=> b!138010 m!212149))

(declare-fun m!212151 () Bool)

(assert (=> b!138010 m!212151))

(declare-fun m!212153 () Bool)

(assert (=> d!44302 m!212153))

(declare-fun m!212155 () Bool)

(assert (=> d!44302 m!212155))

(declare-fun m!212157 () Bool)

(assert (=> d!44302 m!212157))

(declare-fun m!212159 () Bool)

(assert (=> d!44302 m!212159))

(assert (=> d!44302 m!211863))

(declare-fun m!212161 () Bool)

(assert (=> d!44302 m!212161))

(declare-fun m!212163 () Bool)

(assert (=> d!44302 m!212163))

(declare-fun m!212165 () Bool)

(assert (=> d!44302 m!212165))

(declare-fun m!212167 () Bool)

(assert (=> d!44302 m!212167))

(declare-fun m!212169 () Bool)

(assert (=> d!44302 m!212169))

(declare-fun m!212171 () Bool)

(assert (=> d!44302 m!212171))

(assert (=> b!137887 d!44302))

(declare-fun d!44304 () Bool)

(declare-fun e!91764 () Bool)

(assert (=> d!44304 e!91764))

(declare-fun res!114990 () Bool)

(assert (=> d!44304 (=> (not res!114990) (not e!91764))))

(declare-fun lt!215206 () (_ BitVec 64))

(declare-fun lt!215205 () (_ BitVec 64))

(declare-fun lt!215208 () (_ BitVec 64))

(assert (=> d!44304 (= res!114990 (= lt!215205 (bvsub lt!215208 lt!215206)))))

(assert (=> d!44304 (or (= (bvand lt!215208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215206 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215208 lt!215206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44304 (= lt!215206 (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214953))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214953)))))))

(declare-fun lt!215203 () (_ BitVec 64))

(declare-fun lt!215207 () (_ BitVec 64))

(assert (=> d!44304 (= lt!215208 (bvmul lt!215203 lt!215207))))

(assert (=> d!44304 (or (= lt!215203 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215207 (bvsdiv (bvmul lt!215203 lt!215207) lt!215203)))))

(assert (=> d!44304 (= lt!215207 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44304 (= lt!215203 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))))))

(assert (=> d!44304 (= lt!215205 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214953))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214953)))))))

(assert (=> d!44304 (invariant!0 (currentBit!6039 (_2!6348 lt!214953)) (currentByte!6044 (_2!6348 lt!214953)) (size!2830 (buf!3237 (_2!6348 lt!214953))))))

(assert (=> d!44304 (= (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214953))) (currentByte!6044 (_2!6348 lt!214953)) (currentBit!6039 (_2!6348 lt!214953))) lt!215205)))

(declare-fun b!138017 () Bool)

(declare-fun res!114989 () Bool)

(assert (=> b!138017 (=> (not res!114989) (not e!91764))))

(assert (=> b!138017 (= res!114989 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215205))))

(declare-fun b!138018 () Bool)

(declare-fun lt!215204 () (_ BitVec 64))

(assert (=> b!138018 (= e!91764 (bvsle lt!215205 (bvmul lt!215204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138018 (or (= lt!215204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215204)))))

(assert (=> b!138018 (= lt!215204 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))))))

(assert (= (and d!44304 res!114990) b!138017))

(assert (= (and b!138017 res!114989) b!138018))

(declare-fun m!212173 () Bool)

(assert (=> d!44304 m!212173))

(declare-fun m!212175 () Bool)

(assert (=> d!44304 m!212175))

(assert (=> b!137880 d!44304))

(declare-fun d!44306 () Bool)

(declare-fun e!91765 () Bool)

(assert (=> d!44306 e!91765))

(declare-fun res!114992 () Bool)

(assert (=> d!44306 (=> (not res!114992) (not e!91765))))

(declare-fun lt!215211 () (_ BitVec 64))

(declare-fun lt!215214 () (_ BitVec 64))

(declare-fun lt!215212 () (_ BitVec 64))

(assert (=> d!44306 (= res!114992 (= lt!215211 (bvsub lt!215214 lt!215212)))))

(assert (=> d!44306 (or (= (bvand lt!215214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215212 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215214 lt!215212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44306 (= lt!215212 (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 thiss!1634))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634))))))

(declare-fun lt!215209 () (_ BitVec 64))

(declare-fun lt!215213 () (_ BitVec 64))

(assert (=> d!44306 (= lt!215214 (bvmul lt!215209 lt!215213))))

(assert (=> d!44306 (or (= lt!215209 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215213 (bvsdiv (bvmul lt!215209 lt!215213) lt!215209)))))

(assert (=> d!44306 (= lt!215213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44306 (= lt!215209 ((_ sign_extend 32) (size!2830 (buf!3237 thiss!1634))))))

(assert (=> d!44306 (= lt!215211 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6044 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6039 thiss!1634))))))

(assert (=> d!44306 (invariant!0 (currentBit!6039 thiss!1634) (currentByte!6044 thiss!1634) (size!2830 (buf!3237 thiss!1634)))))

(assert (=> d!44306 (= (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)) lt!215211)))

(declare-fun b!138019 () Bool)

(declare-fun res!114991 () Bool)

(assert (=> b!138019 (=> (not res!114991) (not e!91765))))

(assert (=> b!138019 (= res!114991 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215211))))

(declare-fun b!138020 () Bool)

(declare-fun lt!215210 () (_ BitVec 64))

(assert (=> b!138020 (= e!91765 (bvsle lt!215211 (bvmul lt!215210 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138020 (or (= lt!215210 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215210 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215210)))))

(assert (=> b!138020 (= lt!215210 ((_ sign_extend 32) (size!2830 (buf!3237 thiss!1634))))))

(assert (= (and d!44306 res!114992) b!138019))

(assert (= (and b!138019 res!114991) b!138020))

(declare-fun m!212177 () Bool)

(assert (=> d!44306 m!212177))

(assert (=> d!44306 m!211851))

(assert (=> b!137880 d!44306))

(declare-fun d!44308 () Bool)

(assert (=> d!44308 (= (array_inv!2619 (buf!3237 thiss!1634)) (bvsge (size!2830 (buf!3237 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!137891 d!44308))

(assert (=> b!137879 d!44304))

(declare-fun d!44310 () Bool)

(declare-fun e!91766 () Bool)

(assert (=> d!44310 e!91766))

(declare-fun res!114994 () Bool)

(assert (=> d!44310 (=> (not res!114994) (not e!91766))))

(declare-fun lt!215220 () (_ BitVec 64))

(declare-fun lt!215217 () (_ BitVec 64))

(declare-fun lt!215218 () (_ BitVec 64))

(assert (=> d!44310 (= res!114994 (= lt!215217 (bvsub lt!215220 lt!215218)))))

(assert (=> d!44310 (or (= (bvand lt!215220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215218 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215220 lt!215218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44310 (= lt!215218 (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214944)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944)))))))

(declare-fun lt!215215 () (_ BitVec 64))

(declare-fun lt!215219 () (_ BitVec 64))

(assert (=> d!44310 (= lt!215220 (bvmul lt!215215 lt!215219))))

(assert (=> d!44310 (or (= lt!215215 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215219 (bvsdiv (bvmul lt!215215 lt!215219) lt!215215)))))

(assert (=> d!44310 (= lt!215219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44310 (= lt!215215 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214944)))))))

(assert (=> d!44310 (= lt!215217 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944)))))))

(assert (=> d!44310 (invariant!0 (currentBit!6039 (_2!6348 lt!214944)) (currentByte!6044 (_2!6348 lt!214944)) (size!2830 (buf!3237 (_2!6348 lt!214944))))))

(assert (=> d!44310 (= (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214944))) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944))) lt!215217)))

(declare-fun b!138021 () Bool)

(declare-fun res!114993 () Bool)

(assert (=> b!138021 (=> (not res!114993) (not e!91766))))

(assert (=> b!138021 (= res!114993 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215217))))

(declare-fun b!138022 () Bool)

(declare-fun lt!215216 () (_ BitVec 64))

(assert (=> b!138022 (= e!91766 (bvsle lt!215217 (bvmul lt!215216 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138022 (or (= lt!215216 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215216 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215216)))))

(assert (=> b!138022 (= lt!215216 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214944)))))))

(assert (= (and d!44310 res!114994) b!138021))

(assert (= (and b!138021 res!114993) b!138022))

(declare-fun m!212179 () Bool)

(assert (=> d!44310 m!212179))

(declare-fun m!212181 () Bool)

(assert (=> d!44310 m!212181))

(assert (=> b!137879 d!44310))

(declare-fun d!44312 () Bool)

(declare-fun res!114999 () Bool)

(declare-fun e!91771 () Bool)

(assert (=> d!44312 (=> res!114999 e!91771)))

(assert (=> d!44312 (= res!114999 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44312 (= (arrayRangesEq!233 (_2!6349 lt!214931) (_2!6349 lt!214943) #b00000000000000000000000000000000 to!404) e!91771)))

(declare-fun b!138027 () Bool)

(declare-fun e!91772 () Bool)

(assert (=> b!138027 (= e!91771 e!91772)))

(declare-fun res!115000 () Bool)

(assert (=> b!138027 (=> (not res!115000) (not e!91772))))

(assert (=> b!138027 (= res!115000 (= (select (arr!3516 (_2!6349 lt!214931)) #b00000000000000000000000000000000) (select (arr!3516 (_2!6349 lt!214943)) #b00000000000000000000000000000000)))))

(declare-fun b!138028 () Bool)

(assert (=> b!138028 (= e!91772 (arrayRangesEq!233 (_2!6349 lt!214931) (_2!6349 lt!214943) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44312 (not res!114999)) b!138027))

(assert (= (and b!138027 res!115000) b!138028))

(declare-fun m!212183 () Bool)

(assert (=> b!138027 m!212183))

(declare-fun m!212185 () Bool)

(assert (=> b!138027 m!212185))

(declare-fun m!212187 () Bool)

(assert (=> b!138028 m!212187))

(assert (=> b!137890 d!44312))

(declare-fun d!44314 () Bool)

(declare-fun res!115001 () Bool)

(declare-fun e!91773 () Bool)

(assert (=> d!44314 (=> res!115001 e!91773)))

(assert (=> d!44314 (= res!115001 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44314 (= (arrayRangesEq!233 (_2!6349 lt!214931) (_2!6349 lt!214929) #b00000000000000000000000000000000 to!404) e!91773)))

(declare-fun b!138029 () Bool)

(declare-fun e!91774 () Bool)

(assert (=> b!138029 (= e!91773 e!91774)))

(declare-fun res!115002 () Bool)

(assert (=> b!138029 (=> (not res!115002) (not e!91774))))

(assert (=> b!138029 (= res!115002 (= (select (arr!3516 (_2!6349 lt!214931)) #b00000000000000000000000000000000) (select (arr!3516 (_2!6349 lt!214929)) #b00000000000000000000000000000000)))))

(declare-fun b!138030 () Bool)

(assert (=> b!138030 (= e!91774 (arrayRangesEq!233 (_2!6349 lt!214931) (_2!6349 lt!214929) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44314 (not res!115001)) b!138029))

(assert (= (and b!138029 res!115002) b!138030))

(assert (=> b!138029 m!212183))

(declare-fun m!212189 () Bool)

(assert (=> b!138029 m!212189))

(declare-fun m!212191 () Bool)

(assert (=> b!138030 m!212191))

(assert (=> b!137890 d!44314))

(declare-fun d!44316 () Bool)

(declare-fun e!91775 () Bool)

(assert (=> d!44316 e!91775))

(declare-fun res!115004 () Bool)

(assert (=> d!44316 (=> (not res!115004) (not e!91775))))

(declare-fun lt!215223 () (_ BitVec 64))

(declare-fun lt!215224 () (_ BitVec 64))

(declare-fun lt!215226 () (_ BitVec 64))

(assert (=> d!44316 (= res!115004 (= lt!215223 (bvsub lt!215226 lt!215224)))))

(assert (=> d!44316 (or (= (bvand lt!215226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215224 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215226 lt!215224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44316 (= lt!215224 (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_1!6351 lt!214926)))) ((_ sign_extend 32) (currentByte!6044 (_1!6351 lt!214926))) ((_ sign_extend 32) (currentBit!6039 (_1!6351 lt!214926)))))))

(declare-fun lt!215221 () (_ BitVec 64))

(declare-fun lt!215225 () (_ BitVec 64))

(assert (=> d!44316 (= lt!215226 (bvmul lt!215221 lt!215225))))

(assert (=> d!44316 (or (= lt!215221 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215225 (bvsdiv (bvmul lt!215221 lt!215225) lt!215221)))))

(assert (=> d!44316 (= lt!215225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44316 (= lt!215221 ((_ sign_extend 32) (size!2830 (buf!3237 (_1!6351 lt!214926)))))))

(assert (=> d!44316 (= lt!215223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6044 (_1!6351 lt!214926))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6039 (_1!6351 lt!214926)))))))

(assert (=> d!44316 (invariant!0 (currentBit!6039 (_1!6351 lt!214926)) (currentByte!6044 (_1!6351 lt!214926)) (size!2830 (buf!3237 (_1!6351 lt!214926))))))

(assert (=> d!44316 (= (bitIndex!0 (size!2830 (buf!3237 (_1!6351 lt!214926))) (currentByte!6044 (_1!6351 lt!214926)) (currentBit!6039 (_1!6351 lt!214926))) lt!215223)))

(declare-fun b!138031 () Bool)

(declare-fun res!115003 () Bool)

(assert (=> b!138031 (=> (not res!115003) (not e!91775))))

(assert (=> b!138031 (= res!115003 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215223))))

(declare-fun b!138032 () Bool)

(declare-fun lt!215222 () (_ BitVec 64))

(assert (=> b!138032 (= e!91775 (bvsle lt!215223 (bvmul lt!215222 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138032 (or (= lt!215222 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215222 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215222)))))

(assert (=> b!138032 (= lt!215222 ((_ sign_extend 32) (size!2830 (buf!3237 (_1!6351 lt!214926)))))))

(assert (= (and d!44316 res!115004) b!138031))

(assert (= (and b!138031 res!115003) b!138032))

(declare-fun m!212193 () Bool)

(assert (=> d!44316 m!212193))

(declare-fun m!212195 () Bool)

(assert (=> d!44316 m!212195))

(assert (=> b!137890 d!44316))

(declare-fun d!44318 () Bool)

(declare-datatypes ((tuple3!524 0))(
  ( (tuple3!525 (_1!6361 Unit!8607) (_2!6361 BitStream!4924) (_3!323 array!6249)) )
))
(declare-fun lt!215229 () tuple3!524)

(declare-fun readByteArrayLoop!0 (BitStream!4924 array!6249 (_ BitVec 32) (_ BitVec 32)) tuple3!524)

(assert (=> d!44318 (= lt!215229 (readByteArrayLoop!0 (_1!6350 lt!214925) arr!237 from!447 to!404))))

(assert (=> d!44318 (= (readByteArrayLoopPure!0 (_1!6350 lt!214925) arr!237 from!447 to!404) (tuple2!12053 (_2!6361 lt!215229) (_3!323 lt!215229)))))

(declare-fun bs!10806 () Bool)

(assert (= bs!10806 d!44318))

(declare-fun m!212197 () Bool)

(assert (=> bs!10806 m!212197))

(assert (=> b!137890 d!44318))

(declare-fun d!44320 () Bool)

(assert (=> d!44320 (isPrefixOf!0 thiss!1634 (_2!6348 lt!214953))))

(declare-fun lt!215232 () Unit!8607)

(declare-fun choose!30 (BitStream!4924 BitStream!4924 BitStream!4924) Unit!8607)

(assert (=> d!44320 (= lt!215232 (choose!30 thiss!1634 (_2!6348 lt!214944) (_2!6348 lt!214953)))))

(assert (=> d!44320 (isPrefixOf!0 thiss!1634 (_2!6348 lt!214944))))

(assert (=> d!44320 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6348 lt!214944) (_2!6348 lt!214953)) lt!215232)))

(declare-fun bs!10807 () Bool)

(assert (= bs!10807 d!44320))

(assert (=> bs!10807 m!211899))

(declare-fun m!212199 () Bool)

(assert (=> bs!10807 m!212199))

(assert (=> bs!10807 m!211863))

(assert (=> b!137890 d!44320))

(declare-fun d!44322 () Bool)

(assert (=> d!44322 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) lt!214932) (bvsle ((_ sign_extend 32) lt!214932) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10808 () Bool)

(assert (= bs!10808 d!44322))

(declare-fun m!212201 () Bool)

(assert (=> bs!10808 m!212201))

(assert (=> b!137890 d!44322))

(declare-fun lt!215233 () tuple3!524)

(declare-fun d!44324 () Bool)

(assert (=> d!44324 (= lt!215233 (readByteArrayLoop!0 (_1!6350 lt!214927) lt!214934 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44324 (= (readByteArrayLoopPure!0 (_1!6350 lt!214927) lt!214934 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12053 (_2!6361 lt!215233) (_3!323 lt!215233)))))

(declare-fun bs!10809 () Bool)

(assert (= bs!10809 d!44324))

(declare-fun m!212203 () Bool)

(assert (=> bs!10809 m!212203))

(assert (=> b!137890 d!44324))

(declare-fun lt!215236 () (_ BitVec 64))

(declare-fun e!91777 () Bool)

(declare-fun b!138033 () Bool)

(declare-fun lt!215237 () (_ BitVec 64))

(declare-fun lt!215247 () tuple2!12054)

(assert (=> b!138033 (= e!91777 (= (_1!6350 lt!215247) (withMovedBitIndex!0 (_2!6350 lt!215247) (bvsub lt!215236 lt!215237))))))

(assert (=> b!138033 (or (= (bvand lt!215236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215237 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215236 lt!215237) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138033 (= lt!215237 (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214953))) (currentByte!6044 (_2!6348 lt!214953)) (currentBit!6039 (_2!6348 lt!214953))))))

(assert (=> b!138033 (= lt!215236 (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)))))

(declare-fun b!138034 () Bool)

(declare-fun res!115006 () Bool)

(assert (=> b!138034 (=> (not res!115006) (not e!91777))))

(assert (=> b!138034 (= res!115006 (isPrefixOf!0 (_1!6350 lt!215247) thiss!1634))))

(declare-fun d!44326 () Bool)

(assert (=> d!44326 e!91777))

(declare-fun res!115005 () Bool)

(assert (=> d!44326 (=> (not res!115005) (not e!91777))))

(assert (=> d!44326 (= res!115005 (isPrefixOf!0 (_1!6350 lt!215247) (_2!6350 lt!215247)))))

(declare-fun lt!215244 () BitStream!4924)

(assert (=> d!44326 (= lt!215247 (tuple2!12055 lt!215244 (_2!6348 lt!214953)))))

(declare-fun lt!215253 () Unit!8607)

(declare-fun lt!215252 () Unit!8607)

(assert (=> d!44326 (= lt!215253 lt!215252)))

(assert (=> d!44326 (isPrefixOf!0 lt!215244 (_2!6348 lt!214953))))

(assert (=> d!44326 (= lt!215252 (lemmaIsPrefixTransitive!0 lt!215244 (_2!6348 lt!214953) (_2!6348 lt!214953)))))

(declare-fun lt!215240 () Unit!8607)

(declare-fun lt!215248 () Unit!8607)

(assert (=> d!44326 (= lt!215240 lt!215248)))

(assert (=> d!44326 (isPrefixOf!0 lt!215244 (_2!6348 lt!214953))))

(assert (=> d!44326 (= lt!215248 (lemmaIsPrefixTransitive!0 lt!215244 thiss!1634 (_2!6348 lt!214953)))))

(declare-fun lt!215243 () Unit!8607)

(declare-fun e!91776 () Unit!8607)

(assert (=> d!44326 (= lt!215243 e!91776)))

(declare-fun c!7739 () Bool)

(assert (=> d!44326 (= c!7739 (not (= (size!2830 (buf!3237 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!215235 () Unit!8607)

(declare-fun lt!215241 () Unit!8607)

(assert (=> d!44326 (= lt!215235 lt!215241)))

(assert (=> d!44326 (isPrefixOf!0 (_2!6348 lt!214953) (_2!6348 lt!214953))))

(assert (=> d!44326 (= lt!215241 (lemmaIsPrefixRefl!0 (_2!6348 lt!214953)))))

(declare-fun lt!215249 () Unit!8607)

(declare-fun lt!215246 () Unit!8607)

(assert (=> d!44326 (= lt!215249 lt!215246)))

(assert (=> d!44326 (= lt!215246 (lemmaIsPrefixRefl!0 (_2!6348 lt!214953)))))

(declare-fun lt!215251 () Unit!8607)

(declare-fun lt!215239 () Unit!8607)

(assert (=> d!44326 (= lt!215251 lt!215239)))

(assert (=> d!44326 (isPrefixOf!0 lt!215244 lt!215244)))

(assert (=> d!44326 (= lt!215239 (lemmaIsPrefixRefl!0 lt!215244))))

(declare-fun lt!215245 () Unit!8607)

(declare-fun lt!215250 () Unit!8607)

(assert (=> d!44326 (= lt!215245 lt!215250)))

(assert (=> d!44326 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44326 (= lt!215250 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44326 (= lt!215244 (BitStream!4925 (buf!3237 (_2!6348 lt!214953)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)))))

(assert (=> d!44326 (isPrefixOf!0 thiss!1634 (_2!6348 lt!214953))))

(assert (=> d!44326 (= (reader!0 thiss!1634 (_2!6348 lt!214953)) lt!215247)))

(declare-fun b!138035 () Bool)

(declare-fun lt!215234 () Unit!8607)

(assert (=> b!138035 (= e!91776 lt!215234)))

(declare-fun lt!215242 () (_ BitVec 64))

(assert (=> b!138035 (= lt!215242 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215238 () (_ BitVec 64))

(assert (=> b!138035 (= lt!215238 (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)))))

(assert (=> b!138035 (= lt!215234 (arrayBitRangesEqSymmetric!0 (buf!3237 thiss!1634) (buf!3237 (_2!6348 lt!214953)) lt!215242 lt!215238))))

(assert (=> b!138035 (arrayBitRangesEq!0 (buf!3237 (_2!6348 lt!214953)) (buf!3237 thiss!1634) lt!215242 lt!215238)))

(declare-fun b!138036 () Bool)

(declare-fun Unit!8614 () Unit!8607)

(assert (=> b!138036 (= e!91776 Unit!8614)))

(declare-fun b!138037 () Bool)

(declare-fun res!115007 () Bool)

(assert (=> b!138037 (=> (not res!115007) (not e!91777))))

(assert (=> b!138037 (= res!115007 (isPrefixOf!0 (_2!6350 lt!215247) (_2!6348 lt!214953)))))

(assert (= (and d!44326 c!7739) b!138035))

(assert (= (and d!44326 (not c!7739)) b!138036))

(assert (= (and d!44326 res!115005) b!138034))

(assert (= (and b!138034 res!115006) b!138037))

(assert (= (and b!138037 res!115007) b!138033))

(declare-fun m!212205 () Bool)

(assert (=> b!138033 m!212205))

(assert (=> b!138033 m!211871))

(assert (=> b!138033 m!211867))

(declare-fun m!212207 () Bool)

(assert (=> b!138034 m!212207))

(declare-fun m!212209 () Bool)

(assert (=> b!138037 m!212209))

(assert (=> b!138035 m!211867))

(declare-fun m!212211 () Bool)

(assert (=> b!138035 m!212211))

(declare-fun m!212213 () Bool)

(assert (=> b!138035 m!212213))

(declare-fun m!212215 () Bool)

(assert (=> d!44326 m!212215))

(declare-fun m!212217 () Bool)

(assert (=> d!44326 m!212217))

(assert (=> d!44326 m!212157))

(declare-fun m!212219 () Bool)

(assert (=> d!44326 m!212219))

(assert (=> d!44326 m!211899))

(declare-fun m!212221 () Bool)

(assert (=> d!44326 m!212221))

(declare-fun m!212223 () Bool)

(assert (=> d!44326 m!212223))

(declare-fun m!212225 () Bool)

(assert (=> d!44326 m!212225))

(declare-fun m!212227 () Bool)

(assert (=> d!44326 m!212227))

(declare-fun m!212229 () Bool)

(assert (=> d!44326 m!212229))

(assert (=> d!44326 m!212171))

(assert (=> b!137890 d!44326))

(declare-fun d!44328 () Bool)

(declare-fun e!91778 () Bool)

(assert (=> d!44328 e!91778))

(declare-fun res!115009 () Bool)

(assert (=> d!44328 (=> (not res!115009) (not e!91778))))

(declare-fun lt!215257 () (_ BitVec 64))

(declare-fun lt!215256 () (_ BitVec 64))

(declare-fun lt!215259 () (_ BitVec 64))

(assert (=> d!44328 (= res!115009 (= lt!215256 (bvsub lt!215259 lt!215257)))))

(assert (=> d!44328 (or (= (bvand lt!215259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215257 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215259 lt!215257) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44328 (= lt!215257 (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_1!6351 lt!214951)))) ((_ sign_extend 32) (currentByte!6044 (_1!6351 lt!214951))) ((_ sign_extend 32) (currentBit!6039 (_1!6351 lt!214951)))))))

(declare-fun lt!215254 () (_ BitVec 64))

(declare-fun lt!215258 () (_ BitVec 64))

(assert (=> d!44328 (= lt!215259 (bvmul lt!215254 lt!215258))))

(assert (=> d!44328 (or (= lt!215254 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215258 (bvsdiv (bvmul lt!215254 lt!215258) lt!215254)))))

(assert (=> d!44328 (= lt!215258 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44328 (= lt!215254 ((_ sign_extend 32) (size!2830 (buf!3237 (_1!6351 lt!214951)))))))

(assert (=> d!44328 (= lt!215256 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6044 (_1!6351 lt!214951))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6039 (_1!6351 lt!214951)))))))

(assert (=> d!44328 (invariant!0 (currentBit!6039 (_1!6351 lt!214951)) (currentByte!6044 (_1!6351 lt!214951)) (size!2830 (buf!3237 (_1!6351 lt!214951))))))

(assert (=> d!44328 (= (bitIndex!0 (size!2830 (buf!3237 (_1!6351 lt!214951))) (currentByte!6044 (_1!6351 lt!214951)) (currentBit!6039 (_1!6351 lt!214951))) lt!215256)))

(declare-fun b!138038 () Bool)

(declare-fun res!115008 () Bool)

(assert (=> b!138038 (=> (not res!115008) (not e!91778))))

(assert (=> b!138038 (= res!115008 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215256))))

(declare-fun b!138039 () Bool)

(declare-fun lt!215255 () (_ BitVec 64))

(assert (=> b!138039 (= e!91778 (bvsle lt!215256 (bvmul lt!215255 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138039 (or (= lt!215255 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215255 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215255)))))

(assert (=> b!138039 (= lt!215255 ((_ sign_extend 32) (size!2830 (buf!3237 (_1!6351 lt!214951)))))))

(assert (= (and d!44328 res!115009) b!138038))

(assert (= (and b!138038 res!115008) b!138039))

(declare-fun m!212231 () Bool)

(assert (=> d!44328 m!212231))

(declare-fun m!212233 () Bool)

(assert (=> d!44328 m!212233))

(assert (=> b!137890 d!44328))

(declare-fun b!138050 () Bool)

(declare-fun res!115024 () Bool)

(declare-fun e!91786 () Bool)

(assert (=> b!138050 (=> (not res!115024) (not e!91786))))

(declare-fun lt!215285 () tuple2!12050)

(declare-fun lt!215286 () (_ BitVec 64))

(declare-fun lt!215279 () (_ BitVec 64))

(assert (=> b!138050 (= res!115024 (= (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!215285))) (currentByte!6044 (_2!6348 lt!215285)) (currentBit!6039 (_2!6348 lt!215285))) (bvadd lt!215279 lt!215286)))))

(assert (=> b!138050 (or (not (= (bvand lt!215279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215286 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!215279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!215279 lt!215286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!215280 () (_ BitVec 64))

(assert (=> b!138050 (= lt!215286 (bvmul lt!215280 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!138050 (or (= lt!215280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215280)))))

(assert (=> b!138050 (= lt!215280 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!138050 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!138050 (= lt!215279 (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214944))) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944))))))

(declare-fun e!91785 () Bool)

(declare-fun lt!215284 () tuple2!12052)

(declare-fun b!138051 () Bool)

(assert (=> b!138051 (= e!91785 (arrayRangesEq!233 arr!237 (_2!6349 lt!215284) #b00000000000000000000000000000000 to!404))))

(declare-fun d!44330 () Bool)

(assert (=> d!44330 e!91786))

(declare-fun res!115021 () Bool)

(assert (=> d!44330 (=> (not res!115021) (not e!91786))))

(assert (=> d!44330 (= res!115021 (= (size!2830 (buf!3237 (_2!6348 lt!214944))) (size!2830 (buf!3237 (_2!6348 lt!215285)))))))

(declare-fun choose!64 (BitStream!4924 array!6249 (_ BitVec 32) (_ BitVec 32)) tuple2!12050)

(assert (=> d!44330 (= lt!215285 (choose!64 (_2!6348 lt!214944) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44330 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2830 arr!237)))))

(assert (=> d!44330 (= (appendByteArrayLoop!0 (_2!6348 lt!214944) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!215285)))

(declare-fun b!138052 () Bool)

(declare-fun e!91787 () Bool)

(declare-fun lt!215281 () (_ BitVec 64))

(assert (=> b!138052 (= e!91787 (validate_offset_bits!1 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214944)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) lt!215281))))

(declare-fun b!138053 () Bool)

(declare-fun res!115020 () Bool)

(assert (=> b!138053 (=> (not res!115020) (not e!91786))))

(assert (=> b!138053 (= res!115020 (isPrefixOf!0 (_2!6348 lt!214944) (_2!6348 lt!215285)))))

(declare-fun b!138054 () Bool)

(assert (=> b!138054 (= e!91786 e!91785)))

(declare-fun res!115023 () Bool)

(assert (=> b!138054 (=> (not res!115023) (not e!91785))))

(declare-fun lt!215283 () tuple2!12054)

(assert (=> b!138054 (= res!115023 (and (= (size!2830 (_2!6349 lt!215284)) (size!2830 arr!237)) (= (_1!6349 lt!215284) (_2!6350 lt!215283))))))

(assert (=> b!138054 (= lt!215284 (readByteArrayLoopPure!0 (_1!6350 lt!215283) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!215278 () Unit!8607)

(declare-fun lt!215282 () Unit!8607)

(assert (=> b!138054 (= lt!215278 lt!215282)))

(assert (=> b!138054 (validate_offset_bits!1 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!215285)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) lt!215281)))

(assert (=> b!138054 (= lt!215282 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6348 lt!214944) (buf!3237 (_2!6348 lt!215285)) lt!215281))))

(assert (=> b!138054 e!91787))

(declare-fun res!115022 () Bool)

(assert (=> b!138054 (=> (not res!115022) (not e!91787))))

(assert (=> b!138054 (= res!115022 (and (= (size!2830 (buf!3237 (_2!6348 lt!214944))) (size!2830 (buf!3237 (_2!6348 lt!215285)))) (bvsge lt!215281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138054 (= lt!215281 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!138054 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!138054 (= lt!215283 (reader!0 (_2!6348 lt!214944) (_2!6348 lt!215285)))))

(assert (= (and d!44330 res!115021) b!138050))

(assert (= (and b!138050 res!115024) b!138053))

(assert (= (and b!138053 res!115020) b!138054))

(assert (= (and b!138054 res!115022) b!138052))

(assert (= (and b!138054 res!115023) b!138051))

(declare-fun m!212235 () Bool)

(assert (=> b!138054 m!212235))

(declare-fun m!212237 () Bool)

(assert (=> b!138054 m!212237))

(declare-fun m!212239 () Bool)

(assert (=> b!138054 m!212239))

(declare-fun m!212241 () Bool)

(assert (=> b!138054 m!212241))

(declare-fun m!212243 () Bool)

(assert (=> d!44330 m!212243))

(declare-fun m!212245 () Bool)

(assert (=> b!138050 m!212245))

(assert (=> b!138050 m!211865))

(declare-fun m!212247 () Bool)

(assert (=> b!138052 m!212247))

(declare-fun m!212249 () Bool)

(assert (=> b!138051 m!212249))

(declare-fun m!212251 () Bool)

(assert (=> b!138053 m!212251))

(assert (=> b!137890 d!44330))

(declare-fun d!44332 () Bool)

(declare-fun lt!215295 () tuple2!12052)

(declare-fun lt!215297 () tuple2!12052)

(assert (=> d!44332 (arrayRangesEq!233 (_2!6349 lt!215295) (_2!6349 lt!215297) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215298 () Unit!8607)

(declare-fun lt!215296 () BitStream!4924)

(declare-fun choose!35 (BitStream!4924 array!6249 (_ BitVec 32) (_ BitVec 32) tuple2!12052 array!6249 BitStream!4924 tuple2!12052 array!6249) Unit!8607)

(assert (=> d!44332 (= lt!215298 (choose!35 (_1!6350 lt!214925) arr!237 from!447 to!404 lt!215295 (_2!6349 lt!215295) lt!215296 lt!215297 (_2!6349 lt!215297)))))

(assert (=> d!44332 (= lt!215297 (readByteArrayLoopPure!0 lt!215296 (array!6250 (store (arr!3516 arr!237) from!447 (_2!6351 (readBytePure!0 (_1!6350 lt!214925)))) (size!2830 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!44332 (= lt!215296 (withMovedByteIndex!0 (_1!6350 lt!214925) #b00000000000000000000000000000001))))

(assert (=> d!44332 (= lt!215295 (readByteArrayLoopPure!0 (_1!6350 lt!214925) arr!237 from!447 to!404))))

(assert (=> d!44332 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6350 lt!214925) arr!237 from!447 to!404) lt!215298)))

(declare-fun bs!10811 () Bool)

(assert (= bs!10811 d!44332))

(declare-fun m!212253 () Bool)

(assert (=> bs!10811 m!212253))

(assert (=> bs!10811 m!211901))

(assert (=> bs!10811 m!211893))

(assert (=> bs!10811 m!211907))

(declare-fun m!212255 () Bool)

(assert (=> bs!10811 m!212255))

(declare-fun m!212257 () Bool)

(assert (=> bs!10811 m!212257))

(declare-fun m!212259 () Bool)

(assert (=> bs!10811 m!212259))

(assert (=> b!137890 d!44332))

(declare-fun d!44334 () Bool)

(declare-fun lt!215299 () tuple2!12074)

(assert (=> d!44334 (= lt!215299 (readByte!0 (_1!6350 lt!214925)))))

(assert (=> d!44334 (= (readBytePure!0 (_1!6350 lt!214925)) (tuple2!12057 (_2!6360 lt!215299) (_1!6360 lt!215299)))))

(declare-fun bs!10812 () Bool)

(assert (= bs!10812 d!44334))

(declare-fun m!212261 () Bool)

(assert (=> bs!10812 m!212261))

(assert (=> b!137890 d!44334))

(declare-fun d!44336 () Bool)

(assert (=> d!44336 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) lt!214932)))

(declare-fun lt!215302 () Unit!8607)

(declare-fun choose!26 (BitStream!4924 array!6249 (_ BitVec 32) BitStream!4924) Unit!8607)

(assert (=> d!44336 (= lt!215302 (choose!26 (_2!6348 lt!214944) (buf!3237 (_2!6348 lt!214953)) lt!214932 (BitStream!4925 (buf!3237 (_2!6348 lt!214953)) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944)))))))

(assert (=> d!44336 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6348 lt!214944) (buf!3237 (_2!6348 lt!214953)) lt!214932) lt!215302)))

(declare-fun bs!10813 () Bool)

(assert (= bs!10813 d!44336))

(assert (=> bs!10813 m!211895))

(declare-fun m!212263 () Bool)

(assert (=> bs!10813 m!212263))

(assert (=> b!137890 d!44336))

(declare-fun d!44338 () Bool)

(assert (=> d!44338 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214944)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) lt!214932) (bvsle ((_ sign_extend 32) lt!214932) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214944)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10814 () Bool)

(assert (= bs!10814 d!44338))

(assert (=> bs!10814 m!212179))

(assert (=> b!137890 d!44338))

(declare-fun d!44340 () Bool)

(assert (=> d!44340 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10815 () Bool)

(assert (= bs!10815 d!44340))

(declare-fun m!212265 () Bool)

(assert (=> bs!10815 m!212265))

(assert (=> b!137890 d!44340))

(declare-fun d!44342 () Bool)

(declare-fun e!91790 () Bool)

(assert (=> d!44342 e!91790))

(declare-fun res!115027 () Bool)

(assert (=> d!44342 (=> (not res!115027) (not e!91790))))

(declare-fun lt!215313 () tuple2!12056)

(declare-fun lt!215312 () tuple2!12056)

(assert (=> d!44342 (= res!115027 (= (bitIndex!0 (size!2830 (buf!3237 (_1!6351 lt!215313))) (currentByte!6044 (_1!6351 lt!215313)) (currentBit!6039 (_1!6351 lt!215313))) (bitIndex!0 (size!2830 (buf!3237 (_1!6351 lt!215312))) (currentByte!6044 (_1!6351 lt!215312)) (currentBit!6039 (_1!6351 lt!215312)))))))

(declare-fun lt!215314 () Unit!8607)

(declare-fun lt!215311 () BitStream!4924)

(declare-fun choose!14 (BitStream!4924 BitStream!4924 BitStream!4924 tuple2!12056 tuple2!12056 BitStream!4924 (_ BitVec 8) tuple2!12056 tuple2!12056 BitStream!4924 (_ BitVec 8)) Unit!8607)

(assert (=> d!44342 (= lt!215314 (choose!14 lt!214945 (_2!6348 lt!214953) lt!215311 lt!215313 (tuple2!12057 (_1!6351 lt!215313) (_2!6351 lt!215313)) (_1!6351 lt!215313) (_2!6351 lt!215313) lt!215312 (tuple2!12057 (_1!6351 lt!215312) (_2!6351 lt!215312)) (_1!6351 lt!215312) (_2!6351 lt!215312)))))

(assert (=> d!44342 (= lt!215312 (readBytePure!0 lt!215311))))

(assert (=> d!44342 (= lt!215313 (readBytePure!0 lt!214945))))

(assert (=> d!44342 (= lt!215311 (BitStream!4925 (buf!3237 (_2!6348 lt!214953)) (currentByte!6044 lt!214945) (currentBit!6039 lt!214945)))))

(assert (=> d!44342 (= (readBytePrefixLemma!0 lt!214945 (_2!6348 lt!214953)) lt!215314)))

(declare-fun b!138057 () Bool)

(assert (=> b!138057 (= e!91790 (= (_2!6351 lt!215313) (_2!6351 lt!215312)))))

(assert (= (and d!44342 res!115027) b!138057))

(assert (=> d!44342 m!211909))

(declare-fun m!212267 () Bool)

(assert (=> d!44342 m!212267))

(declare-fun m!212269 () Bool)

(assert (=> d!44342 m!212269))

(declare-fun m!212271 () Bool)

(assert (=> d!44342 m!212271))

(declare-fun m!212273 () Bool)

(assert (=> d!44342 m!212273))

(assert (=> b!137890 d!44342))

(declare-fun d!44344 () Bool)

(declare-fun res!115035 () Bool)

(declare-fun e!91795 () Bool)

(assert (=> d!44344 (=> (not res!115035) (not e!91795))))

(assert (=> d!44344 (= res!115035 (= (size!2830 (buf!3237 thiss!1634)) (size!2830 (buf!3237 (_2!6348 lt!214953)))))))

(assert (=> d!44344 (= (isPrefixOf!0 thiss!1634 (_2!6348 lt!214953)) e!91795)))

(declare-fun b!138064 () Bool)

(declare-fun res!115034 () Bool)

(assert (=> b!138064 (=> (not res!115034) (not e!91795))))

(assert (=> b!138064 (= res!115034 (bvsle (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)) (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214953))) (currentByte!6044 (_2!6348 lt!214953)) (currentBit!6039 (_2!6348 lt!214953)))))))

(declare-fun b!138065 () Bool)

(declare-fun e!91796 () Bool)

(assert (=> b!138065 (= e!91795 e!91796)))

(declare-fun res!115036 () Bool)

(assert (=> b!138065 (=> res!115036 e!91796)))

(assert (=> b!138065 (= res!115036 (= (size!2830 (buf!3237 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138066 () Bool)

(assert (=> b!138066 (= e!91796 (arrayBitRangesEq!0 (buf!3237 thiss!1634) (buf!3237 (_2!6348 lt!214953)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634))))))

(assert (= (and d!44344 res!115035) b!138064))

(assert (= (and b!138064 res!115034) b!138065))

(assert (= (and b!138065 (not res!115036)) b!138066))

(assert (=> b!138064 m!211867))

(assert (=> b!138064 m!211871))

(assert (=> b!138066 m!211867))

(assert (=> b!138066 m!211867))

(declare-fun m!212275 () Bool)

(assert (=> b!138066 m!212275))

(assert (=> b!137890 d!44344))

(declare-fun d!44346 () Bool)

(declare-fun e!91799 () Bool)

(assert (=> d!44346 e!91799))

(declare-fun res!115039 () Bool)

(assert (=> d!44346 (=> (not res!115039) (not e!91799))))

(assert (=> d!44346 (= res!115039 (and (or (let ((rhs!3154 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3154 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3154) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!44347 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!44347 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!44347 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3153 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3153 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3153) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!215322 () Unit!8607)

(declare-fun choose!57 (BitStream!4924 BitStream!4924 (_ BitVec 64) (_ BitVec 32)) Unit!8607)

(assert (=> d!44346 (= lt!215322 (choose!57 thiss!1634 (_2!6348 lt!214944) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!44346 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6348 lt!214944) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!215322)))

(declare-fun b!138069 () Bool)

(declare-fun lt!215323 () (_ BitVec 32))

(assert (=> b!138069 (= e!91799 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214944)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) (bvsub (bvsub to!404 from!447) lt!215323)))))

(assert (=> b!138069 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!215323 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!215323) #b10000000000000000000000000000000)))))

(declare-fun lt!215321 () (_ BitVec 64))

(assert (=> b!138069 (= lt!215323 ((_ extract 31 0) lt!215321))))

(assert (=> b!138069 (and (bvslt lt!215321 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!215321 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!138069 (= lt!215321 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!44346 res!115039) b!138069))

(declare-fun m!212277 () Bool)

(assert (=> d!44346 m!212277))

(declare-fun m!212279 () Bool)

(assert (=> b!138069 m!212279))

(assert (=> b!137890 d!44346))

(declare-fun d!44349 () Bool)

(declare-fun lt!215324 () tuple2!12074)

(assert (=> d!44349 (= lt!215324 (readByte!0 lt!214945))))

(assert (=> d!44349 (= (readBytePure!0 lt!214945) (tuple2!12057 (_2!6360 lt!215324) (_1!6360 lt!215324)))))

(declare-fun bs!10816 () Bool)

(assert (= bs!10816 d!44349))

(declare-fun m!212281 () Bool)

(assert (=> bs!10816 m!212281))

(assert (=> b!137890 d!44349))

(declare-fun d!44351 () Bool)

(declare-fun e!91802 () Bool)

(assert (=> d!44351 e!91802))

(declare-fun res!115046 () Bool)

(assert (=> d!44351 (=> (not res!115046) (not e!91802))))

(declare-fun lt!215339 () tuple2!12050)

(assert (=> d!44351 (= res!115046 (= (size!2830 (buf!3237 thiss!1634)) (size!2830 (buf!3237 (_2!6348 lt!215339)))))))

(declare-fun choose!6 (BitStream!4924 (_ BitVec 8)) tuple2!12050)

(assert (=> d!44351 (= lt!215339 (choose!6 thiss!1634 (select (arr!3516 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!44351 (validate_offset_byte!0 ((_ sign_extend 32) (size!2830 (buf!3237 thiss!1634))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634)))))

(assert (=> d!44351 (= (appendByte!0 thiss!1634 (select (arr!3516 arr!237) from!447)) lt!215339)))

(declare-fun b!138076 () Bool)

(declare-fun res!115047 () Bool)

(assert (=> b!138076 (=> (not res!115047) (not e!91802))))

(declare-fun lt!215338 () (_ BitVec 64))

(declare-fun lt!215335 () (_ BitVec 64))

(assert (=> b!138076 (= res!115047 (= (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!215339))) (currentByte!6044 (_2!6348 lt!215339)) (currentBit!6039 (_2!6348 lt!215339))) (bvadd lt!215335 lt!215338)))))

(assert (=> b!138076 (or (not (= (bvand lt!215335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215338 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!215335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!215335 lt!215338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138076 (= lt!215338 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!138076 (= lt!215335 (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)))))

(declare-fun b!138077 () Bool)

(declare-fun res!115048 () Bool)

(assert (=> b!138077 (=> (not res!115048) (not e!91802))))

(assert (=> b!138077 (= res!115048 (isPrefixOf!0 thiss!1634 (_2!6348 lt!215339)))))

(declare-fun lt!215337 () tuple2!12056)

(declare-fun lt!215336 () tuple2!12054)

(declare-fun b!138078 () Bool)

(assert (=> b!138078 (= e!91802 (and (= (_2!6351 lt!215337) (select (arr!3516 arr!237) from!447)) (= (_1!6351 lt!215337) (_2!6350 lt!215336))))))

(assert (=> b!138078 (= lt!215337 (readBytePure!0 (_1!6350 lt!215336)))))

(assert (=> b!138078 (= lt!215336 (reader!0 thiss!1634 (_2!6348 lt!215339)))))

(assert (= (and d!44351 res!115046) b!138076))

(assert (= (and b!138076 res!115047) b!138077))

(assert (= (and b!138077 res!115048) b!138078))

(assert (=> d!44351 m!211855))

(declare-fun m!212283 () Bool)

(assert (=> d!44351 m!212283))

(declare-fun m!212285 () Bool)

(assert (=> d!44351 m!212285))

(declare-fun m!212287 () Bool)

(assert (=> b!138076 m!212287))

(assert (=> b!138076 m!211867))

(declare-fun m!212289 () Bool)

(assert (=> b!138077 m!212289))

(declare-fun m!212291 () Bool)

(assert (=> b!138078 m!212291))

(declare-fun m!212293 () Bool)

(assert (=> b!138078 m!212293))

(assert (=> b!137890 d!44351))

(declare-fun d!44353 () Bool)

(declare-fun lt!215340 () tuple2!12074)

(assert (=> d!44353 (= lt!215340 (readByte!0 (BitStream!4925 (buf!3237 (_2!6348 lt!214953)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634))))))

(assert (=> d!44353 (= (readBytePure!0 (BitStream!4925 (buf!3237 (_2!6348 lt!214953)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634))) (tuple2!12057 (_2!6360 lt!215340) (_1!6360 lt!215340)))))

(declare-fun bs!10817 () Bool)

(assert (= bs!10817 d!44353))

(declare-fun m!212295 () Bool)

(assert (=> bs!10817 m!212295))

(assert (=> b!137890 d!44353))

(declare-fun lt!215354 () tuple2!12054)

(declare-fun lt!215343 () (_ BitVec 64))

(declare-fun e!91804 () Bool)

(declare-fun b!138079 () Bool)

(declare-fun lt!215344 () (_ BitVec 64))

(assert (=> b!138079 (= e!91804 (= (_1!6350 lt!215354) (withMovedBitIndex!0 (_2!6350 lt!215354) (bvsub lt!215343 lt!215344))))))

(assert (=> b!138079 (or (= (bvand lt!215343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215343 lt!215344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138079 (= lt!215344 (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214953))) (currentByte!6044 (_2!6348 lt!214953)) (currentBit!6039 (_2!6348 lt!214953))))))

(assert (=> b!138079 (= lt!215343 (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214944))) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944))))))

(declare-fun b!138080 () Bool)

(declare-fun res!115050 () Bool)

(assert (=> b!138080 (=> (not res!115050) (not e!91804))))

(assert (=> b!138080 (= res!115050 (isPrefixOf!0 (_1!6350 lt!215354) (_2!6348 lt!214944)))))

(declare-fun d!44355 () Bool)

(assert (=> d!44355 e!91804))

(declare-fun res!115049 () Bool)

(assert (=> d!44355 (=> (not res!115049) (not e!91804))))

(assert (=> d!44355 (= res!115049 (isPrefixOf!0 (_1!6350 lt!215354) (_2!6350 lt!215354)))))

(declare-fun lt!215351 () BitStream!4924)

(assert (=> d!44355 (= lt!215354 (tuple2!12055 lt!215351 (_2!6348 lt!214953)))))

(declare-fun lt!215360 () Unit!8607)

(declare-fun lt!215359 () Unit!8607)

(assert (=> d!44355 (= lt!215360 lt!215359)))

(assert (=> d!44355 (isPrefixOf!0 lt!215351 (_2!6348 lt!214953))))

(assert (=> d!44355 (= lt!215359 (lemmaIsPrefixTransitive!0 lt!215351 (_2!6348 lt!214953) (_2!6348 lt!214953)))))

(declare-fun lt!215347 () Unit!8607)

(declare-fun lt!215355 () Unit!8607)

(assert (=> d!44355 (= lt!215347 lt!215355)))

(assert (=> d!44355 (isPrefixOf!0 lt!215351 (_2!6348 lt!214953))))

(assert (=> d!44355 (= lt!215355 (lemmaIsPrefixTransitive!0 lt!215351 (_2!6348 lt!214944) (_2!6348 lt!214953)))))

(declare-fun lt!215350 () Unit!8607)

(declare-fun e!91803 () Unit!8607)

(assert (=> d!44355 (= lt!215350 e!91803)))

(declare-fun c!7740 () Bool)

(assert (=> d!44355 (= c!7740 (not (= (size!2830 (buf!3237 (_2!6348 lt!214944))) #b00000000000000000000000000000000)))))

(declare-fun lt!215342 () Unit!8607)

(declare-fun lt!215348 () Unit!8607)

(assert (=> d!44355 (= lt!215342 lt!215348)))

(assert (=> d!44355 (isPrefixOf!0 (_2!6348 lt!214953) (_2!6348 lt!214953))))

(assert (=> d!44355 (= lt!215348 (lemmaIsPrefixRefl!0 (_2!6348 lt!214953)))))

(declare-fun lt!215356 () Unit!8607)

(declare-fun lt!215353 () Unit!8607)

(assert (=> d!44355 (= lt!215356 lt!215353)))

(assert (=> d!44355 (= lt!215353 (lemmaIsPrefixRefl!0 (_2!6348 lt!214953)))))

(declare-fun lt!215358 () Unit!8607)

(declare-fun lt!215346 () Unit!8607)

(assert (=> d!44355 (= lt!215358 lt!215346)))

(assert (=> d!44355 (isPrefixOf!0 lt!215351 lt!215351)))

(assert (=> d!44355 (= lt!215346 (lemmaIsPrefixRefl!0 lt!215351))))

(declare-fun lt!215352 () Unit!8607)

(declare-fun lt!215357 () Unit!8607)

(assert (=> d!44355 (= lt!215352 lt!215357)))

(assert (=> d!44355 (isPrefixOf!0 (_2!6348 lt!214944) (_2!6348 lt!214944))))

(assert (=> d!44355 (= lt!215357 (lemmaIsPrefixRefl!0 (_2!6348 lt!214944)))))

(assert (=> d!44355 (= lt!215351 (BitStream!4925 (buf!3237 (_2!6348 lt!214953)) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944))))))

(assert (=> d!44355 (isPrefixOf!0 (_2!6348 lt!214944) (_2!6348 lt!214953))))

(assert (=> d!44355 (= (reader!0 (_2!6348 lt!214944) (_2!6348 lt!214953)) lt!215354)))

(declare-fun b!138081 () Bool)

(declare-fun lt!215341 () Unit!8607)

(assert (=> b!138081 (= e!91803 lt!215341)))

(declare-fun lt!215349 () (_ BitVec 64))

(assert (=> b!138081 (= lt!215349 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215345 () (_ BitVec 64))

(assert (=> b!138081 (= lt!215345 (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214944))) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944))))))

(assert (=> b!138081 (= lt!215341 (arrayBitRangesEqSymmetric!0 (buf!3237 (_2!6348 lt!214944)) (buf!3237 (_2!6348 lt!214953)) lt!215349 lt!215345))))

(assert (=> b!138081 (arrayBitRangesEq!0 (buf!3237 (_2!6348 lt!214953)) (buf!3237 (_2!6348 lt!214944)) lt!215349 lt!215345)))

(declare-fun b!138082 () Bool)

(declare-fun Unit!8615 () Unit!8607)

(assert (=> b!138082 (= e!91803 Unit!8615)))

(declare-fun b!138083 () Bool)

(declare-fun res!115051 () Bool)

(assert (=> b!138083 (=> (not res!115051) (not e!91804))))

(assert (=> b!138083 (= res!115051 (isPrefixOf!0 (_2!6350 lt!215354) (_2!6348 lt!214953)))))

(assert (= (and d!44355 c!7740) b!138081))

(assert (= (and d!44355 (not c!7740)) b!138082))

(assert (= (and d!44355 res!115049) b!138080))

(assert (= (and b!138080 res!115050) b!138083))

(assert (= (and b!138083 res!115051) b!138079))

(declare-fun m!212297 () Bool)

(assert (=> b!138079 m!212297))

(assert (=> b!138079 m!211871))

(assert (=> b!138079 m!211865))

(declare-fun m!212299 () Bool)

(assert (=> b!138080 m!212299))

(declare-fun m!212301 () Bool)

(assert (=> b!138083 m!212301))

(assert (=> b!138081 m!211865))

(declare-fun m!212303 () Bool)

(assert (=> b!138081 m!212303))

(declare-fun m!212305 () Bool)

(assert (=> b!138081 m!212305))

(declare-fun m!212307 () Bool)

(assert (=> d!44355 m!212307))

(declare-fun m!212309 () Bool)

(assert (=> d!44355 m!212309))

(assert (=> d!44355 m!212159))

(assert (=> d!44355 m!212219))

(assert (=> d!44355 m!211861))

(declare-fun m!212311 () Bool)

(assert (=> d!44355 m!212311))

(assert (=> d!44355 m!212223))

(declare-fun m!212313 () Bool)

(assert (=> d!44355 m!212313))

(declare-fun m!212315 () Bool)

(assert (=> d!44355 m!212315))

(declare-fun m!212317 () Bool)

(assert (=> d!44355 m!212317))

(assert (=> d!44355 m!212163))

(assert (=> b!137890 d!44355))

(declare-fun d!44357 () Bool)

(assert (=> d!44357 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!215361 () Unit!8607)

(assert (=> d!44357 (= lt!215361 (choose!26 thiss!1634 (buf!3237 (_2!6348 lt!214953)) (bvsub to!404 from!447) (BitStream!4925 (buf!3237 (_2!6348 lt!214953)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634))))))

(assert (=> d!44357 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3237 (_2!6348 lt!214953)) (bvsub to!404 from!447)) lt!215361)))

(declare-fun bs!10818 () Bool)

(assert (= bs!10818 d!44357))

(assert (=> bs!10818 m!211877))

(declare-fun m!212319 () Bool)

(assert (=> bs!10818 m!212319))

(assert (=> b!137890 d!44357))

(declare-fun d!44359 () Bool)

(declare-fun lt!215362 () tuple3!524)

(assert (=> d!44359 (= lt!215362 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6350 lt!214925) #b00000000000000000000000000000001) lt!214934 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44359 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6350 lt!214925) #b00000000000000000000000000000001) lt!214934 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12053 (_2!6361 lt!215362) (_3!323 lt!215362)))))

(declare-fun bs!10819 () Bool)

(assert (= bs!10819 d!44359))

(assert (=> bs!10819 m!211901))

(declare-fun m!212321 () Bool)

(assert (=> bs!10819 m!212321))

(assert (=> b!137890 d!44359))

(declare-fun d!44361 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4924 (_ BitVec 32)) tuple2!12050)

(assert (=> d!44361 (= (withMovedByteIndex!0 (_1!6350 lt!214925) #b00000000000000000000000000000001) (_2!6348 (moveByteIndex!0 (_1!6350 lt!214925) #b00000000000000000000000000000001)))))

(declare-fun bs!10820 () Bool)

(assert (= bs!10820 d!44361))

(declare-fun m!212323 () Bool)

(assert (=> bs!10820 m!212323))

(assert (=> b!137890 d!44361))

(declare-fun d!44363 () Bool)

(declare-fun res!115053 () Bool)

(declare-fun e!91805 () Bool)

(assert (=> d!44363 (=> (not res!115053) (not e!91805))))

(assert (=> d!44363 (= res!115053 (= (size!2830 (buf!3237 thiss!1634)) (size!2830 (buf!3237 (_2!6348 lt!214944)))))))

(assert (=> d!44363 (= (isPrefixOf!0 thiss!1634 (_2!6348 lt!214944)) e!91805)))

(declare-fun b!138084 () Bool)

(declare-fun res!115052 () Bool)

(assert (=> b!138084 (=> (not res!115052) (not e!91805))))

(assert (=> b!138084 (= res!115052 (bvsle (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634)) (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214944))) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944)))))))

(declare-fun b!138085 () Bool)

(declare-fun e!91806 () Bool)

(assert (=> b!138085 (= e!91805 e!91806)))

(declare-fun res!115054 () Bool)

(assert (=> b!138085 (=> res!115054 e!91806)))

(assert (=> b!138085 (= res!115054 (= (size!2830 (buf!3237 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138086 () Bool)

(assert (=> b!138086 (= e!91806 (arrayBitRangesEq!0 (buf!3237 thiss!1634) (buf!3237 (_2!6348 lt!214944)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2830 (buf!3237 thiss!1634)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634))))))

(assert (= (and d!44363 res!115053) b!138084))

(assert (= (and b!138084 res!115052) b!138085))

(assert (= (and b!138085 (not res!115054)) b!138086))

(assert (=> b!138084 m!211867))

(assert (=> b!138084 m!211865))

(assert (=> b!138086 m!211867))

(assert (=> b!138086 m!211867))

(declare-fun m!212325 () Bool)

(assert (=> b!138086 m!212325))

(assert (=> b!137893 d!44363))

(declare-fun d!44365 () Bool)

(assert (=> d!44365 (= (array_inv!2619 arr!237) (bvsge (size!2830 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26740 d!44365))

(declare-fun d!44367 () Bool)

(assert (=> d!44367 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6039 thiss!1634) (currentByte!6044 thiss!1634) (size!2830 (buf!3237 thiss!1634))))))

(declare-fun bs!10821 () Bool)

(assert (= bs!10821 d!44367))

(assert (=> bs!10821 m!211851))

(assert (=> start!26740 d!44367))

(declare-fun d!44369 () Bool)

(declare-fun res!115056 () Bool)

(declare-fun e!91807 () Bool)

(assert (=> d!44369 (=> (not res!115056) (not e!91807))))

(assert (=> d!44369 (= res!115056 (= (size!2830 (buf!3237 (_2!6348 lt!214944))) (size!2830 (buf!3237 (_2!6348 lt!214953)))))))

(assert (=> d!44369 (= (isPrefixOf!0 (_2!6348 lt!214944) (_2!6348 lt!214953)) e!91807)))

(declare-fun b!138087 () Bool)

(declare-fun res!115055 () Bool)

(assert (=> b!138087 (=> (not res!115055) (not e!91807))))

(assert (=> b!138087 (= res!115055 (bvsle (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214944))) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944))) (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214953))) (currentByte!6044 (_2!6348 lt!214953)) (currentBit!6039 (_2!6348 lt!214953)))))))

(declare-fun b!138088 () Bool)

(declare-fun e!91808 () Bool)

(assert (=> b!138088 (= e!91807 e!91808)))

(declare-fun res!115057 () Bool)

(assert (=> b!138088 (=> res!115057 e!91808)))

(assert (=> b!138088 (= res!115057 (= (size!2830 (buf!3237 (_2!6348 lt!214944))) #b00000000000000000000000000000000))))

(declare-fun b!138089 () Bool)

(assert (=> b!138089 (= e!91808 (arrayBitRangesEq!0 (buf!3237 (_2!6348 lt!214944)) (buf!3237 (_2!6348 lt!214953)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2830 (buf!3237 (_2!6348 lt!214944))) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944)))))))

(assert (= (and d!44369 res!115056) b!138087))

(assert (= (and b!138087 res!115055) b!138088))

(assert (= (and b!138088 (not res!115057)) b!138089))

(assert (=> b!138087 m!211865))

(assert (=> b!138087 m!211871))

(assert (=> b!138089 m!211865))

(assert (=> b!138089 m!211865))

(declare-fun m!212327 () Bool)

(assert (=> b!138089 m!212327))

(assert (=> b!137883 d!44369))

(declare-fun d!44371 () Bool)

(declare-fun res!115058 () Bool)

(declare-fun e!91809 () Bool)

(assert (=> d!44371 (=> res!115058 e!91809)))

(assert (=> d!44371 (= res!115058 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44371 (= (arrayRangesEq!233 arr!237 (_2!6349 lt!214931) #b00000000000000000000000000000000 to!404) e!91809)))

(declare-fun b!138090 () Bool)

(declare-fun e!91810 () Bool)

(assert (=> b!138090 (= e!91809 e!91810)))

(declare-fun res!115059 () Bool)

(assert (=> b!138090 (=> (not res!115059) (not e!91810))))

(assert (=> b!138090 (= res!115059 (= (select (arr!3516 arr!237) #b00000000000000000000000000000000) (select (arr!3516 (_2!6349 lt!214931)) #b00000000000000000000000000000000)))))

(declare-fun b!138091 () Bool)

(assert (=> b!138091 (= e!91810 (arrayRangesEq!233 arr!237 (_2!6349 lt!214931) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44371 (not res!115058)) b!138090))

(assert (= (and b!138090 res!115059) b!138091))

(declare-fun m!212329 () Bool)

(assert (=> b!138090 m!212329))

(assert (=> b!138090 m!212183))

(declare-fun m!212331 () Bool)

(assert (=> b!138091 m!212331))

(assert (=> b!137894 d!44371))

(declare-fun d!44373 () Bool)

(assert (=> d!44373 (arrayRangesEq!233 arr!237 (_2!6349 lt!214931) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215365 () Unit!8607)

(declare-fun choose!77 (array!6249 array!6249 array!6249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8607)

(assert (=> d!44373 (= lt!215365 (choose!77 arr!237 (_2!6349 lt!214929) (_2!6349 lt!214931) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!44373 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!44373 (= (arrayRangesEqTransitive!35 arr!237 (_2!6349 lt!214929) (_2!6349 lt!214931) #b00000000000000000000000000000000 to!404 to!404) lt!215365)))

(declare-fun bs!10822 () Bool)

(assert (= bs!10822 d!44373))

(assert (=> bs!10822 m!211843))

(declare-fun m!212333 () Bool)

(assert (=> bs!10822 m!212333))

(assert (=> b!137894 d!44373))

(declare-fun d!44375 () Bool)

(declare-fun res!115060 () Bool)

(declare-fun e!91811 () Bool)

(assert (=> d!44375 (=> res!115060 e!91811)))

(assert (=> d!44375 (= res!115060 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44375 (= (arrayRangesEq!233 (_2!6349 lt!214929) (_2!6349 lt!214931) #b00000000000000000000000000000000 to!404) e!91811)))

(declare-fun b!138092 () Bool)

(declare-fun e!91812 () Bool)

(assert (=> b!138092 (= e!91811 e!91812)))

(declare-fun res!115061 () Bool)

(assert (=> b!138092 (=> (not res!115061) (not e!91812))))

(assert (=> b!138092 (= res!115061 (= (select (arr!3516 (_2!6349 lt!214929)) #b00000000000000000000000000000000) (select (arr!3516 (_2!6349 lt!214931)) #b00000000000000000000000000000000)))))

(declare-fun b!138093 () Bool)

(assert (=> b!138093 (= e!91812 (arrayRangesEq!233 (_2!6349 lt!214929) (_2!6349 lt!214931) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44375 (not res!115060)) b!138092))

(assert (= (and b!138092 res!115061) b!138093))

(assert (=> b!138092 m!212189))

(assert (=> b!138092 m!212183))

(declare-fun m!212335 () Bool)

(assert (=> b!138093 m!212335))

(assert (=> b!137894 d!44375))

(declare-fun d!44377 () Bool)

(assert (=> d!44377 (arrayRangesEq!233 (_2!6349 lt!214929) (_2!6349 lt!214931) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215368 () Unit!8607)

(declare-fun choose!78 (array!6249 array!6249 (_ BitVec 32) (_ BitVec 32)) Unit!8607)

(assert (=> d!44377 (= lt!215368 (choose!78 (_2!6349 lt!214931) (_2!6349 lt!214929) #b00000000000000000000000000000000 to!404))))

(assert (=> d!44377 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!2830 (_2!6349 lt!214931))))))

(assert (=> d!44377 (= (arrayRangesEqSymmetricLemma!46 (_2!6349 lt!214931) (_2!6349 lt!214929) #b00000000000000000000000000000000 to!404) lt!215368)))

(declare-fun bs!10823 () Bool)

(assert (= bs!10823 d!44377))

(assert (=> bs!10823 m!211847))

(declare-fun m!212337 () Bool)

(assert (=> bs!10823 m!212337))

(assert (=> b!137894 d!44377))

(declare-fun d!44379 () Bool)

(assert (=> d!44379 (= (invariant!0 (currentBit!6039 thiss!1634) (currentByte!6044 thiss!1634) (size!2830 (buf!3237 thiss!1634))) (and (bvsge (currentBit!6039 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6039 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6044 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6044 thiss!1634) (size!2830 (buf!3237 thiss!1634))) (and (= (currentBit!6039 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6044 thiss!1634) (size!2830 (buf!3237 thiss!1634)))))))))

(assert (=> b!137881 d!44379))

(declare-fun d!44381 () Bool)

(assert (=> d!44381 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_1!6350 lt!214925)))) ((_ sign_extend 32) (currentByte!6044 (_1!6350 lt!214925))) ((_ sign_extend 32) (currentBit!6039 (_1!6350 lt!214925))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_1!6350 lt!214925)))) ((_ sign_extend 32) (currentByte!6044 (_1!6350 lt!214925))) ((_ sign_extend 32) (currentBit!6039 (_1!6350 lt!214925)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10824 () Bool)

(assert (= bs!10824 d!44381))

(declare-fun m!212339 () Bool)

(assert (=> bs!10824 m!212339))

(assert (=> b!137892 d!44381))

(declare-fun d!44383 () Bool)

(assert (=> d!44383 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634)) lt!214946) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634))) lt!214946))))

(declare-fun bs!10825 () Bool)

(assert (= bs!10825 d!44383))

(assert (=> bs!10825 m!212265))

(assert (=> b!137892 d!44383))

(declare-fun d!44385 () Bool)

(assert (=> d!44385 (validate_offset_bits!1 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634)) lt!214946)))

(declare-fun lt!215371 () Unit!8607)

(declare-fun choose!9 (BitStream!4924 array!6249 (_ BitVec 64) BitStream!4924) Unit!8607)

(assert (=> d!44385 (= lt!215371 (choose!9 thiss!1634 (buf!3237 (_2!6348 lt!214953)) lt!214946 (BitStream!4925 (buf!3237 (_2!6348 lt!214953)) (currentByte!6044 thiss!1634) (currentBit!6039 thiss!1634))))))

(assert (=> d!44385 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3237 (_2!6348 lt!214953)) lt!214946) lt!215371)))

(declare-fun bs!10826 () Bool)

(assert (= bs!10826 d!44385))

(assert (=> bs!10826 m!211839))

(declare-fun m!212341 () Bool)

(assert (=> bs!10826 m!212341))

(assert (=> b!137892 d!44385))

(declare-fun d!44387 () Bool)

(assert (=> d!44387 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2830 (buf!3237 thiss!1634))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 thiss!1634))) ((_ sign_extend 32) (currentByte!6044 thiss!1634)) ((_ sign_extend 32) (currentBit!6039 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10827 () Bool)

(assert (= bs!10827 d!44387))

(assert (=> bs!10827 m!212177))

(assert (=> b!137882 d!44387))

(declare-fun d!44389 () Bool)

(declare-fun res!115062 () Bool)

(declare-fun e!91813 () Bool)

(assert (=> d!44389 (=> res!115062 e!91813)))

(assert (=> d!44389 (= res!115062 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44389 (= (arrayRangesEq!233 arr!237 (_2!6349 lt!214937) #b00000000000000000000000000000000 to!404) e!91813)))

(declare-fun b!138094 () Bool)

(declare-fun e!91814 () Bool)

(assert (=> b!138094 (= e!91813 e!91814)))

(declare-fun res!115063 () Bool)

(assert (=> b!138094 (=> (not res!115063) (not e!91814))))

(assert (=> b!138094 (= res!115063 (= (select (arr!3516 arr!237) #b00000000000000000000000000000000) (select (arr!3516 (_2!6349 lt!214937)) #b00000000000000000000000000000000)))))

(declare-fun b!138095 () Bool)

(assert (=> b!138095 (= e!91814 (arrayRangesEq!233 arr!237 (_2!6349 lt!214937) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44389 (not res!115062)) b!138094))

(assert (= (and b!138094 res!115063) b!138095))

(assert (=> b!138094 m!212329))

(declare-fun m!212343 () Bool)

(assert (=> b!138094 m!212343))

(declare-fun m!212345 () Bool)

(assert (=> b!138095 m!212345))

(assert (=> b!137885 d!44389))

(assert (=> b!137886 d!44310))

(assert (=> b!137886 d!44306))

(declare-fun lt!215372 () tuple3!524)

(declare-fun d!44391 () Bool)

(assert (=> d!44391 (= lt!215372 (readByteArrayLoop!0 (_1!6350 lt!214949) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44391 (= (readByteArrayLoopPure!0 (_1!6350 lt!214949) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12053 (_2!6361 lt!215372) (_3!323 lt!215372)))))

(declare-fun bs!10828 () Bool)

(assert (= bs!10828 d!44391))

(declare-fun m!212347 () Bool)

(assert (=> bs!10828 m!212347))

(assert (=> b!137884 d!44391))

(declare-fun d!44393 () Bool)

(assert (=> d!44393 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) lt!214952) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944)))) lt!214952))))

(declare-fun bs!10829 () Bool)

(assert (= bs!10829 d!44393))

(assert (=> bs!10829 m!212201))

(assert (=> b!137884 d!44393))

(declare-fun d!44395 () Bool)

(assert (=> d!44395 (validate_offset_bits!1 ((_ sign_extend 32) (size!2830 (buf!3237 (_2!6348 lt!214953)))) ((_ sign_extend 32) (currentByte!6044 (_2!6348 lt!214944))) ((_ sign_extend 32) (currentBit!6039 (_2!6348 lt!214944))) lt!214952)))

(declare-fun lt!215373 () Unit!8607)

(assert (=> d!44395 (= lt!215373 (choose!9 (_2!6348 lt!214944) (buf!3237 (_2!6348 lt!214953)) lt!214952 (BitStream!4925 (buf!3237 (_2!6348 lt!214953)) (currentByte!6044 (_2!6348 lt!214944)) (currentBit!6039 (_2!6348 lt!214944)))))))

(assert (=> d!44395 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6348 lt!214944) (buf!3237 (_2!6348 lt!214953)) lt!214952) lt!215373)))

(declare-fun bs!10830 () Bool)

(assert (= bs!10830 d!44395))

(assert (=> bs!10830 m!211927))

(declare-fun m!212349 () Bool)

(assert (=> bs!10830 m!212349))

(assert (=> b!137884 d!44395))

(assert (=> b!137884 d!44355))

(push 1)

(assert (not d!44346))

(assert (not d!44328))

(assert (not b!138078))

(assert (not b!138091))

(assert (not b!138077))

(assert (not d!44385))

(assert (not b!138051))

(assert (not b!138089))

(assert (not d!44326))

(assert (not b!138034))

(assert (not d!44320))

(assert (not b!138066))

(assert (not d!44334))

(assert (not b!138064))

(assert (not b!138084))

(assert (not b!138093))

(assert (not d!44336))

(assert (not d!44322))

(assert (not b!138037))

(assert (not b!138053))

(assert (not d!44359))

(assert (not b!138035))

(assert (not d!44304))

(assert (not d!44355))

(assert (not d!44306))

(assert (not b!138080))

(assert (not d!44367))

(assert (not d!44381))

(assert (not b!138033))

(assert (not b!138095))

(assert (not d!44391))

(assert (not b!138054))

(assert (not d!44393))

(assert (not d!44353))

(assert (not d!44330))

(assert (not d!44318))

(assert (not d!44316))

(assert (not b!138069))

(assert (not d!44324))

(assert (not d!44357))

(assert (not b!138076))

(assert (not d!44338))

(assert (not d!44310))

(assert (not d!44332))

(assert (not d!44377))

(assert (not b!138081))

(assert (not b!138086))

(assert (not d!44373))

(assert (not d!44342))

(assert (not d!44349))

(assert (not b!138010))

(assert (not b!138050))

(assert (not b!138030))

(assert (not d!44361))

(assert (not d!44383))

(assert (not d!44302))

(assert (not b!138052))

(assert (not d!44300))

(assert (not d!44351))

(assert (not b!138012))

(assert (not b!138087))

(assert (not b!138009))

(assert (not d!44340))

(assert (not d!44387))

(assert (not b!138008))

(assert (not b!138028))

(assert (not d!44395))

(assert (not b!138083))

(assert (not b!138079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

