; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24036 () Bool)

(assert start!24036)

(declare-fun b!121611 () Bool)

(declare-fun e!79656 () Bool)

(declare-datatypes ((array!5391 0))(
  ( (array!5392 (arr!3032 (Array (_ BitVec 32) (_ BitVec 8))) (size!2439 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4352 0))(
  ( (BitStream!4353 (buf!2876 array!5391) (currentByte!5567 (_ BitVec 32)) (currentBit!5562 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10220 0))(
  ( (tuple2!10221 (_1!5375 BitStream!4352) (_2!5375 Bool)) )
))
(declare-fun lt!190567 () tuple2!10220)

(declare-fun lt!190565 () tuple2!10220)

(assert (=> b!121611 (= e!79656 (= (_2!5375 lt!190567) (_2!5375 lt!190565)))))

(declare-fun b!121612 () Bool)

(declare-fun e!79654 () Bool)

(declare-fun lt!190576 () tuple2!10220)

(declare-fun lt!190560 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121612 (= e!79654 (= (bitIndex!0 (size!2439 (buf!2876 (_1!5375 lt!190576))) (currentByte!5567 (_1!5375 lt!190576)) (currentBit!5562 (_1!5375 lt!190576))) lt!190560))))

(declare-fun b!121613 () Bool)

(declare-fun e!79658 () Bool)

(declare-fun e!79655 () Bool)

(assert (=> b!121613 (= e!79658 (not e!79655))))

(declare-fun res!100733 () Bool)

(assert (=> b!121613 (=> res!100733 e!79655)))

(declare-datatypes ((tuple2!10222 0))(
  ( (tuple2!10223 (_1!5376 BitStream!4352) (_2!5376 (_ BitVec 64))) )
))
(declare-fun lt!190579 () tuple2!10222)

(declare-datatypes ((tuple2!10224 0))(
  ( (tuple2!10225 (_1!5377 BitStream!4352) (_2!5377 BitStream!4352)) )
))
(declare-fun lt!190581 () tuple2!10224)

(assert (=> b!121613 (= res!100733 (not (= (_1!5376 lt!190579) (_2!5377 lt!190581))))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!190580 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10222)

(assert (=> b!121613 (= lt!190579 (readNLeastSignificantBitsLoopPure!0 (_1!5377 lt!190581) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190580))))

(declare-datatypes ((Unit!7493 0))(
  ( (Unit!7494) )
))
(declare-datatypes ((tuple2!10226 0))(
  ( (tuple2!10227 (_1!5378 Unit!7493) (_2!5378 BitStream!4352)) )
))
(declare-fun lt!190583 () tuple2!10226)

(declare-fun lt!190558 () tuple2!10226)

(declare-fun lt!190575 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121613 (validate_offset_bits!1 ((_ sign_extend 32) (size!2439 (buf!2876 (_2!5378 lt!190583)))) ((_ sign_extend 32) (currentByte!5567 (_2!5378 lt!190558))) ((_ sign_extend 32) (currentBit!5562 (_2!5378 lt!190558))) lt!190575)))

(declare-fun lt!190577 () Unit!7493)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4352 array!5391 (_ BitVec 64)) Unit!7493)

(assert (=> b!121613 (= lt!190577 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5378 lt!190558) (buf!2876 (_2!5378 lt!190583)) lt!190575))))

