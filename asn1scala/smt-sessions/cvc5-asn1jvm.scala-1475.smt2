; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40742 () Bool)

(assert start!40742)

(declare-fun res!156094 () Bool)

(declare-fun e!129595 () Bool)

(assert (=> start!40742 (=> (not res!156094) (not e!129595))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!40742 (= res!156094 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40742 e!129595))

(assert (=> start!40742 true))

(declare-datatypes ((array!9842 0))(
  ( (array!9843 (arr!5269 (Array (_ BitVec 32) (_ BitVec 8))) (size!4339 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7786 0))(
  ( (BitStream!7787 (buf!4807 array!9842) (currentByte!9067 (_ BitVec 32)) (currentBit!9062 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7786)

(declare-fun e!129592 () Bool)

(declare-fun inv!12 (BitStream!7786) Bool)

(assert (=> start!40742 (and (inv!12 thiss!1204) e!129592)))

(declare-fun b!187424 () Bool)

(declare-fun e!129587 () Bool)

(declare-fun e!129586 () Bool)

(assert (=> b!187424 (= e!129587 e!129586)))

(declare-fun res!156103 () Bool)

(assert (=> b!187424 (=> res!156103 e!129586)))

(declare-datatypes ((tuple2!16196 0))(
  ( (tuple2!16197 (_1!8743 BitStream!7786) (_2!8743 BitStream!7786)) )
))
(declare-fun lt!290342 () tuple2!16196)

(declare-fun lt!290353 () BitStream!7786)

(assert (=> b!187424 (= res!156103 (not (= (_1!8743 lt!290342) lt!290353)))))

(declare-fun e!129590 () Bool)

(assert (=> b!187424 e!129590))

(declare-fun res!156100 () Bool)

(assert (=> b!187424 (=> (not res!156100) (not e!129590))))

(declare-datatypes ((tuple2!16198 0))(
  ( (tuple2!16199 (_1!8744 BitStream!7786) (_2!8744 (_ BitVec 64))) )
))
(declare-fun lt!290343 () tuple2!16198)

(declare-fun lt!290332 () tuple2!16198)

(assert (=> b!187424 (= res!156100 (and (= (_2!8744 lt!290343) (_2!8744 lt!290332)) (= (_1!8744 lt!290343) (_1!8744 lt!290332))))))

(declare-fun lt!290356 () (_ BitVec 64))

(declare-datatypes ((Unit!13399 0))(
  ( (Unit!13400) )
))
(declare-fun lt!290334 () Unit!13399)

(declare-fun lt!290331 () tuple2!16196)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13399)

(assert (=> b!187424 (= lt!290334 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8743 lt!290331) nBits!348 i!590 lt!290356))))

(declare-fun lt!290352 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16198)

(assert (=> b!187424 (= lt!290332 (readNBitsLSBFirstsLoopPure!0 lt!290353 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290352))))

(declare-fun withMovedBitIndex!0 (BitStream!7786 (_ BitVec 64)) BitStream!7786)

(assert (=> b!187424 (= lt!290353 (withMovedBitIndex!0 (_1!8743 lt!290331) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!187425 () Bool)

(declare-fun e!129593 () Bool)

(declare-datatypes ((tuple2!16200 0))(
  ( (tuple2!16201 (_1!8745 BitStream!7786) (_2!8745 Bool)) )
))
(declare-fun lt!290345 () tuple2!16200)

(declare-fun lt!290354 () tuple2!16200)

(assert (=> b!187425 (= e!129593 (= (_2!8745 lt!290345) (_2!8745 lt!290354)))))

(declare-fun b!187426 () Bool)

(declare-fun e!129597 () Bool)

(assert (=> b!187426 (= e!129595 e!129597)))

(declare-fun res!156095 () Bool)

(assert (=> b!187426 (=> (not res!156095) (not e!129597))))

(declare-fun lt!290340 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187426 (= res!156095 (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 thiss!1204))) ((_ sign_extend 32) (currentByte!9067 thiss!1204)) ((_ sign_extend 32) (currentBit!9062 thiss!1204)) lt!290340))))

(assert (=> b!187426 (= lt!290340 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!187427 () Bool)

(declare-fun e!129596 () Bool)

(declare-datatypes ((tuple2!16202 0))(
  ( (tuple2!16203 (_1!8746 Unit!13399) (_2!8746 BitStream!7786)) )
))
(declare-fun lt!290349 () tuple2!16202)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187427 (= e!129596 (invariant!0 (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204) (size!4339 (buf!4807 (_2!8746 lt!290349)))))))

(declare-fun b!187428 () Bool)

(declare-fun e!129598 () Bool)

(declare-fun e!129591 () Bool)

(assert (=> b!187428 (= e!129598 e!129591)))

(declare-fun res!156093 () Bool)

(assert (=> b!187428 (=> (not res!156093) (not e!129591))))

(declare-fun lt!290355 () tuple2!16200)

(declare-fun lt!290348 () Bool)

(declare-fun lt!290335 () tuple2!16202)

(assert (=> b!187428 (= res!156093 (and (= (_2!8745 lt!290355) lt!290348) (= (_1!8745 lt!290355) (_2!8746 lt!290335))))))

(declare-fun readBitPure!0 (BitStream!7786) tuple2!16200)

(declare-fun readerFrom!0 (BitStream!7786 (_ BitVec 32) (_ BitVec 32)) BitStream!7786)

(assert (=> b!187428 (= lt!290355 (readBitPure!0 (readerFrom!0 (_2!8746 lt!290335) (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204))))))

(declare-fun b!187429 () Bool)

(declare-fun res!156105 () Bool)

(assert (=> b!187429 (=> (not res!156105) (not e!129597))))

(assert (=> b!187429 (= res!156105 (not (= i!590 nBits!348)))))

(declare-fun b!187430 () Bool)

(declare-fun e!129599 () Bool)

(assert (=> b!187430 (= e!129597 (not e!129599))))

(declare-fun res!156089 () Bool)

(assert (=> b!187430 (=> res!156089 e!129599)))

(declare-fun lt!290357 () (_ BitVec 64))

(declare-fun lt!290359 () (_ BitVec 64))

(assert (=> b!187430 (= res!156089 (not (= lt!290357 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!290359))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187430 (= lt!290357 (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))))))

(assert (=> b!187430 (= lt!290359 (bitIndex!0 (size!4339 (buf!4807 thiss!1204)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)))))

(declare-fun e!129589 () Bool)

(assert (=> b!187430 e!129589))

(declare-fun res!156099 () Bool)

(assert (=> b!187430 (=> (not res!156099) (not e!129589))))

(assert (=> b!187430 (= res!156099 (= (size!4339 (buf!4807 thiss!1204)) (size!4339 (buf!4807 (_2!8746 lt!290335)))))))

(declare-fun appendBit!0 (BitStream!7786 Bool) tuple2!16202)

(assert (=> b!187430 (= lt!290335 (appendBit!0 thiss!1204 lt!290348))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!290341 () (_ BitVec 64))

(assert (=> b!187430 (= lt!290348 (not (= (bvand v!189 lt!290341) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187430 (= lt!290341 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun lt!290339 () tuple2!16198)

(declare-fun b!187431 () Bool)

(assert (=> b!187431 (= e!129590 (and (= lt!290359 (bvsub lt!290357 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8743 lt!290342) lt!290353)) (= (_2!8744 lt!290343) (_2!8744 lt!290339)))))))

(declare-fun b!187432 () Bool)

(declare-fun res!156098 () Bool)

(declare-fun e!129594 () Bool)

(assert (=> b!187432 (=> res!156098 e!129594)))

(declare-fun isPrefixOf!0 (BitStream!7786 BitStream!7786) Bool)

(assert (=> b!187432 (= res!156098 (not (isPrefixOf!0 (_2!8746 lt!290335) (_2!8746 lt!290349))))))

(declare-fun b!187433 () Bool)

(declare-fun res!156092 () Bool)

(assert (=> b!187433 (=> (not res!156092) (not e!129598))))

(assert (=> b!187433 (= res!156092 (isPrefixOf!0 thiss!1204 (_2!8746 lt!290335)))))

(declare-fun b!187434 () Bool)

(declare-fun res!156097 () Bool)

(assert (=> b!187434 (=> (not res!156097) (not e!129590))))

(declare-fun lt!290346 () (_ BitVec 64))

(assert (=> b!187434 (= res!156097 (= (_1!8743 lt!290331) (withMovedBitIndex!0 (_2!8743 lt!290331) (bvsub lt!290359 lt!290346))))))

(declare-fun b!187435 () Bool)

(declare-fun array_inv!4080 (array!9842) Bool)

(assert (=> b!187435 (= e!129592 (array_inv!4080 (buf!4807 thiss!1204)))))

(declare-fun b!187436 () Bool)

(declare-fun res!156106 () Bool)

(assert (=> b!187436 (=> res!156106 e!129594)))

(assert (=> b!187436 (= res!156106 (or (not (= (size!4339 (buf!4807 (_2!8746 lt!290349))) (size!4339 (buf!4807 thiss!1204)))) (not (= lt!290346 (bvsub (bvadd lt!290359 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!187437 () Bool)

(assert (=> b!187437 (= e!129589 e!129598)))

(declare-fun res!156108 () Bool)

(assert (=> b!187437 (=> (not res!156108) (not e!129598))))

(declare-fun lt!290347 () (_ BitVec 64))

(declare-fun lt!290344 () (_ BitVec 64))

(assert (=> b!187437 (= res!156108 (= lt!290347 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!290344)))))

(assert (=> b!187437 (= lt!290347 (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))))))

(assert (=> b!187437 (= lt!290344 (bitIndex!0 (size!4339 (buf!4807 thiss!1204)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)))))

(declare-fun b!187438 () Bool)

(assert (=> b!187438 (= e!129594 e!129587)))

(declare-fun res!156096 () Bool)

(assert (=> b!187438 (=> res!156096 e!129587)))

(assert (=> b!187438 (= res!156096 (not (= (_1!8744 lt!290339) (_2!8743 lt!290342))))))

(assert (=> b!187438 (= lt!290339 (readNBitsLSBFirstsLoopPure!0 (_1!8743 lt!290342) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290352))))

(declare-fun lt!290337 () (_ BitVec 64))

(assert (=> b!187438 (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290335))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290335))) lt!290337)))

(declare-fun lt!290350 () Unit!13399)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7786 array!9842 (_ BitVec 64)) Unit!13399)

(assert (=> b!187438 (= lt!290350 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8746 lt!290335) (buf!4807 (_2!8746 lt!290349)) lt!290337))))

(assert (=> b!187438 (= lt!290337 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!290333 () tuple2!16200)

(assert (=> b!187438 (= lt!290352 (bvor lt!290356 (ite (_2!8745 lt!290333) lt!290341 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187438 (= lt!290343 (readNBitsLSBFirstsLoopPure!0 (_1!8743 lt!290331) nBits!348 i!590 lt!290356))))

(assert (=> b!187438 (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))) ((_ sign_extend 32) (currentByte!9067 thiss!1204)) ((_ sign_extend 32) (currentBit!9062 thiss!1204)) lt!290340)))

(declare-fun lt!290336 () Unit!13399)

(assert (=> b!187438 (= lt!290336 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4807 (_2!8746 lt!290349)) lt!290340))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187438 (= lt!290356 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!187438 (= (_2!8745 lt!290333) lt!290348)))

(assert (=> b!187438 (= lt!290333 (readBitPure!0 (_1!8743 lt!290331)))))

(declare-fun reader!0 (BitStream!7786 BitStream!7786) tuple2!16196)

(assert (=> b!187438 (= lt!290342 (reader!0 (_2!8746 lt!290335) (_2!8746 lt!290349)))))

(assert (=> b!187438 (= lt!290331 (reader!0 thiss!1204 (_2!8746 lt!290349)))))

(assert (=> b!187438 e!129593))

(declare-fun res!156101 () Bool)

(assert (=> b!187438 (=> (not res!156101) (not e!129593))))

(assert (=> b!187438 (= res!156101 (= (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!290345))) (currentByte!9067 (_1!8745 lt!290345)) (currentBit!9062 (_1!8745 lt!290345))) (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!290354))) (currentByte!9067 (_1!8745 lt!290354)) (currentBit!9062 (_1!8745 lt!290354)))))))

(declare-fun lt!290351 () Unit!13399)

(declare-fun lt!290358 () BitStream!7786)

(declare-fun readBitPrefixLemma!0 (BitStream!7786 BitStream!7786) Unit!13399)

(assert (=> b!187438 (= lt!290351 (readBitPrefixLemma!0 lt!290358 (_2!8746 lt!290349)))))

(assert (=> b!187438 (= lt!290354 (readBitPure!0 (BitStream!7787 (buf!4807 (_2!8746 lt!290349)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204))))))

(assert (=> b!187438 (= lt!290345 (readBitPure!0 lt!290358))))

(assert (=> b!187438 e!129596))

(declare-fun res!156090 () Bool)

(assert (=> b!187438 (=> (not res!156090) (not e!129596))))

(assert (=> b!187438 (= res!156090 (invariant!0 (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204) (size!4339 (buf!4807 (_2!8746 lt!290335)))))))

(assert (=> b!187438 (= lt!290358 (BitStream!7787 (buf!4807 (_2!8746 lt!290335)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)))))

(declare-fun b!187439 () Bool)

(declare-fun res!156102 () Bool)

(assert (=> b!187439 (=> res!156102 e!129594)))

(assert (=> b!187439 (= res!156102 (not (invariant!0 (currentBit!9062 (_2!8746 lt!290349)) (currentByte!9067 (_2!8746 lt!290349)) (size!4339 (buf!4807 (_2!8746 lt!290349))))))))

(declare-fun b!187440 () Bool)

(declare-fun res!156091 () Bool)

(assert (=> b!187440 (=> (not res!156091) (not e!129590))))

(assert (=> b!187440 (= res!156091 (= (_1!8743 lt!290342) (withMovedBitIndex!0 (_2!8743 lt!290342) (bvsub lt!290357 lt!290346))))))

(declare-fun b!187441 () Bool)

(assert (=> b!187441 (= e!129599 e!129594)))

(declare-fun res!156104 () Bool)

(assert (=> b!187441 (=> res!156104 e!129594)))

