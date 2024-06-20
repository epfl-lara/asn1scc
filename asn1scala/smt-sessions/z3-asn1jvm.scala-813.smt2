; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24034 () Bool)

(assert start!24034)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((array!5389 0))(
  ( (array!5390 (arr!3031 (Array (_ BitVec 32) (_ BitVec 8))) (size!2438 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4350 0))(
  ( (BitStream!4351 (buf!2875 array!5389) (currentByte!5566 (_ BitVec 32)) (currentBit!5561 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7491 0))(
  ( (Unit!7492) )
))
(declare-datatypes ((tuple2!10212 0))(
  ( (tuple2!10213 (_1!5371 Unit!7491) (_2!5371 BitStream!4350)) )
))
(declare-fun lt!190489 () tuple2!10212)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun e!79624 () Bool)

(declare-datatypes ((tuple2!10214 0))(
  ( (tuple2!10215 (_1!5372 BitStream!4350) (_2!5372 BitStream!4350)) )
))
(declare-fun lt!190472 () tuple2!10214)

(declare-fun lt!190482 () BitStream!4350)

(declare-fun b!121569 () Bool)

(declare-fun thiss!1305 () BitStream!4350)

(assert (=> b!121569 (= e!79624 (or (not (= (_1!5372 lt!190472) lt!190482)) (not (= (size!2438 (buf!2875 thiss!1305)) (size!2438 (buf!2875 (_2!5371 lt!190489))))) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(declare-fun e!79623 () Bool)

(assert (=> b!121569 e!79623))

(declare-fun res!100690 () Bool)

(assert (=> b!121569 (=> (not res!100690) (not e!79623))))

(declare-fun lt!190484 () (_ BitVec 64))

(declare-fun lt!190488 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4350 (_ BitVec 64)) BitStream!4350)

(assert (=> b!121569 (= res!100690 (= (_1!5372 lt!190472) (withMovedBitIndex!0 (_2!5372 lt!190472) (bvsub lt!190484 lt!190488))))))

(declare-fun lt!190471 () tuple2!10212)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121569 (= lt!190484 (bitIndex!0 (size!2438 (buf!2875 (_2!5371 lt!190471))) (currentByte!5566 (_2!5371 lt!190471)) (currentBit!5561 (_2!5371 lt!190471))))))

(declare-fun lt!190483 () tuple2!10214)

(declare-fun lt!190480 () (_ BitVec 64))

(assert (=> b!121569 (= (_1!5372 lt!190483) (withMovedBitIndex!0 (_2!5372 lt!190483) (bvsub lt!190480 lt!190488)))))

(assert (=> b!121569 (= lt!190488 (bitIndex!0 (size!2438 (buf!2875 (_2!5371 lt!190489))) (currentByte!5566 (_2!5371 lt!190489)) (currentBit!5561 (_2!5371 lt!190489))))))

(assert (=> b!121569 (= lt!190480 (bitIndex!0 (size!2438 (buf!2875 thiss!1305)) (currentByte!5566 thiss!1305) (currentBit!5561 thiss!1305)))))

(declare-datatypes ((tuple2!10216 0))(
  ( (tuple2!10217 (_1!5373 BitStream!4350) (_2!5373 (_ BitVec 64))) )
))
(declare-fun lt!190481 () tuple2!10216)

(declare-fun lt!190470 () tuple2!10216)

(assert (=> b!121569 (and (= (_2!5373 lt!190481) (_2!5373 lt!190470)) (= (_1!5373 lt!190481) (_1!5373 lt!190470)))))

(declare-fun lt!190474 () (_ BitVec 64))

(declare-fun lt!190473 () Unit!7491)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7491)

(assert (=> b!121569 (= lt!190473 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5372 lt!190483) nBits!396 i!615 lt!190474))))

(declare-fun lt!190490 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10216)

(assert (=> b!121569 (= lt!190470 (readNLeastSignificantBitsLoopPure!0 lt!190482 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190490))))

