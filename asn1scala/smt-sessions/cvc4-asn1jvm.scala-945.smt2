; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26744 () Bool)

(assert start!26744)

(declare-fun b!137981 () Bool)

(declare-fun res!114972 () Bool)

(declare-fun e!91746 () Bool)

(assert (=> b!137981 (=> (not res!114972) (not e!91746))))

(declare-datatypes ((array!6253 0))(
  ( (array!6254 (arr!3518 (Array (_ BitVec 32) (_ BitVec 8))) (size!2832 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4928 0))(
  ( (BitStream!4929 (buf!3239 array!6253) (currentByte!6046 (_ BitVec 32)) (currentBit!6041 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8611 0))(
  ( (Unit!8612) )
))
(declare-datatypes ((tuple2!12066 0))(
  ( (tuple2!12067 (_1!6356 Unit!8611) (_2!6356 BitStream!4928)) )
))
(declare-fun lt!215112 () tuple2!12066)

(declare-fun lt!215115 () tuple2!12066)

(declare-fun isPrefixOf!0 (BitStream!4928 BitStream!4928) Bool)

(assert (=> b!137981 (= res!114972 (isPrefixOf!0 (_2!6356 lt!215112) (_2!6356 lt!215115)))))

(declare-fun b!137982 () Bool)

(declare-fun e!91747 () Bool)

(declare-fun e!91749 () Bool)

(assert (=> b!137982 (= e!91747 (not e!91749))))

(declare-fun res!114962 () Bool)

(assert (=> b!137982 (=> res!114962 e!91749)))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!12068 0))(
  ( (tuple2!12069 (_1!6357 BitStream!4928) (_2!6357 array!6253)) )
))
(declare-fun lt!215125 () tuple2!12068)

(declare-fun lt!215124 () tuple2!12068)

(declare-fun arrayRangesEq!235 (array!6253 array!6253 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137982 (= res!114962 (not (arrayRangesEq!235 (_2!6357 lt!215124) (_2!6357 lt!215125) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!215103 () tuple2!12068)

(assert (=> b!137982 (arrayRangesEq!235 (_2!6357 lt!215124) (_2!6357 lt!215103) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((tuple2!12070 0))(
  ( (tuple2!12071 (_1!6358 BitStream!4928) (_2!6358 BitStream!4928)) )
))
(declare-fun lt!215122 () tuple2!12070)

(declare-fun lt!215126 () Unit!8611)

(declare-fun arr!237 () array!6253)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4928 array!6253 (_ BitVec 32) (_ BitVec 32)) Unit!8611)

(assert (=> b!137982 (= lt!215126 (readByteArrayLoopArrayPrefixLemma!0 (_1!6358 lt!215122) arr!237 from!447 to!404))))

(declare-fun lt!215111 () array!6253)

(declare-fun readByteArrayLoopPure!0 (BitStream!4928 array!6253 (_ BitVec 32) (_ BitVec 32)) tuple2!12068)

(declare-fun withMovedByteIndex!0 (BitStream!4928 (_ BitVec 32)) BitStream!4928)

(assert (=> b!137982 (= lt!215103 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6358 lt!215122) #b00000000000000000000000000000001) lt!215111 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!215120 () tuple2!12070)

(assert (=> b!137982 (= lt!215125 (readByteArrayLoopPure!0 (_1!6358 lt!215120) lt!215111 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!12072 0))(
  ( (tuple2!12073 (_1!6359 BitStream!4928) (_2!6359 (_ BitVec 8))) )
))
(declare-fun lt!215109 () tuple2!12072)

(assert (=> b!137982 (= lt!215111 (array!6254 (store (arr!3518 arr!237) from!447 (_2!6359 lt!215109)) (size!2832 arr!237)))))

(declare-fun lt!215108 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) lt!215108)))

(declare-fun lt!215113 () Unit!8611)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4928 array!6253 (_ BitVec 32)) Unit!8611)

(assert (=> b!137982 (= lt!215113 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6356 lt!215112) (buf!3239 (_2!6356 lt!215115)) lt!215108))))

(assert (=> b!137982 (= (_1!6357 lt!215124) (_2!6358 lt!215122))))

(assert (=> b!137982 (= lt!215124 (readByteArrayLoopPure!0 (_1!6358 lt!215122) arr!237 from!447 to!404))))

(declare-fun thiss!1634 () BitStream!4928)

(assert (=> b!137982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!215123 () Unit!8611)

(assert (=> b!137982 (= lt!215123 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3239 (_2!6356 lt!215115)) (bvsub to!404 from!447)))))

(assert (=> b!137982 (= (_2!6359 lt!215109) (select (arr!3518 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4928) tuple2!12072)

(assert (=> b!137982 (= lt!215109 (readBytePure!0 (_1!6358 lt!215122)))))

(declare-fun reader!0 (BitStream!4928 BitStream!4928) tuple2!12070)

(assert (=> b!137982 (= lt!215120 (reader!0 (_2!6356 lt!215112) (_2!6356 lt!215115)))))

(assert (=> b!137982 (= lt!215122 (reader!0 thiss!1634 (_2!6356 lt!215115)))))

(declare-fun e!91753 () Bool)

(assert (=> b!137982 e!91753))

(declare-fun res!114961 () Bool)

(assert (=> b!137982 (=> (not res!114961) (not e!91753))))

(declare-fun lt!215118 () tuple2!12072)

(declare-fun lt!215104 () tuple2!12072)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!137982 (= res!114961 (= (bitIndex!0 (size!2832 (buf!3239 (_1!6359 lt!215118))) (currentByte!6046 (_1!6359 lt!215118)) (currentBit!6041 (_1!6359 lt!215118))) (bitIndex!0 (size!2832 (buf!3239 (_1!6359 lt!215104))) (currentByte!6046 (_1!6359 lt!215104)) (currentBit!6041 (_1!6359 lt!215104)))))))

(declare-fun lt!215100 () Unit!8611)

(declare-fun lt!215127 () BitStream!4928)

(declare-fun readBytePrefixLemma!0 (BitStream!4928 BitStream!4928) Unit!8611)

(assert (=> b!137982 (= lt!215100 (readBytePrefixLemma!0 lt!215127 (_2!6356 lt!215115)))))

(assert (=> b!137982 (= lt!215104 (readBytePure!0 (BitStream!4929 (buf!3239 (_2!6356 lt!215115)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634))))))

(assert (=> b!137982 (= lt!215118 (readBytePure!0 lt!215127))))

(assert (=> b!137982 (= lt!215127 (BitStream!4929 (buf!3239 (_2!6356 lt!215112)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)))))

(declare-fun e!91752 () Bool)

(assert (=> b!137982 e!91752))

(declare-fun res!114965 () Bool)

(assert (=> b!137982 (=> (not res!114965) (not e!91752))))

(assert (=> b!137982 (= res!114965 (isPrefixOf!0 thiss!1634 (_2!6356 lt!215115)))))

(declare-fun lt!215102 () Unit!8611)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4928 BitStream!4928 BitStream!4928) Unit!8611)

(assert (=> b!137982 (= lt!215102 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6356 lt!215112) (_2!6356 lt!215115)))))

(declare-fun e!91750 () Bool)

(assert (=> b!137982 e!91750))

(declare-fun res!114968 () Bool)

(assert (=> b!137982 (=> (not res!114968) (not e!91750))))

(assert (=> b!137982 (= res!114968 (= (size!2832 (buf!3239 (_2!6356 lt!215112))) (size!2832 (buf!3239 (_2!6356 lt!215115)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4928 array!6253 (_ BitVec 32) (_ BitVec 32)) tuple2!12066)

(assert (=> b!137982 (= lt!215115 (appendByteArrayLoop!0 (_2!6356 lt!215112) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!137982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215112)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) lt!215108)))

(assert (=> b!137982 (= lt!215108 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!215119 () Unit!8611)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4928 BitStream!4928 (_ BitVec 64) (_ BitVec 32)) Unit!8611)

(assert (=> b!137982 (= lt!215119 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6356 lt!215112) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!91745 () Bool)

(assert (=> b!137982 e!91745))

(declare-fun res!114974 () Bool)

(assert (=> b!137982 (=> (not res!114974) (not e!91745))))

(assert (=> b!137982 (= res!114974 (= (size!2832 (buf!3239 thiss!1634)) (size!2832 (buf!3239 (_2!6356 lt!215112)))))))

(declare-fun appendByte!0 (BitStream!4928 (_ BitVec 8)) tuple2!12066)

(assert (=> b!137982 (= lt!215112 (appendByte!0 thiss!1634 (select (arr!3518 arr!237) from!447)))))

(declare-fun b!137983 () Bool)

(declare-fun res!114970 () Bool)

(assert (=> b!137983 (=> (not res!114970) (not e!91747))))

(assert (=> b!137983 (= res!114970 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 thiss!1634))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!137984 () Bool)

(declare-fun lt!215121 () tuple2!12072)

(declare-fun lt!215106 () tuple2!12070)

(assert (=> b!137984 (= e!91745 (and (= (_2!6359 lt!215121) (select (arr!3518 arr!237) from!447)) (= (_1!6359 lt!215121) (_2!6358 lt!215106))))))

(assert (=> b!137984 (= lt!215121 (readBytePure!0 (_1!6358 lt!215106)))))

(assert (=> b!137984 (= lt!215106 (reader!0 thiss!1634 (_2!6356 lt!215112)))))

(declare-fun b!137985 () Bool)

(declare-fun e!91755 () Bool)

(declare-fun array_inv!2621 (array!6253) Bool)

(assert (=> b!137985 (= e!91755 (array_inv!2621 (buf!3239 thiss!1634)))))

(declare-fun b!137986 () Bool)

(declare-fun res!114971 () Bool)

(assert (=> b!137986 (=> (not res!114971) (not e!91745))))

(assert (=> b!137986 (= res!114971 (= (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215112))) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)))))))

(declare-fun b!137987 () Bool)

(declare-fun e!91744 () Bool)

(assert (=> b!137987 (= e!91749 e!91744)))

(declare-fun res!114964 () Bool)

(assert (=> b!137987 (=> res!114964 e!91744)))

(assert (=> b!137987 (= res!114964 (not (= (size!2832 (buf!3239 thiss!1634)) (size!2832 (buf!3239 (_2!6356 lt!215115))))))))

(assert (=> b!137987 (arrayRangesEq!235 arr!237 (_2!6357 lt!215124) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215107 () Unit!8611)

(declare-fun arrayRangesEqTransitive!37 (array!6253 array!6253 array!6253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8611)

(assert (=> b!137987 (= lt!215107 (arrayRangesEqTransitive!37 arr!237 (_2!6357 lt!215125) (_2!6357 lt!215124) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!137987 (arrayRangesEq!235 (_2!6357 lt!215125) (_2!6357 lt!215124) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215105 () Unit!8611)

(declare-fun arrayRangesEqSymmetricLemma!48 (array!6253 array!6253 (_ BitVec 32) (_ BitVec 32)) Unit!8611)

(assert (=> b!137987 (= lt!215105 (arrayRangesEqSymmetricLemma!48 (_2!6357 lt!215124) (_2!6357 lt!215125) #b00000000000000000000000000000000 to!404))))

(declare-fun b!137988 () Bool)

(declare-fun e!91748 () Bool)

(assert (=> b!137988 (= e!91744 e!91748)))

(declare-fun res!114969 () Bool)

(assert (=> b!137988 (=> res!114969 e!91748)))

(declare-fun lt!215110 () (_ BitVec 64))

(assert (=> b!137988 (= res!114969 (not (= (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215115))) (currentByte!6046 (_2!6356 lt!215115)) (currentBit!6041 (_2!6356 lt!215115))) (bvadd (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!215110)))))))

(assert (=> b!137988 (= lt!215110 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!137989 () Bool)

(declare-fun res!114966 () Bool)

(assert (=> b!137989 (=> (not res!114966) (not e!91745))))

(assert (=> b!137989 (= res!114966 (isPrefixOf!0 thiss!1634 (_2!6356 lt!215112)))))

(declare-fun b!137990 () Bool)

(declare-fun res!114960 () Bool)

(assert (=> b!137990 (=> (not res!114960) (not e!91747))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137990 (= res!114960 (invariant!0 (currentBit!6041 thiss!1634) (currentByte!6046 thiss!1634) (size!2832 (buf!3239 thiss!1634))))))

(declare-fun b!137992 () Bool)

(declare-fun res!114973 () Bool)

(assert (=> b!137992 (=> (not res!114973) (not e!91747))))

(assert (=> b!137992 (= res!114973 (bvslt from!447 to!404))))

(declare-fun e!91754 () Bool)

(declare-fun b!137993 () Bool)

(declare-fun lt!215114 () tuple2!12068)

(assert (=> b!137993 (= e!91754 (not (arrayRangesEq!235 arr!237 (_2!6357 lt!215114) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!137994 () Bool)

(assert (=> b!137994 (= e!91752 (invariant!0 (currentBit!6041 thiss!1634) (currentByte!6046 thiss!1634) (size!2832 (buf!3239 (_2!6356 lt!215112)))))))

(declare-fun b!137995 () Bool)

(assert (=> b!137995 (= e!91748 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_1!6358 lt!215122)))) ((_ sign_extend 32) (currentByte!6046 (_1!6358 lt!215122))) ((_ sign_extend 32) (currentBit!6041 (_1!6358 lt!215122))) (bvsub to!404 from!447)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!137995 (validate_offset_bits!1 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634)) lt!215110)))

(declare-fun lt!215101 () Unit!8611)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4928 array!6253 (_ BitVec 64)) Unit!8611)

(assert (=> b!137995 (= lt!215101 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3239 (_2!6356 lt!215115)) lt!215110))))

(declare-fun b!137996 () Bool)

(assert (=> b!137996 (= e!91753 (= (_2!6359 lt!215118) (_2!6359 lt!215104)))))

(declare-fun b!137997 () Bool)

(assert (=> b!137997 (= e!91746 (not e!91754))))

(declare-fun res!114967 () Bool)

(assert (=> b!137997 (=> res!114967 e!91754)))

(declare-fun lt!215117 () tuple2!12070)

(assert (=> b!137997 (= res!114967 (or (not (= (size!2832 (_2!6357 lt!215114)) (size!2832 arr!237))) (not (= (_1!6357 lt!215114) (_2!6358 lt!215117)))))))

(assert (=> b!137997 (= lt!215114 (readByteArrayLoopPure!0 (_1!6358 lt!215117) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!215099 () (_ BitVec 64))

(assert (=> b!137997 (validate_offset_bits!1 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) lt!215099)))

(declare-fun lt!215116 () Unit!8611)

(assert (=> b!137997 (= lt!215116 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6356 lt!215112) (buf!3239 (_2!6356 lt!215115)) lt!215099))))

(assert (=> b!137997 (= lt!215117 (reader!0 (_2!6356 lt!215112) (_2!6356 lt!215115)))))

(declare-fun b!137991 () Bool)

(assert (=> b!137991 (= e!91750 e!91746)))

(declare-fun res!114963 () Bool)

(assert (=> b!137991 (=> (not res!114963) (not e!91746))))

(assert (=> b!137991 (= res!114963 (= (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215115))) (currentByte!6046 (_2!6356 lt!215115)) (currentBit!6041 (_2!6356 lt!215115))) (bvadd (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215112))) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!215099))))))