(assert (=> b!187441 (= res!156104 (not (= lt!290346 (bvsub (bvsub (bvadd lt!290357 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!187441 (= lt!290346 (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290349))) (currentByte!9067 (_2!8746 lt!290349)) (currentBit!9062 (_2!8746 lt!290349))))))

(assert (=> b!187441 (isPrefixOf!0 thiss!1204 (_2!8746 lt!290349))))

(declare-fun lt!290338 () Unit!13399)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7786 BitStream!7786 BitStream!7786) Unit!13399)

(assert (=> b!187441 (= lt!290338 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8746 lt!290335) (_2!8746 lt!290349)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7786 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16202)

(assert (=> b!187441 (= lt!290349 (appendBitsLSBFirstLoopTR!0 (_2!8746 lt!290335) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!187442 () Bool)

(declare-fun res!156088 () Bool)

(assert (=> b!187442 (=> res!156088 e!129594)))

(assert (=> b!187442 (= res!156088 (not (isPrefixOf!0 thiss!1204 (_2!8746 lt!290335))))))

(declare-fun b!187443 () Bool)

(assert (=> b!187443 (= e!129586 (invariant!0 (currentBit!9062 (_1!8744 lt!290343)) (currentByte!9067 (_1!8744 lt!290343)) (size!4339 (buf!4807 (_1!8744 lt!290343)))))))

(declare-fun b!187444 () Bool)

(assert (=> b!187444 (= e!129591 (= (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!290355))) (currentByte!9067 (_1!8745 lt!290355)) (currentBit!9062 (_1!8745 lt!290355))) lt!290347))))

(declare-fun b!187445 () Bool)

(declare-fun res!156107 () Bool)

(assert (=> b!187445 (=> (not res!156107) (not e!129597))))

(assert (=> b!187445 (= res!156107 (invariant!0 (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204) (size!4339 (buf!4807 thiss!1204))))))

(assert (= (and start!40742 res!156094) b!187426))

(assert (= (and b!187426 res!156095) b!187445))

(assert (= (and b!187445 res!156107) b!187429))

(assert (= (and b!187429 res!156105) b!187430))

(assert (= (and b!187430 res!156099) b!187437))

(assert (= (and b!187437 res!156108) b!187433))

(assert (= (and b!187433 res!156092) b!187428))

(assert (= (and b!187428 res!156093) b!187444))

(assert (= (and b!187430 (not res!156089)) b!187441))

(assert (= (and b!187441 (not res!156104)) b!187439))

(assert (= (and b!187439 (not res!156102)) b!187436))

(assert (= (and b!187436 (not res!156106)) b!187432))

(assert (= (and b!187432 (not res!156098)) b!187442))

(assert (= (and b!187442 (not res!156088)) b!187438))

(assert (= (and b!187438 res!156090) b!187427))

(assert (= (and b!187438 res!156101) b!187425))

(assert (= (and b!187438 (not res!156096)) b!187424))

(assert (= (and b!187424 res!156100) b!187434))

(assert (= (and b!187434 res!156097) b!187440))

(assert (= (and b!187440 res!156091) b!187431))

(assert (= (and b!187424 (not res!156103)) b!187443))

(assert (= start!40742 b!187435))

(declare-fun m!291425 () Bool)

(assert (=> b!187426 m!291425))

(declare-fun m!291427 () Bool)

(assert (=> b!187443 m!291427))

(declare-fun m!291429 () Bool)

(assert (=> b!187437 m!291429))

(declare-fun m!291431 () Bool)

(assert (=> b!187437 m!291431))

(declare-fun m!291433 () Bool)

(assert (=> b!187439 m!291433))

(declare-fun m!291435 () Bool)

(assert (=> b!187444 m!291435))

(declare-fun m!291437 () Bool)

(assert (=> b!187427 m!291437))

(declare-fun m!291439 () Bool)

(assert (=> b!187435 m!291439))

(assert (=> b!187430 m!291429))

(assert (=> b!187430 m!291431))

(declare-fun m!291441 () Bool)

(assert (=> b!187430 m!291441))

(declare-fun m!291443 () Bool)

(assert (=> b!187432 m!291443))

(declare-fun m!291445 () Bool)

(assert (=> b!187424 m!291445))

(declare-fun m!291447 () Bool)

(assert (=> b!187424 m!291447))

(declare-fun m!291449 () Bool)

(assert (=> b!187424 m!291449))

(declare-fun m!291451 () Bool)

(assert (=> b!187441 m!291451))

(declare-fun m!291453 () Bool)

(assert (=> b!187441 m!291453))

(declare-fun m!291455 () Bool)

(assert (=> b!187441 m!291455))

(declare-fun m!291457 () Bool)

(assert (=> b!187441 m!291457))

(declare-fun m!291459 () Bool)

(assert (=> b!187442 m!291459))

(assert (=> b!187433 m!291459))

(declare-fun m!291461 () Bool)

(assert (=> b!187434 m!291461))

(declare-fun m!291463 () Bool)

(assert (=> b!187438 m!291463))

(declare-fun m!291465 () Bool)

(assert (=> b!187438 m!291465))

(declare-fun m!291467 () Bool)

(assert (=> b!187438 m!291467))

(declare-fun m!291469 () Bool)

(assert (=> b!187438 m!291469))

(declare-fun m!291471 () Bool)

(assert (=> b!187438 m!291471))

(declare-fun m!291473 () Bool)

(assert (=> b!187438 m!291473))

(declare-fun m!291475 () Bool)

(assert (=> b!187438 m!291475))

(declare-fun m!291477 () Bool)

(assert (=> b!187438 m!291477))

(declare-fun m!291479 () Bool)

(assert (=> b!187438 m!291479))

(declare-fun m!291481 () Bool)

(assert (=> b!187438 m!291481))

(declare-fun m!291483 () Bool)

(assert (=> b!187438 m!291483))

(declare-fun m!291485 () Bool)

(assert (=> b!187438 m!291485))

(declare-fun m!291487 () Bool)

(assert (=> b!187438 m!291487))

(declare-fun m!291489 () Bool)

(assert (=> b!187438 m!291489))

(declare-fun m!291491 () Bool)

(assert (=> b!187438 m!291491))

(declare-fun m!291493 () Bool)

(assert (=> b!187438 m!291493))

(declare-fun m!291495 () Bool)

(assert (=> b!187440 m!291495))

(declare-fun m!291497 () Bool)

(assert (=> b!187445 m!291497))

(declare-fun m!291499 () Bool)

(assert (=> b!187428 m!291499))

(assert (=> b!187428 m!291499))

(declare-fun m!291501 () Bool)

(assert (=> b!187428 m!291501))

(declare-fun m!291503 () Bool)

(assert (=> start!40742 m!291503))

(push 1)

(assert (not b!187437))

(assert (not b!187444))

(assert (not b!187441))

(assert (not b!187430))

(assert (not b!187435))

(assert (not b!187432))

(assert (not start!40742))

(assert (not b!187445))

(assert (not b!187438))

(assert (not b!187434))

(assert (not b!187443))

(assert (not b!187439))

(assert (not b!187424))

(assert (not b!187428))

(assert (not b!187426))

(assert (not b!187427))

(assert (not b!187433))

(assert (not b!187440))

(assert (not b!187442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64733 () Bool)

(declare-fun res!156307 () Bool)

(declare-fun e!129729 () Bool)

(assert (=> d!64733 (=> (not res!156307) (not e!129729))))

(assert (=> d!64733 (= res!156307 (= (size!4339 (buf!4807 (_2!8746 lt!290335))) (size!4339 (buf!4807 (_2!8746 lt!290349)))))))

(assert (=> d!64733 (= (isPrefixOf!0 (_2!8746 lt!290335) (_2!8746 lt!290349)) e!129729)))

(declare-fun b!187656 () Bool)

(declare-fun res!156305 () Bool)

(assert (=> b!187656 (=> (not res!156305) (not e!129729))))

(assert (=> b!187656 (= res!156305 (bvsle (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))) (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290349))) (currentByte!9067 (_2!8746 lt!290349)) (currentBit!9062 (_2!8746 lt!290349)))))))

(declare-fun b!187657 () Bool)

(declare-fun e!129730 () Bool)

(assert (=> b!187657 (= e!129729 e!129730)))

(declare-fun res!156306 () Bool)

(assert (=> b!187657 (=> res!156306 e!129730)))

