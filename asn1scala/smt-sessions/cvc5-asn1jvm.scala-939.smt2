; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26704 () Bool)

(assert start!26704)

(declare-fun b!137011 () Bool)

(declare-fun e!91017 () Bool)

(declare-fun e!91018 () Bool)

(assert (=> b!137011 (= e!91017 (not e!91018))))

(declare-fun res!114057 () Bool)

(assert (=> b!137011 (=> res!114057 e!91018)))

(declare-datatypes ((array!6213 0))(
  ( (array!6214 (arr!3498 (Array (_ BitVec 32) (_ BitVec 8))) (size!2812 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4888 0))(
  ( (BitStream!4889 (buf!3219 array!6213) (currentByte!6026 (_ BitVec 32)) (currentBit!6021 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11906 0))(
  ( (tuple2!11907 (_1!6276 BitStream!4888) (_2!6276 array!6213)) )
))
(declare-fun lt!213375 () tuple2!11906)

(declare-datatypes ((tuple2!11908 0))(
  ( (tuple2!11909 (_1!6277 BitStream!4888) (_2!6277 BitStream!4888)) )
))
(declare-fun lt!213394 () tuple2!11908)

(declare-fun arr!237 () array!6213)

(assert (=> b!137011 (= res!114057 (or (not (= (size!2812 (_2!6276 lt!213375)) (size!2812 arr!237))) (not (= (_1!6276 lt!213375) (_2!6277 lt!213394)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4888 array!6213 (_ BitVec 32) (_ BitVec 32)) tuple2!11906)

(assert (=> b!137011 (= lt!213375 (readByteArrayLoopPure!0 (_1!6277 lt!213394) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8571 0))(
  ( (Unit!8572) )
))
(declare-datatypes ((tuple2!11910 0))(
  ( (tuple2!11911 (_1!6278 Unit!8571) (_2!6278 BitStream!4888)) )
))
(declare-fun lt!213382 () tuple2!11910)

(declare-fun lt!213390 () tuple2!11910)

(declare-fun lt!213398 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!137011 (validate_offset_bits!1 ((_ sign_extend 32) (size!2812 (buf!3219 (_2!6278 lt!213382)))) ((_ sign_extend 32) (currentByte!6026 (_2!6278 lt!213390))) ((_ sign_extend 32) (currentBit!6021 (_2!6278 lt!213390))) lt!213398)))

(declare-fun lt!213389 () Unit!8571)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4888 array!6213 (_ BitVec 64)) Unit!8571)

(assert (=> b!137011 (= lt!213389 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6278 lt!213390) (buf!3219 (_2!6278 lt!213382)) lt!213398))))

(declare-fun reader!0 (BitStream!4888 BitStream!4888) tuple2!11908)

(assert (=> b!137011 (= lt!213394 (reader!0 (_2!6278 lt!213390) (_2!6278 lt!213382)))))

(declare-fun b!137012 () Bool)

(declare-fun res!114058 () Bool)

(declare-fun e!91022 () Bool)

(assert (=> b!137012 (=> (not res!114058) (not e!91022))))

(declare-fun thiss!1634 () BitStream!4888)

(declare-fun isPrefixOf!0 (BitStream!4888 BitStream!4888) Bool)

(assert (=> b!137012 (= res!114058 (isPrefixOf!0 thiss!1634 (_2!6278 lt!213390)))))

(declare-fun res!114061 () Bool)

(declare-fun e!91013 () Bool)

(assert (=> start!26704 (=> (not res!114061) (not e!91013))))

(assert (=> start!26704 (= res!114061 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2812 arr!237))))))

(assert (=> start!26704 e!91013))

(assert (=> start!26704 true))

(declare-fun array_inv!2601 (array!6213) Bool)

(assert (=> start!26704 (array_inv!2601 arr!237)))

(declare-fun e!91015 () Bool)

(declare-fun inv!12 (BitStream!4888) Bool)

(assert (=> start!26704 (and (inv!12 thiss!1634) e!91015)))

(declare-fun b!137013 () Bool)

(declare-fun res!114051 () Bool)

(assert (=> b!137013 (=> (not res!114051) (not e!91013))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137013 (= res!114051 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2812 (buf!3219 thiss!1634))) ((_ sign_extend 32) (currentByte!6026 thiss!1634)) ((_ sign_extend 32) (currentBit!6021 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!137014 () Bool)

(declare-fun e!91020 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137014 (= e!91020 (invariant!0 (currentBit!6021 thiss!1634) (currentByte!6026 thiss!1634) (size!2812 (buf!3219 (_2!6278 lt!213390)))))))

(declare-fun b!137015 () Bool)

(declare-fun e!91023 () Bool)

(assert (=> b!137015 (= e!91023 e!91017)))

(declare-fun res!114059 () Bool)

(assert (=> b!137015 (=> (not res!114059) (not e!91017))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!137015 (= res!114059 (= (bitIndex!0 (size!2812 (buf!3219 (_2!6278 lt!213382))) (currentByte!6026 (_2!6278 lt!213382)) (currentBit!6021 (_2!6278 lt!213382))) (bvadd (bitIndex!0 (size!2812 (buf!3219 (_2!6278 lt!213390))) (currentByte!6026 (_2!6278 lt!213390)) (currentBit!6021 (_2!6278 lt!213390))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!213398))))))

(assert (=> b!137015 (= lt!213398 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!137016 () Bool)

(declare-fun e!91016 () Bool)

(assert (=> b!137016 (= e!91016 true)))

(declare-fun lt!213391 () tuple2!11906)

(declare-fun arrayRangesEq!215 (array!6213 array!6213 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137016 (arrayRangesEq!215 arr!237 (_2!6276 lt!213391) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213378 () Unit!8571)

(declare-fun lt!213381 () tuple2!11906)

(declare-fun arrayRangesEqTransitive!17 (array!6213 array!6213 array!6213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8571)

(assert (=> b!137016 (= lt!213378 (arrayRangesEqTransitive!17 arr!237 (_2!6276 lt!213381) (_2!6276 lt!213391) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!137016 (arrayRangesEq!215 (_2!6276 lt!213381) (_2!6276 lt!213391) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213393 () Unit!8571)

(declare-fun arrayRangesEqSymmetricLemma!28 (array!6213 array!6213 (_ BitVec 32) (_ BitVec 32)) Unit!8571)

(assert (=> b!137016 (= lt!213393 (arrayRangesEqSymmetricLemma!28 (_2!6276 lt!213391) (_2!6276 lt!213381) #b00000000000000000000000000000000 to!404))))

(declare-fun b!137017 () Bool)

(assert (=> b!137017 (= e!91015 (array_inv!2601 (buf!3219 thiss!1634)))))

(declare-fun b!137018 () Bool)

(declare-fun e!91019 () Bool)

(declare-datatypes ((tuple2!11912 0))(
  ( (tuple2!11913 (_1!6279 BitStream!4888) (_2!6279 (_ BitVec 8))) )
))
(declare-fun lt!213396 () tuple2!11912)

(declare-fun lt!213377 () tuple2!11912)

(assert (=> b!137018 (= e!91019 (= (_2!6279 lt!213396) (_2!6279 lt!213377)))))

(declare-fun b!137019 () Bool)

(declare-fun res!114063 () Bool)

(assert (=> b!137019 (=> (not res!114063) (not e!91013))))

(assert (=> b!137019 (= res!114063 (bvslt from!447 to!404))))

(declare-fun b!137020 () Bool)

(assert (=> b!137020 (= e!91018 (not (arrayRangesEq!215 arr!237 (_2!6276 lt!213375) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!137021 () Bool)

(declare-fun res!114060 () Bool)

(assert (=> b!137021 (=> (not res!114060) (not e!91022))))

(assert (=> b!137021 (= res!114060 (= (bitIndex!0 (size!2812 (buf!3219 (_2!6278 lt!213390))) (currentByte!6026 (_2!6278 lt!213390)) (currentBit!6021 (_2!6278 lt!213390))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2812 (buf!3219 thiss!1634)) (currentByte!6026 thiss!1634) (currentBit!6021 thiss!1634)))))))

(declare-fun b!137022 () Bool)

(declare-fun lt!213397 () tuple2!11912)

(declare-fun lt!213387 () tuple2!11908)

(assert (=> b!137022 (= e!91022 (and (= (_2!6279 lt!213397) (select (arr!3498 arr!237) from!447)) (= (_1!6279 lt!213397) (_2!6277 lt!213387))))))

(declare-fun readBytePure!0 (BitStream!4888) tuple2!11912)

(assert (=> b!137022 (= lt!213397 (readBytePure!0 (_1!6277 lt!213387)))))

(assert (=> b!137022 (= lt!213387 (reader!0 thiss!1634 (_2!6278 lt!213390)))))

(declare-fun b!137023 () Bool)

(assert (=> b!137023 (= e!91013 (not e!91016))))

(declare-fun res!114055 () Bool)

(assert (=> b!137023 (=> res!114055 e!91016)))

(assert (=> b!137023 (= res!114055 (not (arrayRangesEq!215 (_2!6276 lt!213391) (_2!6276 lt!213381) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!213384 () tuple2!11906)

(assert (=> b!137023 (arrayRangesEq!215 (_2!6276 lt!213391) (_2!6276 lt!213384) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213388 () tuple2!11908)

(declare-fun lt!213380 () Unit!8571)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4888 array!6213 (_ BitVec 32) (_ BitVec 32)) Unit!8571)

(assert (=> b!137023 (= lt!213380 (readByteArrayLoopArrayPrefixLemma!0 (_1!6277 lt!213388) arr!237 from!447 to!404))))

(declare-fun lt!213374 () array!6213)

(declare-fun withMovedByteIndex!0 (BitStream!4888 (_ BitVec 32)) BitStream!4888)

(assert (=> b!137023 (= lt!213384 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6277 lt!213388) #b00000000000000000000000000000001) lt!213374 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!213386 () tuple2!11908)

(assert (=> b!137023 (= lt!213381 (readByteArrayLoopPure!0 (_1!6277 lt!213386) lt!213374 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!213383 () tuple2!11912)

(assert (=> b!137023 (= lt!213374 (array!6214 (store (arr!3498 arr!237) from!447 (_2!6279 lt!213383)) (size!2812 arr!237)))))

(declare-fun lt!213376 () (_ BitVec 32))

(assert (=> b!137023 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2812 (buf!3219 (_2!6278 lt!213382)))) ((_ sign_extend 32) (currentByte!6026 (_2!6278 lt!213390))) ((_ sign_extend 32) (currentBit!6021 (_2!6278 lt!213390))) lt!213376)))

(declare-fun lt!213399 () Unit!8571)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4888 array!6213 (_ BitVec 32)) Unit!8571)

(assert (=> b!137023 (= lt!213399 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6278 lt!213390) (buf!3219 (_2!6278 lt!213382)) lt!213376))))

(assert (=> b!137023 (= (_1!6276 lt!213391) (_2!6277 lt!213388))))

(assert (=> b!137023 (= lt!213391 (readByteArrayLoopPure!0 (_1!6277 lt!213388) arr!237 from!447 to!404))))

(assert (=> b!137023 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2812 (buf!3219 (_2!6278 lt!213382)))) ((_ sign_extend 32) (currentByte!6026 thiss!1634)) ((_ sign_extend 32) (currentBit!6021 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!213373 () Unit!8571)

(assert (=> b!137023 (= lt!213373 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3219 (_2!6278 lt!213382)) (bvsub to!404 from!447)))))

(assert (=> b!137023 (= (_2!6279 lt!213383) (select (arr!3498 arr!237) from!447))))

(assert (=> b!137023 (= lt!213383 (readBytePure!0 (_1!6277 lt!213388)))))

(assert (=> b!137023 (= lt!213386 (reader!0 (_2!6278 lt!213390) (_2!6278 lt!213382)))))

(assert (=> b!137023 (= lt!213388 (reader!0 thiss!1634 (_2!6278 lt!213382)))))

(assert (=> b!137023 e!91019))

(declare-fun res!114053 () Bool)

(assert (=> b!137023 (=> (not res!114053) (not e!91019))))

(assert (=> b!137023 (= res!114053 (= (bitIndex!0 (size!2812 (buf!3219 (_1!6279 lt!213396))) (currentByte!6026 (_1!6279 lt!213396)) (currentBit!6021 (_1!6279 lt!213396))) (bitIndex!0 (size!2812 (buf!3219 (_1!6279 lt!213377))) (currentByte!6026 (_1!6279 lt!213377)) (currentBit!6021 (_1!6279 lt!213377)))))))

(declare-fun lt!213385 () Unit!8571)

(declare-fun lt!213395 () BitStream!4888)

(declare-fun readBytePrefixLemma!0 (BitStream!4888 BitStream!4888) Unit!8571)

(assert (=> b!137023 (= lt!213385 (readBytePrefixLemma!0 lt!213395 (_2!6278 lt!213382)))))

(assert (=> b!137023 (= lt!213377 (readBytePure!0 (BitStream!4889 (buf!3219 (_2!6278 lt!213382)) (currentByte!6026 thiss!1634) (currentBit!6021 thiss!1634))))))

(assert (=> b!137023 (= lt!213396 (readBytePure!0 lt!213395))))

(assert (=> b!137023 (= lt!213395 (BitStream!4889 (buf!3219 (_2!6278 lt!213390)) (currentByte!6026 thiss!1634) (currentBit!6021 thiss!1634)))))

(assert (=> b!137023 e!91020))

(declare-fun res!114062 () Bool)

(assert (=> b!137023 (=> (not res!114062) (not e!91020))))

(assert (=> b!137023 (= res!114062 (isPrefixOf!0 thiss!1634 (_2!6278 lt!213382)))))

(declare-fun lt!213379 () Unit!8571)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4888 BitStream!4888 BitStream!4888) Unit!8571)

(assert (=> b!137023 (= lt!213379 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6278 lt!213390) (_2!6278 lt!213382)))))

(assert (=> b!137023 e!91023))

(declare-fun res!114056 () Bool)

(assert (=> b!137023 (=> (not res!114056) (not e!91023))))

(assert (=> b!137023 (= res!114056 (= (size!2812 (buf!3219 (_2!6278 lt!213390))) (size!2812 (buf!3219 (_2!6278 lt!213382)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4888 array!6213 (_ BitVec 32) (_ BitVec 32)) tuple2!11910)

(assert (=> b!137023 (= lt!213382 (appendByteArrayLoop!0 (_2!6278 lt!213390) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!137023 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2812 (buf!3219 (_2!6278 lt!213390)))) ((_ sign_extend 32) (currentByte!6026 (_2!6278 lt!213390))) ((_ sign_extend 32) (currentBit!6021 (_2!6278 lt!213390))) lt!213376)))

(assert (=> b!137023 (= lt!213376 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!213392 () Unit!8571)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4888 BitStream!4888 (_ BitVec 64) (_ BitVec 32)) Unit!8571)

(assert (=> b!137023 (= lt!213392 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6278 lt!213390) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!137023 e!91022))

(declare-fun res!114050 () Bool)

(assert (=> b!137023 (=> (not res!114050) (not e!91022))))

(assert (=> b!137023 (= res!114050 (= (size!2812 (buf!3219 thiss!1634)) (size!2812 (buf!3219 (_2!6278 lt!213390)))))))

(declare-fun appendByte!0 (BitStream!4888 (_ BitVec 8)) tuple2!11910)

(assert (=> b!137023 (= lt!213390 (appendByte!0 thiss!1634 (select (arr!3498 arr!237) from!447)))))

(declare-fun b!137024 () Bool)

(declare-fun res!114052 () Bool)

(assert (=> b!137024 (=> (not res!114052) (not e!91013))))

(assert (=> b!137024 (= res!114052 (invariant!0 (currentBit!6021 thiss!1634) (currentByte!6026 thiss!1634) (size!2812 (buf!3219 thiss!1634))))))

(declare-fun b!137025 () Bool)

(declare-fun res!114054 () Bool)

(assert (=> b!137025 (=> (not res!114054) (not e!91017))))

(assert (=> b!137025 (= res!114054 (isPrefixOf!0 (_2!6278 lt!213390) (_2!6278 lt!213382)))))

(assert (= (and start!26704 res!114061) b!137013))

(assert (= (and b!137013 res!114051) b!137019))

(assert (= (and b!137019 res!114063) b!137024))

(assert (= (and b!137024 res!114052) b!137023))

(assert (= (and b!137023 res!114050) b!137021))

(assert (= (and b!137021 res!114060) b!137012))

(assert (= (and b!137012 res!114058) b!137022))

(assert (= (and b!137023 res!114056) b!137015))

(assert (= (and b!137015 res!114059) b!137025))

(assert (= (and b!137025 res!114054) b!137011))

(assert (= (and b!137011 (not res!114057)) b!137020))

(assert (= (and b!137023 res!114062) b!137014))

(assert (= (and b!137023 res!114053) b!137018))

(assert (= (and b!137023 (not res!114055)) b!137016))

(assert (= start!26704 b!137017))

(declare-fun m!210095 () Bool)

(assert (=> b!137024 m!210095))

(declare-fun m!210097 () Bool)

(assert (=> b!137014 m!210097))

(declare-fun m!210099 () Bool)

(assert (=> start!26704 m!210099))

(declare-fun m!210101 () Bool)

(assert (=> start!26704 m!210101))

(declare-fun m!210103 () Bool)

(assert (=> b!137021 m!210103))

(declare-fun m!210105 () Bool)

(assert (=> b!137021 m!210105))

(declare-fun m!210107 () Bool)

(assert (=> b!137022 m!210107))

(declare-fun m!210109 () Bool)

(assert (=> b!137022 m!210109))

(declare-fun m!210111 () Bool)

(assert (=> b!137022 m!210111))

(declare-fun m!210113 () Bool)

(assert (=> b!137023 m!210113))

(declare-fun m!210115 () Bool)

(assert (=> b!137023 m!210115))

(declare-fun m!210117 () Bool)

(assert (=> b!137023 m!210117))

(assert (=> b!137023 m!210115))

(declare-fun m!210119 () Bool)

(assert (=> b!137023 m!210119))

(declare-fun m!210121 () Bool)

(assert (=> b!137023 m!210121))

(declare-fun m!210123 () Bool)

(assert (=> b!137023 m!210123))

(declare-fun m!210125 () Bool)

(assert (=> b!137023 m!210125))

(declare-fun m!210127 () Bool)

(assert (=> b!137023 m!210127))

(declare-fun m!210129 () Bool)

(assert (=> b!137023 m!210129))

(declare-fun m!210131 () Bool)

(assert (=> b!137023 m!210131))

(declare-fun m!210133 () Bool)

(assert (=> b!137023 m!210133))

(declare-fun m!210135 () Bool)

(assert (=> b!137023 m!210135))

(declare-fun m!210137 () Bool)

(assert (=> b!137023 m!210137))

(assert (=> b!137023 m!210107))

(declare-fun m!210139 () Bool)

(assert (=> b!137023 m!210139))

(assert (=> b!137023 m!210107))

(declare-fun m!210141 () Bool)

(assert (=> b!137023 m!210141))

(declare-fun m!210143 () Bool)

(assert (=> b!137023 m!210143))

(declare-fun m!210145 () Bool)

(assert (=> b!137023 m!210145))

(declare-fun m!210147 () Bool)

(assert (=> b!137023 m!210147))

(declare-fun m!210149 () Bool)

(assert (=> b!137023 m!210149))

(declare-fun m!210151 () Bool)

(assert (=> b!137023 m!210151))

(declare-fun m!210153 () Bool)

(assert (=> b!137023 m!210153))

(declare-fun m!210155 () Bool)

(assert (=> b!137023 m!210155))

(declare-fun m!210157 () Bool)

(assert (=> b!137023 m!210157))

(declare-fun m!210159 () Bool)

(assert (=> b!137023 m!210159))

(declare-fun m!210161 () Bool)

(assert (=> b!137023 m!210161))

(declare-fun m!210163 () Bool)

(assert (=> b!137023 m!210163))

(declare-fun m!210165 () Bool)

(assert (=> b!137012 m!210165))

(declare-fun m!210167 () Bool)

(assert (=> b!137020 m!210167))

(declare-fun m!210169 () Bool)

(assert (=> b!137016 m!210169))

(declare-fun m!210171 () Bool)

(assert (=> b!137016 m!210171))

(declare-fun m!210173 () Bool)

(assert (=> b!137016 m!210173))

(declare-fun m!210175 () Bool)

(assert (=> b!137016 m!210175))

(declare-fun m!210177 () Bool)

(assert (=> b!137011 m!210177))

(declare-fun m!210179 () Bool)

(assert (=> b!137011 m!210179))

(declare-fun m!210181 () Bool)

(assert (=> b!137011 m!210181))

(assert (=> b!137011 m!210147))

(declare-fun m!210183 () Bool)

(assert (=> b!137025 m!210183))

(declare-fun m!210185 () Bool)

(assert (=> b!137017 m!210185))

(declare-fun m!210187 () Bool)

(assert (=> b!137013 m!210187))

(declare-fun m!210189 () Bool)

(assert (=> b!137015 m!210189))

(assert (=> b!137015 m!210103))

(push 1)

(assert (not b!137023))

(assert (not b!137016))

(assert (not b!137011))

(assert (not b!137014))

(assert (not b!137021))

(assert (not b!137020))

(assert (not b!137013))

(assert (not b!137024))

(assert (not b!137022))

(assert (not b!137017))

(assert (not start!26704))

(assert (not b!137015))

(assert (not b!137012))

(assert (not b!137025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

