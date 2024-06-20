; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44092 () Bool)

(assert start!44092)

(declare-fun b!210124 () Bool)

(declare-fun e!143391 () Bool)

(declare-fun e!143393 () Bool)

(assert (=> b!210124 (= e!143391 e!143393)))

(declare-fun res!176430 () Bool)

(assert (=> b!210124 (=> res!176430 e!143393)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!329495 () (_ BitVec 64))

(declare-datatypes ((array!10485 0))(
  ( (array!10486 (arr!5538 (Array (_ BitVec 32) (_ BitVec 8))) (size!4608 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8324 0))(
  ( (BitStream!8325 (buf!5125 array!10485) (currentByte!9667 (_ BitVec 32)) (currentBit!9662 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18018 0))(
  ( (tuple2!18019 (_1!9664 BitStream!8324) (_2!9664 BitStream!8324)) )
))
(declare-fun lt!329490 () tuple2!18018)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!18020 0))(
  ( (tuple2!18021 (_1!9665 BitStream!8324) (_2!9665 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18020)

(assert (=> b!210124 (= res!176430 (not (= (_1!9665 (readNBitsLSBFirstsLoopPure!0 (_1!9664 lt!329490) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329495)) (_2!9664 lt!329490))))))

(declare-datatypes ((Unit!14966 0))(
  ( (Unit!14967) )
))
(declare-datatypes ((tuple2!18022 0))(
  ( (tuple2!18023 (_1!9666 Unit!14966) (_2!9666 BitStream!8324)) )
))
(declare-fun lt!329481 () tuple2!18022)

(declare-fun lt!329489 () tuple2!18022)

(declare-fun lt!329470 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210124 (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329489))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329489))) lt!329470)))

(declare-fun lt!329471 () Unit!14966)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8324 array!10485 (_ BitVec 64)) Unit!14966)

(assert (=> b!210124 (= lt!329471 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9666 lt!329489) (buf!5125 (_2!9666 lt!329481)) lt!329470))))

(assert (=> b!210124 (= lt!329470 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!329474 () (_ BitVec 64))

(declare-datatypes ((tuple2!18024 0))(
  ( (tuple2!18025 (_1!9667 BitStream!8324) (_2!9667 Bool)) )
))
(declare-fun lt!329472 () tuple2!18024)

(declare-fun lt!329480 () (_ BitVec 64))

(assert (=> b!210124 (= lt!329495 (bvor lt!329474 (ite (_2!9667 lt!329472) lt!329480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!329478 () tuple2!18020)

(declare-fun lt!329492 () tuple2!18018)

(assert (=> b!210124 (= lt!329478 (readNBitsLSBFirstsLoopPure!0 (_1!9664 lt!329492) nBits!348 i!590 lt!329474))))

(declare-fun thiss!1204 () BitStream!8324)

(declare-fun lt!329483 () (_ BitVec 64))

(assert (=> b!210124 (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))) ((_ sign_extend 32) (currentByte!9667 thiss!1204)) ((_ sign_extend 32) (currentBit!9662 thiss!1204)) lt!329483)))

(declare-fun lt!329475 () Unit!14966)

(assert (=> b!210124 (= lt!329475 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5125 (_2!9666 lt!329481)) lt!329483))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210124 (= lt!329474 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!329469 () Bool)

(assert (=> b!210124 (= (_2!9667 lt!329472) lt!329469)))

(declare-fun readBitPure!0 (BitStream!8324) tuple2!18024)

(assert (=> b!210124 (= lt!329472 (readBitPure!0 (_1!9664 lt!329492)))))

(declare-fun reader!0 (BitStream!8324 BitStream!8324) tuple2!18018)

(assert (=> b!210124 (= lt!329490 (reader!0 (_2!9666 lt!329489) (_2!9666 lt!329481)))))

(assert (=> b!210124 (= lt!329492 (reader!0 thiss!1204 (_2!9666 lt!329481)))))

(declare-fun e!143392 () Bool)

(assert (=> b!210124 e!143392))

(declare-fun res!176417 () Bool)

(assert (=> b!210124 (=> (not res!176417) (not e!143392))))

(declare-fun lt!329488 () tuple2!18024)

(declare-fun lt!329477 () tuple2!18024)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210124 (= res!176417 (= (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!329488))) (currentByte!9667 (_1!9667 lt!329488)) (currentBit!9662 (_1!9667 lt!329488))) (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!329477))) (currentByte!9667 (_1!9667 lt!329477)) (currentBit!9662 (_1!9667 lt!329477)))))))

(declare-fun lt!329494 () Unit!14966)

(declare-fun lt!329486 () BitStream!8324)

(declare-fun readBitPrefixLemma!0 (BitStream!8324 BitStream!8324) Unit!14966)

(assert (=> b!210124 (= lt!329494 (readBitPrefixLemma!0 lt!329486 (_2!9666 lt!329481)))))

(assert (=> b!210124 (= lt!329477 (readBitPure!0 (BitStream!8325 (buf!5125 (_2!9666 lt!329481)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204))))))

(assert (=> b!210124 (= lt!329488 (readBitPure!0 lt!329486))))

(declare-fun e!143386 () Bool)

(assert (=> b!210124 e!143386))

(declare-fun res!176431 () Bool)

(assert (=> b!210124 (=> (not res!176431) (not e!143386))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!210124 (= res!176431 (invariant!0 (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204) (size!4608 (buf!5125 (_2!9666 lt!329489)))))))

(assert (=> b!210124 (= lt!329486 (BitStream!8325 (buf!5125 (_2!9666 lt!329489)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)))))

(declare-fun b!210125 () Bool)

(declare-fun e!143390 () Bool)

(declare-fun array_inv!4349 (array!10485) Bool)

(assert (=> b!210125 (= e!143390 (array_inv!4349 (buf!5125 thiss!1204)))))

(declare-fun b!210126 () Bool)

(declare-fun e!143383 () Bool)

(assert (=> b!210126 (= e!143383 e!143391)))

(declare-fun res!176419 () Bool)

(assert (=> b!210126 (=> res!176419 e!143391)))

(declare-fun lt!329487 () (_ BitVec 64))

(declare-fun lt!329484 () (_ BitVec 64))