(assert (=> b!187657 (= res!156306 (= (size!4339 (buf!4807 (_2!8746 lt!290335))) #b00000000000000000000000000000000))))

(declare-fun b!187658 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9842 array!9842 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187658 (= e!129730 (arrayBitRangesEq!0 (buf!4807 (_2!8746 lt!290335)) (buf!4807 (_2!8746 lt!290349)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335)))))))

(assert (= (and d!64733 res!156307) b!187656))

(assert (= (and b!187656 res!156305) b!187657))

(assert (= (and b!187657 (not res!156306)) b!187658))

(assert (=> b!187656 m!291429))

(assert (=> b!187656 m!291451))

(assert (=> b!187658 m!291429))

(assert (=> b!187658 m!291429))

(declare-fun m!291821 () Bool)

(assert (=> b!187658 m!291821))

(assert (=> b!187432 d!64733))

(declare-fun d!64735 () Bool)

(assert (=> d!64735 (= (invariant!0 (currentBit!9062 (_1!8744 lt!290343)) (currentByte!9067 (_1!8744 lt!290343)) (size!4339 (buf!4807 (_1!8744 lt!290343)))) (and (bvsge (currentBit!9062 (_1!8744 lt!290343)) #b00000000000000000000000000000000) (bvslt (currentBit!9062 (_1!8744 lt!290343)) #b00000000000000000000000000001000) (bvsge (currentByte!9067 (_1!8744 lt!290343)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9067 (_1!8744 lt!290343)) (size!4339 (buf!4807 (_1!8744 lt!290343)))) (and (= (currentBit!9062 (_1!8744 lt!290343)) #b00000000000000000000000000000000) (= (currentByte!9067 (_1!8744 lt!290343)) (size!4339 (buf!4807 (_1!8744 lt!290343))))))))))

(assert (=> b!187443 d!64735))

(declare-fun d!64737 () Bool)

(assert (=> d!64737 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204) (size!4339 (buf!4807 thiss!1204))))))

(declare-fun bs!16096 () Bool)

(assert (= bs!16096 d!64737))

(assert (=> bs!16096 m!291497))

(assert (=> start!40742 d!64737))

(declare-fun d!64739 () Bool)

(declare-fun res!156310 () Bool)

(declare-fun e!129731 () Bool)

(assert (=> d!64739 (=> (not res!156310) (not e!129731))))

(assert (=> d!64739 (= res!156310 (= (size!4339 (buf!4807 thiss!1204)) (size!4339 (buf!4807 (_2!8746 lt!290335)))))))

(assert (=> d!64739 (= (isPrefixOf!0 thiss!1204 (_2!8746 lt!290335)) e!129731)))

(declare-fun b!187659 () Bool)

(declare-fun res!156308 () Bool)

(assert (=> b!187659 (=> (not res!156308) (not e!129731))))

(assert (=> b!187659 (= res!156308 (bvsle (bitIndex!0 (size!4339 (buf!4807 thiss!1204)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)) (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335)))))))

(declare-fun b!187660 () Bool)

(declare-fun e!129732 () Bool)

(assert (=> b!187660 (= e!129731 e!129732)))

(declare-fun res!156309 () Bool)

(assert (=> b!187660 (=> res!156309 e!129732)))

(assert (=> b!187660 (= res!156309 (= (size!4339 (buf!4807 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!187661 () Bool)

(assert (=> b!187661 (= e!129732 (arrayBitRangesEq!0 (buf!4807 thiss!1204) (buf!4807 (_2!8746 lt!290335)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4339 (buf!4807 thiss!1204)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204))))))

(assert (= (and d!64739 res!156310) b!187659))

(assert (= (and b!187659 res!156308) b!187660))

(assert (= (and b!187660 (not res!156309)) b!187661))

(assert (=> b!187659 m!291431))

(assert (=> b!187659 m!291429))

(assert (=> b!187661 m!291431))

(assert (=> b!187661 m!291431))

(declare-fun m!291823 () Bool)

(assert (=> b!187661 m!291823))

(assert (=> b!187433 d!64739))

(declare-fun d!64741 () Bool)

(declare-fun e!129741 () Bool)

(assert (=> d!64741 e!129741))

(declare-fun res!156325 () Bool)

(assert (=> d!64741 (=> (not res!156325) (not e!129741))))

(declare-fun lt!290744 () (_ BitVec 64))

(declare-fun lt!290748 () (_ BitVec 64))

(declare-fun lt!290749 () (_ BitVec 64))

(assert (=> d!64741 (= res!156325 (= lt!290748 (bvsub lt!290744 lt!290749)))))

(assert (=> d!64741 (or (= (bvand lt!290744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290744 lt!290749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64741 (= lt!290749 (remainingBits!0 ((_ sign_extend 32) (size!4339 (buf!4807 (_1!8745 lt!290355)))) ((_ sign_extend 32) (currentByte!9067 (_1!8745 lt!290355))) ((_ sign_extend 32) (currentBit!9062 (_1!8745 lt!290355)))))))

(declare-fun lt!290745 () (_ BitVec 64))

(declare-fun lt!290746 () (_ BitVec 64))

(assert (=> d!64741 (= lt!290744 (bvmul lt!290745 lt!290746))))

(assert (=> d!64741 (or (= lt!290745 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290746 (bvsdiv (bvmul lt!290745 lt!290746) lt!290745)))))

(assert (=> d!64741 (= lt!290746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64741 (= lt!290745 ((_ sign_extend 32) (size!4339 (buf!4807 (_1!8745 lt!290355)))))))

(assert (=> d!64741 (= lt!290748 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9067 (_1!8745 lt!290355))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9062 (_1!8745 lt!290355)))))))

(assert (=> d!64741 (invariant!0 (currentBit!9062 (_1!8745 lt!290355)) (currentByte!9067 (_1!8745 lt!290355)) (size!4339 (buf!4807 (_1!8745 lt!290355))))))

(assert (=> d!64741 (= (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!290355))) (currentByte!9067 (_1!8745 lt!290355)) (currentBit!9062 (_1!8745 lt!290355))) lt!290748)))

(declare-fun b!187675 () Bool)

(declare-fun res!156324 () Bool)

(assert (=> b!187675 (=> (not res!156324) (not e!129741))))

(assert (=> b!187675 (= res!156324 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290748))))

(declare-fun b!187676 () Bool)

(declare-fun lt!290747 () (_ BitVec 64))

(assert (=> b!187676 (= e!129741 (bvsle lt!290748 (bvmul lt!290747 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187676 (or (= lt!290747 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290747 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290747)))))

(assert (=> b!187676 (= lt!290747 ((_ sign_extend 32) (size!4339 (buf!4807 (_1!8745 lt!290355)))))))

(assert (= (and d!64741 res!156325) b!187675))

(assert (= (and b!187675 res!156324) b!187676))

(declare-fun m!291827 () Bool)

(assert (=> d!64741 m!291827))

(declare-fun m!291829 () Bool)

(assert (=> d!64741 m!291829))

(assert (=> b!187444 d!64741))

(declare-fun d!64747 () Bool)

(declare-fun e!129747 () Bool)

(assert (=> d!64747 e!129747))

(declare-fun res!156331 () Bool)

(assert (=> d!64747 (=> (not res!156331) (not e!129747))))

(declare-fun lt!290761 () (_ BitVec 64))

(declare-fun lt!290760 () BitStream!7786)

(assert (=> d!64747 (= res!156331 (= (bvadd lt!290761 (bvsub lt!290359 lt!290346)) (bitIndex!0 (size!4339 (buf!4807 lt!290760)) (currentByte!9067 lt!290760) (currentBit!9062 lt!290760))))))

(assert (=> d!64747 (or (not (= (bvand lt!290761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290359 lt!290346) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290761 (bvsub lt!290359 lt!290346)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64747 (= lt!290761 (bitIndex!0 (size!4339 (buf!4807 (_2!8743 lt!290331))) (currentByte!9067 (_2!8743 lt!290331)) (currentBit!9062 (_2!8743 lt!290331))))))

(declare-fun moveBitIndex!0 (BitStream!7786 (_ BitVec 64)) tuple2!16202)

(assert (=> d!64747 (= lt!290760 (_2!8746 (moveBitIndex!0 (_2!8743 lt!290331) (bvsub lt!290359 lt!290346))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7786 (_ BitVec 64)) Bool)

(assert (=> d!64747 (moveBitIndexPrecond!0 (_2!8743 lt!290331) (bvsub lt!290359 lt!290346))))

(assert (=> d!64747 (= (withMovedBitIndex!0 (_2!8743 lt!290331) (bvsub lt!290359 lt!290346)) lt!290760)))

(declare-fun b!187682 () Bool)

(assert (=> b!187682 (= e!129747 (= (size!4339 (buf!4807 (_2!8743 lt!290331))) (size!4339 (buf!4807 lt!290760))))))

(assert (= (and d!64747 res!156331) b!187682))

(declare-fun m!291839 () Bool)

(assert (=> d!64747 m!291839))

(declare-fun m!291841 () Bool)

(assert (=> d!64747 m!291841))

(declare-fun m!291843 () Bool)

(assert (=> d!64747 m!291843))

(declare-fun m!291845 () Bool)

(assert (=> d!64747 m!291845))

(assert (=> b!187434 d!64747))

(declare-fun d!64751 () Bool)

(assert (=> d!64751 (= (invariant!0 (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204) (size!4339 (buf!4807 thiss!1204))) (and (bvsge (currentBit!9062 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9062 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9067 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9067 thiss!1204) (size!4339 (buf!4807 thiss!1204))) (and (= (currentBit!9062 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9067 thiss!1204) (size!4339 (buf!4807 thiss!1204)))))))))

(assert (=> b!187445 d!64751))

(declare-fun d!64753 () Bool)

(declare-fun lt!290797 () tuple2!16198)

(declare-fun lt!290795 () tuple2!16198)

(assert (=> d!64753 (and (= (_2!8744 lt!290797) (_2!8744 lt!290795)) (= (_1!8744 lt!290797) (_1!8744 lt!290795)))))

(declare-fun lt!290793 () (_ BitVec 64))

(declare-fun lt!290794 () BitStream!7786)

(declare-fun lt!290796 () Unit!13399)

(declare-fun lt!290792 () Bool)

(declare-fun choose!56 (BitStream!7786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16198 tuple2!16198 BitStream!7786 (_ BitVec 64) Bool BitStream!7786 (_ BitVec 64) tuple2!16198 tuple2!16198 BitStream!7786 (_ BitVec 64)) Unit!13399)

(assert (=> d!64753 (= lt!290796 (choose!56 (_1!8743 lt!290331) nBits!348 i!590 lt!290356 lt!290797 (tuple2!16199 (_1!8744 lt!290797) (_2!8744 lt!290797)) (_1!8744 lt!290797) (_2!8744 lt!290797) lt!290792 lt!290794 lt!290793 lt!290795 (tuple2!16199 (_1!8744 lt!290795) (_2!8744 lt!290795)) (_1!8744 lt!290795) (_2!8744 lt!290795)))))

(assert (=> d!64753 (= lt!290795 (readNBitsLSBFirstsLoopPure!0 lt!290794 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!290793))))

(assert (=> d!64753 (= lt!290793 (bvor lt!290356 (ite lt!290792 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64753 (= lt!290794 (withMovedBitIndex!0 (_1!8743 lt!290331) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64753 (= lt!290792 (_2!8745 (readBitPure!0 (_1!8743 lt!290331))))))

(assert (=> d!64753 (= lt!290797 (readNBitsLSBFirstsLoopPure!0 (_1!8743 lt!290331) nBits!348 i!590 lt!290356))))

(assert (=> d!64753 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8743 lt!290331) nBits!348 i!590 lt!290356) lt!290796)))

(declare-fun bs!16098 () Bool)

(assert (= bs!16098 d!64753))

(assert (=> bs!16098 m!291483))

(assert (=> bs!16098 m!291449))

(assert (=> bs!16098 m!291487))

(declare-fun m!291851 () Bool)

(assert (=> bs!16098 m!291851))

(declare-fun m!291855 () Bool)

(assert (=> bs!16098 m!291855))

(assert (=> b!187424 d!64753))

(declare-fun d!64761 () Bool)

(declare-datatypes ((tuple2!16224 0))(
  ( (tuple2!16225 (_1!8757 (_ BitVec 64)) (_2!8757 BitStream!7786)) )
))
(declare-fun lt!290803 () tuple2!16224)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16224)

(assert (=> d!64761 (= lt!290803 (readNBitsLSBFirstsLoop!0 lt!290353 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290352))))

(assert (=> d!64761 (= (readNBitsLSBFirstsLoopPure!0 lt!290353 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290352) (tuple2!16199 (_2!8757 lt!290803) (_1!8757 lt!290803)))))

(declare-fun bs!16100 () Bool)

(assert (= bs!16100 d!64761))

(declare-fun m!291857 () Bool)

(assert (=> bs!16100 m!291857))

(assert (=> b!187424 d!64761))

(declare-fun d!64763 () Bool)

(declare-fun e!129753 () Bool)

(assert (=> d!64763 e!129753))

(declare-fun res!156341 () Bool)

(assert (=> d!64763 (=> (not res!156341) (not e!129753))))

(declare-fun lt!290805 () (_ BitVec 64))

(declare-fun lt!290804 () BitStream!7786)

(assert (=> d!64763 (= res!156341 (= (bvadd lt!290805 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4339 (buf!4807 lt!290804)) (currentByte!9067 lt!290804) (currentBit!9062 lt!290804))))))

(assert (=> d!64763 (or (not (= (bvand lt!290805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290805 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64763 (= lt!290805 (bitIndex!0 (size!4339 (buf!4807 (_1!8743 lt!290331))) (currentByte!9067 (_1!8743 lt!290331)) (currentBit!9062 (_1!8743 lt!290331))))))

(assert (=> d!64763 (= lt!290804 (_2!8746 (moveBitIndex!0 (_1!8743 lt!290331) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!64763 (moveBitIndexPrecond!0 (_1!8743 lt!290331) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64763 (= (withMovedBitIndex!0 (_1!8743 lt!290331) #b0000000000000000000000000000000000000000000000000000000000000001) lt!290804)))

(declare-fun b!187692 () Bool)

(assert (=> b!187692 (= e!129753 (= (size!4339 (buf!4807 (_1!8743 lt!290331))) (size!4339 (buf!4807 lt!290804))))))

(assert (= (and d!64763 res!156341) b!187692))

(declare-fun m!291859 () Bool)

(assert (=> d!64763 m!291859))

(declare-fun m!291861 () Bool)

(assert (=> d!64763 m!291861))

(declare-fun m!291863 () Bool)

(assert (=> d!64763 m!291863))

(declare-fun m!291865 () Bool)

(assert (=> d!64763 m!291865))

(assert (=> b!187424 d!64763))

(declare-fun d!64765 () Bool)

(assert (=> d!64765 (= (array_inv!4080 (buf!4807 thiss!1204)) (bvsge (size!4339 (buf!4807 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!187435 d!64765))

(declare-fun d!64767 () Bool)

(assert (=> d!64767 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 thiss!1204))) ((_ sign_extend 32) (currentByte!9067 thiss!1204)) ((_ sign_extend 32) (currentBit!9062 thiss!1204)) lt!290340) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4339 (buf!4807 thiss!1204))) ((_ sign_extend 32) (currentByte!9067 thiss!1204)) ((_ sign_extend 32) (currentBit!9062 thiss!1204))) lt!290340))))

(declare-fun bs!16101 () Bool)

(assert (= bs!16101 d!64767))

(declare-fun m!291867 () Bool)

(assert (=> bs!16101 m!291867))

(assert (=> b!187426 d!64767))

(declare-fun d!64769 () Bool)

(declare-fun e!129754 () Bool)

(assert (=> d!64769 e!129754))

(declare-fun res!156343 () Bool)

(assert (=> d!64769 (=> (not res!156343) (not e!129754))))

(declare-fun lt!290806 () (_ BitVec 64))

(declare-fun lt!290811 () (_ BitVec 64))

(declare-fun lt!290810 () (_ BitVec 64))

(assert (=> d!64769 (= res!156343 (= lt!290810 (bvsub lt!290806 lt!290811)))))

(assert (=> d!64769 (or (= (bvand lt!290806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290811 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290806 lt!290811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64769 (= lt!290811 (remainingBits!0 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290335)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290335))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290335)))))))

(declare-fun lt!290807 () (_ BitVec 64))

(declare-fun lt!290808 () (_ BitVec 64))

(assert (=> d!64769 (= lt!290806 (bvmul lt!290807 lt!290808))))

(assert (=> d!64769 (or (= lt!290807 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290808 (bvsdiv (bvmul lt!290807 lt!290808) lt!290807)))))

(assert (=> d!64769 (= lt!290808 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64769 (= lt!290807 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290335)))))))

(assert (=> d!64769 (= lt!290810 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290335))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290335)))))))

(assert (=> d!64769 (invariant!0 (currentBit!9062 (_2!8746 lt!290335)) (currentByte!9067 (_2!8746 lt!290335)) (size!4339 (buf!4807 (_2!8746 lt!290335))))))

(assert (=> d!64769 (= (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))) lt!290810)))

(declare-fun b!187693 () Bool)

(declare-fun res!156342 () Bool)

(assert (=> b!187693 (=> (not res!156342) (not e!129754))))

(assert (=> b!187693 (= res!156342 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290810))))

(declare-fun b!187694 () Bool)

(declare-fun lt!290809 () (_ BitVec 64))

(assert (=> b!187694 (= e!129754 (bvsle lt!290810 (bvmul lt!290809 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187694 (or (= lt!290809 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290809 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290809)))))

(assert (=> b!187694 (= lt!290809 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290335)))))))

(assert (= (and d!64769 res!156343) b!187693))

(assert (= (and b!187693 res!156342) b!187694))

(declare-fun m!291869 () Bool)

(assert (=> d!64769 m!291869))

(declare-fun m!291871 () Bool)

(assert (=> d!64769 m!291871))

(assert (=> b!187437 d!64769))

(declare-fun d!64771 () Bool)

(declare-fun e!129755 () Bool)

(assert (=> d!64771 e!129755))

(declare-fun res!156345 () Bool)

(assert (=> d!64771 (=> (not res!156345) (not e!129755))))

(declare-fun lt!290817 () (_ BitVec 64))

(declare-fun lt!290816 () (_ BitVec 64))

(declare-fun lt!290812 () (_ BitVec 64))

(assert (=> d!64771 (= res!156345 (= lt!290816 (bvsub lt!290812 lt!290817)))))

(assert (=> d!64771 (or (= (bvand lt!290812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290817 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290812 lt!290817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64771 (= lt!290817 (remainingBits!0 ((_ sign_extend 32) (size!4339 (buf!4807 thiss!1204))) ((_ sign_extend 32) (currentByte!9067 thiss!1204)) ((_ sign_extend 32) (currentBit!9062 thiss!1204))))))

(declare-fun lt!290813 () (_ BitVec 64))

(declare-fun lt!290814 () (_ BitVec 64))

(assert (=> d!64771 (= lt!290812 (bvmul lt!290813 lt!290814))))

(assert (=> d!64771 (or (= lt!290813 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290814 (bvsdiv (bvmul lt!290813 lt!290814) lt!290813)))))

(assert (=> d!64771 (= lt!290814 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64771 (= lt!290813 ((_ sign_extend 32) (size!4339 (buf!4807 thiss!1204))))))

(assert (=> d!64771 (= lt!290816 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9067 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9062 thiss!1204))))))

(assert (=> d!64771 (invariant!0 (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204) (size!4339 (buf!4807 thiss!1204)))))

(assert (=> d!64771 (= (bitIndex!0 (size!4339 (buf!4807 thiss!1204)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)) lt!290816)))

(declare-fun b!187695 () Bool)

(declare-fun res!156344 () Bool)

(assert (=> b!187695 (=> (not res!156344) (not e!129755))))

(assert (=> b!187695 (= res!156344 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290816))))

(declare-fun b!187696 () Bool)

(declare-fun lt!290815 () (_ BitVec 64))

