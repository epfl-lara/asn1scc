; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25798 () Bool)

(assert start!25798)

(declare-fun b!131538 () Bool)

(declare-fun res!109128 () Bool)

(declare-fun e!87181 () Bool)

(assert (=> b!131538 (=> (not res!109128) (not e!87181))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6073 0))(
  ( (array!6074 (arr!3378 (Array (_ BitVec 32) (_ BitVec 8))) (size!2749 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4762 0))(
  ( (BitStream!4763 (buf!3116 array!6073) (currentByte!5895 (_ BitVec 32)) (currentBit!5890 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4762)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131538 (= res!109128 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2749 (buf!3116 thiss!1634))) ((_ sign_extend 32) (currentByte!5895 thiss!1634)) ((_ sign_extend 32) (currentBit!5890 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!109133 () Bool)

(assert (=> start!25798 (=> (not res!109133) (not e!87181))))

(declare-fun arr!237 () array!6073)

(assert (=> start!25798 (= res!109133 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2749 arr!237))))))

(assert (=> start!25798 e!87181))

(assert (=> start!25798 true))

(declare-fun array_inv!2538 (array!6073) Bool)

(assert (=> start!25798 (array_inv!2538 arr!237)))

(declare-fun e!87187 () Bool)

(declare-fun inv!12 (BitStream!4762) Bool)

(assert (=> start!25798 (and (inv!12 thiss!1634) e!87187)))

(declare-fun b!131539 () Bool)

(declare-fun e!87178 () Bool)

(declare-datatypes ((tuple2!11362 0))(
  ( (tuple2!11363 (_1!5984 BitStream!4762) (_2!5984 (_ BitVec 8))) )
))
(declare-fun lt!203035 () tuple2!11362)

(declare-fun lt!203023 () tuple2!11362)

(assert (=> b!131539 (= e!87178 (= (_2!5984 lt!203035) (_2!5984 lt!203023)))))

(declare-fun b!131540 () Bool)

(declare-fun lt!203037 () tuple2!11362)

(declare-fun e!87182 () Bool)

(declare-datatypes ((tuple2!11364 0))(
  ( (tuple2!11365 (_1!5985 BitStream!4762) (_2!5985 BitStream!4762)) )
))
(declare-fun lt!203031 () tuple2!11364)

(assert (=> b!131540 (= e!87182 (and (= (_2!5984 lt!203037) (select (arr!3378 arr!237) from!447)) (= (_1!5984 lt!203037) (_2!5985 lt!203031))))))

(declare-fun readBytePure!0 (BitStream!4762) tuple2!11362)

(assert (=> b!131540 (= lt!203037 (readBytePure!0 (_1!5985 lt!203031)))))

(declare-datatypes ((Unit!8121 0))(
  ( (Unit!8122) )
))
(declare-datatypes ((tuple2!11366 0))(
  ( (tuple2!11367 (_1!5986 Unit!8121) (_2!5986 BitStream!4762)) )
))
(declare-fun lt!203034 () tuple2!11366)

(declare-fun reader!0 (BitStream!4762 BitStream!4762) tuple2!11364)

(assert (=> b!131540 (= lt!203031 (reader!0 thiss!1634 (_2!5986 lt!203034)))))

(declare-fun b!131541 () Bool)

(declare-fun e!87184 () Bool)

(declare-fun e!87188 () Bool)

(assert (=> b!131541 (= e!87184 (not e!87188))))

(declare-fun res!109134 () Bool)

(assert (=> b!131541 (=> res!109134 e!87188)))

(declare-datatypes ((tuple2!11368 0))(
  ( (tuple2!11369 (_1!5987 BitStream!4762) (_2!5987 array!6073)) )
))
(declare-fun lt!203027 () tuple2!11368)

(declare-fun lt!203025 () tuple2!11364)

(assert (=> b!131541 (= res!109134 (or (not (= (size!2749 (_2!5987 lt!203027)) (size!2749 arr!237))) (not (= (_1!5987 lt!203027) (_2!5985 lt!203025)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4762 array!6073 (_ BitVec 32) (_ BitVec 32)) tuple2!11368)

(assert (=> b!131541 (= lt!203027 (readByteArrayLoopPure!0 (_1!5985 lt!203025) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!203033 () tuple2!11366)

(declare-fun lt!203024 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131541 (validate_offset_bits!1 ((_ sign_extend 32) (size!2749 (buf!3116 (_2!5986 lt!203033)))) ((_ sign_extend 32) (currentByte!5895 (_2!5986 lt!203034))) ((_ sign_extend 32) (currentBit!5890 (_2!5986 lt!203034))) lt!203024)))

(declare-fun lt!203026 () Unit!8121)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4762 array!6073 (_ BitVec 64)) Unit!8121)

(assert (=> b!131541 (= lt!203026 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5986 lt!203034) (buf!3116 (_2!5986 lt!203033)) lt!203024))))

(assert (=> b!131541 (= lt!203025 (reader!0 (_2!5986 lt!203034) (_2!5986 lt!203033)))))

(declare-fun b!131542 () Bool)

(declare-fun e!87180 () Bool)

(assert (=> b!131542 (= e!87180 e!87184)))

(declare-fun res!109131 () Bool)

(assert (=> b!131542 (=> (not res!109131) (not e!87184))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131542 (= res!109131 (= (bitIndex!0 (size!2749 (buf!3116 (_2!5986 lt!203033))) (currentByte!5895 (_2!5986 lt!203033)) (currentBit!5890 (_2!5986 lt!203033))) (bvadd (bitIndex!0 (size!2749 (buf!3116 (_2!5986 lt!203034))) (currentByte!5895 (_2!5986 lt!203034)) (currentBit!5890 (_2!5986 lt!203034))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203024))))))

(assert (=> b!131542 (= lt!203024 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131543 () Bool)

(declare-fun e!87179 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131543 (= e!87179 (invariant!0 (currentBit!5890 thiss!1634) (currentByte!5895 thiss!1634) (size!2749 (buf!3116 (_2!5986 lt!203034)))))))

(declare-fun lt!203028 () tuple2!11364)

(declare-fun e!87186 () Bool)

(declare-fun b!131544 () Bool)

(assert (=> b!131544 (= e!87186 (= (_1!5987 (readByteArrayLoopPure!0 (_1!5985 lt!203028) arr!237 from!447 to!404)) (_2!5985 lt!203028)))))

(declare-fun b!131545 () Bool)

(assert (=> b!131545 (= e!87187 (array_inv!2538 (buf!3116 thiss!1634)))))

(declare-fun b!131546 () Bool)

(declare-fun res!109129 () Bool)

(assert (=> b!131546 (=> (not res!109129) (not e!87182))))

(assert (=> b!131546 (= res!109129 (= (bitIndex!0 (size!2749 (buf!3116 (_2!5986 lt!203034))) (currentByte!5895 (_2!5986 lt!203034)) (currentBit!5890 (_2!5986 lt!203034))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2749 (buf!3116 thiss!1634)) (currentByte!5895 thiss!1634) (currentBit!5890 thiss!1634)))))))

(declare-fun b!131547 () Bool)

(declare-fun res!109136 () Bool)

(assert (=> b!131547 (=> (not res!109136) (not e!87181))))

(assert (=> b!131547 (= res!109136 (invariant!0 (currentBit!5890 thiss!1634) (currentByte!5895 thiss!1634) (size!2749 (buf!3116 thiss!1634))))))

(declare-fun b!131548 () Bool)

(declare-fun arrayRangesEq!152 (array!6073 array!6073 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131548 (= e!87188 (not (arrayRangesEq!152 arr!237 (_2!5987 lt!203027) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131549 () Bool)

(declare-fun res!109139 () Bool)

(assert (=> b!131549 (=> (not res!109139) (not e!87181))))

(assert (=> b!131549 (= res!109139 (bvslt from!447 to!404))))

(declare-fun b!131550 () Bool)

(assert (=> b!131550 (= e!87181 (not true))))

(assert (=> b!131550 e!87186))

(declare-fun res!109140 () Bool)

(assert (=> b!131550 (=> (not res!109140) (not e!87186))))

(assert (=> b!131550 (= res!109140 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2749 (buf!3116 (_2!5986 lt!203033)))) ((_ sign_extend 32) (currentByte!5895 thiss!1634)) ((_ sign_extend 32) (currentBit!5890 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203032 () Unit!8121)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4762 array!6073 (_ BitVec 32)) Unit!8121)

(assert (=> b!131550 (= lt!203032 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3116 (_2!5986 lt!203033)) (bvsub to!404 from!447)))))

(assert (=> b!131550 (= (_2!5984 (readBytePure!0 (_1!5985 lt!203028))) (select (arr!3378 arr!237) from!447))))

(declare-fun lt!203036 () tuple2!11364)

(assert (=> b!131550 (= lt!203036 (reader!0 (_2!5986 lt!203034) (_2!5986 lt!203033)))))

(assert (=> b!131550 (= lt!203028 (reader!0 thiss!1634 (_2!5986 lt!203033)))))

(assert (=> b!131550 e!87178))

(declare-fun res!109132 () Bool)

(assert (=> b!131550 (=> (not res!109132) (not e!87178))))

(assert (=> b!131550 (= res!109132 (= (bitIndex!0 (size!2749 (buf!3116 (_1!5984 lt!203035))) (currentByte!5895 (_1!5984 lt!203035)) (currentBit!5890 (_1!5984 lt!203035))) (bitIndex!0 (size!2749 (buf!3116 (_1!5984 lt!203023))) (currentByte!5895 (_1!5984 lt!203023)) (currentBit!5890 (_1!5984 lt!203023)))))))

(declare-fun lt!203038 () Unit!8121)

(declare-fun lt!203029 () BitStream!4762)

(declare-fun readBytePrefixLemma!0 (BitStream!4762 BitStream!4762) Unit!8121)

(assert (=> b!131550 (= lt!203038 (readBytePrefixLemma!0 lt!203029 (_2!5986 lt!203033)))))

(assert (=> b!131550 (= lt!203023 (readBytePure!0 (BitStream!4763 (buf!3116 (_2!5986 lt!203033)) (currentByte!5895 thiss!1634) (currentBit!5890 thiss!1634))))))

(assert (=> b!131550 (= lt!203035 (readBytePure!0 lt!203029))))

(assert (=> b!131550 (= lt!203029 (BitStream!4763 (buf!3116 (_2!5986 lt!203034)) (currentByte!5895 thiss!1634) (currentBit!5890 thiss!1634)))))

(assert (=> b!131550 e!87179))

(declare-fun res!109138 () Bool)

(assert (=> b!131550 (=> (not res!109138) (not e!87179))))

(declare-fun isPrefixOf!0 (BitStream!4762 BitStream!4762) Bool)

(assert (=> b!131550 (= res!109138 (isPrefixOf!0 thiss!1634 (_2!5986 lt!203033)))))

(declare-fun lt!203039 () Unit!8121)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4762 BitStream!4762 BitStream!4762) Unit!8121)

(assert (=> b!131550 (= lt!203039 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5986 lt!203034) (_2!5986 lt!203033)))))

(assert (=> b!131550 e!87180))

(declare-fun res!109141 () Bool)

(assert (=> b!131550 (=> (not res!109141) (not e!87180))))

(assert (=> b!131550 (= res!109141 (= (size!2749 (buf!3116 (_2!5986 lt!203034))) (size!2749 (buf!3116 (_2!5986 lt!203033)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4762 array!6073 (_ BitVec 32) (_ BitVec 32)) tuple2!11366)

(assert (=> b!131550 (= lt!203033 (appendByteArrayLoop!0 (_2!5986 lt!203034) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131550 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2749 (buf!3116 (_2!5986 lt!203034)))) ((_ sign_extend 32) (currentByte!5895 (_2!5986 lt!203034))) ((_ sign_extend 32) (currentBit!5890 (_2!5986 lt!203034))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203030 () Unit!8121)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4762 BitStream!4762 (_ BitVec 64) (_ BitVec 32)) Unit!8121)

(assert (=> b!131550 (= lt!203030 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5986 lt!203034) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131550 e!87182))

(declare-fun res!109130 () Bool)

(assert (=> b!131550 (=> (not res!109130) (not e!87182))))

(assert (=> b!131550 (= res!109130 (= (size!2749 (buf!3116 thiss!1634)) (size!2749 (buf!3116 (_2!5986 lt!203034)))))))

(declare-fun appendByte!0 (BitStream!4762 (_ BitVec 8)) tuple2!11366)

(assert (=> b!131550 (= lt!203034 (appendByte!0 thiss!1634 (select (arr!3378 arr!237) from!447)))))

(declare-fun b!131551 () Bool)

(declare-fun res!109135 () Bool)

(assert (=> b!131551 (=> (not res!109135) (not e!87184))))

(assert (=> b!131551 (= res!109135 (isPrefixOf!0 (_2!5986 lt!203034) (_2!5986 lt!203033)))))

(declare-fun b!131552 () Bool)

(declare-fun res!109137 () Bool)

(assert (=> b!131552 (=> (not res!109137) (not e!87182))))

(assert (=> b!131552 (= res!109137 (isPrefixOf!0 thiss!1634 (_2!5986 lt!203034)))))

(assert (= (and start!25798 res!109133) b!131538))

(assert (= (and b!131538 res!109128) b!131549))

(assert (= (and b!131549 res!109139) b!131547))

(assert (= (and b!131547 res!109136) b!131550))

(assert (= (and b!131550 res!109130) b!131546))

(assert (= (and b!131546 res!109129) b!131552))

(assert (= (and b!131552 res!109137) b!131540))

(assert (= (and b!131550 res!109141) b!131542))

(assert (= (and b!131542 res!109131) b!131551))

(assert (= (and b!131551 res!109135) b!131541))

(assert (= (and b!131541 (not res!109134)) b!131548))

(assert (= (and b!131550 res!109138) b!131543))

(assert (= (and b!131550 res!109132) b!131539))

(assert (= (and b!131550 res!109140) b!131544))

(assert (= start!25798 b!131545))

(declare-fun m!198553 () Bool)

(assert (=> b!131548 m!198553))

(declare-fun m!198555 () Bool)

(assert (=> b!131544 m!198555))

(declare-fun m!198557 () Bool)

(assert (=> b!131552 m!198557))

(declare-fun m!198559 () Bool)

(assert (=> b!131551 m!198559))

(declare-fun m!198561 () Bool)

(assert (=> b!131550 m!198561))

(declare-fun m!198563 () Bool)

(assert (=> b!131550 m!198563))

(declare-fun m!198565 () Bool)

(assert (=> b!131550 m!198565))

(declare-fun m!198567 () Bool)

(assert (=> b!131550 m!198567))

(declare-fun m!198569 () Bool)

(assert (=> b!131550 m!198569))

(declare-fun m!198571 () Bool)

(assert (=> b!131550 m!198571))

(declare-fun m!198573 () Bool)

(assert (=> b!131550 m!198573))

(declare-fun m!198575 () Bool)

(assert (=> b!131550 m!198575))

(declare-fun m!198577 () Bool)

(assert (=> b!131550 m!198577))

(declare-fun m!198579 () Bool)

(assert (=> b!131550 m!198579))

(declare-fun m!198581 () Bool)

(assert (=> b!131550 m!198581))

(declare-fun m!198583 () Bool)

(assert (=> b!131550 m!198583))

(declare-fun m!198585 () Bool)

(assert (=> b!131550 m!198585))

(declare-fun m!198587 () Bool)

(assert (=> b!131550 m!198587))

(declare-fun m!198589 () Bool)

(assert (=> b!131550 m!198589))

(declare-fun m!198591 () Bool)

(assert (=> b!131550 m!198591))

(assert (=> b!131550 m!198575))

(declare-fun m!198593 () Bool)

(assert (=> b!131550 m!198593))

(declare-fun m!198595 () Bool)

(assert (=> b!131545 m!198595))

(declare-fun m!198597 () Bool)

(assert (=> b!131541 m!198597))

(declare-fun m!198599 () Bool)

(assert (=> b!131541 m!198599))

(declare-fun m!198601 () Bool)

(assert (=> b!131541 m!198601))

(assert (=> b!131541 m!198565))

(declare-fun m!198603 () Bool)

(assert (=> b!131546 m!198603))

(declare-fun m!198605 () Bool)

(assert (=> b!131546 m!198605))

(declare-fun m!198607 () Bool)

(assert (=> b!131542 m!198607))

(assert (=> b!131542 m!198603))

(declare-fun m!198609 () Bool)

(assert (=> b!131543 m!198609))

(declare-fun m!198611 () Bool)

(assert (=> start!25798 m!198611))

(declare-fun m!198613 () Bool)

(assert (=> start!25798 m!198613))

(assert (=> b!131540 m!198575))

(declare-fun m!198615 () Bool)

(assert (=> b!131540 m!198615))

(declare-fun m!198617 () Bool)

(assert (=> b!131540 m!198617))

(declare-fun m!198619 () Bool)

(assert (=> b!131538 m!198619))

(declare-fun m!198621 () Bool)

(assert (=> b!131547 m!198621))

(push 1)

(assert (not b!131540))

(assert (not b!131552))

(assert (not b!131544))

(assert (not b!131543))

(assert (not start!25798))

(assert (not b!131541))

(assert (not b!131548))

(assert (not b!131551))

(assert (not b!131538))

(assert (not b!131542))

(assert (not b!131546))

(assert (not b!131550))

(assert (not b!131547))

(assert (not b!131545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