(assert (=> b!210126 (= res!176419 (not (= lt!329487 (bvsub (bvsub (bvadd lt!329484 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!210126 (= lt!329487 (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329481))) (currentByte!9667 (_2!9666 lt!329481)) (currentBit!9662 (_2!9666 lt!329481))))))

(declare-fun isPrefixOf!0 (BitStream!8324 BitStream!8324) Bool)

(assert (=> b!210126 (isPrefixOf!0 thiss!1204 (_2!9666 lt!329481))))

(declare-fun lt!329476 () Unit!14966)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8324 BitStream!8324 BitStream!8324) Unit!14966)

(assert (=> b!210126 (= lt!329476 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9666 lt!329489) (_2!9666 lt!329481)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8324 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18022)

(assert (=> b!210126 (= lt!329481 (appendBitsLSBFirstLoopTR!0 (_2!9666 lt!329489) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!176429 () Bool)

(declare-fun e!143389 () Bool)

(assert (=> start!44092 (=> (not res!176429) (not e!143389))))

(assert (=> start!44092 (= res!176429 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44092 e!143389))

(assert (=> start!44092 true))

(declare-fun inv!12 (BitStream!8324) Bool)

(assert (=> start!44092 (and (inv!12 thiss!1204) e!143390)))

(declare-fun b!210127 () Bool)

(declare-fun res!176421 () Bool)

(assert (=> b!210127 (=> res!176421 e!143391)))

(assert (=> b!210127 (= res!176421 (not (isPrefixOf!0 (_2!9666 lt!329489) (_2!9666 lt!329481))))))

(declare-fun b!210128 () Bool)

(declare-fun res!176420 () Bool)

(declare-fun e!143385 () Bool)

(assert (=> b!210128 (=> (not res!176420) (not e!143385))))

(assert (=> b!210128 (= res!176420 (invariant!0 (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204) (size!4608 (buf!5125 thiss!1204))))))

(declare-fun b!210129 () Bool)

(declare-fun res!176426 () Bool)

(declare-fun e!143387 () Bool)

(assert (=> b!210129 (=> (not res!176426) (not e!143387))))

(assert (=> b!210129 (= res!176426 (isPrefixOf!0 thiss!1204 (_2!9666 lt!329489)))))

(declare-fun b!210130 () Bool)

(assert (=> b!210130 (= e!143385 (not e!143383))))

(declare-fun res!176422 () Bool)

(assert (=> b!210130 (=> res!176422 e!143383)))

(declare-fun lt!329493 () (_ BitVec 64))

(assert (=> b!210130 (= res!176422 (not (= lt!329484 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!329493))))))

(assert (=> b!210130 (= lt!329484 (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))))))

(assert (=> b!210130 (= lt!329493 (bitIndex!0 (size!4608 (buf!5125 thiss!1204)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)))))

(declare-fun e!143388 () Bool)

(assert (=> b!210130 e!143388))

(declare-fun res!176427 () Bool)

(assert (=> b!210130 (=> (not res!176427) (not e!143388))))

(assert (=> b!210130 (= res!176427 (= (size!4608 (buf!5125 thiss!1204)) (size!4608 (buf!5125 (_2!9666 lt!329489)))))))

(declare-fun appendBit!0 (BitStream!8324 Bool) tuple2!18022)

(assert (=> b!210130 (= lt!329489 (appendBit!0 thiss!1204 lt!329469))))

(assert (=> b!210130 (= lt!329469 (not (= (bvand v!189 lt!329480) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210130 (= lt!329480 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!210131 () Bool)

(declare-fun res!176423 () Bool)

(assert (=> b!210131 (=> res!176423 e!143391)))

(assert (=> b!210131 (= res!176423 (or (not (= (size!4608 (buf!5125 (_2!9666 lt!329481))) (size!4608 (buf!5125 thiss!1204)))) (not (= lt!329487 (bvsub (bvadd lt!329493 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!210132 () Bool)

(assert (=> b!210132 (= e!143392 (= (_2!9667 lt!329488) (_2!9667 lt!329477)))))

(declare-fun b!210133 () Bool)

(declare-fun res!176424 () Bool)

(assert (=> b!210133 (=> res!176424 e!143391)))

(assert (=> b!210133 (= res!176424 (not (isPrefixOf!0 thiss!1204 (_2!9666 lt!329489))))))

(declare-fun b!210134 () Bool)

(assert (=> b!210134 (= e!143389 e!143385)))

(declare-fun res!176425 () Bool)

(assert (=> b!210134 (=> (not res!176425) (not e!143385))))

(assert (=> b!210134 (= res!176425 (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 thiss!1204))) ((_ sign_extend 32) (currentByte!9667 thiss!1204)) ((_ sign_extend 32) (currentBit!9662 thiss!1204)) lt!329483))))

(assert (=> b!210134 (= lt!329483 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!210135 () Bool)

(declare-fun res!176428 () Bool)

(assert (=> b!210135 (=> (not res!176428) (not e!143385))))

(assert (=> b!210135 (= res!176428 (not (= i!590 nBits!348)))))

(declare-fun b!210136 () Bool)

(assert (=> b!210136 (= e!143386 (invariant!0 (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204) (size!4608 (buf!5125 (_2!9666 lt!329481)))))))

(declare-fun b!210137 () Bool)

(assert (=> b!210137 (= e!143388 e!143387)))

(declare-fun res!176432 () Bool)

(assert (=> b!210137 (=> (not res!176432) (not e!143387))))

(declare-fun lt!329479 () (_ BitVec 64))

(declare-fun lt!329491 () (_ BitVec 64))

(assert (=> b!210137 (= res!176432 (= lt!329479 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!329491)))))

(assert (=> b!210137 (= lt!329479 (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))))))

(assert (=> b!210137 (= lt!329491 (bitIndex!0 (size!4608 (buf!5125 thiss!1204)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)))))

(declare-fun b!210138 () Bool)

(declare-fun e!143394 () Bool)

(assert (=> b!210138 (= e!143387 e!143394)))

(declare-fun res!176418 () Bool)

(assert (=> b!210138 (=> (not res!176418) (not e!143394))))

(declare-fun lt!329485 () tuple2!18024)

(assert (=> b!210138 (= res!176418 (and (= (_2!9667 lt!329485) lt!329469) (= (_1!9667 lt!329485) (_2!9666 lt!329489))))))

(declare-fun readerFrom!0 (BitStream!8324 (_ BitVec 32) (_ BitVec 32)) BitStream!8324)

(assert (=> b!210138 (= lt!329485 (readBitPure!0 (readerFrom!0 (_2!9666 lt!329489) (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204))))))

(declare-fun b!210139 () Bool)

(assert (=> b!210139 (= e!143394 (= (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!329485))) (currentByte!9667 (_1!9667 lt!329485)) (currentBit!9662 (_1!9667 lt!329485))) lt!329479))))

(declare-fun b!210140 () Bool)

(declare-fun res!176416 () Bool)

(assert (=> b!210140 (=> res!176416 e!143391)))

(assert (=> b!210140 (= res!176416 (not (invariant!0 (currentBit!9662 (_2!9666 lt!329481)) (currentByte!9667 (_2!9666 lt!329481)) (size!4608 (buf!5125 (_2!9666 lt!329481))))))))

(declare-fun b!210141 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!8324 (_ BitVec 64)) BitStream!8324)

(assert (=> b!210141 (= e!143393 (= (_1!9664 lt!329492) (withMovedBitIndex!0 (_2!9664 lt!329492) (bvsub lt!329493 lt!329487))))))

(declare-fun lt!329482 () tuple2!18020)

(assert (=> b!210141 (and (= (_2!9665 lt!329478) (_2!9665 lt!329482)) (= (_1!9665 lt!329478) (_1!9665 lt!329482)))))

(declare-fun lt!329473 () Unit!14966)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14966)

(assert (=> b!210141 (= lt!329473 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9664 lt!329492) nBits!348 i!590 lt!329474))))

(assert (=> b!210141 (= lt!329482 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9664 lt!329492) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329495))))

(assert (= (and start!44092 res!176429) b!210134))

(assert (= (and b!210134 res!176425) b!210128))

(assert (= (and b!210128 res!176420) b!210135))

(assert (= (and b!210135 res!176428) b!210130))

(assert (= (and b!210130 res!176427) b!210137))

(assert (= (and b!210137 res!176432) b!210129))

(assert (= (and b!210129 res!176426) b!210138))

(assert (= (and b!210138 res!176418) b!210139))

(assert (= (and b!210130 (not res!176422)) b!210126))

(assert (= (and b!210126 (not res!176419)) b!210140))

(assert (= (and b!210140 (not res!176416)) b!210131))

(assert (= (and b!210131 (not res!176423)) b!210127))

(assert (= (and b!210127 (not res!176421)) b!210133))

(assert (= (and b!210133 (not res!176424)) b!210124))

(assert (= (and b!210124 res!176431) b!210136))

(assert (= (and b!210124 res!176417) b!210132))

(assert (= (and b!210124 (not res!176430)) b!210141))

(assert (= start!44092 b!210125))

(declare-fun m!323435 () Bool)

(assert (=> b!210125 m!323435))

(declare-fun m!323437 () Bool)

(assert (=> b!210137 m!323437))

(declare-fun m!323439 () Bool)

(assert (=> b!210137 m!323439))

(assert (=> b!210130 m!323437))

(assert (=> b!210130 m!323439))

(declare-fun m!323441 () Bool)

(assert (=> b!210130 m!323441))

(declare-fun m!323443 () Bool)

(assert (=> b!210128 m!323443))

(declare-fun m!323445 () Bool)

(assert (=> b!210133 m!323445))

(assert (=> b!210129 m!323445))

(declare-fun m!323447 () Bool)

(assert (=> b!210139 m!323447))

(declare-fun m!323449 () Bool)

(assert (=> b!210138 m!323449))

(assert (=> b!210138 m!323449))

(declare-fun m!323451 () Bool)

(assert (=> b!210138 m!323451))

(declare-fun m!323453 () Bool)

(assert (=> start!44092 m!323453))

(declare-fun m!323455 () Bool)

(assert (=> b!210124 m!323455))

(declare-fun m!323457 () Bool)

(assert (=> b!210124 m!323457))

(declare-fun m!323459 () Bool)

(assert (=> b!210124 m!323459))

(declare-fun m!323461 () Bool)

(assert (=> b!210124 m!323461))

(declare-fun m!323463 () Bool)

(assert (=> b!210124 m!323463))

(declare-fun m!323465 () Bool)

(assert (=> b!210124 m!323465))

(declare-fun m!323467 () Bool)

(assert (=> b!210124 m!323467))

(declare-fun m!323469 () Bool)

(assert (=> b!210124 m!323469))

(declare-fun m!323471 () Bool)

(assert (=> b!210124 m!323471))

(declare-fun m!323473 () Bool)

(assert (=> b!210124 m!323473))

(declare-fun m!323475 () Bool)

(assert (=> b!210124 m!323475))

(declare-fun m!323477 () Bool)

(assert (=> b!210124 m!323477))

(declare-fun m!323479 () Bool)

(assert (=> b!210124 m!323479))

(declare-fun m!323481 () Bool)

(assert (=> b!210124 m!323481))

(declare-fun m!323483 () Bool)

(assert (=> b!210124 m!323483))

(declare-fun m!323485 () Bool)

(assert (=> b!210124 m!323485))

(declare-fun m!323487 () Bool)

(assert (=> b!210136 m!323487))

(declare-fun m!323489 () Bool)

(assert (=> b!210127 m!323489))

(declare-fun m!323491 () Bool)

(assert (=> b!210134 m!323491))

(declare-fun m!323493 () Bool)

(assert (=> b!210126 m!323493))

(declare-fun m!323495 () Bool)

(assert (=> b!210126 m!323495))

(declare-fun m!323497 () Bool)

(assert (=> b!210126 m!323497))

(declare-fun m!323499 () Bool)

(assert (=> b!210126 m!323499))

(declare-fun m!323501 () Bool)

(assert (=> b!210141 m!323501))

(declare-fun m!323503 () Bool)

(assert (=> b!210141 m!323503))

(declare-fun m!323505 () Bool)

(assert (=> b!210141 m!323505))

(assert (=> b!210141 m!323505))

(declare-fun m!323507 () Bool)

(assert (=> b!210141 m!323507))

(declare-fun m!323509 () Bool)

(assert (=> b!210140 m!323509))

(push 1)

(assert (not b!210136))

(assert (not b!210138))

(assert (not b!210139))

(assert (not start!44092))

(assert (not b!210126))

(assert (not b!210125))

(assert (not b!210137))

(assert (not b!210141))

(assert (not b!210140))

(assert (not b!210128))

(assert (not b!210134))

(assert (not b!210129))

(assert (not b!210133))

(assert (not b!210127))

(assert (not b!210130))

(assert (not b!210124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!71027 () Bool)

(declare-fun res!176440 () Bool)

(declare-fun e!143400 () Bool)

(assert (=> d!71027 (=> (not res!176440) (not e!143400))))

(assert (=> d!71027 (= res!176440 (= (size!4608 (buf!5125 thiss!1204)) (size!4608 (buf!5125 (_2!9666 lt!329489)))))))

(assert (=> d!71027 (= (isPrefixOf!0 thiss!1204 (_2!9666 lt!329489)) e!143400)))

(declare-fun b!210148 () Bool)

(declare-fun res!176439 () Bool)

(assert (=> b!210148 (=> (not res!176439) (not e!143400))))

(assert (=> b!210148 (= res!176439 (bvsle (bitIndex!0 (size!4608 (buf!5125 thiss!1204)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)) (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489)))))))

(declare-fun b!210149 () Bool)

(declare-fun e!143399 () Bool)

(assert (=> b!210149 (= e!143400 e!143399)))

(declare-fun res!176441 () Bool)

(assert (=> b!210149 (=> res!176441 e!143399)))

(assert (=> b!210149 (= res!176441 (= (size!4608 (buf!5125 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210150 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10485 array!10485 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210150 (= e!143399 (arrayBitRangesEq!0 (buf!5125 thiss!1204) (buf!5125 (_2!9666 lt!329489)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4608 (buf!5125 thiss!1204)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204))))))

(assert (= (and d!71027 res!176440) b!210148))

(assert (= (and b!210148 res!176439) b!210149))

(assert (= (and b!210149 (not res!176441)) b!210150))

(assert (=> b!210148 m!323439))

(assert (=> b!210148 m!323437))

(assert (=> b!210150 m!323439))

(assert (=> b!210150 m!323439))

(declare-fun m!323511 () Bool)

(assert (=> b!210150 m!323511))

(assert (=> b!210129 d!71027))

(declare-fun d!71029 () Bool)

(assert (=> d!71029 (= (invariant!0 (currentBit!9662 (_2!9666 lt!329481)) (currentByte!9667 (_2!9666 lt!329481)) (size!4608 (buf!5125 (_2!9666 lt!329481)))) (and (bvsge (currentBit!9662 (_2!9666 lt!329481)) #b00000000000000000000000000000000) (bvslt (currentBit!9662 (_2!9666 lt!329481)) #b00000000000000000000000000001000) (bvsge (currentByte!9667 (_2!9666 lt!329481)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9667 (_2!9666 lt!329481)) (size!4608 (buf!5125 (_2!9666 lt!329481)))) (and (= (currentBit!9662 (_2!9666 lt!329481)) #b00000000000000000000000000000000) (= (currentByte!9667 (_2!9666 lt!329481)) (size!4608 (buf!5125 (_2!9666 lt!329481))))))))))

(assert (=> b!210140 d!71029))

(declare-fun d!71031 () Bool)

(declare-datatypes ((tuple2!18026 0))(
  ( (tuple2!18027 (_1!9668 Bool) (_2!9668 BitStream!8324)) )
))
(declare-fun lt!329498 () tuple2!18026)

(declare-fun readBit!0 (BitStream!8324) tuple2!18026)

(assert (=> d!71031 (= lt!329498 (readBit!0 (readerFrom!0 (_2!9666 lt!329489) (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204))))))

(assert (=> d!71031 (= (readBitPure!0 (readerFrom!0 (_2!9666 lt!329489) (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204))) (tuple2!18025 (_2!9668 lt!329498) (_1!9668 lt!329498)))))

(declare-fun bs!17448 () Bool)

(assert (= bs!17448 d!71031))

(assert (=> bs!17448 m!323449))

(declare-fun m!323513 () Bool)

(assert (=> bs!17448 m!323513))

(assert (=> b!210138 d!71031))

(declare-fun d!71033 () Bool)

(declare-fun e!143403 () Bool)

(assert (=> d!71033 e!143403))

(declare-fun res!176445 () Bool)

(assert (=> d!71033 (=> (not res!176445) (not e!143403))))

(assert (=> d!71033 (= res!176445 (invariant!0 (currentBit!9662 (_2!9666 lt!329489)) (currentByte!9667 (_2!9666 lt!329489)) (size!4608 (buf!5125 (_2!9666 lt!329489)))))))

(assert (=> d!71033 (= (readerFrom!0 (_2!9666 lt!329489) (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204)) (BitStream!8325 (buf!5125 (_2!9666 lt!329489)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)))))

(declare-fun b!210153 () Bool)

(assert (=> b!210153 (= e!143403 (invariant!0 (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204) (size!4608 (buf!5125 (_2!9666 lt!329489)))))))

(assert (= (and d!71033 res!176445) b!210153))

(declare-fun m!323515 () Bool)

(assert (=> d!71033 m!323515))

(assert (=> b!210153 m!323457))

(assert (=> b!210138 d!71033))

(declare-fun d!71035 () Bool)

(declare-fun e!143406 () Bool)

(assert (=> d!71035 e!143406))

(declare-fun res!176451 () Bool)

(assert (=> d!71035 (=> (not res!176451) (not e!143406))))

(declare-fun lt!329514 () (_ BitVec 64))

(declare-fun lt!329515 () (_ BitVec 64))

(declare-fun lt!329512 () (_ BitVec 64))

(assert (=> d!71035 (= res!176451 (= lt!329514 (bvsub lt!329515 lt!329512)))))

(assert (=> d!71035 (or (= (bvand lt!329515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329512 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329515 lt!329512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71035 (= lt!329512 (remainingBits!0 ((_ sign_extend 32) (size!4608 (buf!5125 (_1!9667 lt!329485)))) ((_ sign_extend 32) (currentByte!9667 (_1!9667 lt!329485))) ((_ sign_extend 32) (currentBit!9662 (_1!9667 lt!329485)))))))

(declare-fun lt!329513 () (_ BitVec 64))

(declare-fun lt!329511 () (_ BitVec 64))

(assert (=> d!71035 (= lt!329515 (bvmul lt!329513 lt!329511))))

(assert (=> d!71035 (or (= lt!329513 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329511 (bvsdiv (bvmul lt!329513 lt!329511) lt!329513)))))

(assert (=> d!71035 (= lt!329511 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71035 (= lt!329513 ((_ sign_extend 32) (size!4608 (buf!5125 (_1!9667 lt!329485)))))))

(assert (=> d!71035 (= lt!329514 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9667 (_1!9667 lt!329485))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9662 (_1!9667 lt!329485)))))))

(assert (=> d!71035 (invariant!0 (currentBit!9662 (_1!9667 lt!329485)) (currentByte!9667 (_1!9667 lt!329485)) (size!4608 (buf!5125 (_1!9667 lt!329485))))))

(assert (=> d!71035 (= (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!329485))) (currentByte!9667 (_1!9667 lt!329485)) (currentBit!9662 (_1!9667 lt!329485))) lt!329514)))

(declare-fun b!210158 () Bool)

(declare-fun res!176450 () Bool)

(assert (=> b!210158 (=> (not res!176450) (not e!143406))))

(assert (=> b!210158 (= res!176450 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329514))))

(declare-fun b!210159 () Bool)

(declare-fun lt!329516 () (_ BitVec 64))

(assert (=> b!210159 (= e!143406 (bvsle lt!329514 (bvmul lt!329516 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210159 (or (= lt!329516 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329516 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329516)))))

(assert (=> b!210159 (= lt!329516 ((_ sign_extend 32) (size!4608 (buf!5125 (_1!9667 lt!329485)))))))

(assert (= (and d!71035 res!176451) b!210158))

(assert (= (and b!210158 res!176450) b!210159))

(declare-fun m!323517 () Bool)

(assert (=> d!71035 m!323517))

(declare-fun m!323519 () Bool)

(assert (=> d!71035 m!323519))

(assert (=> b!210139 d!71035))

(declare-fun d!71037 () Bool)

(assert (=> d!71037 (= (invariant!0 (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204) (size!4608 (buf!5125 thiss!1204))) (and (bvsge (currentBit!9662 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9662 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9667 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9667 thiss!1204) (size!4608 (buf!5125 thiss!1204))) (and (= (currentBit!9662 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9667 thiss!1204) (size!4608 (buf!5125 thiss!1204)))))))))

(assert (=> b!210128 d!71037))

(declare-fun d!71039 () Bool)

(assert (=> d!71039 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204) (size!4608 (buf!5125 thiss!1204))))))

(declare-fun bs!17449 () Bool)

(assert (= bs!17449 d!71039))

(assert (=> bs!17449 m!323443))

(assert (=> start!44092 d!71039))

(declare-fun d!71041 () Bool)

(declare-fun e!143409 () Bool)

(assert (=> d!71041 e!143409))

(declare-fun res!176454 () Bool)

(assert (=> d!71041 (=> (not res!176454) (not e!143409))))

(declare-fun lt!329521 () BitStream!8324)

(declare-fun lt!329522 () (_ BitVec 64))

(assert (=> d!71041 (= res!176454 (= (bvadd lt!329522 (bvsub lt!329493 lt!329487)) (bitIndex!0 (size!4608 (buf!5125 lt!329521)) (currentByte!9667 lt!329521) (currentBit!9662 lt!329521))))))

(assert (=> d!71041 (or (not (= (bvand lt!329522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329493 lt!329487) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!329522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!329522 (bvsub lt!329493 lt!329487)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71041 (= lt!329522 (bitIndex!0 (size!4608 (buf!5125 (_2!9664 lt!329492))) (currentByte!9667 (_2!9664 lt!329492)) (currentBit!9662 (_2!9664 lt!329492))))))

(declare-fun moveBitIndex!0 (BitStream!8324 (_ BitVec 64)) tuple2!18022)

(assert (=> d!71041 (= lt!329521 (_2!9666 (moveBitIndex!0 (_2!9664 lt!329492) (bvsub lt!329493 lt!329487))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8324 (_ BitVec 64)) Bool)

(assert (=> d!71041 (moveBitIndexPrecond!0 (_2!9664 lt!329492) (bvsub lt!329493 lt!329487))))

(assert (=> d!71041 (= (withMovedBitIndex!0 (_2!9664 lt!329492) (bvsub lt!329493 lt!329487)) lt!329521)))

(declare-fun b!210162 () Bool)

(assert (=> b!210162 (= e!143409 (= (size!4608 (buf!5125 (_2!9664 lt!329492))) (size!4608 (buf!5125 lt!329521))))))

(assert (= (and d!71041 res!176454) b!210162))

(declare-fun m!323521 () Bool)

(assert (=> d!71041 m!323521))

(declare-fun m!323523 () Bool)

(assert (=> d!71041 m!323523))

(declare-fun m!323525 () Bool)

(assert (=> d!71041 m!323525))

(declare-fun m!323527 () Bool)

(assert (=> d!71041 m!323527))

(assert (=> b!210141 d!71041))

(declare-fun d!71043 () Bool)

(declare-fun lt!329535 () tuple2!18020)

(declare-fun lt!329539 () tuple2!18020)

(assert (=> d!71043 (and (= (_2!9665 lt!329535) (_2!9665 lt!329539)) (= (_1!9665 lt!329535) (_1!9665 lt!329539)))))

(declare-fun lt!329537 () Unit!14966)

(declare-fun lt!329540 () BitStream!8324)

(declare-fun lt!329538 () Bool)

(declare-fun lt!329536 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18020 tuple2!18020 BitStream!8324 (_ BitVec 64) Bool BitStream!8324 (_ BitVec 64) tuple2!18020 tuple2!18020 BitStream!8324 (_ BitVec 64)) Unit!14966)

(assert (=> d!71043 (= lt!329537 (choose!56 (_1!9664 lt!329492) nBits!348 i!590 lt!329474 lt!329535 (tuple2!18021 (_1!9665 lt!329535) (_2!9665 lt!329535)) (_1!9665 lt!329535) (_2!9665 lt!329535) lt!329538 lt!329540 lt!329536 lt!329539 (tuple2!18021 (_1!9665 lt!329539) (_2!9665 lt!329539)) (_1!9665 lt!329539) (_2!9665 lt!329539)))))

(assert (=> d!71043 (= lt!329539 (readNBitsLSBFirstsLoopPure!0 lt!329540 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!329536))))

(assert (=> d!71043 (= lt!329536 (bvor lt!329474 (ite lt!329538 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71043 (= lt!329540 (withMovedBitIndex!0 (_1!9664 lt!329492) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71043 (= lt!329538 (_2!9667 (readBitPure!0 (_1!9664 lt!329492))))))

(assert (=> d!71043 (= lt!329535 (readNBitsLSBFirstsLoopPure!0 (_1!9664 lt!329492) nBits!348 i!590 lt!329474))))

(assert (=> d!71043 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9664 lt!329492) nBits!348 i!590 lt!329474) lt!329537)))

(declare-fun bs!17451 () Bool)

(assert (= bs!17451 d!71043))

(assert (=> bs!17451 m!323505))

(assert (=> bs!17451 m!323461))

(assert (=> bs!17451 m!323471))

(declare-fun m!323529 () Bool)

(assert (=> bs!17451 m!323529))

(declare-fun m!323531 () Bool)

(assert (=> bs!17451 m!323531))

(assert (=> b!210141 d!71043))

(declare-fun d!71045 () Bool)

(declare-datatypes ((tuple2!18028 0))(
  ( (tuple2!18029 (_1!9669 (_ BitVec 64)) (_2!9669 BitStream!8324)) )
))
(declare-fun lt!329543 () tuple2!18028)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18028)

(assert (=> d!71045 (= lt!329543 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9664 lt!329492) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329495))))

(assert (=> d!71045 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9664 lt!329492) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329495) (tuple2!18021 (_2!9669 lt!329543) (_1!9669 lt!329543)))))

(declare-fun bs!17452 () Bool)

(assert (= bs!17452 d!71045))

(assert (=> bs!17452 m!323505))

(declare-fun m!323533 () Bool)

(assert (=> bs!17452 m!323533))

(assert (=> b!210141 d!71045))

(declare-fun d!71047 () Bool)

(declare-fun e!143410 () Bool)

(assert (=> d!71047 e!143410))

(declare-fun res!176455 () Bool)

(assert (=> d!71047 (=> (not res!176455) (not e!143410))))

(declare-fun lt!329545 () (_ BitVec 64))

(declare-fun lt!329544 () BitStream!8324)

(assert (=> d!71047 (= res!176455 (= (bvadd lt!329545 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4608 (buf!5125 lt!329544)) (currentByte!9667 lt!329544) (currentBit!9662 lt!329544))))))

(assert (=> d!71047 (or (not (= (bvand lt!329545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!329545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!329545 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71047 (= lt!329545 (bitIndex!0 (size!4608 (buf!5125 (_1!9664 lt!329492))) (currentByte!9667 (_1!9664 lt!329492)) (currentBit!9662 (_1!9664 lt!329492))))))

(assert (=> d!71047 (= lt!329544 (_2!9666 (moveBitIndex!0 (_1!9664 lt!329492) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!71047 (moveBitIndexPrecond!0 (_1!9664 lt!329492) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71047 (= (withMovedBitIndex!0 (_1!9664 lt!329492) #b0000000000000000000000000000000000000000000000000000000000000001) lt!329544)))

(declare-fun b!210163 () Bool)

(assert (=> b!210163 (= e!143410 (= (size!4608 (buf!5125 (_1!9664 lt!329492))) (size!4608 (buf!5125 lt!329544))))))

(assert (= (and d!71047 res!176455) b!210163))

(declare-fun m!323535 () Bool)

(assert (=> d!71047 m!323535))

(declare-fun m!323537 () Bool)

(assert (=> d!71047 m!323537))

(declare-fun m!323539 () Bool)

(assert (=> d!71047 m!323539))

(declare-fun m!323541 () Bool)

(assert (=> d!71047 m!323541))

(assert (=> b!210141 d!71047))

(declare-fun d!71049 () Bool)

(declare-fun e!143411 () Bool)

(assert (=> d!71049 e!143411))

(declare-fun res!176457 () Bool)

(assert (=> d!71049 (=> (not res!176457) (not e!143411))))

(declare-fun lt!329549 () (_ BitVec 64))

(declare-fun lt!329550 () (_ BitVec 64))

(declare-fun lt!329547 () (_ BitVec 64))

(assert (=> d!71049 (= res!176457 (= lt!329549 (bvsub lt!329550 lt!329547)))))

(assert (=> d!71049 (or (= (bvand lt!329550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329547 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329550 lt!329547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71049 (= lt!329547 (remainingBits!0 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329489)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329489))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329489)))))))

(declare-fun lt!329548 () (_ BitVec 64))

(declare-fun lt!329546 () (_ BitVec 64))

(assert (=> d!71049 (= lt!329550 (bvmul lt!329548 lt!329546))))

(assert (=> d!71049 (or (= lt!329548 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329546 (bvsdiv (bvmul lt!329548 lt!329546) lt!329548)))))

(assert (=> d!71049 (= lt!329546 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71049 (= lt!329548 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329489)))))))

(assert (=> d!71049 (= lt!329549 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329489))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329489)))))))

(assert (=> d!71049 (invariant!0 (currentBit!9662 (_2!9666 lt!329489)) (currentByte!9667 (_2!9666 lt!329489)) (size!4608 (buf!5125 (_2!9666 lt!329489))))))

(assert (=> d!71049 (= (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))) lt!329549)))

