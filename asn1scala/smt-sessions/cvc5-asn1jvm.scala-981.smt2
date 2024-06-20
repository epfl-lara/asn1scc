; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27474 () Bool)

(assert start!27474)

(declare-fun b!141456 () Bool)

(declare-fun e!94240 () Bool)

(assert (=> b!141456 (= e!94240 (not true))))

(declare-datatypes ((array!6489 0))(
  ( (array!6490 (arr!3645 (Array (_ BitVec 32) (_ BitVec 8))) (size!2938 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5134 0))(
  ( (BitStream!5135 (buf!3359 array!6489) (currentByte!6219 (_ BitVec 32)) (currentBit!6214 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5134)

(declare-datatypes ((Unit!8858 0))(
  ( (Unit!8859) )
))
(declare-datatypes ((tuple2!12520 0))(
  ( (tuple2!12521 (_1!6590 Unit!8858) (_2!6590 BitStream!5134)) )
))
(declare-fun lt!219543 () tuple2!12520)

(declare-fun isPrefixOf!0 (BitStream!5134 BitStream!5134) Bool)

(assert (=> b!141456 (isPrefixOf!0 thiss!1634 (_2!6590 lt!219543))))

(declare-fun lt!219541 () Unit!8858)

(declare-fun lt!219540 () tuple2!12520)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5134 BitStream!5134 BitStream!5134) Unit!8858)

(assert (=> b!141456 (= lt!219541 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6590 lt!219540) (_2!6590 lt!219543)))))

(declare-fun e!94239 () Bool)

(assert (=> b!141456 e!94239))

(declare-fun res!117999 () Bool)

(assert (=> b!141456 (=> (not res!117999) (not e!94239))))

(assert (=> b!141456 (= res!117999 (= (size!2938 (buf!3359 (_2!6590 lt!219540))) (size!2938 (buf!3359 (_2!6590 lt!219543)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6489)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!5134 array!6489 (_ BitVec 32) (_ BitVec 32)) tuple2!12520)

(assert (=> b!141456 (= lt!219543 (appendByteArrayLoop!0 (_2!6590 lt!219540) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141456 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2938 (buf!3359 (_2!6590 lt!219540)))) ((_ sign_extend 32) (currentByte!6219 (_2!6590 lt!219540))) ((_ sign_extend 32) (currentBit!6214 (_2!6590 lt!219540))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219547 () Unit!8858)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5134 BitStream!5134 (_ BitVec 64) (_ BitVec 32)) Unit!8858)

(assert (=> b!141456 (= lt!219547 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6590 lt!219540) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94243 () Bool)

(assert (=> b!141456 e!94243))

(declare-fun res!118002 () Bool)

(assert (=> b!141456 (=> (not res!118002) (not e!94243))))

(assert (=> b!141456 (= res!118002 (= (size!2938 (buf!3359 thiss!1634)) (size!2938 (buf!3359 (_2!6590 lt!219540)))))))

(declare-fun appendByte!0 (BitStream!5134 (_ BitVec 8)) tuple2!12520)

(assert (=> b!141456 (= lt!219540 (appendByte!0 thiss!1634 (select (arr!3645 arr!237) from!447)))))

(declare-fun b!141457 () Bool)

(declare-fun res!118001 () Bool)

(declare-fun e!94245 () Bool)

(assert (=> b!141457 (=> (not res!118001) (not e!94245))))

(assert (=> b!141457 (= res!118001 (isPrefixOf!0 (_2!6590 lt!219540) (_2!6590 lt!219543)))))

(declare-fun b!141458 () Bool)

(declare-fun res!117998 () Bool)

(assert (=> b!141458 (=> (not res!117998) (not e!94243))))

(assert (=> b!141458 (= res!117998 (isPrefixOf!0 thiss!1634 (_2!6590 lt!219540)))))

(declare-fun e!94241 () Bool)

(declare-fun b!141459 () Bool)

(declare-datatypes ((tuple2!12522 0))(
  ( (tuple2!12523 (_1!6591 BitStream!5134) (_2!6591 array!6489)) )
))
(declare-fun lt!219539 () tuple2!12522)

(declare-fun arrayRangesEq!254 (array!6489 array!6489 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141459 (= e!94241 (not (arrayRangesEq!254 arr!237 (_2!6591 lt!219539) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141460 () Bool)

(assert (=> b!141460 (= e!94245 (not e!94241))))

(declare-fun res!117993 () Bool)

(assert (=> b!141460 (=> res!117993 e!94241)))

(declare-datatypes ((tuple2!12524 0))(
  ( (tuple2!12525 (_1!6592 BitStream!5134) (_2!6592 BitStream!5134)) )
))
(declare-fun lt!219546 () tuple2!12524)

(assert (=> b!141460 (= res!117993 (or (not (= (size!2938 (_2!6591 lt!219539)) (size!2938 arr!237))) (not (= (_1!6591 lt!219539) (_2!6592 lt!219546)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5134 array!6489 (_ BitVec 32) (_ BitVec 32)) tuple2!12522)

(assert (=> b!141460 (= lt!219539 (readByteArrayLoopPure!0 (_1!6592 lt!219546) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!219542 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141460 (validate_offset_bits!1 ((_ sign_extend 32) (size!2938 (buf!3359 (_2!6590 lt!219543)))) ((_ sign_extend 32) (currentByte!6219 (_2!6590 lt!219540))) ((_ sign_extend 32) (currentBit!6214 (_2!6590 lt!219540))) lt!219542)))

(declare-fun lt!219548 () Unit!8858)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5134 array!6489 (_ BitVec 64)) Unit!8858)

(assert (=> b!141460 (= lt!219548 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6590 lt!219540) (buf!3359 (_2!6590 lt!219543)) lt!219542))))

(declare-fun reader!0 (BitStream!5134 BitStream!5134) tuple2!12524)

(assert (=> b!141460 (= lt!219546 (reader!0 (_2!6590 lt!219540) (_2!6590 lt!219543)))))

(declare-fun lt!219545 () tuple2!12524)

(declare-datatypes ((tuple2!12526 0))(
  ( (tuple2!12527 (_1!6593 BitStream!5134) (_2!6593 (_ BitVec 8))) )
))
(declare-fun lt!219544 () tuple2!12526)

(declare-fun b!141462 () Bool)

(assert (=> b!141462 (= e!94243 (and (= (_2!6593 lt!219544) (select (arr!3645 arr!237) from!447)) (= (_1!6593 lt!219544) (_2!6592 lt!219545))))))

(declare-fun readBytePure!0 (BitStream!5134) tuple2!12526)

(assert (=> b!141462 (= lt!219544 (readBytePure!0 (_1!6592 lt!219545)))))

(assert (=> b!141462 (= lt!219545 (reader!0 thiss!1634 (_2!6590 lt!219540)))))

(declare-fun b!141463 () Bool)

(declare-fun res!117997 () Bool)

(assert (=> b!141463 (=> (not res!117997) (not e!94243))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141463 (= res!117997 (= (bitIndex!0 (size!2938 (buf!3359 (_2!6590 lt!219540))) (currentByte!6219 (_2!6590 lt!219540)) (currentBit!6214 (_2!6590 lt!219540))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2938 (buf!3359 thiss!1634)) (currentByte!6219 thiss!1634) (currentBit!6214 thiss!1634)))))))

(declare-fun b!141464 () Bool)

(assert (=> b!141464 (= e!94239 e!94245)))

(declare-fun res!118003 () Bool)

(assert (=> b!141464 (=> (not res!118003) (not e!94245))))

(assert (=> b!141464 (= res!118003 (= (bitIndex!0 (size!2938 (buf!3359 (_2!6590 lt!219543))) (currentByte!6219 (_2!6590 lt!219543)) (currentBit!6214 (_2!6590 lt!219543))) (bvadd (bitIndex!0 (size!2938 (buf!3359 (_2!6590 lt!219540))) (currentByte!6219 (_2!6590 lt!219540)) (currentBit!6214 (_2!6590 lt!219540))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219542))))))

(assert (=> b!141464 (= lt!219542 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141465 () Bool)

(declare-fun res!117996 () Bool)

(assert (=> b!141465 (=> (not res!117996) (not e!94240))))

(assert (=> b!141465 (= res!117996 (bvslt from!447 to!404))))

(declare-fun res!117995 () Bool)

(assert (=> start!27474 (=> (not res!117995) (not e!94240))))

(assert (=> start!27474 (= res!117995 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2938 arr!237))))))

(assert (=> start!27474 e!94240))

(assert (=> start!27474 true))

(declare-fun array_inv!2727 (array!6489) Bool)

(assert (=> start!27474 (array_inv!2727 arr!237)))

(declare-fun e!94242 () Bool)

(declare-fun inv!12 (BitStream!5134) Bool)

(assert (=> start!27474 (and (inv!12 thiss!1634) e!94242)))

(declare-fun b!141461 () Bool)

(assert (=> b!141461 (= e!94242 (array_inv!2727 (buf!3359 thiss!1634)))))

(declare-fun b!141466 () Bool)

(declare-fun res!118000 () Bool)

(assert (=> b!141466 (=> (not res!118000) (not e!94240))))

(assert (=> b!141466 (= res!118000 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2938 (buf!3359 thiss!1634))) ((_ sign_extend 32) (currentByte!6219 thiss!1634)) ((_ sign_extend 32) (currentBit!6214 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141467 () Bool)

(declare-fun res!117994 () Bool)

(assert (=> b!141467 (=> (not res!117994) (not e!94240))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141467 (= res!117994 (invariant!0 (currentBit!6214 thiss!1634) (currentByte!6219 thiss!1634) (size!2938 (buf!3359 thiss!1634))))))

(assert (= (and start!27474 res!117995) b!141466))

(assert (= (and b!141466 res!118000) b!141465))

(assert (= (and b!141465 res!117996) b!141467))

(assert (= (and b!141467 res!117994) b!141456))

(assert (= (and b!141456 res!118002) b!141463))

(assert (= (and b!141463 res!117997) b!141458))

(assert (= (and b!141458 res!117998) b!141462))

(assert (= (and b!141456 res!117999) b!141464))

(assert (= (and b!141464 res!118003) b!141457))

(assert (= (and b!141457 res!118001) b!141460))

(assert (= (and b!141460 (not res!117993)) b!141459))

(assert (= start!27474 b!141461))

(declare-fun m!217337 () Bool)

(assert (=> b!141460 m!217337))

(declare-fun m!217339 () Bool)

(assert (=> b!141460 m!217339))

(declare-fun m!217341 () Bool)

(assert (=> b!141460 m!217341))

(declare-fun m!217343 () Bool)

(assert (=> b!141460 m!217343))

(declare-fun m!217345 () Bool)

(assert (=> start!27474 m!217345))

(declare-fun m!217347 () Bool)

(assert (=> start!27474 m!217347))

(declare-fun m!217349 () Bool)

(assert (=> b!141462 m!217349))

(declare-fun m!217351 () Bool)

(assert (=> b!141462 m!217351))

(declare-fun m!217353 () Bool)

(assert (=> b!141462 m!217353))

(declare-fun m!217355 () Bool)

(assert (=> b!141459 m!217355))

(declare-fun m!217357 () Bool)

(assert (=> b!141467 m!217357))

(declare-fun m!217359 () Bool)

(assert (=> b!141458 m!217359))

(declare-fun m!217361 () Bool)

(assert (=> b!141464 m!217361))

(declare-fun m!217363 () Bool)

(assert (=> b!141464 m!217363))

(declare-fun m!217365 () Bool)

(assert (=> b!141457 m!217365))

(declare-fun m!217367 () Bool)

(assert (=> b!141466 m!217367))

(assert (=> b!141463 m!217363))

(declare-fun m!217369 () Bool)

(assert (=> b!141463 m!217369))

(declare-fun m!217371 () Bool)

(assert (=> b!141456 m!217371))

(declare-fun m!217373 () Bool)

(assert (=> b!141456 m!217373))

(assert (=> b!141456 m!217349))

(declare-fun m!217375 () Bool)

(assert (=> b!141456 m!217375))

(declare-fun m!217377 () Bool)

(assert (=> b!141456 m!217377))

(assert (=> b!141456 m!217349))

(declare-fun m!217379 () Bool)

(assert (=> b!141456 m!217379))

(declare-fun m!217381 () Bool)

(assert (=> b!141456 m!217381))

(declare-fun m!217383 () Bool)

(assert (=> b!141461 m!217383))

(push 1)

(assert (not b!141459))

(assert (not b!141461))

(assert (not start!27474))

(assert (not b!141458))

(assert (not b!141462))

(assert (not b!141456))

(assert (not b!141466))

(assert (not b!141464))

(assert (not b!141463))

(assert (not b!141460))

(assert (not b!141457))

(assert (not b!141467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