(assert (=> b!121613 (= lt!190575 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!190578 () (_ BitVec 64))

(declare-fun lt!190556 () tuple2!10220)

(declare-fun lt!190570 () (_ BitVec 64))

(assert (=> b!121613 (= lt!190580 (bvor lt!190570 (ite (_2!5375 lt!190556) lt!190578 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!190584 () tuple2!10222)

(declare-fun lt!190582 () tuple2!10224)

(assert (=> b!121613 (= lt!190584 (readNLeastSignificantBitsLoopPure!0 (_1!5377 lt!190582) nBits!396 i!615 lt!190570))))

(declare-fun thiss!1305 () BitStream!4352)

(declare-fun lt!190557 () (_ BitVec 64))

(assert (=> b!121613 (validate_offset_bits!1 ((_ sign_extend 32) (size!2439 (buf!2876 (_2!5378 lt!190583)))) ((_ sign_extend 32) (currentByte!5567 thiss!1305)) ((_ sign_extend 32) (currentBit!5562 thiss!1305)) lt!190557)))

(declare-fun lt!190568 () Unit!7493)

(assert (=> b!121613 (= lt!190568 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2876 (_2!5378 lt!190583)) lt!190557))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121613 (= lt!190570 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!190574 () Bool)

(assert (=> b!121613 (= (_2!5375 lt!190556) lt!190574)))

(declare-fun readBitPure!0 (BitStream!4352) tuple2!10220)

(assert (=> b!121613 (= lt!190556 (readBitPure!0 (_1!5377 lt!190582)))))

(declare-fun reader!0 (BitStream!4352 BitStream!4352) tuple2!10224)

(assert (=> b!121613 (= lt!190581 (reader!0 (_2!5378 lt!190558) (_2!5378 lt!190583)))))

(assert (=> b!121613 (= lt!190582 (reader!0 thiss!1305 (_2!5378 lt!190583)))))

(assert (=> b!121613 e!79656))

(declare-fun res!100731 () Bool)

(assert (=> b!121613 (=> (not res!100731) (not e!79656))))

(assert (=> b!121613 (= res!100731 (= (bitIndex!0 (size!2439 (buf!2876 (_1!5375 lt!190567))) (currentByte!5567 (_1!5375 lt!190567)) (currentBit!5562 (_1!5375 lt!190567))) (bitIndex!0 (size!2439 (buf!2876 (_1!5375 lt!190565))) (currentByte!5567 (_1!5375 lt!190565)) (currentBit!5562 (_1!5375 lt!190565)))))))

(declare-fun lt!190573 () Unit!7493)

(declare-fun lt!190569 () BitStream!4352)

(declare-fun readBitPrefixLemma!0 (BitStream!4352 BitStream!4352) Unit!7493)

(assert (=> b!121613 (= lt!190573 (readBitPrefixLemma!0 lt!190569 (_2!5378 lt!190583)))))

(assert (=> b!121613 (= lt!190565 (readBitPure!0 (BitStream!4353 (buf!2876 (_2!5378 lt!190583)) (currentByte!5567 thiss!1305) (currentBit!5562 thiss!1305))))))

(assert (=> b!121613 (= lt!190567 (readBitPure!0 lt!190569))))

(assert (=> b!121613 (= lt!190569 (BitStream!4353 (buf!2876 (_2!5378 lt!190558)) (currentByte!5567 thiss!1305) (currentBit!5562 thiss!1305)))))

(declare-fun e!79657 () Bool)

(assert (=> b!121613 e!79657))

(declare-fun res!100740 () Bool)

(assert (=> b!121613 (=> (not res!100740) (not e!79657))))

(declare-fun isPrefixOf!0 (BitStream!4352 BitStream!4352) Bool)

(assert (=> b!121613 (= res!100740 (isPrefixOf!0 thiss!1305 (_2!5378 lt!190583)))))

(declare-fun lt!190561 () Unit!7493)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4352 BitStream!4352 BitStream!4352) Unit!7493)

(assert (=> b!121613 (= lt!190561 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5378 lt!190558) (_2!5378 lt!190583)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10226)

(assert (=> b!121613 (= lt!190583 (appendNLeastSignificantBitsLoop!0 (_2!5378 lt!190558) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!79652 () Bool)

(assert (=> b!121613 e!79652))

(declare-fun res!100738 () Bool)

(assert (=> b!121613 (=> (not res!100738) (not e!79652))))

(assert (=> b!121613 (= res!100738 (= (size!2439 (buf!2876 thiss!1305)) (size!2439 (buf!2876 (_2!5378 lt!190558)))))))

(declare-fun appendBit!0 (BitStream!4352 Bool) tuple2!10226)

(assert (=> b!121613 (= lt!190558 (appendBit!0 thiss!1305 lt!190574))))

(assert (=> b!121613 (= lt!190574 (not (= (bvand v!199 lt!190578) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121613 (= lt!190578 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!121614 () Bool)

(declare-fun e!79651 () Bool)

(assert (=> b!121614 (= e!79651 e!79658)))

(declare-fun res!100730 () Bool)

(assert (=> b!121614 (=> (not res!100730) (not e!79658))))

(assert (=> b!121614 (= res!100730 (validate_offset_bits!1 ((_ sign_extend 32) (size!2439 (buf!2876 thiss!1305))) ((_ sign_extend 32) (currentByte!5567 thiss!1305)) ((_ sign_extend 32) (currentBit!5562 thiss!1305)) lt!190557))))

(assert (=> b!121614 (= lt!190557 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun e!79649 () Bool)

(declare-fun lt!190572 () (_ BitVec 64))

(declare-fun lt!190564 () BitStream!4352)

(declare-fun b!121615 () Bool)

(declare-fun lt!190559 () (_ BitVec 64))

(assert (=> b!121615 (= e!79649 (and (= lt!190559 (bvsub lt!190572 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5377 lt!190581) lt!190564)) (and (= (_2!5376 lt!190584) (_2!5376 lt!190579)) (= (_1!5376 lt!190584) (_2!5377 lt!190582))))))))

(declare-fun res!100737 () Bool)

(assert (=> start!24036 (=> (not res!100737) (not e!79651))))

(assert (=> start!24036 (= res!100737 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24036 e!79651))

(assert (=> start!24036 true))

(declare-fun e!79653 () Bool)

(declare-fun inv!12 (BitStream!4352) Bool)

(assert (=> start!24036 (and (inv!12 thiss!1305) e!79653)))

(declare-fun b!121616 () Bool)

(assert (=> b!121616 (= e!79655 (or (not (= (_1!5377 lt!190581) lt!190564)) (not (= (size!2439 (buf!2876 thiss!1305)) (size!2439 (buf!2876 (_2!5378 lt!190583))))) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(assert (=> b!121616 e!79649))

(declare-fun res!100728 () Bool)

(assert (=> b!121616 (=> (not res!100728) (not e!79649))))

(declare-fun lt!190566 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4352 (_ BitVec 64)) BitStream!4352)

(assert (=> b!121616 (= res!100728 (= (_1!5377 lt!190581) (withMovedBitIndex!0 (_2!5377 lt!190581) (bvsub lt!190572 lt!190566))))))

(assert (=> b!121616 (= lt!190572 (bitIndex!0 (size!2439 (buf!2876 (_2!5378 lt!190558))) (currentByte!5567 (_2!5378 lt!190558)) (currentBit!5562 (_2!5378 lt!190558))))))

(assert (=> b!121616 (= (_1!5377 lt!190582) (withMovedBitIndex!0 (_2!5377 lt!190582) (bvsub lt!190559 lt!190566)))))

(assert (=> b!121616 (= lt!190566 (bitIndex!0 (size!2439 (buf!2876 (_2!5378 lt!190583))) (currentByte!5567 (_2!5378 lt!190583)) (currentBit!5562 (_2!5378 lt!190583))))))

(assert (=> b!121616 (= lt!190559 (bitIndex!0 (size!2439 (buf!2876 thiss!1305)) (currentByte!5567 thiss!1305) (currentBit!5562 thiss!1305)))))

(declare-fun lt!190563 () tuple2!10222)

(assert (=> b!121616 (and (= (_2!5376 lt!190584) (_2!5376 lt!190563)) (= (_1!5376 lt!190584) (_1!5376 lt!190563)))))

(declare-fun lt!190571 () Unit!7493)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7493)

(assert (=> b!121616 (= lt!190571 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5377 lt!190582) nBits!396 i!615 lt!190570))))

(assert (=> b!121616 (= lt!190563 (readNLeastSignificantBitsLoopPure!0 lt!190564 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190580))))

(assert (=> b!121616 (= lt!190564 (withMovedBitIndex!0 (_1!5377 lt!190582) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!121617 () Bool)

(declare-fun res!100732 () Bool)

(assert (=> b!121617 (=> (not res!100732) (not e!79658))))

(assert (=> b!121617 (= res!100732 (bvslt i!615 nBits!396))))

(declare-fun b!121618 () Bool)

(declare-fun e!79659 () Bool)

(assert (=> b!121618 (= e!79659 e!79654)))

(declare-fun res!100735 () Bool)

(assert (=> b!121618 (=> (not res!100735) (not e!79654))))

(assert (=> b!121618 (= res!100735 (and (= (_2!5375 lt!190576) lt!190574) (= (_1!5375 lt!190576) (_2!5378 lt!190558))))))

(declare-fun readerFrom!0 (BitStream!4352 (_ BitVec 32) (_ BitVec 32)) BitStream!4352)

(assert (=> b!121618 (= lt!190576 (readBitPure!0 (readerFrom!0 (_2!5378 lt!190558) (currentBit!5562 thiss!1305) (currentByte!5567 thiss!1305))))))

(declare-fun b!121619 () Bool)

(declare-fun res!100734 () Bool)

(assert (=> b!121619 (=> (not res!100734) (not e!79658))))

(assert (=> b!121619 (= res!100734 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!121620 () Bool)

(assert (=> b!121620 (= e!79652 e!79659)))

(declare-fun res!100739 () Bool)

(assert (=> b!121620 (=> (not res!100739) (not e!79659))))

(declare-fun lt!190562 () (_ BitVec 64))

(assert (=> b!121620 (= res!100739 (= lt!190560 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!190562)))))

(assert (=> b!121620 (= lt!190560 (bitIndex!0 (size!2439 (buf!2876 (_2!5378 lt!190558))) (currentByte!5567 (_2!5378 lt!190558)) (currentBit!5562 (_2!5378 lt!190558))))))

(assert (=> b!121620 (= lt!190562 (bitIndex!0 (size!2439 (buf!2876 thiss!1305)) (currentByte!5567 thiss!1305) (currentBit!5562 thiss!1305)))))

(declare-fun b!121621 () Bool)

(declare-fun array_inv!2241 (array!5391) Bool)

(assert (=> b!121621 (= e!79653 (array_inv!2241 (buf!2876 thiss!1305)))))

(declare-fun b!121622 () Bool)

(declare-fun res!100729 () Bool)

(assert (=> b!121622 (=> (not res!100729) (not e!79657))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!121622 (= res!100729 (invariant!0 (currentBit!5562 thiss!1305) (currentByte!5567 thiss!1305) (size!2439 (buf!2876 (_2!5378 lt!190558)))))))

(declare-fun b!121623 () Bool)

(assert (=> b!121623 (= e!79657 (invariant!0 (currentBit!5562 thiss!1305) (currentByte!5567 thiss!1305) (size!2439 (buf!2876 (_2!5378 lt!190583)))))))

(declare-fun b!121624 () Bool)

(declare-fun res!100736 () Bool)

(assert (=> b!121624 (=> (not res!100736) (not e!79659))))

(assert (=> b!121624 (= res!100736 (isPrefixOf!0 thiss!1305 (_2!5378 lt!190558)))))

(assert (= (and start!24036 res!100737) b!121614))

(assert (= (and b!121614 res!100730) b!121619))

(assert (= (and b!121619 res!100734) b!121617))

(assert (= (and b!121617 res!100732) b!121613))

(assert (= (and b!121613 res!100738) b!121620))

(assert (= (and b!121620 res!100739) b!121624))

(assert (= (and b!121624 res!100736) b!121618))

(assert (= (and b!121618 res!100735) b!121612))

(assert (= (and b!121613 res!100740) b!121622))

(assert (= (and b!121622 res!100729) b!121623))

(assert (= (and b!121613 res!100731) b!121611))

(assert (= (and b!121613 (not res!100733)) b!121616))

(assert (= (and b!121616 res!100728) b!121615))

(assert (= start!24036 b!121621))

(declare-fun m!184353 () Bool)

(assert (=> b!121621 m!184353))

(declare-fun m!184355 () Bool)

(assert (=> b!121622 m!184355))

(declare-fun m!184357 () Bool)

(assert (=> b!121624 m!184357))

(declare-fun m!184359 () Bool)

(assert (=> b!121613 m!184359))

(declare-fun m!184361 () Bool)

(assert (=> b!121613 m!184361))

(declare-fun m!184363 () Bool)

(assert (=> b!121613 m!184363))

(declare-fun m!184365 () Bool)

(assert (=> b!121613 m!184365))

(declare-fun m!184367 () Bool)

(assert (=> b!121613 m!184367))

(declare-fun m!184369 () Bool)

(assert (=> b!121613 m!184369))

(declare-fun m!184371 () Bool)

(assert (=> b!121613 m!184371))

(declare-fun m!184373 () Bool)

(assert (=> b!121613 m!184373))

(declare-fun m!184375 () Bool)

(assert (=> b!121613 m!184375))

(declare-fun m!184377 () Bool)

(assert (=> b!121613 m!184377))

(declare-fun m!184379 () Bool)

(assert (=> b!121613 m!184379))

(declare-fun m!184381 () Bool)

(assert (=> b!121613 m!184381))

(declare-fun m!184383 () Bool)

(assert (=> b!121613 m!184383))

(declare-fun m!184385 () Bool)

(assert (=> b!121613 m!184385))

(declare-fun m!184387 () Bool)

(assert (=> b!121613 m!184387))

(declare-fun m!184389 () Bool)

(assert (=> b!121613 m!184389))

(declare-fun m!184391 () Bool)

(assert (=> b!121613 m!184391))

(declare-fun m!184393 () Bool)

(assert (=> b!121613 m!184393))

(declare-fun m!184395 () Bool)

(assert (=> b!121613 m!184395))

(declare-fun m!184397 () Bool)

(assert (=> b!121620 m!184397))

(declare-fun m!184399 () Bool)

(assert (=> b!121620 m!184399))

(declare-fun m!184401 () Bool)

(assert (=> b!121623 m!184401))

(declare-fun m!184403 () Bool)

(assert (=> b!121618 m!184403))

(assert (=> b!121618 m!184403))

(declare-fun m!184405 () Bool)

(assert (=> b!121618 m!184405))

(declare-fun m!184407 () Bool)

(assert (=> b!121619 m!184407))

(declare-fun m!184409 () Bool)

(assert (=> b!121614 m!184409))

(assert (=> b!121616 m!184397))

(declare-fun m!184411 () Bool)

(assert (=> b!121616 m!184411))

(declare-fun m!184413 () Bool)

(assert (=> b!121616 m!184413))

(declare-fun m!184415 () Bool)

(assert (=> b!121616 m!184415))

(assert (=> b!121616 m!184399))

(declare-fun m!184417 () Bool)

(assert (=> b!121616 m!184417))

(declare-fun m!184419 () Bool)

(assert (=> b!121616 m!184419))

(declare-fun m!184421 () Bool)

(assert (=> b!121616 m!184421))

(declare-fun m!184423 () Bool)

(assert (=> b!121612 m!184423))

(declare-fun m!184425 () Bool)

(assert (=> start!24036 m!184425))

(push 1)

(assert (not start!24036))

(assert (not b!121620))

(assert (not b!121622))

(assert (not b!121613))

(assert (not b!121624))

(assert (not b!121619))

(assert (not b!121614))

(assert (not b!121623))

(assert (not b!121618))

(assert (not b!121621))

(assert (not b!121616))

(assert (not b!121612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