(declare-fun b!210164 () Bool)

(declare-fun res!176456 () Bool)

(assert (=> b!210164 (=> (not res!176456) (not e!143411))))

(assert (=> b!210164 (= res!176456 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329549))))

(declare-fun b!210165 () Bool)

(declare-fun lt!329551 () (_ BitVec 64))

(assert (=> b!210165 (= e!143411 (bvsle lt!329549 (bvmul lt!329551 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210165 (or (= lt!329551 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329551 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329551)))))

(assert (=> b!210165 (= lt!329551 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329489)))))))

(assert (= (and d!71049 res!176457) b!210164))

(assert (= (and b!210164 res!176456) b!210165))

(declare-fun m!323543 () Bool)

(assert (=> d!71049 m!323543))

(assert (=> d!71049 m!323515))

(assert (=> b!210130 d!71049))

(declare-fun d!71051 () Bool)

(declare-fun e!143412 () Bool)

(assert (=> d!71051 e!143412))

(declare-fun res!176459 () Bool)

(assert (=> d!71051 (=> (not res!176459) (not e!143412))))

(declare-fun lt!329556 () (_ BitVec 64))

(declare-fun lt!329555 () (_ BitVec 64))

(declare-fun lt!329553 () (_ BitVec 64))

(assert (=> d!71051 (= res!176459 (= lt!329555 (bvsub lt!329556 lt!329553)))))

(assert (=> d!71051 (or (= (bvand lt!329556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329556 lt!329553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71051 (= lt!329553 (remainingBits!0 ((_ sign_extend 32) (size!4608 (buf!5125 thiss!1204))) ((_ sign_extend 32) (currentByte!9667 thiss!1204)) ((_ sign_extend 32) (currentBit!9662 thiss!1204))))))

(declare-fun lt!329554 () (_ BitVec 64))

(declare-fun lt!329552 () (_ BitVec 64))

(assert (=> d!71051 (= lt!329556 (bvmul lt!329554 lt!329552))))

(assert (=> d!71051 (or (= lt!329554 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329552 (bvsdiv (bvmul lt!329554 lt!329552) lt!329554)))))

(assert (=> d!71051 (= lt!329552 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71051 (= lt!329554 ((_ sign_extend 32) (size!4608 (buf!5125 thiss!1204))))))

(assert (=> d!71051 (= lt!329555 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9667 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9662 thiss!1204))))))

(assert (=> d!71051 (invariant!0 (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204) (size!4608 (buf!5125 thiss!1204)))))

(assert (=> d!71051 (= (bitIndex!0 (size!4608 (buf!5125 thiss!1204)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)) lt!329555)))

(declare-fun b!210166 () Bool)

(declare-fun res!176458 () Bool)

(assert (=> b!210166 (=> (not res!176458) (not e!143412))))

(assert (=> b!210166 (= res!176458 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329555))))

(declare-fun b!210167 () Bool)

(declare-fun lt!329557 () (_ BitVec 64))

(assert (=> b!210167 (= e!143412 (bvsle lt!329555 (bvmul lt!329557 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210167 (or (= lt!329557 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329557 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329557)))))

(assert (=> b!210167 (= lt!329557 ((_ sign_extend 32) (size!4608 (buf!5125 thiss!1204))))))

(assert (= (and d!71051 res!176459) b!210166))

(assert (= (and b!210166 res!176458) b!210167))

(declare-fun m!323545 () Bool)

(assert (=> d!71051 m!323545))

(assert (=> d!71051 m!323443))

(assert (=> b!210130 d!71051))

(declare-fun b!210178 () Bool)

(declare-fun res!176471 () Bool)

(declare-fun e!143418 () Bool)

(assert (=> b!210178 (=> (not res!176471) (not e!143418))))

(declare-fun lt!329569 () tuple2!18022)

(assert (=> b!210178 (= res!176471 (isPrefixOf!0 thiss!1204 (_2!9666 lt!329569)))))

(declare-fun b!210180 () Bool)

(declare-fun e!143417 () Bool)

(declare-fun lt!329568 () tuple2!18024)

(assert (=> b!210180 (= e!143417 (= (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!329568))) (currentByte!9667 (_1!9667 lt!329568)) (currentBit!9662 (_1!9667 lt!329568))) (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329569))) (currentByte!9667 (_2!9666 lt!329569)) (currentBit!9662 (_2!9666 lt!329569)))))))

(declare-fun b!210177 () Bool)

(declare-fun res!176470 () Bool)

(assert (=> b!210177 (=> (not res!176470) (not e!143418))))

(declare-fun lt!329567 () (_ BitVec 64))

(declare-fun lt!329566 () (_ BitVec 64))

(assert (=> b!210177 (= res!176470 (= (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329569))) (currentByte!9667 (_2!9666 lt!329569)) (currentBit!9662 (_2!9666 lt!329569))) (bvadd lt!329566 lt!329567)))))