(assert (=> b!187696 (= e!129755 (bvsle lt!290816 (bvmul lt!290815 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187696 (or (= lt!290815 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290815 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290815)))))

(assert (=> b!187696 (= lt!290815 ((_ sign_extend 32) (size!4339 (buf!4807 thiss!1204))))))

(assert (= (and d!64771 res!156345) b!187695))

(assert (= (and b!187695 res!156344) b!187696))

(assert (=> d!64771 m!291867))

(assert (=> d!64771 m!291497))

(assert (=> b!187437 d!64771))

(declare-fun d!64773 () Bool)

(assert (=> d!64773 (= (invariant!0 (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204) (size!4339 (buf!4807 (_2!8746 lt!290349)))) (and (bvsge (currentBit!9062 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9062 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9067 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9067 thiss!1204) (size!4339 (buf!4807 (_2!8746 lt!290349)))) (and (= (currentBit!9062 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9067 thiss!1204) (size!4339 (buf!4807 (_2!8746 lt!290349))))))))))

(assert (=> b!187427 d!64773))

(declare-fun d!64775 () Bool)

(assert (=> d!64775 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!187438 d!64775))

(declare-fun d!64777 () Bool)

(assert (=> d!64777 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))) ((_ sign_extend 32) (currentByte!9067 thiss!1204)) ((_ sign_extend 32) (currentBit!9062 thiss!1204)) lt!290340) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))) ((_ sign_extend 32) (currentByte!9067 thiss!1204)) ((_ sign_extend 32) (currentBit!9062 thiss!1204))) lt!290340))))

(declare-fun bs!16102 () Bool)

(assert (= bs!16102 d!64777))

(declare-fun m!291873 () Bool)

(assert (=> bs!16102 m!291873))

(assert (=> b!187438 d!64777))

(declare-fun d!64779 () Bool)

(declare-fun lt!290818 () tuple2!16224)

(assert (=> d!64779 (= lt!290818 (readNBitsLSBFirstsLoop!0 (_1!8743 lt!290342) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290352))))

(assert (=> d!64779 (= (readNBitsLSBFirstsLoopPure!0 (_1!8743 lt!290342) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290352) (tuple2!16199 (_2!8757 lt!290818) (_1!8757 lt!290818)))))

(declare-fun bs!16103 () Bool)

(assert (= bs!16103 d!64779))

(declare-fun m!291875 () Bool)

(assert (=> bs!16103 m!291875))

(assert (=> b!187438 d!64779))

(declare-fun d!64781 () Bool)

(assert (=> d!64781 (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290335))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290335))) lt!290337)))

(declare-fun lt!290821 () Unit!13399)

(declare-fun choose!9 (BitStream!7786 array!9842 (_ BitVec 64) BitStream!7786) Unit!13399)

(assert (=> d!64781 (= lt!290821 (choose!9 (_2!8746 lt!290335) (buf!4807 (_2!8746 lt!290349)) lt!290337 (BitStream!7787 (buf!4807 (_2!8746 lt!290349)) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335)))))))

(assert (=> d!64781 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8746 lt!290335) (buf!4807 (_2!8746 lt!290349)) lt!290337) lt!290821)))

(declare-fun bs!16104 () Bool)

(assert (= bs!16104 d!64781))

(assert (=> bs!16104 m!291467))

(declare-fun m!291877 () Bool)

(assert (=> bs!16104 m!291877))

(assert (=> b!187438 d!64781))

(declare-fun d!64783 () Bool)

(declare-datatypes ((tuple2!16226 0))(
  ( (tuple2!16227 (_1!8758 Bool) (_2!8758 BitStream!7786)) )
))
(declare-fun lt!290824 () tuple2!16226)

(declare-fun readBit!0 (BitStream!7786) tuple2!16226)

(assert (=> d!64783 (= lt!290824 (readBit!0 (BitStream!7787 (buf!4807 (_2!8746 lt!290349)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204))))))

(assert (=> d!64783 (= (readBitPure!0 (BitStream!7787 (buf!4807 (_2!8746 lt!290349)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204))) (tuple2!16201 (_2!8758 lt!290824) (_1!8758 lt!290824)))))

(declare-fun bs!16105 () Bool)

(assert (= bs!16105 d!64783))

(declare-fun m!291879 () Bool)

(assert (=> bs!16105 m!291879))

(assert (=> b!187438 d!64783))

(declare-fun b!187707 () Bool)

(declare-fun res!156353 () Bool)

(declare-fun e!129761 () Bool)

(assert (=> b!187707 (=> (not res!156353) (not e!129761))))

(declare-fun lt!290877 () tuple2!16196)

(assert (=> b!187707 (= res!156353 (isPrefixOf!0 (_1!8743 lt!290877) thiss!1204))))

(declare-fun b!187708 () Bool)

(declare-fun res!156352 () Bool)

(assert (=> b!187708 (=> (not res!156352) (not e!129761))))

(assert (=> b!187708 (= res!156352 (isPrefixOf!0 (_2!8743 lt!290877) (_2!8746 lt!290349)))))

(declare-fun d!64785 () Bool)

(assert (=> d!64785 e!129761))

(declare-fun res!156354 () Bool)

(assert (=> d!64785 (=> (not res!156354) (not e!129761))))

(assert (=> d!64785 (= res!156354 (isPrefixOf!0 (_1!8743 lt!290877) (_2!8743 lt!290877)))))

(declare-fun lt!290875 () BitStream!7786)

(assert (=> d!64785 (= lt!290877 (tuple2!16197 lt!290875 (_2!8746 lt!290349)))))

(declare-fun lt!290884 () Unit!13399)

(declare-fun lt!290873 () Unit!13399)

(assert (=> d!64785 (= lt!290884 lt!290873)))

(assert (=> d!64785 (isPrefixOf!0 lt!290875 (_2!8746 lt!290349))))

(assert (=> d!64785 (= lt!290873 (lemmaIsPrefixTransitive!0 lt!290875 (_2!8746 lt!290349) (_2!8746 lt!290349)))))

(declare-fun lt!290874 () Unit!13399)

(declare-fun lt!290876 () Unit!13399)

(assert (=> d!64785 (= lt!290874 lt!290876)))

(assert (=> d!64785 (isPrefixOf!0 lt!290875 (_2!8746 lt!290349))))

(assert (=> d!64785 (= lt!290876 (lemmaIsPrefixTransitive!0 lt!290875 thiss!1204 (_2!8746 lt!290349)))))

(declare-fun lt!290878 () Unit!13399)

(declare-fun e!129760 () Unit!13399)

(assert (=> d!64785 (= lt!290878 e!129760)))

(declare-fun c!9566 () Bool)

