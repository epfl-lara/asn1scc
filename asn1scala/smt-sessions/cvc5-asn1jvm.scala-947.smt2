; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26884 () Bool)

(assert start!26884)

(declare-fun b!138479 () Bool)

(declare-fun e!92087 () Bool)

(declare-fun e!92077 () Bool)

(assert (=> b!138479 (= e!92087 (not e!92077))))

(declare-fun res!115422 () Bool)

(assert (=> b!138479 (=> res!115422 e!92077)))

(declare-datatypes ((array!6264 0))(
  ( (array!6265 (arr!3531 (Array (_ BitVec 32) (_ BitVec 8))) (size!2836 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6264)

(declare-datatypes ((BitStream!4936 0))(
  ( (BitStream!4937 (buf!3249 array!6264) (currentByte!6062 (_ BitVec 32)) (currentBit!6057 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12104 0))(
  ( (tuple2!12105 (_1!6378 BitStream!4936) (_2!6378 BitStream!4936)) )
))
(declare-fun lt!216211 () tuple2!12104)

(declare-datatypes ((tuple2!12106 0))(
  ( (tuple2!12107 (_1!6379 BitStream!4936) (_2!6379 array!6264)) )
))
(declare-fun lt!216186 () tuple2!12106)

(assert (=> b!138479 (= res!115422 (or (not (= (size!2836 (_2!6379 lt!216186)) (size!2836 arr!237))) (not (= (_1!6379 lt!216186) (_2!6378 lt!216211)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4936 array!6264 (_ BitVec 32) (_ BitVec 32)) tuple2!12106)

(assert (=> b!138479 (= lt!216186 (readByteArrayLoopPure!0 (_1!6378 lt!216211) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8628 0))(
  ( (Unit!8629) )
))
(declare-datatypes ((tuple2!12108 0))(
  ( (tuple2!12109 (_1!6380 Unit!8628) (_2!6380 BitStream!4936)) )
))
(declare-fun lt!216196 () tuple2!12108)

(declare-fun lt!216209 () tuple2!12108)

(declare-fun lt!216205 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138479 (validate_offset_bits!1 ((_ sign_extend 32) (size!2836 (buf!3249 (_2!6380 lt!216196)))) ((_ sign_extend 32) (currentByte!6062 (_2!6380 lt!216209))) ((_ sign_extend 32) (currentBit!6057 (_2!6380 lt!216209))) lt!216205)))

(declare-fun lt!216190 () Unit!8628)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4936 array!6264 (_ BitVec 64)) Unit!8628)

(assert (=> b!138479 (= lt!216190 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6380 lt!216209) (buf!3249 (_2!6380 lt!216196)) lt!216205))))

(declare-fun reader!0 (BitStream!4936 BitStream!4936) tuple2!12104)

(assert (=> b!138479 (= lt!216211 (reader!0 (_2!6380 lt!216209) (_2!6380 lt!216196)))))

(declare-datatypes ((tuple2!12110 0))(
  ( (tuple2!12111 (_1!6381 BitStream!4936) (_2!6381 (_ BitVec 8))) )
))
(declare-fun lt!216198 () tuple2!12110)

(declare-fun e!92078 () Bool)

(declare-fun b!138480 () Bool)

(declare-fun lt!216199 () tuple2!12104)

(assert (=> b!138480 (= e!92078 (and (= (_2!6381 lt!216198) (select (arr!3531 arr!237) from!447)) (= (_1!6381 lt!216198) (_2!6378 lt!216199))))))

(declare-fun readBytePure!0 (BitStream!4936) tuple2!12110)

(assert (=> b!138480 (= lt!216198 (readBytePure!0 (_1!6378 lt!216199)))))

(declare-fun thiss!1634 () BitStream!4936)

(assert (=> b!138480 (= lt!216199 (reader!0 thiss!1634 (_2!6380 lt!216209)))))

(declare-fun b!138481 () Bool)

(declare-fun res!115418 () Bool)

(assert (=> b!138481 (=> (not res!115418) (not e!92078))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138481 (= res!115418 (= (bitIndex!0 (size!2836 (buf!3249 (_2!6380 lt!216209))) (currentByte!6062 (_2!6380 lt!216209)) (currentBit!6057 (_2!6380 lt!216209))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2836 (buf!3249 thiss!1634)) (currentByte!6062 thiss!1634) (currentBit!6057 thiss!1634)))))))

(declare-fun b!138482 () Bool)

(declare-fun res!115417 () Bool)

(assert (=> b!138482 (=> (not res!115417) (not e!92087))))

(declare-fun isPrefixOf!0 (BitStream!4936 BitStream!4936) Bool)

(assert (=> b!138482 (= res!115417 (isPrefixOf!0 (_2!6380 lt!216209) (_2!6380 lt!216196)))))

(declare-fun b!138483 () Bool)

(declare-fun res!115427 () Bool)

(assert (=> b!138483 (=> (not res!115427) (not e!92078))))

(assert (=> b!138483 (= res!115427 (isPrefixOf!0 thiss!1634 (_2!6380 lt!216209)))))

(declare-fun b!138484 () Bool)

(declare-fun e!92080 () Bool)

(declare-fun e!92084 () Bool)

(assert (=> b!138484 (= e!92080 e!92084)))

(declare-fun res!115419 () Bool)

(assert (=> b!138484 (=> res!115419 e!92084)))

(assert (=> b!138484 (= res!115419 (not (= (size!2836 (buf!3249 thiss!1634)) (size!2836 (buf!3249 (_2!6380 lt!216196))))))))

(declare-fun lt!216204 () tuple2!12106)

(declare-fun arrayRangesEq!239 (array!6264 array!6264 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138484 (arrayRangesEq!239 arr!237 (_2!6379 lt!216204) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216210 () Unit!8628)

(declare-fun lt!216201 () tuple2!12106)

(declare-fun arrayRangesEqTransitive!41 (array!6264 array!6264 array!6264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8628)

(assert (=> b!138484 (= lt!216210 (arrayRangesEqTransitive!41 arr!237 (_2!6379 lt!216201) (_2!6379 lt!216204) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!138484 (arrayRangesEq!239 (_2!6379 lt!216201) (_2!6379 lt!216204) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216208 () Unit!8628)

(declare-fun arrayRangesEqSymmetricLemma!52 (array!6264 array!6264 (_ BitVec 32) (_ BitVec 32)) Unit!8628)

(assert (=> b!138484 (= lt!216208 (arrayRangesEqSymmetricLemma!52 (_2!6379 lt!216204) (_2!6379 lt!216201) #b00000000000000000000000000000000 to!404))))

(declare-fun b!138485 () Bool)

(declare-fun e!92081 () Bool)

(assert (=> b!138485 (= e!92081 true)))

(declare-fun lt!216191 () (_ BitVec 64))

(assert (=> b!138485 (validate_offset_bits!1 ((_ sign_extend 32) (size!2836 (buf!3249 (_2!6380 lt!216196)))) ((_ sign_extend 32) (currentByte!6062 thiss!1634)) ((_ sign_extend 32) (currentBit!6057 thiss!1634)) lt!216191)))

(declare-fun lt!216202 () Unit!8628)

(assert (=> b!138485 (= lt!216202 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3249 (_2!6380 lt!216196)) lt!216191))))

(declare-fun b!138486 () Bool)

(declare-fun e!92082 () Bool)

(declare-fun array_inv!2625 (array!6264) Bool)

(assert (=> b!138486 (= e!92082 (array_inv!2625 (buf!3249 thiss!1634)))))

(declare-fun b!138487 () Bool)

(declare-fun e!92088 () Bool)

(assert (=> b!138487 (= e!92088 (not e!92080))))

(declare-fun res!115416 () Bool)

(assert (=> b!138487 (=> res!115416 e!92080)))

(assert (=> b!138487 (= res!115416 (not (arrayRangesEq!239 (_2!6379 lt!216204) (_2!6379 lt!216201) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!216200 () tuple2!12106)

(assert (=> b!138487 (arrayRangesEq!239 (_2!6379 lt!216204) (_2!6379 lt!216200) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216192 () Unit!8628)

(declare-fun lt!216207 () tuple2!12104)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4936 array!6264 (_ BitVec 32) (_ BitVec 32)) Unit!8628)

(assert (=> b!138487 (= lt!216192 (readByteArrayLoopArrayPrefixLemma!0 (_1!6378 lt!216207) arr!237 from!447 to!404))))

(declare-fun lt!216212 () array!6264)

(declare-fun withMovedByteIndex!0 (BitStream!4936 (_ BitVec 32)) BitStream!4936)

(assert (=> b!138487 (= lt!216200 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6378 lt!216207) #b00000000000000000000000000000001) lt!216212 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!216187 () tuple2!12104)

(assert (=> b!138487 (= lt!216201 (readByteArrayLoopPure!0 (_1!6378 lt!216187) lt!216212 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!216189 () tuple2!12110)

(assert (=> b!138487 (= lt!216212 (array!6265 (store (arr!3531 arr!237) from!447 (_2!6381 lt!216189)) (size!2836 arr!237)))))

(declare-fun lt!216188 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138487 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2836 (buf!3249 (_2!6380 lt!216196)))) ((_ sign_extend 32) (currentByte!6062 (_2!6380 lt!216209))) ((_ sign_extend 32) (currentBit!6057 (_2!6380 lt!216209))) lt!216188)))

(declare-fun lt!216213 () Unit!8628)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4936 array!6264 (_ BitVec 32)) Unit!8628)

(assert (=> b!138487 (= lt!216213 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6380 lt!216209) (buf!3249 (_2!6380 lt!216196)) lt!216188))))

(assert (=> b!138487 (= (_1!6379 lt!216204) (_2!6378 lt!216207))))

(assert (=> b!138487 (= lt!216204 (readByteArrayLoopPure!0 (_1!6378 lt!216207) arr!237 from!447 to!404))))

(assert (=> b!138487 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2836 (buf!3249 (_2!6380 lt!216196)))) ((_ sign_extend 32) (currentByte!6062 thiss!1634)) ((_ sign_extend 32) (currentBit!6057 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!216194 () Unit!8628)

(assert (=> b!138487 (= lt!216194 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3249 (_2!6380 lt!216196)) (bvsub to!404 from!447)))))

(assert (=> b!138487 (= (_2!6381 lt!216189) (select (arr!3531 arr!237) from!447))))

(assert (=> b!138487 (= lt!216189 (readBytePure!0 (_1!6378 lt!216207)))))

(assert (=> b!138487 (= lt!216187 (reader!0 (_2!6380 lt!216209) (_2!6380 lt!216196)))))

(assert (=> b!138487 (= lt!216207 (reader!0 thiss!1634 (_2!6380 lt!216196)))))

(declare-fun e!92083 () Bool)

(assert (=> b!138487 e!92083))

(declare-fun res!115426 () Bool)

(assert (=> b!138487 (=> (not res!115426) (not e!92083))))

(declare-fun lt!216195 () tuple2!12110)

(declare-fun lt!216193 () tuple2!12110)

(assert (=> b!138487 (= res!115426 (= (bitIndex!0 (size!2836 (buf!3249 (_1!6381 lt!216195))) (currentByte!6062 (_1!6381 lt!216195)) (currentBit!6057 (_1!6381 lt!216195))) (bitIndex!0 (size!2836 (buf!3249 (_1!6381 lt!216193))) (currentByte!6062 (_1!6381 lt!216193)) (currentBit!6057 (_1!6381 lt!216193)))))))

(declare-fun lt!216185 () Unit!8628)

(declare-fun lt!216197 () BitStream!4936)

(declare-fun readBytePrefixLemma!0 (BitStream!4936 BitStream!4936) Unit!8628)

(assert (=> b!138487 (= lt!216185 (readBytePrefixLemma!0 lt!216197 (_2!6380 lt!216196)))))

(assert (=> b!138487 (= lt!216193 (readBytePure!0 (BitStream!4937 (buf!3249 (_2!6380 lt!216196)) (currentByte!6062 thiss!1634) (currentBit!6057 thiss!1634))))))

(assert (=> b!138487 (= lt!216195 (readBytePure!0 lt!216197))))

(assert (=> b!138487 (= lt!216197 (BitStream!4937 (buf!3249 (_2!6380 lt!216209)) (currentByte!6062 thiss!1634) (currentBit!6057 thiss!1634)))))

(declare-fun e!92085 () Bool)

(assert (=> b!138487 e!92085))

(declare-fun res!115431 () Bool)

(assert (=> b!138487 (=> (not res!115431) (not e!92085))))

(assert (=> b!138487 (= res!115431 (isPrefixOf!0 thiss!1634 (_2!6380 lt!216196)))))

(declare-fun lt!216203 () Unit!8628)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4936 BitStream!4936 BitStream!4936) Unit!8628)

(assert (=> b!138487 (= lt!216203 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6380 lt!216209) (_2!6380 lt!216196)))))

(declare-fun e!92079 () Bool)

(assert (=> b!138487 e!92079))

(declare-fun res!115421 () Bool)

(assert (=> b!138487 (=> (not res!115421) (not e!92079))))

(assert (=> b!138487 (= res!115421 (= (size!2836 (buf!3249 (_2!6380 lt!216209))) (size!2836 (buf!3249 (_2!6380 lt!216196)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4936 array!6264 (_ BitVec 32) (_ BitVec 32)) tuple2!12108)

(assert (=> b!138487 (= lt!216196 (appendByteArrayLoop!0 (_2!6380 lt!216209) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!138487 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2836 (buf!3249 (_2!6380 lt!216209)))) ((_ sign_extend 32) (currentByte!6062 (_2!6380 lt!216209))) ((_ sign_extend 32) (currentBit!6057 (_2!6380 lt!216209))) lt!216188)))

(assert (=> b!138487 (= lt!216188 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!216206 () Unit!8628)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4936 BitStream!4936 (_ BitVec 64) (_ BitVec 32)) Unit!8628)

(assert (=> b!138487 (= lt!216206 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6380 lt!216209) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!138487 e!92078))

(declare-fun res!115430 () Bool)

(assert (=> b!138487 (=> (not res!115430) (not e!92078))))

(assert (=> b!138487 (= res!115430 (= (size!2836 (buf!3249 thiss!1634)) (size!2836 (buf!3249 (_2!6380 lt!216209)))))))

(declare-fun appendByte!0 (BitStream!4936 (_ BitVec 8)) tuple2!12108)

(assert (=> b!138487 (= lt!216209 (appendByte!0 thiss!1634 (select (arr!3531 arr!237) from!447)))))

(declare-fun b!138488 () Bool)

(declare-fun res!115428 () Bool)

(assert (=> b!138488 (=> (not res!115428) (not e!92088))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138488 (= res!115428 (invariant!0 (currentBit!6057 thiss!1634) (currentByte!6062 thiss!1634) (size!2836 (buf!3249 thiss!1634))))))

(declare-fun res!115423 () Bool)

(assert (=> start!26884 (=> (not res!115423) (not e!92088))))

(assert (=> start!26884 (= res!115423 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2836 arr!237))))))

(assert (=> start!26884 e!92088))

(assert (=> start!26884 true))

(assert (=> start!26884 (array_inv!2625 arr!237)))

(declare-fun inv!12 (BitStream!4936) Bool)

(assert (=> start!26884 (and (inv!12 thiss!1634) e!92082)))

(declare-fun b!138489 () Bool)

(assert (=> b!138489 (= e!92079 e!92087)))

(declare-fun res!115429 () Bool)

(assert (=> b!138489 (=> (not res!115429) (not e!92087))))

(assert (=> b!138489 (= res!115429 (= (bitIndex!0 (size!2836 (buf!3249 (_2!6380 lt!216196))) (currentByte!6062 (_2!6380 lt!216196)) (currentBit!6057 (_2!6380 lt!216196))) (bvadd (bitIndex!0 (size!2836 (buf!3249 (_2!6380 lt!216209))) (currentByte!6062 (_2!6380 lt!216209)) (currentBit!6057 (_2!6380 lt!216209))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216205))))))

(assert (=> b!138489 (= lt!216205 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!138490 () Bool)

(assert (=> b!138490 (= e!92077 (not (arrayRangesEq!239 arr!237 (_2!6379 lt!216186) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!138491 () Bool)

(assert (=> b!138491 (= e!92083 (= (_2!6381 lt!216195) (_2!6381 lt!216193)))))

(declare-fun b!138492 () Bool)

(declare-fun res!115425 () Bool)

(assert (=> b!138492 (=> (not res!115425) (not e!92088))))

(assert (=> b!138492 (= res!115425 (bvslt from!447 to!404))))

(declare-fun b!138493 () Bool)

(assert (=> b!138493 (= e!92084 e!92081)))

(declare-fun res!115420 () Bool)

(assert (=> b!138493 (=> res!115420 e!92081)))

(assert (=> b!138493 (= res!115420 (not (= (bitIndex!0 (size!2836 (buf!3249 (_2!6380 lt!216196))) (currentByte!6062 (_2!6380 lt!216196)) (currentBit!6057 (_2!6380 lt!216196))) (bvadd (bitIndex!0 (size!2836 (buf!3249 thiss!1634)) (currentByte!6062 thiss!1634) (currentBit!6057 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216191)))))))

(assert (=> b!138493 (= lt!216191 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!138494 () Bool)

(assert (=> b!138494 (= e!92085 (invariant!0 (currentBit!6057 thiss!1634) (currentByte!6062 thiss!1634) (size!2836 (buf!3249 (_2!6380 lt!216209)))))))

(declare-fun b!138495 () Bool)

(declare-fun res!115424 () Bool)

(assert (=> b!138495 (=> (not res!115424) (not e!92088))))

(assert (=> b!138495 (= res!115424 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2836 (buf!3249 thiss!1634))) ((_ sign_extend 32) (currentByte!6062 thiss!1634)) ((_ sign_extend 32) (currentBit!6057 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!26884 res!115423) b!138495))

(assert (= (and b!138495 res!115424) b!138492))

(assert (= (and b!138492 res!115425) b!138488))

(assert (= (and b!138488 res!115428) b!138487))

(assert (= (and b!138487 res!115430) b!138481))

(assert (= (and b!138481 res!115418) b!138483))

(assert (= (and b!138483 res!115427) b!138480))

(assert (= (and b!138487 res!115421) b!138489))

(assert (= (and b!138489 res!115429) b!138482))

(assert (= (and b!138482 res!115417) b!138479))

(assert (= (and b!138479 (not res!115422)) b!138490))

(assert (= (and b!138487 res!115431) b!138494))

(assert (= (and b!138487 res!115426) b!138491))

(assert (= (and b!138487 (not res!115416)) b!138484))

(assert (= (and b!138484 (not res!115419)) b!138493))

(assert (= (and b!138493 (not res!115420)) b!138485))

(assert (= start!26884 b!138486))

(declare-fun m!213071 () Bool)

(assert (=> b!138489 m!213071))

(declare-fun m!213073 () Bool)

(assert (=> b!138489 m!213073))

(declare-fun m!213075 () Bool)

(assert (=> b!138494 m!213075))

(assert (=> b!138493 m!213071))

(declare-fun m!213077 () Bool)

(assert (=> b!138493 m!213077))

(declare-fun m!213079 () Bool)

(assert (=> b!138479 m!213079))

(declare-fun m!213081 () Bool)

(assert (=> b!138479 m!213081))

(declare-fun m!213083 () Bool)

(assert (=> b!138479 m!213083))

(declare-fun m!213085 () Bool)

(assert (=> b!138479 m!213085))

(declare-fun m!213087 () Bool)

(assert (=> b!138482 m!213087))

(declare-fun m!213089 () Bool)

(assert (=> b!138484 m!213089))

(declare-fun m!213091 () Bool)

(assert (=> b!138484 m!213091))

(declare-fun m!213093 () Bool)

(assert (=> b!138484 m!213093))

(declare-fun m!213095 () Bool)

(assert (=> b!138484 m!213095))

(declare-fun m!213097 () Bool)

(assert (=> b!138487 m!213097))

(declare-fun m!213099 () Bool)

(assert (=> b!138487 m!213099))

(declare-fun m!213101 () Bool)

(assert (=> b!138487 m!213101))

(declare-fun m!213103 () Bool)

(assert (=> b!138487 m!213103))

(declare-fun m!213105 () Bool)

(assert (=> b!138487 m!213105))

(declare-fun m!213107 () Bool)

(assert (=> b!138487 m!213107))

(declare-fun m!213109 () Bool)

(assert (=> b!138487 m!213109))

(assert (=> b!138487 m!213099))

(declare-fun m!213111 () Bool)

(assert (=> b!138487 m!213111))

(declare-fun m!213113 () Bool)

(assert (=> b!138487 m!213113))

(declare-fun m!213115 () Bool)

(assert (=> b!138487 m!213115))

(declare-fun m!213117 () Bool)

(assert (=> b!138487 m!213117))

(declare-fun m!213119 () Bool)

(assert (=> b!138487 m!213119))

(declare-fun m!213121 () Bool)

(assert (=> b!138487 m!213121))

(assert (=> b!138487 m!213085))

(declare-fun m!213123 () Bool)

(assert (=> b!138487 m!213123))

(declare-fun m!213125 () Bool)

(assert (=> b!138487 m!213125))

(assert (=> b!138487 m!213123))

(declare-fun m!213127 () Bool)

(assert (=> b!138487 m!213127))

(declare-fun m!213129 () Bool)

(assert (=> b!138487 m!213129))

(declare-fun m!213131 () Bool)

(assert (=> b!138487 m!213131))

(declare-fun m!213133 () Bool)

(assert (=> b!138487 m!213133))

(declare-fun m!213135 () Bool)

(assert (=> b!138487 m!213135))

(declare-fun m!213137 () Bool)

(assert (=> b!138487 m!213137))

(declare-fun m!213139 () Bool)

(assert (=> b!138487 m!213139))

(declare-fun m!213141 () Bool)

(assert (=> b!138487 m!213141))

(declare-fun m!213143 () Bool)

(assert (=> b!138487 m!213143))

(declare-fun m!213145 () Bool)

(assert (=> b!138487 m!213145))

(declare-fun m!213147 () Bool)

(assert (=> b!138487 m!213147))

(declare-fun m!213149 () Bool)

(assert (=> b!138483 m!213149))

(declare-fun m!213151 () Bool)

(assert (=> b!138495 m!213151))

(declare-fun m!213153 () Bool)

(assert (=> b!138486 m!213153))

(declare-fun m!213155 () Bool)

(assert (=> b!138490 m!213155))

(declare-fun m!213157 () Bool)

(assert (=> b!138485 m!213157))

(declare-fun m!213159 () Bool)

(assert (=> b!138485 m!213159))

(declare-fun m!213161 () Bool)

(assert (=> b!138488 m!213161))

(assert (=> b!138480 m!213123))

(declare-fun m!213163 () Bool)

(assert (=> b!138480 m!213163))

(declare-fun m!213165 () Bool)

(assert (=> b!138480 m!213165))

(declare-fun m!213167 () Bool)

(assert (=> start!26884 m!213167))

(declare-fun m!213169 () Bool)

(assert (=> start!26884 m!213169))

(assert (=> b!138481 m!213073))

(assert (=> b!138481 m!213077))

(push 1)

(assert (not b!138494))

(assert (not b!138481))

(assert (not b!138485))

(assert (not b!138489))

(assert (not b!138479))

(assert (not b!138486))

(assert (not b!138483))

(assert (not b!138487))

(assert (not start!26884))

(assert (not b!138482))

(assert (not b!138484))

(assert (not b!138493))

(assert (not b!138488))

(assert (not b!138480))

(assert (not b!138495))

(assert (not b!138490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