(assert (=> b!210177 (or (not (= (bvand lt!329566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329567 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!329566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!329566 lt!329567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210177 (= lt!329567 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!210177 (= lt!329566 (bitIndex!0 (size!4608 (buf!5125 thiss!1204)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)))))

(declare-fun b!210179 () Bool)

(assert (=> b!210179 (= e!143418 e!143417)))

(declare-fun res!176468 () Bool)

(assert (=> b!210179 (=> (not res!176468) (not e!143417))))

(assert (=> b!210179 (= res!176468 (and (= (_2!9667 lt!329568) lt!329469) (= (_1!9667 lt!329568) (_2!9666 lt!329569))))))

(assert (=> b!210179 (= lt!329568 (readBitPure!0 (readerFrom!0 (_2!9666 lt!329569) (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204))))))

(declare-fun d!71053 () Bool)

(assert (=> d!71053 e!143418))

(declare-fun res!176469 () Bool)

(assert (=> d!71053 (=> (not res!176469) (not e!143418))))

(assert (=> d!71053 (= res!176469 (= (size!4608 (buf!5125 thiss!1204)) (size!4608 (buf!5125 (_2!9666 lt!329569)))))))

(declare-fun choose!16 (BitStream!8324 Bool) tuple2!18022)

(assert (=> d!71053 (= lt!329569 (choose!16 thiss!1204 lt!329469))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71053 (validate_offset_bit!0 ((_ sign_extend 32) (size!4608 (buf!5125 thiss!1204))) ((_ sign_extend 32) (currentByte!9667 thiss!1204)) ((_ sign_extend 32) (currentBit!9662 thiss!1204)))))

(assert (=> d!71053 (= (appendBit!0 thiss!1204 lt!329469) lt!329569)))

(assert (= (and d!71053 res!176469) b!210177))

(assert (= (and b!210177 res!176470) b!210178))

(assert (= (and b!210178 res!176471) b!210179))

(assert (= (and b!210179 res!176468) b!210180))

(declare-fun m!323547 () Bool)

(assert (=> b!210180 m!323547))

(declare-fun m!323549 () Bool)

(assert (=> b!210180 m!323549))

(declare-fun m!323551 () Bool)

(assert (=> b!210178 m!323551))

(assert (=> b!210177 m!323549))

(assert (=> b!210177 m!323439))

(declare-fun m!323553 () Bool)

(assert (=> b!210179 m!323553))

(assert (=> b!210179 m!323553))

(declare-fun m!323555 () Bool)

(assert (=> b!210179 m!323555))

(declare-fun m!323557 () Bool)

(assert (=> d!71053 m!323557))

(declare-fun m!323559 () Bool)

(assert (=> d!71053 m!323559))

(assert (=> b!210130 d!71053))

(declare-fun d!71055 () Bool)

(assert (=> d!71055 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 thiss!1204))) ((_ sign_extend 32) (currentByte!9667 thiss!1204)) ((_ sign_extend 32) (currentBit!9662 thiss!1204)) lt!329483) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4608 (buf!5125 thiss!1204))) ((_ sign_extend 32) (currentByte!9667 thiss!1204)) ((_ sign_extend 32) (currentBit!9662 thiss!1204))) lt!329483))))

(declare-fun bs!17453 () Bool)

(assert (= bs!17453 d!71055))

(assert (=> bs!17453 m!323545))

(assert (=> b!210134 d!71055))

(declare-fun d!71057 () Bool)

(assert (=> d!71057 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!210124 d!71057))

(declare-fun d!71059 () Bool)

(assert (=> d!71059 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))) ((_ sign_extend 32) (currentByte!9667 thiss!1204)) ((_ sign_extend 32) (currentBit!9662 thiss!1204)) lt!329483) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))) ((_ sign_extend 32) (currentByte!9667 thiss!1204)) ((_ sign_extend 32) (currentBit!9662 thiss!1204))) lt!329483))))

(declare-fun bs!17454 () Bool)

(assert (= bs!17454 d!71059))

(declare-fun m!323561 () Bool)

(assert (=> bs!17454 m!323561))

(assert (=> b!210124 d!71059))

(declare-fun d!71061 () Bool)

(assert (=> d!71061 (= (invariant!0 (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204) (size!4608 (buf!5125 (_2!9666 lt!329489)))) (and (bvsge (currentBit!9662 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9662 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9667 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9667 thiss!1204) (size!4608 (buf!5125 (_2!9666 lt!329489)))) (and (= (currentBit!9662 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9667 thiss!1204) (size!4608 (buf!5125 (_2!9666 lt!329489))))))))))

(assert (=> b!210124 d!71061))

(declare-fun d!71063 () Bool)

(assert (=> d!71063 (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329489))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329489))) lt!329470)))

(declare-fun lt!329572 () Unit!14966)

(declare-fun choose!9 (BitStream!8324 array!10485 (_ BitVec 64) BitStream!8324) Unit!14966)

(assert (=> d!71063 (= lt!329572 (choose!9 (_2!9666 lt!329489) (buf!5125 (_2!9666 lt!329481)) lt!329470 (BitStream!8325 (buf!5125 (_2!9666 lt!329481)) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489)))))))

(assert (=> d!71063 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9666 lt!329489) (buf!5125 (_2!9666 lt!329481)) lt!329470) lt!329572)))

(declare-fun bs!17455 () Bool)

(assert (= bs!17455 d!71063))

(assert (=> bs!17455 m!323479))

(declare-fun m!323563 () Bool)

(assert (=> bs!17455 m!323563))

(assert (=> b!210124 d!71063))

(declare-fun d!71065 () Bool)

(declare-fun lt!329573 () tuple2!18026)

(assert (=> d!71065 (= lt!329573 (readBit!0 (BitStream!8325 (buf!5125 (_2!9666 lt!329481)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204))))))

(assert (=> d!71065 (= (readBitPure!0 (BitStream!8325 (buf!5125 (_2!9666 lt!329481)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204))) (tuple2!18025 (_2!9668 lt!329573) (_1!9668 lt!329573)))))

(declare-fun bs!17456 () Bool)

(assert (= bs!17456 d!71065))

(declare-fun m!323565 () Bool)

(assert (=> bs!17456 m!323565))

(assert (=> b!210124 d!71065))

(declare-fun d!71067 () Bool)

(declare-fun e!143424 () Bool)

(assert (=> d!71067 e!143424))

(declare-fun res!176478 () Bool)

(assert (=> d!71067 (=> (not res!176478) (not e!143424))))

(declare-fun lt!329585 () tuple2!18024)

(declare-fun lt!329587 () tuple2!18024)

(assert (=> d!71067 (= res!176478 (= (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!329585))) (currentByte!9667 (_1!9667 lt!329585)) (currentBit!9662 (_1!9667 lt!329585))) (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!329587))) (currentByte!9667 (_1!9667 lt!329587)) (currentBit!9662 (_1!9667 lt!329587)))))))

(declare-fun lt!329588 () Unit!14966)

(declare-fun lt!329586 () BitStream!8324)

(declare-fun choose!50 (BitStream!8324 BitStream!8324 BitStream!8324 tuple2!18024 tuple2!18024 BitStream!8324 Bool tuple2!18024 tuple2!18024 BitStream!8324 Bool) Unit!14966)

(assert (=> d!71067 (= lt!329588 (choose!50 lt!329486 (_2!9666 lt!329481) lt!329586 lt!329585 (tuple2!18025 (_1!9667 lt!329585) (_2!9667 lt!329585)) (_1!9667 lt!329585) (_2!9667 lt!329585) lt!329587 (tuple2!18025 (_1!9667 lt!329587) (_2!9667 lt!329587)) (_1!9667 lt!329587) (_2!9667 lt!329587)))))

(assert (=> d!71067 (= lt!329587 (readBitPure!0 lt!329586))))

(assert (=> d!71067 (= lt!329585 (readBitPure!0 lt!329486))))

(assert (=> d!71067 (= lt!329586 (BitStream!8325 (buf!5125 (_2!9666 lt!329481)) (currentByte!9667 lt!329486) (currentBit!9662 lt!329486)))))

(assert (=> d!71067 (invariant!0 (currentBit!9662 lt!329486) (currentByte!9667 lt!329486) (size!4608 (buf!5125 (_2!9666 lt!329481))))))

(assert (=> d!71067 (= (readBitPrefixLemma!0 lt!329486 (_2!9666 lt!329481)) lt!329588)))

(declare-fun b!210186 () Bool)

(assert (=> b!210186 (= e!143424 (= (_2!9667 lt!329585) (_2!9667 lt!329587)))))

(assert (= (and d!71067 res!176478) b!210186))

(declare-fun m!323571 () Bool)

(assert (=> d!71067 m!323571))

(declare-fun m!323573 () Bool)

(assert (=> d!71067 m!323573))

(assert (=> d!71067 m!323465))

(declare-fun m!323575 () Bool)

(assert (=> d!71067 m!323575))

(declare-fun m!323577 () Bool)

(assert (=> d!71067 m!323577))

(declare-fun m!323579 () Bool)

(assert (=> d!71067 m!323579))

(assert (=> b!210124 d!71067))

(declare-fun d!71075 () Bool)

(declare-fun lt!329589 () tuple2!18026)

(assert (=> d!71075 (= lt!329589 (readBit!0 (_1!9664 lt!329492)))))

(assert (=> d!71075 (= (readBitPure!0 (_1!9664 lt!329492)) (tuple2!18025 (_2!9668 lt!329589) (_1!9668 lt!329589)))))

(declare-fun bs!17458 () Bool)

(assert (= bs!17458 d!71075))

(declare-fun m!323581 () Bool)

(assert (=> bs!17458 m!323581))

(assert (=> b!210124 d!71075))

(declare-fun lt!329590 () tuple2!18028)

(declare-fun d!71077 () Bool)

(assert (=> d!71077 (= lt!329590 (readNBitsLSBFirstsLoop!0 (_1!9664 lt!329492) nBits!348 i!590 lt!329474))))

(assert (=> d!71077 (= (readNBitsLSBFirstsLoopPure!0 (_1!9664 lt!329492) nBits!348 i!590 lt!329474) (tuple2!18021 (_2!9669 lt!329590) (_1!9669 lt!329590)))))

(declare-fun bs!17459 () Bool)

(assert (= bs!17459 d!71077))

(declare-fun m!323583 () Bool)

(assert (=> bs!17459 m!323583))

(assert (=> b!210124 d!71077))

(declare-fun b!210214 () Bool)

(declare-fun res!176503 () Bool)

(declare-fun e!143439 () Bool)

(assert (=> b!210214 (=> (not res!176503) (not e!143439))))

(declare-fun lt!329660 () tuple2!18018)

(assert (=> b!210214 (= res!176503 (isPrefixOf!0 (_2!9664 lt!329660) (_2!9666 lt!329481)))))

(declare-fun d!71079 () Bool)

(assert (=> d!71079 e!143439))

(declare-fun res!176502 () Bool)

(assert (=> d!71079 (=> (not res!176502) (not e!143439))))

(assert (=> d!71079 (= res!176502 (isPrefixOf!0 (_1!9664 lt!329660) (_2!9664 lt!329660)))))

(declare-fun lt!329658 () BitStream!8324)

(assert (=> d!71079 (= lt!329660 (tuple2!18019 lt!329658 (_2!9666 lt!329481)))))

(declare-fun lt!329663 () Unit!14966)

(declare-fun lt!329664 () Unit!14966)

(assert (=> d!71079 (= lt!329663 lt!329664)))

(assert (=> d!71079 (isPrefixOf!0 lt!329658 (_2!9666 lt!329481))))

(assert (=> d!71079 (= lt!329664 (lemmaIsPrefixTransitive!0 lt!329658 (_2!9666 lt!329481) (_2!9666 lt!329481)))))

(declare-fun lt!329662 () Unit!14966)

(declare-fun lt!329677 () Unit!14966)

(assert (=> d!71079 (= lt!329662 lt!329677)))

(assert (=> d!71079 (isPrefixOf!0 lt!329658 (_2!9666 lt!329481))))

(assert (=> d!71079 (= lt!329677 (lemmaIsPrefixTransitive!0 lt!329658 (_2!9666 lt!329489) (_2!9666 lt!329481)))))

(declare-fun lt!329673 () Unit!14966)

(declare-fun e!143440 () Unit!14966)

(assert (=> d!71079 (= lt!329673 e!143440)))

(declare-fun c!10331 () Bool)

