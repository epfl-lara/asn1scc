; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27122 () Bool)

(assert start!27122)

(declare-fun b!139499 () Bool)

(declare-fun e!92937 () Bool)

(declare-fun e!92943 () Bool)

(assert (=> b!139499 (= e!92937 e!92943)))

(declare-fun res!116289 () Bool)

(assert (=> b!139499 (=> (not res!116289) (not e!92943))))

(declare-fun lt!217382 () (_ BitVec 64))

(declare-datatypes ((array!6366 0))(
  ( (array!6367 (arr!3576 (Array (_ BitVec 32) (_ BitVec 8))) (size!2881 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5026 0))(
  ( (BitStream!5027 (buf!3297 array!6366) (currentByte!6133 (_ BitVec 32)) (currentBit!6128 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8715 0))(
  ( (Unit!8716) )
))
(declare-datatypes ((tuple2!12236 0))(
  ( (tuple2!12237 (_1!6444 Unit!8715) (_2!6444 BitStream!5026)) )
))
(declare-fun lt!217373 () tuple2!12236)

(declare-fun lt!217372 () tuple2!12236)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139499 (= res!116289 (= (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217373))) (currentByte!6133 (_2!6444 lt!217373)) (currentBit!6128 (_2!6444 lt!217373))) (bvadd (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217372))) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217382))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!139499 (= lt!217382 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!139500 () Bool)

(declare-fun res!116295 () Bool)

(declare-fun e!92934 () Bool)

(assert (=> b!139500 (=> (not res!116295) (not e!92934))))

(assert (=> b!139500 (= res!116295 (bvslt from!447 to!404))))

(declare-fun b!139501 () Bool)

(declare-fun e!92941 () Bool)

(declare-datatypes ((tuple2!12238 0))(
  ( (tuple2!12239 (_1!6445 BitStream!5026) (_2!6445 (_ BitVec 8))) )
))
(declare-fun lt!217366 () tuple2!12238)

(declare-fun lt!217386 () tuple2!12238)

(assert (=> b!139501 (= e!92941 (= (_2!6445 lt!217366) (_2!6445 lt!217386)))))

(declare-fun b!139502 () Bool)

(declare-fun e!92942 () Bool)

(declare-fun thiss!1634 () BitStream!5026)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139502 (= e!92942 (invariant!0 (currentBit!6128 thiss!1634) (currentByte!6133 thiss!1634) (size!2881 (buf!3297 (_2!6444 lt!217372)))))))

(declare-fun b!139503 () Bool)

(declare-fun e!92938 () Bool)

(declare-fun array_inv!2670 (array!6366) Bool)

(assert (=> b!139503 (= e!92938 (array_inv!2670 (buf!3297 thiss!1634)))))

(declare-fun b!139504 () Bool)

(declare-fun res!116294 () Bool)

(assert (=> b!139504 (=> (not res!116294) (not e!92934))))

(assert (=> b!139504 (= res!116294 (invariant!0 (currentBit!6128 thiss!1634) (currentByte!6133 thiss!1634) (size!2881 (buf!3297 thiss!1634))))))

(declare-fun res!116284 () Bool)

(assert (=> start!27122 (=> (not res!116284) (not e!92934))))

(declare-fun arr!237 () array!6366)

(assert (=> start!27122 (= res!116284 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2881 arr!237))))))

(assert (=> start!27122 e!92934))

(assert (=> start!27122 true))

(assert (=> start!27122 (array_inv!2670 arr!237)))

(declare-fun inv!12 (BitStream!5026) Bool)

(assert (=> start!27122 (and (inv!12 thiss!1634) e!92938)))

(declare-datatypes ((tuple2!12240 0))(
  ( (tuple2!12241 (_1!6446 BitStream!5026) (_2!6446 BitStream!5026)) )
))
(declare-fun lt!217371 () tuple2!12240)

(declare-fun lt!217365 () tuple2!12238)

(declare-fun b!139505 () Bool)

(declare-fun e!92936 () Bool)

(assert (=> b!139505 (= e!92936 (and (= (_2!6445 lt!217365) (select (arr!3576 arr!237) from!447)) (= (_1!6445 lt!217365) (_2!6446 lt!217371))))))

(declare-fun readBytePure!0 (BitStream!5026) tuple2!12238)

(assert (=> b!139505 (= lt!217365 (readBytePure!0 (_1!6446 lt!217371)))))

(declare-fun reader!0 (BitStream!5026 BitStream!5026) tuple2!12240)

(assert (=> b!139505 (= lt!217371 (reader!0 thiss!1634 (_2!6444 lt!217372)))))

(declare-fun e!92940 () Bool)

(declare-datatypes ((tuple2!12242 0))(
  ( (tuple2!12243 (_1!6447 BitStream!5026) (_2!6447 array!6366)) )
))
(declare-fun lt!217378 () tuple2!12242)

(declare-fun b!139506 () Bool)

