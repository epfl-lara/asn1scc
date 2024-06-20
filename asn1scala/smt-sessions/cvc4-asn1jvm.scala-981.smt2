; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27478 () Bool)

(assert start!27478)

(declare-fun b!141528 () Bool)

(declare-fun res!118066 () Bool)

(declare-fun e!94288 () Bool)

(assert (=> b!141528 (=> (not res!118066) (not e!94288))))

(declare-datatypes ((array!6493 0))(
  ( (array!6494 (arr!3647 (Array (_ BitVec 32) (_ BitVec 8))) (size!2940 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5138 0))(
  ( (BitStream!5139 (buf!3361 array!6493) (currentByte!6221 (_ BitVec 32)) (currentBit!6216 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5138)

(declare-datatypes ((Unit!8862 0))(
  ( (Unit!8863) )
))
(declare-datatypes ((tuple2!12536 0))(
  ( (tuple2!12537 (_1!6598 Unit!8862) (_2!6598 BitStream!5138)) )
))
(declare-fun lt!219599 () tuple2!12536)

(declare-fun isPrefixOf!0 (BitStream!5138 BitStream!5138) Bool)

(assert (=> b!141528 (= res!118066 (isPrefixOf!0 thiss!1634 (_2!6598 lt!219599)))))

(declare-fun b!141529 () Bool)

(declare-fun e!94291 () Bool)

(declare-fun array_inv!2729 (array!6493) Bool)

(assert (=> b!141529 (= e!94291 (array_inv!2729 (buf!3361 thiss!1634)))))

(declare-fun b!141530 () Bool)

(declare-fun res!118065 () Bool)

(assert (=> b!141530 (=> (not res!118065) (not e!94288))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141530 (= res!118065 (= (bitIndex!0 (size!2940 (buf!3361 (_2!6598 lt!219599))) (currentByte!6221 (_2!6598 lt!219599)) (currentBit!6216 (_2!6598 lt!219599))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2940 (buf!3361 thiss!1634)) (currentByte!6221 thiss!1634) (currentBit!6216 thiss!1634)))))))

(declare-datatypes ((tuple2!12538 0))(
  ( (tuple2!12539 (_1!6599 BitStream!5138) (_2!6599 BitStream!5138)) )
))
(declare-fun lt!219604 () tuple2!12538)

(declare-datatypes ((tuple2!12540 0))(
  ( (tuple2!12541 (_1!6600 BitStream!5138) (_2!6600 (_ BitVec 8))) )
))
(declare-fun lt!219602 () tuple2!12540)

(declare-fun arr!237 () array!6493)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun b!141531 () Bool)

(assert (=> b!141531 (= e!94288 (and (= (_2!6600 lt!219602) (select (arr!3647 arr!237) from!447)) (= (_1!6600 lt!219602) (_2!6599 lt!219604))))))

(declare-fun readBytePure!0 (BitStream!5138) tuple2!12540)

(assert (=> b!141531 (= lt!219602 (readBytePure!0 (_1!6599 lt!219604)))))

(declare-fun reader!0 (BitStream!5138 BitStream!5138) tuple2!12538)

(assert (=> b!141531 (= lt!219604 (reader!0 thiss!1634 (_2!6598 lt!219599)))))

(declare-fun b!141532 () Bool)

(declare-fun e!94287 () Bool)

(declare-fun e!94292 () Bool)

(assert (=> b!141532 (= e!94287 (not e!94292))))

(declare-fun res!118064 () Bool)

(assert (=> b!141532 (=> res!118064 e!94292)))

(declare-datatypes ((tuple2!12542 0))(
  ( (tuple2!12543 (_1!6601 BitStream!5138) (_2!6601 array!6493)) )
))
(declare-fun lt!219601 () tuple2!12542)

(declare-fun lt!219605 () tuple2!12538)

(assert (=> b!141532 (= res!118064 (or (not (= (size!2940 (_2!6601 lt!219601)) (size!2940 arr!237))) (not (= (_1!6601 lt!219601) (_2!6599 lt!219605)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5138 array!6493 (_ BitVec 32) (_ BitVec 32)) tuple2!12542)

(assert (=> b!141532 (= lt!219601 (readByteArrayLoopPure!0 (_1!6599 lt!219605) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!219607 () tuple2!12536)

(declare-fun lt!219600 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141532 (validate_offset_bits!1 ((_ sign_extend 32) (size!2940 (buf!3361 (_2!6598 lt!219607)))) ((_ sign_extend 32) (currentByte!6221 (_2!6598 lt!219599))) ((_ sign_extend 32) (currentBit!6216 (_2!6598 lt!219599))) lt!219600)))

(declare-fun lt!219608 () Unit!8862)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5138 array!6493 (_ BitVec 64)) Unit!8862)

(assert (=> b!141532 (= lt!219608 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6598 lt!219599) (buf!3361 (_2!6598 lt!219607)) lt!219600))))

(assert (=> b!141532 (= lt!219605 (reader!0 (_2!6598 lt!219599) (_2!6598 lt!219607)))))

(declare-fun b!141533 () Bool)

(declare-fun res!118069 () Bool)

(declare-fun e!94293 () Bool)

(assert (=> b!141533 (=> (not res!118069) (not e!94293))))

(assert (=> b!141533 (= res!118069 (bvslt from!447 to!404))))

(declare-fun res!118060 () Bool)

(assert (=> start!27478 (=> (not res!118060) (not e!94293))))

(assert (=> start!27478 (= res!118060 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2940 arr!237))))))

(assert (=> start!27478 e!94293))

(assert (=> start!27478 true))

(assert (=> start!27478 (array_inv!2729 arr!237)))

(declare-fun inv!12 (BitStream!5138) Bool)

(assert (=> start!27478 (and (inv!12 thiss!1634) e!94291)))

(declare-fun b!141534 () Bool)

(assert (=> b!141534 (= e!94293 (not true))))

(assert (=> b!141534 (isPrefixOf!0 thiss!1634 (_2!6598 lt!219607))))

(declare-fun lt!219603 () Unit!8862)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5138 BitStream!5138 BitStream!5138) Unit!8862)