(assert (=> d!71079 (= c!10331 (not (= (size!4608 (buf!5125 (_2!9666 lt!329489))) #b00000000000000000000000000000000)))))

(declare-fun lt!329669 () Unit!14966)

(declare-fun lt!329665 () Unit!14966)

(assert (=> d!71079 (= lt!329669 lt!329665)))

(assert (=> d!71079 (isPrefixOf!0 (_2!9666 lt!329481) (_2!9666 lt!329481))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8324) Unit!14966)

(assert (=> d!71079 (= lt!329665 (lemmaIsPrefixRefl!0 (_2!9666 lt!329481)))))

(declare-fun lt!329667 () Unit!14966)

(declare-fun lt!329668 () Unit!14966)

(assert (=> d!71079 (= lt!329667 lt!329668)))

(assert (=> d!71079 (= lt!329668 (lemmaIsPrefixRefl!0 (_2!9666 lt!329481)))))

(declare-fun lt!329659 () Unit!14966)

(declare-fun lt!329671 () Unit!14966)

(assert (=> d!71079 (= lt!329659 lt!329671)))

(assert (=> d!71079 (isPrefixOf!0 lt!329658 lt!329658)))

(assert (=> d!71079 (= lt!329671 (lemmaIsPrefixRefl!0 lt!329658))))

(declare-fun lt!329674 () Unit!14966)

(declare-fun lt!329672 () Unit!14966)

(assert (=> d!71079 (= lt!329674 lt!329672)))

(assert (=> d!71079 (isPrefixOf!0 (_2!9666 lt!329489) (_2!9666 lt!329489))))

(assert (=> d!71079 (= lt!329672 (lemmaIsPrefixRefl!0 (_2!9666 lt!329489)))))

(assert (=> d!71079 (= lt!329658 (BitStream!8325 (buf!5125 (_2!9666 lt!329481)) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))))))

(assert (=> d!71079 (isPrefixOf!0 (_2!9666 lt!329489) (_2!9666 lt!329481))))

(assert (=> d!71079 (= (reader!0 (_2!9666 lt!329489) (_2!9666 lt!329481)) lt!329660)))

(declare-fun lt!329670 () (_ BitVec 64))

(declare-fun b!210215 () Bool)

(declare-fun lt!329666 () (_ BitVec 64))

(assert (=> b!210215 (= e!143439 (= (_1!9664 lt!329660) (withMovedBitIndex!0 (_2!9664 lt!329660) (bvsub lt!329666 lt!329670))))))

(assert (=> b!210215 (or (= (bvand lt!329666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329670 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329666 lt!329670) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210215 (= lt!329670 (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329481))) (currentByte!9667 (_2!9666 lt!329481)) (currentBit!9662 (_2!9666 lt!329481))))))

(assert (=> b!210215 (= lt!329666 (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))))))

(declare-fun b!210216 () Bool)

(declare-fun Unit!14968 () Unit!14966)

(assert (=> b!210216 (= e!143440 Unit!14968)))

(declare-fun b!210217 () Bool)

(declare-fun res!176504 () Bool)

(assert (=> b!210217 (=> (not res!176504) (not e!143439))))

(assert (=> b!210217 (= res!176504 (isPrefixOf!0 (_1!9664 lt!329660) (_2!9666 lt!329489)))))

(declare-fun b!210218 () Bool)

(declare-fun lt!329676 () Unit!14966)

(assert (=> b!210218 (= e!143440 lt!329676)))

(declare-fun lt!329675 () (_ BitVec 64))

(assert (=> b!210218 (= lt!329675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!329661 () (_ BitVec 64))

(assert (=> b!210218 (= lt!329661 (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10485 array!10485 (_ BitVec 64) (_ BitVec 64)) Unit!14966)

(assert (=> b!210218 (= lt!329676 (arrayBitRangesEqSymmetric!0 (buf!5125 (_2!9666 lt!329489)) (buf!5125 (_2!9666 lt!329481)) lt!329675 lt!329661))))

(assert (=> b!210218 (arrayBitRangesEq!0 (buf!5125 (_2!9666 lt!329481)) (buf!5125 (_2!9666 lt!329489)) lt!329675 lt!329661)))

(assert (= (and d!71079 c!10331) b!210218))

(assert (= (and d!71079 (not c!10331)) b!210216))

(assert (= (and d!71079 res!176502) b!210217))

(assert (= (and b!210217 res!176504) b!210214))

(assert (= (and b!210214 res!176503) b!210215))

(declare-fun m!323595 () Bool)

(assert (=> b!210217 m!323595))

(declare-fun m!323597 () Bool)

(assert (=> b!210214 m!323597))

(assert (=> b!210218 m!323437))

(declare-fun m!323599 () Bool)

(assert (=> b!210218 m!323599))

(declare-fun m!323601 () Bool)

(assert (=> b!210218 m!323601))

(declare-fun m!323603 () Bool)

(assert (=> b!210215 m!323603))

(assert (=> b!210215 m!323493))

(assert (=> b!210215 m!323437))

(assert (=> d!71079 m!323489))

(declare-fun m!323605 () Bool)

(assert (=> d!71079 m!323605))

(declare-fun m!323607 () Bool)

(assert (=> d!71079 m!323607))

(declare-fun m!323609 () Bool)

(assert (=> d!71079 m!323609))

(declare-fun m!323611 () Bool)

(assert (=> d!71079 m!323611))

(declare-fun m!323613 () Bool)

(assert (=> d!71079 m!323613))

(declare-fun m!323615 () Bool)

(assert (=> d!71079 m!323615))

(declare-fun m!323617 () Bool)

(assert (=> d!71079 m!323617))

(declare-fun m!323619 () Bool)

(assert (=> d!71079 m!323619))

(declare-fun m!323621 () Bool)

(assert (=> d!71079 m!323621))

(declare-fun m!323623 () Bool)

(assert (=> d!71079 m!323623))

(assert (=> b!210124 d!71079))

(declare-fun d!71091 () Bool)

(declare-fun lt!329678 () tuple2!18028)

(assert (=> d!71091 (= lt!329678 (readNBitsLSBFirstsLoop!0 (_1!9664 lt!329490) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329495))))

(assert (=> d!71091 (= (readNBitsLSBFirstsLoopPure!0 (_1!9664 lt!329490) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329495) (tuple2!18021 (_2!9669 lt!329678) (_1!9669 lt!329678)))))

(declare-fun bs!17461 () Bool)

(assert (= bs!17461 d!71091))

(declare-fun m!323625 () Bool)

(assert (=> bs!17461 m!323625))

(assert (=> b!210124 d!71091))

(declare-fun d!71093 () Bool)

(assert (=> d!71093 (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))) ((_ sign_extend 32) (currentByte!9667 thiss!1204)) ((_ sign_extend 32) (currentBit!9662 thiss!1204)) lt!329483)))

(declare-fun lt!329679 () Unit!14966)

(assert (=> d!71093 (= lt!329679 (choose!9 thiss!1204 (buf!5125 (_2!9666 lt!329481)) lt!329483 (BitStream!8325 (buf!5125 (_2!9666 lt!329481)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204))))))

(assert (=> d!71093 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5125 (_2!9666 lt!329481)) lt!329483) lt!329679)))

(declare-fun bs!17462 () Bool)

(assert (= bs!17462 d!71093))

(assert (=> bs!17462 m!323485))

(declare-fun m!323627 () Bool)

(assert (=> bs!17462 m!323627))

(assert (=> b!210124 d!71093))

(declare-fun d!71095 () Bool)

(declare-fun e!143441 () Bool)

(assert (=> d!71095 e!143441))

(declare-fun res!176506 () Bool)

(assert (=> d!71095 (=> (not res!176506) (not e!143441))))

(declare-fun lt!329681 () (_ BitVec 64))

(declare-fun lt!329683 () (_ BitVec 64))

(declare-fun lt!329684 () (_ BitVec 64))

(assert (=> d!71095 (= res!176506 (= lt!329683 (bvsub lt!329684 lt!329681)))))

(assert (=> d!71095 (or (= (bvand lt!329684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329681 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329684 lt!329681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71095 (= lt!329681 (remainingBits!0 ((_ sign_extend 32) (size!4608 (buf!5125 (_1!9667 lt!329488)))) ((_ sign_extend 32) (currentByte!9667 (_1!9667 lt!329488))) ((_ sign_extend 32) (currentBit!9662 (_1!9667 lt!329488)))))))

(declare-fun lt!329682 () (_ BitVec 64))

(declare-fun lt!329680 () (_ BitVec 64))

(assert (=> d!71095 (= lt!329684 (bvmul lt!329682 lt!329680))))

(assert (=> d!71095 (or (= lt!329682 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329680 (bvsdiv (bvmul lt!329682 lt!329680) lt!329682)))))

(assert (=> d!71095 (= lt!329680 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71095 (= lt!329682 ((_ sign_extend 32) (size!4608 (buf!5125 (_1!9667 lt!329488)))))))

(assert (=> d!71095 (= lt!329683 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9667 (_1!9667 lt!329488))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9662 (_1!9667 lt!329488)))))))

(assert (=> d!71095 (invariant!0 (currentBit!9662 (_1!9667 lt!329488)) (currentByte!9667 (_1!9667 lt!329488)) (size!4608 (buf!5125 (_1!9667 lt!329488))))))

(assert (=> d!71095 (= (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!329488))) (currentByte!9667 (_1!9667 lt!329488)) (currentBit!9662 (_1!9667 lt!329488))) lt!329683)))

(declare-fun b!210219 () Bool)

(declare-fun res!176505 () Bool)

(assert (=> b!210219 (=> (not res!176505) (not e!143441))))

(assert (=> b!210219 (= res!176505 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329683))))

(declare-fun b!210220 () Bool)

(declare-fun lt!329685 () (_ BitVec 64))

(assert (=> b!210220 (= e!143441 (bvsle lt!329683 (bvmul lt!329685 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210220 (or (= lt!329685 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329685 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329685)))))

(assert (=> b!210220 (= lt!329685 ((_ sign_extend 32) (size!4608 (buf!5125 (_1!9667 lt!329488)))))))

(assert (= (and d!71095 res!176506) b!210219))

(assert (= (and b!210219 res!176505) b!210220))

(declare-fun m!323629 () Bool)

(assert (=> d!71095 m!323629))

(declare-fun m!323631 () Bool)

(assert (=> d!71095 m!323631))

(assert (=> b!210124 d!71095))

(declare-fun d!71097 () Bool)

(assert (=> d!71097 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329489))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329489))) lt!329470) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329489))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329489)))) lt!329470))))

(declare-fun bs!17463 () Bool)

(assert (= bs!17463 d!71097))

(declare-fun m!323633 () Bool)

(assert (=> bs!17463 m!323633))

(assert (=> b!210124 d!71097))

(declare-fun b!210221 () Bool)

(declare-fun res!176508 () Bool)

(declare-fun e!143442 () Bool)

(assert (=> b!210221 (=> (not res!176508) (not e!143442))))

(declare-fun lt!329688 () tuple2!18018)

(assert (=> b!210221 (= res!176508 (isPrefixOf!0 (_2!9664 lt!329688) (_2!9666 lt!329481)))))

(declare-fun d!71099 () Bool)

(assert (=> d!71099 e!143442))

(declare-fun res!176507 () Bool)

(assert (=> d!71099 (=> (not res!176507) (not e!143442))))

(assert (=> d!71099 (= res!176507 (isPrefixOf!0 (_1!9664 lt!329688) (_2!9664 lt!329688)))))

(declare-fun lt!329686 () BitStream!8324)

(assert (=> d!71099 (= lt!329688 (tuple2!18019 lt!329686 (_2!9666 lt!329481)))))

(declare-fun lt!329691 () Unit!14966)

(declare-fun lt!329692 () Unit!14966)

(assert (=> d!71099 (= lt!329691 lt!329692)))

(assert (=> d!71099 (isPrefixOf!0 lt!329686 (_2!9666 lt!329481))))

(assert (=> d!71099 (= lt!329692 (lemmaIsPrefixTransitive!0 lt!329686 (_2!9666 lt!329481) (_2!9666 lt!329481)))))

(declare-fun lt!329690 () Unit!14966)

(declare-fun lt!329705 () Unit!14966)

(assert (=> d!71099 (= lt!329690 lt!329705)))

(assert (=> d!71099 (isPrefixOf!0 lt!329686 (_2!9666 lt!329481))))

(assert (=> d!71099 (= lt!329705 (lemmaIsPrefixTransitive!0 lt!329686 thiss!1204 (_2!9666 lt!329481)))))

(declare-fun lt!329701 () Unit!14966)

(declare-fun e!143443 () Unit!14966)

(assert (=> d!71099 (= lt!329701 e!143443)))

(declare-fun c!10332 () Bool)