(assert (=> d!64785 (= c!9566 (not (= (size!4339 (buf!4807 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!290868 () Unit!13399)

(declare-fun lt!290883 () Unit!13399)

(assert (=> d!64785 (= lt!290868 lt!290883)))

(assert (=> d!64785 (isPrefixOf!0 (_2!8746 lt!290349) (_2!8746 lt!290349))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7786) Unit!13399)

(assert (=> d!64785 (= lt!290883 (lemmaIsPrefixRefl!0 (_2!8746 lt!290349)))))

(declare-fun lt!290879 () Unit!13399)

(declare-fun lt!290866 () Unit!13399)

(assert (=> d!64785 (= lt!290879 lt!290866)))

(assert (=> d!64785 (= lt!290866 (lemmaIsPrefixRefl!0 (_2!8746 lt!290349)))))

(declare-fun lt!290880 () Unit!13399)

(declare-fun lt!290867 () Unit!13399)

(assert (=> d!64785 (= lt!290880 lt!290867)))

(assert (=> d!64785 (isPrefixOf!0 lt!290875 lt!290875)))

(assert (=> d!64785 (= lt!290867 (lemmaIsPrefixRefl!0 lt!290875))))

(declare-fun lt!290882 () Unit!13399)

(declare-fun lt!290872 () Unit!13399)

(assert (=> d!64785 (= lt!290882 lt!290872)))

(assert (=> d!64785 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64785 (= lt!290872 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64785 (= lt!290875 (BitStream!7787 (buf!4807 (_2!8746 lt!290349)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)))))

(assert (=> d!64785 (isPrefixOf!0 thiss!1204 (_2!8746 lt!290349))))

(assert (=> d!64785 (= (reader!0 thiss!1204 (_2!8746 lt!290349)) lt!290877)))

(declare-fun b!187709 () Bool)

(declare-fun lt!290871 () Unit!13399)

(assert (=> b!187709 (= e!129760 lt!290871)))

(declare-fun lt!290865 () (_ BitVec 64))

(assert (=> b!187709 (= lt!290865 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!290870 () (_ BitVec 64))

(assert (=> b!187709 (= lt!290870 (bitIndex!0 (size!4339 (buf!4807 thiss!1204)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9842 array!9842 (_ BitVec 64) (_ BitVec 64)) Unit!13399)

(assert (=> b!187709 (= lt!290871 (arrayBitRangesEqSymmetric!0 (buf!4807 thiss!1204) (buf!4807 (_2!8746 lt!290349)) lt!290865 lt!290870))))

(assert (=> b!187709 (arrayBitRangesEq!0 (buf!4807 (_2!8746 lt!290349)) (buf!4807 thiss!1204) lt!290865 lt!290870)))

(declare-fun b!187710 () Bool)

(declare-fun Unit!13419 () Unit!13399)

(assert (=> b!187710 (= e!129760 Unit!13419)))

(declare-fun lt!290869 () (_ BitVec 64))

(declare-fun lt!290881 () (_ BitVec 64))

(declare-fun b!187711 () Bool)

(assert (=> b!187711 (= e!129761 (= (_1!8743 lt!290877) (withMovedBitIndex!0 (_2!8743 lt!290877) (bvsub lt!290881 lt!290869))))))

(assert (=> b!187711 (or (= (bvand lt!290881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290869 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290881 lt!290869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187711 (= lt!290869 (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290349))) (currentByte!9067 (_2!8746 lt!290349)) (currentBit!9062 (_2!8746 lt!290349))))))

(assert (=> b!187711 (= lt!290881 (bitIndex!0 (size!4339 (buf!4807 thiss!1204)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)))))

(assert (= (and d!64785 c!9566) b!187709))

(assert (= (and d!64785 (not c!9566)) b!187710))

(assert (= (and d!64785 res!156354) b!187707))

(assert (= (and b!187707 res!156353) b!187708))

(assert (= (and b!187708 res!156352) b!187711))

(declare-fun m!291881 () Bool)

(assert (=> b!187711 m!291881))

(assert (=> b!187711 m!291451))

(assert (=> b!187711 m!291431))

(assert (=> b!187709 m!291431))

(declare-fun m!291883 () Bool)

(assert (=> b!187709 m!291883))

(declare-fun m!291885 () Bool)

(assert (=> b!187709 m!291885))

(declare-fun m!291887 () Bool)

(assert (=> b!187708 m!291887))

(declare-fun m!291889 () Bool)

(assert (=> b!187707 m!291889))

(declare-fun m!291891 () Bool)

(assert (=> d!64785 m!291891))

(declare-fun m!291893 () Bool)

(assert (=> d!64785 m!291893))

(declare-fun m!291895 () Bool)

(assert (=> d!64785 m!291895))

(assert (=> d!64785 m!291453))

(declare-fun m!291897 () Bool)

(assert (=> d!64785 m!291897))

(declare-fun m!291899 () Bool)

(assert (=> d!64785 m!291899))

(declare-fun m!291901 () Bool)

(assert (=> d!64785 m!291901))

(declare-fun m!291903 () Bool)

(assert (=> d!64785 m!291903))

(declare-fun m!291905 () Bool)

(assert (=> d!64785 m!291905))

(declare-fun m!291907 () Bool)

(assert (=> d!64785 m!291907))

(declare-fun m!291909 () Bool)

(assert (=> d!64785 m!291909))

(assert (=> b!187438 d!64785))

(declare-fun d!64787 () Bool)

(assert (=> d!64787 (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))) ((_ sign_extend 32) (currentByte!9067 thiss!1204)) ((_ sign_extend 32) (currentBit!9062 thiss!1204)) lt!290340)))

(declare-fun lt!290885 () Unit!13399)

(assert (=> d!64787 (= lt!290885 (choose!9 thiss!1204 (buf!4807 (_2!8746 lt!290349)) lt!290340 (BitStream!7787 (buf!4807 (_2!8746 lt!290349)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204))))))

(assert (=> d!64787 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4807 (_2!8746 lt!290349)) lt!290340) lt!290885)))

(declare-fun bs!16106 () Bool)

(assert (= bs!16106 d!64787))

(assert (=> bs!16106 m!291473))

(declare-fun m!291911 () Bool)

(assert (=> bs!16106 m!291911))

(assert (=> b!187438 d!64787))

(declare-fun d!64789 () Bool)

(declare-fun lt!290886 () tuple2!16224)

(assert (=> d!64789 (= lt!290886 (readNBitsLSBFirstsLoop!0 (_1!8743 lt!290331) nBits!348 i!590 lt!290356))))

(assert (=> d!64789 (= (readNBitsLSBFirstsLoopPure!0 (_1!8743 lt!290331) nBits!348 i!590 lt!290356) (tuple2!16199 (_2!8757 lt!290886) (_1!8757 lt!290886)))))

(declare-fun bs!16107 () Bool)

(assert (= bs!16107 d!64789))

(declare-fun m!291913 () Bool)

(assert (=> bs!16107 m!291913))

(assert (=> b!187438 d!64789))

(declare-fun b!187712 () Bool)

(declare-fun res!156356 () Bool)

(declare-fun e!129763 () Bool)

(assert (=> b!187712 (=> (not res!156356) (not e!129763))))

(declare-fun lt!290899 () tuple2!16196)

(assert (=> b!187712 (= res!156356 (isPrefixOf!0 (_1!8743 lt!290899) (_2!8746 lt!290335)))))

(declare-fun b!187713 () Bool)

(declare-fun res!156355 () Bool)

(assert (=> b!187713 (=> (not res!156355) (not e!129763))))

(assert (=> b!187713 (= res!156355 (isPrefixOf!0 (_2!8743 lt!290899) (_2!8746 lt!290349)))))

(declare-fun d!64791 () Bool)

(assert (=> d!64791 e!129763))

(declare-fun res!156357 () Bool)

(assert (=> d!64791 (=> (not res!156357) (not e!129763))))

(assert (=> d!64791 (= res!156357 (isPrefixOf!0 (_1!8743 lt!290899) (_2!8743 lt!290899)))))

(declare-fun lt!290897 () BitStream!7786)

(assert (=> d!64791 (= lt!290899 (tuple2!16197 lt!290897 (_2!8746 lt!290349)))))

(declare-fun lt!290906 () Unit!13399)

(declare-fun lt!290895 () Unit!13399)

(assert (=> d!64791 (= lt!290906 lt!290895)))

(assert (=> d!64791 (isPrefixOf!0 lt!290897 (_2!8746 lt!290349))))

(assert (=> d!64791 (= lt!290895 (lemmaIsPrefixTransitive!0 lt!290897 (_2!8746 lt!290349) (_2!8746 lt!290349)))))

(declare-fun lt!290896 () Unit!13399)

(declare-fun lt!290898 () Unit!13399)

(assert (=> d!64791 (= lt!290896 lt!290898)))

(assert (=> d!64791 (isPrefixOf!0 lt!290897 (_2!8746 lt!290349))))

(assert (=> d!64791 (= lt!290898 (lemmaIsPrefixTransitive!0 lt!290897 (_2!8746 lt!290335) (_2!8746 lt!290349)))))

(declare-fun lt!290900 () Unit!13399)

(declare-fun e!129762 () Unit!13399)

(assert (=> d!64791 (= lt!290900 e!129762)))

(declare-fun c!9567 () Bool)

(assert (=> d!64791 (= c!9567 (not (= (size!4339 (buf!4807 (_2!8746 lt!290335))) #b00000000000000000000000000000000)))))

(declare-fun lt!290890 () Unit!13399)

(declare-fun lt!290905 () Unit!13399)

(assert (=> d!64791 (= lt!290890 lt!290905)))

(assert (=> d!64791 (isPrefixOf!0 (_2!8746 lt!290349) (_2!8746 lt!290349))))

(assert (=> d!64791 (= lt!290905 (lemmaIsPrefixRefl!0 (_2!8746 lt!290349)))))

(declare-fun lt!290901 () Unit!13399)

(declare-fun lt!290888 () Unit!13399)

(assert (=> d!64791 (= lt!290901 lt!290888)))

(assert (=> d!64791 (= lt!290888 (lemmaIsPrefixRefl!0 (_2!8746 lt!290349)))))

(declare-fun lt!290902 () Unit!13399)

(declare-fun lt!290889 () Unit!13399)

(assert (=> d!64791 (= lt!290902 lt!290889)))

(assert (=> d!64791 (isPrefixOf!0 lt!290897 lt!290897)))

(assert (=> d!64791 (= lt!290889 (lemmaIsPrefixRefl!0 lt!290897))))

(declare-fun lt!290904 () Unit!13399)

(declare-fun lt!290894 () Unit!13399)

(assert (=> d!64791 (= lt!290904 lt!290894)))

(assert (=> d!64791 (isPrefixOf!0 (_2!8746 lt!290335) (_2!8746 lt!290335))))

(assert (=> d!64791 (= lt!290894 (lemmaIsPrefixRefl!0 (_2!8746 lt!290335)))))

(assert (=> d!64791 (= lt!290897 (BitStream!7787 (buf!4807 (_2!8746 lt!290349)) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))))))

(assert (=> d!64791 (isPrefixOf!0 (_2!8746 lt!290335) (_2!8746 lt!290349))))

(assert (=> d!64791 (= (reader!0 (_2!8746 lt!290335) (_2!8746 lt!290349)) lt!290899)))

(declare-fun b!187714 () Bool)

(declare-fun lt!290893 () Unit!13399)

(assert (=> b!187714 (= e!129762 lt!290893)))

(declare-fun lt!290887 () (_ BitVec 64))

(assert (=> b!187714 (= lt!290887 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!290892 () (_ BitVec 64))

(assert (=> b!187714 (= lt!290892 (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))))))

(assert (=> b!187714 (= lt!290893 (arrayBitRangesEqSymmetric!0 (buf!4807 (_2!8746 lt!290335)) (buf!4807 (_2!8746 lt!290349)) lt!290887 lt!290892))))

(assert (=> b!187714 (arrayBitRangesEq!0 (buf!4807 (_2!8746 lt!290349)) (buf!4807 (_2!8746 lt!290335)) lt!290887 lt!290892)))

(declare-fun b!187715 () Bool)

(declare-fun Unit!13421 () Unit!13399)

(assert (=> b!187715 (= e!129762 Unit!13421)))

(declare-fun lt!290891 () (_ BitVec 64))

(declare-fun b!187716 () Bool)

(declare-fun lt!290903 () (_ BitVec 64))

(assert (=> b!187716 (= e!129763 (= (_1!8743 lt!290899) (withMovedBitIndex!0 (_2!8743 lt!290899) (bvsub lt!290903 lt!290891))))))

(assert (=> b!187716 (or (= (bvand lt!290903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290891 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290903 lt!290891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187716 (= lt!290891 (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290349))) (currentByte!9067 (_2!8746 lt!290349)) (currentBit!9062 (_2!8746 lt!290349))))))

(assert (=> b!187716 (= lt!290903 (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))))))

(assert (= (and d!64791 c!9567) b!187714))

(assert (= (and d!64791 (not c!9567)) b!187715))

(assert (= (and d!64791 res!156357) b!187712))

(assert (= (and b!187712 res!156356) b!187713))

(assert (= (and b!187713 res!156355) b!187716))

(declare-fun m!291915 () Bool)

(assert (=> b!187716 m!291915))

(assert (=> b!187716 m!291451))

(assert (=> b!187716 m!291429))

(assert (=> b!187714 m!291429))

(declare-fun m!291917 () Bool)

(assert (=> b!187714 m!291917))

(declare-fun m!291919 () Bool)

(assert (=> b!187714 m!291919))

(declare-fun m!291921 () Bool)

(assert (=> b!187713 m!291921))

(declare-fun m!291923 () Bool)

(assert (=> b!187712 m!291923))

(declare-fun m!291925 () Bool)

(assert (=> d!64791 m!291925))

(declare-fun m!291927 () Bool)

(assert (=> d!64791 m!291927))

(declare-fun m!291929 () Bool)

(assert (=> d!64791 m!291929))

(assert (=> d!64791 m!291443))

(declare-fun m!291931 () Bool)

(assert (=> d!64791 m!291931))

(assert (=> d!64791 m!291899))

(declare-fun m!291933 () Bool)

(assert (=> d!64791 m!291933))

(declare-fun m!291935 () Bool)

(assert (=> d!64791 m!291935))

(assert (=> d!64791 m!291905))

(declare-fun m!291937 () Bool)

(assert (=> d!64791 m!291937))

(declare-fun m!291939 () Bool)

(assert (=> d!64791 m!291939))

(assert (=> b!187438 d!64791))

(declare-fun d!64793 () Bool)

(declare-fun lt!290907 () tuple2!16226)

(assert (=> d!64793 (= lt!290907 (readBit!0 (_1!8743 lt!290331)))))

(assert (=> d!64793 (= (readBitPure!0 (_1!8743 lt!290331)) (tuple2!16201 (_2!8758 lt!290907) (_1!8758 lt!290907)))))

(declare-fun bs!16108 () Bool)

(assert (= bs!16108 d!64793))

(declare-fun m!291941 () Bool)

(assert (=> bs!16108 m!291941))

(assert (=> b!187438 d!64793))

(declare-fun d!64795 () Bool)

(assert (=> d!64795 (= (invariant!0 (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204) (size!4339 (buf!4807 (_2!8746 lt!290335)))) (and (bvsge (currentBit!9062 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9062 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9067 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9067 thiss!1204) (size!4339 (buf!4807 (_2!8746 lt!290335)))) (and (= (currentBit!9062 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9067 thiss!1204) (size!4339 (buf!4807 (_2!8746 lt!290335))))))))))

(assert (=> b!187438 d!64795))

(declare-fun d!64797 () Bool)

(declare-fun e!129764 () Bool)

(assert (=> d!64797 e!129764))

(declare-fun res!156359 () Bool)

(assert (=> d!64797 (=> (not res!156359) (not e!129764))))

(declare-fun lt!290912 () (_ BitVec 64))

(declare-fun lt!290908 () (_ BitVec 64))

(declare-fun lt!290913 () (_ BitVec 64))

(assert (=> d!64797 (= res!156359 (= lt!290912 (bvsub lt!290908 lt!290913)))))

(assert (=> d!64797 (or (= (bvand lt!290908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290908 lt!290913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64797 (= lt!290913 (remainingBits!0 ((_ sign_extend 32) (size!4339 (buf!4807 (_1!8745 lt!290354)))) ((_ sign_extend 32) (currentByte!9067 (_1!8745 lt!290354))) ((_ sign_extend 32) (currentBit!9062 (_1!8745 lt!290354)))))))

(declare-fun lt!290909 () (_ BitVec 64))

(declare-fun lt!290910 () (_ BitVec 64))

(assert (=> d!64797 (= lt!290908 (bvmul lt!290909 lt!290910))))

(assert (=> d!64797 (or (= lt!290909 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290910 (bvsdiv (bvmul lt!290909 lt!290910) lt!290909)))))

(assert (=> d!64797 (= lt!290910 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64797 (= lt!290909 ((_ sign_extend 32) (size!4339 (buf!4807 (_1!8745 lt!290354)))))))

(assert (=> d!64797 (= lt!290912 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9067 (_1!8745 lt!290354))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9062 (_1!8745 lt!290354)))))))

(assert (=> d!64797 (invariant!0 (currentBit!9062 (_1!8745 lt!290354)) (currentByte!9067 (_1!8745 lt!290354)) (size!4339 (buf!4807 (_1!8745 lt!290354))))))

(assert (=> d!64797 (= (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!290354))) (currentByte!9067 (_1!8745 lt!290354)) (currentBit!9062 (_1!8745 lt!290354))) lt!290912)))

(declare-fun b!187717 () Bool)

(declare-fun res!156358 () Bool)

(assert (=> b!187717 (=> (not res!156358) (not e!129764))))

(assert (=> b!187717 (= res!156358 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290912))))

(declare-fun b!187718 () Bool)

(declare-fun lt!290911 () (_ BitVec 64))

(assert (=> b!187718 (= e!129764 (bvsle lt!290912 (bvmul lt!290911 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187718 (or (= lt!290911 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290911 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290911)))))

(assert (=> b!187718 (= lt!290911 ((_ sign_extend 32) (size!4339 (buf!4807 (_1!8745 lt!290354)))))))

(assert (= (and d!64797 res!156359) b!187717))

(assert (= (and b!187717 res!156358) b!187718))

(declare-fun m!291943 () Bool)

(assert (=> d!64797 m!291943))

(declare-fun m!291945 () Bool)

(assert (=> d!64797 m!291945))

(assert (=> b!187438 d!64797))

(declare-fun d!64799 () Bool)

(assert (=> d!64799 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290335))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290335))) lt!290337) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290335))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290335)))) lt!290337))))

(declare-fun bs!16109 () Bool)

(assert (= bs!16109 d!64799))

(declare-fun m!291947 () Bool)

(assert (=> bs!16109 m!291947))

(assert (=> b!187438 d!64799))

(declare-fun d!64801 () Bool)

(declare-fun lt!290914 () tuple2!16226)

(assert (=> d!64801 (= lt!290914 (readBit!0 lt!290358))))

(assert (=> d!64801 (= (readBitPure!0 lt!290358) (tuple2!16201 (_2!8758 lt!290914) (_1!8758 lt!290914)))))

(declare-fun bs!16110 () Bool)

(assert (= bs!16110 d!64801))

(declare-fun m!291949 () Bool)

(assert (=> bs!16110 m!291949))

(assert (=> b!187438 d!64801))

(declare-fun d!64803 () Bool)

(declare-fun e!129767 () Bool)

(assert (=> d!64803 e!129767))

(declare-fun res!156362 () Bool)

(assert (=> d!64803 (=> (not res!156362) (not e!129767))))

(declare-fun lt!290925 () tuple2!16200)

(declare-fun lt!290926 () tuple2!16200)

(assert (=> d!64803 (= res!156362 (= (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!290925))) (currentByte!9067 (_1!8745 lt!290925)) (currentBit!9062 (_1!8745 lt!290925))) (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!290926))) (currentByte!9067 (_1!8745 lt!290926)) (currentBit!9062 (_1!8745 lt!290926)))))))

(declare-fun lt!290924 () BitStream!7786)

(declare-fun lt!290923 () Unit!13399)

(declare-fun choose!50 (BitStream!7786 BitStream!7786 BitStream!7786 tuple2!16200 tuple2!16200 BitStream!7786 Bool tuple2!16200 tuple2!16200 BitStream!7786 Bool) Unit!13399)

(assert (=> d!64803 (= lt!290923 (choose!50 lt!290358 (_2!8746 lt!290349) lt!290924 lt!290925 (tuple2!16201 (_1!8745 lt!290925) (_2!8745 lt!290925)) (_1!8745 lt!290925) (_2!8745 lt!290925) lt!290926 (tuple2!16201 (_1!8745 lt!290926) (_2!8745 lt!290926)) (_1!8745 lt!290926) (_2!8745 lt!290926)))))

(assert (=> d!64803 (= lt!290926 (readBitPure!0 lt!290924))))

(assert (=> d!64803 (= lt!290925 (readBitPure!0 lt!290358))))

(assert (=> d!64803 (= lt!290924 (BitStream!7787 (buf!4807 (_2!8746 lt!290349)) (currentByte!9067 lt!290358) (currentBit!9062 lt!290358)))))

(assert (=> d!64803 (invariant!0 (currentBit!9062 lt!290358) (currentByte!9067 lt!290358) (size!4339 (buf!4807 (_2!8746 lt!290349))))))

(assert (=> d!64803 (= (readBitPrefixLemma!0 lt!290358 (_2!8746 lt!290349)) lt!290923)))

(declare-fun b!187721 () Bool)

(assert (=> b!187721 (= e!129767 (= (_2!8745 lt!290925) (_2!8745 lt!290926)))))

(assert (= (and d!64803 res!156362) b!187721))

(declare-fun m!291951 () Bool)

(assert (=> d!64803 m!291951))

(declare-fun m!291953 () Bool)

(assert (=> d!64803 m!291953))

(assert (=> d!64803 m!291469))

(declare-fun m!291955 () Bool)

(assert (=> d!64803 m!291955))

(declare-fun m!291957 () Bool)

(assert (=> d!64803 m!291957))

(declare-fun m!291959 () Bool)

(assert (=> d!64803 m!291959))

(assert (=> b!187438 d!64803))

(declare-fun d!64805 () Bool)

(declare-fun e!129768 () Bool)

(assert (=> d!64805 e!129768))

(declare-fun res!156364 () Bool)

