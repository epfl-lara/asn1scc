; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40188 () Bool)

(assert start!40188)

(declare-fun b!183585 () Bool)

(declare-fun e!127279 () Bool)

(declare-fun e!127282 () Bool)

(assert (=> b!183585 (= e!127279 e!127282)))

(declare-fun res!152654 () Bool)

(assert (=> b!183585 (=> res!152654 e!127282)))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!9756 0))(
  ( (array!9757 (arr!5232 (Array (_ BitVec 32) (_ BitVec 8))) (size!4302 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7712 0))(
  ( (BitStream!7713 (buf!4757 array!9756) (currentByte!8991 (_ BitVec 32)) (currentBit!8986 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15852 0))(
  ( (tuple2!15853 (_1!8571 BitStream!7712) (_2!8571 BitStream!7712)) )
))
(declare-fun lt!282564 () tuple2!15852)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!282560 () (_ BitVec 64))

(declare-datatypes ((tuple2!15854 0))(
  ( (tuple2!15855 (_1!8572 BitStream!7712) (_2!8572 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15854)

(assert (=> b!183585 (= res!152654 (not (= (_1!8572 (readNBitsLSBFirstsLoopPure!0 (_1!8571 lt!282564) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282560)) (_2!8571 lt!282564))))))

(declare-datatypes ((Unit!13179 0))(
  ( (Unit!13180) )
))
(declare-datatypes ((tuple2!15856 0))(
  ( (tuple2!15857 (_1!8573 Unit!13179) (_2!8573 BitStream!7712)) )
))
(declare-fun lt!282558 () tuple2!15856)

(declare-fun lt!282543 () tuple2!15856)

(declare-fun lt!282555 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183585 (validate_offset_bits!1 ((_ sign_extend 32) (size!4302 (buf!4757 (_2!8573 lt!282558)))) ((_ sign_extend 32) (currentByte!8991 (_2!8573 lt!282543))) ((_ sign_extend 32) (currentBit!8986 (_2!8573 lt!282543))) lt!282555)))

(declare-fun lt!282553 () Unit!13179)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7712 array!9756 (_ BitVec 64)) Unit!13179)

(assert (=> b!183585 (= lt!282553 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8573 lt!282543) (buf!4757 (_2!8573 lt!282558)) lt!282555))))

(assert (=> b!183585 (= lt!282555 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!15858 0))(
  ( (tuple2!15859 (_1!8574 BitStream!7712) (_2!8574 Bool)) )
))
(declare-fun lt!282549 () tuple2!15858)

(declare-fun lt!282547 () (_ BitVec 64))

(declare-fun lt!282557 () (_ BitVec 64))

(assert (=> b!183585 (= lt!282560 (bvor lt!282557 (ite (_2!8574 lt!282549) lt!282547 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!282565 () tuple2!15854)

(declare-fun lt!282556 () tuple2!15852)

(assert (=> b!183585 (= lt!282565 (readNBitsLSBFirstsLoopPure!0 (_1!8571 lt!282556) nBits!348 i!590 lt!282557))))

(declare-fun thiss!1204 () BitStream!7712)

(declare-fun lt!282561 () (_ BitVec 64))

(assert (=> b!183585 (validate_offset_bits!1 ((_ sign_extend 32) (size!4302 (buf!4757 (_2!8573 lt!282558)))) ((_ sign_extend 32) (currentByte!8991 thiss!1204)) ((_ sign_extend 32) (currentBit!8986 thiss!1204)) lt!282561)))

(declare-fun lt!282554 () Unit!13179)

(assert (=> b!183585 (= lt!282554 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4757 (_2!8573 lt!282558)) lt!282561))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183585 (= lt!282557 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!282551 () Bool)

(assert (=> b!183585 (= (_2!8574 lt!282549) lt!282551)))

(declare-fun readBitPure!0 (BitStream!7712) tuple2!15858)

(assert (=> b!183585 (= lt!282549 (readBitPure!0 (_1!8571 lt!282556)))))

(declare-fun reader!0 (BitStream!7712 BitStream!7712) tuple2!15852)

(assert (=> b!183585 (= lt!282564 (reader!0 (_2!8573 lt!282543) (_2!8573 lt!282558)))))

(assert (=> b!183585 (= lt!282556 (reader!0 thiss!1204 (_2!8573 lt!282558)))))

(declare-fun e!127271 () Bool)

(assert (=> b!183585 e!127271))

(declare-fun res!152647 () Bool)

(assert (=> b!183585 (=> (not res!152647) (not e!127271))))

(declare-fun lt!282563 () tuple2!15858)

(declare-fun lt!282544 () tuple2!15858)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183585 (= res!152647 (= (bitIndex!0 (size!4302 (buf!4757 (_1!8574 lt!282563))) (currentByte!8991 (_1!8574 lt!282563)) (currentBit!8986 (_1!8574 lt!282563))) (bitIndex!0 (size!4302 (buf!4757 (_1!8574 lt!282544))) (currentByte!8991 (_1!8574 lt!282544)) (currentBit!8986 (_1!8574 lt!282544)))))))

(declare-fun lt!282550 () Unit!13179)

(declare-fun lt!282548 () BitStream!7712)

(declare-fun readBitPrefixLemma!0 (BitStream!7712 BitStream!7712) Unit!13179)

(assert (=> b!183585 (= lt!282550 (readBitPrefixLemma!0 lt!282548 (_2!8573 lt!282558)))))

(assert (=> b!183585 (= lt!282544 (readBitPure!0 (BitStream!7713 (buf!4757 (_2!8573 lt!282558)) (currentByte!8991 thiss!1204) (currentBit!8986 thiss!1204))))))

(assert (=> b!183585 (= lt!282563 (readBitPure!0 lt!282548))))

(declare-fun e!127278 () Bool)

(assert (=> b!183585 e!127278))

(declare-fun res!152637 () Bool)

(assert (=> b!183585 (=> (not res!152637) (not e!127278))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183585 (= res!152637 (invariant!0 (currentBit!8986 thiss!1204) (currentByte!8991 thiss!1204) (size!4302 (buf!4757 (_2!8573 lt!282543)))))))

(assert (=> b!183585 (= lt!282548 (BitStream!7713 (buf!4757 (_2!8573 lt!282543)) (currentByte!8991 thiss!1204) (currentBit!8986 thiss!1204)))))

(declare-fun b!183586 () Bool)

(declare-fun e!127277 () Bool)

(declare-fun e!127272 () Bool)

(assert (=> b!183586 (= e!127277 e!127272)))

(declare-fun res!152644 () Bool)

(assert (=> b!183586 (=> (not res!152644) (not e!127272))))

(declare-fun lt!282545 () tuple2!15858)

(assert (=> b!183586 (= res!152644 (and (= (_2!8574 lt!282545) lt!282551) (= (_1!8574 lt!282545) (_2!8573 lt!282543))))))

(declare-fun readerFrom!0 (BitStream!7712 (_ BitVec 32) (_ BitVec 32)) BitStream!7712)

(assert (=> b!183586 (= lt!282545 (readBitPure!0 (readerFrom!0 (_2!8573 lt!282543) (currentBit!8986 thiss!1204) (currentByte!8991 thiss!1204))))))

(declare-fun res!152639 () Bool)

(declare-fun e!127276 () Bool)

(assert (=> start!40188 (=> (not res!152639) (not e!127276))))

(assert (=> start!40188 (= res!152639 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40188 e!127276))

(assert (=> start!40188 true))

(declare-fun e!127274 () Bool)

(declare-fun inv!12 (BitStream!7712) Bool)

(assert (=> start!40188 (and (inv!12 thiss!1204) e!127274)))

(declare-fun b!183587 () Bool)

(declare-fun lt!282552 () (_ BitVec 64))

(assert (=> b!183587 (= e!127272 (= (bitIndex!0 (size!4302 (buf!4757 (_1!8574 lt!282545))) (currentByte!8991 (_1!8574 lt!282545)) (currentBit!8986 (_1!8574 lt!282545))) lt!282552))))

(declare-fun b!183588 () Bool)

(declare-fun res!152636 () Bool)

(assert (=> b!183588 (=> res!152636 e!127279)))

(declare-fun isPrefixOf!0 (BitStream!7712 BitStream!7712) Bool)

(assert (=> b!183588 (= res!152636 (not (isPrefixOf!0 thiss!1204 (_2!8573 lt!282543))))))

(declare-fun b!183589 () Bool)

(declare-fun res!152643 () Bool)

(assert (=> b!183589 (=> res!152643 e!127282)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183589 (= res!152643 (not (= (bvand lt!282557 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183590 () Bool)

(declare-fun e!127275 () Bool)

(assert (=> b!183590 (= e!127276 e!127275)))

(declare-fun res!152655 () Bool)

(assert (=> b!183590 (=> (not res!152655) (not e!127275))))

(assert (=> b!183590 (= res!152655 (validate_offset_bits!1 ((_ sign_extend 32) (size!4302 (buf!4757 thiss!1204))) ((_ sign_extend 32) (currentByte!8991 thiss!1204)) ((_ sign_extend 32) (currentBit!8986 thiss!1204)) lt!282561))))

(assert (=> b!183590 (= lt!282561 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183591 () Bool)

(declare-fun res!152649 () Bool)

(assert (=> b!183591 (=> res!152649 e!127282)))

(assert (=> b!183591 (= res!152649 (not (= (bvand lt!282557 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282557)))))

(declare-fun b!183592 () Bool)

(declare-fun e!127281 () Bool)

(assert (=> b!183592 (= e!127275 (not e!127281))))

(declare-fun res!152641 () Bool)

(assert (=> b!183592 (=> res!152641 e!127281)))

(declare-fun lt!282541 () (_ BitVec 64))

(declare-fun lt!282559 () (_ BitVec 64))

(assert (=> b!183592 (= res!152641 (not (= lt!282541 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282559))))))

(assert (=> b!183592 (= lt!282541 (bitIndex!0 (size!4302 (buf!4757 (_2!8573 lt!282543))) (currentByte!8991 (_2!8573 lt!282543)) (currentBit!8986 (_2!8573 lt!282543))))))

(assert (=> b!183592 (= lt!282559 (bitIndex!0 (size!4302 (buf!4757 thiss!1204)) (currentByte!8991 thiss!1204) (currentBit!8986 thiss!1204)))))

(declare-fun e!127273 () Bool)

(assert (=> b!183592 e!127273))

(declare-fun res!152650 () Bool)

(assert (=> b!183592 (=> (not res!152650) (not e!127273))))

(assert (=> b!183592 (= res!152650 (= (size!4302 (buf!4757 thiss!1204)) (size!4302 (buf!4757 (_2!8573 lt!282543)))))))

(declare-fun appendBit!0 (BitStream!7712 Bool) tuple2!15856)

(assert (=> b!183592 (= lt!282543 (appendBit!0 thiss!1204 lt!282551))))

(assert (=> b!183592 (= lt!282551 (not (= (bvand v!189 lt!282547) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183592 (= lt!282547 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183593 () Bool)

(declare-fun res!152640 () Bool)

(assert (=> b!183593 (=> res!152640 e!127279)))

(assert (=> b!183593 (= res!152640 (not (isPrefixOf!0 (_2!8573 lt!282543) (_2!8573 lt!282558))))))

(declare-fun b!183594 () Bool)

(declare-fun res!152635 () Bool)

(assert (=> b!183594 (=> (not res!152635) (not e!127277))))

(assert (=> b!183594 (= res!152635 (isPrefixOf!0 thiss!1204 (_2!8573 lt!282543)))))

(declare-fun b!183595 () Bool)

(assert (=> b!183595 (= e!127278 (invariant!0 (currentBit!8986 thiss!1204) (currentByte!8991 thiss!1204) (size!4302 (buf!4757 (_2!8573 lt!282558)))))))

(declare-fun b!183596 () Bool)

(declare-fun res!152645 () Bool)

(assert (=> b!183596 (=> (not res!152645) (not e!127275))))

(assert (=> b!183596 (= res!152645 (invariant!0 (currentBit!8986 thiss!1204) (currentByte!8991 thiss!1204) (size!4302 (buf!4757 thiss!1204))))))

(declare-fun b!183597 () Bool)

(assert (=> b!183597 (= e!127282 true)))

(declare-fun lt!282562 () tuple2!15854)

(declare-fun withMovedBitIndex!0 (BitStream!7712 (_ BitVec 64)) BitStream!7712)

(assert (=> b!183597 (= lt!282562 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8571 lt!282556) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282560))))

(declare-fun b!183598 () Bool)

(assert (=> b!183598 (= e!127273 e!127277)))

(declare-fun res!152648 () Bool)

(assert (=> b!183598 (=> (not res!152648) (not e!127277))))

(declare-fun lt!282566 () (_ BitVec 64))

(assert (=> b!183598 (= res!152648 (= lt!282552 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282566)))))

(assert (=> b!183598 (= lt!282552 (bitIndex!0 (size!4302 (buf!4757 (_2!8573 lt!282543))) (currentByte!8991 (_2!8573 lt!282543)) (currentBit!8986 (_2!8573 lt!282543))))))

(assert (=> b!183598 (= lt!282566 (bitIndex!0 (size!4302 (buf!4757 thiss!1204)) (currentByte!8991 thiss!1204) (currentBit!8986 thiss!1204)))))

(declare-fun b!183599 () Bool)

(declare-fun res!152638 () Bool)

(assert (=> b!183599 (=> res!152638 e!127279)))

(declare-fun lt!282542 () (_ BitVec 64))

(assert (=> b!183599 (= res!152638 (or (not (= (size!4302 (buf!4757 (_2!8573 lt!282558))) (size!4302 (buf!4757 thiss!1204)))) (not (= lt!282542 (bvsub (bvadd lt!282559 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183600 () Bool)

(declare-fun array_inv!4043 (array!9756) Bool)

(assert (=> b!183600 (= e!127274 (array_inv!4043 (buf!4757 thiss!1204)))))

(declare-fun b!183601 () Bool)

(declare-fun res!152642 () Bool)

(assert (=> b!183601 (=> res!152642 e!127282)))

(assert (=> b!183601 (= res!152642 (bvsge i!590 nBits!348))))

(declare-fun b!183602 () Bool)

(assert (=> b!183602 (= e!127281 e!127279)))

(declare-fun res!152652 () Bool)

(assert (=> b!183602 (=> res!152652 e!127279)))

(assert (=> b!183602 (= res!152652 (not (= lt!282542 (bvsub (bvsub (bvadd lt!282541 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!183602 (= lt!282542 (bitIndex!0 (size!4302 (buf!4757 (_2!8573 lt!282558))) (currentByte!8991 (_2!8573 lt!282558)) (currentBit!8986 (_2!8573 lt!282558))))))

(assert (=> b!183602 (isPrefixOf!0 thiss!1204 (_2!8573 lt!282558))))

(declare-fun lt!282546 () Unit!13179)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7712 BitStream!7712 BitStream!7712) Unit!13179)

(assert (=> b!183602 (= lt!282546 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8573 lt!282543) (_2!8573 lt!282558)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7712 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15856)

(assert (=> b!183602 (= lt!282558 (appendBitsLSBFirstLoopTR!0 (_2!8573 lt!282543) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183603 () Bool)

(declare-fun res!152653 () Bool)

(assert (=> b!183603 (=> (not res!152653) (not e!127275))))

(assert (=> b!183603 (= res!152653 (not (= i!590 nBits!348)))))

(declare-fun b!183604 () Bool)

(assert (=> b!183604 (= e!127271 (= (_2!8574 lt!282563) (_2!8574 lt!282544)))))

(declare-fun b!183605 () Bool)

(declare-fun res!152651 () Bool)

(assert (=> b!183605 (=> res!152651 e!127282)))

(assert (=> b!183605 (= res!152651 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4302 (buf!4757 (_1!8571 lt!282556)))) ((_ sign_extend 32) (currentByte!8991 (_1!8571 lt!282556))) ((_ sign_extend 32) (currentBit!8986 (_1!8571 lt!282556))) lt!282561)))))

(declare-fun b!183606 () Bool)

(declare-fun res!152646 () Bool)

(assert (=> b!183606 (=> res!152646 e!127279)))

(assert (=> b!183606 (= res!152646 (not (invariant!0 (currentBit!8986 (_2!8573 lt!282558)) (currentByte!8991 (_2!8573 lt!282558)) (size!4302 (buf!4757 (_2!8573 lt!282558))))))))

(assert (= (and start!40188 res!152639) b!183590))

(assert (= (and b!183590 res!152655) b!183596))

(assert (= (and b!183596 res!152645) b!183603))

(assert (= (and b!183603 res!152653) b!183592))

(assert (= (and b!183592 res!152650) b!183598))

(assert (= (and b!183598 res!152648) b!183594))

(assert (= (and b!183594 res!152635) b!183586))

(assert (= (and b!183586 res!152644) b!183587))

(assert (= (and b!183592 (not res!152641)) b!183602))

(assert (= (and b!183602 (not res!152652)) b!183606))

(assert (= (and b!183606 (not res!152646)) b!183599))

(assert (= (and b!183599 (not res!152638)) b!183593))

(assert (= (and b!183593 (not res!152640)) b!183588))

(assert (= (and b!183588 (not res!152636)) b!183585))

(assert (= (and b!183585 res!152637) b!183595))

(assert (= (and b!183585 res!152647) b!183604))

(assert (= (and b!183585 (not res!152654)) b!183601))

(assert (= (and b!183601 (not res!152642)) b!183605))

(assert (= (and b!183605 (not res!152651)) b!183589))

(assert (= (and b!183589 (not res!152643)) b!183591))

(assert (= (and b!183591 (not res!152649)) b!183597))

(assert (= start!40188 b!183600))

(declare-fun m!285525 () Bool)

(assert (=> b!183592 m!285525))

(declare-fun m!285527 () Bool)

(assert (=> b!183592 m!285527))

(declare-fun m!285529 () Bool)

(assert (=> b!183592 m!285529))

(declare-fun m!285531 () Bool)

(assert (=> start!40188 m!285531))

(declare-fun m!285533 () Bool)

(assert (=> b!183600 m!285533))

(declare-fun m!285535 () Bool)

(assert (=> b!183605 m!285535))

(declare-fun m!285537 () Bool)

(assert (=> b!183593 m!285537))

(declare-fun m!285539 () Bool)

(assert (=> b!183590 m!285539))

(declare-fun m!285541 () Bool)

(assert (=> b!183602 m!285541))

(declare-fun m!285543 () Bool)

(assert (=> b!183602 m!285543))

(declare-fun m!285545 () Bool)

(assert (=> b!183602 m!285545))

(declare-fun m!285547 () Bool)

(assert (=> b!183602 m!285547))

(declare-fun m!285549 () Bool)

(assert (=> b!183594 m!285549))

(declare-fun m!285551 () Bool)

(assert (=> b!183587 m!285551))

(declare-fun m!285553 () Bool)

(assert (=> b!183586 m!285553))

(assert (=> b!183586 m!285553))

(declare-fun m!285555 () Bool)

(assert (=> b!183586 m!285555))

(declare-fun m!285557 () Bool)

(assert (=> b!183585 m!285557))

(declare-fun m!285559 () Bool)

(assert (=> b!183585 m!285559))

(declare-fun m!285561 () Bool)

(assert (=> b!183585 m!285561))

(declare-fun m!285563 () Bool)

(assert (=> b!183585 m!285563))

(declare-fun m!285565 () Bool)

(assert (=> b!183585 m!285565))

(declare-fun m!285567 () Bool)

(assert (=> b!183585 m!285567))

(declare-fun m!285569 () Bool)

(assert (=> b!183585 m!285569))

(declare-fun m!285571 () Bool)

(assert (=> b!183585 m!285571))

(declare-fun m!285573 () Bool)

(assert (=> b!183585 m!285573))

(declare-fun m!285575 () Bool)

(assert (=> b!183585 m!285575))

(declare-fun m!285577 () Bool)

(assert (=> b!183585 m!285577))

(declare-fun m!285579 () Bool)

(assert (=> b!183585 m!285579))

(declare-fun m!285581 () Bool)

(assert (=> b!183585 m!285581))

(declare-fun m!285583 () Bool)

(assert (=> b!183585 m!285583))

(declare-fun m!285585 () Bool)

(assert (=> b!183585 m!285585))

(declare-fun m!285587 () Bool)

(assert (=> b!183585 m!285587))

(assert (=> b!183598 m!285525))

(assert (=> b!183598 m!285527))

(declare-fun m!285589 () Bool)

(assert (=> b!183589 m!285589))

(declare-fun m!285591 () Bool)

(assert (=> b!183596 m!285591))

(assert (=> b!183588 m!285549))

(declare-fun m!285593 () Bool)

(assert (=> b!183595 m!285593))

(declare-fun m!285595 () Bool)

(assert (=> b!183606 m!285595))

(declare-fun m!285597 () Bool)

(assert (=> b!183597 m!285597))

(assert (=> b!183597 m!285597))

(declare-fun m!285599 () Bool)

(assert (=> b!183597 m!285599))

(push 1)

(assert (not b!183594))

(assert (not b!183590))

(assert (not b!183587))

(assert (not b!183586))

(assert (not b!183602))

(assert (not start!40188))

(assert (not b!183588))

(assert (not b!183593))

(assert (not b!183596))

(assert (not b!183597))

(assert (not b!183600))

(assert (not b!183598))

(assert (not b!183605))

(assert (not b!183592))

(assert (not b!183585))

(assert (not b!183606))

(assert (not b!183589))

(assert (not b!183595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

