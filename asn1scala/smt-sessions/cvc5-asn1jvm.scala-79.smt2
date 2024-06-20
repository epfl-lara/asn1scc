; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1550 () Bool)

(assert start!1550)

(declare-fun b!7516 () Bool)

(declare-fun e!4715 () Bool)

(declare-datatypes ((array!507 0))(
  ( (array!508 (arr!622 (Array (_ BitVec 32) (_ BitVec 8))) (size!220 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!418 0))(
  ( (BitStream!419 (buf!553 array!507) (currentByte!1556 (_ BitVec 32)) (currentBit!1551 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!418)

(declare-fun array_inv!215 (array!507) Bool)

(assert (=> b!7516 (= e!4715 (array_inv!215 (buf!553 thiss!1486)))))

(declare-fun b!7517 () Bool)

(declare-fun res!8273 () Bool)

(declare-fun e!4713 () Bool)

(assert (=> b!7517 (=> (not res!8273) (not e!4713))))

(declare-datatypes ((Unit!586 0))(
  ( (Unit!587) )
))
(declare-datatypes ((tuple2!1012 0))(
  ( (tuple2!1013 (_1!534 Unit!586) (_2!534 BitStream!418)) )
))
(declare-fun lt!9804 () tuple2!1012)

(assert (=> b!7517 (= res!8273 (= (size!220 (buf!553 thiss!1486)) (size!220 (buf!553 (_2!534 lt!9804)))))))

(declare-fun b!7518 () Bool)

(declare-fun res!8272 () Bool)

(assert (=> b!7518 (=> (not res!8272) (not e!4713))))

(declare-fun isPrefixOf!0 (BitStream!418 BitStream!418) Bool)

(assert (=> b!7518 (= res!8272 (isPrefixOf!0 thiss!1486 (_2!534 lt!9804)))))

(declare-fun b!7519 () Bool)

(declare-fun res!8275 () Bool)

(declare-fun e!4711 () Bool)

(assert (=> b!7519 (=> (not res!8275) (not e!4711))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7519 (= res!8275 (validate_offset_bits!1 ((_ sign_extend 32) (size!220 (buf!553 thiss!1486))) ((_ sign_extend 32) (currentByte!1556 thiss!1486)) ((_ sign_extend 32) (currentBit!1551 thiss!1486)) nBits!460))))

(declare-fun res!8274 () Bool)

(assert (=> start!1550 (=> (not res!8274) (not e!4711))))

(declare-fun srcBuffer!6 () array!507)

(declare-fun from!367 () (_ BitVec 64))

(assert (=> start!1550 (= res!8274 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!220 srcBuffer!6))))))))

(assert (=> start!1550 e!4711))

(assert (=> start!1550 true))

(assert (=> start!1550 (array_inv!215 srcBuffer!6)))

(declare-fun inv!12 (BitStream!418) Bool)

(assert (=> start!1550 (and (inv!12 thiss!1486) e!4715)))

(declare-fun b!7520 () Bool)

(declare-fun e!4714 () Bool)

(assert (=> b!7520 (= e!4714 true)))

(declare-fun lt!9805 () Unit!586)

(declare-datatypes ((tuple2!1014 0))(
  ( (tuple2!1015 (_1!535 array!507) (_2!535 BitStream!418)) )
))
(declare-fun lt!9808 () tuple2!1014)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!418 array!507 array!507 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!586)

