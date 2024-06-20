; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47938 () Bool)

(assert start!47938)

(declare-fun b!228046 () Bool)

(declare-fun res!191296 () Bool)

(declare-fun e!156211 () Bool)

(assert (=> b!228046 (=> (not res!191296) (not e!156211))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228046 (= res!191296 (bvslt i!761 to!496))))

(declare-fun b!228047 () Bool)

(declare-fun lt!365400 () (_ BitVec 64))

(declare-fun lt!365402 () (_ BitVec 64))

(declare-fun lt!365408 () (_ BitVec 64))

(assert (=> b!228047 (= e!156211 (not (or (not (= lt!365402 (bvand lt!365408 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!365402 (bvand (bvadd lt!365400 lt!365408) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!228047 (= lt!365402 (bvand lt!365400 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!11497 0))(
  ( (array!11498 (arr!6026 (Array (_ BitVec 32) (_ BitVec 8))) (size!5045 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9186 0))(
  ( (BitStream!9187 (buf!5586 array!11497) (currentByte!10436 (_ BitVec 32)) (currentBit!10431 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19636 0))(
  ( (tuple2!19637 (_1!10696 (_ BitVec 8)) (_2!10696 BitStream!9186)) )
))
(declare-fun lt!365403 () tuple2!19636)

(declare-datatypes ((Unit!17097 0))(
  ( (Unit!17098) )
))
(declare-datatypes ((tuple3!1472 0))(
  ( (tuple3!1473 (_1!10697 Unit!17097) (_2!10697 BitStream!9186) (_3!878 array!11497)) )
))
(declare-fun lt!365404 () tuple3!1472)

(assert (=> b!228047 (and (= (_1!10696 lt!365403) (select (arr!6026 (_3!878 lt!365404)) i!761)) (= (select (arr!6026 (_3!878 lt!365404)) i!761) (_1!10696 lt!365403)))))

(declare-fun lt!365410 () Unit!17097)

(declare-fun lt!365412 () array!11497)

(declare-fun arrayRangesEqImpliesEq!137 (array!11497 array!11497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17097)

(assert (=> b!228047 (= lt!365410 (arrayRangesEqImpliesEq!137 lt!365412 (_3!878 lt!365404) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11497)

(declare-fun arrayRangesEq!881 (array!11497 array!11497 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228047 (arrayRangesEq!881 arr!308 (_3!878 lt!365404) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365401 () Unit!17097)

(declare-fun arrayRangesEqTransitive!304 (array!11497 array!11497 array!11497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17097)

(assert (=> b!228047 (= lt!365401 (arrayRangesEqTransitive!304 arr!308 lt!365412 (_3!878 lt!365404) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228047 (arrayRangesEq!881 arr!308 lt!365412 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365406 () Unit!17097)

(declare-fun arrayUpdatedAtPrefixLemma!440 (array!11497 (_ BitVec 32) (_ BitVec 8)) Unit!17097)

(assert (=> b!228047 (= lt!365406 (arrayUpdatedAtPrefixLemma!440 arr!308 i!761 (_1!10696 lt!365403)))))

(assert (=> b!228047 (= lt!365408 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761))))))

(declare-fun lt!365411 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!9186)

(declare-fun lt!365405 () (_ BitVec 64))

(declare-fun lt!365409 () (_ BitVec 64))

(assert (=> b!228047 (and (= (bvadd lt!365409 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365411))) lt!365405) (= (bvadd lt!365400 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365405) (= (buf!5586 thiss!1870) (buf!5586 (_2!10697 lt!365404))) (= (size!5045 arr!308) (size!5045 (_3!878 lt!365404))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228047 (= lt!365405 (bitIndex!0 (size!5045 (buf!5586 (_2!10697 lt!365404))) (currentByte!10436 (_2!10697 lt!365404)) (currentBit!10431 (_2!10697 lt!365404))))))

(assert (=> b!228047 (= lt!365409 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365400))))

(assert (=> b!228047 (= lt!365409 (bitIndex!0 (size!5045 (buf!5586 (_2!10696 lt!365403))) (currentByte!10436 (_2!10696 lt!365403)) (currentBit!10431 (_2!10696 lt!365403))))))

(assert (=> b!228047 (= lt!365400 (bitIndex!0 (size!5045 (buf!5586 thiss!1870)) (currentByte!10436 thiss!1870) (currentBit!10431 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9186 array!11497 (_ BitVec 32) (_ BitVec 32)) tuple3!1472)

(assert (=> b!228047 (= lt!365404 (readByteArrayLoop!0 (_2!10696 lt!365403) lt!365412 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228047 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10696 lt!365403)))) ((_ sign_extend 32) (currentByte!10436 (_2!10696 lt!365403))) ((_ sign_extend 32) (currentBit!10431 (_2!10696 lt!365403))) lt!365411)))

(assert (=> b!228047 (= lt!365411 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365407 () Unit!17097)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9186 BitStream!9186 (_ BitVec 64) (_ BitVec 32)) Unit!17097)

(assert (=> b!228047 (= lt!365407 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10696 lt!365403) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228047 (= lt!365412 (array!11498 (store (arr!6026 arr!308) i!761 (_1!10696 lt!365403)) (size!5045 arr!308)))))

(declare-fun readByte!0 (BitStream!9186) tuple2!19636)

(assert (=> b!228047 (= lt!365403 (readByte!0 thiss!1870))))

(declare-fun b!228048 () Bool)

(declare-fun e!156214 () Bool)

(declare-fun array_inv!4786 (array!11497) Bool)

(assert (=> b!228048 (= e!156214 (array_inv!4786 (buf!5586 thiss!1870)))))

(declare-fun b!228045 () Bool)

(declare-fun res!191294 () Bool)

(assert (=> b!228045 (=> (not res!191294) (not e!156211))))

(assert (=> b!228045 (= res!191294 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5045 (buf!5586 thiss!1870))) ((_ sign_extend 32) (currentByte!10436 thiss!1870)) ((_ sign_extend 32) (currentBit!10431 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191295 () Bool)

(assert (=> start!47938 (=> (not res!191295) (not e!156211))))

(assert (=> start!47938 (= res!191295 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5045 arr!308))))))

(assert (=> start!47938 e!156211))

(assert (=> start!47938 true))

(assert (=> start!47938 (array_inv!4786 arr!308)))

(declare-fun inv!12 (BitStream!9186) Bool)

(assert (=> start!47938 (and (inv!12 thiss!1870) e!156214)))

(assert (= (and start!47938 res!191295) b!228045))

(assert (= (and b!228045 res!191294) b!228046))

(assert (= (and b!228046 res!191296) b!228047))

(assert (= start!47938 b!228048))

(declare-fun m!351283 () Bool)

(assert (=> b!228047 m!351283))

(declare-fun m!351285 () Bool)

(assert (=> b!228047 m!351285))

(declare-fun m!351287 () Bool)

(assert (=> b!228047 m!351287))

(declare-fun m!351289 () Bool)

(assert (=> b!228047 m!351289))

(declare-fun m!351291 () Bool)

(assert (=> b!228047 m!351291))

(declare-fun m!351293 () Bool)

(assert (=> b!228047 m!351293))

(declare-fun m!351295 () Bool)

(assert (=> b!228047 m!351295))

(declare-fun m!351297 () Bool)

(assert (=> b!228047 m!351297))

(declare-fun m!351299 () Bool)

(assert (=> b!228047 m!351299))

(declare-fun m!351301 () Bool)

(assert (=> b!228047 m!351301))

(declare-fun m!351303 () Bool)

(assert (=> b!228047 m!351303))

(declare-fun m!351305 () Bool)

(assert (=> b!228047 m!351305))

(declare-fun m!351307 () Bool)

(assert (=> b!228047 m!351307))

(declare-fun m!351309 () Bool)

(assert (=> b!228047 m!351309))

(declare-fun m!351311 () Bool)

(assert (=> b!228048 m!351311))

(declare-fun m!351313 () Bool)

(assert (=> b!228045 m!351313))

(declare-fun m!351315 () Bool)

(assert (=> start!47938 m!351315))

(declare-fun m!351317 () Bool)

(assert (=> start!47938 m!351317))

(check-sat (not b!228047) (not start!47938) (not b!228048) (not b!228045))
(check-sat)
(get-model)

(declare-fun d!77356 () Bool)

(assert (=> d!77356 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5045 lt!365412)) (bvslt i!761 (size!5045 (_3!878 lt!365404))) (= (select (arr!6026 lt!365412) i!761) (select (arr!6026 (_3!878 lt!365404)) i!761)))))

(declare-fun lt!365478 () Unit!17097)

(declare-fun choose!325 (array!11497 array!11497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17097)

(assert (=> d!77356 (= lt!365478 (choose!325 lt!365412 (_3!878 lt!365404) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77356 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77356 (= (arrayRangesEqImpliesEq!137 lt!365412 (_3!878 lt!365404) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!365478)))

(declare-fun bs!18923 () Bool)

(assert (= bs!18923 d!77356))

(declare-fun m!351385 () Bool)

(assert (=> bs!18923 m!351385))

(assert (=> bs!18923 m!351295))

(declare-fun m!351387 () Bool)

(assert (=> bs!18923 m!351387))

(assert (=> b!228047 d!77356))

(declare-fun d!77362 () Bool)

(declare-fun lt!365530 () (_ BitVec 8))

(declare-fun lt!365528 () (_ BitVec 8))

(assert (=> d!77362 (= lt!365530 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6026 (buf!5586 thiss!1870)) (currentByte!10436 thiss!1870))) ((_ sign_extend 24) lt!365528))))))

(assert (=> d!77362 (= lt!365528 ((_ extract 7 0) (currentBit!10431 thiss!1870)))))

(declare-fun e!156255 () Bool)

(assert (=> d!77362 e!156255))

(declare-fun res!191340 () Bool)

(assert (=> d!77362 (=> (not res!191340) (not e!156255))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77362 (= res!191340 (validate_offset_bits!1 ((_ sign_extend 32) (size!5045 (buf!5586 thiss!1870))) ((_ sign_extend 32) (currentByte!10436 thiss!1870)) ((_ sign_extend 32) (currentBit!10431 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19642 0))(
  ( (tuple2!19643 (_1!10701 Unit!17097) (_2!10701 (_ BitVec 8))) )
))
(declare-fun Unit!17111 () Unit!17097)

(declare-fun Unit!17112 () Unit!17097)

(assert (=> d!77362 (= (readByte!0 thiss!1870) (tuple2!19637 (_2!10701 (ite (bvsgt ((_ sign_extend 24) lt!365528) #b00000000000000000000000000000000) (tuple2!19643 Unit!17111 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!365530) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6026 (buf!5586 thiss!1870)) (bvadd (currentByte!10436 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!365528)))))))) (tuple2!19643 Unit!17112 lt!365530))) (BitStream!9187 (buf!5586 thiss!1870) (bvadd (currentByte!10436 thiss!1870) #b00000000000000000000000000000001) (currentBit!10431 thiss!1870))))))

(declare-fun b!228090 () Bool)

(declare-fun e!156254 () Bool)

(assert (=> b!228090 (= e!156255 e!156254)))

(declare-fun res!191339 () Bool)

(assert (=> b!228090 (=> (not res!191339) (not e!156254))))

(declare-fun lt!365529 () tuple2!19636)

(assert (=> b!228090 (= res!191339 (= (buf!5586 (_2!10696 lt!365529)) (buf!5586 thiss!1870)))))

(declare-fun lt!365531 () (_ BitVec 8))

(declare-fun lt!365534 () (_ BitVec 8))

(declare-fun Unit!17113 () Unit!17097)

(declare-fun Unit!17114 () Unit!17097)

(assert (=> b!228090 (= lt!365529 (tuple2!19637 (_2!10701 (ite (bvsgt ((_ sign_extend 24) lt!365531) #b00000000000000000000000000000000) (tuple2!19643 Unit!17113 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!365534) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6026 (buf!5586 thiss!1870)) (bvadd (currentByte!10436 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!365531)))))))) (tuple2!19643 Unit!17114 lt!365534))) (BitStream!9187 (buf!5586 thiss!1870) (bvadd (currentByte!10436 thiss!1870) #b00000000000000000000000000000001) (currentBit!10431 thiss!1870))))))

(assert (=> b!228090 (= lt!365534 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6026 (buf!5586 thiss!1870)) (currentByte!10436 thiss!1870))) ((_ sign_extend 24) lt!365531))))))

(assert (=> b!228090 (= lt!365531 ((_ extract 7 0) (currentBit!10431 thiss!1870)))))

(declare-fun lt!365533 () (_ BitVec 64))

(declare-fun b!228091 () Bool)

(declare-fun lt!365532 () (_ BitVec 64))

(assert (=> b!228091 (= e!156254 (= (bitIndex!0 (size!5045 (buf!5586 (_2!10696 lt!365529))) (currentByte!10436 (_2!10696 lt!365529)) (currentBit!10431 (_2!10696 lt!365529))) (bvadd lt!365533 lt!365532)))))

(assert (=> b!228091 (or (not (= (bvand lt!365533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365532 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!365533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!365533 lt!365532) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!228091 (= lt!365532 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!228091 (= lt!365533 (bitIndex!0 (size!5045 (buf!5586 thiss!1870)) (currentByte!10436 thiss!1870) (currentBit!10431 thiss!1870)))))

(assert (= (and d!77362 res!191340) b!228090))

(assert (= (and b!228090 res!191339) b!228091))

(declare-fun m!351397 () Bool)

(assert (=> d!77362 m!351397))

(declare-fun m!351399 () Bool)

(assert (=> d!77362 m!351399))

(declare-fun m!351401 () Bool)

(assert (=> d!77362 m!351401))

(assert (=> b!228090 m!351401))

(assert (=> b!228090 m!351397))

(declare-fun m!351403 () Bool)

(assert (=> b!228091 m!351403))

(assert (=> b!228091 m!351305))

(assert (=> b!228047 d!77362))

(declare-fun d!77371 () Bool)

(declare-fun e!156260 () Bool)

(assert (=> d!77371 e!156260))

(declare-fun res!191349 () Bool)

(assert (=> d!77371 (=> (not res!191349) (not e!156260))))

(declare-fun lt!365555 () (_ BitVec 64))

(declare-fun lt!365554 () (_ BitVec 64))

(declare-fun lt!365557 () (_ BitVec 64))

(assert (=> d!77371 (= res!191349 (= lt!365557 (bvsub lt!365554 lt!365555)))))

(assert (=> d!77371 (or (= (bvand lt!365554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365555 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!365554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!365554 lt!365555) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77371 (= lt!365555 (remainingBits!0 ((_ sign_extend 32) (size!5045 (buf!5586 thiss!1870))) ((_ sign_extend 32) (currentByte!10436 thiss!1870)) ((_ sign_extend 32) (currentBit!10431 thiss!1870))))))

(declare-fun lt!365558 () (_ BitVec 64))

(declare-fun lt!365559 () (_ BitVec 64))

(assert (=> d!77371 (= lt!365554 (bvmul lt!365558 lt!365559))))

(assert (=> d!77371 (or (= lt!365558 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!365559 (bvsdiv (bvmul lt!365558 lt!365559) lt!365558)))))

(assert (=> d!77371 (= lt!365559 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77371 (= lt!365558 ((_ sign_extend 32) (size!5045 (buf!5586 thiss!1870))))))

(assert (=> d!77371 (= lt!365557 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10436 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10431 thiss!1870))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77371 (invariant!0 (currentBit!10431 thiss!1870) (currentByte!10436 thiss!1870) (size!5045 (buf!5586 thiss!1870)))))

(assert (=> d!77371 (= (bitIndex!0 (size!5045 (buf!5586 thiss!1870)) (currentByte!10436 thiss!1870) (currentBit!10431 thiss!1870)) lt!365557)))

(declare-fun b!228101 () Bool)

(declare-fun res!191348 () Bool)

(assert (=> b!228101 (=> (not res!191348) (not e!156260))))

(assert (=> b!228101 (= res!191348 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!365557))))

(declare-fun b!228102 () Bool)

(declare-fun lt!365556 () (_ BitVec 64))

(assert (=> b!228102 (= e!156260 (bvsle lt!365557 (bvmul lt!365556 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228102 (or (= lt!365556 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365556 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365556)))))

(assert (=> b!228102 (= lt!365556 ((_ sign_extend 32) (size!5045 (buf!5586 thiss!1870))))))

(assert (= (and d!77371 res!191349) b!228101))

(assert (= (and b!228101 res!191348) b!228102))

(declare-fun m!351413 () Bool)

(assert (=> d!77371 m!351413))

(declare-fun m!351415 () Bool)

(assert (=> d!77371 m!351415))

(assert (=> b!228047 d!77371))

(declare-fun d!77377 () Bool)

(declare-fun e!156263 () Bool)

(assert (=> d!77377 e!156263))

(declare-fun res!191352 () Bool)

(assert (=> d!77377 (=> (not res!191352) (not e!156263))))

(assert (=> d!77377 (= res!191352 (and (or (let ((rhs!4006 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4006 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4006) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77378 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77378 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77378 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!4005 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4005 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4005) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!365566 () Unit!17097)

(declare-fun choose!57 (BitStream!9186 BitStream!9186 (_ BitVec 64) (_ BitVec 32)) Unit!17097)

(assert (=> d!77377 (= lt!365566 (choose!57 thiss!1870 (_2!10696 lt!365403) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77377 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10696 lt!365403) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!365566)))

(declare-fun lt!365567 () (_ BitVec 32))

(declare-fun b!228105 () Bool)

(assert (=> b!228105 (= e!156263 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10696 lt!365403)))) ((_ sign_extend 32) (currentByte!10436 (_2!10696 lt!365403))) ((_ sign_extend 32) (currentBit!10431 (_2!10696 lt!365403))) (bvsub (bvsub to!496 i!761) lt!365567)))))

(assert (=> b!228105 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!365567 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!365567) #b10000000000000000000000000000000)))))

(declare-fun lt!365568 () (_ BitVec 64))

(assert (=> b!228105 (= lt!365567 ((_ extract 31 0) lt!365568))))

(assert (=> b!228105 (and (bvslt lt!365568 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!365568 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!228105 (= lt!365568 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77377 res!191352) b!228105))

(declare-fun m!351417 () Bool)

(assert (=> d!77377 m!351417))

(declare-fun m!351419 () Bool)

(assert (=> b!228105 m!351419))

(assert (=> b!228047 d!77377))

(declare-fun d!77380 () Bool)

(declare-fun e!156266 () Bool)

(assert (=> d!77380 e!156266))

(declare-fun res!191355 () Bool)

(assert (=> d!77380 (=> (not res!191355) (not e!156266))))

(assert (=> d!77380 (= res!191355 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5045 arr!308))))))

(declare-fun lt!365571 () Unit!17097)

(declare-fun choose!327 (array!11497 (_ BitVec 32) (_ BitVec 8)) Unit!17097)

(assert (=> d!77380 (= lt!365571 (choose!327 arr!308 i!761 (_1!10696 lt!365403)))))

(assert (=> d!77380 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5045 arr!308)))))

(assert (=> d!77380 (= (arrayUpdatedAtPrefixLemma!440 arr!308 i!761 (_1!10696 lt!365403)) lt!365571)))

(declare-fun b!228108 () Bool)

(assert (=> b!228108 (= e!156266 (arrayRangesEq!881 arr!308 (array!11498 (store (arr!6026 arr!308) i!761 (_1!10696 lt!365403)) (size!5045 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77380 res!191355) b!228108))

(declare-fun m!351421 () Bool)

(assert (=> d!77380 m!351421))

(assert (=> b!228108 m!351293))

(declare-fun m!351423 () Bool)

(assert (=> b!228108 m!351423))

(assert (=> b!228047 d!77380))

(declare-fun d!77382 () Bool)

(declare-fun res!191360 () Bool)

(declare-fun e!156271 () Bool)

(assert (=> d!77382 (=> res!191360 e!156271)))

(assert (=> d!77382 (= res!191360 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77382 (= (arrayRangesEq!881 arr!308 (_3!878 lt!365404) #b00000000000000000000000000000000 i!761) e!156271)))

(declare-fun b!228113 () Bool)

(declare-fun e!156272 () Bool)

(assert (=> b!228113 (= e!156271 e!156272)))

(declare-fun res!191361 () Bool)

(assert (=> b!228113 (=> (not res!191361) (not e!156272))))

(assert (=> b!228113 (= res!191361 (= (select (arr!6026 arr!308) #b00000000000000000000000000000000) (select (arr!6026 (_3!878 lt!365404)) #b00000000000000000000000000000000)))))

(declare-fun b!228114 () Bool)

(assert (=> b!228114 (= e!156272 (arrayRangesEq!881 arr!308 (_3!878 lt!365404) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77382 (not res!191360)) b!228113))

(assert (= (and b!228113 res!191361) b!228114))

(declare-fun m!351425 () Bool)

(assert (=> b!228113 m!351425))

(declare-fun m!351427 () Bool)

(assert (=> b!228113 m!351427))

(declare-fun m!351429 () Bool)

(assert (=> b!228114 m!351429))

(assert (=> b!228047 d!77382))

(declare-fun d!77384 () Bool)

(assert (=> d!77384 (arrayRangesEq!881 arr!308 (_3!878 lt!365404) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365574 () Unit!17097)

(declare-fun choose!329 (array!11497 array!11497 array!11497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17097)

(assert (=> d!77384 (= lt!365574 (choose!329 arr!308 lt!365412 (_3!878 lt!365404) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77384 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77384 (= (arrayRangesEqTransitive!304 arr!308 lt!365412 (_3!878 lt!365404) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!365574)))

(declare-fun bs!18924 () Bool)

(assert (= bs!18924 d!77384))

(assert (=> bs!18924 m!351309))

(declare-fun m!351431 () Bool)

(assert (=> bs!18924 m!351431))

(assert (=> b!228047 d!77384))

(declare-fun b!228185 () Bool)

(declare-fun e!156322 () tuple3!1472)

(declare-fun lt!365962 () Unit!17097)

(declare-fun lt!365964 () tuple3!1472)

(assert (=> b!228185 (= e!156322 (tuple3!1473 lt!365962 (_2!10697 lt!365964) (_3!878 lt!365964)))))

(declare-fun lt!365951 () tuple2!19636)

(assert (=> b!228185 (= lt!365951 (readByte!0 (_2!10696 lt!365403)))))

(declare-fun lt!365940 () array!11497)

(assert (=> b!228185 (= lt!365940 (array!11498 (store (arr!6026 lt!365412) (bvadd #b00000000000000000000000000000001 i!761) (_1!10696 lt!365951)) (size!5045 lt!365412)))))

(declare-fun lt!365937 () (_ BitVec 64))

(assert (=> b!228185 (= lt!365937 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!365950 () (_ BitVec 32))

(assert (=> b!228185 (= lt!365950 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!365939 () Unit!17097)

(assert (=> b!228185 (= lt!365939 (validateOffsetBytesFromBitIndexLemma!0 (_2!10696 lt!365403) (_2!10696 lt!365951) lt!365937 lt!365950))))

(assert (=> b!228185 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10696 lt!365951)))) ((_ sign_extend 32) (currentByte!10436 (_2!10696 lt!365951))) ((_ sign_extend 32) (currentBit!10431 (_2!10696 lt!365951))) (bvsub lt!365950 ((_ extract 31 0) (bvsdiv (bvadd lt!365937 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!365963 () Unit!17097)

(assert (=> b!228185 (= lt!365963 lt!365939)))

(assert (=> b!228185 (= lt!365964 (readByteArrayLoop!0 (_2!10696 lt!365951) lt!365940 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3908 () (_ BitVec 64))

(assert (=> b!228185 (= (bitIndex!0 (size!5045 (buf!5586 (_2!10696 lt!365951))) (currentByte!10436 (_2!10696 lt!365951)) (currentBit!10431 (_2!10696 lt!365951))) (bvadd call!3908 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!365936 () Unit!17097)

(declare-fun Unit!17125 () Unit!17097)

(assert (=> b!228185 (= lt!365936 Unit!17125)))

(assert (=> b!228185 (= (bvadd (bitIndex!0 (size!5045 (buf!5586 (_2!10696 lt!365951))) (currentByte!10436 (_2!10696 lt!365951)) (currentBit!10431 (_2!10696 lt!365951))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5045 (buf!5586 (_2!10697 lt!365964))) (currentByte!10436 (_2!10697 lt!365964)) (currentBit!10431 (_2!10697 lt!365964))))))

(declare-fun lt!365965 () Unit!17097)

(declare-fun Unit!17126 () Unit!17097)

(assert (=> b!228185 (= lt!365965 Unit!17126)))

(assert (=> b!228185 (= (bvadd call!3908 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5045 (buf!5586 (_2!10697 lt!365964))) (currentByte!10436 (_2!10697 lt!365964)) (currentBit!10431 (_2!10697 lt!365964))))))

(declare-fun lt!365946 () Unit!17097)

(declare-fun Unit!17127 () Unit!17097)

(assert (=> b!228185 (= lt!365946 Unit!17127)))

(assert (=> b!228185 (and (= (buf!5586 (_2!10696 lt!365403)) (buf!5586 (_2!10697 lt!365964))) (= (size!5045 lt!365412) (size!5045 (_3!878 lt!365964))))))

(declare-fun lt!365956 () Unit!17097)

(declare-fun Unit!17128 () Unit!17097)

(assert (=> b!228185 (= lt!365956 Unit!17128)))

(declare-fun lt!365943 () Unit!17097)

(assert (=> b!228185 (= lt!365943 (arrayUpdatedAtPrefixLemma!440 lt!365412 (bvadd #b00000000000000000000000000000001 i!761) (_1!10696 lt!365951)))))

(declare-fun call!3909 () Bool)

(assert (=> b!228185 call!3909))

(declare-fun lt!365966 () Unit!17097)

(assert (=> b!228185 (= lt!365966 lt!365943)))

(declare-fun lt!365960 () (_ BitVec 32))

(assert (=> b!228185 (= lt!365960 #b00000000000000000000000000000000)))

(declare-fun lt!365952 () Unit!17097)

(assert (=> b!228185 (= lt!365952 (arrayRangesEqTransitive!304 lt!365412 lt!365940 (_3!878 lt!365964) lt!365960 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!228185 (arrayRangesEq!881 lt!365412 (_3!878 lt!365964) lt!365960 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!365942 () Unit!17097)

(assert (=> b!228185 (= lt!365942 lt!365952)))

(declare-fun call!3907 () Bool)

(assert (=> b!228185 call!3907))

(declare-fun lt!365938 () Unit!17097)

(declare-fun Unit!17131 () Unit!17097)

(assert (=> b!228185 (= lt!365938 Unit!17131)))

(declare-fun lt!365957 () Unit!17097)

(assert (=> b!228185 (= lt!365957 (arrayRangesEqImpliesEq!137 lt!365940 (_3!878 lt!365964) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!228185 (= (select (store (arr!6026 lt!365412) (bvadd #b00000000000000000000000000000001 i!761) (_1!10696 lt!365951)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!6026 (_3!878 lt!365964)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!365941 () Unit!17097)

(assert (=> b!228185 (= lt!365941 lt!365957)))

(declare-fun lt!365958 () Bool)

(assert (=> b!228185 (= lt!365958 (= (select (arr!6026 (_3!878 lt!365964)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10696 lt!365951)))))

(declare-fun Unit!17132 () Unit!17097)

(assert (=> b!228185 (= lt!365962 Unit!17132)))

(assert (=> b!228185 lt!365958))

(declare-fun bm!3904 () Bool)

(assert (=> bm!3904 (= call!3908 (bitIndex!0 (size!5045 (buf!5586 (_2!10696 lt!365403))) (currentByte!10436 (_2!10696 lt!365403)) (currentBit!10431 (_2!10696 lt!365403))))))

(declare-fun lt!365968 () Unit!17097)

(declare-fun b!228186 () Bool)

(assert (=> b!228186 (= e!156322 (tuple3!1473 lt!365968 (_2!10696 lt!365403) lt!365412))))

(assert (=> b!228186 (= call!3908 call!3908)))

(declare-fun lt!365949 () Unit!17097)

(declare-fun Unit!17133 () Unit!17097)

(assert (=> b!228186 (= lt!365949 Unit!17133)))

(declare-fun lt!365945 () Unit!17097)

(declare-fun arrayRangesEqReflexiveLemma!141 (array!11497) Unit!17097)

(assert (=> b!228186 (= lt!365945 (arrayRangesEqReflexiveLemma!141 lt!365412))))

(assert (=> b!228186 call!3909))

(declare-fun lt!365944 () Unit!17097)

(assert (=> b!228186 (= lt!365944 lt!365945)))

(declare-fun lt!365959 () array!11497)

(assert (=> b!228186 (= lt!365959 lt!365412)))

(declare-fun lt!365935 () array!11497)

(assert (=> b!228186 (= lt!365935 lt!365412)))

(declare-fun lt!365948 () (_ BitVec 32))

(assert (=> b!228186 (= lt!365948 #b00000000000000000000000000000000)))

(declare-fun lt!365969 () (_ BitVec 32))

(assert (=> b!228186 (= lt!365969 (size!5045 lt!365412))))

(declare-fun lt!365955 () (_ BitVec 32))

(assert (=> b!228186 (= lt!365955 #b00000000000000000000000000000000)))

(declare-fun lt!365970 () (_ BitVec 32))

(assert (=> b!228186 (= lt!365970 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!126 (array!11497 array!11497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17097)

(assert (=> b!228186 (= lt!365968 (arrayRangesEqSlicedLemma!126 lt!365959 lt!365935 lt!365948 lt!365969 lt!365955 lt!365970))))

(assert (=> b!228186 call!3907))

(declare-fun lt!365947 () tuple3!1472)

(declare-fun b!228187 () Bool)

(declare-fun e!156324 () Bool)

(assert (=> b!228187 (= e!156324 (arrayRangesEq!881 lt!365412 (_3!878 lt!365947) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun d!77386 () Bool)

(declare-fun e!156323 () Bool)

(assert (=> d!77386 e!156323))

(declare-fun res!191419 () Bool)

(assert (=> d!77386 (=> res!191419 e!156323)))

(assert (=> d!77386 (= res!191419 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!365961 () Bool)

(assert (=> d!77386 (= lt!365961 e!156324)))

(declare-fun res!191418 () Bool)

(assert (=> d!77386 (=> (not res!191418) (not e!156324))))

(declare-fun lt!365953 () (_ BitVec 64))

(declare-fun lt!365967 () (_ BitVec 64))

(assert (=> d!77386 (= res!191418 (= (bvadd lt!365953 lt!365967) (bitIndex!0 (size!5045 (buf!5586 (_2!10697 lt!365947))) (currentByte!10436 (_2!10697 lt!365947)) (currentBit!10431 (_2!10697 lt!365947)))))))

(assert (=> d!77386 (or (not (= (bvand lt!365953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365967 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!365953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!365953 lt!365967) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!365954 () (_ BitVec 64))

(assert (=> d!77386 (= lt!365967 (bvmul lt!365954 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77386 (or (= lt!365954 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365954 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365954)))))

(assert (=> d!77386 (= lt!365954 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77386 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77386 (= lt!365953 (bitIndex!0 (size!5045 (buf!5586 (_2!10696 lt!365403))) (currentByte!10436 (_2!10696 lt!365403)) (currentBit!10431 (_2!10696 lt!365403))))))

(assert (=> d!77386 (= lt!365947 e!156322)))

(declare-fun c!11230 () Bool)

(assert (=> d!77386 (= c!11230 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77386 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5045 lt!365412)))))

(assert (=> d!77386 (= (readByteArrayLoop!0 (_2!10696 lt!365403) lt!365412 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!365947)))

(declare-fun b!228188 () Bool)

(declare-fun res!191417 () Bool)

(assert (=> b!228188 (=> (not res!191417) (not e!156324))))

(assert (=> b!228188 (= res!191417 (and (= (buf!5586 (_2!10696 lt!365403)) (buf!5586 (_2!10697 lt!365947))) (= (size!5045 lt!365412) (size!5045 (_3!878 lt!365947)))))))

(declare-fun bm!3905 () Bool)

(assert (=> bm!3905 (= call!3909 (arrayRangesEq!881 lt!365412 (ite c!11230 (array!11498 (store (arr!6026 lt!365412) (bvadd #b00000000000000000000000000000001 i!761) (_1!10696 lt!365951)) (size!5045 lt!365412)) lt!365412) #b00000000000000000000000000000000 (ite c!11230 (bvadd #b00000000000000000000000000000001 i!761) (size!5045 lt!365412))))))

(declare-fun b!228189 () Bool)

(declare-datatypes ((tuple2!19650 0))(
  ( (tuple2!19651 (_1!10705 BitStream!9186) (_2!10705 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9186) tuple2!19650)

(assert (=> b!228189 (= e!156323 (= (select (arr!6026 (_3!878 lt!365947)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10705 (readBytePure!0 (_2!10696 lt!365403)))))))

(assert (=> b!228189 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5045 (_3!878 lt!365947))))))

(declare-fun bm!3906 () Bool)

(assert (=> bm!3906 (= call!3907 (arrayRangesEq!881 (ite c!11230 lt!365412 lt!365959) (ite c!11230 (_3!878 lt!365964) lt!365935) (ite c!11230 #b00000000000000000000000000000000 lt!365955) (ite c!11230 (bvadd #b00000000000000000000000000000001 i!761) lt!365970)))))

(assert (= (and d!77386 c!11230) b!228185))

(assert (= (and d!77386 (not c!11230)) b!228186))

(assert (= (or b!228185 b!228186) bm!3906))

(assert (= (or b!228185 b!228186) bm!3905))

(assert (= (or b!228185 b!228186) bm!3904))

(assert (= (and d!77386 res!191418) b!228188))

(assert (= (and b!228188 res!191417) b!228187))

(assert (= (and d!77386 (not res!191419)) b!228189))

(declare-fun m!351559 () Bool)

(assert (=> d!77386 m!351559))

(assert (=> d!77386 m!351283))

(declare-fun m!351561 () Bool)

(assert (=> b!228185 m!351561))

(declare-fun m!351563 () Bool)

(assert (=> b!228185 m!351563))

(declare-fun m!351565 () Bool)

(assert (=> b!228185 m!351565))

(declare-fun m!351567 () Bool)

(assert (=> b!228185 m!351567))

(declare-fun m!351569 () Bool)

(assert (=> b!228185 m!351569))

(declare-fun m!351571 () Bool)

(assert (=> b!228185 m!351571))

(declare-fun m!351573 () Bool)

(assert (=> b!228185 m!351573))

(declare-fun m!351575 () Bool)

(assert (=> b!228185 m!351575))

(declare-fun m!351577 () Bool)

(assert (=> b!228185 m!351577))

(declare-fun m!351579 () Bool)

(assert (=> b!228185 m!351579))

(declare-fun m!351581 () Bool)

(assert (=> b!228185 m!351581))

(declare-fun m!351583 () Bool)

(assert (=> b!228185 m!351583))

(declare-fun m!351585 () Bool)

(assert (=> b!228185 m!351585))

(declare-fun m!351587 () Bool)

(assert (=> bm!3906 m!351587))

(assert (=> bm!3904 m!351283))

(assert (=> bm!3905 m!351585))

(declare-fun m!351589 () Bool)

(assert (=> bm!3905 m!351589))

(declare-fun m!351591 () Bool)

(assert (=> b!228186 m!351591))

(declare-fun m!351593 () Bool)

(assert (=> b!228186 m!351593))

(declare-fun m!351595 () Bool)

(assert (=> b!228187 m!351595))

(declare-fun m!351597 () Bool)

(assert (=> b!228189 m!351597))

(declare-fun m!351599 () Bool)

(assert (=> b!228189 m!351599))

(assert (=> b!228047 d!77386))

(declare-fun d!77419 () Bool)

(declare-fun e!156325 () Bool)

(assert (=> d!77419 e!156325))

(declare-fun res!191421 () Bool)

(assert (=> d!77419 (=> (not res!191421) (not e!156325))))

(declare-fun lt!365971 () (_ BitVec 64))

(declare-fun lt!365972 () (_ BitVec 64))

(declare-fun lt!365974 () (_ BitVec 64))

(assert (=> d!77419 (= res!191421 (= lt!365974 (bvsub lt!365971 lt!365972)))))

(assert (=> d!77419 (or (= (bvand lt!365971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365972 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!365971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!365971 lt!365972) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77419 (= lt!365972 (remainingBits!0 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10696 lt!365403)))) ((_ sign_extend 32) (currentByte!10436 (_2!10696 lt!365403))) ((_ sign_extend 32) (currentBit!10431 (_2!10696 lt!365403)))))))

(declare-fun lt!365975 () (_ BitVec 64))

(declare-fun lt!365976 () (_ BitVec 64))

(assert (=> d!77419 (= lt!365971 (bvmul lt!365975 lt!365976))))

(assert (=> d!77419 (or (= lt!365975 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!365976 (bvsdiv (bvmul lt!365975 lt!365976) lt!365975)))))

(assert (=> d!77419 (= lt!365976 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77419 (= lt!365975 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10696 lt!365403)))))))

(assert (=> d!77419 (= lt!365974 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10436 (_2!10696 lt!365403))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10431 (_2!10696 lt!365403)))))))

(assert (=> d!77419 (invariant!0 (currentBit!10431 (_2!10696 lt!365403)) (currentByte!10436 (_2!10696 lt!365403)) (size!5045 (buf!5586 (_2!10696 lt!365403))))))

(assert (=> d!77419 (= (bitIndex!0 (size!5045 (buf!5586 (_2!10696 lt!365403))) (currentByte!10436 (_2!10696 lt!365403)) (currentBit!10431 (_2!10696 lt!365403))) lt!365974)))

(declare-fun b!228190 () Bool)

(declare-fun res!191420 () Bool)

(assert (=> b!228190 (=> (not res!191420) (not e!156325))))

(assert (=> b!228190 (= res!191420 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!365974))))

(declare-fun b!228191 () Bool)

(declare-fun lt!365973 () (_ BitVec 64))

(assert (=> b!228191 (= e!156325 (bvsle lt!365974 (bvmul lt!365973 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228191 (or (= lt!365973 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365973 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365973)))))

(assert (=> b!228191 (= lt!365973 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10696 lt!365403)))))))

(assert (= (and d!77419 res!191421) b!228190))

(assert (= (and b!228190 res!191420) b!228191))

(declare-fun m!351601 () Bool)

(assert (=> d!77419 m!351601))

(declare-fun m!351603 () Bool)

(assert (=> d!77419 m!351603))

(assert (=> b!228047 d!77419))

(declare-fun d!77421 () Bool)

(declare-fun e!156326 () Bool)

(assert (=> d!77421 e!156326))

(declare-fun res!191423 () Bool)

(assert (=> d!77421 (=> (not res!191423) (not e!156326))))

(declare-fun lt!365980 () (_ BitVec 64))

(declare-fun lt!365977 () (_ BitVec 64))

(declare-fun lt!365978 () (_ BitVec 64))

(assert (=> d!77421 (= res!191423 (= lt!365980 (bvsub lt!365977 lt!365978)))))

(assert (=> d!77421 (or (= (bvand lt!365977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365978 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!365977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!365977 lt!365978) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77421 (= lt!365978 (remainingBits!0 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10697 lt!365404)))) ((_ sign_extend 32) (currentByte!10436 (_2!10697 lt!365404))) ((_ sign_extend 32) (currentBit!10431 (_2!10697 lt!365404)))))))

(declare-fun lt!365981 () (_ BitVec 64))

(declare-fun lt!365982 () (_ BitVec 64))

(assert (=> d!77421 (= lt!365977 (bvmul lt!365981 lt!365982))))

(assert (=> d!77421 (or (= lt!365981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!365982 (bvsdiv (bvmul lt!365981 lt!365982) lt!365981)))))

(assert (=> d!77421 (= lt!365982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77421 (= lt!365981 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10697 lt!365404)))))))

(assert (=> d!77421 (= lt!365980 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10436 (_2!10697 lt!365404))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10431 (_2!10697 lt!365404)))))))

(assert (=> d!77421 (invariant!0 (currentBit!10431 (_2!10697 lt!365404)) (currentByte!10436 (_2!10697 lt!365404)) (size!5045 (buf!5586 (_2!10697 lt!365404))))))

(assert (=> d!77421 (= (bitIndex!0 (size!5045 (buf!5586 (_2!10697 lt!365404))) (currentByte!10436 (_2!10697 lt!365404)) (currentBit!10431 (_2!10697 lt!365404))) lt!365980)))

(declare-fun b!228192 () Bool)

(declare-fun res!191422 () Bool)

(assert (=> b!228192 (=> (not res!191422) (not e!156326))))

(assert (=> b!228192 (= res!191422 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!365980))))

(declare-fun b!228193 () Bool)

(declare-fun lt!365979 () (_ BitVec 64))

(assert (=> b!228193 (= e!156326 (bvsle lt!365980 (bvmul lt!365979 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228193 (or (= lt!365979 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365979 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365979)))))

(assert (=> b!228193 (= lt!365979 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10697 lt!365404)))))))

(assert (= (and d!77421 res!191423) b!228192))

(assert (= (and b!228192 res!191422) b!228193))

(declare-fun m!351605 () Bool)

(assert (=> d!77421 m!351605))

(declare-fun m!351607 () Bool)

(assert (=> d!77421 m!351607))

(assert (=> b!228047 d!77421))

(declare-fun d!77423 () Bool)

(assert (=> d!77423 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10696 lt!365403)))) ((_ sign_extend 32) (currentByte!10436 (_2!10696 lt!365403))) ((_ sign_extend 32) (currentBit!10431 (_2!10696 lt!365403))) lt!365411) (bvsle ((_ sign_extend 32) lt!365411) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5045 (buf!5586 (_2!10696 lt!365403)))) ((_ sign_extend 32) (currentByte!10436 (_2!10696 lt!365403))) ((_ sign_extend 32) (currentBit!10431 (_2!10696 lt!365403)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18930 () Bool)

(assert (= bs!18930 d!77423))

(assert (=> bs!18930 m!351601))

(assert (=> b!228047 d!77423))

(declare-fun d!77425 () Bool)

(declare-fun res!191424 () Bool)

(declare-fun e!156327 () Bool)

(assert (=> d!77425 (=> res!191424 e!156327)))

(assert (=> d!77425 (= res!191424 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77425 (= (arrayRangesEq!881 arr!308 lt!365412 #b00000000000000000000000000000000 i!761) e!156327)))

(declare-fun b!228194 () Bool)

(declare-fun e!156328 () Bool)

(assert (=> b!228194 (= e!156327 e!156328)))

(declare-fun res!191425 () Bool)

(assert (=> b!228194 (=> (not res!191425) (not e!156328))))

(assert (=> b!228194 (= res!191425 (= (select (arr!6026 arr!308) #b00000000000000000000000000000000) (select (arr!6026 lt!365412) #b00000000000000000000000000000000)))))

(declare-fun b!228195 () Bool)

(assert (=> b!228195 (= e!156328 (arrayRangesEq!881 arr!308 lt!365412 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77425 (not res!191424)) b!228194))

(assert (= (and b!228194 res!191425) b!228195))

(assert (=> b!228194 m!351425))

(declare-fun m!351609 () Bool)

(assert (=> b!228194 m!351609))

(declare-fun m!351611 () Bool)

(assert (=> b!228195 m!351611))

(assert (=> b!228047 d!77425))

(declare-fun d!77427 () Bool)

(assert (=> d!77427 (= (array_inv!4786 arr!308) (bvsge (size!5045 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47938 d!77427))

(declare-fun d!77429 () Bool)

(assert (=> d!77429 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10431 thiss!1870) (currentByte!10436 thiss!1870) (size!5045 (buf!5586 thiss!1870))))))

(declare-fun bs!18931 () Bool)

(assert (= bs!18931 d!77429))

(assert (=> bs!18931 m!351415))

(assert (=> start!47938 d!77429))

(declare-fun d!77431 () Bool)

(assert (=> d!77431 (= (array_inv!4786 (buf!5586 thiss!1870)) (bvsge (size!5045 (buf!5586 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!228048 d!77431))

(declare-fun d!77433 () Bool)

(assert (=> d!77433 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5045 (buf!5586 thiss!1870))) ((_ sign_extend 32) (currentByte!10436 thiss!1870)) ((_ sign_extend 32) (currentBit!10431 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5045 (buf!5586 thiss!1870))) ((_ sign_extend 32) (currentByte!10436 thiss!1870)) ((_ sign_extend 32) (currentBit!10431 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18932 () Bool)

(assert (= bs!18932 d!77433))

(assert (=> bs!18932 m!351413))

(assert (=> b!228045 d!77433))

(check-sat (not bm!3905) (not d!77386) (not b!228189) (not b!228187) (not d!77356) (not b!228105) (not b!228185) (not b!228114) (not b!228091) (not d!77362) (not b!228186) (not b!228108) (not bm!3904) (not d!77380) (not d!77419) (not bm!3906) (not d!77423) (not d!77371) (not b!228195) (not d!77377) (not d!77421) (not d!77384) (not d!77429) (not d!77433))