(assert (=> b!137991 (= lt!215099 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!114975 () Bool)

(assert (=> start!26744 (=> (not res!114975) (not e!91747))))

(assert (=> start!26744 (= res!114975 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2832 arr!237))))))

(assert (=> start!26744 e!91747))

(assert (=> start!26744 true))

(assert (=> start!26744 (array_inv!2621 arr!237)))

(declare-fun inv!12 (BitStream!4928) Bool)

(assert (=> start!26744 (and (inv!12 thiss!1634) e!91755)))

(assert (= (and start!26744 res!114975) b!137983))

(assert (= (and b!137983 res!114970) b!137992))

(assert (= (and b!137992 res!114973) b!137990))

(assert (= (and b!137990 res!114960) b!137982))

(assert (= (and b!137982 res!114974) b!137986))

(assert (= (and b!137986 res!114971) b!137989))

(assert (= (and b!137989 res!114966) b!137984))

(assert (= (and b!137982 res!114968) b!137991))

(assert (= (and b!137991 res!114963) b!137981))

(assert (= (and b!137981 res!114972) b!137997))

(assert (= (and b!137997 (not res!114967)) b!137993))

(assert (= (and b!137982 res!114965) b!137994))

(assert (= (and b!137982 res!114961) b!137996))

(assert (= (and b!137982 (not res!114962)) b!137987))

(assert (= (and b!137987 (not res!114964)) b!137988))

(assert (= (and b!137988 (not res!114969)) b!137995))

(assert (= start!26744 b!137985))

(declare-fun m!212039 () Bool)

(assert (=> b!137982 m!212039))

(declare-fun m!212041 () Bool)

(assert (=> b!137982 m!212041))

(declare-fun m!212043 () Bool)

(assert (=> b!137982 m!212043))

(declare-fun m!212045 () Bool)

(assert (=> b!137982 m!212045))

(declare-fun m!212047 () Bool)

(assert (=> b!137982 m!212047))

(declare-fun m!212049 () Bool)

(assert (=> b!137982 m!212049))

(declare-fun m!212051 () Bool)

(assert (=> b!137982 m!212051))

(assert (=> b!137982 m!212049))

(declare-fun m!212053 () Bool)

(assert (=> b!137982 m!212053))

(declare-fun m!212055 () Bool)

(assert (=> b!137982 m!212055))

(declare-fun m!212057 () Bool)

(assert (=> b!137982 m!212057))

(declare-fun m!212059 () Bool)

(assert (=> b!137982 m!212059))

(declare-fun m!212061 () Bool)

(assert (=> b!137982 m!212061))

(declare-fun m!212063 () Bool)

(assert (=> b!137982 m!212063))

(declare-fun m!212065 () Bool)

(assert (=> b!137982 m!212065))

(declare-fun m!212067 () Bool)

(assert (=> b!137982 m!212067))

(declare-fun m!212069 () Bool)

(assert (=> b!137982 m!212069))

(declare-fun m!212071 () Bool)

(assert (=> b!137982 m!212071))

(declare-fun m!212073 () Bool)

(assert (=> b!137982 m!212073))

(declare-fun m!212075 () Bool)

(assert (=> b!137982 m!212075))

(declare-fun m!212077 () Bool)

(assert (=> b!137982 m!212077))

(declare-fun m!212079 () Bool)

(assert (=> b!137982 m!212079))

(declare-fun m!212081 () Bool)

(assert (=> b!137982 m!212081))

(declare-fun m!212083 () Bool)

(assert (=> b!137982 m!212083))

(declare-fun m!212085 () Bool)

(assert (=> b!137982 m!212085))

(assert (=> b!137982 m!212083))

(declare-fun m!212087 () Bool)

(assert (=> b!137982 m!212087))

(declare-fun m!212089 () Bool)

(assert (=> b!137982 m!212089))

(declare-fun m!212091 () Bool)

(assert (=> b!137982 m!212091))

(declare-fun m!212093 () Bool)

(assert (=> b!137993 m!212093))

(declare-fun m!212095 () Bool)

(assert (=> b!137987 m!212095))

(declare-fun m!212097 () Bool)

(assert (=> b!137987 m!212097))

(declare-fun m!212099 () Bool)

(assert (=> b!137987 m!212099))

(declare-fun m!212101 () Bool)

(assert (=> b!137987 m!212101))

(declare-fun m!212103 () Bool)

(assert (=> b!137985 m!212103))

(declare-fun m!212105 () Bool)

(assert (=> b!137983 m!212105))

(declare-fun m!212107 () Bool)

(assert (=> b!137991 m!212107))

(declare-fun m!212109 () Bool)

(assert (=> b!137991 m!212109))

(declare-fun m!212111 () Bool)

(assert (=> b!137994 m!212111))

(declare-fun m!212113 () Bool)

(assert (=> b!137997 m!212113))

(declare-fun m!212115 () Bool)

(assert (=> b!137997 m!212115))

(declare-fun m!212117 () Bool)

(assert (=> b!137997 m!212117))

(assert (=> b!137997 m!212067))

(declare-fun m!212119 () Bool)

(assert (=> b!137990 m!212119))

(declare-fun m!212121 () Bool)

(assert (=> b!137995 m!212121))

(declare-fun m!212123 () Bool)

(assert (=> b!137995 m!212123))

(declare-fun m!212125 () Bool)

(assert (=> b!137995 m!212125))

(declare-fun m!212127 () Bool)

(assert (=> b!137981 m!212127))

(assert (=> b!137984 m!212049))

(declare-fun m!212129 () Bool)

(assert (=> b!137984 m!212129))

(declare-fun m!212131 () Bool)

(assert (=> b!137984 m!212131))

(declare-fun m!212133 () Bool)

(assert (=> start!26744 m!212133))

(declare-fun m!212135 () Bool)

(assert (=> start!26744 m!212135))

(assert (=> b!137986 m!212109))

(declare-fun m!212137 () Bool)

(assert (=> b!137986 m!212137))

(assert (=> b!137988 m!212107))

(assert (=> b!137988 m!212137))

(declare-fun m!212139 () Bool)

(assert (=> b!137989 m!212139))

(push 1)

(assert (not b!137989))

(assert (not b!137984))

(assert (not b!137991))

(assert (not b!137985))

(assert (not b!137990))

(assert (not start!26744))

(assert (not b!137988))

(assert (not b!137987))

(assert (not b!137994))

(assert (not b!137997))

(assert (not b!137982))

(assert (not b!137983))

(assert (not b!137986))

(assert (not b!137995))

(assert (not b!137981))

(assert (not b!137993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44397 () Bool)

(declare-fun res!115068 () Bool)

(declare-fun e!91819 () Bool)

(assert (=> d!44397 (=> res!115068 e!91819)))

(assert (=> d!44397 (= res!115068 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44397 (= (arrayRangesEq!235 arr!237 (_2!6357 lt!215114) #b00000000000000000000000000000000 to!404) e!91819)))

(declare-fun b!138100 () Bool)

(declare-fun e!91820 () Bool)

(assert (=> b!138100 (= e!91819 e!91820)))

(declare-fun res!115069 () Bool)

(assert (=> b!138100 (=> (not res!115069) (not e!91820))))

(assert (=> b!138100 (= res!115069 (= (select (arr!3518 arr!237) #b00000000000000000000000000000000) (select (arr!3518 (_2!6357 lt!215114)) #b00000000000000000000000000000000)))))

(declare-fun b!138101 () Bool)

(assert (=> b!138101 (= e!91820 (arrayRangesEq!235 arr!237 (_2!6357 lt!215114) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44397 (not res!115068)) b!138100))

(assert (= (and b!138100 res!115069) b!138101))

(declare-fun m!212351 () Bool)

(assert (=> b!138100 m!212351))

(declare-fun m!212353 () Bool)

(assert (=> b!138100 m!212353))

(declare-fun m!212355 () Bool)

(assert (=> b!138101 m!212355))

(assert (=> b!137993 d!44397))

(declare-fun d!44399 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44399 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 thiss!1634))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 thiss!1634))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10831 () Bool)

(assert (= bs!10831 d!44399))

(declare-fun m!212357 () Bool)

(assert (=> bs!10831 m!212357))

(assert (=> b!137983 d!44399))

(declare-fun d!44401 () Bool)

(assert (=> d!44401 (= (invariant!0 (currentBit!6041 thiss!1634) (currentByte!6046 thiss!1634) (size!2832 (buf!3239 (_2!6356 lt!215112)))) (and (bvsge (currentBit!6041 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6041 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6046 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6046 thiss!1634) (size!2832 (buf!3239 (_2!6356 lt!215112)))) (and (= (currentBit!6041 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6046 thiss!1634) (size!2832 (buf!3239 (_2!6356 lt!215112))))))))))

(assert (=> b!137994 d!44401))

(declare-fun d!44403 () Bool)

(declare-fun res!115078 () Bool)

(declare-fun e!91826 () Bool)

(assert (=> d!44403 (=> (not res!115078) (not e!91826))))

(assert (=> d!44403 (= res!115078 (= (size!2832 (buf!3239 (_2!6356 lt!215112))) (size!2832 (buf!3239 (_2!6356 lt!215115)))))))

(assert (=> d!44403 (= (isPrefixOf!0 (_2!6356 lt!215112) (_2!6356 lt!215115)) e!91826)))

(declare-fun b!138108 () Bool)

(declare-fun res!115077 () Bool)

(assert (=> b!138108 (=> (not res!115077) (not e!91826))))

(assert (=> b!138108 (= res!115077 (bvsle (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215112))) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112))) (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215115))) (currentByte!6046 (_2!6356 lt!215115)) (currentBit!6041 (_2!6356 lt!215115)))))))

(declare-fun b!138109 () Bool)

(declare-fun e!91825 () Bool)

(assert (=> b!138109 (= e!91826 e!91825)))

(declare-fun res!115076 () Bool)

(assert (=> b!138109 (=> res!115076 e!91825)))

(assert (=> b!138109 (= res!115076 (= (size!2832 (buf!3239 (_2!6356 lt!215112))) #b00000000000000000000000000000000))))

(declare-fun b!138110 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6253 array!6253 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138110 (= e!91825 (arrayBitRangesEq!0 (buf!3239 (_2!6356 lt!215112)) (buf!3239 (_2!6356 lt!215115)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215112))) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112)))))))

(assert (= (and d!44403 res!115078) b!138108))

(assert (= (and b!138108 res!115077) b!138109))

(assert (= (and b!138109 (not res!115076)) b!138110))

(assert (=> b!138108 m!212109))

(assert (=> b!138108 m!212107))

(assert (=> b!138110 m!212109))

(assert (=> b!138110 m!212109))

(declare-fun m!212359 () Bool)

(assert (=> b!138110 m!212359))

