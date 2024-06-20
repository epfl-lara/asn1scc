; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46770 () Bool)

(assert start!46770)

(declare-fun b!224399 () Bool)

(declare-fun res!188334 () Bool)

(declare-fun e!152942 () Bool)

(assert (=> b!224399 (=> (not res!188334) (not e!152942))))

(declare-datatypes ((array!11086 0))(
  ( (array!11087 (arr!5814 (Array (_ BitVec 32) (_ BitVec 8))) (size!4866 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8834 0))(
  ( (BitStream!8835 (buf!5410 array!11086) (currentByte!10138 (_ BitVec 32)) (currentBit!10133 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8834)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224399 (= res!188334 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4866 (buf!5410 thiss!1870))) ((_ sign_extend 32) (currentByte!10138 thiss!1870)) ((_ sign_extend 32) (currentBit!10133 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224400 () Bool)

(declare-fun res!188332 () Bool)

(assert (=> b!224400 (=> (not res!188332) (not e!152942))))

(assert (=> b!224400 (= res!188332 (bvslt i!761 to!496))))

(declare-fun res!188333 () Bool)

(assert (=> start!46770 (=> (not res!188333) (not e!152942))))

(declare-fun arr!308 () array!11086)

(assert (=> start!46770 (= res!188333 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4866 arr!308))))))

(assert (=> start!46770 e!152942))

(assert (=> start!46770 true))

(declare-fun array_inv!4607 (array!11086) Bool)

(assert (=> start!46770 (array_inv!4607 arr!308)))

(declare-fun e!152939 () Bool)

(declare-fun inv!12 (BitStream!8834) Bool)

(assert (=> start!46770 (and (inv!12 thiss!1870) e!152939)))

(declare-fun b!224402 () Bool)

(assert (=> b!224402 (= e!152939 (array_inv!4607 (buf!5410 thiss!1870)))))

(declare-fun b!224401 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224401 (= e!152942 (not (invariant!0 (currentBit!10133 thiss!1870) (currentByte!10138 thiss!1870) (size!4866 (buf!5410 thiss!1870)))))))

(declare-datatypes ((tuple2!19220 0))(
  ( (tuple2!19221 (_1!10381 (_ BitVec 8)) (_2!10381 BitStream!8834)) )
))
(declare-fun lt!356204 () tuple2!19220)

(declare-datatypes ((Unit!16401 0))(
  ( (Unit!16402) )
))
(declare-datatypes ((tuple3!1258 0))(
  ( (tuple3!1259 (_1!10382 Unit!16401) (_2!10382 BitStream!8834) (_3!771 array!11086)) )
))
(declare-fun lt!356202 () tuple3!1258)

(assert (=> b!224401 (and (= (_1!10381 lt!356204) (select (arr!5814 (_3!771 lt!356202)) i!761)) (= (select (arr!5814 (_3!771 lt!356202)) i!761) (_1!10381 lt!356204)))))

(declare-fun lt!356203 () Unit!16401)

(declare-fun lt!356199 () array!11086)

(declare-fun arrayRangesEqImpliesEq!84 (array!11086 array!11086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16401)

(assert (=> b!224401 (= lt!356203 (arrayRangesEqImpliesEq!84 lt!356199 (_3!771 lt!356202) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!762 (array!11086 array!11086 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224401 (arrayRangesEq!762 arr!308 (_3!771 lt!356202) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356198 () Unit!16401)

(declare-fun arrayRangesEqTransitive!233 (array!11086 array!11086 array!11086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16401)

(assert (=> b!224401 (= lt!356198 (arrayRangesEqTransitive!233 arr!308 lt!356199 (_3!771 lt!356202) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224401 (arrayRangesEq!762 arr!308 lt!356199 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356195 () Unit!16401)

(declare-fun arrayUpdatedAtPrefixLemma!354 (array!11086 (_ BitVec 32) (_ BitVec 8)) Unit!16401)

(assert (=> b!224401 (= lt!356195 (arrayUpdatedAtPrefixLemma!354 arr!308 i!761 (_1!10381 lt!356204)))))

(declare-fun lt!356197 () (_ BitVec 64))

(declare-fun lt!356200 () (_ BitVec 32))

(declare-fun lt!356201 () (_ BitVec 64))

(declare-fun lt!356205 () (_ BitVec 64))

(assert (=> b!224401 (and (= (bvadd lt!356201 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!356200))) lt!356205) (= (bvadd lt!356197 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!356205) (= (buf!5410 thiss!1870) (buf!5410 (_2!10382 lt!356202))) (= (size!4866 arr!308) (size!4866 (_3!771 lt!356202))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224401 (= lt!356205 (bitIndex!0 (size!4866 (buf!5410 (_2!10382 lt!356202))) (currentByte!10138 (_2!10382 lt!356202)) (currentBit!10133 (_2!10382 lt!356202))))))

(assert (=> b!224401 (= lt!356201 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!356197))))

(assert (=> b!224401 (= lt!356201 (bitIndex!0 (size!4866 (buf!5410 (_2!10381 lt!356204))) (currentByte!10138 (_2!10381 lt!356204)) (currentBit!10133 (_2!10381 lt!356204))))))

(assert (=> b!224401 (= lt!356197 (bitIndex!0 (size!4866 (buf!5410 thiss!1870)) (currentByte!10138 thiss!1870) (currentBit!10133 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8834 array!11086 (_ BitVec 32) (_ BitVec 32)) tuple3!1258)

(assert (=> b!224401 (= lt!356202 (readByteArrayLoop!0 (_2!10381 lt!356204) lt!356199 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224401 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4866 (buf!5410 (_2!10381 lt!356204)))) ((_ sign_extend 32) (currentByte!10138 (_2!10381 lt!356204))) ((_ sign_extend 32) (currentBit!10133 (_2!10381 lt!356204))) lt!356200)))

(assert (=> b!224401 (= lt!356200 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!356196 () Unit!16401)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8834 BitStream!8834 (_ BitVec 64) (_ BitVec 32)) Unit!16401)

(assert (=> b!224401 (= lt!356196 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10381 lt!356204) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224401 (= lt!356199 (array!11087 (store (arr!5814 arr!308) i!761 (_1!10381 lt!356204)) (size!4866 arr!308)))))

(declare-fun readByte!0 (BitStream!8834) tuple2!19220)

(assert (=> b!224401 (= lt!356204 (readByte!0 thiss!1870))))

(assert (= (and start!46770 res!188333) b!224399))

(assert (= (and b!224399 res!188334) b!224400))

(assert (= (and b!224400 res!188332) b!224401))

(assert (= start!46770 b!224402))

(declare-fun m!344547 () Bool)

(assert (=> b!224399 m!344547))

(declare-fun m!344549 () Bool)

(assert (=> start!46770 m!344549))

(declare-fun m!344551 () Bool)

(assert (=> start!46770 m!344551))

(declare-fun m!344553 () Bool)

(assert (=> b!224402 m!344553))

(declare-fun m!344555 () Bool)

(assert (=> b!224401 m!344555))

(declare-fun m!344557 () Bool)

(assert (=> b!224401 m!344557))

(declare-fun m!344559 () Bool)

(assert (=> b!224401 m!344559))

(declare-fun m!344561 () Bool)

(assert (=> b!224401 m!344561))

(declare-fun m!344563 () Bool)

(assert (=> b!224401 m!344563))

(declare-fun m!344565 () Bool)

(assert (=> b!224401 m!344565))

(declare-fun m!344567 () Bool)

(assert (=> b!224401 m!344567))

(declare-fun m!344569 () Bool)

(assert (=> b!224401 m!344569))

(declare-fun m!344571 () Bool)

(assert (=> b!224401 m!344571))

(declare-fun m!344573 () Bool)

(assert (=> b!224401 m!344573))

(declare-fun m!344575 () Bool)

(assert (=> b!224401 m!344575))

(declare-fun m!344577 () Bool)

(assert (=> b!224401 m!344577))

(declare-fun m!344579 () Bool)

(assert (=> b!224401 m!344579))

(declare-fun m!344581 () Bool)

(assert (=> b!224401 m!344581))

(declare-fun m!344583 () Bool)

(assert (=> b!224401 m!344583))

(push 1)

(assert (not b!224402))

(assert (not b!224401))

(assert (not start!46770))

(assert (not b!224399))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76049 () Bool)

(assert (=> d!76049 (= (array_inv!4607 (buf!5410 thiss!1870)) (bvsge (size!4866 (buf!5410 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!224402 d!76049))

(declare-fun d!76051 () Bool)

(declare-fun e!152948 () Bool)

(assert (=> d!76051 e!152948))

(declare-fun res!188344 () Bool)

(assert (=> d!76051 (=> (not res!188344) (not e!152948))))

(assert (=> d!76051 (= res!188344 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4866 arr!308))))))

(declare-fun lt!356226 () Unit!16401)

(declare-fun choose!284 (array!11086 (_ BitVec 32) (_ BitVec 8)) Unit!16401)

(assert (=> d!76051 (= lt!356226 (choose!284 arr!308 i!761 (_1!10381 lt!356204)))))

(assert (=> d!76051 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!4866 arr!308)))))

(assert (=> d!76051 (= (arrayUpdatedAtPrefixLemma!354 arr!308 i!761 (_1!10381 lt!356204)) lt!356226)))

(declare-fun b!224411 () Bool)

(assert (=> b!224411 (= e!152948 (arrayRangesEq!762 arr!308 (array!11087 (store (arr!5814 arr!308) i!761 (_1!10381 lt!356204)) (size!4866 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!76051 res!188344) b!224411))

(declare-fun m!344591 () Bool)

(assert (=> d!76051 m!344591))

(assert (=> b!224411 m!344563))

(declare-fun m!344593 () Bool)

(assert (=> b!224411 m!344593))

(assert (=> b!224401 d!76051))

(declare-fun c!11128 () Bool)

(declare-fun lt!356489 () tuple3!1258)

(declare-fun call!3602 () Bool)

(declare-fun lt!356485 () (_ BitVec 32))

(declare-fun bm!3598 () Bool)

(assert (=> bm!3598 (= call!3602 (arrayRangesEq!762 lt!356199 (ite c!11128 (_3!771 lt!356489) lt!356199) (ite c!11128 lt!356485 #b00000000000000000000000000000000) (ite c!11128 (bvadd #b00000000000000000000000000000001 i!761) (size!4866 lt!356199))))))

(declare-fun bm!3599 () Bool)

(declare-fun call!3601 () (_ BitVec 64))

(assert (=> bm!3599 (= call!3601 (bitIndex!0 (size!4866 (buf!5410 (_2!10381 lt!356204))) (currentByte!10138 (_2!10381 lt!356204)) (currentBit!10133 (_2!10381 lt!356204))))))

(declare-fun e!152993 () Bool)

(declare-fun b!224467 () Bool)

(declare-fun lt!356494 () tuple3!1258)

(assert (=> b!224467 (= e!152993 (arrayRangesEq!762 lt!356199 (_3!771 lt!356494) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun e!152992 () tuple3!1258)

(declare-fun b!224468 () Bool)

(declare-fun lt!356516 () Unit!16401)

(assert (=> b!224468 (= e!152992 (tuple3!1259 lt!356516 (_2!10381 lt!356204) lt!356199))))

(assert (=> b!224468 (= call!3601 call!3601)))

(declare-fun lt!356515 () Unit!16401)

(declare-fun Unit!16418 () Unit!16401)

(assert (=> b!224468 (= lt!356515 Unit!16418)))

(declare-fun lt!356514 () Unit!16401)

(declare-fun arrayRangesEqReflexiveLemma!75 (array!11086) Unit!16401)

(assert (=> b!224468 (= lt!356514 (arrayRangesEqReflexiveLemma!75 lt!356199))))

(assert (=> b!224468 call!3602))

(declare-fun lt!356487 () Unit!16401)

(assert (=> b!224468 (= lt!356487 lt!356514)))

(declare-fun lt!356484 () array!11086)

(assert (=> b!224468 (= lt!356484 lt!356199)))

(declare-fun lt!356503 () array!11086)

(assert (=> b!224468 (= lt!356503 lt!356199)))

(declare-fun lt!356505 () (_ BitVec 32))

(assert (=> b!224468 (= lt!356505 #b00000000000000000000000000000000)))

(declare-fun lt!356508 () (_ BitVec 32))

(assert (=> b!224468 (= lt!356508 (size!4866 lt!356199))))

(declare-fun lt!356496 () (_ BitVec 32))

(assert (=> b!224468 (= lt!356496 #b00000000000000000000000000000000)))

(declare-fun lt!356517 () (_ BitVec 32))

(assert (=> b!224468 (= lt!356517 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!75 (array!11086 array!11086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16401)

(assert (=> b!224468 (= lt!356516 (arrayRangesEqSlicedLemma!75 lt!356484 lt!356503 lt!356505 lt!356508 lt!356496 lt!356517))))

(declare-fun call!3603 () Bool)

(assert (=> b!224468 call!3603))

(declare-fun b!224469 () Bool)

(declare-fun res!188392 () Bool)

(assert (=> b!224469 (=> (not res!188392) (not e!152993))))

(assert (=> b!224469 (= res!188392 (and (= (buf!5410 (_2!10381 lt!356204)) (buf!5410 (_2!10382 lt!356494))) (= (size!4866 lt!356199) (size!4866 (_3!771 lt!356494)))))))

(declare-fun b!224470 () Bool)

(declare-fun lt!356482 () Unit!16401)

(assert (=> b!224470 (= e!152992 (tuple3!1259 lt!356482 (_2!10382 lt!356489) (_3!771 lt!356489)))))

(declare-fun lt!356488 () tuple2!19220)

(assert (=> b!224470 (= lt!356488 (readByte!0 (_2!10381 lt!356204)))))

(declare-fun lt!356498 () array!11086)

(assert (=> b!224470 (= lt!356498 (array!11087 (store (arr!5814 lt!356199) (bvadd #b00000000000000000000000000000001 i!761) (_1!10381 lt!356488)) (size!4866 lt!356199)))))

(declare-fun lt!356510 () (_ BitVec 64))

(assert (=> b!224470 (= lt!356510 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!356509 () (_ BitVec 32))

(assert (=> b!224470 (= lt!356509 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!356512 () Unit!16401)

(assert (=> b!224470 (= lt!356512 (validateOffsetBytesFromBitIndexLemma!0 (_2!10381 lt!356204) (_2!10381 lt!356488) lt!356510 lt!356509))))

(assert (=> b!224470 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4866 (buf!5410 (_2!10381 lt!356488)))) ((_ sign_extend 32) (currentByte!10138 (_2!10381 lt!356488))) ((_ sign_extend 32) (currentBit!10133 (_2!10381 lt!356488))) (bvsub lt!356509 ((_ extract 31 0) (bvsdiv (bvadd lt!356510 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!356513 () Unit!16401)

(assert (=> b!224470 (= lt!356513 lt!356512)))

(assert (=> b!224470 (= lt!356489 (readByteArrayLoop!0 (_2!10381 lt!356488) lt!356498 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!224470 (= (bitIndex!0 (size!4866 (buf!5410 (_2!10381 lt!356488))) (currentByte!10138 (_2!10381 lt!356488)) (currentBit!10133 (_2!10381 lt!356488))) (bvadd call!3601 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!356483 () Unit!16401)

(declare-fun Unit!16419 () Unit!16401)

(assert (=> b!224470 (= lt!356483 Unit!16419)))

(assert (=> b!224470 (= (bvadd (bitIndex!0 (size!4866 (buf!5410 (_2!10381 lt!356488))) (currentByte!10138 (_2!10381 lt!356488)) (currentBit!10133 (_2!10381 lt!356488))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4866 (buf!5410 (_2!10382 lt!356489))) (currentByte!10138 (_2!10382 lt!356489)) (currentBit!10133 (_2!10382 lt!356489))))))

(declare-fun lt!356493 () Unit!16401)

(declare-fun Unit!16420 () Unit!16401)

(assert (=> b!224470 (= lt!356493 Unit!16420)))

(assert (=> b!224470 (= (bvadd call!3601 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4866 (buf!5410 (_2!10382 lt!356489))) (currentByte!10138 (_2!10382 lt!356489)) (currentBit!10133 (_2!10382 lt!356489))))))

(declare-fun lt!356492 () Unit!16401)

(declare-fun Unit!16421 () Unit!16401)

(assert (=> b!224470 (= lt!356492 Unit!16421)))

(assert (=> b!224470 (and (= (buf!5410 (_2!10381 lt!356204)) (buf!5410 (_2!10382 lt!356489))) (= (size!4866 lt!356199) (size!4866 (_3!771 lt!356489))))))

(declare-fun lt!356495 () Unit!16401)

(declare-fun Unit!16422 () Unit!16401)

(assert (=> b!224470 (= lt!356495 Unit!16422)))

(declare-fun lt!356501 () Unit!16401)

(assert (=> b!224470 (= lt!356501 (arrayUpdatedAtPrefixLemma!354 lt!356199 (bvadd #b00000000000000000000000000000001 i!761) (_1!10381 lt!356488)))))

(assert (=> b!224470 call!3603))

(declare-fun lt!356506 () Unit!16401)

(assert (=> b!224470 (= lt!356506 lt!356501)))

(assert (=> b!224470 (= lt!356485 #b00000000000000000000000000000000)))

(declare-fun lt!356504 () Unit!16401)

(assert (=> b!224470 (= lt!356504 (arrayRangesEqTransitive!233 lt!356199 lt!356498 (_3!771 lt!356489) lt!356485 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224470 call!3602))

(declare-fun lt!356502 () Unit!16401)

(assert (=> b!224470 (= lt!356502 lt!356504)))

(assert (=> b!224470 (arrayRangesEq!762 lt!356199 (_3!771 lt!356489) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!356497 () Unit!16401)

(declare-fun Unit!16423 () Unit!16401)

(assert (=> b!224470 (= lt!356497 Unit!16423)))

(declare-fun lt!356511 () Unit!16401)

(assert (=> b!224470 (= lt!356511 (arrayRangesEqImpliesEq!84 lt!356498 (_3!771 lt!356489) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224470 (= (select (store (arr!5814 lt!356199) (bvadd #b00000000000000000000000000000001 i!761) (_1!10381 lt!356488)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5814 (_3!771 lt!356489)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!356490 () Unit!16401)

(assert (=> b!224470 (= lt!356490 lt!356511)))

(declare-fun lt!356491 () Bool)

(assert (=> b!224470 (= lt!356491 (= (select (arr!5814 (_3!771 lt!356489)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10381 lt!356488)))))

(declare-fun Unit!16424 () Unit!16401)

(assert (=> b!224470 (= lt!356482 Unit!16424)))

(assert (=> b!224470 lt!356491))

(declare-fun b!224471 () Bool)

(declare-fun e!152994 () Bool)

(declare-datatypes ((tuple2!19230 0))(
  ( (tuple2!19231 (_1!10387 BitStream!8834) (_2!10387 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8834) tuple2!19230)

(assert (=> b!224471 (= e!152994 (= (select (arr!5814 (_3!771 lt!356494)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10387 (readBytePure!0 (_2!10381 lt!356204)))))))

(assert (=> b!224471 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4866 (_3!771 lt!356494))))))

(declare-fun d!76053 () Bool)

(assert (=> d!76053 e!152994))

(declare-fun res!188393 () Bool)

(assert (=> d!76053 (=> res!188393 e!152994)))

(assert (=> d!76053 (= res!188393 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!356499 () Bool)

(assert (=> d!76053 (= lt!356499 e!152993)))

(declare-fun res!188391 () Bool)

(assert (=> d!76053 (=> (not res!188391) (not e!152993))))

(declare-fun lt!356507 () (_ BitVec 64))

(declare-fun lt!356486 () (_ BitVec 64))

(assert (=> d!76053 (= res!188391 (= (bvadd lt!356486 lt!356507) (bitIndex!0 (size!4866 (buf!5410 (_2!10382 lt!356494))) (currentByte!10138 (_2!10382 lt!356494)) (currentBit!10133 (_2!10382 lt!356494)))))))

(assert (=> d!76053 (or (not (= (bvand lt!356486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356507 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!356486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!356486 lt!356507) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!356500 () (_ BitVec 64))

(assert (=> d!76053 (= lt!356507 (bvmul lt!356500 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76053 (or (= lt!356500 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356500 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356500)))))

(assert (=> d!76053 (= lt!356500 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76053 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76053 (= lt!356486 (bitIndex!0 (size!4866 (buf!5410 (_2!10381 lt!356204))) (currentByte!10138 (_2!10381 lt!356204)) (currentBit!10133 (_2!10381 lt!356204))))))

(assert (=> d!76053 (= lt!356494 e!152992)))

(assert (=> d!76053 (= c!11128 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76053 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4866 lt!356199)))))

(assert (=> d!76053 (= (readByteArrayLoop!0 (_2!10381 lt!356204) lt!356199 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!356494)))

(declare-fun bm!3600 () Bool)

(assert (=> bm!3600 (= call!3603 (arrayRangesEq!762 (ite c!11128 lt!356199 lt!356484) (ite c!11128 (array!11087 (store (arr!5814 lt!356199) (bvadd #b00000000000000000000000000000001 i!761) (_1!10381 lt!356488)) (size!4866 lt!356199)) lt!356503) (ite c!11128 #b00000000000000000000000000000000 lt!356496) (ite c!11128 (bvadd #b00000000000000000000000000000001 i!761) lt!356517)))))

(assert (= (and d!76053 c!11128) b!224470))

(assert (= (and d!76053 (not c!11128)) b!224468))

(assert (= (or b!224470 b!224468) bm!3600))

(assert (= (or b!224470 b!224468) bm!3598))

(assert (= (or b!224470 b!224468) bm!3599))

(assert (= (and d!76053 res!188391) b!224469))

(assert (= (and b!224469 res!188392) b!224467))

(assert (= (and d!76053 (not res!188393)) b!224471))

(declare-fun m!344689 () Bool)

(assert (=> b!224467 m!344689))

(declare-fun m!344691 () Bool)

(assert (=> b!224468 m!344691))

(declare-fun m!344693 () Bool)

(assert (=> b!224468 m!344693))

(declare-fun m!344695 () Bool)

(assert (=> b!224470 m!344695))

(declare-fun m!344697 () Bool)

(assert (=> b!224470 m!344697))

(declare-fun m!344699 () Bool)

(assert (=> b!224470 m!344699))

(declare-fun m!344701 () Bool)

(assert (=> b!224470 m!344701))

(declare-fun m!344703 () Bool)

(assert (=> b!224470 m!344703))

(declare-fun m!344705 () Bool)

(assert (=> b!224470 m!344705))

(declare-fun m!344707 () Bool)

(assert (=> b!224470 m!344707))

(declare-fun m!344709 () Bool)

(assert (=> b!224470 m!344709))

(declare-fun m!344711 () Bool)

(assert (=> b!224470 m!344711))

(declare-fun m!344713 () Bool)

(assert (=> b!224470 m!344713))

(declare-fun m!344715 () Bool)

(assert (=> b!224470 m!344715))

(declare-fun m!344717 () Bool)

(assert (=> b!224470 m!344717))

(declare-fun m!344719 () Bool)

(assert (=> b!224470 m!344719))

(declare-fun m!344721 () Bool)

(assert (=> b!224471 m!344721))

(declare-fun m!344723 () Bool)

(assert (=> b!224471 m!344723))

(declare-fun m!344725 () Bool)

(assert (=> d!76053 m!344725))

(assert (=> d!76053 m!344583))

(assert (=> bm!3599 m!344583))

(assert (=> bm!3600 m!344719))

(declare-fun m!344727 () Bool)

(assert (=> bm!3600 m!344727))

(declare-fun m!344729 () Bool)

(assert (=> bm!3598 m!344729))

(assert (=> b!224401 d!76053))

(declare-fun d!76086 () Bool)

(assert (=> d!76086 (arrayRangesEq!762 arr!308 (_3!771 lt!356202) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356523 () Unit!16401)

(declare-fun choose!288 (array!11086 array!11086 array!11086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16401)

(assert (=> d!76086 (= lt!356523 (choose!288 arr!308 lt!356199 (_3!771 lt!356202) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76086 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76086 (= (arrayRangesEqTransitive!233 arr!308 lt!356199 (_3!771 lt!356202) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!356523)))

(declare-fun bs!18567 () Bool)

(assert (= bs!18567 d!76086))

(assert (=> bs!18567 m!344555))

(declare-fun m!344735 () Bool)

(assert (=> bs!18567 m!344735))

(assert (=> b!224401 d!76086))

(declare-fun d!76092 () Bool)

(declare-fun lt!356640 () (_ BitVec 8))

(declare-fun lt!356645 () (_ BitVec 8))

(assert (=> d!76092 (= lt!356640 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5814 (buf!5410 thiss!1870)) (currentByte!10138 thiss!1870))) ((_ sign_extend 24) lt!356645))))))

(assert (=> d!76092 (= lt!356645 ((_ extract 7 0) (currentBit!10133 thiss!1870)))))

(declare-fun e!153018 () Bool)

(assert (=> d!76092 e!153018))

(declare-fun res!188420 () Bool)

(assert (=> d!76092 (=> (not res!188420) (not e!153018))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76092 (= res!188420 (validate_offset_bits!1 ((_ sign_extend 32) (size!4866 (buf!5410 thiss!1870))) ((_ sign_extend 32) (currentByte!10138 thiss!1870)) ((_ sign_extend 32) (currentBit!10133 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19232 0))(
  ( (tuple2!19233 (_1!10388 Unit!16401) (_2!10388 (_ BitVec 8))) )
))
(declare-fun Unit!16432 () Unit!16401)

(declare-fun Unit!16433 () Unit!16401)

(assert (=> d!76092 (= (readByte!0 thiss!1870) (tuple2!19221 (_2!10388 (ite (bvsgt ((_ sign_extend 24) lt!356645) #b00000000000000000000000000000000) (tuple2!19233 Unit!16432 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!356640) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5814 (buf!5410 thiss!1870)) (bvadd (currentByte!10138 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!356645)))))))) (tuple2!19233 Unit!16433 lt!356640))) (BitStream!8835 (buf!5410 thiss!1870) (bvadd (currentByte!10138 thiss!1870) #b00000000000000000000000000000001) (currentBit!10133 thiss!1870))))))

(declare-fun b!224499 () Bool)

(declare-fun e!153019 () Bool)

(assert (=> b!224499 (= e!153018 e!153019)))

(declare-fun res!188421 () Bool)

(assert (=> b!224499 (=> (not res!188421) (not e!153019))))

(declare-fun lt!356643 () tuple2!19220)

(assert (=> b!224499 (= res!188421 (= (buf!5410 (_2!10381 lt!356643)) (buf!5410 thiss!1870)))))

(declare-fun lt!356641 () (_ BitVec 8))

(declare-fun lt!356642 () (_ BitVec 8))

(declare-fun Unit!16434 () Unit!16401)

(declare-fun Unit!16435 () Unit!16401)

(assert (=> b!224499 (= lt!356643 (tuple2!19221 (_2!10388 (ite (bvsgt ((_ sign_extend 24) lt!356642) #b00000000000000000000000000000000) (tuple2!19233 Unit!16434 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!356641) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5814 (buf!5410 thiss!1870)) (bvadd (currentByte!10138 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!356642)))))))) (tuple2!19233 Unit!16435 lt!356641))) (BitStream!8835 (buf!5410 thiss!1870) (bvadd (currentByte!10138 thiss!1870) #b00000000000000000000000000000001) (currentBit!10133 thiss!1870))))))

(assert (=> b!224499 (= lt!356641 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5814 (buf!5410 thiss!1870)) (currentByte!10138 thiss!1870))) ((_ sign_extend 24) lt!356642))))))

(assert (=> b!224499 (= lt!356642 ((_ extract 7 0) (currentBit!10133 thiss!1870)))))

(declare-fun lt!356639 () (_ BitVec 64))

(declare-fun lt!356644 () (_ BitVec 64))

(declare-fun b!224500 () Bool)

(assert (=> b!224500 (= e!153019 (= (bitIndex!0 (size!4866 (buf!5410 (_2!10381 lt!356643))) (currentByte!10138 (_2!10381 lt!356643)) (currentBit!10133 (_2!10381 lt!356643))) (bvadd lt!356639 lt!356644)))))

(assert (=> b!224500 (or (not (= (bvand lt!356639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356644 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!356639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!356639 lt!356644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!224500 (= lt!356644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!224500 (= lt!356639 (bitIndex!0 (size!4866 (buf!5410 thiss!1870)) (currentByte!10138 thiss!1870) (currentBit!10133 thiss!1870)))))

(assert (= (and d!76092 res!188420) b!224499))

(assert (= (and b!224499 res!188421) b!224500))

(declare-fun m!344747 () Bool)

(assert (=> d!76092 m!344747))

(declare-fun m!344749 () Bool)

(assert (=> d!76092 m!344749))

(declare-fun m!344751 () Bool)

(assert (=> d!76092 m!344751))

(assert (=> b!224499 m!344751))

(assert (=> b!224499 m!344747))

(declare-fun m!344753 () Bool)

(assert (=> b!224500 m!344753))

(assert (=> b!224500 m!344581))

(assert (=> b!224401 d!76092))

(declare-fun d!76103 () Bool)

(declare-fun res!188435 () Bool)

(declare-fun e!153030 () Bool)

(assert (=> d!76103 (=> res!188435 e!153030)))

(assert (=> d!76103 (= res!188435 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76103 (= (arrayRangesEq!762 arr!308 (_3!771 lt!356202) #b00000000000000000000000000000000 i!761) e!153030)))

(declare-fun b!224516 () Bool)

(declare-fun e!153031 () Bool)

(assert (=> b!224516 (= e!153030 e!153031)))

(declare-fun res!188436 () Bool)

(assert (=> b!224516 (=> (not res!188436) (not e!153031))))

(assert (=> b!224516 (= res!188436 (= (select (arr!5814 arr!308) #b00000000000000000000000000000000) (select (arr!5814 (_3!771 lt!356202)) #b00000000000000000000000000000000)))))

(declare-fun b!224517 () Bool)

(assert (=> b!224517 (= e!153031 (arrayRangesEq!762 arr!308 (_3!771 lt!356202) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76103 (not res!188435)) b!224516))

(assert (= (and b!224516 res!188436) b!224517))

(declare-fun m!344767 () Bool)

(assert (=> b!224516 m!344767))

(declare-fun m!344769 () Bool)

(assert (=> b!224516 m!344769))

(declare-fun m!344771 () Bool)

(assert (=> b!224517 m!344771))

(assert (=> b!224401 d!76103))

(declare-fun d!76111 () Bool)

(assert (=> d!76111 (= (invariant!0 (currentBit!10133 thiss!1870) (currentByte!10138 thiss!1870) (size!4866 (buf!5410 thiss!1870))) (and (bvsge (currentBit!10133 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10133 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10138 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10138 thiss!1870) (size!4866 (buf!5410 thiss!1870))) (and (= (currentBit!10133 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10138 thiss!1870) (size!4866 (buf!5410 thiss!1870)))))))))

(assert (=> b!224401 d!76111))

(declare-fun d!76113 () Bool)

(declare-fun e!153037 () Bool)

(assert (=> d!76113 e!153037))

(declare-fun res!188444 () Bool)

(assert (=> d!76113 (=> (not res!188444) (not e!153037))))

(declare-fun lt!356710 () (_ BitVec 64))

(declare-fun lt!356712 () (_ BitVec 64))

(declare-fun lt!356708 () (_ BitVec 64))

(assert (=> d!76113 (= res!188444 (= lt!356710 (bvsub lt!356712 lt!356708)))))

(assert (=> d!76113 (or (= (bvand lt!356712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356708 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!356712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!356712 lt!356708) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76113 (= lt!356708 (remainingBits!0 ((_ sign_extend 32) (size!4866 (buf!5410 thiss!1870))) ((_ sign_extend 32) (currentByte!10138 thiss!1870)) ((_ sign_extend 32) (currentBit!10133 thiss!1870))))))

(declare-fun lt!356711 () (_ BitVec 64))

(declare-fun lt!356707 () (_ BitVec 64))

(assert (=> d!76113 (= lt!356712 (bvmul lt!356711 lt!356707))))

(assert (=> d!76113 (or (= lt!356711 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!356707 (bvsdiv (bvmul lt!356711 lt!356707) lt!356711)))))

(assert (=> d!76113 (= lt!356707 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76113 (= lt!356711 ((_ sign_extend 32) (size!4866 (buf!5410 thiss!1870))))))

(assert (=> d!76113 (= lt!356710 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10138 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10133 thiss!1870))))))

(assert (=> d!76113 (invariant!0 (currentBit!10133 thiss!1870) (currentByte!10138 thiss!1870) (size!4866 (buf!5410 thiss!1870)))))

(assert (=> d!76113 (= (bitIndex!0 (size!4866 (buf!5410 thiss!1870)) (currentByte!10138 thiss!1870) (currentBit!10133 thiss!1870)) lt!356710)))

(declare-fun b!224527 () Bool)

(declare-fun res!188445 () Bool)

(assert (=> b!224527 (=> (not res!188445) (not e!153037))))

(assert (=> b!224527 (= res!188445 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!356710))))

(declare-fun b!224528 () Bool)

(declare-fun lt!356709 () (_ BitVec 64))

(assert (=> b!224528 (= e!153037 (bvsle lt!356710 (bvmul lt!356709 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224528 (or (= lt!356709 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356709 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356709)))))

(assert (=> b!224528 (= lt!356709 ((_ sign_extend 32) (size!4866 (buf!5410 thiss!1870))))))

(assert (= (and d!76113 res!188444) b!224527))

(assert (= (and b!224527 res!188445) b!224528))

(declare-fun m!344815 () Bool)

(assert (=> d!76113 m!344815))

(assert (=> d!76113 m!344569))

(assert (=> b!224401 d!76113))

(declare-fun d!76117 () Bool)

(declare-fun e!153038 () Bool)

(assert (=> d!76117 e!153038))

(declare-fun res!188446 () Bool)

(assert (=> d!76117 (=> (not res!188446) (not e!153038))))

(declare-fun lt!356714 () (_ BitVec 64))

(declare-fun lt!356716 () (_ BitVec 64))

(declare-fun lt!356718 () (_ BitVec 64))

(assert (=> d!76117 (= res!188446 (= lt!356716 (bvsub lt!356718 lt!356714)))))

(assert (=> d!76117 (or (= (bvand lt!356718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356714 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!356718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!356718 lt!356714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76117 (= lt!356714 (remainingBits!0 ((_ sign_extend 32) (size!4866 (buf!5410 (_2!10382 lt!356202)))) ((_ sign_extend 32) (currentByte!10138 (_2!10382 lt!356202))) ((_ sign_extend 32) (currentBit!10133 (_2!10382 lt!356202)))))))

(declare-fun lt!356717 () (_ BitVec 64))

(declare-fun lt!356713 () (_ BitVec 64))

(assert (=> d!76117 (= lt!356718 (bvmul lt!356717 lt!356713))))

(assert (=> d!76117 (or (= lt!356717 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!356713 (bvsdiv (bvmul lt!356717 lt!356713) lt!356717)))))

(assert (=> d!76117 (= lt!356713 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76117 (= lt!356717 ((_ sign_extend 32) (size!4866 (buf!5410 (_2!10382 lt!356202)))))))

(assert (=> d!76117 (= lt!356716 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10138 (_2!10382 lt!356202))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10133 (_2!10382 lt!356202)))))))

(assert (=> d!76117 (invariant!0 (currentBit!10133 (_2!10382 lt!356202)) (currentByte!10138 (_2!10382 lt!356202)) (size!4866 (buf!5410 (_2!10382 lt!356202))))))

(assert (=> d!76117 (= (bitIndex!0 (size!4866 (buf!5410 (_2!10382 lt!356202))) (currentByte!10138 (_2!10382 lt!356202)) (currentBit!10133 (_2!10382 lt!356202))) lt!356716)))

(declare-fun b!224529 () Bool)

(declare-fun res!188447 () Bool)

(assert (=> b!224529 (=> (not res!188447) (not e!153038))))

(assert (=> b!224529 (= res!188447 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!356716))))

(declare-fun b!224530 () Bool)

(declare-fun lt!356715 () (_ BitVec 64))

(assert (=> b!224530 (= e!153038 (bvsle lt!356716 (bvmul lt!356715 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224530 (or (= lt!356715 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356715 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356715)))))

(assert (=> b!224530 (= lt!356715 ((_ sign_extend 32) (size!4866 (buf!5410 (_2!10382 lt!356202)))))))

(assert (= (and d!76117 res!188446) b!224529))

(assert (= (and b!224529 res!188447) b!224530))

(declare-fun m!344817 () Bool)

(assert (=> d!76117 m!344817))

(declare-fun m!344819 () Bool)

(assert (=> d!76117 m!344819))

(assert (=> b!224401 d!76117))

(declare-fun d!76119 () Bool)

(declare-fun e!153039 () Bool)

(assert (=> d!76119 e!153039))

(declare-fun res!188448 () Bool)

(assert (=> d!76119 (=> (not res!188448) (not e!153039))))

(declare-fun lt!356722 () (_ BitVec 64))

(declare-fun lt!356720 () (_ BitVec 64))

(declare-fun lt!356724 () (_ BitVec 64))

(assert (=> d!76119 (= res!188448 (= lt!356722 (bvsub lt!356724 lt!356720)))))

(assert (=> d!76119 (or (= (bvand lt!356724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356720 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!356724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!356724 lt!356720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76119 (= lt!356720 (remainingBits!0 ((_ sign_extend 32) (size!4866 (buf!5410 (_2!10381 lt!356204)))) ((_ sign_extend 32) (currentByte!10138 (_2!10381 lt!356204))) ((_ sign_extend 32) (currentBit!10133 (_2!10381 lt!356204)))))))

(declare-fun lt!356723 () (_ BitVec 64))

(declare-fun lt!356719 () (_ BitVec 64))

(assert (=> d!76119 (= lt!356724 (bvmul lt!356723 lt!356719))))

(assert (=> d!76119 (or (= lt!356723 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!356719 (bvsdiv (bvmul lt!356723 lt!356719) lt!356723)))))

(assert (=> d!76119 (= lt!356719 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76119 (= lt!356723 ((_ sign_extend 32) (size!4866 (buf!5410 (_2!10381 lt!356204)))))))

(assert (=> d!76119 (= lt!356722 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10138 (_2!10381 lt!356204))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10133 (_2!10381 lt!356204)))))))

(assert (=> d!76119 (invariant!0 (currentBit!10133 (_2!10381 lt!356204)) (currentByte!10138 (_2!10381 lt!356204)) (size!4866 (buf!5410 (_2!10381 lt!356204))))))

(assert (=> d!76119 (= (bitIndex!0 (size!4866 (buf!5410 (_2!10381 lt!356204))) (currentByte!10138 (_2!10381 lt!356204)) (currentBit!10133 (_2!10381 lt!356204))) lt!356722)))

(declare-fun b!224531 () Bool)

(declare-fun res!188449 () Bool)

(assert (=> b!224531 (=> (not res!188449) (not e!153039))))

(assert (=> b!224531 (= res!188449 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!356722))))

(declare-fun b!224532 () Bool)

(declare-fun lt!356721 () (_ BitVec 64))

(assert (=> b!224532 (= e!153039 (bvsle lt!356722 (bvmul lt!356721 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224532 (or (= lt!356721 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356721 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356721)))))

(assert (=> b!224532 (= lt!356721 ((_ sign_extend 32) (size!4866 (buf!5410 (_2!10381 lt!356204)))))))

(assert (= (and d!76119 res!188448) b!224531))

(assert (= (and b!224531 res!188449) b!224532))

(declare-fun m!344821 () Bool)

(assert (=> d!76119 m!344821))

(declare-fun m!344823 () Bool)

(assert (=> d!76119 m!344823))

(assert (=> b!224401 d!76119))

(declare-fun d!76121 () Bool)

(declare-fun e!153042 () Bool)

(assert (=> d!76121 e!153042))

(declare-fun res!188452 () Bool)

(assert (=> d!76121 (=> (not res!188452) (not e!153042))))

(assert (=> d!76121 (= res!188452 (and (or (let ((rhs!3746 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3746 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3746) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76122 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76122 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76122 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3745 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3745 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3745) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!356731 () Unit!16401)

(declare-fun choose!57 (BitStream!8834 BitStream!8834 (_ BitVec 64) (_ BitVec 32)) Unit!16401)

(assert (=> d!76121 (= lt!356731 (choose!57 thiss!1870 (_2!10381 lt!356204) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76121 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10381 lt!356204) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!356731)))

(declare-fun lt!356733 () (_ BitVec 32))

(declare-fun b!224535 () Bool)

(assert (=> b!224535 (= e!153042 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4866 (buf!5410 (_2!10381 lt!356204)))) ((_ sign_extend 32) (currentByte!10138 (_2!10381 lt!356204))) ((_ sign_extend 32) (currentBit!10133 (_2!10381 lt!356204))) (bvsub (bvsub to!496 i!761) lt!356733)))))