(declare-fun arrayRangesEq!245 (array!6366 array!6366 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139506 (= e!92940 (not (arrayRangesEq!245 arr!237 (_2!6447 lt!217378) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!139507 () Bool)

(assert (=> b!139507 (= e!92943 (not e!92940))))

(declare-fun res!116286 () Bool)

(assert (=> b!139507 (=> res!116286 e!92940)))

(declare-fun lt!217367 () tuple2!12240)

(assert (=> b!139507 (= res!116286 (or (not (= (size!2881 (_2!6447 lt!217378)) (size!2881 arr!237))) (not (= (_1!6447 lt!217378) (_2!6446 lt!217367)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5026 array!6366 (_ BitVec 32) (_ BitVec 32)) tuple2!12242)

(assert (=> b!139507 (= lt!217378 (readByteArrayLoopPure!0 (_1!6446 lt!217367) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139507 (validate_offset_bits!1 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) lt!217382)))

(declare-fun lt!217379 () Unit!8715)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5026 array!6366 (_ BitVec 64)) Unit!8715)

(assert (=> b!139507 (= lt!217379 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6444 lt!217372) (buf!3297 (_2!6444 lt!217373)) lt!217382))))

(assert (=> b!139507 (= lt!217367 (reader!0 (_2!6444 lt!217372) (_2!6444 lt!217373)))))

(declare-fun b!139508 () Bool)

(declare-fun res!116290 () Bool)

(assert (=> b!139508 (=> (not res!116290) (not e!92943))))

(declare-fun isPrefixOf!0 (BitStream!5026 BitStream!5026) Bool)

(assert (=> b!139508 (= res!116290 (isPrefixOf!0 (_2!6444 lt!217372) (_2!6444 lt!217373)))))

(declare-fun b!139509 () Bool)

(declare-fun res!116292 () Bool)

(assert (=> b!139509 (=> (not res!116292) (not e!92934))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139509 (= res!116292 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 thiss!1634))) ((_ sign_extend 32) (currentByte!6133 thiss!1634)) ((_ sign_extend 32) (currentBit!6128 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139510 () Bool)

(declare-fun lt!217385 () tuple2!12242)

(declare-fun lt!217383 () tuple2!12242)

(assert (=> b!139510 (= e!92934 (not (arrayRangesEq!245 (_2!6447 lt!217385) (_2!6447 lt!217383) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!217368 () tuple2!12242)

(assert (=> b!139510 (arrayRangesEq!245 (_2!6447 lt!217385) (_2!6447 lt!217368) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!217388 () tuple2!12240)

(declare-fun lt!217374 () Unit!8715)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5026 array!6366 (_ BitVec 32) (_ BitVec 32)) Unit!8715)

(assert (=> b!139510 (= lt!217374 (readByteArrayLoopArrayPrefixLemma!0 (_1!6446 lt!217388) arr!237 from!447 to!404))))

(declare-fun lt!217384 () array!6366)

(declare-fun withMovedByteIndex!0 (BitStream!5026 (_ BitVec 32)) BitStream!5026)

(assert (=> b!139510 (= lt!217368 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6446 lt!217388) #b00000000000000000000000000000001) lt!217384 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!217381 () tuple2!12240)

(assert (=> b!139510 (= lt!217383 (readByteArrayLoopPure!0 (_1!6446 lt!217381) lt!217384 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!217387 () tuple2!12238)

(assert (=> b!139510 (= lt!217384 (array!6367 (store (arr!3576 arr!237) from!447 (_2!6445 lt!217387)) (size!2881 arr!237)))))

(declare-fun lt!217389 () (_ BitVec 32))

(assert (=> b!139510 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) lt!217389)))

(declare-fun lt!217370 () Unit!8715)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5026 array!6366 (_ BitVec 32)) Unit!8715)

(assert (=> b!139510 (= lt!217370 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6444 lt!217372) (buf!3297 (_2!6444 lt!217373)) lt!217389))))

(assert (=> b!139510 (= (_1!6447 lt!217385) (_2!6446 lt!217388))))

(assert (=> b!139510 (= lt!217385 (readByteArrayLoopPure!0 (_1!6446 lt!217388) arr!237 from!447 to!404))))

(assert (=> b!139510 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 thiss!1634)) ((_ sign_extend 32) (currentBit!6128 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!217376 () Unit!8715)

(assert (=> b!139510 (= lt!217376 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3297 (_2!6444 lt!217373)) (bvsub to!404 from!447)))))

(assert (=> b!139510 (= (_2!6445 lt!217387) (select (arr!3576 arr!237) from!447))))

(assert (=> b!139510 (= lt!217387 (readBytePure!0 (_1!6446 lt!217388)))))

(assert (=> b!139510 (= lt!217381 (reader!0 (_2!6444 lt!217372) (_2!6444 lt!217373)))))

(assert (=> b!139510 (= lt!217388 (reader!0 thiss!1634 (_2!6444 lt!217373)))))

(assert (=> b!139510 e!92941))

(declare-fun res!116285 () Bool)

(assert (=> b!139510 (=> (not res!116285) (not e!92941))))

(assert (=> b!139510 (= res!116285 (= (bitIndex!0 (size!2881 (buf!3297 (_1!6445 lt!217366))) (currentByte!6133 (_1!6445 lt!217366)) (currentBit!6128 (_1!6445 lt!217366))) (bitIndex!0 (size!2881 (buf!3297 (_1!6445 lt!217386))) (currentByte!6133 (_1!6445 lt!217386)) (currentBit!6128 (_1!6445 lt!217386)))))))

(declare-fun lt!217375 () Unit!8715)

(declare-fun lt!217380 () BitStream!5026)

(declare-fun readBytePrefixLemma!0 (BitStream!5026 BitStream!5026) Unit!8715)

(assert (=> b!139510 (= lt!217375 (readBytePrefixLemma!0 lt!217380 (_2!6444 lt!217373)))))

(assert (=> b!139510 (= lt!217386 (readBytePure!0 (BitStream!5027 (buf!3297 (_2!6444 lt!217373)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634))))))

(assert (=> b!139510 (= lt!217366 (readBytePure!0 lt!217380))))

(assert (=> b!139510 (= lt!217380 (BitStream!5027 (buf!3297 (_2!6444 lt!217372)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)))))

(assert (=> b!139510 e!92942))

(declare-fun res!116283 () Bool)

(assert (=> b!139510 (=> (not res!116283) (not e!92942))))

(assert (=> b!139510 (= res!116283 (isPrefixOf!0 thiss!1634 (_2!6444 lt!217373)))))

(declare-fun lt!217369 () Unit!8715)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5026 BitStream!5026 BitStream!5026) Unit!8715)

(assert (=> b!139510 (= lt!217369 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6444 lt!217372) (_2!6444 lt!217373)))))

(assert (=> b!139510 e!92937))

(declare-fun res!116293 () Bool)

(assert (=> b!139510 (=> (not res!116293) (not e!92937))))

(assert (=> b!139510 (= res!116293 (= (size!2881 (buf!3297 (_2!6444 lt!217372))) (size!2881 (buf!3297 (_2!6444 lt!217373)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5026 array!6366 (_ BitVec 32) (_ BitVec 32)) tuple2!12236)

(assert (=> b!139510 (= lt!217373 (appendByteArrayLoop!0 (_2!6444 lt!217372) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!139510 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217372)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) lt!217389)))

(assert (=> b!139510 (= lt!217389 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!217377 () Unit!8715)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5026 BitStream!5026 (_ BitVec 64) (_ BitVec 32)) Unit!8715)

(assert (=> b!139510 (= lt!217377 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6444 lt!217372) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!139510 e!92936))

(declare-fun res!116287 () Bool)

(assert (=> b!139510 (=> (not res!116287) (not e!92936))))

(assert (=> b!139510 (= res!116287 (= (size!2881 (buf!3297 thiss!1634)) (size!2881 (buf!3297 (_2!6444 lt!217372)))))))

(declare-fun appendByte!0 (BitStream!5026 (_ BitVec 8)) tuple2!12236)

(assert (=> b!139510 (= lt!217372 (appendByte!0 thiss!1634 (select (arr!3576 arr!237) from!447)))))

(declare-fun b!139511 () Bool)

(declare-fun res!116291 () Bool)

(assert (=> b!139511 (=> (not res!116291) (not e!92936))))

(assert (=> b!139511 (= res!116291 (= (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217372))) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)))))))

(declare-fun b!139512 () Bool)

(declare-fun res!116288 () Bool)

(assert (=> b!139512 (=> (not res!116288) (not e!92936))))

(assert (=> b!139512 (= res!116288 (isPrefixOf!0 thiss!1634 (_2!6444 lt!217372)))))

(assert (= (and start!27122 res!116284) b!139509))

(assert (= (and b!139509 res!116292) b!139500))

(assert (= (and b!139500 res!116295) b!139504))

(assert (= (and b!139504 res!116294) b!139510))

(assert (= (and b!139510 res!116287) b!139511))

(assert (= (and b!139511 res!116291) b!139512))

(assert (= (and b!139512 res!116288) b!139505))

(assert (= (and b!139510 res!116293) b!139499))

(assert (= (and b!139499 res!116289) b!139508))

(assert (= (and b!139508 res!116290) b!139507))

(assert (= (and b!139507 (not res!116286)) b!139506))

(assert (= (and b!139510 res!116283) b!139502))

(assert (= (and b!139510 res!116285) b!139501))

(assert (= start!27122 b!139503))

(declare-fun m!214513 () Bool)

(assert (=> b!139502 m!214513))

(declare-fun m!214515 () Bool)

(assert (=> b!139508 m!214515))

(declare-fun m!214517 () Bool)

(assert (=> b!139510 m!214517))

(declare-fun m!214519 () Bool)

(assert (=> b!139510 m!214519))

(declare-fun m!214521 () Bool)

(assert (=> b!139510 m!214521))

(declare-fun m!214523 () Bool)

(assert (=> b!139510 m!214523))

(declare-fun m!214525 () Bool)

(assert (=> b!139510 m!214525))

(declare-fun m!214527 () Bool)

(assert (=> b!139510 m!214527))

(declare-fun m!214529 () Bool)

(assert (=> b!139510 m!214529))

(declare-fun m!214531 () Bool)

(assert (=> b!139510 m!214531))

(declare-fun m!214533 () Bool)

(assert (=> b!139510 m!214533))

(declare-fun m!214535 () Bool)

(assert (=> b!139510 m!214535))

(declare-fun m!214537 () Bool)

(assert (=> b!139510 m!214537))

(declare-fun m!214539 () Bool)

(assert (=> b!139510 m!214539))

(declare-fun m!214541 () Bool)

(assert (=> b!139510 m!214541))

(declare-fun m!214543 () Bool)

(assert (=> b!139510 m!214543))

(declare-fun m!214545 () Bool)

(assert (=> b!139510 m!214545))

(declare-fun m!214547 () Bool)

(assert (=> b!139510 m!214547))

(declare-fun m!214549 () Bool)

(assert (=> b!139510 m!214549))

(declare-fun m!214551 () Bool)

(assert (=> b!139510 m!214551))

(declare-fun m!214553 () Bool)

(assert (=> b!139510 m!214553))

(declare-fun m!214555 () Bool)

(assert (=> b!139510 m!214555))

(declare-fun m!214557 () Bool)

(assert (=> b!139510 m!214557))

(declare-fun m!214559 () Bool)

(assert (=> b!139510 m!214559))

(declare-fun m!214561 () Bool)

(assert (=> b!139510 m!214561))

(declare-fun m!214563 () Bool)

(assert (=> b!139510 m!214563))

(declare-fun m!214565 () Bool)

(assert (=> b!139510 m!214565))

(declare-fun m!214567 () Bool)

(assert (=> b!139510 m!214567))

(assert (=> b!139510 m!214541))

(declare-fun m!214569 () Bool)

(assert (=> b!139510 m!214569))

(assert (=> b!139510 m!214537))

(assert (=> b!139505 m!214537))

(declare-fun m!214571 () Bool)

(assert (=> b!139505 m!214571))

(declare-fun m!214573 () Bool)

(assert (=> b!139505 m!214573))

(declare-fun m!214575 () Bool)

(assert (=> b!139511 m!214575))

(declare-fun m!214577 () Bool)

(assert (=> b!139511 m!214577))

(declare-fun m!214579 () Bool)

(assert (=> b!139509 m!214579))

(declare-fun m!214581 () Bool)

(assert (=> b!139504 m!214581))

(declare-fun m!214583 () Bool)

(assert (=> b!139503 m!214583))

(declare-fun m!214585 () Bool)

(assert (=> b!139506 m!214585))

(declare-fun m!214587 () Bool)

(assert (=> start!27122 m!214587))

(declare-fun m!214589 () Bool)

(assert (=> start!27122 m!214589))

(declare-fun m!214591 () Bool)

(assert (=> b!139499 m!214591))

(assert (=> b!139499 m!214575))

(declare-fun m!214593 () Bool)

(assert (=> b!139512 m!214593))

(declare-fun m!214595 () Bool)

(assert (=> b!139507 m!214595))

(declare-fun m!214597 () Bool)

(assert (=> b!139507 m!214597))

(declare-fun m!214599 () Bool)

(assert (=> b!139507 m!214599))

(assert (=> b!139507 m!214531))

(push 1)

(assert (not b!139506))

(assert (not b!139507))

(assert (not b!139510))

(assert (not b!139502))

(assert (not b!139509))

(assert (not b!139511))

(assert (not start!27122))

(assert (not b!139508))

(assert (not b!139499))

(assert (not b!139512))

(assert (not b!139505))

(assert (not b!139503))

(assert (not b!139504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44892 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44892 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 thiss!1634))) ((_ sign_extend 32) (currentByte!6133 thiss!1634)) ((_ sign_extend 32) (currentBit!6128 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2881 (buf!3297 thiss!1634))) ((_ sign_extend 32) (currentByte!6133 thiss!1634)) ((_ sign_extend 32) (currentBit!6128 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11004 () Bool)

(assert (= bs!11004 d!44892))

(declare-fun m!214975 () Bool)

(assert (=> bs!11004 m!214975))

(assert (=> b!139509 d!44892))

(declare-fun d!44894 () Bool)

(declare-fun res!116466 () Bool)

(declare-fun e!93063 () Bool)

(assert (=> d!44894 (=> (not res!116466) (not e!93063))))

(assert (=> d!44894 (= res!116466 (= (size!2881 (buf!3297 (_2!6444 lt!217372))) (size!2881 (buf!3297 (_2!6444 lt!217373)))))))

(assert (=> d!44894 (= (isPrefixOf!0 (_2!6444 lt!217372) (_2!6444 lt!217373)) e!93063)))

(declare-fun b!139697 () Bool)

(declare-fun res!116464 () Bool)

(assert (=> b!139697 (=> (not res!116464) (not e!93063))))

(assert (=> b!139697 (= res!116464 (bvsle (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217372))) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372))) (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217373))) (currentByte!6133 (_2!6444 lt!217373)) (currentBit!6128 (_2!6444 lt!217373)))))))

(declare-fun b!139698 () Bool)

(declare-fun e!93064 () Bool)

(assert (=> b!139698 (= e!93063 e!93064)))

(declare-fun res!116465 () Bool)

(assert (=> b!139698 (=> res!116465 e!93064)))

(assert (=> b!139698 (= res!116465 (= (size!2881 (buf!3297 (_2!6444 lt!217372))) #b00000000000000000000000000000000))))

(declare-fun b!139699 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6366 array!6366 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139699 (= e!93064 (arrayBitRangesEq!0 (buf!3297 (_2!6444 lt!217372)) (buf!3297 (_2!6444 lt!217373)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217372))) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372)))))))

(assert (= (and d!44894 res!116466) b!139697))

(assert (= (and b!139697 res!116464) b!139698))

(assert (= (and b!139698 (not res!116465)) b!139699))

(assert (=> b!139697 m!214575))

(assert (=> b!139697 m!214591))

(assert (=> b!139699 m!214575))

(assert (=> b!139699 m!214575))

(declare-fun m!214977 () Bool)

(assert (=> b!139699 m!214977))

(assert (=> b!139508 d!44894))

(declare-datatypes ((tuple3!532 0))(
  ( (tuple3!533 (_1!6458 Unit!8715) (_2!6458 BitStream!5026) (_3!327 array!6366)) )
))
(declare-fun lt!217781 () tuple3!532)

(declare-fun d!44896 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5026 array!6366 (_ BitVec 32) (_ BitVec 32)) tuple3!532)

(assert (=> d!44896 (= lt!217781 (readByteArrayLoop!0 (_1!6446 lt!217367) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44896 (= (readByteArrayLoopPure!0 (_1!6446 lt!217367) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12243 (_2!6458 lt!217781) (_3!327 lt!217781)))))

(declare-fun bs!11005 () Bool)

(assert (= bs!11005 d!44896))

(declare-fun m!214979 () Bool)

(assert (=> bs!11005 m!214979))

(assert (=> b!139507 d!44896))

(declare-fun d!44898 () Bool)

(assert (=> d!44898 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) lt!217382) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372)))) lt!217382))))

(declare-fun bs!11006 () Bool)

(assert (= bs!11006 d!44898))

(declare-fun m!214981 () Bool)

(assert (=> bs!11006 m!214981))

(assert (=> b!139507 d!44898))

(declare-fun d!44900 () Bool)

(assert (=> d!44900 (validate_offset_bits!1 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) lt!217382)))

(declare-fun lt!217784 () Unit!8715)

(declare-fun choose!9 (BitStream!5026 array!6366 (_ BitVec 64) BitStream!5026) Unit!8715)

(assert (=> d!44900 (= lt!217784 (choose!9 (_2!6444 lt!217372) (buf!3297 (_2!6444 lt!217373)) lt!217382 (BitStream!5027 (buf!3297 (_2!6444 lt!217373)) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372)))))))

(assert (=> d!44900 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6444 lt!217372) (buf!3297 (_2!6444 lt!217373)) lt!217382) lt!217784)))

(declare-fun bs!11007 () Bool)

(assert (= bs!11007 d!44900))

(assert (=> bs!11007 m!214597))

(declare-fun m!214983 () Bool)

(assert (=> bs!11007 m!214983))

(assert (=> b!139507 d!44900))

(declare-fun b!139710 () Bool)

(declare-fun res!116475 () Bool)

(declare-fun e!93070 () Bool)

(assert (=> b!139710 (=> (not res!116475) (not e!93070))))

(declare-fun lt!217830 () tuple2!12240)

(assert (=> b!139710 (= res!116475 (isPrefixOf!0 (_2!6446 lt!217830) (_2!6444 lt!217373)))))

(declare-fun b!139711 () Bool)

(declare-fun lt!217841 () (_ BitVec 64))

(declare-fun lt!217825 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5026 (_ BitVec 64)) BitStream!5026)

