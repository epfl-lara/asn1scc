; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26882 () Bool)

(assert start!26882)

(declare-fun b!138428 () Bool)

(declare-fun e!92045 () Bool)

(declare-datatypes ((array!6262 0))(
  ( (array!6263 (arr!3530 (Array (_ BitVec 32) (_ BitVec 8))) (size!2835 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4934 0))(
  ( (BitStream!4935 (buf!3248 array!6262) (currentByte!6061 (_ BitVec 32)) (currentBit!6056 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4934)

(declare-fun array_inv!2624 (array!6262) Bool)

(assert (=> b!138428 (= e!92045 (array_inv!2624 (buf!3248 thiss!1634)))))

(declare-fun b!138429 () Bool)

(declare-fun e!92040 () Bool)

(declare-fun e!92037 () Bool)

(assert (=> b!138429 (= e!92040 (not e!92037))))

(declare-fun res!115381 () Bool)

(assert (=> b!138429 (=> res!115381 e!92037)))

(declare-datatypes ((tuple2!12096 0))(
  ( (tuple2!12097 (_1!6374 BitStream!4934) (_2!6374 array!6262)) )
))
(declare-fun lt!216106 () tuple2!12096)

(declare-fun arr!237 () array!6262)

(declare-datatypes ((tuple2!12098 0))(
  ( (tuple2!12099 (_1!6375 BitStream!4934) (_2!6375 BitStream!4934)) )
))
(declare-fun lt!216119 () tuple2!12098)

(assert (=> b!138429 (= res!115381 (or (not (= (size!2835 (_2!6374 lt!216106)) (size!2835 arr!237))) (not (= (_1!6374 lt!216106) (_2!6375 lt!216119)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4934 array!6262 (_ BitVec 32) (_ BitVec 32)) tuple2!12096)

(assert (=> b!138429 (= lt!216106 (readByteArrayLoopPure!0 (_1!6375 lt!216119) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8626 0))(
  ( (Unit!8627) )
))
(declare-datatypes ((tuple2!12100 0))(
  ( (tuple2!12101 (_1!6376 Unit!8626) (_2!6376 BitStream!4934)) )
))
(declare-fun lt!216111 () tuple2!12100)

(declare-fun lt!216103 () tuple2!12100)

(declare-fun lt!216109 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138429 (validate_offset_bits!1 ((_ sign_extend 32) (size!2835 (buf!3248 (_2!6376 lt!216111)))) ((_ sign_extend 32) (currentByte!6061 (_2!6376 lt!216103))) ((_ sign_extend 32) (currentBit!6056 (_2!6376 lt!216103))) lt!216109)))

(declare-fun lt!216098 () Unit!8626)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4934 array!6262 (_ BitVec 64)) Unit!8626)

(assert (=> b!138429 (= lt!216098 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6376 lt!216103) (buf!3248 (_2!6376 lt!216111)) lt!216109))))

(declare-fun reader!0 (BitStream!4934 BitStream!4934) tuple2!12098)

(assert (=> b!138429 (= lt!216119 (reader!0 (_2!6376 lt!216103) (_2!6376 lt!216111)))))

(declare-fun b!138430 () Bool)

(declare-fun e!92042 () Bool)

(declare-datatypes ((tuple2!12102 0))(
  ( (tuple2!12103 (_1!6377 BitStream!4934) (_2!6377 (_ BitVec 8))) )
))
(declare-fun lt!216122 () tuple2!12102)

(declare-fun lt!216108 () tuple2!12102)

(assert (=> b!138430 (= e!92042 (= (_2!6377 lt!216122) (_2!6377 lt!216108)))))

(declare-fun b!138431 () Bool)

(declare-fun e!92046 () Bool)

(declare-fun e!92039 () Bool)

(assert (=> b!138431 (= e!92046 e!92039)))

(declare-fun res!115368 () Bool)

(assert (=> b!138431 (=> res!115368 e!92039)))

(assert (=> b!138431 (= res!115368 (not (= (size!2835 (buf!3248 thiss!1634)) (size!2835 (buf!3248 (_2!6376 lt!216111))))))))

(declare-fun lt!216118 () tuple2!12096)

(declare-fun arrayRangesEq!238 (array!6262 array!6262 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138431 (arrayRangesEq!238 arr!237 (_2!6374 lt!216118) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216124 () Unit!8626)

(declare-fun lt!216116 () tuple2!12096)

(declare-fun arrayRangesEqTransitive!40 (array!6262 array!6262 array!6262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8626)

(assert (=> b!138431 (= lt!216124 (arrayRangesEqTransitive!40 arr!237 (_2!6374 lt!216116) (_2!6374 lt!216118) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!138431 (arrayRangesEq!238 (_2!6374 lt!216116) (_2!6374 lt!216118) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216112 () Unit!8626)

(declare-fun arrayRangesEqSymmetricLemma!51 (array!6262 array!6262 (_ BitVec 32) (_ BitVec 32)) Unit!8626)

(assert (=> b!138431 (= lt!216112 (arrayRangesEqSymmetricLemma!51 (_2!6374 lt!216118) (_2!6374 lt!216116) #b00000000000000000000000000000000 to!404))))

(declare-fun b!138432 () Bool)

(declare-fun res!115374 () Bool)

(declare-fun e!92047 () Bool)

(assert (=> b!138432 (=> (not res!115374) (not e!92047))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138432 (= res!115374 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2835 (buf!3248 thiss!1634))) ((_ sign_extend 32) (currentByte!6061 thiss!1634)) ((_ sign_extend 32) (currentBit!6056 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!115377 () Bool)

(assert (=> start!26882 (=> (not res!115377) (not e!92047))))

(assert (=> start!26882 (= res!115377 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2835 arr!237))))))

(assert (=> start!26882 e!92047))

(assert (=> start!26882 true))

(assert (=> start!26882 (array_inv!2624 arr!237)))

(declare-fun inv!12 (BitStream!4934) Bool)

(assert (=> start!26882 (and (inv!12 thiss!1634) e!92045)))

(declare-fun b!138433 () Bool)

(declare-fun e!92044 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138433 (= e!92044 (invariant!0 (currentBit!6056 thiss!1634) (currentByte!6061 thiss!1634) (size!2835 (buf!3248 (_2!6376 lt!216103)))))))

(declare-fun b!138434 () Bool)

(declare-fun res!115371 () Bool)

(declare-fun e!92038 () Bool)

(assert (=> b!138434 (=> (not res!115371) (not e!92038))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138434 (= res!115371 (= (bitIndex!0 (size!2835 (buf!3248 (_2!6376 lt!216103))) (currentByte!6061 (_2!6376 lt!216103)) (currentBit!6056 (_2!6376 lt!216103))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2835 (buf!3248 thiss!1634)) (currentByte!6061 thiss!1634) (currentBit!6056 thiss!1634)))))))

(declare-fun b!138435 () Bool)

(declare-fun res!115383 () Bool)

(assert (=> b!138435 (=> (not res!115383) (not e!92047))))

(assert (=> b!138435 (= res!115383 (bvslt from!447 to!404))))

(declare-fun b!138436 () Bool)

(declare-fun res!115375 () Bool)

(assert (=> b!138436 (=> (not res!115375) (not e!92038))))

(declare-fun isPrefixOf!0 (BitStream!4934 BitStream!4934) Bool)

(assert (=> b!138436 (= res!115375 (isPrefixOf!0 thiss!1634 (_2!6376 lt!216103)))))

(declare-fun b!138437 () Bool)

(declare-fun res!115370 () Bool)

(assert (=> b!138437 (=> (not res!115370) (not e!92040))))

(assert (=> b!138437 (= res!115370 (isPrefixOf!0 (_2!6376 lt!216103) (_2!6376 lt!216111)))))

(declare-fun b!138438 () Bool)

(assert (=> b!138438 (= e!92047 (not e!92046))))

(declare-fun res!115373 () Bool)

(assert (=> b!138438 (=> res!115373 e!92046)))

(assert (=> b!138438 (= res!115373 (not (arrayRangesEq!238 (_2!6374 lt!216118) (_2!6374 lt!216116) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!216125 () tuple2!12096)

(assert (=> b!138438 (arrayRangesEq!238 (_2!6374 lt!216118) (_2!6374 lt!216125) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216104 () tuple2!12098)

(declare-fun lt!216117 () Unit!8626)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4934 array!6262 (_ BitVec 32) (_ BitVec 32)) Unit!8626)

(assert (=> b!138438 (= lt!216117 (readByteArrayLoopArrayPrefixLemma!0 (_1!6375 lt!216104) arr!237 from!447 to!404))))

(declare-fun lt!216110 () array!6262)

(declare-fun withMovedByteIndex!0 (BitStream!4934 (_ BitVec 32)) BitStream!4934)

(assert (=> b!138438 (= lt!216125 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6375 lt!216104) #b00000000000000000000000000000001) lt!216110 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!216107 () tuple2!12098)

(assert (=> b!138438 (= lt!216116 (readByteArrayLoopPure!0 (_1!6375 lt!216107) lt!216110 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!216113 () tuple2!12102)

(assert (=> b!138438 (= lt!216110 (array!6263 (store (arr!3530 arr!237) from!447 (_2!6377 lt!216113)) (size!2835 arr!237)))))

(declare-fun lt!216105 () (_ BitVec 32))

(assert (=> b!138438 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2835 (buf!3248 (_2!6376 lt!216111)))) ((_ sign_extend 32) (currentByte!6061 (_2!6376 lt!216103))) ((_ sign_extend 32) (currentBit!6056 (_2!6376 lt!216103))) lt!216105)))

(declare-fun lt!216123 () Unit!8626)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4934 array!6262 (_ BitVec 32)) Unit!8626)

(assert (=> b!138438 (= lt!216123 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6376 lt!216103) (buf!3248 (_2!6376 lt!216111)) lt!216105))))

(assert (=> b!138438 (= (_1!6374 lt!216118) (_2!6375 lt!216104))))

(assert (=> b!138438 (= lt!216118 (readByteArrayLoopPure!0 (_1!6375 lt!216104) arr!237 from!447 to!404))))

(assert (=> b!138438 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2835 (buf!3248 (_2!6376 lt!216111)))) ((_ sign_extend 32) (currentByte!6061 thiss!1634)) ((_ sign_extend 32) (currentBit!6056 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!216101 () Unit!8626)

(assert (=> b!138438 (= lt!216101 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3248 (_2!6376 lt!216111)) (bvsub to!404 from!447)))))

(assert (=> b!138438 (= (_2!6377 lt!216113) (select (arr!3530 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4934) tuple2!12102)

(assert (=> b!138438 (= lt!216113 (readBytePure!0 (_1!6375 lt!216104)))))

(assert (=> b!138438 (= lt!216107 (reader!0 (_2!6376 lt!216103) (_2!6376 lt!216111)))))

(assert (=> b!138438 (= lt!216104 (reader!0 thiss!1634 (_2!6376 lt!216111)))))

(assert (=> b!138438 e!92042))

(declare-fun res!115372 () Bool)

(assert (=> b!138438 (=> (not res!115372) (not e!92042))))

(assert (=> b!138438 (= res!115372 (= (bitIndex!0 (size!2835 (buf!3248 (_1!6377 lt!216122))) (currentByte!6061 (_1!6377 lt!216122)) (currentBit!6056 (_1!6377 lt!216122))) (bitIndex!0 (size!2835 (buf!3248 (_1!6377 lt!216108))) (currentByte!6061 (_1!6377 lt!216108)) (currentBit!6056 (_1!6377 lt!216108)))))))

(declare-fun lt!216100 () Unit!8626)

(declare-fun lt!216115 () BitStream!4934)

(declare-fun readBytePrefixLemma!0 (BitStream!4934 BitStream!4934) Unit!8626)

(assert (=> b!138438 (= lt!216100 (readBytePrefixLemma!0 lt!216115 (_2!6376 lt!216111)))))

(assert (=> b!138438 (= lt!216108 (readBytePure!0 (BitStream!4935 (buf!3248 (_2!6376 lt!216111)) (currentByte!6061 thiss!1634) (currentBit!6056 thiss!1634))))))

(assert (=> b!138438 (= lt!216122 (readBytePure!0 lt!216115))))

(assert (=> b!138438 (= lt!216115 (BitStream!4935 (buf!3248 (_2!6376 lt!216103)) (currentByte!6061 thiss!1634) (currentBit!6056 thiss!1634)))))

(assert (=> b!138438 e!92044))

(declare-fun res!115379 () Bool)

(assert (=> b!138438 (=> (not res!115379) (not e!92044))))

(assert (=> b!138438 (= res!115379 (isPrefixOf!0 thiss!1634 (_2!6376 lt!216111)))))

(declare-fun lt!216121 () Unit!8626)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4934 BitStream!4934 BitStream!4934) Unit!8626)

(assert (=> b!138438 (= lt!216121 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6376 lt!216103) (_2!6376 lt!216111)))))

(declare-fun e!92048 () Bool)

(assert (=> b!138438 e!92048))

(declare-fun res!115378 () Bool)

(assert (=> b!138438 (=> (not res!115378) (not e!92048))))

(assert (=> b!138438 (= res!115378 (= (size!2835 (buf!3248 (_2!6376 lt!216103))) (size!2835 (buf!3248 (_2!6376 lt!216111)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4934 array!6262 (_ BitVec 32) (_ BitVec 32)) tuple2!12100)

(assert (=> b!138438 (= lt!216111 (appendByteArrayLoop!0 (_2!6376 lt!216103) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!138438 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2835 (buf!3248 (_2!6376 lt!216103)))) ((_ sign_extend 32) (currentByte!6061 (_2!6376 lt!216103))) ((_ sign_extend 32) (currentBit!6056 (_2!6376 lt!216103))) lt!216105)))

(assert (=> b!138438 (= lt!216105 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!216102 () Unit!8626)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4934 BitStream!4934 (_ BitVec 64) (_ BitVec 32)) Unit!8626)

(assert (=> b!138438 (= lt!216102 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6376 lt!216103) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!138438 e!92038))

(declare-fun res!115382 () Bool)

(assert (=> b!138438 (=> (not res!115382) (not e!92038))))

(assert (=> b!138438 (= res!115382 (= (size!2835 (buf!3248 thiss!1634)) (size!2835 (buf!3248 (_2!6376 lt!216103)))))))

(declare-fun appendByte!0 (BitStream!4934 (_ BitVec 8)) tuple2!12100)

(assert (=> b!138438 (= lt!216103 (appendByte!0 thiss!1634 (select (arr!3530 arr!237) from!447)))))

(declare-fun b!138439 () Bool)

(assert (=> b!138439 (= e!92048 e!92040)))

(declare-fun res!115380 () Bool)

(assert (=> b!138439 (=> (not res!115380) (not e!92040))))

(assert (=> b!138439 (= res!115380 (= (bitIndex!0 (size!2835 (buf!3248 (_2!6376 lt!216111))) (currentByte!6061 (_2!6376 lt!216111)) (currentBit!6056 (_2!6376 lt!216111))) (bvadd (bitIndex!0 (size!2835 (buf!3248 (_2!6376 lt!216103))) (currentByte!6061 (_2!6376 lt!216103)) (currentBit!6056 (_2!6376 lt!216103))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216109))))))

(assert (=> b!138439 (= lt!216109 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!138440 () Bool)

(declare-fun e!92049 () Bool)

(assert (=> b!138440 (= e!92049 (or (not (= (size!2835 (_2!6374 lt!216118)) (size!2835 arr!237))) (bvsle #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!216099 () (_ BitVec 64))

(assert (=> b!138440 (validate_offset_bits!1 ((_ sign_extend 32) (size!2835 (buf!3248 (_2!6376 lt!216111)))) ((_ sign_extend 32) (currentByte!6061 thiss!1634)) ((_ sign_extend 32) (currentBit!6056 thiss!1634)) lt!216099)))

(declare-fun lt!216120 () Unit!8626)

(assert (=> b!138440 (= lt!216120 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3248 (_2!6376 lt!216111)) lt!216099))))

(declare-fun b!138441 () Bool)

(assert (=> b!138441 (= e!92037 (not (arrayRangesEq!238 arr!237 (_2!6374 lt!216106) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!138442 () Bool)

(assert (=> b!138442 (= e!92039 e!92049)))

(declare-fun res!115369 () Bool)

(assert (=> b!138442 (=> res!115369 e!92049)))

(assert (=> b!138442 (= res!115369 (not (= (bitIndex!0 (size!2835 (buf!3248 (_2!6376 lt!216111))) (currentByte!6061 (_2!6376 lt!216111)) (currentBit!6056 (_2!6376 lt!216111))) (bvadd (bitIndex!0 (size!2835 (buf!3248 thiss!1634)) (currentByte!6061 thiss!1634) (currentBit!6056 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216099)))))))

(assert (=> b!138442 (= lt!216099 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!138443 () Bool)

(declare-fun lt!216126 () tuple2!12102)

(declare-fun lt!216114 () tuple2!12098)

(assert (=> b!138443 (= e!92038 (and (= (_2!6377 lt!216126) (select (arr!3530 arr!237) from!447)) (= (_1!6377 lt!216126) (_2!6375 lt!216114))))))

(assert (=> b!138443 (= lt!216126 (readBytePure!0 (_1!6375 lt!216114)))))

(assert (=> b!138443 (= lt!216114 (reader!0 thiss!1634 (_2!6376 lt!216103)))))

(declare-fun b!138444 () Bool)

(declare-fun res!115376 () Bool)

(assert (=> b!138444 (=> (not res!115376) (not e!92047))))

(assert (=> b!138444 (= res!115376 (invariant!0 (currentBit!6056 thiss!1634) (currentByte!6061 thiss!1634) (size!2835 (buf!3248 thiss!1634))))))

(assert (= (and start!26882 res!115377) b!138432))

(assert (= (and b!138432 res!115374) b!138435))

(assert (= (and b!138435 res!115383) b!138444))

(assert (= (and b!138444 res!115376) b!138438))

(assert (= (and b!138438 res!115382) b!138434))

(assert (= (and b!138434 res!115371) b!138436))

(assert (= (and b!138436 res!115375) b!138443))

(assert (= (and b!138438 res!115378) b!138439))

(assert (= (and b!138439 res!115380) b!138437))

(assert (= (and b!138437 res!115370) b!138429))

(assert (= (and b!138429 (not res!115381)) b!138441))

(assert (= (and b!138438 res!115379) b!138433))

(assert (= (and b!138438 res!115372) b!138430))

(assert (= (and b!138438 (not res!115373)) b!138431))

(assert (= (and b!138431 (not res!115368)) b!138442))

(assert (= (and b!138442 (not res!115369)) b!138440))

(assert (= start!26882 b!138428))

(declare-fun m!212971 () Bool)

(assert (=> b!138441 m!212971))

(declare-fun m!212973 () Bool)

(assert (=> b!138437 m!212973))

(declare-fun m!212975 () Bool)

(assert (=> b!138443 m!212975))

(declare-fun m!212977 () Bool)

(assert (=> b!138443 m!212977))

(declare-fun m!212979 () Bool)

(assert (=> b!138443 m!212979))

(declare-fun m!212981 () Bool)

(assert (=> b!138428 m!212981))

(declare-fun m!212983 () Bool)

(assert (=> b!138431 m!212983))

(declare-fun m!212985 () Bool)

(assert (=> b!138431 m!212985))

(declare-fun m!212987 () Bool)

(assert (=> b!138431 m!212987))

(declare-fun m!212989 () Bool)

(assert (=> b!138431 m!212989))

(declare-fun m!212991 () Bool)

(assert (=> start!26882 m!212991))

(declare-fun m!212993 () Bool)

(assert (=> start!26882 m!212993))

(declare-fun m!212995 () Bool)

(assert (=> b!138439 m!212995))

(declare-fun m!212997 () Bool)

(assert (=> b!138439 m!212997))

(declare-fun m!212999 () Bool)

(assert (=> b!138436 m!212999))

(declare-fun m!213001 () Bool)

(assert (=> b!138432 m!213001))

(declare-fun m!213003 () Bool)

(assert (=> b!138444 m!213003))

(assert (=> b!138434 m!212997))

(declare-fun m!213005 () Bool)

(assert (=> b!138434 m!213005))

(assert (=> b!138442 m!212995))

(assert (=> b!138442 m!213005))

(declare-fun m!213007 () Bool)

(assert (=> b!138429 m!213007))

(declare-fun m!213009 () Bool)

(assert (=> b!138429 m!213009))

(declare-fun m!213011 () Bool)

(assert (=> b!138429 m!213011))

(declare-fun m!213013 () Bool)

(assert (=> b!138429 m!213013))

(declare-fun m!213015 () Bool)

(assert (=> b!138438 m!213015))

(declare-fun m!213017 () Bool)

(assert (=> b!138438 m!213017))

(declare-fun m!213019 () Bool)

(assert (=> b!138438 m!213019))

(declare-fun m!213021 () Bool)

(assert (=> b!138438 m!213021))

(declare-fun m!213023 () Bool)

(assert (=> b!138438 m!213023))

(declare-fun m!213025 () Bool)

(assert (=> b!138438 m!213025))

(declare-fun m!213027 () Bool)

(assert (=> b!138438 m!213027))

(declare-fun m!213029 () Bool)

(assert (=> b!138438 m!213029))

(declare-fun m!213031 () Bool)

(assert (=> b!138438 m!213031))

(declare-fun m!213033 () Bool)

(assert (=> b!138438 m!213033))

(declare-fun m!213035 () Bool)

(assert (=> b!138438 m!213035))

(declare-fun m!213037 () Bool)

(assert (=> b!138438 m!213037))

(declare-fun m!213039 () Bool)

(assert (=> b!138438 m!213039))

(declare-fun m!213041 () Bool)

(assert (=> b!138438 m!213041))

(assert (=> b!138438 m!213013))

(declare-fun m!213043 () Bool)

(assert (=> b!138438 m!213043))

(declare-fun m!213045 () Bool)

(assert (=> b!138438 m!213045))

(declare-fun m!213047 () Bool)

(assert (=> b!138438 m!213047))

(declare-fun m!213049 () Bool)

(assert (=> b!138438 m!213049))

(declare-fun m!213051 () Bool)

(assert (=> b!138438 m!213051))

(declare-fun m!213053 () Bool)

(assert (=> b!138438 m!213053))

(assert (=> b!138438 m!213039))

(declare-fun m!213055 () Bool)

(assert (=> b!138438 m!213055))

(declare-fun m!213057 () Bool)

(assert (=> b!138438 m!213057))

(assert (=> b!138438 m!212975))

(declare-fun m!213059 () Bool)

(assert (=> b!138438 m!213059))

(declare-fun m!213061 () Bool)

(assert (=> b!138438 m!213061))

(declare-fun m!213063 () Bool)

(assert (=> b!138438 m!213063))

(assert (=> b!138438 m!212975))

(declare-fun m!213065 () Bool)

(assert (=> b!138433 m!213065))

(declare-fun m!213067 () Bool)

(assert (=> b!138440 m!213067))

(declare-fun m!213069 () Bool)

(assert (=> b!138440 m!213069))

(push 1)

(assert (not b!138433))

(assert (not b!138431))

(assert (not b!138436))

(assert (not b!138438))

(assert (not b!138428))

(assert (not b!138434))

(assert (not b!138440))

(assert (not b!138437))

(assert (not b!138442))

(assert (not b!138432))

(assert (not b!138441))

(assert (not b!138444))

(assert (not start!26882))

(assert (not b!138429))

(assert (not b!138439))

(assert (not b!138443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

