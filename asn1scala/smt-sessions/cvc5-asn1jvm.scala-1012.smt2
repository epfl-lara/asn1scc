; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28776 () Bool)

(assert start!28776)

(declare-fun b!149396 () Bool)

(declare-fun e!99740 () Bool)

(declare-fun e!99733 () Bool)

(assert (=> b!149396 (= e!99740 (not e!99733))))

(declare-fun res!125142 () Bool)

(assert (=> b!149396 (=> res!125142 e!99733)))

(declare-datatypes ((array!6698 0))(
  ( (array!6699 (arr!3815 (Array (_ BitVec 32) (_ BitVec 8))) (size!3031 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5320 0))(
  ( (BitStream!5321 (buf!3506 array!6698) (currentByte!6420 (_ BitVec 32)) (currentBit!6415 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13326 0))(
  ( (tuple2!13327 (_1!7027 BitStream!5320) (_2!7027 BitStream!5320)) )
))
(declare-fun lt!233100 () tuple2!13326)

(declare-fun arr!237 () array!6698)

(declare-datatypes ((tuple2!13328 0))(
  ( (tuple2!13329 (_1!7028 BitStream!5320) (_2!7028 array!6698)) )
))
(declare-fun lt!233087 () tuple2!13328)

(assert (=> b!149396 (= res!125142 (or (not (= (size!3031 (_2!7028 lt!233087)) (size!3031 arr!237))) (not (= (_1!7028 lt!233087) (_2!7027 lt!233100)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5320 array!6698 (_ BitVec 32) (_ BitVec 32)) tuple2!13328)

(assert (=> b!149396 (= lt!233087 (readByteArrayLoopPure!0 (_1!7027 lt!233100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!9453 0))(
  ( (Unit!9454) )
))
(declare-datatypes ((tuple2!13330 0))(
  ( (tuple2!13331 (_1!7029 Unit!9453) (_2!7029 BitStream!5320)) )
))
(declare-fun lt!233098 () tuple2!13330)

(declare-fun lt!233099 () tuple2!13330)

(declare-fun lt!233085 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149396 (validate_offset_bits!1 ((_ sign_extend 32) (size!3031 (buf!3506 (_2!7029 lt!233098)))) ((_ sign_extend 32) (currentByte!6420 (_2!7029 lt!233099))) ((_ sign_extend 32) (currentBit!6415 (_2!7029 lt!233099))) lt!233085)))

(declare-fun lt!233082 () Unit!9453)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5320 array!6698 (_ BitVec 64)) Unit!9453)

(assert (=> b!149396 (= lt!233082 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7029 lt!233099) (buf!3506 (_2!7029 lt!233098)) lt!233085))))

(declare-fun reader!0 (BitStream!5320 BitStream!5320) tuple2!13326)

(assert (=> b!149396 (= lt!233100 (reader!0 (_2!7029 lt!233099) (_2!7029 lt!233098)))))

(declare-fun b!149397 () Bool)

(declare-fun res!125132 () Bool)

(declare-fun e!99738 () Bool)

(assert (=> b!149397 (=> (not res!125132) (not e!99738))))

(declare-fun thiss!1634 () BitStream!5320)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149397 (= res!125132 (= (bitIndex!0 (size!3031 (buf!3506 (_2!7029 lt!233099))) (currentByte!6420 (_2!7029 lt!233099)) (currentBit!6415 (_2!7029 lt!233099))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3031 (buf!3506 thiss!1634)) (currentByte!6420 thiss!1634) (currentBit!6415 thiss!1634)))))))

(declare-fun b!149398 () Bool)

(declare-fun res!125141 () Bool)

(declare-fun e!99742 () Bool)

(assert (=> b!149398 (=> (not res!125141) (not e!99742))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149398 (= res!125141 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3031 (buf!3506 thiss!1634))) ((_ sign_extend 32) (currentByte!6420 thiss!1634)) ((_ sign_extend 32) (currentBit!6415 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149400 () Bool)

(declare-fun arrayRangesEq!347 (array!6698 array!6698 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149400 (= e!99733 (not (arrayRangesEq!347 arr!237 (_2!7028 lt!233087) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!149401 () Bool)

(declare-fun e!99739 () Bool)

(assert (=> b!149401 (= e!99742 (not e!99739))))

(declare-fun res!125130 () Bool)

(assert (=> b!149401 (=> res!125130 e!99739)))

(declare-fun lt!233101 () tuple2!13328)

(declare-fun lt!233095 () tuple2!13328)

(assert (=> b!149401 (= res!125130 (not (arrayRangesEq!347 (_2!7028 lt!233101) (_2!7028 lt!233095) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!233081 () tuple2!13328)

(assert (=> b!149401 (arrayRangesEq!347 (_2!7028 lt!233101) (_2!7028 lt!233081) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233093 () Unit!9453)

(declare-fun lt!233075 () tuple2!13326)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5320 array!6698 (_ BitVec 32) (_ BitVec 32)) Unit!9453)

(assert (=> b!149401 (= lt!233093 (readByteArrayLoopArrayPrefixLemma!0 (_1!7027 lt!233075) arr!237 from!447 to!404))))

(declare-fun lt!233096 () array!6698)

(declare-fun withMovedByteIndex!0 (BitStream!5320 (_ BitVec 32)) BitStream!5320)

(assert (=> b!149401 (= lt!233081 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7027 lt!233075) #b00000000000000000000000000000001) lt!233096 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233094 () tuple2!13326)

(assert (=> b!149401 (= lt!233095 (readByteArrayLoopPure!0 (_1!7027 lt!233094) lt!233096 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13332 0))(
  ( (tuple2!13333 (_1!7030 BitStream!5320) (_2!7030 (_ BitVec 8))) )
))
(declare-fun lt!233091 () tuple2!13332)

(assert (=> b!149401 (= lt!233096 (array!6699 (store (arr!3815 arr!237) from!447 (_2!7030 lt!233091)) (size!3031 arr!237)))))

(declare-fun lt!233089 () (_ BitVec 32))

(assert (=> b!149401 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3031 (buf!3506 (_2!7029 lt!233098)))) ((_ sign_extend 32) (currentByte!6420 (_2!7029 lt!233099))) ((_ sign_extend 32) (currentBit!6415 (_2!7029 lt!233099))) lt!233089)))

(declare-fun lt!233102 () Unit!9453)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5320 array!6698 (_ BitVec 32)) Unit!9453)

(assert (=> b!149401 (= lt!233102 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7029 lt!233099) (buf!3506 (_2!7029 lt!233098)) lt!233089))))

(assert (=> b!149401 (= (_1!7028 lt!233101) (_2!7027 lt!233075))))

(assert (=> b!149401 (= lt!233101 (readByteArrayLoopPure!0 (_1!7027 lt!233075) arr!237 from!447 to!404))))

(assert (=> b!149401 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3031 (buf!3506 (_2!7029 lt!233098)))) ((_ sign_extend 32) (currentByte!6420 thiss!1634)) ((_ sign_extend 32) (currentBit!6415 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!233090 () Unit!9453)

(assert (=> b!149401 (= lt!233090 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3506 (_2!7029 lt!233098)) (bvsub to!404 from!447)))))

(assert (=> b!149401 (= (_2!7030 lt!233091) (select (arr!3815 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5320) tuple2!13332)

(assert (=> b!149401 (= lt!233091 (readBytePure!0 (_1!7027 lt!233075)))))

(assert (=> b!149401 (= lt!233094 (reader!0 (_2!7029 lt!233099) (_2!7029 lt!233098)))))

(assert (=> b!149401 (= lt!233075 (reader!0 thiss!1634 (_2!7029 lt!233098)))))

(declare-fun e!99732 () Bool)

(assert (=> b!149401 e!99732))

(declare-fun res!125138 () Bool)

(assert (=> b!149401 (=> (not res!125138) (not e!99732))))

(declare-fun lt!233079 () tuple2!13332)

(declare-fun lt!233084 () tuple2!13332)

(assert (=> b!149401 (= res!125138 (= (bitIndex!0 (size!3031 (buf!3506 (_1!7030 lt!233079))) (currentByte!6420 (_1!7030 lt!233079)) (currentBit!6415 (_1!7030 lt!233079))) (bitIndex!0 (size!3031 (buf!3506 (_1!7030 lt!233084))) (currentByte!6420 (_1!7030 lt!233084)) (currentBit!6415 (_1!7030 lt!233084)))))))

(declare-fun lt!233078 () Unit!9453)

(declare-fun lt!233097 () BitStream!5320)

(declare-fun readBytePrefixLemma!0 (BitStream!5320 BitStream!5320) Unit!9453)

(assert (=> b!149401 (= lt!233078 (readBytePrefixLemma!0 lt!233097 (_2!7029 lt!233098)))))

(assert (=> b!149401 (= lt!233084 (readBytePure!0 (BitStream!5321 (buf!3506 (_2!7029 lt!233098)) (currentByte!6420 thiss!1634) (currentBit!6415 thiss!1634))))))

(assert (=> b!149401 (= lt!233079 (readBytePure!0 lt!233097))))

(assert (=> b!149401 (= lt!233097 (BitStream!5321 (buf!3506 (_2!7029 lt!233099)) (currentByte!6420 thiss!1634) (currentBit!6415 thiss!1634)))))

(declare-fun e!99737 () Bool)

(assert (=> b!149401 e!99737))

(declare-fun res!125133 () Bool)

(assert (=> b!149401 (=> (not res!125133) (not e!99737))))

(declare-fun isPrefixOf!0 (BitStream!5320 BitStream!5320) Bool)

(assert (=> b!149401 (= res!125133 (isPrefixOf!0 thiss!1634 (_2!7029 lt!233098)))))

(declare-fun lt!233077 () Unit!9453)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5320 BitStream!5320 BitStream!5320) Unit!9453)

(assert (=> b!149401 (= lt!233077 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7029 lt!233099) (_2!7029 lt!233098)))))

(declare-fun e!99741 () Bool)

(assert (=> b!149401 e!99741))

(declare-fun res!125134 () Bool)

(assert (=> b!149401 (=> (not res!125134) (not e!99741))))

(assert (=> b!149401 (= res!125134 (= (size!3031 (buf!3506 (_2!7029 lt!233099))) (size!3031 (buf!3506 (_2!7029 lt!233098)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5320 array!6698 (_ BitVec 32) (_ BitVec 32)) tuple2!13330)

(assert (=> b!149401 (= lt!233098 (appendByteArrayLoop!0 (_2!7029 lt!233099) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149401 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3031 (buf!3506 (_2!7029 lt!233099)))) ((_ sign_extend 32) (currentByte!6420 (_2!7029 lt!233099))) ((_ sign_extend 32) (currentBit!6415 (_2!7029 lt!233099))) lt!233089)))

(assert (=> b!149401 (= lt!233089 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!233086 () Unit!9453)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5320 BitStream!5320 (_ BitVec 64) (_ BitVec 32)) Unit!9453)

(assert (=> b!149401 (= lt!233086 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7029 lt!233099) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149401 e!99738))

(declare-fun res!125143 () Bool)

(assert (=> b!149401 (=> (not res!125143) (not e!99738))))

(assert (=> b!149401 (= res!125143 (= (size!3031 (buf!3506 thiss!1634)) (size!3031 (buf!3506 (_2!7029 lt!233099)))))))

(declare-fun appendByte!0 (BitStream!5320 (_ BitVec 8)) tuple2!13330)

(assert (=> b!149401 (= lt!233099 (appendByte!0 thiss!1634 (select (arr!3815 arr!237) from!447)))))

(declare-fun b!149402 () Bool)

(declare-fun res!125131 () Bool)

(assert (=> b!149402 (=> (not res!125131) (not e!99742))))

(assert (=> b!149402 (= res!125131 (bvslt from!447 to!404))))

(declare-fun b!149399 () Bool)

(declare-fun e!99731 () Bool)

(declare-fun array_inv!2820 (array!6698) Bool)

(assert (=> b!149399 (= e!99731 (array_inv!2820 (buf!3506 thiss!1634)))))

(declare-fun res!125144 () Bool)

(assert (=> start!28776 (=> (not res!125144) (not e!99742))))

(assert (=> start!28776 (= res!125144 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3031 arr!237))))))

(assert (=> start!28776 e!99742))

(assert (=> start!28776 true))

(assert (=> start!28776 (array_inv!2820 arr!237)))

(declare-fun inv!12 (BitStream!5320) Bool)

(assert (=> start!28776 (and (inv!12 thiss!1634) e!99731)))

(declare-fun b!149403 () Bool)

(declare-fun res!125139 () Bool)

(assert (=> b!149403 (=> (not res!125139) (not e!99738))))

(assert (=> b!149403 (= res!125139 (isPrefixOf!0 thiss!1634 (_2!7029 lt!233099)))))

(declare-fun b!149404 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149404 (= e!99737 (invariant!0 (currentBit!6415 thiss!1634) (currentByte!6420 thiss!1634) (size!3031 (buf!3506 (_2!7029 lt!233099)))))))

(declare-fun b!149405 () Bool)

(declare-fun res!125136 () Bool)

(assert (=> b!149405 (=> (not res!125136) (not e!99742))))

(assert (=> b!149405 (= res!125136 (invariant!0 (currentBit!6415 thiss!1634) (currentByte!6420 thiss!1634) (size!3031 (buf!3506 thiss!1634))))))

(declare-fun b!149406 () Bool)

(declare-fun res!125140 () Bool)

(assert (=> b!149406 (=> (not res!125140) (not e!99740))))

(assert (=> b!149406 (= res!125140 (isPrefixOf!0 (_2!7029 lt!233099) (_2!7029 lt!233098)))))

(declare-fun b!149407 () Bool)

(declare-fun e!99736 () Bool)

(assert (=> b!149407 (= e!99739 e!99736)))

(declare-fun res!125137 () Bool)

(assert (=> b!149407 (=> res!125137 e!99736)))

(assert (=> b!149407 (= res!125137 (not (= (size!3031 (buf!3506 thiss!1634)) (size!3031 (buf!3506 (_2!7029 lt!233098))))))))

(assert (=> b!149407 (arrayRangesEq!347 arr!237 (_2!7028 lt!233101) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233083 () Unit!9453)

(declare-fun arrayRangesEqTransitive!62 (array!6698 array!6698 array!6698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9453)

(assert (=> b!149407 (= lt!233083 (arrayRangesEqTransitive!62 arr!237 (_2!7028 lt!233095) (_2!7028 lt!233101) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!149407 (arrayRangesEq!347 (_2!7028 lt!233095) (_2!7028 lt!233101) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233092 () Unit!9453)

(declare-fun arrayRangesEqSymmetricLemma!79 (array!6698 array!6698 (_ BitVec 32) (_ BitVec 32)) Unit!9453)

(assert (=> b!149407 (= lt!233092 (arrayRangesEqSymmetricLemma!79 (_2!7028 lt!233101) (_2!7028 lt!233095) #b00000000000000000000000000000000 to!404))))

(declare-fun lt!233088 () tuple2!13326)

(declare-fun lt!233103 () tuple2!13332)

(declare-fun b!149408 () Bool)

(assert (=> b!149408 (= e!99738 (and (= (_2!7030 lt!233103) (select (arr!3815 arr!237) from!447)) (= (_1!7030 lt!233103) (_2!7027 lt!233088))))))

(assert (=> b!149408 (= lt!233103 (readBytePure!0 (_1!7027 lt!233088)))))

(assert (=> b!149408 (= lt!233088 (reader!0 thiss!1634 (_2!7029 lt!233099)))))

(declare-fun b!149409 () Bool)

(assert (=> b!149409 (= e!99741 e!99740)))

(declare-fun res!125135 () Bool)

(assert (=> b!149409 (=> (not res!125135) (not e!99740))))

(assert (=> b!149409 (= res!125135 (= (bitIndex!0 (size!3031 (buf!3506 (_2!7029 lt!233098))) (currentByte!6420 (_2!7029 lt!233098)) (currentBit!6415 (_2!7029 lt!233098))) (bvadd (bitIndex!0 (size!3031 (buf!3506 (_2!7029 lt!233099))) (currentByte!6420 (_2!7029 lt!233099)) (currentBit!6415 (_2!7029 lt!233099))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!233085))))))

(assert (=> b!149409 (= lt!233085 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!149410 () Bool)

(assert (=> b!149410 (= e!99732 (= (_2!7030 lt!233079) (_2!7030 lt!233084)))))

(declare-fun b!149411 () Bool)

(declare-fun lt!233076 () (_ BitVec 64))

(assert (=> b!149411 (= e!99736 (or (= lt!233076 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!233076) lt!233076))))))

(assert (=> b!149411 (= lt!233076 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun lt!233080 () (_ BitVec 64))

(assert (=> b!149411 (= lt!233080 (bitIndex!0 (size!3031 (buf!3506 thiss!1634)) (currentByte!6420 thiss!1634) (currentBit!6415 thiss!1634)))))

(assert (= (and start!28776 res!125144) b!149398))

(assert (= (and b!149398 res!125141) b!149402))

(assert (= (and b!149402 res!125131) b!149405))

(assert (= (and b!149405 res!125136) b!149401))

(assert (= (and b!149401 res!125143) b!149397))

(assert (= (and b!149397 res!125132) b!149403))

(assert (= (and b!149403 res!125139) b!149408))

(assert (= (and b!149401 res!125134) b!149409))

(assert (= (and b!149409 res!125135) b!149406))

(assert (= (and b!149406 res!125140) b!149396))

(assert (= (and b!149396 (not res!125142)) b!149400))

(assert (= (and b!149401 res!125133) b!149404))

(assert (= (and b!149401 res!125138) b!149410))

(assert (= (and b!149401 (not res!125130)) b!149407))

(assert (= (and b!149407 (not res!125137)) b!149411))

(assert (= start!28776 b!149399))

(declare-fun m!232431 () Bool)

(assert (=> b!149397 m!232431))

(declare-fun m!232433 () Bool)

(assert (=> b!149397 m!232433))

(declare-fun m!232435 () Bool)

(assert (=> b!149408 m!232435))

(declare-fun m!232437 () Bool)

(assert (=> b!149408 m!232437))

(declare-fun m!232439 () Bool)

(assert (=> b!149408 m!232439))

(declare-fun m!232441 () Bool)

(assert (=> b!149409 m!232441))

(assert (=> b!149409 m!232431))

(declare-fun m!232443 () Bool)

(assert (=> b!149401 m!232443))

(declare-fun m!232445 () Bool)

(assert (=> b!149401 m!232445))

(declare-fun m!232447 () Bool)

(assert (=> b!149401 m!232447))

(declare-fun m!232449 () Bool)

(assert (=> b!149401 m!232449))

(declare-fun m!232451 () Bool)

(assert (=> b!149401 m!232451))

(declare-fun m!232453 () Bool)

(assert (=> b!149401 m!232453))

(declare-fun m!232455 () Bool)

(assert (=> b!149401 m!232455))

(assert (=> b!149401 m!232443))

(declare-fun m!232457 () Bool)

(assert (=> b!149401 m!232457))

(declare-fun m!232459 () Bool)

(assert (=> b!149401 m!232459))

(declare-fun m!232461 () Bool)

(assert (=> b!149401 m!232461))

(declare-fun m!232463 () Bool)

(assert (=> b!149401 m!232463))

(declare-fun m!232465 () Bool)

(assert (=> b!149401 m!232465))

(declare-fun m!232467 () Bool)

(assert (=> b!149401 m!232467))

(declare-fun m!232469 () Bool)

(assert (=> b!149401 m!232469))

(declare-fun m!232471 () Bool)

(assert (=> b!149401 m!232471))

(declare-fun m!232473 () Bool)

(assert (=> b!149401 m!232473))

(declare-fun m!232475 () Bool)

(assert (=> b!149401 m!232475))

(declare-fun m!232477 () Bool)

(assert (=> b!149401 m!232477))

(declare-fun m!232479 () Bool)

(assert (=> b!149401 m!232479))

(assert (=> b!149401 m!232435))

(declare-fun m!232481 () Bool)

(assert (=> b!149401 m!232481))

(declare-fun m!232483 () Bool)

(assert (=> b!149401 m!232483))

(declare-fun m!232485 () Bool)

(assert (=> b!149401 m!232485))

(declare-fun m!232487 () Bool)

(assert (=> b!149401 m!232487))

(declare-fun m!232489 () Bool)

(assert (=> b!149401 m!232489))

(declare-fun m!232491 () Bool)

(assert (=> b!149401 m!232491))

(declare-fun m!232493 () Bool)

(assert (=> b!149401 m!232493))

(assert (=> b!149401 m!232435))

(declare-fun m!232495 () Bool)

(assert (=> b!149399 m!232495))

(assert (=> b!149411 m!232433))

(declare-fun m!232497 () Bool)

(assert (=> start!28776 m!232497))

(declare-fun m!232499 () Bool)

(assert (=> start!28776 m!232499))

(declare-fun m!232501 () Bool)

(assert (=> b!149400 m!232501))

(declare-fun m!232503 () Bool)

(assert (=> b!149404 m!232503))

(declare-fun m!232505 () Bool)

(assert (=> b!149403 m!232505))

(declare-fun m!232507 () Bool)

(assert (=> b!149407 m!232507))

(declare-fun m!232509 () Bool)

(assert (=> b!149407 m!232509))

(declare-fun m!232511 () Bool)

(assert (=> b!149407 m!232511))

(declare-fun m!232513 () Bool)

(assert (=> b!149407 m!232513))

(declare-fun m!232515 () Bool)

(assert (=> b!149405 m!232515))

(declare-fun m!232517 () Bool)

(assert (=> b!149406 m!232517))

(declare-fun m!232519 () Bool)

(assert (=> b!149396 m!232519))

(declare-fun m!232521 () Bool)

(assert (=> b!149396 m!232521))

(declare-fun m!232523 () Bool)

(assert (=> b!149396 m!232523))

(assert (=> b!149396 m!232485))

(declare-fun m!232525 () Bool)

(assert (=> b!149398 m!232525))

(push 1)

(assert (not b!149398))

(assert (not b!149404))

(assert (not b!149403))

(assert (not b!149399))

(assert (not b!149411))

(assert (not b!149405))

(assert (not b!149397))

(assert (not b!149408))

(assert (not b!149400))

(assert (not b!149407))

(assert (not b!149406))

(assert (not start!28776))

(assert (not b!149401))

(assert (not b!149396))

(assert (not b!149409))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