(assert (=> d!71099 (= c!10332 (not (= (size!4608 (buf!5125 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!329697 () Unit!14966)

(declare-fun lt!329693 () Unit!14966)

(assert (=> d!71099 (= lt!329697 lt!329693)))

(assert (=> d!71099 (isPrefixOf!0 (_2!9666 lt!329481) (_2!9666 lt!329481))))

(assert (=> d!71099 (= lt!329693 (lemmaIsPrefixRefl!0 (_2!9666 lt!329481)))))

(declare-fun lt!329695 () Unit!14966)

(declare-fun lt!329696 () Unit!14966)

(assert (=> d!71099 (= lt!329695 lt!329696)))

(assert (=> d!71099 (= lt!329696 (lemmaIsPrefixRefl!0 (_2!9666 lt!329481)))))

(declare-fun lt!329687 () Unit!14966)

(declare-fun lt!329699 () Unit!14966)

(assert (=> d!71099 (= lt!329687 lt!329699)))

(assert (=> d!71099 (isPrefixOf!0 lt!329686 lt!329686)))

(assert (=> d!71099 (= lt!329699 (lemmaIsPrefixRefl!0 lt!329686))))

(declare-fun lt!329702 () Unit!14966)

(declare-fun lt!329700 () Unit!14966)

(assert (=> d!71099 (= lt!329702 lt!329700)))

(assert (=> d!71099 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71099 (= lt!329700 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71099 (= lt!329686 (BitStream!8325 (buf!5125 (_2!9666 lt!329481)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)))))

(assert (=> d!71099 (isPrefixOf!0 thiss!1204 (_2!9666 lt!329481))))

(assert (=> d!71099 (= (reader!0 thiss!1204 (_2!9666 lt!329481)) lt!329688)))

(declare-fun lt!329694 () (_ BitVec 64))

(declare-fun lt!329698 () (_ BitVec 64))

(declare-fun b!210222 () Bool)

(assert (=> b!210222 (= e!143442 (= (_1!9664 lt!329688) (withMovedBitIndex!0 (_2!9664 lt!329688) (bvsub lt!329694 lt!329698))))))

(assert (=> b!210222 (or (= (bvand lt!329694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329698 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329694 lt!329698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210222 (= lt!329698 (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329481))) (currentByte!9667 (_2!9666 lt!329481)) (currentBit!9662 (_2!9666 lt!329481))))))

(assert (=> b!210222 (= lt!329694 (bitIndex!0 (size!4608 (buf!5125 thiss!1204)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)))))

(declare-fun b!210223 () Bool)

(declare-fun Unit!14970 () Unit!14966)

(assert (=> b!210223 (= e!143443 Unit!14970)))

(declare-fun b!210224 () Bool)

(declare-fun res!176509 () Bool)

(assert (=> b!210224 (=> (not res!176509) (not e!143442))))

(assert (=> b!210224 (= res!176509 (isPrefixOf!0 (_1!9664 lt!329688) thiss!1204))))

(declare-fun b!210225 () Bool)

(declare-fun lt!329704 () Unit!14966)

(assert (=> b!210225 (= e!143443 lt!329704)))

(declare-fun lt!329703 () (_ BitVec 64))

(assert (=> b!210225 (= lt!329703 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!329689 () (_ BitVec 64))

(assert (=> b!210225 (= lt!329689 (bitIndex!0 (size!4608 (buf!5125 thiss!1204)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)))))

(assert (=> b!210225 (= lt!329704 (arrayBitRangesEqSymmetric!0 (buf!5125 thiss!1204) (buf!5125 (_2!9666 lt!329481)) lt!329703 lt!329689))))

(assert (=> b!210225 (arrayBitRangesEq!0 (buf!5125 (_2!9666 lt!329481)) (buf!5125 thiss!1204) lt!329703 lt!329689)))

(assert (= (and d!71099 c!10332) b!210225))

(assert (= (and d!71099 (not c!10332)) b!210223))

(assert (= (and d!71099 res!176507) b!210224))

(assert (= (and b!210224 res!176509) b!210221))

(assert (= (and b!210221 res!176508) b!210222))

(declare-fun m!323635 () Bool)

(assert (=> b!210224 m!323635))

(declare-fun m!323637 () Bool)

(assert (=> b!210221 m!323637))

(assert (=> b!210225 m!323439))

(declare-fun m!323639 () Bool)

(assert (=> b!210225 m!323639))

(declare-fun m!323641 () Bool)

(assert (=> b!210225 m!323641))

(declare-fun m!323643 () Bool)

(assert (=> b!210222 m!323643))

(assert (=> b!210222 m!323493))

(assert (=> b!210222 m!323439))

(assert (=> d!71099 m!323495))

(declare-fun m!323645 () Bool)

(assert (=> d!71099 m!323645))

(declare-fun m!323647 () Bool)

(assert (=> d!71099 m!323647))

(assert (=> d!71099 m!323609))

(declare-fun m!323649 () Bool)

(assert (=> d!71099 m!323649))

(declare-fun m!323651 () Bool)

(assert (=> d!71099 m!323651))

(declare-fun m!323653 () Bool)

(assert (=> d!71099 m!323653))

(assert (=> d!71099 m!323617))

(declare-fun m!323655 () Bool)

(assert (=> d!71099 m!323655))

(declare-fun m!323657 () Bool)

(assert (=> d!71099 m!323657))

(declare-fun m!323659 () Bool)

(assert (=> d!71099 m!323659))

(assert (=> b!210124 d!71099))

(declare-fun d!71101 () Bool)

(declare-fun e!143444 () Bool)

(assert (=> d!71101 e!143444))

(declare-fun res!176511 () Bool)

(assert (=> d!71101 (=> (not res!176511) (not e!143444))))

(declare-fun lt!329709 () (_ BitVec 64))

(declare-fun lt!329707 () (_ BitVec 64))

(declare-fun lt!329710 () (_ BitVec 64))

(assert (=> d!71101 (= res!176511 (= lt!329709 (bvsub lt!329710 lt!329707)))))

(assert (=> d!71101 (or (= (bvand lt!329710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329707 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329710 lt!329707) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71101 (= lt!329707 (remainingBits!0 ((_ sign_extend 32) (size!4608 (buf!5125 (_1!9667 lt!329477)))) ((_ sign_extend 32) (currentByte!9667 (_1!9667 lt!329477))) ((_ sign_extend 32) (currentBit!9662 (_1!9667 lt!329477)))))))

(declare-fun lt!329708 () (_ BitVec 64))

(declare-fun lt!329706 () (_ BitVec 64))

(assert (=> d!71101 (= lt!329710 (bvmul lt!329708 lt!329706))))

(assert (=> d!71101 (or (= lt!329708 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329706 (bvsdiv (bvmul lt!329708 lt!329706) lt!329708)))))

(assert (=> d!71101 (= lt!329706 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71101 (= lt!329708 ((_ sign_extend 32) (size!4608 (buf!5125 (_1!9667 lt!329477)))))))

(assert (=> d!71101 (= lt!329709 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9667 (_1!9667 lt!329477))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9662 (_1!9667 lt!329477)))))))

(assert (=> d!71101 (invariant!0 (currentBit!9662 (_1!9667 lt!329477)) (currentByte!9667 (_1!9667 lt!329477)) (size!4608 (buf!5125 (_1!9667 lt!329477))))))

(assert (=> d!71101 (= (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!329477))) (currentByte!9667 (_1!9667 lt!329477)) (currentBit!9662 (_1!9667 lt!329477))) lt!329709)))

(declare-fun b!210226 () Bool)

(declare-fun res!176510 () Bool)

(assert (=> b!210226 (=> (not res!176510) (not e!143444))))

(assert (=> b!210226 (= res!176510 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329709))))

(declare-fun b!210227 () Bool)

(declare-fun lt!329711 () (_ BitVec 64))

(assert (=> b!210227 (= e!143444 (bvsle lt!329709 (bvmul lt!329711 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210227 (or (= lt!329711 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329711 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329711)))))

(assert (=> b!210227 (= lt!329711 ((_ sign_extend 32) (size!4608 (buf!5125 (_1!9667 lt!329477)))))))

(assert (= (and d!71101 res!176511) b!210226))

(assert (= (and b!210226 res!176510) b!210227))

(declare-fun m!323661 () Bool)

(assert (=> d!71101 m!323661))

(declare-fun m!323663 () Bool)

(assert (=> d!71101 m!323663))

(assert (=> b!210124 d!71101))

(declare-fun d!71103 () Bool)

(declare-fun lt!329712 () tuple2!18026)

(assert (=> d!71103 (= lt!329712 (readBit!0 lt!329486))))

(assert (=> d!71103 (= (readBitPure!0 lt!329486) (tuple2!18025 (_2!9668 lt!329712) (_1!9668 lt!329712)))))

(declare-fun bs!17464 () Bool)

(assert (= bs!17464 d!71103))

(declare-fun m!323665 () Bool)

(assert (=> bs!17464 m!323665))

(assert (=> b!210124 d!71103))

(assert (=> b!210133 d!71027))

(assert (=> b!210137 d!71049))

(assert (=> b!210137 d!71051))

(declare-fun d!71105 () Bool)

(declare-fun e!143445 () Bool)

(assert (=> d!71105 e!143445))

(declare-fun res!176513 () Bool)

(assert (=> d!71105 (=> (not res!176513) (not e!143445))))

(declare-fun lt!329717 () (_ BitVec 64))

(declare-fun lt!329716 () (_ BitVec 64))

(declare-fun lt!329714 () (_ BitVec 64))

(assert (=> d!71105 (= res!176513 (= lt!329716 (bvsub lt!329717 lt!329714)))))

(assert (=> d!71105 (or (= (bvand lt!329717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329714 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329717 lt!329714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71105 (= lt!329714 (remainingBits!0 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329481))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329481)))))))

(declare-fun lt!329715 () (_ BitVec 64))

(declare-fun lt!329713 () (_ BitVec 64))

(assert (=> d!71105 (= lt!329717 (bvmul lt!329715 lt!329713))))

(assert (=> d!71105 (or (= lt!329715 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329713 (bvsdiv (bvmul lt!329715 lt!329713) lt!329715)))))

(assert (=> d!71105 (= lt!329713 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71105 (= lt!329715 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))))))

(assert (=> d!71105 (= lt!329716 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329481))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329481)))))))

(assert (=> d!71105 (invariant!0 (currentBit!9662 (_2!9666 lt!329481)) (currentByte!9667 (_2!9666 lt!329481)) (size!4608 (buf!5125 (_2!9666 lt!329481))))))

(assert (=> d!71105 (= (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329481))) (currentByte!9667 (_2!9666 lt!329481)) (currentBit!9662 (_2!9666 lt!329481))) lt!329716)))

(declare-fun b!210228 () Bool)

(declare-fun res!176512 () Bool)

(assert (=> b!210228 (=> (not res!176512) (not e!143445))))

(assert (=> b!210228 (= res!176512 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329716))))

(declare-fun b!210229 () Bool)

(declare-fun lt!329718 () (_ BitVec 64))

(assert (=> b!210229 (= e!143445 (bvsle lt!329716 (bvmul lt!329718 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210229 (or (= lt!329718 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329718 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329718)))))

(assert (=> b!210229 (= lt!329718 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329481)))))))

(assert (= (and d!71105 res!176513) b!210228))

(assert (= (and b!210228 res!176512) b!210229))

(declare-fun m!323667 () Bool)

(assert (=> d!71105 m!323667))

(assert (=> d!71105 m!323509))

(assert (=> b!210126 d!71105))

(declare-fun d!71107 () Bool)

(declare-fun res!176515 () Bool)

(declare-fun e!143447 () Bool)

(assert (=> d!71107 (=> (not res!176515) (not e!143447))))

(assert (=> d!71107 (= res!176515 (= (size!4608 (buf!5125 thiss!1204)) (size!4608 (buf!5125 (_2!9666 lt!329481)))))))

(assert (=> d!71107 (= (isPrefixOf!0 thiss!1204 (_2!9666 lt!329481)) e!143447)))

(declare-fun b!210230 () Bool)

(declare-fun res!176514 () Bool)

(assert (=> b!210230 (=> (not res!176514) (not e!143447))))

(assert (=> b!210230 (= res!176514 (bvsle (bitIndex!0 (size!4608 (buf!5125 thiss!1204)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204)) (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329481))) (currentByte!9667 (_2!9666 lt!329481)) (currentBit!9662 (_2!9666 lt!329481)))))))

(declare-fun b!210231 () Bool)

(declare-fun e!143446 () Bool)

(assert (=> b!210231 (= e!143447 e!143446)))

(declare-fun res!176516 () Bool)

(assert (=> b!210231 (=> res!176516 e!143446)))

(assert (=> b!210231 (= res!176516 (= (size!4608 (buf!5125 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210232 () Bool)

(assert (=> b!210232 (= e!143446 (arrayBitRangesEq!0 (buf!5125 thiss!1204) (buf!5125 (_2!9666 lt!329481)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4608 (buf!5125 thiss!1204)) (currentByte!9667 thiss!1204) (currentBit!9662 thiss!1204))))))

(assert (= (and d!71107 res!176515) b!210230))

(assert (= (and b!210230 res!176514) b!210231))

(assert (= (and b!210231 (not res!176516)) b!210232))

(assert (=> b!210230 m!323439))

(assert (=> b!210230 m!323493))

(assert (=> b!210232 m!323439))

(assert (=> b!210232 m!323439))

(declare-fun m!323669 () Bool)

(assert (=> b!210232 m!323669))

(assert (=> b!210126 d!71107))

(declare-fun d!71109 () Bool)

(assert (=> d!71109 (isPrefixOf!0 thiss!1204 (_2!9666 lt!329481))))

(declare-fun lt!329721 () Unit!14966)

(declare-fun choose!30 (BitStream!8324 BitStream!8324 BitStream!8324) Unit!14966)

(assert (=> d!71109 (= lt!329721 (choose!30 thiss!1204 (_2!9666 lt!329489) (_2!9666 lt!329481)))))

(assert (=> d!71109 (isPrefixOf!0 thiss!1204 (_2!9666 lt!329489))))

(assert (=> d!71109 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9666 lt!329489) (_2!9666 lt!329481)) lt!329721)))

(declare-fun bs!17465 () Bool)

(assert (= bs!17465 d!71109))

(assert (=> bs!17465 m!323495))

(declare-fun m!323671 () Bool)

(assert (=> bs!17465 m!323671))

(assert (=> bs!17465 m!323445))

(assert (=> b!210126 d!71109))

(declare-fun b!210342 () Bool)

(declare-fun e!143517 () Bool)

(declare-fun lt!330093 () tuple2!18020)

(declare-fun lt!330085 () tuple2!18018)

(assert (=> b!210342 (= e!143517 (= (_1!9665 lt!330093) (_2!9664 lt!330085)))))

(declare-fun b!210343 () Bool)

(declare-fun res!176608 () Bool)

(declare-fun e!143518 () Bool)

(assert (=> b!210343 (=> (not res!176608) (not e!143518))))

(declare-fun lt!330053 () (_ BitVec 64))

(declare-fun lt!330078 () tuple2!18022)

(declare-fun lt!330092 () (_ BitVec 64))

(assert (=> b!210343 (= res!176608 (= (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!330078))) (currentByte!9667 (_2!9666 lt!330078)) (currentBit!9662 (_2!9666 lt!330078))) (bvsub lt!330092 lt!330053)))))

