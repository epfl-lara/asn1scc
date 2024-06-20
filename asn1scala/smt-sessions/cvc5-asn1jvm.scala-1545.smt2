; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43338 () Bool)

(assert start!43338)

(declare-fun b!204475 () Bool)

(declare-fun e!140018 () Bool)

(declare-fun e!140019 () Bool)

(assert (=> b!204475 (= e!140018 e!140019)))

(declare-fun res!171347 () Bool)

(assert (=> b!204475 (=> res!171347 e!140019)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!319448 () (_ BitVec 64))

(declare-fun lt!319444 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!204475 (= res!171347 (not (= lt!319448 (bvsub (bvsub (bvadd lt!319444 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!10340 0))(
  ( (array!10341 (arr!5476 (Array (_ BitVec 32) (_ BitVec 8))) (size!4546 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8200 0))(
  ( (BitStream!8201 (buf!5051 array!10340) (currentByte!9536 (_ BitVec 32)) (currentBit!9531 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14583 0))(
  ( (Unit!14584) )
))
(declare-datatypes ((tuple2!17492 0))(
  ( (tuple2!17493 (_1!9398 Unit!14583) (_2!9398 BitStream!8200)) )
))
(declare-fun lt!319447 () tuple2!17492)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204475 (= lt!319448 (bitIndex!0 (size!4546 (buf!5051 (_2!9398 lt!319447))) (currentByte!9536 (_2!9398 lt!319447)) (currentBit!9531 (_2!9398 lt!319447))))))

(declare-fun thiss!1204 () BitStream!8200)

(declare-fun isPrefixOf!0 (BitStream!8200 BitStream!8200) Bool)

(assert (=> b!204475 (isPrefixOf!0 thiss!1204 (_2!9398 lt!319447))))

(declare-fun lt!319443 () Unit!14583)

(declare-fun lt!319439 () tuple2!17492)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8200 BitStream!8200 BitStream!8200) Unit!14583)

(assert (=> b!204475 (= lt!319443 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9398 lt!319439) (_2!9398 lt!319447)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8200 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17492)

(assert (=> b!204475 (= lt!319447 (appendBitsLSBFirstLoopTR!0 (_2!9398 lt!319439) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!204476 () Bool)

(declare-fun res!171353 () Bool)

(assert (=> b!204476 (=> res!171353 e!140019)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204476 (= res!171353 (not (invariant!0 (currentBit!9531 (_2!9398 lt!319447)) (currentByte!9536 (_2!9398 lt!319447)) (size!4546 (buf!5051 (_2!9398 lt!319447))))))))

(declare-fun b!204477 () Bool)

(declare-fun e!140022 () Bool)

(declare-fun e!140021 () Bool)

(assert (=> b!204477 (= e!140022 e!140021)))

(declare-fun res!171355 () Bool)

(assert (=> b!204477 (=> (not res!171355) (not e!140021))))

(declare-fun lt!319440 () (_ BitVec 64))

(declare-fun lt!319441 () (_ BitVec 64))

(assert (=> b!204477 (= res!171355 (= lt!319440 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319441)))))

(assert (=> b!204477 (= lt!319440 (bitIndex!0 (size!4546 (buf!5051 (_2!9398 lt!319439))) (currentByte!9536 (_2!9398 lt!319439)) (currentBit!9531 (_2!9398 lt!319439))))))

(assert (=> b!204477 (= lt!319441 (bitIndex!0 (size!4546 (buf!5051 thiss!1204)) (currentByte!9536 thiss!1204) (currentBit!9531 thiss!1204)))))

(declare-fun b!204478 () Bool)

(declare-fun e!140016 () Bool)

(assert (=> b!204478 (= e!140021 e!140016)))

(declare-fun res!171345 () Bool)

(assert (=> b!204478 (=> (not res!171345) (not e!140016))))

(declare-fun lt!319446 () Bool)

(declare-datatypes ((tuple2!17494 0))(
  ( (tuple2!17495 (_1!9399 BitStream!8200) (_2!9399 Bool)) )
))
(declare-fun lt!319442 () tuple2!17494)

(assert (=> b!204478 (= res!171345 (and (= (_2!9399 lt!319442) lt!319446) (= (_1!9399 lt!319442) (_2!9398 lt!319439))))))

(declare-fun readBitPure!0 (BitStream!8200) tuple2!17494)

(declare-fun readerFrom!0 (BitStream!8200 (_ BitVec 32) (_ BitVec 32)) BitStream!8200)

(assert (=> b!204478 (= lt!319442 (readBitPure!0 (readerFrom!0 (_2!9398 lt!319439) (currentBit!9531 thiss!1204) (currentByte!9536 thiss!1204))))))

(declare-fun res!171346 () Bool)

(declare-fun e!140015 () Bool)

(assert (=> start!43338 (=> (not res!171346) (not e!140015))))

(assert (=> start!43338 (= res!171346 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43338 e!140015))

(assert (=> start!43338 true))

(declare-fun e!140017 () Bool)

(declare-fun inv!12 (BitStream!8200) Bool)

(assert (=> start!43338 (and (inv!12 thiss!1204) e!140017)))

(declare-fun b!204479 () Bool)

(declare-fun res!171351 () Bool)

(assert (=> b!204479 (=> res!171351 e!140019)))

(assert (=> b!204479 (= res!171351 (not (isPrefixOf!0 (_2!9398 lt!319439) (_2!9398 lt!319447))))))

(declare-fun b!204480 () Bool)

(declare-fun res!171354 () Bool)

(assert (=> b!204480 (=> (not res!171354) (not e!140015))))

(assert (=> b!204480 (= res!171354 (invariant!0 (currentBit!9531 thiss!1204) (currentByte!9536 thiss!1204) (size!4546 (buf!5051 thiss!1204))))))

(declare-fun b!204481 () Bool)

(declare-fun res!171350 () Bool)

(assert (=> b!204481 (=> res!171350 e!140019)))

(declare-fun lt!319445 () (_ BitVec 64))

(assert (=> b!204481 (= res!171350 (or (not (= (size!4546 (buf!5051 (_2!9398 lt!319447))) (size!4546 (buf!5051 thiss!1204)))) (not (= lt!319448 (bvsub (bvadd lt!319445 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!204482 () Bool)

(declare-fun res!171356 () Bool)

(assert (=> b!204482 (=> (not res!171356) (not e!140015))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204482 (= res!171356 (validate_offset_bits!1 ((_ sign_extend 32) (size!4546 (buf!5051 thiss!1204))) ((_ sign_extend 32) (currentByte!9536 thiss!1204)) ((_ sign_extend 32) (currentBit!9531 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!204483 () Bool)

(declare-fun res!171348 () Bool)

(assert (=> b!204483 (=> (not res!171348) (not e!140021))))

(assert (=> b!204483 (= res!171348 (isPrefixOf!0 thiss!1204 (_2!9398 lt!319439)))))

(declare-fun b!204484 () Bool)

(declare-fun res!171344 () Bool)

(assert (=> b!204484 (=> res!171344 e!140019)))

(assert (=> b!204484 (= res!171344 (not (isPrefixOf!0 thiss!1204 (_2!9398 lt!319439))))))

(declare-fun b!204485 () Bool)

(declare-fun res!171343 () Bool)

(assert (=> b!204485 (=> (not res!171343) (not e!140015))))

(assert (=> b!204485 (= res!171343 (not (= i!590 nBits!348)))))

(declare-fun b!204486 () Bool)

(declare-fun array_inv!4287 (array!10340) Bool)

(assert (=> b!204486 (= e!140017 (array_inv!4287 (buf!5051 thiss!1204)))))

(declare-fun b!204487 () Bool)

(assert (=> b!204487 (= e!140019 (= (size!4546 (buf!5051 (_2!9398 lt!319439))) (size!4546 (buf!5051 (_2!9398 lt!319447)))))))

(assert (=> b!204487 (invariant!0 (currentBit!9531 thiss!1204) (currentByte!9536 thiss!1204) (size!4546 (buf!5051 (_2!9398 lt!319439))))))

(declare-fun b!204488 () Bool)

(assert (=> b!204488 (= e!140016 (= (bitIndex!0 (size!4546 (buf!5051 (_1!9399 lt!319442))) (currentByte!9536 (_1!9399 lt!319442)) (currentBit!9531 (_1!9399 lt!319442))) lt!319440))))

(declare-fun b!204489 () Bool)

(assert (=> b!204489 (= e!140015 (not e!140018))))

(declare-fun res!171349 () Bool)

(assert (=> b!204489 (=> res!171349 e!140018)))

(assert (=> b!204489 (= res!171349 (not (= lt!319444 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319445))))))

(assert (=> b!204489 (= lt!319444 (bitIndex!0 (size!4546 (buf!5051 (_2!9398 lt!319439))) (currentByte!9536 (_2!9398 lt!319439)) (currentBit!9531 (_2!9398 lt!319439))))))

(assert (=> b!204489 (= lt!319445 (bitIndex!0 (size!4546 (buf!5051 thiss!1204)) (currentByte!9536 thiss!1204) (currentBit!9531 thiss!1204)))))

(assert (=> b!204489 e!140022))

(declare-fun res!171352 () Bool)

(assert (=> b!204489 (=> (not res!171352) (not e!140022))))

(assert (=> b!204489 (= res!171352 (= (size!4546 (buf!5051 thiss!1204)) (size!4546 (buf!5051 (_2!9398 lt!319439)))))))

(declare-fun appendBit!0 (BitStream!8200 Bool) tuple2!17492)

(assert (=> b!204489 (= lt!319439 (appendBit!0 thiss!1204 lt!319446))))

(assert (=> b!204489 (= lt!319446 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!43338 res!171346) b!204482))

(assert (= (and b!204482 res!171356) b!204480))

(assert (= (and b!204480 res!171354) b!204485))

(assert (= (and b!204485 res!171343) b!204489))

(assert (= (and b!204489 res!171352) b!204477))

(assert (= (and b!204477 res!171355) b!204483))

(assert (= (and b!204483 res!171348) b!204478))

(assert (= (and b!204478 res!171345) b!204488))

(assert (= (and b!204489 (not res!171349)) b!204475))

(assert (= (and b!204475 (not res!171347)) b!204476))

(assert (= (and b!204476 (not res!171353)) b!204481))

(assert (= (and b!204481 (not res!171350)) b!204479))

(assert (= (and b!204479 (not res!171351)) b!204484))

(assert (= (and b!204484 (not res!171344)) b!204487))

(assert (= start!43338 b!204486))

(declare-fun m!315597 () Bool)

(assert (=> b!204480 m!315597))

(declare-fun m!315599 () Bool)

(assert (=> b!204476 m!315599))

(declare-fun m!315601 () Bool)

(assert (=> b!204489 m!315601))

(declare-fun m!315603 () Bool)

(assert (=> b!204489 m!315603))

(declare-fun m!315605 () Bool)

(assert (=> b!204489 m!315605))

(declare-fun m!315607 () Bool)

(assert (=> b!204483 m!315607))

(declare-fun m!315609 () Bool)

(assert (=> b!204482 m!315609))

(declare-fun m!315611 () Bool)

(assert (=> start!43338 m!315611))

(declare-fun m!315613 () Bool)

(assert (=> b!204479 m!315613))

(assert (=> b!204477 m!315601))

(assert (=> b!204477 m!315603))

(declare-fun m!315615 () Bool)

(assert (=> b!204475 m!315615))

(declare-fun m!315617 () Bool)

(assert (=> b!204475 m!315617))

(declare-fun m!315619 () Bool)

(assert (=> b!204475 m!315619))

(declare-fun m!315621 () Bool)

(assert (=> b!204475 m!315621))

(declare-fun m!315623 () Bool)

(assert (=> b!204486 m!315623))

(declare-fun m!315625 () Bool)

(assert (=> b!204488 m!315625))

(declare-fun m!315627 () Bool)

(assert (=> b!204487 m!315627))

(assert (=> b!204484 m!315607))

(declare-fun m!315629 () Bool)

(assert (=> b!204478 m!315629))

(assert (=> b!204478 m!315629))

(declare-fun m!315631 () Bool)

(assert (=> b!204478 m!315631))

(push 1)

(assert (not b!204475))

(assert (not b!204479))