(assert (=> b!7520 (= lt!9805 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!534 lt!9804) srcBuffer!6 (_1!535 lt!9808) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7521 () Bool)

(assert (=> b!7521 (= e!4711 e!4713)))

(declare-fun res!8277 () Bool)

(assert (=> b!7521 (=> (not res!8277) (not e!4713))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7521 (= res!8277 (invariant!0 (currentBit!1551 (_2!534 lt!9804)) (currentByte!1556 (_2!534 lt!9804)) (size!220 (buf!553 (_2!534 lt!9804)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!418 array!507 (_ BitVec 64) (_ BitVec 64)) tuple2!1012)

(assert (=> b!7521 (= lt!9804 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7522 () Bool)

(declare-fun res!8271 () Bool)

(assert (=> b!7522 (=> (not res!8271) (not e!4713))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7522 (= res!8271 (= (bitIndex!0 (size!220 (buf!553 (_2!534 lt!9804))) (currentByte!1556 (_2!534 lt!9804)) (currentBit!1551 (_2!534 lt!9804))) (bvadd (bitIndex!0 (size!220 (buf!553 thiss!1486)) (currentByte!1556 thiss!1486) (currentBit!1551 thiss!1486)) nBits!460)))))

(declare-fun b!7523 () Bool)

(assert (=> b!7523 (= e!4713 (not e!4714))))

(declare-fun res!8276 () Bool)

(assert (=> b!7523 (=> res!8276 e!4714)))

(declare-datatypes ((List!120 0))(
  ( (Nil!117) (Cons!116 (h!235 Bool) (t!870 List!120)) )
))
(declare-fun lt!9806 () List!120)

(declare-fun byteArrayBitContentToList!0 (BitStream!418 array!507 (_ BitVec 64) (_ BitVec 64)) List!120)

(assert (=> b!7523 (= res!8276 (not (= (byteArrayBitContentToList!0 (_2!534 lt!9804) (_1!535 lt!9808) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9806)))))

(declare-datatypes ((tuple2!1016 0))(
  ( (tuple2!1017 (_1!536 BitStream!418) (_2!536 BitStream!418)) )
))
(declare-fun lt!9809 () tuple2!1016)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!418 BitStream!418 (_ BitVec 64)) List!120)

(assert (=> b!7523 (= lt!9806 (bitStreamReadBitsIntoList!0 (_2!534 lt!9804) (_1!536 lt!9809) nBits!460))))

(declare-fun readBits!0 (BitStream!418 (_ BitVec 64)) tuple2!1014)

(assert (=> b!7523 (= lt!9808 (readBits!0 (_1!536 lt!9809) nBits!460))))

(assert (=> b!7523 (validate_offset_bits!1 ((_ sign_extend 32) (size!220 (buf!553 (_2!534 lt!9804)))) ((_ sign_extend 32) (currentByte!1556 thiss!1486)) ((_ sign_extend 32) (currentBit!1551 thiss!1486)) nBits!460)))

(declare-fun lt!9807 () Unit!586)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!418 array!507 (_ BitVec 64)) Unit!586)

(assert (=> b!7523 (= lt!9807 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!553 (_2!534 lt!9804)) nBits!460))))

(declare-fun reader!0 (BitStream!418 BitStream!418) tuple2!1016)

(assert (=> b!7523 (= lt!9809 (reader!0 thiss!1486 (_2!534 lt!9804)))))

(declare-fun b!7524 () Bool)

(declare-fun res!8278 () Bool)

(assert (=> b!7524 (=> res!8278 e!4714)))

(assert (=> b!7524 (= res!8278 (not (= lt!9806 (byteArrayBitContentToList!0 (_2!534 lt!9804) srcBuffer!6 from!367 nBits!460))))))

(assert (= (and start!1550 res!8274) b!7519))

(assert (= (and b!7519 res!8275) b!7521))

(assert (= (and b!7521 res!8277) b!7517))

(assert (= (and b!7517 res!8273) b!7522))

(assert (= (and b!7522 res!8271) b!7518))

(assert (= (and b!7518 res!8272) b!7523))

(assert (= (and b!7523 (not res!8276)) b!7524))

(assert (= (and b!7524 (not res!8278)) b!7520))

(assert (= start!1550 b!7516))

(declare-fun m!9615 () Bool)

(assert (=> b!7518 m!9615))

(declare-fun m!9617 () Bool)

(assert (=> b!7520 m!9617))

(declare-fun m!9619 () Bool)

(assert (=> b!7523 m!9619))

(declare-fun m!9621 () Bool)

(assert (=> b!7523 m!9621))

(declare-fun m!9623 () Bool)

(assert (=> b!7523 m!9623))

(declare-fun m!9625 () Bool)

(assert (=> b!7523 m!9625))

(declare-fun m!9627 () Bool)

(assert (=> b!7523 m!9627))

(declare-fun m!9629 () Bool)

(assert (=> b!7523 m!9629))

(declare-fun m!9631 () Bool)

(assert (=> b!7516 m!9631))

(declare-fun m!9633 () Bool)

(assert (=> b!7524 m!9633))

(declare-fun m!9635 () Bool)

(assert (=> start!1550 m!9635))

(declare-fun m!9637 () Bool)

(assert (=> start!1550 m!9637))

(declare-fun m!9639 () Bool)

(assert (=> b!7521 m!9639))

(declare-fun m!9641 () Bool)

(assert (=> b!7521 m!9641))

(declare-fun m!9643 () Bool)

(assert (=> b!7519 m!9643))

(declare-fun m!9645 () Bool)

(assert (=> b!7522 m!9645))

(declare-fun m!9647 () Bool)

(assert (=> b!7522 m!9647))

(push 1)

(assert (not b!7521))

(assert (not start!1550))

(assert (not b!7516))

(assert (not b!7519))

(assert (not b!7524))

(assert (not b!7523))

(assert (not b!7522))

(assert (not b!7520))

(assert (not b!7518))

