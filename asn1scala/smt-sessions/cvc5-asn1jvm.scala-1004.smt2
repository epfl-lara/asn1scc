; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28530 () Bool)

(assert start!28530)

(declare-fun b!147563 () Bool)

(declare-fun res!123482 () Bool)

(declare-fun e!98417 () Bool)

(assert (=> b!147563 (=> (not res!123482) (not e!98417))))

(declare-datatypes ((array!6647 0))(
  ( (array!6648 (arr!3776 (Array (_ BitVec 32) (_ BitVec 8))) (size!3007 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5272 0))(
  ( (BitStream!5273 (buf!3472 array!6647) (currentByte!6380 (_ BitVec 32)) (currentBit!6375 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5272)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147563 (= res!123482 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3007 (buf!3472 thiss!1634))) ((_ sign_extend 32) (currentByte!6380 thiss!1634)) ((_ sign_extend 32) (currentBit!6375 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!147564 () Bool)

(declare-fun e!98421 () Bool)

(declare-fun e!98418 () Bool)

(assert (=> b!147564 (= e!98421 e!98418)))

(declare-fun res!123476 () Bool)

(assert (=> b!147564 (=> (not res!123476) (not e!98418))))

(declare-fun lt!229646 () (_ BitVec 64))

(declare-datatypes ((Unit!9302 0))(
  ( (Unit!9303) )
))
(declare-datatypes ((tuple2!13124 0))(
  ( (tuple2!13125 (_1!6921 Unit!9302) (_2!6921 BitStream!5272)) )
))
(declare-fun lt!229650 () tuple2!13124)

(declare-fun lt!229661 () tuple2!13124)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!147564 (= res!123476 (= (bitIndex!0 (size!3007 (buf!3472 (_2!6921 lt!229661))) (currentByte!6380 (_2!6921 lt!229661)) (currentBit!6375 (_2!6921 lt!229661))) (bvadd (bitIndex!0 (size!3007 (buf!3472 (_2!6921 lt!229650))) (currentByte!6380 (_2!6921 lt!229650)) (currentBit!6375 (_2!6921 lt!229650))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!229646))))))

(assert (=> b!147564 (= lt!229646 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!147565 () Bool)

(declare-fun res!123480 () Bool)

(assert (=> b!147565 (=> (not res!123480) (not e!98418))))

(declare-fun isPrefixOf!0 (BitStream!5272 BitStream!5272) Bool)

(assert (=> b!147565 (= res!123480 (isPrefixOf!0 (_2!6921 lt!229650) (_2!6921 lt!229661)))))

(declare-fun b!147566 () Bool)

(declare-datatypes ((tuple2!13126 0))(
  ( (tuple2!13127 (_1!6922 BitStream!5272) (_2!6922 array!6647)) )
))
(declare-fun lt!229638 () tuple2!13126)

(declare-fun arr!237 () array!6647)

(declare-fun e!98424 () Bool)

(declare-fun arrayRangesEq!323 (array!6647 array!6647 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147566 (= e!98424 (not (arrayRangesEq!323 arr!237 (_2!6922 lt!229638) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!147567 () Bool)

(declare-fun res!123481 () Bool)

(assert (=> b!147567 (=> (not res!123481) (not e!98417))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147567 (= res!123481 (invariant!0 (currentBit!6375 thiss!1634) (currentByte!6380 thiss!1634) (size!3007 (buf!3472 thiss!1634))))))

(declare-fun b!147568 () Bool)

(declare-fun res!123477 () Bool)

(declare-fun e!98423 () Bool)

(assert (=> b!147568 (=> (not res!123477) (not e!98423))))

(assert (=> b!147568 (= res!123477 (isPrefixOf!0 thiss!1634 (_2!6921 lt!229650)))))

(declare-fun b!147569 () Bool)

(declare-fun e!98420 () Bool)

(declare-datatypes ((tuple2!13128 0))(
  ( (tuple2!13129 (_1!6923 BitStream!5272) (_2!6923 (_ BitVec 8))) )
))
(declare-fun lt!229639 () tuple2!13128)

(declare-fun lt!229660 () tuple2!13128)

(assert (=> b!147569 (= e!98420 (= (_2!6923 lt!229639) (_2!6923 lt!229660)))))

(declare-fun b!147570 () Bool)

(declare-fun res!123479 () Bool)

(assert (=> b!147570 (=> (not res!123479) (not e!98423))))

(assert (=> b!147570 (= res!123479 (= (bitIndex!0 (size!3007 (buf!3472 (_2!6921 lt!229650))) (currentByte!6380 (_2!6921 lt!229650)) (currentBit!6375 (_2!6921 lt!229650))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3007 (buf!3472 thiss!1634)) (currentByte!6380 thiss!1634) (currentBit!6375 thiss!1634)))))))

(declare-fun b!147571 () Bool)

(declare-fun res!123485 () Bool)

(assert (=> b!147571 (=> (not res!123485) (not e!98417))))

(assert (=> b!147571 (= res!123485 (bvslt from!447 to!404))))

(declare-fun b!147572 () Bool)

(declare-fun e!98416 () Bool)

(assert (=> b!147572 (= e!98416 (invariant!0 (currentBit!6375 thiss!1634) (currentByte!6380 thiss!1634) (size!3007 (buf!3472 (_2!6921 lt!229650)))))))

(declare-fun b!147573 () Bool)

(assert (=> b!147573 (= e!98417 (not true))))

(declare-fun lt!229657 () tuple2!13126)

(declare-fun lt!229651 () tuple2!13126)

(assert (=> b!147573 (arrayRangesEq!323 (_2!6922 lt!229657) (_2!6922 lt!229651) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!229641 () Unit!9302)

(declare-datatypes ((tuple2!13130 0))(
  ( (tuple2!13131 (_1!6924 BitStream!5272) (_2!6924 BitStream!5272)) )
))
(declare-fun lt!229658 () tuple2!13130)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5272 array!6647 (_ BitVec 32) (_ BitVec 32)) Unit!9302)

(assert (=> b!147573 (= lt!229641 (readByteArrayLoopArrayPrefixLemma!0 (_1!6924 lt!229658) arr!237 from!447 to!404))))

(declare-fun lt!229637 () array!6647)

(declare-fun readByteArrayLoopPure!0 (BitStream!5272 array!6647 (_ BitVec 32) (_ BitVec 32)) tuple2!13126)

(declare-fun withMovedByteIndex!0 (BitStream!5272 (_ BitVec 32)) BitStream!5272)

(assert (=> b!147573 (= lt!229651 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6924 lt!229658) #b00000000000000000000000000000001) lt!229637 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229649 () tuple2!13126)

(declare-fun lt!229640 () tuple2!13130)

(assert (=> b!147573 (= lt!229649 (readByteArrayLoopPure!0 (_1!6924 lt!229640) lt!229637 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229647 () tuple2!13128)

(assert (=> b!147573 (= lt!229637 (array!6648 (store (arr!3776 arr!237) from!447 (_2!6923 lt!229647)) (size!3007 arr!237)))))

(declare-fun lt!229659 () (_ BitVec 32))

(assert (=> b!147573 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3007 (buf!3472 (_2!6921 lt!229661)))) ((_ sign_extend 32) (currentByte!6380 (_2!6921 lt!229650))) ((_ sign_extend 32) (currentBit!6375 (_2!6921 lt!229650))) lt!229659)))

(declare-fun lt!229645 () Unit!9302)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5272 array!6647 (_ BitVec 32)) Unit!9302)

(assert (=> b!147573 (= lt!229645 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6921 lt!229650) (buf!3472 (_2!6921 lt!229661)) lt!229659))))

(assert (=> b!147573 (= (_1!6922 lt!229657) (_2!6924 lt!229658))))

(assert (=> b!147573 (= lt!229657 (readByteArrayLoopPure!0 (_1!6924 lt!229658) arr!237 from!447 to!404))))

(assert (=> b!147573 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3007 (buf!3472 (_2!6921 lt!229661)))) ((_ sign_extend 32) (currentByte!6380 thiss!1634)) ((_ sign_extend 32) (currentBit!6375 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!229644 () Unit!9302)

(assert (=> b!147573 (= lt!229644 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3472 (_2!6921 lt!229661)) (bvsub to!404 from!447)))))

(assert (=> b!147573 (= (_2!6923 lt!229647) (select (arr!3776 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5272) tuple2!13128)

(assert (=> b!147573 (= lt!229647 (readBytePure!0 (_1!6924 lt!229658)))))

(declare-fun reader!0 (BitStream!5272 BitStream!5272) tuple2!13130)

(assert (=> b!147573 (= lt!229640 (reader!0 (_2!6921 lt!229650) (_2!6921 lt!229661)))))

(assert (=> b!147573 (= lt!229658 (reader!0 thiss!1634 (_2!6921 lt!229661)))))

(assert (=> b!147573 e!98420))

(declare-fun res!123484 () Bool)

(assert (=> b!147573 (=> (not res!123484) (not e!98420))))

(assert (=> b!147573 (= res!123484 (= (bitIndex!0 (size!3007 (buf!3472 (_1!6923 lt!229639))) (currentByte!6380 (_1!6923 lt!229639)) (currentBit!6375 (_1!6923 lt!229639))) (bitIndex!0 (size!3007 (buf!3472 (_1!6923 lt!229660))) (currentByte!6380 (_1!6923 lt!229660)) (currentBit!6375 (_1!6923 lt!229660)))))))

(declare-fun lt!229643 () Unit!9302)

(declare-fun lt!229652 () BitStream!5272)

(declare-fun readBytePrefixLemma!0 (BitStream!5272 BitStream!5272) Unit!9302)

(assert (=> b!147573 (= lt!229643 (readBytePrefixLemma!0 lt!229652 (_2!6921 lt!229661)))))

(assert (=> b!147573 (= lt!229660 (readBytePure!0 (BitStream!5273 (buf!3472 (_2!6921 lt!229661)) (currentByte!6380 thiss!1634) (currentBit!6375 thiss!1634))))))

(assert (=> b!147573 (= lt!229639 (readBytePure!0 lt!229652))))

(assert (=> b!147573 (= lt!229652 (BitStream!5273 (buf!3472 (_2!6921 lt!229650)) (currentByte!6380 thiss!1634) (currentBit!6375 thiss!1634)))))

(assert (=> b!147573 e!98416))

(declare-fun res!123473 () Bool)

(assert (=> b!147573 (=> (not res!123473) (not e!98416))))

(assert (=> b!147573 (= res!123473 (isPrefixOf!0 thiss!1634 (_2!6921 lt!229661)))))

(declare-fun lt!229648 () Unit!9302)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5272 BitStream!5272 BitStream!5272) Unit!9302)

(assert (=> b!147573 (= lt!229648 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6921 lt!229650) (_2!6921 lt!229661)))))

(assert (=> b!147573 e!98421))

(declare-fun res!123474 () Bool)

(assert (=> b!147573 (=> (not res!123474) (not e!98421))))

(assert (=> b!147573 (= res!123474 (= (size!3007 (buf!3472 (_2!6921 lt!229650))) (size!3007 (buf!3472 (_2!6921 lt!229661)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5272 array!6647 (_ BitVec 32) (_ BitVec 32)) tuple2!13124)

(assert (=> b!147573 (= lt!229661 (appendByteArrayLoop!0 (_2!6921 lt!229650) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!147573 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3007 (buf!3472 (_2!6921 lt!229650)))) ((_ sign_extend 32) (currentByte!6380 (_2!6921 lt!229650))) ((_ sign_extend 32) (currentBit!6375 (_2!6921 lt!229650))) lt!229659)))

(assert (=> b!147573 (= lt!229659 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!229656 () Unit!9302)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5272 BitStream!5272 (_ BitVec 64) (_ BitVec 32)) Unit!9302)

(assert (=> b!147573 (= lt!229656 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6921 lt!229650) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!147573 e!98423))

(declare-fun res!123475 () Bool)

(assert (=> b!147573 (=> (not res!123475) (not e!98423))))

(assert (=> b!147573 (= res!123475 (= (size!3007 (buf!3472 thiss!1634)) (size!3007 (buf!3472 (_2!6921 lt!229650)))))))

(declare-fun appendByte!0 (BitStream!5272 (_ BitVec 8)) tuple2!13124)

(assert (=> b!147573 (= lt!229650 (appendByte!0 thiss!1634 (select (arr!3776 arr!237) from!447)))))

(declare-fun b!147574 () Bool)

(assert (=> b!147574 (= e!98418 (not e!98424))))

(declare-fun res!123483 () Bool)

(assert (=> b!147574 (=> res!123483 e!98424)))

(declare-fun lt!229642 () tuple2!13130)

(assert (=> b!147574 (= res!123483 (or (not (= (size!3007 (_2!6922 lt!229638)) (size!3007 arr!237))) (not (= (_1!6922 lt!229638) (_2!6924 lt!229642)))))))

(assert (=> b!147574 (= lt!229638 (readByteArrayLoopPure!0 (_1!6924 lt!229642) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147574 (validate_offset_bits!1 ((_ sign_extend 32) (size!3007 (buf!3472 (_2!6921 lt!229661)))) ((_ sign_extend 32) (currentByte!6380 (_2!6921 lt!229650))) ((_ sign_extend 32) (currentBit!6375 (_2!6921 lt!229650))) lt!229646)))

(declare-fun lt!229655 () Unit!9302)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5272 array!6647 (_ BitVec 64)) Unit!9302)

(assert (=> b!147574 (= lt!229655 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6921 lt!229650) (buf!3472 (_2!6921 lt!229661)) lt!229646))))

(assert (=> b!147574 (= lt!229642 (reader!0 (_2!6921 lt!229650) (_2!6921 lt!229661)))))

(declare-fun b!147575 () Bool)

(declare-fun lt!229654 () tuple2!13130)

(declare-fun lt!229653 () tuple2!13128)

(assert (=> b!147575 (= e!98423 (and (= (_2!6923 lt!229653) (select (arr!3776 arr!237) from!447)) (= (_1!6923 lt!229653) (_2!6924 lt!229654))))))

(assert (=> b!147575 (= lt!229653 (readBytePure!0 (_1!6924 lt!229654)))))

(assert (=> b!147575 (= lt!229654 (reader!0 thiss!1634 (_2!6921 lt!229650)))))

(declare-fun res!123478 () Bool)

(assert (=> start!28530 (=> (not res!123478) (not e!98417))))

(assert (=> start!28530 (= res!123478 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3007 arr!237))))))

(assert (=> start!28530 e!98417))

(assert (=> start!28530 true))

(declare-fun array_inv!2796 (array!6647) Bool)

(assert (=> start!28530 (array_inv!2796 arr!237)))

(declare-fun e!98419 () Bool)

(declare-fun inv!12 (BitStream!5272) Bool)

(assert (=> start!28530 (and (inv!12 thiss!1634) e!98419)))

(declare-fun b!147576 () Bool)

(assert (=> b!147576 (= e!98419 (array_inv!2796 (buf!3472 thiss!1634)))))

(assert (= (and start!28530 res!123478) b!147563))

(assert (= (and b!147563 res!123482) b!147571))

(assert (= (and b!147571 res!123485) b!147567))

(assert (= (and b!147567 res!123481) b!147573))

(assert (= (and b!147573 res!123475) b!147570))

(assert (= (and b!147570 res!123479) b!147568))

(assert (= (and b!147568 res!123477) b!147575))

(assert (= (and b!147573 res!123474) b!147564))

(assert (= (and b!147564 res!123476) b!147565))

(assert (= (and b!147565 res!123480) b!147574))

(assert (= (and b!147574 (not res!123483)) b!147566))

(assert (= (and b!147573 res!123473) b!147572))

(assert (= (and b!147573 res!123484) b!147569))

(assert (= start!28530 b!147576))

(declare-fun m!228477 () Bool)

(assert (=> b!147572 m!228477))

(declare-fun m!228479 () Bool)

(assert (=> b!147566 m!228479))

(declare-fun m!228481 () Bool)

(assert (=> b!147568 m!228481))

(declare-fun m!228483 () Bool)

(assert (=> b!147563 m!228483))

(declare-fun m!228485 () Bool)

(assert (=> start!28530 m!228485))

(declare-fun m!228487 () Bool)

(assert (=> start!28530 m!228487))

(declare-fun m!228489 () Bool)

(assert (=> b!147570 m!228489))

(declare-fun m!228491 () Bool)

(assert (=> b!147570 m!228491))

(declare-fun m!228493 () Bool)

(assert (=> b!147565 m!228493))

(declare-fun m!228495 () Bool)

(assert (=> b!147574 m!228495))

(declare-fun m!228497 () Bool)

(assert (=> b!147574 m!228497))

(declare-fun m!228499 () Bool)

(assert (=> b!147574 m!228499))

(declare-fun m!228501 () Bool)

(assert (=> b!147574 m!228501))

(declare-fun m!228503 () Bool)

(assert (=> b!147573 m!228503))

(declare-fun m!228505 () Bool)

(assert (=> b!147573 m!228505))

(declare-fun m!228507 () Bool)

(assert (=> b!147573 m!228507))

(declare-fun m!228509 () Bool)

(assert (=> b!147573 m!228509))

(declare-fun m!228511 () Bool)

(assert (=> b!147573 m!228511))

(declare-fun m!228513 () Bool)

(assert (=> b!147573 m!228513))

(assert (=> b!147573 m!228513))

(declare-fun m!228515 () Bool)

(assert (=> b!147573 m!228515))

(declare-fun m!228517 () Bool)

(assert (=> b!147573 m!228517))

(declare-fun m!228519 () Bool)

(assert (=> b!147573 m!228519))

(declare-fun m!228521 () Bool)

(assert (=> b!147573 m!228521))

(declare-fun m!228523 () Bool)

(assert (=> b!147573 m!228523))

(declare-fun m!228525 () Bool)

(assert (=> b!147573 m!228525))

(declare-fun m!228527 () Bool)

(assert (=> b!147573 m!228527))

(declare-fun m!228529 () Bool)

(assert (=> b!147573 m!228529))

(declare-fun m!228531 () Bool)

(assert (=> b!147573 m!228531))

(assert (=> b!147573 m!228529))

(assert (=> b!147573 m!228501))

(declare-fun m!228533 () Bool)

(assert (=> b!147573 m!228533))

(declare-fun m!228535 () Bool)

(assert (=> b!147573 m!228535))

(declare-fun m!228537 () Bool)

(assert (=> b!147573 m!228537))

(declare-fun m!228539 () Bool)

(assert (=> b!147573 m!228539))

(declare-fun m!228541 () Bool)

(assert (=> b!147573 m!228541))

(declare-fun m!228543 () Bool)

(assert (=> b!147573 m!228543))

(declare-fun m!228545 () Bool)

(assert (=> b!147573 m!228545))

(declare-fun m!228547 () Bool)

(assert (=> b!147573 m!228547))

(declare-fun m!228549 () Bool)

(assert (=> b!147573 m!228549))

(declare-fun m!228551 () Bool)

(assert (=> b!147573 m!228551))

(declare-fun m!228553 () Bool)

(assert (=> b!147576 m!228553))

(assert (=> b!147575 m!228529))

(declare-fun m!228555 () Bool)

(assert (=> b!147575 m!228555))

(declare-fun m!228557 () Bool)

(assert (=> b!147575 m!228557))

(declare-fun m!228559 () Bool)

(assert (=> b!147564 m!228559))

(assert (=> b!147564 m!228489))

(declare-fun m!228561 () Bool)

(assert (=> b!147567 m!228561))

(push 1)

(assert (not b!147565))

(assert (not b!147564))

(assert (not b!147570))

(assert (not b!147567))

(assert (not b!147566))

(assert (not b!147575))

(assert (not b!147574))

(assert (not b!147573))

(assert (not b!147572))

(assert (not b!147576))

(assert (not b!147563))

(assert (not b!147568))

(assert (not start!28530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