(assert (=> b!141534 (= lt!219603 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6598 lt!219599) (_2!6598 lt!219607)))))

(declare-fun e!94290 () Bool)

(assert (=> b!141534 e!94290))

(declare-fun res!118067 () Bool)

(assert (=> b!141534 (=> (not res!118067) (not e!94290))))

(assert (=> b!141534 (= res!118067 (= (size!2940 (buf!3361 (_2!6598 lt!219599))) (size!2940 (buf!3361 (_2!6598 lt!219607)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5138 array!6493 (_ BitVec 32) (_ BitVec 32)) tuple2!12536)

(assert (=> b!141534 (= lt!219607 (appendByteArrayLoop!0 (_2!6598 lt!219599) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141534 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2940 (buf!3361 (_2!6598 lt!219599)))) ((_ sign_extend 32) (currentByte!6221 (_2!6598 lt!219599))) ((_ sign_extend 32) (currentBit!6216 (_2!6598 lt!219599))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219606 () Unit!8862)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5138 BitStream!5138 (_ BitVec 64) (_ BitVec 32)) Unit!8862)

(assert (=> b!141534 (= lt!219606 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6598 lt!219599) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141534 e!94288))

(declare-fun res!118062 () Bool)

(assert (=> b!141534 (=> (not res!118062) (not e!94288))))

(assert (=> b!141534 (= res!118062 (= (size!2940 (buf!3361 thiss!1634)) (size!2940 (buf!3361 (_2!6598 lt!219599)))))))

(declare-fun appendByte!0 (BitStream!5138 (_ BitVec 8)) tuple2!12536)

(assert (=> b!141534 (= lt!219599 (appendByte!0 thiss!1634 (select (arr!3647 arr!237) from!447)))))

(declare-fun b!141535 () Bool)

(assert (=> b!141535 (= e!94290 e!94287)))

(declare-fun res!118061 () Bool)

(assert (=> b!141535 (=> (not res!118061) (not e!94287))))

(assert (=> b!141535 (= res!118061 (= (bitIndex!0 (size!2940 (buf!3361 (_2!6598 lt!219607))) (currentByte!6221 (_2!6598 lt!219607)) (currentBit!6216 (_2!6598 lt!219607))) (bvadd (bitIndex!0 (size!2940 (buf!3361 (_2!6598 lt!219599))) (currentByte!6221 (_2!6598 lt!219599)) (currentBit!6216 (_2!6598 lt!219599))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219600))))))

(assert (=> b!141535 (= lt!219600 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141536 () Bool)

(declare-fun res!118068 () Bool)

(assert (=> b!141536 (=> (not res!118068) (not e!94293))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141536 (= res!118068 (invariant!0 (currentBit!6216 thiss!1634) (currentByte!6221 thiss!1634) (size!2940 (buf!3361 thiss!1634))))))

(declare-fun b!141537 () Bool)

(declare-fun res!118059 () Bool)

(assert (=> b!141537 (=> (not res!118059) (not e!94293))))

(assert (=> b!141537 (= res!118059 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2940 (buf!3361 thiss!1634))) ((_ sign_extend 32) (currentByte!6221 thiss!1634)) ((_ sign_extend 32) (currentBit!6216 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141538 () Bool)

(declare-fun arrayRangesEq!256 (array!6493 array!6493 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141538 (= e!94292 (not (arrayRangesEq!256 arr!237 (_2!6601 lt!219601) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141539 () Bool)

(declare-fun res!118063 () Bool)

(assert (=> b!141539 (=> (not res!118063) (not e!94287))))

(assert (=> b!141539 (= res!118063 (isPrefixOf!0 (_2!6598 lt!219599) (_2!6598 lt!219607)))))

(assert (= (and start!27478 res!118060) b!141537))

(assert (= (and b!141537 res!118059) b!141533))

(assert (= (and b!141533 res!118069) b!141536))

(assert (= (and b!141536 res!118068) b!141534))

(assert (= (and b!141534 res!118062) b!141530))

(assert (= (and b!141530 res!118065) b!141528))

(assert (= (and b!141528 res!118066) b!141531))

(assert (= (and b!141534 res!118067) b!141535))

(assert (= (and b!141535 res!118061) b!141539))

(assert (= (and b!141539 res!118063) b!141532))

(assert (= (and b!141532 (not res!118064)) b!141538))

(assert (= start!27478 b!141529))

(declare-fun m!217433 () Bool)

(assert (=> b!141531 m!217433))

(declare-fun m!217435 () Bool)

(assert (=> b!141531 m!217435))

(declare-fun m!217437 () Bool)

(assert (=> b!141531 m!217437))

(declare-fun m!217439 () Bool)

(assert (=> b!141528 m!217439))

(declare-fun m!217441 () Bool)

(assert (=> b!141530 m!217441))

(declare-fun m!217443 () Bool)

(assert (=> b!141530 m!217443))

(declare-fun m!217445 () Bool)

(assert (=> start!27478 m!217445))

(declare-fun m!217447 () Bool)

(assert (=> start!27478 m!217447))

(declare-fun m!217449 () Bool)

(assert (=> b!141536 m!217449))

(declare-fun m!217451 () Bool)

(assert (=> b!141532 m!217451))

(declare-fun m!217453 () Bool)

(assert (=> b!141532 m!217453))

(declare-fun m!217455 () Bool)

(assert (=> b!141532 m!217455))

(declare-fun m!217457 () Bool)

(assert (=> b!141532 m!217457))

(declare-fun m!217459 () Bool)

(assert (=> b!141535 m!217459))

(assert (=> b!141535 m!217441))

(declare-fun m!217461 () Bool)

(assert (=> b!141534 m!217461))

(declare-fun m!217463 () Bool)

(assert (=> b!141534 m!217463))

(declare-fun m!217465 () Bool)

(assert (=> b!141534 m!217465))

(declare-fun m!217467 () Bool)

(assert (=> b!141534 m!217467))

(declare-fun m!217469 () Bool)

(assert (=> b!141534 m!217469))

(assert (=> b!141534 m!217433))

(declare-fun m!217471 () Bool)

(assert (=> b!141534 m!217471))

(assert (=> b!141534 m!217433))

(declare-fun m!217473 () Bool)

(assert (=> b!141537 m!217473))

(declare-fun m!217475 () Bool)

(assert (=> b!141529 m!217475))

(declare-fun m!217477 () Bool)

(assert (=> b!141538 m!217477))

(declare-fun m!217479 () Bool)

(assert (=> b!141539 m!217479))

(push 1)

(assert (not b!141535))

(assert (not b!141530))

(assert (not b!141538))

(assert (not start!27478))

(assert (not b!141532))