(assert (=> d!64805 (=> (not res!156364) (not e!129768))))

(declare-fun lt!290927 () (_ BitVec 64))

(declare-fun lt!290931 () (_ BitVec 64))

(declare-fun lt!290932 () (_ BitVec 64))

(assert (=> d!64805 (= res!156364 (= lt!290931 (bvsub lt!290927 lt!290932)))))

(assert (=> d!64805 (or (= (bvand lt!290927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290927 lt!290932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64805 (= lt!290932 (remainingBits!0 ((_ sign_extend 32) (size!4339 (buf!4807 (_1!8745 lt!290345)))) ((_ sign_extend 32) (currentByte!9067 (_1!8745 lt!290345))) ((_ sign_extend 32) (currentBit!9062 (_1!8745 lt!290345)))))))

(declare-fun lt!290928 () (_ BitVec 64))

(declare-fun lt!290929 () (_ BitVec 64))

(assert (=> d!64805 (= lt!290927 (bvmul lt!290928 lt!290929))))

(assert (=> d!64805 (or (= lt!290928 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290929 (bvsdiv (bvmul lt!290928 lt!290929) lt!290928)))))

(assert (=> d!64805 (= lt!290929 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64805 (= lt!290928 ((_ sign_extend 32) (size!4339 (buf!4807 (_1!8745 lt!290345)))))))

(assert (=> d!64805 (= lt!290931 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9067 (_1!8745 lt!290345))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9062 (_1!8745 lt!290345)))))))

(assert (=> d!64805 (invariant!0 (currentBit!9062 (_1!8745 lt!290345)) (currentByte!9067 (_1!8745 lt!290345)) (size!4339 (buf!4807 (_1!8745 lt!290345))))))

(assert (=> d!64805 (= (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!290345))) (currentByte!9067 (_1!8745 lt!290345)) (currentBit!9062 (_1!8745 lt!290345))) lt!290931)))

(declare-fun b!187722 () Bool)

(declare-fun res!156363 () Bool)

(assert (=> b!187722 (=> (not res!156363) (not e!129768))))

(assert (=> b!187722 (= res!156363 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290931))))

(declare-fun b!187723 () Bool)

(declare-fun lt!290930 () (_ BitVec 64))

(assert (=> b!187723 (= e!129768 (bvsle lt!290931 (bvmul lt!290930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187723 (or (= lt!290930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290930)))))

(assert (=> b!187723 (= lt!290930 ((_ sign_extend 32) (size!4339 (buf!4807 (_1!8745 lt!290345)))))))

(assert (= (and d!64805 res!156364) b!187722))

(assert (= (and b!187722 res!156363) b!187723))

(declare-fun m!291961 () Bool)

(assert (=> d!64805 m!291961))

(declare-fun m!291963 () Bool)

(assert (=> d!64805 m!291963))

(assert (=> b!187438 d!64805))

(declare-fun d!64807 () Bool)

(declare-fun lt!290933 () tuple2!16226)

(assert (=> d!64807 (= lt!290933 (readBit!0 (readerFrom!0 (_2!8746 lt!290335) (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204))))))

(assert (=> d!64807 (= (readBitPure!0 (readerFrom!0 (_2!8746 lt!290335) (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204))) (tuple2!16201 (_2!8758 lt!290933) (_1!8758 lt!290933)))))

(declare-fun bs!16111 () Bool)

(assert (= bs!16111 d!64807))

(assert (=> bs!16111 m!291499))

(declare-fun m!291965 () Bool)

(assert (=> bs!16111 m!291965))

(assert (=> b!187428 d!64807))

(declare-fun d!64809 () Bool)

(declare-fun e!129771 () Bool)

(assert (=> d!64809 e!129771))

(declare-fun res!156368 () Bool)

(assert (=> d!64809 (=> (not res!156368) (not e!129771))))

(assert (=> d!64809 (= res!156368 (invariant!0 (currentBit!9062 (_2!8746 lt!290335)) (currentByte!9067 (_2!8746 lt!290335)) (size!4339 (buf!4807 (_2!8746 lt!290335)))))))

(assert (=> d!64809 (= (readerFrom!0 (_2!8746 lt!290335) (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204)) (BitStream!7787 (buf!4807 (_2!8746 lt!290335)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)))))

(declare-fun b!187726 () Bool)

(assert (=> b!187726 (= e!129771 (invariant!0 (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204) (size!4339 (buf!4807 (_2!8746 lt!290335)))))))

(assert (= (and d!64809 res!156368) b!187726))

(assert (=> d!64809 m!291871))

(assert (=> b!187726 m!291493))

(assert (=> b!187428 d!64809))

(declare-fun d!64811 () Bool)

(assert (=> d!64811 (= (invariant!0 (currentBit!9062 (_2!8746 lt!290349)) (currentByte!9067 (_2!8746 lt!290349)) (size!4339 (buf!4807 (_2!8746 lt!290349)))) (and (bvsge (currentBit!9062 (_2!8746 lt!290349)) #b00000000000000000000000000000000) (bvslt (currentBit!9062 (_2!8746 lt!290349)) #b00000000000000000000000000001000) (bvsge (currentByte!9067 (_2!8746 lt!290349)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9067 (_2!8746 lt!290349)) (size!4339 (buf!4807 (_2!8746 lt!290349)))) (and (= (currentBit!9062 (_2!8746 lt!290349)) #b00000000000000000000000000000000) (= (currentByte!9067 (_2!8746 lt!290349)) (size!4339 (buf!4807 (_2!8746 lt!290349))))))))))

(assert (=> b!187439 d!64811))

(declare-fun d!64813 () Bool)

(declare-fun e!129772 () Bool)

(assert (=> d!64813 e!129772))

(declare-fun res!156369 () Bool)

(assert (=> d!64813 (=> (not res!156369) (not e!129772))))

(declare-fun lt!290934 () BitStream!7786)

(declare-fun lt!290935 () (_ BitVec 64))

(assert (=> d!64813 (= res!156369 (= (bvadd lt!290935 (bvsub lt!290357 lt!290346)) (bitIndex!0 (size!4339 (buf!4807 lt!290934)) (currentByte!9067 lt!290934) (currentBit!9062 lt!290934))))))

(assert (=> d!64813 (or (not (= (bvand lt!290935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290357 lt!290346) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290935 (bvsub lt!290357 lt!290346)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64813 (= lt!290935 (bitIndex!0 (size!4339 (buf!4807 (_2!8743 lt!290342))) (currentByte!9067 (_2!8743 lt!290342)) (currentBit!9062 (_2!8743 lt!290342))))))

(assert (=> d!64813 (= lt!290934 (_2!8746 (moveBitIndex!0 (_2!8743 lt!290342) (bvsub lt!290357 lt!290346))))))

(assert (=> d!64813 (moveBitIndexPrecond!0 (_2!8743 lt!290342) (bvsub lt!290357 lt!290346))))

(assert (=> d!64813 (= (withMovedBitIndex!0 (_2!8743 lt!290342) (bvsub lt!290357 lt!290346)) lt!290934)))

(declare-fun b!187727 () Bool)

(assert (=> b!187727 (= e!129772 (= (size!4339 (buf!4807 (_2!8743 lt!290342))) (size!4339 (buf!4807 lt!290934))))))

(assert (= (and d!64813 res!156369) b!187727))

(declare-fun m!291967 () Bool)

(assert (=> d!64813 m!291967))

(declare-fun m!291969 () Bool)

(assert (=> d!64813 m!291969))

(declare-fun m!291971 () Bool)

(assert (=> d!64813 m!291971))

(declare-fun m!291973 () Bool)

(assert (=> d!64813 m!291973))

(assert (=> b!187440 d!64813))

(assert (=> b!187430 d!64769))

(assert (=> b!187430 d!64771))

(declare-fun b!187737 () Bool)

(declare-fun res!156378 () Bool)

(declare-fun e!129778 () Bool)

(assert (=> b!187737 (=> (not res!156378) (not e!129778))))

(declare-fun lt!290946 () tuple2!16202)

(declare-fun lt!290947 () (_ BitVec 64))

(declare-fun lt!290944 () (_ BitVec 64))

(assert (=> b!187737 (= res!156378 (= (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290946))) (currentByte!9067 (_2!8746 lt!290946)) (currentBit!9062 (_2!8746 lt!290946))) (bvadd lt!290947 lt!290944)))))

(assert (=> b!187737 (or (not (= (bvand lt!290947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290944 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290947 lt!290944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187737 (= lt!290944 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!187737 (= lt!290947 (bitIndex!0 (size!4339 (buf!4807 thiss!1204)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)))))

(declare-fun b!187740 () Bool)

(declare-fun e!129777 () Bool)

(declare-fun lt!290945 () tuple2!16200)

(assert (=> b!187740 (= e!129777 (= (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!290945))) (currentByte!9067 (_1!8745 lt!290945)) (currentBit!9062 (_1!8745 lt!290945))) (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290946))) (currentByte!9067 (_2!8746 lt!290946)) (currentBit!9062 (_2!8746 lt!290946)))))))

(declare-fun b!187739 () Bool)

(assert (=> b!187739 (= e!129778 e!129777)))

(declare-fun res!156381 () Bool)

(assert (=> b!187739 (=> (not res!156381) (not e!129777))))

(assert (=> b!187739 (= res!156381 (and (= (_2!8745 lt!290945) lt!290348) (= (_1!8745 lt!290945) (_2!8746 lt!290946))))))

(assert (=> b!187739 (= lt!290945 (readBitPure!0 (readerFrom!0 (_2!8746 lt!290946) (currentBit!9062 thiss!1204) (currentByte!9067 thiss!1204))))))

(declare-fun b!187738 () Bool)

(declare-fun res!156379 () Bool)

(assert (=> b!187738 (=> (not res!156379) (not e!129778))))

(assert (=> b!187738 (= res!156379 (isPrefixOf!0 thiss!1204 (_2!8746 lt!290946)))))

(declare-fun d!64815 () Bool)

(assert (=> d!64815 e!129778))

(declare-fun res!156380 () Bool)

(assert (=> d!64815 (=> (not res!156380) (not e!129778))))

(assert (=> d!64815 (= res!156380 (= (size!4339 (buf!4807 thiss!1204)) (size!4339 (buf!4807 (_2!8746 lt!290946)))))))

(declare-fun choose!16 (BitStream!7786 Bool) tuple2!16202)

(assert (=> d!64815 (= lt!290946 (choose!16 thiss!1204 lt!290348))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64815 (validate_offset_bit!0 ((_ sign_extend 32) (size!4339 (buf!4807 thiss!1204))) ((_ sign_extend 32) (currentByte!9067 thiss!1204)) ((_ sign_extend 32) (currentBit!9062 thiss!1204)))))

(assert (=> d!64815 (= (appendBit!0 thiss!1204 lt!290348) lt!290946)))

(assert (= (and d!64815 res!156380) b!187737))

(assert (= (and b!187737 res!156378) b!187738))

(assert (= (and b!187738 res!156379) b!187739))

(assert (= (and b!187739 res!156381) b!187740))

(declare-fun m!291975 () Bool)

(assert (=> d!64815 m!291975))

(declare-fun m!291977 () Bool)

(assert (=> d!64815 m!291977))

(declare-fun m!291979 () Bool)

(assert (=> b!187738 m!291979))

(declare-fun m!291981 () Bool)

(assert (=> b!187740 m!291981))

(declare-fun m!291983 () Bool)

(assert (=> b!187740 m!291983))

(assert (=> b!187737 m!291983))

(assert (=> b!187737 m!291431))

(declare-fun m!291985 () Bool)

(assert (=> b!187739 m!291985))

(assert (=> b!187739 m!291985))

(declare-fun m!291987 () Bool)

(assert (=> b!187739 m!291987))

(assert (=> b!187430 d!64815))

(declare-fun d!64817 () Bool)

(declare-fun e!129779 () Bool)

(assert (=> d!64817 e!129779))

(declare-fun res!156383 () Bool)

(assert (=> d!64817 (=> (not res!156383) (not e!129779))))

(declare-fun lt!290953 () (_ BitVec 64))

(declare-fun lt!290948 () (_ BitVec 64))

(declare-fun lt!290952 () (_ BitVec 64))

(assert (=> d!64817 (= res!156383 (= lt!290952 (bvsub lt!290948 lt!290953)))))

(assert (=> d!64817 (or (= (bvand lt!290948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290953 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290948 lt!290953) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64817 (= lt!290953 (remainingBits!0 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290349))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290349)))))))

(declare-fun lt!290949 () (_ BitVec 64))

(declare-fun lt!290950 () (_ BitVec 64))

(assert (=> d!64817 (= lt!290948 (bvmul lt!290949 lt!290950))))

(assert (=> d!64817 (or (= lt!290949 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290950 (bvsdiv (bvmul lt!290949 lt!290950) lt!290949)))))

(assert (=> d!64817 (= lt!290950 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64817 (= lt!290949 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))))))

(assert (=> d!64817 (= lt!290952 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290349))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290349)))))))

(assert (=> d!64817 (invariant!0 (currentBit!9062 (_2!8746 lt!290349)) (currentByte!9067 (_2!8746 lt!290349)) (size!4339 (buf!4807 (_2!8746 lt!290349))))))

(assert (=> d!64817 (= (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290349))) (currentByte!9067 (_2!8746 lt!290349)) (currentBit!9062 (_2!8746 lt!290349))) lt!290952)))

(declare-fun b!187741 () Bool)

(declare-fun res!156382 () Bool)

(assert (=> b!187741 (=> (not res!156382) (not e!129779))))

(assert (=> b!187741 (= res!156382 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290952))))

(declare-fun b!187742 () Bool)

(declare-fun lt!290951 () (_ BitVec 64))

(assert (=> b!187742 (= e!129779 (bvsle lt!290952 (bvmul lt!290951 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187742 (or (= lt!290951 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290951 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290951)))))

(assert (=> b!187742 (= lt!290951 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290349)))))))

(assert (= (and d!64817 res!156383) b!187741))

(assert (= (and b!187741 res!156382) b!187742))

(declare-fun m!291989 () Bool)

(assert (=> d!64817 m!291989))

(assert (=> d!64817 m!291433))

(assert (=> b!187441 d!64817))

(declare-fun d!64819 () Bool)

(declare-fun res!156386 () Bool)

(declare-fun e!129780 () Bool)

(assert (=> d!64819 (=> (not res!156386) (not e!129780))))