(assert (=> b!210343 (or (= (bvand lt!330092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330053 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330092 lt!330053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210343 (= lt!330053 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!330050 () (_ BitVec 64))

(declare-fun lt!330074 () (_ BitVec 64))

(assert (=> b!210343 (= lt!330092 (bvadd lt!330050 lt!330074))))

(assert (=> b!210343 (or (not (= (bvand lt!330050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330074 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330050 lt!330074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210343 (= lt!330074 ((_ sign_extend 32) nBits!348))))

(assert (=> b!210343 (= lt!330050 (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))))))

(declare-fun d!71111 () Bool)

(assert (=> d!71111 e!143518))

(declare-fun res!176616 () Bool)

(assert (=> d!71111 (=> (not res!176616) (not e!143518))))

(assert (=> d!71111 (= res!176616 (invariant!0 (currentBit!9662 (_2!9666 lt!330078)) (currentByte!9667 (_2!9666 lt!330078)) (size!4608 (buf!5125 (_2!9666 lt!330078)))))))

(declare-fun e!143511 () tuple2!18022)

(assert (=> d!71111 (= lt!330078 e!143511)))

(declare-fun c!10343 () Bool)

(assert (=> d!71111 (= c!10343 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71111 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71111 (= (appendBitsLSBFirstLoopTR!0 (_2!9666 lt!329489) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!330078)))

(declare-fun b!210344 () Bool)

(declare-fun lt!330058 () tuple2!18024)

(declare-fun lt!330087 () tuple2!18022)

(assert (=> b!210344 (= lt!330058 (readBitPure!0 (readerFrom!0 (_2!9666 lt!330087) (currentBit!9662 (_2!9666 lt!329489)) (currentByte!9667 (_2!9666 lt!329489)))))))

(declare-fun lt!330049 () Bool)

(declare-fun res!176610 () Bool)

(assert (=> b!210344 (= res!176610 (and (= (_2!9667 lt!330058) lt!330049) (= (_1!9667 lt!330058) (_2!9666 lt!330087))))))

(declare-fun e!143513 () Bool)

(assert (=> b!210344 (=> (not res!176610) (not e!143513))))

(declare-fun e!143514 () Bool)

(assert (=> b!210344 (= e!143514 e!143513)))

(declare-fun b!210345 () Bool)

(declare-fun res!176609 () Bool)

(declare-fun call!3312 () Bool)

(assert (=> b!210345 (= res!176609 call!3312)))

(assert (=> b!210345 (=> (not res!176609) (not e!143514))))

(declare-fun b!210346 () Bool)

(declare-fun Unit!14981 () Unit!14966)

(assert (=> b!210346 (= e!143511 (tuple2!18023 Unit!14981 (_2!9666 lt!329489)))))

(declare-fun lt!330102 () Unit!14966)

(assert (=> b!210346 (= lt!330102 (lemmaIsPrefixRefl!0 (_2!9666 lt!329489)))))

(assert (=> b!210346 call!3312))

(declare-fun lt!330065 () Unit!14966)

(assert (=> b!210346 (= lt!330065 lt!330102)))

(declare-fun b!210347 () Bool)

(assert (=> b!210347 (= e!143518 e!143517)))

(declare-fun res!176607 () Bool)

(assert (=> b!210347 (=> (not res!176607) (not e!143517))))

(assert (=> b!210347 (= res!176607 (= (_2!9665 lt!330093) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!210347 (= lt!330093 (readNBitsLSBFirstsLoopPure!0 (_1!9664 lt!330085) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!330068 () Unit!14966)

(declare-fun lt!330096 () Unit!14966)

(assert (=> b!210347 (= lt!330068 lt!330096)))

(declare-fun lt!330067 () (_ BitVec 64))

(assert (=> b!210347 (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!330078)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329489))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329489))) lt!330067)))

(assert (=> b!210347 (= lt!330096 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9666 lt!329489) (buf!5125 (_2!9666 lt!330078)) lt!330067))))

(declare-fun e!143515 () Bool)

(assert (=> b!210347 e!143515))

(declare-fun res!176613 () Bool)

(assert (=> b!210347 (=> (not res!176613) (not e!143515))))

(assert (=> b!210347 (= res!176613 (and (= (size!4608 (buf!5125 (_2!9666 lt!329489))) (size!4608 (buf!5125 (_2!9666 lt!330078)))) (bvsge lt!330067 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210347 (= lt!330067 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!210347 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!210347 (= lt!330085 (reader!0 (_2!9666 lt!329489) (_2!9666 lt!330078)))))

(declare-fun b!210348 () Bool)

(declare-fun e!143516 () (_ BitVec 64))

(assert (=> b!210348 (= e!143516 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!210349 () Bool)

(assert (=> b!210349 (= e!143513 (= (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!330058))) (currentByte!9667 (_1!9667 lt!330058)) (currentBit!9662 (_1!9667 lt!330058))) (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!330087))) (currentByte!9667 (_2!9666 lt!330087)) (currentBit!9662 (_2!9666 lt!330087)))))))

(declare-fun b!210350 () Bool)

(assert (=> b!210350 (= e!143516 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!210351 () Bool)

(assert (=> b!210351 (= e!143515 (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!329489)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329489))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329489))) lt!330067))))

(declare-fun b!210352 () Bool)

(declare-fun res!176612 () Bool)

(assert (=> b!210352 (=> (not res!176612) (not e!143518))))

(assert (=> b!210352 (= res!176612 (= (size!4608 (buf!5125 (_2!9666 lt!329489))) (size!4608 (buf!5125 (_2!9666 lt!330078)))))))

(declare-fun b!210353 () Bool)

(declare-fun res!176606 () Bool)

(assert (=> b!210353 (=> (not res!176606) (not e!143518))))

(assert (=> b!210353 (= res!176606 (isPrefixOf!0 (_2!9666 lt!329489) (_2!9666 lt!330078)))))

(declare-fun b!210354 () Bool)

(declare-fun lt!330070 () tuple2!18022)

(assert (=> b!210354 (= e!143511 (tuple2!18023 (_1!9666 lt!330070) (_2!9666 lt!330070)))))

(assert (=> b!210354 (= lt!330049 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210354 (= lt!330087 (appendBit!0 (_2!9666 lt!329489) lt!330049))))

(declare-fun res!176611 () Bool)

(assert (=> b!210354 (= res!176611 (= (size!4608 (buf!5125 (_2!9666 lt!329489))) (size!4608 (buf!5125 (_2!9666 lt!330087)))))))

(assert (=> b!210354 (=> (not res!176611) (not e!143514))))

(assert (=> b!210354 e!143514))

(declare-fun lt!330062 () tuple2!18022)

(assert (=> b!210354 (= lt!330062 lt!330087)))

(assert (=> b!210354 (= lt!330070 (appendBitsLSBFirstLoopTR!0 (_2!9666 lt!330062) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!330081 () Unit!14966)

(assert (=> b!210354 (= lt!330081 (lemmaIsPrefixTransitive!0 (_2!9666 lt!329489) (_2!9666 lt!330062) (_2!9666 lt!330070)))))

(assert (=> b!210354 (isPrefixOf!0 (_2!9666 lt!329489) (_2!9666 lt!330070))))

(declare-fun lt!330091 () Unit!14966)

(assert (=> b!210354 (= lt!330091 lt!330081)))

(assert (=> b!210354 (invariant!0 (currentBit!9662 (_2!9666 lt!329489)) (currentByte!9667 (_2!9666 lt!329489)) (size!4608 (buf!5125 (_2!9666 lt!330062))))))

(declare-fun lt!330097 () BitStream!8324)

(assert (=> b!210354 (= lt!330097 (BitStream!8325 (buf!5125 (_2!9666 lt!330062)) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))))))

(assert (=> b!210354 (invariant!0 (currentBit!9662 lt!330097) (currentByte!9667 lt!330097) (size!4608 (buf!5125 (_2!9666 lt!330070))))))

(declare-fun lt!330086 () BitStream!8324)

(assert (=> b!210354 (= lt!330086 (BitStream!8325 (buf!5125 (_2!9666 lt!330070)) (currentByte!9667 lt!330097) (currentBit!9662 lt!330097)))))

(declare-fun lt!330094 () tuple2!18024)

(assert (=> b!210354 (= lt!330094 (readBitPure!0 lt!330097))))

(declare-fun lt!330060 () tuple2!18024)

(assert (=> b!210354 (= lt!330060 (readBitPure!0 lt!330086))))

(declare-fun lt!330047 () Unit!14966)

(assert (=> b!210354 (= lt!330047 (readBitPrefixLemma!0 lt!330097 (_2!9666 lt!330070)))))

(declare-fun res!176614 () Bool)

(assert (=> b!210354 (= res!176614 (= (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!330094))) (currentByte!9667 (_1!9667 lt!330094)) (currentBit!9662 (_1!9667 lt!330094))) (bitIndex!0 (size!4608 (buf!5125 (_1!9667 lt!330060))) (currentByte!9667 (_1!9667 lt!330060)) (currentBit!9662 (_1!9667 lt!330060)))))))

(declare-fun e!143510 () Bool)

(assert (=> b!210354 (=> (not res!176614) (not e!143510))))

(assert (=> b!210354 e!143510))

(declare-fun lt!330061 () Unit!14966)

(assert (=> b!210354 (= lt!330061 lt!330047)))

(declare-fun lt!330083 () tuple2!18018)

(assert (=> b!210354 (= lt!330083 (reader!0 (_2!9666 lt!329489) (_2!9666 lt!330070)))))

(declare-fun lt!330080 () tuple2!18018)

(assert (=> b!210354 (= lt!330080 (reader!0 (_2!9666 lt!330062) (_2!9666 lt!330070)))))

(declare-fun lt!330099 () tuple2!18024)

(assert (=> b!210354 (= lt!330099 (readBitPure!0 (_1!9664 lt!330083)))))

(assert (=> b!210354 (= (_2!9667 lt!330099) lt!330049)))

(declare-fun lt!330089 () Unit!14966)

(declare-fun Unit!14982 () Unit!14966)

(assert (=> b!210354 (= lt!330089 Unit!14982)))

(declare-fun lt!330100 () (_ BitVec 64))

(assert (=> b!210354 (= lt!330100 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!330101 () (_ BitVec 64))

(assert (=> b!210354 (= lt!330101 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!330066 () Unit!14966)

(assert (=> b!210354 (= lt!330066 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9666 lt!329489) (buf!5125 (_2!9666 lt!330070)) lt!330101))))

(assert (=> b!210354 (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!330070)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329489))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329489))) lt!330101)))

(declare-fun lt!330055 () Unit!14966)

(assert (=> b!210354 (= lt!330055 lt!330066)))

(declare-fun lt!330056 () tuple2!18020)

(assert (=> b!210354 (= lt!330056 (readNBitsLSBFirstsLoopPure!0 (_1!9664 lt!330083) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330100))))

(declare-fun lt!330098 () (_ BitVec 64))

(assert (=> b!210354 (= lt!330098 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!330077 () Unit!14966)

(assert (=> b!210354 (= lt!330077 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9666 lt!330062) (buf!5125 (_2!9666 lt!330070)) lt!330098))))

(assert (=> b!210354 (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!330070)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!330062))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!330062))) lt!330098)))

(declare-fun lt!330064 () Unit!14966)

(assert (=> b!210354 (= lt!330064 lt!330077)))

(declare-fun lt!330088 () tuple2!18020)

(assert (=> b!210354 (= lt!330088 (readNBitsLSBFirstsLoopPure!0 (_1!9664 lt!330080) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!330100 (ite (_2!9667 lt!330099) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!330076 () tuple2!18020)

(assert (=> b!210354 (= lt!330076 (readNBitsLSBFirstsLoopPure!0 (_1!9664 lt!330083) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330100))))

(declare-fun c!10344 () Bool)

(assert (=> b!210354 (= c!10344 (_2!9667 (readBitPure!0 (_1!9664 lt!330083))))))

(declare-fun lt!330084 () tuple2!18020)

(assert (=> b!210354 (= lt!330084 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9664 lt!330083) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!330100 e!143516)))))

(declare-fun lt!330095 () Unit!14966)

(assert (=> b!210354 (= lt!330095 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9664 lt!330083) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330100))))

(assert (=> b!210354 (and (= (_2!9665 lt!330076) (_2!9665 lt!330084)) (= (_1!9665 lt!330076) (_1!9665 lt!330084)))))

(declare-fun lt!330090 () Unit!14966)

(assert (=> b!210354 (= lt!330090 lt!330095)))

(assert (=> b!210354 (= (_1!9664 lt!330083) (withMovedBitIndex!0 (_2!9664 lt!330083) (bvsub (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))) (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!330070))) (currentByte!9667 (_2!9666 lt!330070)) (currentBit!9662 (_2!9666 lt!330070))))))))

(declare-fun lt!330063 () Unit!14966)

(declare-fun Unit!14983 () Unit!14966)

(assert (=> b!210354 (= lt!330063 Unit!14983)))

(assert (=> b!210354 (= (_1!9664 lt!330080) (withMovedBitIndex!0 (_2!9664 lt!330080) (bvsub (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!330062))) (currentByte!9667 (_2!9666 lt!330062)) (currentBit!9662 (_2!9666 lt!330062))) (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!330070))) (currentByte!9667 (_2!9666 lt!330070)) (currentBit!9662 (_2!9666 lt!330070))))))))

(declare-fun lt!330079 () Unit!14966)

(declare-fun Unit!14984 () Unit!14966)

(assert (=> b!210354 (= lt!330079 Unit!14984)))

(assert (=> b!210354 (= (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))) (bvsub (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!330062))) (currentByte!9667 (_2!9666 lt!330062)) (currentBit!9662 (_2!9666 lt!330062))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!330071 () Unit!14966)

(declare-fun Unit!14985 () Unit!14966)

(assert (=> b!210354 (= lt!330071 Unit!14985)))

(assert (=> b!210354 (= (_2!9665 lt!330056) (_2!9665 lt!330088))))