(assert (=> b!121569 (= lt!190482 (withMovedBitIndex!0 (_1!5372 lt!190483) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!121570 () Bool)

(declare-fun res!100699 () Bool)

(declare-fun e!79616 () Bool)

(assert (=> b!121570 (=> (not res!100699) (not e!79616))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121570 (= res!100699 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!121571 () Bool)

(assert (=> b!121571 (= e!79616 (not e!79624))))

(declare-fun res!100700 () Bool)

(assert (=> b!121571 (=> res!100700 e!79624)))

(declare-fun lt!190469 () tuple2!10216)

(assert (=> b!121571 (= res!100700 (not (= (_1!5373 lt!190469) (_2!5372 lt!190472))))))

(assert (=> b!121571 (= lt!190469 (readNLeastSignificantBitsLoopPure!0 (_1!5372 lt!190472) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190490))))

(declare-fun lt!190497 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121571 (validate_offset_bits!1 ((_ sign_extend 32) (size!2438 (buf!2875 (_2!5371 lt!190489)))) ((_ sign_extend 32) (currentByte!5566 (_2!5371 lt!190471))) ((_ sign_extend 32) (currentBit!5561 (_2!5371 lt!190471))) lt!190497)))

(declare-fun lt!190491 () Unit!7491)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4350 array!5389 (_ BitVec 64)) Unit!7491)

(assert (=> b!121571 (= lt!190491 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5371 lt!190471) (buf!2875 (_2!5371 lt!190489)) lt!190497))))

(assert (=> b!121571 (= lt!190497 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!10218 0))(
  ( (tuple2!10219 (_1!5374 BitStream!4350) (_2!5374 Bool)) )
))
(declare-fun lt!190494 () tuple2!10218)

(declare-fun lt!190487 () (_ BitVec 64))