(assert (=> d!64819 (= res!156386 (= (size!4339 (buf!4807 thiss!1204)) (size!4339 (buf!4807 (_2!8746 lt!290349)))))))

(assert (=> d!64819 (= (isPrefixOf!0 thiss!1204 (_2!8746 lt!290349)) e!129780)))

(declare-fun b!187743 () Bool)

(declare-fun res!156384 () Bool)

(assert (=> b!187743 (=> (not res!156384) (not e!129780))))

(assert (=> b!187743 (= res!156384 (bvsle (bitIndex!0 (size!4339 (buf!4807 thiss!1204)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204)) (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290349))) (currentByte!9067 (_2!8746 lt!290349)) (currentBit!9062 (_2!8746 lt!290349)))))))

(declare-fun b!187744 () Bool)

(declare-fun e!129781 () Bool)

(assert (=> b!187744 (= e!129780 e!129781)))

(declare-fun res!156385 () Bool)

(assert (=> b!187744 (=> res!156385 e!129781)))

(assert (=> b!187744 (= res!156385 (= (size!4339 (buf!4807 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!187745 () Bool)

(assert (=> b!187745 (= e!129781 (arrayBitRangesEq!0 (buf!4807 thiss!1204) (buf!4807 (_2!8746 lt!290349)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4339 (buf!4807 thiss!1204)) (currentByte!9067 thiss!1204) (currentBit!9062 thiss!1204))))))

(assert (= (and d!64819 res!156386) b!187743))

(assert (= (and b!187743 res!156384) b!187744))

(assert (= (and b!187744 (not res!156385)) b!187745))

(assert (=> b!187743 m!291431))

(assert (=> b!187743 m!291451))

(assert (=> b!187745 m!291431))

(assert (=> b!187745 m!291431))

(declare-fun m!291991 () Bool)

(assert (=> b!187745 m!291991))

(assert (=> b!187441 d!64819))

(declare-fun d!64821 () Bool)

(assert (=> d!64821 (isPrefixOf!0 thiss!1204 (_2!8746 lt!290349))))

(declare-fun lt!290956 () Unit!13399)

(declare-fun choose!30 (BitStream!7786 BitStream!7786 BitStream!7786) Unit!13399)

(assert (=> d!64821 (= lt!290956 (choose!30 thiss!1204 (_2!8746 lt!290335) (_2!8746 lt!290349)))))

(assert (=> d!64821 (isPrefixOf!0 thiss!1204 (_2!8746 lt!290335))))

(assert (=> d!64821 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8746 lt!290335) (_2!8746 lt!290349)) lt!290956)))

(declare-fun bs!16112 () Bool)

(assert (= bs!16112 d!64821))

(assert (=> bs!16112 m!291453))

(declare-fun m!291993 () Bool)

(assert (=> bs!16112 m!291993))

(assert (=> bs!16112 m!291459))

(assert (=> b!187441 d!64821))

(declare-fun b!187917 () Bool)

(declare-fun e!129882 () (_ BitVec 64))

(assert (=> b!187917 (= e!129882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!187918 () Bool)

(declare-fun res!156528 () Bool)

(declare-fun lt!291584 () tuple2!16202)

(assert (=> b!187918 (= res!156528 (isPrefixOf!0 (_2!8746 lt!290335) (_2!8746 lt!291584)))))

(declare-fun e!129881 () Bool)

(assert (=> b!187918 (=> (not res!156528) (not e!129881))))

(declare-fun d!64823 () Bool)

(declare-fun e!129884 () Bool)

(assert (=> d!64823 e!129884))

(declare-fun res!156522 () Bool)

(assert (=> d!64823 (=> (not res!156522) (not e!129884))))

(declare-fun lt!291563 () tuple2!16202)

(assert (=> d!64823 (= res!156522 (invariant!0 (currentBit!9062 (_2!8746 lt!291563)) (currentByte!9067 (_2!8746 lt!291563)) (size!4339 (buf!4807 (_2!8746 lt!291563)))))))

(declare-fun e!129878 () tuple2!16202)

(assert (=> d!64823 (= lt!291563 e!129878)))

(declare-fun c!9588 () Bool)

(assert (=> d!64823 (= c!9588 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64823 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64823 (= (appendBitsLSBFirstLoopTR!0 (_2!8746 lt!290335) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!291563)))

(declare-fun b!187919 () Bool)

(declare-fun e!129879 () Bool)

(declare-fun lt!291594 () tuple2!16198)

(declare-fun lt!291564 () tuple2!16196)

(assert (=> b!187919 (= e!129879 (= (_1!8744 lt!291594) (_2!8743 lt!291564)))))

(declare-fun b!187920 () Bool)

(declare-fun e!129883 () Bool)

(declare-fun lt!291579 () tuple2!16198)

(declare-fun lt!291586 () tuple2!16196)

(assert (=> b!187920 (= e!129883 (= (_1!8744 lt!291579) (_2!8743 lt!291586)))))

(declare-fun bm!3017 () Bool)

(declare-fun lt!291572 () tuple2!16202)

(declare-fun call!3020 () Bool)

(assert (=> bm!3017 (= call!3020 (isPrefixOf!0 (_2!8746 lt!290335) (ite c!9588 (_2!8746 lt!290335) (_2!8746 lt!291572))))))

(declare-fun b!187921 () Bool)

(declare-fun res!156529 () Bool)

(assert (=> b!187921 (=> (not res!156529) (not e!129884))))

(declare-fun lt!291577 () (_ BitVec 64))

(declare-fun lt!291555 () (_ BitVec 64))

(assert (=> b!187921 (= res!156529 (= (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!291563))) (currentByte!9067 (_2!8746 lt!291563)) (currentBit!9062 (_2!8746 lt!291563))) (bvsub lt!291555 lt!291577)))))

(assert (=> b!187921 (or (= (bvand lt!291555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291577 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291555 lt!291577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187921 (= lt!291577 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!291583 () (_ BitVec 64))

(declare-fun lt!291593 () (_ BitVec 64))

(assert (=> b!187921 (= lt!291555 (bvadd lt!291583 lt!291593))))

(assert (=> b!187921 (or (not (= (bvand lt!291583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291593 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!291583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!291583 lt!291593) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187921 (= lt!291593 ((_ sign_extend 32) nBits!348))))

(assert (=> b!187921 (= lt!291583 (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))))))

(declare-fun b!187922 () Bool)

(declare-fun lt!291571 () tuple2!16200)

(assert (=> b!187922 (= lt!291571 (readBitPure!0 (readerFrom!0 (_2!8746 lt!291584) (currentBit!9062 (_2!8746 lt!290335)) (currentByte!9067 (_2!8746 lt!290335)))))))

(declare-fun res!156521 () Bool)

(declare-fun lt!291576 () Bool)

(assert (=> b!187922 (= res!156521 (and (= (_2!8745 lt!291571) lt!291576) (= (_1!8745 lt!291571) (_2!8746 lt!291584))))))

(declare-fun e!129886 () Bool)

(assert (=> b!187922 (=> (not res!156521) (not e!129886))))

(assert (=> b!187922 (= e!129881 e!129886)))

(declare-fun b!187923 () Bool)

(assert (=> b!187923 (= e!129886 (= (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!291571))) (currentByte!9067 (_1!8745 lt!291571)) (currentBit!9062 (_1!8745 lt!291571))) (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!291584))) (currentByte!9067 (_2!8746 lt!291584)) (currentBit!9062 (_2!8746 lt!291584)))))))

(declare-fun b!187924 () Bool)

(declare-fun Unit!13431 () Unit!13399)

(assert (=> b!187924 (= e!129878 (tuple2!16203 Unit!13431 (_2!8746 lt!290335)))))

(declare-fun lt!291597 () Unit!13399)

(assert (=> b!187924 (= lt!291597 (lemmaIsPrefixRefl!0 (_2!8746 lt!290335)))))

(assert (=> b!187924 call!3020))

(declare-fun lt!291567 () Unit!13399)

(assert (=> b!187924 (= lt!291567 lt!291597)))

(declare-fun b!187925 () Bool)

(declare-fun res!156526 () Bool)

(assert (=> b!187925 (=> (not res!156526) (not e!129884))))

(assert (=> b!187925 (= res!156526 (= (size!4339 (buf!4807 (_2!8746 lt!290335))) (size!4339 (buf!4807 (_2!8746 lt!291563)))))))

(declare-fun b!187926 () Bool)

(declare-fun res!156519 () Bool)

(assert (=> b!187926 (=> (not res!156519) (not e!129884))))

(assert (=> b!187926 (= res!156519 (isPrefixOf!0 (_2!8746 lt!290335) (_2!8746 lt!291563)))))

(declare-fun b!187927 () Bool)

(declare-fun e!129885 () Bool)

(declare-fun lt!291590 () (_ BitVec 64))

(assert (=> b!187927 (= e!129885 (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!290335)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290335))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290335))) lt!291590))))

(declare-fun b!187928 () Bool)

(assert (=> b!187928 (= e!129878 (tuple2!16203 (_1!8746 lt!291572) (_2!8746 lt!291572)))))

(assert (=> b!187928 (= lt!291576 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187928 (= lt!291584 (appendBit!0 (_2!8746 lt!290335) lt!291576))))

(declare-fun res!156525 () Bool)

(assert (=> b!187928 (= res!156525 (= (size!4339 (buf!4807 (_2!8746 lt!290335))) (size!4339 (buf!4807 (_2!8746 lt!291584)))))))

(assert (=> b!187928 (=> (not res!156525) (not e!129881))))

(assert (=> b!187928 e!129881))

(declare-fun lt!291548 () tuple2!16202)

(assert (=> b!187928 (= lt!291548 lt!291584)))

(assert (=> b!187928 (= lt!291572 (appendBitsLSBFirstLoopTR!0 (_2!8746 lt!291548) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!291558 () Unit!13399)

(assert (=> b!187928 (= lt!291558 (lemmaIsPrefixTransitive!0 (_2!8746 lt!290335) (_2!8746 lt!291548) (_2!8746 lt!291572)))))

(assert (=> b!187928 call!3020))

(declare-fun lt!291578 () Unit!13399)

(assert (=> b!187928 (= lt!291578 lt!291558)))

(assert (=> b!187928 (invariant!0 (currentBit!9062 (_2!8746 lt!290335)) (currentByte!9067 (_2!8746 lt!290335)) (size!4339 (buf!4807 (_2!8746 lt!291548))))))

(declare-fun lt!291545 () BitStream!7786)

(assert (=> b!187928 (= lt!291545 (BitStream!7787 (buf!4807 (_2!8746 lt!291548)) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))))))

(assert (=> b!187928 (invariant!0 (currentBit!9062 lt!291545) (currentByte!9067 lt!291545) (size!4339 (buf!4807 (_2!8746 lt!291572))))))

(declare-fun lt!291582 () BitStream!7786)

(assert (=> b!187928 (= lt!291582 (BitStream!7787 (buf!4807 (_2!8746 lt!291572)) (currentByte!9067 lt!291545) (currentBit!9062 lt!291545)))))

(declare-fun lt!291566 () tuple2!16200)

(assert (=> b!187928 (= lt!291566 (readBitPure!0 lt!291545))))

(declare-fun lt!291595 () tuple2!16200)

(assert (=> b!187928 (= lt!291595 (readBitPure!0 lt!291582))))

(declare-fun lt!291551 () Unit!13399)

(assert (=> b!187928 (= lt!291551 (readBitPrefixLemma!0 lt!291545 (_2!8746 lt!291572)))))

(declare-fun res!156523 () Bool)

(assert (=> b!187928 (= res!156523 (= (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!291566))) (currentByte!9067 (_1!8745 lt!291566)) (currentBit!9062 (_1!8745 lt!291566))) (bitIndex!0 (size!4339 (buf!4807 (_1!8745 lt!291595))) (currentByte!9067 (_1!8745 lt!291595)) (currentBit!9062 (_1!8745 lt!291595)))))))

(declare-fun e!129880 () Bool)

(assert (=> b!187928 (=> (not res!156523) (not e!129880))))

(assert (=> b!187928 e!129880))

(declare-fun lt!291559 () Unit!13399)

(assert (=> b!187928 (= lt!291559 lt!291551)))

(declare-fun lt!291574 () tuple2!16196)

(assert (=> b!187928 (= lt!291574 (reader!0 (_2!8746 lt!290335) (_2!8746 lt!291572)))))

(declare-fun lt!291570 () tuple2!16196)

(assert (=> b!187928 (= lt!291570 (reader!0 (_2!8746 lt!291548) (_2!8746 lt!291572)))))

(declare-fun lt!291589 () tuple2!16200)

(assert (=> b!187928 (= lt!291589 (readBitPure!0 (_1!8743 lt!291574)))))

(assert (=> b!187928 (= (_2!8745 lt!291589) lt!291576)))

(declare-fun lt!291560 () Unit!13399)

(declare-fun Unit!13432 () Unit!13399)

(assert (=> b!187928 (= lt!291560 Unit!13432)))

(declare-fun lt!291585 () (_ BitVec 64))

(assert (=> b!187928 (= lt!291585 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291568 () (_ BitVec 64))

(assert (=> b!187928 (= lt!291568 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291554 () Unit!13399)

(assert (=> b!187928 (= lt!291554 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8746 lt!290335) (buf!4807 (_2!8746 lt!291572)) lt!291568))))

(assert (=> b!187928 (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!291572)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290335))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290335))) lt!291568)))

(declare-fun lt!291580 () Unit!13399)

(assert (=> b!187928 (= lt!291580 lt!291554)))

(declare-fun lt!291596 () tuple2!16198)

(assert (=> b!187928 (= lt!291596 (readNBitsLSBFirstsLoopPure!0 (_1!8743 lt!291574) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291585))))

(declare-fun lt!291573 () (_ BitVec 64))

(assert (=> b!187928 (= lt!291573 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!291587 () Unit!13399)

(assert (=> b!187928 (= lt!291587 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8746 lt!291548) (buf!4807 (_2!8746 lt!291572)) lt!291573))))

(assert (=> b!187928 (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!291572)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!291548))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!291548))) lt!291573)))

(declare-fun lt!291543 () Unit!13399)

(assert (=> b!187928 (= lt!291543 lt!291587)))

(declare-fun lt!291565 () tuple2!16198)