(assert (=> b!137981 d!44403))

(declare-fun d!44405 () Bool)

(assert (=> d!44405 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215112)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) lt!215108) (bvsle ((_ sign_extend 32) lt!215108) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215112)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10832 () Bool)

(assert (= bs!10832 d!44405))

(declare-fun m!212361 () Bool)

(assert (=> bs!10832 m!212361))

(assert (=> b!137982 d!44405))

(declare-fun d!44407 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4928 (_ BitVec 32)) tuple2!12066)

(assert (=> d!44407 (= (withMovedByteIndex!0 (_1!6358 lt!215122) #b00000000000000000000000000000001) (_2!6356 (moveByteIndex!0 (_1!6358 lt!215122) #b00000000000000000000000000000001)))))

(declare-fun bs!10833 () Bool)

(assert (= bs!10833 d!44407))

(declare-fun m!212363 () Bool)

(assert (=> bs!10833 m!212363))

(assert (=> b!137982 d!44407))

(declare-fun d!44409 () Bool)

(assert (=> d!44409 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) lt!215108) (bvsle ((_ sign_extend 32) lt!215108) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10834 () Bool)

(assert (= bs!10834 d!44409))

(declare-fun m!212365 () Bool)

(assert (=> bs!10834 m!212365))

(assert (=> b!137982 d!44409))

(declare-fun d!44411 () Bool)

(assert (=> d!44411 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) lt!215108)))

(declare-fun lt!215376 () Unit!8611)

(declare-fun choose!26 (BitStream!4928 array!6253 (_ BitVec 32) BitStream!4928) Unit!8611)

(assert (=> d!44411 (= lt!215376 (choose!26 (_2!6356 lt!215112) (buf!3239 (_2!6356 lt!215115)) lt!215108 (BitStream!4929 (buf!3239 (_2!6356 lt!215115)) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112)))))))

(assert (=> d!44411 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6356 lt!215112) (buf!3239 (_2!6356 lt!215115)) lt!215108) lt!215376)))

(declare-fun bs!10835 () Bool)

(assert (= bs!10835 d!44411))

(assert (=> bs!10835 m!212079))

(declare-fun m!212367 () Bool)

(assert (=> bs!10835 m!212367))

(assert (=> b!137982 d!44411))

(declare-datatypes ((tuple3!526 0))(
  ( (tuple3!527 (_1!6362 Unit!8611) (_2!6362 BitStream!4928) (_3!324 array!6253)) )
))
(declare-fun lt!215379 () tuple3!526)

(declare-fun d!44413 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4928 array!6253 (_ BitVec 32) (_ BitVec 32)) tuple3!526)

(assert (=> d!44413 (= lt!215379 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6358 lt!215122) #b00000000000000000000000000000001) lt!215111 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44413 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6358 lt!215122) #b00000000000000000000000000000001) lt!215111 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12069 (_2!6362 lt!215379) (_3!324 lt!215379)))))

(declare-fun bs!10836 () Bool)

(assert (= bs!10836 d!44413))

(assert (=> bs!10836 m!212083))

(declare-fun m!212369 () Bool)

(assert (=> bs!10836 m!212369))

(assert (=> b!137982 d!44413))

(declare-fun d!44415 () Bool)

(assert (=> d!44415 (isPrefixOf!0 thiss!1634 (_2!6356 lt!215115))))

(declare-fun lt!215382 () Unit!8611)

(declare-fun choose!30 (BitStream!4928 BitStream!4928 BitStream!4928) Unit!8611)

(assert (=> d!44415 (= lt!215382 (choose!30 thiss!1634 (_2!6356 lt!215112) (_2!6356 lt!215115)))))

(assert (=> d!44415 (isPrefixOf!0 thiss!1634 (_2!6356 lt!215112))))

(assert (=> d!44415 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6356 lt!215112) (_2!6356 lt!215115)) lt!215382)))

(declare-fun bs!10837 () Bool)

(assert (= bs!10837 d!44415))

(assert (=> bs!10837 m!212055))

(declare-fun m!212371 () Bool)

(assert (=> bs!10837 m!212371))

(assert (=> bs!10837 m!212139))

(assert (=> b!137982 d!44415))

(declare-fun d!44417 () Bool)

(declare-fun e!91829 () Bool)

(assert (=> d!44417 e!91829))

(declare-fun res!115084 () Bool)

(assert (=> d!44417 (=> (not res!115084) (not e!91829))))

(declare-fun lt!215397 () (_ BitVec 64))

(declare-fun lt!215400 () (_ BitVec 64))

(declare-fun lt!215395 () (_ BitVec 64))

(assert (=> d!44417 (= res!115084 (= lt!215397 (bvsub lt!215395 lt!215400)))))

(assert (=> d!44417 (or (= (bvand lt!215395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215400 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215395 lt!215400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44417 (= lt!215400 (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_1!6359 lt!215118)))) ((_ sign_extend 32) (currentByte!6046 (_1!6359 lt!215118))) ((_ sign_extend 32) (currentBit!6041 (_1!6359 lt!215118)))))))

(declare-fun lt!215396 () (_ BitVec 64))

(declare-fun lt!215398 () (_ BitVec 64))

(assert (=> d!44417 (= lt!215395 (bvmul lt!215396 lt!215398))))

(assert (=> d!44417 (or (= lt!215396 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215398 (bvsdiv (bvmul lt!215396 lt!215398) lt!215396)))))

(assert (=> d!44417 (= lt!215398 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44417 (= lt!215396 ((_ sign_extend 32) (size!2832 (buf!3239 (_1!6359 lt!215118)))))))

(assert (=> d!44417 (= lt!215397 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6046 (_1!6359 lt!215118))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6041 (_1!6359 lt!215118)))))))

(assert (=> d!44417 (invariant!0 (currentBit!6041 (_1!6359 lt!215118)) (currentByte!6046 (_1!6359 lt!215118)) (size!2832 (buf!3239 (_1!6359 lt!215118))))))

(assert (=> d!44417 (= (bitIndex!0 (size!2832 (buf!3239 (_1!6359 lt!215118))) (currentByte!6046 (_1!6359 lt!215118)) (currentBit!6041 (_1!6359 lt!215118))) lt!215397)))

(declare-fun b!138115 () Bool)

(declare-fun res!115083 () Bool)

(assert (=> b!138115 (=> (not res!115083) (not e!91829))))

(assert (=> b!138115 (= res!115083 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215397))))

(declare-fun b!138116 () Bool)

(declare-fun lt!215399 () (_ BitVec 64))

