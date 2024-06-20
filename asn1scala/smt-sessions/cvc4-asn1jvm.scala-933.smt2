; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26376 () Bool)

(assert start!26376)

(declare-fun res!112554 () Bool)

(declare-fun e!89840 () Bool)

(assert (=> start!26376 (=> (not res!112554) (not e!89840))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6176 0))(
  ( (array!6177 (arr!3461 (Array (_ BitVec 32) (_ BitVec 8))) (size!2796 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6176)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!26376 (= res!112554 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2796 arr!237))))))

(assert (=> start!26376 e!89840))

(assert (=> start!26376 true))

(declare-fun array_inv!2585 (array!6176) Bool)

(assert (=> start!26376 (array_inv!2585 arr!237)))

(declare-datatypes ((BitStream!4856 0))(
  ( (BitStream!4857 (buf!3189 array!6176) (currentByte!5986 (_ BitVec 32)) (currentBit!5981 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4856)

(declare-fun e!89846 () Bool)

(declare-fun inv!12 (BitStream!4856) Bool)

(assert (=> start!26376 (and (inv!12 thiss!1634) e!89846)))

(declare-fun b!135336 () Bool)

(declare-fun e!89845 () Bool)

(declare-fun e!89843 () Bool)

(assert (=> b!135336 (= e!89845 (not e!89843))))

(declare-fun res!112553 () Bool)

(assert (=> b!135336 (=> res!112553 e!89843)))

(declare-datatypes ((tuple2!11764 0))(
  ( (tuple2!11765 (_1!6198 BitStream!4856) (_2!6198 array!6176)) )
))
(declare-fun lt!210071 () tuple2!11764)

(declare-datatypes ((tuple2!11766 0))(
  ( (tuple2!11767 (_1!6199 BitStream!4856) (_2!6199 BitStream!4856)) )
))
(declare-fun lt!210061 () tuple2!11766)

(assert (=> b!135336 (= res!112553 (or (not (= (size!2796 (_2!6198 lt!210071)) (size!2796 arr!237))) (not (= (_1!6198 lt!210071) (_2!6199 lt!210061)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4856 array!6176 (_ BitVec 32) (_ BitVec 32)) tuple2!11764)

(assert (=> b!135336 (= lt!210071 (readByteArrayLoopPure!0 (_1!6199 lt!210061) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8430 0))(
  ( (Unit!8431) )
))
(declare-datatypes ((tuple2!11768 0))(
  ( (tuple2!11769 (_1!6200 Unit!8430) (_2!6200 BitStream!4856)) )
))
(declare-fun lt!210065 () tuple2!11768)

(declare-fun lt!210059 () tuple2!11768)

(declare-fun lt!210051 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135336 (validate_offset_bits!1 ((_ sign_extend 32) (size!2796 (buf!3189 (_2!6200 lt!210065)))) ((_ sign_extend 32) (currentByte!5986 (_2!6200 lt!210059))) ((_ sign_extend 32) (currentBit!5981 (_2!6200 lt!210059))) lt!210051)))

(declare-fun lt!210058 () Unit!8430)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4856 array!6176 (_ BitVec 64)) Unit!8430)

(assert (=> b!135336 (= lt!210058 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6200 lt!210059) (buf!3189 (_2!6200 lt!210065)) lt!210051))))

(declare-fun reader!0 (BitStream!4856 BitStream!4856) tuple2!11766)

(assert (=> b!135336 (= lt!210061 (reader!0 (_2!6200 lt!210059) (_2!6200 lt!210065)))))

(declare-fun b!135337 () Bool)

(declare-fun e!89847 () Bool)

(assert (=> b!135337 (= e!89847 e!89845)))

(declare-fun res!112560 () Bool)

(assert (=> b!135337 (=> (not res!112560) (not e!89845))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135337 (= res!112560 (= (bitIndex!0 (size!2796 (buf!3189 (_2!6200 lt!210065))) (currentByte!5986 (_2!6200 lt!210065)) (currentBit!5981 (_2!6200 lt!210065))) (bvadd (bitIndex!0 (size!2796 (buf!3189 (_2!6200 lt!210059))) (currentByte!5986 (_2!6200 lt!210059)) (currentBit!5981 (_2!6200 lt!210059))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!210051))))))

(assert (=> b!135337 (= lt!210051 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135338 () Bool)

(declare-fun arrayRangesEq!199 (array!6176 array!6176 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135338 (= e!89843 (not (arrayRangesEq!199 arr!237 (_2!6198 lt!210071) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135339 () Bool)

(declare-fun res!112557 () Bool)

(assert (=> b!135339 (=> (not res!112557) (not e!89845))))

(declare-fun isPrefixOf!0 (BitStream!4856 BitStream!4856) Bool)

(assert (=> b!135339 (= res!112557 (isPrefixOf!0 (_2!6200 lt!210059) (_2!6200 lt!210065)))))

(declare-fun b!135340 () Bool)

(declare-fun e!89839 () Bool)

(declare-datatypes ((tuple2!11770 0))(
  ( (tuple2!11771 (_1!6201 BitStream!4856) (_2!6201 (_ BitVec 8))) )
))
(declare-fun lt!210069 () tuple2!11770)

(declare-fun lt!210070 () tuple2!11770)

(assert (=> b!135340 (= e!89839 (= (_2!6201 lt!210069) (_2!6201 lt!210070)))))

(declare-fun b!135341 () Bool)

(declare-fun res!112551 () Bool)

(assert (=> b!135341 (=> (not res!112551) (not e!89840))))

(assert (=> b!135341 (= res!112551 (bvslt from!447 to!404))))

(declare-fun b!135342 () Bool)

(declare-fun e!89837 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135342 (= e!89837 (invariant!0 (currentBit!5981 thiss!1634) (currentByte!5986 thiss!1634) (size!2796 (buf!3189 (_2!6200 lt!210059)))))))

(declare-fun b!135343 () Bool)

(declare-fun res!112555 () Bool)

(assert (=> b!135343 (=> (not res!112555) (not e!89840))))

(assert (=> b!135343 (= res!112555 (invariant!0 (currentBit!5981 thiss!1634) (currentByte!5986 thiss!1634) (size!2796 (buf!3189 thiss!1634))))))

(declare-fun b!135344 () Bool)

(declare-fun e!89841 () Bool)

(assert (=> b!135344 (= e!89840 (not e!89841))))

(declare-fun res!112558 () Bool)

(assert (=> b!135344 (=> res!112558 e!89841)))

(declare-fun lt!210053 () tuple2!11764)

(declare-fun lt!210054 () tuple2!11764)

(assert (=> b!135344 (= res!112558 (not (arrayRangesEq!199 (_2!6198 lt!210053) (_2!6198 lt!210054) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!210056 () tuple2!11764)

(assert (=> b!135344 (arrayRangesEq!199 (_2!6198 lt!210053) (_2!6198 lt!210056) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210068 () Unit!8430)

(declare-fun lt!210062 () tuple2!11766)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4856 array!6176 (_ BitVec 32) (_ BitVec 32)) Unit!8430)

(assert (=> b!135344 (= lt!210068 (readByteArrayLoopArrayPrefixLemma!0 (_1!6199 lt!210062) arr!237 from!447 to!404))))

(declare-fun lt!210060 () array!6176)

(declare-fun withMovedByteIndex!0 (BitStream!4856 (_ BitVec 32)) BitStream!4856)

(assert (=> b!135344 (= lt!210056 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6199 lt!210062) #b00000000000000000000000000000001) lt!210060 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210073 () tuple2!11766)

(assert (=> b!135344 (= lt!210054 (readByteArrayLoopPure!0 (_1!6199 lt!210073) lt!210060 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210052 () tuple2!11770)

(assert (=> b!135344 (= lt!210060 (array!6177 (store (arr!3461 arr!237) from!447 (_2!6201 lt!210052)) (size!2796 arr!237)))))

(declare-fun lt!210057 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135344 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2796 (buf!3189 (_2!6200 lt!210065)))) ((_ sign_extend 32) (currentByte!5986 (_2!6200 lt!210059))) ((_ sign_extend 32) (currentBit!5981 (_2!6200 lt!210059))) lt!210057)))

(declare-fun lt!210063 () Unit!8430)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4856 array!6176 (_ BitVec 32)) Unit!8430)

(assert (=> b!135344 (= lt!210063 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6200 lt!210059) (buf!3189 (_2!6200 lt!210065)) lt!210057))))

(assert (=> b!135344 (= (_1!6198 lt!210053) (_2!6199 lt!210062))))

(assert (=> b!135344 (= lt!210053 (readByteArrayLoopPure!0 (_1!6199 lt!210062) arr!237 from!447 to!404))))

(assert (=> b!135344 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2796 (buf!3189 (_2!6200 lt!210065)))) ((_ sign_extend 32) (currentByte!5986 thiss!1634)) ((_ sign_extend 32) (currentBit!5981 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!210049 () Unit!8430)

(assert (=> b!135344 (= lt!210049 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3189 (_2!6200 lt!210065)) (bvsub to!404 from!447)))))

(assert (=> b!135344 (= (_2!6201 lt!210052) (select (arr!3461 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4856) tuple2!11770)

(assert (=> b!135344 (= lt!210052 (readBytePure!0 (_1!6199 lt!210062)))))

(assert (=> b!135344 (= lt!210073 (reader!0 (_2!6200 lt!210059) (_2!6200 lt!210065)))))

(assert (=> b!135344 (= lt!210062 (reader!0 thiss!1634 (_2!6200 lt!210065)))))

(assert (=> b!135344 e!89839))

(declare-fun res!112548 () Bool)

(assert (=> b!135344 (=> (not res!112548) (not e!89839))))

(assert (=> b!135344 (= res!112548 (= (bitIndex!0 (size!2796 (buf!3189 (_1!6201 lt!210069))) (currentByte!5986 (_1!6201 lt!210069)) (currentBit!5981 (_1!6201 lt!210069))) (bitIndex!0 (size!2796 (buf!3189 (_1!6201 lt!210070))) (currentByte!5986 (_1!6201 lt!210070)) (currentBit!5981 (_1!6201 lt!210070)))))))

(declare-fun lt!210067 () Unit!8430)

(declare-fun lt!210048 () BitStream!4856)

(declare-fun readBytePrefixLemma!0 (BitStream!4856 BitStream!4856) Unit!8430)

(assert (=> b!135344 (= lt!210067 (readBytePrefixLemma!0 lt!210048 (_2!6200 lt!210065)))))

(assert (=> b!135344 (= lt!210070 (readBytePure!0 (BitStream!4857 (buf!3189 (_2!6200 lt!210065)) (currentByte!5986 thiss!1634) (currentBit!5981 thiss!1634))))))

(assert (=> b!135344 (= lt!210069 (readBytePure!0 lt!210048))))

(assert (=> b!135344 (= lt!210048 (BitStream!4857 (buf!3189 (_2!6200 lt!210059)) (currentByte!5986 thiss!1634) (currentBit!5981 thiss!1634)))))

(assert (=> b!135344 e!89837))

(declare-fun res!112547 () Bool)

(assert (=> b!135344 (=> (not res!112547) (not e!89837))))

(assert (=> b!135344 (= res!112547 (isPrefixOf!0 thiss!1634 (_2!6200 lt!210065)))))

(declare-fun lt!210064 () Unit!8430)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4856 BitStream!4856 BitStream!4856) Unit!8430)

(assert (=> b!135344 (= lt!210064 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6200 lt!210059) (_2!6200 lt!210065)))))

(assert (=> b!135344 e!89847))

(declare-fun res!112549 () Bool)

(assert (=> b!135344 (=> (not res!112549) (not e!89847))))

(assert (=> b!135344 (= res!112549 (= (size!2796 (buf!3189 (_2!6200 lt!210059))) (size!2796 (buf!3189 (_2!6200 lt!210065)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4856 array!6176 (_ BitVec 32) (_ BitVec 32)) tuple2!11768)

(assert (=> b!135344 (= lt!210065 (appendByteArrayLoop!0 (_2!6200 lt!210059) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135344 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2796 (buf!3189 (_2!6200 lt!210059)))) ((_ sign_extend 32) (currentByte!5986 (_2!6200 lt!210059))) ((_ sign_extend 32) (currentBit!5981 (_2!6200 lt!210059))) lt!210057)))

(assert (=> b!135344 (= lt!210057 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!210055 () Unit!8430)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4856 BitStream!4856 (_ BitVec 64) (_ BitVec 32)) Unit!8430)

(assert (=> b!135344 (= lt!210055 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6200 lt!210059) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!89844 () Bool)

(assert (=> b!135344 e!89844))

(declare-fun res!112550 () Bool)

(assert (=> b!135344 (=> (not res!112550) (not e!89844))))

(assert (=> b!135344 (= res!112550 (= (size!2796 (buf!3189 thiss!1634)) (size!2796 (buf!3189 (_2!6200 lt!210059)))))))

(declare-fun appendByte!0 (BitStream!4856 (_ BitVec 8)) tuple2!11768)

(assert (=> b!135344 (= lt!210059 (appendByte!0 thiss!1634 (select (arr!3461 arr!237) from!447)))))

(declare-fun b!135345 () Bool)

(assert (=> b!135345 (= e!89841 true)))

(assert (=> b!135345 (arrayRangesEq!199 (_2!6198 lt!210054) (_2!6198 lt!210053) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210050 () Unit!8430)

(declare-fun arrayRangesEqSymmetricLemma!12 (array!6176 array!6176 (_ BitVec 32) (_ BitVec 32)) Unit!8430)

(assert (=> b!135345 (= lt!210050 (arrayRangesEqSymmetricLemma!12 (_2!6198 lt!210053) (_2!6198 lt!210054) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135346 () Bool)

(declare-fun res!112556 () Bool)

(assert (=> b!135346 (=> (not res!112556) (not e!89844))))

(assert (=> b!135346 (= res!112556 (isPrefixOf!0 thiss!1634 (_2!6200 lt!210059)))))

(declare-fun b!135347 () Bool)

(declare-fun res!112559 () Bool)

(assert (=> b!135347 (=> (not res!112559) (not e!89840))))

(assert (=> b!135347 (= res!112559 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2796 (buf!3189 thiss!1634))) ((_ sign_extend 32) (currentByte!5986 thiss!1634)) ((_ sign_extend 32) (currentBit!5981 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135348 () Bool)

(declare-fun lt!210072 () tuple2!11766)

(declare-fun lt!210066 () tuple2!11770)

(assert (=> b!135348 (= e!89844 (and (= (_2!6201 lt!210066) (select (arr!3461 arr!237) from!447)) (= (_1!6201 lt!210066) (_2!6199 lt!210072))))))

(assert (=> b!135348 (= lt!210066 (readBytePure!0 (_1!6199 lt!210072)))))

(assert (=> b!135348 (= lt!210072 (reader!0 thiss!1634 (_2!6200 lt!210059)))))

(declare-fun b!135349 () Bool)

(assert (=> b!135349 (= e!89846 (array_inv!2585 (buf!3189 thiss!1634)))))

(declare-fun b!135350 () Bool)

(declare-fun res!112552 () Bool)

(assert (=> b!135350 (=> (not res!112552) (not e!89844))))

(assert (=> b!135350 (= res!112552 (= (bitIndex!0 (size!2796 (buf!3189 (_2!6200 lt!210059))) (currentByte!5986 (_2!6200 lt!210059)) (currentBit!5981 (_2!6200 lt!210059))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2796 (buf!3189 thiss!1634)) (currentByte!5986 thiss!1634) (currentBit!5981 thiss!1634)))))))

(assert (= (and start!26376 res!112554) b!135347))

(assert (= (and b!135347 res!112559) b!135341))

(assert (= (and b!135341 res!112551) b!135343))

(assert (= (and b!135343 res!112555) b!135344))

(assert (= (and b!135344 res!112550) b!135350))

(assert (= (and b!135350 res!112552) b!135346))

(assert (= (and b!135346 res!112556) b!135348))

(assert (= (and b!135344 res!112549) b!135337))

(assert (= (and b!135337 res!112560) b!135339))

(assert (= (and b!135339 res!112557) b!135336))

(assert (= (and b!135336 (not res!112553)) b!135338))

(assert (= (and b!135344 res!112547) b!135342))

(assert (= (and b!135344 res!112548) b!135340))

(assert (= (and b!135344 (not res!112558)) b!135345))

(assert (= start!26376 b!135349))

(declare-fun m!206411 () Bool)

(assert (=> b!135350 m!206411))

(declare-fun m!206413 () Bool)

(assert (=> b!135350 m!206413))

(declare-fun m!206415 () Bool)

(assert (=> b!135343 m!206415))

(declare-fun m!206417 () Bool)

(assert (=> b!135336 m!206417))

(declare-fun m!206419 () Bool)

(assert (=> b!135336 m!206419))

(declare-fun m!206421 () Bool)

(assert (=> b!135336 m!206421))

(declare-fun m!206423 () Bool)

(assert (=> b!135336 m!206423))

(declare-fun m!206425 () Bool)

(assert (=> b!135337 m!206425))

(assert (=> b!135337 m!206411))

(declare-fun m!206427 () Bool)

(assert (=> b!135342 m!206427))

(declare-fun m!206429 () Bool)

(assert (=> start!26376 m!206429))

(declare-fun m!206431 () Bool)

(assert (=> start!26376 m!206431))

(declare-fun m!206433 () Bool)

(assert (=> b!135349 m!206433))

(declare-fun m!206435 () Bool)

(assert (=> b!135344 m!206435))

(declare-fun m!206437 () Bool)

(assert (=> b!135344 m!206437))

(declare-fun m!206439 () Bool)

(assert (=> b!135344 m!206439))

(declare-fun m!206441 () Bool)

(assert (=> b!135344 m!206441))

(declare-fun m!206443 () Bool)

(assert (=> b!135344 m!206443))

(declare-fun m!206445 () Bool)

(assert (=> b!135344 m!206445))

(declare-fun m!206447 () Bool)

(assert (=> b!135344 m!206447))

(declare-fun m!206449 () Bool)

(assert (=> b!135344 m!206449))

(declare-fun m!206451 () Bool)

(assert (=> b!135344 m!206451))

(declare-fun m!206453 () Bool)

(assert (=> b!135344 m!206453))

(declare-fun m!206455 () Bool)

(assert (=> b!135344 m!206455))

(declare-fun m!206457 () Bool)

(assert (=> b!135344 m!206457))

(declare-fun m!206459 () Bool)

(assert (=> b!135344 m!206459))

(assert (=> b!135344 m!206439))

(declare-fun m!206461 () Bool)

(assert (=> b!135344 m!206461))

(assert (=> b!135344 m!206423))

(declare-fun m!206463 () Bool)

(assert (=> b!135344 m!206463))

(declare-fun m!206465 () Bool)

(assert (=> b!135344 m!206465))

(declare-fun m!206467 () Bool)

(assert (=> b!135344 m!206467))

(declare-fun m!206469 () Bool)

(assert (=> b!135344 m!206469))

(declare-fun m!206471 () Bool)

(assert (=> b!135344 m!206471))

(declare-fun m!206473 () Bool)

(assert (=> b!135344 m!206473))

(declare-fun m!206475 () Bool)

(assert (=> b!135344 m!206475))

(declare-fun m!206477 () Bool)

(assert (=> b!135344 m!206477))

(declare-fun m!206479 () Bool)

(assert (=> b!135344 m!206479))

(declare-fun m!206481 () Bool)

(assert (=> b!135344 m!206481))

(assert (=> b!135344 m!206455))

(declare-fun m!206483 () Bool)

(assert (=> b!135344 m!206483))

(declare-fun m!206485 () Bool)

(assert (=> b!135344 m!206485))

(assert (=> b!135348 m!206455))

(declare-fun m!206487 () Bool)

(assert (=> b!135348 m!206487))

(declare-fun m!206489 () Bool)

(assert (=> b!135348 m!206489))

(declare-fun m!206491 () Bool)

(assert (=> b!135345 m!206491))

(declare-fun m!206493 () Bool)

(assert (=> b!135345 m!206493))

(declare-fun m!206495 () Bool)

(assert (=> b!135338 m!206495))

(declare-fun m!206497 () Bool)

(assert (=> b!135346 m!206497))

(declare-fun m!206499 () Bool)

(assert (=> b!135347 m!206499))

(declare-fun m!206501 () Bool)

(assert (=> b!135339 m!206501))

(push 1)

(assert (not b!135347))

(assert (not b!135349))

(assert (not b!135344))

(assert (not b!135350))

(assert (not start!26376))

(assert (not b!135342))

(assert (not b!135343))

(assert (not b!135346))

(assert (not b!135345))

(assert (not b!135339))

(assert (not b!135336))

(assert (not b!135348))

(assert (not b!135338))

(assert (not b!135337))

(check-sat)

(pop 1)