(assert (=> b!139711 (= e!93070 (= (_1!6446 lt!217830) (withMovedBitIndex!0 (_2!6446 lt!217830) (bvsub lt!217825 lt!217841))))))

(assert (=> b!139711 (or (= (bvand lt!217825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217825 lt!217841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139711 (= lt!217841 (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217373))) (currentByte!6133 (_2!6444 lt!217373)) (currentBit!6128 (_2!6444 lt!217373))))))

(assert (=> b!139711 (= lt!217825 (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217372))) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372))))))

(declare-fun b!139712 () Bool)

(declare-fun e!93069 () Unit!8715)

(declare-fun Unit!8724 () Unit!8715)

(assert (=> b!139712 (= e!93069 Unit!8724)))

(declare-fun b!139713 () Bool)

(declare-fun lt!217829 () Unit!8715)

(assert (=> b!139713 (= e!93069 lt!217829)))

(declare-fun lt!217844 () (_ BitVec 64))

(assert (=> b!139713 (= lt!217844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217835 () (_ BitVec 64))

(assert (=> b!139713 (= lt!217835 (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217372))) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6366 array!6366 (_ BitVec 64) (_ BitVec 64)) Unit!8715)

(assert (=> b!139713 (= lt!217829 (arrayBitRangesEqSymmetric!0 (buf!3297 (_2!6444 lt!217372)) (buf!3297 (_2!6444 lt!217373)) lt!217844 lt!217835))))

(assert (=> b!139713 (arrayBitRangesEq!0 (buf!3297 (_2!6444 lt!217373)) (buf!3297 (_2!6444 lt!217372)) lt!217844 lt!217835)))

(declare-fun b!139714 () Bool)

(declare-fun res!116474 () Bool)

(assert (=> b!139714 (=> (not res!116474) (not e!93070))))

(assert (=> b!139714 (= res!116474 (isPrefixOf!0 (_1!6446 lt!217830) (_2!6444 lt!217372)))))

(declare-fun d!44902 () Bool)

(assert (=> d!44902 e!93070))

(declare-fun res!116473 () Bool)

(assert (=> d!44902 (=> (not res!116473) (not e!93070))))

(assert (=> d!44902 (= res!116473 (isPrefixOf!0 (_1!6446 lt!217830) (_2!6446 lt!217830)))))

(declare-fun lt!217831 () BitStream!5026)

(assert (=> d!44902 (= lt!217830 (tuple2!12241 lt!217831 (_2!6444 lt!217373)))))

(declare-fun lt!217834 () Unit!8715)

(declare-fun lt!217832 () Unit!8715)

(assert (=> d!44902 (= lt!217834 lt!217832)))

(assert (=> d!44902 (isPrefixOf!0 lt!217831 (_2!6444 lt!217373))))

(assert (=> d!44902 (= lt!217832 (lemmaIsPrefixTransitive!0 lt!217831 (_2!6444 lt!217373) (_2!6444 lt!217373)))))

(declare-fun lt!217837 () Unit!8715)

(declare-fun lt!217839 () Unit!8715)

(assert (=> d!44902 (= lt!217837 lt!217839)))

(assert (=> d!44902 (isPrefixOf!0 lt!217831 (_2!6444 lt!217373))))

(assert (=> d!44902 (= lt!217839 (lemmaIsPrefixTransitive!0 lt!217831 (_2!6444 lt!217372) (_2!6444 lt!217373)))))

(declare-fun lt!217843 () Unit!8715)

(assert (=> d!44902 (= lt!217843 e!93069)))

(declare-fun c!7767 () Bool)

(assert (=> d!44902 (= c!7767 (not (= (size!2881 (buf!3297 (_2!6444 lt!217372))) #b00000000000000000000000000000000)))))

(declare-fun lt!217833 () Unit!8715)

(declare-fun lt!217840 () Unit!8715)

(assert (=> d!44902 (= lt!217833 lt!217840)))

(assert (=> d!44902 (isPrefixOf!0 (_2!6444 lt!217373) (_2!6444 lt!217373))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5026) Unit!8715)

(assert (=> d!44902 (= lt!217840 (lemmaIsPrefixRefl!0 (_2!6444 lt!217373)))))

(declare-fun lt!217838 () Unit!8715)

(declare-fun lt!217826 () Unit!8715)

(assert (=> d!44902 (= lt!217838 lt!217826)))

(assert (=> d!44902 (= lt!217826 (lemmaIsPrefixRefl!0 (_2!6444 lt!217373)))))

(declare-fun lt!217836 () Unit!8715)

(declare-fun lt!217842 () Unit!8715)

(assert (=> d!44902 (= lt!217836 lt!217842)))

(assert (=> d!44902 (isPrefixOf!0 lt!217831 lt!217831)))

(assert (=> d!44902 (= lt!217842 (lemmaIsPrefixRefl!0 lt!217831))))

(declare-fun lt!217828 () Unit!8715)

(declare-fun lt!217827 () Unit!8715)

(assert (=> d!44902 (= lt!217828 lt!217827)))

(assert (=> d!44902 (isPrefixOf!0 (_2!6444 lt!217372) (_2!6444 lt!217372))))

(assert (=> d!44902 (= lt!217827 (lemmaIsPrefixRefl!0 (_2!6444 lt!217372)))))

(assert (=> d!44902 (= lt!217831 (BitStream!5027 (buf!3297 (_2!6444 lt!217373)) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372))))))

(assert (=> d!44902 (isPrefixOf!0 (_2!6444 lt!217372) (_2!6444 lt!217373))))

(assert (=> d!44902 (= (reader!0 (_2!6444 lt!217372) (_2!6444 lt!217373)) lt!217830)))

(assert (= (and d!44902 c!7767) b!139713))

(assert (= (and d!44902 (not c!7767)) b!139712))

(assert (= (and d!44902 res!116473) b!139714))

(assert (= (and b!139714 res!116474) b!139710))

(assert (= (and b!139710 res!116475) b!139711))

(declare-fun m!214985 () Bool)

(assert (=> d!44902 m!214985))

(declare-fun m!214987 () Bool)

(assert (=> d!44902 m!214987))

(declare-fun m!214989 () Bool)

(assert (=> d!44902 m!214989))

(declare-fun m!214991 () Bool)

(assert (=> d!44902 m!214991))

(declare-fun m!214993 () Bool)

(assert (=> d!44902 m!214993))

(declare-fun m!214995 () Bool)

(assert (=> d!44902 m!214995))

(declare-fun m!214997 () Bool)

(assert (=> d!44902 m!214997))

(assert (=> d!44902 m!214515))

(declare-fun m!214999 () Bool)

(assert (=> d!44902 m!214999))

(declare-fun m!215001 () Bool)

(assert (=> d!44902 m!215001))

(declare-fun m!215003 () Bool)

(assert (=> d!44902 m!215003))

(assert (=> b!139713 m!214575))

(declare-fun m!215005 () Bool)

(assert (=> b!139713 m!215005))

(declare-fun m!215007 () Bool)

(assert (=> b!139713 m!215007))

(declare-fun m!215009 () Bool)

(assert (=> b!139714 m!215009))

(declare-fun m!215011 () Bool)

(assert (=> b!139711 m!215011))

(assert (=> b!139711 m!214591))

(assert (=> b!139711 m!214575))

(declare-fun m!215013 () Bool)

(assert (=> b!139710 m!215013))

(assert (=> b!139507 d!44902))

(declare-fun d!44904 () Bool)

(declare-fun e!93073 () Bool)

(assert (=> d!44904 e!93073))

(declare-fun res!116480 () Bool)

(assert (=> d!44904 (=> (not res!116480) (not e!93073))))

(declare-fun lt!217860 () (_ BitVec 64))

(declare-fun lt!217862 () (_ BitVec 64))

(declare-fun lt!217859 () (_ BitVec 64))

(assert (=> d!44904 (= res!116480 (= lt!217860 (bvsub lt!217859 lt!217862)))))

(assert (=> d!44904 (or (= (bvand lt!217859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217859 lt!217862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44904 (= lt!217862 (remainingBits!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217372)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372)))))))

(declare-fun lt!217858 () (_ BitVec 64))

(declare-fun lt!217857 () (_ BitVec 64))

(assert (=> d!44904 (= lt!217859 (bvmul lt!217858 lt!217857))))

(assert (=> d!44904 (or (= lt!217858 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217857 (bvsdiv (bvmul lt!217858 lt!217857) lt!217858)))))

(assert (=> d!44904 (= lt!217857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44904 (= lt!217858 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217372)))))))

(assert (=> d!44904 (= lt!217860 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372)))))))

(assert (=> d!44904 (invariant!0 (currentBit!6128 (_2!6444 lt!217372)) (currentByte!6133 (_2!6444 lt!217372)) (size!2881 (buf!3297 (_2!6444 lt!217372))))))

(assert (=> d!44904 (= (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217372))) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372))) lt!217860)))

(declare-fun b!139719 () Bool)

(declare-fun res!116481 () Bool)

(assert (=> b!139719 (=> (not res!116481) (not e!93073))))

(assert (=> b!139719 (= res!116481 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217860))))

(declare-fun b!139720 () Bool)

(declare-fun lt!217861 () (_ BitVec 64))

(assert (=> b!139720 (= e!93073 (bvsle lt!217860 (bvmul lt!217861 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139720 (or (= lt!217861 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217861 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217861)))))

(assert (=> b!139720 (= lt!217861 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217372)))))))

(assert (= (and d!44904 res!116480) b!139719))

(assert (= (and b!139719 res!116481) b!139720))

(declare-fun m!215015 () Bool)

(assert (=> d!44904 m!215015))

(declare-fun m!215017 () Bool)

(assert (=> d!44904 m!215017))

(assert (=> b!139511 d!44904))

(declare-fun d!44906 () Bool)

(declare-fun e!93074 () Bool)

(assert (=> d!44906 e!93074))

(declare-fun res!116482 () Bool)

(assert (=> d!44906 (=> (not res!116482) (not e!93074))))

(declare-fun lt!217866 () (_ BitVec 64))

(declare-fun lt!217868 () (_ BitVec 64))

(declare-fun lt!217865 () (_ BitVec 64))

(assert (=> d!44906 (= res!116482 (= lt!217866 (bvsub lt!217865 lt!217868)))))

(assert (=> d!44906 (or (= (bvand lt!217865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217865 lt!217868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44906 (= lt!217868 (remainingBits!0 ((_ sign_extend 32) (size!2881 (buf!3297 thiss!1634))) ((_ sign_extend 32) (currentByte!6133 thiss!1634)) ((_ sign_extend 32) (currentBit!6128 thiss!1634))))))

(declare-fun lt!217864 () (_ BitVec 64))

(declare-fun lt!217863 () (_ BitVec 64))

(assert (=> d!44906 (= lt!217865 (bvmul lt!217864 lt!217863))))

(assert (=> d!44906 (or (= lt!217864 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217863 (bvsdiv (bvmul lt!217864 lt!217863) lt!217864)))))

(assert (=> d!44906 (= lt!217863 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44906 (= lt!217864 ((_ sign_extend 32) (size!2881 (buf!3297 thiss!1634))))))

(assert (=> d!44906 (= lt!217866 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6133 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6128 thiss!1634))))))

(assert (=> d!44906 (invariant!0 (currentBit!6128 thiss!1634) (currentByte!6133 thiss!1634) (size!2881 (buf!3297 thiss!1634)))))

(assert (=> d!44906 (= (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)) lt!217866)))

(declare-fun b!139721 () Bool)

(declare-fun res!116483 () Bool)

(assert (=> b!139721 (=> (not res!116483) (not e!93074))))

(assert (=> b!139721 (= res!116483 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217866))))

(declare-fun b!139722 () Bool)

(declare-fun lt!217867 () (_ BitVec 64))