(assert (=> b!121571 (= lt!190490 (bvor lt!190474 (ite (_2!5374 lt!190494) lt!190487 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121571 (= lt!190481 (readNLeastSignificantBitsLoopPure!0 (_1!5372 lt!190483) nBits!396 i!615 lt!190474))))

(declare-fun lt!190493 () (_ BitVec 64))

(assert (=> b!121571 (validate_offset_bits!1 ((_ sign_extend 32) (size!2438 (buf!2875 (_2!5371 lt!190489)))) ((_ sign_extend 32) (currentByte!5566 thiss!1305)) ((_ sign_extend 32) (currentBit!5561 thiss!1305)) lt!190493)))

(declare-fun lt!190479 () Unit!7491)

(assert (=> b!121571 (= lt!190479 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2875 (_2!5371 lt!190489)) lt!190493))))

(assert (=> b!121571 (= lt!190474 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!190477 () Bool)

(assert (=> b!121571 (= (_2!5374 lt!190494) lt!190477)))

(declare-fun readBitPure!0 (BitStream!4350) tuple2!10218)

(assert (=> b!121571 (= lt!190494 (readBitPure!0 (_1!5372 lt!190483)))))

(declare-fun reader!0 (BitStream!4350 BitStream!4350) tuple2!10214)

(assert (=> b!121571 (= lt!190472 (reader!0 (_2!5371 lt!190471) (_2!5371 lt!190489)))))

(assert (=> b!121571 (= lt!190483 (reader!0 thiss!1305 (_2!5371 lt!190489)))))

(declare-fun e!79621 () Bool)

(assert (=> b!121571 e!79621))

(declare-fun res!100696 () Bool)

(assert (=> b!121571 (=> (not res!100696) (not e!79621))))

(declare-fun lt!190478 () tuple2!10218)

(declare-fun lt!190495 () tuple2!10218)

(assert (=> b!121571 (= res!100696 (= (bitIndex!0 (size!2438 (buf!2875 (_1!5374 lt!190478))) (currentByte!5566 (_1!5374 lt!190478)) (currentBit!5561 (_1!5374 lt!190478))) (bitIndex!0 (size!2438 (buf!2875 (_1!5374 lt!190495))) (currentByte!5566 (_1!5374 lt!190495)) (currentBit!5561 (_1!5374 lt!190495)))))))

(declare-fun lt!190486 () Unit!7491)

(declare-fun lt!190475 () BitStream!4350)

(declare-fun readBitPrefixLemma!0 (BitStream!4350 BitStream!4350) Unit!7491)

(assert (=> b!121571 (= lt!190486 (readBitPrefixLemma!0 lt!190475 (_2!5371 lt!190489)))))

(assert (=> b!121571 (= lt!190495 (readBitPure!0 (BitStream!4351 (buf!2875 (_2!5371 lt!190489)) (currentByte!5566 thiss!1305) (currentBit!5561 thiss!1305))))))

(assert (=> b!121571 (= lt!190478 (readBitPure!0 lt!190475))))

(assert (=> b!121571 (= lt!190475 (BitStream!4351 (buf!2875 (_2!5371 lt!190471)) (currentByte!5566 thiss!1305) (currentBit!5561 thiss!1305)))))

(declare-fun e!79617 () Bool)

(assert (=> b!121571 e!79617))

(declare-fun res!100698 () Bool)

(assert (=> b!121571 (=> (not res!100698) (not e!79617))))

(declare-fun isPrefixOf!0 (BitStream!4350 BitStream!4350) Bool)

(assert (=> b!121571 (= res!100698 (isPrefixOf!0 thiss!1305 (_2!5371 lt!190489)))))

(declare-fun lt!190485 () Unit!7491)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4350 BitStream!4350 BitStream!4350) Unit!7491)

(assert (=> b!121571 (= lt!190485 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5371 lt!190471) (_2!5371 lt!190489)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4350 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10212)

(assert (=> b!121571 (= lt!190489 (appendNLeastSignificantBitsLoop!0 (_2!5371 lt!190471) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!79620 () Bool)

(assert (=> b!121571 e!79620))

(declare-fun res!100689 () Bool)

(assert (=> b!121571 (=> (not res!100689) (not e!79620))))

(assert (=> b!121571 (= res!100689 (= (size!2438 (buf!2875 thiss!1305)) (size!2438 (buf!2875 (_2!5371 lt!190471)))))))

(declare-fun appendBit!0 (BitStream!4350 Bool) tuple2!10212)

(assert (=> b!121571 (= lt!190471 (appendBit!0 thiss!1305 lt!190477))))

(assert (=> b!121571 (= lt!190477 (not (= (bvand v!199 lt!190487) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121571 (= lt!190487 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!121572 () Bool)

(declare-fun e!79622 () Bool)

(declare-fun lt!190476 () tuple2!10218)

(declare-fun lt!190496 () (_ BitVec 64))

(assert (=> b!121572 (= e!79622 (= (bitIndex!0 (size!2438 (buf!2875 (_1!5374 lt!190476))) (currentByte!5566 (_1!5374 lt!190476)) (currentBit!5561 (_1!5374 lt!190476))) lt!190496))))

(declare-fun b!121573 () Bool)

(declare-fun res!100701 () Bool)

(declare-fun e!79619 () Bool)

(assert (=> b!121573 (=> (not res!100701) (not e!79619))))

(assert (=> b!121573 (= res!100701 (isPrefixOf!0 thiss!1305 (_2!5371 lt!190471)))))

(declare-fun b!121574 () Bool)

(assert (=> b!121574 (= e!79623 (and (= lt!190480 (bvsub lt!190484 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5372 lt!190472) lt!190482)) (and (= (_2!5373 lt!190481) (_2!5373 lt!190469)) (= (_1!5373 lt!190481) (_2!5372 lt!190483))))))))

(declare-fun b!121575 () Bool)

(declare-fun res!100693 () Bool)

(assert (=> b!121575 (=> (not res!100693) (not e!79617))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!121575 (= res!100693 (invariant!0 (currentBit!5561 thiss!1305) (currentByte!5566 thiss!1305) (size!2438 (buf!2875 (_2!5371 lt!190471)))))))

(declare-fun b!121577 () Bool)

(declare-fun e!79625 () Bool)

(declare-fun array_inv!2240 (array!5389) Bool)

(assert (=> b!121577 (= e!79625 (array_inv!2240 (buf!2875 thiss!1305)))))

(declare-fun b!121578 () Bool)

(declare-fun res!100695 () Bool)

(assert (=> b!121578 (=> (not res!100695) (not e!79616))))

(assert (=> b!121578 (= res!100695 (bvslt i!615 nBits!396))))

(declare-fun b!121579 () Bool)

(declare-fun e!79626 () Bool)

(assert (=> b!121579 (= e!79626 e!79616)))

(declare-fun res!100697 () Bool)

(assert (=> b!121579 (=> (not res!100697) (not e!79616))))

(assert (=> b!121579 (= res!100697 (validate_offset_bits!1 ((_ sign_extend 32) (size!2438 (buf!2875 thiss!1305))) ((_ sign_extend 32) (currentByte!5566 thiss!1305)) ((_ sign_extend 32) (currentBit!5561 thiss!1305)) lt!190493))))

(assert (=> b!121579 (= lt!190493 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!121580 () Bool)

(assert (=> b!121580 (= e!79620 e!79619)))

(declare-fun res!100692 () Bool)

(assert (=> b!121580 (=> (not res!100692) (not e!79619))))

(declare-fun lt!190492 () (_ BitVec 64))

(assert (=> b!121580 (= res!100692 (= lt!190496 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!190492)))))

(assert (=> b!121580 (= lt!190496 (bitIndex!0 (size!2438 (buf!2875 (_2!5371 lt!190471))) (currentByte!5566 (_2!5371 lt!190471)) (currentBit!5561 (_2!5371 lt!190471))))))

(assert (=> b!121580 (= lt!190492 (bitIndex!0 (size!2438 (buf!2875 thiss!1305)) (currentByte!5566 thiss!1305) (currentBit!5561 thiss!1305)))))

(declare-fun res!100691 () Bool)

(assert (=> start!24034 (=> (not res!100691) (not e!79626))))

(assert (=> start!24034 (= res!100691 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24034 e!79626))

(assert (=> start!24034 true))

(declare-fun inv!12 (BitStream!4350) Bool)

(assert (=> start!24034 (and (inv!12 thiss!1305) e!79625)))

(declare-fun b!121576 () Bool)

(assert (=> b!121576 (= e!79617 (invariant!0 (currentBit!5561 thiss!1305) (currentByte!5566 thiss!1305) (size!2438 (buf!2875 (_2!5371 lt!190489)))))))

(declare-fun b!121581 () Bool)

(assert (=> b!121581 (= e!79621 (= (_2!5374 lt!190478) (_2!5374 lt!190495)))))

(declare-fun b!121582 () Bool)

(assert (=> b!121582 (= e!79619 e!79622)))

(declare-fun res!100694 () Bool)

(assert (=> b!121582 (=> (not res!100694) (not e!79622))))

(assert (=> b!121582 (= res!100694 (and (= (_2!5374 lt!190476) lt!190477) (= (_1!5374 lt!190476) (_2!5371 lt!190471))))))

(declare-fun readerFrom!0 (BitStream!4350 (_ BitVec 32) (_ BitVec 32)) BitStream!4350)

(assert (=> b!121582 (= lt!190476 (readBitPure!0 (readerFrom!0 (_2!5371 lt!190471) (currentBit!5561 thiss!1305) (currentByte!5566 thiss!1305))))))

(assert (= (and start!24034 res!100691) b!121579))

(assert (= (and b!121579 res!100697) b!121570))

(assert (= (and b!121570 res!100699) b!121578))

(assert (= (and b!121578 res!100695) b!121571))

(assert (= (and b!121571 res!100689) b!121580))

(assert (= (and b!121580 res!100692) b!121573))

(assert (= (and b!121573 res!100701) b!121582))

(assert (= (and b!121582 res!100694) b!121572))

(assert (= (and b!121571 res!100698) b!121575))

(assert (= (and b!121575 res!100693) b!121576))

(assert (= (and b!121571 res!100696) b!121581))

(assert (= (and b!121571 (not res!100700)) b!121569))

(assert (= (and b!121569 res!100690) b!121574))

(assert (= start!24034 b!121577))

(declare-fun m!184279 () Bool)

(assert (=> b!121580 m!184279))

(declare-fun m!184281 () Bool)

(assert (=> b!121580 m!184281))

(declare-fun m!184283 () Bool)

(assert (=> b!121571 m!184283))

(declare-fun m!184285 () Bool)

(assert (=> b!121571 m!184285))

(declare-fun m!184287 () Bool)

(assert (=> b!121571 m!184287))

(declare-fun m!184289 () Bool)

(assert (=> b!121571 m!184289))

(declare-fun m!184291 () Bool)

(assert (=> b!121571 m!184291))

(declare-fun m!184293 () Bool)

(assert (=> b!121571 m!184293))

(declare-fun m!184295 () Bool)

(assert (=> b!121571 m!184295))

(declare-fun m!184297 () Bool)

(assert (=> b!121571 m!184297))

(declare-fun m!184299 () Bool)

(assert (=> b!121571 m!184299))

(declare-fun m!184301 () Bool)

(assert (=> b!121571 m!184301))

(declare-fun m!184303 () Bool)

(assert (=> b!121571 m!184303))

(declare-fun m!184305 () Bool)

(assert (=> b!121571 m!184305))

(declare-fun m!184307 () Bool)

(assert (=> b!121571 m!184307))

(declare-fun m!184309 () Bool)

(assert (=> b!121571 m!184309))

(declare-fun m!184311 () Bool)

(assert (=> b!121571 m!184311))

(declare-fun m!184313 () Bool)

(assert (=> b!121571 m!184313))

(declare-fun m!184315 () Bool)

(assert (=> b!121571 m!184315))

(declare-fun m!184317 () Bool)

(assert (=> b!121571 m!184317))

(declare-fun m!184319 () Bool)

(assert (=> b!121571 m!184319))

(declare-fun m!184321 () Bool)

(assert (=> b!121570 m!184321))

(declare-fun m!184323 () Bool)

(assert (=> b!121579 m!184323))

(declare-fun m!184325 () Bool)

(assert (=> b!121573 m!184325))

(declare-fun m!184327 () Bool)

(assert (=> b!121575 m!184327))

(declare-fun m!184329 () Bool)

(assert (=> b!121576 m!184329))

(declare-fun m!184331 () Bool)

(assert (=> b!121569 m!184331))

(declare-fun m!184333 () Bool)

(assert (=> b!121569 m!184333))

(declare-fun m!184335 () Bool)

(assert (=> b!121569 m!184335))

(declare-fun m!184337 () Bool)

(assert (=> b!121569 m!184337))

(assert (=> b!121569 m!184281))

(declare-fun m!184339 () Bool)

(assert (=> b!121569 m!184339))

(assert (=> b!121569 m!184279))

(declare-fun m!184341 () Bool)

(assert (=> b!121569 m!184341))

(declare-fun m!184343 () Bool)

(assert (=> start!24034 m!184343))

(declare-fun m!184345 () Bool)

(assert (=> b!121572 m!184345))

(declare-fun m!184347 () Bool)

(assert (=> b!121577 m!184347))

(declare-fun m!184349 () Bool)

(assert (=> b!121582 m!184349))

(assert (=> b!121582 m!184349))

(declare-fun m!184351 () Bool)

(assert (=> b!121582 m!184351))

(check-sat (not b!121579) (not b!121582) (not b!121576) (not b!121569) (not b!121572) (not b!121570) (not b!121571) (not start!24034) (not b!121573) (not b!121580) (not b!121575) (not b!121577))
(check-sat)