(assert (=> b!138116 (= e!91829 (bvsle lt!215397 (bvmul lt!215399 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138116 (or (= lt!215399 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215399 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215399)))))

(assert (=> b!138116 (= lt!215399 ((_ sign_extend 32) (size!2832 (buf!3239 (_1!6359 lt!215118)))))))

(assert (= (and d!44417 res!115084) b!138115))

(assert (= (and b!138115 res!115083) b!138116))

(declare-fun m!212373 () Bool)

(assert (=> d!44417 m!212373))

(declare-fun m!212375 () Bool)

(assert (=> d!44417 m!212375))

(assert (=> b!137982 d!44417))

(declare-fun d!44419 () Bool)

(declare-fun lt!215409 () tuple2!12068)

(declare-fun lt!215411 () tuple2!12068)

(assert (=> d!44419 (arrayRangesEq!235 (_2!6357 lt!215409) (_2!6357 lt!215411) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215410 () BitStream!4928)

(declare-fun lt!215412 () Unit!8611)

(declare-fun choose!35 (BitStream!4928 array!6253 (_ BitVec 32) (_ BitVec 32) tuple2!12068 array!6253 BitStream!4928 tuple2!12068 array!6253) Unit!8611)

(assert (=> d!44419 (= lt!215412 (choose!35 (_1!6358 lt!215122) arr!237 from!447 to!404 lt!215409 (_2!6357 lt!215409) lt!215410 lt!215411 (_2!6357 lt!215411)))))

(assert (=> d!44419 (= lt!215411 (readByteArrayLoopPure!0 lt!215410 (array!6254 (store (arr!3518 arr!237) from!447 (_2!6359 (readBytePure!0 (_1!6358 lt!215122)))) (size!2832 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!44419 (= lt!215410 (withMovedByteIndex!0 (_1!6358 lt!215122) #b00000000000000000000000000000001))))

(assert (=> d!44419 (= lt!215409 (readByteArrayLoopPure!0 (_1!6358 lt!215122) arr!237 from!447 to!404))))

(assert (=> d!44419 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6358 lt!215122) arr!237 from!447 to!404) lt!215412)))

(declare-fun bs!10839 () Bool)

(assert (= bs!10839 d!44419))

(assert (=> bs!10839 m!212083))

(declare-fun m!212377 () Bool)

(assert (=> bs!10839 m!212377))

(assert (=> bs!10839 m!212065))

(declare-fun m!212379 () Bool)

(assert (=> bs!10839 m!212379))

(assert (=> bs!10839 m!212077))

(declare-fun m!212381 () Bool)

(assert (=> bs!10839 m!212381))

(declare-fun m!212383 () Bool)

(assert (=> bs!10839 m!212383))

(assert (=> b!137982 d!44419))

(declare-fun d!44421 () Bool)

(declare-datatypes ((tuple2!12076 0))(
  ( (tuple2!12077 (_1!6363 (_ BitVec 8)) (_2!6363 BitStream!4928)) )
))
(declare-fun lt!215415 () tuple2!12076)

(declare-fun readByte!0 (BitStream!4928) tuple2!12076)

(assert (=> d!44421 (= lt!215415 (readByte!0 (_1!6358 lt!215122)))))

(assert (=> d!44421 (= (readBytePure!0 (_1!6358 lt!215122)) (tuple2!12073 (_2!6363 lt!215415) (_1!6363 lt!215415)))))

(declare-fun bs!10840 () Bool)

(assert (= bs!10840 d!44421))

(declare-fun m!212385 () Bool)

(assert (=> bs!10840 m!212385))

(assert (=> b!137982 d!44421))

(declare-fun d!44423 () Bool)

(declare-fun e!91832 () Bool)

(assert (=> d!44423 e!91832))

(declare-fun res!115091 () Bool)

(assert (=> d!44423 (=> (not res!115091) (not e!91832))))

(declare-fun lt!215430 () tuple2!12066)

(assert (=> d!44423 (= res!115091 (= (size!2832 (buf!3239 thiss!1634)) (size!2832 (buf!3239 (_2!6356 lt!215430)))))))

(declare-fun choose!6 (BitStream!4928 (_ BitVec 8)) tuple2!12066)

(assert (=> d!44423 (= lt!215430 (choose!6 thiss!1634 (select (arr!3518 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!44423 (validate_offset_byte!0 ((_ sign_extend 32) (size!2832 (buf!3239 thiss!1634))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634)))))

(assert (=> d!44423 (= (appendByte!0 thiss!1634 (select (arr!3518 arr!237) from!447)) lt!215430)))

(declare-fun b!138123 () Bool)

(declare-fun res!115093 () Bool)

(assert (=> b!138123 (=> (not res!115093) (not e!91832))))

(declare-fun lt!215426 () (_ BitVec 64))

(declare-fun lt!215427 () (_ BitVec 64))

(assert (=> b!138123 (= res!115093 (= (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215430))) (currentByte!6046 (_2!6356 lt!215430)) (currentBit!6041 (_2!6356 lt!215430))) (bvadd lt!215426 lt!215427)))))

(assert (=> b!138123 (or (not (= (bvand lt!215426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215427 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!215426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!215426 lt!215427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138123 (= lt!215427 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!138123 (= lt!215426 (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)))))

(declare-fun b!138124 () Bool)

(declare-fun res!115092 () Bool)

(assert (=> b!138124 (=> (not res!115092) (not e!91832))))

(assert (=> b!138124 (= res!115092 (isPrefixOf!0 thiss!1634 (_2!6356 lt!215430)))))

(declare-fun b!138125 () Bool)

(declare-fun lt!215429 () tuple2!12070)

(declare-fun lt!215428 () tuple2!12072)

(assert (=> b!138125 (= e!91832 (and (= (_2!6359 lt!215428) (select (arr!3518 arr!237) from!447)) (= (_1!6359 lt!215428) (_2!6358 lt!215429))))))

(assert (=> b!138125 (= lt!215428 (readBytePure!0 (_1!6358 lt!215429)))))

(assert (=> b!138125 (= lt!215429 (reader!0 thiss!1634 (_2!6356 lt!215430)))))

(assert (= (and d!44423 res!115091) b!138123))

(assert (= (and b!138123 res!115093) b!138124))

(assert (= (and b!138124 res!115092) b!138125))

(assert (=> d!44423 m!212049))

(declare-fun m!212387 () Bool)

(assert (=> d!44423 m!212387))

(declare-fun m!212389 () Bool)

(assert (=> d!44423 m!212389))

(declare-fun m!212391 () Bool)

(assert (=> b!138123 m!212391))

(assert (=> b!138123 m!212137))

(declare-fun m!212393 () Bool)

(assert (=> b!138124 m!212393))

(declare-fun m!212395 () Bool)

(assert (=> b!138125 m!212395))

(declare-fun m!212397 () Bool)

(assert (=> b!138125 m!212397))

(assert (=> b!137982 d!44423))

(declare-fun b!138136 () Bool)

(declare-fun res!115101 () Bool)

(declare-fun e!91837 () Bool)

(assert (=> b!138136 (=> (not res!115101) (not e!91837))))

(declare-fun lt!215488 () tuple2!12070)

(assert (=> b!138136 (= res!115101 (isPrefixOf!0 (_1!6358 lt!215488) thiss!1634))))

(declare-fun b!138137 () Bool)

(declare-fun e!91838 () Unit!8611)

(declare-fun lt!215472 () Unit!8611)

(assert (=> b!138137 (= e!91838 lt!215472)))

(declare-fun lt!215478 () (_ BitVec 64))

(assert (=> b!138137 (= lt!215478 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215490 () (_ BitVec 64))

(assert (=> b!138137 (= lt!215490 (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6253 array!6253 (_ BitVec 64) (_ BitVec 64)) Unit!8611)

(assert (=> b!138137 (= lt!215472 (arrayBitRangesEqSymmetric!0 (buf!3239 thiss!1634) (buf!3239 (_2!6356 lt!215115)) lt!215478 lt!215490))))

(assert (=> b!138137 (arrayBitRangesEq!0 (buf!3239 (_2!6356 lt!215115)) (buf!3239 thiss!1634) lt!215478 lt!215490)))

(declare-fun b!138138 () Bool)

(declare-fun Unit!8616 () Unit!8611)

(assert (=> b!138138 (= e!91838 Unit!8616)))

(declare-fun b!138139 () Bool)

(declare-fun res!115102 () Bool)

(assert (=> b!138139 (=> (not res!115102) (not e!91837))))

(assert (=> b!138139 (= res!115102 (isPrefixOf!0 (_2!6358 lt!215488) (_2!6356 lt!215115)))))

(declare-fun d!44425 () Bool)

(assert (=> d!44425 e!91837))

(declare-fun res!115100 () Bool)

(assert (=> d!44425 (=> (not res!115100) (not e!91837))))

(assert (=> d!44425 (= res!115100 (isPrefixOf!0 (_1!6358 lt!215488) (_2!6358 lt!215488)))))

(declare-fun lt!215474 () BitStream!4928)

(assert (=> d!44425 (= lt!215488 (tuple2!12071 lt!215474 (_2!6356 lt!215115)))))

(declare-fun lt!215485 () Unit!8611)

(declare-fun lt!215479 () Unit!8611)

(assert (=> d!44425 (= lt!215485 lt!215479)))

(assert (=> d!44425 (isPrefixOf!0 lt!215474 (_2!6356 lt!215115))))

(assert (=> d!44425 (= lt!215479 (lemmaIsPrefixTransitive!0 lt!215474 (_2!6356 lt!215115) (_2!6356 lt!215115)))))

(declare-fun lt!215483 () Unit!8611)

(declare-fun lt!215480 () Unit!8611)

(assert (=> d!44425 (= lt!215483 lt!215480)))

(assert (=> d!44425 (isPrefixOf!0 lt!215474 (_2!6356 lt!215115))))

(assert (=> d!44425 (= lt!215480 (lemmaIsPrefixTransitive!0 lt!215474 thiss!1634 (_2!6356 lt!215115)))))

(declare-fun lt!215476 () Unit!8611)

(assert (=> d!44425 (= lt!215476 e!91838)))

(declare-fun c!7743 () Bool)

(assert (=> d!44425 (= c!7743 (not (= (size!2832 (buf!3239 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!215477 () Unit!8611)

(declare-fun lt!215489 () Unit!8611)

(assert (=> d!44425 (= lt!215477 lt!215489)))

(assert (=> d!44425 (isPrefixOf!0 (_2!6356 lt!215115) (_2!6356 lt!215115))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4928) Unit!8611)

(assert (=> d!44425 (= lt!215489 (lemmaIsPrefixRefl!0 (_2!6356 lt!215115)))))

(declare-fun lt!215471 () Unit!8611)

(declare-fun lt!215482 () Unit!8611)

(assert (=> d!44425 (= lt!215471 lt!215482)))

(assert (=> d!44425 (= lt!215482 (lemmaIsPrefixRefl!0 (_2!6356 lt!215115)))))

(declare-fun lt!215475 () Unit!8611)

(declare-fun lt!215481 () Unit!8611)

(assert (=> d!44425 (= lt!215475 lt!215481)))

(assert (=> d!44425 (isPrefixOf!0 lt!215474 lt!215474)))

(assert (=> d!44425 (= lt!215481 (lemmaIsPrefixRefl!0 lt!215474))))

(declare-fun lt!215487 () Unit!8611)

(declare-fun lt!215473 () Unit!8611)

(assert (=> d!44425 (= lt!215487 lt!215473)))

(assert (=> d!44425 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44425 (= lt!215473 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44425 (= lt!215474 (BitStream!4929 (buf!3239 (_2!6356 lt!215115)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)))))

(assert (=> d!44425 (isPrefixOf!0 thiss!1634 (_2!6356 lt!215115))))

(assert (=> d!44425 (= (reader!0 thiss!1634 (_2!6356 lt!215115)) lt!215488)))

(declare-fun b!138140 () Bool)

(declare-fun lt!215486 () (_ BitVec 64))

(declare-fun lt!215484 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4928 (_ BitVec 64)) BitStream!4928)

(assert (=> b!138140 (= e!91837 (= (_1!6358 lt!215488) (withMovedBitIndex!0 (_2!6358 lt!215488) (bvsub lt!215486 lt!215484))))))

(assert (=> b!138140 (or (= (bvand lt!215486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215484 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215486 lt!215484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138140 (= lt!215484 (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215115))) (currentByte!6046 (_2!6356 lt!215115)) (currentBit!6041 (_2!6356 lt!215115))))))

(assert (=> b!138140 (= lt!215486 (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)))))

(assert (= (and d!44425 c!7743) b!138137))

(assert (= (and d!44425 (not c!7743)) b!138138))

(assert (= (and d!44425 res!115100) b!138136))

(assert (= (and b!138136 res!115101) b!138139))

(assert (= (and b!138139 res!115102) b!138140))

(declare-fun m!212399 () Bool)

(assert (=> b!138139 m!212399))

(declare-fun m!212401 () Bool)

(assert (=> b!138140 m!212401))

(assert (=> b!138140 m!212107))

(assert (=> b!138140 m!212137))

(assert (=> b!138137 m!212137))

(declare-fun m!212403 () Bool)

(assert (=> b!138137 m!212403))

(declare-fun m!212405 () Bool)

(assert (=> b!138137 m!212405))

(declare-fun m!212407 () Bool)

(assert (=> b!138136 m!212407))

(declare-fun m!212409 () Bool)

(assert (=> d!44425 m!212409))

(declare-fun m!212411 () Bool)

(assert (=> d!44425 m!212411))

(declare-fun m!212413 () Bool)

(assert (=> d!44425 m!212413))

(declare-fun m!212415 () Bool)

(assert (=> d!44425 m!212415))

(assert (=> d!44425 m!212055))

(declare-fun m!212417 () Bool)

(assert (=> d!44425 m!212417))

(declare-fun m!212419 () Bool)

(assert (=> d!44425 m!212419))

(declare-fun m!212421 () Bool)

(assert (=> d!44425 m!212421))

(declare-fun m!212423 () Bool)

(assert (=> d!44425 m!212423))

(declare-fun m!212425 () Bool)

(assert (=> d!44425 m!212425))

(declare-fun m!212427 () Bool)

(assert (=> d!44425 m!212427))

(assert (=> b!137982 d!44425))

(declare-fun d!44427 () Bool)

(declare-fun e!91841 () Bool)

(assert (=> d!44427 e!91841))

(declare-fun res!115105 () Bool)

(assert (=> d!44427 (=> (not res!115105) (not e!91841))))

(assert (=> d!44427 (= res!115105 (and (or (let ((rhs!3157 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3157 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3157) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!44428 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!44428 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!44428 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3156 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3156 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3156) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!215498 () Unit!8611)

(declare-fun choose!57 (BitStream!4928 BitStream!4928 (_ BitVec 64) (_ BitVec 32)) Unit!8611)

(assert (=> d!44427 (= lt!215498 (choose!57 thiss!1634 (_2!6356 lt!215112) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!44427 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6356 lt!215112) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!215498)))

(declare-fun b!138143 () Bool)

(declare-fun lt!215497 () (_ BitVec 32))

(assert (=> b!138143 (= e!91841 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215112)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) (bvsub (bvsub to!404 from!447) lt!215497)))))

(assert (=> b!138143 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!215497 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!215497) #b10000000000000000000000000000000)))))

(declare-fun lt!215499 () (_ BitVec 64))

(assert (=> b!138143 (= lt!215497 ((_ extract 31 0) lt!215499))))

(assert (=> b!138143 (and (bvslt lt!215499 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!215499 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!138143 (= lt!215499 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!44427 res!115105) b!138143))

(declare-fun m!212429 () Bool)

(assert (=> d!44427 m!212429))

(declare-fun m!212431 () Bool)

(assert (=> b!138143 m!212431))

(assert (=> b!137982 d!44427))

(declare-fun b!138144 () Bool)

(declare-fun res!115107 () Bool)

(declare-fun e!91842 () Bool)

(assert (=> b!138144 (=> (not res!115107) (not e!91842))))

(declare-fun lt!215517 () tuple2!12070)

(assert (=> b!138144 (= res!115107 (isPrefixOf!0 (_1!6358 lt!215517) (_2!6356 lt!215112)))))

(declare-fun b!138145 () Bool)

(declare-fun e!91843 () Unit!8611)

(declare-fun lt!215501 () Unit!8611)

(assert (=> b!138145 (= e!91843 lt!215501)))

(declare-fun lt!215507 () (_ BitVec 64))

(assert (=> b!138145 (= lt!215507 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215519 () (_ BitVec 64))

(assert (=> b!138145 (= lt!215519 (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215112))) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112))))))

(assert (=> b!138145 (= lt!215501 (arrayBitRangesEqSymmetric!0 (buf!3239 (_2!6356 lt!215112)) (buf!3239 (_2!6356 lt!215115)) lt!215507 lt!215519))))

(assert (=> b!138145 (arrayBitRangesEq!0 (buf!3239 (_2!6356 lt!215115)) (buf!3239 (_2!6356 lt!215112)) lt!215507 lt!215519)))

(declare-fun b!138146 () Bool)

(declare-fun Unit!8617 () Unit!8611)

(assert (=> b!138146 (= e!91843 Unit!8617)))

(declare-fun b!138147 () Bool)

(declare-fun res!115108 () Bool)

(assert (=> b!138147 (=> (not res!115108) (not e!91842))))

(assert (=> b!138147 (= res!115108 (isPrefixOf!0 (_2!6358 lt!215517) (_2!6356 lt!215115)))))

(declare-fun d!44430 () Bool)

(assert (=> d!44430 e!91842))

(declare-fun res!115106 () Bool)

(assert (=> d!44430 (=> (not res!115106) (not e!91842))))

(assert (=> d!44430 (= res!115106 (isPrefixOf!0 (_1!6358 lt!215517) (_2!6358 lt!215517)))))

(declare-fun lt!215503 () BitStream!4928)

(assert (=> d!44430 (= lt!215517 (tuple2!12071 lt!215503 (_2!6356 lt!215115)))))

(declare-fun lt!215514 () Unit!8611)

(declare-fun lt!215508 () Unit!8611)

(assert (=> d!44430 (= lt!215514 lt!215508)))

(assert (=> d!44430 (isPrefixOf!0 lt!215503 (_2!6356 lt!215115))))

(assert (=> d!44430 (= lt!215508 (lemmaIsPrefixTransitive!0 lt!215503 (_2!6356 lt!215115) (_2!6356 lt!215115)))))

(declare-fun lt!215512 () Unit!8611)

(declare-fun lt!215509 () Unit!8611)

(assert (=> d!44430 (= lt!215512 lt!215509)))

(assert (=> d!44430 (isPrefixOf!0 lt!215503 (_2!6356 lt!215115))))

(assert (=> d!44430 (= lt!215509 (lemmaIsPrefixTransitive!0 lt!215503 (_2!6356 lt!215112) (_2!6356 lt!215115)))))

(declare-fun lt!215505 () Unit!8611)

(assert (=> d!44430 (= lt!215505 e!91843)))

(declare-fun c!7744 () Bool)

(assert (=> d!44430 (= c!7744 (not (= (size!2832 (buf!3239 (_2!6356 lt!215112))) #b00000000000000000000000000000000)))))

(declare-fun lt!215506 () Unit!8611)

(declare-fun lt!215518 () Unit!8611)

(assert (=> d!44430 (= lt!215506 lt!215518)))

(assert (=> d!44430 (isPrefixOf!0 (_2!6356 lt!215115) (_2!6356 lt!215115))))

(assert (=> d!44430 (= lt!215518 (lemmaIsPrefixRefl!0 (_2!6356 lt!215115)))))

(declare-fun lt!215500 () Unit!8611)

(declare-fun lt!215511 () Unit!8611)

(assert (=> d!44430 (= lt!215500 lt!215511)))

(assert (=> d!44430 (= lt!215511 (lemmaIsPrefixRefl!0 (_2!6356 lt!215115)))))

(declare-fun lt!215504 () Unit!8611)

(declare-fun lt!215510 () Unit!8611)

(assert (=> d!44430 (= lt!215504 lt!215510)))

(assert (=> d!44430 (isPrefixOf!0 lt!215503 lt!215503)))

(assert (=> d!44430 (= lt!215510 (lemmaIsPrefixRefl!0 lt!215503))))

(declare-fun lt!215516 () Unit!8611)

(declare-fun lt!215502 () Unit!8611)

(assert (=> d!44430 (= lt!215516 lt!215502)))

(assert (=> d!44430 (isPrefixOf!0 (_2!6356 lt!215112) (_2!6356 lt!215112))))

(assert (=> d!44430 (= lt!215502 (lemmaIsPrefixRefl!0 (_2!6356 lt!215112)))))

(assert (=> d!44430 (= lt!215503 (BitStream!4929 (buf!3239 (_2!6356 lt!215115)) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112))))))

(assert (=> d!44430 (isPrefixOf!0 (_2!6356 lt!215112) (_2!6356 lt!215115))))

(assert (=> d!44430 (= (reader!0 (_2!6356 lt!215112) (_2!6356 lt!215115)) lt!215517)))

(declare-fun lt!215515 () (_ BitVec 64))

(declare-fun lt!215513 () (_ BitVec 64))

(declare-fun b!138148 () Bool)

(assert (=> b!138148 (= e!91842 (= (_1!6358 lt!215517) (withMovedBitIndex!0 (_2!6358 lt!215517) (bvsub lt!215515 lt!215513))))))

(assert (=> b!138148 (or (= (bvand lt!215515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215513 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215515 lt!215513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138148 (= lt!215513 (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215115))) (currentByte!6046 (_2!6356 lt!215115)) (currentBit!6041 (_2!6356 lt!215115))))))

(assert (=> b!138148 (= lt!215515 (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215112))) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112))))))

(assert (= (and d!44430 c!7744) b!138145))

(assert (= (and d!44430 (not c!7744)) b!138146))

(assert (= (and d!44430 res!115106) b!138144))

(assert (= (and b!138144 res!115107) b!138147))

(assert (= (and b!138147 res!115108) b!138148))

(declare-fun m!212433 () Bool)

(assert (=> b!138147 m!212433))

(declare-fun m!212435 () Bool)

(assert (=> b!138148 m!212435))

(assert (=> b!138148 m!212107))

(assert (=> b!138148 m!212109))

(assert (=> b!138145 m!212109))

(declare-fun m!212437 () Bool)

(assert (=> b!138145 m!212437))

(declare-fun m!212439 () Bool)

(assert (=> b!138145 m!212439))

(declare-fun m!212441 () Bool)

(assert (=> b!138144 m!212441))

(declare-fun m!212443 () Bool)

(assert (=> d!44430 m!212443))

(declare-fun m!212445 () Bool)

(assert (=> d!44430 m!212445))

(assert (=> d!44430 m!212413))

(declare-fun m!212447 () Bool)

(assert (=> d!44430 m!212447))

(assert (=> d!44430 m!212127))

(declare-fun m!212449 () Bool)

(assert (=> d!44430 m!212449))

(assert (=> d!44430 m!212419))

(declare-fun m!212451 () Bool)

(assert (=> d!44430 m!212451))

(declare-fun m!212453 () Bool)

(assert (=> d!44430 m!212453))

(declare-fun m!212455 () Bool)

(assert (=> d!44430 m!212455))

(declare-fun m!212457 () Bool)

(assert (=> d!44430 m!212457))

(assert (=> b!137982 d!44430))

(declare-fun d!44432 () Bool)

(declare-fun e!91844 () Bool)

(assert (=> d!44432 e!91844))

(declare-fun res!115110 () Bool)

(assert (=> d!44432 (=> (not res!115110) (not e!91844))))

(declare-fun lt!215520 () (_ BitVec 64))

(declare-fun lt!215525 () (_ BitVec 64))

(declare-fun lt!215522 () (_ BitVec 64))

(assert (=> d!44432 (= res!115110 (= lt!215522 (bvsub lt!215520 lt!215525)))))

(assert (=> d!44432 (or (= (bvand lt!215520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215525 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215520 lt!215525) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44432 (= lt!215525 (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_1!6359 lt!215104)))) ((_ sign_extend 32) (currentByte!6046 (_1!6359 lt!215104))) ((_ sign_extend 32) (currentBit!6041 (_1!6359 lt!215104)))))))

(declare-fun lt!215521 () (_ BitVec 64))

(declare-fun lt!215523 () (_ BitVec 64))

(assert (=> d!44432 (= lt!215520 (bvmul lt!215521 lt!215523))))

(assert (=> d!44432 (or (= lt!215521 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215523 (bvsdiv (bvmul lt!215521 lt!215523) lt!215521)))))

(assert (=> d!44432 (= lt!215523 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44432 (= lt!215521 ((_ sign_extend 32) (size!2832 (buf!3239 (_1!6359 lt!215104)))))))

(assert (=> d!44432 (= lt!215522 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6046 (_1!6359 lt!215104))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6041 (_1!6359 lt!215104)))))))

(assert (=> d!44432 (invariant!0 (currentBit!6041 (_1!6359 lt!215104)) (currentByte!6046 (_1!6359 lt!215104)) (size!2832 (buf!3239 (_1!6359 lt!215104))))))

(assert (=> d!44432 (= (bitIndex!0 (size!2832 (buf!3239 (_1!6359 lt!215104))) (currentByte!6046 (_1!6359 lt!215104)) (currentBit!6041 (_1!6359 lt!215104))) lt!215522)))

(declare-fun b!138149 () Bool)

(declare-fun res!115109 () Bool)

(assert (=> b!138149 (=> (not res!115109) (not e!91844))))

(assert (=> b!138149 (= res!115109 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215522))))

(declare-fun b!138150 () Bool)

(declare-fun lt!215524 () (_ BitVec 64))

(assert (=> b!138150 (= e!91844 (bvsle lt!215522 (bvmul lt!215524 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138150 (or (= lt!215524 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215524 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215524)))))

(assert (=> b!138150 (= lt!215524 ((_ sign_extend 32) (size!2832 (buf!3239 (_1!6359 lt!215104)))))))

(assert (= (and d!44432 res!115110) b!138149))

(assert (= (and b!138149 res!115109) b!138150))

(declare-fun m!212459 () Bool)

(assert (=> d!44432 m!212459))

(declare-fun m!212461 () Bool)

(assert (=> d!44432 m!212461))

(assert (=> b!137982 d!44432))

(declare-fun d!44434 () Bool)

(declare-fun res!115111 () Bool)

(declare-fun e!91845 () Bool)

(assert (=> d!44434 (=> res!115111 e!91845)))

(assert (=> d!44434 (= res!115111 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44434 (= (arrayRangesEq!235 (_2!6357 lt!215124) (_2!6357 lt!215125) #b00000000000000000000000000000000 to!404) e!91845)))

(declare-fun b!138151 () Bool)

(declare-fun e!91846 () Bool)

(assert (=> b!138151 (= e!91845 e!91846)))

(declare-fun res!115112 () Bool)

(assert (=> b!138151 (=> (not res!115112) (not e!91846))))

(assert (=> b!138151 (= res!115112 (= (select (arr!3518 (_2!6357 lt!215124)) #b00000000000000000000000000000000) (select (arr!3518 (_2!6357 lt!215125)) #b00000000000000000000000000000000)))))

(declare-fun b!138152 () Bool)

(assert (=> b!138152 (= e!91846 (arrayRangesEq!235 (_2!6357 lt!215124) (_2!6357 lt!215125) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44434 (not res!115111)) b!138151))

(assert (= (and b!138151 res!115112) b!138152))

(declare-fun m!212463 () Bool)

(assert (=> b!138151 m!212463))

(declare-fun m!212465 () Bool)

(assert (=> b!138151 m!212465))

(declare-fun m!212467 () Bool)

(assert (=> b!138152 m!212467))

(assert (=> b!137982 d!44434))

(declare-fun d!44436 () Bool)

(declare-fun lt!215526 () tuple2!12076)

(assert (=> d!44436 (= lt!215526 (readByte!0 (BitStream!4929 (buf!3239 (_2!6356 lt!215115)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634))))))

(assert (=> d!44436 (= (readBytePure!0 (BitStream!4929 (buf!3239 (_2!6356 lt!215115)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634))) (tuple2!12073 (_2!6363 lt!215526) (_1!6363 lt!215526)))))

(declare-fun bs!10841 () Bool)

(assert (= bs!10841 d!44436))

(declare-fun m!212469 () Bool)

(assert (=> bs!10841 m!212469))

(assert (=> b!137982 d!44436))

(declare-fun b!138163 () Bool)

(declare-fun res!115124 () Bool)

(declare-fun e!91854 () Bool)

(assert (=> b!138163 (=> (not res!115124) (not e!91854))))

(declare-fun lt!215546 () (_ BitVec 64))

(declare-fun lt!215545 () (_ BitVec 64))

(declare-fun lt!215553 () tuple2!12066)

(assert (=> b!138163 (= res!115124 (= (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215553))) (currentByte!6046 (_2!6356 lt!215553)) (currentBit!6041 (_2!6356 lt!215553))) (bvadd lt!215545 lt!215546)))))

(assert (=> b!138163 (or (not (= (bvand lt!215545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215546 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!215545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!215545 lt!215546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!215548 () (_ BitVec 64))

(assert (=> b!138163 (= lt!215546 (bvmul lt!215548 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!138163 (or (= lt!215548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215548)))))

(assert (=> b!138163 (= lt!215548 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!138163 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!138163 (= lt!215545 (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215112))) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112))))))

(declare-fun b!138164 () Bool)

(declare-fun lt!215549 () tuple2!12068)

(declare-fun e!91853 () Bool)

(assert (=> b!138164 (= e!91853 (arrayRangesEq!235 arr!237 (_2!6357 lt!215549) #b00000000000000000000000000000000 to!404))))

(declare-fun b!138165 () Bool)

(assert (=> b!138165 (= e!91854 e!91853)))

(declare-fun res!115123 () Bool)

(assert (=> b!138165 (=> (not res!115123) (not e!91853))))

(declare-fun lt!215547 () tuple2!12070)

(assert (=> b!138165 (= res!115123 (and (= (size!2832 (_2!6357 lt!215549)) (size!2832 arr!237)) (= (_1!6357 lt!215549) (_2!6358 lt!215547))))))

(assert (=> b!138165 (= lt!215549 (readByteArrayLoopPure!0 (_1!6358 lt!215547) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!215550 () Unit!8611)

(declare-fun lt!215552 () Unit!8611)

(assert (=> b!138165 (= lt!215550 lt!215552)))

(declare-fun lt!215551 () (_ BitVec 64))

(assert (=> b!138165 (validate_offset_bits!1 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215553)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) lt!215551)))

(assert (=> b!138165 (= lt!215552 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6356 lt!215112) (buf!3239 (_2!6356 lt!215553)) lt!215551))))

(declare-fun e!91855 () Bool)

(assert (=> b!138165 e!91855))

(declare-fun res!115125 () Bool)

(assert (=> b!138165 (=> (not res!115125) (not e!91855))))

(assert (=> b!138165 (= res!115125 (and (= (size!2832 (buf!3239 (_2!6356 lt!215112))) (size!2832 (buf!3239 (_2!6356 lt!215553)))) (bvsge lt!215551 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138165 (= lt!215551 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!138165 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!138165 (= lt!215547 (reader!0 (_2!6356 lt!215112) (_2!6356 lt!215553)))))

(declare-fun b!138166 () Bool)

(declare-fun res!115127 () Bool)

(assert (=> b!138166 (=> (not res!115127) (not e!91854))))

(assert (=> b!138166 (= res!115127 (isPrefixOf!0 (_2!6356 lt!215112) (_2!6356 lt!215553)))))

(declare-fun b!138167 () Bool)

(assert (=> b!138167 (= e!91855 (validate_offset_bits!1 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215112)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) lt!215551))))

(declare-fun d!44438 () Bool)

(assert (=> d!44438 e!91854))

(declare-fun res!115126 () Bool)

(assert (=> d!44438 (=> (not res!115126) (not e!91854))))

(assert (=> d!44438 (= res!115126 (= (size!2832 (buf!3239 (_2!6356 lt!215112))) (size!2832 (buf!3239 (_2!6356 lt!215553)))))))

(declare-fun choose!64 (BitStream!4928 array!6253 (_ BitVec 32) (_ BitVec 32)) tuple2!12066)

(assert (=> d!44438 (= lt!215553 (choose!64 (_2!6356 lt!215112) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44438 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2832 arr!237)))))

(assert (=> d!44438 (= (appendByteArrayLoop!0 (_2!6356 lt!215112) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!215553)))

(assert (= (and d!44438 res!115126) b!138163))

(assert (= (and b!138163 res!115124) b!138166))

(assert (= (and b!138166 res!115127) b!138165))

(assert (= (and b!138165 res!115125) b!138167))

(assert (= (and b!138165 res!115123) b!138164))

(declare-fun m!212471 () Bool)

(assert (=> b!138167 m!212471))

(declare-fun m!212473 () Bool)

(assert (=> b!138166 m!212473))

(declare-fun m!212475 () Bool)

(assert (=> b!138163 m!212475))

(assert (=> b!138163 m!212109))

(declare-fun m!212477 () Bool)

(assert (=> d!44438 m!212477))

(declare-fun m!212479 () Bool)

(assert (=> b!138165 m!212479))

(declare-fun m!212481 () Bool)

(assert (=> b!138165 m!212481))

(declare-fun m!212483 () Bool)

(assert (=> b!138165 m!212483))

(declare-fun m!212485 () Bool)

(assert (=> b!138165 m!212485))

(declare-fun m!212487 () Bool)

(assert (=> b!138164 m!212487))

(assert (=> b!137982 d!44438))

(declare-fun d!44440 () Bool)

(assert (=> d!44440 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10842 () Bool)

(assert (= bs!10842 d!44440))

(declare-fun m!212489 () Bool)

(assert (=> bs!10842 m!212489))

(assert (=> b!137982 d!44440))

(declare-fun d!44442 () Bool)

(assert (=> d!44442 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!215554 () Unit!8611)

(assert (=> d!44442 (= lt!215554 (choose!26 thiss!1634 (buf!3239 (_2!6356 lt!215115)) (bvsub to!404 from!447) (BitStream!4929 (buf!3239 (_2!6356 lt!215115)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634))))))

(assert (=> d!44442 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3239 (_2!6356 lt!215115)) (bvsub to!404 from!447)) lt!215554)))

(declare-fun bs!10843 () Bool)

(assert (= bs!10843 d!44442))

(assert (=> bs!10843 m!212057))

(declare-fun m!212491 () Bool)

(assert (=> bs!10843 m!212491))

(assert (=> b!137982 d!44442))

(declare-fun d!44444 () Bool)

(declare-fun e!91858 () Bool)

(assert (=> d!44444 e!91858))

(declare-fun res!115130 () Bool)

(assert (=> d!44444 (=> (not res!115130) (not e!91858))))

(declare-fun lt!215564 () tuple2!12072)

(declare-fun lt!215566 () tuple2!12072)

(assert (=> d!44444 (= res!115130 (= (bitIndex!0 (size!2832 (buf!3239 (_1!6359 lt!215564))) (currentByte!6046 (_1!6359 lt!215564)) (currentBit!6041 (_1!6359 lt!215564))) (bitIndex!0 (size!2832 (buf!3239 (_1!6359 lt!215566))) (currentByte!6046 (_1!6359 lt!215566)) (currentBit!6041 (_1!6359 lt!215566)))))))

(declare-fun lt!215565 () Unit!8611)

(declare-fun lt!215563 () BitStream!4928)

(declare-fun choose!14 (BitStream!4928 BitStream!4928 BitStream!4928 tuple2!12072 tuple2!12072 BitStream!4928 (_ BitVec 8) tuple2!12072 tuple2!12072 BitStream!4928 (_ BitVec 8)) Unit!8611)

(assert (=> d!44444 (= lt!215565 (choose!14 lt!215127 (_2!6356 lt!215115) lt!215563 lt!215564 (tuple2!12073 (_1!6359 lt!215564) (_2!6359 lt!215564)) (_1!6359 lt!215564) (_2!6359 lt!215564) lt!215566 (tuple2!12073 (_1!6359 lt!215566) (_2!6359 lt!215566)) (_1!6359 lt!215566) (_2!6359 lt!215566)))))

(assert (=> d!44444 (= lt!215566 (readBytePure!0 lt!215563))))

(assert (=> d!44444 (= lt!215564 (readBytePure!0 lt!215127))))

(assert (=> d!44444 (= lt!215563 (BitStream!4929 (buf!3239 (_2!6356 lt!215115)) (currentByte!6046 lt!215127) (currentBit!6041 lt!215127)))))

(assert (=> d!44444 (= (readBytePrefixLemma!0 lt!215127 (_2!6356 lt!215115)) lt!215565)))

(declare-fun b!138170 () Bool)

(assert (=> b!138170 (= e!91858 (= (_2!6359 lt!215564) (_2!6359 lt!215566)))))

(assert (= (and d!44444 res!115130) b!138170))

(declare-fun m!212493 () Bool)

(assert (=> d!44444 m!212493))

(declare-fun m!212495 () Bool)

(assert (=> d!44444 m!212495))

(declare-fun m!212497 () Bool)

(assert (=> d!44444 m!212497))

(assert (=> d!44444 m!212061))

(declare-fun m!212499 () Bool)

(assert (=> d!44444 m!212499))

(assert (=> b!137982 d!44444))

(declare-fun d!44446 () Bool)

(declare-fun lt!215567 () tuple2!12076)

(assert (=> d!44446 (= lt!215567 (readByte!0 lt!215127))))

(assert (=> d!44446 (= (readBytePure!0 lt!215127) (tuple2!12073 (_2!6363 lt!215567) (_1!6363 lt!215567)))))

(declare-fun bs!10844 () Bool)

(assert (= bs!10844 d!44446))

(declare-fun m!212501 () Bool)

(assert (=> bs!10844 m!212501))

(assert (=> b!137982 d!44446))

(declare-fun d!44448 () Bool)

(declare-fun res!115133 () Bool)

(declare-fun e!91860 () Bool)

(assert (=> d!44448 (=> (not res!115133) (not e!91860))))

(assert (=> d!44448 (= res!115133 (= (size!2832 (buf!3239 thiss!1634)) (size!2832 (buf!3239 (_2!6356 lt!215115)))))))

(assert (=> d!44448 (= (isPrefixOf!0 thiss!1634 (_2!6356 lt!215115)) e!91860)))

(declare-fun b!138171 () Bool)

(declare-fun res!115132 () Bool)

(assert (=> b!138171 (=> (not res!115132) (not e!91860))))

(assert (=> b!138171 (= res!115132 (bvsle (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)) (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215115))) (currentByte!6046 (_2!6356 lt!215115)) (currentBit!6041 (_2!6356 lt!215115)))))))

(declare-fun b!138172 () Bool)

(declare-fun e!91859 () Bool)

(assert (=> b!138172 (= e!91860 e!91859)))

(declare-fun res!115131 () Bool)

(assert (=> b!138172 (=> res!115131 e!91859)))

(assert (=> b!138172 (= res!115131 (= (size!2832 (buf!3239 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138173 () Bool)

(assert (=> b!138173 (= e!91859 (arrayBitRangesEq!0 (buf!3239 thiss!1634) (buf!3239 (_2!6356 lt!215115)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634))))))

(assert (= (and d!44448 res!115133) b!138171))

(assert (= (and b!138171 res!115132) b!138172))

(assert (= (and b!138172 (not res!115131)) b!138173))

(assert (=> b!138171 m!212137))

(assert (=> b!138171 m!212107))

(assert (=> b!138173 m!212137))

(assert (=> b!138173 m!212137))

(declare-fun m!212503 () Bool)

(assert (=> b!138173 m!212503))

(assert (=> b!137982 d!44448))

(declare-fun d!44450 () Bool)

(declare-fun res!115134 () Bool)

(declare-fun e!91861 () Bool)

(assert (=> d!44450 (=> res!115134 e!91861)))

(assert (=> d!44450 (= res!115134 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44450 (= (arrayRangesEq!235 (_2!6357 lt!215124) (_2!6357 lt!215103) #b00000000000000000000000000000000 to!404) e!91861)))

(declare-fun b!138174 () Bool)

(declare-fun e!91862 () Bool)

(assert (=> b!138174 (= e!91861 e!91862)))

(declare-fun res!115135 () Bool)

(assert (=> b!138174 (=> (not res!115135) (not e!91862))))

(assert (=> b!138174 (= res!115135 (= (select (arr!3518 (_2!6357 lt!215124)) #b00000000000000000000000000000000) (select (arr!3518 (_2!6357 lt!215103)) #b00000000000000000000000000000000)))))

(declare-fun b!138175 () Bool)

(assert (=> b!138175 (= e!91862 (arrayRangesEq!235 (_2!6357 lt!215124) (_2!6357 lt!215103) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44450 (not res!115134)) b!138174))

(assert (= (and b!138174 res!115135) b!138175))

(assert (=> b!138174 m!212463))

(declare-fun m!212505 () Bool)

(assert (=> b!138174 m!212505))

(declare-fun m!212507 () Bool)

(assert (=> b!138175 m!212507))

(assert (=> b!137982 d!44450))

(declare-fun d!44452 () Bool)

(declare-fun lt!215568 () tuple3!526)

(assert (=> d!44452 (= lt!215568 (readByteArrayLoop!0 (_1!6358 lt!215120) lt!215111 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44452 (= (readByteArrayLoopPure!0 (_1!6358 lt!215120) lt!215111 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12069 (_2!6362 lt!215568) (_3!324 lt!215568)))))

(declare-fun bs!10845 () Bool)

(assert (= bs!10845 d!44452))

(declare-fun m!212509 () Bool)

(assert (=> bs!10845 m!212509))

(assert (=> b!137982 d!44452))

(declare-fun d!44454 () Bool)

(declare-fun lt!215569 () tuple3!526)

(assert (=> d!44454 (= lt!215569 (readByteArrayLoop!0 (_1!6358 lt!215122) arr!237 from!447 to!404))))

(assert (=> d!44454 (= (readByteArrayLoopPure!0 (_1!6358 lt!215122) arr!237 from!447 to!404) (tuple2!12069 (_2!6362 lt!215569) (_3!324 lt!215569)))))

(declare-fun bs!10846 () Bool)

(assert (= bs!10846 d!44454))

(declare-fun m!212511 () Bool)

(assert (=> bs!10846 m!212511))

(assert (=> b!137982 d!44454))

(declare-fun d!44456 () Bool)

(assert (=> d!44456 (= (array_inv!2621 (buf!3239 thiss!1634)) (bvsge (size!2832 (buf!3239 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!137985 d!44456))

(declare-fun d!44458 () Bool)

(declare-fun e!91863 () Bool)

(assert (=> d!44458 e!91863))

(declare-fun res!115137 () Bool)

(assert (=> d!44458 (=> (not res!115137) (not e!91863))))

(declare-fun lt!215570 () (_ BitVec 64))

(declare-fun lt!215575 () (_ BitVec 64))

(declare-fun lt!215572 () (_ BitVec 64))

(assert (=> d!44458 (= res!115137 (= lt!215572 (bvsub lt!215570 lt!215575)))))

(assert (=> d!44458 (or (= (bvand lt!215570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215575 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215570 lt!215575) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44458 (= lt!215575 (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215112)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112)))))))

(declare-fun lt!215571 () (_ BitVec 64))

(declare-fun lt!215573 () (_ BitVec 64))

(assert (=> d!44458 (= lt!215570 (bvmul lt!215571 lt!215573))))

(assert (=> d!44458 (or (= lt!215571 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215573 (bvsdiv (bvmul lt!215571 lt!215573) lt!215571)))))

(assert (=> d!44458 (= lt!215573 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44458 (= lt!215571 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215112)))))))

(assert (=> d!44458 (= lt!215572 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112)))))))

(assert (=> d!44458 (invariant!0 (currentBit!6041 (_2!6356 lt!215112)) (currentByte!6046 (_2!6356 lt!215112)) (size!2832 (buf!3239 (_2!6356 lt!215112))))))

(assert (=> d!44458 (= (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215112))) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112))) lt!215572)))

(declare-fun b!138176 () Bool)

(declare-fun res!115136 () Bool)

(assert (=> b!138176 (=> (not res!115136) (not e!91863))))

(assert (=> b!138176 (= res!115136 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215572))))

(declare-fun b!138177 () Bool)

(declare-fun lt!215574 () (_ BitVec 64))

(assert (=> b!138177 (= e!91863 (bvsle lt!215572 (bvmul lt!215574 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138177 (or (= lt!215574 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215574 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215574)))))

(assert (=> b!138177 (= lt!215574 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215112)))))))

(assert (= (and d!44458 res!115137) b!138176))

(assert (= (and b!138176 res!115136) b!138177))

(assert (=> d!44458 m!212361))

(declare-fun m!212513 () Bool)

(assert (=> d!44458 m!212513))

(assert (=> b!137986 d!44458))

(declare-fun d!44460 () Bool)

(declare-fun e!91864 () Bool)

(assert (=> d!44460 e!91864))

(declare-fun res!115139 () Bool)

(assert (=> d!44460 (=> (not res!115139) (not e!91864))))

(declare-fun lt!215576 () (_ BitVec 64))

(declare-fun lt!215578 () (_ BitVec 64))

(declare-fun lt!215581 () (_ BitVec 64))

(assert (=> d!44460 (= res!115139 (= lt!215578 (bvsub lt!215576 lt!215581)))))

(assert (=> d!44460 (or (= (bvand lt!215576 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215581 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215576 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215576 lt!215581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44460 (= lt!215581 (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 thiss!1634))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634))))))

(declare-fun lt!215577 () (_ BitVec 64))

(declare-fun lt!215579 () (_ BitVec 64))

(assert (=> d!44460 (= lt!215576 (bvmul lt!215577 lt!215579))))

(assert (=> d!44460 (or (= lt!215577 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215579 (bvsdiv (bvmul lt!215577 lt!215579) lt!215577)))))

(assert (=> d!44460 (= lt!215579 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44460 (= lt!215577 ((_ sign_extend 32) (size!2832 (buf!3239 thiss!1634))))))

(assert (=> d!44460 (= lt!215578 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6046 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6041 thiss!1634))))))

(assert (=> d!44460 (invariant!0 (currentBit!6041 thiss!1634) (currentByte!6046 thiss!1634) (size!2832 (buf!3239 thiss!1634)))))

(assert (=> d!44460 (= (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)) lt!215578)))

(declare-fun b!138178 () Bool)

(declare-fun res!115138 () Bool)

(assert (=> b!138178 (=> (not res!115138) (not e!91864))))

(assert (=> b!138178 (= res!115138 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215578))))

(declare-fun b!138179 () Bool)

(declare-fun lt!215580 () (_ BitVec 64))

(assert (=> b!138179 (= e!91864 (bvsle lt!215578 (bvmul lt!215580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138179 (or (= lt!215580 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215580 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215580)))))

(assert (=> b!138179 (= lt!215580 ((_ sign_extend 32) (size!2832 (buf!3239 thiss!1634))))))

(assert (= (and d!44460 res!115139) b!138178))

(assert (= (and b!138178 res!115138) b!138179))

(assert (=> d!44460 m!212357))

(assert (=> d!44460 m!212119))

(assert (=> b!137986 d!44460))

(declare-fun d!44462 () Bool)

(declare-fun lt!215582 () tuple2!12076)

(assert (=> d!44462 (= lt!215582 (readByte!0 (_1!6358 lt!215106)))))

(assert (=> d!44462 (= (readBytePure!0 (_1!6358 lt!215106)) (tuple2!12073 (_2!6363 lt!215582) (_1!6363 lt!215582)))))

(declare-fun bs!10847 () Bool)

(assert (= bs!10847 d!44462))

(declare-fun m!212515 () Bool)

(assert (=> bs!10847 m!212515))

(assert (=> b!137984 d!44462))

(declare-fun b!138180 () Bool)

(declare-fun res!115141 () Bool)

(declare-fun e!91865 () Bool)

(assert (=> b!138180 (=> (not res!115141) (not e!91865))))

(declare-fun lt!215600 () tuple2!12070)

(assert (=> b!138180 (= res!115141 (isPrefixOf!0 (_1!6358 lt!215600) thiss!1634))))

(declare-fun b!138181 () Bool)

(declare-fun e!91866 () Unit!8611)

(declare-fun lt!215584 () Unit!8611)

(assert (=> b!138181 (= e!91866 lt!215584)))

(declare-fun lt!215590 () (_ BitVec 64))

(assert (=> b!138181 (= lt!215590 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215602 () (_ BitVec 64))

(assert (=> b!138181 (= lt!215602 (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)))))

(assert (=> b!138181 (= lt!215584 (arrayBitRangesEqSymmetric!0 (buf!3239 thiss!1634) (buf!3239 (_2!6356 lt!215112)) lt!215590 lt!215602))))

(assert (=> b!138181 (arrayBitRangesEq!0 (buf!3239 (_2!6356 lt!215112)) (buf!3239 thiss!1634) lt!215590 lt!215602)))

(declare-fun b!138182 () Bool)

(declare-fun Unit!8618 () Unit!8611)

(assert (=> b!138182 (= e!91866 Unit!8618)))

(declare-fun b!138183 () Bool)

(declare-fun res!115142 () Bool)

(assert (=> b!138183 (=> (not res!115142) (not e!91865))))

(assert (=> b!138183 (= res!115142 (isPrefixOf!0 (_2!6358 lt!215600) (_2!6356 lt!215112)))))

(declare-fun d!44464 () Bool)

(assert (=> d!44464 e!91865))

(declare-fun res!115140 () Bool)

(assert (=> d!44464 (=> (not res!115140) (not e!91865))))

(assert (=> d!44464 (= res!115140 (isPrefixOf!0 (_1!6358 lt!215600) (_2!6358 lt!215600)))))

(declare-fun lt!215586 () BitStream!4928)

(assert (=> d!44464 (= lt!215600 (tuple2!12071 lt!215586 (_2!6356 lt!215112)))))

(declare-fun lt!215597 () Unit!8611)

(declare-fun lt!215591 () Unit!8611)

(assert (=> d!44464 (= lt!215597 lt!215591)))

(assert (=> d!44464 (isPrefixOf!0 lt!215586 (_2!6356 lt!215112))))

(assert (=> d!44464 (= lt!215591 (lemmaIsPrefixTransitive!0 lt!215586 (_2!6356 lt!215112) (_2!6356 lt!215112)))))

(declare-fun lt!215595 () Unit!8611)

(declare-fun lt!215592 () Unit!8611)

(assert (=> d!44464 (= lt!215595 lt!215592)))

(assert (=> d!44464 (isPrefixOf!0 lt!215586 (_2!6356 lt!215112))))

(assert (=> d!44464 (= lt!215592 (lemmaIsPrefixTransitive!0 lt!215586 thiss!1634 (_2!6356 lt!215112)))))

(declare-fun lt!215588 () Unit!8611)

(assert (=> d!44464 (= lt!215588 e!91866)))

(declare-fun c!7745 () Bool)

(assert (=> d!44464 (= c!7745 (not (= (size!2832 (buf!3239 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!215589 () Unit!8611)

(declare-fun lt!215601 () Unit!8611)

(assert (=> d!44464 (= lt!215589 lt!215601)))

(assert (=> d!44464 (isPrefixOf!0 (_2!6356 lt!215112) (_2!6356 lt!215112))))

(assert (=> d!44464 (= lt!215601 (lemmaIsPrefixRefl!0 (_2!6356 lt!215112)))))

(declare-fun lt!215583 () Unit!8611)

(declare-fun lt!215594 () Unit!8611)

(assert (=> d!44464 (= lt!215583 lt!215594)))

(assert (=> d!44464 (= lt!215594 (lemmaIsPrefixRefl!0 (_2!6356 lt!215112)))))

(declare-fun lt!215587 () Unit!8611)

(declare-fun lt!215593 () Unit!8611)

(assert (=> d!44464 (= lt!215587 lt!215593)))

(assert (=> d!44464 (isPrefixOf!0 lt!215586 lt!215586)))

(assert (=> d!44464 (= lt!215593 (lemmaIsPrefixRefl!0 lt!215586))))

(declare-fun lt!215599 () Unit!8611)

(declare-fun lt!215585 () Unit!8611)

(assert (=> d!44464 (= lt!215599 lt!215585)))

(assert (=> d!44464 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44464 (= lt!215585 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44464 (= lt!215586 (BitStream!4929 (buf!3239 (_2!6356 lt!215112)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)))))

(assert (=> d!44464 (isPrefixOf!0 thiss!1634 (_2!6356 lt!215112))))

(assert (=> d!44464 (= (reader!0 thiss!1634 (_2!6356 lt!215112)) lt!215600)))

(declare-fun lt!215596 () (_ BitVec 64))

(declare-fun lt!215598 () (_ BitVec 64))

(declare-fun b!138184 () Bool)

(assert (=> b!138184 (= e!91865 (= (_1!6358 lt!215600) (withMovedBitIndex!0 (_2!6358 lt!215600) (bvsub lt!215598 lt!215596))))))

(assert (=> b!138184 (or (= (bvand lt!215598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215596 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215598 lt!215596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138184 (= lt!215596 (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215112))) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112))))))

(assert (=> b!138184 (= lt!215598 (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)))))

(assert (= (and d!44464 c!7745) b!138181))

(assert (= (and d!44464 (not c!7745)) b!138182))

(assert (= (and d!44464 res!115140) b!138180))

(assert (= (and b!138180 res!115141) b!138183))

(assert (= (and b!138183 res!115142) b!138184))

(declare-fun m!212517 () Bool)

(assert (=> b!138183 m!212517))

(declare-fun m!212519 () Bool)

(assert (=> b!138184 m!212519))

(assert (=> b!138184 m!212109))

(assert (=> b!138184 m!212137))

(assert (=> b!138181 m!212137))

(declare-fun m!212521 () Bool)

(assert (=> b!138181 m!212521))

(declare-fun m!212523 () Bool)

(assert (=> b!138181 m!212523))

(declare-fun m!212525 () Bool)

(assert (=> b!138180 m!212525))

(declare-fun m!212527 () Bool)

(assert (=> d!44464 m!212527))

(assert (=> d!44464 m!212411))

(assert (=> d!44464 m!212445))

(assert (=> d!44464 m!212415))

(assert (=> d!44464 m!212139))

(declare-fun m!212529 () Bool)

(assert (=> d!44464 m!212529))

(assert (=> d!44464 m!212447))

(declare-fun m!212531 () Bool)

(assert (=> d!44464 m!212531))

(declare-fun m!212533 () Bool)

(assert (=> d!44464 m!212533))

(declare-fun m!212535 () Bool)

(assert (=> d!44464 m!212535))

(declare-fun m!212537 () Bool)

(assert (=> d!44464 m!212537))

(assert (=> b!137984 d!44464))

(declare-fun d!44466 () Bool)

(assert (=> d!44466 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_1!6358 lt!215122)))) ((_ sign_extend 32) (currentByte!6046 (_1!6358 lt!215122))) ((_ sign_extend 32) (currentBit!6041 (_1!6358 lt!215122))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_1!6358 lt!215122)))) ((_ sign_extend 32) (currentByte!6046 (_1!6358 lt!215122))) ((_ sign_extend 32) (currentBit!6041 (_1!6358 lt!215122)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10848 () Bool)

(assert (= bs!10848 d!44466))

(declare-fun m!212539 () Bool)

(assert (=> bs!10848 m!212539))

(assert (=> b!137995 d!44466))

(declare-fun d!44468 () Bool)

(assert (=> d!44468 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634)) lt!215110) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634))) lt!215110))))

(declare-fun bs!10849 () Bool)

(assert (= bs!10849 d!44468))

(assert (=> bs!10849 m!212489))

(assert (=> b!137995 d!44468))

(declare-fun d!44470 () Bool)

(assert (=> d!44470 (validate_offset_bits!1 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 thiss!1634)) ((_ sign_extend 32) (currentBit!6041 thiss!1634)) lt!215110)))

(declare-fun lt!215605 () Unit!8611)

(declare-fun choose!9 (BitStream!4928 array!6253 (_ BitVec 64) BitStream!4928) Unit!8611)

(assert (=> d!44470 (= lt!215605 (choose!9 thiss!1634 (buf!3239 (_2!6356 lt!215115)) lt!215110 (BitStream!4929 (buf!3239 (_2!6356 lt!215115)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634))))))

(assert (=> d!44470 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3239 (_2!6356 lt!215115)) lt!215110) lt!215605)))

(declare-fun bs!10850 () Bool)

(assert (= bs!10850 d!44470))

(assert (=> bs!10850 m!212123))

(declare-fun m!212541 () Bool)

(assert (=> bs!10850 m!212541))

(assert (=> b!137995 d!44470))

(declare-fun d!44472 () Bool)

(assert (=> d!44472 (= (array_inv!2621 arr!237) (bvsge (size!2832 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26744 d!44472))

(declare-fun d!44474 () Bool)

(assert (=> d!44474 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6041 thiss!1634) (currentByte!6046 thiss!1634) (size!2832 (buf!3239 thiss!1634))))))

(declare-fun bs!10851 () Bool)

(assert (= bs!10851 d!44474))

(assert (=> bs!10851 m!212119))

(assert (=> start!26744 d!44474))

(declare-fun d!44476 () Bool)

(declare-fun e!91867 () Bool)

(assert (=> d!44476 e!91867))

(declare-fun res!115144 () Bool)

(assert (=> d!44476 (=> (not res!115144) (not e!91867))))

(declare-fun lt!215611 () (_ BitVec 64))

(declare-fun lt!215606 () (_ BitVec 64))

(declare-fun lt!215608 () (_ BitVec 64))

(assert (=> d!44476 (= res!115144 (= lt!215608 (bvsub lt!215606 lt!215611)))))

(assert (=> d!44476 (or (= (bvand lt!215606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215606 lt!215611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44476 (= lt!215611 (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215115))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215115)))))))

(declare-fun lt!215607 () (_ BitVec 64))

(declare-fun lt!215609 () (_ BitVec 64))

(assert (=> d!44476 (= lt!215606 (bvmul lt!215607 lt!215609))))

(assert (=> d!44476 (or (= lt!215607 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215609 (bvsdiv (bvmul lt!215607 lt!215609) lt!215607)))))

(assert (=> d!44476 (= lt!215609 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44476 (= lt!215607 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))))))

(assert (=> d!44476 (= lt!215608 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215115))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215115)))))))

(assert (=> d!44476 (invariant!0 (currentBit!6041 (_2!6356 lt!215115)) (currentByte!6046 (_2!6356 lt!215115)) (size!2832 (buf!3239 (_2!6356 lt!215115))))))

(assert (=> d!44476 (= (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215115))) (currentByte!6046 (_2!6356 lt!215115)) (currentBit!6041 (_2!6356 lt!215115))) lt!215608)))

(declare-fun b!138185 () Bool)

(declare-fun res!115143 () Bool)

(assert (=> b!138185 (=> (not res!115143) (not e!91867))))

(assert (=> b!138185 (= res!115143 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215608))))

(declare-fun b!138186 () Bool)

(declare-fun lt!215610 () (_ BitVec 64))

(assert (=> b!138186 (= e!91867 (bvsle lt!215608 (bvmul lt!215610 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138186 (or (= lt!215610 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215610 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215610)))))

(assert (=> b!138186 (= lt!215610 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))))))

(assert (= (and d!44476 res!115144) b!138185))

(assert (= (and b!138185 res!115143) b!138186))

(declare-fun m!212543 () Bool)

(assert (=> d!44476 m!212543))

(declare-fun m!212545 () Bool)

(assert (=> d!44476 m!212545))

(assert (=> b!137988 d!44476))

(assert (=> b!137988 d!44460))

(declare-fun d!44478 () Bool)

(declare-fun lt!215612 () tuple3!526)

(assert (=> d!44478 (= lt!215612 (readByteArrayLoop!0 (_1!6358 lt!215117) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44478 (= (readByteArrayLoopPure!0 (_1!6358 lt!215117) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12069 (_2!6362 lt!215612) (_3!324 lt!215612)))))

(declare-fun bs!10852 () Bool)

(assert (= bs!10852 d!44478))

(declare-fun m!212547 () Bool)

(assert (=> bs!10852 m!212547))

(assert (=> b!137997 d!44478))

(declare-fun d!44480 () Bool)

(assert (=> d!44480 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) lt!215099) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112)))) lt!215099))))