(assert (=> b!187928 (= lt!291565 (readNBitsLSBFirstsLoopPure!0 (_1!8743 lt!291570) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!291585 (ite (_2!8745 lt!291589) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!291591 () tuple2!16198)

(assert (=> b!187928 (= lt!291591 (readNBitsLSBFirstsLoopPure!0 (_1!8743 lt!291574) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291585))))

(declare-fun c!9589 () Bool)

(assert (=> b!187928 (= c!9589 (_2!8745 (readBitPure!0 (_1!8743 lt!291574))))))

(declare-fun lt!291556 () tuple2!16198)

(assert (=> b!187928 (= lt!291556 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8743 lt!291574) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!291585 e!129882)))))

(declare-fun lt!291544 () Unit!13399)

(assert (=> b!187928 (= lt!291544 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8743 lt!291574) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291585))))

(assert (=> b!187928 (and (= (_2!8744 lt!291591) (_2!8744 lt!291556)) (= (_1!8744 lt!291591) (_1!8744 lt!291556)))))

(declare-fun lt!291575 () Unit!13399)

(assert (=> b!187928 (= lt!291575 lt!291544)))

(assert (=> b!187928 (= (_1!8743 lt!291574) (withMovedBitIndex!0 (_2!8743 lt!291574) (bvsub (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))) (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!291572))) (currentByte!9067 (_2!8746 lt!291572)) (currentBit!9062 (_2!8746 lt!291572))))))))

(declare-fun lt!291562 () Unit!13399)

(declare-fun Unit!13433 () Unit!13399)

(assert (=> b!187928 (= lt!291562 Unit!13433)))

(assert (=> b!187928 (= (_1!8743 lt!291570) (withMovedBitIndex!0 (_2!8743 lt!291570) (bvsub (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!291548))) (currentByte!9067 (_2!8746 lt!291548)) (currentBit!9062 (_2!8746 lt!291548))) (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!291572))) (currentByte!9067 (_2!8746 lt!291572)) (currentBit!9062 (_2!8746 lt!291572))))))))

(declare-fun lt!291588 () Unit!13399)

(declare-fun Unit!13434 () Unit!13399)

(assert (=> b!187928 (= lt!291588 Unit!13434)))

(assert (=> b!187928 (= (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))) (bvsub (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!291548))) (currentByte!9067 (_2!8746 lt!291548)) (currentBit!9062 (_2!8746 lt!291548))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!291550 () Unit!13399)

(declare-fun Unit!13435 () Unit!13399)

(assert (=> b!187928 (= lt!291550 Unit!13435)))

(assert (=> b!187928 (= (_2!8744 lt!291596) (_2!8744 lt!291565))))

(declare-fun lt!291553 () Unit!13399)

(declare-fun Unit!13436 () Unit!13399)

(assert (=> b!187928 (= lt!291553 Unit!13436)))

(assert (=> b!187928 (invariant!0 (currentBit!9062 (_2!8746 lt!291572)) (currentByte!9067 (_2!8746 lt!291572)) (size!4339 (buf!4807 (_2!8746 lt!291572))))))

(declare-fun lt!291547 () Unit!13399)

(declare-fun Unit!13437 () Unit!13399)

(assert (=> b!187928 (= lt!291547 Unit!13437)))

(assert (=> b!187928 (= (size!4339 (buf!4807 (_2!8746 lt!290335))) (size!4339 (buf!4807 (_2!8746 lt!291572))))))

(declare-fun lt!291569 () Unit!13399)

(declare-fun Unit!13438 () Unit!13399)

(assert (=> b!187928 (= lt!291569 Unit!13438)))

(assert (=> b!187928 (= (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!291572))) (currentByte!9067 (_2!8746 lt!291572)) (currentBit!9062 (_2!8746 lt!291572))) (bvsub (bvadd (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291592 () Unit!13399)

(declare-fun Unit!13439 () Unit!13399)

(assert (=> b!187928 (= lt!291592 Unit!13439)))

(declare-fun lt!291561 () Unit!13399)

(declare-fun Unit!13440 () Unit!13399)

(assert (=> b!187928 (= lt!291561 Unit!13440)))

(assert (=> b!187928 (= lt!291564 (reader!0 (_2!8746 lt!290335) (_2!8746 lt!291572)))))

(declare-fun lt!291557 () (_ BitVec 64))

(assert (=> b!187928 (= lt!291557 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291546 () Unit!13399)

(assert (=> b!187928 (= lt!291546 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8746 lt!290335) (buf!4807 (_2!8746 lt!291572)) lt!291557))))

(assert (=> b!187928 (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!291572)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290335))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290335))) lt!291557)))

(declare-fun lt!291549 () Unit!13399)

(assert (=> b!187928 (= lt!291549 lt!291546)))

(assert (=> b!187928 (= lt!291594 (readNBitsLSBFirstsLoopPure!0 (_1!8743 lt!291564) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!156524 () Bool)

(assert (=> b!187928 (= res!156524 (= (_2!8744 lt!291594) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!187928 (=> (not res!156524) (not e!129879))))

(assert (=> b!187928 e!129879))

(declare-fun lt!291598 () Unit!13399)

(declare-fun Unit!13441 () Unit!13399)

(assert (=> b!187928 (= lt!291598 Unit!13441)))

(declare-fun b!187929 () Bool)

(assert (=> b!187929 (= e!129880 (= (_2!8745 lt!291566) (_2!8745 lt!291595)))))

(declare-fun b!187930 () Bool)

(assert (=> b!187930 (= e!129884 e!129883)))

(declare-fun res!156530 () Bool)

(assert (=> b!187930 (=> (not res!156530) (not e!129883))))

(assert (=> b!187930 (= res!156530 (= (_2!8744 lt!291579) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!187930 (= lt!291579 (readNBitsLSBFirstsLoopPure!0 (_1!8743 lt!291586) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!291552 () Unit!13399)

(declare-fun lt!291581 () Unit!13399)

(assert (=> b!187930 (= lt!291552 lt!291581)))

(assert (=> b!187930 (validate_offset_bits!1 ((_ sign_extend 32) (size!4339 (buf!4807 (_2!8746 lt!291563)))) ((_ sign_extend 32) (currentByte!9067 (_2!8746 lt!290335))) ((_ sign_extend 32) (currentBit!9062 (_2!8746 lt!290335))) lt!291590)))

(assert (=> b!187930 (= lt!291581 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8746 lt!290335) (buf!4807 (_2!8746 lt!291563)) lt!291590))))

(assert (=> b!187930 e!129885))

(declare-fun res!156520 () Bool)

(assert (=> b!187930 (=> (not res!156520) (not e!129885))))

(assert (=> b!187930 (= res!156520 (and (= (size!4339 (buf!4807 (_2!8746 lt!290335))) (size!4339 (buf!4807 (_2!8746 lt!291563)))) (bvsge lt!291590 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187930 (= lt!291590 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!187930 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!187930 (= lt!291586 (reader!0 (_2!8746 lt!290335) (_2!8746 lt!291563)))))

(declare-fun b!187931 () Bool)

(assert (=> b!187931 (= e!129882 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!187932 () Bool)

(declare-fun res!156527 () Bool)

(assert (=> b!187932 (= res!156527 (= (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!291584))) (currentByte!9067 (_2!8746 lt!291584)) (currentBit!9062 (_2!8746 lt!291584))) (bvadd (bitIndex!0 (size!4339 (buf!4807 (_2!8746 lt!290335))) (currentByte!9067 (_2!8746 lt!290335)) (currentBit!9062 (_2!8746 lt!290335))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!187932 (=> (not res!156527) (not e!129881))))

(assert (= (and d!64823 c!9588) b!187924))

(assert (= (and d!64823 (not c!9588)) b!187928))

(assert (= (and b!187928 res!156525) b!187932))

(assert (= (and b!187932 res!156527) b!187918))

(assert (= (and b!187918 res!156528) b!187922))

(assert (= (and b!187922 res!156521) b!187923))

(assert (= (and b!187928 res!156523) b!187929))

(assert (= (and b!187928 c!9589) b!187931))

(assert (= (and b!187928 (not c!9589)) b!187917))

(assert (= (and b!187928 res!156524) b!187919))

(assert (= (or b!187924 b!187928) bm!3017))

(assert (= (and d!64823 res!156522) b!187925))

(assert (= (and b!187925 res!156526) b!187921))

(assert (= (and b!187921 res!156529) b!187926))

(assert (= (and b!187926 res!156519) b!187930))

(assert (= (and b!187930 res!156520) b!187927))

(assert (= (and b!187930 res!156530) b!187920))

(declare-fun m!292295 () Bool)

(assert (=> b!187927 m!292295))

(declare-fun m!292297 () Bool)

(assert (=> b!187921 m!292297))

(assert (=> b!187921 m!291429))

(declare-fun m!292299 () Bool)

(assert (=> b!187928 m!292299))

(declare-fun m!292301 () Bool)

(assert (=> b!187928 m!292301))

(declare-fun m!292303 () Bool)

(assert (=> b!187928 m!292303))

(declare-fun m!292305 () Bool)

(assert (=> b!187928 m!292305))

(declare-fun m!292307 () Bool)

(assert (=> b!187928 m!292307))

(declare-fun m!292309 () Bool)

(assert (=> b!187928 m!292309))

(declare-fun m!292311 () Bool)

(assert (=> b!187928 m!292311))

(assert (=> b!187928 m!291429))

(declare-fun m!292313 () Bool)

(assert (=> b!187928 m!292313))

(declare-fun m!292315 () Bool)

(assert (=> b!187928 m!292315))

(declare-fun m!292317 () Bool)

(assert (=> b!187928 m!292317))

(declare-fun m!292319 () Bool)

(assert (=> b!187928 m!292319))

(declare-fun m!292321 () Bool)

(assert (=> b!187928 m!292321))

(declare-fun m!292323 () Bool)

(assert (=> b!187928 m!292323))

(declare-fun m!292325 () Bool)

(assert (=> b!187928 m!292325))

(declare-fun m!292327 () Bool)

(assert (=> b!187928 m!292327))

(declare-fun m!292329 () Bool)

(assert (=> b!187928 m!292329))

(declare-fun m!292331 () Bool)

(assert (=> b!187928 m!292331))

(declare-fun m!292333 () Bool)

(assert (=> b!187928 m!292333))

(declare-fun m!292335 () Bool)

(assert (=> b!187928 m!292335))

(declare-fun m!292337 () Bool)

(assert (=> b!187928 m!292337))

(declare-fun m!292339 () Bool)

(assert (=> b!187928 m!292339))

(declare-fun m!292341 () Bool)

(assert (=> b!187928 m!292341))

(declare-fun m!292343 () Bool)

(assert (=> b!187928 m!292343))

(assert (=> b!187928 m!292315))

(declare-fun m!292345 () Bool)

(assert (=> b!187928 m!292345))

(declare-fun m!292347 () Bool)

(assert (=> b!187928 m!292347))

(declare-fun m!292349 () Bool)

(assert (=> b!187928 m!292349))

(declare-fun m!292351 () Bool)

(assert (=> b!187928 m!292351))

(declare-fun m!292353 () Bool)

(assert (=> b!187928 m!292353))

(declare-fun m!292355 () Bool)

(assert (=> b!187928 m!292355))

(declare-fun m!292357 () Bool)

(assert (=> b!187928 m!292357))

(declare-fun m!292359 () Bool)

(assert (=> b!187928 m!292359))

(declare-fun m!292361 () Bool)

(assert (=> b!187928 m!292361))

(declare-fun m!292363 () Bool)

(assert (=> b!187930 m!292363))

(declare-fun m!292365 () Bool)

(assert (=> b!187930 m!292365))

(assert (=> b!187930 m!292331))

(declare-fun m!292367 () Bool)

(assert (=> b!187930 m!292367))

(declare-fun m!292369 () Bool)

(assert (=> b!187930 m!292369))

(assert (=> b!187930 m!292319))

(declare-fun m!292371 () Bool)

(assert (=> b!187932 m!292371))

(assert (=> b!187932 m!291429))

(declare-fun m!292373 () Bool)

(assert (=> d!64823 m!292373))

(assert (=> b!187924 m!291927))

(declare-fun m!292375 () Bool)

(assert (=> bm!3017 m!292375))

(declare-fun m!292377 () Bool)

(assert (=> b!187918 m!292377))

(declare-fun m!292379 () Bool)

(assert (=> b!187926 m!292379))

(declare-fun m!292381 () Bool)

(assert (=> b!187922 m!292381))

(assert (=> b!187922 m!292381))

(declare-fun m!292383 () Bool)

(assert (=> b!187922 m!292383))

(declare-fun m!292385 () Bool)

(assert (=> b!187923 m!292385))

(assert (=> b!187923 m!292371))

(assert (=> b!187441 d!64823))

(assert (=> b!187442 d!64739))

(push 1)

(assert (not d!64753))

(assert (not d!64787))

(assert (not d!64805))

(assert (not d!64809))

(assert (not d!64769))

(assert (not d!64807))

(assert (not b!187921))

(assert (not d!64747))

(assert (not d!64777))

(assert (not d!64781))

(assert (not b!187656))

(assert (not d!64785))

(assert (not b!187714))

(assert (not d!64741))

(assert (not b!187926))

(assert (not b!187658))

(assert (not d!64791))

(assert (not b!187924))

(assert (not b!187928))

(assert (not d!64793))

(assert (not b!187713))

(assert (not b!187659))

(assert (not d!64821))

(assert (not d!64823))

(assert (not d!64771))

(assert (not d!64803))

(assert (not d!64783))

(assert (not b!187932))

(assert (not b!187740))

(assert (not b!187743))

(assert (not b!187708))

(assert (not b!187739))

(assert (not d!64789))

(assert (not d!64761))

(assert (not d!64763))

(assert (not b!187726))

(assert (not d!64799))

(assert (not d!64817))

(assert (not b!187707))

(assert (not b!187711))

(assert (not d!64801))

(assert (not b!187738))

(assert (not b!187745))

(assert (not b!187930))

(assert (not b!187709))

(assert (not bm!3017))

(assert (not b!187922))

(assert (not b!187918))

(assert (not b!187661))

(assert (not b!187712))

(assert (not b!187737))

(assert (not b!187923))

(assert (not d!64815))

(assert (not d!64737))

(assert (not b!187927))

(assert (not d!64797))

(assert (not d!64779))

(assert (not d!64767))

(assert (not b!187716))

(assert (not d!64813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