(assert (=> b!139722 (= e!93074 (bvsle lt!217866 (bvmul lt!217867 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139722 (or (= lt!217867 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217867 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217867)))))

(assert (=> b!139722 (= lt!217867 ((_ sign_extend 32) (size!2881 (buf!3297 thiss!1634))))))

(assert (= (and d!44906 res!116482) b!139721))

(assert (= (and b!139721 res!116483) b!139722))

(assert (=> d!44906 m!214975))

(assert (=> d!44906 m!214581))

(assert (=> b!139511 d!44906))

(declare-fun d!44908 () Bool)

(assert (=> d!44908 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) lt!217389) (bvsle ((_ sign_extend 32) lt!217389) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11008 () Bool)

(assert (= bs!11008 d!44908))

(assert (=> bs!11008 m!214981))

(assert (=> b!139510 d!44908))

(declare-fun d!44910 () Bool)

(assert (=> d!44910 (isPrefixOf!0 thiss!1634 (_2!6444 lt!217373))))

(declare-fun lt!217871 () Unit!8715)

(declare-fun choose!30 (BitStream!5026 BitStream!5026 BitStream!5026) Unit!8715)

(assert (=> d!44910 (= lt!217871 (choose!30 thiss!1634 (_2!6444 lt!217372) (_2!6444 lt!217373)))))

(assert (=> d!44910 (isPrefixOf!0 thiss!1634 (_2!6444 lt!217372))))

(assert (=> d!44910 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6444 lt!217372) (_2!6444 lt!217373)) lt!217871)))

(declare-fun bs!11009 () Bool)

(assert (= bs!11009 d!44910))

(assert (=> bs!11009 m!214547))

(declare-fun m!215019 () Bool)

(assert (=> bs!11009 m!215019))

(assert (=> bs!11009 m!214593))

(assert (=> b!139510 d!44910))

(declare-fun d!44912 () Bool)

(declare-fun lt!217872 () tuple3!532)