(declare-fun bs!10853 () Bool)

(assert (= bs!10853 d!44480))

(assert (=> bs!10853 m!212365))

(assert (=> b!137997 d!44480))

(declare-fun d!44482 () Bool)

(assert (=> d!44482 (validate_offset_bits!1 ((_ sign_extend 32) (size!2832 (buf!3239 (_2!6356 lt!215115)))) ((_ sign_extend 32) (currentByte!6046 (_2!6356 lt!215112))) ((_ sign_extend 32) (currentBit!6041 (_2!6356 lt!215112))) lt!215099)))

(declare-fun lt!215613 () Unit!8611)

(assert (=> d!44482 (= lt!215613 (choose!9 (_2!6356 lt!215112) (buf!3239 (_2!6356 lt!215115)) lt!215099 (BitStream!4929 (buf!3239 (_2!6356 lt!215115)) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112)))))))

(assert (=> d!44482 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6356 lt!215112) (buf!3239 (_2!6356 lt!215115)) lt!215099) lt!215613)))

(declare-fun bs!10854 () Bool)

(assert (= bs!10854 d!44482))

(assert (=> bs!10854 m!212115))

(declare-fun m!212549 () Bool)

(assert (=> bs!10854 m!212549))

(assert (=> b!137997 d!44482))

(assert (=> b!137997 d!44430))