(declare-fun lt!330072 () Unit!14966)

(declare-fun Unit!14986 () Unit!14966)

(assert (=> b!210354 (= lt!330072 Unit!14986)))

(assert (=> b!210354 (invariant!0 (currentBit!9662 (_2!9666 lt!330070)) (currentByte!9667 (_2!9666 lt!330070)) (size!4608 (buf!5125 (_2!9666 lt!330070))))))

(declare-fun lt!330069 () Unit!14966)

(declare-fun Unit!14987 () Unit!14966)

(assert (=> b!210354 (= lt!330069 Unit!14987)))

(assert (=> b!210354 (= (size!4608 (buf!5125 (_2!9666 lt!329489))) (size!4608 (buf!5125 (_2!9666 lt!330070))))))

(declare-fun lt!330057 () Unit!14966)

(declare-fun Unit!14988 () Unit!14966)

(assert (=> b!210354 (= lt!330057 Unit!14988)))

(assert (=> b!210354 (= (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!330070))) (currentByte!9667 (_2!9666 lt!330070)) (currentBit!9662 (_2!9666 lt!330070))) (bvsub (bvadd (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!330075 () Unit!14966)

(declare-fun Unit!14989 () Unit!14966)

(assert (=> b!210354 (= lt!330075 Unit!14989)))

(declare-fun lt!330054 () Unit!14966)

(declare-fun Unit!14990 () Unit!14966)

(assert (=> b!210354 (= lt!330054 Unit!14990)))

(declare-fun lt!330073 () tuple2!18018)

(assert (=> b!210354 (= lt!330073 (reader!0 (_2!9666 lt!329489) (_2!9666 lt!330070)))))

(declare-fun lt!330051 () (_ BitVec 64))

(assert (=> b!210354 (= lt!330051 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!330059 () Unit!14966)

(assert (=> b!210354 (= lt!330059 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9666 lt!329489) (buf!5125 (_2!9666 lt!330070)) lt!330051))))

(assert (=> b!210354 (validate_offset_bits!1 ((_ sign_extend 32) (size!4608 (buf!5125 (_2!9666 lt!330070)))) ((_ sign_extend 32) (currentByte!9667 (_2!9666 lt!329489))) ((_ sign_extend 32) (currentBit!9662 (_2!9666 lt!329489))) lt!330051)))

(declare-fun lt!330048 () Unit!14966)

(assert (=> b!210354 (= lt!330048 lt!330059)))

(declare-fun lt!330082 () tuple2!18020)

(assert (=> b!210354 (= lt!330082 (readNBitsLSBFirstsLoopPure!0 (_1!9664 lt!330073) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!176617 () Bool)

(assert (=> b!210354 (= res!176617 (= (_2!9665 lt!330082) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!143512 () Bool)

(assert (=> b!210354 (=> (not res!176617) (not e!143512))))

(assert (=> b!210354 e!143512))

(declare-fun lt!330052 () Unit!14966)

(declare-fun Unit!14992 () Unit!14966)

(assert (=> b!210354 (= lt!330052 Unit!14992)))

(declare-fun b!210355 () Bool)

(assert (=> b!210355 (= e!143510 (= (_2!9667 lt!330094) (_2!9667 lt!330060)))))

(declare-fun bm!3309 () Bool)

(assert (=> bm!3309 (= call!3312 (isPrefixOf!0 (_2!9666 lt!329489) (ite c!10343 (_2!9666 lt!329489) (_2!9666 lt!330087))))))

(declare-fun b!210356 () Bool)

(assert (=> b!210356 (= e!143512 (= (_1!9665 lt!330082) (_2!9664 lt!330073)))))

(declare-fun b!210357 () Bool)

(declare-fun res!176615 () Bool)

(assert (=> b!210357 (= res!176615 (= (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!330087))) (currentByte!9667 (_2!9666 lt!330087)) (currentBit!9662 (_2!9666 lt!330087))) (bvadd (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!210357 (=> (not res!176615) (not e!143514))))

(assert (= (and d!71111 c!10343) b!210346))

(assert (= (and d!71111 (not c!10343)) b!210354))

(assert (= (and b!210354 res!176611) b!210357))

(assert (= (and b!210357 res!176615) b!210345))

(assert (= (and b!210345 res!176609) b!210344))

(assert (= (and b!210344 res!176610) b!210349))

(assert (= (and b!210354 res!176614) b!210355))

(assert (= (and b!210354 c!10344) b!210348))

(assert (= (and b!210354 (not c!10344)) b!210350))

(assert (= (and b!210354 res!176617) b!210356))

(assert (= (or b!210346 b!210345) bm!3309))

(assert (= (and d!71111 res!176616) b!210352))

(assert (= (and b!210352 res!176612) b!210343))

(assert (= (and b!210343 res!176608) b!210353))

(assert (= (and b!210353 res!176606) b!210347))

(assert (= (and b!210347 res!176613) b!210351))

(assert (= (and b!210347 res!176607) b!210342))

(declare-fun m!323787 () Bool)

(assert (=> b!210347 m!323787))

(declare-fun m!323789 () Bool)

(assert (=> b!210347 m!323789))

(declare-fun m!323791 () Bool)

(assert (=> b!210347 m!323791))

(declare-fun m!323793 () Bool)

(assert (=> b!210347 m!323793))

(declare-fun m!323795 () Bool)

(assert (=> b!210347 m!323795))

(declare-fun m!323797 () Bool)

(assert (=> b!210347 m!323797))

(declare-fun m!323799 () Bool)

(assert (=> b!210344 m!323799))

(assert (=> b!210344 m!323799))

(declare-fun m!323801 () Bool)

(assert (=> b!210344 m!323801))

(assert (=> b!210346 m!323607))

(declare-fun m!323803 () Bool)

(assert (=> b!210343 m!323803))

(assert (=> b!210343 m!323437))

(declare-fun m!323805 () Bool)

(assert (=> b!210357 m!323805))

(assert (=> b!210357 m!323437))

(declare-fun m!323807 () Bool)

(assert (=> b!210351 m!323807))

(declare-fun m!323811 () Bool)

(assert (=> bm!3309 m!323811))

(declare-fun m!323815 () Bool)

(assert (=> d!71111 m!323815))

(declare-fun m!323817 () Bool)

(assert (=> b!210353 m!323817))

(declare-fun m!323821 () Bool)

(assert (=> b!210349 m!323821))

(assert (=> b!210349 m!323805))

(declare-fun m!323827 () Bool)

(assert (=> b!210354 m!323827))

(declare-fun m!323831 () Bool)

(assert (=> b!210354 m!323831))

(declare-fun m!323833 () Bool)

(assert (=> b!210354 m!323833))

(declare-fun m!323835 () Bool)

(assert (=> b!210354 m!323835))

(declare-fun m!323837 () Bool)

(assert (=> b!210354 m!323837))

(declare-fun m!323841 () Bool)

(assert (=> b!210354 m!323841))

(declare-fun m!323843 () Bool)

(assert (=> b!210354 m!323843))

(declare-fun m!323845 () Bool)

(assert (=> b!210354 m!323845))

(declare-fun m!323847 () Bool)

(assert (=> b!210354 m!323847))

(assert (=> b!210354 m!323789))

(assert (=> b!210354 m!323831))

(declare-fun m!323849 () Bool)

(assert (=> b!210354 m!323849))

(declare-fun m!323851 () Bool)

(assert (=> b!210354 m!323851))

(declare-fun m!323853 () Bool)

(assert (=> b!210354 m!323853))

(declare-fun m!323855 () Bool)

(assert (=> b!210354 m!323855))

(assert (=> b!210354 m!323791))

(declare-fun m!323857 () Bool)

(assert (=> b!210354 m!323857))

(declare-fun m!323859 () Bool)

(assert (=> b!210354 m!323859))

(declare-fun m!323861 () Bool)

(assert (=> b!210354 m!323861))

(declare-fun m!323863 () Bool)

(assert (=> b!210354 m!323863))

(declare-fun m!323867 () Bool)

(assert (=> b!210354 m!323867))

(declare-fun m!323869 () Bool)

(assert (=> b!210354 m!323869))

(declare-fun m!323871 () Bool)

(assert (=> b!210354 m!323871))

(declare-fun m!323873 () Bool)

(assert (=> b!210354 m!323873))

(declare-fun m!323875 () Bool)

(assert (=> b!210354 m!323875))

(declare-fun m!323877 () Bool)

(assert (=> b!210354 m!323877))

(assert (=> b!210354 m!323437))

(declare-fun m!323879 () Bool)

(assert (=> b!210354 m!323879))

(declare-fun m!323881 () Bool)

(assert (=> b!210354 m!323881))

(declare-fun m!323883 () Bool)

(assert (=> b!210354 m!323883))

(declare-fun m!323885 () Bool)

(assert (=> b!210354 m!323885))

(declare-fun m!323887 () Bool)

(assert (=> b!210354 m!323887))

(declare-fun m!323889 () Bool)

(assert (=> b!210354 m!323889))

(declare-fun m!323891 () Bool)

(assert (=> b!210354 m!323891))

(declare-fun m!323893 () Bool)

(assert (=> b!210354 m!323893))

(assert (=> b!210126 d!71111))

(declare-fun d!71149 () Bool)

(declare-fun res!176634 () Bool)

(declare-fun e!143528 () Bool)

(assert (=> d!71149 (=> (not res!176634) (not e!143528))))

(assert (=> d!71149 (= res!176634 (= (size!4608 (buf!5125 (_2!9666 lt!329489))) (size!4608 (buf!5125 (_2!9666 lt!329481)))))))

(assert (=> d!71149 (= (isPrefixOf!0 (_2!9666 lt!329489) (_2!9666 lt!329481)) e!143528)))

(declare-fun b!210374 () Bool)

(declare-fun res!176633 () Bool)

(assert (=> b!210374 (=> (not res!176633) (not e!143528))))

(assert (=> b!210374 (= res!176633 (bvsle (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489))) (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329481))) (currentByte!9667 (_2!9666 lt!329481)) (currentBit!9662 (_2!9666 lt!329481)))))))

(declare-fun b!210375 () Bool)

(declare-fun e!143527 () Bool)

(assert (=> b!210375 (= e!143528 e!143527)))

(declare-fun res!176635 () Bool)

(assert (=> b!210375 (=> res!176635 e!143527)))

(assert (=> b!210375 (= res!176635 (= (size!4608 (buf!5125 (_2!9666 lt!329489))) #b00000000000000000000000000000000))))

(declare-fun b!210376 () Bool)

(assert (=> b!210376 (= e!143527 (arrayBitRangesEq!0 (buf!5125 (_2!9666 lt!329489)) (buf!5125 (_2!9666 lt!329481)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4608 (buf!5125 (_2!9666 lt!329489))) (currentByte!9667 (_2!9666 lt!329489)) (currentBit!9662 (_2!9666 lt!329489)))))))

(assert (= (and d!71149 res!176634) b!210374))

(assert (= (and b!210374 res!176633) b!210375))

(assert (= (and b!210375 (not res!176635)) b!210376))

(assert (=> b!210374 m!323437))

(assert (=> b!210374 m!323493))

(assert (=> b!210376 m!323437))

(assert (=> b!210376 m!323437))

(declare-fun m!323895 () Bool)

(assert (=> b!210376 m!323895))

(assert (=> b!210127 d!71149))

(declare-fun d!71151 () Bool)

(assert (=> d!71151 (= (array_inv!4349 (buf!5125 thiss!1204)) (bvsge (size!4608 (buf!5125 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!210125 d!71151))

(declare-fun d!71153 () Bool)

(assert (=> d!71153 (= (invariant!0 (currentBit!9662 thiss!1204) (currentByte!9667 thiss!1204) (size!4608 (buf!5125 (_2!9666 lt!329481)))) (and (bvsge (currentBit!9662 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9662 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9667 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9667 thiss!1204) (size!4608 (buf!5125 (_2!9666 lt!329481)))) (and (= (currentBit!9662 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9667 thiss!1204) (size!4608 (buf!5125 (_2!9666 lt!329481))))))))))

(assert (=> b!210136 d!71153))

(push 1)

(assert (not b!210179))

(assert (not b!210177))

(assert (not d!71043))

(assert (not d!71077))

(assert (not b!210148))

(assert (not b!210354))

(assert (not b!210349))

(assert (not d!71039))

(assert (not b!210357))

(assert (not d!71095))

(assert (not b!210222))

(assert (not b!210374))

(assert (not d!71045))

(assert (not d!71105))

(assert (not b!210153))

(assert (not b!210150))

(assert (not d!71041))

(assert (not b!210351))

(assert (not b!210178))

(assert (not b!210218))

(assert (not d!71093))

(assert (not b!210376))

(assert (not d!71059))

(assert (not b!210225))

(assert (not b!210215))

(assert (not d!71075))

(assert (not d!71065))

(assert (not d!71053))

(assert (not b!210346))

(assert (not b!210224))

(assert (not b!210230))

(assert (not d!71063))

(assert (not b!210347))

(assert (not d!71033))

(assert (not d!71047))

(assert (not d!71067))

(assert (not d!71055))

(assert (not b!210180))

(assert (not b!210344))

(assert (not b!210214))

(assert (not d!71091))

(assert (not b!210343))

(assert (not d!71051))

(assert (not bm!3309))

(assert (not d!71111))

(assert (not d!71035))

(assert (not d!71049))

(assert (not d!71031))

(assert (not b!210232))

(assert (not b!210217))

(assert (not d!71101))

(assert (not b!210353))

(assert (not d!71099))

(assert (not d!71097))

(assert (not d!71079))

(assert (not b!210221))

(assert (not d!71109))

(assert (not d!71103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