(assert (=> d!44912 (= lt!217872 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6446 lt!217388) #b00000000000000000000000000000001) lt!217384 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44912 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6446 lt!217388) #b00000000000000000000000000000001) lt!217384 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12243 (_2!6458 lt!217872) (_3!327 lt!217872)))))

(declare-fun bs!11010 () Bool)

(assert (= bs!11010 d!44912))

(assert (=> bs!11010 m!214541))

(declare-fun m!215021 () Bool)

(assert (=> bs!11010 m!215021))

(assert (=> b!139510 d!44912))

(declare-fun d!44914 () Bool)

(declare-fun res!116488 () Bool)

(declare-fun e!93079 () Bool)

(assert (=> d!44914 (=> res!116488 e!93079)))

(assert (=> d!44914 (= res!116488 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44914 (= (arrayRangesEq!245 (_2!6447 lt!217385) (_2!6447 lt!217368) #b00000000000000000000000000000000 to!404) e!93079)))

(declare-fun b!139727 () Bool)

(declare-fun e!93080 () Bool)

(assert (=> b!139727 (= e!93079 e!93080)))

(declare-fun res!116489 () Bool)

(assert (=> b!139727 (=> (not res!116489) (not e!93080))))

(assert (=> b!139727 (= res!116489 (= (select (arr!3576 (_2!6447 lt!217385)) #b00000000000000000000000000000000) (select (arr!3576 (_2!6447 lt!217368)) #b00000000000000000000000000000000)))))

(declare-fun b!139728 () Bool)

(assert (=> b!139728 (= e!93080 (arrayRangesEq!245 (_2!6447 lt!217385) (_2!6447 lt!217368) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44914 (not res!116488)) b!139727))

(assert (= (and b!139727 res!116489) b!139728))

(declare-fun m!215023 () Bool)

(assert (=> b!139727 m!215023))

(declare-fun m!215025 () Bool)

(assert (=> b!139727 m!215025))

(declare-fun m!215027 () Bool)

(assert (=> b!139728 m!215027))

(assert (=> b!139510 d!44914))

(declare-fun d!44916 () Bool)

(declare-fun res!116492 () Bool)

(declare-fun e!93081 () Bool)

(assert (=> d!44916 (=> (not res!116492) (not e!93081))))

(assert (=> d!44916 (= res!116492 (= (size!2881 (buf!3297 thiss!1634)) (size!2881 (buf!3297 (_2!6444 lt!217373)))))))

(assert (=> d!44916 (= (isPrefixOf!0 thiss!1634 (_2!6444 lt!217373)) e!93081)))

(declare-fun b!139729 () Bool)

(declare-fun res!116490 () Bool)

(assert (=> b!139729 (=> (not res!116490) (not e!93081))))

(assert (=> b!139729 (= res!116490 (bvsle (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)) (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217373))) (currentByte!6133 (_2!6444 lt!217373)) (currentBit!6128 (_2!6444 lt!217373)))))))

(declare-fun b!139730 () Bool)

(declare-fun e!93082 () Bool)

(assert (=> b!139730 (= e!93081 e!93082)))

(declare-fun res!116491 () Bool)

(assert (=> b!139730 (=> res!116491 e!93082)))

(assert (=> b!139730 (= res!116491 (= (size!2881 (buf!3297 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!139731 () Bool)

(assert (=> b!139731 (= e!93082 (arrayBitRangesEq!0 (buf!3297 thiss!1634) (buf!3297 (_2!6444 lt!217373)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634))))))

(assert (= (and d!44916 res!116492) b!139729))

(assert (= (and b!139729 res!116490) b!139730))

(assert (= (and b!139730 (not res!116491)) b!139731))

(assert (=> b!139729 m!214577))

(assert (=> b!139729 m!214591))

(assert (=> b!139731 m!214577))

(assert (=> b!139731 m!214577))

(declare-fun m!215029 () Bool)

(assert (=> b!139731 m!215029))

(assert (=> b!139510 d!44916))

(declare-fun d!44918 () Bool)

(assert (=> d!44918 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) lt!217389)))

(declare-fun lt!217875 () Unit!8715)

(declare-fun choose!26 (BitStream!5026 array!6366 (_ BitVec 32) BitStream!5026) Unit!8715)

(assert (=> d!44918 (= lt!217875 (choose!26 (_2!6444 lt!217372) (buf!3297 (_2!6444 lt!217373)) lt!217389 (BitStream!5027 (buf!3297 (_2!6444 lt!217373)) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372)))))))

(assert (=> d!44918 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6444 lt!217372) (buf!3297 (_2!6444 lt!217373)) lt!217389) lt!217875)))

(declare-fun bs!11011 () Bool)

(assert (= bs!11011 d!44918))

(assert (=> bs!11011 m!214545))

(declare-fun m!215031 () Bool)

(assert (=> bs!11011 m!215031))

(assert (=> b!139510 d!44918))

(declare-fun d!44920 () Bool)

(declare-datatypes ((tuple2!12262 0))(
  ( (tuple2!12263 (_1!6459 (_ BitVec 8)) (_2!6459 BitStream!5026)) )
))
(declare-fun lt!217878 () tuple2!12262)

(declare-fun readByte!0 (BitStream!5026) tuple2!12262)

(assert (=> d!44920 (= lt!217878 (readByte!0 (BitStream!5027 (buf!3297 (_2!6444 lt!217373)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634))))))

(assert (=> d!44920 (= (readBytePure!0 (BitStream!5027 (buf!3297 (_2!6444 lt!217373)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634))) (tuple2!12239 (_2!6459 lt!217878) (_1!6459 lt!217878)))))

(declare-fun bs!11012 () Bool)

(assert (= bs!11012 d!44920))

(declare-fun m!215033 () Bool)

(assert (=> bs!11012 m!215033))

(assert (=> b!139510 d!44920))

(declare-fun lt!217879 () tuple3!532)

(declare-fun d!44922 () Bool)

(assert (=> d!44922 (= lt!217879 (readByteArrayLoop!0 (_1!6446 lt!217388) arr!237 from!447 to!404))))

(assert (=> d!44922 (= (readByteArrayLoopPure!0 (_1!6446 lt!217388) arr!237 from!447 to!404) (tuple2!12243 (_2!6458 lt!217879) (_3!327 lt!217879)))))

(declare-fun bs!11013 () Bool)

(assert (= bs!11013 d!44922))

(declare-fun m!215035 () Bool)

(assert (=> bs!11013 m!215035))

(assert (=> b!139510 d!44922))

(declare-fun d!44924 () Bool)

(declare-fun lt!217888 () tuple2!12242)

(declare-fun lt!217890 () tuple2!12242)

(assert (=> d!44924 (arrayRangesEq!245 (_2!6447 lt!217888) (_2!6447 lt!217890) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!217891 () Unit!8715)

(declare-fun lt!217889 () BitStream!5026)

(declare-fun choose!35 (BitStream!5026 array!6366 (_ BitVec 32) (_ BitVec 32) tuple2!12242 array!6366 BitStream!5026 tuple2!12242 array!6366) Unit!8715)

(assert (=> d!44924 (= lt!217891 (choose!35 (_1!6446 lt!217388) arr!237 from!447 to!404 lt!217888 (_2!6447 lt!217888) lt!217889 lt!217890 (_2!6447 lt!217890)))))

(assert (=> d!44924 (= lt!217890 (readByteArrayLoopPure!0 lt!217889 (array!6367 (store (arr!3576 arr!237) from!447 (_2!6445 (readBytePure!0 (_1!6446 lt!217388)))) (size!2881 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!44924 (= lt!217889 (withMovedByteIndex!0 (_1!6446 lt!217388) #b00000000000000000000000000000001))))

(assert (=> d!44924 (= lt!217888 (readByteArrayLoopPure!0 (_1!6446 lt!217388) arr!237 from!447 to!404))))

(assert (=> d!44924 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6446 lt!217388) arr!237 from!447 to!404) lt!217891)))

(declare-fun bs!11015 () Bool)

(assert (= bs!11015 d!44924))

(assert (=> bs!11015 m!214527))

(declare-fun m!215037 () Bool)

(assert (=> bs!11015 m!215037))

(assert (=> bs!11015 m!214541))

(declare-fun m!215039 () Bool)

(assert (=> bs!11015 m!215039))

(assert (=> bs!11015 m!214517))

(declare-fun m!215041 () Bool)

(assert (=> bs!11015 m!215041))

(declare-fun m!215043 () Bool)

(assert (=> bs!11015 m!215043))

(assert (=> b!139510 d!44924))

(declare-fun d!44926 () Bool)

(declare-fun e!93085 () Bool)

(assert (=> d!44926 e!93085))

(declare-fun res!116495 () Bool)

(assert (=> d!44926 (=> (not res!116495) (not e!93085))))

(assert (=> d!44926 (= res!116495 (and (or (let ((rhs!3166 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3166 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3166) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!44927 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!44927 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!44927 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3165 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3165 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3165) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!217898 () Unit!8715)

(declare-fun choose!57 (BitStream!5026 BitStream!5026 (_ BitVec 64) (_ BitVec 32)) Unit!8715)

(assert (=> d!44926 (= lt!217898 (choose!57 thiss!1634 (_2!6444 lt!217372) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!44926 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6444 lt!217372) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!217898)))

(declare-fun lt!217900 () (_ BitVec 32))

(declare-fun b!139734 () Bool)

(assert (=> b!139734 (= e!93085 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217372)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) (bvsub (bvsub to!404 from!447) lt!217900)))))

(assert (=> b!139734 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!217900 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!217900) #b10000000000000000000000000000000)))))

(declare-fun lt!217899 () (_ BitVec 64))

(assert (=> b!139734 (= lt!217900 ((_ extract 31 0) lt!217899))))

(assert (=> b!139734 (and (bvslt lt!217899 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!217899 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!139734 (= lt!217899 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!44926 res!116495) b!139734))

(declare-fun m!215045 () Bool)

(assert (=> d!44926 m!215045))

(declare-fun m!215047 () Bool)

(assert (=> b!139734 m!215047))

(assert (=> b!139510 d!44926))

(declare-fun d!44929 () Bool)

(assert (=> d!44929 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 thiss!1634)) ((_ sign_extend 32) (currentBit!6128 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!217901 () Unit!8715)

(assert (=> d!44929 (= lt!217901 (choose!26 thiss!1634 (buf!3297 (_2!6444 lt!217373)) (bvsub to!404 from!447) (BitStream!5027 (buf!3297 (_2!6444 lt!217373)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634))))))

(assert (=> d!44929 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3297 (_2!6444 lt!217373)) (bvsub to!404 from!447)) lt!217901)))

(declare-fun bs!11016 () Bool)

(assert (= bs!11016 d!44929))

(assert (=> bs!11016 m!214549))

(declare-fun m!215049 () Bool)

(assert (=> bs!11016 m!215049))

(assert (=> b!139510 d!44929))

(declare-fun d!44931 () Bool)

(declare-fun e!93088 () Bool)

(assert (=> d!44931 e!93088))

(declare-fun res!116503 () Bool)

(assert (=> d!44931 (=> (not res!116503) (not e!93088))))

(declare-fun lt!217912 () tuple2!12236)

(assert (=> d!44931 (= res!116503 (= (size!2881 (buf!3297 thiss!1634)) (size!2881 (buf!3297 (_2!6444 lt!217912)))))))

(declare-fun choose!6 (BitStream!5026 (_ BitVec 8)) tuple2!12236)

(assert (=> d!44931 (= lt!217912 (choose!6 thiss!1634 (select (arr!3576 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!44931 (validate_offset_byte!0 ((_ sign_extend 32) (size!2881 (buf!3297 thiss!1634))) ((_ sign_extend 32) (currentByte!6133 thiss!1634)) ((_ sign_extend 32) (currentBit!6128 thiss!1634)))))

(assert (=> d!44931 (= (appendByte!0 thiss!1634 (select (arr!3576 arr!237) from!447)) lt!217912)))

(declare-fun b!139741 () Bool)

(declare-fun res!116502 () Bool)

(assert (=> b!139741 (=> (not res!116502) (not e!93088))))

(declare-fun lt!217914 () (_ BitVec 64))

(declare-fun lt!217915 () (_ BitVec 64))

(assert (=> b!139741 (= res!116502 (= (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217912))) (currentByte!6133 (_2!6444 lt!217912)) (currentBit!6128 (_2!6444 lt!217912))) (bvadd lt!217915 lt!217914)))))

(assert (=> b!139741 (or (not (= (bvand lt!217915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217914 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!217915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!217915 lt!217914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139741 (= lt!217914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!139741 (= lt!217915 (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)))))

(declare-fun b!139742 () Bool)

(declare-fun res!116504 () Bool)

(assert (=> b!139742 (=> (not res!116504) (not e!93088))))

(assert (=> b!139742 (= res!116504 (isPrefixOf!0 thiss!1634 (_2!6444 lt!217912)))))

(declare-fun b!139743 () Bool)

(declare-fun lt!217913 () tuple2!12238)

(declare-fun lt!217916 () tuple2!12240)

(assert (=> b!139743 (= e!93088 (and (= (_2!6445 lt!217913) (select (arr!3576 arr!237) from!447)) (= (_1!6445 lt!217913) (_2!6446 lt!217916))))))

(assert (=> b!139743 (= lt!217913 (readBytePure!0 (_1!6446 lt!217916)))))

(assert (=> b!139743 (= lt!217916 (reader!0 thiss!1634 (_2!6444 lt!217912)))))

(assert (= (and d!44931 res!116503) b!139741))

(assert (= (and b!139741 res!116502) b!139742))

(assert (= (and b!139742 res!116504) b!139743))

(assert (=> d!44931 m!214537))

(declare-fun m!215051 () Bool)

(assert (=> d!44931 m!215051))

(declare-fun m!215053 () Bool)

(assert (=> d!44931 m!215053))

(declare-fun m!215055 () Bool)

(assert (=> b!139741 m!215055))

(assert (=> b!139741 m!214577))

(declare-fun m!215057 () Bool)

(assert (=> b!139742 m!215057))

(declare-fun m!215059 () Bool)

(assert (=> b!139743 m!215059))

(declare-fun m!215061 () Bool)

(assert (=> b!139743 m!215061))

(assert (=> b!139510 d!44931))

(declare-fun d!44933 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5026 (_ BitVec 32)) tuple2!12236)

(assert (=> d!44933 (= (withMovedByteIndex!0 (_1!6446 lt!217388) #b00000000000000000000000000000001) (_2!6444 (moveByteIndex!0 (_1!6446 lt!217388) #b00000000000000000000000000000001)))))

(declare-fun bs!11017 () Bool)

(assert (= bs!11017 d!44933))

(declare-fun m!215063 () Bool)

(assert (=> bs!11017 m!215063))

(assert (=> b!139510 d!44933))

(declare-fun d!44935 () Bool)

(declare-fun lt!217917 () tuple2!12262)

(assert (=> d!44935 (= lt!217917 (readByte!0 lt!217380))))

(assert (=> d!44935 (= (readBytePure!0 lt!217380) (tuple2!12239 (_2!6459 lt!217917) (_1!6459 lt!217917)))))

(declare-fun bs!11018 () Bool)

(assert (= bs!11018 d!44935))

(declare-fun m!215065 () Bool)

(assert (=> bs!11018 m!215065))

(assert (=> b!139510 d!44935))

(assert (=> b!139510 d!44902))

(declare-fun d!44937 () Bool)

(declare-fun e!93089 () Bool)

(assert (=> d!44937 e!93089))

(declare-fun res!116505 () Bool)

(assert (=> d!44937 (=> (not res!116505) (not e!93089))))

(declare-fun lt!217923 () (_ BitVec 64))

(declare-fun lt!217921 () (_ BitVec 64))

(declare-fun lt!217920 () (_ BitVec 64))

(assert (=> d!44937 (= res!116505 (= lt!217921 (bvsub lt!217920 lt!217923)))))

(assert (=> d!44937 (or (= (bvand lt!217920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217920 lt!217923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44937 (= lt!217923 (remainingBits!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_1!6445 lt!217366)))) ((_ sign_extend 32) (currentByte!6133 (_1!6445 lt!217366))) ((_ sign_extend 32) (currentBit!6128 (_1!6445 lt!217366)))))))

(declare-fun lt!217919 () (_ BitVec 64))

(declare-fun lt!217918 () (_ BitVec 64))

(assert (=> d!44937 (= lt!217920 (bvmul lt!217919 lt!217918))))

(assert (=> d!44937 (or (= lt!217919 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217918 (bvsdiv (bvmul lt!217919 lt!217918) lt!217919)))))

(assert (=> d!44937 (= lt!217918 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44937 (= lt!217919 ((_ sign_extend 32) (size!2881 (buf!3297 (_1!6445 lt!217366)))))))

(assert (=> d!44937 (= lt!217921 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6133 (_1!6445 lt!217366))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6128 (_1!6445 lt!217366)))))))

(assert (=> d!44937 (invariant!0 (currentBit!6128 (_1!6445 lt!217366)) (currentByte!6133 (_1!6445 lt!217366)) (size!2881 (buf!3297 (_1!6445 lt!217366))))))

(assert (=> d!44937 (= (bitIndex!0 (size!2881 (buf!3297 (_1!6445 lt!217366))) (currentByte!6133 (_1!6445 lt!217366)) (currentBit!6128 (_1!6445 lt!217366))) lt!217921)))

(declare-fun b!139744 () Bool)

(declare-fun res!116506 () Bool)

(assert (=> b!139744 (=> (not res!116506) (not e!93089))))

(assert (=> b!139744 (= res!116506 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217921))))

(declare-fun b!139745 () Bool)

(declare-fun lt!217922 () (_ BitVec 64))

(assert (=> b!139745 (= e!93089 (bvsle lt!217921 (bvmul lt!217922 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139745 (or (= lt!217922 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217922 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217922)))))

(assert (=> b!139745 (= lt!217922 ((_ sign_extend 32) (size!2881 (buf!3297 (_1!6445 lt!217366)))))))

(assert (= (and d!44937 res!116505) b!139744))

(assert (= (and b!139744 res!116506) b!139745))

(declare-fun m!215067 () Bool)

(assert (=> d!44937 m!215067))

(declare-fun m!215069 () Bool)

(assert (=> d!44937 m!215069))

(assert (=> b!139510 d!44937))

(declare-fun d!44939 () Bool)

(assert (=> d!44939 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217372)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) lt!217389) (bvsle ((_ sign_extend 32) lt!217389) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217372)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11019 () Bool)

(assert (= bs!11019 d!44939))

(assert (=> bs!11019 m!215015))

(assert (=> b!139510 d!44939))

(declare-fun d!44941 () Bool)

(declare-fun lt!217924 () tuple2!12262)

(assert (=> d!44941 (= lt!217924 (readByte!0 (_1!6446 lt!217388)))))

(assert (=> d!44941 (= (readBytePure!0 (_1!6446 lt!217388)) (tuple2!12239 (_2!6459 lt!217924) (_1!6459 lt!217924)))))

(declare-fun bs!11020 () Bool)

(assert (= bs!11020 d!44941))

(declare-fun m!215071 () Bool)

(assert (=> bs!11020 m!215071))

(assert (=> b!139510 d!44941))

(declare-fun d!44943 () Bool)

(declare-fun e!93090 () Bool)

(assert (=> d!44943 e!93090))

(declare-fun res!116507 () Bool)

(assert (=> d!44943 (=> (not res!116507) (not e!93090))))

(declare-fun lt!217927 () (_ BitVec 64))

(declare-fun lt!217930 () (_ BitVec 64))

(declare-fun lt!217928 () (_ BitVec 64))

(assert (=> d!44943 (= res!116507 (= lt!217928 (bvsub lt!217927 lt!217930)))))

(assert (=> d!44943 (or (= (bvand lt!217927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217930 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217927 lt!217930) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44943 (= lt!217930 (remainingBits!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_1!6445 lt!217386)))) ((_ sign_extend 32) (currentByte!6133 (_1!6445 lt!217386))) ((_ sign_extend 32) (currentBit!6128 (_1!6445 lt!217386)))))))

(declare-fun lt!217926 () (_ BitVec 64))

(declare-fun lt!217925 () (_ BitVec 64))

(assert (=> d!44943 (= lt!217927 (bvmul lt!217926 lt!217925))))

(assert (=> d!44943 (or (= lt!217926 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217925 (bvsdiv (bvmul lt!217926 lt!217925) lt!217926)))))

(assert (=> d!44943 (= lt!217925 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44943 (= lt!217926 ((_ sign_extend 32) (size!2881 (buf!3297 (_1!6445 lt!217386)))))))

(assert (=> d!44943 (= lt!217928 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6133 (_1!6445 lt!217386))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6128 (_1!6445 lt!217386)))))))

(assert (=> d!44943 (invariant!0 (currentBit!6128 (_1!6445 lt!217386)) (currentByte!6133 (_1!6445 lt!217386)) (size!2881 (buf!3297 (_1!6445 lt!217386))))))

(assert (=> d!44943 (= (bitIndex!0 (size!2881 (buf!3297 (_1!6445 lt!217386))) (currentByte!6133 (_1!6445 lt!217386)) (currentBit!6128 (_1!6445 lt!217386))) lt!217928)))

(declare-fun b!139746 () Bool)

(declare-fun res!116508 () Bool)

(assert (=> b!139746 (=> (not res!116508) (not e!93090))))

(assert (=> b!139746 (= res!116508 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217928))))

(declare-fun b!139747 () Bool)

(declare-fun lt!217929 () (_ BitVec 64))

(assert (=> b!139747 (= e!93090 (bvsle lt!217928 (bvmul lt!217929 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139747 (or (= lt!217929 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217929 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217929)))))

(assert (=> b!139747 (= lt!217929 ((_ sign_extend 32) (size!2881 (buf!3297 (_1!6445 lt!217386)))))))

(assert (= (and d!44943 res!116507) b!139746))

(assert (= (and b!139746 res!116508) b!139747))

(declare-fun m!215073 () Bool)

(assert (=> d!44943 m!215073))

(declare-fun m!215075 () Bool)

(assert (=> d!44943 m!215075))

(assert (=> b!139510 d!44943))

(declare-fun d!44945 () Bool)

(declare-fun res!116509 () Bool)

(declare-fun e!93091 () Bool)

(assert (=> d!44945 (=> res!116509 e!93091)))

(assert (=> d!44945 (= res!116509 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44945 (= (arrayRangesEq!245 (_2!6447 lt!217385) (_2!6447 lt!217383) #b00000000000000000000000000000000 to!404) e!93091)))

(declare-fun b!139748 () Bool)

(declare-fun e!93092 () Bool)

(assert (=> b!139748 (= e!93091 e!93092)))

(declare-fun res!116510 () Bool)

(assert (=> b!139748 (=> (not res!116510) (not e!93092))))

(assert (=> b!139748 (= res!116510 (= (select (arr!3576 (_2!6447 lt!217385)) #b00000000000000000000000000000000) (select (arr!3576 (_2!6447 lt!217383)) #b00000000000000000000000000000000)))))

(declare-fun b!139749 () Bool)

(assert (=> b!139749 (= e!93092 (arrayRangesEq!245 (_2!6447 lt!217385) (_2!6447 lt!217383) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44945 (not res!116509)) b!139748))

(assert (= (and b!139748 res!116510) b!139749))

(assert (=> b!139748 m!215023))

(declare-fun m!215077 () Bool)

(assert (=> b!139748 m!215077))

(declare-fun m!215079 () Bool)

(assert (=> b!139749 m!215079))

(assert (=> b!139510 d!44945))

(declare-fun b!139760 () Bool)

(declare-fun e!93101 () Bool)

(declare-fun e!93099 () Bool)

(assert (=> b!139760 (= e!93101 e!93099)))

(declare-fun res!116523 () Bool)

(assert (=> b!139760 (=> (not res!116523) (not e!93099))))

(declare-fun lt!217956 () tuple2!12242)

(declare-fun lt!217953 () tuple2!12240)

(assert (=> b!139760 (= res!116523 (and (= (size!2881 (_2!6447 lt!217956)) (size!2881 arr!237)) (= (_1!6447 lt!217956) (_2!6446 lt!217953))))))

(assert (=> b!139760 (= lt!217956 (readByteArrayLoopPure!0 (_1!6446 lt!217953) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!217955 () Unit!8715)

(declare-fun lt!217954 () Unit!8715)

(assert (=> b!139760 (= lt!217955 lt!217954)))

(declare-fun lt!217952 () tuple2!12236)

(declare-fun lt!217950 () (_ BitVec 64))

(assert (=> b!139760 (validate_offset_bits!1 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217952)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) lt!217950)))

(assert (=> b!139760 (= lt!217954 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6444 lt!217372) (buf!3297 (_2!6444 lt!217952)) lt!217950))))

(declare-fun e!93100 () Bool)

(assert (=> b!139760 e!93100))

(declare-fun res!116522 () Bool)

(assert (=> b!139760 (=> (not res!116522) (not e!93100))))

(assert (=> b!139760 (= res!116522 (and (= (size!2881 (buf!3297 (_2!6444 lt!217372))) (size!2881 (buf!3297 (_2!6444 lt!217952)))) (bvsge lt!217950 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139760 (= lt!217950 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!139760 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!139760 (= lt!217953 (reader!0 (_2!6444 lt!217372) (_2!6444 lt!217952)))))

(declare-fun b!139761 () Bool)

(declare-fun res!116525 () Bool)

(assert (=> b!139761 (=> (not res!116525) (not e!93101))))

(assert (=> b!139761 (= res!116525 (isPrefixOf!0 (_2!6444 lt!217372) (_2!6444 lt!217952)))))

(declare-fun b!139762 () Bool)

(assert (=> b!139762 (= e!93100 (validate_offset_bits!1 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217372)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217372))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217372))) lt!217950))))

(declare-fun b!139764 () Bool)

(assert (=> b!139764 (= e!93099 (arrayRangesEq!245 arr!237 (_2!6447 lt!217956) #b00000000000000000000000000000000 to!404))))

(declare-fun b!139763 () Bool)

(declare-fun res!116521 () Bool)

(assert (=> b!139763 (=> (not res!116521) (not e!93101))))

(declare-fun lt!217949 () (_ BitVec 64))

(declare-fun lt!217951 () (_ BitVec 64))

(assert (=> b!139763 (= res!116521 (= (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217952))) (currentByte!6133 (_2!6444 lt!217952)) (currentBit!6128 (_2!6444 lt!217952))) (bvadd lt!217949 lt!217951)))))

(assert (=> b!139763 (or (not (= (bvand lt!217949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217951 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!217949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!217949 lt!217951) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!217957 () (_ BitVec 64))

(assert (=> b!139763 (= lt!217951 (bvmul lt!217957 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!139763 (or (= lt!217957 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217957 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217957)))))

(assert (=> b!139763 (= lt!217957 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!139763 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!139763 (= lt!217949 (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217372))) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372))))))

(declare-fun d!44947 () Bool)

(assert (=> d!44947 e!93101))

(declare-fun res!116524 () Bool)

(assert (=> d!44947 (=> (not res!116524) (not e!93101))))

(assert (=> d!44947 (= res!116524 (= (size!2881 (buf!3297 (_2!6444 lt!217372))) (size!2881 (buf!3297 (_2!6444 lt!217952)))))))

(declare-fun choose!64 (BitStream!5026 array!6366 (_ BitVec 32) (_ BitVec 32)) tuple2!12236)

(assert (=> d!44947 (= lt!217952 (choose!64 (_2!6444 lt!217372) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44947 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2881 arr!237)))))

(assert (=> d!44947 (= (appendByteArrayLoop!0 (_2!6444 lt!217372) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!217952)))

(assert (= (and d!44947 res!116524) b!139763))

(assert (= (and b!139763 res!116521) b!139761))

(assert (= (and b!139761 res!116525) b!139760))

(assert (= (and b!139760 res!116522) b!139762))

(assert (= (and b!139760 res!116523) b!139764))

(declare-fun m!215081 () Bool)

(assert (=> d!44947 m!215081))

(declare-fun m!215083 () Bool)

(assert (=> b!139762 m!215083))

(declare-fun m!215085 () Bool)

(assert (=> b!139763 m!215085))

(assert (=> b!139763 m!214575))

(declare-fun m!215087 () Bool)

(assert (=> b!139761 m!215087))

(declare-fun m!215089 () Bool)

(assert (=> b!139760 m!215089))

(declare-fun m!215091 () Bool)

(assert (=> b!139760 m!215091))

(declare-fun m!215093 () Bool)

(assert (=> b!139760 m!215093))

(declare-fun m!215095 () Bool)

(assert (=> b!139760 m!215095))

(declare-fun m!215097 () Bool)

(assert (=> b!139764 m!215097))

(assert (=> b!139510 d!44947))

(declare-fun d!44949 () Bool)

(assert (=> d!44949 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 thiss!1634)) ((_ sign_extend 32) (currentBit!6128 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 thiss!1634)) ((_ sign_extend 32) (currentBit!6128 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11021 () Bool)

(assert (= bs!11021 d!44949))

(declare-fun m!215099 () Bool)

(assert (=> bs!11021 m!215099))

(assert (=> b!139510 d!44949))

(declare-fun b!139765 () Bool)

(declare-fun res!116528 () Bool)

(declare-fun e!93103 () Bool)

(assert (=> b!139765 (=> (not res!116528) (not e!93103))))

(declare-fun lt!217963 () tuple2!12240)

(assert (=> b!139765 (= res!116528 (isPrefixOf!0 (_2!6446 lt!217963) (_2!6444 lt!217373)))))

(declare-fun lt!217974 () (_ BitVec 64))

(declare-fun lt!217958 () (_ BitVec 64))

(declare-fun b!139766 () Bool)

(assert (=> b!139766 (= e!93103 (= (_1!6446 lt!217963) (withMovedBitIndex!0 (_2!6446 lt!217963) (bvsub lt!217958 lt!217974))))))

(assert (=> b!139766 (or (= (bvand lt!217958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217974 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217958 lt!217974) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139766 (= lt!217974 (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217373))) (currentByte!6133 (_2!6444 lt!217373)) (currentBit!6128 (_2!6444 lt!217373))))))

(assert (=> b!139766 (= lt!217958 (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)))))

(declare-fun b!139767 () Bool)

(declare-fun e!93102 () Unit!8715)

(declare-fun Unit!8725 () Unit!8715)

(assert (=> b!139767 (= e!93102 Unit!8725)))

(declare-fun b!139768 () Bool)

(declare-fun lt!217962 () Unit!8715)

(assert (=> b!139768 (= e!93102 lt!217962)))

(declare-fun lt!217977 () (_ BitVec 64))

(assert (=> b!139768 (= lt!217977 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217968 () (_ BitVec 64))

(assert (=> b!139768 (= lt!217968 (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)))))

(assert (=> b!139768 (= lt!217962 (arrayBitRangesEqSymmetric!0 (buf!3297 thiss!1634) (buf!3297 (_2!6444 lt!217373)) lt!217977 lt!217968))))

(assert (=> b!139768 (arrayBitRangesEq!0 (buf!3297 (_2!6444 lt!217373)) (buf!3297 thiss!1634) lt!217977 lt!217968)))

(declare-fun b!139769 () Bool)

(declare-fun res!116527 () Bool)

(assert (=> b!139769 (=> (not res!116527) (not e!93103))))

(assert (=> b!139769 (= res!116527 (isPrefixOf!0 (_1!6446 lt!217963) thiss!1634))))

(declare-fun d!44951 () Bool)

(assert (=> d!44951 e!93103))

(declare-fun res!116526 () Bool)

(assert (=> d!44951 (=> (not res!116526) (not e!93103))))

(assert (=> d!44951 (= res!116526 (isPrefixOf!0 (_1!6446 lt!217963) (_2!6446 lt!217963)))))

(declare-fun lt!217964 () BitStream!5026)

(assert (=> d!44951 (= lt!217963 (tuple2!12241 lt!217964 (_2!6444 lt!217373)))))

(declare-fun lt!217967 () Unit!8715)

(declare-fun lt!217965 () Unit!8715)

(assert (=> d!44951 (= lt!217967 lt!217965)))

(assert (=> d!44951 (isPrefixOf!0 lt!217964 (_2!6444 lt!217373))))

(assert (=> d!44951 (= lt!217965 (lemmaIsPrefixTransitive!0 lt!217964 (_2!6444 lt!217373) (_2!6444 lt!217373)))))

(declare-fun lt!217970 () Unit!8715)

(declare-fun lt!217972 () Unit!8715)

(assert (=> d!44951 (= lt!217970 lt!217972)))

(assert (=> d!44951 (isPrefixOf!0 lt!217964 (_2!6444 lt!217373))))

(assert (=> d!44951 (= lt!217972 (lemmaIsPrefixTransitive!0 lt!217964 thiss!1634 (_2!6444 lt!217373)))))

(declare-fun lt!217976 () Unit!8715)

(assert (=> d!44951 (= lt!217976 e!93102)))

(declare-fun c!7768 () Bool)

(assert (=> d!44951 (= c!7768 (not (= (size!2881 (buf!3297 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!217966 () Unit!8715)

(declare-fun lt!217973 () Unit!8715)

(assert (=> d!44951 (= lt!217966 lt!217973)))

(assert (=> d!44951 (isPrefixOf!0 (_2!6444 lt!217373) (_2!6444 lt!217373))))

(assert (=> d!44951 (= lt!217973 (lemmaIsPrefixRefl!0 (_2!6444 lt!217373)))))

(declare-fun lt!217971 () Unit!8715)

(declare-fun lt!217959 () Unit!8715)

(assert (=> d!44951 (= lt!217971 lt!217959)))

(assert (=> d!44951 (= lt!217959 (lemmaIsPrefixRefl!0 (_2!6444 lt!217373)))))

(declare-fun lt!217969 () Unit!8715)

(declare-fun lt!217975 () Unit!8715)

(assert (=> d!44951 (= lt!217969 lt!217975)))

(assert (=> d!44951 (isPrefixOf!0 lt!217964 lt!217964)))

(assert (=> d!44951 (= lt!217975 (lemmaIsPrefixRefl!0 lt!217964))))

(declare-fun lt!217961 () Unit!8715)

(declare-fun lt!217960 () Unit!8715)

(assert (=> d!44951 (= lt!217961 lt!217960)))

(assert (=> d!44951 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44951 (= lt!217960 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44951 (= lt!217964 (BitStream!5027 (buf!3297 (_2!6444 lt!217373)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)))))

(assert (=> d!44951 (isPrefixOf!0 thiss!1634 (_2!6444 lt!217373))))

(assert (=> d!44951 (= (reader!0 thiss!1634 (_2!6444 lt!217373)) lt!217963)))

(assert (= (and d!44951 c!7768) b!139768))

(assert (= (and d!44951 (not c!7768)) b!139767))

(assert (= (and d!44951 res!116526) b!139769))

(assert (= (and b!139769 res!116527) b!139765))

(assert (= (and b!139765 res!116528) b!139766))

(declare-fun m!215101 () Bool)

(assert (=> d!44951 m!215101))

(declare-fun m!215103 () Bool)

(assert (=> d!44951 m!215103))

(declare-fun m!215105 () Bool)

(assert (=> d!44951 m!215105))

(declare-fun m!215107 () Bool)

(assert (=> d!44951 m!215107))

(declare-fun m!215109 () Bool)

(assert (=> d!44951 m!215109))

(declare-fun m!215111 () Bool)

(assert (=> d!44951 m!215111))

(assert (=> d!44951 m!214997))

(assert (=> d!44951 m!214547))

(declare-fun m!215113 () Bool)

(assert (=> d!44951 m!215113))

(assert (=> d!44951 m!215001))

(declare-fun m!215115 () Bool)

(assert (=> d!44951 m!215115))

(assert (=> b!139768 m!214577))

(declare-fun m!215117 () Bool)

(assert (=> b!139768 m!215117))

(declare-fun m!215119 () Bool)

(assert (=> b!139768 m!215119))

(declare-fun m!215121 () Bool)

(assert (=> b!139769 m!215121))

(declare-fun m!215123 () Bool)

(assert (=> b!139766 m!215123))

(assert (=> b!139766 m!214591))

(assert (=> b!139766 m!214577))

(declare-fun m!215125 () Bool)

(assert (=> b!139765 m!215125))

(assert (=> b!139510 d!44951))

(declare-fun lt!217978 () tuple3!532)

(declare-fun d!44953 () Bool)

(assert (=> d!44953 (= lt!217978 (readByteArrayLoop!0 (_1!6446 lt!217381) lt!217384 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44953 (= (readByteArrayLoopPure!0 (_1!6446 lt!217381) lt!217384 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12243 (_2!6458 lt!217978) (_3!327 lt!217978)))))

(declare-fun bs!11022 () Bool)

(assert (= bs!11022 d!44953))

(declare-fun m!215127 () Bool)

(assert (=> bs!11022 m!215127))

(assert (=> b!139510 d!44953))

(declare-fun d!44955 () Bool)

(declare-fun e!93106 () Bool)

(assert (=> d!44955 e!93106))

(declare-fun res!116531 () Bool)

(assert (=> d!44955 (=> (not res!116531) (not e!93106))))

(declare-fun lt!217988 () tuple2!12238)

(declare-fun lt!217989 () tuple2!12238)

(assert (=> d!44955 (= res!116531 (= (bitIndex!0 (size!2881 (buf!3297 (_1!6445 lt!217988))) (currentByte!6133 (_1!6445 lt!217988)) (currentBit!6128 (_1!6445 lt!217988))) (bitIndex!0 (size!2881 (buf!3297 (_1!6445 lt!217989))) (currentByte!6133 (_1!6445 lt!217989)) (currentBit!6128 (_1!6445 lt!217989)))))))

(declare-fun lt!217987 () BitStream!5026)

(declare-fun lt!217990 () Unit!8715)

(declare-fun choose!14 (BitStream!5026 BitStream!5026 BitStream!5026 tuple2!12238 tuple2!12238 BitStream!5026 (_ BitVec 8) tuple2!12238 tuple2!12238 BitStream!5026 (_ BitVec 8)) Unit!8715)

(assert (=> d!44955 (= lt!217990 (choose!14 lt!217380 (_2!6444 lt!217373) lt!217987 lt!217988 (tuple2!12239 (_1!6445 lt!217988) (_2!6445 lt!217988)) (_1!6445 lt!217988) (_2!6445 lt!217988) lt!217989 (tuple2!12239 (_1!6445 lt!217989) (_2!6445 lt!217989)) (_1!6445 lt!217989) (_2!6445 lt!217989)))))

(assert (=> d!44955 (= lt!217989 (readBytePure!0 lt!217987))))

(assert (=> d!44955 (= lt!217988 (readBytePure!0 lt!217380))))

(assert (=> d!44955 (= lt!217987 (BitStream!5027 (buf!3297 (_2!6444 lt!217373)) (currentByte!6133 lt!217380) (currentBit!6128 lt!217380)))))

(assert (=> d!44955 (= (readBytePrefixLemma!0 lt!217380 (_2!6444 lt!217373)) lt!217990)))

(declare-fun b!139772 () Bool)

(assert (=> b!139772 (= e!93106 (= (_2!6445 lt!217988) (_2!6445 lt!217989)))))

(assert (= (and d!44955 res!116531) b!139772))

(declare-fun m!215129 () Bool)

(assert (=> d!44955 m!215129))

(declare-fun m!215131 () Bool)

(assert (=> d!44955 m!215131))

(declare-fun m!215133 () Bool)

(assert (=> d!44955 m!215133))

(declare-fun m!215135 () Bool)

(assert (=> d!44955 m!215135))

(assert (=> d!44955 m!214561))

(assert (=> b!139510 d!44955))

(declare-fun d!44957 () Bool)

(declare-fun e!93107 () Bool)

(assert (=> d!44957 e!93107))

(declare-fun res!116532 () Bool)

(assert (=> d!44957 (=> (not res!116532) (not e!93107))))

(declare-fun lt!217993 () (_ BitVec 64))

(declare-fun lt!217994 () (_ BitVec 64))

(declare-fun lt!217996 () (_ BitVec 64))

(assert (=> d!44957 (= res!116532 (= lt!217994 (bvsub lt!217993 lt!217996)))))

(assert (=> d!44957 (or (= (bvand lt!217993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217996 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217993 lt!217996) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44957 (= lt!217996 (remainingBits!0 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))) ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217373))) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217373)))))))

(declare-fun lt!217992 () (_ BitVec 64))

(declare-fun lt!217991 () (_ BitVec 64))

(assert (=> d!44957 (= lt!217993 (bvmul lt!217992 lt!217991))))

(assert (=> d!44957 (or (= lt!217992 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217991 (bvsdiv (bvmul lt!217992 lt!217991) lt!217992)))))

(assert (=> d!44957 (= lt!217991 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44957 (= lt!217992 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))))))

(assert (=> d!44957 (= lt!217994 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6133 (_2!6444 lt!217373))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6128 (_2!6444 lt!217373)))))))

(assert (=> d!44957 (invariant!0 (currentBit!6128 (_2!6444 lt!217373)) (currentByte!6133 (_2!6444 lt!217373)) (size!2881 (buf!3297 (_2!6444 lt!217373))))))

(assert (=> d!44957 (= (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217373))) (currentByte!6133 (_2!6444 lt!217373)) (currentBit!6128 (_2!6444 lt!217373))) lt!217994)))

(declare-fun b!139773 () Bool)

(declare-fun res!116533 () Bool)

(assert (=> b!139773 (=> (not res!116533) (not e!93107))))

(assert (=> b!139773 (= res!116533 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217994))))

(declare-fun b!139774 () Bool)

(declare-fun lt!217995 () (_ BitVec 64))

(assert (=> b!139774 (= e!93107 (bvsle lt!217994 (bvmul lt!217995 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139774 (or (= lt!217995 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217995 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217995)))))

(assert (=> b!139774 (= lt!217995 ((_ sign_extend 32) (size!2881 (buf!3297 (_2!6444 lt!217373)))))))

(assert (= (and d!44957 res!116532) b!139773))

(assert (= (and b!139773 res!116533) b!139774))

(declare-fun m!215137 () Bool)

(assert (=> d!44957 m!215137))

(declare-fun m!215139 () Bool)

(assert (=> d!44957 m!215139))

(assert (=> b!139499 d!44957))

(assert (=> b!139499 d!44904))

(declare-fun d!44959 () Bool)

(assert (=> d!44959 (= (array_inv!2670 (buf!3297 thiss!1634)) (bvsge (size!2881 (buf!3297 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!139503 d!44959))

(declare-fun d!44961 () Bool)

(assert (=> d!44961 (= (invariant!0 (currentBit!6128 thiss!1634) (currentByte!6133 thiss!1634) (size!2881 (buf!3297 (_2!6444 lt!217372)))) (and (bvsge (currentBit!6128 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6128 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6133 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6133 thiss!1634) (size!2881 (buf!3297 (_2!6444 lt!217372)))) (and (= (currentBit!6128 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6133 thiss!1634) (size!2881 (buf!3297 (_2!6444 lt!217372))))))))))

(assert (=> b!139502 d!44961))

(declare-fun d!44963 () Bool)

(declare-fun res!116536 () Bool)

(declare-fun e!93108 () Bool)

(assert (=> d!44963 (=> (not res!116536) (not e!93108))))

(assert (=> d!44963 (= res!116536 (= (size!2881 (buf!3297 thiss!1634)) (size!2881 (buf!3297 (_2!6444 lt!217372)))))))

(assert (=> d!44963 (= (isPrefixOf!0 thiss!1634 (_2!6444 lt!217372)) e!93108)))

(declare-fun b!139775 () Bool)

(declare-fun res!116534 () Bool)

(assert (=> b!139775 (=> (not res!116534) (not e!93108))))

(assert (=> b!139775 (= res!116534 (bvsle (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)) (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217372))) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372)))))))

(declare-fun b!139776 () Bool)

(declare-fun e!93109 () Bool)

(assert (=> b!139776 (= e!93108 e!93109)))

(declare-fun res!116535 () Bool)

(assert (=> b!139776 (=> res!116535 e!93109)))

(assert (=> b!139776 (= res!116535 (= (size!2881 (buf!3297 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!139777 () Bool)

(assert (=> b!139777 (= e!93109 (arrayBitRangesEq!0 (buf!3297 thiss!1634) (buf!3297 (_2!6444 lt!217372)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634))))))

(assert (= (and d!44963 res!116536) b!139775))

(assert (= (and b!139775 res!116534) b!139776))

(assert (= (and b!139776 (not res!116535)) b!139777))

(assert (=> b!139775 m!214577))

(assert (=> b!139775 m!214575))

(assert (=> b!139777 m!214577))

(assert (=> b!139777 m!214577))

(declare-fun m!215141 () Bool)

(assert (=> b!139777 m!215141))

(assert (=> b!139512 d!44963))

(declare-fun d!44965 () Bool)

(assert (=> d!44965 (= (array_inv!2670 arr!237) (bvsge (size!2881 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27122 d!44965))

(declare-fun d!44967 () Bool)

(assert (=> d!44967 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6128 thiss!1634) (currentByte!6133 thiss!1634) (size!2881 (buf!3297 thiss!1634))))))

(declare-fun bs!11023 () Bool)

(assert (= bs!11023 d!44967))

(assert (=> bs!11023 m!214581))

(assert (=> start!27122 d!44967))

(declare-fun d!44969 () Bool)

(declare-fun res!116537 () Bool)

(declare-fun e!93110 () Bool)

(assert (=> d!44969 (=> res!116537 e!93110)))

(assert (=> d!44969 (= res!116537 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44969 (= (arrayRangesEq!245 arr!237 (_2!6447 lt!217378) #b00000000000000000000000000000000 to!404) e!93110)))

(declare-fun b!139778 () Bool)

(declare-fun e!93111 () Bool)

(assert (=> b!139778 (= e!93110 e!93111)))

(declare-fun res!116538 () Bool)

(assert (=> b!139778 (=> (not res!116538) (not e!93111))))

(assert (=> b!139778 (= res!116538 (= (select (arr!3576 arr!237) #b00000000000000000000000000000000) (select (arr!3576 (_2!6447 lt!217378)) #b00000000000000000000000000000000)))))

(declare-fun b!139779 () Bool)

(assert (=> b!139779 (= e!93111 (arrayRangesEq!245 arr!237 (_2!6447 lt!217378) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44969 (not res!116537)) b!139778))

(assert (= (and b!139778 res!116538) b!139779))

(declare-fun m!215143 () Bool)

(assert (=> b!139778 m!215143))

(declare-fun m!215145 () Bool)

(assert (=> b!139778 m!215145))

(declare-fun m!215147 () Bool)

(assert (=> b!139779 m!215147))

(assert (=> b!139506 d!44969))

(declare-fun d!44971 () Bool)

(declare-fun lt!217997 () tuple2!12262)

(assert (=> d!44971 (= lt!217997 (readByte!0 (_1!6446 lt!217371)))))

(assert (=> d!44971 (= (readBytePure!0 (_1!6446 lt!217371)) (tuple2!12239 (_2!6459 lt!217997) (_1!6459 lt!217997)))))

(declare-fun bs!11024 () Bool)

(assert (= bs!11024 d!44971))

(declare-fun m!215149 () Bool)

(assert (=> bs!11024 m!215149))

(assert (=> b!139505 d!44971))

(declare-fun b!139780 () Bool)

(declare-fun res!116541 () Bool)

(declare-fun e!93113 () Bool)

(assert (=> b!139780 (=> (not res!116541) (not e!93113))))

(declare-fun lt!218003 () tuple2!12240)

(assert (=> b!139780 (= res!116541 (isPrefixOf!0 (_2!6446 lt!218003) (_2!6444 lt!217372)))))

(declare-fun lt!218014 () (_ BitVec 64))

(declare-fun lt!217998 () (_ BitVec 64))

(declare-fun b!139781 () Bool)

(assert (=> b!139781 (= e!93113 (= (_1!6446 lt!218003) (withMovedBitIndex!0 (_2!6446 lt!218003) (bvsub lt!217998 lt!218014))))))

(assert (=> b!139781 (or (= (bvand lt!217998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218014 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217998 lt!218014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139781 (= lt!218014 (bitIndex!0 (size!2881 (buf!3297 (_2!6444 lt!217372))) (currentByte!6133 (_2!6444 lt!217372)) (currentBit!6128 (_2!6444 lt!217372))))))

(assert (=> b!139781 (= lt!217998 (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)))))

(declare-fun b!139782 () Bool)

(declare-fun e!93112 () Unit!8715)

(declare-fun Unit!8726 () Unit!8715)

(assert (=> b!139782 (= e!93112 Unit!8726)))

(declare-fun b!139783 () Bool)

(declare-fun lt!218002 () Unit!8715)

(assert (=> b!139783 (= e!93112 lt!218002)))

(declare-fun lt!218017 () (_ BitVec 64))

(assert (=> b!139783 (= lt!218017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218008 () (_ BitVec 64))

(assert (=> b!139783 (= lt!218008 (bitIndex!0 (size!2881 (buf!3297 thiss!1634)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)))))

(assert (=> b!139783 (= lt!218002 (arrayBitRangesEqSymmetric!0 (buf!3297 thiss!1634) (buf!3297 (_2!6444 lt!217372)) lt!218017 lt!218008))))

(assert (=> b!139783 (arrayBitRangesEq!0 (buf!3297 (_2!6444 lt!217372)) (buf!3297 thiss!1634) lt!218017 lt!218008)))

(declare-fun b!139784 () Bool)

(declare-fun res!116540 () Bool)

(assert (=> b!139784 (=> (not res!116540) (not e!93113))))

(assert (=> b!139784 (= res!116540 (isPrefixOf!0 (_1!6446 lt!218003) thiss!1634))))

(declare-fun d!44973 () Bool)

(assert (=> d!44973 e!93113))

(declare-fun res!116539 () Bool)

(assert (=> d!44973 (=> (not res!116539) (not e!93113))))

(assert (=> d!44973 (= res!116539 (isPrefixOf!0 (_1!6446 lt!218003) (_2!6446 lt!218003)))))

(declare-fun lt!218004 () BitStream!5026)

(assert (=> d!44973 (= lt!218003 (tuple2!12241 lt!218004 (_2!6444 lt!217372)))))

(declare-fun lt!218007 () Unit!8715)

(declare-fun lt!218005 () Unit!8715)

(assert (=> d!44973 (= lt!218007 lt!218005)))

(assert (=> d!44973 (isPrefixOf!0 lt!218004 (_2!6444 lt!217372))))

(assert (=> d!44973 (= lt!218005 (lemmaIsPrefixTransitive!0 lt!218004 (_2!6444 lt!217372) (_2!6444 lt!217372)))))

(declare-fun lt!218010 () Unit!8715)

(declare-fun lt!218012 () Unit!8715)

(assert (=> d!44973 (= lt!218010 lt!218012)))

(assert (=> d!44973 (isPrefixOf!0 lt!218004 (_2!6444 lt!217372))))

(assert (=> d!44973 (= lt!218012 (lemmaIsPrefixTransitive!0 lt!218004 thiss!1634 (_2!6444 lt!217372)))))

(declare-fun lt!218016 () Unit!8715)

(assert (=> d!44973 (= lt!218016 e!93112)))

(declare-fun c!7769 () Bool)

(assert (=> d!44973 (= c!7769 (not (= (size!2881 (buf!3297 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!218006 () Unit!8715)

(declare-fun lt!218013 () Unit!8715)

(assert (=> d!44973 (= lt!218006 lt!218013)))

(assert (=> d!44973 (isPrefixOf!0 (_2!6444 lt!217372) (_2!6444 lt!217372))))

(assert (=> d!44973 (= lt!218013 (lemmaIsPrefixRefl!0 (_2!6444 lt!217372)))))

(declare-fun lt!218011 () Unit!8715)

(declare-fun lt!217999 () Unit!8715)

(assert (=> d!44973 (= lt!218011 lt!217999)))

(assert (=> d!44973 (= lt!217999 (lemmaIsPrefixRefl!0 (_2!6444 lt!217372)))))

(declare-fun lt!218009 () Unit!8715)

(declare-fun lt!218015 () Unit!8715)

(assert (=> d!44973 (= lt!218009 lt!218015)))

(assert (=> d!44973 (isPrefixOf!0 lt!218004 lt!218004)))

(assert (=> d!44973 (= lt!218015 (lemmaIsPrefixRefl!0 lt!218004))))

(declare-fun lt!218001 () Unit!8715)

(declare-fun lt!218000 () Unit!8715)

(assert (=> d!44973 (= lt!218001 lt!218000)))

(assert (=> d!44973 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44973 (= lt!218000 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44973 (= lt!218004 (BitStream!5027 (buf!3297 (_2!6444 lt!217372)) (currentByte!6133 thiss!1634) (currentBit!6128 thiss!1634)))))

(assert (=> d!44973 (isPrefixOf!0 thiss!1634 (_2!6444 lt!217372))))

(assert (=> d!44973 (= (reader!0 thiss!1634 (_2!6444 lt!217372)) lt!218003)))

(assert (= (and d!44973 c!7769) b!139783))

(assert (= (and d!44973 (not c!7769)) b!139782))

(assert (= (and d!44973 res!116539) b!139784))

(assert (= (and b!139784 res!116540) b!139780))

(assert (= (and b!139780 res!116541) b!139781))

(declare-fun m!215151 () Bool)

(assert (=> d!44973 m!215151))

(declare-fun m!215153 () Bool)

(assert (=> d!44973 m!215153))

(declare-fun m!215155 () Bool)

(assert (=> d!44973 m!215155))

(declare-fun m!215157 () Bool)

(assert (=> d!44973 m!215157))

(assert (=> d!44973 m!215109))

(declare-fun m!215159 () Bool)

(assert (=> d!44973 m!215159))

(assert (=> d!44973 m!214993))

(assert (=> d!44973 m!214593))

(declare-fun m!215161 () Bool)

(assert (=> d!44973 m!215161))

(assert (=> d!44973 m!215003))

(assert (=> d!44973 m!215115))

(assert (=> b!139783 m!214577))

(declare-fun m!215163 () Bool)

(assert (=> b!139783 m!215163))

(declare-fun m!215165 () Bool)

(assert (=> b!139783 m!215165))

(declare-fun m!215167 () Bool)

(assert (=> b!139784 m!215167))

(declare-fun m!215169 () Bool)

(assert (=> b!139781 m!215169))

(assert (=> b!139781 m!214575))

(assert (=> b!139781 m!214577))

(declare-fun m!215171 () Bool)

(assert (=> b!139780 m!215171))

(assert (=> b!139505 d!44973))

(declare-fun d!44975 () Bool)

(assert (=> d!44975 (= (invariant!0 (currentBit!6128 thiss!1634) (currentByte!6133 thiss!1634) (size!2881 (buf!3297 thiss!1634))) (and (bvsge (currentBit!6128 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6128 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6133 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6133 thiss!1634) (size!2881 (buf!3297 thiss!1634))) (and (= (currentBit!6128 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6133 thiss!1634) (size!2881 (buf!3297 thiss!1634)))))))))

(assert (=> b!139504 d!44975))

(push 1)

(assert (not b!139779))

(assert (not d!44924))

(assert (not d!44906))

(assert (not d!44953))

(assert (not d!44947))

(assert (not d!44908))

(assert (not b!139742))

(assert (not b!139699))

(assert (not b!139763))

(assert (not d!44935))

(assert (not d!44957))

(assert (not b!139784))

(assert (not d!44898))

(assert (not d!44931))

(assert (not b!139728))

(assert (not b!139713))

(assert (not d!44902))

(assert (not b!139729))

(assert (not b!139761))

(assert (not d!44973))

(assert (not b!139765))

(assert (not b!139711))

(assert (not d!44896))

(assert (not b!139764))

(assert (not d!44951))

(assert (not b!139783))

(assert (not b!139734))

(assert (not b!139768))

(assert (not b!139731))

(assert (not b!139697))

(assert (not d!44910))

(assert (not d!44892))

(assert (not b!139760))

(assert (not d!44949))

(assert (not d!44912))

(assert (not b!139766))

(assert (not b!139749))

(assert (not b!139775))

(assert (not b!139741))

(assert (not d!44929))

(assert (not d!44918))

(assert (not d!44971))

(assert (not b!139714))

(assert (not b!139780))

(assert (not b!139781))

(assert (not d!44943))

(assert (not d!44920))

(assert (not d!44926))

(assert (not d!44900))

(assert (not d!44937))

(assert (not d!44967))

(assert (not d!44933))

(assert (not b!139762))

(assert (not d!44955))

(assert (not b!139777))

(assert (not b!139743))

(assert (not d!44939))

(assert (not d!44922))

(assert (not b!139710))

(assert (not d!44904))

(assert (not b!139769))

(assert (not d!44941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