(declare-fun d!44484 () Bool)

(declare-fun res!115145 () Bool)

(declare-fun e!91868 () Bool)

(assert (=> d!44484 (=> res!115145 e!91868)))

(assert (=> d!44484 (= res!115145 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44484 (= (arrayRangesEq!235 arr!237 (_2!6357 lt!215124) #b00000000000000000000000000000000 to!404) e!91868)))

(declare-fun b!138187 () Bool)

(declare-fun e!91869 () Bool)

(assert (=> b!138187 (= e!91868 e!91869)))

(declare-fun res!115146 () Bool)

(assert (=> b!138187 (=> (not res!115146) (not e!91869))))

(assert (=> b!138187 (= res!115146 (= (select (arr!3518 arr!237) #b00000000000000000000000000000000) (select (arr!3518 (_2!6357 lt!215124)) #b00000000000000000000000000000000)))))

(declare-fun b!138188 () Bool)

(assert (=> b!138188 (= e!91869 (arrayRangesEq!235 arr!237 (_2!6357 lt!215124) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44484 (not res!115145)) b!138187))

(assert (= (and b!138187 res!115146) b!138188))

(assert (=> b!138187 m!212351))

(assert (=> b!138187 m!212463))

(declare-fun m!212551 () Bool)

(assert (=> b!138188 m!212551))

(assert (=> b!137987 d!44484))

(declare-fun d!44486 () Bool)

(assert (=> d!44486 (arrayRangesEq!235 arr!237 (_2!6357 lt!215124) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215616 () Unit!8611)

(declare-fun choose!79 (array!6253 array!6253 array!6253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8611)

(assert (=> d!44486 (= lt!215616 (choose!79 arr!237 (_2!6357 lt!215125) (_2!6357 lt!215124) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!44486 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!44486 (= (arrayRangesEqTransitive!37 arr!237 (_2!6357 lt!215125) (_2!6357 lt!215124) #b00000000000000000000000000000000 to!404 to!404) lt!215616)))

(declare-fun bs!10855 () Bool)

(assert (= bs!10855 d!44486))

(assert (=> bs!10855 m!212095))

(declare-fun m!212553 () Bool)

(assert (=> bs!10855 m!212553))

(assert (=> b!137987 d!44486))

(declare-fun d!44488 () Bool)

(declare-fun res!115147 () Bool)

(declare-fun e!91870 () Bool)

(assert (=> d!44488 (=> res!115147 e!91870)))

(assert (=> d!44488 (= res!115147 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44488 (= (arrayRangesEq!235 (_2!6357 lt!215125) (_2!6357 lt!215124) #b00000000000000000000000000000000 to!404) e!91870)))

(declare-fun b!138189 () Bool)

(declare-fun e!91871 () Bool)

(assert (=> b!138189 (= e!91870 e!91871)))

(declare-fun res!115148 () Bool)

(assert (=> b!138189 (=> (not res!115148) (not e!91871))))

(assert (=> b!138189 (= res!115148 (= (select (arr!3518 (_2!6357 lt!215125)) #b00000000000000000000000000000000) (select (arr!3518 (_2!6357 lt!215124)) #b00000000000000000000000000000000)))))

(declare-fun b!138190 () Bool)

(assert (=> b!138190 (= e!91871 (arrayRangesEq!235 (_2!6357 lt!215125) (_2!6357 lt!215124) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44488 (not res!115147)) b!138189))

(assert (= (and b!138189 res!115148) b!138190))

(assert (=> b!138189 m!212465))

(assert (=> b!138189 m!212463))

(declare-fun m!212555 () Bool)

(assert (=> b!138190 m!212555))

(assert (=> b!137987 d!44488))

(declare-fun d!44490 () Bool)

(assert (=> d!44490 (arrayRangesEq!235 (_2!6357 lt!215125) (_2!6357 lt!215124) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215619 () Unit!8611)

(declare-fun choose!80 (array!6253 array!6253 (_ BitVec 32) (_ BitVec 32)) Unit!8611)

(assert (=> d!44490 (= lt!215619 (choose!80 (_2!6357 lt!215124) (_2!6357 lt!215125) #b00000000000000000000000000000000 to!404))))

(assert (=> d!44490 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!2832 (_2!6357 lt!215124))))))

(assert (=> d!44490 (= (arrayRangesEqSymmetricLemma!48 (_2!6357 lt!215124) (_2!6357 lt!215125) #b00000000000000000000000000000000 to!404) lt!215619)))

(declare-fun bs!10856 () Bool)

(assert (= bs!10856 d!44490))

(assert (=> bs!10856 m!212099))

(declare-fun m!212557 () Bool)

(assert (=> bs!10856 m!212557))

(assert (=> b!137987 d!44490))

(assert (=> b!137991 d!44476))

(assert (=> b!137991 d!44458))

(declare-fun d!44492 () Bool)

(declare-fun res!115151 () Bool)

(declare-fun e!91873 () Bool)

(assert (=> d!44492 (=> (not res!115151) (not e!91873))))

(assert (=> d!44492 (= res!115151 (= (size!2832 (buf!3239 thiss!1634)) (size!2832 (buf!3239 (_2!6356 lt!215112)))))))

(assert (=> d!44492 (= (isPrefixOf!0 thiss!1634 (_2!6356 lt!215112)) e!91873)))

(declare-fun b!138191 () Bool)

(declare-fun res!115150 () Bool)

(assert (=> b!138191 (=> (not res!115150) (not e!91873))))

(assert (=> b!138191 (= res!115150 (bvsle (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634)) (bitIndex!0 (size!2832 (buf!3239 (_2!6356 lt!215112))) (currentByte!6046 (_2!6356 lt!215112)) (currentBit!6041 (_2!6356 lt!215112)))))))

(declare-fun b!138192 () Bool)

(declare-fun e!91872 () Bool)

(assert (=> b!138192 (= e!91873 e!91872)))

(declare-fun res!115149 () Bool)

(assert (=> b!138192 (=> res!115149 e!91872)))

(assert (=> b!138192 (= res!115149 (= (size!2832 (buf!3239 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138193 () Bool)

(assert (=> b!138193 (= e!91872 (arrayBitRangesEq!0 (buf!3239 thiss!1634) (buf!3239 (_2!6356 lt!215112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2832 (buf!3239 thiss!1634)) (currentByte!6046 thiss!1634) (currentBit!6041 thiss!1634))))))

(assert (= (and d!44492 res!115151) b!138191))

(assert (= (and b!138191 res!115150) b!138192))

(assert (= (and b!138192 (not res!115149)) b!138193))

(assert (=> b!138191 m!212137))

(assert (=> b!138191 m!212109))

(assert (=> b!138193 m!212137))

(assert (=> b!138193 m!212137))

(declare-fun m!212559 () Bool)

(assert (=> b!138193 m!212559))

(assert (=> b!137989 d!44492))

(declare-fun d!44494 () Bool)

(assert (=> d!44494 (= (invariant!0 (currentBit!6041 thiss!1634) (currentByte!6046 thiss!1634) (size!2832 (buf!3239 thiss!1634))) (and (bvsge (currentBit!6041 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6041 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6046 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6046 thiss!1634) (size!2832 (buf!3239 thiss!1634))) (and (= (currentBit!6041 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6046 thiss!1634) (size!2832 (buf!3239 thiss!1634)))))))))

(assert (=> b!137990 d!44494))

(push 1)

(assert (not d!44427))

(assert (not b!138181))

(assert (not b!138144))

(assert (not d!44444))

(assert (not b!138173))

(assert (not b!138123))

(assert (not b!138165))

(assert (not d!44462))

(assert (not d!44409))

(assert (not d!44438))

(assert (not d!44419))

(assert (not b!138101))

(assert (not b!138180))

(assert (not b!138167))

(assert (not d!44411))

(assert (not b!138136))

(assert (not d!44417))

(assert (not d!44490))

(assert (not b!138163))

(assert (not d!44425))

(assert (not d!44446))

(assert (not b!138125))

(assert (not b!138152))

(assert (not d!44482))

(assert (not b!138166))

(assert (not b!138140))

(assert (not b!138137))

(assert (not d!44405))

(assert (not b!138193))

(assert (not b!138190))

(assert (not d!44466))

(assert (not b!138184))

(assert (not b!138139))

(assert (not b!138175))

(assert (not d!44476))

(assert (not d!44399))

(assert (not d!44436))

(assert (not d!44468))

(assert (not b!138110))

(assert (not d!44454))

(assert (not b!138143))

(assert (not d!44480))

(assert (not d!44474))

(assert (not d!44464))

(assert (not d!44460))

(assert (not b!138183))

(assert (not d!44413))

(assert (not b!138145))

(assert (not d!44452))

(assert (not d!44458))

(assert (not b!138108))

(assert (not d!44470))

(assert (not b!138171))

(assert (not b!138148))

(assert (not d!44440))

(assert (not d!44415))

(assert (not d!44430))

(assert (not b!138164))

(assert (not b!138191))

(assert (not b!138147))

(assert (not b!138188))

(assert (not d!44478))

(assert (not d!44421))

(assert (not d!44407))

(assert (not b!138124))

(assert (not d!44486))

(assert (not d!44442))

(assert (not d!44432))

(assert (not d!44423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

